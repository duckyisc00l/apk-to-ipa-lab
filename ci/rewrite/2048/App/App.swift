import SwiftUI
import CoreText

@main
struct TwoZeroFourEightApp: App {
    init() {
        // the APK's own font, registered from the app's folder (not named Resources: see the skill)
        let url = Res.dir.appendingPathComponent("ClearSans-Bold.ttf")
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
    }
    var body: some Scene { WindowGroup { GameView() } }
}
