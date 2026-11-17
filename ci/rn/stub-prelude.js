// Put in front of the APK's main.jsbundle (plain-JS bundles only).
// Native modules the skill removes (Firebase, crash reporters, ads...) don't exist in the iPhone host.
// The app would crash calling them, so they answer every call with "nothing": constants {}, methods
// that return a resolved Promise of null. Everything the host really has is passed through unchanged.
(function (g) {
  var STUBS = __STUBS__;
  var METHODS = __METHODS__;   // method names the app calls on native modules (found in the bundle)
  // same families as SKIP in modules.py: a library may ask for a name the scan never saw ("RNFB" + "AnalyticsModule")
  var STUB_RE = /^(Flipper|RNFB|Bugsnag|RNSentry|Sentry|RNGoogle|GoogleSignin|RNAdMob|RNFirebase|Crashlytics|Amplitude|Mixpanel|AppCenter|CodePush|RNBranch|Adjust|AppsFlyer|FBSDK|RNIap|RNPlayInstall)/i;
  // a few removed modules must still describe themselves, or their JS side refuses to start the app.
  // Firebase: one local "[DEFAULT]" app with dummy settings, so firebase.app() works; nothing is ever sent.
  var CONSTANTS = {
    RNFBAppModule: { NATIVE_FIREBASE_APPS: [{ appConfig: { name: '[DEFAULT]', automaticDataCollectionEnabled: false,
      automaticResourceManagement: false }, options: { apiKey: 'offline', appId: '1:0:ios:0', projectId: 'offline',
      messagingSenderId: '0', databaseURL: '', storageBucket: '', clientId: '', iosBundleId: '' } }],
      FIREBASE_RAW_JSON: '{}' },
    RNFBUtilsModule: { isRunningInTestLab: false, androidPlayServices: { isAvailable: false, status: 1 } },
    RNFBAnalyticsModule: {}, RNFBCrashlyticsModule: { isCrashlyticsCollectionEnabled: false, isErrorGenerationOnJSCrashEnabled: false },
    RNFBMessagingModule: { isAutoInitEnabled: false, isRegisteredForRemoteNotifications: false }
  };
  function stub(name) {
    var fn = function () { var cb = arguments[arguments.length - 1]; if (typeof cb === 'function') { try { cb(null); } catch (e) {} } return Promise.resolve(null); };
    // the settings are real own properties: some libraries copy a module with Object.keys()
    var base = Object.assign({}, CONSTANTS[name] || {});
    // methods as own properties too: wrappers like Firebase's copy only Object.keys() of a module
    METHODS.forEach(function (m) { if (!(m in base)) base[m] = fn; });
    return new Proxy(base, { get: function (t, k) {
      if (k in t) return t[k];
      if (k === 'getConstants') return function () { return CONSTANTS[name] || {}; };
      if (CONSTANTS[name] && k in CONSTANTS[name]) return CONSTANTS[name][k];
      if (k === 'then' || typeof k === 'symbol') return undefined;
      if (k === 'addListener' || k === 'removeListeners') return function () {};
      return fn;
    } });
  }
  var cache = {};
  function wrap(real) {
    return new Proxy({}, { get: function (t, k) {
      var m = real ? real[k] : undefined;
      if (m != null) return m;
      if (typeof k === 'string' && (STUBS.indexOf(k) >= 0 || STUB_RE.test(k))) return cache[k] || (cache[k] = stub(k));
      return m;
    } });
  }
  try { if (g.nativeModuleProxy) g.nativeModuleProxy = wrap(g.nativeModuleProxy); } catch (e) {}
  // bridge-config path (older RN, or no JSI proxy): add the names so NativeModules lists them
  try {
    var cfg = g.__fbBatchedBridgeConfig;
    if (cfg && cfg.remoteModuleConfig && !g.nativeModuleProxy) { g.__rnStubs = STUBS; }
  } catch (e) {}
})(typeof globalThis !== 'undefined' ? globalThis : this);
