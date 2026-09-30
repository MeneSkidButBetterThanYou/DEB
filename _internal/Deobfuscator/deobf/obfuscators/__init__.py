"""
Obfuscator registry and detection.

To add an obfuscator: write a plugin (a module or package in this folder
with an `Obfuscator` subclass, see base.py and generic.py), then add an
instance to PLUGINS below. deob.py picks the plugin whose detect() is most
confident; `--obfuscator NAME` forces one.
"""
from obfuscators.base import Obfuscator, Job  # noqa: F401
from obfuscators.luraph_v14 import LuraphV14
from obfuscators.luraph_v15 import LuraphV15
from obfuscators.generic import Generic

# The Windows bundle may omit the optional ``http.server`` stdlib module.
# IronBrew imports the shared harness at module load time, so importing every
# plugin here would prevent unrelated static plugins (including Luraph v14)
# from starting at all. Keep IronBrew available whenever its dependency exists.
try:
    from obfuscators.ironbrew1 import Ironbrew1
except ModuleNotFoundError as exc:
    if exc.name not in {"http", "http.server"}:
        raise
    Ironbrew1 = None

PLUGINS = [
    LuraphV14(),
    LuraphV15(),
    Generic(),      # fallback: behaviour trace only
]
if Ironbrew1 is not None:
    PLUGINS.insert(-1, Ironbrew1())

MIN_CONFIDENCE = 0.5    # below this the input counts as unrecognized (the fallback runs)


def by_name(name):
    for p in PLUGINS:
        if p.name == name:
            return p
    raise KeyError("unknown obfuscator %r (known: %s)" % (name, ", ".join(p.name for p in PLUGINS)))


def scores(source):
    """[(confidence, plugin)], most confident first."""
    out = []
    for p in PLUGINS:
        try:
            c = p.detect(source)
        except Exception:  # noqa: BLE001 - a broken detector must not stop the others
            c = 0.0
        out.append((c, p))
    return sorted(out, key=lambda cp: -cp[0])


def detect(source):
    """(plugin, confidence) for `source`; the generic fallback when no
    plugin is confident enough."""
    best = scores(source)[0]
    if best[0] >= MIN_CONFIDENCE:
        return best[1], best[0]
    return by_name(Generic.name), best[0] if best[1].name == Generic.name else 0.0
