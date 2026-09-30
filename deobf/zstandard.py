"""Small adapter for the Zstandard API used by the local Luraph v14 engine.

The packaged desktop build ships Python 3.14's native compression.zstd module,
so no downloaded Python dependency or network lookup is needed.
"""
from compression import zstd as _zstd


ZstdError = _zstd.ZstdError


class ZstdDecompressor:
    def stream_reader(self, source):
        return _zstd.open(source, mode="rb")
