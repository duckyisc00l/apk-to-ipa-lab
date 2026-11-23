package lab;

import java.util.Locale;

/** Stand-ins for Java 7/8 methods that MobiVM's runtime class library lacks. ci/libgdx/compat/Rewrite.java points the game's calls here.
 *  Name rule: <java.util.Locale -> java_util_Locale>__<method>; an instance method takes its receiver as the first argument.
 *  Only use methods MobiVM's runtime has in here (Rewrite scans this class too and says so if not). */
public final class Compat {
    private Compat() {}

    // ---- java.util.Locale (Java 7) ----
    public static Locale java_util_Locale__forLanguageTag(String tag) {
        if (tag == null) throw new NullPointerException();
        String[] p = tag.replace('_', '-').split("-");
        String lang = "", script = "", country = "", variant = "";
        int i = 0;
        if (i < p.length && p[i].length() >= 2 && p[i].length() <= 8 && p[i].matches("[A-Za-z]+") && !p[i].equalsIgnoreCase("und")) lang = p[i++].toLowerCase(Locale.ROOT);
        else if (i < p.length && p[i].equalsIgnoreCase("und")) i++;
        if (i < p.length && p[i].length() == 4 && p[i].matches("[A-Za-z]+")) script = p[i++];
        if (i < p.length && (p[i].length() == 2 && p[i].matches("[A-Za-z]+") || p[i].length() == 3 && p[i].matches("[0-9]+"))) country = p[i++].toUpperCase(Locale.ROOT);
        if (i < p.length && p[i].length() >= 4 && !p[i].equalsIgnoreCase("x") && p[i].length() > 1 && Character.isLetterOrDigit(p[i].charAt(0))) {
            StringBuilder v = new StringBuilder();
            while (i < p.length && p[i].length() > 1) { if (v.length() > 0) v.append('_'); v.append(p[i++]); }
            variant = v.toString();
        }
        return new Locale(lang, country, variant);
    }

    public static String java_util_Locale__toLanguageTag(Locale l) {
        String lang = l.getLanguage().isEmpty() ? "und" : l.getLanguage();
        StringBuilder b = new StringBuilder(lang);
        if (!l.getCountry().isEmpty()) b.append('-').append(l.getCountry());
        if (!l.getVariant().isEmpty()) b.append('-').append(l.getVariant().replace('_', '-'));
        return b.toString();
    }

}
