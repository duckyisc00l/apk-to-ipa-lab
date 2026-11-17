"""Measure uitk_extract.py against a game's real UI files (open-source games only).

Usage: python3 uitk_compare.py <uitk_extract out dir> <source Unity project folder>
For each layout: elements, element types+names, attributes (all, as written) in document order.
For each style sheet: selectors, and per selector the properties and values (colors and numbers normalized).
"""
import glob, os, re, sys
import xml.etree.ElementTree as ET
from collections import Counter

out, src = sys.argv[1], sys.argv[2]
SKIP = ("Template", "Style", "AttributeOverrides")


def find_src(ext):
    m = {}
    for f in glob.glob(os.path.join(src, "**", "*." + ext), recursive=True):
        m.setdefault(os.path.basename(f)[: -len(ext) - 1], f)
    return m


def local(tag):
    tag = tag.split("}")[-1].split(":")[-1]
    return tag.rsplit(".", 1)[-1]


def norm_url(v):
    # url('project://...#name') / url("x.png") -> url(name)
    def one(m):
        u = m.group(2)
        n = u.split("#")[-1] if "#" in u else os.path.splitext(os.path.basename(u.split("?")[0]))[0]
        return "url(%s)" % n.lower()
    return re.sub(r"url\((['\"]?)(.*?)\1\)", one, v)


def uxml_elements(path):
    t = open(path, encoding="utf-8-sig").read()
    t = re.sub(r"<(/?)([A-Za-z_][\w.\-]*):", r"<\1", t)            # drop prefixes (ui:, uie:, engine:)
    t = re.sub(r"\s(xmlns(:\w+)?|[\w\-]+:[\w\-]+)=\"[^\"]*\"", " ", t)  # and prefixed attributes
    root = ET.fromstring(t)
    els = []
    for e in root.iter():
        if e is root or local(e.tag) in SKIP:
            continue
        a = {k: (norm_url(v) if k == "style" else v) for k, v in e.attrib.items()}
        if "style" in a:
            a["style"] = ";".join(x.strip() for x in a["style"].split(";") if x.strip())
        els.append((local(e.tag), a))
    return els


NAMED = {"black": (0, 0, 0), "white": (255, 255, 255), "red": (255, 0, 0), "green": (0, 128, 0), "blue": (0, 0, 255),
         "yellow": (255, 255, 0), "grey": (128, 128, 128), "gray": (128, 128, 128), "lightgrey": (211, 211, 211)}


def norm_val(v):
    v = norm_url(v.strip()).replace("'", '"')
    def hexc(m):
        h = m.group(1)
        if len(h) in (3, 4): h = "".join(c * 2 for c in h)
        r, g, b = (int(h[i:i + 2], 16) for i in (0, 2, 4))
        a = int(h[6:8], 16) / 255 if len(h) == 8 else 1
        return "rgba(%d,%d,%d,%.2f)" % (r, g, b, a)
    v = re.sub(r"#([0-9a-fA-F]{3,8})\b", hexc, v)
    def rgb(m):
        p = [x.strip() for x in m.group(2).split(",")]
        a = float(p[3]) if len(p) > 3 else 1
        return "rgba(%d,%d,%d,%.2f)" % (round(float(p[0])), round(float(p[1])), round(float(p[2])), a)
    v = re.sub(r"(rgba?)\(([^)]*)\)", rgb, v)
    v = re.sub(r"(?<![\w-])(-?\d*\.\d+|-?\d+)(?![\w.])", lambda m: ("%g" % float(m.group(1))), v)
    v = re.sub(r"(-?\d*\.?\d+)(px|%|s|ms|deg)", lambda m: "%g%s" % (float(m.group(1)), m.group(2)), v)
    v = re.sub(r"\s*,\s*", ", ", v)
    return re.sub(r"\s+", " ", v)


def uss_rules(path):
    t = re.sub(r"/\*.*?\*/", "", open(path, encoding="utf-8-sig").read(), flags=re.S)
    imports = len(re.findall(r"@import", t))
    t = re.sub(r"@import[^;]*;", "", t)
    rules = []
    for sel, body in re.findall(r"([^{}]+)\{([^}]*)\}", t):
        props = []
        for d in body.split(";"):
            if ":" in d:
                k, v = d.split(":", 1)
                props.append((k.strip(), norm_val(v)))
        for s in sel.split(","):
            rules.append((re.sub(r"\s*>\s*", " > ", re.sub(r"\s+", " ", s.strip())), props))
    return imports, rules


def pct(a, b):
    return "%d/%d (%.1f%%)" % (a, b, 100.0 * a / b if b else 100)


tot = Counter()
print("== layouts")
real = find_src("uxml")
for f in sorted(glob.glob(os.path.join(out, "uxml", "*.uxml"))):
    n = os.path.basename(f)[:-5]
    if n not in real:
        print("  %s: no source file" % n); continue
    a, b = uxml_elements(real[n]), uxml_elements(f)
    tot["layouts"] += 1
    tot["el_src"] += len(a); tot["el_out"] += len(b)
    same_tag = sum(1 for x, y in zip(a, b) if x[0] == y[0] and x[1].get("name") == y[1].get("name"))
    attrs_src = sum(len(x[1]) for x in a)
    attrs_ok = sum(1 for x, y in zip(a, b) for k, v in x[1].items() if y[1].get(k) == v)
    tot["el_ok"] += same_tag; tot["attr_src"] += attrs_src; tot["attr_ok"] += attrs_ok
    if len(a) == len(b) and same_tag == len(a) and attrs_ok == attrs_src:
        tot["layouts_exact"] += 1
    else:
        bad = [(x, y) for x, y in zip(a, b) if x != y][:2]
        print("  %s: elements %d/%d, tag+name %d, attrs %d/%d %s" % (n, len(b), len(a), same_tag, attrs_ok, attrs_src, bad))
for ext in ("uss", "tss"):
    print("== " + ext)
    real = find_src(ext)
    for f in sorted(glob.glob(os.path.join(out, ext, "*." + ext))):
        n = os.path.basename(f)[: -len(ext) - 1]
        if n not in real:
            print("  %s: no source file" % n); continue
        ia, a = uss_rules(real[n]); ib, b = uss_rules(f)
        tot["sheets"] += 1; tot["imports_src"] += ia; tot["imports_ok"] += min(ia, ib)
        tot["sel_src"] += len(a)
        sel_ok = sum(1 for x, y in zip(a, b) if x[0] == y[0])
        props_src = sum(len(x[1]) for x in a)
        props_ok = sum(1 for x, y in zip(a, b) if x[0] == y[0] for p in x[1] if p in y[1])
        tot["sel_ok"] += sel_ok; tot["props_src"] += props_src; tot["props_ok"] += props_ok
        if sel_ok == len(a) == len(b) and props_ok == props_src:
            tot["sheets_exact"] += 1
        else:
            bad = [(x[0], [p for p in x[1] if p not in y[1]], [p for p in y[1] if p not in x[1]]) for x, y in zip(a, b) if x != y][:3]
            print("  %s: selectors %d/%d (ours %d), properties %s %s" % (n, sel_ok, len(a), len(b), pct(props_ok, props_src), bad))
print("== total")
print("layouts compared %d, exact %d" % (tot["layouts"], tot["layouts_exact"]))
print("elements: ours %d, source %d; same type+name in order %s; attributes %s" % (
    tot["el_out"], tot["el_src"], pct(tot["el_ok"], tot["el_src"]), pct(tot["attr_ok"], tot["attr_src"])))
print("style sheets compared %d, exact %d; selectors %s; properties %s; imports %s" % (
    tot["sheets"], tot["sheets_exact"], pct(tot["sel_ok"], tot["sel_src"]), pct(tot["props_ok"], tot["props_src"]),
    pct(tot["imports_ok"], tot["imports_src"])))
