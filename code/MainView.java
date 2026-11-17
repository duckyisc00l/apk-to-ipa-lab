package com.tpcstld.twozerogame;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import com.google.android.gms.games.Notifications;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class MainView extends View {
    static final int BASE_ANIMATION_TIME = 100000000;
    private static final float INITIAL_VELOCITY = 0.375f;
    private static final float MERGING_ACCELERATION = -0.5f;
    private static final String TAG = "MainView";
    private Bitmap background;
    private Drawable backgroundRectangle;
    private final BitmapDrawable[] bitmapCell;
    private int bodyStartYAll;
    private float bodyTextSize;
    private int cellSize;
    private float cellTextSize;
    public boolean continueButtonEnabled;
    private int eYAll;
    public int endingX;
    public int endingY;
    private Drawable fadeRectangle;
    public final MainGame game;
    private float gameOverTextSize;
    private int gridWidth;
    public boolean hasSaveState;
    private float headerTextSize;
    private int iconPaddingSize;
    public int iconSize;
    private float instructionsTextSize;
    private long lastFPSTime;
    private Drawable lightUpRectangle;
    private BitmapDrawable loseGameOverlay;
    public final int numCellTypes;
    private final Paint paint;
    boolean refreshLastTime;
    public int sXNewGame;
    public int sXUndo;
    private int sYAll;
    public int sYIcons;
    boolean showHelp;
    public int startingX;
    public int startingY;
    private int textPaddingSize;
    private float textSize;
    private int titleStartYAll;
    private float titleTextSize;
    private int titleWidthHighScore;
    private int titleWidthScore;
    private BitmapDrawable winGameContinueOverlay;
    private BitmapDrawable winGameFinalOverlay;

    public MainView(Context context) {
        super(context);
        this.numCellTypes = 21;
        this.bitmapCell = new BitmapDrawable[21];
        this.paint = new Paint();
        this.hasSaveState = false;
        this.continueButtonEnabled = false;
        this.refreshLastTime = true;
        this.lastFPSTime = System.nanoTime();
        this.cellSize = 0;
        this.textSize = 0.0f;
        this.cellTextSize = 0.0f;
        this.gridWidth = 0;
        this.background = null;
        Resources resources = context.getResources();
        this.game = new MainGame(context, this);
        try {
            this.backgroundRectangle = resources.getDrawable(com.tpcstld.twozerogame.base.R.drawable.background_rectangle);
            this.lightUpRectangle = resources.getDrawable(com.tpcstld.twozerogame.base.R.drawable.light_up_rectangle);
            this.fadeRectangle = resources.getDrawable(com.tpcstld.twozerogame.base.R.drawable.fade_rectangle);
            setBackgroundColor(resources.getColor(com.tpcstld.twozerogame.base.R.color.background));
            this.paint.setTypeface(Typeface.createFromAsset(resources.getAssets(), "ClearSans-Bold.ttf"));
            this.paint.setAntiAlias(true);
        } catch (Exception e) {
            Log.e(TAG, "Error getting assets?", e);
        }
        setOnTouchListener(new InputListener(this));
        this.game.newGame();
    }

    private int centerText() {
        return (int) ((this.paint.descent() + this.paint.ascent()) / 2.0f);
    }

    private void createBackgroundBitmap(int i, int i2) {
        this.background = Bitmap.createBitmap(i, i2, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(this.background);
        drawHeader(canvas);
        drawNewGameButton(canvas, false);
        drawUndoButton(canvas);
        drawBackground(canvas);
        drawBackgroundGrid(canvas);
        if (this.showHelp) {
            drawInstructions(canvas);
        }
    }

    private void createBitmapCells() {
        Resources resources = getResources();
        int[] cellRectangleIds = getCellRectangleIds();
        this.paint.setTextAlign(Paint.Align.CENTER);
        for (int i = 1; i < this.bitmapCell.length; i++) {
            int iPow = (int) Math.pow(2.0d, i);
            this.paint.setTextSize(this.cellTextSize);
            float f = this.cellTextSize;
            int i2 = this.cellSize;
            this.paint.setTextSize(((f * i2) * 0.9f) / Math.max(i2 * 0.9f, this.paint.measureText(String.valueOf(iPow))));
            int i3 = this.cellSize;
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i3, i3, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            Drawable drawable = resources.getDrawable(cellRectangleIds[i]);
            int i4 = this.cellSize;
            drawDrawable(canvas, drawable, 0, 0, i4, i4);
            drawCellText(canvas, iPow);
            this.bitmapCell[i] = new BitmapDrawable(resources, bitmapCreateBitmap);
        }
    }

    private void createEndGameStates(Canvas canvas, boolean z, boolean z2) {
        int i = this.endingX - this.startingX;
        int i2 = this.endingY - this.startingY;
        int i3 = i / 2;
        int i4 = i2 / 2;
        if (!z) {
            this.fadeRectangle.setAlpha(Notifications.NOTIFICATION_TYPES_ALL);
            drawDrawable(canvas, this.fadeRectangle, 0, 0, i, i2);
            this.fadeRectangle.setAlpha(255);
            this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_black));
            this.paint.setAlpha(255);
            this.paint.setTextSize(this.gameOverTextSize);
            this.paint.setTextAlign(Paint.Align.CENTER);
            canvas.drawText(getResources().getString(com.tpcstld.twozerogame.base.R.string.game_over), i3, i4 - centerText(), this.paint);
            return;
        }
        this.lightUpRectangle.setAlpha(Notifications.NOTIFICATION_TYPES_ALL);
        drawDrawable(canvas, this.lightUpRectangle, 0, 0, i, i2);
        this.lightUpRectangle.setAlpha(255);
        this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_white));
        this.paint.setAlpha(255);
        this.paint.setTextSize(this.gameOverTextSize);
        this.paint.setTextAlign(Paint.Align.CENTER);
        int iCenterText = i4 - centerText();
        float f = i3;
        canvas.drawText(getResources().getString(com.tpcstld.twozerogame.base.R.string.you_win), f, iCenterText, this.paint);
        this.paint.setTextSize(this.bodyTextSize);
        canvas.drawText(z2 ? getResources().getString(com.tpcstld.twozerogame.base.R.string.go_on) : getResources().getString(com.tpcstld.twozerogame.base.R.string.for_now), f, (iCenterText + (this.textPaddingSize * 2)) - (centerText() * 2), this.paint);
    }

    private void createOverlays() {
        Resources resources = getResources();
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(this.endingX - this.startingX, this.endingY - this.startingY, Bitmap.Config.ARGB_8888);
        createEndGameStates(new Canvas(bitmapCreateBitmap), true, true);
        this.winGameContinueOverlay = new BitmapDrawable(resources, bitmapCreateBitmap);
        Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap(this.endingX - this.startingX, this.endingY - this.startingY, Bitmap.Config.ARGB_8888);
        createEndGameStates(new Canvas(bitmapCreateBitmap2), true, false);
        this.winGameFinalOverlay = new BitmapDrawable(resources, bitmapCreateBitmap2);
        Bitmap bitmapCreateBitmap3 = Bitmap.createBitmap(this.endingX - this.startingX, this.endingY - this.startingY, Bitmap.Config.ARGB_8888);
        createEndGameStates(new Canvas(bitmapCreateBitmap3), false, false);
        this.loseGameOverlay = new BitmapDrawable(resources, bitmapCreateBitmap3);
    }

    private void drawBackground(Canvas canvas) {
        drawDrawable(canvas, this.backgroundRectangle, this.startingX, this.startingY, this.endingX, this.endingY);
    }

    private void drawBackgroundGrid(Canvas canvas) {
        Drawable drawable = getResources().getDrawable(com.tpcstld.twozerogame.base.R.drawable.cell_rectangle);
        int i = 0;
        while (true) {
            this.game.getClass();
            if (i >= 4) {
                return;
            }
            int i2 = 0;
            while (true) {
                this.game.getClass();
                if (i2 < 4) {
                    int i3 = this.startingX;
                    int i4 = this.gridWidth;
                    int i5 = this.cellSize;
                    int i6 = ((i5 + i4) * i) + i3 + i4;
                    int i7 = this.startingY + i4 + ((i4 + i5) * i2);
                    drawDrawable(canvas, drawable, i6, i7, i6 + i5, i7 + i5);
                    i2++;
                }
            }
            i++;
        }
    }

    private void drawCellText(Canvas canvas, int i) {
        int iCenterText = centerText();
        if (i >= 8) {
            this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_white));
        } else {
            this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_black));
        }
        int i2 = this.cellSize;
        canvas.drawText("" + i, i2 / 2, (i2 / 2) - iCenterText, this.paint);
    }

    private void drawCells(Canvas canvas) {
        int i;
        int i2;
        int i3;
        int i4;
        this.paint.setTextSize(this.textSize);
        this.paint.setTextAlign(Paint.Align.CENTER);
        int i5 = 0;
        while (true) {
            this.game.getClass();
            int i6 = 4;
            if (i5 >= 4) {
                return;
            }
            int i7 = 0;
            while (true) {
                this.game.getClass();
                if (i7 < i6) {
                    int i8 = this.startingX;
                    int i9 = this.gridWidth;
                    int i10 = this.cellSize;
                    int i11 = i8 + i9 + ((i10 + i9) * i5);
                    int i12 = i11 + i10;
                    int i13 = this.startingY + i9 + ((i9 + i10) * i7);
                    int i14 = i10 + i13;
                    Tile cellContent = this.game.grid.getCellContent(i5, i7);
                    if (cellContent != null) {
                        int iLog2 = log2(cellContent.getValue());
                        ArrayList<AnimationCell> animationCell = this.game.aGrid.getAnimationCell(i5, i7);
                        int size = animationCell.size() - 1;
                        boolean z = false;
                        while (size >= 0) {
                            AnimationCell animationCell2 = animationCell.get(size);
                            if (animationCell2.getAnimationType() == -1) {
                                z = true;
                            }
                            if (animationCell2.isActive()) {
                                if (animationCell2.getAnimationType() == -1) {
                                    int i15 = i5;
                                    float percentageDone = (float) animationCell2.getPercentageDone();
                                    this.paint.setTextSize(this.textSize * percentageDone);
                                    float f = (this.cellSize / 2) * (1.0f - percentageDone);
                                    i3 = i15;
                                    i4 = i7;
                                    this.bitmapCell[iLog2].setBounds((int) (i11 + f), (int) (i13 + f), (int) (i12 - f), (int) (i14 - f));
                                    this.bitmapCell[iLog2].draw(canvas);
                                } else {
                                    i3 = i5;
                                    i4 = i7;
                                    if (animationCell2.getAnimationType() == 1) {
                                        double percentageDone2 = animationCell2.getPercentageDone();
                                        float f2 = (float) ((0.375d * percentageDone2) + 1.0d + ((((-0.5d) * percentageDone2) * percentageDone2) / 2.0d));
                                        this.paint.setTextSize(this.textSize * f2);
                                        float f3 = (this.cellSize / 2) * (1.0f - f2);
                                        this.bitmapCell[iLog2].setBounds((int) (i11 + f3), (int) (i13 + f3), (int) (i12 - f3), (int) (i14 - f3));
                                        this.bitmapCell[iLog2].draw(canvas);
                                    } else {
                                        if (animationCell2.getAnimationType() == 0) {
                                            double percentageDone3 = animationCell2.getPercentageDone();
                                            int i16 = animationCell.size() >= 2 ? iLog2 - 1 : iLog2;
                                            int i17 = animationCell2.extras[0];
                                            int i18 = animationCell2.extras[1];
                                            int x = cellContent.getX();
                                            int y = cellContent.getY();
                                            int i19 = x - i17;
                                            int i20 = this.cellSize;
                                            int i21 = this.gridWidth;
                                            double d = i19 * (i20 + i21);
                                            double d2 = percentageDone3 - 1.0d;
                                            Double.isNaN(d);
                                            int i22 = (int) (d * d2 * 1.0d);
                                            double d3 = (y - i18) * (i20 + i21);
                                            Double.isNaN(d3);
                                            int i23 = (int) (d3 * d2 * 1.0d);
                                            this.bitmapCell[i16].setBounds(i11 + i22, i13 + i23, i22 + i12, i23 + i14);
                                            this.bitmapCell[i16].draw(canvas);
                                        }
                                        z = true;
                                    }
                                }
                                z = true;
                            } else {
                                i3 = i5;
                                i4 = i7;
                                cellContent = cellContent;
                                iLog2 = iLog2;
                                animationCell = animationCell;
                            }
                            size--;
                            i5 = i3;
                            i7 = i4;
                            cellContent = cellContent;
                            iLog2 = iLog2;
                            animationCell = animationCell;
                        }
                        i = i5;
                        i2 = i7;
                        int i24 = iLog2;
                        if (!z) {
                            this.bitmapCell[i24].setBounds(i11, i13, i12, i14);
                            this.bitmapCell[i24].draw(canvas);
                        }
                    } else {
                        i = i5;
                        i2 = i7;
                    }
                    i7 = i2 + 1;
                    i5 = i;
                    i6 = 4;
                }
            }
            i5++;
        }
    }

    private void drawDrawable(Canvas canvas, Drawable drawable, int i, int i2, int i3, int i4) {
        drawable.setBounds(i, i2, i3, i4);
        drawable.draw(canvas);
    }

    private void drawEndGameState(Canvas canvas) {
        this.continueButtonEnabled = false;
        double percentageDone = 1.0d;
        for (AnimationCell animationCell : this.game.aGrid.globalAnimation) {
            if (animationCell.getAnimationType() == 0) {
                percentageDone = animationCell.getPercentageDone();
            }
        }
        BitmapDrawable bitmapDrawable = null;
        if (this.game.gameWon()) {
            if (this.game.canContinue()) {
                this.continueButtonEnabled = true;
                bitmapDrawable = this.winGameContinueOverlay;
            } else {
                bitmapDrawable = this.winGameFinalOverlay;
            }
        } else if (this.game.gameLost()) {
            bitmapDrawable = this.loseGameOverlay;
        }
        if (bitmapDrawable != null) {
            bitmapDrawable.setBounds(this.startingX, this.startingY, this.endingX, this.endingY);
            bitmapDrawable.setAlpha((int) (percentageDone * 255.0d));
            bitmapDrawable.draw(canvas);
        }
    }

    private void drawEndlessText(Canvas canvas) {
        this.paint.setTextAlign(Paint.Align.LEFT);
        this.paint.setTextSize(this.bodyTextSize);
        this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_black));
        canvas.drawText(getResources().getString(com.tpcstld.twozerogame.base.R.string.endless), this.startingX, this.sYIcons - (centerText() * 2), this.paint);
    }

    private void drawHeader(Canvas canvas) {
        this.paint.setTextSize(this.headerTextSize);
        this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_black));
        this.paint.setTextAlign(Paint.Align.LEFT);
        canvas.drawText(getResources().getString(com.tpcstld.twozerogame.base.R.string.header), this.startingX, this.sYAll - (centerText() * 2), this.paint);
    }

    private void drawInstructions(Canvas canvas) {
        this.paint.setTextSize(this.instructionsTextSize);
        this.paint.setTextAlign(Paint.Align.LEFT);
        canvas.drawText(getResources().getString(com.tpcstld.twozerogame.base.R.string.instructions), this.startingX, (this.endingY - (centerText() * 2)) + this.textPaddingSize, this.paint);
    }

    private void drawNewGameButton(Canvas canvas, boolean z) {
        if (z) {
            Drawable drawable = this.lightUpRectangle;
            int i = this.sXNewGame;
            int i2 = this.sYIcons;
            int i3 = this.iconSize;
            drawDrawable(canvas, drawable, i, i2, i + i3, i2 + i3);
        } else {
            Drawable drawable2 = this.backgroundRectangle;
            int i4 = this.sXNewGame;
            int i5 = this.sYIcons;
            int i6 = this.iconSize;
            drawDrawable(canvas, drawable2, i4, i5, i4 + i6, i5 + i6);
        }
        Drawable drawable3 = getResources().getDrawable(com.tpcstld.twozerogame.base.R.drawable.ic_action_refresh);
        int i7 = this.sXNewGame;
        int i8 = this.iconPaddingSize;
        int i9 = this.sYIcons;
        int i10 = this.iconSize;
        drawDrawable(canvas, drawable3, i7 + i8, i9 + i8, (i7 + i10) - i8, (i9 + i10) - i8);
    }

    private void drawScoreText(Canvas canvas) {
        this.paint.setTextSize(this.bodyTextSize);
        this.paint.setTextAlign(Paint.Align.CENTER);
        int iMeasureText = (int) this.paint.measureText("" + this.game.highScore);
        int iMeasureText2 = (int) this.paint.measureText("" + this.game.score);
        int iMax = Math.max(this.titleWidthHighScore, iMeasureText) + (this.textPaddingSize * 2);
        int iMax2 = Math.max(this.titleWidthScore, iMeasureText2);
        int i = this.textPaddingSize;
        int i2 = iMax2 + (i * 2);
        int i3 = iMax / 2;
        int i4 = i2 / 2;
        int i5 = this.endingX;
        int i6 = i5 - iMax;
        int i7 = i6 - i;
        int i8 = i7 - i2;
        this.backgroundRectangle.setBounds(i6, this.sYAll, i5, this.eYAll);
        this.backgroundRectangle.draw(canvas);
        this.paint.setTextSize(this.titleTextSize);
        this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_brown));
        float f = i6 + i3;
        canvas.drawText(getResources().getString(com.tpcstld.twozerogame.base.R.string.high_score), f, this.titleStartYAll, this.paint);
        this.paint.setTextSize(this.bodyTextSize);
        this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_white));
        canvas.drawText(String.valueOf(this.game.highScore), f, this.bodyStartYAll, this.paint);
        this.backgroundRectangle.setBounds(i8, this.sYAll, i7, this.eYAll);
        this.backgroundRectangle.draw(canvas);
        this.paint.setTextSize(this.titleTextSize);
        this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_brown));
        float f2 = i8 + i4;
        canvas.drawText(getResources().getString(com.tpcstld.twozerogame.base.R.string.score), f2, this.titleStartYAll, this.paint);
        this.paint.setTextSize(this.bodyTextSize);
        this.paint.setColor(getResources().getColor(com.tpcstld.twozerogame.base.R.color.text_white));
        canvas.drawText(String.valueOf(this.game.score), f2, this.bodyStartYAll, this.paint);
    }

    private void drawUndoButton(Canvas canvas) {
        Drawable drawable = this.backgroundRectangle;
        int i = this.sXUndo;
        int i2 = this.sYIcons;
        int i3 = this.iconSize;
        drawDrawable(canvas, drawable, i, i2, i + i3, i2 + i3);
        Drawable drawable2 = getResources().getDrawable(com.tpcstld.twozerogame.base.R.drawable.ic_action_undo);
        int i4 = this.sXUndo;
        int i5 = this.iconPaddingSize;
        int i6 = this.sYIcons;
        int i7 = this.iconSize;
        drawDrawable(canvas, drawable2, i4 + i5, i6 + i5, (i4 + i7) - i5, (i6 + i7) - i5);
    }

    private int[] getCellRectangleIds() {
        int[] iArr = new int[21];
        iArr[0] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle;
        iArr[1] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_2;
        iArr[2] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_4;
        iArr[3] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_8;
        iArr[4] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_16;
        iArr[5] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_32;
        iArr[6] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_64;
        iArr[7] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_128;
        iArr[8] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_256;
        iArr[9] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_512;
        iArr[10] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_1024;
        iArr[11] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_2048;
        for (int i = 12; i < iArr.length; i++) {
            iArr[i] = com.tpcstld.twozerogame.base.R.drawable.cell_rectangle_4096;
        }
        return iArr;
    }

    private void getLayout(int i, int i2) {
        this.game.getClass();
        this.game.getClass();
        this.cellSize = Math.min(i / 5, i2 / 7);
        int i3 = this.cellSize;
        this.gridWidth = i3 / 7;
        int i4 = (i2 / 2) + (i3 / 2);
        this.iconSize = i3 / 2;
        this.game.getClass();
        this.game.getClass();
        double d = i / 2;
        int i5 = this.cellSize;
        int i6 = this.gridWidth;
        double d2 = i5 + i6;
        Double.isNaN(d2);
        Double.isNaN(d);
        double d3 = i6 / 2;
        Double.isNaN(d3);
        this.startingX = (int) ((d - (d2 * 2.0d)) - d3);
        double d4 = i5 + i6;
        Double.isNaN(d4);
        Double.isNaN(d);
        double d5 = d + (d4 * 2.0d);
        double d6 = i6 / 2;
        Double.isNaN(d6);
        this.endingX = (int) (d5 + d6);
        double d7 = i4;
        double d8 = i5 + i6;
        Double.isNaN(d8);
        Double.isNaN(d7);
        double d9 = i6 / 2;
        Double.isNaN(d9);
        this.startingY = (int) ((d7 - (d8 * 2.0d)) - d9);
        double d10 = i5 + i6;
        Double.isNaN(d10);
        Double.isNaN(d7);
        double d11 = i6 / 2;
        Double.isNaN(d11);
        this.endingY = (int) (d7 + (d10 * 2.0d) + d11);
        float f = this.endingX - this.startingX;
        this.paint.setTextSize(i5);
        int i7 = this.cellSize;
        this.textSize = (i7 * i7) / Math.max(i7, this.paint.measureText("0000"));
        this.paint.setTextAlign(Paint.Align.CENTER);
        this.paint.setTextSize(1000.0f);
        this.instructionsTextSize = Math.min((f / this.paint.measureText(getResources().getString(com.tpcstld.twozerogame.base.R.string.instructions))) * 1000.0f, this.textSize / 1.5f);
        this.gameOverTextSize = Math.min(Math.min(((f - (this.gridWidth * 2)) / this.paint.measureText(getResources().getString(com.tpcstld.twozerogame.base.R.string.game_over))) * 1000.0f, this.textSize * 2.0f), ((f - (this.gridWidth * 2)) / this.paint.measureText(getResources().getString(com.tpcstld.twozerogame.base.R.string.you_win))) * 1000.0f);
        this.paint.setTextSize(this.cellSize);
        float f2 = this.textSize;
        this.cellTextSize = f2;
        this.titleTextSize = f2 / 3.0f;
        double d12 = f2;
        Double.isNaN(d12);
        this.bodyTextSize = (int) (d12 / 1.5d);
        this.headerTextSize = f2 * 2.0f;
        this.textPaddingSize = (int) (f2 / 3.0f);
        this.iconPaddingSize = (int) (f2 / 5.0f);
        this.paint.setTextSize(this.titleTextSize);
        int iCenterText = centerText();
        double d13 = this.startingY;
        double d14 = this.cellSize;
        Double.isNaN(d14);
        Double.isNaN(d13);
        this.sYAll = (int) (d13 - (d14 * 1.5d));
        int i8 = this.sYAll;
        int i9 = this.textPaddingSize;
        float f3 = this.titleTextSize;
        this.titleStartYAll = (int) (((i8 + i9) + (f3 / 2.0f)) - iCenterText);
        this.bodyStartYAll = (int) (this.titleStartYAll + i9 + (f3 / 2.0f) + (this.bodyTextSize / 2.0f));
        this.titleWidthHighScore = (int) this.paint.measureText(getResources().getString(com.tpcstld.twozerogame.base.R.string.high_score));
        this.titleWidthScore = (int) this.paint.measureText(getResources().getString(com.tpcstld.twozerogame.base.R.string.score));
        this.paint.setTextSize(this.bodyTextSize);
        this.eYAll = (int) (this.bodyStartYAll + centerText() + (this.bodyTextSize / 2.0f) + this.textPaddingSize);
        int i10 = (this.startingY + this.eYAll) / 2;
        int i11 = this.iconSize;
        this.sYIcons = i10 - (i11 / 2);
        this.sXNewGame = this.endingX - i11;
        this.sXUndo = (this.sXNewGame - ((i11 * 3) / 2)) - this.iconPaddingSize;
        resyncTime();
    }

    private static int log2(int i) {
        if (i > 0) {
            return 31 - Integer.numberOfLeadingZeros(i);
        }
        throw new IllegalArgumentException();
    }

    private void tick() {
        long jNanoTime = System.nanoTime();
        this.game.aGrid.tickAll(jNanoTime - this.lastFPSTime);
        this.lastFPSTime = jNanoTime;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        canvas.drawBitmap(this.background, 0.0f, 0.0f, this.paint);
        drawScoreText(canvas);
        if (!this.game.isActive() && !this.game.aGrid.isAnimationActive()) {
            drawNewGameButton(canvas, true);
        }
        drawCells(canvas);
        if (!this.game.isActive()) {
            drawEndGameState(canvas);
        }
        if (!this.game.canContinue()) {
            drawEndlessText(canvas);
        }
        if (this.game.aGrid.isAnimationActive()) {
            invalidate(this.startingX, this.startingY, this.endingX, this.endingY);
            tick();
        } else {
            if (this.game.isActive() || !this.refreshLastTime) {
                return;
            }
            invalidate();
            this.refreshLastTime = false;
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        getLayout(i, i2);
        createBitmapCells();
        createBackgroundBitmap(i, i2);
        createOverlays();
    }

    public void resyncTime() {
        this.lastFPSTime = System.nanoTime();
    }
}
