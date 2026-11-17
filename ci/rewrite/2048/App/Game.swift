import Foundation

// Port of the APK's MainGame + Grid (decompiled): same rules, same numbers.
struct Tile: Identifiable, Equatable {
    let id: UUID
    var x: Int, y: Int, value: Int
    var mergedFrom: [UUID]? = nil
    var isNew = false
}

final class Game: ObservableObject {
    // gameState values from the APK
    static let NORMAL = 0, WIN = 1, ENDLESS = 2, ENDLESS_WON = 3, LOST = -1
    let size = 4
    @Published var tiles: [Tile] = []
    @Published var score: Int64 = 0
    @Published var highScore: Int64 = 0
    @Published var gameState = 0
    @Published var canUndo = false
    @Published var showHelp = false
    private var lastTiles: [Tile] = [], lastScore: Int64 = 0, lastGameState = 0
    private var bufferTiles: [Tile] = [], bufferScore: Int64 = 0, bufferGameState = 0
    private let endingMaxValue = Int(pow(2.0, 20.0))
    private let d = UserDefaults.standard

    init() {
        highScore = Int64(d.object(forKey: "high score") as? Int ?? 0)
        if let saved = d.data(forKey: "state"), let s = try? JSONDecoder().decode(Saved.self, from: saved), !s.tiles.isEmpty {
            tiles = s.tiles.map { Tile(id: UUID(), x: $0[0], y: $0[1], value: $0[2]) }
            score = s.score; gameState = s.gameState
            lastTiles = (s.undoTiles ?? []).map { Tile(id: UUID(), x: $0[0], y: $0[1], value: $0[2]) }
            lastScore = s.undoScore ?? 0; lastGameState = s.undoGameState ?? 0; canUndo = s.canUndo ?? false
        } else { newGame() }
    }

    func cell(_ x: Int, _ y: Int) -> Tile? { tiles.first { $0.x == x && $0.y == y } }
    private var available: [(Int, Int)] { (0..<size).flatMap { x in (0..<size).map { (x, $0) } }.filter { cell($0.0, $0.1) == nil } }

    func newGame() {
        if !tiles.isEmpty { prepareUndo(); saveUndo() }
        tiles = []
        if score >= highScore { highScore = score; recordHighScore() }
        score = 0; gameState = Game.NORMAL
        for _ in 0..<2 { addRandomTile() }
        showHelp = firstRun()
        persist()
    }

    private func addRandomTile() {
        guard let c = available.randomElement() else { return }
        tiles.append(Tile(id: UUID(), x: c.0, y: c.1, value: Double.random(in: 0..<1) < 0.9 ? 2 : 4, isNew: true))
    }

    private func firstRun() -> Bool {
        if d.object(forKey: "first run") as? Bool == false { return false }
        d.set(false, forKey: "first run"); return true
    }

    private func recordHighScore() { d.set(Int(highScore), forKey: "high score") }   // cloud save removed

    var gameWon: Bool { gameState > 0 && gameState % 2 != 0 }
    var gameLost: Bool { gameState == Game.LOST }
    var canContinue: Bool { !(gameState == Game.ENDLESS || gameState == Game.ENDLESS_WON) }
    var isActive: Bool { !(gameWon || gameLost) }
    private var winValue: Int { canContinue ? 2048 : endingMaxValue }

    // direction: 0 up, 1 right, 2 down, 3 left (getVector in the APK)
    func move(_ direction: Int) {
        guard isActive else { return }
        prepareUndo()
        let v = [(0, -1), (1, 0), (0, 1), (-1, 0)][direction]
        var xs = Array(0..<size), ys = Array(0..<size)
        if v.0 == 1 { xs.reverse() }
        if v.1 == 1 { ys.reverse() }
        for i in tiles.indices { tiles[i].mergedFrom = nil; tiles[i].isNew = false }
        var moved = false
        for x in xs { for y in ys {
            guard let t = cell(x, y) else { continue }
            var far = (x, y), next = (x + v.0, y + v.1)
            while inBounds(next) && cell(next.0, next.1) == nil { far = next; next = (next.0 + v.0, next.1 + v.1) }
            if inBounds(next), let other = cell(next.0, next.1), other.value == t.value, other.mergedFrom == nil {
                let merged = Tile(id: UUID(), x: next.0, y: next.1, value: t.value * 2, mergedFrom: [t.id, other.id])
                tiles.removeAll { $0.id == t.id || $0.id == other.id }
                tiles.append(merged)
                score += Int64(merged.value)
                if score >= highScore { highScore = score; recordHighScore() }
                if merged.value >= winValue && !gameWon { gameState += 1; endGame() }
                moved = true
            } else if far != (x, y), let i = tiles.firstIndex(where: { $0.id == t.id }) {
                tiles[i].x = far.0; tiles[i].y = far.1; moved = true
            }
        } }
        if moved { saveUndo(); addRandomTile(); checkLose() }
        persist()
    }

    private func inBounds(_ c: (Int, Int)) -> Bool { c.0 >= 0 && c.0 < size && c.1 >= 0 && c.1 < size }

    private func tileMatchesAvailable() -> Bool {
        for t in tiles { for v in [(0, -1), (1, 0), (0, 1), (-1, 0)] { if cell(t.x + v.0, t.y + v.1)?.value == t.value { return true } } }
        return false
    }

    private func checkLose() {
        if !available.isEmpty || tileMatchesAvailable() || gameWon { return }
        gameState = Game.LOST; endGame()
    }

    private func endGame() { if score >= highScore { highScore = score; recordHighScore() } }

    private func prepareUndo() { bufferTiles = tiles; bufferScore = score; bufferGameState = gameState }
    private func saveUndo() { lastTiles = bufferTiles; lastScore = bufferScore; lastGameState = bufferGameState; canUndo = true }

    func undo() {
        guard canUndo else { return }
        canUndo = false; tiles = lastTiles; score = lastScore; gameState = lastGameState; persist()
    }

    func setEndlessMode() { gameState = Game.ENDLESS; persist() }

    // the APK keeps the board between launches (onSaveInstanceState / prefs)
    private struct Saved: Codable {
        var tiles: [[Int]]; var score: Int64; var gameState: Int
        var undoTiles: [[Int]]?; var undoScore: Int64?; var undoGameState: Int?; var canUndo: Bool?
    }
    private func persist() {
        let s = Saved(tiles: tiles.map { [$0.x, $0.y, $0.value] }, score: score, gameState: gameState,
                      undoTiles: lastTiles.map { [$0.x, $0.y, $0.value] }, undoScore: lastScore, undoGameState: lastGameState, canUndo: canUndo)
        d.set(try? JSONEncoder().encode(s), forKey: "state")
    }
}
