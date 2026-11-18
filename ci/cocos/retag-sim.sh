#!/bin/bash
# Old Cocos2d-x prebuilt iOS libraries (LuaJIT in v3-deps) have an x86_64 slice whose objects are marked macOS.
# Xcode 15+ refuses them for the iPhone Simulator. Mark those objects iOS (simulator) with minos-ios.py: vtool has no room to add a load command in them.
# Usage: ci/cocos/retag-sim.sh <engine dir>
set -u
for lib in $(find "$1/external" -path '*prebuilt/ios*' -name '*.a'); do
  lipo -archs "$lib" 2>/dev/null | grep -qw x86_64 || continue
  t=$(mktemp -d); lipo -thin x86_64 "$lib" -output "$t/x.a" 2>/dev/null || cp "$lib" "$t/x.a"
  (cd "$t" && mkdir o && cd o && ar x ../x.a 2>/dev/null)
  n=$(python3 -I "$(dirname "$0")/minos-ios.py" "$t"/o/*.o); bad=0
  if [ $n -gt 0 ]; then
    members=$(ar t "$t/x.a" | grep -c '\.o$'); files=$(ls "$t"/o/*.o | wc -l | tr -d ' ')
    libtool -static -o "$t/new.a" "$t"/o/*.o 2>/dev/null
    if lipo -archs "$lib" | grep -q ' '; then lipo "$lib" -replace x86_64 "$t/new.a" -output "$lib"; else cp "$t/new.a" "$lib"; fi
    echo "- simulator retag: $(basename "$lib"): $n objects marked iOS simulator, $bad failed (archive members $members, extracted $files)"
  fi
  rm -rf "$t"
done
