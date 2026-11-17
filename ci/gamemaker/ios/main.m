// The iPhone app: a full-screen OpenGL ES 3 view that runs a GameMaker game's data file on Butterscotch (ios_runner.c).
// The game's data is in the app at game/game.droid (or game/data.win), unchanged. Saves and game-log.txt go to Documents.
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <OpenGLES/ES3/gl.h>
#import <OpenGLES/ES3/glext.h>
#include "ios_runner.h"

#define MAX_FINGERS 5

@interface GameView : UIView
- (void)startGame;
- (void)pause;
- (void)resume;
@end

@implementation GameView {
    EAGLContext *_ctx;
    GLuint _fbo, _color;
    GLint _w, _h;
    CADisplayLink *_link;
    CFTimeInterval _last, _acc;
    BOOL _started, _needsStorage;
    __unsafe_unretained UITouch *_fingers[MAX_FINGERS];
}

+ (Class)layerClass { return [CAEAGLLayer class]; }

- (instancetype)initWithFrame:(CGRect)f {
    if ((self = [super initWithFrame:f])) {
        self.multipleTouchEnabled = YES;
        self.backgroundColor = UIColor.blackColor;
        self.contentScaleFactor = UIScreen.mainScreen.nativeScale;
        CAEAGLLayer *l = (CAEAGLLayer *)self.layer;
        l.opaque = YES;
        l.drawableProperties = @{ kEAGLDrawablePropertyRetainedBacking: @NO, kEAGLDrawablePropertyColorFormat: kEAGLColorFormatRGBA8 };
        _ctx = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
        [EAGLContext setCurrentContext:_ctx];
        glGenFramebuffers(1, &_fbo);
        glGenRenderbuffers(1, &_color);
        _needsStorage = YES;
    }
    return self;
}

- (void)layoutSubviews { [super layoutSubviews]; _needsStorage = YES; }

- (void)updateStorage {
    if (!_needsStorage) return;
    _needsStorage = NO;
    [EAGLContext setCurrentContext:_ctx];
    glBindRenderbuffer(GL_RENDERBUFFER, _color);
    [_ctx renderbufferStorage:GL_RENDERBUFFER fromDrawable:(CAEAGLLayer *)self.layer];
    glBindFramebuffer(GL_FRAMEBUFFER, _fbo);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _color);
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &_w);
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &_h);
    NSLog(@"GameView: drawable %dx%d px, view %.0fx%.0f pt", _w, _h, self.bounds.size.width, self.bounds.size.height);
}

- (void)startGame {
    if (_started) return;
    _started = YES;
    [self updateStorage];
    NSString *dir = [NSBundle.mainBundle.resourcePath stringByAppendingPathComponent:@"game"];
    NSString *game = [dir stringByAppendingPathComponent:@"game.droid"];
    if (![NSFileManager.defaultManager fileExistsAtPath:game]) game = [dir stringByAppendingPathComponent:@"data.win"];
    NSString *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *saves = [docs stringByAppendingPathComponent:@"saves"];
    NSString *logFile = [docs stringByAppendingPathComponent:@"game-log.txt"];
    if (!IOSRunner_start(game.fileSystemRepresentation, saves.fileSystemRepresentation, logFile.fileSystemRepresentation, _fbo)) {
        NSLog(@"GameView: could not start the game at %@", game);
        return;
    }
    [self resume];
}

- (void)resume {
    if (!_started || _link) return;
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    _last = 0; _acc = 0;
    [_link addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
    IOSRunner_resumeAudio();
}

- (void)pause {
    [_link invalidate];
    _link = nil;
    IOSRunner_suspendAudio();
    [EAGLContext setCurrentContext:_ctx];
    glFinish();
    for (int i = 0; i < MAX_FINGERS; i++) {
        if (_fingers[i]) { _fingers[i] = nil; IOSRunner_touch(i, false, 0, 0, _w, _h); }
    }
}

- (void)tick:(CADisplayLink *)l {
    CFTimeInterval now = l.timestamp;
    if (_last == 0) _last = now;
    CFTimeInterval dt = now - _last;
    _last = now;
    if (dt > 0.25) dt = 0.25;
    _acc += dt;
    double frame = 1.0 / IOSRunner_targetHz();
    if (_acc + 0.002 < frame) return;   // small tolerance so a 60 Hz screen lands exactly on a 30 fps game
    _acc -= frame;
    if (_acc > frame) _acc = 0;         // too far behind: slow down rather than jump
    [EAGLContext setCurrentContext:_ctx];
    [self updateStorage];
    glBindFramebuffer(GL_FRAMEBUFFER, _fbo);
    int r = IOSRunner_step(_w, _h, (float)frame);
    IOSRunner_beginFrame();
    if (r == 1) exit(0);
    if (r == 0) {
        glBindRenderbuffer(GL_RENDERBUFFER, _color);
        [_ctx presentRenderbuffer:GL_RENDERBUFFER];
    }
}

- (void)sendTouch:(UITouch *)t slot:(int)slot down:(BOOL)down {
    CGPoint p = [t locationInView:self];
    CGFloat s = self.contentScaleFactor;
    IOSRunner_touch(slot, down, p.x * s, p.y * s, _w, _h);
}
- (void)touchesBegan:(NSSet<UITouch *> *)ts withEvent:(UIEvent *)e {
    for (UITouch *t in ts) for (int i = 0; i < MAX_FINGERS; i++) if (!_fingers[i]) { _fingers[i] = t; [self sendTouch:t slot:i down:YES]; break; }
}
- (void)touchesMoved:(NSSet<UITouch *> *)ts withEvent:(UIEvent *)e {
    for (UITouch *t in ts) for (int i = 0; i < MAX_FINGERS; i++) if (_fingers[i] == t) [self sendTouch:t slot:i down:YES];
}
- (void)endTouches:(NSSet<UITouch *> *)ts {
    for (UITouch *t in ts) for (int i = 0; i < MAX_FINGERS; i++) if (_fingers[i] == t) { [self sendTouch:t slot:i down:NO]; _fingers[i] = nil; }
}
- (void)touchesEnded:(NSSet<UITouch *> *)ts withEvent:(UIEvent *)e { [self endTouches:ts]; }
- (void)touchesCancelled:(NSSet<UITouch *> *)ts withEvent:(UIEvent *)e { [self endTouches:ts]; }
@end

// Orientation comes from Info.plist (the workflow picks portrait or landscape from the game's window size).
@interface GameVC : UIViewController
@end
@implementation GameVC
- (void)loadView { self.view = [[GameView alloc] initWithFrame:UIScreen.mainScreen.bounds]; }
- (BOOL)prefersStatusBarHidden { return YES; }
- (BOOL)prefersHomeIndicatorAutoHidden { return YES; }
- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures { return UIRectEdgeAll; }
- (void)viewDidAppear:(BOOL)a {
    [super viewDidAppear:a];
    [self.view layoutIfNeeded];
    for (UIGestureRecognizer *g in self.view.window.gestureRecognizers) g.delaysTouchesBegan = NO;
    [(GameView *)self.view startGame];
}
@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong) UIWindow *window;
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)a didFinishLaunchingWithOptions:(NSDictionary *)o {
    [AVAudioSession.sharedInstance setCategory:AVAudioSessionCategoryAmbient error:nil];
    [AVAudioSession.sharedInstance setActive:YES error:nil];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.blackColor;
    self.window.rootViewController = [GameVC new];
    [self.window makeKeyAndVisible];
    a.idleTimerDisabled = YES;
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)a { [(GameView *)self.window.rootViewController.view pause]; }
- (void)applicationDidBecomeActive:(UIApplication *)a {
    [AVAudioSession.sharedInstance setActive:YES error:nil];
    [(GameView *)self.window.rootViewController.view resume];
}
@end

int main(int argc, char *argv[]) {
    @autoreleasepool { return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class])); }
}
