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
    // Run-time check of the JDK methods the game calls (list written by compat/Rewrite into the app's lab-jdkrefs.txt):
    // prints "lab-diag: MISSING ..." for each one this runtime cannot find. Runs on its own thread, once.
    static String desc(Class<?> c) {
        if (c.isPrimitive()) {
            if (c == int.class) return "I"; if (c == long.class) return "J"; if (c == boolean.class) return "Z"; if (c == byte.class) return "B";
            if (c == char.class) return "C"; if (c == short.class) return "S"; if (c == float.class) return "F"; if (c == double.class) return "D"; return "V";
        }
        if (c.isArray()) return c.getName().replace('.', '/');
        return "L" + c.getName().replace('.', '/') + ";";
    }
    static void collect(Class<?> c, Set<String> out, Set<Class<?>> seen) {
        if (c == null || !seen.add(c)) return;
        try {
            for (Method m : c.getDeclaredMethods()) { StringBuilder b = new StringBuilder(m.getName()).append('('); for (Class<?> p : m.getParameterTypes()) b.append(desc(p)); out.add(b.append(')').append(desc(m.getReturnType())).toString()); }
            for (Constructor<?> k : c.getDeclaredConstructors()) { StringBuilder b = new StringBuilder("<init>("); for (Class<?> p : k.getParameterTypes()) b.append(desc(p)); out.add(b.append(")V").toString()); }
        } catch (Throwable t) { out.add("?error"); }
        collect(c.getSuperclass(), out, seen);
        for (Class<?> i : c.getInterfaces()) collect(i, out, seen);
    }
    public static void diagAsync(final String refs) {
        Thread t = new Thread(new Runnable() { public void run() {
            int n = 0, miss = 0;
            Map<String, Set<String>> cache = new HashMap<String, Set<String>>();
            for (String line : refs.split("\n")) {
                String[] p = line.trim().split(" "); if (p.length != 3) continue; n++;
                Set<String> have = cache.get(p[0]);
                if (have == null) {
                    have = new HashSet<String>();
                    try { collect(Class.forName(p[0].replace('/', '.'), false, Lab.class.getClassLoader()), have, new HashSet<Class<?>>()); }
                    catch (Throwable e) { have.add("?noclass"); }
                    cache.put(p[0], have);
                }
                if (have.contains("?noclass")) { miss++; System.err.println("lab-diag: MISSING CLASS " + p[0]); cache.put(p[0], new HashSet<String>(Collections.singleton("?noclass"))); continue; }
                if (have.contains("?error") || have.contains(p[1] + p[2])) continue;
                // static/instance methods of Object, arrays and interfaces' Object methods are always there
                if (p[0].startsWith("[") || p[1].equals("getClass") || p[1].equals("clone")) continue;
                miss++; System.err.println("lab-diag: MISSING " + p[0] + "." + p[1] + p[2]);
            }
            System.err.println("lab-diag: checked " + n + " JDK methods the game calls, " + miss + " missing at run time");
        } }, "lab-diag");
        t.setDaemon(true); t.start();
    }
}
