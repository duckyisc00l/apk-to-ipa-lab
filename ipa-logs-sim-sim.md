SUMMARY: PASS. launched, still running, crash reports 0, steps 5 ok / 0 failed, expects 0 passed / 0 failed

app: com.domain.test-renpy-vn (test-renpy-vn)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.domain.test-renpy-vn: 11420
launched (try 1)
## input steps
input tool: axe 1.6.0
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot 0-menu
tap 63% 6%
tap 63% 6%
shot 1-after-start
tap 50% 50%
shot 2-advance-1
tap 50% 50%
tap 50% 50%
shot 3-advance-3
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 60s
## first distinct errors (app output, then system log)
sim-console.log:1: Got dlopen error on Foundation: dlopen(/System/Library/Frameworks/Foundation.framework/Versions/Current/Foundation, 0x0001): tried: '/Library/Developer/CoreSimulator/Volumes/iOS_23C54/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.2.simruntime/Contents/Resources/RuntimeRoot/System/Library/Frameworks/Foundation.framework/Versions/Current/Foundation' (no such file), '/System/Library/Framew
sim-console.log:2: Got fallback dlopen error on Foundation: dlopen(/Groups/System/Library/Frameworks/Foundation.framework/Versions/Current/Foundation, 0x0001): tried: '/Library/Developer/CoreSimulator/Volumes/iOS_23C54/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.2.simruntime/Contents/Resources/RuntimeRoot/Groups/System/Library/Frameworks/Foundation.framework/Versions/Current/Foundation' (no such file), 
sim-console.log:7: TypeError: type() argument 1 must be string, not unicode   [x2 similar]
sim-console.log:12: Loading error handling took 0.06s   [x2 similar]
sim-console.log:51: Could not open 'cache/shaders.txt':   [x2 similar]
sim-applog.log:2: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:119: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:120: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:231: [com.apple.coreaudio:SpatialMgr] SpatializationManager.cpp:1459  Could not load preset file, invalid model/product name!
sim-applog.log:244: [com.apple.coreaudio:AQ]        LoudnessManager.mm:1755  ReadPListFile: unable to open stream for LoudnessManager plist
sim-applog.log:286: (libCoreFSCache.dylib) fopen failed for data file: errno = 2 (No such file or directory)   [x2 similar]
sim-applog.log:287: (libCoreFSCache.dylib) Errors found! Invalidating cache...   [x2 similar]
sim-applog.log:340: (libMobileGestalt.dylib) Failed to copyDeviceTreeProperty(IODeviceTree:/arm-io soc-generation)
sim-applog.log:341: (libMobileGestalt.dylib) Failed to get current SOC Generation string
## last lines of the app's output
2026-11-18 12:56:37.245 test-renpy-vn[11420:37885] Saving to /Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Data/Application/0C7EB824-DCBB-4215-86DE-48E8C40BADC0/Documents
2026-11-18 12:56:37.328 test-renpy-vn[11420:37885] Loading save slot metadata took 0.53s
2026-11-18 12:56:37.329 test-renpy-vn[11420:37885] Loading persistent took 0.00s
2026-11-18 12:56:37.408 test-renpy-vn[11420:37885] Set script version to: (6, 99, 13)
2026-11-18 12:56:37.439 test-renpy-vn[11420:37885] Running init code took 0.11s
2026-11-18 12:56:37.543 test-renpy-vn[11420:37885] Loading analysis data took 0.10s
2026-11-18 12:56:37.549 test-renpy-vn[11420:37885] Analyze and compile ATL took 0.00s
2026-11-18 12:56:37.579 test-renpy-vn[11420:37885] Reloading save slot metadata took 0.03s
2026-11-18 12:56:37.580 test-renpy-vn[11420:37885] Index archives took 0.00s
2026-11-18 12:56:37.581 test-renpy-vn[11420:37885] Dump and make backups took 0.00s
2026-11-18 12:56:37.582 test-renpy-vn[11420:37885] Cleaning cache took 0.00s
2026-11-18 12:56:37.583 test-renpy-vn[11420:37885] Making clean stores took 0.00s
2026-11-18 12:56:37.711 test-renpy-vn[11420:37885] Initial gc took 0.13s
2026-11-18 12:56:37.712 test-renpy-vn[11420:37885] DPI scale factor: 1.000000
2026-11-18 12:56:38.182 test-renpy-vn[11420:37885] Creating interface object took 0.47s
2026-11-18 12:56:38.183 test-renpy-vn[11420:37885] Cleaning stores took 0.00s
2026-11-18 12:56:38.184 test-renpy-vn[11420:37885] Init translation took 0.00s
2026-11-18 12:56:38.188 test-renpy-vn[11420:37885] Build styles took 0.00s
2026-11-18 12:56:38.247 test-renpy-vn[11420:37885] Load screen analysis took 0.06s
2026-11-18 12:56:38.250 test-renpy-vn[11420:37885] Analyze screens took 0.00s
2026-11-18 12:56:38.250 test-renpy-vn[11420:37885] Save screen analysis took 0.00s
2026-11-18 12:56:38.451 test-renpy-vn[11420:37885] Prepare screens took 0.20s
2026-11-18 12:56:38.451 test-renpy-vn[11420:37885] Save pyanalysis. took 0.00s
2026-11-18 12:56:38.451 test-renpy-vn[11420:37885] Save bytecode. took 0.00s
2026-11-18 12:56:38.454 test-renpy-vn[11420:37885] Running _start took 0.00s
2026-11-18 12:56:49.546 test-renpy-vn[11420:37885] You need UIApplicationSupportsIndirectInputEvents in your Info.plist for mouse support
2026-11-18 12:56:49.562 test-renpy-vn[11420:37885] Interface start took 11.11s
2026-11-18 12:56:49.591 test-renpy-vn[11420:37885] Initializing gles2 renderer:
2026-11-18 12:56:49.592 test-renpy-vn[11420:37885] primary display bounds: (0, 0, 667, 375)
2026-11-18 12:56:49.593 test-renpy-vn[11420:37885] swap interval: 1 frames
2026-11-18 12:56:49.593 test-renpy-vn[11420:37885] Fullscreen mode.
2026-11-18 12:56:52.280 test-renpy-vn[11420:37885] Vendor: 'Google Inc.'
2026-11-18 12:56:52.280 test-renpy-vn[11420:37885] Renderer: 'ANGLE (Metal Renderer: Apple iOS simulator GPU)'
2026-11-18 12:56:52.280 test-renpy-vn[11420:37885] Version: 'OpenGL ES 3.0.0 (ANGLE 2.1.0.ffc603fabdfe)'
2026-11-18 12:56:52.281 test-renpy-vn[11420:37885] Display Info: None
2026-11-18 12:56:52.282 test-renpy-vn[11420:37885] Screen sizes: virtual=(1280, 720) physical=(667, 375) drawable=(1334, 750)
2026-11-18 12:56:52.285 test-renpy-vn[11420:37885] Could not open 'cache/shaders.txt':
2026-11-18 12:56:52.285 test-renpy-vn[11420:37885] Maximum texture size: 4096x4096
2026-11-18 12:57:03.683 test-renpy-vn[11420:37885] Unbalanced calls to begin/end appearance transitions for <SDL_uikitviewcontroller: 0x1119b5e00>.
2026-11-18 12:57:03.685 test-renpy-vn[11420:37885] Unbalanced calls to begin/end appearance transitions for <SDL_uikitviewcontroller: 0x1119b5e00>.
## app's system log (last lines, full in sim-applog.log)
2026-11-18 13:02:06.913 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:07.862 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:07.953 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:08.920 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:09.064 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:09.153 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:12.418 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:12.464 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:14.194 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:16.925 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:24.547 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:26.065 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:26.981 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:35.685 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:47.032 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:48.139 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:48.248 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:50.144 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:52.298 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:02:53.925 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:03:07.309 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:03:07.338 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:03:16.632 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:03:16.678 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:03:47.849 E  test-renpy-vn[11420:9775] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
