"""Put a Unity game's real UI Toolkit files back into a recovered project (open-source games only).

AssetRipper exports every UI Toolkit layout (VisualTreeAsset), style sheet, theme and PanelSettings as an
empty shell, and every UIDocument with no fields, so the game runs with no menus. When the game's source
is available at the APK's own release tag, this copies the real files in, keeping the recovered GUIDs so
everything that pointed at the shells now points at the real files.

Usage: python3 uitk_restore.py <recovered project> <source project folder (holds Assets/ and Packages/)>
"""
import glob, os, re, shutil, sys
from collections import Counter

proj, src = sys.argv[1], sys.argv[2]
GUID = re.compile(r"\bguid: ([0-9a-f]{32})")
SHELL_KIND = {"11995": "uxml", "11998": "uss"}          # VisualTreeAsset, StyleSheet; anything else: same name, any kind
MAIN = {"uxml": "9197481963319205126", "uss": "7433441132597879392", "tss": "-4733365628477956816"}
TEXT = (".unity", ".prefab", ".asset", ".mat", ".uxml", ".uss", ".tss", ".controller", ".anim", ".playable")


def meta_guid(path):
    try:
        m = GUID.search(open(path + ".meta", errors="ignore").read())
        return m.group(1) if m else None
    except OSError:
        return None


# 1. the shells in the recovered project
shells = {}
for f in glob.glob(os.path.join(proj, "Assets", "**", "*.asset"), recursive=True):
    t = open(f, errors="ignore").read()
    m = re.search(r"m_Script: \{fileID: (\d+), guid: 0000000000000000e000000000000000", t)
    if m and t.count("\n") < 20 and meta_guid(f):
        shells.setdefault(os.path.basename(f)[:-6], []).append((f, m.group(1)))

# 2. the real files in the source (the game's own Assets and its embedded packages)
real = {}
for root in [os.path.join(src, "Assets")] + glob.glob(os.path.join(src, "Packages", "*")):
    for f in glob.glob(os.path.join(root, "**", "*"), recursive=True):
        ext = f.rsplit(".", 1)[-1]
        if ext in ("uxml", "uss", "tss", "asset", "svg") and os.path.isfile(f) and meta_guid(f):
            real.setdefault(os.path.basename(f)[: -len(ext) - 1], []).append((f, ext))

# every source asset by name, and every recovered asset by name, for references that aren't UI files (images, fonts)
def by_name(root_dirs):
    out = {}
    for d in root_dirs:
        for m in glob.glob(os.path.join(d, "**", "*.meta"), recursive=True):
            f = m[:-5]
            if os.path.isdir(f):
                continue
            g = meta_guid(f)
            if g:
                out.setdefault(os.path.basename(f), g)
    return out

src_guid_name = {}
for d in [os.path.join(src, "Assets")] + glob.glob(os.path.join(src, "Packages", "*")):
    for m in glob.glob(os.path.join(d, "**", "*.meta"), recursive=True):
        g = meta_guid(m[:-5])
        if g:
            src_guid_name[g] = os.path.basename(m[:-5])
rec_name_guid = by_name([os.path.join(proj, "Assets")])

src_fileid = {}     # source guid -> the fileID the source's own references use for it
for d in [os.path.join(src, "Assets")] + glob.glob(os.path.join(src, "Packages", "*")):
    for f in glob.glob(os.path.join(d, "**", "*"), recursive=True):
        if f.endswith((".uss", ".uxml", ".tss", ".unity", ".prefab", ".asset")) and os.path.isfile(f):
            t = open(f, errors="ignore").read()
            for fid, g in re.findall(r"fileID[=:] ?(-?\d+)(?:&amp;|&|, )guid[=:] ?([0-9a-f]{32})", t):
                src_fileid.setdefault(g, fid)

# recovered images by "safe" name: the recovery turns characters like [ ] into _ and may change the extension
IMG = (".png", ".jpg", ".jpeg", ".tga", ".psd", ".bmp")
def safe(n):
    return re.sub(r"[^A-Za-z0-9_.\- ]", "_", os.path.splitext(n)[0]).lower()
rec_img = {}
for m in glob.glob(os.path.join(proj, "Assets", "**", "*.meta"), recursive=True):
    f = m[:-5]
    if f.lower().endswith(IMG):
        g = meta_guid(f)
        if g and (safe(os.path.basename(f)) not in rec_img or "Texture2D" in f):
            rec_img[safe(os.path.basename(f))] = g
rec_imgs = set(rec_img.values())

remap = {}          # source guid -> recovered guid
retype = {}         # recovered guid -> (new main fileID, type) for references to the replaced shells
done, skipped = Counter(), []
for name, items in shells.items():
    if name not in real:
        skipped.append(name)
        continue
    for shell, fid in items:
        want = SHELL_KIND.get(fid)
        cands = [c for c in real[name] if want is None or c[1] == want] or real[name]
        sfile, ext = cands[0]
        rguid, sguid = meta_guid(shell), meta_guid(sfile)
        new = shell[:-6] + "." + ext
        os.remove(shell); os.remove(shell + ".meta")
        shutil.copy(sfile, new)
        meta = open(sfile + ".meta", errors="ignore").read()
        open(new + ".meta", "w").write(GUID.sub("guid: " + rguid, meta, count=1))
        remap[sguid] = rguid
        if ext in MAIN:
            retype[rguid] = (MAIN[ext], 3)
        elif ext != "asset" and sguid in src_fileid:
            retype[rguid] = (src_fileid[sguid], 3)
        done[ext] += 1

class _M:   # regroup: separator, fileID, joiner, guid, guid separator
    def __init__(self, m): self.m = m
    def group(self, i=0): return [self.m.group(0), self.m.group(1), self.m.group(2), self.m.group(3), self.m.group(5), self.m.group(4)][i]


# 3. other references inside the copied files (images, fonts...): same file name in the recovered project
def fix_refs(text):
    def img(m):   # url(...?fileID=N&guid=G&type=3#name) or {fileID: N, guid: G, type: 3} pointing at a source image
        sep, fid, amp, g = m.group(1), m.group(2), m.group(3), m.group(4)
        n = src_guid_name.get(g, "")
        if n.lower().endswith(IMG) and safe(n) in rec_img:
            remap[g] = rec_img[safe(n)]
            return "fileID%s2800000%sguid%s%s" % (sep, amp, m.group(5), remap[g])   # the recovered texture itself
        return m.group(0)
    text = re.sub(r"fileID([=:] ?)(-?\d+)(&amp;|&|, )guid([=:] ?)([0-9a-f]{32})",
                  lambda m: img(_M(m)), text)
    def sub(m):
        g = m.group(1)
        if g in remap:
            return m.group(0).replace(g, remap[g])
        n = src_guid_name.get(g)
        if n and n in rec_name_guid:
            remap[g] = rec_name_guid[n]
            return m.group(0).replace(g, remap[g])
        return m.group(0)
    text = re.sub(r"guid[:=] ?([0-9a-f]{32})", sub, text)
    return text

unresolved = Counter()
for f in glob.glob(os.path.join(proj, "Assets", "**", "*"), recursive=True):
    if not f.endswith((".uxml", ".uss", ".tss")) and not (f.endswith(".asset") and os.path.basename(f)[:-6] in real):
        continue
    if not os.path.isfile(f):
        continue
    t = open(f, errors="ignore").read()
    nt = fix_refs(t)
    for g in re.findall(r"guid[:=] ?([0-9a-f]{32})", nt):
        if g in src_guid_name and g not in remap.values() and g not in rec_name_guid.values() and g not in rec_imgs:
            unresolved[src_guid_name[g]] += 1
    if nt != t:
        open(f, "w").write(nt)

# 4. references from the recovered project to the replaced shells: point at the real file's main object
fixed = 0
for f in glob.glob(os.path.join(proj, "Assets", "**", "*"), recursive=True):
    if not f.endswith(TEXT) or not os.path.isfile(f):
        continue
    t = open(f, errors="ignore").read()
    def sub(m):
        g = m.group(1)
        if g in retype:
            fid, ty = retype[g]
            return "{fileID: %s, guid: %s, type: %d}" % (fid, g, ty)
        return m.group(0)
    nt = re.sub(r"\{fileID: 11400000, guid: ([0-9a-f]{32}), type: 2\}", sub, t)
    if nt != t:
        fixed += 1
        open(f, "w").write(nt)

# 5. UIDocument components the recovery left empty: copy their settings from the same scene in the source
def blocks(text):
    parts = re.split(r"(?m)^(--- !u!\d+ &-?\d+.*)$", text)
    return parts  # [head, hdr, body, hdr, body, ...]

def go_name(text, go_id):
    m = re.search(r"(?ms)^--- !u!1 &%s\b.*?m_Name: ([^\n]*)" % re.escape(go_id), text)
    return m.group(1).strip() if m else ""

docs = 0
src_scenes = {os.path.basename(p): p for p in glob.glob(os.path.join(src, "Assets", "**", "*.unity"), recursive=True)}
for scene in glob.glob(os.path.join(proj, "Assets", "**", "*.unity"), recursive=True):
    sp = src_scenes.get(os.path.basename(scene))
    if not sp:
        continue
    st = open(sp, errors="ignore").read()
    src_docs = {}
    p = blocks(st)
    for i in range(1, len(p), 2):
        body = p[i + 1]
        if "m_Script: {fileID: 19102, guid: 0000000000000000e000000000000000" in body:
            go = re.search(r"m_GameObject: \{fileID: (-?\d+)\}", body)
            fields = body.split("m_EditorClassIdentifier:", 1)[1].split("\n", 1)[1] if "m_EditorClassIdentifier:" in body else ""
            src_docs.setdefault(go_name(st, go.group(1)) if go else "", fields)
    if not src_docs:
        continue
    rt = open(scene, errors="ignore").read()
    q = blocks(rt)
    changed = False
    for i in range(1, len(q), 2):
        body = q[i + 1]
        if "m_Script: {fileID: 19102, guid: 0000000000000000e000000000000000" not in body or "sourceAsset" in body:
            continue
        go = re.search(r"m_GameObject: \{fileID: (-?\d+)\}", body)
        name = go_name(rt, go.group(1)) if go else ""
        fields = src_docs.get(name) or (list(src_docs.values())[0] if len(src_docs) == 1 else None)
        if not fields:
            continue
        fields = fix_refs(fields)
        head, _, rest = body.partition("m_EditorClassIdentifier:")
        line, _, _ = rest.partition("\n")
        q[i + 1] = head + "m_EditorClassIdentifier:" + line + "\n" + fields.rstrip("\n") + "\n"
        changed = True
        docs += 1
    if changed:
        open(scene, "w").write("".join(q))

print(f"replaced shells: {dict(done)}; not in source: {len(skipped)} ({', '.join(sorted(skipped)[:12])}...)")
print(f"files whose references were pointed at the real files: {fixed}; UIDocuments filled: {docs}")
print(f"source references still unresolved (by file name): {dict(unresolved.most_common(15))}")
