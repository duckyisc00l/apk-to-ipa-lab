package com.tpcstld.twozerogame;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.view.MotionEvent;
import android.view.View;

/* JADX INFO: loaded from: classes.dex */
class InputListener implements View.OnTouchListener {
    private static final int MOVE_THRESHOLD = 250;
    private static final int RESET_STARTING = 10;
    private static final int SWIPE_MIN_DISTANCE = 0;
    private static final int SWIPE_THRESHOLD_VELOCITY = 25;
    private float lastDx;
    private float lastDy;
    private final MainView mView;
    private float previousX;
    private float previousY;
    private float startingX;
    private float startingY;
    private float x;
    private float y;
    private int previousDirection = 1;
    private int veryLastDirection = 1;
    private boolean hasMoved = false;
    private boolean beganOnIcon = false;

    public InputListener(MainView mainView) {
        this.mView = mainView;
    }

    private boolean iconPressed(int i, int i2) {
        return isTap(1) && inRange((float) i, this.x, (float) (i + this.mView.iconSize)) && inRange((float) i2, this.y, (float) (i2 + this.mView.iconSize));
    }

    private boolean inRange(float f, float f2, float f3) {
        return f <= f2 && f2 <= f3;
    }

    private boolean isTap(int i) {
        return pathMoved() <= ((float) ((this.mView.iconSize * this.mView.iconSize) * i));
    }

    private float pathMoved() {
        float f = this.x;
        float f2 = this.startingX;
        float f3 = (f - f2) * (f - f2);
        float f4 = this.y;
        float f5 = this.startingY;
        return f3 + ((f4 - f5) * (f4 - f5));
    }

    /* JADX WARN: Code duplicated, block: B:46:0x00fb  */
    /* JADX WARN: Code duplicated, block: B:54:0x011a  */
    /* JADX WARN: Code duplicated, block: B:65:0x0157  */
    /* JADX WARN: Code duplicated, block: B:73:0x0176  */
    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        int i;
        int i2;
        int action = motionEvent.getAction();
        boolean z = false;
        if (action == 0) {
            this.x = motionEvent.getX();
            this.y = motionEvent.getY();
            float f = this.x;
            this.startingX = f;
            float f2 = this.y;
            this.startingY = f2;
            this.previousX = f;
            this.previousY = f2;
            this.lastDx = 0.0f;
            this.lastDy = 0.0f;
            this.hasMoved = false;
            this.beganOnIcon = iconPressed(this.mView.sXNewGame, this.mView.sYIcons) || iconPressed(this.mView.sXUndo, this.mView.sYIcons);
            return true;
        }
        if (action == 1) {
            this.x = motionEvent.getX();
            this.y = motionEvent.getY();
            this.previousDirection = 1;
            this.veryLastDirection = 1;
            if (!this.hasMoved) {
                if (iconPressed(this.mView.sXNewGame, this.mView.sYIcons)) {
                    if (this.mView.game.gameLost()) {
                        this.mView.game.newGame();
                    } else {
                        new AlertDialog.Builder(this.mView.getContext()).setPositiveButton(com.tpcstld.twozerogame.base.R.string.reset, new DialogInterface.OnClickListener() { // from class: com.tpcstld.twozerogame.InputListener.1
                            @Override // android.content.DialogInterface.OnClickListener
                            public void onClick(DialogInterface dialogInterface, int i3) {
                                InputListener.this.mView.game.newGame();
                            }
                        }).setNegativeButton(com.tpcstld.twozerogame.base.R.string.continue_game, (DialogInterface.OnClickListener) null).setTitle(com.tpcstld.twozerogame.base.R.string.reset_dialog_title).setMessage(com.tpcstld.twozerogame.base.R.string.reset_dialog_message).show();
                    }
                } else if (iconPressed(this.mView.sXUndo, this.mView.sYIcons)) {
                    this.mView.game.revertUndoState();
                } else if (isTap(2) && inRange(this.mView.startingX, this.x, this.mView.endingX) && inRange(this.mView.startingY, this.y, this.mView.endingY) && this.mView.continueButtonEnabled) {
                    this.mView.game.setEndlessMode();
                }
            }
        } else if (action == 2) {
            this.x = motionEvent.getX();
            this.y = motionEvent.getY();
            if (this.mView.game.isActive() && !this.beganOnIcon) {
                float f3 = this.x - this.previousX;
                if (Math.abs(this.lastDx + f3) < Math.abs(this.lastDx) + Math.abs(f3) && Math.abs(f3) > 10.0f && Math.abs(this.x - this.startingX) > 0.0f) {
                    this.startingX = this.x;
                    this.startingY = this.y;
                    this.lastDx = f3;
                    this.previousDirection = this.veryLastDirection;
                }
                if (this.lastDx == 0.0f) {
                    this.lastDx = f3;
                }
                float f4 = this.y - this.previousY;
                if (Math.abs(this.lastDy + f4) < Math.abs(this.lastDy) + Math.abs(f4) && Math.abs(f4) > 10.0f && Math.abs(this.y - this.startingY) > 0.0f) {
                    this.startingX = this.x;
                    this.startingY = this.y;
                    this.lastDy = f4;
                    this.previousDirection = this.veryLastDirection;
                }
                if (this.lastDy == 0.0f) {
                    this.lastDy = f4;
                }
                if (pathMoved() > 0.0f && !this.hasMoved) {
                    if ((f4 >= 25.0f && Math.abs(f4) >= Math.abs(f3)) || this.y - this.startingY >= 250.0f) {
                        int i3 = this.previousDirection;
                        if (i3 % 2 != 0) {
                            this.previousDirection = i3 * 2;
                            this.veryLastDirection = 2;
                            this.mView.game.move(2);
                        } else if (f4 > -25.0f) {
                            i = this.previousDirection;
                            if (i % 3 != 0) {
                                this.previousDirection = i * 3;
                                this.veryLastDirection = 3;
                                this.mView.game.move(0);
                            }
                        } else {
                            i = this.previousDirection;
                            if (i % 3 != 0) {
                                this.previousDirection = i * 3;
                                this.veryLastDirection = 3;
                                this.mView.game.move(0);
                            }
                        }
                        z = true;
                    } else if ((f4 > -25.0f && Math.abs(f4) >= Math.abs(f3)) || this.y - this.startingY <= -250.0f) {
                        i = this.previousDirection;
                        if (i % 3 != 0) {
                            this.previousDirection = i * 3;
                            this.veryLastDirection = 3;
                            this.mView.game.move(0);
                            z = true;
                        }
                    }
                    if ((f3 >= 25.0f && Math.abs(f3) >= Math.abs(f4)) || this.x - this.startingX >= 250.0f) {
                        int i4 = this.previousDirection;
                        if (i4 % 5 != 0) {
                            this.previousDirection = i4 * 5;
                            this.veryLastDirection = 5;
                            this.mView.game.move(1);
                        } else if (f3 > -25.0f) {
                            i2 = this.previousDirection;
                            if (i2 % 7 != 0) {
                                this.previousDirection = i2 * 7;
                                this.veryLastDirection = 7;
                                this.mView.game.move(3);
                            }
                        } else {
                            i2 = this.previousDirection;
                            if (i2 % 7 != 0) {
                                this.previousDirection = i2 * 7;
                                this.veryLastDirection = 7;
                                this.mView.game.move(3);
                            }
                        }
                        z = true;
                    } else if ((f3 > -25.0f && Math.abs(f3) >= Math.abs(f4)) || this.x - this.startingX <= -250.0f) {
                        i2 = this.previousDirection;
                        if (i2 % 7 != 0) {
                            this.previousDirection = i2 * 7;
                            this.veryLastDirection = 7;
                            this.mView.game.move(3);
                            z = true;
                        }
                    }
                    if (z) {
                        this.hasMoved = true;
                        this.startingX = this.x;
                        this.startingY = this.y;
                    }
                }
            }
            this.previousX = this.x;
            this.previousY = this.y;
            return true;
        }
        return true;
    }
}
