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
  window.addEventListener('unhandledrejection', function (e) { var r = e.reason; window.nativeCall('log', { text: 'JS promise error: ' + (r && (r.stack || r.message) || r) }).catch(function () {}); });
  var cerr = console.error, cwarn = console.warn;
  console.error = function () { try { window.nativeCall('log', { text: 'console.error: ' + Array.prototype.join.call(arguments, ' ').slice(0, 500) }).catch(function () {}); } catch (x) {} return cerr.apply(console, arguments); };
  console.warn = function () { try { window.nativeCall('log', { text: 'console.warn: ' + Array.prototype.join.call(arguments, ' ').slice(0, 300) }).catch(function () {}); } catch (x) {} return cwarn.apply(console, arguments); };

  // IndexedDB diagnostics (temporary): log the exact errors of the page's own cursors and run a self test.
  (function () {
    var L = function (t) { try { window.nativeCall('log', { text: 'IDB: ' + t }).catch(function () {}); } catch (x) {} };
    var E = function (e) { return e ? (e.name + ': ' + e.message) : String(e); };
    L('origin=' + location.origin + ' secure=' + window.isSecureContext + ' idb=' + (typeof indexedDB) + ' ua=' + navigator.userAgent.slice(-40));
    try {
      ['openCursor', 'openKeyCursor'].forEach(function (m) {
        [window.IDBObjectStore, window.IDBIndex].forEach(function (C) {
          if (!C || !C.prototype[m]) return;
          var o = C.prototype[m];
          C.prototype[m] = function () {
            var r, self = this, a = [].slice.call(arguments);
            try { r = o.apply(this, arguments); } catch (x) { L(C.name + '.' + m + ' threw ' + E(x) + ' on ' + self.name + ' args=' + JSON.stringify(a)); throw x; }
            r.addEventListener('error', function () { L(C.name + '.' + m + ' error ' + E(r.error) + ' on ' + self.name + ' args=' + JSON.stringify(a)); });
            return r;
          };
        });
      });
    } catch (x) { L('hook failed ' + E(x)); }
    var selfTest = function () {
      var req; try { req = indexedDB.open('__probe', 1); } catch (x) { return L('open threw ' + E(x)); }
      req.onupgradeneeded = function () { var s = req.result.createObjectStore('s', { keyPath: 'id' }); s.createIndex('v', 'v'); L('probe upgrade ok'); };
      req.onerror = function () { L('probe open error ' + E(req.error)); };
      req.onblocked = function () { L('probe open blocked'); };
      req.onsuccess = function () {
        var db = req.result, tx = db.transaction('s', 'readwrite'), s = tx.objectStore('s');
        for (var i = 0; i < 50; i++) s.put({ id: i, v: i % 5 });
        tx.onerror = function () { L('probe write error ' + E(tx.error)); };
        tx.oncomplete = function () {
          var n = 0, c = db.transaction('s').objectStore('s').index('v').openCursor(IDBKeyRange.bound(1, 3));
          c.onsuccess = function () { var k = c.result; if (k) { n++; k.continue(); } else L('probe cursor ok n=' + n); };
          c.onerror = function () { L('probe cursor error ' + E(c.error)); };
        };
      };
    };
    var dump = function () {
      if (!indexedDB.databases) return L('no indexedDB.databases()');
      indexedDB.databases().then(function (list) {
        L('databases: ' + JSON.stringify(list));
        list.forEach(function (d) {
          if (d.name === '__probe') return;
          var r = indexedDB.open(d.name);
          r.onerror = function () { L('open ' + d.name + ' error ' + E(r.error)); };
          r.onsuccess = function () {
            var db = r.result, names = [].slice.call(db.objectStoreNames);
            L('db ' + d.name + ' v' + db.version + ' stores=' + names.join(','));
            names.forEach(function (n) {
              try {
                var st = db.transaction(n).objectStore(n);
                L('store ' + n + ' keyPath=' + JSON.stringify(st.keyPath) + ' indexes=' + [].slice.call(st.indexNames).join(','));
                var cnt = st.count(); cnt.onsuccess = function () { L('store ' + n + ' count=' + cnt.result); }; cnt.onerror = function () { L('store ' + n + ' count error ' + E(cnt.error)); };
                var c = st.openCursor(); c.onsuccess = function () { L('store ' + n + ' plain cursor ' + (c.result ? 'has row' : 'empty')); };
                c.onerror = function () { L('store ' + n + ' plain cursor ERROR ' + E(c.error)); };
              } catch (x) { L('store ' + n + ' threw ' + E(x)); }
            });
            db.close();
          };
        });
      }, function (e) { L('databases() failed ' + E(e)); });
    };
    try { selfTest(); setTimeout(dump, 6000); setTimeout(dump, 14000); } catch (x) { L('selftest threw ' + E(x)); }
  })();
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
