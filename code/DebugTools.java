package com.tpcstld.twozerogame;

import android.support.annotation.Nullable;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
class DebugTools {
    private static final boolean DEBUG_ENABLED = false;
    private static final int[][] PREMADE_MAP = {new int[]{128, 256, 32768, 131072}, new int[]{8, 16, 0, 2}, new int[]{0, 0, 0, 2}, new int[]{0, 0, 0, 0}};
    private static final long STARTING_SCORE = 2529244;

    DebugTools() {
    }

    @Nullable
    static List<Tile> generatePremadeMap() {
        return null;
    }

    static long getStartingScore() {
        return 0L;
    }
}
