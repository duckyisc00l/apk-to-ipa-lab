SUMMARY: PASS. launched, still running, crash reports 0, steps 1 ok / 0 failed, expects 0 passed / 0 failed

app: com.duckyisc00l.unciv (Unciv)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.unciv: 19672
launched (try 1)
## input steps
input tool: axe v2.1.1
screen: 375x667 points (steps may give X and Y in points or as 50%)
shot 0-language
tap 327 620
shot 1-after-pick
shot 2-main-menu
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 45s
## first distinct errors (app output, then system log)
sim-console.log:9: lab-diag: MISSING java/io/File.toPath()Ljava/nio/file/Path;   [x2 similar]
sim-console.log:10: lab-diag: MISSING CLASS java/lang/ClassValue   [x2 similar]
sim-console.log:11: lab-diag: MISSING CLASS java/lang/instrument/Instrumentation   [x2 similar]
sim-console.log:13: lab-diag: MISSING CLASS java/lang/management/GarbageCollectorMXBean   [x2 similar]
sim-console.log:14: lab-diag: MISSING CLASS java/lang/management/ManagementFactory   [x4 similar]
sim-console.log:16: lab-diag: MISSING CLASS java/lang/management/RuntimeMXBean   [x2 similar]
sim-console.log:17: lab-diag: MISSING CLASS java/net/StandardProtocolFamily   [x2 similar]
sim-console.log:19: lab-diag: MISSING java/nio/channels/DatagramChannel.bind(Ljava/net/SocketAddress;)Ljava/nio/channels/DatagramChannel;   [x2 similar]
sim-console.log:20: lab-diag: MISSING java/nio/channels/DatagramChannel.getLocalAddress()Ljava/net/SocketAddress;   [x2 similar]
sim-console.log:21: lab-diag: MISSING java/nio/channels/DatagramChannel.getRemoteAddress()Ljava/net/SocketAddress;   [x2 similar]
sim-console.log:22: lab-diag: MISSING java/nio/channels/DatagramChannel.setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/DatagramChannel;   [x2 similar]
sim-console.log:23: lab-diag: MISSING CLASS java/nio/channels/SeekableByteChannel   [x4 similar]
sim-console.log:25: lab-diag: MISSING java/nio/channels/ServerSocketChannel.bind(Ljava/net/SocketAddress;I)Ljava/nio/channels/ServerSocketChannel;   [x2 similar]
sim-console.log:26: lab-diag: MISSING java/nio/channels/ServerSocketChannel.getLocalAddress()Ljava/net/SocketAddress;   [x2 similar]
sim-console.log:27: lab-diag: MISSING java/nio/channels/ServerSocketChannel.setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/ServerSocketChannel;   [x2 similar]
sim-console.log:28: lab-diag: MISSING java/nio/channels/SocketChannel.getLocalAddress()Ljava/net/SocketAddress;   [x2 similar]
sim-console.log:29: lab-diag: MISSING java/nio/channels/SocketChannel.getRemoteAddress()Ljava/net/SocketAddress;   [x2 similar]
sim-console.log:30: lab-diag: MISSING java/nio/channels/SocketChannel.setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/SocketChannel;   [x2 similar]
sim-console.log:31: lab-diag: MISSING java/nio/channels/SocketChannel.shutdownInput()Ljava/nio/channels/SocketChannel;   [x2 similar]
sim-console.log:32: lab-diag: MISSING java/nio/channels/SocketChannel.shutdownOutput()Ljava/nio/channels/SocketChannel;   [x2 similar]
sim-console.log:33: lab-diag: MISSING CLASS java/nio/file/DirectoryStream   [x2 similar]
sim-console.log:34: lab-diag: MISSING CLASS java/nio/file/FileSystem   [x4 similar]
sim-console.log:36: lab-diag: MISSING CLASS java/nio/file/FileSystemException   [x6 similar]
sim-console.log:39: lab-diag: MISSING CLASS java/nio/file/FileSystemLoopException   [x2 similar]
sim-console.log:40: lab-diag: MISSING CLASS java/nio/file/Files   [x98 similar]
... and 49 more distinct errors
## last lines of the app's output
2026-11-24 00:55:43.690 Unciv[19672:59768] 2026-11-24T00:55:43.690Z [main] [UncivGame] Setting new screen: com.unciv.ui.screens.LanguagePickerScreen@275e2d80, screenStack: [com.unciv.ui.screens.LanguagePickerScreen@275e2d80]
2026-11-24 00:55:50.488 Unciv[19672:59866] 2026-11-24T00:55:50.487Z [threadpool-daemon-1] [UncivGame$create] Couldn't connect to server: CertPathValidator PKIX implementation not found
2026-11-24 00:58:49.235 Unciv[19672:59768] void * _Nullable NSMapGet(NSMapTable * _Nonnull, const void * _Nullable): map table argument is NULL
2026-11-24 00:58:58.153 Unciv[19672:59768] 2026-11-24T00:58:58.153Z [main] [DiacriticSupport$Companion] Length 2 - example हि
2026-11-24 00:58:58.154 Unciv[19672:59768] 2026-11-24T00:58:58.154Z [main] [DiacriticSupport$Companion] Length 3 - example বাং
2026-11-24 00:58:58.188 Unciv[19672:59768] 2026-11-24T00:58:58.188Z [main] [SoundPlayer] Sound cache cleared
2026-11-24 00:58:58.200 Unciv[19672:59866] 2026-11-24T00:58:58.200Z [threadpool-daemon-1] [SoundPlayer$Preloader] Preload UncivSound(fileName=click)
2026-11-24 00:58:58.201 Unciv[19672:59866] 2026-11-24T00:58:58.201Z [threadpool-daemon-1] [SoundPlayer] Sound click loaded from sounds/click.mp3
2026-11-24 00:58:58.202 Unciv[19672:59866] lab: IOSAudio.newSound has no iOS version, returned an empty value
2026-11-24 00:58:58.213 Unciv[19672:59866] 2026-11-24T00:58:58.213Z [threadpool-daemon-1] [SoundPlayer$Preloader] Preload UncivSound(fileName=whoosh)
2026-11-24 00:58:58.213 Unciv[19672:59866] 2026-11-24T00:58:58.213Z [threadpool-daemon-1] [SoundPlayer] Sound whoosh loaded from sounds/whoosh.mp3
2026-11-24 00:58:58.243 Unciv[19672:59866] 2026-11-24T00:58:58.243Z [threadpool-daemon-1] [SoundPlayer$Preloader] Preload UncivSound(fileName=construction)
2026-11-24 00:58:58.244 Unciv[19672:59866] 2026-11-24T00:58:58.244Z [threadpool-daemon-1] [SoundPlayer] Sound construction loaded from sounds/construction.mp3
2026-11-24 00:58:58.255 Unciv[19672:59866] 2026-11-24T00:58:58.255Z [threadpool-daemon-1] [SoundPlayer$Preloader] Preload UncivSound(fileName=promote)
2026-11-24 00:58:58.256 Unciv[19672:59866] 2026-11-24T00:58:58.256Z [threadpool-daemon-1] [SoundPlayer] Sound promote loaded from sounds/promote.mp3
2026-11-24 00:58:58.268 Unciv[19672:59866] 2026-11-24T00:58:58.268Z [threadpool-daemon-1] [SoundPlayer$Preloader] Preload UncivSound(fileName=upgrade)
2026-11-24 00:58:58.269 Unciv[19672:59866] 2026-11-24T00:58:58.269Z [threadpool-daemon-1] [SoundPlayer] Sound upgrade loaded from sounds/upgrade.mp3
2026-11-24 00:58:58.281 Unciv[19672:59866] 2026-11-24T00:58:58.280Z [threadpool-daemon-1] [SoundPlayer$Preloader] Preload UncivSound(fileName=coin)
2026-11-24 00:58:58.281 Unciv[19672:59866] 2026-11-24T00:58:58.281Z [threadpool-daemon-1] [SoundPlayer] Sound coin loaded from sounds/coin.mp3
2026-11-24 00:58:58.292 Unciv[19672:59866] 2026-11-24T00:58:58.292Z [threadpool-daemon-1] [SoundPlayer$Preloader] Preload UncivSound(fileName=chimes)
2026-11-24 00:58:58.292 Unciv[19672:59866] 2026-11-24T00:58:58.292Z [threadpool-daemon-1] [SoundPlayer] Sound chimes loaded from sounds/chimes.mp3
2026-11-24 00:58:58.303 Unciv[19672:59866] 2026-11-24T00:58:58.303Z [threadpool-daemon-1] [SoundPlayer$Preloader] Preload UncivSound(fileName=choir)
2026-11-24 00:58:58.304 Unciv[19672:59866] 2026-11-24T00:58:58.304Z [threadpool-daemon-1] [SoundPlayer] Sound choir loaded from sounds/choir.mp3
2026-11-24 00:58:58.325 Unciv[19672:59768] 2026-11-24T00:58:58.325Z [main] [UncivFiles] Getting save Autosave from folder SaveFiles, preferExternal: false
2026-11-24 00:58:58.326 Unciv[19672:59768] 2026-11-24T00:58:58.326Z [main] [UncivFiles] Save found: SaveFiles/Autosave
2026-11-24 00:58:58.344 Unciv[19672:59866] 2026-11-24T00:58:58.344Z [threadpool-daemon-1] [MapElevationGenerator] Mountain-like generation
2026-11-24 00:58:58.347 Unciv[19672:59866] 2026-11-24T00:58:58.347Z [threadpool-daemon-1] [MapElevationGenerator] Hill-like generation
2026-11-24 00:58:58.365 Unciv[19672:59768] 2026-11-24T00:58:58.365Z [main] [UncivGame] Setting new screen: com.unciv.ui.screens.mainmenuscreen.MainMenuScreen@19a2f150, screenStack: [com.unciv.ui.screens.mainmenuscreen.MainMenuScreen@19a2f150]
2026-11-24 00:58:58.370 Unciv[19672:59866] 2026-11-24T00:58:58.370Z [threadpool-daemon-1] [NaturalWonderGenerator] No suitable location for Rock of Gibraltar
2026-11-24 00:58:58.384 Unciv[19672:59866] 2026-11-24T00:58:58.383Z [threadpool-daemon-1] [NaturalWonderGenerator] No suitable location for Mount Fuji
2026-11-24 00:58:58.384 Unciv[19672:59866] 2026-11-24T00:58:58.384Z [threadpool-daemon-1] [NaturalWonderGenerator] No suitable location for Barringer Crater
2026-11-24 00:58:58.384 Unciv[19672:59866] 2026-11-24T00:58:58.384Z [threadpool-daemon-1] [NaturalWonderGenerator] No suitable location for Great Barrier Reef
2026-11-24 00:58:58.385 Unciv[19672:59866] 2026-11-24T00:58:58.385Z [threadpool-daemon-1] [NaturalWonderGenerator] Natural Wonder Krakatoa @HexCoord(x=-3, y=-8)
2026-11-24 00:58:58.385 Unciv[19672:59866] 2026-11-24T00:58:58.385Z [threadpool-daemon-1] [NaturalWonderGenerator] Natural Wonders for this game: [Krakatoa]
2026-11-24 00:58:58.424 Unciv[19672:59866] 2026-11-24T00:58:58.423Z [threadpool-daemon-1] [MapGenerationRandomness] chooseSpreadOutLocations: distance 3 < initial 4
2026-11-24 00:58:58.441 Unciv[19672:59866] 2026-11-24T00:58:58.441Z [threadpool-daemon-1] [MapGenerationRandomness] chooseSpreadOutLocations: distance 3 < initial 4
2026-11-24 00:58:58.445 Unciv[19672:59866] 2026-11-24T00:58:58.444Z [threadpool-daemon-1] [MapGenerationRandomness] chooseSpreadOutLocations: distance 7 < initial 9
2026-11-24 00:58:59.014 Unciv[19672:59768] lab: Sound.play has no iOS version, returned an empty value
2026-11-24 01:00:41.909 Unciv[19672:59866] 2026-11-24T01:00:41.909Z [threadpool-daemon-1] [UncivFiles] Getting saves from folder MultiplayerGames, externalStoragePath: /Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Data/Application/C5BE76DE-A254-476D-94CA-C706CD624D69/Documents/
2026-11-24 01:00:41.911 Unciv[19672:59866] 2026-11-24T01:00:41.911Z [threadpool-daemon-1] [UncivFiles] Local files: [], external files: []
## app's system log (last lines, full in sim-applog.log)
2026-11-24 00:58:58.384 Df Unciv[19672:e9da] 2026-11-24T00:58:58.383Z [threadpool-daemon-1] [NaturalWonderGenerator] No suitable location for Mount Fuji
2026-11-24 00:58:58.384 Df Unciv[19672:e9da] 2026-11-24T00:58:58.384Z [threadpool-daemon-1] [NaturalWonderGenerator] No suitable location for Barringer Crater
2026-11-24 00:58:58.384 Df Unciv[19672:e9da] 2026-11-24T00:58:58.384Z [threadpool-daemon-1] [NaturalWonderGenerator] No suitable location for Great Barrier Reef
2026-11-24 00:58:58.385 Df Unciv[19672:e9da] 2026-11-24T00:58:58.385Z [threadpool-daemon-1] [NaturalWonderGenerator] Natural Wonder Krakatoa @HexCoord(x=-3, y=-8)
2026-11-24 00:58:58.385 Df Unciv[19672:e9da] 2026-11-24T00:58:58.385Z [threadpool-daemon-1] [NaturalWonderGenerator] Natural Wonders for this game: [Krakatoa]
2026-11-24 00:58:58.423 Df Unciv[19672:e9da] 2026-11-24T00:58:58.423Z [threadpool-daemon-1] [MapGenerationRandomness] chooseSpreadOutLocations: distance 3 < initial 4
2026-11-24 00:58:58.441 Df Unciv[19672:e9da] 2026-11-24T00:58:58.441Z [threadpool-daemon-1] [MapGenerationRandomness] chooseSpreadOutLocations: distance 3 < initial 4
2026-11-24 00:58:58.444 Df Unciv[19672:e9da] 2026-11-24T00:58:58.444Z [threadpool-daemon-1] [MapGenerationRandomness] chooseSpreadOutLocations: distance 7 < initial 9
2026-11-24 00:58:59.004 Df Unciv[19672:e978] [com.apple.gamecontroller:Session] Connected devices changed (2 added, 0 removed) -> [2] {(
    <GCController 0x600003d0d590 'MFi'/'Gamepad'>,
    <GCKeyboard 0x6000002e3400 'Generic Keyboard'>
)}
2026-11-24 00:58:59.005 Df Unciv[19672:e978] [com.apple.CoreAnalytics:client] No XPC connection in Simulator
2026-11-24 00:58:59.006 Df Unciv[19672:e978] [com.apple.gamecontroller:Session] Connected devices changed (0 added, 0 removed) -> [2] {(
    <GCController 0x600003d0d590 'MFi'/'Gamepad'>,
    <GCKeyboard 0x6000002e3400 'Generic Keyboard'>
)}
2026-11-24 00:58:59.006 Df Unciv[19672:e978] [com.apple.gamecontroller:Session] Connected devices changed (0 added, 0 removed) -> [2] {(
    <GCController 0x600003d0d590 'MFi'/'Gamepad'>,
    <GCKeyboard 0x6000002e3400 'Generic Keyboard'>
)}
2026-11-24 00:58:59.006 A  Unciv[19672:e978] (GameControllerFoundation) [HID Event System Client] Activate
2026-11-24 00:58:59.014 Df Unciv[19672:e978] lab: Sound.play has no iOS version, returned an empty value
2026-11-24 01:00:41.909 Df Unciv[19672:e9da] 2026-11-24T01:00:41.909Z [threadpool-daemon-1] [UncivFiles] Getting saves from folder MultiplayerGames, externalStoragePath: /Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Data/Application/C5BE76DE-A254-476D-94CA-C706CD624D69/Documents/
2026-11-24 01:00:41.911 Df Unciv[19672:e9da] 2026-11-24T01:00:41.911Z [threadpool-daemon-1] [UncivFiles] Local files: [], external files: []
