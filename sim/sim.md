SUMMARY: FAIL. launched, NOT running, crash reports 0

app: com.duckyisc00l.gdxtris (GdxTris)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.gdxtris: 25529
launched (try 1)
RESULT: NOT running after 40s (crashed or quit)
## first distinct errors (app output, then system log)
sim-console.log:11: [info] ERROR: Failed to load data!   [x2 similar]
sim-console.log:12: java.io.FileNotFoundException: /Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Data/Application/7B4F59DD-AE47-4F18-A321-246CE98B870C/Library/local/competitive-tetris-save-file: open failed: ENOENT (No such file or directory)   [x2 similar]
sim-applog.log:4: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:143: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:144: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
## last lines of the app's output
2026-11-19 01:28:24.719 GdxTris[25529:70790] [debug] IOSApplication: iOS version: 26.2
2026-11-19 01:28:24.720 GdxTris[25529:70790] [debug] IOSApplication: Running in 64-bit mode
2026-11-19 01:28:24.738 GdxTris[25529:70790] [debug] IOSApplication: Pixels per point: 2.0
2026-11-19 01:28:25.277 GdxTris[25529:70790] [debug] IOSApplication: Status bar is not visible
2026-11-19 01:28:25.278 GdxTris[25529:70790] [debug] IOSApplication: Computed bounds are x=0 y=0 w=375 h=667 bbW= 750 bbH= 1334
2026-11-19 01:28:25.987 GdxTris[25529:70790] [debug] IOSGraphics: Display: ppi=264, density=1.65
2026-11-19 01:28:25.996 GdxTris[25529:70790] lab: iPhone Simulator, sound off
2026-11-19 01:28:26.039 GdxTris[25529:70790] [debug] IOSApplication: created
2026-11-19 01:28:26.050 GdxTris[25529:70790] [debug] IOSApplication: Status bar is not visible
2026-11-19 01:28:26.051 GdxTris[25529:70790] [debug] IOSApplication: Computed bounds are x=0 y=0 w=375 h=667 bbW= 750 bbH= 1334
2026-11-19 01:28:26.067 GdxTris[25529:70790] [info] ERROR: Failed to load data!
java.io.FileNotFoundException: /Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Data/Application/7B4F59DD-AE47-4F18-A321-246CE98B870C/Library/local/competitive-tetris-save-file: open failed: ENOENT (No such file or directory)
2026-11-19 01:28:36.820 GdxTris[25529:70790] [debug] IOSApplication: resumed
## app's system log (last lines, full in sim-applog.log)
2026-11-19 01:28:39.825 Df GdxTris[25529:114db] [com.apple.launchservices:progress] Received LSWorkspaceObserverPing, xpc connection established
2026-11-19 01:28:39.832 Df GdxTris[25529:114db] [com.apple.PlugInKit:discovery] [d D227A5F1-2C6B-4FCD-937C-B635640B417F] <PKHost:0x6000017463c0> Completed discovery. Final # of matches: 4
2026-11-19 01:28:39.832 Df GdxTris[25529:11838] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x60000263ca80> delivering update to host (4 plugins)
2026-11-19 01:28:39.833 A  GdxTris[25529:11838] (ExtensionFoundation) discovering extensions
2026-11-19 01:28:39.837 Df GdxTris[25529:11838] [com.apple.extensionkit:NSExtension] discovered extensions: attributes {
    NSExtensionPointName = "com.apple.AudioUnit-Speech";
}, extensionSet {(
    <EXConcreteExtension: 0x600003919d40> {id = com.apple.speech.MacinTalkFramework.MacinTalkAUSP},
    <EXConcreteExtension: 0x60000390b810> {id = com.apple.ax.KonaTTSSupport.KonaSynthesizer},
    <EXConcreteExtension: 0x600003919c70> {id = com.apple.texttospeech.SiriAUSP},
    <EXConcreteExtension: 0x6000039174d0> {id = com.apple.ax.MauiTTSSupport.MauiAUSP}
)}
2026-11-19 01:28:39.838 Df GdxTris[25529:11838] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x60000263ca80> installing watchers for continuous discovery
2026-11-19 01:28:39.865 Df GdxTris[25529:11486] [com.apple.coreaudio:aurioc]            AURemoteIO.cpp:1130  AURemoteIO@0x112835640: set kAudioOutputUnitProperty_OutputChannelLayout.  Layout = tag=0x0, 0 channel descriptions [], err = 0
2026-11-19 01:28:41.527 Df GdxTris[25529:114d9] (libAudioDSP.dylib) cannot migrate AudioUnit assets for current process
2026-11-19 01:28:41.581 Df GdxTris[25529:11838] [com.apple.coreaudio:aqme]           AQMixEngine.cpp:733   AQMEDevice (0x11170ab18) has neither a defaultOutStreamClient nor a defaultInStreamClient
2026-11-19 01:28:41.586 Df GdxTris[25529:11838] [com.apple.coreaudio:EnhanceDialogueProcessor] EnhanceDialogueProcessor.cpp:226   EnhanceDialogueProcessor() - Product does not support Enhance Dialogue
2026-11-19 01:28:41.586 Df GdxTris[25529:11838] [com.apple.coreaudio:EnhanceDialogueProcessor] EnhanceDialogueProcessor.cpp:226   EnhanceDialogueProcessor() - Product does not support Enhance Dialogue
2026-11-19 01:28:41.588 Df GdxTris[25529:11838] [com.apple.coreaudio:AudioConverter]        ACv2Workarounds.mm:51    com.duckyisc00l.gdxtris: fix84702776_86723525_86479548_89800354_SinglePacketDesc: false
2026-11-19 01:28:41.593 Df GdxTris[25529:11838] [com.apple.audio.caulk:alloc] Registered notify signal com.apple.caulk.alloc.audiodump (0)
2026-11-19 01:28:41.594 Df GdxTris[25529:11838] [com.apple.coreaudio:AudioConverter]        AudioConverter.cpp:1067  Created a new in process converter -> 0x600000c371e0, from  2 ch,  44100 Hz, Float32, deinterleaved to  2 ch,  44100 Hz, Float32, interleaved
2026-11-19 01:28:41.597 Df GdxTris[25529:114db] [com.apple.coreaudio:aqme]              AQIONode.cpp:693   client <RemoteIOClient@0x11188de00(@0x11188e018); output; [25529]> is NOT Now Playing eligible
2026-11-19 01:28:41.598 Df GdxTris[25529:114db] [com.apple.coreaudio:aurios]        RemoteIOServer.cpp:1872  rio@0x11188e018 spatialization disabled.  layout = tag=0x0, 0 channel descriptions [], format =  2 ch,  44100 Hz, Int16, interleaved
2026-11-19 01:28:48.868 F  GdxTris[25529:11486] [com.apple.coreaudio:default] Initialize: RPC timeout. Apparently deadlocked. Aborting now.
2026-11-19 01:28:48.868 A  GdxTris[25529:11486] (libsystem_trace.dylib) Activity for state dumps
