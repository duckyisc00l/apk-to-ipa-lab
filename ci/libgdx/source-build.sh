#!/bin/bash
# Build an open-source libGDX game from its own source for iPhone: use the project's own iOS module (RoboVM/MobiVM).
# Usage: ci/libgdx/source-build.sh <source dir> <name> <out dir> [ios module dir, default ios]     (on a GitHub Mac)
# Gradle compiles the game and prints the iOS module's runtime classpath; the MobiVM compiler (same one the Gradle
# plugin uses) then builds the simulator app and the unsigned IPA, with the project's own robovm.xml and Info.plist.
# Writes <out>/source.md, <out>/sim-app/<Name>.app (Simulator, x86_64) and <out>/ipa/*.ipa (arm64, unsigned).
# Env: SIM_ARCH=arm64-simulator builds the simulator app for an Apple-chip Mac (default x86_64-simulator, for GitHub's Intel Mac);
#      SKIP_IPA=1 skips the phone IPA build (saves ~6 min); PATCH=<script> runs "<script> <source dir>" before the build.
set -uo pipefail
SRC="$(cd "$1" && pwd)"; NAME="$2"; mkdir -p "$3"; OUT="$(cd "$3" && pwd)"; IOS="${4:-ios}"; MD="$OUT/source.md"
RVM_VERSION="${RVM_VERSION:-$(sed -n "s/.*robovmVersion *= *['\"]\([0-9.]*\)['\"].*/\1/p" "$SRC/build.gradle" | head -1)}"; RVM_VERSION="${RVM_VERSION:-2.3.24}"
echo "source: $SRC, iOS module: $IOS, MobiVM $RVM_VERSION" | tee "$MD"
cd "$SRC"
[ -n "${PATCH:-}" ] && { bash "$PATCH" "$SRC" 2>&1 | tee -a "$MD"; }
# 1. Gradle: compile, write robovm.properties (the module's own task), print the runtime classpath
cat > /tmp/cp.init.gradle <<'G'
allprojects { afterEvaluate { p ->
  if (p.path == System.getProperty("iosPath")) {
    p.tasks.register("labClasspath") {
      dependsOn p.tasks.named("jar"), p.configurations.runtimeClasspath   // builds the project jars (core, SPD-classes ...) too
      doLast { new File(System.getProperty("cpOut")).text = p.configurations.runtimeClasspath.files.join(":") + ":" + p.tasks.jar.archiveFile.get().asFile }
    }
  }
} }
G
export ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"; yes | "$ANDROID_HOME"/cmdline-tools/latest/bin/sdkmanager --licenses > /dev/null 2>&1 || true
chmod +x gradlew
JAVA_HOME="${GRADLE_JAVA_HOME:-$JAVA_HOME}" ./gradlew --no-daemon -q -I /tmp/cp.init.gradle -DiosPath=":$IOS" -DcpOut=/tmp/ioscp.txt ":$IOS:updateRoboVMProps" ":$IOS:labClasspath" > "$OUT/gradle.log" 2>&1
rc=$?; echo "gradle exit $rc" | tee -a "$MD"; tail -25 "$OUT/gradle.log" | tee -a "$MD" > /dev/null
[ -s /tmp/ioscp.txt ] || { tail -40 "$OUT/gradle.log"; exit 1; }
CP=$(cat /tmp/ioscp.txt); for f in $(echo "$CP" | tr ':' ' '); do [ -f "$f" ] || echo "MISSING classpath entry: $f" | tee -a "$MD"; done; echo "classpath: $(echo "$CP" | tr ':' '\n' | wc -l | tr -d ' ') entries" | tee -a "$MD"
# 2. MobiVM compiler
B=/tmp/rvm; mkdir -p $B
curl -sSfL "https://repo1.maven.org/maven2/com/mobidevelop/robovm/robovm-dist/$RVM_VERSION/robovm-dist-$RVM_VERSION.tar.gz" | tar xz -C $B
RVM=$B/robovm-$RVM_VERSION
cd "$SRC/$IOS"
cp robovm.xml /tmp/robovm.orig.xml
sed -i '' -e '/<arch>/d' robovm.xml     # the command line gives the architecture (simulator and phone)
# 3. Simulator app (Intel) and unsigned IPA (arm64)
t0=$(date +%s)
"$RVM/bin/robovm" -verbose -properties robovm.properties -config robovm.xml -os ios -arch "${SIM_ARCH:-x86_64-simulator}" \
  -cp "$CP" -d "$OUT/sim-app/$NAME.app" > "$OUT/robovm-sim.log" 2>&1
rs=$?; echo "simulator build exit $rs in $(( $(date +%s) - t0 )) s" | tee -a "$MD"
grep -E "ERROR|error:|FAILED" "$OUT/robovm-sim.log" | head -30 | tee -a "$MD"
# the compiler names the app after executableName (IOSLauncher): rename to <Name>.app if needed
ls "$OUT/sim-app" | tee -a "$MD"
[ -n "${SKIP_IPA:-}" ] && { echo "IPA build skipped" | tee -a "$MD"; [ "$rs" = 0 ]; exit; }
t0=$(date +%s)
"$RVM/bin/robovm" -properties robovm.properties -config robovm.xml -os ios -arch arm64 -skipsign -createipa \
  -cp "$CP" -d "$OUT/ipa" > "$OUT/robovm-ipa.log" 2>&1
ri=$?; echo "iPhone IPA build exit $ri in $(( $(date +%s) - t0 )) s" | tee -a "$MD"
grep -E "ERROR|error:|FAILED" "$OUT/robovm-ipa.log" | head -30 | tee -a "$MD"
ls -la "$OUT/ipa" 2>/dev/null | tee -a "$MD"; du -sh "$OUT/sim-app"/*.app 2>/dev/null | tee -a "$MD"
[ "$rs" = 0 ]
