import Foundation
import Network

/// Serves the web folder at http://127.0.0.1:<port>/ (loopback only, never the network).
/// WebKit gives pages from a custom scheme (app://local) no working IndexedDB ("Unable to open cursor"),
/// so apps get a normal http origin. The port comes from the bundle id, so the origin (and with it
/// localStorage and IndexedDB) stays the same on every launch. Files come from LocalSchemeHandler.content.
final class LoopbackServer {
    static let shared = LoopbackServer()
    let port: UInt16 = {
        var h: UInt32 = 5381
        for b in (Bundle.main.bundleIdentifier ?? "app").utf8 { h = (h &* 33) &+ UInt32(b) }
        return UInt16(30000 + h % 20000)
    }()
    var startURL: URL { URL(string: "http://127.0.0.1:\(port)/\(AppConfig.startPage)")! }
    private(set) var ready = false
    private var listener: NWListener?
    private let queue = DispatchQueue(label: "loopback-server")

    func owns(_ url: URL) -> Bool { url.scheme == "http" && url.host == "127.0.0.1" && url.port == Int(port) }

    /// Calls done(true) on the main queue once it listens, or done(false) after 3 s or on failure.
    func start(_ done: @escaping (Bool) -> Void) {
        listener?.cancel(); ready = false
        var called = false
        let finish: (Bool) -> Void = { ok in DispatchQueue.main.async { if !called { called = true; done(ok) } } }
        let params = NWParameters.tcp
        params.allowLocalEndpointReuse = true
        params.requiredLocalEndpoint = .hostPort(host: "127.0.0.1", port: NWEndpoint.Port(rawValue: port)!)
        guard let l = try? NWListener(using: params) else { return finish(false) }
        l.stateUpdateHandler = { [weak self] state in
            switch state {
            case .ready: self?.ready = true; finish(true)
            case .failed, .cancelled: self?.ready = false; finish(false)
            default: break
            }
        }
        l.newConnectionHandler = { [weak self] c in
            c.start(queue: self?.queue ?? .main)
            self?.receive(c, Data())
        }
        listener = l
        l.start(queue: queue)
        queue.asyncAfter(deadline: .now() + 3) { [weak self] in finish(self?.ready ?? false) }
    }

    private func receive(_ c: NWConnection, _ buffer: Data) {
        c.receive(minimumIncompleteLength: 1, maximumLength: 65536) { [weak self] data, _, isComplete, error in
            guard let self = self else { return c.cancel() }
            var buf = buffer
            if let d = data { buf.append(d) }
            if let r = buf.range(of: Data("\r\n\r\n".utf8)) {
                let head = String(decoding: buf.subdata(in: buf.startIndex..<r.lowerBound), as: UTF8.self)
                let rest = buf.subdata(in: r.upperBound..<buf.endIndex)
                self.respond(c, head) { keep in if keep { self.receive(c, rest) } else { c.cancel() } }
            } else if isComplete || error != nil || buf.count > 1 << 20 {
                c.cancel()
            } else {
                self.receive(c, buf)
            }
        }
    }

    private func respond(_ c: NWConnection, _ head: String, then: @escaping (Bool) -> Void) {
        let lines = head.components(separatedBy: "\r\n")
        let parts = (lines.first ?? "").split(separator: " ")
        let method = parts.first.map(String.init) ?? "GET"
        let target = parts.count > 1 ? String(parts[1]) : "/"
        var headers: [String: String] = [:]
        for l in lines.dropFirst() {
            if let i = l.firstIndex(of: ":") {
                headers[l[..<i].lowercased()] = l[l.index(after: i)...].trimmingCharacters(in: .whitespaces)
            }
        }
        let urlPath = String(target.split(separator: "?", maxSplits: 1, omittingEmptySubsequences: false).first ?? "/")
        let (data, path) = LocalSchemeHandler.content(for: urlPath)
        var body = data ?? Data()
        var status = data == nil ? "404 Not Found" : "200 OK"
        var extra = ""
        // Range requests: <audio> and <video> need them on WebKit
        if let d = data, let range = headers["range"], range.hasPrefix("bytes=") {
            let spec = range.dropFirst(6).split(separator: ",").first ?? ""
            let ab = spec.split(separator: "-", omittingEmptySubsequences: false).map { Int($0.trimmingCharacters(in: .whitespaces)) }
            if ab.count == 2 {
                var lo = ab[0], hi = ab[1]
                if lo == nil, let n = hi { lo = max(0, d.count - n); hi = d.count - 1 }
                if let l = lo, l < d.count {
                    let h = min(hi ?? d.count - 1, d.count - 1)
                    if h >= l {
                        body = d.subdata(in: l..<(h + 1)); status = "206 Partial Content"
                        extra = "Content-Range: bytes \(l)-\(h)/\(d.count)\r\n"
                    }
                } else {
                    body = Data(); status = "416 Range Not Satisfiable"; extra = "Content-Range: bytes */\(d.count)\r\n"
                }
            }
        }
        let keep = headers["connection"]?.lowercased() != "close"
        let header = "HTTP/1.1 \(status)\r\nContent-Type: \(LocalSchemeHandler.mimeType(path))\r\nContent-Length: \(body.count)\r\n"
            + "Accept-Ranges: bytes\r\nAccess-Control-Allow-Origin: *\r\nCache-Control: no-cache\r\n\(extra)"
            + "Connection: \(keep ? "keep-alive" : "close")\r\n\r\n"
        var out = Data(header.utf8)
        if method != "HEAD" { out.append(body) }
        c.send(content: out, completion: .contentProcessed { error in then(keep && error == nil) })
    }
}
