SUMMARY: PASS. launched, still running, crash reports 0, steps 6 ok / 0 failed, expects 4 passed / 0 failed

app: com.duckyisc00l.openchess (App)
simulator: iPhone 17 8ACE3512-EBCB-4303-B1B4-382296A412A8
[x86_64:Mach-O 64-bit executable x86_64] [arm64:Mach-O 64-bit executable arm64]
proj/simdd/Build/Products/Release-iphonesimulator/App.app/App (for architecture x86_64):	Mach-O 64-bit executable x86_64
proj/simdd/Build/Products/Release-iphonesimulator/App.app/App (for architecture arm64):	Mach-O 64-bit executable arm64
com.duckyisc00l.openchess: 2662
launched (try 1)
## input steps
input tool: axe v2.1.1
screen: 402x874 points (steps may give X and Y in points or as 50%)
shot 0-home
expect "Play a bot": PASS
tapon "Solve puzzles" (at 88 376)
shot 1-puzzle
expect "White to move": PASS
tapon "Home" (at 40 822)
tapon "Play a bot" (at 170 223)
shot 2-bots
expect "Beginners": PASS
tap 42% 82%
shot 3-game
ui game: Open Chess | Vertical scroll bar, 1 page | 0% | Horizontal scroll bar, 1 page
tap 56% 50%
shot 4-e2-picked
tap 56% 38%
shot 5-e4
expect "Undo": PASS
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 20s
## first distinct errors (app output, then system log)
sim-console.log:1: objc[2662]: Class UIAccessibilityLoaderWebShared is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebCore.axbundle/WebCore (0x13a7b4310) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runti
sim-applog.log:3: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:78: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:92: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:166: [com.apple.extensionkit:default] Failed to resolve host network app id to config: bundleID: com.apple.WebKit.Networking instance ID: Optional([_EXExtensionInstanceIdentifier: D9A91C60-7D21-42AC-B87A-DCA6E1070D58])
sim-applog.log:244: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 0 event_name: com.apple.app_launch_measurement.FirstFramePresentationMetric
sim-applog.log:261: [com.apple.WebKit:ResourceLoadStatistics] Failed to request storage access quirks from WebPrivacy.
sim-applog.log:262: [com.apple.WebKit:ResourceLoadStatistics] Failed to request storage access user agent string quirks from WebPrivacy.
sim-applog.log:263: [com.apple.WebKit:ResourceLoadStatistics] Failed to request known fingerprinting scripts from WebPrivacy: Error Domain=WebPrivacyErrorDomain Code=1001 "List data not found" UserInfo={NSLocalizedDescription=List data not found}
sim-applog.log:266: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:267: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:332: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 1 event_name: com.apple.app_launch_measurement.ExtendedLaunchMetrics
sim-applog.log:374: [com.apple.xpc:connection] [0x134c84b40] Re-initialization successful; calling out to event handler with XPC_ERROR_CONNECTION_INTERRUPTED   [x2 similar]
sim-applog.log:383: [com.apple.WebKit:ResourceLoadStatistics] Failed to request query parameters from WebPrivacy.
sim-applog.log:403: [com.apple.AppSSO:SOClient] configurationWithCompletion: success = YES, error = (null)
sim-applog.log:422: [com.apple.WebKit:ResourceLoadStatistics] Failed to request restricted opener domains from WebPrivacy
sim-applog.log:423: [com.apple.WebKit:ResourceLoadStatistics] WebContent[2667] Unable to filter tracking query parameters (missing data)
sim-applog.log:446: [com.apple.WebKit:ResourceLoadStatistics] WebContent[2667] Unable to hide query parameters from script (missing data)   [x6 similar]
sim-applog.log:451: [com.apple.WebKit:ResourceLoadStatistics] Failed to request allowed query parameters from WebPrivacy.
sim-applog.log:822: [com.apple.runningboard:assertion] Error acquiring assertion: <Error Domain=RBSAssertionErrorDomain Code=2 "Specified target process 2669 does not exist" UserInfo={NSLocalizedFailureReason=Specified target process 2669 does not exist}>   [x2 similar]
sim-applog.log:823: [com.apple.WebKit:ProcessSuspension] 0x11116c300 - ProcessAssertion() Failed to grant capability Background   [x2 similar]
sim-applog.log:824: [com.apple.WebKit:ProcessSuspension] 0x11116c300 - ProcessAssertion::acquireSync Failed to acquire RBS assertion 'GPUProcess Background Assertion' for process with PID=2669, error: (null)   [x2 similar]
sim-applog.log:837: [com.apple.WebKit:Media] WebContent[2667] MediaSessionManageriOS::maybeActivateAudioSession(0) failed to activate AudioSession   [x12 similar]
sim-applog.log:838: [com.apple.WebKit:Media] WebContent[2667] MediaSessionManageriOS::sessionWillBeginPlayback(0) 14401107153768480549 returning false, failed to activate AudioSession   [x12 similar]
sim-applog.log:1279: [com.apple.browserEngineKit:general] Failed to terminate process: Error Domain=com.apple.extensionKit.errorDomain Code=18 "(null)" UserInfo={NSUnderlyingError=0x134e0d230 {Error Domain=RBSRequestErrorDomain Code=3 "No such process found" UserInfo={NSLocalizedFailureReason=No such process found}}}
... and 7 more distinct errors
## last lines of the app's output
objc[2662]: Class UIAccessibilityLoaderWebShared is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebCore.axbundle/WebCore (0x13a7b4310) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebKit.axbundle/WebKit (0x13947c398). This may cause spurious casting failures and mysterious crashes. One of the duplicates must be removed or renamed.
## app's system log (last lines, full in sim-applog.log)
2026-11-24 00:29:40.563 A  App[2662:4686] (UIKitCore) send gesture actions
2026-11-24 00:29:40.563 Df App[2662:4686] [com.apple.WebKit:ViewGestures] Ending potential tap. (0x106289400, pageProxyID=8)
2026-11-24 00:29:40.563 Df App[2662:4686] [com.apple.UIKit:EventDispatch] Evaluating dispatch of UIEvent: 0x106104e00; type: 0; subtype: 0; backing type: 11; shouldSend: 0; ignoreInteractionEvents: 0, systemGestureStateChange: 1
2026-11-24 00:29:40.593 E  App[2662:46df] [com.apple.WebKit:ResourceLoadStatistics] WebContent[2667] Unable to hide query parameters from script (missing data)
2026-11-24 00:29:40.594 Df App[2662:4686] [com.apple.WebKit:Loading] 0x1062d4e18 - [pageProxyID=8, webPageID=9, PID=2667] WebPageProxy::didNavigateWithNavigationDataShared:
2026-11-24 00:29:40.594 Df App[2662:4686] [com.apple.WebKit:Loading] 0x1062d4e18 - [pageProxyID=8, webPageID=9, PID=2667] WebPageProxy::didSameDocumentNavigationForFrameViaJS: frameID=4294967297, isMainFrame=1, type=2
2026-11-24 00:29:40.597 Df App[2662:46df] [com.apple.WebKit:Network] WebContent[2667]: [pageID=9, frameID=4294967297, resourceID=4316] ResourceLoader::willSendRequestInternal: calling completion handler
2026-11-24 00:29:40.597 Df App[2662:46df] [com.apple.WebKit:ResourceLoading] WebContent[2667]: [pageID=9, frameID=4294967297, resourceID=4316 SubResourceLoader::willSendRequestInternal: resource load finished; calling completion handler
2026-11-24 00:29:40.597 Df App[2662:46df] [com.apple.WebKit:Network] WebContent[2667] 0x1110680e0 - [resourceLoader=0x112f2d800, frameLoader=0x1111bc100, frame=0x111057400, webPageID=9, frameID=4294967297, resourceID=4316] WebLoaderStrategy::tryLoadingUsingURLSchemeHandler: URL will be handled by a UIProcess URL scheme handler
2026-11-24 00:29:40.597 Df App[2662:46df] [com.apple.WebKit:Network] WebContent[2667] [schemeHandler=1, webPageID=9, frameID=4294967297, taskID=4316] WebURLSchemeTaskProxy::startLoading
2026-11-24 00:29:40.614 Df App[2662:46df] [com.apple.WebKit:Network] WebContent[2667] [schemeHandler=1, webPageID=9, frameID=4294967297, taskID=4316] WebURLSchemeTaskProxy::didComplete
2026-11-24 00:29:40.615 Df App[2662:46df] [com.apple.WebKit:ResourceLoading] WebContent[2667]: [pageID=9, frameID=4294967297, resourceID=4316 SubResourceLoader::didFinishLoading
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] BaseAudioContext::createBufferSource(14401107153768480549)
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioNode::AudioNode(14401107153768415240)
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioParam::AudioParam(14401107153768415251) name = detune, value = 0, default = 0, min = -3.4028235e+38, max = 3.4028235e+38
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioParam::AudioParam(14401107153768415252) name = playbackRate, value = 1, default = 1, min = -3.4028235e+38, max = 3.4028235e+38
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] BaseAudioContext::createGain(14401107153768480549)
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioNode::AudioNode(14401107153768415241)
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioParam::AudioParam(14401107153768415253) name = gain, value = 1, default = 1, min = -3.4028235e+38, max = 3.4028235e+38
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioNode::setChannelCount(14401107153768415241) 2
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioNode::setChannelCountMode(14401107153768415241) 0
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioNode::setChannelInterpretation(14401107153768415241) 0
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioNode::connect(14401107153768415240) NodeTypeGain, output = 0, input = 0
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioNode::connect(14401107153768415241) NodeTypeDestination, output = 0, input = 0
2026-11-24 00:29:41.348 Df App[2662:46df] [com.apple.WebKit:Media] WebContent[2667] AudioNode::startPlaying(14401107153768415240) when = 0, offset = 0, duration = 0
