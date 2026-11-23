#!/bin/bash
# Build a libGDX Android game for iPhone from its APK alone, keeping the game's own Java (no rewrite).
# Usage: ci/libgdx/build.sh <apk file> <unpacked apk dir> <name> <out dir>     (on a GitHub Mac)
# classes*.dex -> one jar (dex2jar) -> the game's core (Android side and libGDX's own classes dropped)
# + libGDX's iOS backend and iPhone libraries of the same libGDX version (Maven Central) + a small iOS launcher,
# compiled ahead of time for iPhone by MobiVM (RoboVM). The APK's assets/ become the app's files.
# Writes <out>/libgdx.md, <out>/sim-app/<Name>.app (iPhone Simulator) and <out>/<Name>.ipa (unsigned, arm64).
set -euo pipefail
APK="$1"; G="$(cd "$2" && pwd)"; NAME="$3"; OUT="$4"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$OUT"; OUT="$(cd "$OUT" && pwd)"; MD="$OUT/libgdx.md"
B=/tmp/gdxios; rm -rf $B; mkdir -p $B/m $B/launcher/lab $B/classes
RVM_VERSION="${RVM_VERSION:-2.3.24}"   # newest 2.3.x: works with current Xcode; libGDX backends 1.9.x-1.14.x are built on 2.3.x
MAVEN=https://repo1.maven.org/maven2

# 1. The game's Java, back from classes.dex
"$HERE/dex2jar.sh" "$G" $B/apk.jar | tee -a "$MD"
python3 "$HERE/split.py" report $B/apk.jar "$OUT/split.md" > /dev/null
V=$(sed -n 's/.*com.badlogic.gdx.Version): //p' "$OUT/split.md")
grep -q "Gdx present.*True" "$OUT/split.md" || { echo "libGDX's classes were renamed by R8/ProGuard: its backend can't be swapped; use step R" | tee -a "$MD"; exit 2; }
echo "libGDX version: $V; MobiVM $RVM_VERSION" | tee -a "$MD"

# 2. libGDX for iOS at the same version, plus the extensions whose Android libraries the APK has
get() { curl -sSfL -o "$B/m/$(basename "$1")" "$MAVEN/$1" && echo "$B/m/$(basename "$1")"; }
gdxjar() { get "com/badlogicgames/gdx/$1/$V/$1-$V$2.jar"; }
CP=""; MAVENJARS=""
add() { local j; j=$("$@") || { echo "missing on Maven: $*" | tee -a "$MD"; return 0; }; CP="$CP:$j"; MAVENJARS="$MAVENJARS $j"; }
add gdxjar gdx ""; add gdxjar gdx-backend-robovm ""; add gdxjar gdx-platform -natives-ios
libs=$(find "$G/lib" -name '*.so' -exec basename {} \; | sort -u | tr '\n' ' '); echo "Android libraries: $libs" | tee -a "$MD"
for ext in box2d freetype bullet; do
  case " $libs " in *" libgdx-$ext.so "*) add gdxjar gdx-$ext ""; add gdxjar gdx-$ext-platform -natives-ios;; esac
done
# MobiVM compiler and runtime
curl -sSfL "$MAVEN/com/mobidevelop/robovm/robovm-dist/$RVM_VERSION/robovm-dist-$RVM_VERSION.tar.gz" | tar xz -C $B
RVM=$B/robovm-$RVM_VERSION; RCP="$RVM/lib/robovm-rt.jar:$RVM/lib/robovm-objc.jar:$RVM/lib/robovm-cocoatouch.jar"

# 3. The game's core: everything but the Android side and libGDX's own classes (the Maven jars replace those)
python3 "$HERE/split.py" core $B/apk.jar $B/core.jar $B/listener.txt $MAVENJARS | tee -a "$MD"
# Java services (ServiceLoader: ktor engines, kotlinx helpers) are files in the APK's META-INF/services, not in classes.dex
SERVICES=$(python3 - "$APK" $B/core.jar <<'PY'
import sys, zipfile
apk = zipfile.ZipFile(sys.argv[1]); out = zipfile.ZipFile(sys.argv[2], "a"); have = set(out.namelist()); pats = []
for n in apk.namelist():
    if n.startswith("META-INF/services/") and not n.endswith("/") and n not in have:
        d = apk.read(n); out.writestr(n, d)
        pats += [l.split("#")[0].strip() for l in d.decode("utf-8", "replace").splitlines() if l.split("#")[0].strip()]
out.close()
print("".join(f"<pattern>{c}</pattern>" for c in sorted(set(pats))))
PY
)
echo "Java services from the APK: $(echo "$SERVICES" | grep -o '<pattern>' | wc -l | tr -d ' ') classes" | tee -a "$MD"
MAIN=$(head -1 $B/listener.txt); CTOR=$(sed -n 2p $B/listener.txt)
[ -n "$MAIN" ] || { echo "no ApplicationListener found" | tee -a "$MD"; exit 1; }

# 4. Orientation from the manifest (aapt2 from the runner's Android SDK)
AAPT2=$(ls -d "${ANDROID_HOME:-$HOME/Library/Android/sdk}"/build-tools/*/aapt2 2>/dev/null | tail -1)
o=$("$AAPT2" dump xmltree --file AndroidManifest.xml "$APK" 2>/dev/null | grep -m1 -oE 'screenOrientation[^=]*=[^ ]*' | grep -oE '[0-9]+$|landscape|portrait' | head -1 || true)
case "$o" in 0|6|8|11|landscape|sensorLandscape) LAND=true; PORT=false;; 1|7|9|12|portrait|sensorPortrait) LAND=false; PORT=true;; *) LAND=true; PORT=true;; esac
echo "orientation from manifest: '${o:-none}' -> landscape=$LAND portrait=$PORT" | tee -a "$MD"

# 5. The iOS launcher: the game's own ApplicationListener on libGDX's iOS backend (ci/libgdx/launcher.py).
# Optional per-game hook ci/libgdx/games/<name>.java: Java statements the Android launcher ran before making the game
# (read them in the decompiled Android launcher); @VERSION_NAME@ and @VERSION_CODE@ come from the manifest.
VC=$("$AAPT2" dump badging "$APK" 2>/dev/null | sed -n "s/.*versionCode='\([0-9]*\)'.*/\1/p" | head -1); VN=$("$AAPT2" dump badging "$APK" 2>/dev/null | sed -n "s/.*versionName='\([^']*\)'.*/\1/p" | head -1)
HOOK=""; if [ -f "$HERE/games/$NAME.java" ]; then sed -e "s/@VERSION_NAME@/${VN:-1.0}/g" -e "s/@VERSION_CODE@/${VC:-1}/g" "$HERE/games/$NAME.java" > $B/hook.java; HOOK=$B/hook.java; fi
echo "version: ${VN:-?} (${VC:-?})" | tee -a "$MD"
python3 "$HERE/launcher.py" $B/apk.jar $B/core.jar "$B/core.jar$CP:$RCP" $B/launcher $LAND $PORT $HOOK 2>&1 | grep -v "^Picked up" | tee -a "$MD"
[ -f $B/launcher/lab/IOSLauncher.class ] || exit 1

# 5b. Java methods MobiVM's runtime lacks (Locale.forLanguageTag ...): scan every java.*/javax.* call in the game's Java,
# point the ones lab.Compat has a stand-in for at it (ci/libgdx/compat/), list the rest in compat.md, and write the list of
# JDK calls into the app (lab-jdkrefs.txt) so the Simulator log says which ones the runtime really lacks ("lab-diag").
ASMJAR=$(get org/ow2/asm/asm/9.7/asm-9.7.jar)
mkdir -p $B/compat && javac -nowarn --release 8 -d $B/compat "$HERE/compat/lab/Compat.java" 2>&1 | grep -v "^Picked up" || true
javac -nowarn -cp "$ASMJAR:$B/compat" -d $B/compat "$HERE/compat/Rewrite.java" 2>&1 | grep -v "^Picked up" || true
java -cp "$ASMJAR:$B/compat" Rewrite "$RVM/lib/robovm-rt.jar" $B/core.jar "$OUT/compat.md" $B/jdkrefs.txt $B/core-compat.jar 2>&1 | grep -v "^Picked up" | tee -a "$MD"
head -40 "$OUT/compat.md" | tee -a "$MD"
mv $B/core-compat.jar $B/core.jar

# 6. App files: the APK's assets/ at the top of the app (where libGDX's Gdx.files.internal looks on iOS)
cp -R "$G/assets" $B/assets 2>/dev/null || mkdir -p $B/assets
cp $B/jdkrefs.txt $B/assets/lab-jdkrefs.txt
ORIENT=""
$PORT && ORIENT="$ORIENT<string>UIInterfaceOrientationPortrait</string>"
$LAND && ORIENT="$ORIENT<string>UIInterfaceOrientationLandscapeLeft</string><string>UIInterfaceOrientationLandscapeRight</string>"
cat > $B/Info.plist.xml <<X
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleDevelopmentRegion</key><string>en</string>
<key>CFBundleDisplayName</key><string>\${app.name}</string>
<key>CFBundleExecutable</key><string>\${app.executable}</string>
<key>CFBundleIdentifier</key><string>\${app.id}</string>
<key>CFBundleInfoDictionaryVersion</key><string>6.0</string>
<key>CFBundleName</key><string>\${app.name}</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleShortVersionString</key><string>\${app.version}</string>
<key>CFBundleVersion</key><string>\${app.build}</string>
<key>LSRequiresIPhoneOS</key><true/>
<key>UIStatusBarHidden</key><true/>
<key>UIViewControllerBasedStatusBarAppearance</key><false/>
<key>MinimumOSVersion</key><string>13.0</string>
<key>UIDeviceFamily</key><array><integer>1</integer><integer>2</integer></array>
<key>UIRequiredDeviceCapabilities</key><array><string>arm64</string></array>
<key>UISupportedInterfaceOrientations</key><array>$ORIENT</array>
<key>UISupportedInterfaceOrientations~ipad</key><array>$ORIENT</array>
<key>UILaunchScreen</key><dict/>
<key>UIRequiresFullScreen</key><true/>
</dict></plist>
X
PKGS=$(python3 - $B/core.jar <<'P'
import sys, zipfile, collections
c = collections.Counter("/".join(n.split("/")[:2]) for n in zipfile.ZipFile(sys.argv[1]).namelist() if n.endswith(".class") and n.count("/") >= 2
                        and not n.startswith(("androidx/", "com/google/android/")))
print("".join(f"<pattern>{p.replace('/', '.')}.**</pattern>" for p, _ in c.most_common(6)))
P
)
cat > $B/robovm.xml <<X
<config>
  <executableName>\${app.executable}</executableName>
  <mainClass>\${app.mainclass}</mainClass>
  <os>ios</os>
  <target>ios</target>
  <iosInfoPList>Info.plist.xml</iosInfoPList>
  <treeShaker>${TREESHAKER:-conservative}</treeShaker>
  <resources><resource><directory>assets</directory><skipPngCrush>true</skipPngCrush></resource></resources>
  <forceLinkClasses>
    $PKGS $SERVICES
    <pattern>com.badlogic.gdx.scenes.scene2d.ui.*</pattern>
    <pattern>com.badlogic.gdx.graphics.g3d.particles.**</pattern>
    <pattern>com.android.okhttp.HttpHandler</pattern>
    <pattern>com.android.okhttp.HttpsHandler</pattern>
    <pattern>com.android.org.conscrypt.**</pattern>
  </forceLinkClasses>
  <frameworks>
    <framework>UIKit</framework><framework>OpenGLES</framework><framework>QuartzCore</framework>
    <framework>CoreGraphics</framework><framework>OpenAL</framework><framework>AudioToolbox</framework>
    <framework>AVFoundation</framework><framework>GameController</framework>
  </frameworks>
</config>
X
BID="com.duckyisc00l.$(echo "$NAME" | tr -cd 'A-Za-z0-9' | tr A-Z a-z)"
printf 'app.version=1.0\napp.id=%s\napp.mainclass=lab.IOSLauncher\napp.executable=%s\napp.build=1\napp.name=%s\n' "$BID" "$NAME" "$NAME" > $B/robovm.properties
echo "force-linked game packages: $PKGS" >> "$MD"

# 7. Compile for the iPhone Simulator (Intel) and for iPhones (arm64, unsigned IPA)
cd $B
RCPATH="launcher:core.jar$CP:$RVM/lib/robovm-objc.jar:$RVM/lib/robovm-cocoatouch.jar"
t0=$(date +%s)
set +e
"$RVM/bin/robovm" -verbose -properties robovm.properties -config robovm.xml -os ios -arch x86_64-simulator \
  -cp "$RCPATH" -d "$OUT/sim-app/$NAME.app" > "$OUT/robovm-sim.log" 2>&1
rc=$?; echo "simulator build exit $rc in $(( $(date +%s) - t0 )) s" | tee -a "$MD"
grep -E "ERROR|Exception|error:" "$OUT/robovm-sim.log" | head -30 | tee -a "$MD"
t0=$(date +%s)
"$RVM/bin/robovm" -properties robovm.properties -config robovm.xml -os ios -arch arm64 -skipsign -createipa \
  -cp "$RCPATH" -d "$OUT/ipa" > "$OUT/robovm-ipa.log" 2>&1
rc2=$?; echo "iPhone build exit $rc2 in $(( $(date +%s) - t0 )) s" | tee -a "$MD"
grep -E "ERROR|Exception|error:" "$OUT/robovm-ipa.log" | head -30 | tee -a "$MD"
ls -la "$OUT/ipa" 2>/dev/null | tee -a "$MD"; du -sh "$OUT/sim-app/$NAME.app" | tee -a "$MD"
[ "$rc" = 0 ]
