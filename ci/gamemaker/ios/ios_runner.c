// iPhone host for the Butterscotch GameMaker runner (AGPL-3.0, github.com/ButterscotchRunner/Butterscotch).
// Modelled on the runner's own src/android/main.c; the app shell (main.m) calls these functions.
#include "stdio_compat.h"
#include <stdint.h>
#include "string_compat.h"
#include <errno.h>
#include <sys/stat.h>
#include <GLES3/gl3.h>

#include "common.h"
#include "data_win.h"
#include "runner.h"
#include "overlay_file_system.h"
#include "ma_audio_system.h"
#include "noop_audio_system.h"
#include "gl/gl_renderer.h"
#include "stb_ds.h"
#include "log.h"
#include "ios_runner.h"
#include <signal.h>
#include <unistd.h>
#include <execinfo.h>

static Runner* gRunner = nullptr;
static GLuint gHostFramebuffer = 0;
static FILE* gLog = nullptr;
static int32_t gWindowW = 0, gWindowH = 0;
static float gCursorX = 0.0f, gCursorY = 0.0f;
// A tap shorter than one game frame: hold the release until the game has seen the press.
static bool gDown = false, gDownSeen = false, gUpPending = false;

void platformLog(const logType type, const char* format, va_list va) {
    (void) type;
    if (gLog != nullptr) {
        va_list copy;
        va_copy(copy, va);
        vfprintf(gLog, format, copy);
        va_end(copy);
        fflush(gLog);
    }
    vfprintf(stderr, format, va);
}

static bool iosGetWindowSize(int32_t* outW, int32_t* outH) {
    if (gWindowW <= 0 || gWindowH <= 0) return false;
    if (outW != nullptr) *outW = gWindowW;
    if (outH != nullptr) *outH = gWindowH;
    return true;
}

// A crash prints the signal, the frame, the room and a native backtrace to stderr and game-log.txt.
static void crashHandler(int sig) {
    char buf[160];
    int n = snprintf(buf, sizeof(buf), "\n==== CRASH signal %d frame %d room %s ====\n", sig, gRunner ? (int) gRunner->frameCount : -1,
        gRunner && gRunner->currentRoom ? gRunner->currentRoom->name : "?");
    write(2, buf, (size_t) n);
    void* frames[48];
    int count = backtrace(frames, 48);
    backtrace_symbols_fd(frames, count, 2);
    if (gLog != nullptr) { fputs(buf, gLog); fflush(gLog); backtrace_symbols_fd(frames, count, fileno(gLog)); }
    signal(sig, SIG_DFL);
    raise(sig);
}

static void logExit(void) { fprintf(stderr, "IOSRunner: process exiting (frame %d)\n", gRunner ? (int) gRunner->frameCount : -1); }

static void iosSetWindowTitle(const char* title) { (void) title; }

bool IOSRunner_start(const char* dataWinPath, const char* savesPath, const char* logPath, uint32_t hostFramebuffer) {
    if (gRunner != nullptr) return false;
    if (logPath != nullptr) gLog = fopen(logPath, "w");
    gHostFramebuffer = hostFramebuffer;
    static const int sigs[] = {SIGSEGV, SIGBUS, SIGILL, SIGFPE, SIGABRT, SIGTRAP};
    for (size_t i = 0; i < sizeof(sigs) / sizeof(sigs[0]); i++) signal(sigs[i], crashHandler);
    atexit(logExit);
    if (mkdir(savesPath, 0777) != 0 && errno != EEXIST) logWarn("Could not create saves dir %s: %s\n", savesPath, strerror(errno));

    DataWin* dataWin = DataWin_parse(dataWinPath, (DataWinParserOptions) {
        .parseGen8 = true, .parseOptn = true, .parseLang = true, .parseExtn = true, .parseSond = true, .parseAgrp = true,
        .parseSprt = true, .parseBgnd = true, .parsePath = true, .parseScpt = true, .parseGlob = true, .parseShdr = true,
        .parseFont = true, .parseTmln = true, .parseObjt = true, .parseRoom = true, .parseTgin = true, .parseTpag = true,
        .parseCode = true, .parseVari = true, .parseFunc = true, .parseStrg = true, .parseTxtr = true, .parseAudo = true,
        .skipLoadingPreciseMasksForNonPreciseSprites = true,
        .loadType = DATAWINLOADTYPE_LOAD_IN_MEMORY_AHEAD_OF_TIME,
        .lazyLoadRooms = false, .eagerlyLoadedRooms = nullptr
    });
    if (dataWin == nullptr) { logError("Failed to parse %s\n", dataWinPath); return false; }

    char* bundleDir = safeStrdup(dataWinPath);
    bsGetDirname(bundleDir);
    VMContext* vm = VM_create(dataWin);
    Renderer* renderer = GLRenderer_create();
    ((GLModernRenderer*) renderer)->hostFramebuffer = gHostFramebuffer;
    ((GLRenderer*) renderer)->textureFormat = GL_RGBA;
    OverlayFileSystem* overlayFs = OverlayFileSystem_create(bundleDir, savesPath);
    free(bundleDir);

    AudioSystem* audioSystem = (AudioSystem*) MaAudioSystem_create(dataWin);
    if (audioSystem == nullptr) {
        logWarn("Audio failed to start; continuing silently\n");
        audioSystem = (AudioSystem*) NoopAudioSystem_create();
    }

    Runner* runner = Runner_create(dataWin, vm, renderer, (FileSystem*) overlayFs, audioSystem, 0);
    // The game's own code was written for the Android build it came from (touch menus, on-screen controls).
    runner->osType = OS_ANDROID;
    runner->setWindowTitle = iosSetWindowTitle;
    runner->windowHasFocus = nullptr;
    runner->getWindowSize = iosGetWindowSize;
    char** gameArgs = nullptr;
    arrput(gameArgs, safeStrdup("butterscotch"));
    Runner_setGameArgs(runner, gameArgs, (int32_t) arrlen(gameArgs));
    Runner_initFirstRoom(runner);
    gRunner = runner;
    logInfo("IOSRunner: started, game size %ux%u\n", dataWin->gen8.defaultWindowWidth, dataWin->gen8.defaultWindowHeight);
    return true;
}

void IOSRunner_gameSize(int* w, int* h) {
    *w = 0; *h = 0;
    if (gRunner == nullptr) return;
    *w = (int) gRunner->dataWin->gen8.defaultWindowWidth;
    *h = (int) gRunner->dataWin->gen8.defaultWindowHeight;
}

int IOSRunner_targetHz(void) {
    if (gRunner == nullptr || gRunner->currentRoom == nullptr) return 30;
    int hz = (int) gRunner->currentRoom->speed;
    return hz > 0 ? hz : 30;
}

void IOSRunner_beginFrame(void) {
    Runner* runner = gRunner;
    if (runner == nullptr) return;
    RunnerKeyboard_beginFrame(runner->keyboard);
    RunnerMouse_beginFrame(runner->mouse);
    if (gDown) gDownSeen = true;
    if (gUpPending) {
        gUpPending = false;
        gDown = false;
        RunnerMouse_onButtonUp(runner->mouse, GML_MB_LEFT);
    }
}

int IOSRunner_step(int winW, int winH, float deltaTime) {
    Runner* runner = gRunner;
    if (runner == nullptr) return 1;
    if (runner->shouldExit) { logInfo("IOSRunner: the game asked to quit (game_end)\n"); return 1; }
    runner->deltaTime = deltaTime * 1000000;
    Runner_step(runner);
    if (deltaTime < 0.0f) deltaTime = 0.0f;
    if (deltaTime > 0.1f) deltaTime = 0.1f;
    runner->audioSystem->vtable->update(runner->audioSystem, deltaTime);

    if (winW < 1) winW = 1;
    if (winH < 1) winH = 1;
    gWindowW = winW;
    gWindowH = winH;
    Gen8* gen8 = &runner->dataWin->gen8;
    if (!runner->appSurfaceEnabled) {
        runner->applicationWidth = winW;
        runner->applicationHeight = winH;
        runner->usingAppSurface = false;
    } else {
        if (runner->applicationWidth <= 0 || runner->applicationHeight <= 0) {
            runner->applicationWidth = (int32_t) gen8->defaultWindowWidth;
            runner->applicationHeight = (int32_t) gen8->defaultWindowHeight;
        }
        runner->usingAppSurface = true;
    }
    int32_t gameW = runner->applicationWidth, gameH = runner->applicationHeight;
    runner->widescreenExtraWidth = 0;
    runner->widescreenExtraHeight = 0;

    glBindFramebuffer(GL_FRAMEBUFFER, gHostFramebuffer);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    Runner_drawPre(runner, winW, winH);
    Runner_beginFrame(runner, gameW, gameH, winW, winH, winW, winH);
    Runner_updateMousePosition(runner, winW, winH, gCursorX * winW, gCursorY * winH);
    Runner_drawViews(runner, gameW, gameH, false);
    runner->renderer->vtable->endFrameInit(runner->renderer);
    Runner_drawPost(runner, winW, winH);
    runner->renderer->vtable->endFrameEnd(runner->renderer);
    Runner_drawGUI(runner, winW, winH, gameW, gameH);
    bool present = runner->pendingRoom == -1;
    Runner_handlePendingRoomChange(runner);
    if (runner->frameCount % 300 == 0) logInfo("IOSRunner: frame %d room %s\n", (int) runner->frameCount, runner->currentRoom ? runner->currentRoom->name : "?");
    return present ? 0 : 2;
}

// One finger acts as the mouse (left button), as on GameMaker's own Android runner (device 0).
void IOSRunner_touch(int slot, bool down, double x, double y, int winW, int winH) {
    if (slot != 0 || gRunner == nullptr || winW <= 0 || winH <= 0) return;
    gCursorX = (float) (x / winW);
    gCursorY = (float) (y / winH);
    // Move the cursor right away so the press lands where the finger is, not where the last one was.
    Runner_updateMousePosition(gRunner, winW, winH, x, y);
    if (down && !gDown) {
        gDown = true; gDownSeen = false; gUpPending = false;
        RunnerMouse_onButtonDown(gRunner->mouse, GML_MB_LEFT);
        logInfo("IOSRunner: touch down %.0f,%.0f frame %d\n", x, y, (int) gRunner->frameCount);
    } else if (!down && gDown) {
        if (!gDownSeen) { gUpPending = true; return; }
        gDown = false;
        RunnerMouse_onButtonUp(gRunner->mouse, GML_MB_LEFT);
    }
}

void IOSRunner_key(int gmlKey, bool down) {
    if (gRunner == nullptr || gmlKey < 0 || gmlKey >= GML_KEY_COUNT) return;
    if (down) RunnerKeyboard_onKeyDown(gRunner->keyboard, gmlKey);
    else RunnerKeyboard_onKeyUp(gRunner->keyboard, gmlKey);
}

void IOSRunner_suspendAudio(void) {
    if (gRunner != nullptr && gRunner->audioSystem != nullptr) gRunner->audioSystem->vtable->suspend(gRunner->audioSystem);
}

void IOSRunner_resumeAudio(void) {
    if (gRunner != nullptr && gRunner->audioSystem != nullptr) gRunner->audioSystem->vtable->resume(gRunner->audioSystem);
}
