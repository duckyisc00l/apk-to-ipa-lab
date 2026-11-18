SUMMARY: PASS. launched, still running, crash reports 0, steps 0 ok / 0 failed, expects 0 passed / 0 failed

app: com.lukaszswiderski.MiScaleExporter (MiScaleExporter.MAUI)
simulator: iPhone 17 F5450765-59B9-4D0C-9B64-845B8C9EE51F
Mach-O 64-bit executable arm64
com.lukaszswiderski.MiScaleExporter: 27830
launched (try 1)
## input steps
input tool: axe v2.0.4
screen: 402x874 points (steps may give X and Y in points or as 50%)
shot first
recording: sim-steps.mp4, sim-steps.gif, sim-sheet.png (contact sheet; frames: 24 from recording)
RESULT: still running after 45s
## first distinct errors (app output, then system log)
sim-console.log:1: Could not find `System.Security.Permissions` referenced by assembly `mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:2: Could not find `System.Threading.AccessControl` referenced by assembly `mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:3: Could not find `System.Diagnostics.EventLog` referenced by assembly `System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:4: Could not find `System.Diagnostics.PerformanceCounter` referenced by assembly `System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:5: Could not find `System.CodeDom` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:6: Could not find `Microsoft.Win32.SystemEvents` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:7: Could not find `System.Configuration.ConfigurationManager` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:8: Could not find `System.Diagnostics.PerformanceCounter` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:9: Could not find `System.Diagnostics.EventLog` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:10: Could not find `System.Security.Permissions` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:11: Could not find `System.IO.Ports` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:12: Could not find `System.Windows.Extensions` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:13: Could not find `System.Threading.AccessControl` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-console.log:16: objc[27830]: Class UIAccessibilityLoaderWebShared is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebKit.axbundle/WebKit (0x129f94398) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtim
sim-console.log:17: objc[27830]: Class AXSpringBoardUtilities is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/SpringBoardFoundation.axbundle/SpringBoardFoundation (0x12a4e0438) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSim
sim-applog.log:5: (libxamarin-dotnet.dylib) Could not find `System.Security.Permissions` referenced by assembly `mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:6: (libxamarin-dotnet.dylib) Could not find `System.Threading.AccessControl` referenced by assembly `mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:7: (libxamarin-dotnet.dylib) Could not find `System.Diagnostics.EventLog` referenced by assembly `System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:8: (libxamarin-dotnet.dylib) Could not find `System.Diagnostics.PerformanceCounter` referenced by assembly `System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:9: (libxamarin-dotnet.dylib) Could not find `System.CodeDom` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:10: (libxamarin-dotnet.dylib) Could not find `Microsoft.Win32.SystemEvents` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:11: (libxamarin-dotnet.dylib) Could not find `System.Configuration.ConfigurationManager` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:12: (libxamarin-dotnet.dylib) Could not find `System.Diagnostics.PerformanceCounter` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:13: (libxamarin-dotnet.dylib) Could not find `System.Diagnostics.EventLog` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
sim-applog.log:14: (libxamarin-dotnet.dylib) Could not find `System.Security.Permissions` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
... and 12 more distinct errors
## last lines of the app's output
2026-11-18 20:41:16.484 MiScaleExporter.MAUI[27830:294536] Could not find `System.Security.Permissions` referenced by assembly `mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.490 MiScaleExporter.MAUI[27830:294536] Could not find `System.Threading.AccessControl` referenced by assembly `mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.493 MiScaleExporter.MAUI[27830:294536] Could not find `System.Diagnostics.EventLog` referenced by assembly `System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.494 MiScaleExporter.MAUI[27830:294536] Could not find `System.Diagnostics.PerformanceCounter` referenced by assembly `System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.497 MiScaleExporter.MAUI[27830:294536] Could not find `System.CodeDom` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.498 MiScaleExporter.MAUI[27830:294536] Could not find `Microsoft.Win32.SystemEvents` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.498 MiScaleExporter.MAUI[27830:294536] Could not find `System.Configuration.ConfigurationManager` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.499 MiScaleExporter.MAUI[27830:294536] Could not find `System.Diagnostics.PerformanceCounter` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.499 MiScaleExporter.MAUI[27830:294536] Could not find `System.Diagnostics.EventLog` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.499 MiScaleExporter.MAUI[27830:294536] Could not find `System.Security.Permissions` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.500 MiScaleExporter.MAUI[27830:294536] Could not find `System.IO.Ports` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.500 MiScaleExporter.MAUI[27830:294536] Could not find `System.Windows.Extensions` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.500 MiScaleExporter.MAUI[27830:294536] Could not find `System.Threading.AccessControl` referenced by assembly `System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089`.
2026-11-18 20:41:16.703 MiScaleExporter.MAUI[27830:294536] You've implemented -[<UIApplicationDelegate> application:performFetchWithCompletionHandler:], but you still need to add "fetch" to the list of your supported UIBackgroundModes in your Info.plist.
2026-11-18 20:41:18.124 MiScaleExporter.MAUI[27830:294536] Unbalanced calls to begin/end appearance transitions for <Microsoft_Maui_Controls_Platform_Compatibility_ShellFlyoutRenderer: 0x124ca1000>.
objc[27830]: Class UIAccessibilityLoaderWebShared is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebKit.axbundle/WebKit (0x129f94398) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/WebCore.axbundle/WebCore (0x137ef8310). This may cause spurious casting failures and mysterious crashes. One of the duplicates must be removed or renamed.
objc[27830]: Class AXSpringBoardUtilities is implemented in both /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/SpringBoardFoundation.axbundle/SpringBoardFoundation (0x12a4e0438) and /Library/Developer/CoreSimulator/Volumes/iOS_23F77/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS 26.5.simruntime/Contents/Resources/RuntimeRoot/System/Library/AccessibilityBundles/SpringBoardHome.axbundle/SpringBoardHome (0x1388fcc58). This may cause spurious casting failures and mysterious crashes. One of the duplicates must be removed or renamed.
## app's system log (last lines, full in sim-applog.log)
2026-11-18 20:41:18.101 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:KeyWindow] Scene became target of keyboard event deferring environment: UIWindowScene: 0x124c54400; scene identity: com.apple.frontboard.systemappservices/FBSceneManager:sceneID%3Acom.lukaszswiderski.MiScaleExporter-default
2026-11-18 20:41:18.103 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.FrontBoard:SceneExtension] Realizing settings extension SBUISecureRenderingSettingsExtension on FBSSceneSettings
2026-11-18 20:41:18.105 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:InterfaceStyle] Not push traits update to screen for new style 1, <UIWindowScene: 0x124c54400> (F9FA373E-60F8-444A-BD3A-DE947D56E8A5)
2026-11-18 20:41:18.106 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:InterfaceStyle] Not push traits update to screen for new style 1, <UIWindowScene: 0x124c54400> (F9FA373E-60F8-444A-BD3A-DE947D56E8A5)
2026-11-18 20:41:18.107 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:AppLifecycle] sceneOfRecord: sceneID: sceneID:com.lukaszswiderski.MiScaleExporter-default  persistentID: F9FA373E-60F8-444A-BD3A-DE947D56E8A5
2026-11-18 20:41:18.107 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:Application] Deactivation reason removed: 12; deactivation reasons: 4128 -> 32; animating application lifecycle event: 1
2026-11-18 20:41:18.107 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.KeyboardArbiter:Client] Send setDeactivating: N (-DeactivationReason:SuspendedEventsOnly)
2026-11-18 20:41:18.112 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:Application] Deactivation reason removed: 5; deactivation reasons: 32 -> 0; animating application lifecycle event: 0
2026-11-18 20:41:18.124 Df MiScaleExporter.MAUI[27830:47e88] (UIKitCore) Unbalanced calls to begin/end appearance transitions for <Microsoft_Maui_Controls_Platform_Compatibility_ShellFlyoutRenderer: 0x124ca1000>.
2026-11-18 20:41:18.125 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.KeyboardArbiter:Client] startConnection
2026-11-18 20:41:18.126 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.KeyboardArbiter:Client] handleKeyboardChange: set currentKeyboard:N (wasKeyboard:N)
2026-11-18 20:41:18.143 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:KeyboardSceneDelegate] forceReloadInputViews
2026-11-18 20:41:18.143 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:KeyboardSceneDelegate] Reloading input views for key-window scene responder: <(null): 0x0; > force:Y
2026-11-18 20:41:18.145 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:KeyboardArbiterClientLog] isWritingToolsHandlingKeyboardTracking:Y (WT ready:Y, Arbiter ready:Y)
2026-11-18 20:41:18.191 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.network:activity] <nw_activity 50:1 [1C95DD1D-A2EB-41A4-8780-E1B763D216A9] (global parent) (reporting strategy default) complete (reason success)> complete with reason 2 (success), duration 13835ms
2026-11-18 20:41:18.191 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.network:activity] <nw_activity 50:2 [5469734D-5AAE-40DF-BBE4-0D10C59B6958] (reporting strategy default) complete (reason success)> complete with reason 2 (success), duration 13835ms
2026-11-18 20:41:18.191 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.network:activity] Unsetting the global parent activity <nw_activity 50:1 [1C95DD1D-A2EB-41A4-8780-E1B763D216A9] (global parent) (reporting strategy default) complete (reason success)>
2026-11-18 20:41:18.191 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.network:activity] Unset the global parent activity
2026-11-18 20:41:18.191 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.app_launch_measurement:ApplicationLaunch] alm_release_pageins_recording_assertion: releasing pageins recording assertion
2026-11-18 20:41:18.312 E  MiScaleExporter.MAUI[27830:47f6d] [com.apple.UIKit:Graphics] UIColor created with component values far outside the expected range. Set a breakpoint on UIColorBreakForOutOfRangeColorComponents to debug. This message will only be logged once.
2026-11-18 20:41:19.344 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.KeyboardArbiter:Client] RX sceneBecameFocused:(null)
2026-11-18 20:44:18.910 A  MiScaleExporter.MAUI[27830:47eaa] (CoreFoundation) Updating Key-Value Observers Of Preferences
2026-11-18 20:44:23.294 E  MiScaleExporter.MAUI[27830:47e88] [com.apple.UIKit:TraitCollection] Class CKBrowserSwitcherViewController overrides the -traitCollection getter, which is not supported. If you're trying to override traits, you must use the appropriate API.
2026-11-18 20:44:24.643 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.BackBoard:Display] [FBSDisplaySource 1-1] silently connecting raw configuration: <FBSDisplayConfiguration: 0x11b1c1900; Main; mode: "402x874@3x 60Hz p3 SDR">
2026-11-18 20:44:26.470 Df MiScaleExporter.MAUI[27830:47e88] [com.apple.Accessibility:AXCommon] Loading PDFKit
