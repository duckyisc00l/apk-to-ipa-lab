SUMMARY: PASS. launched, still running, crash reports 0, steps 5 ok / 0 failed, expects 0 passed / 0 failed

app: lab.gamemaker.legendarychess (App)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
lab.gamemaker.legendarychess: 8909
launched (try 1)
## input steps
input tool: axe v2.0.4
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot board
tap 55.3% 64.8%
shot selected
tap 55.3% 53.0%
shot e4
tap 55.3% 35.2%
tap 55.3% 47.0%
shot e5
tap 15.4% 78.7%
shot reset
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 20s
## first distinct errors (app output, then system log)
sim-applog.log:3: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:79: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:92: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:138: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:139: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:214: [com.apple.coreaudio:SpatialMgr] SpatializationManager.cpp:1459  Could not load preset file, invalid model/product name!
sim-applog.log:255: [com.apple.network:activity] <nw_activity 50:1 [D3EA5600-8C14-4549-8608-F6C357DAB5BE] (global parent) (reporting strategy default) complete (reason failure)> complete with reason 3 (failure), duration 44689ms
sim-applog.log:256: [com.apple.network:activity] <nw_activity 50:2 [CA7F31AF-3660-4922-8D56-B7001D70FC22] (reporting strategy default) complete (reason failure)> complete with reason 3 (failure), duration 44689ms
sim-applog.log:257: [com.apple.network:activity] Unsetting the global parent activity <nw_activity 50:1 [D3EA5600-8C14-4549-8608-F6C357DAB5BE] (global parent) (reporting strategy default) complete (reason failure)>
## last lines of the app's output
GL: Loaded TXTR page 1 (1024x1024)
Room changed: Splash (room 1) -> GamePortrait (room 2)
GL: Resized Surface 0 Size (1080x2160)
Runner: Room loaded: GamePortrait (room 2) with 69 instances
IOSRunner: frame 300 room GamePortrait
IOSRunner: frame 600 room GamePortrait
IOSRunner: frame 900 room GamePortrait
IOSRunner: frame 1200 room GamePortrait
IOSRunner: frame 1500 room GamePortrait
IOSRunner: touch down 414,864 frame 1727
Game: 1
Game: 10
Game: 1
Game: 2
IOSRunner: touch down 414,706 frame 1770
Game: 1
Game: 2
Game: 3
Game: 4
Game: 1
Game: 10
IOSRunner: frame 1800 room GamePortrait
IOSRunner: touch down 414,468 frame 1820
Game: 1
Game: 10
Game: 1
Game: 2
IOSRunner: touch down 414,626 frame 1850
Game: 1
Game: 2
Game: 3
Game: 4
Game: 1
Game: 10
IOSRunner: touch down 114,1048 frame 1927
IOSRunner: frame 2100 room GamePortrait
IOSRunner: frame 2400 room GamePortrait
IOSRunner: frame 2700 room GamePortrait
IOSRunner: frame 3000 room GamePortrait
IOSRunner: frame 3300 room GamePortrait
## app's system log (last lines, full in sim-applog.log)
2026-11-18 18:00:14.356 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:18.573 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:18.715 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:20.206 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:26.006 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:31.450 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:31.866 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:38.648 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:38.676 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:46.114 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:46.145 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:00:57.049 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:00.655 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:06.084 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:06.115 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:09.781 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:09.853 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:09.926 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:12.578 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:18.391 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:19.152 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:19.285 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:19.828 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:28.051 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
2026-11-18 18:01:28.589 E  App[8909:7897] [com.apple.coreaudio:AMCP]          HALC_ProxyIOContext.cpp:1623  HALC_ProxyIOContext::IOWorkLoop: skipping cycle due to overload
