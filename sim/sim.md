SUMMARY: FAIL. launched, still running, crash reports 0, steps 4 ok / 1 failed, expects 0 passed / 0 failed

app: com.duckyisc00l.liko12 (love)
simulator: iPhone 17 F5450765-59B9-4D0C-9B64-845B8C9EE51F
[x86_64:Mach-O 64-bit executable x86_64] [arm64]
love/platform/xcode/simdd/Build/Products/Release-iphonesimulator/love.app/love (for architecture x86_64):	Mach-O 64-bit executable x86_64
love/platform/xcode/simdd/Build/Products/Release-iphonesimulator/love.app/love (for architecture arm64):	Mach-O 64-bit executable arm64
com.duckyisc00l.liko12: 20935
launched (try 1)
## input steps
input tool: axe v2.0.4
screen: 402x874 points (steps may give X and Y in points or as 50%)
shot 0-prompt
tap 50% 30% FAILED: /Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/ci/sim/run.sh: line 14: 28217 Alarm clock: 14         perl -e 'alarm shift; exec @ARGV or exit 127' "$s" "$@"
shot 1-keyboard
softtype "help"
shot 2-typed-help
tapon "Return" (at 350 779)
shot 3-help
softtype "dir"
tapon "Return" (at 350 779)
shot 4-dir
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
## input errors (last lines)
✓ Tap at (379.0, 617.0) completed successfully
Error: No accessibility element matched --label 'Return'. Make sure the app is on the expected screen, then run `axe describe-ui --udid <SIMULATOR_UDID>` and prefer --id when available.
✓ Tap at (350.0, 779.0) completed successfully
✓ Tap at (122.0, 671.0) completed successfully
✓ Tap at (300.0, 617.0) completed successfully
✓ Tap at (142.0, 617.0) completed successfully
Error: No accessibility element matched --label 'Return'. Make sure the app is on the expected screen, then run `axe describe-ui --udid <SIMULATOR_UDID>` and prefer --id when available.
✓ Tap at (350.0, 779.0) completed successfully
RESULT: still running after 30s
## first distinct errors (app output, then system log)
sim-console.log:14: objc[20935]: Class UIAccessibilityLoaderWebShared is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebCore.axbundle/WebCore (0x11b6f4310) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runt
sim-applog.log:11: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:76: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:83: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:104: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:105: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:211: [com.apple.coreaudio:SpatialMgr] SpatializationManager.cpp:1461  Could not load preset file, invalid model/product name!
sim-applog.log:256: [com.apple.locationd.Core:Core] {"msg":"file does not exist... clearing", "file":/Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/private/var/Managed Preferences/kCFPreferencesCurrentUser/com.apple.CoreMotion.plist, "error":Error Domain=NSCocoaErrorDomain Code=260 "The file “com.apple.CoreMotion.
sim-applog.log:365: [com.apple.coreaudio:AUSpatialMixerV2] [0x10385a940|UpdateAlignmentDelayLines] Could not find active HRTF in cache. Alignment delay remains unchanged.
sim-applog.log:369: [com.apple.xpc:connection] [0x103b10f00] failed to do a bootstrap look-up: xpc_error=[3: No such process]   [x2 similar]
sim-applog.log:370: [com.apple.xpc:connection] [0x103b10f00] invalidated after a failed init   [x2 similar]
sim-applog.log:543: [com.apple.BoardServices:XPCErrors] [C:3] Alloc com.apple.inputservice.input-ui-host
sim-applog.log:587: (CoreHaptics)        CHHapticPattern.mm:487   +[CHHapticPattern patternForKey:error:]: Failed to read pattern library data: Error Domain=NSCocoaErrorDomain Code=260 "The file “hapticpatternlibrary.plist” couldn’t be opened because there is no such file." UserInfo={NSFilePath=/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSURL=file:///Library/Audio/Tunings/Generic/Hapti   [x180 similar]
sim-applog.log:588: [com.apple.UIKit:UIKBFeedbackGenerator] <_UIKBFeedbackGenerator: 0x103b8d200>: Error creating CHHapticPattern: Error Domain=NSCocoaErrorDomain Code=260 "The file “hapticpatternlibrary.plist” couldn’t be opened because there is no such file." UserInfo={NSFilePath=/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSURL=file:///Library/Audio/Tunings/Generic/Haptics/Library/ha   [x180 similar]
sim-applog.log:605: [com.apple.coremedia:] -AVSystemController- +[AVSystemController sharedInstance]: Failed to allocate AVSystemController, numberOfAttempts=1   [x60 similar]
sim-applog.log:750: [com.apple.UIKit:UIKBFeedbackGenerator] <_UIKBFeedbackGenerator: 0x103b8d200>: Error: Cannot start engine because it does not exist.   [x18 similar]
sim-applog.log:757: [com.apple.TextInputUI:Assert] The variant selector cell index number could not be found.   [x7 similar]
sim-applog.log:946: [com.apple.TextInputUI:CandidateGeneration] Attempted to update accumulator from source type: 0, after completion has already been called for token:[DE9C7295]. This is an error and will be ignored.
## last lines of the app's output
2026-11-18 05:35:03.554 love[20935:58536] You need UIApplicationSupportsIndirectInputEvents in your Info.plist for mouse support
Layout [1]: 0x0 -> 0x2FFF
Layout [2]: 0x3000 -> 0x5FFF
Layout [3]: 0x6000 -> 0x15FFF
2026-11-18 05:35:04.519 love[20935:58536] Unbalanced calls to begin/end appearance transitions for <SDL_uikitviewcontroller: 0x103994500>.
2026-11-18 05:35:04.519 love[20935:58536] Unbalanced calls to begin/end appearance transitions for <SDL_uikitviewcontroller: 0x103994500>.
Joystick Connected ! Gamepad: true, ID: 1, GUID: 0500a5d0ac05000001000000cf076d01, Name: Gamepad
------------------------------
- libcurl is not available
- luasec is not available
- https is not available
------------------------------
Creating LIKO-12_Source.love
objc[20935]: Class UIAccessibilityLoaderWebShared is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebCore.axbundle/WebCore (0x11b6f4310) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebKit.axbundle/WebKit (0x11b7b8398). This may cause spurious casting failures and mysterious crashes. One of the duplicates must be removed or renamed.
## app's system log (last lines, full in sim-applog.log)
2026-11-18 05:54:46.276 E  love[20935:12d7c] (CoreHaptics)        CHHapticPattern.mm:487   +[CHHapticPattern patternForKey:error:]: Failed to read pattern library data: Error Domain=NSCocoaErrorDomain Code=260 "The file “hapticpatternlibrary.plist” couldn’t be opened because there is no such file." UserInfo={NSFilePath=/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSURL=file:///Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSUnderlyingError=0x11fa50330 {Error Domain=NSPOSIXErrorDomain Code=2 "No such file or directory"}}
2026-11-18 05:54:46.276 E  love[20935:12d7c] [com.apple.UIKit:UIKBFeedbackGenerator] <_UIKBFeedbackGenerator: 0x103b8d200>: Error creating CHHapticPattern: Error Domain=NSCocoaErrorDomain Code=260 "The file “hapticpatternlibrary.plist” couldn’t be opened because there is no such file." UserInfo={NSFilePath=/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSURL=file:///Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSUnderlyingError=0x11fa50330 {Error Domain=NSPOSIXErrorDomain Code=2 "No such file or directory"}}
2026-11-18 05:54:46.276 E  love[20935:12d7c] (CoreHaptics)        CHHapticPattern.mm:487   +[CHHapticPattern patternForKey:error:]: Failed to read pattern library data: Error Domain=NSCocoaErrorDomain Code=260 "The file “hapticpatternlibrary.plist” couldn’t be opened because there is no such file." UserInfo={NSFilePath=/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSURL=file:///Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSUnderlyingError=0x11fa51740 {Error Domain=NSPOSIXErrorDomain Code=2 "No such file or directory"}}
2026-11-18 05:54:46.276 E  love[20935:12d7c] [com.apple.UIKit:UIKBFeedbackGenerator] <_UIKBFeedbackGenerator: 0x103b8d200>: Error creating CHHapticPattern: Error Domain=NSCocoaErrorDomain Code=260 "The file “hapticpatternlibrary.plist” couldn’t be opened because there is no such file." UserInfo={NSFilePath=/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSURL=file:///Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist, NSUnderlyingError=0x11fa51740 {Error Domain=NSPOSIXErrorDomain Code=2 "No such file or directory"}}
2026-11-18 05:54:46.276 Df love[20935:12d7c] [com.apple.coremedia:] -AVSystemController- +[AVSystemController sharedInstance]: Failed to allocate AVSystemController, numberOfAttempts=1
2026-11-18 05:54:46.276 Df love[20935:12d7c] [com.apple.coremedia:] -AVSystemController- +[AVSystemController sharedInstance]: Failed to allocate AVSystemController, numberOfAttempts=2
2026-11-18 05:54:46.276 Df love[20935:12d7c] [com.apple.coremedia:] -AVSystemController- +[AVSystemController sharedInstance]: Failed to allocate AVSystemController, numberOfAttempts=3
2026-11-18 05:54:46.276 Df love[20935:12d7c] [com.apple.UIKit:UIKBFeedbackGenerator] <_UIKBFeedbackGenerator: 0x103b8d200>: Preheating CoreHaptics.
2026-11-18 05:54:46.276 Df love[20935:12d7c] [com.apple.UIKit:UIKBFeedbackGenerator] <_UIKBFeedbackGenerator: 0x103b8d200>: Requesting engine start for reason: -[_UIKBFeedbackGenerator _actionOccurred:]
2026-11-18 05:54:46.277 E  love[20935:12d7c] [com.apple.UIKit:UIKBFeedbackGenerator] <_UIKBFeedbackGenerator: 0x103b8d200>: Error: Cannot start engine because it does not exist.
2026-11-18 05:54:46.277 E  love[20935:12d7c] [com.apple.UIKit:UIKBFeedbackGenerator] <_UIKBFeedbackGenerator: 0x103b8d200>: Engine is not running. Can't play feedback.
2026-11-18 05:54:46.279 Df love[20935:e4a8] [com.apple.UIKit:KeyboardUI] Keyboard sends inputEvent to kbd
2026-11-18 05:54:46.283 Df love[20935:150ab] [com.apple.UIKit:KeyboardUI] Keyboard receives output from kbd
2026-11-18 05:54:46.303 A  love[20935:e4a8] (UIKitCore) send control actions
2026-11-18 05:54:46.303 A  love[20935:e4a8] (UIKitCore) send control actions
2026-11-18 05:54:46.304 Df love[20935:e4a8] [com.apple.UIKit:KeyboardUI] Keyboard inserts text
2026-11-18 05:54:46.308 Df love[20935:e4a8] [com.apple.UIKit:EventDispatch] Evaluating dispatch of UIEvent: 0x1038ec900; type: 0; subtype: 0; backing type: 11; shouldSend: 0; ignoreInteractionEvents: 0, systemGestureStateChange: 1
2026-11-18 05:54:46.327 Df love[20935:150ab] [com.apple.TextInputUI:CandidateGeneration] All generators are not complete.
2026-11-18 05:54:46.330 Df love[20935:150ab] [com.apple.TextInputUI:CandidateGeneration] All generators are not complete.
2026-11-18 05:54:46.339 Df love[20935:12d95] [com.apple.TextInputUI:CandidateGeneration] All generators are complete, dispatching to `completionBlockJustOnce`
2026-11-18 05:54:46.341 Df love[20935:12d95] [com.apple.TextInputUI:CandidateGeneration] Assigning candidates of source type kbd to `containerToPush, for autocorrection flow only` - 2BEA2604
2026-11-18 05:54:46.341 Df love[20935:12d95] [com.apple.TextInputUI:CandidateGeneration] Preparing to push <_TUIKeyboardCandidateContainer: 0x1077179a0> to candidate receiver, for request token: 2BEA2604
2026-11-18 05:54:46.341 Df love[20935:12d95] [com.apple.TextInputUI:CandidateGeneration] containerToPush has an autocorrection list.  pushing to candidate receiver with request token. 2BEA2604.
2026-11-18 05:54:47.849 Df love[20935:150ab] [com.apple.TextInputUI:CandidateGeneration] Performing delayed generation for token=2BEA2604
2026-11-18 06:01:53.959 E  love[20935:e4c2] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
