"""
Variable names for devirtualized output (text pass, scope-aware).

The lifter names locals after VM registers (r12, s3_1, ...). This pass parses
the finished Luau with luau-ast, infers a name for every such local from how
it is defined, and rewrites exactly the declaration and reference positions:

  Instance.new("Frame")          -> frame          GetService("Players") -> Players
  x:FindFirstChild("Humanoid")   -> humanoid       x.Character           -> character
  x:GetChildren()                -> children       pcall(...)            -> ok, result
  for _ in ipairs(players)       -> i, player      for _ in pairs(t)     -> k, v
  numeric for                    -> i              require(a.Foo)        -> Foo

A name is taken only if it cannot change what any reference resolves to: no
reference of another local with that name lies inside this local's scope
(shadowing), and names of globals are never used.

    python names.py file.luau [-o out.luau]
"""
import json
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
GENERATED = re.compile(r"^(?:[a-z]\d+(?:_\d+)*|arg\d+_*|fn\d*|v)$")
KEYWORDS = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "if", "in", "local",
            "nil", "not", "or", "repeat", "return", "then", "true", "until", "while", "continue", "type",
            "export", "self"}
DATATYPES = {"Color3": "color", "Vector3": "vector", "Vector2": "vector2", "UDim2": "udim2", "UDim": "udim",
             "CFrame": "cframe", "TweenInfo": "tweenInfo", "ColorSequence": "colorSequence",
             "NumberSequence": "numberSequence", "NumberRange": "numberRange", "Rect": "rect",
             "RaycastParams": "raycastParams", "OverlapParams": "overlapParams", "Ray": "ray",
             "BrickColor": "brickColor", "Font": "font", "PhysicalProperties": "physicalProperties"}
METHOD_NAMES = {"GetChildren": "children", "GetDescendants": "descendants", "GetPlayers": "players",
                "Clone": "clone", "Connect": "connection", "Once": "connection", "Create": "tween",
                "GetPropertyChangedSignal": "signal", "GetMouse": "mouse", "Raycast": "hit",
                "InvokeServer": "response", "HttpGet": "response", "GetAsync": "response",
                "JSONDecode": "data", "JSONEncode": "json", "match": "match", "gsub": "str", "sub": "str",
                "lower": "str", "upper": "str", "format": "str", "rep": "str", "find": "pos", "split": "parts",
                "GetAttribute": "attribute", "IsA": "isA", "Wait": "result"}
GLOBAL_CALLS = {"tick": "now", "time": "now", "os.clock": "now", "os.time": "now", "type": "kind",
                "typeof": "kind", "tostring": "str", "tonumber": "num", "setmetatable": "obj",
                "loadstring": "chunk", "getgenv": "genv", "getfenv": "env", "gethui": "hui",
                "string.format": "str", "string.rep": "str", "string.sub": "str", "table.concat": "str",
                "math.floor": "n", "math.clamp": "n", "math.min": "n", "math.max": "n", "math.abs": "n",
                "math.random": "n", "select": "value", "unpack": "value", "table.unpack": "value",
                "coroutine.create": "thread", "task.spawn": "thread", "task.delay": "thread",
                "Instance.new": "instance", "newproxy": "proxy", "rawget": "value", "next": "key"}

# Names for locals that alias globals directly. These names describe the
# binding without shadowing the global itself (e.g. `getType = type`).
GLOBAL_ALIASES = {
    "type": "getType", "typeof": "getTypeof", "pcall": "protectedCall",
    "xpcall": "protectedCallWithHandler", "error": "raiseError",
    "tostring": "toString", "tonumber": "toNumber", "ipairs": "arrayIterator",
    "pairs": "tableIterator", "next": "nextEntry", "select": "selectValue",
    "rawget": "rawGet", "rawset": "rawSet", "print": "printFunction",
    "warn": "warnFunction", "assert": "assertFunction", "unpack": "unpackValues",
    "require": "requireModule", "loadstring": "loadString", "setmetatable": "setMetatable",
    "getmetatable": "getMetatable", "getgenv": "getGlobalEnvironment",
    "getfenv": "getFunctionEnvironment", "identifyexecutor": "identifyExecutor",
    "_G": "globalEnvironment", "game": "gameInstance", "workspace": "workspaceRoot",
    "task": "taskLibrary", "math": "mathLibrary", "string": "stringLibrary",
    "table": "tableLibrary", "os": "osLibrary", "coroutine": "coroutineLibrary",
    "bit32": "bit32Library", "buffer": "bufferLibrary", "debug": "debugLibrary",
}
LIBRARY_FUNCTIONS = {
    "string": "stringFunctions", "table": "tableFunctions", "math": "mathFunctions",
    "os": "osFunctions", "bit32": "bit32Functions", "task": "taskFunctions",
    "buffer": "bufferFunctions", "coroutine": "coroutineFunctions",
}


WEAK = {"str", "n", "tbl", "flag", "fn", "value", "key", "kind", "num", "obj", "result"}
# parameters of callbacks connected to these signals (same table as envlog's SIGNAL_PARAMS)
SIGNAL_PARAMS = {
    "PlayerAdded": ["player"], "PlayerRemoving": ["player"],
    "CharacterAdded": ["character"], "CharacterRemoving": ["character"], "CharacterAppearanceLoaded": ["character"],
    "Touched": ["hit"], "TouchEnded": ["hit"],
    "InputBegan": ["input", "gameProcessed"], "InputEnded": ["input", "gameProcessed"],
    "InputChanged": ["input", "gameProcessed"],
    "Heartbeat": ["deltaTime"], "RenderStepped": ["deltaTime"], "PreSimulation": ["deltaTime"],
    "PostSimulation": ["deltaTime"], "PreRender": ["deltaTime"], "Stepped": ["time", "deltaTime"],
    "ChildAdded": ["child"], "ChildRemoved": ["child"],
    "DescendantAdded": ["descendant"], "DescendantRemoving": ["descendant"],
    "HealthChanged": ["health"], "Chatted": ["message"],
    "FocusLost": ["enterPressed", "inputObject"], "Triggered": ["player"],
    "PromptTriggered": ["prompt", "player"], "PromptButtonHoldBegan": ["prompt", "player"],
    "Idled": ["idleTime"], "MouseButton1Down": ["x", "y"], "Activated": ["inputObject", "clickCount"],
    "AncestryChanged": ["child", "parent"], "AttributeChanged": ["attribute"],
    "StateChanged": ["old", "new"], "MoveToFinished": ["reached"], "Completed": ["playbackState"],
}


def str_arg_name(call):
    """f("RouterClient") -> RouterClient, x.get("TradeAPI/SendTrade") -> sendTrade:
    a call whose first argument names what it returns."""
    args = call.get("args") or []
    s = const_str(args[0]) if args else None
    if not s:
        return None
    last = re.split(r"[/.:\\]", s)[-1]
    if re.match(r"^[A-Za-z_]\w{1,40}$", last) and last not in KEYWORDS:
        return last if last[:1].isupper() and not last.isupper() else camel(last)
    return None


def loc(s):
    a, b = s.split(" - ")
    l1, c1 = a.split(",")
    l2, c2 = b.split(",")
    return (int(l1), int(c1)), (int(l2), int(c2))


def camel(s):
    """'UICorner' -> 'uiCorner', 'Humanoid Root' -> 'humanoidRoot'; None if unusable."""
    parts = re.findall(r"[A-Za-z0-9]+", s)
    if not parts:
        return None
    if len(parts) > 1:
        # TARGET_BRAINROTS -> targetBrainrots (FOV Circle -> fovCircle)
        parts = [p.capitalize() if p.isupper() else p for p in parts]
    w = "".join(p[:1].upper() + p[1:] for p in parts)
    m = re.match(r"^([A-Z]+)([A-Z][a-z].*)$", w)
    if m:
        w = m.group(1).lower() + m.group(2)
    else:
        m = re.match(r"^([A-Z]+)$", w)
        w = w.lower() if m else w[:1].lower() + w[1:]
    if w[:1].isdigit():
        w = "n" + w
    return w[:32] if w else None


def singular(name):
    if not name:
        return None
    if name == "children":
        return "child"
    if name.endswith("ies") and len(name) > 4:
        return name[:-3] + "y"
    if name.endswith("s") and not name.endswith("ss") and len(name) > 3:
        return name[:-1]
    return None


def const_str(e):
    return e.get("value") if e and e.get("type") == "AstExprConstantString" else None


def dotted(e):
    """'a.b.c' for global/index-name chains, else None."""
    if e.get("type") == "AstExprGlobal":
        return e["global"]
    if e.get("type") == "AstExprIndexName" and e.get("op") == ".":
        d = dotted(e["expr"])
        return d + "." + e["index"] if d else None
    return None


def walk_nodes(root):
    """Iterate an AST subtree without recursion."""
    stack = [root]
    while stack:
        node = stack.pop()
        if isinstance(node, dict):
            yield node
            stack.extend(v for v in node.values() if isinstance(v, (dict, list)))
        elif isinstance(node, list):
            stack.extend(node)


class Namer:
    def __init__(self, text):
        import tempfile
        self.text = text
        with tempfile.NamedTemporaryFile("w", suffix=".luau", delete=False, encoding="utf-8", newline="\n") as f:
            f.write(text)
            path = f.name
        try:
            out = subprocess.run([os.path.join(HERE, "bin", "luau-ast.exe" if os.name == "nt" else "luau-ast"), path],
                                 capture_output=True).stdout
        finally:
            os.remove(path)
        self.root = json.loads(out.decode("latin-1"))["root"]
        self.locals = {}        # decl location -> info
        self.globals = set()
        self.order = []

    # ---- collection
    def local_info(self, node, scope):
        key = node["location"]
        info = self.locals.get(key)
        if info is None:
            info = self.locals[key] = {"name": node["name"], "decl": loc(key)[0], "scope": scope,
                                       "refs": [loc(key)[0]], "spans": [loc(key)], "hint": None, "hints": []}
            self.order.append(key)
        return info

    def collect(self):
        self.visit_block(self.root)

    def visit_block(self, blk):
        end = loc(blk["location"])[1]
        for st in blk["body"]:
            self.visit_stat(st, end)

    def visit_stat(self, st, block_end):
        t = st["type"]
        if t == "AstStatLocal":
            for v in st.get("values", []):
                self.visit_expr(v)
            stend = loc(st["location"])[1]
            vals = st.get("values", [])
            for i, var in enumerate(st["vars"]):
                # `local f = function` becomes `local function f` later (localfuncs.py):
                # its scope then covers the body too
                start = loc(st["location"])[0] if len(st["vars"]) == 1 and len(vals) == 1 \
                    and vals[0]["type"] == "AstExprFunction" else stend
                info = self.local_info(var, (start, block_end))
                if i < len(vals):
                    info["hints"].append((vals[i], 0))
                elif vals and vals[-1]["type"] == "AstExprCall":
                    info["hints"].append((vals[-1], i - len(vals) + 1))
            return
        if t == "AstStatLocalFunction":
            info = self.local_info(st["name"], (loc(st["location"])[0], block_end))
            info["hints"].append((st["func"], 0))
            self.visit_expr(st["func"])
            return
        if t == "AstStatAssign":
            for v in st["vars"]:
                self.visit_expr(v)
            vals = st["values"]
            for v in vals:
                self.visit_expr(v)
            for var, v in zip(st["vars"], vals):
                # obj.Text = x / obj.BackgroundColor3 = x or default: x is a text / color
                if v.get("type") == "AstExprBinary" and v.get("op") == "Or":
                    v = v["left"]
                if var.get("type") == "AstExprIndexName" and v.get("type") == "AstExprLocal":
                    info = self.locals.get(v["local"]["location"])
                    if info is not None:
                        info.setdefault("prop", camel(var["index"]))
            for i, var in enumerate(st["vars"]):
                if var["type"] == "AstExprLocal":
                    info = self.locals.get(var["local"]["location"])
                    if info is not None:
                        if i < len(vals):
                            info["hints"].append((vals[i], 0))
                        elif vals and vals[-1]["type"] == "AstExprCall":
                            info["hints"].append((vals[-1], i - len(vals) + 1))
            return
        if t == "AstStatFor":
            for k in ("from", "to", "step"):
                if st.get(k):
                    self.visit_expr(st[k])
            body = loc(st["body"]["location"])
            info = self.local_info(st["var"], (body[0], body[1]))
            info["hint"] = "i"
            self.visit_block(st["body"])
            return
        if t == "AstStatForIn":
            for v in st["values"]:
                self.visit_expr(v)
            body = loc(st["body"]["location"])
            names = self.forin_names(st)
            for var, nm in zip(st["vars"], names):
                info = self.local_info(var, (body[0], body[1]))
                info["hint"] = nm
            self.visit_block(st["body"])
            return
        if t in ("AstStatBlock",):
            self.visit_block(st)
            return
        if t == "AstStatIf":
            self.visit_expr(st["condition"])
            self.visit_block(st["thenbody"])
            e = st.get("elsebody")
            if e is not None:
                if e["type"] == "AstStatIf":
                    self.visit_stat(e, block_end)
                else:
                    self.visit_block(e)
            return
        if t == "AstStatWhile":
            self.visit_expr(st["condition"])
            self.visit_block(st["body"])
            return
        if t == "AstStatRepeat":
            self.visit_block(st["body"])
            self.visit_expr(st["condition"])
            return
        if t == "AstStatCompoundAssign":
            self.visit_expr(st["var"])
            self.visit_expr(st["value"])
            return
        # generic: expressions anywhere below
        for k, v in st.items():
            if isinstance(v, dict) and v.get("type", "").startswith("AstExpr"):
                self.visit_expr(v)
            elif isinstance(v, list):
                for x in v:
                    if isinstance(x, dict) and x.get("type", "").startswith("AstExpr"):
                        self.visit_expr(x)

    def visit_expr(self, e):
        t = e.get("type")
        if t == "AstExprLocal":
            info = self.locals.get(e["local"]["location"])
            if info is not None:
                a, b = loc(e["location"])
                info["refs"].append(a)
                info["spans"].append((a, b))
            return
        if t == "AstExprGlobal":
            self.globals.add(e["global"])
            return
        if t == "AstExprCall":
            f = e.get("func", {})
            # t[k](...) with a computed key: t is a dispatch table
            if f.get("type") == "AstExprIndexExpr" and f["expr"].get("type") == "AstExprLocal"                     and const_str(f.get("index")) is None:
                info = self.locals.get(f["expr"]["local"]["location"])
                if info is not None:
                    info["dispatch"] = True
            # signal:Connect(function(input, gameProcessed) ...): parameters from the signal
            if f.get("type") == "AstExprIndexName" and f.get("index") in ("Connect", "Once", "ConnectParallel") \
                    and f["expr"].get("type") == "AstExprIndexName" and e.get("args"):
                params = SIGNAL_PARAMS.get(f["expr"]["index"])
                if params:
                    for k, v in e.items():
                        if k != "args" and isinstance(v, dict) and v.get("type", "").startswith("AstExpr"):
                            self.visit_expr(v)
                    for a in e["args"]:
                        self.visit_expr(a)
                    self.callback_params(e["args"][0], params)
                    return
        if t == "AstExprBinary" and e.get("op", "").startswith("Compare"):
            # A type guard identifies generic parameters that hold a table.
            # This is a type hint only; it does not infer application meaning.
            for call, value in ((e.get("left", {}), e.get("right", {})),
                                (e.get("right", {}), e.get("left", {}))):
                if call.get("type") != "AstExprCall" or const_str(value) != "table":
                    continue
                callee = dotted(call.get("func", {})) or self.global_origin(call.get("func", {}))
                args = call.get("args") or []
                if callee in ("type", "typeof") and args and args[0].get("type") == "AstExprLocal":
                    info = self.locals.get(args[0]["local"]["location"])
                    if info and info.get("hint") == "arg" and not info.get("label"):
                        info["label"] = "tableValue"
        if t == "AstExprBinary" and e.get("op") == "Concat" and e["right"].get("type") == "AstExprLocal":
            # "Speed: " .. n  ->  speed
            m = re.match(r"^([A-Za-z][A-Za-z ]{0,30}?)\s*[:=]\s*$", const_str(e["left"]) or "")
            info = self.locals.get(e["right"]["local"]["location"]) if m else None
            if info is not None:
                info.setdefault("label", camel(m.group(1)))
        if t == "AstExprFunction":
            body = loc(e["body"]["location"])
            for a in e["args"]:
                info = self.local_info(a, (loc(e["location"])[0], body[1]))
                info["hint"] = info["hint"] or "arg"
            self.visit_block(e["body"])
            return
        for k, v in e.items():
            if isinstance(v, dict) and "type" in v:
                if v["type"] == "AstStatBlock":
                    self.visit_block(v)
                elif v["type"].startswith("AstExpr"):
                    self.visit_expr(v)
            elif isinstance(v, list):
                for x in v:
                    if isinstance(x, dict) and x.get("type", "").startswith("AstExpr"):
                        self.visit_expr(x)
                    elif isinstance(x, dict) and "value" in x and isinstance(x["value"], dict):
                        # table items {key=..., value=...}
                        if isinstance(x.get("key"), dict):
                            self.visit_expr(x["key"])
                        self.visit_expr(x["value"])

    # ---- inference
    def callback_params(self, fn, params):
        """Name the parameters of a function (literal, or a local holding one) after the signal's."""
        if fn.get("type") == "AstExprLocal":
            info = self.locals.get(fn["local"]["location"])
            funcs = [h for h, _ in (info or {}).get("hints", []) if h.get("type") == "AstExprFunction"]
            if not funcs:
                return
            fn = funcs[0]
        if fn.get("type") != "AstExprFunction":
            return
        for a, nm in zip(fn["args"], params):
            info = self.locals.get(a["location"])
            if info is not None and info["hint"] in (None, "arg"):
                info["hint"] = nm

    def function_name(self, fn):
        """toggleShield for `function() S.Shield = not S.Shield ...`, createFrame for a
        function returning the local it made with Instance.new("Frame")."""
        body = fn.get("body", {}).get("body", [])
        if not body:
            return None
        nodes = list(walk_nodes(body))
        calls = [node for node in nodes if node.get("type") == "AstExprCall"]
        args = fn.get("args", [])

        def call_name(call):
            func = call.get("func", {})
            name = dotted(func)
            if name:
                return name
            if func.get("type") == "AstExprIndexName" and func.get("expr", {}).get("type") == "AstExprLocal":
                info = self.locals.get(func["expr"].get("local", {}).get("location"))
                if info:
                    return info.get("new", info["name"]) + "." + func["index"]
            return self.global_origin(func)

        if len(args) >= 2:
            source, members = args[0]["location"], args[1]["location"]
            tables = set()
            for node in nodes:
                if node.get("type") == "AstStatLocal" and node.get("values"):
                    for var, value in zip(node.get("vars", []), node["values"]):
                        if value.get("type") == "AstExprTable":
                            tables.add(var["location"])
            for node in nodes:
                if node.get("type") != "AstStatForIn" or not node.get("vars"):
                    continue
                values = node.get("values", [])
                iterator = values[0] if values else {}
                if iterator.get("type") != "AstExprCall" or not iterator.get("args"):
                    continue
                iterator_name = dotted(iterator.get("func", {})) or self.global_origin(iterator.get("func", {}))
                collection = iterator["args"][0]
                if iterator_name not in ("ipairs", "pairs") or collection.get("type") != "AstExprLocal" \
                        or collection.get("local", {}).get("location") != members:
                    continue
                key = node["vars"][-1]["location"]
                reads_source_by_key = any(
                    expr.get("type") == "AstExprIndexExpr"
                    and expr.get("expr", {}).get("type") == "AstExprLocal"
                    and expr["expr"].get("local", {}).get("location") == source
                    and expr.get("index", {}).get("type") == "AstExprLocal"
                    and expr["index"].get("local", {}).get("location") == key
                    for expr in walk_nodes(node.get("body", {})))
                writes_table_by_key = any(
                    stat.get("type") == "AstStatAssign" and any(
                        var.get("type") == "AstExprIndexExpr"
                        and var.get("expr", {}).get("type") == "AstExprLocal"
                        and var["expr"].get("local", {}).get("location") in tables
                        and var.get("index", {}).get("type") == "AstExprLocal"
                        and var["index"].get("local", {}).get("location") == key
                        for var in stat.get("vars", []))
                    for stat in walk_nodes(node.get("body", {})))
                returns_copy = any(
                    stat.get("type") == "AstStatReturn" and any(
                        value.get("type") == "AstExprLocal"
                        and value.get("local", {}).get("location") in tables
                        for value in stat.get("list", []))
                    for stat in walk_nodes(body))
                if reads_source_by_key and writes_table_by_key and returns_copy:
                    return "copySelectedMembers"
        if args:
            source = args[0]["location"]

            def reads_param(expr):
                return any(node.get("type") == "AstExprLocal"
                           and node.get("local", {}).get("location") == source
                           for node in walk_nodes(expr))

            hex_format = any(
                call_name(call) in ("string.format", "stringFunctions.format")
                and len(call.get("args") or []) >= 2
                and const_str(call["args"][0]) == "%02x"
                and call["args"][1].get("type") == "AstExprCall"
                and call_name(call["args"][1]) in ("string.byte", "stringFunctions.byte")
                and (call["args"][1].get("args") or [])
                and reads_param(call["args"][1]["args"][0])
                for call in calls)
            if hex_format and any(call_name(call) in ("table.concat", "tableFunctions.concat")
                                  for call in calls) and any(n.get("type") == "AstStatFor" for n in nodes):
                return "toHex"

            strips_nonprintable = any(
                call_name(call) in ("string.gsub", "stringFunctions.gsub")
                and len(call.get("args") or []) >= 3
                and reads_param(call["args"][0])
                and const_str(call["args"][1]) == "[^ -~]"
                and const_str(call["args"][2]) == ""
                for call in calls)
            if strips_nonprintable:
                return "sanitizePrintableText"

            serializes_lengths = any(
                n.get("type") == "AstExprConstantString" and n.get("value") == ":" for n in nodes) \
                and any(n.get("type") == "AstExprConstantString" and n.get("value") == "," for n in nodes) \
                and any(n.get("type") == "AstExprUnary" and n.get("op") == "Len" for n in nodes) \
                and any(n.get("type") == "AstExprCall" and
                        call_name(n) in ("table.concat", "tableFunctions.concat") for n in calls) \
                and any(n.get("type") in ("AstStatFor", "AstStatForIn") for n in nodes)
            if serializes_lengths and reads_param(fn.get("body", {})):
                return "encodeLengthPrefixedValues"

            indexes_param = any(
                n.get("type") == "AstExprIndexExpr"
                and n.get("expr", {}).get("type") == "AstExprLocal"
                and n["expr"].get("local", {}).get("location") == source
                for n in nodes)
            protected_lookup = any(
                call_name(call) in ("pcall", "xpcall")
                for call in calls)
            table_guard = any(
                call_name(call) in ("type", "typeof")
                and call.get("args") and reads_param(call["args"][0])
                for call in calls) and any(n.get("type") == "AstExprConstantString" and n.get("value") == "table"
                                            for n in nodes)
            if indexes_param and protected_lookup and table_guard:
                return "safeTableGet"
        st = body[0]
        if st["type"] == "AstStatAssign" and len(st["vars"]) == 1 and len(st["values"]) == 1:
            var, val = st["vars"][0], st["values"][0]
            if var.get("type") == "AstExprIndexName" and val.get("type") == "AstExprUnary" \
                    and val.get("op") == "Not" and self.same(var, val["expr"]):
                return camel("toggle " + var["index"])
        last = body[-1]
        if last["type"] == "AstStatReturn" and len(last.get("list", [])) == 1 \
                and last["list"][0].get("type") == "AstExprLocal":
            where = last["list"][0]["local"]["location"]
            for st in body:
                if st["type"] == "AstStatLocal" and len(st["vars"]) == 1 and st.get("values") \
                        and st["vars"][0]["location"] == where:
                    v = st["values"][0]
                    if v.get("type") == "AstExprCall" and dotted(v["func"]) in ("Instance.new", "Drawing.new") \
                            and v.get("args") and const_str(v["args"][0]):
                        return camel("create " + const_str(v["args"][0]))
        return None

    def same(self, a, b):
        """Same variable path (locals by declaration, globals by name, .x chains)."""
        if a.get("type") != b.get("type"):
            return False
        t = a["type"]
        if t == "AstExprLocal":
            return a["local"]["location"] == b["local"]["location"]
        if t == "AstExprGlobal":
            return a["global"] == b["global"]
        if t == "AstExprIndexName":
            return a["index"] == b["index"] and self.same(a["expr"], b["expr"])
        return False

    def forin_names(self, st):
        n = len(st["vars"])
        vals = st["values"]
        first = vals[0] if vals else {}
        fn_expr = first.get("func", {}) if first.get("type") == "AstExprCall" else {}
        fn = dotted(fn_expr) or self.global_origin(fn_expr)
        base = None
        if first.get("type") == "AstExprCall" and first.get("args"):
            a = first["args"][0]
            if a.get("type") == "AstExprLocal":
                base = ("local", a["local"]["location"])
            elif a.get("type") == "AstExprCall" and a["func"].get("type") == "AstExprIndexName":
                base = ("name", METHOD_NAMES.get(a["func"]["index"]))
            elif a.get("type") == "AstExprIndexName":
                base = ("name", camel(a["index"]))      # pairs(data.Lines) -> line
        if first.get("type") == "AstExprCall" and first["func"].get("type") == "AstExprIndexName"                 and first["func"]["index"] == "gmatch":
            return (["match"] + ["match%d" % i for i in range(2, n + 1)])[:n]
        key = "i" if fn == "ipairs" else "k"
        names = [key, ("v", base)] + ["v%d" % i for i in range(3, n + 1)]
        if fn == "ipairs" and n > 1 and len(st["vars"]) > 1 and self.is_index_key(
                st["body"], st["vars"][1]["location"]):
            names[1] = "key"
            args = first.get("args") or []
            source = args[0] if args else None
            if source and source.get("type") == "AstExprLocal":
                info = self.locals.get(source["local"]["location"])
                if info and info.get("hint") == "arg" and not info.get("label"):
                    info["label"] = "keys"
        return names[:n]

    def is_index_key(self, block, location):
        """Whether a loop value is used as a dynamic table key in its body."""
        stack = [block]
        while stack:
            node = stack.pop()
            if isinstance(node, dict):
                if node.get("type") == "AstExprIndexExpr":
                    index = node.get("index", {})
                    if index.get("type") == "AstExprLocal" and \
                            index.get("local", {}).get("location") == location:
                        return True
                stack.extend(v for v in node.values() if isinstance(v, (dict, list)))
            elif isinstance(node, list):
                stack.extend(node)
        return False

    def global_origin(self, e, seen=None):
        """Global or library function name behind a local alias, if known."""
        t = e.get("type")
        if t == "AstExprGlobal":
            return e.get("global")
        if t == "AstExprIndexName":
            return dotted(e)
        if t != "AstExprLocal":
            return None
        location = e.get("local", {}).get("location")
        seen = set() if seen is None else seen
        if not location or location in seen:
            return None
        seen.add(location)
        info = self.locals.get(location)
        for value, _ in (info or {}).get("hints", []):
            origin = self.global_origin(value, seen)
            if origin:
                return origin
        return None

    def infer(self, e, idx=0):
        t = e.get("type")
        if t == "AstExprGlobal":
            return GLOBAL_ALIASES.get(e.get("global"))
        if t == "AstExprVarargs":
            return "args"
        if t == "AstExprCall":
            f = e["func"]
            d = dotted(f) or self.global_origin(f)
            if d in ("pcall", "xpcall"):
                return ["ok", "result"][min(idx, 1)]
            if idx > 0:
                return None
            if d == "require" and e["args"]:
                a = e["args"][0]
                if a.get("type") == "AstExprIndexName":
                    return a["index"]
                if a.get("type") == "AstExprCall" and a["func"].get("type") == "AstExprIndexName" \
                        and a["func"]["index"] in ("WaitForChild", "FindFirstChild") and a.get("args"):
                    nm = const_str(a["args"][0])
                    if nm and re.match(r"^[A-Za-z_]\w*$", nm):
                        return nm
                return "module"
            if d in ("Instance.new", "Drawing.new") and e["args"] and const_str(e["args"][0]):
                return camel(const_str(e["args"][0]))
            if d and "." in d and d.split(".")[0] in DATATYPES:
                return DATATYPES[d.split(".")[0]]
            if d in GLOBAL_CALLS:
                return GLOBAL_CALLS[d]
            if f.get("type") == "AstExprIndexName" and f.get("op") == ":":
                m = f["index"]
                arg = const_str(e["args"][0]) if e["args"] else None
                if m == "GetService" and arg and re.match(r"^[A-Za-z]\w*$", arg):
                    return arg
                if m in ("FindFirstChild", "WaitForChild", "FindFirstChildOfClass", "FindFirstChildWhichIsA",
                         "FindFirstAncestor", "FindFirstAncestorOfClass", "FindFirstAncestorWhichIsA") and arg:
                    return camel(arg)
                if m == "IsA" and arg:
                    return camel("is " + arg)
                if m in METHOD_NAMES:
                    return METHOD_NAMES[m]
                if m.startswith("Get") and len(m) > 3:
                    return camel(m[3:])
                return str_arg_name(e)
            if f.get("type") == "AstExprCall":
                inner = dotted(f.get("func", {}))
                if inner == "loadstring":
                    return "lib"
            if f.get("type") == "AstExprLocal":
                # A helper copying a selected set of members from a standard
                # library (`copy(math, {"floor", "max"})`) returns that API set.
                args = e.get("args") or []
                first = args[0] if args else None
                if first and first.get("type") == "AstExprGlobal":
                    library_name = LIBRARY_FUNCTIONS.get(first.get("global"))
                    if library_name:
                        return library_name
                # a helper of the script: its first word-like string argument
                # (createButton(page, "Save Position", 8) -> savePosition)
                nm = str_arg_name(e)
                if nm:
                    return nm
                for a in e.get("args") or []:
                    s = const_str(a)
                    if s is not None:
                        s = re.sub(r"\s*:\s*\w*$", "", s)     # "Skeleton: ON" -> skeleton
                        # a label ("Shield", "Save Position"), not an option string ("s", "slanf")
                        ok = re.match(r"^[A-Z][A-Za-z0-9 _]{1,30}$", s) and camel(s) not in KEYWORDS
                        return camel(s) if ok else None
            return str_arg_name(e)
        if t == "AstExprIndexName":
            d = dotted(e)
            if d and d.split(".")[0] in DATATYPES:
                return DATATYPES[d.split(".")[0]]     # Vector3.zero -> vector
            return camel(e["index"])
        if t == "AstExprIndexExpr":
            s = const_str(e.get("index"))
            return camel(s) if s else None
        if t == "AstExprFunction":
            return self.function_name(e) or "fn"
        if t == "AstExprTable":
            return "tbl"
        if t == "AstExprBinary":
            if e["op"] == "Or":
                # `x or default`: named after x
                left = self.infer(e["left"])
                if left and left not in WEAK:
                    return left
                return self.infer(e["right"]) or left
            if e["op"] == "And":
                return self.infer(e["right"]) or self.infer(e["left"])
            if e["op"].startswith("Compare"):
                return "flag"
            if e["op"] == "Concat":
                return "str"
            return "n"
        if t == "AstExprUnary":
            return "flag" if e["op"] == "Not" else "n"
        if t == "AstExprConstantBool":
            return "flag"
        if t == "AstExprConstantString":
            return "str"
        if t == "AstExprConstantNumber":
            return "n"
        if t == "AstExprGroup":
            return self.infer(e["expr"], idx)
        return None

    def base_name(self, info):
        h = info["hint"]
        if h == "arg" and (info.get("label") or info.get("prop")):
            return info.get("label") or info["prop"]      # a parameter: named from use
        if isinstance(h, tuple):
            key, base = h
            if base is not None:
                if base[0] == "local":
                    src = self.locals.get(base[1])
                    nm = singular(src.get("new")) if src else None
                    if nm:
                        return nm
                else:
                    nm = singular(base[1])
                    if nm:
                        return nm
            return key
        if h:
            return h
        weak = None
        strong = []
        for expr, idx in info["hints"]:
            nm = self.infer(expr, idx)
            if nm:
                if nm == "tbl" and info.get("dispatch"):
                    nm = "handlers"
                if nm in WEAK:
                    weak = weak or nm
                elif nm not in strong:
                    strong.append(nm)
        # VM registers are often initialized with a generic number/table and
        # assigned a useful value later. Prefer a consistent semantic hint.
        # Multiple distinct roles indicate register reuse: retain a neutral name.
        if len(strong) == 1:
            return strong[0]
        return info.get("label") or info.get("prop") or weak or "v"

    # ---- naming
    def run(self):
        self.collect()
        taken = {}          # name -> [infos]
        reserved = self.globals | KEYWORDS
        for key in self.order:
            info = self.locals[key]
            info["refs"].sort()
            if not GENERATED.match(info["name"]):
                info["new"] = info["name"]
                taken.setdefault(info["name"], []).append(info)
        for key in sorted(self.order, key=lambda k: self.locals[k]["decl"]):     # numbered in reading order
            info = self.locals[key]
            if "new" in info:
                continue
            base = self.base_name(info)
            if not base or not re.match(r"^[A-Za-z_]\w*$", base) or base in reserved:
                base = (base or "v") + "_"
                if not re.match(r"^[A-Za-z_]\w*$", base):
                    base = "v"
            n = 1
            while True:
                cand = base if n == 1 else "%s%d" % (base, n)
                if cand not in reserved and self.fits(cand, info, taken):
                    break
                n += 1
            info["new"] = cand
            taken.setdefault(cand, []).append(info)
        return self.rewrite()

    def fits(self, cand, info, taken):
        """No other local named `cand` has a scope overlapping this one's: a
        generated name never shadows (Luau lint: LocalShadow), even where it
        would be legal because the outer one isn't referenced inside."""
        s0, s1 = info["scope"]
        for other in taken.get(cand, ()):
            o0, o1 = other["scope"]
            if s0 < o1 and o0 < s1:
                return False
        return True

    def rewrite(self):
        lines = self.text.split("\n")
        edits = {}
        for info in self.locals.values():
            if info["new"] == info["name"]:
                continue
            for (a, b) in info["spans"]:
                edits.setdefault(a[0], []).append((a[1], b[1], info["name"], info["new"]))
        for ln, lst in edits.items():
            s = lines[ln].encode("utf-8")       # luau-ast columns are byte offsets
            for c0, c1, old, new in sorted(lst, reverse=True):
                if s[c0:c1] == old.encode("utf-8"):
                    s = s[:c0] + new.encode("utf-8") + s[c1:]
            lines[ln] = s.decode("utf-8")
        return "\n".join(lines)


def rename_text(text):
    return Namer(text).run()


def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("file")
    ap.add_argument("-o", "--output")
    a = ap.parse_args()
    with open(a.file, encoding="utf-8") as f:
        text = f.read()
    out = rename_text(text)
    with open(a.output or a.file, "w", encoding="utf-8", newline="\n") as f:
        f.write(out)


if __name__ == "__main__":
    main()
