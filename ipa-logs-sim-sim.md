SUMMARY: PASS. launched, still running, crash reports 0, steps 1 ok / 0 failed, expects 0 passed / 0 failed

app: com.duckyisc00l.multiduperstopwatch (Host)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.multiduperstopwatch: 53704
launched (try 1)
## input steps
input tool: axe v2.1.1
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot 1-first-screen
tapon "Create project"
shot 2-after-tap
shot 3-later
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 40s
## first distinct errors (app output, then system log)
sim-applog.log:2: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:86: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:99: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:140: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 0 event_name: com.apple.app_launch_measurement.FirstFramePresentationMetric
sim-applog.log:142: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:143: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:392: [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.createGestureHandler ["PanGestureHandler",1,{"enabled":true,"hitSlop":{"left":0,"width":32},"activeOffsetXStart":-5,"activeOffsetXEnd":5,"failOffsetYStart":-5,"failOffsetYEnd":5}]
sim-applog.log:467: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 1 event_name: com.apple.app_launch_measurement.ExtendedLaunchMetrics
sim-applog.log:486: [com.facebook.react.log:javascript] APPLOG RNTRACE LENIENT: NativeAnimatedModule.startOperationBatch is missing on iOS, answered with a no-op function (if the app reads it as a value, add it to ANDROID_CONSTANTS)
sim-applog.log:495: [com.facebook.react.log:javascript] APPLOG RNTRACE LENIENT: NativeAnimatedModule.finishOperationBatch is missing on iOS, answered with a no-op function (if the app reads it as a value, add it to ANDROID_CONSTANTS)
## last lines of the app's output
2026-11-24 11:49:29.215 Host[53704:142966] HERMES-PRELUDE: 13501 bytes
2026-11-24 11:49:29.218 Host[53704:142966] HERMES-PRELUDE: with Reanimated
2026-11-24 11:49:29.245 Host[53704:144137] HERMES-PRELUDE: ran
## app's system log (last lines, full in sim-applog.log)
2026-11-24 11:52:14.666 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE NativeAnimatedModule.disconnectAnimatedNodes [3,2]
2026-11-24 11:52:14.666 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE NativeAnimatedModule.getValue [3,"fn"]
2026-11-24 11:52:14.666 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE NativeAnimatedModule.stopAnimation [2]
2026-11-24 11:52:14.666 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE NativeAnimatedModule.dropAnimatedNode [3]
2026-11-24 11:52:14.666 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE NativeAnimatedModule.dropAnimatedNode [2]
2026-11-24 11:52:14.666 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE NativeAnimatedModule.dropAnimatedNode [1]
2026-11-24 11:52:14.669 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE resolved NativeAnimatedModule.startOperationBatch
2026-11-24 11:52:14.669 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE resolved NativeAnimatedModule.finishOperationBatch
2026-11-24 11:52:14.671 Df Host[53704:22e76] [com.apple.UIKit:EventDispatch] Evaluating dispatch of UIEvent: 0x600003d09590; type: 0; subtype: 0; backing type: 11; shouldSend: 0; ignoreInteractionEvents: 0, systemGestureStateChange: 1
2026-11-24 11:52:14.672 A  Host[53704:22e76] (UIKitCore) send gesture actions
2026-11-24 11:52:14.672 A  Host[53704:22e76] (UIKitCore) send gesture actions
2026-11-24 11:52:14.699 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.createGestureHandler ["NativeViewGestureHandler",3,{"shouldCancelWhenOutside":false,"waitFor":[],"disallowInterruption":true}]
2026-11-24 11:52:14.699 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.attachGestureHandler [3,375,3]
2026-11-24 11:52:14.701 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.flushOperations []
2026-11-24 11:52:14.702 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.createGestureHandler ["PanGestureHandler",2,{"needsPointerData":true}]
2026-11-24 11:52:14.702 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.attachGestureHandler [2,377,1]
2026-11-24 11:52:14.712 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.updateGestureHandler [2,{"simultaneousHandlers":[],"waitFor":[],"needsPointerData":true}]
2026-11-24 11:52:14.712 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.flushOperations []
2026-11-24 11:52:14.712 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.updateGestureHandler [2,{"simultaneousHandlers":[],"waitFor":[],"needsPointerData":true}]
2026-11-24 11:52:14.713 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE RNGestureHandlerModule.flushOperations []
2026-11-24 11:52:14.713 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE cb NativeAnimatedModule.startAnimatingNode arg3 [{"finished":true}]
2026-11-24 11:52:14.714 E  Host[53704:26e42] [com.facebook.react.log:native] Unrecognized font family 'FontAwesome5_Solid'
2026-11-24 11:52:14.715 E  Host[53704:26e42] [com.facebook.react.log:native] Unrecognized font family 'FontAwesome5_Solid'
2026-11-24 11:52:14.756 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE cb NativeAnimatedModule.getValue arg1 [0.20000000298023224]
2026-11-24 11:52:14.756 E  Host[53704:23309] [com.facebook.react.log:javascript] APPLOG RNTRACE cb NativeAnimatedModule.startAnimatingNode arg3 [{"finished":false}]
