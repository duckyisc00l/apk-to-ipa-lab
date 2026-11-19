// What SPD's AndroidLauncher does before it makes the game (from the decompiled launcher).
com.watabou.noosa.Game.version = "@VERSION_NAME@";
com.watabou.noosa.Game.versionCode = @VERSION_CODE@;
com.watabou.utils.FileUtils.setDefaultFileProperties(com.badlogic.gdx.Files.FileType.Local, "");
com.shatteredpixel.shatteredpixeldungeon.SPDSettings.set(Gdx.app.getPreferences("ShatteredPixelDungeon"));
