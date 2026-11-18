SUMMARY: PASS. launched, still running, crash reports 0

app: com.duckyisc00l.ultrastarplay (UltraStarPlay)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
[x86_64:Mach-O 64-bit executable x86_64] [arm64:Mach-O 64-bit executable arm64]
ios/dd/Build/Products/Release-iphonesimulator/UltraStarPlay.app/UltraStarPlay (for architecture x86_64):	Mach-O 64-bit executable x86_64
ios/dd/Build/Products/Release-iphonesimulator/UltraStarPlay.app/UltraStarPlay (for architecture arm64):	Mach-O 64-bit executable arm64
com.duckyisc00l.ultrastarplay: 44029
launched (try 1)
RESULT: still running after 40s
## first distinct errors (app output, then system log)
sim-console.log:77: Settings file not found. Creating default settings at /Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Data/Application/091142BF-FAF1-447F-8087-3DEA06395241/Documents/Settings.json.
sim-console.log:87: Failed to create initial recording device profile.
sim-console.log:98: System.NullReferenceException: Object reference not set to an instance of an object.
sim-console.log:195: Finished song-scan-thread after 104 ms. Loaded 0 songs. Errors: 0, Warnings: 0.
sim-console.log:454: Getting version file from 'https://raw.githubusercontent.com/UltraStar-Deluxe/Play/v1.7.1-beta1/UltraStar%20Play/Assets/VERSION.txt' has result ProtocolError.
sim-console.log:455: HTTP/1.1 404 Not Found
sim-applog.log:2: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:90: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:103: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:196: [com.apple.coreaudio:SpatialMgr] SpatializationManager.cpp:1459  Could not load preset file, invalid model/product name!
sim-applog.log:221: [com.apple.locationd.Legacy:Generic_deprecated] could not read user kCFPreferencesCurrentUser uid/gid
sim-applog.log:223: [com.apple.locationd.Core:Core] {"msg":"file does not exist... clearing", "file":/Library/Developer/CoreSimulator/Volumes/iOS_23C54/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.2.simruntime/Contents/Resources/RuntimeRoot/private/var/Managed Preferences/kCFPreferencesCurrentUser/com.apple.CoreMotion.plist, "error":Error Domain=NSCocoaErrorDomain Code=260 "The file “com.apple.CoreMotion.
sim-applog.log:228: (libCoreFSCache.dylib) fopen failed for data file: errno = 2 (No such file or directory)   [x2 similar]
sim-applog.log:229: (libCoreFSCache.dylib) Errors found! Invalidating cache...   [x2 similar]
sim-applog.log:247: (libMobileGestalt.dylib) Failed to copyDeviceTreeProperty(IODeviceTree:/arm-io soc-generation)
sim-applog.log:248: (libMobileGestalt.dylib) Failed to get current SOC Generation string
sim-applog.log:271: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 0 event_name: com.apple.app_launch_measurement.FirstFramePresentationMetric
sim-applog.log:287: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:288: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:309: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 1 event_name: com.apple.app_launch_measurement.ExtendedLaunchMetrics
sim-applog.log:440: [com.apple.network:connection] nw_socket_set_connection_idle [C1.1.1.1:3] setsockopt SO_CONNECTION_IDLE failed [42: Protocol not available]   [x4 similar]
## last lines of the app's output
UITK PROBE         <Button name='startButton' classes='unity-text-element unity-button startButtonClass mainSceneButton'> bound=(x:164.92, y:153.52, width:310.05, height:92.35) display=Flex vis=Visible opacity=1 bg=RGBA(0.360, 0.680, 0.878, 1.000) bgImage=False text='Sing' font=NONE color=RGBA(0.898, 0.898, 0.898, 1.000)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
<Dump>d__2:MoveNext()
UnityEngine.SetupCoroutine:InvokeMoveNext(IEnumerator, IntPtr)

UITK PROBE         <VisualElement name='space' classes='mainSceneButtonSpacer'> bound=(x:474.96, y:153.52, width:10.19, height:10.19) display=Flex vis=Visible opacity=1 bg=RGBA(0.000, 0.000, 0.000, 0.000) bgImage=False
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
<Dump>d__2:MoveNext()
UnityEngine.SetupCoroutine:InvokeMoveNext(IEnumerator, IntPtr)

UITK PROBE         <Button name='partyButton' classes='unity-text-element unity-button mainSceneButton'> bound=(x:485.16, y:153.52, width:149.93, height:92.35) display=Flex vis=Visible opacity=1 bg=RGBA(0.200, 0.600, 0.847, 1.000) bgImage=False text='Party' font=NONE color=RGBA(0.898, 0.898, 0.898, 1.000)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
UitkProbe:Walk(VisualElement, Int32, Int32&)
<Dump>d__2:MoveNext()
UnityEngine.SetupCoroutine:InvokeMoveNext(IEnumerator, IntPtr)

Getting version file from: https://raw.githubusercontent.com/UltraStar-Deluxe/Play/v1.7.1-beta1/UltraStar%20Play/Assets/VERSION.txt
NewVersionChecker:StartGetRemoteVersionFileRequest(String)
UniRx.Operators.FromCoroutine:OnNext(T)
UniRx.<AsObservableCore>d__2`1:MoveNext()
UnityEngine.SetupCoroutine:InvokeMoveNext(IEnumerator, IntPtr)

Getting version file from 'https://raw.githubusercontent.com/UltraStar-Deluxe/Play/v1.7.1-beta1/UltraStar%20Play/Assets/VERSION.txt' has result ProtocolError.
HTTP/1.1 404 Not Found
NewVersionChecker:UpdateGetRemoteVersionFileRequest(UnityWebRequest)
UniRx.Operators.FromCoroutine:OnNext(T)
UniRx.<AsObservableCore>d__2`1:MoveNext()
UnityEngine.SetupCoroutine:InvokeMoveNext(IEnumerator, IntPtr)

## app's system log (last lines, full in sim-applog.log)
2026-11-18 05:31:04.402 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] nw_flow_connected [C2.1.1.1 IPv4#9b21868b:443 in_progress socket-flow (satisfied (Path is satisfied), interface: en0)] Output protocol connected (CFNetworkConnection-2057841347)
2026-11-18 05:31:04.404 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] [C2.1.1.1 IPv4#9b21868b:443 ready socket-flow (satisfied (Path is satisfied), interface: en0)] event: flow:child_finish_connect @0.812s
2026-11-18 05:31:04.405 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] [C2.1.1 Hostname#47013ef5:443 ready resolver (satisfied (Path is satisfied), interface: en0)] event: flow:child_finish_connect @0.813s
2026-11-18 05:31:04.407 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] [C2.1 Hostname#47013ef5:443 ready transform (satisfied (Path is satisfied), interface: en0)] event: flow:child_finish_connect @0.815s
2026-11-18 05:31:04.412 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] nw_flow_connected [C2 IPv4#9b21868b:443 in_progress parent-flow (satisfied (Path is satisfied), interface: en0)] Output protocol connected (endpoint_flow)
2026-11-18 05:31:04.413 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] [C2 IPv4#9b21868b:443 ready parent-flow (satisfied (Path is satisfied), interface: en0)] event: flow:finish_connect @0.821s
2026-11-18 05:31:04.414 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] nw_connection_report_state_with_handler_on_nw_queue [C2] reporting state ready
2026-11-18 05:31:04.416 A  UltraStarPlay[44029:1c4b1] (Security) SecKeyCopyPublicBytes
2026-11-18 05:31:04.416 Df UltraStarPlay[44029:1c4b1] [com.apple.xpc:connection] [0x10f84ef40] invalidated because the current process cancelled the connection by calling xpc_connection_cancel()
2026-11-18 05:31:04.416 Df UltraStarPlay[44029:1c4b1] [com.apple.CFNetwork:Default] Connection 2: connected successfully
2026-11-18 05:31:04.417 Df UltraStarPlay[44029:1c4b1] [com.apple.CFNetwork:Default] Connection 2: TLS handshake complete
2026-11-18 05:31:04.418 Df UltraStarPlay[44029:1c4b1] [com.apple.CFNetwork:Default] Connection 2: ready C(N) E(N)
2026-11-18 05:31:04.418 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] [C2] event: client:connection_reused @0.826s
2026-11-18 05:31:04.420 Df UltraStarPlay[44029:1c4b1] [com.apple.network:connection] nw_protocol_socket_notify [C2.1.1.1:3] nw_protocol_notification_type_connection_idle is false
2026-11-18 05:31:04.420 E  UltraStarPlay[44029:1c4b1] [com.apple.network:connection] nw_socket_set_connection_idle [C2.1.1.1:3] setsockopt SO_CONNECTION_IDLE failed [42: Protocol not available]
2026-11-18 05:31:04.421 Df UltraStarPlay[44029:1c4b1] [com.apple.CFNetwork:Default] Task <8CD3BE6C-055F-4252-925F-92BF074306F2>.<2> now using Connection 2
2026-11-18 05:31:04.422 Df UltraStarPlay[44029:1c4b1] [com.apple.CFNetwork:Default] Task <8CD3BE6C-055F-4252-925F-92BF074306F2>.<2> sent request, body N 0
2026-11-18 05:31:04.502 Df UltraStarPlay[44029:1dbd3] [com.apple.CFNetwork:Default] Task <8CD3BE6C-055F-4252-925F-92BF074306F2>.<2> received response, status 404 content K
2026-11-18 05:31:04.502 Df UltraStarPlay[44029:1dbd3] [com.apple.CFNetwork:Default] Task <8CD3BE6C-055F-4252-925F-92BF074306F2>.<2> done using Connection 2
2026-11-18 05:31:04.502 Df UltraStarPlay[44029:1dbd3] [com.apple.network:connection] [C2] event: client:connection_idle @0.910s
2026-11-18 05:31:04.502 Df UltraStarPlay[44029:1dbd3] [com.apple.network:connection] nw_protocol_socket_notify [C2.1.1.1:3] nw_protocol_notification_type_connection_idle is true
2026-11-18 05:31:04.502 E  UltraStarPlay[44029:1dbd3] [com.apple.network:connection] nw_socket_set_connection_idle [C2.1.1.1:3] setsockopt SO_CONNECTION_IDLE failed [42: Protocol not available]
2026-11-18 05:31:04.503 Df UltraStarPlay[44029:1dbd3] [com.apple.CFNetwork:Default] Task <8CD3BE6C-055F-4252-925F-92BF074306F2>.<2> response ended
2026-11-18 05:31:04.503 Df UltraStarPlay[44029:1c4b1] [com.apple.CFNetwork:Summary] Task <8CD3BE6C-055F-4252-925F-92BF074306F2>.<2> summary for task success {transaction_duration_ms=915, response_status=404, connection=2, protocol="h2", domain_lookup_duration_ms=19, connect_duration_ms=773, secure_connection_duration_ms=743, private_relay=false, request_start_ms=833, request_duration_ms=0, response_start_ms=913, response_duration_ms=1, request_bytes=195, request_throughput_kbps=7688, response_bytes=526, response_throughput_kbps=3678, cache_hit=false}
2026-11-18 05:31:04.504 Df UltraStarPlay[44029:1c4b1] [com.apple.CFNetwork:Default] Task <8CD3BE6C-055F-4252-925F-92BF074306F2>.<2> finished successfully
