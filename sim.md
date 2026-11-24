SUMMARY: FAIL. launched, NOT running, crash reports 0

app: com.duckyisc00l.sakumai (HelloLua-mobile)
simulator: iPhone 17 8ACE3512-EBCB-4303-B1B4-382296A412A8
Mach-O 64-bit executable arm64
com.duckyisc00l.sakumai: 4212
launched (try 1)
RESULT: NOT running after 60s (crashed or quit)
## first distinct errors (app output, then system log)
sim-applog.log:3: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:78: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:92: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:141: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:142: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:212: [com.apple.xpc:connection] [0x10616d540] Re-initialization successful; calling out to event handler with XPC_ERROR_CONNECTION_INTERRUPTED
## last lines of the app's output
[LUA-print] [INFO] # device.language              = en
[LUA-print] [INFO] # device.writablePath          = /Users/builder/Library/Developer/CoreSimulator/Devices/8ACE3512-EBCB-4303-B1B4-382296A412A8/data/Containers/Data/Application/DF318BE1-9F20-409F-B263-A7B925DD38DD/Documents/
[LUA-print] [INFO] # device.directorySeparator    = /
[LUA-print] [INFO] # device.pathSeparator         = :
[LUA-print] lab: required framework.device
[LUA-print] lab: require framework.routine
[LUA-print] lab: required framework.routine
[LUA-print] lab: require framework.extends.extend
[LUA-print] lab: required framework.extends.extend
[LUA-print] lab: require framework.extends.uiextend
[LUA-print] lab: required framework.extends.uiextend
[LUA-print] lab: require framework.extends.scene
[LUA-print] lab: required framework.extends.scene
[LUA-print] lab: require framework.extends.action
[LUA-print] lab: required framework.extends.action
[LUA-print] lab: required framework.init
[LUA-print] lab: require novel.init
[LUA-print] lab: require novel.system
[LUA-print] lab: required novel.system
[LUA-print] lab: require novel.commands
[LUA-print] lab: required novel.commands
[LUA-print] lab: require novel.character
[LUA-print] lab: required novel.character
[LUA-print] lab: require novel.choice
[LUA-print] lab: required novel.choice
[LUA-print] lab: required novel.init
[LUA-print] lab: require const
[LUA-print] lab: required const
[LUA-print] lab: require sceneLogo
[LUA-print] lab: required sceneLogo
lab: main.lua returned 0
lab: startMainLoop
libpng warning: iCCP: known incorrect sRGB profile
lab: appDidBecomeActive
lab: doCaller 1 isAppActive 1 appState 0
lab: Director::mainLoop call 1
[LUA-print] lab: require sceneMainMenu
[LUA-print] lab: require flowerFall
[LUA-print] lab: required flowerFall
[LUA-print] lab: required sceneMainMenu
## app's system log (last lines, full in sim-applog.log)
2026-11-24 00:10:37.856 Df HelloLua-mobile[4212:68c1] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x106052460> installing watchers for continuous discovery
2026-11-24 00:10:37.856 A  HelloLua-mobile[4212:6899] (PlugInKit) continuous-discovery
2026-11-24 00:10:37.856 Df HelloLua-mobile[4212:68bb] [com.apple.xpc:connection] [0x106319180] activating connection: mach=true listener=false peer=false name=com.apple.lsd.xpc
2026-11-24 00:10:37.856 Df HelloLua-mobile[4212:6899] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x1060530c0> created discovery driver
2026-11-24 00:10:37.856 Df HelloLua-mobile[4212:6899] [com.apple.PlugInKit:discovery] [d CA972F4F-C973-4783-B302-7719C0D1CE2A] <PKHost:0x106266f40> Beginning discovery for flags: 0, point: com.apple.AudioUnit-Speech
2026-11-24 00:10:37.857 Df HelloLua-mobile[4212:68be] [com.apple.launchservices:progress] Received LSWorkspaceObserverPing, xpc connection established
2026-11-24 00:10:37.861 Df HelloLua-mobile[4212:68be] [com.apple.PlugInKit:discovery] [d CA972F4F-C973-4783-B302-7719C0D1CE2A] <PKHost:0x106266f40> Completed discovery. Final # of matches: 4
2026-11-24 00:10:37.861 Df HelloLua-mobile[4212:68c1] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x1060530c0> delivering update to host (4 plugins)
2026-11-24 00:10:37.861 A  HelloLua-mobile[4212:68c1] (ExtensionFoundation) discovering extensions
2026-11-24 00:10:37.863 Df HelloLua-mobile[4212:68c1] [com.apple.extensionkit:NSExtension] discovered extensions: attributes {
    NSExtensionPointName = "com.apple.AudioUnit-Speech";
}, extensionSet {(
    <EXConcreteExtension: 0x10d61b800> {id = com.apple.speech.MacinTalkFramework.MacinTalkAUSP},
    <EXConcreteExtension: 0x10d61b8e0> {id = com.apple.ax.KonaTTSSupport.KonaSynthesizer},
    <EXConcreteExtension: 0x10d61b9c0> {id = com.apple.texttospeech.SiriAUSP},
    <EXConcreteExtension: 0x10d61baa0> {id = com.apple.ax.MauiTTSSupport.MauiAUSP}
)}
2026-11-24 00:10:37.863 Df HelloLua-mobile[4212:68c1] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x1060530c0> installing watchers for continuous discovery
2026-11-24 00:10:37.891 Df HelloLua-mobile[4212:6899] [com.apple.coreaudio:aurioc]            AURemoteIO.cpp:1130  AURemoteIO@0x10d62de40: set kAudioOutputUnitProperty_OutputChannelLayout.  Layout = tag=0x0, 0 channel descriptions [], err = 0
2026-11-24 00:10:37.898 Df HelloLua-mobile[4212:68be] [com.apple.coreaudio:ddagg]        AggregateDevice.mm:887   Creating DefaultDeviceAggregate
2026-11-24 00:10:37.944 Df HelloLua-mobile[4212:68be] [com.apple.coreaudio:ddagg]        AggregateDevice.mm:688   Built valid aggregate 97
2026-11-24 00:10:44.590 Df HelloLua-mobile[4212:68bb] [com.apple.xpc:connection] [0x10616d540] Re-initialization successful; calling out to event handler with XPC_ERROR_CONNECTION_INTERRUPTED
2026-11-24 00:10:44.591 E  HelloLua-mobile[4212:68bb] [com.apple.KeyboardArbiter:Client] XPC connection interrupted
2026-11-24 00:10:46.894 F  HelloLua-mobile[4212:6899] [com.apple.coreaudio:default] Initialize: RPC timeout. Apparently deadlocked. Aborting now.
2026-11-24 00:10:46.894 A  HelloLua-mobile[4212:6899] (libsystem_trace.dylib) Activity for state dumps
