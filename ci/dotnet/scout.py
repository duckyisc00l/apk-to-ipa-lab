"""Find the first candidate repo whose GitHub releases have an APK built with Xamarin / .NET MAUI.
Usage: GH_TOKEN=... python3 ci/dotnet/scout.py <candidates.txt> <download dir>
Prints a table to out/scout.md; writes out/picked.txt: "<repo> <tag> <apk path> <kind>".
"""
import json, os, subprocess, sys, urllib.request, zipfile, re

def api(path):
    req = urllib.request.Request("https://api.github.com/" + path, headers={
        "Authorization": "Bearer " + os.environ["GH_TOKEN"], "Accept": "application/vnd.github+json"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return json.load(r)

os.makedirs("out", exist_ok=True)
dl = sys.argv[2]; os.makedirs(dl, exist_ok=True)
rows = ["| repo | licence | release | APK | MB | kind |", "|---|---|---|---|---|---|"]
picked = None
for repo in open(sys.argv[1]):
    repo = repo.strip()
    if not repo or repo.startswith("#") or picked:
        continue
    try:
        lic = ((api(f"repos/{repo}").get("license") or {}).get("spdx_id")) or "none"
        rels = api(f"repos/{repo}/releases?per_page=15")
    except Exception as e:
        rows.append(f"| {repo} | ? | error {e} | | | |"); continue
    found = None
    for rel in rels:
        for a in rel["assets"]:
            if a["name"].lower().endswith(".apk") and a["size"] < 300 << 20:
                # prefer an arm64 or universal APK
                if not found or "arm64" in a["name"] or "universal" in a["name"].lower():
                    found = (rel["tag_name"], a)
        if found:
            break
    if not found:
        rows.append(f"| {repo} | {lic} | no APK | | | |"); continue
    tag, a = found
    p = os.path.join(dl, repo.replace("/", "__") + ".apk")
    subprocess.run(["curl", "-sSL", "--fail", "-o", p, a["browser_download_url"]])
    try:
        n = zipfile.ZipFile(p).namelist()
    except Exception as e:
        rows.append(f"| {repo} | {lic} | {tag} | {a['name']} | | bad zip |"); continue
    s = " ".join(n)
    kind = ("store v2 (.NET 9+)" if re.search(r"libassemblies\.[^ ]*\.blob\.so", s) else
            "store v1 (.NET 6-8)" if "assemblies/assemblies.blob" in s else
            "loose .so (.NET 9+)" if re.search(r"lib_[^ /]+\.dll\.so", s) else
            "loose dlls" if re.search(r"assemblies/[^ ]+\.dll", s) else "not .NET")
    rows.append(f"| {repo} | {lic} | {tag} | {a['name']} | {a['size'] >> 20} | {kind} |")
    if kind != "not .NET" and lic not in ("none", "NOASSERTION"):
        picked = f"{repo} {tag} {p} {kind.split(' (')[0].replace(' ', '_')}"
open("out/scout.md", "w").write("# Scout\n\n" + "\n".join(rows) + f"\n\npicked: {picked}\n")
print("\n".join(rows)); print("picked:", picked)
if picked:
    open("out/picked.txt", "w").write(picked + "\n")
