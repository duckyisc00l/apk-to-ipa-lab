package com.tpcstld.twozerogame;

/* JADX INFO: loaded from: classes.dex */
class AnimationCell extends Cell {
    private final long animationTime;
    private final int animationType;
    private final long delayTime;
    public final int[] extras;
    private long timeElapsed;

    public AnimationCell(int i, int i2, int i3, long j, long j2, int[] iArr) {
        super(i, i2);
        this.animationType = i3;
        this.animationTime = j;
        this.delayTime = j2;
        this.extras = iArr;
    }

    public boolean animationDone() {
        return this.animationTime + this.delayTime < this.timeElapsed;
    }

    public int getAnimationType() {
        return this.animationType;
    }

    public double getPercentageDone() {
        double d = this.timeElapsed - this.delayTime;
        Double.isNaN(d);
        double d2 = this.animationTime;
        Double.isNaN(d2);
        return Math.max(0.0d, (d * 1.0d) / d2);
    }

    public boolean isActive() {
        return this.timeElapsed >= this.delayTime;
    }

    public void tick(long j) {
        this.timeElapsed += j;
    }
}
