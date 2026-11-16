"""Find APK/XAPK/APKM assets in the releases of candidate repos and download a few.

Writes out/scout.md and downloads to dl/<owner>__<repo>/<asset>.
Only repos with a licence GitHub recognises are used.
"""
import json, os, subprocess, sys, urllib.request

MAX_BYTES = 400 * 1024 * 1024
MAX_GAMES = int(os.environ.get("MAX_GAMES", "5"))
TOKEN = os.environ["GH_TOKEN"]


def api(path):
    req = urllib.request.Request(
        "https://api.github.com/" + path,
        headers={"Authorization": f"Bearer {TOKEN}", "Accept": "application/vnd.github+json"},
    )
    with urllib.request.urlopen(req, timeout=60) as r:
        return json.load(r)


def main():
    os.makedirs("out", exist_ok=True)
    os.makedirs("dl", exist_ok=True)
    lines = ["# Scout", "", "| repo | licence | release | asset | MB |", "|---|---|---|---|---|"]
    picked = []
    for repo in open(os.environ.get("CANDIDATES", "ci/candidates.txt")):
        repo = repo.strip()
        if not repo or repo.startswith("#"):
            continue
        try:
            info = api(f"repos/{repo}")
            lic = (info.get("license") or {}).get("spdx_id") or "none"
            rels = api(f"repos/{repo}/releases?per_page=20")
        except Exception as e:  # noqa: BLE001
            lines.append(f"| {repo} | ? | error: {e} | | |")
            continue
        found = None
        for rel in rels:
            for a in rel.get("assets", []):
                n = a["name"].lower()
                if n.endswith((".apk", ".xapk", ".apkm", ".apks")) and a["size"] <= MAX_BYTES:
                    found = (rel["tag_name"], a)
                    break
            if found:
                break
        if not found:
            lines.append(f"| {repo} | {lic} | no APK in releases | | |")
            continue
        tag, a = found
        mb = round(a["size"] / 1048576, 1)
        ok = lic not in ("none", "NOASSERTION")
        lines.append(f"| {repo} | {lic} | {tag} | {a['name']} | {mb} |" + ("" if ok else " (skipped: no licence)"))
        if ok and len(picked) < MAX_GAMES:
            picked.append((repo, a))
    for repo, a in picked:
        d = os.path.join("dl", repo.replace("/", "__"))
        os.makedirs(d, exist_ok=True)
        dest = os.path.join(d, a["name"])
        subprocess.run(["curl", "-sSL", "--fail", "-o", dest, a["browser_download_url"]], check=False)
        print("downloaded", dest, os.path.getsize(dest) if os.path.exists(dest) else "FAILED")
    lines += ["", f"Downloaded: {len(picked)}"]
    open("out/scout.md", "w").write("\n".join(lines) + "\n")
    print("\n".join(lines))


if __name__ == "__main__":
    sys.exit(main())
