# libGDX split

- classes in classes.dex: 2200
- libGDX version (com.badlogic.gdx.Version): 1.10.0
- game classes (not libGDX, Android or common libraries): 738
- libGDX kept its own names (com.badlogic.gdx.Gdx present; if not, R8 renamed libGDX and the backend can't be swapped): True
- share of game classes with 1-2 letter names (obfuscated if high): 0.0
- Android-side classes (extend an Android or libGDX-Android class): 1

## Game packages
- j$/util/stream: 424
- j$/util: 77
- j$: 63
- j$/util/function: 55
- com/simple/tetriscompetitive: 43
- j$/util/concurrent: 29
- (default): 8
- org/objenesis/instantiator/basic: 8
- org/objenesis: 6
- org/objenesis/strategy: 6
- org/objenesis/instantiator/sun: 4
- org/objenesis/instantiator/gcj: 4

## ApplicationListener classes (main game first)
- com/simple/tetriscompetitive/GameSuper constructors ['()V']

## Android side
- com/simple/tetriscompetitive/AndroidLauncher extends com/badlogic/gdx/backends/android/AndroidApplication

## Other libraries
- com/badlogic/gdx: 1185
- com/esotericsoftware/kryo: 170
- com/esotericsoftware/kryonet: 48
- com/esotericsoftware/reflectasm: 23
- com/esotericsoftware/jsonbeans: 22
- com/esotericsoftware/minlog: 2
