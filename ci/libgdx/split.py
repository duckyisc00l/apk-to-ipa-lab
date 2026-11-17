"""Split a libGDX game's Java (from classes.dex via dex2jar) into the game's own code and its Android side.

  split.py report <apk.jar> <out.md>
      libGDX version, game packages, ApplicationListener classes (with constructors), Android launcher(s),
      and whether the code looks obfuscated (R8/ProGuard short names).
  split.py core <apk.jar> <out core.jar> <listener.txt> <maven jar>...
      Writes the game's core: every class except Android ones, the Android backend, and classes the
      maven libGDX jars of the same version already provide (they replace the APK's copies).
      listener.txt gets the main ApplicationListener class and its constructor descriptors.
"""
import re, struct, sys, zipfile
from collections import Counter

def parse(data):
    """-> (name, super, interfaces, [ (method name, descriptor) ], set of referenced class names, strings)"""
    p = 10; n = struct.unpack(">H", data[8:10])[0]; cp = [None] * n; i = 1
    while i < n:
        t = data[p]
        if t == 1:
            l = struct.unpack(">H", data[p+1:p+3])[0]; cp[i] = ("u", data[p+3:p+3+l].decode("utf-8", "replace")); p += 3 + l
        elif t in (3, 4): p += 5
        elif t in (5, 6): p += 9; i += 1
        elif t in (7, 8, 16, 19, 20): cp[i] = (t, struct.unpack(">H", data[p+1:p+3])[0]); p += 3
        elif t in (9, 10, 11, 12, 17, 18): p += 5
        elif t == 15: p += 4
        else: raise ValueError("bad constant tag %d" % t)
        i += 1
    u = lambda k: cp[k][1]
    cls = lambda k: u(cp[k][1]) if k else None
    acc, this, sup, ni = struct.unpack(">HHHH", data[p:p+8]); p += 8
    ifs = [cls(struct.unpack(">H", data[p+2*j:p+2*j+2])[0]) for j in range(ni)]; p += 2 * ni
    def members(p):
        c = struct.unpack(">H", data[p:p+2])[0]; p += 2; out = []
        for _ in range(c):
            a, nm, ds, ac = struct.unpack(">HHHH", data[p:p+8]); p += 8
            for _ in range(ac):
                p += 6 + struct.unpack(">I", data[p+2:p+6])[0]
            out.append((u(nm), u(ds), a))
        return out, p
    _, p = members(p); methods, p = members(p)
    refs = {u(e[1]) for e in cp if e and e[0] == 7}
    strs = [u(e[1]) for e in cp if e and e[0] == 8]
    return cls(this), cls(sup), ifs, methods, refs, strs

def load(jar):
    z = zipfile.ZipFile(jar); classes = {}
    for nm in z.namelist():
        if nm.endswith(".class"):
            try: c = parse(z.read(nm))
            except Exception as e: print("skip", nm, e); continue
            classes[c[0]] = (nm,) + c[1:]
    return z, classes

ANDROID = ("android/", "androidx/", "com/google/android/", "com/badlogic/gdx/backends/android/", "dalvik/")
LIBS = ("com/badlogic/", "kotlin/", "kotlinx/", "javax/", "java/", "com/google/", "com/esotericsoftware/",
        "okhttp3/", "okio/", "com/squareup/", "org/intellij/", "org/jetbrains/", "org/json/", "org/slf4j/")

def ancestors(classes, c, seen=None):
    seen = seen if seen is not None else set()
    if not c or c in seen: return seen
    seen.add(c)
    if c in classes:
        ancestors(classes, classes[c][1], seen)
        for i in classes[c][2]: ancestors(classes, i, seen)
    return seen

def analyse(classes):
    gdx_version = None
    v = classes.get("com/badlogic/gdx/Version")
    if v:
        for s in v[5]:
            if re.fullmatch(r"\d+\.\d+\.\d+(\.\d+)?", s): gdx_version = s
    game = [c for c in classes if not c.startswith(ANDROID) and not c.startswith(LIBS)]
    android_side = {c for c in classes if not c.startswith(ANDROID) and
                    any(a.startswith(ANDROID) for a in ancestors(classes, c))}
    listeners = [c for c in game if c not in android_side and "com/badlogic/gdx/ApplicationListener" in ancestors(classes, c)]
    # the main game: the listener the Android launcher creates; else one no other class extends
    launched = {r for c in android_side for r in classes[c][4]}
    extended = {classes[c][1] for c in classes}
    main = [c for c in listeners if c in launched] or [c for c in listeners if c not in extended] or listeners
    short = sum(1 for c in game if len(c.rsplit("/", 1)[-1]) <= 2)
    pk = Counter(c.rsplit("/", 1)[0] if "/" in c else "(default)" for c in game)
    return dict(gdx=gdx_version, game=game, android=sorted(android_side), listeners=listeners, main=main,
                obf=round(short / max(1, len(game)), 2), packages=pk)

def ctors(classes, c):
    return [d for (n, d, a) in classes[c][3] if n == "<init>"]

def report(jar, out):
    _, classes = load(jar); a = analyse(classes)
    L = ["# libGDX split", "", f"- classes in classes.dex: {len(classes)}", f"- libGDX version (com.badlogic.gdx.Version): {a['gdx']}",
         f"- game classes (not libGDX, Android or common libraries): {len(a['game'])}",
         f"- libGDX kept its own names (com.badlogic.gdx.Gdx present; if not, R8 renamed libGDX and the backend can't be swapped): {'com/badlogic/gdx/Gdx' in classes}",
         f"- share of game classes with 1-2 letter names (obfuscated if high): {a['obf']}",
         f"- Android-side classes (extend an Android or libGDX-Android class): {len(a['android'])}"]
    L += ["", "## Game packages"] + [f"- {p}: {n}" for p, n in a["packages"].most_common(12)]
    L += ["", "## ApplicationListener classes (main game first)"] + [f"- {c} constructors {ctors(classes, c)}" for c in a["main"]] + \
         [f"- (base) {c}" for c in a["listeners"] if c not in a["main"]]
    L += ["", "## Android side"] + [f"- {c} extends {classes[c][1]}" for c in a["android"][:30]]
    L += ["", "## Other libraries"] + [f"- {p}: {n}" for p, n in Counter("/".join(c.split("/")[:3]) for c in classes if c.startswith(LIBS)).most_common(15)]
    open(out, "w").write("\n".join(L) + "\n"); print("\n".join(L))

def core(jar, out, listener_txt, *maven):
    z, classes = load(jar); a = analyse(classes)
    provided = set()
    for m in maven:
        provided |= {n for n in zipfile.ZipFile(m).namelist() if n.endswith(".class")}
    drop = set(a["android"]); kept = 0
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as o:
        for c, info in classes.items():
            nm = info[0]
            if c.startswith(ANDROID) or c in drop or nm in provided: continue
            o.writestr(nm, z.read(nm)); kept += 1
    m = a["main"][0] if a["main"] else ""
    open(listener_txt, "w").write(m.replace("/", ".") + "\n" + "\n".join(ctors(classes, m) if m else []) + "\n")
    print(f"core: kept {kept} of {len(classes)} classes; main listener {m}; constructors {ctors(classes, m) if m else []}")

if __name__ == "__main__":
    {"report": report, "core": core}[sys.argv[1]](*sys.argv[2:])
