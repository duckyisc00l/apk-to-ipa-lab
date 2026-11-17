"""Add an iPhone platform (PLATFORM=ios) to a Butterscotch checkout: a static library, OpenGL ES 3, miniaudio.

Usage: python3 -I ci/gamemaker/ios/patch_engine.py <engine dir>
Copies ios_runner.c/.h and stb_impl.c into src/ios/ and the GLES3/gl3.h shim into src/ios/shim/.
Every change is a small text edit that fails loudly if the runner's code moved.
"""
import pathlib, re, shutil, sys

here = pathlib.Path(__file__).resolve().parent
eng = pathlib.Path(sys.argv[1])
ios = eng / "src" / "ios"
ios.mkdir(parents=True, exist_ok=True)
for f in ("ios_runner.c", "ios_runner.h", "stb_impl.c"):
    shutil.copy(here / f, ios / f)
shutil.copytree(here / "shim", ios / "shim", dirs_exist_ok=True)


def edit(path, old, new, count=1):
    t = path.read_text()
    n = t.count(old)
    if n < count:
        sys.exit(f"patch_engine: '{old[:60]}' found {n} times in {path}, expected {count}")
    path.write_text(t.replace(old, new) if count == 0 else t.replace(old, new, count))


cm = eng / "CMakeLists.txt"
# no main loop file (the app drives frames), like Android
edit(cm, 'if(PLATFORM STREQUAL "ps2" OR PLATFORM STREQUAL "ps3" OR PLATFORM STREQUAL "android")',
     'if(PLATFORM STREQUAL "ps2" OR PLATFORM STREQUAL "ps3" OR PLATFORM STREQUAL "android" OR PLATFORM STREQUAL "ios")')
# a static library that the app links
edit(cm, 'if(PLATFORM STREQUAL "android")\n    add_library(butterscotch SHARED',
     'if(PLATFORM STREQUAL "ios")\n    add_library(butterscotch STATIC ${SOURCES} ${PLATFORM_SOURCES} ${AUDIO_SOURCES} ${DEFAULT_FONT_SOURCES})\n'
     'elseif(PLATFORM STREQUAL "android")\n    add_library(butterscotch SHARED')
# GL renderer, GLES headers, miniaudio as Objective-C (its iPhone audio session code)
edit(cm, 'elseif(PLATFORM STREQUAL "android")\n    if (NOT ENABLE_MODERN_GL)',
     'elseif(PLATFORM STREQUAL "ios")\n'
     '    file(GLOB GL_SOURCES src/gl/*.c src/gl_common/*.c src/image/*.c)\n'
     '    target_sources(butterscotch PRIVATE ${GL_SOURCES})\n'
     '    target_include_directories(butterscotch PRIVATE ${CMAKE_SOURCE_DIR}/src/gl ${CMAKE_SOURCE_DIR}/src/gl_common ${CMAKE_SOURCE_DIR}/src/image ${CMAKE_SOURCE_DIR}/src/ios/shim)\n'
     '    add_compile_definitions(ENABLE_GLES PLATFORM_IOS GL_SILENCE_DEPRECATION ENABLE_VM_STUB_LOGS)\n'
     '    set_source_files_properties(src/audio/miniaudio/ma_audio_system.c PROPERTIES COMPILE_FLAGS "-x objective-c")\n'
     '    target_include_directories(butterscotch PUBLIC vendor/stb/image vendor/stb/vorbis)\n'
     '    target_link_libraries(butterscotch PRIVATE bzip2 stb_ds sha1 stb_vorbis)\n'
     'elseif(PLATFORM STREQUAL "android")\n    if (NOT ENABLE_MODERN_GL)')

# the GL code treats Android as "OpenGL ES": treat iPhone the same way
n = 0
for p in list((eng / "src" / "gl").glob("*.[ch]")) + list((eng / "src" / "gl_common").glob("*.[ch]")):
    t = p.read_text()
    t2 = t.replace("defined(__ANDROID__)", "(defined(__ANDROID__) || defined(PLATFORM_IOS))")
    if t2 != t:
        n += t.count("defined(__ANDROID__)")
        p.write_text(t2)
print(f"patch_engine: CMakeLists.txt patched, {n} GLES checks extended to PLATFORM_IOS")
if n < 5:
    sys.exit("patch_engine: fewer GLES checks than expected; the runner changed")
