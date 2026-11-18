import Foundation
import WebKit

/// Serves the web folder from the app bundle under app://local/...
/// For Cordova apps, requests for cordova.js get the iOS bridge instead.
final class LocalSchemeHandler: NSObject, WKURLSchemeHandler {
    static let scheme = "app"
    static let startURL = URL(string: "app://local/\(AppConfig.startPage)")!
    static var isCordova: Bool { AppConfig.kind == "cordova" }

    private let root = Bundle.main.resourceURL!.appendingPathComponent("www", isDirectory: true).standardizedFileURL

    private static let mime: [String: String] = [
        "html": "text/html", "htm": "text/html", "js": "text/javascript", "mjs": "text/javascript", "css": "text/css",
        "json": "application/json", "map": "application/json", "txt": "text/plain", "xml": "text/xml", "svg": "image/svg+xml",
        "png": "image/png", "jpg": "image/jpeg", "jpeg": "image/jpeg", "gif": "image/gif", "webp": "image/webp", "ico": "image/x-icon",
        "mp3": "audio/mpeg", "ogg": "audio/ogg", "wav": "audio/wav", "m4a": "audio/mp4", "mp4": "video/mp4", "webm": "video/webm",
        "ttf": "font/ttf", "otf": "font/otf", "woff": "font/woff", "woff2": "font/woff2", "wasm": "application/wasm",
    ]

    func webView(_ webView: WKWebView, start task: WKURLSchemeTask) {
        guard let url = task.request.url else { return }
        var path = url.path.removingPercentEncoding ?? url.path
        while path.hasPrefix("/") { path.removeFirst() }
        if path.isEmpty { path = AppConfig.startPage }

        var data: Data?
        if Self.isCordova && path.hasSuffix("cordova.js") {
            data = (BridgeScript.common + "\n" + BridgeScript.cordova).data(using: .utf8)
        } else if Self.isCordova && path.hasSuffix("cordova_plugins.js") {
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
        let ext = (path as NSString).pathExtension.lowercased()
        var type = Self.mime[ext] ?? "application/octet-stream"
        if ["html", "htm", "js", "mjs", "css", "json", "txt", "xml", "svg"].contains(ext) { type += "; charset=utf-8" }
        let response = HTTPURLResponse(url: url, statusCode: data == nil ? 404 : 200, httpVersion: "HTTP/1.1",
                                       headerFields: ["Content-Type": type, "Content-Length": String(data?.count ?? 0),
                                                      "Access-Control-Allow-Origin": "*", "Cache-Control": "no-cache"])!
        task.didReceive(response)
        task.didReceive(data ?? Data())
        task.didFinish()
    }

    func webView(_ webView: WKWebView, stop task: WKURLSchemeTask) {}
}
