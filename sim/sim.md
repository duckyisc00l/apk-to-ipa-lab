SUMMARY: PASS. launched, still running, crash reports 0, steps 4 ok / 0 failed, expects 0 passed / 0 failed

app: com.shatteredpixel.shatteredpixeldungeon.apple (IOSLauncher)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.shatteredpixel.shatteredpixeldungeon.apple: 30596
launched (try 1)
## input steps
input tool: axe v2.1.1
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot 0-title
tap 50% 60%
shot 1-menu
tap 50% 92%
shot 2-tap-bottom
tap 50% 75%
shot 3-tap-75
tap 50% 55%
shot 4-tap-55
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 40s
## first distinct errors (app output, then system log)
sim-applog.log:4: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:191: [com.apple.coreaudio:SpatialMgr] SpatializationManager.cpp:1459  Could not load preset file, invalid model/product name!
sim-applog.log:242: [com.apple.locationd.Legacy:Generic_deprecated] could not read user kCFPreferencesCurrentUser uid/gid
sim-applog.log:244: [com.apple.locationd.Core:Core] {"msg":"file does not exist... clearing", "file":/Library/Developer/CoreSimulator/Volumes/iOS_23C54/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.2.simruntime/Contents/Resources/RuntimeRoot/private/var/Managed Preferences/kCFPreferencesCurrentUser/com.apple.CoreMotion.plist, "error":Error Domain=NSCocoaErrorDomain Code=260 "The file “com.apple.CoreMotion.
sim-applog.log:355: [com.apple.coreaudio:AUSpatialMixerV2] [0x10af07970|UpdateAlignmentDelayLines] Could not find active HRTF in cache. Alignment delay remains unchanged.
sim-applog.log:359: [com.apple.xpc:connection] [0x10c01b0f0] failed to do a bootstrap look-up: xpc_error=[3: No such process]   [x2 similar]
sim-applog.log:360: [com.apple.xpc:connection] [0x10c01b0f0] invalidated after a failed init   [x2 similar]
sim-applog.log:378: [com.apple.coreaudio:AudioConverter]     AudioConverterOOP.cpp:1084  Failed to prepare AudioConverterService: -302
sim-applog.log:386: (libCoreFSCache.dylib) fopen failed for data file: errno = 2 (No such file or directory)   [x2 similar]
sim-applog.log:387: (libCoreFSCache.dylib) Errors found! Invalidating cache...   [x2 similar]
sim-applog.log:397: (libMobileGestalt.dylib) Failed to copyDeviceTreeProperty(IODeviceTree:/arm-io soc-generation)
sim-applog.log:398: (libMobileGestalt.dylib) Failed to get current SOC Generation string
sim-applog.log:474: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:475: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
## last lines of the app's output
2026-11-24 11:36:28.812 IOSLauncher[30596:84705] [debug] IOSApplication: iOS version: 26.2
2026-11-24 11:36:28.812 IOSLauncher[30596:84705] [debug] IOSApplication: Running in 64-bit mode
2026-11-24 11:36:28.834 IOSLauncher[30596:84705] [debug] IOSApplication: Pixels per point: 2.0
2026-11-24 11:36:29.078 IOSLauncher[30596:84705] [debug] IOSApplication: Status bar is visible (height = 20.0)
2026-11-24 11:36:29.079 IOSLauncher[30596:84705] [debug] IOSApplication: Computed bounds are x=0 y=20 w=375 h=647 bbW= 750 bbH= 1294
2026-11-24 11:36:29.165 IOSLauncher[30596:84705] MGLKViewController resume
2026-11-24 11:36:29.200 IOSLauncher[30596:84705] [debug] IOSGraphics: Display: ppi=460, density=2.875
2026-11-24 11:36:30.038 IOSLauncher[30596:84705] [debug] IOSApplication: created
2026-11-24 11:36:30.043 IOSLauncher[30596:84705] [info] Controllers: added manager for application, 1 managers active
2026-11-24 11:36:35.580 IOSLauncher[30596:84705] [debug] IOSApplication: Status bar is not visible
2026-11-24 11:36:35.581 IOSLauncher[30596:84705] [debug] IOSApplication: Computed bounds are x=0 y=0 w=375 h=667 bbW= 750 bbH= 1334
2026-11-24 11:36:35.850 IOSLauncher[30596:84705] MGLKViewController viewDidAppear
2026-11-24 11:36:35.853 IOSLauncher[30596:84705] [debug] IOSApplication: resumed
2026-11-24 11:36:35.854 IOSLauncher[30596:84705] MGLKViewController appDidBecomeActive:
2026-11-24 11:39:28.231 IOSLauncher[30596:84705] void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL
2026-11-24 11:40:00.531 IOSLauncher[30596:84705] [debug] IOSApplication: Status bar is not visible
2026-11-24 11:40:00.532 IOSLauncher[30596:84705] [debug] IOSApplication: Computed bounds are x=0 y=0 w=375 h=667 bbW= 750 bbH= 1334
2026-11-24 11:40:34.822 IOSLauncher[30596:84705] [debug] IOSApplication: Status bar is not visible
2026-11-24 11:40:34.823 IOSLauncher[30596:84705] [debug] IOSApplication: Computed bounds are x=0 y=0 w=375 h=667 bbW= 750 bbH= 1334
2026-11-24 11:40:51.919 IOSLauncher[30596:84705] [debug] IOSApplication: Status bar is not visible
2026-11-24 11:40:51.920 IOSLauncher[30596:84705] [debug] IOSApplication: Computed bounds are x=0 y=0 w=375 h=667 bbW= 750 bbH= 1334
2026-11-24 11:41:00.570 IOSLauncher[30596:84705] [debug] IOSApplication: Status bar is not visible
2026-11-24 11:41:00.570 IOSLauncher[30596:84705] [debug] IOSApplication: Computed bounds are x=0 y=0 w=375 h=667 bbW= 750 bbH= 1334
## app's system log (last lines, full in sim-applog.log)
2026-11-24 11:43:14.148 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:ac]          ACMP3Decoder.cpp:156   (0x10f138240) Output format:  2 ch,  44100 Hz, Int16, interleaved
2026-11-24 11:43:14.148 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AudioConverter]        AudioConverter.cpp:1067  Created a new in process converter -> 0x600000cb4030, from  2 ch,  44100 Hz, .mp3 (0x00000000) 0 bits/channel, 0 bytes/packet, 1152 frames/packet, 0 bytes/frame to  2 ch,  44100 Hz, Float32, deinterleaved
2026-11-24 11:43:14.149 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:487   AudioQueueObject: aq@0x10f144800: New output; format  2 ch,  44100 Hz, .mp3 (0x00000000) 0 bits/channel, 0 bytes/packet, 1152 frames/packet, 0 bytes/frame (passthrough? no)
2026-11-24 11:43:14.151 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:aqme]              AQIONode.cpp:693   client <AudioQueueObject@0x10f144800; ; [30596]; play> is NOT Now Playing eligible
2026-11-24 11:43:14.151 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:3236  CheckSpatialization: aq@0x10f144800 automatic spatialization check: spatialize=0
2026-11-24 11:43:14.151 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:3249  CheckSpatialization: aq@0x10f144800 CheckSpatialization mAutomaticSpatialization=1, mSpatializationEnabled=0 mContentRequiresAUSpatialMixer=0 mHasMetadata=0 mIsOffline=0 STSLabel valid:0 is stereo: 1
2026-11-24 11:43:14.151 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:ac]          ACMP3Decoder.cpp:153   (0x10f138240) Input format:  2 ch,  44100 Hz, .mp3 (0x00000000) 0 bits/channel, 0 bytes/packet, 1152 frames/packet, 0 bytes/frame
2026-11-24 11:43:14.151 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:ac]          ACMP3Decoder.cpp:156   (0x10f138240) Output format:  2 ch,  44100 Hz, Int16, interleaved
2026-11-24 11:43:14.151 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AudioConverter]        AudioConverter.cpp:1067  Created a new in process converter -> 0x600000cb4600, from  2 ch,  44100 Hz, .mp3 (0x00000000) 0 bits/channel, 0 bytes/packet, 1152 frames/packet, 0 bytes/frame to  2 ch,  44100 Hz, Float32, deinterleaved
2026-11-24 11:43:14.152 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]        AQAudioConverter.h:65    AQAudioConverter: Constructed an AudioConverter for the client <AudioQueueObject@0x10f144800; ; [30596]; play>.
2026-11-24 11:43:14.153 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:10012 SetLoudnessFromLM: -> aq@0x10f144800:
2026-11-24 11:43:14.153 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:10122 SetLoudnessFromLM: is CoreAudioServices/LoudnessManager enabled? yes
2026-11-24 11:43:14.154 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:10125 SetLoudnessFromLM: is CoreAudioServices/LoudnessManagerV2 enabled? yes
2026-11-24 11:43:14.154 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:10128 SetLoudnessFromLM: is CoreAudioServices/lm-disable-hardware-check on? no
2026-11-24 11:43:14.154 E  IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]        LoudnessManager.mm:1215  IsHardwareSupported: no plist loaded, returning false
2026-11-24 11:43:14.155 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:10131 SetLoudnessFromLM: is hardware supported? no
2026-11-24 11:43:14.155 E  IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]        LoudnessManager.mm:1215  IsHardwareSupported: no plist loaded, returning false
2026-11-24 11:43:14.156 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:10141 SetLoudnessFromLM: hardware not supported, Loudness Manager disabled
2026-11-24 11:43:14.158 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AudioConverter]        AudioConverter.cpp:1317  AudioConverter -> 0x600000cb4600: The in-process GetProperty call returned 1886547824 for property 1752658554 with size 8.
2026-11-24 11:43:14.165 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:aqme]              AQIONode.cpp:693   client <AudioQueueObject@0x10f144800; ; [30596]; play> is NOT Now Playing eligible
2026-11-24 11:43:14.165 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:AQ]      AudioQueueObject.cpp:5762  ApplyParameters: aq@0x10f144800 volume 1.000 1.000 1.000 1.000 1.000 1.000, 1.000
2026-11-24 11:43:14.165 Df IOSLauncher[30596:14ae1] [com.apple.coreaudio:aqme]  MEDeviceStreamClient.cpp:245   AQME Default-InputOutput: client starting: <AudioQueueObject@0x10f144800; ; [30596]; play>; running count now 3
2026-11-24 11:43:14.180 Df IOSLauncher[30596:14cc6] [com.apple.coreaudio:default] AQSTL aq(0x10f144800) start time resolved to: 17832404 ioTS st: 17832404 ht: 2782.128473
2026-11-24 11:43:16.092 E  IOSLauncher[30596:14ca4] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-24 11:43:37.907 E  IOSLauncher[30596:14ca4] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
