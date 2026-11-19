SUMMARY: FAIL. launched, NOT running, crash reports 0

app: com.duckyisc00l.sakumai (HelloLua-mobile)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.sakumai: 19818
launched (try 1)
RESULT: NOT running after 60s (crashed or quit)
## first distinct errors (app output, then system log)
sim-applog.log:41: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
## last lines of the app's output
lab: EAGLContext 0x60000021a0e0
lab: running main.lua
## app's system log (last lines, full in sim-applog.log)
2026-11-19 02:39:09.585 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:KeyWindow] Scene became target of keyboard event deferring environment: UIWindowScene: 0x12907750; scene identity: com.apple.frontboard.systemappservices/FBSceneManager:sceneID%3Acom.duckyisc00l.sakumai-default
2026-11-19 02:39:09.585 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:KeyWindow] Stack[KeyWindow] 0x600000c152c0: Taking no further action for migration from LastOneWins -> SystemShellManaged as there are no scenes
2026-11-19 02:39:09.585 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:KeyWindow] Setting default evaluation strategy for UIUserInterfaceIdiomPhone to SystemShellManaged
2026-11-19 02:39:09.586 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:KeyWindow] Key window needs update: 0; currentKeyWindowScene: 0x0; evaluatedKeyWindowScene: 0x12907750; currentApplicationKeyWindow: 0x0; evaluatedApplicationKeyWindow: 0x0; reason: UIWindowScene: 0x12907750: Window scene became target of keyboard environment
2026-11-19 02:39:09.586 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:InterfaceStyle] Not push traits update to screen for new style 1, <UIWindowScene: 0x12907750> (64E15D3A-3589-419A-838F-352A088897BD)
2026-11-19 02:39:09.587 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:InterfaceStyle] Not push traits update to screen for new style 1, <UIWindowScene: 0x12907750> (64E15D3A-3589-419A-838F-352A088897BD)
2026-11-19 02:39:09.589 F  HelloLua-mobile[19818:eca6] [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
2026-11-19 02:39:09.589 A  HelloLua-mobile[19818:eca6] (libsystem_trace.dylib) Activity for state dumps
2026-11-19 02:39:09.589 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:InterfaceStyle] Not push traits update to screen for new style 1, <UIWindowScene: 0x12907750> (64E15D3A-3589-419A-838F-352A088897BD)
2026-11-19 02:39:09.590 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:AppLifecycle] sceneOfRecord: sceneID: sceneID:com.duckyisc00l.sakumai-default  persistentID: 64E15D3A-3589-419A-838F-352A088897BD
2026-11-19 02:39:09.590 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:Application] Ignoring already applied deactivation reason: 5; deactivation reasons: 1056
2026-11-19 02:39:09.590 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:Application] Deactivation reason added: 11; deactivation reasons: 1056 -> 3104; animating application lifecycle event: 1
2026-11-19 02:39:09.591 Df HelloLua-mobile[19818:eca6] [com.apple.KeyboardArbiter:Client] startConnection
2026-11-19 02:39:09.591 Df HelloLua-mobile[19818:eca6] [com.apple.xpc:connection] [0x1280b860] activating connection: mach=true listener=false peer=false name=com.apple.UIKit.KeyboardManagement.hosted
2026-11-19 02:39:10.110 Df HelloLua-mobile[19818:ecb2] [com.apple.UIKit:BackgroundTask] Ending background task with UIBackgroundTaskIdentifier: 2
2026-11-19 02:39:10.268 Df HelloLua-mobile[19818:ecb2] [com.apple.UIKit:BackgroundTask] Ending task with identifier 2 and description: <_UIBackgroundTaskInfo: 0x600001716140>: taskID = 2, taskName = Persistent SceneSession Map Update, creationTime = 941 (elapsed = 1), _expireHandler: <__NSGlobalBlock__: 0x7ff840854ae0>
2026-11-19 02:39:10.268 Df HelloLua-mobile[19818:ecb2] [com.apple.UIKit:BackgroundTask] Decrementing reference count for assertion <BKSProcessAssertion: 0x6000021026c0> (used by background task with identifier 2: <_UIBackgroundTaskInfo: 0x600001716140>: taskID = 2, taskName = Persistent SceneSession Map Update, creationTime = 941 (elapsed = 1))
2026-11-19 02:39:10.322 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:Orientation] <UIWindowScene: 0x12907750> (64E15D3A-3589-419A-838F-352A088897BD) Scene updated orientation preferences: none -> ( Ll Lr )
2026-11-19 02:39:10.323 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:KeyWindow] Key window API is scene-level: YES
2026-11-19 02:39:10.323 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:KeyWindow] UIWindowScene: 0x12907750: Window became key in scene: UIWindow: 0x10f0ba80; contextId: 0x22662136: reason: UIWindowScene: 0x12907750: Window requested to become key in scene: 0x10f0ba80
2026-11-19 02:39:10.323 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:KeyWindow] Key window needs update: 1; currentKeyWindowScene: 0x0; evaluatedKeyWindowScene: 0x12907750; currentApplicationKeyWindow: 0x0; evaluatedApplicationKeyWindow: 0x10f0ba80; reason: UIWindowScene: 0x12907750: Window requested to become key in scene: 0x10f0ba80
2026-11-19 02:39:10.323 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:KeyWindow] Window did become application key: UIWindow: 0x10f0ba80; contextId: 0x22662136; scene identity: com.apple.frontboard.systemappservices/FBSceneManager:sceneID%3Acom.duckyisc00l.sakumai-default
2026-11-19 02:39:10.323 Df HelloLua-mobile[19818:eca6] [com.apple.UIKit:EventDeferring] [0x6000029015e0] Begin local event deferring requested for token: 0x60000260e580; environments: 1; reason: UIWindowScene: 0x12907750: Begin event deferring in keyboardFocus for window: 0x10f0ba80
2026-11-19 02:39:10.326 Df HelloLua-mobile[19818:ecb2] [com.apple.BackBoard:EventDelivery] BKSHIDEventDeliveryManager - connection activation
2026-11-19 02:39:10.336 Df HelloLua-mobile[19818:ecb2] [com.apple.BackBoard:EventDelivery] policyStatus:<BKSHIDEventDeliveryPolicyObserver: 0x60000260f420; token: com.apple.frontboard.systemappservices/FBSceneManager:sceneID%3Acom.duckyisc00l.sakumai-default; status: ancestor> was:target
