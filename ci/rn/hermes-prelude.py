"""Hermes bundles: run prelude.js (the stub/translation layer) before the APK's bytecode bundle.

Usage: python3 -I hermes-prelude.py <host AppDelegate.mm>
A Hermes bundle is bytecode, so JS can't be put in front of it like a plain bundle. Instead the host app gives
the bridge its own Hermes executor whose runtime installer evaluates <app>/prelude.js (plain JS, compiled by
Hermes at run time) right after the bridge globals (nativeModuleProxy...) exist and before the bundle runs.
Old architecture (bridge) only: React Native 0.70-0.75 with RCT_NEW_ARCH_ENABLED off, which is their default.
"""
import re, sys

p = sys.argv[1]
s = open(p).read()
if "HostPreludeInstaller" in s:
    sys.exit("already patched")
IMPORTS = """
// --- Hermes prelude (apk-to-ipa): run prelude.js before the APK's bytecode bundle ---
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTJSIExecutorRuntimeInstaller.h>
#import <reacthermes/HermesExecutorFactory.h>
#include <string>
@interface AppDelegate () <RCTCxxBridgeDelegate>
@end
"""
METHOD = """
// HostPreludeInstaller: the same executor React Native makes by default, plus prelude.js first
- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  NSString *path = [[NSBundle mainBundle] pathForResource:@"prelude" ofType:@"js"];
  NSData *data = path ? [NSData dataWithContentsOfFile:path] : nil;
  std::string src = data ? std::string((const char *)data.bytes, data.length) : std::string();
  NSLog(@"HERMES-PRELUDE: %lu bytes", (unsigned long)src.size());
  return std::make_unique<facebook::react::HermesExecutorFactory>(
      facebook::react::RCTJSIExecutorRuntimeInstaller([src](facebook::jsi::Runtime &runtime) {
        if (src.empty()) return;
        try {
          runtime.evaluateJavaScript(std::make_shared<facebook::jsi::StringBuffer>(src), "prelude.js");
          NSLog(@"HERMES-PRELUDE: ran");
        } catch (const std::exception &e) {
          NSLog(@"HERMES-PRELUDE: failed: %s", e.what());
        }
      }));
}
"""
# imports after the AppDelegate header import; the method into the last @implementation (AppDelegate's)
s = re.sub(r'(#import "AppDelegate\.h"\n)', lambda m: m.group(1) + IMPORTS, s, count=1)
i = s.rfind("@end")
s = s[:i] + METHOD + "\n" + s[i:]
open(p, "w").write(s)
print("patched", p)
