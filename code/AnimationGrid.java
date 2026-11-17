package com.tpcstld.twozerogame;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public class AnimationGrid {
    private final ArrayList<AnimationCell>[][] field;
    public final ArrayList<AnimationCell> globalAnimation = new ArrayList<>();
    private int activeAnimations = 0;
    private boolean oneMoreFrame = false;

    public AnimationGrid(int i, int i2) {
        this.field = (ArrayList[][]) Array.newInstance((Class<?>) ArrayList.class, i, i2);
        for (int i3 = 0; i3 < i; i3++) {
            for (int i4 = 0; i4 < i2; i4++) {
                this.field[i3][i4] = new ArrayList<>();
            }
        }
    }

    private void cancelAnimation(AnimationCell animationCell) {
        if (animationCell.getX() == -1 && animationCell.getY() == -1) {
            this.globalAnimation.remove(animationCell);
        } else {
            this.field[animationCell.getX()][animationCell.getY()].remove(animationCell);
        }
    }

    public void cancelAnimations() {
        for (ArrayList<AnimationCell>[] arrayListArr : this.field) {
            for (ArrayList<AnimationCell> arrayList : arrayListArr) {
                arrayList.clear();
            }
        }
        this.globalAnimation.clear();
        this.activeAnimations = 0;
    }

    public ArrayList<AnimationCell> getAnimationCell(int i, int i2) {
        return this.field[i][i2];
    }

    public boolean isAnimationActive() {
        if (this.activeAnimations != 0) {
            this.oneMoreFrame = true;
            return true;
        }
        if (!this.oneMoreFrame) {
            return false;
        }
        this.oneMoreFrame = false;
        return true;
    }

    public void startAnimation(int i, int i2, int i3, long j, long j2, int[] iArr) {
        AnimationCell animationCell = new AnimationCell(i, i2, i3, j, j2, iArr);
        if (i == -1 && i2 == -1) {
            this.globalAnimation.add(animationCell);
        } else {
            this.field[i][i2].add(animationCell);
        }
        this.activeAnimations++;
    }

    public void tickAll(long j) {
        ArrayList arrayList = new ArrayList();
        for (AnimationCell animationCell : this.globalAnimation) {
            animationCell.tick(j);
            if (animationCell.animationDone()) {
                arrayList.add(animationCell);
                this.activeAnimations--;
            }
        }
        for (ArrayList<AnimationCell>[] arrayListArr : this.field) {
            for (ArrayList<AnimationCell> arrayList2 : arrayListArr) {
                for (AnimationCell animationCell2 : arrayList2) {
                    animationCell2.tick(j);
                    if (animationCell2.animationDone()) {
                        arrayList.add(animationCell2);
                        this.activeAnimations--;
                    }
                }
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            cancelAnimation((AnimationCell) it.next());
        }
    }
}
