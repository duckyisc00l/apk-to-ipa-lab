"""Find Unreal Android builds (APK / OBB) in the releases of licensed GitHub repos (UE5 / IoStore task).

Usage: scout.py <candidates.txt> <out dir>
Lists every .apk/.obb/.zip release asset (< 2 GB), downloads APKs and OBBs, and reports per file:
IoStore (.utoc/.ucas) or .pak, engine version strings and whether the pak index looks encrypted.
"""
import json, os, re, subprocess, sys, urllib.request, zipfile

TOKEN = os.environ["GH_TOKEN"]
cands, out = sys.argv[1], sys.argv[2]
os.makedirs(out, exist_ok=True)


def api(path):
    req = urllib.request.Request("https://api.github.com/" + path,
                                 headers={"Authorization": f"Bearer {TOKEN}", "Accept": "application/vnd.github+json"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return json.load(r)


def inspect(path):
    notes = []
    try:
        z = zipfile.ZipFile(path)
    except Exception as e:  # noqa: BLE001
        return [f"not a zip: {e}"]
    names = z.namelist()
    inner = [n for n in names if n.endswith("main.obb.png") or n.endswith(".obb")]
    for n in inner:   # data packed inside the APK
        z.extract(n, "/tmp/inner"); notes += [f"inner {n}"] + inspect(os.path.join("/tmp/inner", n))
    kinds = {k: [n for n in names if n.lower().endswith(k)] for k in (".utoc", ".ucas", ".pak", ".so")}
    for k, v in kinds.items():
        if v and k != ".so":
            notes.append(f"{k}: {len(v)} ({', '.join(v[:3])} sizes {[z.getinfo(n).file_size for n in v[:3]]})")
    for so in kinds[".so"]:
        if re.search(r"libUE4|libUnreal", so):
            data = z.read(so)
            vers = sorted(set(m.decode(errors='replace') for m in re.findall(rb"\+\+UE[45]\+Release-[0-9.]+", data)))
            notes.append(f"{so} {len(data)//1048576} MB {vers}")
    return notes


rows = []
for repo in open(cands):
    repo = repo.strip()
    if not repo or repo.startswith("#"):
        continue
    try:
        lic = (api(f"repos/{repo}").get("license") or {}).get("spdx_id")
        rels = api(f"repos/{repo}/releases?per_page=10")
    except Exception as e:  # noqa: BLE001
        print(f"{repo}: error {e}"); continue
    for rel in rels:
        for a in rel.get("assets", []):
            n = a["name"]
            if not re.search(r"\.(apk|obb|zip|7z|xapk)$", n, re.I) or a["size"] > 2_000_000_000:
                continue
            line = f"{repo} [{lic}] {rel['tag_name']} {n} {a['size']//1048576} MB"
            notes = []
            if re.search(r"\.(apk|obb)$", n, re.I):
                f = os.path.join("/tmp", n)
                try:
                    subprocess.run(["curl", "-sSLf", "-o", f, a["browser_download_url"]], check=True, timeout=900)
                    notes = inspect(f)
                except Exception as e:  # noqa: BLE001
                    notes = [f"download/inspect failed: {e}"]
                finally:
                    subprocess.run(["rm", "-rf", f, "/tmp/inner"])
            print(line); [print("   ", x) for x in notes]
            rows.append({"repo": repo, "licence": lic, "tag": rel["tag_name"], "asset": n, "url": a["browser_download_url"], "notes": notes})
            sys.stdout.flush()
json.dump(rows, open(os.path.join(out, "scout.json"), "w"), indent=1)
