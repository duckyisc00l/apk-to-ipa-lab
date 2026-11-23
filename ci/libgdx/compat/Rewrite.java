// Make a game's Java run on MobiVM's older runtime class library (robovm-rt.jar, roughly Java 7).
//   java -cp asm.jar:<dir with Rewrite.class and lab/Compat.class> Rewrite <rt.jar> <core.jar> <report.md> <jdk-refs.txt> [<out.jar>]
// Scans every method call in core.jar whose target is a java.* / javax.* class, and checks it exists in the rt
// (looking through superclasses and interfaces). A call that is missing is listed. If lab.Compat has a static helper
// for it (named <owner with _>__<method>, instance methods take the receiver as first argument) and an out jar is
// given, the call is rewritten to the helper. Without an out jar it only reports (scan mode).
import org.objectweb.asm.*;
import java.io.*;
import java.util.*;
import java.util.zip.*;

public class Rewrite {
    static class Info { String sup; String[] ifs; Set<String> methods = new HashSet<>(); boolean iface; }
    static Map<String, Info> rt = new HashMap<>();
    static Map<String, String> helpers = new HashMap<>();   // "owner.name.desc" of the missing call -> helper desc
    static Map<String, Integer> missing = new TreeMap<>();   // missing call -> count
    static Map<String, Integer> missingClass = new TreeMap<>();
    static Set<String> refs = new TreeSet<>();

    static Info read(byte[] b) {
        ClassReader cr = new ClassReader(b); Info i = new Info();
        i.sup = cr.getSuperName(); i.ifs = cr.getInterfaces(); i.iface = (cr.getAccess() & Opcodes.ACC_INTERFACE) != 0;
        cr.accept(new ClassVisitor(Opcodes.ASM9) {
            public MethodVisitor visitMethod(int a, String n, String d, String s, String[] e) { i.methods.add(n + d); return null; }
        }, ClassReader.SKIP_CODE | ClassReader.SKIP_DEBUG | ClassReader.SKIP_FRAMES);
        return i;
    }
    static String key(String o) { return o; }
    // 1 present, 0 missing, -1 unknown (hierarchy leaves the rt)
    static int has(String owner, String name, String desc, Set<String> seen) {
        if (!seen.add(owner)) return 0;
        Info i = rt.get(owner);
        if (i == null) return -1;
        if (i.methods.contains(name + desc)) return 1;
        boolean unknown = false;
        List<String> up = new ArrayList<>(Arrays.asList(i.ifs)); if (i.sup != null) up.add(i.sup);
        for (String u : up) { int r = has(u, name, desc, seen); if (r == 1) return 1; if (r == -1) unknown = true; }
        return unknown ? -1 : 0;
    }
    static boolean isJdk(String o) { return o.startsWith("java/") || o.startsWith("javax/"); }

    public static void main(String[] a) throws Exception {
        try (ZipFile z = new ZipFile(a[0])) {
            for (Enumeration<? extends ZipEntry> e = z.entries(); e.hasMoreElements();) {
                ZipEntry en = e.nextElement();
                if (en.getName().endsWith(".class")) rt.put(en.getName().replace(".class", ""), read(z.getInputStream(en).readAllBytes()));
            }
        }
        // helpers in lab.Compat
        try (InputStream in = Rewrite.class.getResourceAsStream("/lab/Compat.class")) {
            new ClassReader(in).accept(new ClassVisitor(Opcodes.ASM9) {
                public MethodVisitor visitMethod(int acc, String n, String d, String s, String[] e) {
                    if ((acc & Opcodes.ACC_STATIC) != 0 && n.contains("__")) helpers.put(n, d);
                    return null;
                }
            }, ClassReader.SKIP_CODE);
        }
        write = a.length > 4;
        int rewritten = 0;
        Map<String, Integer> done = new TreeMap<>();
        ZipOutputStream out = write ? new ZipOutputStream(new FileOutputStream(a[4])) : null;
        try (ZipFile z = new ZipFile(a[1])) {
            for (Enumeration<? extends ZipEntry> e = z.entries(); e.hasMoreElements();) {
                ZipEntry en = e.nextElement(); byte[] b = z.getInputStream(en).readAllBytes();
                if (en.getName().endsWith(".class") && !en.getName().equals("lab/Compat.class")) b = process(b, done);
                if (write) { out.putNextEntry(new ZipEntry(en.getName())); out.write(b); out.closeEntry(); }
            }
        }
        if (write) {
            try (InputStream in = Rewrite.class.getResourceAsStream("/lab/Compat.class")) {
                out.putNextEntry(new ZipEntry("lab/Compat.class")); out.write(in.readAllBytes()); out.closeEntry();
            }
            out.close();
        }
        try (PrintWriter w = new PrintWriter(new FileWriter(a[2]))) {
            w.println("## Java calls MobiVM's runtime lacks (" + (write ? "rewritten where lab.Compat has a helper" : "scan only") + ")");
            w.println("rewritten to helpers: " + done.values().stream().mapToInt(x -> x).sum() + " calls, " + done.size() + " methods");
            for (Map.Entry<String, Integer> m : done.entrySet()) w.println("- fixed  " + m.getKey() + "  x" + m.getValue());
            for (Map.Entry<String, Integer> m : missing.entrySet()) w.println("- NO HELPER  " + m.getKey() + "  x" + m.getValue());
            for (Map.Entry<String, Integer> m : missingClass.entrySet()) w.println("- class not in rt  " + m.getKey() + "  x" + m.getValue());
        }
        try (PrintWriter w = new PrintWriter(new FileWriter(a[3]))) { for (String r : refs) w.println(r); }
        System.out.println("compat: " + done.size() + " missing methods rewritten, " + missing.size() + " without helper, " + missingClass.size() + " classes absent from the rt");
    }

    static String helperName(String owner, String name) { return owner.replace('/', '_') + "__" + name; }

    static byte[] process(byte[] b, Map<String, Integer> done) {
        ClassReader cr = new ClassReader(b);
        ClassWriter cw = new ClassWriter(0);
        cr.accept(new ClassVisitor(Opcodes.ASM9, cw) {
            public MethodVisitor visitMethod(int acc, String n, String d, String s, String[] e) {
                MethodVisitor mv = super.visitMethod(acc, n, d, s, e);
                return new MethodVisitor(Opcodes.ASM9, mv) {
                    public void visitMethodInsn(int op, String owner, String name, String desc, boolean itf) {
                        if (isJdk(owner)) {
                            refs.add(owner + " " + name + " " + desc);
                            String hn = helperName(owner, name);
                            String hd = op == Opcodes.INVOKESTATIC ? desc : "(L" + owner + ";" + desc.substring(1);
                            String what = owner + "." + name + desc;
                            boolean absent = rt.containsKey(owner) && has(owner, name, desc, new HashSet<>()) == 0;
                            // a helper is used whenever there is one: MobiVM can lack a method its rt jar lists (Locale.forLanguageTag)
                            if (hd.equals(helpers.get(hn))) {
                                done.merge(what + (absent ? "" : " (in the rt jar, but missing at run time)"), 1, Integer::sum);
                                if (write) { super.visitMethodInsn(Opcodes.INVOKESTATIC, "lab/Compat", hn, hd, false); return; }
                            } else if (!rt.containsKey(owner)) {
                                if (!owner.startsWith("java/lang/invoke/")) missingClass.merge(owner, 1, Integer::sum);
                            } else if (absent) missing.merge(what, 1, Integer::sum);
                        }
                        super.visitMethodInsn(op, owner, name, desc, itf);
                    }
                };
            }
        }, 0);
        return cw.toByteArray();
    }
    static boolean write = false;

}
