package lab;
import com.badlogic.gdx.*;
import com.badlogic.gdx.backends.iosrobovm.*;
import org.robovm.apple.foundation.NSAutoreleasePool;
import org.robovm.apple.uikit.UIApplication;
import java.lang.reflect.*;
import java.util.*;
public class IOSLauncher extends IOSApplication.Delegate {
    static <T> T stub(Class<T> c) { return Lab.stub(c); }
    static void failed(String w, Throwable t) { Lab.failed(w, t); }

    // The game itself, made once libGDX's iOS backend is running.
    static class Game implements ApplicationListener {
        ApplicationListener game;
        public void create() {
            try {
                
                game = new com.simple.tetriscompetitive.GameSuper();
            } catch (Throwable t) { System.err.println("lab: making the game failed"); t.printStackTrace(); throw new RuntimeException(t); }
            game.create();
        }
        public void resize(int w, int h) { game.resize(w, h); }
        public void render() { game.render(); }
        public void pause() { game.pause(); }
        public void resume() { game.resume(); }
        public void dispose() { game.dispose(); }
    }
    @Override
    protected IOSApplication createApplication() {
        IOSApplicationConfiguration config = new IOSApplicationConfiguration();
        config.orientationLandscape = false;
        config.orientationPortrait = true;
        // Android games size their screens in pixels: ask libGDX for pixels too (not iOS points)
        try {
            java.lang.reflect.Field f = config.getClass().getField("hdpiMode");
            f.set(config, Enum.valueOf((Class) f.getType(), "Pixels"));
        } catch (Throwable t) { failed("hdpiMode", t); }
        final boolean simulator = System.getenv("SIMULATOR_DEVICE_NAME") != null || System.getenv("SIMULATOR_UDID") != null;
        return new IOSApplication(new Game(), config) {
            @Override
            protected IOSAudio createAudio(IOSApplicationConfiguration c) {
                if (simulator) { System.err.println("lab: iPhone Simulator, sound off"); return stub(IOSAudio.class); }
                return super.createAudio(c);
            }
        };
    }
    public static void main(String[] argv) {
        NSAutoreleasePool pool = new NSAutoreleasePool();
        UIApplication.main(argv, null, IOSLauncher.class);
        pool.close();
    }
}
