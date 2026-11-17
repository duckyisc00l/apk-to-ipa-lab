SUMMARY: PASS. launched, still running, crash reports 0, steps 20 ok / 0 failed, expects 5 passed / 0 failed

app: com.duckyisc00l.twozerogame (App)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
[x86_64:Mach-O 64-bit executable x86_64] [arm64:Mach-O 64-bit executable arm64]
ci/rewrite/2048/simbuild/Build/Products/Release-iphonesimulator/App.app/App (for architecture x86_64):	Mach-O 64-bit executable x86_64
ci/rewrite/2048/simbuild/Build/Products/Release-iphonesimulator/App.app/App (for architecture arm64):	Mach-O 64-bit executable arm64
com.duckyisc00l.twozerogame: 9143
launched (try 1)
## input steps
input tool: axe v2.0.4
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot 0-start
expect "Swipe to move": PASS
swipe 50%,35% -> 50%,70%
shot 1-after-down
swipe 85%,52% -> 15%,52%
swipe 50%,70% -> 50%,35%
swipe 15%,52% -> 85%,52%
shot 2-after-four-swipes
swipe 50%,35% -> 50%,70%
swipe 85%,52% -> 15%,52%
swipe 50%,35% -> 50%,70%
swipe 15%,52% -> 85%,52%
swipe 50%,35% -> 50%,70%
swipe 85%,52% -> 15%,52%
swipe 50%,35% -> 50%,70%
swipe 15%,52% -> 85%,52%
swipe 50%,70% -> 50%,35%
swipe 85%,52% -> 15%,52%
swipe 50%,35% -> 50%,70%
swipe 15%,52% -> 85%,52%
shot 3-after-sixteen-swipes
ui board: 2048 | SCORE | 60 | HIGH SCORE | 2 | 4 | 8 | 16 | Swipe to move. 2 + 2 = 4. Reach 2048.
expect "SCORE": PASS
tap 288 164
shot 4-after-undo
tap 345 162
expect "Reset game?": PASS
shot 5-reset-dialog
tapon "Cancel"
expect "HIGH SCORE": PASS
ui before-relaunch: 2048 | SCORE | 44 | HIGH SCORE | 60 | 2 | 4 | 8 | Swipe to move. 2 + 2 = 4. Reach 2048.
relaunch
expect "HIGH SCORE": PASS
ui after-relaunch: 2048 | SCORE | 44 | HIGH SCORE | 60 | 2 | 4 | 8
shot 6-after-relaunch
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; )
RESULT: still running after 25s
## first distinct errors (app output, then system log)
sim-applog.log:5: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices   [x2 similar]
sim-applog.log:68: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"   [x2 similar]
sim-applog.log:69: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"   [x2 similar]
sim-applog.log:82: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc   [x2 similar]
sim-applog.log:629: [com.apple.UIKit:UIFocus] Failed to update focus with context <UIFocusUpdateContext: 0x60000300f3c0; previouslyFocusedItem: (nil); nextFocusedItem: (nil); focusHeading: None>. No additional info available.
sim-applog.log:778: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 0 event_name: com.apple.app_launch_measurement.FirstFramePresentationMetric
sim-applog.log:804: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 1 event_name: com.apple.app_launch_measurement.ExtendedLaunchMetrics
## last lines of the app's output
2026-11-17 23:50:45.879 App[9143:32018] void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL
## app's system log (last lines, full in sim-applog.log)
2026-11-17 23:53:04.824 Df App[23410:10038] [com.apple.UIKit:UpdateScheduler] Target list changed: <CADisplay:LCD PurpleMain>
2026-11-17 23:53:05.103 Df App[23410:10038] [com.apple.Accessibility:AXCommon] Read Per-App on Init: Smart invert = (null)
2026-11-17 23:53:05.389 Df App[23410:10038] [com.apple.UIKit:EventDeferring] [0x6000029353b0] Scene target of event deferring environments did update: scene: 0x10fc12dc0; current systemShellManagesKeyboardFocus: 1; systemShellManagesKeyboardFocusForScene: 1; eligibleForRecordRemoval: 1;
2026-11-17 23:53:05.389 Df App[23410:10038] [com.apple.UIKit:KeyWindow] Scene became target of keyboard event deferring environment: UIWindowScene: 0x10fc12dc0; scene identity: com.apple.frontboard.systemappservices/FBSceneManager:sceneID%3Acom.duckyisc00l.twozerogame-default
2026-11-17 23:53:05.391 Df App[23410:10038] [com.apple.UIKit:InterfaceStyle] Not push traits update to screen for new style 1, <UIWindowScene: 0x10fc12dc0> (9854E332-EF9A-4EFF-AC92-F37B9F8D14DB)
2026-11-17 23:53:05.393 Df App[23410:10038] [com.apple.UIKit:AppLifecycle] sceneOfRecord: sceneID: sceneID:com.duckyisc00l.twozerogame-default  persistentID: 9854E332-EF9A-4EFF-AC92-F37B9F8D14DB
2026-11-17 23:53:05.393 Df App[23410:10038] [com.apple.UIKit:Application] Deactivation reason removed: 12; deactivation reasons: 4128 -> 32; animating application lifecycle event: 1
2026-11-17 23:53:05.393 Df App[23410:10038] [com.apple.KeyboardArbiter:Client] Send setDeactivating: N (-DeactivationReason:SuspendedEventsOnly)
2026-11-17 23:53:05.394 Df App[23410:10038] [com.apple.UIKit:Application] Deactivation reason removed: 5; deactivation reasons: 32 -> 0; animating application lifecycle event: 0
2026-11-17 23:53:05.403 Df App[23410:10038] [com.apple.KeyboardArbiter:Client] startConnection
2026-11-17 23:53:05.405 Df App[23410:10038] [com.apple.xpc:connection] [0x10ff0a340] activating connection: mach=true listener=false peer=false name=com.apple.UIKit.KeyboardManagement.hosted
2026-11-17 23:53:05.406 Df App[23410:10038] [com.apple.UIKit:AppLifecycle] sceneOfRecord: sceneID: sceneID:com.duckyisc00l.twozerogame-default  persistentID: 9854E332-EF9A-4EFF-AC92-F37B9F8D14DB
2026-11-17 23:53:05.413 Df App[23410:10038] [com.apple.FrontBoard:SceneExtension] Realizing settings extension SBUISecureRenderingSettingsExtension on FBSSceneSettings
2026-11-17 23:53:05.426 Df App[23410:10038] [com.apple.UIKit:InterfaceStyle] Not push traits update to screen for new style 1, <UIWindowScene: 0x10fc12dc0> (9854E332-EF9A-4EFF-AC92-F37B9F8D14DB)
2026-11-17 23:53:05.426 Df App[23410:10038] [com.apple.UIKit:AppLifecycle] sceneOfRecord: sceneID: sceneID:com.duckyisc00l.twozerogame-default  persistentID: 9854E332-EF9A-4EFF-AC92-F37B9F8D14DB
2026-11-17 23:53:05.436 Df App[23410:10038] [com.apple.UIKit:AppLifecycle] sceneOfRecord: sceneID: sceneID:com.duckyisc00l.twozerogame-default  persistentID: 9854E332-EF9A-4EFF-AC92-F37B9F8D14DB
2026-11-17 23:53:05.449 Df App[23410:10038] [com.apple.KeyboardArbiter:Client] handleKeyboardChange: set currentKeyboard:N (wasKeyboard:N)
2026-11-17 23:53:05.456 Df App[23410:10038] [com.apple.UIKit:KeyboardArbiterClientLog] isWritingToolsHandlingKeyboardTracking:Y (WT ready:Y, Arbiter ready:Y)
2026-11-17 23:53:05.561 Df App[23410:10038] [com.apple.network:activity] <nw_activity 50:1 [0EA10DD5-A5B1-42AC-B6F2-65C64873B448] (global parent) (reporting strategy default) complete (reason success)> complete with reason 2 (success), duration 4807ms
2026-11-17 23:53:05.561 Df App[23410:10038] [com.apple.network:activity] <nw_activity 50:2 [3C83587A-6068-46DF-A4AE-3991B2B27BC3] (reporting strategy default) complete (reason success)> complete with reason 2 (success), duration 4803ms
2026-11-17 23:53:05.561 Df App[23410:10038] [com.apple.network:activity] Unsetting the global parent activity <nw_activity 50:1 [0EA10DD5-A5B1-42AC-B6F2-65C64873B448] (global parent) (reporting strategy default) complete (reason success)>
2026-11-17 23:53:05.561 Df App[23410:10038] [com.apple.network:activity] Unset the global parent activity
2026-11-17 23:53:05.561 E  App[23410:10073] [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 1 event_name: com.apple.app_launch_measurement.ExtendedLaunchMetrics
2026-11-17 23:53:06.489 Df App[23410:10038] (Foundation) void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL
2026-11-17 23:53:06.676 Df App[23410:10038] [com.apple.BackBoard:Display] [FBSDisplaySource 1-1] silently connecting raw configuration: <FBSDisplayConfiguration: 0x600003d44690; Main; mode: "375x667@2x 60Hz p3 SDR">
