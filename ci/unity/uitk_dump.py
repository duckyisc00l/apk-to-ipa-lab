"""Dev helper: dump a Unity build's UI Toolkit objects (raw bytes), the names of everything they point at, and the
scene list, so uitk_extract.py can be developed offline on the json (open-source games only: it holds game data).
Usage: python3 uitk_dump.py <game Data folder> <out.json>
"""
import base64, json, os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from uitk_extract import Store, read_vta, read_stylesheet, R, read_header

st = Store(sys.argv[1])
keys = set()
for k, raw in st.raw.items():          # everything the UI objects point at, and the UIDocuments' GameObjects
    keys.add(k)
    cls = st.describe(k)[2]
    try:
        if cls == "VisualTreeAsset":
            v = read_vta(raw)
            ps = [v["inline"]] + [u["asset"] for u in v["usings"]] + [p for e in v["elements"] + v["templates"] for p in e["sheets"]]
        elif cls in ("StyleSheet", "ThemeStyleSheet"):
            d = read_stylesheet(raw)
            ps = d["assets"] + [i["sheet"] for i in d["imports"]] + [a for x in d["scalable"] for a in x]
        else:
            r = R(raw); go = r.pptr(); r.boolean(); r.pptr(); read_header  # GameObject + every PPtr-looking field
            ps = [go]
            r.o = 0
            while r.o + 12 <= len(raw):
                ps.append((r.i32(), r.i64())); r.o -= 8
        for p in ps:
            q = st.resolve(k, p)
            if q and q in st.objs:
                keys.add(q)
    except Exception:
        pass
objs, index = [], []
for k in sorted(keys):
    t, name, cls = st.describe(k)
    if k in st.raw:
        objs.append({"file": k[0], "path_id": k[1], "cls": cls, "name": name, "raw": base64.b64encode(st.raw[k]).decode()})
    else:
        index.append([k[0], k[1], t, name, cls])
json.dump({"objects": objs, "index": index, "externals": st.ext, "scenes": st.scenes}, open(sys.argv[2], "w"))
print(len(objs), "objects", len(index), "indexed", len(st.scenes), "scenes")
