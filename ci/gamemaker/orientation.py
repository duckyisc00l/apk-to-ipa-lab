"""Print "portrait" or "landscape" from an APK's binary AndroidManifest.xml (android:screenOrientation).

Usage: python3 -I ci/gamemaker/orientation.py <AndroidManifest.xml or .apk> [game.droid / data.win]
A GameMaker game's data file doesn't say which way the phone is held (its window size can be a 100x100
placeholder that the game resizes at run time); the manifest does. If the manifest allows both (Legendary Chess:
no value, all four turned on in GameMaker's options), the shape of the data file's rooms decides. Else "unknown".
"""
import struct, sys, zipfile

SCREEN_ORIENTATION = 0x0101001E
PORTRAIT = {1, 7, 9, 12}      # portrait, sensorPortrait, reversePortrait, userPortrait
LANDSCAPE = {0, 6, 8, 11}     # landscape, sensorLandscape, reverseLandscape, userLandscape


def main(path):
    if path.endswith(".apk"):
        data = zipfile.ZipFile(path).read("AndroidManifest.xml")
    else:
        data = open(path, "rb").read()
    resmap, found = [], []
    i = 8
    while i + 8 <= len(data):
        ctype, hsize, size = struct.unpack("<HHI", data[i:i + 8])
        if size == 0:
            break
        if ctype == 0x0180:   # resource map: string index -> attribute resource id
            resmap = list(struct.unpack(f"<{(size - 8) // 4}I", data[i + 8:i + size]))
        elif ctype == 0x0102:  # start element
            start, asize, count = struct.unpack("<HHH", data[i + 24:i + 30])
            for a in range(count):
                o = i + 16 + start + a * asize
                _, name, _, _, _, typ, val = struct.unpack("<IIIHBBI", data[o:o + 20])
                if name < len(resmap) and resmap[name] == SCREEN_ORIENTATION:
                    found.append(val)
        i += size
    print(f"screenOrientation values in the manifest: {found}", file=sys.stderr)
    for v in found:
        if v in PORTRAIT:
            return "portrait"
        if v in LANDSCAPE:
            return "landscape"
    return "unknown"


def rooms(path):
    """portrait/landscape from the rooms' sizes (rooms of 200 px or less and square rooms are splash or placeholder rooms)."""
    d = open(path, "rb").read()
    i, p, l = 8, 0, 0
    while i + 8 <= len(d):
        name, size = d[i:i + 4], struct.unpack("<I", d[i + 4:i + 8])[0]
        if name == b"ROOM":
            n = struct.unpack("<I", d[i + 8:i + 12])[0]
            for k in range(n):
                o = struct.unpack("<I", d[i + 12 + 4 * k:i + 16 + 4 * k])[0]
                if not o:
                    continue
                sp, _, w, h = struct.unpack("<4I", d[o:o + 16])
                ln = struct.unpack("<I", d[sp - 4:sp])[0] if 4 <= sp < len(d) else 0
                print(f"room {d[sp:sp + ln].decode('latin1', 'replace')}: {w}x{h}", file=sys.stderr)
                if w > 200 and h > 200 and w != h:
                    p, l = p + (h > w), l + (w > h)
            break
        i += 8 + size
    return "portrait" if p > l else "landscape" if l > p else "unknown"


r = main(sys.argv[1])
if r == "unknown" and len(sys.argv) > 2:
    r = rooms(sys.argv[2])
print(r)
