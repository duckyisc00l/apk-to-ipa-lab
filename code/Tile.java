package com.tpcstld.twozerogame;

/* JADX INFO: loaded from: classes.dex */
public class Tile extends Cell {
    private Tile[] mergedFrom;
    private final int value;

    public Tile(int i, int i2, int i3) {
        super(i, i2);
        this.mergedFrom = null;
        this.value = i3;
    }

    public Tile(Cell cell, int i) {
        super(cell.getX(), cell.getY());
        this.mergedFrom = null;
        this.value = i;
    }

    public Tile[] getMergedFrom() {
        return this.mergedFrom;
    }

    public int getValue() {
        return this.value;
    }

    public void setMergedFrom(Tile[] tileArr) {
        this.mergedFrom = tileArr;
    }

    public void updatePosition(Cell cell) {
        setX(cell.getX());
        setY(cell.getY());
    }
}
