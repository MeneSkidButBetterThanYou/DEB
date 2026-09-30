"""Static view of the shared fake Roblox environment used by the v15 harness.

The v14 analyzer may reuse the harness's global/API vocabulary while it lifts
version-specific bytecode. This module reads metadata only: it never loads
``envlog.luau`` into Luau and never evaluates recovered code.
"""

import hashlib
import os
import re


EXECUTOR_APIS = {
    "checkcaller", "cloneref", "fireclickdetector", "fireproximityprompt",
    "firetouchinterest", "getcallingscript", "getexecutorname", "getgc",
    "getgenv", "gethwid", "getinstances", "getloadedmodules", "getnilinstances",
    "getreg", "getrunningscripts", "getscripts", "getsenv", "getscriptclosure",
    "getupvalue", "getinfo", "getrawmetatable", "hookfunction", "hookmetamethod",
    "identifyexecutor", "http_request", "isfile", "isfolder", "iscclosure",
    "islclosure", "loadstring", "makefolder", "readfile", "request", "writefile",
}

NETWORK_APIS = {"request", "http_request", "HttpGet", "HttpGetAsync", "HttpPost",
                "HttpPostAsync"}


def _shared_runtime_root():
    return os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def _read(path, cap=4 * 1024 * 1024):
    with open(path, "rb") as stream:
        data = stream.read(cap + 1)
    if len(data) > cap:
        raise ValueError("shared environment metadata exceeds the 4 MiB read bound")
    return data


def load_environment_vocabulary(root=None):
    """Read only the shared runtime's explicit global and API name tables."""
    root = root or _shared_runtime_root()
    env_path = os.path.join(root, "envlog.luau")
    api_path = os.path.join(root, "roblox_api.luau")
    env_data = _read(env_path)
    api_data = _read(api_path)
    env_source = env_data.decode("utf-8", "replace")
    api_source = api_data.decode("ascii", "replace")

    globals_found = set(re.findall(r"\bE\.([A-Za-z_]\w*)\s*=", env_source))
    globals_found.update(re.findall(r'\bE\["([A-Za-z_]\w*)"\]\s*=', env_source))
    globals_found.update(re.findall(r'\bglobalP\("([A-Za-z_]\w*)"\)', env_source))

    # gen_roblox.py stores API facts in one flattened, data-only Lua string:
    # Class<Superclass|methods|events|properties;...>. Parse names only.
    match = re.search(r'\bclasses\s*=\s*"([^"]*)"', api_source)
    if not match:
        raise ValueError("shared Roblox API class table was not found")
    class_names = set()
    members = set()
    for record in match.group(1).split(";"):
        name, separator, rest = record.partition("<")
        if not separator or not name:
            continue
        class_names.add(name)
        groups = rest.split("|")
        for group in groups[1:4]:
            for field in group.split(","):
                member = field.split(":", 1)[0]
                if member:
                    members.add(member)

    return {
        "global_names": globals_found,
        "class_names": class_names,
        "api_members": members,
        "source_hashes": {
            "envlog.luau": hashlib.sha256(env_data).hexdigest(),
            "roblox_api.luau": hashlib.sha256(api_data).hexdigest(),
        },
    }


def summarize_environment_usage(constants, root=None):
    """Classify decoded string constants against the shared v15 environment.

    Only recognized symbol names and counts are returned; arbitrary constant
    values (including URLs or other credentials) are never copied to the report.
    """
    vocabulary = load_environment_vocabulary(root)
    found = {"executor_apis": set(), "environment_globals": set(),
             "roblox_classes": set(), "roblox_api_members": set()}
    remote_url_count = 0
    for item in constants:
        if item.get("type") != "string":
            continue
        value = item.get("value")
        if not isinstance(value, str):
            continue
        if re.match(r"^https?://", value, re.I):
            remote_url_count += 1
        if value in EXECUTOR_APIS:
            found["executor_apis"].add(value)
        elif value in vocabulary["global_names"]:
            found["environment_globals"].add(value)
        elif value in vocabulary["class_names"]:
            found["roblox_classes"].add(value)
        elif value in vocabulary["api_members"]:
            found["roblox_api_members"].add(value)

    return {
        "model": "shared fake Roblox/executor environment used by the v15 harness",
        "metadata_only": True,
        "protected_code_executed": False,
        "runtime_shim_invoked": False,
        "source_hashes": vocabulary["source_hashes"],
        "recognized_symbols": {
            key: sorted(values) for key, values in found.items()
        },
        "recognized_symbol_count": sum(len(values) for values in found.values()),
        "http_url_constant_count": remote_url_count,
        "network_calls_performed": False,
        "note": (
            "The Roblox/executor name model is shared; v14 wrapper decoding, "
            "constant key context, and opcode semantics remain version-specific."
        ),
    }
