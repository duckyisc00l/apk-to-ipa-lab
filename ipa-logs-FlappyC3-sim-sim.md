SUMMARY: PASS. launched, still running, crash reports 0, steps 7 ok / 0 failed, expects 0 passed / 0 failed

app: com.duckyisc00l.flappyc3 (App)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
[x86_64:Mach-O 64-bit executable x86_64] [arm64:Mach-O 64-bit executable arm64]
proj/simdd/Build/Products/Release-iphonesimulator/App.app/App (for architecture x86_64):	Mach-O 64-bit executable x86_64
proj/simdd/Build/Products/Release-iphonesimulator/App.app/App (for architecture arm64):	Mach-O 64-bit executable arm64
com.duckyisc00l.flappyc3: 23392
launched (try 1)
## input steps
input tool: axe 1.6.0
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot 0-start
hold 50% 50% 0.15s
shot 1-after-tap
hold 50% 50% 0.15s
hold 50% 50% 0.15s
hold 50% 50% 0.15s
hold 50% 50% 0.15s
shot 2-flapping
hold 50% 50% 0.15s
hold 50% 50% 0.15s
shot 3-later
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 20s
## first distinct errors (app output, then system log)
sim-applog.log:6: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:162: [com.apple.extensionkit:default] Failed to resolve host network app id to config: bundleID: com.apple.WebKit.Networking instance ID: Optional([_EXExtensionInstanceIdentifier: 59492EBE-B615-40F7-957D-9887C0C0FB9E])
sim-applog.log:246: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:247: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:340: [com.apple.WebKit:ResourceLoadStatistics] Failed to request storage access quirks from WebPrivacy.
sim-applog.log:341: [com.apple.WebKit:ResourceLoadStatistics] Failed to request known fingerprinting scripts from WebPrivacy: Error Domain=WebPrivacyErrorDomain Code=1001 "List data not found" UserInfo={NSLocalizedDescription=List data not found}
sim-applog.log:342: [com.apple.WebKit:ResourceLoadStatistics] Failed to request storage access user agent string quirks from WebPrivacy.
sim-applog.log:359: [com.apple.xpc:connection] [0x109e10d90] Re-initialization successful; calling out to event handler with XPC_ERROR_CONNECTION_INTERRUPTED
sim-applog.log:370: [com.apple.WebKit:ResourceLoadStatistics] Failed to request query parameters from WebPrivacy.
sim-applog.log:396: [com.apple.AppSSO:SOClient] configurationWithCompletion: success = YES, error = (null)
sim-applog.log:427: [com.apple.WebKit:ResourceLoadStatistics] WebContent[23432] Unable to hide query parameters from script (missing data)
sim-applog.log:432: [com.apple.WebKit:ResourceLoadStatistics] Failed to request allowed query parameters from WebPrivacy.
sim-applog.log:486: [com.apple.WebKit:ResourceLoadStatistics] Failed to request restricted opener domains from WebPrivacy
sim-applog.log:665: [com.apple.Accessibility:AXRuntimeCommon] WebContent[23432] Could not register system wide server: -25204
sim-applog.log:673: [com.apple.BoardServices:XPCErrors] WebContent[23432] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:692: [com.apple.UIKit:SystemGestureGate] <0x109d0a950> Gesture: Failed to receive system gesture state notification before next touch   [x3 similar]
sim-applog.log:729: [com.apple.WebKit:ProcessSuspension] 0x1181dc0b0 - ProcessAssertion() Failed to create capability MediaPlayback   [x8 similar]
sim-applog.log:734: [com.apple.runningboard:assertion] Error acquiring assertion: <Error Domain=RBSServiceErrorDomain Code=1 "(originator doesn't have entitlement com.apple.runningboard.assertions.webkit AND originator doesn't have entitlement com.apple.multitasking.systemappassertions)" UserInfo={NSLocalizedFailureReason=(originator doesn't have entitlement com.apple.runningboard.assertions.webkit AND originator doe   [x8 similar]
sim-applog.log:735: [com.apple.WebKit:ProcessSuspension] 0x1181dc0b0 - ProcessAssertion::acquireSync Failed to acquire RBS assertion 'WebKit Media Playback' for process with PID=23432, error: Error Domain=RBSServiceErrorDomain Code=1 "(originator doesn't have entitlement com.apple.runningboard.assertions.webkit AND originator doesn't have entitlement com.apple.multitasking.systemappassertions)" UserInfo={NSLocalizedF   [x8 similar]
## last lines of the app's output
## app's system log (last lines, full in sim-applog.log)
2026-11-24 00:12:54.716 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioNode::connect(5820624863821234199) NodeTypeGain, output = 0, input = 0
2026-11-24 00:12:54.716 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioNode::startPlaying(5820624863821234199) when = 0, offset = 0, duration = 0
2026-11-24 00:12:54.936 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] BaseAudioContext::createBufferSource(5820624863821283351)
2026-11-24 00:12:54.936 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioNode::AudioNode(5820624863821234200)
2026-11-24 00:12:54.936 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioParam::AudioParam(5820624863821234223) name = detune, value = 0, default = 0, min = -3.4028235e+38, max = 3.4028235e+38
2026-11-24 00:12:54.937 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioParam::AudioParam(5820624863821234224) name = playbackRate, value = 1, default = 1, min = -3.4028235e+38, max = 3.4028235e+38
2026-11-24 00:12:54.937 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioNode::connect(5820624863821234200) NodeTypeGain, output = 0, input = 0
2026-11-24 00:12:54.937 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioNode::startPlaying(5820624863821234200) when = 0, offset = 0, duration = 0
2026-11-24 00:12:55.914 Df App[23392:10b80] [com.apple.UIKit:EventDispatch] Evaluating dispatch of UIEvent: 0x600003d2cf00; type: 0; subtype: 0; backing type: 11; shouldSend: 1; ignoreInteractionEvents: 0, systemGestureStateChange: 0
2026-11-24 00:12:55.915 Df App[23392:10b80] [com.apple.UIKit:EventDispatch] Sending UIEvent type: 0; subtype: 0; to windows: 1
2026-11-24 00:12:55.915 Df App[23392:10b80] [com.apple.UIKit:EventDispatch] Sending UIEvent type: 0; subtype: 0; to window: <UIWindow: 0x10a809c40>; contextId: 0xC30A3957
2026-11-24 00:12:55.916 A  App[23392:10b80] (UIKitCore) send gesture actions
2026-11-24 00:12:55.916 A  App[23392:10b80] (UIKitCore) send gesture actions
2026-11-24 00:12:56.180 Df App[23392:10b80] [com.apple.WebKit:ProcessSuspension] 0x1180c80c0 - [PID=23432] WebProcessProxy::updateAudibleMediaAssertions: Releasing MediaPlayback assertion for WebProcess
2026-11-24 00:12:56.180 Df App[23392:10b80] [com.apple.WebKit:ProcessSuspension] 0x10b01e008 - WebProcessPool::updateAudibleMediaAssertions: Starting timer to clear audible activity in 5 seconds because we are no longer playing audio
2026-11-24 00:12:56.180 Df App[23392:10b80] [com.apple.WebKit:ProcessSuspension] 0x1181dc0b0 - ~ProcessAssertion: Releasing process assertion 'WebKit Media Playback' for process with PID=23432
2026-11-24 00:12:56.180 Df App[23392:10b80] [com.apple.WebKit:ProcessSuspension] 0x10b020020 - [pageProxyID=7, webPageID=8, PID=23432] WebPageProxy::updateThrottleState: UIProcess starting timer to release a foreground assertion in 10 seconds if audio doesn't start to play
2026-11-24 00:12:57.454 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioNode::~AudioNode(5820624863821234199)
2026-11-24 00:12:57.558 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioNode::~AudioNode(5820624863821234198)
2026-11-24 00:12:57.558 Df App[23392:10c29] [com.apple.WebKit:Media] WebContent[23432] AudioNode::~AudioNode(5820624863821234200)
2026-11-24 00:13:01.180 Df App[23392:10b80] [com.apple.WebKit:ProcessSuspension] 0x10b01e008 - WebProcessPool::clearAudibleActivity: The number of processes playing audible media is now zero. Releasing UI process assertion.
2026-11-24 00:13:01.180 Df App[23392:10b80] [com.apple.WebKit:ProcessSuspension] 0x1181dc160 - ~ProcessAssertion: Releasing process assertion 'WebKit Media Playback' for process with PID=23435
2026-11-24 00:13:06.180 Df App[23392:10b80] [com.apple.WebKit:ProcessSuspension] 0x10b020020 - [pageProxyID=7, webPageID=8, PID=23432] WebPageProxy::clearAudibleActivity: UIProcess is releasing a foreground assertion because we are no longer playing audio
2026-11-24 00:13:06.180 Df App[23392:10b80] [com.apple.WebKit:ProcessSuspension] 0x1180e4120 - [PID=23432, throttler=0x1180c8150] ProcessThrottler::Activity::invalidate: Ending foreground activity / 'View is playing audio'
2026-11-24 00:15:15.759 Df App[23392:10c29] (WebKit) WebContent[23432] cannot migrate AudioUnit assets for current process
