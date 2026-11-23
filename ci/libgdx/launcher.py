"""Write and compile the libGDX iOS launcher for a game's own Java (run on the Mac, after split.py core).

  launcher.py <apk.jar> <core.jar> <javac classpath> <out dir> <landscape true|false> <portrait true|false> [hook.java]

- Picks the game's ApplicationListener and a constructor whose arguments can be made on iOS. If the Android
  launcher makes a subclass that needs Android (Unciv's AndroidGame), it steps up to the plain game class.
- Arguments: primitives get 0/false, strings "", and a platform object (SPD's PlatformSupport) gets the APK's own
  implementation (often the Android one) wrapped in a "safe" subclass: every method calls the original and,
  if it fails (it touched Android, which isn't there), logs once and returns an empty value. With no
  implementation it subclasses the abstract type itself; an interface gets a proxy that answers empty values.
- The game is made in create(), after libGDX's iOS backend is up, so the optional hook (Java statements, e.g.
  the static setup the Android launcher does: version, preferences) can use Gdx.app.
- In the iPhone Simulator, sound is silent (GitHub's Macs have no audio device and CoreAudio deadlocks there).
Prints what it chose. Writes <out>/lab/IOSLauncher.java and classes into <out>.
"""
import os, re, subprocess, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from split import load, analyse, ancestors, ANDROID

PRIM = {"Z": ("boolean", "false"), "B": ("byte", "(byte)0"), "C": ("char", "'\\0'"), "S": ("short", "(short)0"),
        "I": ("int", "0"), "J": ("long", "0L"), "F": ("float", "0f"), "D": ("double", "0d"), "V": ("void", None)}

def split_desc(d):
    return re.findall(r"\[*(?:[ZBCSIJFDV]|L[^;]+;)", d[1:d.index(")")]), re.findall(r"\[*(?:[ZBCSIJFDV]|L[^;]+;)", d[d.index(")") + 1:])[0]

def main(jar, core_jar, cp, out, land, port, hook=None):
    _, classes = load(jar); a = analyse(classes)
    _, kept = load(core_jar)
    android = set(a["android"])
    lines = []

    def usable_type(t):  # can javac see it, and can Java source name it?
        if t.startswith("[") : return usable_type(t.lstrip("["))
        if t in PRIM: return True
        n = t[1:-1]
        if n.startswith(ANDROID) or n in android: return False
        if re.search(r"\$\d", n): return False
        return n in kept or n in classes or n.startswith(("java/", "javax/"))

    def jname(t):
        dims = len(t) - len(t.lstrip("[")); t = t.lstrip("[")
        base = PRIM[t][0] if t in PRIM else t[1:-1].replace("/", ".").replace("$", ".")
        return base + "[]" * dims

    def default(t):
        if t in PRIM: return PRIM[t][1]
        if t.startswith("["): return "null"
        n = t[1:-1]
        if n == "java/lang/String": return '""'
        if n in classes and classes[n][6] & 0x200: return f"lab.Lab.stub({jname(t)}.class)"
        return "null"

    def ctor_args(c):
        cs = [d for (n, d, acc) in classes[c][3] if n == "<init>" and not acc & 0x1002 and all(usable_type(p) for p in split_desc(d)[0])]
        return sorted(cs, key=lambda d: len(split_desc(d)[0]))

    def chain(c):
        out = []
        while c in classes and not c.startswith("java/"):
            out.append(c); c = classes[c][1]
        return out

    # 1. The listener class and constructor
    cands = []
    for c in a["main"] + a["listeners"]:
        for x in chain(c):
            if x in a["listeners"] and x not in cands and not classes[x][6] & 0x400 and x in kept: cands.append(x)
    main = ctor = None
    for c in cands:
        cs = ctor_args(c)
        if cs: main, ctor = c, cs[0]; break
    if not main: print("no usable ApplicationListener constructor; candidates", cands); sys.exit(1)
    lines.append(f"listener: {main} constructor {ctor} (candidates {cands[:4]})")

    # 2. A value for each argument
    safe_src = {}
    def safe_class(impl, base_abstract):
        """Java source of a subclass of impl whose methods never fail."""
        pkg, simple = impl.rsplit("/", 1) if "/" in impl else ("", impl)
        name = "LabSafe" + re.sub(r"\W", "_", simple)
        seen, final, meths = set(), set(), []
        todo = list(chain(impl))
        for i in list(todo):  # interfaces of the chain, for abstract types
            for f in ancestors(classes, i):
                if f in classes and classes[f][6] & 0x200 and f not in todo: todo.append(f)
        for k in todo:
            kpkg = k.rsplit("/", 1)[0] if "/" in k else ""
            for (n, d, acc) in classes[k][3]:
                if n.startswith("<") or (n, d) in seen: continue
                seen.add((n, d))
                if acc & 0x0010: final.add((n, d)); continue
                if acc & (0x0002 | 0x0008 | 0x0040 | 0x1000) or (n, d) in final: continue
                if not acc & (0x0001 | 0x0004) and kpkg != pkg: continue
                ps, r = split_desc(d)
                if not all(usable_type(p) for p in ps + [r]): continue
                meths.append((n, d, acc))
        body = []
        for (n, d, acc) in meths:
            ps, r = split_desc(d)
            vis = "public" if acc & 0x0001 or classes.get(impl, [0]*7)[6] & 0x200 else ("protected" if acc & 0x0004 else "")
            params = ", ".join(f"{jname(p)} a{i}" for i, p in enumerate(ps)); args = ", ".join(f"a{i}" for i in range(len(ps)))
            ret = "" if r == "V" else "return "
            iface_method = any(n == m[0] and d == m[1] for k in todo if classes[k][6] & 0x200 for m in classes[k][3])
            is_abstract = acc & 0x400 or (iface_method and not any((n, d) == (m[0], m[1]) and not m[2] & 0x400 for k in chain(impl) for m in classes[k][3]))
            call = f"lab.Lab.missing(\"{simple}.{n}\");" if is_abstract else f"{ret}super.{n}({args});"
            fallback = "" if r == "V" else f" return {default(r)};"
            if is_abstract:
                body.append(f"  {vis} {jname(r)} {n}({params}) {{ {call}{fallback} }}")
            else:
                body.append(f"  {vis} {jname(r)} {n}({params}) {{ try {{ {call} }} catch (Throwable t) {{ lab.Lab.failed(\"{simple}.{n}\", t); }}{fallback} }}")
        cs = ctor_args(impl) if not classes[impl][6] & 0x200 else ["()V"]
        if not cs: return None, None
        cps = split_desc(cs[0])[0]
        ext = "implements" if classes[impl][6] & 0x200 else "extends"
        src = (f"package {pkg.replace('/', '.')};\n" if pkg else "") + \
              f"public class {name} {ext} {jname('L' + impl + ';')} {{\n  public {name}() {{ " + \
              (f"super({', '.join(default(p) for p in cps)});" if ext == "extends" else "") + " }\n" + "\n".join(body) + "\n}\n"
        return (pkg + "/" + name if pkg else name), src

    def try_compile(files):
        r = subprocess.run(["javac", "-nowarn", "-encoding", "UTF-8", "--release", "8", "-cp", f"{out}:{cp}", "-d", out] + files,
                           capture_output=True, text=True)
        msg = "\n".join(l for l in (r.stdout + r.stderr).splitlines() if not l.startswith("Picked up"))
        return r.returncode == 0, msg[-1500:]

    f = os.path.join(out, "lab", "Lab.java"); os.makedirs(os.path.dirname(f), exist_ok=True); open(f, "w").write(LAB)
    ok, err = try_compile([f])
    if not ok: print("Lab.java javac failed:", err); sys.exit(1)
    args, helpers = [], []
    for p in split_desc(ctor)[0]:
        if p in PRIM or p.startswith("[") or p == "Ljava/lang/String;": args.append(default(p)); continue
        t = p[1:-1]
        impls = [c for c in kept if c != t and t in ancestors(classes, c) and not classes[c][6] & 0x600 and c not in android
                 and not re.search(r"\$\d", c)]
        impls.sort(key=lambda c: (not any(c in classes[x][4] for x in android), len(c)))  # the one the Android launcher uses first
        tries = impls[:2] + ([t] if classes.get(t) and not classes[t][6] & 0x10 else [])
        val = None
        for impl in tries:
            cname, src = safe_class(impl, impl == t)
            if not src: continue
            f = os.path.join(out, "src", cname + ".java"); os.makedirs(os.path.dirname(f), exist_ok=True); open(f, "w").write(src)
            ok, err = try_compile([f])
            lines.append(f"argument {t}: safe subclass of {impl}: {'compiled' if ok else 'javac failed: ' + err.strip().splitlines()[0][:200]}")
            if ok:
                i = len(helpers); jc = cname.replace('/', '.')
                helpers.append(f"    static {jname(p)} arg{i}() {{ try {{ return new {jc}(); }} catch (Throwable t) {{ failed(\"making {jc}\", t); return {default(p)}; }} }}")
                val = f"arg{i}()"; break
        args.append(val or default(p))
    argstr = ", ".join(args)
    lines.append(f"launcher: new {main.replace('/', '.')}({argstr})")

    # 3. The launcher
    hook_src = open(hook).read() if hook and os.path.exists(hook) else ""
    def launcher(h):
        return LAUNCHER.replace("@LAND@", land).replace("@PORT@", port).replace("@HOOK@", h).replace("@HELPERS@", "\n".join(helpers)) \
                       .replace("@NEW@", f"new {main.replace('/', '.').replace('$', '.')}({argstr})")
    f = os.path.join(out, "lab", "IOSLauncher.java"); os.makedirs(os.path.dirname(f), exist_ok=True)
    open(f, "w").write(launcher(hook_src)); ok, err = try_compile([f])
    if not ok and hook_src:
        lines.append("hook did not compile, launcher without it: " + err.strip()[:600])
        open(f, "w").write(launcher("")); ok, err = try_compile([f])
    elif hook_src:
        lines.append(f"hook: {os.path.basename(hook)} compiled in")
    lines.append("launcher compiled" if ok else "launcher javac failed: " + err)
    print("\n".join(lines))
    sys.exit(0 if ok else 1)


LAB = r'''package lab;
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
'''

LAUNCHER = r'''package lab;
import com.badlogic.gdx.*;
import com.badlogic.gdx.backends.iosrobovm.*;
import org.robovm.apple.foundation.NSAutoreleasePool;
import org.robovm.apple.uikit.UIApplication;
import java.lang.reflect.*;
import java.util.*;
public class IOSLauncher extends IOSApplication.Delegate {
    static <T> T stub(Class<T> c) { return Lab.stub(c); }
    static void failed(String w, Throwable t) { Lab.failed(w, t); }
@HELPERS@
    // The game itself, made once libGDX's iOS backend is running.
    static class Game implements ApplicationListener {
        ApplicationListener game;
        public void create() {
            try { if (Gdx.files.internal("lab-jdkrefs.txt").exists()) Lab.diagAsync(Gdx.files.internal("lab-jdkrefs.txt").readString()); } catch (Throwable t) { failed("diag", t); }
            try {
                @HOOK@
                game = @NEW@;
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
        config.orientationLandscape = @LAND@;
        config.orientationPortrait = @PORT@;
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
'''

if __name__ == "__main__":
    main(*sys.argv[1:])
