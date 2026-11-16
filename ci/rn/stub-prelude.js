// Put in front of the APK's main.jsbundle (plain-JS bundles only).
// Native modules the skill removes (Firebase, crash reporters, ads...) don't exist in the iPhone host.
// The app would crash calling them, so they answer every call with "nothing": constants {}, methods
// that return a resolved Promise of null. Everything the host really has is passed through unchanged.
(function (g) {
  var STUBS = __STUBS__;
  function stub(name) {
    var fn = function () { var cb = arguments[arguments.length - 1]; if (typeof cb === 'function') { try { cb(null); } catch (e) {} } return Promise.resolve(null); };
    return new Proxy({}, { get: function (t, k) {
      if (k === 'getConstants') return function () { return {}; };
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
      if (STUBS.indexOf(k) >= 0) return cache[k] || (cache[k] = stub(k));
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
