#!/bin/bash
# Run an iPhone app in Apple's iPhone Simulator on a GitHub Mac (there are no real iPhones on GitHub).
# Usage: ci/sim/run.sh <path to .app built for the simulator> <out dir> [seconds to wait, default 25] [input script]
# The optional input script has one step per line, coordinates in points on the simulated phone:
#   tap X Y | swipe X1 Y1 X2 Y2 | wait SECONDS | shot NAME      (uses Meta's idb, installed when needed)
# Writes <out>/sim.md (launched? still running? crash?), <out>/sim-<n>s.png screenshots, <out>/sim-console.log,
# and any crash report. Exit 0 only if the app is still running at the end.
set -u
APP="$1"; OUT="$2"; WAIT="${3:-25}"; STEPS="${4:-}"
mkdir -p "$OUT"
BID=$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "$APP/Info.plist")
EXE=$(/usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "$APP/Info.plist")
# newest iOS runtime, first iPhone on it
UDID=$(xcrun simctl list devices available -j | python3 -c "
import json,sys,re
d=json.load(sys.stdin)['devices']
rts=sorted([k for k in d if 'iOS' in k], key=lambda k:[int(x) for x in re.findall(r'\d+',k)])
for rt in reversed(rts):
    ph=[x for x in d[rt] if x['name'].startswith('iPhone')]
    if ph: print(ph[-1]['udid']); break")
NAME=$(xcrun simctl list devices | grep "$UDID" | head -1 | sed 's/ (.*//' | xargs)
{ echo "app: $BID ($EXE)"; echo "simulator: $NAME $UDID"; file "$APP/$EXE" | sed 's/.*: //'; } | tee "$OUT/sim.md"
xcrun simctl boot "$UDID" 2>/dev/null; xcrun simctl bootstatus "$UDID" -b > /dev/null
xcrun simctl install "$UDID" "$APP" || { echo "INSTALL FAILED" | tee -a "$OUT/sim.md"; exit 1; }
before=$(date +%s)
xcrun simctl launch --terminate-running-process --stdout="$OUT/sim-console.log" --stderr="$OUT/sim-console.log" "$UDID" "$BID" 2>&1 | tee -a "$OUT/sim.md"
for t in 5 $WAIT; do
  sleep $(( t == 5 ? 5 : WAIT - 5 ))
  xcrun simctl io "$UDID" screenshot "$OUT/sim-${t}s.png" > /dev/null 2>&1
done
if [ -n "$STEPS" ] && [ -f "$STEPS" ]; then
  if ! command -v idb > /dev/null; then
    brew tap facebook/fb > /dev/null 2>&1; brew install idb-companion > /dev/null 2>&1
    python3 -m pip install -q --break-system-packages fb-idb 2>/dev/null || python3 -m pip install -q fb-idb
  fi
  idb connect "$UDID" > /dev/null 2>&1
  echo "## input steps" >> "$OUT/sim.md"
  while read -r cmd a b c d; do
    case "$cmd" in
      tap) idb ui tap --udid "$UDID" "$a" "$b" && echo "tap $a $b" >> "$OUT/sim.md";;
      swipe) idb ui swipe --udid "$UDID" "$a" "$b" "$c" "$d" --duration 0.2 && echo "swipe $a,$b -> $c,$d" >> "$OUT/sim.md";;
      wait) sleep "$a";;
      shot) xcrun simctl io "$UDID" screenshot "$OUT/sim-$a.png" > /dev/null 2>&1 && echo "shot $a" >> "$OUT/sim.md";;
    esac
  done < "$STEPS"
fi
if xcrun simctl spawn "$UDID" launchctl list 2>/dev/null | grep -q "UIKitApplication:$BID"; then
  echo "RESULT: still running after ${WAIT}s" | tee -a "$OUT/sim.md"; ok=0
else
  echo "RESULT: NOT running after ${WAIT}s (crashed or quit)" | tee -a "$OUT/sim.md"; ok=1
fi
# crash reports written since launch
for f in $(find ~/Library/Logs/DiagnosticReports -name "*.ips" -newermt "@$before" 2>/dev/null | grep -i "$EXE"); do
  cp "$f" "$OUT/"; echo "## crash report $(basename "$f")" >> "$OUT/sim.md"
  python3 - "$f" >> "$OUT/sim.md" <<'P'
import json,sys
t=open(sys.argv[1]).read().split('\n',1)
try:
    d=json.loads(t[1]); e=d.get('exception',{}); print('exception:',e.get('type'),e.get('signal'),d.get('termination',{}).get('indicator'))
    th=[x for x in d.get('threads',[]) if x.get('triggered')]
    imgs=d.get('usedImages',[])
    for fr in (th[0]['frames'][:15] if th else []):
        im=imgs[fr['imageIndex']]['name'] if fr.get('imageIndex') is not None and fr['imageIndex']<len(imgs) else '?'
        print('  ',im,fr.get('symbol','?'))
    if d.get('asi'): print('asi:',d['asi'])
except Exception as x: print('could not read report:',x)
P
done
tail -40 "$OUT/sim-console.log" >> "$OUT/sim.md" 2>/dev/null
exit $ok
