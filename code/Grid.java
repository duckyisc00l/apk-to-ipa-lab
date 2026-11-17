package com.tpcstld.twozerogame;

import java.lang.reflect.Array;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class Grid {
    private final Tile[][] bufferField;
    public final Tile[][] field;
    public final Tile[][] undoField;

    public Grid(int i, int i2) {
        this.field = (Tile[][]) Array.newInstance((Class<?>) Tile.class, i, i2);
        this.undoField = (Tile[][]) Array.newInstance((Class<?>) Tile.class, i, i2);
        this.bufferField = (Tile[][]) Array.newInstance((Class<?>) Tile.class, i, i2);
        clearGrid();
        clearUndoGrid();
    }

    private void clearUndoGrid() {
        for (int i = 0; i < this.field.length; i++) {
            for (int i2 = 0; i2 < this.field[0].length; i2++) {
                this.undoField[i][i2] = null;
            }
        }
    }

    private ArrayList<Cell> getAvailableCells() {
        ArrayList<Cell> arrayList = new ArrayList<>();
        for (int i = 0; i < this.field.length; i++) {
            int i2 = 0;
            while (true) {
                Tile[][] tileArr = this.field;
                if (i2 < tileArr[0].length) {
                    if (tileArr[i][i2] == null) {
                        arrayList.add(new Cell(i, i2));
                    }
                    i2++;
                }
            }
        }
        return arrayList;
    }

    private boolean isCellWithinBounds(int i, int i2) {
        if (i < 0) {
            return false;
        }
        Tile[][] tileArr = this.field;
        return i < tileArr.length && i2 >= 0 && i2 < tileArr[0].length;
    }

    public void clearGrid() {
        for (int i = 0; i < this.field.length; i++) {
            int i2 = 0;
            while (true) {
                Tile[][] tileArr = this.field;
                if (i2 < tileArr[0].length) {
                    tileArr[i][i2] = null;
                    i2++;
                }
            }
        }
    }

    public Tile getCellContent(int i, int i2) {
        if (isCellWithinBounds(i, i2)) {
            return this.field[i][i2];
        }
        return null;
    }

    public Tile getCellContent(Cell cell) {
        if (cell == null || !isCellWithinBounds(cell)) {
            return null;
        }
        return this.field[cell.getX()][cell.getY()];
    }

    public void insertTile(Tile tile) {
        this.field[tile.getX()][tile.getY()] = tile;
    }

    public boolean isCellAvailable(Cell cell) {
        return !isCellOccupied(cell);
    }

    public boolean isCellOccupied(Cell cell) {
        return getCellContent(cell) != null;
    }

    public boolean isCellWithinBounds(Cell cell) {
        return cell.getX() >= 0 && cell.getX() < this.field.length && cell.getY() >= 0 && cell.getY() < this.field[0].length;
    }

    public boolean isCellsAvailable() {
        return getAvailableCells().size() >= 1;
    }

    public void prepareSaveTiles() {
        for (int i = 0; i < this.field.length; i++) {
            int i2 = 0;
            while (true) {
                Tile[][] tileArr = this.field;
                if (i2 < tileArr[0].length) {
                    if (tileArr[i][i2] == null) {
                        this.bufferField[i][i2] = null;
                    } else {
                        this.bufferField[i][i2] = new Tile(i, i2, tileArr[i][i2].getValue());
                    }
                    i2++;
                }
            }
        }
    }

    public Cell randomAvailableCell() {
        ArrayList<Cell> availableCells = getAvailableCells();
        if (availableCells.size() < 1) {
            return null;
        }
        double dRandom = Math.random();
        double size = availableCells.size();
        Double.isNaN(size);
        return availableCells.get((int) Math.floor(dRandom * size));
    }

    public void removeTile(Tile tile) {
        this.field[tile.getX()][tile.getY()] = null;
    }

    public void revertTiles() {
        for (int i = 0; i < this.undoField.length; i++) {
            int i2 = 0;
            while (true) {
                Tile[][] tileArr = this.undoField;
                if (i2 < tileArr[0].length) {
                    if (tileArr[i][i2] == null) {
                        this.field[i][i2] = null;
                    } else {
                        this.field[i][i2] = new Tile(i, i2, tileArr[i][i2].getValue());
                    }
                    i2++;
                }
            }
        }
    }

    public void saveTiles() {
        for (int i = 0; i < this.bufferField.length; i++) {
            int i2 = 0;
            while (true) {
                Tile[][] tileArr = this.bufferField;
                if (i2 < tileArr[0].length) {
                    if (tileArr[i][i2] == null) {
                        this.undoField[i][i2] = null;
                    } else {
                        this.undoField[i][i2] = new Tile(i, i2, tileArr[i][i2].getValue());
                    }
                    i2++;
                }
            }
        }
    }
}
