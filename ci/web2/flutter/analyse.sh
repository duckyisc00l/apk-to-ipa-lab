#!/bin/bash
# Step R on a Flutter APK treated as closed source: what can be pulled out without the Dart source.
# Usage: ci/web2/flutter/analyse.sh <apk> <out dir>
set -u
APK="$1"; OUT="$2"; mkdir -p "$OUT" x
unzip -qo "$APK" -d x
FA=x/assets/flutter_assets
{
echo "# Flutter APK analysis"
echo "## files in flutter_assets"; (cd $FA && find . -type f | sed 's#^\./##' | sort) | head -200
echo "## AssetManifest"; [ -f $FA/AssetManifest.json ] && head -c 3000 $FA/AssetManifest.json; echo
echo "## FontManifest"; cat $FA/FontManifest.json 2>/dev/null; echo
echo "## libraries"; ls -la x/lib/arm64-v8a
echo "## Dart version (from libflutter.so)"; strings x/lib/arm64-v8a/libflutter.so | grep -m3 -E '^[23]\.[0-9]+\.[0-9]+ \(' 
echo "## snapshot hash (libapp.so)"; strings x/lib/arm64-v8a/libapp.so | grep -m1 -E '^[0-9a-f]{32}'
} > "$OUT/analysis.md" 2>&1
# assets whole (images, fonts, audio, json) for the rewrite
mkdir -p "$OUT/flutter_assets"; cp -R $FA/. "$OUT/flutter_assets/"; rm -f "$OUT/flutter_assets/NOTICES.Z" "$OUT/flutter_assets/isolate_snapshot_data" "$OUT/flutter_assets/kernel_blob.bin" "$OUT/flutter_assets/vm_snapshot_data"
# plain strings: Dart keeps string literals readable in the snapshot
strings -n 4 x/lib/arm64-v8a/libapp.so > "$OUT/libapp-strings.txt"
{
echo "## libapp.so strings: $(wc -l < "$OUT/libapp-strings.txt") total"
echo "### package: URIs (the app's own Dart files)"; grep -oE 'package:[a-z_0-9]+/[A-Za-z_0-9/]+\.dart' "$OUT/libapp-strings.txt" | sort -u | grep -vE 'package:(flutter|flame|collection|vector_math|meta|async|path|intl)/' | head -150
echo "### text that looks like UI (spaces, capital letter, no code chars)"; grep -E '^[A-Z][A-Za-z ,.!?'"'"'-]{6,80}$' "$OUT/libapp-strings.txt" | grep ' ' | sort -u | head -200
} >> "$OUT/analysis.md"
# blutter: Dart AOT analyser (recovers class, function and field names + object pool strings)
if [ "${BLUTTER:-1}" = 1 ]; then
  t0=$(date +%s)
  sudo apt-get install -y -qq python3-pyelftools python3-requests cmake ninja-build build-essential pkg-config libicu-dev libcapstone-dev > /dev/null 2>&1
  git clone -q --depth 1 https://github.com/worawit/blutter bl
  (cd bl && timeout 2400 python3 blutter.py ../x/lib/arm64-v8a ../bout) > "$OUT/blutter.log" 2>&1; echo "blutter exit $? after $(( $(date +%s) - t0 ))s" | tee -a "$OUT/analysis.md"
  if [ -d bout ]; then
    { echo "## blutter output"; (cd bout && find . -maxdepth 1 | sort; du -sh .)
      echo "### asm files (one per Dart library) of the app itself"; (cd bout/asm 2>/dev/null && find . -name '*.dart' | sort | grep -vE '^\./(flutter|flame|collection|vector_math|meta|async|path|intl|dart)/' | head -150)
      echo "### classes in the app's own libraries"; grep -rhoE '^class [A-Za-z_0-9]+[^{]*' bout/asm/$(ls bout/asm | grep -i rico | head -1) 2>/dev/null | sort -u | head -150
    } >> "$OUT/analysis.md"
    mkdir -p "$OUT/blutter"; cp bout/pp.txt bout/objs.txt "$OUT/blutter/" 2>/dev/null
    app=$(ls bout/asm | grep -i rico | head -1); [ -n "$app" ] && cp -R "bout/asm/$app" "$OUT/blutter/asm-$app"
    du -sh "$OUT/blutter" >> "$OUT/analysis.md"
  fi
fi
