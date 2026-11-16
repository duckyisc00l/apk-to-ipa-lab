"""Add (or replace) an iOS export preset in a recovered Godot project: Xcode project only,
no signing, so the Mac runner can build an unsigned IPA with xcodebuild.

Usage: python3 ci/godot/preset.py <project dir> <major 3|4> <bundle id> <name>
"""
import os, re, sys

proj, major, bundle, name = sys.argv[1:5]
path = os.path.join(proj, "export_presets.cfg")
text = open(path).read() if os.path.exists(path) else ""
# drop any existing iOS preset (it would carry the original developer's signing settings)
blocks = re.split(r"(?=^\[preset\.\d+\]\s*$)", text, flags=re.M)
kept = []
for b in blocks:
    if b.strip() and 'platform="iOS"' not in b:
        kept.append(b)
# renumber the kept presets (each [preset.N] is followed by its [preset.N.options])
out, n, i = [], 0, 0
while i < len(kept):
    b = kept[i]
    if re.match(r"\[preset\.\d+\]", b):
        out.append(re.sub(r"\[preset\.\d+\]", f"[preset.{n}]", b, count=1))
        if i + 1 < len(kept) and re.match(r"\[preset\.\d+\.options\]", kept[i + 1]):
            out.append(re.sub(r"\[preset\.\d+\.options\]", f"[preset.{n}.options]", kept[i + 1], count=1))
            i += 1
        n += 1
    i += 1

common = f'''[preset.{n}]

name="iOS"
platform="iOS"
runnable=true
custom_features=""
export_filter="all_resources"
include_filter=""
exclude_filter=""
export_path=""

[preset.{n}.options]

'''
if major == "4":
    opts = f'''application/app_store_team_id="AAAAAAAAAA"
application/export_project_only=true
application/bundle_identifier="{bundle}"
application/name="{name}"
application/short_version="1.0"
application/version="1"
application/min_ios_version="15.0"
application/targeted_device_family=2
capabilities/access_wifi=false
'''
else:
    opts = f'''application/app_store_team_id="AAAAAAAAAA"
application/export_project_only=true
application/bundle_identifier="{bundle}"
application/name="{name}"
application/short_version="1.0"
application/version="1"
architectures/arm64=true
'''
open(path, "w").write("".join(out) + ("\n" if out else "") + common + opts)
print(f"iOS preset added as preset.{n} (Godot {major}), bundle {bundle}")
