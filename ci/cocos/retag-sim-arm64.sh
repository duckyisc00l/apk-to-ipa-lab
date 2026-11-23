#!/bin/bash
# Same job as retag-sim.sh, for the arm64 iPhone Simulator (Apple-chip Macs): the prebuilt libraries' arm64 objects say "iPhone".
# Usage: ci/cocos/retag-sim-arm64.sh <engine dir>
set -u
for lib in $(find "$1/external" -path '*prebuilt/ios*' -name '*.a'); do
  lipo -archs "$lib" 2>/dev/null | grep -qw arm64 || continue
  t=$(mktemp -d); lipo -thin arm64 "$lib" -output "$t/x.a" 2>/dev/null || cp "$lib" "$t/x.a"
  (cd "$t" && mkdir o && cd o && ar x ../x.a 2>/dev/null)
  n=$(python3 -I "$(dirname "$0")/sim-arm64.py" "$t"/o/*.o)
  if [ "$n" -gt 0 ]; then
    members=$(ar t "$t/x.a" | grep -c '\.o$'); files=$(ls "$t"/o/*.o | wc -l | tr -d ' ')
    libtool -static -o "$t/new.a" "$t"/o/*.o 2>/dev/null
    if lipo -archs "$lib" | grep -q ' '; then lipo "$lib" -replace arm64 "$t/new.a" -output "$lib"; else cp "$t/new.a" "$lib"; fi
    echo "- arm64 simulator retag: $(basename "$lib"): $n objects (archive members $members, extracted $files)"
  fi
  rm -rf "$t"
done
