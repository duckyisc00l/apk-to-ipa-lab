import SwiftUI

// The play screen: a grid of log monsters (log_normal / log_green / log_gold, 24x24 frames), the player
// (character_subset, 17x23 frames) at the bottom, drag to aim, release to fire bullets that ricochet.
struct Monster: Identifiable { let id = UUID(); var col: Int; var row: Int; var hp: Int; var kind: String }
struct Bullet { var p: CGPoint; var v: CGVector; var wait: Int }   // wait: frames before it leaves (one after another, like the original)

final class Game: ObservableObject {
    static let cols = 8
    @Published var monsters: [Monster] = []
    @Published var bullets: [Bullet] = []
    @Published var aim: CGPoint? = nil
    @Published var score = 0
    @AppStorage("highScore") var best = 0
    @AppStorage("coins") var coins = 0
    var ammo = 1
    init() { newRow(); newRow(); newRow() }
    func newRow() {
        for i in monsters.indices { monsters[i].row += 1 }
        for c in 0..<Self.cols where Int.random(in: 0..<10) < 4 {
            let r = Int.random(in: 0..<10)
            monsters.append(Monster(col: c, row: 0, hp: score + 1, kind: r == 0 ? "log_gold.png" : r < 3 ? "log_green.png" : "log_normal.png"))
        }
    }
    func fire(from: CGPoint, to: CGPoint, cell: CGFloat) {
        let dx = to.x - from.x, dy = min(to.y - from.y, -10), l = hypot(dx, dy)
        let v = CGVector(dx: dx / l * cell * 0.3, dy: dy / l * cell * 0.3)
        for i in 0..<ammo { bullets.append(Bullet(p: from, v: v, wait: i * 6)) }
    }
    func step(size: CGSize, cell: CGFloat, top: CGFloat) {
        guard !bullets.isEmpty else { return }
        var keep: [Bullet] = []
        for var b in bullets {
            if b.wait > 0 { b.wait -= 1; keep.append(b); continue }
            b.p.x += b.v.dx; b.p.y += b.v.dy
            if b.p.x < 0 || b.p.x > size.width { b.v.dx = -b.v.dx; b.p.x = min(max(b.p.x, 0), size.width) }
            if b.p.y < top { b.v.dy = -b.v.dy; b.p.y = top }
            if let i = monsters.firstIndex(where: { CGRect(x: CGFloat($0.col) * cell, y: top + CGFloat($0.row) * cell, width: cell, height: cell).contains(b.p) }) {
                b.v.dy = -b.v.dy; monsters[i].hp -= 1
                if monsters[i].hp <= 0 {
                    if monsters[i].kind == "log_gold.png" { coins += 1 }
                    if monsters[i].kind == "log_green.png" { ammo += 1 }
                    monsters.remove(at: i)
                }
            }
            if b.p.y < size.height { keep.append(b) }
        }
        bullets = keep
        if bullets.isEmpty { score += 1; best = max(best, score); newRow() }
    }
}

struct PlayView: View {
    let back: () -> Void
    @StateObject private var game = Game()
    private let frames: [String: CGImage] = {
        var d: [String: CGImage] = [:]
        for k in ["log_normal.png", "log_green.png", "log_gold.png"] { d[k] = Assets.cg(k, CGRect(x: 0, y: 0, width: 24, height: 24)) }
        d["player"] = Assets.cg("character_subset.png", CGRect(x: 0, y: 0, width: 17, height: 23))
        d["grass"] = Assets.cg("overworld.png", CGRect(x: 0, y: 0, width: 16, height: 16))
        d["coin"] = Assets.image("coin.png")?.cgImage
        return d
    }()
    var body: some View {
        ZStack {
            Palette.water.ignoresSafeArea()
            VStack(spacing: 12) {
                HStack {
                    Button(action: back) { Image(systemName: "chevron.left").font(.title2.bold()) }.accessibilityLabel("Back")
                    Spacer()
                    VStack(spacing: 4) {
                        Text("\(T.best.uppercased())\(game.best)").font(.custom("PressStart2P-Regular", size: 10))
                        Text("\(game.score)").font(.custom("PressStart2P-Regular", size: 26)).accessibilityLabel("Score \(game.score)")
                    }
                    Spacer()
                    Text("\(game.coins)").font(.custom("PressStart2P-Regular", size: 20))
                    if let c = frames["coin"] { Image(decorative: c, scale: 0.5).interpolation(.none) }
                }.foregroundColor(.white).padding(.horizontal, 18)
                GeometryReader { geo in
                    let cell = geo.size.width / CGFloat(Game.cols)
                    let player = CGPoint(x: geo.size.width / 2, y: geo.size.height - cell * 0.7)
                    TimelineView(.animation) { tl in
                        Canvas { ctx, size in
                            if let g = frames["grass"] {
                                var y: CGFloat = 0
                                while y < size.height { var x: CGFloat = 0
                                    while x < size.width { ctx.draw(Image(decorative: g, scale: 1).interpolation(.none), in: CGRect(x: x, y: y, width: cell / 1.5, height: cell / 1.5)); x += cell / 1.5 }
                                    y += cell / 1.5 }
                            }
                            for m in game.monsters { if let f = frames[m.kind] {
                                ctx.draw(Image(decorative: f, scale: 1).interpolation(.none), in: CGRect(x: CGFloat(m.col) * cell, y: CGFloat(m.row) * cell, width: cell, height: cell)) } }
                            if let a = game.aim {
                                let dx = a.x - player.x, dy = min(a.y - player.y, -10), l = hypot(dx, dy)
                                for i in 1..<14 { let p = CGPoint(x: player.x + dx / l * CGFloat(i) * cell * 0.5, y: player.y + dy / l * CGFloat(i) * cell * 0.5)
                                    ctx.fill(Path(ellipseIn: CGRect(x: p.x - 5, y: p.y - 5, width: 10, height: 10)), with: .color(.white)) }
                            }
                            for b in game.bullets where b.wait == 0 { ctx.fill(Path(ellipseIn: CGRect(x: b.p.x - 6, y: b.p.y - 6, width: 12, height: 12)), with: .color(.white)) }
                            if let p = frames["player"] {
                                ctx.draw(Image(decorative: p, scale: 1).interpolation(.none), in: CGRect(x: player.x - cell * 0.37, y: player.y - cell * 0.5, width: cell * 0.74, height: cell)) }
                        }
                        .onChange(of: tl.date) { _ in game.step(size: geo.size, cell: cell, top: 0) }
                    }
                    .contentShape(Rectangle())
                    .gesture(DragGesture(minimumDistance: 0)
                        .onChanged { v in if game.bullets.isEmpty { game.aim = v.location } }
                        .onEnded { v in if game.bullets.isEmpty { game.fire(from: player, to: v.location, cell: cell) }; game.aim = nil })
                    .accessibilityLabel("Game field")
                }
                .overlay(Rectangle().stroke(Color.white.opacity(0.8), style: StrokeStyle(lineWidth: 2, dash: [4, 3])))
                .padding(.horizontal, 10).padding(.bottom, 10)
            }
        }
    }
}
