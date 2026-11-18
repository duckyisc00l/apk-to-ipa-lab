package lab;
import com.badlogic.gdx.backends.iosrobovm.IOSApplication;
import com.badlogic.gdx.backends.iosrobovm.IOSApplicationConfiguration;
import org.robovm.apple.foundation.NSAutoreleasePool;
import org.robovm.apple.uikit.UIApplication;
import java.lang.reflect.*;
public class IOSLauncher extends IOSApplication.Delegate {
    // A platform interface the Android launcher passed in: answer every call with an empty value.
    @SuppressWarnings("unchecked")
    static <T> T stub(Class<T> c) {
        if (!c.isInterface()) return null;
        return (T) Proxy.newProxyInstance(c.getClassLoader(), new Class<?>[]{c}, new InvocationHandler() {
            public Object invoke(Object p, Method m, Object[] a) {
                Class<?> r = m.getReturnType();
                if (m.getName().equals("toString")) return "ios-stub";
                if (r == boolean.class) return false;
                if (r == int.class) return 0; if (r == long.class) return 0L; if (r == float.class) return 0f;
                if (r == double.class) return 0d; if (r == short.class) return (short)0; if (r == byte.class) return (byte)0;
                if (r == char.class) return '\0'; if (r == String.class) return "";
                return null;
            }
        });
    }
    @Override
    protected IOSApplication createApplication() {
        IOSApplicationConfiguration config = new IOSApplicationConfiguration();
        config.orientationLandscape = false;
        config.orientationPortrait = true;
        return new IOSApplication(new com.simple.tetriscompetitive.GameSuper(), config);
    }
    public static void main(String[] argv) {
        NSAutoreleasePool pool = new NSAutoreleasePool();
        UIApplication.main(argv, null, IOSLauncher.class);
        pool.close();
    }
}
