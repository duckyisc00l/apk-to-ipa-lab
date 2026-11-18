SUMMARY: PASS. launched, still running, crash reports 0

app: com.duckyisc00l.multiduperstopwatch (Host)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.multiduperstopwatch: 76823
launched (try 1)
RESULT: still running after 40s
## first distinct errors (app output, then system log)
sim-applog.log:3: [com.apple.BoardServices:XPCErrors] [C:1] Alloc com.apple.frontboard.systemappservices
sim-applog.log:77: [com.apple.BoardServices:XPCErrors] [C:2] Alloc com.apple.backboard.hid-services.xpc
sim-applog.log:90: [com.apple.runtime-issues:UIKit App Config] `UIScene` lifecycle will soon be required. Failure to adopt will result in an assert in the future.
sim-applog.log:124: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 0 event_name: com.apple.app_launch_measurement.FirstFramePresentationMetric
sim-applog.log:131: [com.apple.UIKit:EventBus] Event Timing Profile for Touch: not found, path="/System/Library/EventTimingProfiles/Sim.Touch.plist"
sim-applog.log:132: [com.apple.UIKit:EventBus] Event Timing Profile for Pencil: not found, path="/System/Library/EventTimingProfiles/Sim.Pencil.plist"
sim-applog.log:161: [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 1 event_name: com.apple.app_launch_measurement.ExtendedLaunchMetrics
## last lines of the app's output
2026-11-18 05:30:10.264 Host[76823:195264] HERMES-PRELUDE: 10447 bytes
2026-11-18 05:30:10.268 Host[76823:195264] HERMES-PRELUDE: with Reanimated
2026-11-18 05:30:10.311 Host[76823:195343] HERMES-PRELUDE: ran
## app's system log (last lines, full in sim-applog.log)
2026-11-18 05:30:10.779 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.getConstantsForViewManager ["getConstants"]
2026-11-18 05:30:10.779 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.lazilyLoadView ["getConstants"]
2026-11-18 05:30:10.804 Df Host[76823:2fac0] [com.apple.network:activity] <nw_activity 50:1 [983C772C-3B56-4A20-A9E4-F7ECA891CEA7] (global parent) (reporting strategy default) complete (reason success)> complete with reason 2 (success), duration 2549ms
2026-11-18 05:30:10.805 Df Host[76823:2fac0] [com.apple.network:activity] <nw_activity 50:2 [77078C08-A667-482B-9D42-C0BA6E16949F] (reporting strategy default) complete (reason success)> complete with reason 2 (success), duration 2550ms
2026-11-18 05:30:10.805 Df Host[76823:2fac0] [com.apple.network:activity] Unsetting the global parent activity <nw_activity 50:1 [983C772C-3B56-4A20-A9E4-F7ECA891CEA7] (global parent) (reporting strategy default) complete (reason success)>
2026-11-18 05:30:10.805 Df Host[76823:2fac0] [com.apple.network:activity] Unset the global parent activity
2026-11-18 05:30:10.805 E  Host[76823:2fb04] [com.apple.app_launch_measurement:General] Failed to send CA Event for app launch measurements for ca_event_type: 1 event_name: com.apple.app_launch_measurement.ExtendedLaunchMetrics
2026-11-18 05:30:10.822 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.getConstantsForViewManager ["AndroidProgressBar"]
2026-11-18 05:30:10.822 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.getConstantsForViewManager ["RCTView"]
2026-11-18 05:30:10.826 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [3,"AndroidProgressBar",1,{"animating":true,"color":-15443791,"hidesWhenStopped":true,"height":48,"width":48}]
2026-11-18 05:30:10.830 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [5,"RCTView",1,{"accessibilityState":{},"accessibilityValue":{},"alignItems":"center","justifyContent":"center"}]
2026-11-18 05:30:10.830 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [5,[3]]
2026-11-18 05:30:10.830 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [7,"RCTView",1,{"accessibilityState":{},"accessibilityValue":{},"flex":1,"marginTop":"30%"}]
2026-11-18 05:30:10.830 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [7,[5]]
2026-11-18 05:30:10.830 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [9,"RCTView",1,{"collapsable":true,"accessibilityState":{},"accessibilityValue":{},"flex":1,"pointerEvents":"box-none"}]
2026-11-18 05:30:10.830 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [9,[7]]
2026-11-18 05:30:10.831 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [13,"RCTView",1,{"accessibilityState":{},"accessibilityValue":{},"flex":1,"pointerEvents":"box-none"}]
2026-11-18 05:30:10.831 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [13,[9]]
2026-11-18 05:30:10.831 E  Host[76823:2fb0f] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [1,[13]]
2026-11-18 05:30:10.832 Df Host[76823:2fac0] [com.apple.UIKit:_UIVisualStyleRegistry] Warning: no visual style classes have been registered at all.
2026-11-18 05:30:10.833 Df Host[76823:2fac0] [com.apple.UIKit:_UIVisualStyleRegistry] Warning: no visual style classes have been registered at all.
2026-11-18 05:30:10.834 Df Host[76823:2fac0] [com.apple.UIKit:_UIVisualStyleRegistry] Note: no default visual style class registered as fallback for stylable class UIActivityIndicatorView
2026-11-18 05:30:10.834 Df Host[76823:2fac0] [com.apple.UIKit:_UIVisualStyleRegistry] Note: no default visual style class registered as fallback for stylable class UIActivityIndicatorView
2026-11-18 05:30:10.836 Df Host[76823:2fac0] [PrototypeTools:domain] Not observing PTDefaults on customer install.
2026-11-18 05:30:11.318 A  Host[76823:2fb01] (RunningBoardServices) didChangeInheritances
