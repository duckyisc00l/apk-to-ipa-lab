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
  var noop = function () { var cb = arguments[arguments.length - 1]; if (typeof cb === 'function') { try { cb(null); } catch (e) {} } return Promise.resolve(null); };

  // ---- An Android bundle on an iPhone host --------------------------------------------------------
  // Metro builds the APK's bundle for Android only (Platform.OS is fixed to 'android', *.android.js files
  // are picked), so it asks for Android screen components and Android-only modules. Map each to iOS.
  var VIEW = { AndroidTextInput: 'RCTMultilineTextInputView', AndroidHorizontalScrollView: 'RCTScrollView',
    AndroidHorizontalScrollContentView: 'RCTScrollContentView', AndroidProgressBar: 'RCTActivityIndicatorView',
    AndroidSwitch: 'RCTSwitch', AndroidSwipeRefreshLayout: 'RCTView', AndroidDrawerLayout: 'RCTView',
    AndroidDropdownPicker: 'RCTView', AndroidDialogPicker: 'RCTView', RCTTextInlineImage: 'RCTView', AndroidViewPager: 'RCTView' };
  function iosView(n) { return VIEW[n] || n; }
  function fixProps(cls, p) {
    if (!p) return p;
    if (cls === 'RCTImageView' && p.src && !p.source) p = Object.assign({}, p, { source: p.src });   // Android Image sends src
    if (cls === 'AndroidProgressBar') p = Object.assign({ animating: true }, p);
    return p;
  }
  function uiManager(real) {
    var consts = null, names = {};
    function C() { return consts || (consts = (real.getConstants ? real.getConstants() : null) || {}); }
    var extra = {
      // Android looks each component up one by one; iOS lists them all in its constants
      // a component no installed add-on provides becomes a plain view (the screen still shows) instead of a crash
      getConstantsForViewManager: function (n) { return C()[iosView(n)] || (/^[A-Z]/.test(n) && C().RCTView) || null; },
      getDefaultEventTypes: function () { return { bubblingEventTypes: C().genericBubblingEventTypes || {}, directEventTypes: C().genericDirectEventTypes || {} }; },
      createView: function (tag, cls, root, props) {
        var n = cls === 'AndroidTextInput' && !(props && props.multiline) ? 'RCTSinglelineTextInputView' : iosView(cls);
        if (!C()[n]) n = 'RCTView';
        names[tag] = n; return real.createView(tag, n, root, fixProps(cls, props));
      },
      updateView: function (tag, cls, props) { return real.updateView(tag, names[tag] || iosView(cls), fixProps(cls, props)); }
    };
    return extra;
  }
  function alertDialog(alertManager) {   // Alert.alert on Android goes through DialogManagerAndroid
    return { getConstants: function () { return { buttonClicked: 'buttonClicked', dismissed: 'dismissed', buttonPositive: -1, buttonNegative: -2, buttonNeutral: -3 }; },
      showAlert: function (cfg, onError, onAction) {
        var buttons = [], ids = [];
        [['buttonNegative', -2], ['buttonNeutral', -3], ['buttonPositive', -1]].forEach(function (b, i) {
          if (cfg[b[0]]) { var o = {}; o[String(i)] = cfg[b[0]]; buttons.push(o); ids[i] = b[1]; } });
        if (!buttons.length) { buttons.push({ 0: 'OK' }); ids[0] = -1; }
        alertManager.alertWithArgs({ title: cfg.title || '', message: cfg.message || '', buttons: buttons },
          function (id) { onAction && onAction('buttonClicked', ids[Number(id)]); });
      } };
  }
  var ANDROID = {   // Android-only module -> iOS module that does the same job, or a small stand-in
    IntentAndroid: function (r) { return r.LinkingManager; },
    DialogManagerAndroid: function (r) { return r.AlertManager ? alertDialog(r.AlertManager) : null; },
    ToastAndroid: function () { return { getConstants: function () { return { SHORT: 0, LONG: 1, TOP: 0, BOTTOM: 1, CENTER: 2 }; } }; },
    PermissionsAndroid: function () { return { checkPermission: function () { return Promise.resolve(true); },
      requestPermission: function () { return Promise.resolve('granted'); },
      requestMultiplePermissions: function (ps) { var o = {}; (ps || []).forEach(function (k) { o[k] = 'granted'; }); return Promise.resolve(o); },
      shouldShowRequestPermissionRationale: function () { return Promise.resolve(false); } }; },
    DeviceEventManager: function () { return {}; }, FrescoModule: function () { return {}; },
    AccessibilityInfo: function () { return {}; }, HeadlessJsTaskSupport: function () { return {}; }
  };
  // a real module with Android-only methods missing: those answer "nothing" instead of crashing
  function lenient(real, extra) {
    return new Proxy(real, { get: function (t, k) {
      if (extra && k in extra) return extra[k];
      var v = t[k];
      if (v !== undefined || typeof k !== 'string' || k === 'then' || !/^[a-z]/.test(k)) return v;
      return noop;
    } });
  }
  // lab only (fill-app.sh sets __RN_TRACE for simulator runs): log the first native calls with their arguments
  var traceLeft = 400;
  function traced(name, mod) {
    return new Proxy(mod, { get: function (t, k) {
      var v = t[k];
      if (typeof v !== 'function' || typeof k !== 'string' || /^(getConstants|addListener|removeListeners)$/.test(k)) return v;
      return function () {
        if (traceLeft-- > 0) { try { console.error('RNTRACE ' + name + '.' + k + ' ' + JSON.stringify([].slice.call(arguments).map(function (a) { return typeof a === 'function' ? 'fn' : a; })).slice(0, 400)); } catch (e) {} }
        return v.apply(t, arguments);
      };
    } });
  }
  function wrap(real) {
    return new Proxy({}, { get: function (t, k) {
      if (typeof k !== 'string') return undefined;
      if (k in cache) return cache[k];
      var m = real ? real[k] : undefined, out;
      if (m != null) out = lenient(m, k === 'UIManager' ? uiManager(m) : null);
      if (m != null && g.__RN_TRACE && k === 'UIManager') out = traced(k, out);   // not ExceptionsManager: logging an error reports one
      else if (ANDROID[k]) { var x = ANDROID[k](real); out = x ? lenient(x) : x; }
      else if (STUBS.indexOf(k) >= 0 || STUB_RE.test(k)) out = stub(k);
      else return m;
      return (cache[k] = out);
    } });
  }
  try { if (g.nativeModuleProxy) g.nativeModuleProxy = wrap(g.nativeModuleProxy); } catch (e) {}
  // bridge-config path (older RN, or no JSI proxy): add the names so NativeModules lists them
  try {
    var cfg = g.__fbBatchedBridgeConfig;
    if (cfg && cfg.remoteModuleConfig && !g.nativeModuleProxy) { g.__rnStubs = STUBS; }
  } catch (e) {}
})(typeof globalThis !== 'undefined' ? globalThis : this);
