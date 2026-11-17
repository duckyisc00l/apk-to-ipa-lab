// lib: , url: package:ricochlime/pages/restart_game.dart

// class id: 1049327, size: 0x8
class :: {
}

// class id: 2767, size: 0x10, field offset: 0xc
//   const constructor, 
class RestartGameDialog extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x402b9c, size: 0x7f0
    // 0x402b9c: EnterFrame
    //     0x402b9c: stp             fp, lr, [SP, #-0x10]!
    //     0x402ba0: mov             fp, SP
    // 0x402ba4: AllocStack(0x58)
    //     0x402ba4: sub             SP, SP, #0x58
    // 0x402ba8: SetupParameters(RestartGameDialog this /* r1 => r0, fp-0x8 */, dynamic _ /* r2 => r1, fp-0x10 */)
    //     0x402ba8: mov             x0, x1
    //     0x402bac: stur            x1, [fp, #-8]
    //     0x402bb0: mov             x1, x2
    //     0x402bb4: stur            x2, [fp, #-0x10]
    // 0x402bb8: CheckStackOverflow
    //     0x402bb8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x402bbc: cmp             SP, x16
    //     0x402bc0: b.ls            #0x403384
    // 0x402bc4: r1 = 2
    //     0x402bc4: mov             x1, #2
    // 0x402bc8: r0 = AllocateContext()
    //     0x402bc8: bl              #0x5834e8  ; AllocateContextStub
    // 0x402bcc: mov             x2, x0
    // 0x402bd0: ldur            x0, [fp, #-8]
    // 0x402bd4: stur            x2, [fp, #-0x18]
    // 0x402bd8: StoreField: r2->field_f = r0
    //     0x402bd8: stur            w0, [x2, #0xf]
    // 0x402bdc: ldur            x1, [fp, #-0x10]
    // 0x402be0: StoreField: r2->field_13 = r1
    //     0x402be0: stur            w1, [x2, #0x13]
    // 0x402be4: r0 = of()
    //     0x402be4: bl              #0x31bb3c  ; [package:flutter/src/material/theme.dart] Theme::of
    // 0x402be8: LoadField: r1 = r0->field_3f
    //     0x402be8: ldur            w1, [x0, #0x3f]
    // 0x402bec: DecompressPointer r1
    //     0x402bec: add             x1, x1, HEAP, lsl #32
    // 0x402bf0: stur            x1, [fp, #-8]
    // 0x402bf4: r0 = LoadStaticField(0x468)
    //     0x402bf4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402bf8: ldr             x0, [x0, #0x8d0]
    // 0x402bfc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402c00: cmp             w0, w16
    // 0x402c04: b.ne            #0x402c10
    // 0x402c08: r2 = instance
    //     0x402c08: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x402c0c: r0 = InitLateFinalStaticField()
    //     0x402c0c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x402c10: stur            x0, [fp, #-0x10]
    // 0x402c14: r16 = <AppLocale, Translations>
    //     0x402c14: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x402c18: stp             x0, x16, [SP]
    // 0x402c1c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x402c1c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x402c20: r0 = LocaleSettingsExt.currentTranslations()
    //     0x402c20: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x402c24: r1 = LoadClassIdInstr(r0)
    //     0x402c24: ldur            x1, [x0, #-1]
    //     0x402c28: ubfx            x1, x1, #0xc, #0x14
    // 0x402c2c: cmp             x1, #0x8dd
    // 0x402c30: b.ne            #0x402c5c
    // 0x402c34: mov             x1, x0
    // 0x402c38: LoadField: r0 = r1->field_1f
    //     0x402c38: ldur            w0, [x1, #0x1f]
    // 0x402c3c: DecompressPointer r0
    //     0x402c3c: add             x0, x0, HEAP, lsl #32
    // 0x402c40: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402c44: cmp             w0, w16
    // 0x402c48: b.ne            #0x402c58
    // 0x402c4c: r2 = restartGameDialog
    //     0x402c4c: add             x2, PP, #0x14, lsl #12  ; [pp+0x14398] Field <Translations.restartGameDialog>: late final (offset: 0x20)
    //     0x402c50: ldr             x2, [x2, #0x398]
    // 0x402c54: r0 = InitLateFinalInstanceField()
    //     0x402c54: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402c58: b               #0x402ce0
    // 0x402c5c: cmp             x1, #0x8df
    // 0x402c60: b.ne            #0x402c8c
    // 0x402c64: mov             x1, x0
    // 0x402c68: LoadField: r0 = r1->field_43
    //     0x402c68: ldur            w0, [x1, #0x43]
    // 0x402c6c: DecompressPointer r0
    //     0x402c6c: add             x0, x0, HEAP, lsl #32
    // 0x402c70: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402c74: cmp             w0, w16
    // 0x402c78: b.ne            #0x402c88
    // 0x402c7c: r2 = restartGameDialog
    //     0x402c7c: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a0] Field <TranslationsRu.restartGameDialog>: late final (offset: 0x44)
    //     0x402c80: ldr             x2, [x2, #0x3a0]
    // 0x402c84: r0 = InitLateFinalInstanceField()
    //     0x402c84: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402c88: b               #0x402ce0
    // 0x402c8c: cmp             x1, #0x8e0
    // 0x402c90: b.ne            #0x402cbc
    // 0x402c94: mov             x1, x0
    // 0x402c98: LoadField: r0 = r1->field_43
    //     0x402c98: ldur            w0, [x1, #0x43]
    // 0x402c9c: DecompressPointer r0
    //     0x402c9c: add             x0, x0, HEAP, lsl #32
    // 0x402ca0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402ca4: cmp             w0, w16
    // 0x402ca8: b.ne            #0x402cb8
    // 0x402cac: r2 = restartGameDialog
    //     0x402cac: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a8] Field <TranslationsKk.restartGameDialog>: late final (offset: 0x44)
    //     0x402cb0: ldr             x2, [x2, #0x3a8]
    // 0x402cb4: r0 = InitLateFinalInstanceField()
    //     0x402cb4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402cb8: b               #0x402ce0
    // 0x402cbc: mov             x1, x0
    // 0x402cc0: LoadField: r0 = r1->field_43
    //     0x402cc0: ldur            w0, [x1, #0x43]
    // 0x402cc4: DecompressPointer r0
    //     0x402cc4: add             x0, x0, HEAP, lsl #32
    // 0x402cc8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402ccc: cmp             w0, w16
    // 0x402cd0: b.ne            #0x402ce0
    // 0x402cd4: r2 = restartGameDialog
    //     0x402cd4: add             x2, PP, #0x14, lsl #12  ; [pp+0x143b0] Field <TranslationsEs.restartGameDialog>: late final (offset: 0x44)
    //     0x402cd8: ldr             x2, [x2, #0x3b0]
    // 0x402cdc: r0 = InitLateFinalInstanceField()
    //     0x402cdc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402ce0: r1 = LoadClassIdInstr(r0)
    //     0x402ce0: ldur            x1, [x0, #-1]
    //     0x402ce4: ubfx            x1, x1, #0xc, #0x14
    // 0x402ce8: cmp             x1, #0xec
    // 0x402cec: b.ne            #0x402cfc
    // 0x402cf0: r0 = "Restart game\?"
    //     0x402cf0: add             x0, PP, #0x14, lsl #12  ; [pp+0x143b8] "Restart game\?"
    //     0x402cf4: ldr             x0, [x0, #0x3b8]
    // 0x402cf8: b               #0x402d2c
    // 0x402cfc: cmp             x1, #0xed
    // 0x402d00: b.ne            #0x402d10
    // 0x402d04: r0 = "Перезапустить игру\?"
    //     0x402d04: add             x0, PP, #0x14, lsl #12  ; [pp+0x143c0] "Перезапустить игру\?"
    //     0x402d08: ldr             x0, [x0, #0x3c0]
    // 0x402d0c: b               #0x402d2c
    // 0x402d10: cmp             x1, #0xee
    // 0x402d14: b.ne            #0x402d24
    // 0x402d18: r0 = "Ойынды қайта бастау керек пе\?"
    //     0x402d18: add             x0, PP, #0x14, lsl #12  ; [pp+0x143c8] "Ойынды қайта бастау керек пе\?"
    //     0x402d1c: ldr             x0, [x0, #0x3c8]
    // 0x402d20: b               #0x402d2c
    // 0x402d24: r0 = "¿Reinicia el juego\?"
    //     0x402d24: add             x0, PP, #0x14, lsl #12  ; [pp+0x143d0] "¿Reinicia el juego\?"
    //     0x402d28: ldr             x0, [x0, #0x3d0]
    // 0x402d2c: stur            x0, [fp, #-0x20]
    // 0x402d30: r0 = Text()
    //     0x402d30: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x402d34: mov             x1, x0
    // 0x402d38: ldur            x0, [fp, #-0x20]
    // 0x402d3c: stur            x1, [fp, #-0x28]
    // 0x402d40: StoreField: r1->field_b = r0
    //     0x402d40: stur            w0, [x1, #0xb]
    // 0x402d44: r0 = Instance_TextStyle
    //     0x402d44: add             x0, PP, #0x10, lsl #12  ; [pp+0x10f68] Obj!TextStyle@5d57c1
    //     0x402d48: ldr             x0, [x0, #0xf68]
    // 0x402d4c: StoreField: r1->field_13 = r0
    //     0x402d4c: stur            w0, [x1, #0x13]
    // 0x402d50: r16 = <AppLocale, Translations>
    //     0x402d50: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x402d54: ldur            lr, [fp, #-0x10]
    // 0x402d58: stp             lr, x16, [SP]
    // 0x402d5c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x402d5c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x402d60: r0 = LocaleSettingsExt.currentTranslations()
    //     0x402d60: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x402d64: r1 = LoadClassIdInstr(r0)
    //     0x402d64: ldur            x1, [x0, #-1]
    //     0x402d68: ubfx            x1, x1, #0xc, #0x14
    // 0x402d6c: cmp             x1, #0x8dd
    // 0x402d70: b.ne            #0x402d9c
    // 0x402d74: mov             x1, x0
    // 0x402d78: LoadField: r0 = r1->field_1f
    //     0x402d78: ldur            w0, [x1, #0x1f]
    // 0x402d7c: DecompressPointer r0
    //     0x402d7c: add             x0, x0, HEAP, lsl #32
    // 0x402d80: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402d84: cmp             w0, w16
    // 0x402d88: b.ne            #0x402d98
    // 0x402d8c: r2 = restartGameDialog
    //     0x402d8c: add             x2, PP, #0x14, lsl #12  ; [pp+0x14398] Field <Translations.restartGameDialog>: late final (offset: 0x20)
    //     0x402d90: ldr             x2, [x2, #0x398]
    // 0x402d94: r0 = InitLateFinalInstanceField()
    //     0x402d94: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402d98: b               #0x402e20
    // 0x402d9c: cmp             x1, #0x8df
    // 0x402da0: b.ne            #0x402dcc
    // 0x402da4: mov             x1, x0
    // 0x402da8: LoadField: r0 = r1->field_43
    //     0x402da8: ldur            w0, [x1, #0x43]
    // 0x402dac: DecompressPointer r0
    //     0x402dac: add             x0, x0, HEAP, lsl #32
    // 0x402db0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402db4: cmp             w0, w16
    // 0x402db8: b.ne            #0x402dc8
    // 0x402dbc: r2 = restartGameDialog
    //     0x402dbc: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a0] Field <TranslationsRu.restartGameDialog>: late final (offset: 0x44)
    //     0x402dc0: ldr             x2, [x2, #0x3a0]
    // 0x402dc4: r0 = InitLateFinalInstanceField()
    //     0x402dc4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402dc8: b               #0x402e20
    // 0x402dcc: cmp             x1, #0x8e0
    // 0x402dd0: b.ne            #0x402dfc
    // 0x402dd4: mov             x1, x0
    // 0x402dd8: LoadField: r0 = r1->field_43
    //     0x402dd8: ldur            w0, [x1, #0x43]
    // 0x402ddc: DecompressPointer r0
    //     0x402ddc: add             x0, x0, HEAP, lsl #32
    // 0x402de0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402de4: cmp             w0, w16
    // 0x402de8: b.ne            #0x402df8
    // 0x402dec: r2 = restartGameDialog
    //     0x402dec: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a8] Field <TranslationsKk.restartGameDialog>: late final (offset: 0x44)
    //     0x402df0: ldr             x2, [x2, #0x3a8]
    // 0x402df4: r0 = InitLateFinalInstanceField()
    //     0x402df4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402df8: b               #0x402e20
    // 0x402dfc: mov             x1, x0
    // 0x402e00: LoadField: r0 = r1->field_43
    //     0x402e00: ldur            w0, [x1, #0x43]
    // 0x402e04: DecompressPointer r0
    //     0x402e04: add             x0, x0, HEAP, lsl #32
    // 0x402e08: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402e0c: cmp             w0, w16
    // 0x402e10: b.ne            #0x402e20
    // 0x402e14: r2 = restartGameDialog
    //     0x402e14: add             x2, PP, #0x14, lsl #12  ; [pp+0x143b0] Field <TranslationsEs.restartGameDialog>: late final (offset: 0x44)
    //     0x402e18: ldr             x2, [x2, #0x3b0]
    // 0x402e1c: r0 = InitLateFinalInstanceField()
    //     0x402e1c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402e20: r1 = LoadClassIdInstr(r0)
    //     0x402e20: ldur            x1, [x0, #-1]
    //     0x402e24: ubfx            x1, x1, #0xc, #0x14
    // 0x402e28: cmp             x1, #0xec
    // 0x402e2c: b.ne            #0x402e3c
    // 0x402e30: r1 = "Are you sure you want to restart\? You can\'t undo this"
    //     0x402e30: add             x1, PP, #0x15, lsl #12  ; [pp+0x15c70] "Are you sure you want to restart\? You can\'t undo this"
    //     0x402e34: ldr             x1, [x1, #0xc70]
    // 0x402e38: b               #0x402e6c
    // 0x402e3c: cmp             x1, #0xed
    // 0x402e40: b.ne            #0x402e50
    // 0x402e44: r1 = "Вы уверену что хотите начать снова\? Вы не сможете вернуться"
    //     0x402e44: add             x1, PP, #0x15, lsl #12  ; [pp+0x15c78] "Вы уверену что хотите начать снова\? Вы не сможете вернуться"
    //     0x402e48: ldr             x1, [x1, #0xc78]
    // 0x402e4c: b               #0x402e6c
    // 0x402e50: cmp             x1, #0xee
    // 0x402e54: b.ne            #0x402e64
    // 0x402e58: r1 = "Қайта іске қосқыңыз келетініне сенімдісіз бе\? Мұны қайтара алмайсыз"
    //     0x402e58: add             x1, PP, #0x15, lsl #12  ; [pp+0x15c80] "Қайта іске қосқыңыз келетініне сенімдісіз бе\? Мұны қайтара алмайсыз"
    //     0x402e5c: ldr             x1, [x1, #0xc80]
    // 0x402e60: b               #0x402e6c
    // 0x402e64: r1 = "¿Estás seguro de que quieres reiniciar\? No puedes deshacer esto"
    //     0x402e64: add             x1, PP, #0x15, lsl #12  ; [pp+0x15c88] "¿Estás seguro de que quieres reiniciar\? No puedes deshacer esto"
    //     0x402e68: ldr             x1, [x1, #0xc88]
    // 0x402e6c: ldur            x0, [fp, #-8]
    // 0x402e70: stur            x1, [fp, #-0x30]
    // 0x402e74: LoadField: r2 = r0->field_7f
    //     0x402e74: ldur            w2, [x0, #0x7f]
    // 0x402e78: DecompressPointer r2
    //     0x402e78: add             x2, x2, HEAP, lsl #32
    // 0x402e7c: stur            x2, [fp, #-0x20]
    // 0x402e80: r0 = TextStyle()
    //     0x402e80: bl              #0x31e4c4  ; AllocateTextStyleStub -> TextStyle (size=0x70)
    // 0x402e84: mov             x1, x0
    // 0x402e88: r0 = true
    //     0x402e88: add             x0, NULL, #0x20  ; true
    // 0x402e8c: stur            x1, [fp, #-8]
    // 0x402e90: StoreField: r1->field_7 = r0
    //     0x402e90: stur            w0, [x1, #7]
    // 0x402e94: ldur            x0, [fp, #-0x20]
    // 0x402e98: StoreField: r1->field_b = r0
    //     0x402e98: stur            w0, [x1, #0xb]
    // 0x402e9c: r0 = 28.000000
    //     0x402e9c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11260] 28
    //     0x402ea0: ldr             x0, [x0, #0x260]
    // 0x402ea4: StoreField: r1->field_1f = r0
    //     0x402ea4: stur            w0, [x1, #0x1f]
    // 0x402ea8: r0 = Text()
    //     0x402ea8: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x402eac: mov             x1, x0
    // 0x402eb0: ldur            x0, [fp, #-0x30]
    // 0x402eb4: stur            x1, [fp, #-0x20]
    // 0x402eb8: StoreField: r1->field_b = r0
    //     0x402eb8: stur            w0, [x1, #0xb]
    // 0x402ebc: ldur            x0, [fp, #-8]
    // 0x402ec0: StoreField: r1->field_13 = r0
    //     0x402ec0: stur            w0, [x1, #0x13]
    // 0x402ec4: r0 = SizedBox()
    //     0x402ec4: bl              #0x363c60  ; AllocateSizedBoxStub -> SizedBox (size=0x18)
    // 0x402ec8: mov             x1, x0
    // 0x402ecc: r0 = 400.000000
    //     0x402ecc: add             x0, PP, #0xb, lsl #12  ; [pp+0xb9e0] 400
    //     0x402ed0: ldr             x0, [x0, #0x9e0]
    // 0x402ed4: stur            x1, [fp, #-8]
    // 0x402ed8: StoreField: r1->field_f = r0
    //     0x402ed8: stur            w0, [x1, #0xf]
    // 0x402edc: ldur            x0, [fp, #-0x20]
    // 0x402ee0: StoreField: r1->field_b = r0
    //     0x402ee0: stur            w0, [x1, #0xb]
    // 0x402ee4: r0 = LoadStaticField(0xc74)
    //     0x402ee4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402ee8: ldr             x0, [x0, #0x18e8]
    // 0x402eec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402ef0: cmp             w0, w16
    // 0x402ef4: b.ne            #0x402f04
    // 0x402ef8: r2 = NesIcons
    //     0x402ef8: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x402efc: ldr             x2, [x2, #0xf70]
    // 0x402f00: r0 = InitLateFinalStaticField()
    //     0x402f00: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x402f04: mov             x1, x0
    // 0x402f08: stur            x0, [fp, #-0x20]
    // 0x402f0c: LoadField: r0 = r1->field_1b
    //     0x402f0c: ldur            w0, [x1, #0x1b]
    // 0x402f10: DecompressPointer r0
    //     0x402f10: add             x0, x0, HEAP, lsl #32
    // 0x402f14: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402f18: cmp             w0, w16
    // 0x402f1c: b.ne            #0x402f2c
    // 0x402f20: r2 = redo
    //     0x402f20: add             x2, PP, #0x11, lsl #12  ; [pp+0x11338] Field <NesIconCollection.redo>: late final (offset: 0x1c)
    //     0x402f24: ldr             x2, [x2, #0x338]
    // 0x402f28: r0 = InitLateFinalInstanceField()
    //     0x402f28: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402f2c: stur            x0, [fp, #-0x30]
    // 0x402f30: r0 = NesIcon()
    //     0x402f30: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x402f34: mov             x1, x0
    // 0x402f38: ldur            x0, [fp, #-0x30]
    // 0x402f3c: stur            x1, [fp, #-0x38]
    // 0x402f40: StoreField: r1->field_b = r0
    //     0x402f40: stur            w0, [x1, #0xb]
    // 0x402f44: r16 = <AppLocale, Translations>
    //     0x402f44: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x402f48: ldur            lr, [fp, #-0x10]
    // 0x402f4c: stp             lr, x16, [SP]
    // 0x402f50: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x402f50: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x402f54: r0 = LocaleSettingsExt.currentTranslations()
    //     0x402f54: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x402f58: r1 = LoadClassIdInstr(r0)
    //     0x402f58: ldur            x1, [x0, #-1]
    //     0x402f5c: ubfx            x1, x1, #0xc, #0x14
    // 0x402f60: cmp             x1, #0x8dd
    // 0x402f64: b.ne            #0x402f90
    // 0x402f68: mov             x1, x0
    // 0x402f6c: LoadField: r0 = r1->field_1f
    //     0x402f6c: ldur            w0, [x1, #0x1f]
    // 0x402f70: DecompressPointer r0
    //     0x402f70: add             x0, x0, HEAP, lsl #32
    // 0x402f74: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402f78: cmp             w0, w16
    // 0x402f7c: b.ne            #0x402f8c
    // 0x402f80: r2 = restartGameDialog
    //     0x402f80: add             x2, PP, #0x14, lsl #12  ; [pp+0x14398] Field <Translations.restartGameDialog>: late final (offset: 0x20)
    //     0x402f84: ldr             x2, [x2, #0x398]
    // 0x402f88: r0 = InitLateFinalInstanceField()
    //     0x402f88: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402f8c: b               #0x403014
    // 0x402f90: cmp             x1, #0x8df
    // 0x402f94: b.ne            #0x402fc0
    // 0x402f98: mov             x1, x0
    // 0x402f9c: LoadField: r0 = r1->field_43
    //     0x402f9c: ldur            w0, [x1, #0x43]
    // 0x402fa0: DecompressPointer r0
    //     0x402fa0: add             x0, x0, HEAP, lsl #32
    // 0x402fa4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402fa8: cmp             w0, w16
    // 0x402fac: b.ne            #0x402fbc
    // 0x402fb0: r2 = restartGameDialog
    //     0x402fb0: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a0] Field <TranslationsRu.restartGameDialog>: late final (offset: 0x44)
    //     0x402fb4: ldr             x2, [x2, #0x3a0]
    // 0x402fb8: r0 = InitLateFinalInstanceField()
    //     0x402fb8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402fbc: b               #0x403014
    // 0x402fc0: cmp             x1, #0x8e0
    // 0x402fc4: b.ne            #0x402ff0
    // 0x402fc8: mov             x1, x0
    // 0x402fcc: LoadField: r0 = r1->field_43
    //     0x402fcc: ldur            w0, [x1, #0x43]
    // 0x402fd0: DecompressPointer r0
    //     0x402fd0: add             x0, x0, HEAP, lsl #32
    // 0x402fd4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402fd8: cmp             w0, w16
    // 0x402fdc: b.ne            #0x402fec
    // 0x402fe0: r2 = restartGameDialog
    //     0x402fe0: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a8] Field <TranslationsKk.restartGameDialog>: late final (offset: 0x44)
    //     0x402fe4: ldr             x2, [x2, #0x3a8]
    // 0x402fe8: r0 = InitLateFinalInstanceField()
    //     0x402fe8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402fec: b               #0x403014
    // 0x402ff0: mov             x1, x0
    // 0x402ff4: LoadField: r0 = r1->field_43
    //     0x402ff4: ldur            w0, [x1, #0x43]
    // 0x402ff8: DecompressPointer r0
    //     0x402ff8: add             x0, x0, HEAP, lsl #32
    // 0x402ffc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403000: cmp             w0, w16
    // 0x403004: b.ne            #0x403014
    // 0x403008: r2 = restartGameDialog
    //     0x403008: add             x2, PP, #0x14, lsl #12  ; [pp+0x143b0] Field <TranslationsEs.restartGameDialog>: late final (offset: 0x44)
    //     0x40300c: ldr             x2, [x2, #0x3b0]
    // 0x403010: r0 = InitLateFinalInstanceField()
    //     0x403010: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403014: r1 = LoadClassIdInstr(r0)
    //     0x403014: ldur            x1, [x0, #-1]
    //     0x403018: ubfx            x1, x1, #0xc, #0x14
    // 0x40301c: cmp             x1, #0xec
    // 0x403020: b.ne            #0x403030
    // 0x403024: r3 = "Yes I\'m sure!"
    //     0x403024: add             x3, PP, #0x15, lsl #12  ; [pp+0x15c90] "Yes I\'m sure!"
    //     0x403028: ldr             x3, [x3, #0xc90]
    // 0x40302c: b               #0x403060
    // 0x403030: cmp             x1, #0xed
    // 0x403034: b.ne            #0x403044
    // 0x403038: r3 = "Ну конечно!"
    //     0x403038: add             x3, PP, #0x15, lsl #12  ; [pp+0x15c98] "Ну конечно!"
    //     0x40303c: ldr             x3, [x3, #0xc98]
    // 0x403040: b               #0x403060
    // 0x403044: cmp             x1, #0xee
    // 0x403048: b.ne            #0x403058
    // 0x40304c: r3 = "Иә мен сенімдімін!"
    //     0x40304c: add             x3, PP, #0x15, lsl #12  ; [pp+0x15ca0] "Иә мен сенімдімін!"
    //     0x403050: ldr             x3, [x3, #0xca0]
    // 0x403054: b               #0x403060
    // 0x403058: r3 = "¡Sí estoy seguro!"
    //     0x403058: add             x3, PP, #0x15, lsl #12  ; [pp+0x15ca8] "¡Sí estoy seguro!"
    //     0x40305c: ldr             x3, [x3, #0xca8]
    // 0x403060: ldur            x0, [fp, #-0x38]
    // 0x403064: ldur            x2, [fp, #-0x18]
    // 0x403068: stur            x3, [fp, #-0x30]
    // 0x40306c: r1 = Function '<anonymous closure>':.
    //     0x40306c: add             x1, PP, #0x15, lsl #12  ; [pp+0x15cb0] AnonymousClosure: (0x4033f4), in [package:ricochlime/pages/restart_game.dart] RestartGameDialog::build (0x402b9c)
    //     0x403070: ldr             x1, [x1, #0xcb0]
    // 0x403074: r0 = AllocateClosure()
    //     0x403074: bl              #0x5838bc  ; AllocateClosureStub
    // 0x403078: stur            x0, [fp, #-0x40]
    // 0x40307c: r0 = DialogButton()
    //     0x40307c: bl              #0x400698  ; AllocateDialogButtonStub -> DialogButton (size=0x20)
    // 0x403080: mov             x2, x0
    // 0x403084: ldur            x0, [fp, #-0x40]
    // 0x403088: stur            x2, [fp, #-0x48]
    // 0x40308c: StoreField: r2->field_b = r0
    //     0x40308c: stur            w0, [x2, #0xb]
    // 0x403090: r0 = Instance_NesButtonType
    //     0x403090: add             x0, PP, #0x11, lsl #12  ; [pp+0x114d8] Obj!NesButtonType@5d8df1
    //     0x403094: ldr             x0, [x0, #0x4d8]
    // 0x403098: StoreField: r2->field_f = r0
    //     0x403098: stur            w0, [x2, #0xf]
    // 0x40309c: ldur            x0, [fp, #-0x38]
    // 0x4030a0: StoreField: r2->field_13 = r0
    //     0x4030a0: stur            w0, [x2, #0x13]
    // 0x4030a4: r0 = Instance_CrossAxisAlignment
    //     0x4030a4: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x4030a8: ldr             x0, [x0, #0xfc0]
    // 0x4030ac: ArrayStore: r2[0] = r0  ; List_4
    //     0x4030ac: stur            w0, [x2, #0x17]
    // 0x4030b0: ldur            x1, [fp, #-0x30]
    // 0x4030b4: StoreField: r2->field_1b = r1
    //     0x4030b4: stur            w1, [x2, #0x1b]
    // 0x4030b8: ldur            x1, [fp, #-0x20]
    // 0x4030bc: LoadField: r0 = r1->field_f
    //     0x4030bc: ldur            w0, [x1, #0xf]
    // 0x4030c0: DecompressPointer r0
    //     0x4030c0: add             x0, x0, HEAP, lsl #32
    // 0x4030c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4030c8: cmp             w0, w16
    // 0x4030cc: b.ne            #0x4030dc
    // 0x4030d0: r2 = leftArrowIndicator
    //     0x4030d0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11368] Field <NesIconCollection.leftArrowIndicator>: late final (offset: 0x10)
    //     0x4030d4: ldr             x2, [x2, #0x368]
    // 0x4030d8: r0 = InitLateFinalInstanceField()
    //     0x4030d8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4030dc: stur            x0, [fp, #-0x20]
    // 0x4030e0: r0 = NesIcon()
    //     0x4030e0: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x4030e4: mov             x1, x0
    // 0x4030e8: ldur            x0, [fp, #-0x20]
    // 0x4030ec: stur            x1, [fp, #-0x30]
    // 0x4030f0: StoreField: r1->field_b = r0
    //     0x4030f0: stur            w0, [x1, #0xb]
    // 0x4030f4: r16 = <AppLocale, Translations>
    //     0x4030f4: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4030f8: ldur            lr, [fp, #-0x10]
    // 0x4030fc: stp             lr, x16, [SP]
    // 0x403100: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x403100: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x403104: r0 = LocaleSettingsExt.currentTranslations()
    //     0x403104: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x403108: r1 = LoadClassIdInstr(r0)
    //     0x403108: ldur            x1, [x0, #-1]
    //     0x40310c: ubfx            x1, x1, #0xc, #0x14
    // 0x403110: cmp             x1, #0x8dd
    // 0x403114: b.ne            #0x403140
    // 0x403118: mov             x1, x0
    // 0x40311c: LoadField: r0 = r1->field_1f
    //     0x40311c: ldur            w0, [x1, #0x1f]
    // 0x403120: DecompressPointer r0
    //     0x403120: add             x0, x0, HEAP, lsl #32
    // 0x403124: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403128: cmp             w0, w16
    // 0x40312c: b.ne            #0x40313c
    // 0x403130: r2 = restartGameDialog
    //     0x403130: add             x2, PP, #0x14, lsl #12  ; [pp+0x14398] Field <Translations.restartGameDialog>: late final (offset: 0x20)
    //     0x403134: ldr             x2, [x2, #0x398]
    // 0x403138: r0 = InitLateFinalInstanceField()
    //     0x403138: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40313c: b               #0x4031c4
    // 0x403140: cmp             x1, #0x8df
    // 0x403144: b.ne            #0x403170
    // 0x403148: mov             x1, x0
    // 0x40314c: LoadField: r0 = r1->field_43
    //     0x40314c: ldur            w0, [x1, #0x43]
    // 0x403150: DecompressPointer r0
    //     0x403150: add             x0, x0, HEAP, lsl #32
    // 0x403154: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403158: cmp             w0, w16
    // 0x40315c: b.ne            #0x40316c
    // 0x403160: r2 = restartGameDialog
    //     0x403160: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a0] Field <TranslationsRu.restartGameDialog>: late final (offset: 0x44)
    //     0x403164: ldr             x2, [x2, #0x3a0]
    // 0x403168: r0 = InitLateFinalInstanceField()
    //     0x403168: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40316c: b               #0x4031c4
    // 0x403170: cmp             x1, #0x8e0
    // 0x403174: b.ne            #0x4031a0
    // 0x403178: mov             x1, x0
    // 0x40317c: LoadField: r0 = r1->field_43
    //     0x40317c: ldur            w0, [x1, #0x43]
    // 0x403180: DecompressPointer r0
    //     0x403180: add             x0, x0, HEAP, lsl #32
    // 0x403184: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403188: cmp             w0, w16
    // 0x40318c: b.ne            #0x40319c
    // 0x403190: r2 = restartGameDialog
    //     0x403190: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a8] Field <TranslationsKk.restartGameDialog>: late final (offset: 0x44)
    //     0x403194: ldr             x2, [x2, #0x3a8]
    // 0x403198: r0 = InitLateFinalInstanceField()
    //     0x403198: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40319c: b               #0x4031c4
    // 0x4031a0: mov             x1, x0
    // 0x4031a4: LoadField: r0 = r1->field_43
    //     0x4031a4: ldur            w0, [x1, #0x43]
    // 0x4031a8: DecompressPointer r0
    //     0x4031a8: add             x0, x0, HEAP, lsl #32
    // 0x4031ac: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4031b0: cmp             w0, w16
    // 0x4031b4: b.ne            #0x4031c4
    // 0x4031b8: r2 = restartGameDialog
    //     0x4031b8: add             x2, PP, #0x14, lsl #12  ; [pp+0x143b0] Field <TranslationsEs.restartGameDialog>: late final (offset: 0x44)
    //     0x4031bc: ldr             x2, [x2, #0x3b0]
    // 0x4031c0: r0 = InitLateFinalInstanceField()
    //     0x4031c0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4031c4: r1 = LoadClassIdInstr(r0)
    //     0x4031c4: ldur            x1, [x0, #-1]
    //     0x4031c8: ubfx            x1, x1, #0xc, #0x14
    // 0x4031cc: cmp             x1, #0xec
    // 0x4031d0: b.ne            #0x4031e0
    // 0x4031d4: r6 = "Wait, cancel!"
    //     0x4031d4: add             x6, PP, #0x15, lsl #12  ; [pp+0x15cb8] "Wait, cancel!"
    //     0x4031d8: ldr             x6, [x6, #0xcb8]
    // 0x4031dc: b               #0x403210
    // 0x4031e0: cmp             x1, #0xed
    // 0x4031e4: b.ne            #0x4031f4
    // 0x4031e8: r6 = "Подождите, я передумал!"
    //     0x4031e8: add             x6, PP, #0x15, lsl #12  ; [pp+0x15cc0] "Подождите, я передумал!"
    //     0x4031ec: ldr             x6, [x6, #0xcc0]
    // 0x4031f0: b               #0x403210
    // 0x4031f4: cmp             x1, #0xee
    // 0x4031f8: b.ne            #0x403208
    // 0x4031fc: r6 = "Күте тұрыңыз, бас тартыңыз!"
    //     0x4031fc: add             x6, PP, #0x15, lsl #12  ; [pp+0x15cc8] "Күте тұрыңыз, бас тартыңыз!"
    //     0x403200: ldr             x6, [x6, #0xcc8]
    // 0x403204: b               #0x403210
    // 0x403208: r6 = "¡Espera, cancela!"
    //     0x403208: add             x6, PP, #0x15, lsl #12  ; [pp+0x15cd0] "¡Espera, cancela!"
    //     0x40320c: ldr             x6, [x6, #0xcd0]
    // 0x403210: ldur            x5, [fp, #-0x28]
    // 0x403214: ldur            x4, [fp, #-8]
    // 0x403218: ldur            x3, [fp, #-0x48]
    // 0x40321c: ldur            x0, [fp, #-0x30]
    // 0x403220: ldur            x2, [fp, #-0x18]
    // 0x403224: stur            x6, [fp, #-0x10]
    // 0x403228: r1 = Function '<anonymous closure>':.
    //     0x403228: add             x1, PP, #0x15, lsl #12  ; [pp+0x15cd8] AnonymousClosure: (0x40338c), in [package:ricochlime/pages/restart_game.dart] RestartGameDialog::build (0x402b9c)
    //     0x40322c: ldr             x1, [x1, #0xcd8]
    // 0x403230: r0 = AllocateClosure()
    //     0x403230: bl              #0x5838bc  ; AllocateClosureStub
    // 0x403234: stur            x0, [fp, #-0x18]
    // 0x403238: r0 = DialogButton()
    //     0x403238: bl              #0x400698  ; AllocateDialogButtonStub -> DialogButton (size=0x20)
    // 0x40323c: mov             x3, x0
    // 0x403240: ldur            x0, [fp, #-0x18]
    // 0x403244: stur            x3, [fp, #-0x20]
    // 0x403248: StoreField: r3->field_b = r0
    //     0x403248: stur            w0, [x3, #0xb]
    // 0x40324c: r0 = Instance_NesButtonType
    //     0x40324c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11060] Obj!NesButtonType@5d8e11
    //     0x403250: ldr             x0, [x0, #0x60]
    // 0x403254: StoreField: r3->field_f = r0
    //     0x403254: stur            w0, [x3, #0xf]
    // 0x403258: ldur            x0, [fp, #-0x30]
    // 0x40325c: StoreField: r3->field_13 = r0
    //     0x40325c: stur            w0, [x3, #0x13]
    // 0x403260: r0 = Instance_CrossAxisAlignment
    //     0x403260: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x403264: ldr             x0, [x0, #0xfc0]
    // 0x403268: ArrayStore: r3[0] = r0  ; List_4
    //     0x403268: stur            w0, [x3, #0x17]
    // 0x40326c: ldur            x1, [fp, #-0x10]
    // 0x403270: StoreField: r3->field_1b = r1
    //     0x403270: stur            w1, [x3, #0x1b]
    // 0x403274: r1 = Null
    //     0x403274: mov             x1, NULL
    // 0x403278: r2 = 14
    //     0x403278: mov             x2, #0xe
    // 0x40327c: r0 = AllocateArray()
    //     0x40327c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x403280: mov             x2, x0
    // 0x403284: ldur            x0, [fp, #-0x28]
    // 0x403288: stur            x2, [fp, #-0x10]
    // 0x40328c: StoreField: r2->field_f = r0
    //     0x40328c: stur            w0, [x2, #0xf]
    // 0x403290: r16 = Instance_SizedBox
    //     0x403290: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c58] Obj!SizedBox@5d8401
    //     0x403294: ldr             x16, [x16, #0xc58]
    // 0x403298: StoreField: r2->field_13 = r16
    //     0x403298: stur            w16, [x2, #0x13]
    // 0x40329c: ldur            x0, [fp, #-8]
    // 0x4032a0: ArrayStore: r2[0] = r0  ; List_4
    //     0x4032a0: stur            w0, [x2, #0x17]
    // 0x4032a4: r16 = Instance_SizedBox
    //     0x4032a4: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x4032a8: ldr             x16, [x16, #0xfd8]
    // 0x4032ac: StoreField: r2->field_1b = r16
    //     0x4032ac: stur            w16, [x2, #0x1b]
    // 0x4032b0: ldur            x0, [fp, #-0x48]
    // 0x4032b4: StoreField: r2->field_1f = r0
    //     0x4032b4: stur            w0, [x2, #0x1f]
    // 0x4032b8: r16 = Instance_SizedBox
    //     0x4032b8: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x4032bc: ldr             x16, [x16, #0xfd8]
    // 0x4032c0: StoreField: r2->field_23 = r16
    //     0x4032c0: stur            w16, [x2, #0x23]
    // 0x4032c4: ldur            x0, [fp, #-0x20]
    // 0x4032c8: StoreField: r2->field_27 = r0
    //     0x4032c8: stur            w0, [x2, #0x27]
    // 0x4032cc: r1 = <Widget>
    //     0x4032cc: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x4032d0: r0 = AllocateGrowableArray()
    //     0x4032d0: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x4032d4: mov             x1, x0
    // 0x4032d8: ldur            x0, [fp, #-0x10]
    // 0x4032dc: stur            x1, [fp, #-8]
    // 0x4032e0: StoreField: r1->field_f = r0
    //     0x4032e0: stur            w0, [x1, #0xf]
    // 0x4032e4: r0 = 14
    //     0x4032e4: mov             x0, #0xe
    // 0x4032e8: StoreField: r1->field_b = r0
    //     0x4032e8: stur            w0, [x1, #0xb]
    // 0x4032ec: r0 = Column()
    //     0x4032ec: bl              #0x3715fc  ; AllocateColumnStub -> Column (size=0x38)
    // 0x4032f0: mov             x1, x0
    // 0x4032f4: r0 = Instance_Axis
    //     0x4032f4: ldr             x0, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x4032f8: stur            x1, [fp, #-0x10]
    // 0x4032fc: StoreField: r1->field_f = r0
    //     0x4032fc: stur            w0, [x1, #0xf]
    // 0x403300: r0 = Instance_MainAxisAlignment
    //     0x403300: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x403304: ldr             x0, [x0, #0xfb0]
    // 0x403308: StoreField: r1->field_13 = r0
    //     0x403308: stur            w0, [x1, #0x13]
    // 0x40330c: r0 = Instance_MainAxisSize
    //     0x40330c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11398] Obj!MainAxisSize@5dac31
    //     0x403310: ldr             x0, [x0, #0x398]
    // 0x403314: ArrayStore: r1[0] = r0  ; List_4
    //     0x403314: stur            w0, [x1, #0x17]
    // 0x403318: r0 = Instance_CrossAxisAlignment
    //     0x403318: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x40331c: ldr             x0, [x0, #0xfc0]
    // 0x403320: StoreField: r1->field_1b = r0
    //     0x403320: stur            w0, [x1, #0x1b]
    // 0x403324: r0 = Instance_VerticalDirection
    //     0x403324: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x403328: ldr             x0, [x0, #0xfc8]
    // 0x40332c: StoreField: r1->field_23 = r0
    //     0x40332c: stur            w0, [x1, #0x23]
    // 0x403330: r0 = Instance_Clip
    //     0x403330: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x403334: ldr             x0, [x0, #0xfd0]
    // 0x403338: StoreField: r1->field_2b = r0
    //     0x403338: stur            w0, [x1, #0x2b]
    // 0x40333c: StoreField: r1->field_2f = rZR
    //     0x40333c: stur            xzr, [x1, #0x2f]
    // 0x403340: ldur            x2, [fp, #-8]
    // 0x403344: StoreField: r1->field_b = r2
    //     0x403344: stur            w2, [x1, #0xb]
    // 0x403348: r0 = FittedBox()
    //     0x403348: bl              #0x370e1c  ; AllocateFittedBoxStub -> FittedBox (size=0x1c)
    // 0x40334c: r1 = Instance_BoxFit
    //     0x40334c: add             x1, PP, #0x11, lsl #12  ; [pp+0x110d8] Obj!BoxFit@5dae31
    //     0x403350: ldr             x1, [x1, #0xd8]
    // 0x403354: StoreField: r0->field_f = r1
    //     0x403354: stur            w1, [x0, #0xf]
    // 0x403358: r1 = Instance_Alignment
    //     0x403358: add             x1, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x40335c: ldr             x1, [x1, #0xb18]
    // 0x403360: StoreField: r0->field_13 = r1
    //     0x403360: stur            w1, [x0, #0x13]
    // 0x403364: r1 = Instance_Clip
    //     0x403364: add             x1, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x403368: ldr             x1, [x1, #0xfd0]
    // 0x40336c: ArrayStore: r0[0] = r1  ; List_4
    //     0x40336c: stur            w1, [x0, #0x17]
    // 0x403370: ldur            x1, [fp, #-0x10]
    // 0x403374: StoreField: r0->field_b = r1
    //     0x403374: stur            w1, [x0, #0xb]
    // 0x403378: LeaveFrame
    //     0x403378: mov             SP, fp
    //     0x40337c: ldp             fp, lr, [SP], #0x10
    // 0x403380: ret
    //     0x403380: ret             
    // 0x403384: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x403384: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x403388: b               #0x402bc4
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x40338c, size: 0x68
    // 0x40338c: EnterFrame
    //     0x40338c: stp             fp, lr, [SP, #-0x10]!
    //     0x403390: mov             fp, SP
    // 0x403394: AllocStack(0x18)
    //     0x403394: sub             SP, SP, #0x18
    // 0x403398: SetupParameters([dynamic _ /* r0 */])
    //     0x403398: ldr             x0, [fp, #0x10]
    //     0x40339c: ldur            w1, [x0, #0x17]
    //     0x4033a0: add             x1, x1, HEAP, lsl #32
    // 0x4033a4: CheckStackOverflow
    //     0x4033a4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4033a8: cmp             SP, x16
    //     0x4033ac: b.ls            #0x4033ec
    // 0x4033b0: LoadField: r0 = r1->field_13
    //     0x4033b0: ldur            w0, [x1, #0x13]
    // 0x4033b4: DecompressPointer r0
    //     0x4033b4: add             x0, x0, HEAP, lsl #32
    // 0x4033b8: mov             x1, x0
    // 0x4033bc: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x4033bc: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x4033c0: r0 = of()
    //     0x4033c0: bl              #0x378724  ; [package:flutter/src/widgets/navigator.dart] Navigator::of
    // 0x4033c4: r16 = <bool>
    //     0x4033c4: ldr             x16, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x4033c8: stp             x0, x16, [SP, #8]
    // 0x4033cc: r16 = false
    //     0x4033cc: add             x16, NULL, #0x30  ; false
    // 0x4033d0: str             x16, [SP]
    // 0x4033d4: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x4033d4: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x4033d8: r0 = pop()
    //     0x4033d8: bl              #0x276d04  ; [package:flutter/src/widgets/navigator.dart] NavigatorState::pop
    // 0x4033dc: r0 = Null
    //     0x4033dc: mov             x0, NULL
    // 0x4033e0: LeaveFrame
    //     0x4033e0: mov             SP, fp
    //     0x4033e4: ldp             fp, lr, [SP], #0x10
    // 0x4033e8: ret
    //     0x4033e8: ret             
    // 0x4033ec: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4033ec: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4033f0: b               #0x4033b0
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x4033f4, size: 0x8c
    // 0x4033f4: EnterFrame
    //     0x4033f4: stp             fp, lr, [SP, #-0x10]!
    //     0x4033f8: mov             fp, SP
    // 0x4033fc: AllocStack(0x20)
    //     0x4033fc: sub             SP, SP, #0x20
    // 0x403400: SetupParameters([dynamic _ /* r0 */])
    //     0x403400: ldr             x0, [fp, #0x10]
    //     0x403404: ldur            w2, [x0, #0x17]
    //     0x403408: add             x2, x2, HEAP, lsl #32
    //     0x40340c: stur            x2, [fp, #-8]
    // 0x403410: CheckStackOverflow
    //     0x403410: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x403414: cmp             SP, x16
    //     0x403418: b.ls            #0x403478
    // 0x40341c: LoadField: r0 = r2->field_f
    //     0x40341c: ldur            w0, [x2, #0xf]
    // 0x403420: DecompressPointer r0
    //     0x403420: add             x0, x0, HEAP, lsl #32
    // 0x403424: LoadField: r1 = r0->field_b
    //     0x403424: ldur            w1, [x0, #0xb]
    // 0x403428: DecompressPointer r1
    //     0x403428: add             x1, x1, HEAP, lsl #32
    // 0x40342c: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x40342c: ldur            w0, [x1, #0x17]
    // 0x403430: DecompressPointer r0
    //     0x403430: add             x0, x0, HEAP, lsl #32
    // 0x403434: mov             x1, x0
    // 0x403438: r0 = restartGame()
    //     0x403438: bl              #0x377348  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::restartGame
    // 0x40343c: ldur            x0, [fp, #-8]
    // 0x403440: LoadField: r1 = r0->field_13
    //     0x403440: ldur            w1, [x0, #0x13]
    // 0x403444: DecompressPointer r1
    //     0x403444: add             x1, x1, HEAP, lsl #32
    // 0x403448: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x403448: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x40344c: r0 = of()
    //     0x40344c: bl              #0x378724  ; [package:flutter/src/widgets/navigator.dart] Navigator::of
    // 0x403450: r16 = <bool>
    //     0x403450: ldr             x16, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x403454: stp             x0, x16, [SP, #8]
    // 0x403458: r16 = true
    //     0x403458: add             x16, NULL, #0x20  ; true
    // 0x40345c: str             x16, [SP]
    // 0x403460: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x403460: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x403464: r0 = pop()
    //     0x403464: bl              #0x276d04  ; [package:flutter/src/widgets/navigator.dart] NavigatorState::pop
    // 0x403468: r0 = Null
    //     0x403468: mov             x0, NULL
    // 0x40346c: LeaveFrame
    //     0x40346c: mov             SP, fp
    //     0x403470: ldp             fp, lr, [SP], #0x10
    // 0x403474: ret
    //     0x403474: ret             
    // 0x403478: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x403478: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x40347c: b               #0x40341c
  }
}
