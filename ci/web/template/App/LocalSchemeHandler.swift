import Foundation
import WebKit

/// Serves the web folder from the app bundle under app://local/... (the fallback when LoopbackServer can't start).
/// For Cordova apps, requests for cordova.js get the iOS bridge instead.
final class LocalSchemeHandler: NSObject, WKURLSchemeHandler {
    static let scheme = "app"
    static let startURL = URL(string: "app://local/\(AppConfig.startPage)")!
    static var isCordova: Bool { AppConfig.kind == "cordova" }

    private static let mime: [String: String] = [
        "html": "text/html", "htm": "text/html", "js": "text/javascript", "mjs": "text/javascript", "css": "text/css",
        "json": "application/json", "map": "application/json", "txt": "text/plain", "xml": "text/xml", "svg": "image/svg+xml",
        "png": "image/png", "jpg": "image/jpeg", "jpeg": "image/jpeg", "gif": "image/gif", "webp": "image/webp", "ico": "image/x-icon",
        "mp3": "audio/mpeg", "ogg": "audio/ogg", "wav": "audio/wav", "m4a": "audio/mp4", "mp4": "video/mp4", "webm": "video/webm",
        "ttf": "font/ttf", "otf": "font/otf", "woff": "font/woff", "woff2": "font/woff2", "wasm": "application/wasm",
    ]

    /// The file for a request path (percent-encoded, query already removed), shared with LoopbackServer.
    /// Returns the data (nil: 404) and the path it came from (the start page for router paths).
    static func content(for urlPath: String) -> (Data?, String) {
        var path = urlPath.removingPercentEncoding ?? urlPath
        while path.hasPrefix("/") { path.removeFirst() }
        if path.isEmpty { path = AppConfig.startPage }
        let root = Bundle.main.resourceURL!.appendingPathComponent("www", isDirectory: true).standardizedFileURL
        var data: Data?
        if isCordova && path.hasSuffix("cordova.js") {
            data = (BridgeScript.common + "\n" + BridgeScript.cordova).data(using: .utf8)
        } else if isCordova && path.hasSuffix("cordova_plugins.js") {
            data = "cordova.define('cordova/plugin_list', function(require, exports, module) { module.exports = []; });".data(using: .utf8)
        } else {
            let file = root.appendingPathComponent(path).standardizedFileURL
            if file.path.hasPrefix(root.path + "/") { data = try? Data(contentsOf: file) }   // no escaping the www folder
            // Apps with a page router (Ionic, Angular, React, Vue) use paths like /home that aren't files.
            // After a reload iOS asks for them directly: answer with the start page, as their web server would.
            if data == nil && (path as NSString).pathExtension.isEmpty {
                data = try? Data(contentsOf: root.appendingPathComponent(AppConfig.startPage))
                path = AppConfig.startPage
            }
        }
        return (data, path)
    }

    static func mimeType(_ path: String) -> String {
        let ext = (path as NSString).pathExtension.lowercased()
        var type = mime[ext] ?? "application/octet-stream"
        if ["html", "htm", "js", "mjs", "css", "json", "txt", "xml", "svg"].contains(ext) { type += "; charset=utf-8" }
        return type
    }

    func webView(_ webView: WKWebView, start task: WKURLSchemeTask) {
        guard let url = task.request.url else { return }
        let (data, path) = Self.content(for: url.path)
        let response = HTTPURLResponse(url: url, statusCode: data == nil ? 404 : 200, httpVersion: "HTTP/1.1",
                                       headerFields: ["Content-Type": Self.mimeType(path), "Content-Length": String(data?.count ?? 0),
                                                      "Access-Control-Allow-Origin": "*", "Cache-Control": "no-cache"])!
        task.didReceive(response)
        task.didReceive(data ?? Data())
        task.didFinish()
    }

    func webView(_ webView: WKWebView, stop task: WKURLSchemeTask) {}
}
