SUMMARY: PASS. launched, still running, crash reports 0, steps 9 ok / 0 failed, expects 0 passed / 0 failed

app: com.duckyisc00l.pixelfist (PixelFist)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.pixelfist: 23679
launched (try 1)
## input steps
input tool: axe 1.6.0
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot 0-title
tap 62% 50%
shot 1-after-start
hold 85% 81% 1.0s
shot 2-walked-right
tap 85% 18%
tap 85% 18%
tap 85% 7%
shot 3-punches
hold 85% 81% 1.5s
tap 85% 18%
tap 85% 18%
tap 85% 7%
shot 4-more-punches
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 60s
## first distinct errors (app output, then system log)
sim-applog.log:3: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:109: [com.apple.locationd.Legacy:Generic_deprecated] could not read user kCFPreferencesCurrentUser uid/gid
sim-applog.log:111: [com.apple.locationd.Core:Core] {"msg":"file does not exist... clearing", "file":/Library/Developer/CoreSimulator/Volumes/iOS_23C54/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.2.simruntime/Contents/Resources/RuntimeRoot/private/var/Managed Preferences/kCFPreferencesCurrentUser/com.apple.CoreMotion.plist, "error":Error Domain=NSCocoaErrorDomain Code=260 "The file “com.apple.CoreMotion.
sim-applog.log:162: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:163: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:174: ERROR: AudioOutputUnitStart failed, code: -50
sim-applog.log:248: [com.apple.coreaudio:SpatialMgr] SpatializationManager.cpp:1459  Could not load preset file, invalid model/product name!
sim-applog.log:267: ERROR: Mouse is not supported by this display server.
sim-applog.log:318: [com.apple.network:activity] <nw_activity 50:1 [6CB5DB8A-BD32-4246-84D0-DD69434B58D3] (global parent) (reporting strategy default) complete (reason failure)> complete with reason 3 (failure), duration 96796ms
sim-applog.log:319: [com.apple.network:activity] <nw_activity 50:2 [A2ECE9DF-AE5E-434C-9D0A-01D337193670] (reporting strategy default) complete (reason failure)> complete with reason 3 (failure), duration 96798ms
sim-applog.log:320: [com.apple.network:activity] Unsetting the global parent activity <nw_activity 50:1 [6CB5DB8A-BD32-4246-84D0-DD69434B58D3] (global parent) (reporting strategy default) complete (reason failure)>
sim-applog.log:377: [com.apple.UIKit:SystemGestureGate] <0x11260fd30> Gesture: Failed to receive system gesture state notification before next touch   [x3 similar]
sim-applog.log:397: ERROR: Condition "!is_inside_tree()" is true. Returning: false
## last lines of the app's output
2026-11-18 13:06:32.208 PixelFist[23679:67589] Warning: Unable to create restoration in progress marker file
Godot Engine v4.3.stable.official.77dcf97d8 - https://godotengine.org
2026-11-18 13:06:34.652 PixelFist[23679:67589] Setting up an OpenGL ES 3.0 context.
OpenGL API OpenGL ES 3.0 APPLE-23.0.2 - Compatibility - Using Device: Apple Inc. - Apple Software Renderer

## app's system log (last lines, full in sim-applog.log)
2026-11-18 13:11:26.148 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:26.443 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:26.568 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:39.143 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:39.150 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:48.871 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:48.955 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:49.044 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:49.241 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:49.385 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:11:49.562 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:00.243 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:00.460 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:13.839 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:13.930 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:14.272 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:21.185 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:23.730 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:24.656 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:24.972 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:24.972 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:24.972 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:12:24.972 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:13:22.947 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 13:13:53.300 E  PixelFist[23679:10876] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
