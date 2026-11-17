#ifndef IOS_RUNNER_H
#define IOS_RUNNER_H
#include <stdbool.h>
#include <stdint.h>

// Bridge between the iPhone app (main.m) and the Butterscotch runner.
bool IOSRunner_start(const char* dataWinPath, const char* savesPath, const char* logPath, uint32_t hostFramebuffer);
void IOSRunner_gameSize(int* w, int* h);
int  IOSRunner_targetHz(void);
// Runs one game frame and draws it. Returns 0 present, 1 exit requested, 2 frame drawn but do not present.
int  IOSRunner_step(int winW, int winH, float deltaSeconds);
void IOSRunner_beginFrame(void);
// Finger slot in drawable pixels. Slot 0 drives the mouse.
void IOSRunner_touch(int slot, bool down, double x, double y, int winW, int winH);
void IOSRunner_key(int gmlKey, bool down);
void IOSRunner_suspendAudio(void);
void IOSRunner_resumeAudio(void);
#endif
