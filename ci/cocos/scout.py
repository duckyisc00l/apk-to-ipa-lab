"""Find open-source Cocos2d-x / Cocos Creator games with an APK in their GitHub releases,
download the best few and say what is inside (engine library, version strings, script format).

Usage: python3 ci/cocos/scout.py [max downloads]   Writes out/cocos-scout.md and out/cocos-scout.json.
"""
import json, os, re, subprocess, sys, time, urllib.parse, urllib.request, zipfile

TOKEN = os.environ["GH_TOKEN"]
QUERIES = ["topic:cocos2d-x", "topic:cocos2dx", "topic:cocos-creator", "topic:cocos2d-js", "topic:cocos2dx-lua",
           "topic:cocos2d-x-lua", "topic:cocos-creator-game", "cocos2d-x game android apk", "cocos creator game apk",
           "cocos2dx lua game", "cocos2d-js game", "cocos2d-x game", "cocos creator game android", "quick-cocos2d-x"]
HERE = os.path.dirname(os.path.abspath(__file__))


def api(path):
    for attempt in range(4):
        req = urllib.request.Request("https://api.github.com/" + path,
                                     headers={"Authorization": f"Bearer {TOKEN}", "Accept": "application/vnd.github+json"})
        try:
            with urllib.request.urlopen(req, timeout=60) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            if e.code in (403, 429):
                time.sleep(20 * (attempt + 1)); continue
            if e.code == 404:
                return None
            raise
    return None


def inspect(apk):
    z = zipfile.ZipFile(apk)
    names = z.namelist()
    libs = sorted({n.split("/")[-1] for n in names if n.startswith("lib/")})
    eng = [l for l in libs if re.search(r"cocos|libgame\.so|libMyGame|libjs|lua", l, re.I)]
    exts = {}
    for n in names:
        if n.startswith("assets/"):
            e = os.path.splitext(n)[1].lower()
            exts[e] = exts.get(e, 0) + 1
    vers = set()
    so = [n for n in names if n.startswith("lib/arm64") and n.endswith(".so")] or [n for n in names if n.startswith("lib/") and n.endswith(".so")]
    for n in so:
        data = z.read(n)
        for m in re.finditer(rb"(?i)(cocos2d-x[- ]v?[0-9][0-9.]+[a-z0-9-]*|cocos2d-x-[0-9.]+|Cocos Creator v?[0-9][0-9.]+|cocos2d-js[- v]*[0-9][0-9.]+|CocosCreator[ v]*[0-9.]+)", data):
            vers.add(m.group(0).decode(errors="replace"))
        if b"xxtea" in data.lower():
            vers.add(f"{n.split('/')[-1]} mentions xxtea")
    heads = {}
    for n in names:
        if n.startswith("assets/") and n.endswith((".luac", ".jsc", ".lua", ".js")) and len(heads) < 8:
            heads[n] = z.read(n)[:16].hex()
    return {"libs": libs, "engine_libs": eng, "versions": sorted(vers)[:12], "asset_exts": dict(sorted(exts.items(), key=lambda x: -x[1])[:15]), "heads": heads}


def main():
    nmax = int(sys.argv[1]) if len(sys.argv) > 1 else 8
    os.makedirs("out", exist_ok=True); os.makedirs("dl/cocos", exist_ok=True)
    repos = {}
    for l in open(os.path.join(HERE, "candidates.txt")):
        if l.strip(): repos[l.strip()] = 0
    for q in QUERIES:
        for page in (1, 2):
            r = api("search/repositories?" + urllib.parse.urlencode({"q": q, "sort": "stars", "per_page": 100, "page": page})) or {}
            for it in r.get("items", []):
                repos[it["full_name"]] = it["stargazers_count"]
            time.sleep(3)
    hits = []
    for repo in repos:
        rels = api(f"repos/{repo}/releases?per_page=15") or []
        for rel in rels:
            a = next((a for a in rel.get("assets", []) if a["name"].lower().endswith(".apk") and a["size"] < 300e6), None)
            if a:
                info = api(f"repos/{repo}") or {}
                hits.append({"repo": repo, "stars": info.get("stargazers_count", 0), "licence": (info.get("license") or {}).get("spdx_id"),
                             "lang": info.get("language"), "tag": rel["tag_name"], "asset": a["name"], "url": a["browser_download_url"], "mb": round(a["size"] / 1e6, 1)})
                break
    hits.sort(key=lambda h: -h["stars"])
    for h in hits[:nmax * 3]:
        p = os.path.join("dl/cocos", h["repo"].replace("/", "__") + ".apk")
        if subprocess.run(["curl", "-sSL", "--fail", "-o", p, h["url"]]).returncode == 0:
            try:
                h.update(inspect(p))
            except Exception as e:  # noqa: BLE001
                h["error"] = str(e)
    json.dump(hits, open("out/cocos-scout.json", "w"), indent=1)
    with open("out/cocos-scout.md", "w") as f:
        f.write(f"# Cocos scout: {len(repos)} repos searched, {len(hits)} with an APK\n\n")
        for h in hits:
            f.write(f"- {h['repo']} ({h['stars']}*, {h['licence']}, {h['lang']}) {h['tag']} {h['asset']} {h['mb']} MB\n")
            for k in ("engine_libs", "versions", "asset_exts", "heads", "error"):
                if h.get(k): f.write(f"  - {k}: {h[k]}\n")


main()
