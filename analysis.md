# Flutter APK analysis
## files in flutter_assets
AssetManifest.bin
FontManifest.json
NOTICES.Z
NativeAssetsManifest.json
assets/audio/bgm/LICENSE.txt
assets/audio/bgm/Ludum_Dare_32_Track_4.wav
assets/audio/bgm/README.txt
assets/audio/sfx/759825__noisyredfox__hitwood.wav
assets/audio/sfx/LICENSE
assets/google_fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-Bold.ttf
assets/google_fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-BoldItalic.ttf
assets/google_fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-Italic.ttf
assets/google_fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-Regular.ttf
assets/google_fonts/Atkinson_Hyperlegible/OFL.txt
assets/google_fonts/Silkscreen/OFL.txt
assets/google_fonts/Silkscreen/Silkscreen-Bold.ttf
assets/google_fonts/Silkscreen/Silkscreen-Regular.ttf
assets/icon/icon.png
assets/images/LICENSE.md
assets/images/bullet_shapes.png
assets/images/character_subset.png
assets/images/coin.png
assets/images/log_gold.png
assets/images/log_green.png
assets/images/log_normal.png
assets/images/overworld.png
fonts/MaterialIcons-Regular.otf
packages/nes_ui/assets/checkered_pattern.png
packages/nes_ui/google_fonts/OFL.txt
packages/nes_ui/google_fonts/PressStart2P-Regular.ttf
shaders/ink_sparkle.frag
shaders/stretch_effect.frag
## AssetManifest

## FontManifest
[{"family":"MaterialIcons","fonts":[{"asset":"fonts/MaterialIcons-Regular.otf"}]}]
## libraries
total 19044
drwxr-xr-x 2 runner runner     4096 Nov 17 15:30 .
drwxr-xr-x 5 runner runner     4096 Nov 17 15:30 ..
-rw-r--r-- 1 runner runner  5833616 Jan  1  1981 libapp.so
-rw-r--r-- 1 runner runner   131248 Jan  1  1981 libdartjni.so
-rw-r--r-- 1 runner runner     7112 Jan  1  1981 libdatastore_shared_counter.so
-rw-r--r-- 1 runner runner 11581856 Jan  1  1981 libflutter.so
-rw-r--r-- 1 runner runner  1925520 Jan  1  1981 libflutter_soloud_plugin.so
## Dart version (from libflutter.so)
3.12.2 (stable) (Tue Jun 9 01:11:39 2026 -0700) on "android_arm64"
## snapshot hash (libapp.so)
ace654289f5abc240509fc941453ebc5product no-code_comments no-dwarf_stack_traces_mode dedup_instructions no-asan no-msan no-tsan no-shared_data arm64 android compressed-pointers
## libapp.so strings: 32143 total
### package: URIs (the app's own Dart files)
package:crypto/src/digest.dart
package:crypto/src/digest_sink.dart
package:crypto/src/hash.dart
package:crypto/src/hash_sink.dart
package:crypto/src/sha256.dart
package:equatable/src/equatable.dart
package:equatable/src/equatable_utils.dart
package:ffi/src/allocation.dart
package:ffi/src/arena.dart
package:ffi/src/utf16.dart
package:ffi/src/utf8.dart
package:flame_forge2d/body_component.dart
package:flame_forge2d/contact_callbacks.dart
package:flame_forge2d/forge2d_game.dart
package:flame_forge2d/forge2d_world.dart
package:flame_forge2d/world_contact_listener.dart
package:flutter_localizations/src/cupertino_localizations.dart
package:flutter_localizations/src/l10n/generated_cupertino_localizations.dart
package:flutter_localizations/src/l10n/generated_date_localizations.dart
package:flutter_localizations/src/l10n/generated_material_localizations.dart
package:flutter_localizations/src/l10n/generated_widgets_localizations.dart
package:flutter_localizations/src/material_localizations.dart
package:flutter_localizations/src/utils/date_localizations.dart
package:flutter_localizations/src/widgets_localizations.dart
package:flutter_mini_sprite/src/flutter_mini_sprite.dart
package:flutter_soloud/src/audio_source.dart
package:flutter_soloud/src/bindings/bindings_player.dart
package:flutter_soloud/src/bindings/bindings_player_ffi.dart
package:flutter_soloud/src/bindings/soloud_controller_ffi.dart
package:flutter_soloud/src/enums.dart
package:flutter_soloud/src/exceptions/exceptions.dart
package:flutter_soloud/src/exceptions/exceptions_from_cpp.dart
package:flutter_soloud/src/exceptions/exceptions_from_dart.dart
package:flutter_soloud/src/helpers/looping_region.dart
package:flutter_soloud/src/soloud.dart
package:flutter_soloud/src/utils/loader_io.dart
package:forge2d/src/callbacks/contact_filter.dart
package:forge2d/src/callbacks/contact_impulse.dart
package:forge2d/src/callbacks/contact_listener.dart
package:forge2d/src/callbacks/pair_callback.dart
package:forge2d/src/callbacks/query_callback.dart
package:forge2d/src/callbacks/tree_callback.dart
package:forge2d/src/collision/aabb.dart
package:forge2d/src/collision/broadphase/broadphase.dart
package:forge2d/src/collision/broadphase/broadphase_strategy.dart
package:forge2d/src/collision/broadphase/default_broadphase_buffer.dart
package:forge2d/src/collision/broadphase/dynamic_tree.dart
package:forge2d/src/collision/broadphase/dynamic_tree_node.dart
package:forge2d/src/collision/broadphase/pair.dart
package:forge2d/src/collision/collision.dart
package:forge2d/src/collision/contact_id.dart
package:forge2d/src/collision/distance.dart
package:forge2d/src/collision/distance_input.dart
package:forge2d/src/collision/distance_output.dart
package:forge2d/src/collision/manifold.dart
package:forge2d/src/collision/manifold_point.dart
package:forge2d/src/collision/shapes/chain_shape.dart
package:forge2d/src/collision/shapes/circle_shape.dart
package:forge2d/src/collision/shapes/edge_shape.dart
package:forge2d/src/collision/shapes/mass_data.dart
package:forge2d/src/collision/shapes/polygon_shape.dart
package:forge2d/src/collision/shapes/shape.dart
package:forge2d/src/collision/shapes/shape_type.dart
package:forge2d/src/collision/time_of_impact.dart
package:forge2d/src/collision/world_manifold.dart
package:forge2d/src/common/rot.dart
package:forge2d/src/common/sweep.dart
package:forge2d/src/common/timer.dart
package:forge2d/src/common/transform.dart
package:forge2d/src/dynamics/body.dart
package:forge2d/src/dynamics/body_def.dart
package:forge2d/src/dynamics/body_type.dart
package:forge2d/src/dynamics/contact_manager.dart
package:forge2d/src/dynamics/contacts/chain_and_circle_contact.dart
package:forge2d/src/dynamics/contacts/chain_and_polygon_contact.dart
package:forge2d/src/dynamics/contacts/circle_contact.dart
package:forge2d/src/dynamics/contacts/contact.dart
package:forge2d/src/dynamics/contacts/contact_position_and_constraint.dart
package:forge2d/src/dynamics/contacts/contact_solver.dart
package:forge2d/src/dynamics/contacts/contact_velocity_constraint.dart
package:forge2d/src/dynamics/contacts/edge_and_circle_contact.dart
package:forge2d/src/dynamics/contacts/edge_and_polygon_contact.dart
package:forge2d/src/dynamics/contacts/polygon_and_circle_contact.dart
package:forge2d/src/dynamics/contacts/polygon_contact.dart
package:forge2d/src/dynamics/contacts/position.dart
package:forge2d/src/dynamics/contacts/velocity.dart
package:forge2d/src/dynamics/filter.dart
package:forge2d/src/dynamics/fixture.dart
package:forge2d/src/dynamics/fixture_def.dart
package:forge2d/src/dynamics/fixture_proxy.dart
package:forge2d/src/dynamics/island.dart
package:forge2d/src/dynamics/joints/joint.dart
package:forge2d/src/dynamics/profile.dart
package:forge2d/src/dynamics/solver_data.dart
package:forge2d/src/dynamics/time_step.dart
package:forge2d/src/dynamics/world.dart
package:forge2d/src/particle/particle.dart
package:forge2d/src/particle/particle_body_contact.dart
package:forge2d/src/particle/particle_callbacks.dart
package:forge2d/src/particle/particle_contact.dart
package:forge2d/src/particle/particle_group.dart
package:forge2d/src/particle/particle_system.dart
package:forge2d/src/settings.dart
package:google_fonts/src/file_io_desktop_and_mobile.dart
package:google_fonts/src/google_fonts_base.dart
package:google_fonts/src/google_fonts_descriptor.dart
package:google_fonts/src/google_fonts_family_with_variant.dart
package:google_fonts/src/google_fonts_variant.dart
package:http/src/abortable.dart
package:http/src/base_client.dart
package:http/src/base_request.dart
package:http/src/base_response.dart
package:http/src/byte_stream.dart
package:http/src/client.dart
package:http/src/exception.dart
package:http/src/io_client.dart
package:http/src/io_streamed_response.dart
package:http/src/request.dart
package:http/src/response.dart
package:http/src/streamed_response.dart
package:http/src/utils.dart
package:jni/src/accessors.dart
package:jni/src/core_bindings.dart
package:jni/src/errors.dart
package:jni/src/jclass.dart
package:jni/src/jni.dart
package:jni/src/jobject.dart
package:jni/src/jprimitives.dart
package:jni/src/jreference.dart
package:jni/src/jvalues.dart
package:jni/src/lang/jstring.dart
package:jni/src/third_party/global_env_extensions.dart
package:jni/src/third_party/jni_bindings_generated.dart
package:jni/src/types.dart
package:jni_flutter/src/generated_plugin.dart
package:jni_flutter/src/jni_flutter.dart
package:logging/src/level.dart
package:logging/src/log_record.dart
package:logging/src/logger.dart
package:material_color_utilities/contrast/contrast.dart
package:material_color_utilities/dislike/dislike_analyzer.dart
package:material_color_utilities/dynamiccolor/dynamic_color.dart
package:material_color_utilities/dynamiccolor/dynamic_scheme.dart
package:material_color_utilities/dynamiccolor/material_dynamic_colors.dart
package:material_color_utilities/dynamiccolor/src/contrast_curve.dart
package:material_color_utilities/dynamiccolor/src/tone_delta_pair.dart
package:material_color_utilities/dynamiccolor/variant.dart
package:material_color_utilities/hct/cam16.dart
package:material_color_utilities/hct/hct.dart
package:material_color_utilities/hct/src/hct_solver.dart
### text that looks like UI (spaces, capital letter, no code chars)
A RenderObject does not have any constraints before it has been laid out.
A message on the 
Abrir el men
Abrir men
Abrir menu de navega
Acessar licen
Address family not supported by protocol family, sourceAddress.type must be 
Afficher les licences
After defeating a gold monster, you'll get a coin.
After defeating a green monster, you'll get an extra bullet.
Agor y ddewislen llywio
Ahorra monedas para desbloquear nuevos art
All colors are grayscale, no chroma.
Allow undoing moves
Almost identical to Fidelity.
Already waiting for next.
An async operation is currently pending
An overlay lets widgets float on top of other widget children.
Angalia leseni
Aon chead
App info
Apri il menu di navigazione
Are you sure you want to restart? You can't undo this
Assertion failed
Asset not found
Attempt to access isolate static field '
Attempt to access variable that was not assigned a value.
Attempted to use type '
Ava navigeerimismen
Avaa navigointivalikko
Bekyk lisensies
Bigger bullets
Bounce your shots off the walls to hit the most monsters.
Broadcast stream controllers do not support pause callbacks
BufferStream with released buffer type cannot be seeked.
Buka amalayisense
Buka menu navigasi
Buksan ang menu ng navigation
Bullet colors
Bullet shapes
Bullet timeout reached
Bus id not found!
Can't finalize a finalized Request.
Cannot add event after closing
Cannot add event while adding a stream
Cannot add new events after calling close
Cannot add new events while doing an addStream
Cannot add to a fixed-length list
Cannot add to an unmodifiable list
Cannot be a string, number, boolean, record, null, Pointer, Struct or Union
Cannot change an unmodifiable set
Cannot check existence of file
Cannot clear an unmodifiable list
Cannot clone a disposed image.
Cannot close file
Cannot complete a future with itself
Cannot create file
Cannot extract a file path from a 
Cannot extract a file path from a URI with a fragment component
Cannot extract a file path from a URI with a query component
Cannot extract a non-Windows file path from a file URI with an authority
Cannot find extension 
Cannot fire new event. Controller is already firing an event
Cannot instantiate abstract class 
Cannot modify an unmodifiable list
Cannot modify unmodifiable map
Cannot open file
Cannot remove from a fixed-length list
Cannot remove from an unmodifiable list
Cannot send errors on sockets
Chunk size overflows the integer
Class '
ClientException with 
Codec failed to produce an image, possibly due to invalid image data.
Colores de bala
Como se Juega
Computation ended without result
Connection closed before data was received
Connection closed before full body was received
Connection closed before full header was received
Connection closed before response was received
Connection closed while receiving data
Connection failed
Connection terminated during handshake
Content size below specified contentLength.  
Content size exceeds specified contentLength. 
Content-Length must contain only digits
Content-Length too large
Control character in string
Could not allocate 
Creation failed
Cyclic error in JSON stringify
DLL not found, or wrong DLL!
Data on closed connection
Data on failed connection
Defeat the monsters by dragging to aim and releasing to shoot.
Deferred library 
Deleted enum value from 
Derrota a los monstruos arrastr
Deshacer movimiento
Dim trwydded
Double release error
EEE MM-dd
EEE d 'de' MMM
EEE d LLL
EEE d MMM
EEE d MMM y
EEE d-M
EEE d-M-y
EEE d. M.
EEE d. M. y
EEE d. MMM
EEE d. MMM y
EEE d.M
EEE d.M.
EEE d.M.y
EEE y-MM-dd
EEE, MM-dd
EEE, MMM d
EEE, MMM d, y
EEE, d 'de' MMM
EEE, d 'de' MMM 'de' y
EEE, d MMM
EEE, d MMM y
EEE, d MMM, y
EEE, d MMM. y
EEE, d, MMM y
EEE, d-M
EEE, d-MMM
EEE, d-MMM, y
EEE, d. M.
EEE, d. M. y
EEE, d. M. y.
EEE, d. MMM
EEE, d. MMM y
EEE, d. MMM y.
EEE, d. MMMM y
EEE, d.M
EEE, d.M.
EEE, d.M.y
EEE, d.MM
EEE, d.MM.y
EEE, d.MM.y.
EEE, dd MMM
EEE, dd MMM y
EEE, dd-MM
EEE, dd-MM-y
EEE, dd-MM.
EEE, dd. MM.
EEE, dd. MM. y.
EEE, dd.MM
EEE, dd.MM.
EEE, dd.MM.y
EEE, y-M-d
EEE, y-MM-dd
EEE, y. 'g'. d. MMM
EEEE 'den' d. MMMM y
EEEE d LLLL
EEEE d MMMM
EEEE d MMMM y
EEEE d. MMMM
EEEE d. MMMM y
EEEE, MMMM d
EEEE, MMMM d, y
EEEE, d 'de' MMMM
EEEE, d 'de' MMMM 'de' y
EEEE, d MMMM
EEEE, d MMMM 'del' y
EEEE, d MMMM y
EEEE, d MMMM, y
EEEE, d-MMMM
EEEE, d-MMMM, y
EEEE, d. MMMM
EEEE, d. MMMM y
EEEE, d. MMMM y.
EEEE, dd MMMM
EEEE, y. 'gada' d. MMMM
Easy-to-read font
Empty IP address
Encoded surrogate
Error handler must accept one Object or one Object and a StackTrace as arguments.
Espera, cancela!
Este programa no tiene ninguna garant
Exists failed
Expected envelope List, got 
Expected envelope, got nothing
Fading in bg music
Fading out bg music
Failed to create Opus decoder.
Failed to decode Opus packet.
Failed to load font with url 
Failed to parse HTTP, 
Failed to parse header value
Failed to read PCM frames.
Failed to retrieve decoder data format.
Failed to seek audio data.
Feature not implemented!
Field '
File closed
File from 
blutter exit 0 after 129s
## blutter output
.
./asm
./blutter_frida.js
./ida_script
./objs.txt
./pp.txt
54M	.
### asm files (one per Dart library) of the app itself
./.dart_tool/flutter_build/dart_plugin_registrant.dart
./crypto/src/digest.dart
./crypto/src/digest_sink.dart
./crypto/src/hash.dart
./crypto/src/hash_sink.dart
./crypto/src/sha256.dart
./equatable/src/equatable.dart
./equatable/src/equatable_utils.dart
./ffi/src/allocation.dart
./ffi/src/arena.dart
./ffi/src/utf16.dart
./ffi/src/utf8.dart
./flame_forge2d/body_component.dart
./flame_forge2d/contact_callbacks.dart
./flame_forge2d/forge2d_game.dart
./flame_forge2d/forge2d_world.dart
./flame_forge2d/world_contact_listener.dart
./flutter_localizations/src/cupertino_localizations.dart
./flutter_localizations/src/l10n/generated_cupertino_localizations.dart
./flutter_localizations/src/l10n/generated_date_localizations.dart
./flutter_localizations/src/l10n/generated_material_localizations.dart
./flutter_localizations/src/l10n/generated_widgets_localizations.dart
./flutter_localizations/src/material_localizations.dart
./flutter_localizations/src/utils/date_localizations.dart
./flutter_localizations/src/widgets_localizations.dart
./flutter_mini_sprite/src/flutter_mini_sprite.dart
./flutter_soloud/src/audio_source.dart
./flutter_soloud/src/bindings/bindings_player.dart
./flutter_soloud/src/bindings/bindings_player_ffi.dart
./flutter_soloud/src/bindings/soloud_controller_ffi.dart
./flutter_soloud/src/enums.dart
./flutter_soloud/src/exceptions/exceptions.dart
./flutter_soloud/src/helpers/looping_region.dart
./flutter_soloud/src/soloud.dart
./flutter_soloud/src/utils/loader_io.dart
./forge2d/src/callbacks/contact_filter.dart
./forge2d/src/callbacks/contact_impulse.dart
./forge2d/src/callbacks/contact_listener.dart
./forge2d/src/callbacks/pair_callback.dart
./forge2d/src/callbacks/query_callback.dart
./forge2d/src/callbacks/tree_callback.dart
./forge2d/src/collision/aabb.dart
./forge2d/src/collision/broadphase/broadphase.dart
./forge2d/src/collision/broadphase/broadphase_strategy.dart
./forge2d/src/collision/broadphase/default_broadphase_buffer.dart
./forge2d/src/collision/broadphase/dynamic_tree.dart
./forge2d/src/collision/broadphase/dynamic_tree_node.dart
./forge2d/src/collision/broadphase/pair.dart
./forge2d/src/collision/collision.dart
./forge2d/src/collision/contact_id.dart
./forge2d/src/collision/distance.dart
./forge2d/src/collision/distance_input.dart
./forge2d/src/collision/distance_output.dart
./forge2d/src/collision/manifold.dart
./forge2d/src/collision/manifold_point.dart
./forge2d/src/collision/shapes/chain_shape.dart
./forge2d/src/collision/shapes/circle_shape.dart
./forge2d/src/collision/shapes/edge_shape.dart
./forge2d/src/collision/shapes/mass_data.dart
./forge2d/src/collision/shapes/polygon_shape.dart
./forge2d/src/collision/shapes/shape.dart
./forge2d/src/collision/shapes/shape_type.dart
./forge2d/src/collision/time_of_impact.dart
./forge2d/src/collision/world_manifold.dart
./forge2d/src/common/rot.dart
./forge2d/src/common/sweep.dart
./forge2d/src/common/timer.dart
./forge2d/src/common/transform.dart
./forge2d/src/dynamics/body.dart
./forge2d/src/dynamics/body_def.dart
./forge2d/src/dynamics/body_type.dart
./forge2d/src/dynamics/contact_manager.dart
./forge2d/src/dynamics/contacts/chain_and_circle_contact.dart
./forge2d/src/dynamics/contacts/chain_and_polygon_contact.dart
./forge2d/src/dynamics/contacts/circle_contact.dart
./forge2d/src/dynamics/contacts/contact.dart
./forge2d/src/dynamics/contacts/contact_position_and_constraint.dart
./forge2d/src/dynamics/contacts/contact_solver.dart
./forge2d/src/dynamics/contacts/contact_velocity_constraint.dart
./forge2d/src/dynamics/contacts/edge_and_circle_contact.dart
./forge2d/src/dynamics/contacts/edge_and_polygon_contact.dart
./forge2d/src/dynamics/contacts/polygon_and_circle_contact.dart
./forge2d/src/dynamics/contacts/polygon_contact.dart
./forge2d/src/dynamics/contacts/position.dart
./forge2d/src/dynamics/contacts/velocity.dart
./forge2d/src/dynamics/filter.dart
./forge2d/src/dynamics/fixture.dart
./forge2d/src/dynamics/fixture_def.dart
./forge2d/src/dynamics/fixture_proxy.dart
./forge2d/src/dynamics/island.dart
./forge2d/src/dynamics/joints/joint.dart
./forge2d/src/dynamics/profile.dart
./forge2d/src/dynamics/solver_data.dart
./forge2d/src/dynamics/time_step.dart
./forge2d/src/dynamics/world.dart
./forge2d/src/particle/particle.dart
./forge2d/src/particle/particle_body_contact.dart
./forge2d/src/particle/particle_callbacks.dart
./forge2d/src/particle/particle_contact.dart
./forge2d/src/particle/particle_group.dart
./forge2d/src/particle/particle_system.dart
./forge2d/src/settings.dart
./google_fonts/src/file_io_desktop_and_mobile.dart
./google_fonts/src/google_fonts_all_parts.g.dart
./google_fonts/src/google_fonts_base.dart
./google_fonts/src/google_fonts_descriptor.dart
./google_fonts/src/google_fonts_family_with_variant.dart
./google_fonts/src/google_fonts_parts/part_a.g.dart
./google_fonts/src/google_fonts_parts/part_p.g.dart
./google_fonts/src/google_fonts_parts/part_s.g.dart
./google_fonts/src/google_fonts_variant.dart
./http/src/abortable.dart
./http/src/base_client.dart
./http/src/base_request.dart
./http/src/base_response.dart
./http/src/byte_stream.dart
./http/src/client.dart
./http/src/exception.dart
./http/src/io_client.dart
./http/src/io_streamed_response.dart
./http/src/request.dart
./http/src/response.dart
./http/src/streamed_response.dart
./http/src/utils.dart
./jni/src/accessors.dart
./jni/src/core_bindings.dart
./jni/src/errors.dart
./jni/src/jni.dart
./jni/src/jobject.dart
./jni/src/jreference.dart
./jni/src/jvalues.dart
./jni/src/lang/jstring.dart
./jni/src/third_party/global_env_extensions.dart
./jni/src/third_party/jni_bindings_generated.dart
./jni/src/types.dart
./jni_flutter/src/generated_plugin.dart
./jni_flutter/src/jni_flutter.dart
./logging/src/level.dart
./logging/src/log_record.dart
./logging/src/logger.dart
./material_color_utilities/contrast/contrast.dart
./material_color_utilities/dislike/dislike_analyzer.dart
./material_color_utilities/dynamiccolor/dynamic_color.dart
./material_color_utilities/dynamiccolor/dynamic_scheme.dart
./material_color_utilities/dynamiccolor/material_dynamic_colors.dart
./material_color_utilities/dynamiccolor/src/contrast_curve.dart
./material_color_utilities/dynamiccolor/src/tone_delta_pair.dart
./material_color_utilities/dynamiccolor/variant.dart
./material_color_utilities/hct/cam16.dart
./material_color_utilities/hct/hct.dart
### classes in the app's own libraries
class AimDetails extends Object 
class AimGuide extends _MixinApplication264&PositionComponent&HasGameReference 
class AppLocaleUtils extends BaseAppLocaleUtils<dynamic, dynamic> 
class Background extends _MixinApplication264&PositionComponent&HasGameReference 
class BouncingIcon extends StatefulWidget 
class Bullet extends _MixinApplication267&BodyComponent&ContactCallbacks 
class BulletColorShopItem extends ShopItem 
class BulletPainter extends CustomPainter 
class BulletShapeShopItem extends ShopItem 
class CoinCount extends StatelessWidget 
class CoinIcon extends StatelessWidget 
class DialogButton extends StatelessWidget 
class FpsCounter extends StatelessWidget 
class GameData extends Object 
class GameOverDialog extends StatelessWidget 
class GrassSprite extends _MixinApplication418&SpriteComponent&HasGameReference&DarkeningSprite 
class GroundSprite extends _MixinApplication418&SpriteComponent&HasGameReference&DarkeningSprite 
class HealthBar extends PositionComponent 
class HomePage extends StatelessWidget 
class LoadingPage extends StatefulWidget 
class LocaleSettings extends BaseFlutterLocaleSettings<dynamic, dynamic> 
class Monster extends _MixinApplication267&BodyComponent&ContactCallbacks 
class MonsterAnimation extends _MixinApplication269&SpriteAnimationGroupComponent&HasGameReference 
class MonsterWidget extends StatelessWidget 
class MyApp extends StatefulWidget 
class PlayPage extends StatefulWidget 
class Player extends _MixinApplication270&SpriteAnimationGroupComponent&HasGameReference 
class PlayerWidget extends StatelessWidget 
class RestartGameDialog extends StatelessWidget 
class RicochlimeAudio extends Object 
class RicochlimeGame extends _MixinApplication140&Forge2DGame&PanDetector&TapCallbacks&MouseMovementDetector&SingleGameInstance 
class SettingsPage extends StatelessWidget 
class ShopPage extends StatelessWidget 
class SkullSprite extends _MixinApplication419&SpriteComponent&HasGameReference&FlickeringSprite 
class SkullsWidget extends StatelessWidget 
class SpritePainter extends CustomPainter 
class Stows extends Object 
class Task extends ChangeNotifier 
class Ticker extends Object 
class TranslationProvider extends BaseTranslationProvider<dynamic, dynamic> 
class Translations extends _MixinApplication2&Object&BaseTranslations 
class TranslationsEs extends _MixinApplication135&Translations&BaseTranslations 
class TranslationsGameOverPageEn extends Object 
class TranslationsHomePageEn extends Object 
class TranslationsKk extends _MixinApplication135&Translations&BaseTranslations 
class TranslationsPlayPageEn extends Object 
class TranslationsRestartGameDialogEn extends Object 
class TranslationsRu extends _MixinApplication135&Translations&BaseTranslations 
class TranslationsSettingsPageEn extends Object 
class TranslationsShopPageEn extends Object 
class TranslationsTutorialPageEn extends Object 
class TutorialPage extends StatelessWidget 
class Wall extends BodyComponent<dynamic> 
class _AudioPool extends Object 
class _BounceOffWallsGraphic extends StatelessWidget 
class _BounceOffWallsGraphicPainter extends CustomPainter 
class _BouncingIconState extends _MixinApplication271&State&SingleTickerProviderStateMixin 
class _HomePageButton<X0> extends StatefulWidget 
class _HomePageButtonState<C1X0> extends State<C1X0> 
class _LoadingPageState extends State<dynamic> 
class _MonsterMovement extends Object 
class _MyAppState extends State<dynamic> 
class _PlayPageState extends _MixinApplication272&State&WidgetsBindingObserver 
class _ShopItemTile extends StatelessWidget 
class _SkullsGraphic extends StatelessWidget 
class _TranslationsGameOverPageEs extends TranslationsGameOverPageEn 
class _TranslationsGameOverPageKk extends TranslationsGameOverPageEn 
class _TranslationsGameOverPageRu extends TranslationsGameOverPageEn 
class _TranslationsHomePageEs extends TranslationsHomePageEn 
class _TranslationsHomePageKk extends TranslationsHomePageEn 
class _TranslationsHomePageRu extends TranslationsHomePageEn 
class _TranslationsPlayPageEs extends TranslationsPlayPageEn 
class _TranslationsPlayPageKk extends TranslationsPlayPageEn 
class _TranslationsPlayPageRu extends TranslationsPlayPageEn 
class _TranslationsRestartGameDialogEs extends TranslationsRestartGameDialogEn 
class _TranslationsRestartGameDialogKk extends TranslationsRestartGameDialogEn 
class _TranslationsRestartGameDialogRu extends TranslationsRestartGameDialogEn 
class _TranslationsSettingsPageEs extends TranslationsSettingsPageEn 
class _TranslationsSettingsPageKk extends TranslationsSettingsPageEn 
class _TranslationsSettingsPageRu extends TranslationsSettingsPageEn 
class _TranslationsShopPageEs extends TranslationsShopPageEn 
class _TranslationsShopPageKk extends TranslationsShopPageEn 
class _TranslationsShopPageRu extends TranslationsShopPageEn 
class _TranslationsTutorialPageEs extends TranslationsTutorialPageEn 
class _TranslationsTutorialPageKk extends TranslationsTutorialPageEn 
class _TranslationsTutorialPageRu extends TranslationsTutorialPageEn 
class _TutorialGraphic extends StatelessWidget 
4.2M	out/blutter
