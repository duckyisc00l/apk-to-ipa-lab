# libGDX split

- classes in classes.dex: 18387
- libGDX version (com.badlogic.gdx.Version): 1.14.2
- game classes (not libGDX, Android or common libraries): 9479
- libGDX kept its own names (com.badlogic.gdx.Gdx present; if not, R8 renamed libGDX and the backend can't be swapped): True
- share of game classes with 1-2 letter names (obfuscated if high): 0.0
- Android-side classes (extend an Android or libGDX-Android class): 7

## Game packages
- j$/util/stream: 495
- com/unciv/logic/multiplayer/apiv2: 394
- com/unciv/models/ruleset/unique: 348
- com/unciv/ui/popups/options: 278
- com/unciv/ui/screens/newgamescreen: 238
- com/unciv/models/ruleset: 203
- com/unciv/ui/screens/devconsole: 187
- com/unciv/ui/screens/mapeditorscreen/tabs: 182
- io/ktor/http: 178
- com/unciv/ui/screens/worldscreen: 171
- com/unciv/ui/screens/overviewscreen: 167
- com/unciv/ui/screens/cityscreen: 151

## ApplicationListener classes (main game first)
- com/unciv/app/AndroidGame constructors ['(Landroid/app/Activity;)V']
- (base) com/unciv/UncivGame

## Android side
- com/unciv/app/AndroidGame$addScreenObscuredListener$1 extends java/lang/Object
- com/unciv/app/AndroidLauncher extends com/badlogic/gdx/backends/android/AndroidApplication
- com/unciv/app/AndroidLauncher$$ExternalSyntheticLambda0 extends java/lang/Object
- com/unciv/app/AndroidTvLauncher extends com/unciv/app/AndroidLauncher
- com/unciv/app/CopyToClipboardReceiver extends android/content/BroadcastReceiver
- com/unciv/app/MultiplayerTurnCheckWorker extends androidx/work/Worker
- kotlinx/coroutines/android/HandlerDispatcherKt$$ExternalSyntheticLambda0 extends java/lang/Object

## Other libraries
- kotlin/reflect/jvm: 2382
- com/badlogic/gdx: 1388
- kotlinx/coroutines/flow: 403
- kotlinx/serialization/json: 154
- kotlinx/serialization/internal: 142
- kotlinx/coroutines/channels: 136
- kotlin/jvm/internal: 108
- kotlinx/coroutines/internal: 77
- kotlinx/serialization/descriptors: 38
- java/util/function: 36
- kotlin/io/path: 35
- kotlinx/coroutines/selects: 32
- kotlinx/coroutines/debug: 32
- org/jetbrains/annotations: 30
- org/slf4j/helpers: 27
