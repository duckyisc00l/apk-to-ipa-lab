// JavaScript given to the web app. `common` runs in every app (safe area, audio, bridge);
// `cordova` is added only for Cordova apps (served in place of cordova.js).
enum BridgeScript {
    static let common = #"""
(function () {
  if (window.__iosBridge) return; window.__iosBridge = true;
  var h = window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.native;
  window.nativeCall = function (action, args) {
    if (!h) return Promise.reject(new Error('no native bridge'));
    return h.postMessage({ action: action, args: args || {} });
  };
  // Safe area: CSS variables --sat --sab --sal --sar (pixels) for the game's interface to use.
  window.__safeInsets = function (t, b, l, r) {
    var s = document.documentElement.style;
    s.setProperty('--sat', t + 'px'); s.setProperty('--sab', b + 'px');
    s.setProperty('--sal', (l || 0) + 'px'); s.setProperty('--sar', (r || 0) + 'px');
    window.dispatchEvent(new Event('safeareachange'));
  };
  // Audio can only start after a touch on iOS: resume every AudioContext on the first touches.
  var contexts = [];
  ['AudioContext', 'webkitAudioContext'].forEach(function (name) {
    var C = window[name]; if (!C) return;
    var W = function () { var c = new (Function.prototype.bind.apply(C, [null].concat([].slice.call(arguments))))(); contexts.push(c); return c; };
    W.prototype = C.prototype; window[name] = W;
  });
  var resume = function () { contexts.forEach(function (c) { if (c.state !== 'running') c.resume(); }); };
  ['touchstart', 'touchend', 'mousedown', 'keydown'].forEach(function (e) { document.addEventListener(e, resume, true); });
  // Links to websites open in Safari instead of replacing the game.
  var open = window.open;
  window.open = function (url) {
    if (/^https?:/i.test(String(url))) { window.nativeCall('openURL', { url: String(url) }); return null; }
    return open.apply(window, arguments);
  };
  // Errors go to the native log (visible in Xcode / the device console).
  window.addEventListener('error', function (e) { window.nativeCall('log', { text: 'JS error: ' + e.message + ' @ ' + e.filename + ':' + e.lineno }).catch(function () {}); });
})();
"""#

    static let cordova = #"""
(function () {
  // Just enough of Cordova for most games: platform info, deviceready, InAppBrowser,
  // the file plugin (saves in the app's own folder), and back-button/exit stubs.
  function fail(cb, msg) { if (cb) setTimeout(function () { cb({ code: 1, message: msg }); }); }
  function FileEntry(name) { this.name = name; this.fullPath = '/' + name; this.isFile = true; this.isDirectory = false; }
  FileEntry.prototype.file = function (ok, err) {
    var self = this;
    nativeCall('readFile', { name: self.name }).then(function (t) {
      var b = new Blob([t || ''], { type: 'text/plain' }); b.name = self.name; b.lastModifiedDate = new Date(); ok(b);
    }, function (e) { fail(err, String(e)); });
  };
  FileEntry.prototype.createWriter = function (ok) {
    var self = this, w = { length: 0, onwriteend: null, onerror: null, truncate: function () {},
      write: function (data) {
        var send = function (t) { nativeCall('writeFile', { name: self.name, data: t }).then(function () { w.onwriteend && w.onwriteend({}); }, function (e) { w.onerror && w.onerror(e); }); };
        if (data instanceof Blob) { var r = new FileReader(); r.onload = function () { send(r.result); }; r.readAsText(data); } else { send(String(data)); }
      } };
    ok(w);
  };
  FileEntry.prototype.remove = function (ok, err) { nativeCall('removeFile', { name: this.name }).then(function () { ok && ok(); }, function (e) { fail(err, String(e)); }); };
  FileEntry.prototype.toURL = function () { return 'cdvfile://localhost/persistent/' + this.name; };
  function DirEntry() { this.name = 'saves'; this.fullPath = '/'; this.isFile = false; this.isDirectory = true; }
  DirEntry.prototype.getFile = function (name, opts, ok, err) {
    var n = String(name).split('/').pop();
    nativeCall('readFile', { name: n }).then(function (t) {
      if (t === null && !(opts && opts.create)) return fail(err, 'not found');
      var p = (t === null) ? nativeCall('writeFile', { name: n, data: '' }) : Promise.resolve();
      p.then(function () { ok && ok(new FileEntry(n)); });
    });
  };
  DirEntry.prototype.getDirectory = function (name, opts, ok) { ok && ok(new DirEntry()); };
  DirEntry.prototype.createReader = function () {
    return { readEntries: function (ok) { nativeCall('listFiles').then(function (l) { ok((l || []).map(function (n) { return new FileEntry(n); })); }); } };
  };
  DirEntry.prototype.toURL = function () { return 'cdvfile://localhost/persistent/'; };
  window.resolveLocalFileSystemURL = window.resolveLocalFileSystemURI = function (url, ok, err) {
    var rest = String(url).replace(/^.*?(persistent|files|data)\/?/i, '');
    if (!rest || /\/$/.test(url)) return ok(new DirEntry());
    new DirEntry().getFile(rest, {}, ok, err);
  };
  window.LocalFileSystem = { PERSISTENT: 1, TEMPORARY: 0 };
  window.requestFileSystem = function (type, size, ok) { ok({ name: 'persistent', root: new DirEntry() }); };
  window.device = { platform: 'iOS', cordova: 'ios-bridge', model: 'iPhone', uuid: '0', version: '' };
  window.cordova = {
    platformId: 'ios', version: 'ios-bridge',
    file: { dataDirectory: 'cdvfile://localhost/persistent/', documentsDirectory: 'cdvfile://localhost/persistent/',
            applicationStorageDirectory: 'cdvfile://localhost/persistent/', externalDataDirectory: null },
    InAppBrowser: { open: function (url) { nativeCall('openURL', { url: url }); return { close: function () {}, addEventListener: function () {} }; } },
    plugins: {}, exec: function (ok, err, svc, act) { fail(err, 'plugin ' + svc + '.' + act + ' not available on iOS'); },
    define: function () {}, require: function () { return {}; }
  };
  navigator.app = { exitApp: function () {}, backHistory: function () { history.back(); } };
  navigator.splashscreen = { hide: function () {}, show: function () {} };
  window.plugins = window.plugins || {};
  var fire = function () { setTimeout(function () { document.dispatchEvent(new Event('deviceready')); }, 0); };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', fire); else fire();
})();
"""#
}
