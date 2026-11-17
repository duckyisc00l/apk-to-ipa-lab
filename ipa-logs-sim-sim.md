SUMMARY: PASS. launched, still running, crash reports 0

app: com.duckyisc00l.rn (Host)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.rn: 63863
launched (try 1)
RESULT: still running after 40s
## first distinct errors (app output, then system log)
sim-applog.log:2: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:129: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:130: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:147: [com.facebook.react.log:native] Unable to find module for RedBox   [x68 similar]
sim-applog.log:290: [com.apple.UIKit:AssetManager] Could not load asset catalog from bundle NSBundle </Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Bundle/Application/46B7B3AA-6EC3-45C6-98A8-7A8849EBC69D/Host.app> (loaded): Error Domain=NSCocoaErrorDomain Code=260 "RunTimeThemeRefForBundleIdentifierAndName() couldn't find Assets.car in bundle with identifie
sim-applog.log:291: [com.apple.UIKit:AssetManager] Could not load asset catalog from bundle NSBundle </Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Bundle/Application/46B7B3AA-6EC3-45C6-98A8-7A8849EBC69D/Host.app/Frameworks/hermes.framework> (not yet loaded): Error Domain=NSCocoaErrorDomain Code=260 "RunTimeThemeRefForBundleIdentifierAndName() couldn't find
## last lines of the app's output
2026-11-17 19:49:33.531 Host[63863:163341] HERMES-PRELUDE: 10303 bytes
2026-11-17 19:49:33.745 Host[63863:163371] HERMES-PRELUDE: ran
## app's system log (last lines, full in sim-applog.log)
2026-11-17 19:49:34.391 E  Host[63863:27e21] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.391 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [77,[75]]
2026-11-17 19:49:34.392 E  Host[63863:27e19] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.394 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [79,"RCTView",1,{"accessibilityState":{},"accessibilityValue":{},"flex":1,"backgroundColor":-855310}]
2026-11-17 19:49:34.395 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [79,[77]]
2026-11-17 19:49:34.403 E  Host[63863:27e21] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.405 E  Host[63863:27e21] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.408 E  Host[63863:27e21] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.409 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [83,"RCTView",1,{"accessibilityState":{},"accessibilityElementsHidden":false,"accessibilityValue":{},"flex":1,"flexDirection":"column-reverse"}]
2026-11-17 19:49:34.411 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [83,[79]]
2026-11-17 19:49:34.414 E  Host[63863:27e21] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.415 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [85,"RNSScreen",1,{"gestureEnabled":false,"replaceAnimation":"push","stackPresentation":"push","swipeDirection":"horizontal","onWillDisappear":true,"onAppear":true,"onDisappear":true,"onDismissed":true,"onNativeDismissCancelled":true,"gestureResponseDistance":{"start":-1,"end":-1,"top":-1,"bottom":-1},"onTransitionProgress":true,"collapsable":false,"position":"absolute","left":0,"right":0,"top":0,
2026-11-17 19:49:34.415 E  Host[63863:27e21] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.416 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [85,[23,83]]
2026-11-17 19:49:34.420 E  Host[63863:27e19] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.420 E  Host[63863:27e19] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.420 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.manageChildren [13,[],[],[],[],[0]]
2026-11-17 19:49:34.430 E  Host[63863:27e2b] [com.facebook.react.log:javascript] RNTRACE UIManager.manageChildren [13,[],[],[85],[0],[]]
2026-11-17 19:49:34.432 E  Host[63863:27e19] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.439 E  Host[63863:27e19] [com.facebook.react.log:native] Unable to find module for RedBox
2026-11-17 19:49:34.469 Df Host[63863:27e0d] [com.apple.UIKit:AssetManager] Could not load asset catalog from bundle NSBundle </Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Bundle/Application/46B7B3AA-6EC3-45C6-98A8-7A8849EBC69D/Host.app> (loaded): Error Domain=NSCocoaErrorDomain Code=260 "RunTimeThemeRefForBundleIdentifierAndName() couldn't find Assets.car in bundle with identifier: com.duckyisc00l.rn" UserInfo={NSLocalizedDescription=RunTimeThemeRefForBundleIdentifierAndName() couldn't find Assets.car in bundle with identifier: com.duckyisc00l.rn}
2026-11-17 19:49:34.471 Df Host[63863:27e0d] [com.apple.UIKit:AssetManager] Could not load asset catalog from bundle NSBundle </Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Bundle/Application/46B7B3AA-6EC3-45C6-98A8-7A8849EBC69D/Host.app/Frameworks/hermes.framework> (not yet loaded): Error Domain=NSCocoaErrorDomain Code=260 "RunTimeThemeRefForBundleIdentifierAndName() couldn't find Assets.car in bundle with identifier: dev.hermesengine.iphonesimulator" UserInfo={NSLocalizedDescription=RunTimeThemeRefForBundleIdentifierAndName() couldn't find Assets.car in bundle with identifier: dev.hermesengine.iphonesimulator}
2026-11-17 19:49:34.490 Df Host[63863:27e0d] [com.apple.UIKit:Orientation] <UIWindowScene: 0x10c806380> (7AA25B24-5324-4F68-913A-0AD6581877F0) Scene updated orientation preferences: ( Pu Ll Lr ) -> ( Pu )
2026-11-17 19:49:34.743 A  Host[63863:27e22] (RunningBoardServices) didChangeInheritances
2026-11-17 19:49:35.023 Df Host[63863:27e0d] [com.apple.UIKit:Orientation] <UIWindowScene: 0x10c806380> (7AA25B24-5324-4F68-913A-0AD6581877F0) Scene updated orientation preferences: ( Pu ) -> ( Pu Ll Lr )
