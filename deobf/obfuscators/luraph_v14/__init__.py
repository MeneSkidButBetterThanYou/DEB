"""Version-specific local recovery for Luraph v14.7 and v14.8 wrappers.

The plugin keeps container extraction static, then optionally uses the vendored
payload-disabled capture/lifter on compatible two-stream v14.7 inputs. Unknown
layouts never fall through to the generic runtime tracer.
"""
import hashlib
import json
import os
import re
import shutil
import sys
import zipfile

from obfuscators.base import Obfuscator


HEADER = re.compile(
    r"This file was protected using Luraph Obfuscator v(14\.(?:7|8|9))(?:\D|$)"
)
MAX_DECODED_STREAM = 256 * 1024 * 1024


def _long_bracket_open(source, offset):
    """Return (body_start, closing_delimiter) for a Lua long bracket."""
    if offset >= len(source) or source[offset] != "[":
        return None
    cursor = offset + 1
    while cursor < len(source) and source[cursor] == "=":
        cursor += 1
    if cursor >= len(source) or source[cursor] != "[":
        return None
    equals = source[offset + 1:cursor]
    return cursor + 1, "]" + equals + "]"


def _quoted_lph_value(source, body_start, quote):
    """Read one quoted literal, retaining its value only when it starts LPH."""
    prefix = []
    payload = None
    cursor = body_start

    def append_value(char):
        nonlocal payload
        if payload is not None:
            payload.append(char)
            return
        if len(prefix) < 3:
            prefix.append(char)
            if len(prefix) == 3 and "".join(prefix) == "LPH":
                payload = prefix[:]

    while cursor < len(source):
        char = source[cursor]
        if char == quote:
            return cursor + 1, "".join(payload) if payload is not None else None
        if char in "\r\n":
            # An unescaped newline is not valid inside a short Lua string.
            return cursor + 1, None
        if char != "\\":
            append_value(char)
            cursor += 1
            continue

        cursor += 1
        if cursor >= len(source):
            return cursor, None
        escaped = source[cursor]
        if escaped.isdigit():
            end = cursor + 1
            while end < min(cursor + 3, len(source)) and source[end].isdigit():
                end += 1
            value = int(source[cursor:end], 10)
            append_value(chr(value) if value <= 255 else "\ufffd")
            cursor = end
        elif escaped == "x" and cursor + 2 < len(source):
            pair = source[cursor + 1:cursor + 3]
            if re.fullmatch(r"[0-9A-Fa-f]{2}", pair):
                append_value(chr(int(pair, 16)))
                cursor += 3
            else:
                append_value(escaped)
                cursor += 1
        elif escaped == "z":
            cursor += 1
            while cursor < len(source) and source[cursor].isspace():
                cursor += 1
        elif escaped in "\r\n":
            if escaped == "\r" and cursor + 1 < len(source) and source[cursor + 1] == "\n":
                cursor += 1
            append_value("\n")
            cursor += 1
        else:
            translations = {
                "a": "\a", "b": "\b", "f": "\f", "n": "\n",
                "r": "\r", "t": "\t", "v": "\v",
            }
            append_value(translations.get(escaped, escaped))
            cursor += 1
    return cursor, None


def find_lph_literals(source):
    """Find LPH-prefixed Lua string values while skipping Lua comments."""
    found = []
    cursor = 0
    size = len(source)

    while cursor < size:
        if source.startswith("--", cursor):
            long_comment = _long_bracket_open(source, cursor + 2)
            if long_comment:
                body_start, closing = long_comment
                end = source.find(closing, body_start)
                cursor = size if end < 0 else end + len(closing)
            else:
                end = source.find("\n", cursor + 2)
                cursor = size if end < 0 else end + 1
            continue

        if source[cursor] == "[":
            long_string = _long_bracket_open(source, cursor)
            if long_string:
                body_start, closing = long_string
                end = source.find(closing, body_start)
                if end < 0:
                    break
                value_start = body_start
                if source.startswith("\r\n", value_start):
                    value_start += 2
                elif source.startswith(("\n", "\r"), value_start):
                    value_start += 1
                if source.startswith("LPH", value_start):
                    found.append((cursor, source[value_start:end]))
                cursor = end + len(closing)
                continue

        if source[cursor] in ("\"", "'"):
            quote = source[cursor]
            end, value = _quoted_lph_value(source, cursor + 1, quote)
            if value is not None:
                found.append((cursor, value))
            cursor = max(end, cursor + 1)
            continue

        cursor += 1

    return found


def decode_lph_ascii85(payload, max_output=MAX_DECODED_STREAM):
    """Decode one legacy LPH Ascii85 stream with a strict output bound."""
    if not payload.startswith("LPH") or len(payload) < 9:
        raise ValueError("missing LPH stream header")

    # The historical LPH envelope expands `z` to a zero-valued Ascii85 group.
    # Stream the expansion so a large input cannot create a second huge copy.
    output = bytearray()
    group = []

    def emit_group(chars):
        value = 0
        for char in chars:
            code = ord(char)
            if not 33 <= code <= 117:
                raise ValueError("invalid Ascii85 character")
            value = value * 85 + code - 33
        output.extend((value & 0xFFFFFFFF).to_bytes(4, "little"))
        if len(output) > max_output:
            raise ValueError("decoded stream exceeds the 256 MiB safety limit")

    for char in payload[4:]:
        expanded = "!!!!!" if char == "z" else char
        for item in expanded:
            code = ord(item)
            if not 33 <= code <= 117:
                raise ValueError("invalid Ascii85 character")
            group.append(item)
            if len(group) == 5:
                emit_group(group)
                group.clear()

    # Luraph's loader ignores incomplete trailing groups.
    return bytes(output)


def _sha256(data):
    return hashlib.sha256(data).hexdigest()


def _find_lune_runtime():
    """Find Lune for the isolated v14 parser/lifter, if the user has it installed."""
    candidates = []
    configured = os.environ.get("LUNE_EXE")
    if configured:
        candidates.append(configured)
    found = shutil.which("lune")

    # Rokit installs tools per version outside PATH on many Windows setups.
    tool_root = os.path.join(
        os.path.expanduser("~"), ".rokit", "tool-storage", "lune-org", "lune"
    )
    try:
        versions = sorted(os.listdir(tool_root), reverse=True)
    except OSError:
        versions = []
    candidates.extend(
        os.path.join(tool_root, version, "lune.exe") for version in versions
    )

    # Prefer real binaries over Rokit PATH shims, which require a manifest.
    if found:
        candidates.append(found)

    for candidate in candidates:
        if os.path.isfile(candidate):
            return os.path.abspath(candidate)
    return None


class LuraphV14(Obfuscator):
    name = "luraph_v14"
    label = "Luraph v14.7/v14.8/v14.9 (static VM recovery; partial)"
    doc = "LURAPH.md"

    def add_arguments(self, parser):
        group = parser.add_argument_group("Luraph v14")
        group.add_argument(
            "--v14-no-lift",
            action="store_true",
            help="keep v14.7 analysis to static unpacking; do not run the isolated Lune parser",
        )

    def detect(self, source):
        match = HEADER.search(source[:500])
        if not match:
            self.label = "Luraph v14.7/v14.8/v14.9 (static VM recovery; partial)"
            return 0.0
        self.version = match.group(1)
        self.label = "Luraph %s (static VM recovery; partial)" % self.version
        return 1.0

    @staticmethod
    def _write_json(path, value):
        with open(path, "w", encoding="utf-8", newline="\n") as stream:
            json.dump(value, stream, indent=2, sort_keys=True)
            stream.write("\n")

    @staticmethod
    def _zip_roots(archive_path, roots):
        """Bundle only files produced by this analysis, with stable relative names."""
        seen = set()
        with zipfile.ZipFile(archive_path, "w", zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
            for root in roots:
                if not os.path.exists(root):
                    continue
                root = os.path.abspath(root)
                if os.path.isfile(root):
                    files = [(root, os.path.basename(root))]
                else:
                    files = []
                    for directory, _subdirs, names in os.walk(root):
                        for name in names:
                            path = os.path.join(directory, name)
                            relative = os.path.relpath(path, os.path.dirname(root))
                            files.append((path, relative))
                for path, arcname in files:
                    if path in seen:
                        continue
                    seen.add(path)
                    archive.write(path, arcname.replace("\\", "/"))

    @staticmethod
    def _write_progress(message):
        import sys
        print("[Luraph v14] " + str(message), file=sys.stderr, flush=True)

    def _decode_static_streams(self, job, source, static_dir, loader, report):
        os.makedirs(static_dir, exist_ok=True)
        streams = find_lph_literals(source)
        report["lph_literals_found"] = len(streams)
        decoded = []
        for index, (offset, payload) in enumerate(streams, 1):
            data = None
            decoder = None
            errors = []
            for name, decode in (
                ("legacy-lph-ascii85", decode_lph_ascii85),
                ("luauvmp-base85", lambda value: loader.decode_base85(value, drop=5)),
            ):
                try:
                    expanded_chars = len(payload) - 4 + 4 * payload.count("z")
                    if expanded_chars > 0 and (expanded_chars // 5 + 1) * 4 > MAX_DECODED_STREAM:
                        raise ValueError("decoded stream exceeds the 256 MiB safety limit")
                    candidate = decode(payload)
                    if len(candidate) > MAX_DECODED_STREAM:
                        raise ValueError("decoded stream exceeds the 256 MiB safety limit")
                    data = candidate
                    decoder = name
                    break
                except Exception as exc:  # retain the error and try the other envelope flavor
                    errors.append("%s: %s" % (name, _one_line(exc)))
            if data is None:
                report.setdefault("errors", []).append(
                    "stream %d at offset %d could not be decoded (%s)" %
                    (index, offset, "; ".join(errors))
                )
                continue
            artifact_name = "stream-%02d.bin" % index
            path = os.path.join(static_dir, artifact_name)
            with open(path, "wb") as stream:
                stream.write(data)
            decoded.append({
                "index": index,
                "source_offset": offset,
                "encoded_characters": len(payload),
                "decoded_bytes": len(data),
                "sha256": _sha256(data),
                "artifact": artifact_name,
                "decoder": decoder,
                "kind": "decoded LPH stream; VM not devirtualized",
            })
        report["static_streams"] = decoded
        return streams, decoded

    def deobfuscate(self, job):
        version_match = HEADER.search(job.source[:500])
        if not version_match:
            raise ValueError("Luraph v14.7/v14.8/v14.9 header not found")
        version = version_match.group(1)
        from luauvmp import luraph_loader as loader

        original = job.source.encode("latin-1", "replace")
        report = {
            "family": "Luraph",
            "version": version,
            "status": "recognized; static analysis not completed",
            "input_name": os.path.basename(job.input),
            "input_bytes": len(original),
            "input_sha256": _sha256(original),
            "loader_layout": loader.diagnose(job.source),
            "protected_payload_executed": False,
            "source_equivalence_verified": False,
            "remote_service_used": False,
            "bootstrap_executed": False,
            "static_streams": [],
            "static_sections": [],
            "errors": [],
        }

        static_dir = job.path(".v14-static")
        archive_path = job.path(".v14-artifacts.zip")
        roots = [static_dir]
        os.makedirs(static_dir, exist_ok=True)

        # One v14.7 family uses a length-framed three-section container.
        # Two-stream legacy wrappers are handled below by the shared static
        # loader; do not report the other family's non-matching framing as an
        # error when that fallback succeeds.
        layout = report["loader_layout"].get("layout")
        if version == "14.7" and layout not in {"two-stream-legacy", "single-stream-embedded"}:
            try:
                from .static_v147 import decode_v147_wrapper
                sections, metadata = decode_v147_wrapper(job.source)
                for index, section in enumerate(sections, 1):
                    artifact_name = "section-%02d.bin" % index
                    with open(os.path.join(static_dir, artifact_name), "wb") as stream:
                        stream.write(section)
                    metadata["sections"][index - 1]["artifact"] = artifact_name
                report["static_sections"] = metadata["sections"]
                report["static_unpack"] = {
                    "layout": metadata["layout"],
                    "tag": metadata["tag"],
                    "alphabet_characters": metadata["alphabet_characters"],
                    "declared_section_characters": metadata["declared_section_characters"],
                    "decoded_total_bytes": sum(len(section) for section in sections),
                    "protected_payload_executed": False,
                }
                try:
                    from .static_v147_proto import summarize_section
                    from .environment import summarize_environment_usage
                    all_constants = []
                    # This wrapper family changed only the per-record opcode
                    # tag schedule; operand flags still use the older schedule.
                    compact_source = re.sub(r"\s+", "", job.source)
                    tag_schedule = ((4553, 155, 25214, 131071)
                                    if re.search(r"\(\(\([A-Za-z_]\w*\+4553\)\*155\)\+25214\)%131071", compact_source)
                                    else None)
                    for index, section in enumerate(sections, 1):
                        parsed = summarize_section(section, tag_schedule=tag_schedule)
                        all_constants.extend(parsed["constants"])
                        parse_errors = sum(
                            1 for item in parsed["constants"] if item.get("error")
                        )
                        instruction_path = os.path.join(
                            static_dir, "section-%02d.instructions.json" % index
                        )
                        # Keep the bytecode records for continued static lifting,
                        # but do not duplicate arbitrary decoded string values in
                        # the sidecar report (which can include private URLs).
                        instruction_dump = {
                            "schema": "sample-specific Luraph v14.7 instruction records",
                            "opcode_tag_schedule": tag_schedule or (11445, 779, 22743, 65535),
                            "protected_payload_executed": False,
                            "source_equivalence_verified": False,
                            "instruction_count": parsed["instruction_count"],
                            "instructions": parsed["instructions"],
                            "constant_count": parsed["constant_count"],
                            "constant_record_count": parsed["constant_record_count"],
                            "constant_decode_errors": parse_errors,
                            "constant_key_context_mode": parsed[
                                "constant_key_context_mode"
                            ],
                        }
                        self._write_json(instruction_path, _json_safe(instruction_dump))
                        metadata["sections"][index - 1].update({
                            "instruction_count": parsed["instruction_count"],
                            "constant_count": parsed["constant_count"],
                            "constant_record_count": parsed["constant_record_count"],
                            "constant_decode_errors": parse_errors,
                            "constant_key_context_mode": parsed[
                                "constant_key_context_mode"
                            ],
                            "instruction_artifact": os.path.basename(instruction_path),
                        })
                    report["static_sections"] = metadata["sections"]
                    report["environment_model"] = summarize_environment_usage(
                        all_constants
                    )
                    report["status"] = (
                        "v14.7 sections, instruction records, and constants parsed "
                        "statically; source lifting remains incomplete"
                    )
                except Exception as exc:
                    report["errors"].append(
                        "v14.7 static prototype parsing: " + _one_line(exc)
                    )
                    report["status"] = (
                        "v14.7 three-section wrapper decoded statically; "
                        "instruction parsing did not complete"
                    )
            except Exception as exc:
                report["errors"].append("v14.7 static section decode: " + _one_line(exc))

        # Keep other supported envelope readers static as well. Their output is
        # retained as VM/interpreter data; no closure factory or bootstrap runs.
        if not report.get("static_unpack") and loader.detect(job.source):
            try:
                vm_source, bytecode = loader.unpack(job.source)
                with open(os.path.join(static_dir, "interpreter.vm.luau"), "wb") as stream:
                    stream.write(vm_source)
                with open(os.path.join(static_dir, "bytecode.bin"), "wb") as stream:
                    stream.write(bytecode)
                report["static_unpack"] = {
                    "interpreter_bytes": len(vm_source),
                    "interpreter_sha256": _sha256(vm_source),
                    "bytecode_bytes": len(bytecode),
                    "bytecode_sha256": _sha256(bytecode),
                    "protected_payload_executed": False,
                }
                report["status"] = (
                    "static VM loader unpack completed; bytecode was not lifted to source"
                )
            except Exception as exc:
                report["errors"].append("static loader unpack: " + _one_line(exc))

        # For compatible two-stream v14.7 loaders, reuse the repository's
        # isolated parser/lifter. It runs the extracted interpreter only far
        # enough to construct prototype records; its payload-closure call is
        # replaced by a capture hook. If Lune is unavailable or a sample uses
        # a different VM shape, retain the static artifacts and explain the
        # stopping point instead of treating partial output as source.
        full_source = None
        if (layout in {"two-stream-legacy", "single-stream-embedded"}
                and report.get("static_unpack")
                and not getattr(job.args, "v14_no_lift", False)):
            runtime = _find_lune_runtime()
            if runtime is None:
                report["source_lift"] = {
                    "status": "not_attempted",
                    "reason": "Lune runtime not found; only outer unpacking was performed",
                    "payload_executed": False,
                    "source_equivalence_verified": False,
                }
            else:
                full_dir = job.path(".v14-full")
                try:
                    from luauvmp.luraph_auto import run_full_loader

                    pipeline = run_full_loader(
                        job.input,
                        full_dir,
                        runtime=runtime,
                        timeout=max(1, job.args.timeout),
                        keep_failed=False,
                        progress=self._write_progress,
                    )
                    candidate_source = os.path.join(
                        full_dir, pipeline["decompiler"]["file"]
                    )
                    with open(candidate_source, "rb") as source_file:
                        source_bytes = source_file.read()
                    report["source_lift"] = {
                        "status": "sample-local lift produced; syntax checked",
                        "file": os.path.basename(candidate_source),
                        "prototypes": pipeline.get("prototypes"),
                        "instructions": pipeline.get("instructions"),
                        "opcode_slots": pipeline.get("opcode_slots"),
                        "elapsed_seconds": pipeline.get("elapsed_seconds"),
                        "compile_checked": pipeline["decompiler"].get("compile_checked", False),
                        "finalization_error": pipeline.get("finalization_error"),
                        "decompiler_metrics": pipeline["decompiler"],
                        "output_bytes": len(source_bytes),
                        "output_sha256": _sha256(source_bytes),
                        "payload_executed": False,
                        "source_equivalence_verified": False,
                    }
                    roots.append(full_dir)
                    job.register_artifact(
                        candidate_source,
                        os.path.splitext(os.path.basename(job.input))[0]
                        + ".v14-decompiled.luau",
                    )
                    full_source = candidate_source
                    report["status"] = (
                        "v14 sample-local decompilation produced and syntax checked; "
                        "source equivalence remains unverified"
                    )
                    if pipeline.get("finalization_error"):
                        report["status"] = "partial bootstrap lift; application finalization failed"
                        report["source_lift"]["status"] = report["status"]
                        print("[!] " + report["status"] + ": " +
                              pipeline["finalization_error"], file=sys.stderr)
                except Exception as exc:
                    full_source = None
                    report["source_lift"] = {
                        "status": "incomplete",
                        "reason": _one_line(exc),
                        "payload_executed": False,
                        "source_equivalence_verified": False,
                    }
                    report["errors"].append(
                        "v14 sample-local lift: " + _one_line(exc)
                    )
                    report["status"] = (
                        "static v14 VM unpack completed; sample-local source lifting "
                        "did not complete"
                    )
        elif (layout in {"two-stream-legacy", "single-stream-embedded"}
              and report.get("static_unpack")):
            report["source_lift"] = {
                "status": "disabled_by_option",
                "reason": "--v14-no-lift was selected; only outer unpacking was performed",
                "payload_executed": False,
                "source_equivalence_verified": False,
            }

        streams, decoded = self._decode_static_streams(job, job.source, static_dir, loader, report)
        if decoded:
            if not report.get("static_unpack"):
                report["status"] = (
                    "LPH Base85 stream decoded statically; compressed VM schema and source "
                    "remain unsupported"
                )
        if not report.get("static_unpack") and not report.get("static_sections") and not decoded:
            report["status"] = "v14 wrapper recognized; this encoded payload layout is unsupported"
            report["errors"].append(
                "The static decoder did not recognize this version-specific container. "
                "No Lune/runtime fallback was attempted."
            )

        report_path = job.path(".v14-report.json")
        self._write_json(report_path, report)
        roots.append(report_path)
        self._zip_roots(archive_path, roots)
        stem = os.path.splitext(os.path.basename(job.input))[0]
        job.register_artifact(report_path, stem + ".v14-report.json")
        job.register_artifact(archive_path, stem + ".v14-artifacts.zip")

        if full_source:
            status_line = (
                "Sample-local Luau was decompiled and syntax checked; "
                "source equivalence remains unverified."
            )
        else:
            status_line = "This is an intermediate static decode; application source was not recovered."

        lines = [
            "-- Deobfuscator v14.7/v14.8/v14.9 static recovery report.",
            "-- Luraph version: %s." % version,
            "-- %s" % status_line,
            "-- Protected application payload execution: false.",
            "-- Source equivalence verified: false.",
            "-- See the matching .v14-report.json and .v14-artifacts.zip sidecars.",
            "",
        ]
        for section in report.get("static_sections", []):
            lines.append("-- %s: %d bytes, SHA-256 %s." % (
                section["artifact"], section["decoded_bytes"], section["sha256"]
            ))
            if "instruction_count" in section:
                lines.append(
                    "--   Parsed %d instruction records and %d constants; key context is estimated." %
                    (section["instruction_count"], section["constant_count"])
                )
        environment = report.get("environment_model")
        if environment:
            lines.append(
                "-- Shared v15 environment vocabulary matched %d symbols; "
                "%d URL constants detected, no network calls performed." %
                (environment["recognized_symbol_count"],
                 environment["http_url_constant_count"])
            )
        for stream in decoded:
            lines.append("-- %s: %d bytes, SHA-256 %s." % (
                stream["artifact"], stream["decoded_bytes"], stream["sha256"]
            ))
        if report.get("source_lift"):
            lines.append("-- v14 lift: %s." % report["source_lift"]["status"])
            reason = report["source_lift"].get("reason")
            if reason:
                lines.append("-- Lift note: %s." % _one_line(reason))
        for error in report["errors"]:
            lines.append("-- Analysis note: %s." % _one_line(error))
        lines.append("")
        job.write(job.trace_path, "\n".join(lines))
        metrics = report.get("source_lift", {}).get("decompiler_metrics", {})
        if not full_source or metrics.get("fallback_instructions", 0) or metrics.get("unresolved_dispatcher_conditionals", 0):
            print("[!] partial source recovery: %s; %d fallback instructions, %d unresolved conditionals" %
                  (report["status"], metrics.get("fallback_instructions", 0),
                   metrics.get("unresolved_dispatcher_conditionals", 0)), file=sys.stderr)
        return full_source or job.trace_path


def _one_line(value, limit=500):
    text = " ".join(str(value).split())
    return text if len(text) <= limit else text[:limit - 3] + "..."


def _json_safe(value):
    """Normalize parser records with integer keys/raw byte slices for JSON."""
    if isinstance(value, bytes):
        return {"raw_bytes_hex": value.hex(), "length": len(value)}
    if isinstance(value, dict):
        return {str(key): _json_safe(item) for key, item in value.items()}
    if isinstance(value, (list, tuple)):
        return [_json_safe(item) for item in value]
    if value is None or isinstance(value, (str, int, float, bool)):
        return value
    return repr(value)
