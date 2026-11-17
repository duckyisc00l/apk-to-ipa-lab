import SwiftUI

// The APK's MainView, rebuilt: same layout maths (getLayout), colours, font and texts from the APK.
struct Palette: Decodable { let background, text_black, text_white, text_brown, status_background: String; let cells: [String: String]; let board, empty: String }

extension Color {
    init(hex: String) {
        var h = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#")); if h.count == 6 { h = "ff" + h }
        let v = UInt64(h, radix: 16) ?? 0
        self.init(.sRGB, red: Double((v >> 16) & 255) / 255, green: Double((v >> 8) & 255) / 255, blue: Double(v & 255) / 255, opacity: Double((v >> 24) & 255) / 255)
    }
}

enum Res {
    static let dir = Bundle.main.resourceURL!.appendingPathComponent("AppAssets")
    static let palette: Palette = try! JSONDecoder().decode(Palette.self, from: Data(contentsOf: dir.appendingPathComponent("palette.json")))
    static let texts: [String: String] = (try? JSONDecoder().decode([String: String].self, from: Data(contentsOf: dir.appendingPathComponent("strings.json")))) ?? [:]
    static func t(_ k: String) -> String { texts[k] ?? k }
    static func image(_ n: String) -> UIImage? { UIImage(contentsOfFile: dir.appendingPathComponent(n).path) }
    static let fontName = "ClearSans-Bold"
}

struct GameView: View {
    @StateObject var game = Game()
    @State private var confirmReset = false
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width, h = geo.size.height
            let cell = min(w / 5, h / 7), gap = cell / 7
            let boardSide = cell * 4 + gap * 5
            let centreY = h / 2 + cell / 2
            let textSize = cell * 0.55              // APK: cell^2 / width("0000") in its font
            let title = textSize / 3, body = textSize / 1.5, header = textSize * 2
            let startX = (w - boardSide) / 2, startY = centreY - boardSide / 2
            ZStack(alignment: .topLeading) {
                Color(hex: Res.palette.background).ignoresSafeArea()
                // header row: "2048", score boxes, undo + new game
                HStack(alignment: .center, spacing: gap) {
                    Text(Res.t("header")).font(.custom(Res.fontName, size: header)).foregroundColor(Color(hex: Res.palette.text_black))
                        .minimumScaleFactor(0.4).lineLimit(1)
                    Spacer(minLength: 0)
                    ScoreBox(label: Res.t("score"), value: game.score, title: title, body: body)
                    ScoreBox(label: Res.t("high_score"), value: game.highScore, title: title, body: body)
                }
                .frame(width: boardSide).offset(x: startX, y: startY - cell * 1.5 - gap)
                HStack(spacing: cell / 4) {
                    Spacer()
                    IconButton(image: Res.image("ic_action_undo.png"), system: "arrow.uturn.backward", size: cell / 2) { game.undo() }
                        .opacity(game.canUndo ? 1 : 0.4)
                    IconButton(image: Res.image("ic_action_refresh.png"), system: "arrow.clockwise", size: cell / 2) { confirmReset = true }
                }
                .frame(width: boardSide).offset(x: startX, y: startY - cell * 0.75)
                // board
                Board(game: game, cell: cell, gap: gap, textSize: textSize)
                    .frame(width: boardSide, height: boardSide).offset(x: startX, y: startY)
                // instructions under the board (shown on first run, and while the board is fresh)
                if game.showHelp || game.gameState == Game.ENDLESS {
                    Text(game.gameState == Game.ENDLESS ? Res.t("endless") : Res.t("instructions"))
                        .font(.custom(Res.fontName, size: body * 0.8)).foregroundColor(Color(hex: Res.palette.text_black))
                        .frame(width: boardSide).multilineTextAlignment(.center).offset(x: startX, y: startY + boardSide + gap * 2)
                }
            }
            .contentShape(Rectangle())
            .gesture(DragGesture(minimumDistance: 10).onEnded { v in
                // APK: a flick (fast) or a drag of 250 px either way; the bigger axis wins
                let dx = v.predictedEndTranslation.width, dy = v.predictedEndTranslation.height
                guard max(abs(dx), abs(dy)) > 30 else { return }
                withAnimation(.easeInOut(duration: 0.1)) {
                    if abs(dx) > abs(dy) { game.move(dx > 0 ? 1 : 3) } else { game.move(dy > 0 ? 2 : 0) }
                }
            })
        }
        .statusBarHidden(true)
        .alert(Res.t("reset_dialog_title"), isPresented: $confirmReset) {
            Button(Res.t("reset"), role: .destructive) { withAnimation { game.newGame() } }
            Button(Res.t("continue_game"), role: .cancel) {}
        } message: { Text(Res.t("reset_dialog_message")) }
    }
}

struct ScoreBox: View {
    let label: String; let value: Int64; let title: CGFloat; let body: CGFloat
    var body: some View {
        VStack(spacing: 2) {
            Text(label).font(.custom(Res.fontName, size: title)).foregroundColor(Color(hex: Res.palette.text_brown))
            Text("\(value)").font(.custom(Res.fontName, size: body)).foregroundColor(Color(hex: Res.palette.text_white))
                .minimumScaleFactor(0.3).lineLimit(1)
        }
        .padding(.horizontal, title).padding(.vertical, title / 2)
        .background(RoundedRectangle(cornerRadius: title / 2).fill(Color(hex: Res.palette.status_background)))
    }
}

struct IconButton: View {
    let image: UIImage?; let system: String; let size: CGFloat; let action: () -> Void
    var body: some View {
        Button(action: action) {
            Group {
                if let i = image { Image(uiImage: i).resizable().scaledToFit() } else { Image(systemName: system).resizable().scaledToFit().foregroundColor(.white) }
            }
            .padding(size / 5).frame(width: size, height: size)
            .background(RoundedRectangle(cornerRadius: size / 8).fill(Color(hex: Res.palette.status_background)))
        }
    }
}

struct Board: View {
    @ObservedObject var game: Game
    let cell: CGFloat, gap: CGFloat, textSize: CGFloat
    func pos(_ i: Int) -> CGFloat { gap + (cell + gap) * CGFloat(i) + cell / 2 }
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: gap / 2).fill(Color(hex: Res.palette.board))
            ForEach(0..<16, id: \.self) { i in
                RoundedRectangle(cornerRadius: gap / 3).fill(Color(hex: Res.palette.empty))
                    .frame(width: cell, height: cell).position(x: pos(i % 4), y: pos(i / 4))
            }
            ForEach(game.tiles) { t in
                TileView(value: t.value, cell: cell, gap: gap, textSize: textSize)
                    .position(x: pos(t.x), y: pos(t.y))
                    .transition(.scale(scale: 0.1).combined(with: .opacity))
                    .zIndex(Double(t.value))
            }
            if !game.isActive { EndOverlay(game: game, textSize: textSize) }
        }
    }
}

struct TileView: View {
    let value: Int; let cell: CGFloat, gap: CGFloat, textSize: CGFloat
    var body: some View {
        let colour = Res.palette.cells["\(value)"] ?? Res.palette.cells["super"] ?? "#3c3a32"
        let digits = CGFloat(String(value).count)
        Text("\(value)")
            .font(.custom(Res.fontName, size: min(textSize, cell * 0.9 / max(1, digits * 0.6))))
            .foregroundColor(Color(hex: value >= 8 ? Res.palette.text_white : Res.palette.text_black))   // APK: >= 8 is white
            .frame(width: cell, height: cell)
            .background(RoundedRectangle(cornerRadius: gap / 3).fill(Color(hex: colour)))
    }
}

struct EndOverlay: View {
    @ObservedObject var game: Game
    let textSize: CGFloat
    var body: some View {
        let won = game.gameWon
        ZStack {
            Rectangle().fill(won ? Color(hex: "#edc22e").opacity(0.5) : Color(hex: Res.palette.background).opacity(0.73))
            VStack(spacing: textSize / 3) {
                Text(won ? Res.t("you_win") : Res.t("game_over")).font(.custom(Res.fontName, size: textSize))
                    .foregroundColor(Color(hex: won ? Res.palette.text_white : Res.palette.text_black))
                if won {
                    Text(game.canContinue ? Res.t("go_on") : Res.t("for_now")).font(.custom(Res.fontName, size: textSize / 1.5 / 1.5))
                        .foregroundColor(Color(hex: Res.palette.text_white))
                }
            }
        }
        .onTapGesture { if won && game.canContinue { withAnimation { game.setEndlessMode() } } }
    }
}
