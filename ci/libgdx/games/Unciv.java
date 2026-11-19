// What Unciv's AndroidLauncher.onCreate sets before it makes the game (Unciv 5.0.1): Display.platform and
// Fonts.fontImplementation. Log, UncivFiles.saverLoader keep their defaults. Fonts are drawn with UIKit.
com.unciv.utils.Display.INSTANCE.setPlatform(lab.Lab.stub(com.unciv.utils.PlatformDisplay.class));
com.unciv.ui.components.fonts.Fonts.INSTANCE.setFontImplementation(new com.unciv.ui.components.fonts.FontImplementation() {
    int size = 50;
    org.robovm.apple.uikit.UIFont font() { return org.robovm.apple.uikit.UIFont.getSystemFont(size); }
    org.robovm.apple.uikit.NSAttributedStringAttributes attrs() {
        return new org.robovm.apple.uikit.NSAttributedStringAttributes().setFont(font()).setForegroundColor(org.robovm.apple.uikit.UIColor.white());
    }
    public void setFontFamily(com.unciv.ui.components.fonts.FontFamilyData data, int s) { size = s; }
    public int getFontSize() { return size; }
    public com.badlogic.gdx.graphics.Pixmap getCharPixmap(char c) { return getCharPixmap(String.valueOf(c)); }
    public com.badlogic.gdx.graphics.Pixmap getCharPixmap(String s) {
        com.unciv.ui.components.fonts.FontMetricsCommon m = getMetrics();
        org.robovm.apple.foundation.NSString ns = new org.robovm.apple.foundation.NSString(s);
        int w = (int) Math.ceil(ns.getSize(attrs()).getWidth());
        int h = (int) Math.ceil(m.getHeight());
        if (w <= 0) { h = size; w = h; }
        org.robovm.apple.coregraphics.CGBitmapContext ctx = org.robovm.apple.coregraphics.CGBitmapContext.create(w, h, 8, 4 * w,
            org.robovm.apple.coregraphics.CGColorSpace.createDeviceRGB(), org.robovm.apple.coregraphics.CGImageAlphaInfo.PremultipliedLast);
        ctx.translateCTM(0, h); ctx.scaleCTM(1, -1);
        org.robovm.apple.uikit.UIGraphics.pushContext(ctx);
        ns.draw(new org.robovm.apple.coregraphics.CGPoint(0, m.getLeading() + 1), attrs());
        org.robovm.apple.uikit.UIGraphics.popContext();
        byte[] px = org.robovm.rt.VM.newByteArray(ctx.getData(), w * h * 4);
        int[] argb = new int[w * h];
        for (int i = 0; i < argb.length; i++) { int a = px[i * 4 + 3] & 0xff; argb[i] = a == 0 ? 0 : (a << 24) | 0xffffff; }
        return com.unciv.ui.components.fonts.Fonts.INSTANCE.pixmapFromArgb(w, h, argb);
    }
    public kotlin.sequences.Sequence<com.unciv.ui.components.fonts.FontFamilyData> getSystemFonts() { return kotlin.sequences.SequencesKt.emptySequence(); }
    public kotlinx.coroutines.flow.Flow<com.unciv.ui.components.fonts.FontFamilyData> getModFonts(com.badlogic.gdx.files.FileHandle dir) { return kotlinx.coroutines.flow.FlowKt.emptyFlow(); }
    public com.badlogic.gdx.graphics.g2d.BitmapFont getBitmapFont() {
        com.unciv.ui.components.fonts.NativeBitmapFontData d = new com.unciv.ui.components.fonts.NativeBitmapFontData(this);
        com.badlogic.gdx.graphics.g2d.BitmapFont f = new com.badlogic.gdx.graphics.g2d.BitmapFont(d, d.getRegions(), false);
        f.setOwnsTexture(true);
        return f;
    }
    public com.unciv.ui.components.fonts.FontMetricsCommon getMetrics() {
        org.robovm.apple.uikit.UIFont f = font();
        float asc = (float) f.getAscender(), desc = (float) -f.getDescender(), lh = (float) f.getLineHeight();
        return new com.unciv.ui.components.fonts.FontMetricsCommon(asc, desc, Math.max(lh, asc + desc), Math.max(0f, lh - asc - desc));
    }
});
