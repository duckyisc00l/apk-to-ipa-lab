"""Dev helper: dump the raw bytes of a Unity build's UI Toolkit objects (open-source games only) so the
decoder in uitk_extract.py can be developed offline.
Usage: python3 uitk_dump.py <game Data folder> <out.json>
"""
import base64, json, os, sys
import UnityPy

data, out = sys.argv[1:3]
env = UnityPy.load(data)
WANT = ("VisualTreeAsset", "StyleSheet", "PanelSettings", "ThemeStyleSheet", "UIDocument")
objs, index, externals = [], [], {}
for obj in env.objects:
    f = obj.assets_file
    fn = os.path.basename(f.name)
    if fn not in externals:
        externals[fn] = [os.path.basename(e.path) for e in f.externals]
    t = obj.type.name
    if t in ("Texture2D", "Sprite", "Font", "MonoBehaviour", "VectorImage", "Material"):
        try:
            d = obj.read(check_read=False)
            name = getattr(d, "m_Name", "")
            cls = ""
            if t == "MonoBehaviour":
                s = d.m_Script.read()
                cls = (s.m_Namespace + "." if s.m_Namespace else "") + s.m_ClassName
                if s.m_ClassName in WANT:
                    objs.append({"file": fn, "path_id": obj.path_id, "cls": s.m_ClassName, "name": name,
                                 "raw": base64.b64encode(obj.get_raw_data()).decode()})
            if t != "MonoBehaviour" or name:
                index.append([fn, obj.path_id, t, name, cls])
        except Exception as x:
            index.append([fn, obj.path_id, t, "?" + repr(x)[:80], ""])
json.dump({"objects": objs, "index": index, "externals": externals}, open(out, "w"))
print(len(objs), "objects", len(index), "indexed")
