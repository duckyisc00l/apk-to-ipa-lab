import SwiftUI
import CoreText

// Rewrite of Ricochlime's first screens from its Flutter APK (step R). Texts come from the strings blutter
// recovered from libapp.so (slang translations en/es/ru/kk); art, fonts and colours from flutter_assets.
@main
struct RicochlimeApp: App {
    init() { Assets.registerFonts() }
    var body: some Scene { WindowGroup { RootView() } }
}

enum Assets {
    static let root = Bundle.main.resourceURL!.appendingPathComponent("AppAssets")
    static func registerFonts() {
        let e = FileManager.default.enumerator(at: root, includingPropertiesForKeys: nil)
        while let u = e?.nextObject() as? URL {
            if u.pathExtension == "ttf" { CTFontManagerRegisterFontsForURL(u as CFURL, .process, nil) }
        }
    }
    static func image(_ name: String) -> UIImage? { UIImage(contentsOfFile: root.appendingPathComponent("images/\(name)").path) }
    static func cg(_ name: String, _ rect: CGRect) -> CGImage? { image(name)?.cgImage?.cropping(to: rect) }
}

enum Palette {   // sampled from the app's own screenshots
    static let background = Color(red: 0xf7/255, green: 0xfb/255, blue: 0xf1/255)
    static let ink = Color(red: 0x19/255, green: 0x1d/255, blue: 0x17/255)
    static let primary = Color(red: 0x3f/255, green: 0x6b/255, blue: 0x3a/255)
    static let button = Color(red: 0xbf/255, green: 0xcf/255, blue: 0xba/255)
    static let water = Color(red: 0x1e/255, green: 0x7c/255, blue: 0xb8/255)
}

/// Texts recovered from libapp.so (blutter object pool): Translations.homePage etc. in 4 languages.
enum T {
    static let lang = String(Locale.preferredLanguages.first?.prefix(2) ?? "en")
    static func pick(_ en: String, _ es: String, _ ru: String, _ kk: String) -> String {
        switch lang { case "es": return es; case "ru": return ru; case "kk": return kk; default: return en }
    }
    static var play: String { pick("Play", "Jugar", "Играть", "Ойнау") }
    static var shop: String { pick("Shop", "Comercio", "Купить", "дүкен") }
    static var tutorial: String { pick("Tutorial", "Tutorial", "Как играть", "Нұсқаулық") }
    static var settings: String { pick("Settings", "Ajustes", "Настройки", "Баптау") }
    static let best = "Best: "
}

struct RootView: View {
    @State private var page: String? = nil
    var body: some View {
        switch page {
        case "play": PlayView(back: { page = nil })
        case "settings": SettingsView(back: { page = nil })
        default: HomeView(open: { page = $0 })
        }
    }
}

struct NesButton: View {
    let title: String; let icon: String; var primary = false; let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 18) {
                Image(systemName: icon).font(.system(size: 22, weight: .black))
                Text(title.uppercased()).font(.custom("PressStart2P-Regular", size: 17))
            }
            .foregroundColor(primary ? .white : Palette.ink)
            .padding(.horizontal, 22).padding(.vertical, 18)
            .background(primary ? Palette.primary : Palette.button)
            .overlay(Rectangle().stroke(Palette.ink, lineWidth: 4))
            .background(Rectangle().fill(Palette.ink).offset(x: 3, y: 4))
        }
        .accessibilityLabel(title)
    }
}

struct HomeView: View {
    let open: (String) -> Void
    var body: some View {
        ZStack {
            Palette.background.ignoresSafeArea()
            VStack(spacing: 28) {
                Text("RICOCHLIME").font(.custom("Silkscreen-Regular", size: 44)).foregroundColor(Palette.ink)
                    .minimumScaleFactor(0.5).lineLimit(1).padding(.horizontal, 20).accessibilityLabel("Ricochlime")
                HStack(spacing: 10) { Image(systemName: "music.note"); Image(systemName: "bell.fill") }
                    .font(.system(size: 26)).foregroundColor(.gray.opacity(0.5)).padding(.bottom, 20)
                NesButton(title: T.play, icon: "play.fill", primary: true) { open("play") }
                NesButton(title: T.shop, icon: "cart.fill") { }
                NesButton(title: T.tutorial, icon: "questionmark.square.fill") { }
                NesButton(title: T.settings, icon: "gamecontroller.fill") { open("settings") }
            }
        }
    }
}

struct SettingsView: View {
    let back: () -> Void
    @AppStorage("bgmVolume") var bgm = 0.7
    @AppStorage("sfxVolume") var sfx = 0.7
    var body: some View {
        ZStack { Palette.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24) {
                Button(action: back) { Image(systemName: "chevron.left").font(.title) }.accessibilityLabel("Back")
                Text(T.settings.uppercased()).font(.custom("PressStart2P-Regular", size: 22))
                Text(T.pick("Music volume", "Volumen de la música", "Громкость музыки", "Музыка көлемі")).font(.custom("PressStart2P-Regular", size: 12))
                Slider(value: $bgm)
                Text(T.pick("Sound effects volume", "Volumen de efectos", "Громкость звуковых эффектов", "Дыбыс әсерлерінің көлемі")).font(.custom("PressStart2P-Regular", size: 12))
                Slider(value: $sfx)
                Spacer()
            }.padding(24).foregroundColor(Palette.ink).tint(Palette.primary)
        }
    }
}
