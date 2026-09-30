"""Static decoder for the tagged, length-framed v14.7 wrapper family.

This module only parses Luau syntax and decodes bytes described by constants
and small decoder routines in the wrapper. It never evaluates input code.
"""

import hashlib
import re


MAX_SOURCE_BYTES = 50 * 1024 * 1024
MAX_DECODED_BYTES = 256 * 1024 * 1024
LENGTH_HEADER = re.compile(r"^(\d+)\|(\d+)\|(\d+)\|")


def _walk(node):
    if isinstance(node, dict):
        yield node
        for value in node.values():
            yield from _walk(value)
    elif isinstance(node, list):
        for value in node:
            yield from _walk(value)


def _constants(ast):
    return [
        node.get("value", "")
        for node in _walk(ast)
        if node.get("type") == "AstExprConstantString"
        and isinstance(node.get("value"), str)
    ]


def _container_candidates(strings):
    candidates = []
    for value in strings:
        if len(value) < 32:
            continue
        match = LENGTH_HEADER.match(value)
        if not match:
            continue
        sizes = tuple(int(match.group(i)) for i in range(1, 4))
        data_start = match.end()
        if sum(sizes) == len(value) - data_start:
            candidates.append((value, sizes, data_start))
    return candidates


def _alphabet_candidates(strings):
    return sorted({
        value for value in strings
        if len(value) == 91
        and len(set(value)) == len(value)
        and all(32 <= ord(char) <= 126 for char in value)
    }, key=len)


def _custom85_decode(text, alphabet):
    """Translate the sample's two-character 13/14-bit alphabet decoder."""
    lookup = {ord(char): index for index, char in enumerate(alphabet)}
    output = bytearray()
    accumulator = 0
    bit_count = 0
    pending = -1
    for char in text:
        value = lookup.get(ord(char))
        if value is None:
            continue
        if pending < 0:
            pending = value
            continue
        pair = pending + value * 91
        added_bits = 13 if pair % 8192 > 88 else 14
        accumulator += pair << bit_count
        bit_count += added_bits
        while bit_count >= 8:
            output.append(accumulator & 0xFF)
            accumulator >>= 8
            bit_count -= 8
        pending = -1
    if pending >= 0:
        output.append((accumulator + (pending << bit_count)) & 0xFF)
    return bytes(output)


def _read_varint(data, offset):
    value = 0
    multiplier = 1
    shift = 0
    while True:
        if offset >= len(data):
            raise ValueError("truncated varint")
        byte = data[offset]
        offset += 1
        value += (byte % 128) * multiplier
        if byte < 128:
            return value, offset
        multiplier *= 128
        shift += 7
        if shift > 56:
            raise ValueError("varint exceeds the wrapper's 64-bit limit")


def _decompress_lz(data, expected_size):
    if expected_size < 0 or expected_size > MAX_DECODED_BYTES:
        raise ValueError("declared expanded block exceeds the 256 MiB limit")
    output = bytearray()
    offset = 0
    while offset < len(data):
        token = data[offset]
        offset += 1
        if token < 128:
            count = token + 1
            end = offset + count
            if end > len(data):
                raise ValueError("literal block extends past the compressed data")
            output.extend(data[offset:end])
            offset = end
        else:
            count = (token - 128) + 3
            back, offset = _read_varint(data, offset)
            distance = back + 1
            if distance <= 0 or distance > len(output):
                raise ValueError("back-reference points outside decoded output")
            source = len(output) - distance
            for _ in range(count):
                if source >= len(output):
                    raise ValueError("invalid overlapping back-reference")
                output.append(output[source])
                source += 1
        if len(output) > expected_size:
            raise ValueError("decoded block exceeds its declared size")
    if len(output) != expected_size:
        raise ValueError(
            "decoded block size mismatch: expected %d, got %d"
            % (expected_size, len(output))
        )
    return bytes(output)


def _decode_tagged_block(encoded, alphabet, magic, max_size):
    data = _custom85_decode(encoded, alphabet)
    magic_bytes = magic.encode("latin-1")
    if not data.startswith(magic_bytes):
        raise ValueError("decoded block does not have its wrapper tag")
    payload_size, cursor = _read_varint(data, len(magic_bytes))
    if payload_size > max_size:
        raise ValueError("block exceeds the configured output limit")
    payload_start = cursor
    payload_end = cursor + payload_size
    if payload_end > len(data):
        raise ValueError("tagged block length exceeds the encoded data")
    expanded_size, cursor = _read_varint(data, payload_end)
    if expanded_size > max_size:
        raise ValueError("block exceeds the configured output limit")
    if cursor != len(data):
        raise ValueError("tagged block length or trailing data is invalid")
    return _decompress_lz(data[payload_start:payload_end], expanded_size)


def decode_v147_wrapper(source, max_decoded_bytes=MAX_DECODED_BYTES):
    """Return three statically decoded v14.7 sections and safe metadata."""
    if not isinstance(max_decoded_bytes, int) or max_decoded_bytes <= 0:
        raise ValueError("decoded output limit must be a positive integer")
    max_decoded_bytes = min(max_decoded_bytes, MAX_DECODED_BYTES)
    raw = source.encode("latin-1", "replace")
    if len(raw) > MAX_SOURCE_BYTES:
        raise ValueError("input exceeds the 50 MiB analysis limit")

    # Import the bundled syntax parser only when this layout is selected.
    import luauast

    ast = luauast.parse(source)
    strings = _constants(ast)
    containers = _container_candidates(strings)
    if len(containers) != 1:
        raise ValueError(
            "expected one length-framed three-section string; found %d"
            % len(containers)
        )
    container, sizes, cursor = containers[0]
    encoded_sections = []
    for size in sizes:
        encoded_sections.append(container[cursor:cursor + size])
        cursor += size

    alphabets = _alphabet_candidates(strings)
    if not alphabets:
        raise ValueError("could not identify the wrapper's 91-symbol alphabet")

    # The plaintext tag is also embedded as a decoder constant. Accept only a
    # candidate whose decoded bytes identify one of those constants and whose
    # three framed sections all pass strict length and back-reference checks.
    tags = sorted({
        value for value in strings
        if 12 <= len(value) <= 64 and value.isascii()
    }, key=len, reverse=True)
    failures = []
    for alphabet in alphabets:
        decoded_containers = [_custom85_decode(part, alphabet) for part in encoded_sections]
        tags_for_alphabet = [
            tag for tag in tags
            if all(block.startswith(tag.encode("ascii")) for block in decoded_containers)
        ]
        for tag in tags_for_alphabet:
            try:
                sections = []
                total_decoded = 0
                for part in encoded_sections:
                    remaining = max_decoded_bytes - total_decoded
                    if remaining <= 0:
                        raise ValueError(
                            "decoded sections exceed the total output limit"
                        )
                    section = _decode_tagged_block(part, alphabet, tag, remaining)
                    total_decoded += len(section)
                    sections.append(section)
                return sections, {
                    "layout": "v14.7 tagged three-section wrapper",
                    "tag": tag,
                    "alphabet_characters": len(alphabet),
                    "declared_section_characters": list(sizes),
                    "sections": [
                        {
                            "index": index,
                            "encoded_characters": len(encoded),
                            "decoded_bytes": len(section),
                            "sha256": hashlib.sha256(section).hexdigest(),
                        }
                        for index, (encoded, section) in enumerate(
                            zip(encoded_sections, sections), 1
                        )
                    ],
                    "decoded_total_bytes": total_decoded,
                    "protected_payload_executed": False,
                    "source_equivalence_verified": False,
                }
            except ValueError as exc:
                failures.append(str(exc))
    detail = failures[0] if failures else "no embedded tag matched all three blocks"
    raise ValueError("could not decode the v14.7 tagged sections: " + detail)
