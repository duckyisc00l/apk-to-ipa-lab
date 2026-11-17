"""Read a Unity game's UI Toolkit screens straight from its build and write real UXML / USS / TSS files.

AssetRipper (2.0) exports every VisualTreeAsset (UXML layout), StyleSheet (USS) and ThemeStyleSheet (TSS) as an
empty shell. Builds have no type trees for these engine types, and the layout TypeTreeGeneratorAPI makes for them
doesn't read with UnityPy, so this decodes their bytes by hand (layout of Unity 2022.2 / 2022.3:
UnityCsReference Modules/UIElements ... VisualTreeAsset.cs, UxmlAsset.cs, VisualElementAsset.cs, TemplateAsset.cs,
StyleSheet.cs, StyleRule.cs, StyleProperty.cs, StyleComplexSelector.cs, StyleSelector*.cs, StyleValueHandle.cs).

Usage:
  python3 uitk_extract.py <game Data folder, or a uitk_dump.py json> <out dir> [--project <recovered project>]
Writes <out>/uxml/*.uxml, <out>/uss/*.uss, <out>/tss/*.tss and <out>/manifest.json.
With --project, also replaces AssetRipper's shells in that project (same name, same GUID, like uitk_restore.py)
and points image/font/sheet references at the recovered assets' GUIDs.
"""
import base64, glob, json, os, re, struct, sys
from collections import Counter, defaultdict
from xml.sax.saxutils import quoteattr


# ---------------------------------------------------------------- raw reader
class R:
    def __init__(s, b):
        s.b, s.o = b, 0

    def i32(s):
        v = struct.unpack_from("<i", s.b, s.o)[0]; s.o += 4; return v

    def f32(s):
        v = struct.unpack_from("<f", s.b, s.o)[0]; s.o += 4; return v

    def i64(s):
        v = struct.unpack_from("<q", s.b, s.o)[0]; s.o += 8; return v

    def align(s):
        s.o = (s.o + 3) & ~3

    def boolean(s):          # MonoBehaviour bool fields are aligned
        v = s.b[s.o]; s.o += 1; s.align(); return bool(v)

    def str(s):
        n = s.i32()
        if n < 0 or s.o + n > len(s.b):
            raise ValueError("bad string length %d at %d" % (n, s.o - 4))
        v = s.b[s.o:s.o + n].decode("utf-8", "replace"); s.o += n; s.align(); return v

    def pptr(s):
        return (s.i32(), s.i64())

    def arr(s, fn):
        n = s.i32()
        if n < 0 or n > 1000000:
            raise ValueError("bad array length %d at %d" % (n, s.o - 4))
        return [fn() for _ in range(n)]


def read_header(r):
    r.pptr(); r.boolean(); r.pptr()          # m_GameObject, m_Enabled, m_Script
    return r.str()                           # m_Name


def read_stylesheet(raw):
    r = R(raw)
    d = {"name": read_header(r)}
    r.boolean(); r.boolean()                 # m_ImportedWithErrors / Warnings
    def prop():
        return {"name": r.str(), "line": r.i32(), "values": r.arr(lambda: (r.i32(), r.i32()))}
    d["rules"] = r.arr(lambda: {"props": r.arr(prop), "line": r.i32()})
    def part():
        return (r.str(), r.i32())
    def sel():
        return {"parts": r.arr(part), "rel": r.i32()}
    d["selectors"] = r.arr(lambda: {"spec": r.i32(), "sels": r.arr(sel), "rule": r.i32()})
    d["floats"] = r.arr(r.f32)
    d["dims"] = r.arr(lambda: (r.i32(), r.f32()))
    d["colors"] = r.arr(lambda: (r.f32(), r.f32(), r.f32(), r.f32()))
    d["strings"] = r.arr(r.str)
    d["assets"] = r.arr(r.pptr)
    d["imports"] = r.arr(lambda: {"sheet": r.pptr(), "media": r.arr(r.str)})
    d["flattened"] = r.arr(r.pptr)
    d["hash"] = r.i32()
    d["scalable"] = r.arr(lambda: (r.pptr(), r.pptr()))
    d["left"] = len(raw) - r.o
    return d


def read_vta(raw):
    r = R(raw)
    d = {"name": read_header(r)}
    r.boolean(); r.boolean()
    d["usings"] = r.arr(lambda: {"alias": r.str(), "path": r.str(), "asset": r.pptr()})
    d["inline"] = r.pptr()
    def uxml_asset():
        return {"type": r.str(), "id": r.i32(), "order": r.i32(), "parent": r.i32(), "props": r.arr(r.str)}
    def vea():
        e = uxml_asset()
        e.update({"name": r.str(), "rule": r.i32(), "text": r.str(), "picking": r.i32(), "classes": r.arr(r.str),
                  "sheet_paths": r.arr(r.str), "sheets": r.arr(r.pptr)})
        return e
    def template():
        e = vea()
        e["alias"] = r.str()
        e["overrides"] = r.arr(lambda: (r.str(), r.str(), r.str()))
        e["slot_usages"] = r.arr(lambda: (r.str(), r.i32()))
        return e
    d["elements"] = r.arr(vea)
    d["templates"] = r.arr(template)
    d["object_entries"] = r.arr(lambda: {"parent": r.i32(), "assets": r.arr(uxml_asset)})
    d["object_ids"] = r.arr(r.i32)
    d["asset_entries"] = r.arr(lambda: {"path": r.str(), "type": r.str(), "asset": r.pptr()})
    d["slots"] = r.arr(lambda: (r.str(), r.i32()))
    d["content_container"] = r.i32()
    d["hash"] = r.i32()
    d["left"] = len(raw) - r.o
    return d


def read_panel(raw):
    """PanelSettings (2022.2 / 2022.3 layout); None if the bytes don't fit"""
    r = R(raw)
    try:
        d = {"name": read_header(r)}
        d["themeUss"], d["m_TargetTexture"] = r.pptr(), r.pptr()
        d["m_ScaleMode"] = r.i32()
        for f in ("m_ReferenceSpritePixelsPerUnit", "m_Scale", "m_ReferenceDpi", "m_FallbackDpi"):
            d[f] = r.f32()
        d["m_ReferenceResolution"] = (r.i32(), r.i32())
        d["m_ScreenMatchMode"], d["m_Match"], d["m_SortingOrder"], d["m_TargetDisplay"] = r.i32(), r.f32(), r.f32(), r.i32()
        d["m_ClearDepthStencil"], d["m_ClearColor"] = r.boolean(), r.boolean()
        d["m_ColorClearValue"] = (r.f32(), r.f32(), r.f32(), r.f32())
        d["m_DynamicAtlasSettings"] = (r.i32(), r.i32(), r.i32(), r.i32())
        for f in ("m_AtlasBlitShader", "m_RuntimeShader", "m_RuntimeWorldShader", "textSettings"):
            d[f] = r.pptr()
        return d if r.o == len(raw) else None
    except (ValueError, struct.error):
        return None


def read_uidocument(raw):
    r = R(raw)
    go = r.pptr(); r.boolean(); r.pptr(); r.str()
    d = {"go": go, "m_PanelSettings": r.pptr(), "m_ParentUI": r.pptr(), "sourceAsset": r.pptr(), "m_SortingOrder": r.f32()}
    return d if r.o == len(raw) else None


# ---------------------------------------------------------------- where objects live
class Store:
    """Objects by (file, path_id); resolves PPtrs. Built from UnityPy (a game folder) or from a uitk_dump.py json."""
    KEEP = ("VisualTreeAsset", "StyleSheet", "ThemeStyleSheet", "PanelSettings", "UIDocument")

    def __init__(s, src):
        s.info, s.raw, s.ext, s.objs, s.scenes = {}, {}, {}, {}, []
        if src.endswith(".json"):
            d = json.load(open(src))
            s.ext, s.scenes = d["externals"], d.get("scenes", [])
            for fn, pid, t, name, cls in d["index"]:
                s.info[(fn, pid)] = (t, name, cls)
            for o in d["objects"]:
                k = (o["file"], o["path_id"])
                s.info[k] = ("MonoBehaviour", o["name"], o["cls"])
                s.raw[k] = base64.b64decode(o["raw"])
            return
        import UnityPy
        env = UnityPy.load(src)
        for obj in env.objects:
            f = obj.assets_file
            fn = os.path.basename(f.name)
            if fn not in s.ext:
                s.ext[fn] = [os.path.basename(e.path) for e in f.externals]
            k = (fn, obj.path_id)
            s.objs[k] = obj
            t = obj.type.name
            if t == "BuildSettings":
                try:
                    s.scenes = list(obj.read(check_read=False).scenes)
                except Exception:
                    pass
            if t == "MonoBehaviour":
                s.describe(k)
                if s.info[k][2] in s.KEEP:
                    s.raw[k] = obj.get_raw_data()

    def describe(s, key):
        """(Unity type, name, script class for MonoBehaviours)"""
        if key in s.info or key not in s.objs:
            return s.info.get(key, ("?", "", ""))
        obj = s.objs[key]
        t, name, cls = obj.type.name, "", ""
        try:
            if t == "MonoBehaviour":
                d = obj.read(check_read=False)
                name = d.m_Name
                sc = d.m_Script.read()
                cls = sc.m_ClassName if sc.m_Namespace == "UnityEngine.UIElements" else \
                    (sc.m_Namespace + "." if sc.m_Namespace else "") + sc.m_ClassName
            else:
                name = obj.peek_name() or ""
        except Exception:
            pass
        s.info[key] = (t, name, cls)
        return s.info[key]

    def resolve(s, here, pptr):
        fid, pid = pptr
        if pid == 0:
            return None
        if fid == 0:
            return (here[0], pid)
        ext = s.ext.get(here[0], [])
        return (ext[fid - 1], pid) if 0 < fid <= len(ext) else ("?", pid)


# ---------------------------------------------------------------- USS text
KEYWORDS = ["inherit", "initial", "auto", "unset", "true", "false", "none"]
UNITS = ["", "px", "%", "s", "ms", "deg", "grad", "rad", "turn"]
FUNCS = ["unknown", "var", "env", "linear-gradient"]


def num(v):
    for p in range(1, 10):
        t = "%.*g" % (p, v)
        if struct.unpack("<f", struct.pack("<f", float(t)))[0] == v:
            break
    if "e" in t:
        t = ("%.6f" % float(t)).rstrip("0").rstrip(".")
    return t


def alpha(a):
    """USS alpha is stored as a byte (ceil(a * 255) / 255): give the shortest decimal that stores the same byte"""
    b = int(round(a * 255))
    for p in range(1, 4):
        t = round(a, p)
        if 0 <= t <= 1 and -(-int(round(t * 255 * 1000)) // 1000) == b:
            return ("%.*f" % (p, t)).rstrip("0").rstrip(".") or "0"
    return num(a)


def color(c):
    r, g, b, a = c
    rgb = ", ".join(str(int(round(x * 255))) for x in (r, g, b))
    return "rgb(%s)" % rgb if a >= 0.9999 else "rgba(%s, %s)" % (rgb, alpha(a))


def quote(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


class Css:
    def __init__(s, sheet, key, store, asset_url):
        s.d, s.key, s.store, s.asset_url = sheet, key, store, asset_url

    def value(s, h, i):
        """text of handle i; returns (text, next index)"""
        t, x = h[i]
        d = s.d
        if t == 1: return KEYWORDS[x] if 0 <= x < len(KEYWORDS) else "initial", i + 1
        if t == 2: return num(d["floats"][x]), i + 1
        if t == 3:
            u, v = d["dims"][x]
            return num(v) + (UNITS[u] if 0 <= u < len(UNITS) else ""), i + 1
        if t == 4: return color(d["colors"][x]), i + 1
        if t == 5: return "resource(%s)" % quote(d["strings"][x]), i + 1
        if t == 6: return s.asset_url(s.store.resolve(s.key, d["assets"][x])), i + 1
        if t in (7, 8): return d["strings"][x], i + 1
        if t == 9: return quote(d["strings"][x]), i + 1
        if t == 10:
            name = FUNCS[x] if 0 <= x < len(FUNCS) else "unknown"
            n = int(d["floats"][h[i + 1][1]]) if i + 1 < len(h) and h[i + 1][0] == 2 else 0
            args, j = s.values(h, i + 2, n)
            return "%s(%s)" % (name, args), j
        if t == 11: return ",", i + 1
        if t == 12: return s.asset_url(s.store.resolve(s.key, d["scalable"][x][0])), i + 1
        if t == 13: return "url(%s)" % quote(d["strings"][x]) if x < len(d["strings"]) else "none", i + 1
        return "/* ? %d */" % t, i + 1

    def values(s, h, i, count):
        out, end = [], i + count
        while i < min(end, len(h)):
            v, i = s.value(h, i)
            out.append(v)
        return " ".join(out).replace(" ,", ","), i

    def props(s, rule):
        return [(p["name"], s.values(p["values"], 0, len(p["values"]))[0]) for p in rule["props"]]

    def selector(s, cs):
        out = ""
        for sel in cs["sels"]:
            if out:
                out += " > " if sel["rel"] == 1 else " "
            for v, t in sel["parts"]:
                out += {1: "*", 2: v, 3: "." + v, 4: ":" + v, 5: ":" + v, 6: "#" + v}.get(t, v)
        return out

    def text(s, import_url):
        lines = []
        for imp in s.d["imports"]:
            u = import_url(s.store.resolve(s.key, imp["sheet"]))
            lines.append("@import %s%s;" % (u, (" " + ", ".join(imp["media"])) if imp["media"] else ""))
        groups = []        # consecutive selectors sharing one rule are one "a, b { }" block
        for cs in s.d["selectors"]:
            if groups and groups[-1][0] == cs["rule"]:
                groups[-1][1].append(s.selector(cs))
            else:
                groups.append((cs["rule"], [s.selector(cs)]))
        used = {g[0] for g in groups}
        if lines:
            lines.append("")
        for ri, sels in groups:
            if not 0 <= ri < len(s.d["rules"]):
                continue
            lines.append(", ".join(sels) + " {")
            lines += ["    %s: %s;" % pv for pv in s.props(s.d["rules"][ri])]
            lines += ["}", ""]
        for ri, rule in enumerate(s.d["rules"]):   # rules with no selector (shouldn't happen outside inline sheets)
            if ri not in used and rule["props"]:
                lines.append("/* rule %d without selector */ :root {" % ri)
                lines += ["    %s: %s;" % pv for pv in s.props(rule)]
                lines += ["}", ""]
        return "\n".join(lines).rstrip() + "\n"


# ---------------------------------------------------------------- UXML text
def uxml_text(v, key, store, sheets, sheet_url, vta_url, asset_url):
    """v: read_vta(); sheets: parsed sheets by key (for the inline sheet)"""
    nodes = v["elements"] + v["templates"]
    for o in v["object_entries"]:                       # UxmlObjects (e.g. list view columns) sit under their parent
        for a in o["assets"]:
            a = dict(a); a.setdefault("parent", o["parent"]); nodes.append(a)
    kids = defaultdict(list)
    for e in nodes:
        kids[e["parent"]].append(e)
    for k in kids:
        kids[k].sort(key=lambda e: e["order"])
    inline_key = store.resolve(key, v["inline"])
    inline = sheets.get(inline_key)
    css = Css(inline, inline_key, store, asset_url) if inline else None

    def fix_style(e, txt):
        """keep the attribute as the author wrote it, but point url() at the build's own assets"""
        if not css or not 0 <= e["rule"] < len(inline["rules"]):
            return txt
        urls = [css.value(p["values"], i)[0] for p in inline["rules"][e["rule"]]["props"]
                for i, (t, _) in enumerate(p["values"]) if t in (6, 12)]
        it = iter(urls)
        return re.sub(r"url\((['\"]?)[^)'\"]*\1\)", lambda m: next(it, m.group(0)), txt)

    def tag(t):
        if t.startswith("UnityEngine.UIElements."):
            return "ui:" + t[len("UnityEngine.UIElements."):]
        if t.startswith("UnityEditor.UIElements."):
            return "uie:" + t[len("UnityEditor.UIElements."):]
        return t

    out = []
    def emit(e, depth, root=False):
        pad = "    " * depth
        p = e.get("props", [])
        attrs = list(zip(p[0::2], p[1::2]))
        if root:
            attrs = [("xmlns:" + k if k in ("ui", "uie") or (v_.startswith(("UnityEngine.", "UnityEditor.")) and k not in ("engine", "editor")) else k, v_)
                     for k, v_ in attrs]
            if not any(k == "xmlns:ui" for k, _ in attrs):
                attrs.insert(0, ("xmlns:ui", "UnityEngine.UIElements"))
            attrs = [(k, v_) for k, v_ in attrs if k not in ("xsi", "noNamespaceSchemaLocation")]
        names = {k for k, _ in attrs}
        if "class" not in names and e.get("classes"):
            attrs.append(("class", " ".join(e["classes"])))
        if "style" not in names and css and 0 <= e.get("rule", -1) < len(inline["rules"]):
            attrs.append(("style", " ".join("%s: %s;" % pv for pv in css.props(inline["rules"][e["rule"]]))))
        attrs = [(k, fix_style(e, v_) if k == "style" else v_) for k, v_ in attrs]
        if e.get("alias") and "template" not in names:
            attrs.insert(0, ("template", e["alias"]))
        inner = []
        if root:
            for u in v["usings"]:
                src = vta_url(store.resolve(key, u["asset"])) or u["path"]
                inner.append('%s    <ui:Template name=%s src=%s />' % (pad, quoteattr(u["alias"]), quoteattr(src)))
        for i, sp in enumerate(e.get("sheets", [])):
            src = sheet_url(store.resolve(key, sp)) or (e["sheet_paths"][i] if i < len(e.get("sheet_paths", [])) else "")
            inner.append('%s    <Style src=%s />' % (pad, quoteattr(src)))
        for el, an, av in e.get("overrides", []):
            inner.append('%s    <ui:AttributeOverrides element-name=%s %s=%s />' % (pad, quoteattr(el), an, quoteattr(av)))
        a = "".join(" %s=%s" % (k, quoteattr(v_)) for k, v_ in attrs)
        t = tag(e["type"])
        children = kids.get(e["id"], [])
        if not inner and not children:
            out.append("%s<%s%s />" % (pad, t, a))
            return
        out.append("%s<%s%s>" % (pad, t, a))
        out.extend(inner)
        for c in children:
            emit(c, depth + 1)
        out.append("%s</%s>" % (pad, t))

    roots = [e for e in kids.get(0, []) if e["type"].endswith(".UXML")] or \
            [{"type": "UnityEngine.UIElements.UXML", "id": None, "props": []}]
    root = roots[0]
    if root["id"] is None:
        root = dict(root, id=0)
    emit(root, 0, root=True)
    return "\n".join(out) + "\n"


# ---------------------------------------------------------------- recovered project (optional)
SCRIPT_ID = {"VisualTreeAsset": "11995", "StyleSheet": "11998"}
MAIN = {"uxml": "9197481963319205126", "uss": "7433441132597879392", "tss": "-4733365628477956816"}
IMPORTER = {"uxml": "13804", "uss": "12385", "tss": "12388"}
GUID = re.compile(r"\bguid: ([0-9a-f]{32})")


def safe(n):
    return re.sub(r"[^A-Za-z0-9_.\- ]", "_", n).lower()


class Project:
    def __init__(s, root):
        s.root = root
        s.by_name = defaultdict(list)       # safe(name without extension) -> [(rel path, guid, main fileID, type)]
        s.shells = defaultdict(list)        # name -> [(path, script fileID, guid)]
        for m in glob.glob(os.path.join(root, "Assets", "**", "*.meta"), recursive=True):
            f = m[:-5]
            if os.path.isdir(f):
                continue
            meta = open(m, errors="ignore").read()
            g = GUID.search(meta)
            if not g:
                continue
            rel = os.path.relpath(f, root).replace(os.sep, "/")
            ext = f.rsplit(".", 1)[-1].lower()
            if "TextureImporter" in meta: fid, ty = "2800000", 3
            elif "TrueTypeFontImporter" in meta: fid, ty = "12800000", 3
            elif ext in MAIN: fid, ty = MAIN[ext], 3
            else:
                mm = re.search(r"mainObjectFileID: (-?\d+)", meta)
                fid, ty = (mm.group(1) if mm else "11400000"), 2
            s.by_name[safe(os.path.splitext(os.path.basename(f))[0])].append((rel, g.group(1), fid, ty))
            if ext == "asset" and os.path.getsize(f) < 2000:
                t = open(f, errors="ignore").read()
                sm = re.search(r"m_Script: \{fileID: (\d+), guid: 0000000000000000e000000000000000", t)
                nm = re.search(r"m_Name: (.*)", t)
                if sm and nm and t.count("\n") < 20:
                    s.shells[nm.group(1).strip()].append((f, sm.group(1), g.group(1)))

    def find(s, name, kind):
        """recovered asset for an object (name, Unity type) -> (rel, guid, fileID, type)"""
        c = s.by_name.get(safe(name), [])
        folder = {"Texture2D": "/Texture2D/", "Sprite": "/Sprite/", "Font": "/Font/", "MonoBehaviour": "/MonoBehaviour/"}.get(kind, "")
        c2 = [x for x in c if folder and folder in "/" + x[0]] or c
        return c2[0] if c2 else None


def url(rel, guid, fid, ty, name):
    return "project://database/%s?fileID=%s&guid=%s&type=%d#%s" % (rel, fid, guid, ty, name)


# ---------------------------------------------------------------- main
def norm_style(t):
    t = re.sub(r"url\((['\"]?)([^)]*?)\1\)", lambda m: "url(%s)" % m.group(2).split("#")[-1].rsplit("/", 1)[-1].rsplit(".", 1)[0].lower(), t)
    return [re.sub(r"\s+", " ", x.strip().replace("'", '"')) for x in t.split(";") if x.strip()]


def inline_check(v, key, store, sheets):
    """self-check (needs no source): does the decoded inline style rule say the same as the style text the build kept?"""
    ik = store.resolve(key, v["inline"])
    sh = sheets.get(ik)
    ok = tot = 0
    bad = []
    if not sh:
        return ok, tot, bad
    css = Css(sh, ik, store, lambda k: "url(%s)" % quote(store.describe(k)[1] if k else ""))
    for e in v["elements"] + v["templates"]:
        props = dict(zip(e["props"][0::2], e["props"][1::2]))
        if "style" in props and 0 <= e["rule"] < len(sh["rules"]):
            tot += 1
            ours = norm_style(" ".join("%s: %s;" % pv for pv in css.props(sh["rules"][e["rule"]])))
            theirs = norm_style(props["style"])
            if ours == theirs:
                ok += 1
            elif len(bad) < 3:
                bad.append([x for x in theirs if x not in ours] + ["=>"] + [x for x in ours if x not in theirs])
    return ok, tot, bad


def main(argv):
    if len(argv) < 2:
        print(__doc__); return 2
    src, out = argv[0], argv[1]
    proj = Project(argv[argv.index("--project") + 1]) if "--project" in argv else None
    store = Store(src)
    sheets, vtas, panels, docs, errors = {}, {}, {}, {}, []
    for k, raw in store.raw.items():
        t, name, cls = store.describe(k)
        try:
            if cls == "VisualTreeAsset":
                vtas[k] = read_vta(raw)
            elif cls in ("StyleSheet", "ThemeStyleSheet"):
                sheets[k] = read_stylesheet(raw)
                sheets[k]["cls"] = cls
            elif cls == "PanelSettings":
                panels[k] = read_panel(raw)
            elif cls == "UIDocument":
                docs[k] = read_uidocument(raw)
        except Exception as x:
            errors.append("%s %s: %r" % (cls, name, x))
    inline = {store.resolve(k, v["inline"]) for k, v in vtas.items()}

    # file name for every object we write: its own name, made unique
    fname, used = {}, Counter()
    for k in sorted(list(vtas) + [k for k in sheets if k not in inline], key=lambda k: (store.describe(k)[1], k)):
        name = store.describe(k)[1] or "unnamed"
        ext = "uxml" if k in vtas else ("tss" if sheets[k]["cls"] == "ThemeStyleSheet" else "uss")
        base = re.sub(r"[^A-Za-z0-9_.\- ]", "_", name)
        used[(base, ext)] += 1
        fname[k] = (base if used[(base, ext)] == 1 else "%s_%d" % (base, k[1]), ext)

    # with a project: which shell each object replaces (only one-to-one name matches)
    target, shell_of = {}, {}
    if proj:
        names = Counter(store.describe(k)[1] for k in list(fname) + list(panels))
        for k in list(fname) + list(panels):
            n = store.describe(k)[1]
            ext = fname[k][1] if k in fname else "asset"
            want = {"uxml": "11995", "uss": "11998"}.get(ext)
            sh = [x for x in proj.shells.get(n, []) if want is None or x[1] == want]
            if names[n] == 1 and len(sh) == 1:
                path, _, g = sh[0]
                shell_of[k] = (path, g)
                if k in fname:
                    target[k] = (path[:-6] + "." + ext, g)

    def ref_url(k):
        """url to another UXML/USS we write"""
        if k is None or k not in fname:
            return None
        b, ext = fname[k]
        if k in target:
            new, g = target[k]
            return url(os.path.relpath(new, proj.root).replace(os.sep, "/"), g, MAIN[ext], 3, store.describe(k)[1])
        return "../%s/%s.%s" % (ext, b, ext)

    missing = Counter()
    def asset_url(k):
        t, name, cls = store.describe(k) if k else ("?", "", "")
        if k in fname:
            return "url(%s)" % quote(ref_url(k))
        if proj and name:
            hit = proj.find(name, t)
            if hit:
                return "url(%s)" % quote(url(hit[0], hit[1], hit[2], hit[3], name))
        missing["%s %s" % (t, name)] += 1
        folder = {"Texture2D": ("Texture2D", ".png"), "Sprite": ("Sprite", ".asset"), "Font": ("Font", ".ttf"),
                  "RenderTexture": ("RenderTexture", ".renderTexture")}.get(t, ("MonoBehaviour", ".asset"))
        return "url(%s)" % quote("project://database/Assets/%s/%s%s" % (folder[0], name or "missing", folder[1]))

    def import_url(k):
        t, name, cls = store.describe(k) if k else ("?", "", "")
        if cls == "ThemeStyleSheet" and name == "default":     # the UI package's own runtime theme
            return 'url("unity-theme://default")'
        return "url(%s)" % quote(ref_url(k)) if ref_url(k) else 'url("unity-theme://default")'

    def yaml_ref(here, p):
        k = store.resolve(here, p)
        if k is None:
            return "{fileID: 0}"
        if k[0] == here[0] and not k[0].endswith((".assets", ".resource")) and k[0] != "globalgamemanagers.assets" and k[0].startswith("level"):
            return "{fileID: %d}" % k[1]
        if "unity_builtin_extra" in k[0] or "unity default resources" in k[0]:
            g = "0000000000000000f000000000000000" if "extra" in k[0] else "0000000000000000e000000000000000"
            return "{fileID: %d, guid: %s, type: 0}" % (k[1], g)
        if k in target:
            new, g = target[k]
            return "{fileID: %s, guid: %s, type: 3}" % (MAIN[new.rsplit(".", 1)[1]], g)
        if k in shell_of:
            return "{fileID: 11400000, guid: %s, type: 2}" % shell_of[k][1]
        t, name, cls = store.describe(k)
        hit = proj.find(name, t) if name else None
        if hit:
            return "{fileID: %s, guid: %s, type: %d}" % (hit[2], hit[1], hit[3])
        missing["%s %s" % (t, name)] += 1
        return "{fileID: 0}"

    os.makedirs(out, exist_ok=True)
    manifest, check = [], [0, 0, []]
    for k, (b, ext) in sorted(fname.items(), key=lambda kv: kv[1]):
        if k in vtas:
            text = uxml_text(vtas[k], k, store, sheets, ref_url, ref_url, asset_url)
            info = {"elements": len(vtas[k]["elements"]) - 1, "templates": len(vtas[k]["templates"])}
            ok, tot, bad = inline_check(vtas[k], k, store, sheets)
            check[0] += ok; check[1] += tot; check[2] = (check[2] + [[b] + x for x in bad])[:5]
        else:
            text = Css(sheets[k], k, store, asset_url).text(import_url)
            info = {"rules": len(sheets[k]["rules"]), "selectors": len(sheets[k]["selectors"]),
                    "properties": sum(len(r["props"]) for r in sheets[k]["rules"])}
        os.makedirs(os.path.join(out, ext), exist_ok=True)
        p = os.path.join(out, ext, "%s.%s" % (b, ext))
        open(p, "w").write(text)
        manifest.append(dict(file=os.path.relpath(p, out), name=store.describe(k)[1], source="%s:%d" % k, **info))
        if k in target:
            new, g = target[k]
            shell = new.rsplit(".", 1)[0] + ".asset"
            for f in (shell, shell + ".meta"):
                if os.path.exists(f):
                    os.remove(f)
            open(new, "w").write(text)
            open(new + ".meta", "w").write(
                "fileFormatVersion: 2\nguid: %s\nScriptedImporter:\n  internalIDToNameTable: []\n  externalObjects: {}\n"
                "  serializedVersion: 2\n  userData: \n  assetBundleName: \n  assetBundleVariant: \n"
                "  script: {fileID: %s, guid: 0000000000000000e000000000000000, type: 0}\n%s"
                % (g, IMPORTER[ext], "" if ext == "uxml" else "  disableValidation: 0\n"))
            manifest[-1]["replaced"] = os.path.relpath(new, proj.root)

    fixed = panels_done = docs_done = 0
    if proj:
        # PanelSettings: fill the shell's fields
        for k, d in panels.items():
            if not d or k not in shell_of:
                continue
            path = shell_of[k][0]
            t = open(path).read().rstrip("\n")
            if "themeUss" in t:
                continue
            c, a = d["m_ColorClearValue"], d["m_DynamicAtlasSettings"]
            t += ("\n  themeUss: %s\n  m_TargetTexture: %s\n  m_ScaleMode: %d\n  m_ReferenceSpritePixelsPerUnit: %s\n"
                  "  m_Scale: %s\n  m_ReferenceDpi: %s\n  m_FallbackDpi: %s\n  m_ReferenceResolution: {x: %d, y: %d}\n"
                  "  m_ScreenMatchMode: %d\n  m_Match: %s\n  m_SortingOrder: %s\n  m_TargetDisplay: %d\n"
                  "  m_ClearDepthStencil: %d\n  m_ClearColor: %d\n  m_ColorClearValue: {r: %s, g: %s, b: %s, a: %s}\n"
                  "  m_DynamicAtlasSettings:\n    m_MinAtlasSize: %d\n    m_MaxAtlasSize: %d\n    m_MaxSubTextureSize: %d\n"
                  "    m_ActiveFilters: %d\n  m_AtlasBlitShader: %s\n  m_RuntimeShader: %s\n  m_RuntimeWorldShader: %s\n"
                  "  textSettings: %s\n") % (
                yaml_ref(k, d["themeUss"]), yaml_ref(k, d["m_TargetTexture"]), d["m_ScaleMode"],
                num(d["m_ReferenceSpritePixelsPerUnit"]), num(d["m_Scale"]), num(d["m_ReferenceDpi"]), num(d["m_FallbackDpi"]),
                d["m_ReferenceResolution"][0], d["m_ReferenceResolution"][1], d["m_ScreenMatchMode"], num(d["m_Match"]),
                num(d["m_SortingOrder"]), d["m_TargetDisplay"], d["m_ClearDepthStencil"], d["m_ClearColor"],
                num(c[0]), num(c[1]), num(c[2]), num(c[3]), a[0], a[1], a[2], a[3],
                yaml_ref(k, d["m_AtlasBlitShader"]), yaml_ref(k, d["m_RuntimeShader"]), yaml_ref(k, d["m_RuntimeWorldShader"]),
                yaml_ref(k, d["textSettings"]))
            open(path, "w").write(t)
            panels_done += 1
        # UIDocuments in scenes: AssetRipper keeps scene objects' fileIDs = path IDs; levelN = Nth scene in the build
        for k, d in docs.items():
            m = re.match(r"level(\d+)$", k[0])
            if not d or not m or int(m.group(1)) >= len(store.scenes):
                continue
            scene = os.path.join(proj.root, store.scenes[int(m.group(1))])
            if not os.path.isfile(scene):
                continue
            t = open(scene, errors="ignore").read()
            hdr = re.search(r"(?m)^--- !u!114 &%d\b.*$" % k[1], t)
            if not hdr:
                continue
            end = re.search(r"(?m)^--- ", t[hdr.end():])
            body = t[hdr.end(): hdr.end() + end.start() if end else len(t)]
            if "fileID: 19102," not in body or "sourceAsset" in body or "m_EditorClassIdentifier:" not in body:
                continue
            i = body.index("m_EditorClassIdentifier:")
            j = body.find("\n", i) + 1 or len(body)
            fields = "  m_PanelSettings: %s\n  m_ParentUI: %s\n  sourceAsset: %s\n  m_SortingOrder: %s\n" % (
                yaml_ref(k, d["m_PanelSettings"]), yaml_ref(k, d["m_ParentUI"]), yaml_ref(k, d["sourceAsset"]),
                num(d["m_SortingOrder"]))
            body = body[:j] + fields + body[j:]
            open(scene, "w").write(t[:hdr.end()] + body + t[hdr.end() + (end.start() if end else len(t) - hdr.end()):])
            docs_done += 1
        # references to the replaced shells (scenes, prefabs, other assets): the new file's main object
        main_of = {g: MAIN[new.rsplit(".", 1)[1]] for new, g in target.values()}
        for f in glob.glob(os.path.join(proj.root, "Assets", "**", "*"), recursive=True):
            if not f.endswith((".unity", ".prefab", ".asset", ".mat", ".controller")) or not os.path.isfile(f):
                continue
            t = open(f, errors="ignore").read()
            nt = re.sub(r"\{fileID: 11400000, guid: ([0-9a-f]{32}), type: 2\}",
                        lambda m: "{fileID: %s, guid: %s, type: 3}" % (main_of[m.group(1)], m.group(1)) if m.group(1) in main_of else m.group(0), t)
            if nt != t:
                open(f, "w").write(nt); fixed += 1

    summary = {"layouts": len(vtas), "style_sheets": sum(1 for k in sheets if k not in inline),
               "inline_sheets": len(inline & set(sheets)), "files": len(manifest), "read_errors": errors,
               "elements": sum(m.get("elements", 0) for m in manifest),
               "rules": sum(m.get("rules", 0) for m in manifest),
               "properties": sum(m.get("properties", 0) for m in manifest),
               "inline_style_check": "%d/%d decoded inline rules match the style text kept in the build" % tuple(check[:2]),
               "inline_style_mismatches": check[2],
               "panel_settings": len(panels), "ui_documents": len(docs),
               "unresolved_assets": dict(missing.most_common(30))}
    if proj:
        summary.update(replaced_shells=len(target), panel_settings_filled=panels_done,
                       ui_documents_filled=docs_done, files_repointed=fixed)
    json.dump({"summary": summary, "files": manifest}, open(os.path.join(out, "manifest.json"), "w"), indent=1)
    print(json.dumps(summary, indent=1))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
