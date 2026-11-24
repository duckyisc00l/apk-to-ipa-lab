"""Find open-source apps of one engine (Kivy / Qt / NativeScript) with a released APK.
Usage: scout.py <engine> <topic-or-query> ...   Needs GH_TOKEN. Writes out/scout-<engine>.md.
Searches GitHub, downloads the smallest APK per repo (<= 60 MB), runs ci/detect.py classify, keeps matches."""
import json, os, re, subprocess, sys, tempfile, urllib.request, urllib.parse

TOKEN = os.environ["GH_TOKEN"]
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, ".."))


def api(path):
    req = urllib.request.Request("https://api.github.com/" + path, headers={"Authorization": f"Bearer {TOKEN}", "Accept": "application/vnd.github+json"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return json.load(r)


def main():
    eng, queries = sys.argv[1], sys.argv[2:]
    want = {"kivy": "Kivy", "qt": "Qt", "nativescript": "NativeScript"}[eng]
    seen, out = set(), [f"# scout {eng}", ""]
    os.makedirs("out", exist_ok=True)
    import detect
    for q in queries:
        for page in (1, 2):
            try:
                res = api("search/repositories?q=" + urllib.parse.quote(q) + f"&sort=stars&per_page=30&page={page}")["items"]
            except Exception as e:
                out.append(f"search {q}: {e}"); break
            for it in res:
                repo = it["full_name"]
                if repo in seen or not it.get("license") or it["license"]["spdx_id"] in (None, "NOASSERTION"):
                    continue
                seen.add(repo)
                try:
                    rels = api(f"repos/{repo}/releases?per_page=6")
                except Exception:
                    continue
                best = None
                for rel in rels:
                    for a in rel.get("assets", []):
                        n = a["name"].lower()
                        if n.endswith(".apk") and a["size"] <= 60e6:
                            sc = (0 if re.search(r"arm64|v8a|universal", n) or not re.search(r"x86|armeabi|v7a", n) else 1, a["size"])
                            if best is None or sc < best[0]:
                                best = (sc, rel["tag_name"], a)
                    if best: break
                if not best:
                    continue
                _, tag, a = best
                d = tempfile.mkdtemp()
                r = subprocess.run(["gh", "release", "download", tag, "-R", repo, "-p", a["name"], "-D", d], capture_output=True, text=True)
                if r.returncode: continue
                work = os.path.join(d, "w"); os.makedirs(work)
                detect.merge(os.path.join(d, a["name"]), work)
                try:
                    res2 = detect.classify(work)
                except Exception as e:
                    res2 = {"engine": f"err {e}"}
                line = f"{repo} | {it['license']['spdx_id']} | {it['stargazers_count']}* | {tag} | {a['name']} | {a['size']//1024} KB | {res2.get('engine')} {res2.get('variant','')}"
                print(line, flush=True)
                if want.lower() in str(res2.get("engine", "")).lower():
                    out.append(line)
                subprocess.run(["rm", "-rf", d])
    open(f"out/scout-{eng}.md", "w").write("\n".join(out) + "\n")


main()
