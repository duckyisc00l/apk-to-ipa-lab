app: com.duckyisc00l.devhubapp (Host)
simulator: iPhone SE B0784041-4057-4B9E-85B9-5C63C5C0D0B2
Mach-O 64-bit executable x86_64
com.duckyisc00l.devhubapp: 36306
launched (try 1)
RESULT: still running after 40s
## first distinct errors in the app's output
## last lines of the app's output
## app's system log (last lines, full in sim-applog.log)
2026-11-17 12:11:15.175 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [87,[85]]
2026-11-17 12:11:15.181 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.getConstantsForViewManager ["AndroidHorizontalScrollContentView"]
2026-11-17 12:11:15.185 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [89,"AndroidHorizontalScrollContentView",1,{"flexDirection":"row"}]
2026-11-17 12:11:15.186 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [89,[63,67,75,79,87]]
2026-11-17 12:11:15.190 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.getConstantsForViewManager ["AndroidHorizontalScrollView"]
2026-11-17 12:11:15.193 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [93,"AndroidHorizontalScrollView",1,{"alwaysBounceHorizontal":true,"alwaysBounceVertical":false,"flexGrow":1,"flexShrink":1,"flexDirection":"row","overflow":"scroll","onLayout":true,"onMomentumScrollBegin":true,"onMomentumScrollEnd":true,"onScrollBeginDrag":true,"onScrollEndDrag":true,"onScroll":true,"snapToStart":true,"snapToEnd":true,"pagingEnabled":false}]
2026-11-17 12:11:15.197 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [93,[89]]
2026-11-17 12:11:15.201 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [95,"RCTView",1,{"height":23.1,"alignItems":"center","justifyContent":"center"}]
2026-11-17 12:11:15.206 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [95,[93]]
2026-11-17 12:11:15.208 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [97,"RCTView",1,{"onLayout":true,"flexGrow":1,"alignItems":"stretch","alignSelf":"center","justifyContent":"center","padding":17.6}]
2026-11-17 12:11:15.212 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [97,[9,53,55,95]]
2026-11-17 12:11:15.215 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.getConstantsForViewManager ["RCTScrollView"]
2026-11-17 12:11:15.218 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [99,"RCTScrollView",1,{"alwaysBounceVertical":false,"onLayout":true,"flexGrow":1,"flexShrink":1,"flexDirection":"column","overflow":"scroll","height":"100%","flex":1,"alignSelf":"center","width":"100%","maxWidth":375,"onMomentumScrollBegin":true,"onMomentumScrollEnd":true,"onScrollBeginDrag":true,"onScrollEndDrag":true,"onScroll":true,"snapToStart":true,"snapToEnd":true,"pagingEnabled":false}]
2026-11-17 12:11:15.222 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [99,[97]]
2026-11-17 12:11:15.225 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [103,"RCTView",1,{"paddingTop":20,"paddingBottom":0,"paddingLeft":0,"paddingRight":0,"flex":1,"backgroundColor":-1}]
2026-11-17 12:11:15.227 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [103,[99]]
2026-11-17 12:11:15.248 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.createView [105,"RCTView",1,{"flex":1}]
2026-11-17 12:11:15.249 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.setChildren [105,[103]]
2026-11-17 12:11:15.259 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.manageChildren [7,[],[],[105],[0],[]]
2026-11-17 12:11:15.283 Df Host[36306:18523] [com.apple.xpc:connection] [0x1052067e0] activating connection: mach=true listener=false peer=false name=com.apple.fontservicesd
2026-11-17 12:11:15.437 E  Host[36306:1852c] [com.facebook.react.log:javascript] RNTRACE UIManager.updateView [97,"RCTView",{"minHeight":647,"flexGrow":null}]
2026-11-17 12:11:15.451 Df Host[36306:184a9] [com.apple.UIKit:AssetManager] Could not load asset catalog from bundle NSBundle </Users/runner/Library/Developer/CoreSimulator/Devices/B0784041-4057-4B9E-85B9-5C63C5C0D0B2/data/Containers/Bundle/Application/D9B677DB-3737-44A7-9A2B-984A7C279AC1/Host.app> (loaded): Error Domain=NSCocoaErrorDomain Code=260 "RunTimeThemeRefForBundleIdentifierAndName() couldn't find Assets.car in bundle with identifier: com.duckyisc00l.devhubapp" UserInfo={NSLocalizedDescription=RunTimeThemeRefForBundleIdentifierAndName() couldn't find Assets.car in bundle with identifier: com.duckyisc00l.devhubapp}
2026-11-17 12:11:15.486 E  Host[36306:184a9] [com.apple.coreui:framework] CoreUI: CUIThemeStore: No theme registered with id=0
2026-11-17 12:11:15.486 F  Host[36306:184a9] [com.apple.coreui:framework] CoreUI: CUIThemeStore: No theme registered with id=0
2026-11-17 12:11:15.486 A  Host[36306:184a9] (libsystem_trace.dylib) Activity for state dumps
