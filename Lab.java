package lab;
import java.lang.reflect.*;
import java.util.*;
public class Lab {
    static final Set<String> logged = new HashSet<String>();
    public static void failed(String what, Throwable t) {
        synchronized (logged) { if (logged.add(what)) System.err.println("lab: " + what + " failed on iOS, returned an empty value: " + t); }
    }
    public static void missing(String what) {
        synchronized (logged) { if (logged.add(what)) System.err.println("lab: " + what + " has no iOS version, returned an empty value"); }
    }
    // An interface the game needs from its platform: answer every call with an empty value.
    @SuppressWarnings("unchecked")
    public static <T> T stub(final Class<T> c) {
        if (c == null || !c.isInterface()) return null;
        return (T) Proxy.newProxyInstance(c.getClassLoader(), new Class<?>[]{c}, new InvocationHandler() {
            public Object invoke(Object p, Method m, Object[] a) {
                Class<?> r = m.getReturnType(); String n = m.getName();
                if (n.equals("toString")) return "ios-stub " + c.getName();
                if (n.equals("hashCode")) return System.identityHashCode(p);
                if (n.equals("equals")) return a != null && a.length == 1 && p == a[0];
                missing(c.getSimpleName() + "." + n);
                if (r == boolean.class) return false;
                if (r == int.class) return 0; if (r == long.class) return 0L; if (r == float.class) return 0f;
                if (r == double.class) return 0d; if (r == short.class) return (short)0; if (r == byte.class) return (byte)0;
                if (r == char.class) return '\0'; if (r == String.class) return "";
                if (r.isArray()) return Array.newInstance(r.getComponentType(), 0);
                if (r.isInterface()) return stub(r);
                return null;
            }
        });
    }
}
