SUMMARY: FAIL. launched, NOT running, crash reports 0

app: com.duckyisc00l.gdxtris (GdxTris)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.gdxtris: 15528
launched (try 1)
RESULT: NOT running after 40s (crashed or quit)
## first distinct errors (app output, then system log)
sim-applog.log:4: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
## last lines of the app's output
2026-11-18 00:23:04.243 GdxTris[15528:48469] [debug] IOSApplication: iOS version: 26.2
2026-11-18 00:23:04.244 GdxTris[15528:48469] [debug] IOSApplication: Running in 64-bit mode
2026-11-18 00:23:04.259 GdxTris[15528:48469] [debug] IOSApplication: Pixels per point: 2.0
2026-11-18 00:23:04.328 GdxTris[15528:48469] [debug] IOSApplication: Status bar is not visible
2026-11-18 00:23:04.328 GdxTris[15528:48469] [debug] IOSApplication: Computed bounds are x=0 y=0 w=375 h=667 bbW= 750 bbH= 1334
2026-11-18 00:23:04.496 GdxTris[15528:48469] [debug] IOSGraphics: Display: ppi=264, density=1.65
## app's system log (last lines, full in sim-applog.log)
}, extensionSet {(
)}
2026-11-18 00:23:05.601 Df GdxTris[15528:bf40] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x6000026085a0> installing watchers for continuous discovery
2026-11-18 00:23:05.601 A  GdxTris[15528:bd55] (PlugInKit) continuous-discovery
2026-11-18 00:23:05.601 Df GdxTris[15528:bd55] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x600002600300> created discovery driver
2026-11-18 00:23:05.601 Df GdxTris[15528:bd55] [com.apple.PlugInKit:discovery] [d AA4D30C8-EA22-48CE-8010-3C91B884CD21] <PKHost:0x60000170ffc0> Beginning discovery for flags: 0, point: com.apple.AudioUnit-Speech
2026-11-18 00:23:05.602 Df GdxTris[15528:bf35] [com.apple.launchservices:progress] Establishing xpc connection to lsd
2026-11-18 00:23:05.602 Df GdxTris[15528:bf35] [com.apple.xpc:connection] [0x10a505b40] activating connection: mach=true listener=false peer=false name=com.apple.lsd.xpc
2026-11-18 00:23:05.603 Df GdxTris[15528:bee3] [com.apple.launchservices:progress] Received LSWorkspaceObserverPing, xpc connection established
2026-11-18 00:23:05.608 Df GdxTris[15528:bee3] [com.apple.PlugInKit:discovery] [d AA4D30C8-EA22-48CE-8010-3C91B884CD21] <PKHost:0x60000170ffc0> Completed discovery. Final # of matches: 4
2026-11-18 00:23:05.609 Df GdxTris[15528:bf35] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x600002600300> delivering update to host (4 plugins)
2026-11-18 00:23:05.609 A  GdxTris[15528:bf35] (ExtensionFoundation) discovering extensions
2026-11-18 00:23:05.613 Df GdxTris[15528:bf35] [com.apple.xpc:connection] [0x10a406760] activating connection: mach=true listener=false peer=false name=com.apple.lsd.mapdb
2026-11-18 00:23:05.621 Df GdxTris[15528:bf35] [com.apple.extensionkit:NSExtension] discovered extensions: attributes {
    NSExtensionPointName = "com.apple.AudioUnit-Speech";
}, extensionSet {(
    <EXConcreteExtension: 0x600003908c30> {id = com.apple.ax.KonaTTSSupport.KonaSynthesizer},
    <EXConcreteExtension: 0x60000390c4e0> {id = com.apple.ax.MauiTTSSupport.MauiAUSP},
    <EXConcreteExtension: 0x600003901110> {id = com.apple.texttospeech.SiriAUSP},
    <EXConcreteExtension: 0x600003900000> {id = com.apple.speech.MacinTalkFramework.MacinTalkAUSP}
)}
2026-11-18 00:23:05.621 Df GdxTris[15528:bf35] [com.apple.PlugInKit:discovery] <PKDiscoveryDriver:0x600002600300> installing watchers for continuous discovery
2026-11-18 00:23:05.661 Df GdxTris[15528:bd55] [com.apple.coreaudio:aurioc]            AURemoteIO.cpp:1130  AURemoteIO@0x10c014e40: set kAudioOutputUnitProperty_OutputChannelLayout.  Layout = tag=0x0, 0 channel descriptions [], err = 0
2026-11-18 00:23:14.664 F  GdxTris[15528:bd55] [com.apple.coreaudio:default] Initialize: RPC timeout. Apparently deadlocked. Aborting now.
2026-11-18 00:23:14.664 A  GdxTris[15528:bd55] (libsystem_trace.dylib) Activity for state dumps
