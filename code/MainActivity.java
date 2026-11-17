package com.tpcstld.twozerogame;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.view.KeyEvent;
import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInClient;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.GoogleSignInResult;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.games.Games;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.tpcstld.twozerogame.snapshot.SnapshotData;
import com.tpcstld.twozerogame.snapshot.SnapshotManager;

/* JADX INFO: loaded from: classes.dex */
public class MainActivity extends AppCompatActivity {
    private static final String CAN_UNDO = "can undo";
    private static final String GAME_STATE = "game state";
    private static final String HEIGHT = "height";
    private static final String HIGH_SCORE = "high score temp";
    private static final String NO_LOGIN_PROMPT = "no_login_prompt";
    private static final int RC_SIGN_IN = 9001;
    private static final String SCORE = "score";
    private static final String UNDO_GAME_STATE = "undo game state";
    private static final String UNDO_GRID = "undo";
    private static final String UNDO_SCORE = "undo score";
    private static final String WIDTH = "width";
    private boolean firstLoginAttempt = false;
    private MainView view;

    private void load() {
        this.view.game.aGrid.cancelAnimations();
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(this);
        for (int i = 0; i < this.view.game.grid.field.length; i++) {
            for (int i2 = 0; i2 < this.view.game.grid.field[0].length; i2++) {
                int i3 = defaultSharedPreferences.getInt(i + " " + i2, -1);
                if (i3 > 0) {
                    this.view.game.grid.field[i][i2] = new Tile(i, i2, i3);
                } else if (i3 == 0) {
                    this.view.game.grid.field[i][i2] = null;
                }
                int i4 = defaultSharedPreferences.getInt(UNDO_GRID + i + " " + i2, -1);
                if (i4 > 0) {
                    this.view.game.grid.undoField[i][i2] = new Tile(i, i2, i4);
                } else if (i3 == 0) {
                    this.view.game.grid.undoField[i][i2] = null;
                }
            }
        }
        this.view.game.score = defaultSharedPreferences.getLong(SCORE, this.view.game.score);
        this.view.game.highScore = defaultSharedPreferences.getLong(HIGH_SCORE, this.view.game.highScore);
        this.view.game.lastScore = defaultSharedPreferences.getLong(UNDO_SCORE, this.view.game.lastScore);
        this.view.game.canUndo = defaultSharedPreferences.getBoolean(CAN_UNDO, this.view.game.canUndo);
        this.view.game.gameState = defaultSharedPreferences.getInt(GAME_STATE, this.view.game.gameState);
        this.view.game.lastGameState = defaultSharedPreferences.getInt(UNDO_GAME_STATE, this.view.game.lastGameState);
    }

    private void save() {
        SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this).edit();
        Tile[][] tileArr = this.view.game.grid.field;
        Tile[][] tileArr2 = this.view.game.grid.undoField;
        editorEdit.putInt(WIDTH, tileArr.length);
        editorEdit.putInt(HEIGHT, tileArr.length);
        for (int i = 0; i < tileArr.length; i++) {
            for (int i2 = 0; i2 < tileArr[0].length; i2++) {
                if (tileArr[i][i2] != null) {
                    editorEdit.putInt(i + " " + i2, tileArr[i][i2].getValue());
                } else {
                    editorEdit.putInt(i + " " + i2, 0);
                }
                if (tileArr2[i][i2] != null) {
                    editorEdit.putInt(UNDO_GRID + i + " " + i2, tileArr2[i][i2].getValue());
                } else {
                    editorEdit.putInt(UNDO_GRID + i + " " + i2, 0);
                }
            }
        }
        editorEdit.putLong(SCORE, this.view.game.score);
        editorEdit.putLong(HIGH_SCORE, this.view.game.highScore);
        editorEdit.putLong(UNDO_SCORE, this.view.game.lastScore);
        editorEdit.putBoolean(CAN_UNDO, this.view.game.canUndo);
        editorEdit.putInt(GAME_STATE, this.view.game.gameState);
        editorEdit.putInt(UNDO_GAME_STATE, this.view.game.lastGameState);
        editorEdit.apply();
    }

    private void signInToGoogle() {
        final boolean z = PreferenceManager.getDefaultSharedPreferences(this).getBoolean(NO_LOGIN_PROMPT, false);
        final GoogleSignInClient client = GoogleSignIn.getClient((Activity) this, new GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_GAMES_SIGN_IN).requestScopes(Drive.SCOPE_APPFOLDER, new Scope[0]).build());
        client.silentSignIn().addOnCompleteListener(this, new OnCompleteListener<GoogleSignInAccount>() { // from class: com.tpcstld.twozerogame.MainActivity.1
            @Override // com.google.android.gms.tasks.OnCompleteListener
            public void onComplete(@NonNull Task<GoogleSignInAccount> task) {
                if (task.isSuccessful()) {
                    System.out.println("Successfully logged into Google.");
                    if (task.getResult() != null) {
                        Games.getGamesClient((Activity) MainActivity.this, task.getResult()).setViewForPopups(MainActivity.this.view);
                    }
                    SnapshotManager.loadSnapshot(MainActivity.this, new SnapshotManager.Callback() { // from class: com.tpcstld.twozerogame.MainActivity.1.1
                        @Override // com.tpcstld.twozerogame.snapshot.SnapshotManager.Callback
                        public void run(@NonNull SnapshotData snapshotData) {
                            MainActivity.this.view.game.handleSnapshot(snapshotData);
                        }
                    });
                    return;
                }
                if (MainActivity.this.firstLoginAttempt || z) {
                    return;
                }
                MainActivity.this.firstLoginAttempt = true;
                MainActivity.this.startActivityForResult(client.getSignInIntent(), 9001);
            }
        });
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        GoogleSignInResult signInResultFromIntent;
        super.onActivityResult(i, i2, intent);
        if (i == 9001 && (signInResultFromIntent = Auth.GoogleSignInApi.getSignInResultFromIntent(intent)) != null) {
            if (signInResultFromIntent.isSuccess()) {
                if (signInResultFromIntent.getSignInAccount() != null) {
                    Games.getGamesClient((Activity) this, signInResultFromIntent.getSignInAccount()).setViewForPopups(this.view);
                }
                SnapshotManager.loadSnapshot(this, new SnapshotManager.Callback() { // from class: com.tpcstld.twozerogame.MainActivity.2
                    @Override // com.tpcstld.twozerogame.snapshot.SnapshotManager.Callback
                    public void run(@NonNull SnapshotData snapshotData) {
                        MainActivity.this.view.game.handleSnapshot(snapshotData);
                    }
                });
            } else {
                SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this).edit();
                editorEdit.putBoolean(NO_LOGIN_PROMPT, true);
                editorEdit.apply();
                System.out.println(signInResultFromIntent.getStatus());
            }
        }
    }

    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.SupportActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.view = new MainView(this);
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(this);
        this.view.hasSaveState = defaultSharedPreferences.getBoolean("save_state", false);
        if (bundle != null && bundle.getBoolean("hasState")) {
            load();
        }
        setContentView(this.view);
    }

    @Override // android.support.v7.app.AppCompatActivity, android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 82) {
            return true;
        }
        if (i == 20) {
            this.view.game.move(2);
            return true;
        }
        if (i == 19) {
            this.view.game.move(0);
            return true;
        }
        if (i == 21) {
            this.view.game.move(3);
            return true;
        }
        if (i != 22) {
            return super.onKeyDown(i, keyEvent);
        }
        this.view.game.move(1);
        return true;
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
        save();
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        load();
        signInToGoogle();
    }

    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.SupportActivity, android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("hasState", true);
        save();
    }
}
