# Detection suite

**Engine detection: 58/58 passed (100%)**, 28 engine families. Protection false positives (packed/encrypted on open-source apps): 0/58. Skipped (no APK or download failed): 0.

| app | release / asset | MB | expected | detected engine | variant | route | evidence | protection flags | result |
|---|---|---|---|---|---|---|---|---|---|
| VarunS2002/Ionic-Tic-Tac-Toe | 1.1.1 / Tic-Tac-Toe-1.1.1.apk | 7.5 | web-cordova+ionic | Web (Cordova) | ionic | run unchanged (step 2-5) | assets/www/index.html, assets/www/cordova.js | none | pass |
| 6c65726f79/Transmissionic | v1.8.0 / Transmissionic-android-v1.8.0.apk | 3.5 | web-capacitor | Web (Capacitor) | ionic | run unchanged (step 2-5) | assets/capacitor.config.json | none | pass |
| jupiutrera/open-chess | v0.9.1 / open-chess-v0.9.1.apk | 13.5 | web-capacitor | Web (Capacitor) |  | run unchanged (step 2-5) | assets/capacitor.config.json | none | pass |
| tomfong/simple-qr | v5.1.1 / com.tomfong.simpleqr-50101-release.apk | 30.3 | web-capacitor+ionic | Web (Capacitor) | ionic | run unchanged (step 2-5) | assets/capacitor.config.json | none | pass |
| thenaim/ionic-tk-social-network | v2.2.0 / app-release.apk | 3.6 | web-capacitor+ionic | Web (Capacitor) | ionic | run unchanged (step 2-5) | assets/capacitor.config.json | none | pass |
| Ahmadrezadl/legendary-chess | v1.3.1 / LegendaryChess_Android.apk | 7.5 | gamemaker | GameMaker |  | run unchanged (step G) | libyoyo.so, assets/game.droid | none | pass |
| Klisee/pokemon-reloaded-android | v0.4.2 / pokemon-reloaded-0.4.2-arm64-v8a.apk | 28.8 | gm8 | GameMaker 8 (through an emulator) |  | run unchanged (step G) | libgm8emulator.so | none | pass |
| UltraStar-Deluxe/Play | v0.9.0 / UltraStarPlay-v0.9.0-Android.apk | 33.2 | unity-mono | Unity | Mono 2022.2.4f1 | re-export (step U) | libunity.so, libmonobdwgc-2.0.so | none | pass |
| UltraStar-Deluxe/Play | v0.9.0 / UltraStarPlayCompanion-v0.9.0-Android.apk | 21.0 | unity-il2cpp | Unity | IL2CPP 2022.2.4f1 | re-export (step U) | libunity.so, libil2cpp.so | none | pass |
| imengyu/Ballance | v1.0.7 / Ballance-1.0.7-android.apk | 67.5 | unity-mono | Unity | Mono 2021.3.33f1 | re-export (step U) | libunity.so, libmonobdwgc-2.0.so | none | pass |
| AnimaRain/ShootAR | v0.5.0 / shootar_0.5.0.5.apk | 21.5 | unity-il2cpp | Unity | IL2CPP 2018.2.11f1 | re-export (step U) | libunity.so, libil2cpp.so | none | pass |
| ankitpassi141/Wanderer-VR | v1.0 / MadTitans_WandererVR.apk | 204.5 | unreal | Unreal | UE4 | rewrite (step X) | libUE4.so | none | pass |
| HarmonyHoney/ROTA | 2026.03.12 / ROTA.apk | 66.5 | godot3 | Godot | Godot 3.6.1.stable | re-export (step E) | libgodot_android.so, version 3.6.1.stable | none | pass |
| arshiyabarjaste-eng/PixelFist | v1.0.0 / PixelFist_v1.0.0_Myket.apk | 138.5 | godot | Godot | Godot 4.3.stable | re-export (step E) | libgodot_android.so, version 4.3.stable | none | pass |
| saber-nyan/ddlc-android | v0.0.5 / DokiDokiLiteratureClub-0.0.5-release.apk | 249.8 | renpy | Ren'Py | old (libpython2.7 + libpymodules) (6, 99, 14) | run unchanged (step E) | libpymodules.so, libpython2.7.so, assets/x-game/x-script_version.txt | none | pass |
| saber-nyan/test-renpy-vn | v1.0.0 / testrenpyvn-1.0.0-release.apk | 25.0 | renpy | Ren'Py | old (libpython2.7 + libpymodules) (6, 99, 13) | run unchanged (step E) | libpymodules.so, libpython2.7.so, assets/x-game/x-script_version.txt | none | pass |
| MewX/cross-channel_chinese-localization_project | moved.v1.01.basedon.v0.99 / crosschannel-1.01-android.apk | 7.7 | renpy | Ren'Py | old (libpython2.7 + libpymodules) | run unchanged (step E) | libpymodules.so, libpython2.7.so | none | pass |
| LIKO-12/LIKO-12 | 1.0.1 / LIKO-12_V1.0.1_Android.apk | 11.1 | love | LOVE |  | run unchanged (step E) | liblove.so, assets/game.love | none | pass |
| Oval-Tutu/bootstrap-love2d-project | 0.1.2 / Template-0.1.2-release.apk | 9.9 | love | LOVE |  | run unchanged (step E) | liblove.so | none | pass |
| devhubapp/devhub | v0.102.0 / DevHub-0.102.0.apk | 31.9 | rn-plain | React Native | plain JS | run unchanged (step E) | libjsc.so, libreactnativejni.so, assets/index.android.bundle | none | pass |
| alekseynemiro/multi-duper-stopwatch | v1.2 / ru.nemiro.apps.multiduperstopwatch.apk | 25.6 | rn-hermes | React Native | Hermes bytecode | run unchanged (step E) | libhermes.so, libreactnativejni.so, assets/index.android.bundle | none | pass |
| sikelio/plexmanager | 0.0.4-beta / app-arm64-v8a-release.apk | 11.1 | rn-hermes | React Native | Hermes bytecode | run unchanged (step E) | libhermes.so, libreactnativejni.so, assets/index.android.bundle | none | pass |
| roshang1t/NetPrime | v3.0.0 / app-release.apk | 35.0 | rn+expo | React Native | Hermes bytecode, Expo | run unchanged (step E) | libreactnative.so, libhermes.so, assets/index.android.bundle, libexpo-modules-core.so | none | pass |
| e18lab/NHApp | 1.3.1 / NHApp-Android-Setup-1.3.1.apk | 39.8 | rn+expo | React Native | Hermes bytecode, Expo | run unchanged (step E) | libreactnative.so, libhermesvm.so, assets/index.android.bundle, libexpo-modules-core.so | none | pass |
| adil192/ricochlime | v1.14.0 / Ricochlime_FOSS_v1.14.0.apk | 59.4 | flutter | Flutter |  | re-export (step E) | libapp.so, libflutter.so | none | pass |
| mantou132/nesbox | v1.0.8 / nesbox.apk | 17.5 | flutter | Flutter |  | re-export (step E) | libflutter.so, libapp.so | none | pass |
| lswiderski/mi-scale-exporter | v2.3.1 / com.lukaszswiderski.MiScaleExporter.apk | 40.3 | xamarin+maui | Xamarin/.NET | MAUI | re-export (step E) | libmonodroid.so, libmonosgen-2.0.so, libxamarin-app.so, libassemblies.arm64-v8a.blob.so | none | pass |
| stratumauth/app | v1.7.0 / com.stratumauth.app-arm64-v8a.fdroid.apk | 38.4 | xamarin | Xamarin/.NET | .NET Android (screens Android-only) | rewrite (step E) | libmonodroid.so, libxamarin-app.so | none | pass |
| bitwarden/mobile | v2024.10.0 / com.x8bit.bitwarden-fdroid.apk | 70.1 | xamarin+maui | Xamarin/.NET | MAUI | re-export (step E) | libmonodroid.so, libmonosgen-2.0.so, libxamarin-app.so | none | pass |
| yairm210/Unciv | 5.0.1 / Unciv-signed.apk | 27.6 | libgdx | libGDX |  | rewrite (step R) | libgdx.so | none | pass |
| 00-Evan/shattered-pixel-dungeon | 4.0.3-beta / ShatteredPD-v4.0.3-BETA-2-Android.apk | 30.5 | libgdx | libGDX |  | rewrite (step R) | libgdx.so | none | pass |
| j-jorge/bim | v17 / bim-17.apk | 65.3 | native-cpp | native C/C++ (own engine) |  | rewrite (step R) | libbim.so, NativeActivity in manifest | none | pass |
| TeamNewPipe/NewPipe | v0.29.3 / NewPipe_v0.29.3.apk | 17.0 | native | native (Java/Kotlin only) | Kotlin + Jetpack Compose, helper libs: libandroidx.graphics.path.so libsqliteJni.so | rewrite (step R) | META-INF/androidx.compose.*, Kotlin | none | pass |
| Kunzisoft/KeePassDX | 4.5.8 / KeePassDX-4.5.8-libre.apk | 16.8 | native | native (Java/Kotlin only) | Kotlin (Views), helper libs: libaes.so libargon2.so | rewrite (step R) | Kotlin | none | pass |
| Ashinch/ReadYou | 0.16.2 / ReadYou-0.16.2-091c9207-signed.apk | 11.2 | native-compose | native (Java/Kotlin only) | Kotlin + Jetpack Compose, helper libs: libandroidx.graphics.path.so libdatastore_shared_counter.so | rewrite (step R) | META-INF/androidx.compose.*, Kotlin | none | pass |
| maxrave-dev/SimpMusic | v2.6.0 / SimpMusic-foss-arm64-v8a-release.apk | 28.7 | native-compose | native (Java/Kotlin only) | Kotlin + Jetpack Compose, helper libs: libandroidx.graphics.path.so libavcodec.so libavdevice.so libavfilter.so libavformat.so libavutil.so | rewrite (step R) | META-INF/androidx.compose.*, Kotlin | none | pass |
| wh201906/SerialTest | V0.3.5 / V0.3.5-android.apk | 40.9 | qt | Qt | Qt 5 Widgets | re-export (step E) | libQt5Core_arm64-v8a.so, libQt5Core_armeabi-v7a.so, libQt5Core_x86.so | none | pass |
| nspire-emus/firebird | v1.6 / firebird-android.apk | 28.8 | qt | Qt | Qt 5 Quick/QML | re-export (step E) | libQt5Core_arm64-v8a.so, libQt5Core_armeabi-v7a.so, libQt5QuickWidgets_arm64-v8a.so | none | pass |
| GVCoder09/NoDPI4Android | v2.0 / NoDPI-2.0.apk | 1.9 | native-compose | native (Java/Kotlin only) | Kotlin + Jetpack Compose, helper libs: libandroidx.graphics.path.so libdatastore_shared_counter.so | rewrite (step R) | META-INF/androidx.compose.*, Kotlin | none | pass |
| Aarav2709/FR1-Replayed | v1.0.1 / FR1R.apk | 46.4 | solar2d | Solar2D (Corona) |  | run unchanged (step E) | libcorona.so, assets/resource.car | none | pass |
| HelloZeroNet/ZeroNet-kivy | v0.6.5.2 / zeronet-0.6.5.2-release-stable-arm64-v8a.apk | 18.5 | kivy | Kivy (Python) |  | run unchanged (step E) | libSDL2.so, libSDL2_image.so, libSDL2_mixer.so, libSDL2_ttf.so | none | pass |
| AndreMiras/PyWallet | v20200524 / pywallet-2020.0524-arm64-v8a-release.apk | 26.7 | kivy | Kivy (Python) |  | run unchanged (step E) | libSDL2.so, libSDL2_image.so, libSDL2_mixer.so, libSDL2_ttf.so | none | pass |
| opengisch/QField | v4.3.8 / qfield-v4.3.8-android-arm64.apk | 107.4 | qt+qt6 | Qt | Qt 6 Quick/QML | re-export (step E) | libQt6Core5Compat_arm64-v8a.so, libQt6Core_arm64-v8a.so, libQt6Quick3DAssetImport_arm64-v8a.so | none | pass |
| OlivierLDff/Qaterial | v1.2.1 / QaterialGallery-armeabi-v7a-release-signed.apk | 17.0 | qt+qt5 | Qt | Qt 5 Quick/QML | re-export (step E) | libQt5Core.so, libQt5Quick.so, libQt5QuickControls2.so | none | pass |
| ossappscollective/oss-weather | android/github/4.01.1/196 / app-arm64-v8a-release.apk | 11.3 | nativescript | NativeScript |  | re-export (step E) | libNativeScript.so, assets/app/447.js | none | pass |
| yumin-chen/arkaflow | v1.2 / com.CharmySoft.CCPP.apk | 3.9 | cocos-cpp | Cocos2d-x | C++ (game compiled in) | rewrite (step R) | libcocos2dcpp.so | none | pass |
| re-esper/dream-avg | 0.1 / Sakumai-release-signed.apk | 30.0 | cocos-lua | Cocos2d-x | Lua | run unchanged (step E) | libcocos2dlua.so | none | pass |
| yoimerdr/ludens | 0.4.0 / ludens-0.4.0-sample.apk.apk | 29.8 | web-html5+rpgmaker-mv | Web (own web view) | rpgmaker-mv | run unchanged (step 2-5) | assets/composeResources/ludens.composeapp.generated.resources/files/www/index.html | none | pass |
| lochidev/Expandroid | v7.3.1 / com.dingleinc.texttoolspro-arm64-v8a.apk | 20.1 | xamarin+maui | Xamarin/.NET | MAUI | re-export (step E) | libmonodroid.so, libmonosgen-2.0.so, libxamarin-app.so | none | pass |
| mykola-dev/Tetris | v1.0.18 / tetris-release.apk | 2.3 | native-compose | native (Java/Kotlin only) | Kotlin + Jetpack Compose | rewrite (step R) | META-INF/androidx.compose.*, Kotlin | none | pass |
| jayasuryat/minesweeper-j-compose | v1.0.1 / Minesweeper-jc-v1.0.1.apk | 3.2 | native-compose | native (Java/Kotlin only) | Kotlin + Jetpack Compose | rewrite (step R) | META-INF/androidx.compose.*, Kotlin | none | pass |
| pedropfsf/tic-tac-toe-game | v1.0.0 / Tic-Tac-Toe-Game-v1-0-0.apk | 33.9 | rn+expo | React Native | plain JS, Expo | run unchanged (step E) | libjsc.so, libreactnativejni.so, assets/index.android.bundle, Expo markers | none | pass |
| nunogois/game-search-expo | v1.1 / game-search-expo.apk | 61.0 | rn+expo | React Native | plain JS, Expo | run unchanged (step E) | libjsc.so, libreactnativejni.so, assets/app.bundle, libexpo-gl.so | none | pass |
| asetsiya/wateru | 1.11 / Wateru.apk | 10.7 | defold | Defold |  | run unchanged (step E) | assets/game.projectc, assets/game.dmanifest, assets/game.arcd | none | pass |
| killflex/flappybird-c3 | v0.1.0 / flappybird-release.apk | 2.9 | web-cordova+construct3 | Web (Cordova) | construct3 | run unchanged (step 2-5) | assets/www/index.html, assets/www/cordova.js | none | pass |
| aria0939/shadow-runner-pixel-adventure | v1.1 / shadow-runner-v1.1-debug.apk | 21.8 | web-capacitor+phaser | Web (Capacitor) | phaser | run unchanged (step 2-5) | assets/capacitor.config.json | none | pass |
| maxim-saplin/CrossPlatformDiskTest | 2.4.0 / com.Saplin.CPDT.apk | 34.7 | xamarin+xamarin-forms | Xamarin/.NET | Xamarin.Forms | re-export (step E) | libmonodroid.so, libxamarin-app.so, libmonosgen-2.0.so | none | pass |
| o1298098/Xamarin-CloudMusic | v0.0.1 / CloudMusic.apk | 45.0 | xamarin+xamarin-forms | Xamarin/.NET | Xamarin.Forms | re-export (step E) | libmonodroid.so, libmonosgen-2.0.so | none | pass |
