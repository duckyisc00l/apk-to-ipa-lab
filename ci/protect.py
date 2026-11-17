"""Skill step 1: is the app locked (packed, encrypted) before anything is promised?

Detection and honest reporting only: nothing here removes or works around a protection.
scan(root) looks at a merged, unpacked app folder (ci/unpack.py's all/) and returns a list of
{"level", "name", "evidence"} where level is:
  packed     - the real code is hidden or encrypted; conversion needs an unlocked copy
  encrypted  - the game's own data or scripts are encrypted
  integrity  - anti-tamper / integrity checks; code is still readable, but a rebuilt APK may refuse to run
Usage: python3 -I ci/protect.py <unpacked folder>
"""
import json, os, re, sys

# Library names, anchored. Each one was named in public packer write-ups; general names are avoided.
PACKER_LIBS = [
    (r"^libjiagu", "Jiagu (Qihoo 360)"),
    (r"^lib(secexe|secmain|SecShell|secpreload)\b", "Bangcle"),
    (r"^libDexHelper", "SecNeo / Bangcle DexHelper"),
    (r"^lib(exec|execmain|ijiami|ijmDataEncryption|chaosvmp)\.so$", "ijiami"),
    (r"^libshell[ax]-|^libshell[0-9]|^liblegu|^libtxAppEntry|^libtup\.so$", "Tencent Legu"),
    (r"^libmobisec", "Alibaba mobisec"),
    (r"^libnqshield", "NQ Shield"),
    (r"^lib(apssec|baiduprotect)", "Baidu protect"),
    (r"^libprotectClass", "Alibaba protect"),
    (r"^lib(kwscmm|kwscr|kiwi)", "Kiwisec"),
    (r"^lib(nesec|NetHTProtect)", "NetEase Yidun"),
    (r"^libAPKProtect", "APKProtect"),
    (r"^libuusafe", "UUSafe"),
    (r"^libcovault", "AppSealing"),
    (r"^libdexjni|^libvdog|^libddog|^libfdog", "other packer"),
]
INTEGRITY_LIBS = [
    (r"^libpairipcore", "Google Play automatic protection (pairip): some code runs in a VM"),
    (r"^libsgmain", "Alibaba security SDK"),
]
# Application / stub classes that packers put in classes.dex (dex type descriptors).
PACKER_CLASSES = [
    (b"Lcom/stub/StubApp;", "Jiagu (Qihoo 360)"),
    (b"Lcom/qihoo/util/StubApplication", "Jiagu (Qihoo 360)"),
    (b"Lcom/secneo/apkwrapper/", "SecNeo / Bangcle"),
    (b"Lcom/SecShell/SecShell/", "Bangcle"),
    (b"Lcom/bangcle/", "Bangcle"),
    (b"Lcom/tencent/StubShell/", "Tencent Legu"),
    (b"Lcom/wrapper/proxyapplication/WrapperProxyApplication", "Tencent Legu"),
    (b"Lcom/baidu/protect/", "Baidu protect"),
    (b"Lcom/ali/mobisecenhance/", "Alibaba mobisec"),
    (b"Ls/h/e/l/l/", "ijiami"),
    (b"Lcom/shell/SuperApplication;", "other packer"),
    (b"Lcom/edog/AppWrapper", "other packer"),
    (b"Lcom/kiwisec/", "Kiwisec"),
    (b"Lcom/inca/security/", "AppSealing"),
    (b"Lcom/tkyaji/cordova/DecryptResource", "Cordova encrypted web files (cordova-plugin-crypt-file)"),
]
PACKER_ASSETS = [
    (r"^assets/(libjiagu|jiagu/)", "Jiagu (Qihoo 360)"),
    (r"^assets/(secData0\.jar|bangcle|bangcleplugin/)", "Bangcle"),
    (r"^assets/(ijiami\.dat|ijm_lib/|ijiami\.ajm)", "ijiami"),
    (r"^assets/(0OO00l111l1l|o0oooOO0ooOo\.dat|tosversion|t86|libshella)", "Tencent Legu"),
    (r"^assets/(classes\d*\.(jar|dat|dex)\.enc|dexprotect)", "other packer"),
]


def walk(root):
    for d, _, fs in os.walk(root):
        for f in fs:
            yield os.path.relpath(os.path.join(d, f), root).replace(os.sep, "/")


def head(path, n=16):
    try:
        with open(path, "rb") as f:
            return f.read(n)
    except OSError:
        return b""


def scan(root):
    files = list(walk(root))
    libs = sorted({os.path.basename(f) for f in files if f.startswith("lib/") and f.endswith(".so")})
    out, seen = [], set()

    def add(level, name, evidence):
        if (level, name) not in seen:
            seen.add((level, name))
            out.append({"level": level, "name": name, "evidence": evidence})

    for lib in libs:
        for pat, name in PACKER_LIBS:
            if re.search(pat, lib):
                add("packed", name, f"lib/{lib}")
        for pat, name in INTEGRITY_LIBS:
            if re.search(pat, lib):
                add("integrity", name, f"lib/{lib}")
    for f in files:
        for pat, name in PACKER_ASSETS:
            if re.search(pat, f):
                add("packed", name, f)
    dexes = [f for f in files if re.match(r"classes\d*\.dex$", f)]
    for dx in dexes:
        try:
            data = open(os.path.join(root, dx), "rb").read()
        except OSError:
            continue
        for needle, name in PACKER_CLASSES:
            if needle in data:
                add("encrypted" if "Cordova" in name else "packed", name, f"{dx}: {needle.decode()}")
        if not data.startswith(b"dex\n"):
            add("packed", "classes.dex is not a dex file", dx)
    if not dexes and not libs and not any(f.startswith("assets/") for f in files):
        add("packed", "no classes.dex, no native libraries, no assets", "everything is packed, or not an app")
    elif not dexes and not libs:
        add("packed", "no classes.dex and no native libraries", "code is packed or missing (a split without the base?)")
    # Engine data that should have a known header
    for f in files:
        b = os.path.basename(f)
        p = os.path.join(root, f)
        if b == "global-metadata.dat" and head(p, 4) != bytes.fromhex("af1bb1fa"):
            add("encrypted", "Unity IL2CPP global-metadata.dat encrypted or changed (wrong magic)", f)
        elif b == "data.unity3d" and not head(p, 8).startswith((b"UnityFS", b"UnityWeb", b"UnityRaw")):
            add("encrypted", "Unity data.unity3d encrypted or changed (no UnityFS header)", f)
        elif b in ("game.droid", "data.win") and head(p, 4) != b"FORM":
            add("encrypted", "GameMaker data file encrypted or changed (no FORM header)", f)
        elif b.endswith(".gde"):
            add("encrypted", "Godot 3 encrypted scripts (.gde)", f)
        elif b.endswith(".pck") and head(p, 4) == b"GDPC":
            h = head(p, 24)
            ver = int.from_bytes(h[4:8], "little")
            flags = int.from_bytes(h[20:24], "little") if ver >= 2 else 0
            if flags & 1:
                add("encrypted", "Godot .pck directory encrypted", f)
    jsc = [f for f in files if f.startswith("assets/") and f.endswith(".jsc")]
    cocos = any(l.startswith("libcocos") for l in libs) or any(f.startswith("assets/jsb-adapter") or f in ("assets/main.jsc", "assets/main.js") for f in files)
    if jsc and cocos:  # Qt also ships .jsc (its compiled QML cache): only Cocos .jsc means encrypted scripts
        add("encrypted", f"Cocos scripts compiled/encrypted (.jsc x{len(jsc)}): needs the XXTEA key from the engine library", jsc[0])
    luac = [f for f in files if f.startswith("assets/") and f.endswith((".luac", ".lua"))]
    enc_lua = []
    if luac and any(l.startswith("libcocos") for l in libs):
        for f in luac[:200]:
            h = head(os.path.join(root, f), 64)
            if not h or h.startswith((b"\x1bLua", b"\x1bLJ")):
                continue
            try:
                h.decode("utf-8")
                text = b"\x00" not in h
            except UnicodeDecodeError as e:
                text = e.start >= len(h) - 4 and b"\x00" not in h  # only the last character was cut
            if not text:
                enc_lua.append(f)
        if enc_lua:
            add("encrypted", f"Cocos Lua scripts encrypted (x{len(enc_lua)}, header {head(os.path.join(root, enc_lua[0]), 8)[:8]!r})", enc_lua[0])
    return out


def summary(flags):
    return [f"{x['level']}: {x['name']} ({x['evidence']})" for x in flags]


if __name__ == "__main__":
    print(json.dumps(scan(sys.argv[1]), indent=1))
