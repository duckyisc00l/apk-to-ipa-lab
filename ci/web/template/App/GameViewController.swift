import UIKit
import WebKit

/// Full-screen web view that runs the APK's own web files from the app bundle.
final class GameViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    private var webView: WKWebView!
    private let bridge = NativeBridge()
    private var lastInsets = UIEdgeInsets(top: -1, left: 0, bottom: -1, right: 0)

    override func loadView() {
        let config = WKWebViewConfiguration()
        config.setURLSchemeHandler(LocalSchemeHandler(), forURLScheme: LocalSchemeHandler.scheme)
        config.mediaTypesRequiringUserActionForPlayback = []
        config.allowsInlineMediaPlayback = true
        config.websiteDataStore = .default()
        config.userContentController.addScriptMessageHandler(bridge, contentWorld: .page, name: "native")
        // Apps that never load cordova.js (Capacitor, plain HTML5) still get the bridge this way.
        if !LocalSchemeHandler.isCordova {
            config.userContentController.addUserScript(WKUserScript(source: BridgeScript.common,
                                                                    injectionTime: .atDocumentStart,
                                                                    forMainFrameOnly: true))
        }
        webView = WKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.backgroundColor = .black
        webView.scrollView.backgroundColor = .black
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.allowsLinkPreview = false
        if #available(iOS 16.4, *) { webView.isInspectable = true }
        webView.navigationDelegate = self
        webView.uiDelegate = self
        bridge.presenter = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: LocalSchemeHandler.startURL))
    }

    override var prefersStatusBarHidden: Bool { true }
    override var prefersHomeIndicatorAutoHidden: Bool { true }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sendInsets()
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        sendInsets()
    }

    private func sendInsets(force: Bool = false) {
        let i = view.safeAreaInsets
        guard force || i != lastInsets else { return }
        lastInsets = i
        webView.evaluateJavaScript("window.__safeInsets && window.__safeInsets(\(i.top),\(i.bottom),\(i.left),\(i.right))")
    }

    // MARK: navigation

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) { sendInsets(force: true) }

    func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = action.request.url, let scheme = url.scheme?.lowercased() else { return decisionHandler(.allow) }
        if ["http", "https", "mailto", "tel"].contains(scheme) && action.targetFrame?.isMainFrame != false {
            UIApplication.shared.open(url)
            return decisionHandler(.cancel)
        }
        decisionHandler(.allow)
    }

    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) { webView.reload() }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if let url = navigationAction.request.url { UIApplication.shared.open(url) }
        return nil
    }

    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let a = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default) { _ in completionHandler() })
        present(a, animated: true)
    }

    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let a = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in completionHandler(false) })
        a.addAction(UIAlertAction(title: "OK", style: .default) { _ in completionHandler(true) })
        present(a, animated: true)
    }
}
