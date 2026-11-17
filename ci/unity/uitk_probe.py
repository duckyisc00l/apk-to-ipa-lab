"""Can a Unity game's UI Toolkit screens (UXML layouts, USS styles, PanelSettings) be read
straight from its build? AssetRipper exports them as empty shells.

Usage: python3 uitk_probe.py <game Data folder (holds data.unity3d or level files)> <Managed dll folder> <unity version> <out dir>
Writes a summary only: how many VisualTreeAsset / StyleSheet / PanelSettings objects were found,
and whether their fields could be read (with the first element types of one layout).
"""
import json, os, sys, traceback

data, managed, ver, out = sys.argv[1:5]
os.makedirs(out, exist_ok=True)
rep = {"unity_version": ver}
import UnityPy
rep["unitypy"] = UnityPy.__version__
try:
    from UnityPy.helpers.TypeTreeGenerator import TypeTreeGenerator
    gen = TypeTreeGenerator(ver)
    gen.load_local_dll_folder(managed)
    rep["generator"] = "loaded"
except Exception as x:
    gen = None
    rep["generator"] = f"failed: {x!r}"[:300]
env = UnityPy.load(data)
kinds = {}
samples = {}
hist = {}; fails = []; types = {}
for obj in env.objects:
    types[obj.type.name] = types.get(obj.type.name, 0) + 1
    if obj.type.name != "MonoBehaviour":
        continue
    try:
        # base MonoBehaviour fields only (no generator here: wrong guesses for game scripts break every read)
        mb = obj.read(check_read=False)
        scr = mb.m_Script.read()
        cls = scr.m_ClassName
    except Exception as x:
        if len(fails) < 5: fails.append(traceback.format_exc()[-400:])
        continue
    hist[cls] = hist.get(cls, 0) + 1
    if cls not in ("VisualTreeAsset", "StyleSheet", "PanelSettings", "ThemeStyleSheet", "UIDocument"):
        continue
    kinds[cls] = kinds.get(cls, 0) + 1
    if kinds[cls] > 3:
        continue
    try:
        nodes = gen.get_nodes_up(scr.m_AssemblyName, (scr.m_Namespace + "." if scr.m_Namespace else "") + cls)
        tt = obj.read_typetree(nodes, check_read=False)
        s = {"name": tt.get("m_Name"), "keys": list(tt.keys())[:40]}
        if cls == "VisualTreeAsset":
            els = tt.get("m_VisualElementAssets", [])
            s["elements"] = len(els)
            s["first_types"] = [e.get("m_FullTypeName") for e in els[:12]]
            s["first_props"] = [e.get("m_Properties", [])[:6] for e in els[:3]]
            s["templates"] = len(tt.get("m_TemplateAssets", []))
            s["inline_sheet"] = bool(tt.get("inlineSheet"))
        if cls in ("StyleSheet", "ThemeStyleSheet"):
            s["rules"] = len(tt.get("m_Rules", []))
            s["selectors"] = len(tt.get("m_ComplexSelectors", []))
        samples.setdefault(cls, []).append(s)
    except Exception as x:
        samples.setdefault(cls, []).append({"error": traceback.format_exc()[-600:]})
rep["counts"] = kinds
rep["types"] = dict(sorted(types.items(), key=lambda kv: -kv[1])[:15])
rep["mb_classes"] = dict(sorted(hist.items(), key=lambda kv: -kv[1])[:40])
rep["fails"] = fails
rep["files"] = list(env.files)[:20]
rep["samples"] = samples
json.dump(rep, open(os.path.join(out, "uitk-probe.json"), "w"), indent=1, default=str)
print(json.dumps(rep, indent=1, default=str)[:6000])
