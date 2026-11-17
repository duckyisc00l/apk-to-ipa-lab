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
if gen is not None:
    env.typetree_generator = gen
kinds = {}
samples = {}
for obj in env.objects:
    if obj.type.name != "MonoBehaviour":
        continue
    try:
        mb = obj.read(check_read=False)
        scr = mb.m_Script.read() if mb.m_Script else None
        cls = scr.m_ClassName if scr else "?"
    except Exception:
        continue
    if cls not in ("VisualTreeAsset", "StyleSheet", "PanelSettings", "ThemeStyleSheet", "UIDocument"):
        continue
    kinds[cls] = kinds.get(cls, 0) + 1
    if kinds[cls] > 3:
        continue
    try:
        tt = obj.read_typetree()
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
rep["samples"] = samples
json.dump(rep, open(os.path.join(out, "uitk-probe.json"), "w"), indent=1, default=str)
print(json.dumps(rep, indent=1, default=str)[:6000])
