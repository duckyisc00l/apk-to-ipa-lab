# 00-Evan/shattered-pixel-dungeon @ v4.0.2
SUMMARY: PASS. launched, still running, crash reports 0, steps 4 ok / 0 failed, expects 0 passed / 0 failed
source: /tmp/src, iOS module: ios, MobiVM 2.3.24
gradle exit 0
Note: /private/tmp/src/SPD-classes/src/main/java/com/watabou/noosa/TextInput.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
Note: /private/tmp/src/core/src/main/java/com/shatteredpixel/shatteredpixeldungeon/messages/Messages.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
classpath: 19 entries
simulator build exit 0 in 331 s
ShatteredPD.app
ShatteredPD.app.dSYM
iPhone IPA build exit 0 in 340 s
total 164024
drwxr-xr-x   5 runner  staff       160 Nov 24 11:31 .
drwxr-xr-x   8 runner  staff       256 Nov 24 11:25 ..
drwxrwxrwx  23 runner  staff       736 Nov 24 11:31 IOSLauncher.app
drwxrwxrwx   3 runner  staff        96 Nov 24 11:31 IOSLauncher.app.dSYM
-rw-rw-rw-   1 runner  staff  73509609 Nov 24 11:31 IOSLauncher.ipa
193M	/Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/out/sim-app/ShatteredPD.app

## Result (3 Mac runs)
- Run 1: built, crashed NoClassDefFoundError (project jars not built; fixed in source-build.sh).
- Run 2: title screen (sim-run2-title-with-controller-dialog.png; a controller-info dialog shows over it, some of its glyphs missing).
- Run 3: dismissed the dialog (tap 50% 60%), reached the menu, tapped the bottom button: "Choose Your Hero" screen (sim-3-tap-75.png, sim-4-tap-55.png). App still running, no crash.
