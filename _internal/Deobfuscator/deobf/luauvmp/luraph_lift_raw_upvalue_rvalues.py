"""Lift grouped raw-upvalue rvalue spellings used by public v14.7.

The core sequence lifter handles the same raw-cell dereference without an outer
pair of grouping parentheses.  Randomized public builds also emit the entire
rvalue as ``(cell[2][cell[1]][R[index]])``.  Accept only that exact proven
backreference shape; arbitrary grouped expressions remain fallbacks.
"""
from __future__ import annotations

import re

from . import luraph_lift, luraph_lift_closures
from .luraph_lift_return_prefix import install as _install_return_prefix
from .luraph_lift_runtime_builtins import install as _install_runtime_builtins
from .luraph_lift_residual_simple import install as _install_residual_simple


_INSTALLED = False
_ORIGINAL_CLEAN = None
_FIELD = r"[EpoH_B]"
_ID = r"[A-Za-z_]\w*"


def _value(ins, field: str) -> str:
    return luraph_lift.value_expr(luraph_lift.field_value(ins, field))


def _reg(ins, field: str) -> str:
    return luraph_lift.reg_expr(luraph_lift.field_value(ins, field))


def lift_raw_cell_write(source, ins, layout):
    """Write through a proven raw cell while retaining its scratch alias."""
    if layout is None or layout[0] == layout[1]:
        return None
    from .luraph_lift_residual_simple import _ALLOWED_SCRATCH
    table_key, index_key = layout
    text = luraph_lift.compact(source).rstrip(';')
    token = r'(?:@[EpoH_B]|\d+)'
    match = re.fullmatch(
        r'(?P<tmp>' + _ID + r')=I\[(?P<key>' + token + r')\];'
        r'\(?(?P=tmp)\[' + str(table_key) + r'\]\)?'
        r'\[(?P=tmp)\[' + str(index_key) + r'\]\]='
        r'(?P<value>nil|R\[' + token + r'\])', text)
    if match is None or match['tmp'] not in _ALLOWED_SCRATCH:
        return None
    def materialize(value):
        if '@' not in value:
            return value
        if ins is None:
            return None
        return re.sub(r'@([EpoH_B])', lambda m: _value(ins,m[1]),value)
    key,value=materialize(match['key']),materialize(match['value'])
    if key is None or value is None:
        return None
    tmp=match['tmp']
    return '%s = I[%s];\n%s[%d][%s[%d]] = %s' % (
        tmp,key,tmp,table_key,tmp,index_key,value)


def clean_layout_statement(source, ins, layout):
    if layout is None:
        return None
    table_key, index_key = layout
    if table_key == index_key:
        return None
    text = luraph_lift.compact(source).rstrip(";")
    match = re.fullmatch(
        r"(?P<tmp>" + _ID + r")=I\[@(?P<key>" + _FIELD + r")\];"
        r"R\[@(?P<dst>" + _FIELD + r")\]=\(?(?P=tmp)\["
        + str(table_key) + r"(?:\.0)?\]\[(?P=tmp)\[" + str(index_key)
        + r"(?:\.0)?\]\]\)?",
        text,
    )
    if match:
        key = _value(ins, match.group("key"))
        return "%s = I[%s][%d][I[%s][%d]]" % (
            _reg(ins, match.group("dst")), key, table_key, key, index_key,
        )
    return None


def clean_statement(source, ins):
    existing = _ORIGINAL_CLEAN(source, ins)
    if existing is not None:
        return existing
    write = lift_raw_cell_write(source, ins, luraph_lift_closures.current_cell_layout())
    if write is not None:
        return write
    text = luraph_lift.compact(source).rstrip(";")

    match = re.fullmatch(
        r"(?P<tmp>" + _ID + r")=I\[@(?P<key>" + _FIELD + r")\];"
        r"R\[@(?P<dst>" + _FIELD + r")\]=\((?P=tmp)\[2(?:\.0)?\]"
        r"\[(?P=tmp)\[1(?:\.0)?\]\]\[R\[@(?P<index>" + _FIELD + r")\]\]\)",
        text,
    )
    if match:
        key = _value(ins, match.group("key"))
        return "%s = I[%s][2][I[%s][1]][%s]" % (
            _reg(ins, match.group("dst")), key, key,
            _reg(ins, match.group("index")),
        )
    return clean_layout_statement(
        source, ins, luraph_lift_closures.current_cell_layout()
    )


def install() -> None:
    global _INSTALLED, _ORIGINAL_CLEAN
    if _INSTALLED:
        return
    _ORIGINAL_CLEAN = luraph_lift.clean_statement
    luraph_lift.clean_statement = clean_statement
    _install_return_prefix()
    _install_runtime_builtins()
    _install_residual_simple()
    _INSTALLED = True
