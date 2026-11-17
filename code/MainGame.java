package com.tpcstld.twozerogame;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import com.tpcstld.twozerogame.snapshot.SnapshotData;
import com.tpcstld.twozerogame.snapshot.SnapshotManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class MainGame {
    static final int FADE_GLOBAL_ANIMATION = 0;
    private static final String FIRST_RUN = "first run";
    private static final int GAME_ENDLESS = 2;
    private static final int GAME_ENDLESS_WON = 3;
    private static final int GAME_LOST = -1;
    private static final int GAME_NORMAL = 0;
    private static final int GAME_WIN = 1;
    private static final String HIGH_SCORE = "high score";
    static final int MERGE_ANIMATION = 1;
    static final int MOVE_ANIMATION = 0;
    private static final long MOVE_ANIMATION_TIME = 100000000;
    private static final long NOTIFICATION_ANIMATION_TIME = 500000000;
    private static final long NOTIFICATION_DELAY_TIME = 200000000;
    static final int SPAWN_ANIMATION = -1;
    private static final long SPAWN_ANIMATION_TIME = 100000000;
    private static int endingMaxValue = 0;
    private static final int startingMaxValue = 2048;
    AnimationGrid aGrid;
    boolean canUndo;
    private final Context mContext;
    private final MainView mView;
    int gameState = 0;
    int lastGameState = 0;
    private int bufferGameState = 0;
    final int numSquaresX = 4;
    final int numSquaresY = 4;
    Grid grid = null;
    public long score = 0;
    long highScore = 0;
    long lastScore = 0;
    private long bufferScore = 0;

    MainGame(Context context, MainView mainView) {
        this.mContext = context;
        this.mView = mainView;
        mainView.getClass();
        endingMaxValue = (int) Math.pow(2.0d, 20);
    }

    private void addRandomTile() {
        if (this.grid.isCellsAvailable()) {
            spawnTile(new Tile(this.grid.randomAvailableCell(), Math.random() < 0.9d ? 2 : 4));
        }
    }

    private void addStartTiles() {
        List<Tile> listGeneratePremadeMap = DebugTools.generatePremadeMap();
        if (listGeneratePremadeMap != null) {
            Iterator<Tile> it = listGeneratePremadeMap.iterator();
            while (it.hasNext()) {
                spawnTile(it.next());
            }
        } else {
            for (int i = 0; i < 2; i++) {
                addRandomTile();
            }
        }
    }

    private List<Integer> buildTraversalsX(Cell cell) {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 4; i++) {
            arrayList.add(Integer.valueOf(i));
        }
        if (cell.getX() == 1) {
            Collections.reverse(arrayList);
        }
        return arrayList;
    }

    private List<Integer> buildTraversalsY(Cell cell) {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 4; i++) {
            arrayList.add(Integer.valueOf(i));
        }
        if (cell.getY() == 1) {
            Collections.reverse(arrayList);
        }
        return arrayList;
    }

    private void checkLose() {
        if (movesAvailable() || gameWon()) {
            return;
        }
        this.gameState = -1;
        endGame();
    }

    private void endGame() {
        this.aGrid.startAnimation(-1, -1, 0, NOTIFICATION_ANIMATION_TIME, NOTIFICATION_DELAY_TIME, null);
        long j = this.score;
        if (j >= this.highScore) {
            this.highScore = j;
            recordHighScore();
        }
    }

    private Cell[] findFarthestPosition(Cell cell, Cell cell2) {
        Cell cell3;
        Cell cell4 = new Cell(cell.getX(), cell.getY());
        while (true) {
            cell3 = new Cell(cell4.getX() + cell2.getX(), cell4.getY() + cell2.getY());
            if (!this.grid.isCellWithinBounds(cell3) || !this.grid.isCellAvailable(cell3)) {
                break;
            }
            cell4 = cell3;
        }
        return new Cell[]{cell4, cell3};
    }

    private boolean firstRun() {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(this.mContext);
        if (!defaultSharedPreferences.getBoolean(FIRST_RUN, true)) {
            return false;
        }
        SharedPreferences.Editor editorEdit = defaultSharedPreferences.edit();
        editorEdit.putBoolean(FIRST_RUN, false);
        editorEdit.apply();
        return true;
    }

    private long getHighScore() {
        return PreferenceManager.getDefaultSharedPreferences(this.mContext).getLong(HIGH_SCORE, -1L);
    }

    private Cell getVector(int i) {
        return new Cell[]{new Cell(0, -1), new Cell(1, 0), new Cell(0, 1), new Cell(-1, 0)}[i];
    }

    private void moveTile(Tile tile, Cell cell) {
        this.grid.field[tile.getX()][tile.getY()] = null;
        this.grid.field[cell.getX()][cell.getY()] = tile;
        tile.updatePosition(cell);
    }

    private boolean movesAvailable() {
        return this.grid.isCellsAvailable() || tileMatchesAvailable();
    }

    private boolean positionsEqual(Cell cell, Cell cell2) {
        return cell.getX() == cell2.getX() && cell.getY() == cell2.getY();
    }

    private void prepareTiles() {
        for (Tile[] tileArr : this.grid.field) {
            for (Tile tile : tileArr) {
                if (this.grid.isCellOccupied(tile)) {
                    tile.setMergedFrom(null);
                }
            }
        }
    }

    private void prepareUndoState() {
        this.grid.prepareSaveTiles();
        this.bufferScore = this.score;
        this.bufferGameState = this.gameState;
    }

    private void recordHighScore() {
        SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this.mContext).edit();
        editorEdit.putLong(HIGH_SCORE, this.highScore);
        editorEdit.apply();
        SnapshotManager.saveSnapshot(this.mContext, new SnapshotData(this.highScore));
    }

    private void saveUndoState() {
        this.grid.saveTiles();
        this.canUndo = true;
        this.lastScore = this.bufferScore;
        this.lastGameState = this.bufferGameState;
    }

    private void spawnTile(Tile tile) {
        this.grid.insertTile(tile);
        this.aGrid.startAnimation(tile.getX(), tile.getY(), -1, 100000000L, 100000000L, null);
    }

    private boolean tileMatchesAvailable() {
        for (int i = 0; i < 4; i++) {
            for (int i2 = 0; i2 < 4; i2++) {
                Tile cellContent = this.grid.getCellContent(new Cell(i, i2));
                if (cellContent != null) {
                    for (int i3 = 0; i3 < 4; i3++) {
                        Cell vector = getVector(i3);
                        Tile cellContent2 = this.grid.getCellContent(new Cell(vector.getX() + i, vector.getY() + i2));
                        if (cellContent2 != null && cellContent2.getValue() == cellContent.getValue()) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    private int winValue() {
        if (canContinue()) {
            return 2048;
        }
        return endingMaxValue;
    }

    boolean canContinue() {
        int i = this.gameState;
        return (i == 2 || i == 3) ? false : true;
    }

    boolean gameLost() {
        return this.gameState == -1;
    }

    boolean gameWon() {
        int i = this.gameState;
        return i > 0 && i % 2 != 0;
    }

    void handleSnapshot(SnapshotData snapshotData) {
        this.highScore = Math.max(snapshotData.getHighScore(), this.highScore);
        SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this.mContext).edit();
        editorEdit.putLong(HIGH_SCORE, this.highScore);
        editorEdit.apply();
        this.mView.invalidate();
        System.out.println("Successfully loaded snapshot from Cloud Save: " + this.highScore);
    }

    boolean isActive() {
        return (gameWon() || gameLost()) ? false : true;
    }

    void move(int i) {
        this.aGrid.cancelAnimations();
        if (isActive()) {
            prepareUndoState();
            Cell vector = getVector(i);
            List<Integer> listBuildTraversalsX = buildTraversalsX(vector);
            List<Integer> listBuildTraversalsY = buildTraversalsY(vector);
            prepareTiles();
            Iterator<Integer> it = listBuildTraversalsX.iterator();
            boolean z = false;
            while (it.hasNext()) {
                int iIntValue = it.next().intValue();
                Iterator<Integer> it2 = listBuildTraversalsY.iterator();
                while (it2.hasNext()) {
                    int iIntValue2 = it2.next().intValue();
                    Cell cell = new Cell(iIntValue, iIntValue2);
                    Tile cellContent = this.grid.getCellContent(cell);
                    if (cellContent != null) {
                        Cell[] cellArrFindFarthestPosition = findFarthestPosition(cell, vector);
                        Tile cellContent2 = this.grid.getCellContent(cellArrFindFarthestPosition[1]);
                        if (cellContent2 != null && cellContent2.getValue() == cellContent.getValue() && cellContent2.getMergedFrom() == null) {
                            Tile tile = new Tile(cellArrFindFarthestPosition[1], cellContent.getValue() * 2);
                            tile.setMergedFrom(new Tile[]{cellContent, cellContent2});
                            this.grid.insertTile(tile);
                            this.grid.removeTile(cellContent);
                            cellContent.updatePosition(cellArrFindFarthestPosition[1]);
                            this.aGrid.startAnimation(tile.getX(), tile.getY(), 0, 100000000L, 0L, new int[]{iIntValue, iIntValue2});
                            this.aGrid.startAnimation(tile.getX(), tile.getY(), 1, 100000000L, 100000000L, null);
                            this.score += (long) tile.getValue();
                            this.highScore = Math.max(this.score, this.highScore);
                            long j = this.score;
                            if (j >= this.highScore) {
                                this.highScore = j;
                                recordHighScore();
                            }
                            if (tile.getValue() >= winValue() && !gameWon()) {
                                this.gameState++;
                                endGame();
                            }
                        } else {
                            moveTile(cellContent, cellArrFindFarthestPosition[0]);
                            this.aGrid.startAnimation(cellArrFindFarthestPosition[0].getX(), cellArrFindFarthestPosition[0].getY(), 0, 100000000L, 0L, new int[]{iIntValue, iIntValue2, 0});
                        }
                        if (!positionsEqual(cell, cellContent)) {
                            z = true;
                        }
                    }
                }
            }
            if (z) {
                saveUndoState();
                addRandomTile();
                checkLose();
            }
            this.mView.resyncTime();
            this.mView.invalidate();
        }
    }

    void newGame() {
        if (this.grid == null) {
            this.grid = new Grid(4, 4);
        } else {
            prepareUndoState();
            saveUndoState();
            this.grid.clearGrid();
        }
        this.aGrid = new AnimationGrid(4, 4);
        this.highScore = getHighScore();
        long j = this.score;
        if (j >= this.highScore) {
            this.highScore = j;
            recordHighScore();
        }
        this.score = DebugTools.getStartingScore();
        this.gameState = 0;
        addStartTiles();
        this.mView.showHelp = firstRun();
        MainView mainView = this.mView;
        mainView.refreshLastTime = true;
        mainView.resyncTime();
        this.mView.invalidate();
    }

    void revertUndoState() {
        if (this.canUndo) {
            this.canUndo = false;
            this.aGrid.cancelAnimations();
            this.grid.revertTiles();
            this.score = this.lastScore;
            this.gameState = this.lastGameState;
            MainView mainView = this.mView;
            mainView.refreshLastTime = true;
            mainView.invalidate();
        }
    }

    void setEndlessMode() {
        this.gameState = 2;
        this.mView.invalidate();
        this.mView.refreshLastTime = true;
    }
}
