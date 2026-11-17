#!/usr/bin/env python3
"""Put back platform-specific code that a decompiled Unity project lost.

An APK's scripts were compiled for Android, so every `#if UNITY_ANDROID` / `UNITY_STANDALONE` / `UNITY_EDITOR`
choice was already made: the decompiled code always takes the Android branch (UltraStar Play: `IsAndroid => true`,
streaming assets read through Android's JNI). On iPhone that throws "Field currentActivity ... not found".

Open-source game: python3 -I platform_restore.py <source dir at the APK's tag> <recovered Unity project>
  copies each source file that has a platform #if over the decompiled file of the same name and class.
Closed source (no source dir: pass "-"): only lists decompiled spots that look frozen to Android, to fix by hand.
"""
import os, re, sys, shutil
PLAT = re.compile(r'^\s*#\s*(if|elif)\b.*\b(UNITY_ANDROID|UNITY_IOS|UNITY_IPHONE|UNITY_STANDALONE\w*|UNITY_EDITOR\w*|UNITY_WEBGL|PLATFORM_ANDROID)\b', re.M)
FROZEN = re.compile(r'IsAndroid\s*=>\s*true|AndroidJavaClass|AndroidJavaObject|AndroidJNI|RuntimePlatform\.Android|AndroidStreamingAssets')
SKIP = re.compile(r'/(Editor|Tests?|StreamingAssets)/')

def classes(text):
    return set(re.findall(r'\b(?:class|struct|interface|enum)\s+(\w+)', text))

def cs_files(root):
    for d, _, fs in os.walk(root):
        for f in fs:
            if f.endswith('.cs'):
                p = os.path.join(d, f)
                if not SKIP.search(p.replace(os.sep, '/')): yield p

def main():
    src, proj = sys.argv[1], sys.argv[2]
    assets = os.path.join(proj, 'Assets')
    by_name = {}
    for p in cs_files(assets): by_name.setdefault(os.path.basename(p), []).append(p)
    if src == '-':
        for name, ps in sorted(by_name.items()):
            for p in ps:
                t = open(p, errors='replace').read()
                for m in FROZEN.finditer(t):
                    print(f"{p}:{t.count(chr(10), 0, m.start()) + 1}: {m.group(0)}")
        return
    done = skipped = 0
    for p in cs_files(src):
        t = open(p, errors='replace').read()
        if not PLAT.search(t): continue
        name = os.path.basename(p); cands = by_name.get(name, [])
        cl = classes(t)
        match = [c for c in cands if classes(open(c, errors='replace').read()) & cl]
        if len(match) != 1:
            print(f"skip {name}: {len(match)} matching decompiled files"); skipped += 1; continue
        shutil.copyfile(p, match[0]); done += 1
        print(f"restored {os.path.relpath(match[0], proj)} from {os.path.relpath(p, src)}")
    print(f"platform_restore: {done} files restored, {skipped} skipped")
    # AssetRipper doesn't export StreamingAssets (on Android they sit loose in the APK's assets/ folder, outside
    # assets/bin/). Without them the game finds no themes or other loose data. Take them from the source here;
    # without source, copy the APK's assets/ minus bin/ into Assets/StreamingAssets by hand.
    sa_src = next((os.path.join(d, 'StreamingAssets') for d, ds, _ in os.walk(src)
                   if 'StreamingAssets' in ds and os.path.basename(d) == 'Assets'), None)
    sa_dst = os.path.join(assets, 'StreamingAssets')
    if sa_src and not os.path.isdir(sa_dst):
        shutil.copytree(sa_src, sa_dst)
        n = sum(len(fs) for _, _, fs in os.walk(sa_dst))
        print(f"copied StreamingAssets from the source ({n} files incl. .meta)")

if __name__ == '__main__':
    main()
