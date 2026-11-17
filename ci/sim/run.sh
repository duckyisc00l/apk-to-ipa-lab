#!/bin/bash
# Run an iPhone app in Apple's iPhone Simulator on a GitHub Mac (there are no real iPhones on GitHub).
# Usage: ci/sim/run.sh <path to .app built for the simulator> <out dir> [seconds to wait, default 25] [input script]
# The optional input script has one step per line, coordinates in points on the simulated phone:
#   tap X Y | swipe X1 Y1 X2 Y2 | wait SECONDS | shot NAME      (uses Meta's idb, installed when needed)
# Writes <out>/sim.md (launched? still running? crash?), <out>/sim-<n>s.png screenshots, <out>/sim-console.log,
# and any crash report. Exit 0 only if the app is still running at the end.
set -u
# macOS may not have GNU timeout: fall back to perl's alarm (same "timeout SECONDS command..." usage)
command -v timeout > /dev/null || timeout() { local s="$1"; shift; perl -e 'alarm shift; exec @ARGV or exit 127' "$s" "$@"; }
APP="$1"; OUT="$2"; WAIT="${3:-25}"; STEPS="${4:-}"
mkdir -p "$OUT"; OUT=$(cd "$OUT" && pwd)   # absolute: the simulator opens --stdout paths from its own folder
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
# The simulator refuses to open a completely unsigned app ("denied by service delegate (SBMainWorkspace)"):
# give it a free local ad-hoc signature (frameworks first, then the app). This changes nothing on a phone build.
find "$APP" -depth \( -name '*.framework' -o -name '*.dylib' -o -name '*.appex' \) -exec codesign --force --sign - --timestamp=none {} \; 2>/dev/null
codesign --force --sign - --timestamp=none "$APP" 2>&1 | tail -1
xcrun simctl boot "$UDID" 2>/dev/null; xcrun simctl bootstatus "$UDID" -b > /dev/null
export SIMCTL_CHILD_NSUnbufferedIO=YES   # passed to the app: Foundation output not held back
sleep 15   # let the home screen finish starting, or the first launch is refused too
xcrun simctl install "$UDID" "$APP" || { echo "INSTALL FAILED" | tee -a "$OUT/sim.md"; exit 1; }
before=$(date +%s)
for try in 1 2 3; do
  if [ "$try" = 1 ]; then args=(--terminate-running-process --stdout="$OUT/sim-console.log" --stderr="$OUT/sim-console.log")
  else args=(--terminate-running-process); fi   # later tries: plain launch, in case the redirect is what's refused
  if timeout 150 xcrun simctl launch "${args[@]}" "$UDID" "$BID" >> "$OUT/sim.md" 2>&1; then
    echo "launched (try $try)" | tee -a "$OUT/sim.md"; break
  fi
  # a heavy app (Unity) can keep the launch command waiting past the time limit while it is in fact up
  if xcrun simctl spawn "$UDID" launchctl list 2>/dev/null | grep -q "UIKitApplication:$BID"; then
    echo "launched (try $try; the launch command was slow, but the app is running)" | tee -a "$OUT/sim.md"; break
  fi
  echo "launch refused (try $try)" | tee -a "$OUT/sim.md"; sleep 10
  if [ "$try" = 3 ]; then   # why: SpringBoard's own log lines about this app
    echo "## simulator log about the launch" >> "$OUT/sim.md"
    timeout 120 xcrun simctl spawn "$UDID" log show --last 3m --style compact \
      --predicate "eventMessage CONTAINS[c] '$BID' OR eventMessage CONTAINS[c] '$EXE'" 2>/dev/null | grep -viE "^Timestamp" | tail -40 >> "$OUT/sim.md"
  fi
done
prev=0   # screenshots at 5 s, halfway and at the end
for t in 5 $(( WAIT / 2 )) $WAIT; do
  [ "$t" -gt "$prev" ] || continue; sleep $(( t - prev )); prev=$t
  xcrun simctl io "$UDID" screenshot "$OUT/sim-${t}s.png" > /dev/null 2>&1
done
if [ -n "$STEPS" ] && [ -f "$STEPS" ]; then
  if ! command -v idb > /dev/null; then   # at most 8 minutes; without it the steps are skipped
    timeout 420 bash -c 'brew tap facebook/fb; brew install idb-companion' > "$OUT/idb-install.log" 2>&1
    timeout 120 bash -c 'python3 -m pip install --break-system-packages fb-idb || python3 -m pip install --user fb-idb' >> "$OUT/idb-install.log" 2>&1
    export PATH="$PATH:$(python3 -m site --user-base 2>/dev/null)/bin:$(python3 -c 'import sysconfig;print(sysconfig.get_path("scripts"))' 2>/dev/null)"
    command -v idb > /dev/null || { echo "idb install failed:" >> "$OUT/sim.md"; tail -8 "$OUT/idb-install.log" >> "$OUT/sim.md"; }
  fi
  command -v idb > /dev/null || echo "idb not available: input steps skipped" >> "$OUT/sim.md"
  timeout 60 idb connect "$UDID" > /dev/null 2>&1
  echo "## input steps" >> "$OUT/sim.md"
  while read -r cmd a b c d; do
    case "$cmd" in
      tap) timeout 30 idb ui tap --udid "$UDID" "$a" "$b" && echo "tap $a $b" >> "$OUT/sim.md";;
      swipe) timeout 30 idb ui swipe --udid "$UDID" "$a" "$b" "$c" "$d" --duration 0.2 && echo "swipe $a,$b -> $c,$d" >> "$OUT/sim.md";;
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
# the first distinct errors (with the line after each) say more than the last ones, which often just repeat
echo "## first distinct errors in the app's output" >> "$OUT/sim.md"
grep -n -iE 'exception|error|fail|missing|not found|could not|unable' "$OUT/sim-console.log" 2>/dev/null | grep -viE 'restoration' \
  | awk -F: '{k=$0; sub(/^[0-9]+:/,"",k); if(!(k in s)){s[k]=1; print; if(++n>=25) exit}}' >> "$OUT/sim.md"
echo "## last lines of the app's output" >> "$OUT/sim.md"
tail -40 "$OUT/sim-console.log" >> "$OUT/sim.md" 2>/dev/null
# engines that log through Apple's system log (Godot, Unity, SDL) don't show in the console file: save that log too
timeout 120 xcrun simctl spawn "$UDID" log show --start "$(date -r "$before" '+%Y-%m-%d %H:%M:%S')" --style compact \
  --predicate "process == '$EXE'" 2>/dev/null | grep -viE '^Timestamp|restoration' | tail -300 > "$OUT/sim-applog.log"
echo "## app's system log (last lines, full in sim-applog.log)" >> "$OUT/sim.md"; tail -25 "$OUT/sim-applog.log" >> "$OUT/sim.md"
exit $ok
