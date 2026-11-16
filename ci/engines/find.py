"""Find open-source apps per engine that publish an APK/XAPK in their GitHub releases.

Writes out/engines.md and out/engines.json: for each engine, the best few repos with
licence, stars, release tag, asset name and size. Only repos GitHub sees a licence for.
"""
import json, os, time, urllib.parse, urllib.request

TOKEN = os.environ["GH_TOKEN"]
QUERIES = {
    "godot": ["topic:godot topic:android", "godot game android apk", "topic:godot-engine topic:game"],
    "renpy": ["renpy android", "topic:renpy", "ren'py visual novel android"],
    "love2d": ["love2d android", "topic:love2d topic:game", "love2d game apk"],
    "react-native": ["topic:react-native topic:game", "react-native game android apk"],
    "flutter": ["topic:flutter topic:game", "flutter game android apk", "topic:flame-engine"],
    "capacitor": ["topic:capacitor topic:ionic android", "capacitor game android", "topic:capacitorjs"],
    "cordova": ["topic:cordova topic:game", "cordova game android apk"],
    "unreal": ["unreal engine android game", "topic:unreal-engine topic:android", "ue4 android game apk"],
    "unity-il2cpp": ["unity game android il2cpp", "topic:unity3d topic:android topic:game"],
    "gamemaker": ["gamemaker android", "topic:gamemaker-studio-2"],
    "libgdx": ["topic:libgdx topic:android topic:game"],
    "online": ["multiplayer game android client server open source apk", "topic:multiplayer topic:android topic:game"],
}


def api(path):
    for attempt in range(3):
        req = urllib.request.Request("https://api.github.com/" + path,
                                     headers={"Authorization": f"Bearer {TOKEN}", "Accept": "application/vnd.github+json"})
        try:
            with urllib.request.urlopen(req, timeout=60) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            if e.code in (403, 429):
                time.sleep(20 * (attempt + 1))
                continue
            raise
    return {}


def main():
    os.makedirs("out", exist_ok=True)
    result, md = {}, ["# Engine scout", ""]
    seen = set()
    for engine, queries in QUERIES.items():
        hits = []
        for q in queries:
            data = api("search/repositories?" + urllib.parse.urlencode({"q": q, "sort": "stars", "per_page": 15}))
            time.sleep(3)  # search API: 30 requests/minute
            for it in data.get("items", []):
                name = it["full_name"]
                lic = (it.get("license") or {}).get("spdx_id") or "none"
                if name in seen or lic in ("none", "NOASSERTION"):
                    continue
                seen.add(name)
                try:
                    rels = api(f"repos/{name}/releases?per_page=10")
                except Exception:  # noqa: BLE001
                    continue
                for rel in rels if isinstance(rels, list) else []:
                    apks = [a for a in rel.get("assets", []) if a["name"].lower().endswith((".apk", ".xapk", ".apkm", ".aab"))]
                    if apks:
                        a = min(apks, key=lambda x: (not x["name"].lower().endswith(".apk"), "arm64" not in x["name"].lower(), x["size"]))
                        hits.append({"repo": name, "license": lic, "stars": it["stargazers_count"], "tag": rel["tag_name"],
                                     "asset": a["name"], "mb": round(a["size"] / 1048576, 1), "url": a["browser_download_url"],
                                     "lang": it.get("language")})
                        break
        hits.sort(key=lambda h: -h["stars"])
        result[engine] = hits[:8]
        md += [f"## {engine}", "", "| repo | licence | stars | tag | asset | MB | lang |", "|---|---|---|---|---|---|---|"]
        md += [f"| {h['repo']} | {h['license']} | {h['stars']} | {h['tag']} | {h['asset']} | {h['mb']} | {h['lang']} |" for h in hits[:8]] or ["| none found | | | | | | |"]
        md.append("")
    json.dump(result, open("out/engines.json", "w"), indent=1)
    open("out/engines.md", "w").write("\n".join(md))
    print("\n".join(md))


if __name__ == "__main__":
    main()
