"""Detection test suite: real open-source APKs from GitHub releases, one per line in apps.txt,
run through ci/unpack.py + ci/detect.py, compared with the engine the repo is known to use.

  python3 ci/detect-suite/suite.py run ci/detect-suite/apps.txt      -> out/suite.md, out/suite.json
  python3 ci/detect-suite/suite.py scout ci/detect-suite/scout.txt   -> out/scout.md (find candidates)

apps.txt: expected tags (joined with +) | owner/repo | optional asset regex | optional release tag
A row passes when every expected tag is in the detected tags. Open-source apps should carry no
"packed" or "encrypted" flag: any such flag counts as a protection false positive.
"""
import importlib.util, json, os, re, shutil, subprocess, sys, time, urllib.parse, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
TOKEN = os.environ.get("GH_TOKEN", "")
MAX_MB = int(os.environ.get("MAX_MB", "350"))


def load(name):
    spec = importlib.util.spec_from_file_location(name, os.path.join(HERE, "..", name + ".py"))
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    return m


def api(path):
    for attempt in range(4):
        req = urllib.request.Request("https://api.github.com/" + path, headers={
            "Authorization": f"Bearer {TOKEN}", "Accept": "application/vnd.github+json"})
        try:
            with urllib.request.urlopen(req, timeout=60) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            if e.code in (403, 429):
                time.sleep(20 * (attempt + 1))
                continue
            if e.code == 404:
                return None
            raise
        except OSError:
            time.sleep(5)
    return None


def pick_asset(repo, regex=None, tag=None, pages=2):
    """Newest release with an Android package; prefer arm64 or universal, then the smallest."""
    rels = []
    if tag:
        rel = api(f"repos/{repo}/releases/tags/{urllib.parse.quote(tag)}")
        rels = [rel] if rel else []
    else:
        for p in range(1, pages + 1):
            got = api(f"repos/{repo}/releases?per_page=50&page={p}") or []
            rels += got
            if len(got) < 50:
                break
    for rel in rels:
        assets = [a for a in rel.get("assets", []) if a["name"].lower().endswith((".apk", ".xapk", ".apkm", ".apks", ".aab"))
                  and a["size"] <= MAX_MB * 1024 * 1024 and (not regex or re.search(regex, a["name"], re.I))]
        if not assets:
            continue
        def score(a):
            n = a["name"].lower()
            abi = re.search(r"x86|armeabi|armv7|arm32|v7a", n)
            return (0 if re.search(r"arm64|aarch64|v8a", n) else 1 if not abi else 3 if "x86" in n else 2,
                    1 if n.endswith(".aab") else 0, 1 if "debug" in n else 0, a["size"])
        a = sorted(assets, key=score)[0]
        return {"tag": rel["tag_name"], "asset": a["name"], "url": a["browser_download_url"], "mb": round(a["size"] / 1e6, 1)}
    return None


def download(url, dest):
    r = subprocess.run(["curl", "-sSL", "--fail", "--retry", "3", "-o", dest, url], capture_output=True, text=True)
    return r.returncode == 0 and os.path.exists(dest)


def detect_one(path, work, detect):
    root = os.path.join(work, "app")
    shutil.rmtree(root, ignore_errors=True)
    t = time.time()
    notes = detect.merge(path, root)
    r = detect.classify(root)
    r["protection"] = detect.protection(root)
    r["notes"] = notes
    r["seconds"] = round(time.time() - t, 1)
    r["libs"] = r["libs"][:40]
    shutil.rmtree(root, ignore_errors=True)
    for extra in (root + ".base.apk", root + "_unpack"):
        if os.path.isdir(extra):
            shutil.rmtree(extra, ignore_errors=True)
        elif os.path.exists(extra):
            os.remove(extra)
    return r


def rows(path):
    for line in open(path, encoding="utf-8"):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        parts = [p.strip() for p in line.split("|")] + ["", "", ""]
        yield parts[0], parts[1], parts[2] or None, parts[3] or None


def run(listfile):
    detect = load("detect")
    os.makedirs("out", exist_ok=True)
    os.makedirs("dl", exist_ok=True)
    results = []
    for expected, repo, regex, tag in rows(listfile):
        exp = [t for t in expected.split("+") if t]
        row = {"repo": repo, "expected": exp}
        try:
            a = pick_asset(repo, regex, tag)
        except Exception as e:  # noqa: BLE001
            a, row["error"] = None, f"release lookup: {e}"
        if not a:
            row.setdefault("error", "no APK in releases")
            results.append(row)
            print(f"SKIP {repo}: {row['error']}", flush=True)
            continue
        row.update(a)
        dest = os.path.join("dl", repo.replace("/", "__") + "__" + a["asset"])
        if not download(a["url"], dest):
            row["error"] = "download failed"
            results.append(row)
            continue
        try:
            r = detect_one(dest, "work", detect)
        except Exception as e:  # noqa: BLE001
            row["error"] = f"detect crashed: {type(e).__name__}: {e}"
            results.append(row)
            os.remove(dest)
            continue
        os.remove(dest)
        bad = [p for p in r["protection"] if p["level"] in ("packed", "encrypted")]
        row.update(engine=r["engine"], tags=r["tags"], variant=r.get("variant", ""), route=r["route"],
                   evidence=r["evidence"], protection=r["protection"], libs=r["libs"], seconds=r["seconds"],
                   notes=r["notes"], unity_version=r.get("unity_version"), backend=r.get("backend"),
                   engine_pass=all(t in r["tags"] for t in exp), protection_fp=bool(bad))
        results.append(row)
        print(f"{'PASS' if row['engine_pass'] else 'FAIL'} {repo}: expected {expected}, got {r['tags']} {r.get('variant', '')} "
              f"prot={[p['name'] for p in r['protection']]}", flush=True)
    json.dump(results, open("out/suite.json", "w"), indent=1)
    tested = [x for x in results if "engine_pass" in x]
    ok = sum(x["engine_pass"] for x in tested)
    fp = sum(x["protection_fp"] for x in tested)
    engines = sorted({x["expected"][0] for x in tested})
    md = ["# Detection suite", "",
          f"**Engine detection: {ok}/{len(tested)} passed ({100 * ok / max(len(tested), 1):.0f}%)**, "
          f"{len(engines)} engine families. Protection false positives (packed/encrypted on open-source apps): {fp}/{len(tested)}. "
          f"Skipped (no APK or download failed): {len(results) - len(tested)}.", "",
          "| app | release / asset | MB | expected | detected engine | variant | route | evidence | protection flags | result |",
          "|---|---|---|---|---|---|---|---|---|---|"]
    for x in results:
        if "engine_pass" not in x:
            md.append(f"| {x['repo']} | {x.get('asset', '')} | {x.get('mb', '')} | {'+'.join(x['expected'])} | - | - | - | - | - | SKIP: {x.get('error')} |")
            continue
        prot = "; ".join(f"{p['level']}: {p['name']}" for p in x["protection"]) or "none"
        res = ("pass" if x["engine_pass"] else "**FAIL**") + (" / **protection FP**" if x["protection_fp"] else "")
        md.append(f"| {x['repo']} | {x['tag']} / {x['asset']} | {x['mb']} | {'+'.join(x['expected'])} | {x['engine']} | "
                  f"{x['variant']} | {x['route']['kind']} (step {x['route']['step']}) | {', '.join(x['evidence'][:4])} | {prot} | {res} |")
    open("out/suite.md", "w").write("\n".join(md) + "\n")
    print("\n".join(md[:3]))


def scout(listfile):
    """Lines: engine | GitHub search query. Lists repos with APK releases and detects up to 3 per engine."""
    detect = load("detect")
    os.makedirs("out", exist_ok=True)
    os.makedirs("dl", exist_ok=True)
    md = ["# Scout", "", "| engine | repo | licence | stars | asset | MB | detected | variant | libs |", "|---|---|---|---|---|---|---|---|---|"]
    seen = set()
    per = {}
    for engine, query, _, _ in rows(listfile):
        data = api("search/repositories?" + urllib.parse.urlencode({"q": query, "sort": "stars", "per_page": 20})) or {}
        time.sleep(3)
        for it in data.get("items", []):
            name = it["full_name"]
            lic = (it.get("license") or {}).get("spdx_id") or "none"
            if name in seen or lic in ("none", "NOASSERTION") or per.get(engine, 0) >= 4:
                continue
            seen.add(name)
            a = pick_asset(name, pages=1)
            if not a:
                continue
            dest = os.path.join("dl", name.replace("/", "__") + "__" + a["asset"])
            det, var, libs = "-", "", ""
            if a["mb"] <= 150 and download(a["url"], dest):
                try:
                    r = detect_one(dest, "work", detect)
                    det, var, libs = "+".join(r["tags"]), r.get("variant", ""), " ".join(r["libs"][:8])
                except Exception as e:  # noqa: BLE001
                    det = f"crash {e}"
                os.remove(dest)
            per[engine] = per.get(engine, 0) + 1
            md.append(f"| {engine} | {name} | {lic} | {it['stargazers_count']} | {a['tag']} / {a['asset']} | {a['mb']} | {det} | {var} | {libs} |")
            print(md[-1], flush=True)
    open("out/scout.md", "w").write("\n".join(md) + "\n")


if __name__ == "__main__":
    {"run": run, "scout": scout}[sys.argv[1]](sys.argv[2])
