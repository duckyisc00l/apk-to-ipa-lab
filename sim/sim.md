SUMMARY: PASS. launched, still running, crash reports 0, steps 5 ok / 0 failed, expects 1 passed / 0 failed

app: com.duckyisc00l.ricochlimerewrite (App)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
[x86_64:Mach-O 64-bit executable x86_64] [arm64:Mach-O 64-bit executable arm64]
ci/web2/flutter/ios/simdd/Build/Products/Release-iphonesimulator/App.app/App (for architecture x86_64):	Mach-O 64-bit executable x86_64
ci/web2/flutter/ios/simdd/Build/Products/Release-iphonesimulator/App.app/App (for architecture arm64):	Mach-O 64-bit executable arm64
com.duckyisc00l.ricochlimerewrite: 7277
launched (try 1)
## input steps
input tool: axe v2.0.4
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot 0-home
expect "Ricochlime": PASS
tapon "Play"
shot 1-play
swipe 50%,85% -> 30%,40%
shot 2-shooting
shot 3-after-shot
swipe 50%,85% -> 70%,35%
shot 4-second-turn
relaunch
tapon "Play"
shot 5-after-relaunch
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 12s
## first distinct errors (app output, then system log)
sim-console.log:2: IOSurfaceClientSetSurfaceNotify failed e00002c7
sim-applog.log:6: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices   [x2 similar]
sim-applog.log:68: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"   [x2 similar]
sim-applog.log:69: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"   [x2 similar]
sim-applog.log:72: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc   [x2 similar]
sim-applog.log:166: [com.apple.UIKit:SystemGestureGate] <0x101b0c870> Gesture: Failed to receive system gesture state notification before next touch
sim-applog.log:204: (libCoreFSCache.dylib) fopen failed for data file: errno = 2 (No such file or directory)   [x2 similar]
sim-applog.log:205: (libCoreFSCache.dylib) Errors found! Invalidating cache...   [x2 similar]
sim-applog.log:213: [com.apple.renderbox:error] building pipeline primitive_image-hia3ea2ca8feba4 took 0.646575 seconds
## last lines of the app's output
2026-11-18 13:19:24.613 App[7277:27550] void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL
IOSurfaceClientSetSurfaceNotify failed e00002c7
## app's system log (last lines, full in sim-applog.log)
2026-11-18 13:21:02.655 Df App[17234:c992] [com.apple.KeyboardArbiter:Client] handleKeyboardChange: set currentKeyboard:N (wasKeyboard:N)
2026-11-18 13:21:03.664 Df App[17234:c992] [com.apple.UIKit:KeyboardArbiterClientLog] isWritingToolsHandlingKeyboardTracking:Y (WT ready:Y, Arbiter ready:Y)
2026-11-18 13:21:03.720 Df App[17234:c992] [com.apple.network:activity] <nw_activity 50:1 [9214B53A-F177-4F73-8E58-EC2BDF46FFBD] (global parent) (reporting strategy default) complete (reason success)> complete with reason 2 (success), duration 14665ms
2026-11-18 13:21:03.720 Df App[17234:c992] [com.apple.network:activity] <nw_activity 50:2 [97EBB8F6-A132-4335-B274-83B598BE0A9D] (reporting strategy default) complete (reason success)> complete with reason 2 (success), duration 14665ms
2026-11-18 13:21:03.720 Df App[17234:c992] [com.apple.network:activity] Unsetting the global parent activity <nw_activity 50:1 [9214B53A-F177-4F73-8E58-EC2BDF46FFBD] (global parent) (reporting strategy default) complete (reason success)>
2026-11-18 13:21:03.720 Df App[17234:c992] [com.apple.network:activity] Unset the global parent activity
2026-11-18 13:21:13.466 Df App[17234:c992] (Foundation) void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL
2026-11-18 13:21:13.513 Df App[17234:c992] [com.apple.BackBoard:Display] [FBSDisplaySource 1-1] silently connecting raw configuration: <FBSDisplayConfiguration: 0x600003d3e490; Main; mode: "375x667@2x 60Hz p3 SDR">
2026-11-18 13:21:15.654 Df App[17234:c992] [com.apple.KeyboardArbiter:Client] TX focusApplication (peekAppEvent) stealKB:Y scene:com.duckyisc00l.ricochlimerewrite-default
2026-11-18 13:21:15.654 Df App[17234:c992] [com.apple.UIKit:EventDispatch] Evaluating dispatch of UIEvent: 0x600003d3e3a0; type: 0; subtype: 0; backing type: 11; shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2026-11-18 13:21:15.655 Df App[17234:c992] [com.apple.UIKit:EventDispatch] Sending UIEvent type: 0; subtype: 0; to windows: 1
2026-11-18 13:21:15.655 Df App[17234:c992] [com.apple.UIKit:EventDispatch] Sending UIEvent type: 0; subtype: 0; to window: <UIWindow: 0x10be2f5b0>; contextId: 0x98B7F0FD
2026-11-18 13:21:15.670 A  App[17234:c992] (UIKitCore) send gesture actions
2026-11-18 13:21:15.675 Df App[17234:c992] [com.apple.UIKit:EventDispatch] Evaluating dispatch of UIEvent: 0x600003d3e3a0; type: 0; subtype: 0; backing type: 11; shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2026-11-18 13:21:15.675 Df App[17234:c992] [com.apple.UIKit:EventDispatch] Sending UIEvent type: 0; subtype: 0; to windows: 1
2026-11-18 13:21:15.675 Df App[17234:c992] [com.apple.UIKit:EventDispatch] Sending UIEvent type: 0; subtype: 0; to window: <UIWindow: 0x10be2f5b0>; contextId: 0x98B7F0FD
2026-11-18 13:21:15.675 A  App[17234:c992] (UIKitCore) send gesture actions
2026-11-18 13:21:15.676 Df App[17234:c992] [com.apple.UIKit:EventDispatch] Evaluating dispatch of UIEvent: 0x600003d3e3a0; type: 0; subtype: 0; backing type: 11; shouldSend: 0; ignoreInteractionEvents: 0, systemGestureStateChange: 1
2026-11-18 13:21:15.743 A  App[17234:c992] (CoreFoundation) Updating Key-Value Observers Of Preferences
2026-11-18 13:21:15.782 Df App[17234:c992] [com.apple.FrontBoard:SceneClient] [(FBSceneManager):sceneID:com.duckyisc00l.ricochlimerewrite-default] Sending action(s): BLSInvalidateFrameSpecifiersAction
2026-11-18 13:21:16.015 Df App[17234:c992] [com.apple.xpc:connection] [0x10d12de50] activating connection: mach=true listener=false peer=false name=com.apple.metal.simulator
2026-11-18 13:21:16.024 Df App[17234:c992] [com.apple.xpc:connection] [0x10d0192a0] activating connection: mach=true listener=false peer=false name=com.apple.metal.simulator
2026-11-18 13:21:16.025 Df App[17234:c992] [com.apple.xpc:connection] [0x10bf09860] activating connection: mach=true listener=false peer=false name=com.apple.metal.simulator
2026-11-18 13:21:16.032 Df App[17234:c992] [com.apple.renderbox:misc] RBDevice: initialized bg state: false
2026-11-18 13:21:16.362 Df App[17234:c992] [com.apple.xpc:connection] [0x10d140890] activating connection: mach=true listener=false peer=false name=com.apple.IOSurface.Remote
