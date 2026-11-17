SUMMARY: FAIL. launched, still running, crash reports 0, steps 4 ok / 3 failed, expects 0 passed / 0 failed

app: com.duckyisc00l.flowermatch3 (FlowerMatch3)
simulator: iPhone 17 23C8F95C-765D-46A9-AE82-0BEE2921C8D7
Mach-O 64-bit executable x86_64
com.duckyisc00l.flowermatch3: 15849
launched (try 1)
## input steps
input tool: axe v2.0.4
screen: 390x844 points (steps may give X and Y in points or as 50%)
shot 0-levels
tap 10% 38%
shot 1-level-1
swipe 50%,50% -> 62%,50% FAILED: /Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/ci/sim/run.sh: line 14: 23315 Alarm clock: 14         perl -e 'alarm shift; exec @ARGV or exit 127' "$s" "$@"
shot 2-swipe-1
swipe 38%,56% -> 38%,62%
swipe 62%,44% -> 50%,44% FAILED: /Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/ci/sim/run.sh: line 14: 26572 Alarm clock: 14         perl -e 'alarm shift; exec @ARGV or exit 127' "$s" "$@"
swipe 50%,62% -> 50%,56%
shot 3-swipes-4
tap 50% 50%
tap 62% 50% FAILED: /Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/ci/sim/run.sh: line 14: 30676 Alarm clock: 14         perl -e 'alarm shift; exec @ARGV or exit 127' "$s" "$@"
shot 4-tap-pair
recording: sim-steps.mov, sim-steps.gif, sim-sheet.png (contact sheet)
## input errors (last lines)
✓ Tap at (39.0, 320.0) completed successfully
/Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/ci/sim/run.sh: line 14: 23315 Alarm clock: 14         perl -e 'alarm shift; exec @ARGV or exit 127' "$s" "$@"
/Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/ci/sim/run.sh: line 14: 26572 Alarm clock: 14         perl -e 'alarm shift; exec @ARGV or exit 127' "$s" "$@"
✓ Tap at (195.0, 422.0) completed successfully
/Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/ci/sim/run.sh: line 14: 30676 Alarm clock: 14         perl -e 'alarm shift; exec @ARGV or exit 127' "$s" "$@"
RESULT: still running after 60s
## first distinct errors (app output, then system log)
sim-console.log:3: objc[15849]: Class AKAlertImageURLProvider is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit (0x1281fcf40) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 
sim-console.log:4: objc[15849]: Class AKBiometricRatchetUtility is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit (0x1281fef48) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iO
sim-console.log:5: objc[15849]: Class UIAccessibilityLoaderWebShared is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebCore.axbundle/WebCore (0x1c528f328) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runt
## last lines of the app's output
2026-11-17 22:53:31.592 FlowerMatch3[15849:48522] Warning: Unable to create restoration in progress marker file
2026-11-17 22:53:41.186 FlowerMatch3[15849:48522] Setting up an OpenGL ES 3.0 context.
objc[15849]: Class AKAlertImageURLProvider is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit (0x1281fcf40) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/AuthKitUI.framework/AuthKitUI (0x19b659170). This may cause spurious casting failures and mysterious crashes. One of the duplicates must be removed or renamed.
objc[15849]: Class AKBiometricRatchetUtility is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit (0x1281fef48) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/AuthKitUI.framework/AuthKitUI (0x19b6591e8). This may cause spurious casting failures and mysterious crashes. One of the duplicates must be removed or renamed.
objc[15849]: Class UIAccessibilityLoaderWebShared is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebCore.axbundle/WebCore (0x1c528f328) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebKit.axbundle/WebKit (0x1c4d6f398). This may cause spurious casting failures and mysterious crashes. One of the duplicates must be removed or renamed.
## app's system log (last lines, full in sim-applog.log)
