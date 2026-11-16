import UIKit
import WebKit
import UniformTypeIdentifiers

/// Answers window.webkit.messageHandlers.native.postMessage({action, args}) from the bridge script.
/// Files live in Application Support/Saves. Every call is answered exactly once.
final class NativeBridge: NSObject, WKScriptMessageHandlerWithReply, UIDocumentPickerDelegate {
    weak var presenter: UIViewController?
    private var pendingPick: ((Any?, String?) -> Void)?

    private lazy var saves: URL = {
        let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let dir = base.appendingPathComponent("Saves", isDirectory: true)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir
    }()

    private func file(_ name: Any?) -> URL? {
        guard let n = name as? String else { return nil }
        let clean = (n as NSString).lastPathComponent
        return clean.isEmpty ? nil : saves.appendingPathComponent(clean)
    }

    func userContentController(_ controller: WKUserContentController, didReceive message: WKScriptMessage,
                               replyHandler: @escaping (Any?, String?) -> Void) {
        guard let body = message.body as? [String: Any], let action = body["action"] as? String else {
            return replyHandler(nil, "bad message")
        }
        let args = body["args"] as? [String: Any] ?? [:]
        switch action {
        case "readFile":
            guard let f = file(args["name"]) else { return replyHandler(nil, "bad name") }
            replyHandler((try? String(contentsOf: f, encoding: .utf8)) as Any?, nil)
        case "writeFile":
            guard let f = file(args["name"]) else { return replyHandler(nil, "bad name") }
            do { try (args["data"] as? String ?? "").write(to: f, atomically: true, encoding: .utf8); replyHandler(true, nil) }
            catch { replyHandler(nil, error.localizedDescription) }
        case "removeFile":
            if let f = file(args["name"]) { try? FileManager.default.removeItem(at: f) }
            replyHandler(true, nil)
        case "listFiles":
            replyHandler((try? FileManager.default.contentsOfDirectory(atPath: saves.path)) ?? [], nil)
        case "openURL":
            if let s = args["url"] as? String, let u = URL(string: s) { UIApplication.shared.open(u) }
            replyHandler(true, nil)
        case "share":
            // export: args.name + args.data (text) -> share sheet
            let tmp = FileManager.default.temporaryDirectory.appendingPathComponent((args["name"] as? String) ?? "export.txt")
            try? (args["data"] as? String ?? "").write(to: tmp, atomically: true, encoding: .utf8)
            DispatchQueue.main.async {
                guard let p = self.presenter else { return replyHandler(false, nil) }
                let vc = UIActivityViewController(activityItems: [tmp], applicationActivities: nil)
                vc.popoverPresentationController?.sourceView = p.view
                vc.completionWithItemsHandler = { _, done, _, _ in replyHandler(done, nil) }
                p.present(vc, animated: true)
            }
        case "pickFile":
            // import: returns the picked file's text, or null if cancelled
            DispatchQueue.main.async {
                guard let p = self.presenter else { return replyHandler(nil, nil) }
                self.pendingPick = replyHandler
                let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.item], asCopy: true)
                picker.delegate = self
                p.present(picker, animated: true)
            }
        case "log":
            NSLog("[web] %@", String(describing: args["text"] ?? ""))
            replyHandler(true, nil)
        default:
            replyHandler(nil, "unknown action \(action)")
        }
    }

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let text = urls.first.flatMap { try? String(contentsOf: $0, encoding: .utf8) }
        pendingPick?(text as Any?, nil); pendingPick = nil
    }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        pendingPick?(nil, nil); pendingPick = nil
    }
}
