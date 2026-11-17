// lib: , url: package:ricochlime/pages/game_over.dart

// class id: 1049323, size: 0x8
class :: {
}

// class id: 2770, size: 0x14, field offset: 0xc
//   const constructor, 
class GameOverDialog extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x3ff5d4, size: 0x10c4
    // 0x3ff5d4: EnterFrame
    //     0x3ff5d4: stp             fp, lr, [SP, #-0x10]!
    //     0x3ff5d8: mov             fp, SP
    // 0x3ff5dc: AllocStack(0x70)
    //     0x3ff5dc: sub             SP, SP, #0x70
    // 0x3ff5e0: SetupParameters(GameOverDialog this /* r1 => r0, fp-0x8 */, dynamic _ /* r2 => r1, fp-0x10 */)
    //     0x3ff5e0: mov             x0, x1
    //     0x3ff5e4: stur            x1, [fp, #-8]
    //     0x3ff5e8: mov             x1, x2
    //     0x3ff5ec: stur            x2, [fp, #-0x10]
    // 0x3ff5f0: CheckStackOverflow
    //     0x3ff5f0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3ff5f4: cmp             SP, x16
    //     0x3ff5f8: b.ls            #0x400690
    // 0x3ff5fc: r1 = 1
    //     0x3ff5fc: mov             x1, #1
    // 0x3ff600: r0 = AllocateContext()
    //     0x3ff600: bl              #0x5834e8  ; AllocateContextStub
    // 0x3ff604: ldur            x1, [fp, #-0x10]
    // 0x3ff608: stur            x0, [fp, #-0x18]
    // 0x3ff60c: StoreField: r0->field_f = r1
    //     0x3ff60c: stur            w1, [x0, #0xf]
    // 0x3ff610: r0 = of()
    //     0x3ff610: bl              #0x31bb3c  ; [package:flutter/src/material/theme.dart] Theme::of
    // 0x3ff614: LoadField: r1 = r0->field_3f
    //     0x3ff614: ldur            w1, [x0, #0x3f]
    // 0x3ff618: DecompressPointer r1
    //     0x3ff618: add             x1, x1, HEAP, lsl #32
    // 0x3ff61c: stur            x1, [fp, #-0x10]
    // 0x3ff620: r0 = LoadStaticField(0x468)
    //     0x3ff620: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3ff624: ldr             x0, [x0, #0x8d0]
    // 0x3ff628: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff62c: cmp             w0, w16
    // 0x3ff630: b.ne            #0x3ff63c
    // 0x3ff634: r2 = instance
    //     0x3ff634: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x3ff638: r0 = InitLateFinalStaticField()
    //     0x3ff638: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3ff63c: stur            x0, [fp, #-0x20]
    // 0x3ff640: r16 = <AppLocale, Translations>
    //     0x3ff640: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x3ff644: stp             x0, x16, [SP]
    // 0x3ff648: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x3ff648: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x3ff64c: r0 = LocaleSettingsExt.currentTranslations()
    //     0x3ff64c: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x3ff650: r1 = LoadClassIdInstr(r0)
    //     0x3ff650: ldur            x1, [x0, #-1]
    //     0x3ff654: ubfx            x1, x1, #0xc, #0x14
    // 0x3ff658: cmp             x1, #0x8dd
    // 0x3ff65c: b.ne            #0x3ff688
    // 0x3ff660: mov             x1, x0
    // 0x3ff664: LoadField: r0 = r1->field_1b
    //     0x3ff664: ldur            w0, [x1, #0x1b]
    // 0x3ff668: DecompressPointer r0
    //     0x3ff668: add             x0, x0, HEAP, lsl #32
    // 0x3ff66c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff670: cmp             w0, w16
    // 0x3ff674: b.ne            #0x3ff684
    // 0x3ff678: r2 = gameOverPage
    //     0x3ff678: add             x2, PP, #0x11, lsl #12  ; [pp+0x11220] Field <Translations.gameOverPage>: late final (offset: 0x1c)
    //     0x3ff67c: ldr             x2, [x2, #0x220]
    // 0x3ff680: r0 = InitLateFinalInstanceField()
    //     0x3ff680: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff684: b               #0x3ff70c
    // 0x3ff688: cmp             x1, #0x8df
    // 0x3ff68c: b.ne            #0x3ff6b8
    // 0x3ff690: mov             x1, x0
    // 0x3ff694: LoadField: r0 = r1->field_3f
    //     0x3ff694: ldur            w0, [x1, #0x3f]
    // 0x3ff698: DecompressPointer r0
    //     0x3ff698: add             x0, x0, HEAP, lsl #32
    // 0x3ff69c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff6a0: cmp             w0, w16
    // 0x3ff6a4: b.ne            #0x3ff6b4
    // 0x3ff6a8: r2 = gameOverPage
    //     0x3ff6a8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11228] Field <TranslationsRu.gameOverPage>: late final (offset: 0x40)
    //     0x3ff6ac: ldr             x2, [x2, #0x228]
    // 0x3ff6b0: r0 = InitLateFinalInstanceField()
    //     0x3ff6b0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff6b4: b               #0x3ff70c
    // 0x3ff6b8: cmp             x1, #0x8e0
    // 0x3ff6bc: b.ne            #0x3ff6e8
    // 0x3ff6c0: mov             x1, x0
    // 0x3ff6c4: LoadField: r0 = r1->field_3f
    //     0x3ff6c4: ldur            w0, [x1, #0x3f]
    // 0x3ff6c8: DecompressPointer r0
    //     0x3ff6c8: add             x0, x0, HEAP, lsl #32
    // 0x3ff6cc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff6d0: cmp             w0, w16
    // 0x3ff6d4: b.ne            #0x3ff6e4
    // 0x3ff6d8: r2 = gameOverPage
    //     0x3ff6d8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11230] Field <TranslationsKk.gameOverPage>: late final (offset: 0x40)
    //     0x3ff6dc: ldr             x2, [x2, #0x230]
    // 0x3ff6e0: r0 = InitLateFinalInstanceField()
    //     0x3ff6e0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff6e4: b               #0x3ff70c
    // 0x3ff6e8: mov             x1, x0
    // 0x3ff6ec: LoadField: r0 = r1->field_3f
    //     0x3ff6ec: ldur            w0, [x1, #0x3f]
    // 0x3ff6f0: DecompressPointer r0
    //     0x3ff6f0: add             x0, x0, HEAP, lsl #32
    // 0x3ff6f4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff6f8: cmp             w0, w16
    // 0x3ff6fc: b.ne            #0x3ff70c
    // 0x3ff700: r2 = gameOverPage
    //     0x3ff700: add             x2, PP, #0x11, lsl #12  ; [pp+0x11238] Field <TranslationsEs.gameOverPage>: late final (offset: 0x40)
    //     0x3ff704: ldr             x2, [x2, #0x238]
    // 0x3ff708: r0 = InitLateFinalInstanceField()
    //     0x3ff708: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff70c: r1 = LoadClassIdInstr(r0)
    //     0x3ff70c: ldur            x1, [x0, #-1]
    //     0x3ff710: ubfx            x1, x1, #0xc, #0x14
    // 0x3ff714: cmp             x1, #0xf0
    // 0x3ff718: b.ne            #0x3ff728
    // 0x3ff71c: r2 = "Game over!"
    //     0x3ff71c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11240] "Game over!"
    //     0x3ff720: ldr             x2, [x2, #0x240]
    // 0x3ff724: b               #0x3ff758
    // 0x3ff728: cmp             x1, #0xf1
    // 0x3ff72c: b.ne            #0x3ff73c
    // 0x3ff730: r2 = "Игра окончена!"
    //     0x3ff730: add             x2, PP, #0x11, lsl #12  ; [pp+0x11248] "Игра окончена!"
    //     0x3ff734: ldr             x2, [x2, #0x248]
    // 0x3ff738: b               #0x3ff758
    // 0x3ff73c: cmp             x1, #0xf2
    // 0x3ff740: b.ne            #0x3ff750
    // 0x3ff744: r2 = "Ойын бітті!"
    //     0x3ff744: add             x2, PP, #0x11, lsl #12  ; [pp+0x11250] "Ойын бітті!"
    //     0x3ff748: ldr             x2, [x2, #0x250]
    // 0x3ff74c: b               #0x3ff758
    // 0x3ff750: r2 = "¡Juego terminado!"
    //     0x3ff750: add             x2, PP, #0x11, lsl #12  ; [pp+0x11258] "¡Juego terminado!"
    //     0x3ff754: ldr             x2, [x2, #0x258]
    // 0x3ff758: ldur            x1, [fp, #-8]
    // 0x3ff75c: ldur            x0, [fp, #-0x10]
    // 0x3ff760: stur            x2, [fp, #-0x28]
    // 0x3ff764: r0 = Text()
    //     0x3ff764: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x3ff768: mov             x3, x0
    // 0x3ff76c: ldur            x0, [fp, #-0x28]
    // 0x3ff770: stur            x3, [fp, #-0x30]
    // 0x3ff774: StoreField: r3->field_b = r0
    //     0x3ff774: stur            w0, [x3, #0xb]
    // 0x3ff778: r0 = Instance_TextStyle
    //     0x3ff778: add             x0, PP, #0x10, lsl #12  ; [pp+0x10f68] Obj!TextStyle@5d57c1
    //     0x3ff77c: ldr             x0, [x0, #0xf68]
    // 0x3ff780: StoreField: r3->field_13 = r0
    //     0x3ff780: stur            w0, [x3, #0x13]
    // 0x3ff784: r1 = <Widget>
    //     0x3ff784: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x3ff788: r2 = 18
    //     0x3ff788: mov             x2, #0x12
    // 0x3ff78c: r0 = AllocateArray()
    //     0x3ff78c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ff790: mov             x1, x0
    // 0x3ff794: ldur            x0, [fp, #-0x30]
    // 0x3ff798: stur            x1, [fp, #-0x38]
    // 0x3ff79c: StoreField: r1->field_f = r0
    //     0x3ff79c: stur            w0, [x1, #0xf]
    // 0x3ff7a0: r16 = Instance_SizedBox
    //     0x3ff7a0: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x3ff7a4: ldr             x16, [x16, #0xfd8]
    // 0x3ff7a8: StoreField: r1->field_13 = r16
    //     0x3ff7a8: stur            w16, [x1, #0x13]
    // 0x3ff7ac: ldur            x0, [fp, #-0x10]
    // 0x3ff7b0: LoadField: r2 = r0->field_7f
    //     0x3ff7b0: ldur            w2, [x0, #0x7f]
    // 0x3ff7b4: DecompressPointer r2
    //     0x3ff7b4: add             x2, x2, HEAP, lsl #32
    // 0x3ff7b8: stur            x2, [fp, #-0x28]
    // 0x3ff7bc: r0 = TextStyle()
    //     0x3ff7bc: bl              #0x31e4c4  ; AllocateTextStyleStub -> TextStyle (size=0x70)
    // 0x3ff7c0: mov             x3, x0
    // 0x3ff7c4: r0 = true
    //     0x3ff7c4: add             x0, NULL, #0x20  ; true
    // 0x3ff7c8: stur            x3, [fp, #-0x10]
    // 0x3ff7cc: StoreField: r3->field_7 = r0
    //     0x3ff7cc: stur            w0, [x3, #7]
    // 0x3ff7d0: ldur            x4, [fp, #-0x28]
    // 0x3ff7d4: StoreField: r3->field_b = r4
    //     0x3ff7d4: stur            w4, [x3, #0xb]
    // 0x3ff7d8: r1 = 28.000000
    //     0x3ff7d8: add             x1, PP, #0x11, lsl #12  ; [pp+0x11260] 28
    //     0x3ff7dc: ldr             x1, [x1, #0x260]
    // 0x3ff7e0: StoreField: r3->field_1f = r1
    //     0x3ff7e0: stur            w1, [x3, #0x1f]
    // 0x3ff7e4: r1 = <InlineSpan>
    //     0x3ff7e4: add             x1, PP, #0x11, lsl #12  ; [pp+0x11268] TypeArguments: <InlineSpan>
    //     0x3ff7e8: ldr             x1, [x1, #0x268]
    // 0x3ff7ec: r2 = 0
    //     0x3ff7ec: mov             x2, #0
    // 0x3ff7f0: r0 = _GrowableList()
    //     0x3ff7f0: bl              #0x237730  ; [dart:core] _GrowableList::_GrowableList
    // 0x3ff7f4: mov             x1, x0
    // 0x3ff7f8: ldur            x0, [fp, #-8]
    // 0x3ff7fc: stur            x1, [fp, #-0x30]
    // 0x3ff800: LoadField: r2 = r0->field_b
    //     0x3ff800: ldur            x2, [x0, #0xb]
    // 0x3ff804: stur            x2, [fp, #-0x40]
    // 0x3ff808: r0 = LoadStaticField(0xccc)
    //     0x3ff808: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3ff80c: ldr             x0, [x0, #0x1998]
    // 0x3ff810: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff814: cmp             w0, w16
    // 0x3ff818: b.ne            #0x3ff828
    // 0x3ff81c: r2 = stows
    //     0x3ff81c: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3ff820: ldr             x2, [x2, #0x310]
    // 0x3ff824: r0 = InitLateFinalStaticField()
    //     0x3ff824: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3ff828: stur            x0, [fp, #-0x48]
    // 0x3ff82c: LoadField: r2 = r0->field_b
    //     0x3ff82c: ldur            w2, [x0, #0xb]
    // 0x3ff830: DecompressPointer r2
    //     0x3ff830: add             x2, x2, HEAP, lsl #32
    // 0x3ff834: mov             x1, x2
    // 0x3ff838: stur            x2, [fp, #-8]
    // 0x3ff83c: LoadField: r0 = r1->field_43
    //     0x3ff83c: ldur            w0, [x1, #0x43]
    // 0x3ff840: DecompressPointer r0
    //     0x3ff840: add             x0, x0, HEAP, lsl #32
    // 0x3ff844: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff848: cmp             w0, w16
    // 0x3ff84c: b.ne            #0x3ff85c
    // 0x3ff850: r2 = _value
    //     0x3ff850: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3ff854: ldr             x2, [x2, #0x4b0]
    // 0x3ff858: r0 = InitLateInstanceField()
    //     0x3ff858: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3ff85c: r1 = LoadInt32Instr(r0)
    //     0x3ff85c: sbfx            x1, x0, #1, #0x1f
    //     0x3ff860: tbz             w0, #0, #0x3ff868
    //     0x3ff864: ldur            x1, [x0, #7]
    // 0x3ff868: ldur            x0, [fp, #-0x40]
    // 0x3ff86c: cmp             x0, x1
    // 0x3ff870: b.le            #0x3ffd54
    // 0x3ff874: cmp             x1, #0
    // 0x3ff878: b.le            #0x3ffd48
    // 0x3ff87c: r16 = <AppLocale, Translations>
    //     0x3ff87c: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x3ff880: ldur            lr, [fp, #-0x20]
    // 0x3ff884: stp             lr, x16, [SP]
    // 0x3ff888: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x3ff888: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x3ff88c: r0 = LocaleSettingsExt.currentTranslations()
    //     0x3ff88c: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x3ff890: r1 = LoadClassIdInstr(r0)
    //     0x3ff890: ldur            x1, [x0, #-1]
    //     0x3ff894: ubfx            x1, x1, #0xc, #0x14
    // 0x3ff898: cmp             x1, #0x8dd
    // 0x3ff89c: b.ne            #0x3ff8cc
    // 0x3ff8a0: mov             x1, x0
    // 0x3ff8a4: LoadField: r0 = r1->field_1b
    //     0x3ff8a4: ldur            w0, [x1, #0x1b]
    // 0x3ff8a8: DecompressPointer r0
    //     0x3ff8a8: add             x0, x0, HEAP, lsl #32
    // 0x3ff8ac: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff8b0: cmp             w0, w16
    // 0x3ff8b4: b.ne            #0x3ff8c4
    // 0x3ff8b8: r2 = gameOverPage
    //     0x3ff8b8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11220] Field <Translations.gameOverPage>: late final (offset: 0x1c)
    //     0x3ff8bc: ldr             x2, [x2, #0x220]
    // 0x3ff8c0: r0 = InitLateFinalInstanceField()
    //     0x3ff8c0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff8c4: mov             x3, x0
    // 0x3ff8c8: b               #0x3ff95c
    // 0x3ff8cc: cmp             x1, #0x8df
    // 0x3ff8d0: b.ne            #0x3ff900
    // 0x3ff8d4: mov             x1, x0
    // 0x3ff8d8: LoadField: r0 = r1->field_3f
    //     0x3ff8d8: ldur            w0, [x1, #0x3f]
    // 0x3ff8dc: DecompressPointer r0
    //     0x3ff8dc: add             x0, x0, HEAP, lsl #32
    // 0x3ff8e0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff8e4: cmp             w0, w16
    // 0x3ff8e8: b.ne            #0x3ff8f8
    // 0x3ff8ec: r2 = gameOverPage
    //     0x3ff8ec: add             x2, PP, #0x11, lsl #12  ; [pp+0x11228] Field <TranslationsRu.gameOverPage>: late final (offset: 0x40)
    //     0x3ff8f0: ldr             x2, [x2, #0x228]
    // 0x3ff8f4: r0 = InitLateFinalInstanceField()
    //     0x3ff8f4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff8f8: mov             x3, x0
    // 0x3ff8fc: b               #0x3ff95c
    // 0x3ff900: cmp             x1, #0x8e0
    // 0x3ff904: b.ne            #0x3ff934
    // 0x3ff908: mov             x1, x0
    // 0x3ff90c: LoadField: r0 = r1->field_3f
    //     0x3ff90c: ldur            w0, [x1, #0x3f]
    // 0x3ff910: DecompressPointer r0
    //     0x3ff910: add             x0, x0, HEAP, lsl #32
    // 0x3ff914: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff918: cmp             w0, w16
    // 0x3ff91c: b.ne            #0x3ff92c
    // 0x3ff920: r2 = gameOverPage
    //     0x3ff920: add             x2, PP, #0x11, lsl #12  ; [pp+0x11230] Field <TranslationsKk.gameOverPage>: late final (offset: 0x40)
    //     0x3ff924: ldr             x2, [x2, #0x230]
    // 0x3ff928: r0 = InitLateFinalInstanceField()
    //     0x3ff928: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff92c: mov             x3, x0
    // 0x3ff930: b               #0x3ff95c
    // 0x3ff934: mov             x1, x0
    // 0x3ff938: LoadField: r0 = r1->field_3f
    //     0x3ff938: ldur            w0, [x1, #0x3f]
    // 0x3ff93c: DecompressPointer r0
    //     0x3ff93c: add             x0, x0, HEAP, lsl #32
    // 0x3ff940: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff944: cmp             w0, w16
    // 0x3ff948: b.ne            #0x3ff958
    // 0x3ff94c: r2 = gameOverPage
    //     0x3ff94c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11238] Field <TranslationsEs.gameOverPage>: late final (offset: 0x40)
    //     0x3ff950: ldr             x2, [x2, #0x238]
    // 0x3ff954: r0 = InitLateFinalInstanceField()
    //     0x3ff954: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff958: mov             x3, x0
    // 0x3ff95c: ldur            x0, [fp, #-0x40]
    // 0x3ff960: ldur            x2, [fp, #-8]
    // 0x3ff964: stur            x3, [fp, #-0x50]
    // 0x3ff968: r16 = 0.600000
    //     0x3ff968: add             x16, PP, #0x11, lsl #12  ; [pp+0x11270] 0.6
    //     0x3ff96c: ldr             x16, [x16, #0x270]
    // 0x3ff970: str             x16, [SP]
    // 0x3ff974: ldur            x1, [fp, #-0x28]
    // 0x3ff978: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x3ff978: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x3ff97c: ldr             x4, [x4, #0x1f0]
    // 0x3ff980: r0 = withValues()
    //     0x3ff980: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x3ff984: stur            x0, [fp, #-0x28]
    // 0x3ff988: r0 = TextStyle()
    //     0x3ff988: bl              #0x31e4c4  ; AllocateTextStyleStub -> TextStyle (size=0x70)
    // 0x3ff98c: mov             x3, x0
    // 0x3ff990: r0 = true
    //     0x3ff990: add             x0, NULL, #0x20  ; true
    // 0x3ff994: stur            x3, [fp, #-0x58]
    // 0x3ff998: StoreField: r3->field_7 = r0
    //     0x3ff998: stur            w0, [x3, #7]
    // 0x3ff99c: r0 = Instance_TextDecoration
    //     0x3ff99c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11278] Obj!TextDecoration@5cd001
    //     0x3ff9a0: ldr             x0, [x0, #0x278]
    // 0x3ff9a4: StoreField: r3->field_4b = r0
    //     0x3ff9a4: stur            w0, [x3, #0x4b]
    // 0x3ff9a8: ldur            x0, [fp, #-0x28]
    // 0x3ff9ac: StoreField: r3->field_4f = r0
    //     0x3ff9ac: stur            w0, [x3, #0x4f]
    // 0x3ff9b0: r0 = 2.800000
    //     0x3ff9b0: add             x0, PP, #0x11, lsl #12  ; [pp+0x11280] 2.8
    //     0x3ff9b4: ldr             x0, [x0, #0x280]
    // 0x3ff9b8: StoreField: r3->field_57 = r0
    //     0x3ff9b8: stur            w0, [x3, #0x57]
    // 0x3ff9bc: r1 = Null
    //     0x3ff9bc: mov             x1, NULL
    // 0x3ff9c0: r2 = 6
    //     0x3ff9c0: mov             x2, #6
    // 0x3ff9c4: r0 = AllocateArray()
    //     0x3ff9c4: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ff9c8: r16 = " "
    //     0x3ff9c8: ldr             x16, [PP, #0x1de0]  ; [pp+0x1de0] " "
    // 0x3ff9cc: StoreField: r0->field_f = r16
    //     0x3ff9cc: stur            w16, [x0, #0xf]
    // 0x3ff9d0: ldur            x1, [fp, #-8]
    // 0x3ff9d4: LoadField: r2 = r1->field_43
    //     0x3ff9d4: ldur            w2, [x1, #0x43]
    // 0x3ff9d8: DecompressPointer r2
    //     0x3ff9d8: add             x2, x2, HEAP, lsl #32
    // 0x3ff9dc: StoreField: r0->field_13 = r2
    //     0x3ff9dc: stur            w2, [x0, #0x13]
    // 0x3ff9e0: r16 = " "
    //     0x3ff9e0: ldr             x16, [PP, #0x1de0]  ; [pp+0x1de0] " "
    // 0x3ff9e4: ArrayStore: r0[0] = r16  ; List_4
    //     0x3ff9e4: stur            w16, [x0, #0x17]
    // 0x3ff9e8: str             x0, [SP]
    // 0x3ff9ec: r0 = _interpolate()
    //     0x3ff9ec: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x3ff9f0: stur            x0, [fp, #-8]
    // 0x3ff9f4: r0 = TextSpan()
    //     0x3ff9f4: bl              #0x3031c8  ; AllocateTextSpanStub -> TextSpan (size=0x34)
    // 0x3ff9f8: mov             x2, x0
    // 0x3ff9fc: ldur            x0, [fp, #-8]
    // 0x3ffa00: stur            x2, [fp, #-0x28]
    // 0x3ffa04: StoreField: r2->field_b = r0
    //     0x3ffa04: stur            w0, [x2, #0xb]
    // 0x3ffa08: r3 = Instance__DeferringMouseCursor
    //     0x3ffa08: ldr             x3, [PP, #0x2f38]  ; [pp+0x2f38] Obj!_DeferringMouseCursor@5d6e01
    // 0x3ffa0c: ArrayStore: r2[0] = r3  ; List_4
    //     0x3ffa0c: stur            w3, [x2, #0x17]
    // 0x3ffa10: ldur            x0, [fp, #-0x58]
    // 0x3ffa14: StoreField: r2->field_7 = r0
    //     0x3ffa14: stur            w0, [x2, #7]
    // 0x3ffa18: ldur            x4, [fp, #-0x40]
    // 0x3ffa1c: r0 = BoxInt64Instr(r4)
    //     0x3ffa1c: sbfiz           x0, x4, #1, #0x1f
    //     0x3ffa20: cmp             x4, x0, asr #1
    //     0x3ffa24: b.eq            #0x3ffa30
    //     0x3ffa28: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3ffa2c: stur            x4, [x0, #7]
    // 0x3ffa30: str             x0, [SP]
    // 0x3ffa34: r0 = _interpolateSingle()
    //     0x3ffa34: bl              #0x2412a0  ; [dart:core] _StringBase::_interpolateSingle
    // 0x3ffa38: stur            x0, [fp, #-8]
    // 0x3ffa3c: r0 = TextSpan()
    //     0x3ffa3c: bl              #0x3031c8  ; AllocateTextSpanStub -> TextSpan (size=0x34)
    // 0x3ffa40: mov             x3, x0
    // 0x3ffa44: ldur            x0, [fp, #-8]
    // 0x3ffa48: stur            x3, [fp, #-0x58]
    // 0x3ffa4c: StoreField: r3->field_b = r0
    //     0x3ffa4c: stur            w0, [x3, #0xb]
    // 0x3ffa50: r0 = Instance__DeferringMouseCursor
    //     0x3ffa50: ldr             x0, [PP, #0x2f38]  ; [pp+0x2f38] Obj!_DeferringMouseCursor@5d6e01
    // 0x3ffa54: ArrayStore: r3[0] = r0  ; List_4
    //     0x3ffa54: stur            w0, [x3, #0x17]
    // 0x3ffa58: r1 = Instance_TextStyle
    //     0x3ffa58: add             x1, PP, #0x11, lsl #12  ; [pp+0x11288] Obj!TextStyle@5d5751
    //     0x3ffa5c: ldr             x1, [x1, #0x288]
    // 0x3ffa60: StoreField: r3->field_7 = r1
    //     0x3ffa60: stur            w1, [x3, #7]
    // 0x3ffa64: ldur            x1, [fp, #-0x50]
    // 0x3ffa68: r2 = LoadClassIdInstr(r1)
    //     0x3ffa68: ldur            x2, [x1, #-1]
    //     0x3ffa6c: ubfx            x2, x2, #0xc, #0x14
    // 0x3ffa70: cmp             x2, #0xf0
    // 0x3ffa74: b.ne            #0x3ffb0c
    // 0x3ffa78: ldur            x4, [fp, #-0x28]
    // 0x3ffa7c: r5 = 10
    //     0x3ffa7c: mov             x5, #0xa
    // 0x3ffa80: mov             x2, x5
    // 0x3ffa84: r1 = Null
    //     0x3ffa84: mov             x1, NULL
    // 0x3ffa88: r0 = AllocateArray()
    //     0x3ffa88: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ffa8c: stur            x0, [fp, #-8]
    // 0x3ffa90: r16 = Instance_TextSpan
    //     0x3ffa90: add             x16, PP, #0x11, lsl #12  ; [pp+0x11290] Obj!TextSpan@5d7ee1
    //     0x3ffa94: ldr             x16, [x16, #0x290]
    // 0x3ffa98: StoreField: r0->field_f = r16
    //     0x3ffa98: stur            w16, [x0, #0xf]
    // 0x3ffa9c: ldur            x3, [fp, #-0x28]
    // 0x3ffaa0: StoreField: r0->field_13 = r3
    //     0x3ffaa0: stur            w3, [x0, #0x13]
    // 0x3ffaa4: r16 = Instance_TextSpan
    //     0x3ffaa4: add             x16, PP, #0x11, lsl #12  ; [pp+0x11298] Obj!TextSpan@5d7ea1
    //     0x3ffaa8: ldr             x16, [x16, #0x298]
    // 0x3ffaac: ArrayStore: r0[0] = r16  ; List_4
    //     0x3ffaac: stur            w16, [x0, #0x17]
    // 0x3ffab0: ldur            x4, [fp, #-0x58]
    // 0x3ffab4: StoreField: r0->field_1b = r4
    //     0x3ffab4: stur            w4, [x0, #0x1b]
    // 0x3ffab8: r16 = Instance_TextSpan
    //     0x3ffab8: add             x16, PP, #0x11, lsl #12  ; [pp+0x112a0] Obj!TextSpan@5d7e61
    //     0x3ffabc: ldr             x16, [x16, #0x2a0]
    // 0x3ffac0: StoreField: r0->field_1f = r16
    //     0x3ffac0: stur            w16, [x0, #0x1f]
    // 0x3ffac4: r1 = <InlineSpan>
    //     0x3ffac4: add             x1, PP, #0x11, lsl #12  ; [pp+0x11268] TypeArguments: <InlineSpan>
    //     0x3ffac8: ldr             x1, [x1, #0x268]
    // 0x3ffacc: r0 = AllocateGrowableArray()
    //     0x3ffacc: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3ffad0: mov             x1, x0
    // 0x3ffad4: ldur            x0, [fp, #-8]
    // 0x3ffad8: stur            x1, [fp, #-0x50]
    // 0x3ffadc: StoreField: r1->field_f = r0
    //     0x3ffadc: stur            w0, [x1, #0xf]
    // 0x3ffae0: r0 = 10
    //     0x3ffae0: mov             x0, #0xa
    // 0x3ffae4: StoreField: r1->field_b = r0
    //     0x3ffae4: stur            w0, [x1, #0xb]
    // 0x3ffae8: r0 = TextSpan()
    //     0x3ffae8: bl              #0x3031c8  ; AllocateTextSpanStub -> TextSpan (size=0x34)
    // 0x3ffaec: mov             x1, x0
    // 0x3ffaf0: ldur            x0, [fp, #-0x50]
    // 0x3ffaf4: StoreField: r1->field_f = r0
    //     0x3ffaf4: stur            w0, [x1, #0xf]
    // 0x3ffaf8: r5 = Instance__DeferringMouseCursor
    //     0x3ffaf8: ldr             x5, [PP, #0x2f38]  ; [pp+0x2f38] Obj!_DeferringMouseCursor@5d6e01
    // 0x3ffafc: ArrayStore: r1[0] = r5  ; List_4
    //     0x3ffafc: stur            w5, [x1, #0x17]
    // 0x3ffb00: mov             x3, x1
    // 0x3ffb04: mov             x0, x5
    // 0x3ffb08: b               #0x3ffcc8
    // 0x3ffb0c: mov             x4, x3
    // 0x3ffb10: ldur            x3, [fp, #-0x28]
    // 0x3ffb14: mov             x5, x0
    // 0x3ffb18: r0 = 10
    //     0x3ffb18: mov             x0, #0xa
    // 0x3ffb1c: cmp             x2, #0xf1
    // 0x3ffb20: b.ne            #0x3ffbb0
    // 0x3ffb24: mov             x2, x0
    // 0x3ffb28: r1 = Null
    //     0x3ffb28: mov             x1, NULL
    // 0x3ffb2c: r0 = AllocateArray()
    //     0x3ffb2c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ffb30: stur            x0, [fp, #-8]
    // 0x3ffb34: r16 = Instance_TextSpan
    //     0x3ffb34: add             x16, PP, #0x11, lsl #12  ; [pp+0x112a8] Obj!TextSpan@5d7e21
    //     0x3ffb38: ldr             x16, [x16, #0x2a8]
    // 0x3ffb3c: StoreField: r0->field_f = r16
    //     0x3ffb3c: stur            w16, [x0, #0xf]
    // 0x3ffb40: ldur            x3, [fp, #-0x28]
    // 0x3ffb44: StoreField: r0->field_13 = r3
    //     0x3ffb44: stur            w3, [x0, #0x13]
    // 0x3ffb48: r16 = Instance_TextSpan
    //     0x3ffb48: add             x16, PP, #0x11, lsl #12  ; [pp+0x11298] Obj!TextSpan@5d7ea1
    //     0x3ffb4c: ldr             x16, [x16, #0x298]
    // 0x3ffb50: ArrayStore: r0[0] = r16  ; List_4
    //     0x3ffb50: stur            w16, [x0, #0x17]
    // 0x3ffb54: ldur            x4, [fp, #-0x58]
    // 0x3ffb58: StoreField: r0->field_1b = r4
    //     0x3ffb58: stur            w4, [x0, #0x1b]
    // 0x3ffb5c: r16 = Instance_TextSpan
    //     0x3ffb5c: add             x16, PP, #0x11, lsl #12  ; [pp+0x112b0] Obj!TextSpan@5d7de1
    //     0x3ffb60: ldr             x16, [x16, #0x2b0]
    // 0x3ffb64: StoreField: r0->field_1f = r16
    //     0x3ffb64: stur            w16, [x0, #0x1f]
    // 0x3ffb68: r1 = <InlineSpan>
    //     0x3ffb68: add             x1, PP, #0x11, lsl #12  ; [pp+0x11268] TypeArguments: <InlineSpan>
    //     0x3ffb6c: ldr             x1, [x1, #0x268]
    // 0x3ffb70: r0 = AllocateGrowableArray()
    //     0x3ffb70: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3ffb74: mov             x1, x0
    // 0x3ffb78: ldur            x0, [fp, #-8]
    // 0x3ffb7c: stur            x1, [fp, #-0x50]
    // 0x3ffb80: StoreField: r1->field_f = r0
    //     0x3ffb80: stur            w0, [x1, #0xf]
    // 0x3ffb84: r0 = 10
    //     0x3ffb84: mov             x0, #0xa
    // 0x3ffb88: StoreField: r1->field_b = r0
    //     0x3ffb88: stur            w0, [x1, #0xb]
    // 0x3ffb8c: r0 = TextSpan()
    //     0x3ffb8c: bl              #0x3031c8  ; AllocateTextSpanStub -> TextSpan (size=0x34)
    // 0x3ffb90: mov             x1, x0
    // 0x3ffb94: ldur            x0, [fp, #-0x50]
    // 0x3ffb98: StoreField: r1->field_f = r0
    //     0x3ffb98: stur            w0, [x1, #0xf]
    // 0x3ffb9c: r5 = Instance__DeferringMouseCursor
    //     0x3ffb9c: ldr             x5, [PP, #0x2f38]  ; [pp+0x2f38] Obj!_DeferringMouseCursor@5d6e01
    // 0x3ffba0: ArrayStore: r1[0] = r5  ; List_4
    //     0x3ffba0: stur            w5, [x1, #0x17]
    // 0x3ffba4: mov             x3, x1
    // 0x3ffba8: mov             x0, x5
    // 0x3ffbac: b               #0x3ffcc8
    // 0x3ffbb0: cmp             x2, #0xf2
    // 0x3ffbb4: b.ne            #0x3ffc44
    // 0x3ffbb8: mov             x2, x0
    // 0x3ffbbc: r1 = Null
    //     0x3ffbbc: mov             x1, NULL
    // 0x3ffbc0: r0 = AllocateArray()
    //     0x3ffbc0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ffbc4: stur            x0, [fp, #-8]
    // 0x3ffbc8: r16 = Instance_TextSpan
    //     0x3ffbc8: add             x16, PP, #0x11, lsl #12  ; [pp+0x112b8] Obj!TextSpan@5d7da1
    //     0x3ffbcc: ldr             x16, [x16, #0x2b8]
    // 0x3ffbd0: StoreField: r0->field_f = r16
    //     0x3ffbd0: stur            w16, [x0, #0xf]
    // 0x3ffbd4: ldur            x3, [fp, #-0x28]
    // 0x3ffbd8: StoreField: r0->field_13 = r3
    //     0x3ffbd8: stur            w3, [x0, #0x13]
    // 0x3ffbdc: r16 = Instance_TextSpan
    //     0x3ffbdc: add             x16, PP, #0x11, lsl #12  ; [pp+0x11298] Obj!TextSpan@5d7ea1
    //     0x3ffbe0: ldr             x16, [x16, #0x298]
    // 0x3ffbe4: ArrayStore: r0[0] = r16  ; List_4
    //     0x3ffbe4: stur            w16, [x0, #0x17]
    // 0x3ffbe8: ldur            x4, [fp, #-0x58]
    // 0x3ffbec: StoreField: r0->field_1b = r4
    //     0x3ffbec: stur            w4, [x0, #0x1b]
    // 0x3ffbf0: r16 = Instance_TextSpan
    //     0x3ffbf0: add             x16, PP, #0x11, lsl #12  ; [pp+0x112c0] Obj!TextSpan@5d7d61
    //     0x3ffbf4: ldr             x16, [x16, #0x2c0]
    // 0x3ffbf8: StoreField: r0->field_1f = r16
    //     0x3ffbf8: stur            w16, [x0, #0x1f]
    // 0x3ffbfc: r1 = <InlineSpan>
    //     0x3ffbfc: add             x1, PP, #0x11, lsl #12  ; [pp+0x11268] TypeArguments: <InlineSpan>
    //     0x3ffc00: ldr             x1, [x1, #0x268]
    // 0x3ffc04: r0 = AllocateGrowableArray()
    //     0x3ffc04: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3ffc08: mov             x1, x0
    // 0x3ffc0c: ldur            x0, [fp, #-8]
    // 0x3ffc10: stur            x1, [fp, #-0x50]
    // 0x3ffc14: StoreField: r1->field_f = r0
    //     0x3ffc14: stur            w0, [x1, #0xf]
    // 0x3ffc18: r0 = 10
    //     0x3ffc18: mov             x0, #0xa
    // 0x3ffc1c: StoreField: r1->field_b = r0
    //     0x3ffc1c: stur            w0, [x1, #0xb]
    // 0x3ffc20: r0 = TextSpan()
    //     0x3ffc20: bl              #0x3031c8  ; AllocateTextSpanStub -> TextSpan (size=0x34)
    // 0x3ffc24: mov             x1, x0
    // 0x3ffc28: ldur            x0, [fp, #-0x50]
    // 0x3ffc2c: StoreField: r1->field_f = r0
    //     0x3ffc2c: stur            w0, [x1, #0xf]
    // 0x3ffc30: r5 = Instance__DeferringMouseCursor
    //     0x3ffc30: ldr             x5, [PP, #0x2f38]  ; [pp+0x2f38] Obj!_DeferringMouseCursor@5d6e01
    // 0x3ffc34: ArrayStore: r1[0] = r5  ; List_4
    //     0x3ffc34: stur            w5, [x1, #0x17]
    // 0x3ffc38: mov             x3, x1
    // 0x3ffc3c: mov             x0, x5
    // 0x3ffc40: b               #0x3ffcc8
    // 0x3ffc44: mov             x2, x0
    // 0x3ffc48: r1 = Null
    //     0x3ffc48: mov             x1, NULL
    // 0x3ffc4c: r0 = AllocateArray()
    //     0x3ffc4c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ffc50: stur            x0, [fp, #-8]
    // 0x3ffc54: r16 = Instance_TextSpan
    //     0x3ffc54: add             x16, PP, #0x11, lsl #12  ; [pp+0x112c8] Obj!TextSpan@5d7d21
    //     0x3ffc58: ldr             x16, [x16, #0x2c8]
    // 0x3ffc5c: StoreField: r0->field_f = r16
    //     0x3ffc5c: stur            w16, [x0, #0xf]
    // 0x3ffc60: ldur            x1, [fp, #-0x28]
    // 0x3ffc64: StoreField: r0->field_13 = r1
    //     0x3ffc64: stur            w1, [x0, #0x13]
    // 0x3ffc68: r16 = Instance_TextSpan
    //     0x3ffc68: add             x16, PP, #0x11, lsl #12  ; [pp+0x112d0] Obj!TextSpan@5d7ce1
    //     0x3ffc6c: ldr             x16, [x16, #0x2d0]
    // 0x3ffc70: ArrayStore: r0[0] = r16  ; List_4
    //     0x3ffc70: stur            w16, [x0, #0x17]
    // 0x3ffc74: ldur            x1, [fp, #-0x58]
    // 0x3ffc78: StoreField: r0->field_1b = r1
    //     0x3ffc78: stur            w1, [x0, #0x1b]
    // 0x3ffc7c: r16 = Instance_TextSpan
    //     0x3ffc7c: add             x16, PP, #0x11, lsl #12  ; [pp+0x112d8] Obj!TextSpan@5d7ca1
    //     0x3ffc80: ldr             x16, [x16, #0x2d8]
    // 0x3ffc84: StoreField: r0->field_1f = r16
    //     0x3ffc84: stur            w16, [x0, #0x1f]
    // 0x3ffc88: r1 = <InlineSpan>
    //     0x3ffc88: add             x1, PP, #0x11, lsl #12  ; [pp+0x11268] TypeArguments: <InlineSpan>
    //     0x3ffc8c: ldr             x1, [x1, #0x268]
    // 0x3ffc90: r0 = AllocateGrowableArray()
    //     0x3ffc90: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3ffc94: mov             x1, x0
    // 0x3ffc98: ldur            x0, [fp, #-8]
    // 0x3ffc9c: stur            x1, [fp, #-0x28]
    // 0x3ffca0: StoreField: r1->field_f = r0
    //     0x3ffca0: stur            w0, [x1, #0xf]
    // 0x3ffca4: r0 = 10
    //     0x3ffca4: mov             x0, #0xa
    // 0x3ffca8: StoreField: r1->field_b = r0
    //     0x3ffca8: stur            w0, [x1, #0xb]
    // 0x3ffcac: r0 = TextSpan()
    //     0x3ffcac: bl              #0x3031c8  ; AllocateTextSpanStub -> TextSpan (size=0x34)
    // 0x3ffcb0: mov             x1, x0
    // 0x3ffcb4: ldur            x0, [fp, #-0x28]
    // 0x3ffcb8: StoreField: r1->field_f = r0
    //     0x3ffcb8: stur            w0, [x1, #0xf]
    // 0x3ffcbc: r0 = Instance__DeferringMouseCursor
    //     0x3ffcbc: ldr             x0, [PP, #0x2f38]  ; [pp+0x2f38] Obj!_DeferringMouseCursor@5d6e01
    // 0x3ffcc0: ArrayStore: r1[0] = r0  ; List_4
    //     0x3ffcc0: stur            w0, [x1, #0x17]
    // 0x3ffcc4: mov             x3, x1
    // 0x3ffcc8: ldur            x2, [fp, #-0x30]
    // 0x3ffccc: stur            x3, [fp, #-8]
    // 0x3ffcd0: LoadField: r1 = r2->field_b
    //     0x3ffcd0: ldur            w1, [x2, #0xb]
    // 0x3ffcd4: LoadField: r4 = r2->field_f
    //     0x3ffcd4: ldur            w4, [x2, #0xf]
    // 0x3ffcd8: DecompressPointer r4
    //     0x3ffcd8: add             x4, x4, HEAP, lsl #32
    // 0x3ffcdc: LoadField: r5 = r4->field_b
    //     0x3ffcdc: ldur            w5, [x4, #0xb]
    // 0x3ffce0: r4 = LoadInt32Instr(r1)
    //     0x3ffce0: sbfx            x4, x1, #1, #0x1f
    // 0x3ffce4: stur            x4, [fp, #-0x60]
    // 0x3ffce8: r1 = LoadInt32Instr(r5)
    //     0x3ffce8: sbfx            x1, x5, #1, #0x1f
    // 0x3ffcec: cmp             x4, x1
    // 0x3ffcf0: b.ne            #0x3ffcfc
    // 0x3ffcf4: mov             x1, x2
    // 0x3ffcf8: r0 = _growToNextCapacity()
    //     0x3ffcf8: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3ffcfc: ldur            x2, [fp, #-0x30]
    // 0x3ffd00: ldur            x3, [fp, #-0x60]
    // 0x3ffd04: add             x0, x3, #1
    // 0x3ffd08: lsl             x1, x0, #1
    // 0x3ffd0c: StoreField: r2->field_b = r1
    //     0x3ffd0c: stur            w1, [x2, #0xb]
    // 0x3ffd10: LoadField: r1 = r2->field_f
    //     0x3ffd10: ldur            w1, [x2, #0xf]
    // 0x3ffd14: DecompressPointer r1
    //     0x3ffd14: add             x1, x1, HEAP, lsl #32
    // 0x3ffd18: ldur            x0, [fp, #-8]
    // 0x3ffd1c: ArrayStore: r1[r3] = r0  ; List_4
    //     0x3ffd1c: add             x25, x1, x3, lsl #2
    //     0x3ffd20: add             x25, x25, #0xf
    //     0x3ffd24: str             w0, [x25]
    //     0x3ffd28: tbz             w0, #0, #0x3ffd44
    //     0x3ffd2c: ldurb           w16, [x1, #-1]
    //     0x3ffd30: ldurb           w17, [x0, #-1]
    //     0x3ffd34: and             x16, x17, x16, lsr #2
    //     0x3ffd38: tst             x16, HEAP, lsr #32
    //     0x3ffd3c: b.eq            #0x3ffd44
    //     0x3ffd40: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3ffd44: b               #0x400024
    // 0x3ffd48: ldur            x2, [fp, #-0x30]
    // 0x3ffd4c: mov             x4, x0
    // 0x3ffd50: b               #0x3ffd5c
    // 0x3ffd54: ldur            x2, [fp, #-0x30]
    // 0x3ffd58: mov             x4, x0
    // 0x3ffd5c: r16 = <AppLocale, Translations>
    //     0x3ffd5c: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x3ffd60: ldur            lr, [fp, #-0x20]
    // 0x3ffd64: stp             lr, x16, [SP]
    // 0x3ffd68: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x3ffd68: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x3ffd6c: r0 = LocaleSettingsExt.currentTranslations()
    //     0x3ffd6c: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x3ffd70: r1 = LoadClassIdInstr(r0)
    //     0x3ffd70: ldur            x1, [x0, #-1]
    //     0x3ffd74: ubfx            x1, x1, #0xc, #0x14
    // 0x3ffd78: cmp             x1, #0x8dd
    // 0x3ffd7c: b.ne            #0x3ffda8
    // 0x3ffd80: mov             x1, x0
    // 0x3ffd84: LoadField: r0 = r1->field_1b
    //     0x3ffd84: ldur            w0, [x1, #0x1b]
    // 0x3ffd88: DecompressPointer r0
    //     0x3ffd88: add             x0, x0, HEAP, lsl #32
    // 0x3ffd8c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ffd90: cmp             w0, w16
    // 0x3ffd94: b.ne            #0x3ffda4
    // 0x3ffd98: r2 = gameOverPage
    //     0x3ffd98: add             x2, PP, #0x11, lsl #12  ; [pp+0x11220] Field <Translations.gameOverPage>: late final (offset: 0x1c)
    //     0x3ffd9c: ldr             x2, [x2, #0x220]
    // 0x3ffda0: r0 = InitLateFinalInstanceField()
    //     0x3ffda0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ffda4: b               #0x3ffe2c
    // 0x3ffda8: cmp             x1, #0x8df
    // 0x3ffdac: b.ne            #0x3ffdd8
    // 0x3ffdb0: mov             x1, x0
    // 0x3ffdb4: LoadField: r0 = r1->field_3f
    //     0x3ffdb4: ldur            w0, [x1, #0x3f]
    // 0x3ffdb8: DecompressPointer r0
    //     0x3ffdb8: add             x0, x0, HEAP, lsl #32
    // 0x3ffdbc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ffdc0: cmp             w0, w16
    // 0x3ffdc4: b.ne            #0x3ffdd4
    // 0x3ffdc8: r2 = gameOverPage
    //     0x3ffdc8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11228] Field <TranslationsRu.gameOverPage>: late final (offset: 0x40)
    //     0x3ffdcc: ldr             x2, [x2, #0x228]
    // 0x3ffdd0: r0 = InitLateFinalInstanceField()
    //     0x3ffdd0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ffdd4: b               #0x3ffe2c
    // 0x3ffdd8: cmp             x1, #0x8e0
    // 0x3ffddc: b.ne            #0x3ffe08
    // 0x3ffde0: mov             x1, x0
    // 0x3ffde4: LoadField: r0 = r1->field_3f
    //     0x3ffde4: ldur            w0, [x1, #0x3f]
    // 0x3ffde8: DecompressPointer r0
    //     0x3ffde8: add             x0, x0, HEAP, lsl #32
    // 0x3ffdec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ffdf0: cmp             w0, w16
    // 0x3ffdf4: b.ne            #0x3ffe04
    // 0x3ffdf8: r2 = gameOverPage
    //     0x3ffdf8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11230] Field <TranslationsKk.gameOverPage>: late final (offset: 0x40)
    //     0x3ffdfc: ldr             x2, [x2, #0x230]
    // 0x3ffe00: r0 = InitLateFinalInstanceField()
    //     0x3ffe00: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ffe04: b               #0x3ffe2c
    // 0x3ffe08: mov             x1, x0
    // 0x3ffe0c: LoadField: r0 = r1->field_3f
    //     0x3ffe0c: ldur            w0, [x1, #0x3f]
    // 0x3ffe10: DecompressPointer r0
    //     0x3ffe10: add             x0, x0, HEAP, lsl #32
    // 0x3ffe14: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ffe18: cmp             w0, w16
    // 0x3ffe1c: b.ne            #0x3ffe2c
    // 0x3ffe20: r2 = gameOverPage
    //     0x3ffe20: add             x2, PP, #0x11, lsl #12  ; [pp+0x11238] Field <TranslationsEs.gameOverPage>: late final (offset: 0x40)
    //     0x3ffe24: ldr             x2, [x2, #0x238]
    // 0x3ffe28: r0 = InitLateFinalInstanceField()
    //     0x3ffe28: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ffe2c: r1 = LoadClassIdInstr(r0)
    //     0x3ffe2c: ldur            x1, [x0, #-1]
    //     0x3ffe30: ubfx            x1, x1, #0xc, #0x14
    // 0x3ffe34: cmp             x1, #0xf0
    // 0x3ffe38: b.ne            #0x3ffe90
    // 0x3ffe3c: ldur            x0, [fp, #-0x40]
    // 0x3ffe40: r1 = Null
    //     0x3ffe40: mov             x1, NULL
    // 0x3ffe44: r2 = 6
    //     0x3ffe44: mov             x2, #6
    // 0x3ffe48: r0 = AllocateArray()
    //     0x3ffe48: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ffe4c: mov             x2, x0
    // 0x3ffe50: r16 = "You scored "
    //     0x3ffe50: add             x16, PP, #0x11, lsl #12  ; [pp+0x112e0] "You scored "
    //     0x3ffe54: ldr             x16, [x16, #0x2e0]
    // 0x3ffe58: StoreField: r2->field_f = r16
    //     0x3ffe58: stur            w16, [x2, #0xf]
    // 0x3ffe5c: ldur            x3, [fp, #-0x40]
    // 0x3ffe60: r0 = BoxInt64Instr(r3)
    //     0x3ffe60: sbfiz           x0, x3, #1, #0x1f
    //     0x3ffe64: cmp             x3, x0, asr #1
    //     0x3ffe68: b.eq            #0x3ffe74
    //     0x3ffe6c: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3ffe70: stur            x3, [x0, #7]
    // 0x3ffe74: StoreField: r2->field_13 = r0
    //     0x3ffe74: stur            w0, [x2, #0x13]
    // 0x3ffe78: r16 = " points!"
    //     0x3ffe78: add             x16, PP, #0x11, lsl #12  ; [pp+0x112e8] " points!"
    //     0x3ffe7c: ldr             x16, [x16, #0x2e8]
    // 0x3ffe80: ArrayStore: r2[0] = r16  ; List_4
    //     0x3ffe80: stur            w16, [x2, #0x17]
    // 0x3ffe84: str             x2, [SP]
    // 0x3ffe88: r0 = _interpolate()
    //     0x3ffe88: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x3ffe8c: b               #0x3fff88
    // 0x3ffe90: ldur            x3, [fp, #-0x40]
    // 0x3ffe94: cmp             x1, #0xf1
    // 0x3ffe98: b.ne            #0x3ffeec
    // 0x3ffe9c: r1 = Null
    //     0x3ffe9c: mov             x1, NULL
    // 0x3ffea0: r2 = 6
    //     0x3ffea0: mov             x2, #6
    // 0x3ffea4: r0 = AllocateArray()
    //     0x3ffea4: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ffea8: mov             x2, x0
    // 0x3ffeac: r16 = "Вы заработали "
    //     0x3ffeac: add             x16, PP, #0x11, lsl #12  ; [pp+0x112f0] "Вы заработали "
    //     0x3ffeb0: ldr             x16, [x16, #0x2f0]
    // 0x3ffeb4: StoreField: r2->field_f = r16
    //     0x3ffeb4: stur            w16, [x2, #0xf]
    // 0x3ffeb8: ldur            x3, [fp, #-0x40]
    // 0x3ffebc: r0 = BoxInt64Instr(r3)
    //     0x3ffebc: sbfiz           x0, x3, #1, #0x1f
    //     0x3ffec0: cmp             x3, x0, asr #1
    //     0x3ffec4: b.eq            #0x3ffed0
    //     0x3ffec8: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3ffecc: stur            x3, [x0, #7]
    // 0x3ffed0: StoreField: r2->field_13 = r0
    //     0x3ffed0: stur            w0, [x2, #0x13]
    // 0x3ffed4: r16 = " очков!"
    //     0x3ffed4: add             x16, PP, #0x11, lsl #12  ; [pp+0x112f8] " очков!"
    //     0x3ffed8: ldr             x16, [x16, #0x2f8]
    // 0x3ffedc: ArrayStore: r2[0] = r16  ; List_4
    //     0x3ffedc: stur            w16, [x2, #0x17]
    // 0x3ffee0: str             x2, [SP]
    // 0x3ffee4: r0 = _interpolate()
    //     0x3ffee4: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x3ffee8: b               #0x3fff88
    // 0x3ffeec: cmp             x1, #0xf2
    // 0x3ffef0: b.ne            #0x3fff3c
    // 0x3ffef4: r0 = BoxInt64Instr(r3)
    //     0x3ffef4: sbfiz           x0, x3, #1, #0x1f
    //     0x3ffef8: cmp             x3, x0, asr #1
    //     0x3ffefc: b.eq            #0x3fff08
    //     0x3fff00: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3fff04: stur            x3, [x0, #7]
    // 0x3fff08: r1 = Null
    //     0x3fff08: mov             x1, NULL
    // 0x3fff0c: r2 = 4
    //     0x3fff0c: mov             x2, #4
    // 0x3fff10: stur            x0, [fp, #-8]
    // 0x3fff14: r0 = AllocateArray()
    //     0x3fff14: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3fff18: mov             x1, x0
    // 0x3fff1c: ldur            x0, [fp, #-8]
    // 0x3fff20: StoreField: r1->field_f = r0
    //     0x3fff20: stur            w0, [x1, #0xf]
    // 0x3fff24: r16 = " ұпай жинадыңыз!"
    //     0x3fff24: add             x16, PP, #0x11, lsl #12  ; [pp+0x11300] " ұпай жинадыңыз!"
    //     0x3fff28: ldr             x16, [x16, #0x300]
    // 0x3fff2c: StoreField: r1->field_13 = r16
    //     0x3fff2c: stur            w16, [x1, #0x13]
    // 0x3fff30: str             x1, [SP]
    // 0x3fff34: r0 = _interpolate()
    //     0x3fff34: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x3fff38: b               #0x3fff88
    // 0x3fff3c: r1 = Null
    //     0x3fff3c: mov             x1, NULL
    // 0x3fff40: r2 = 6
    //     0x3fff40: mov             x2, #6
    // 0x3fff44: r0 = AllocateArray()
    //     0x3fff44: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3fff48: mov             x2, x0
    // 0x3fff4c: r16 = "¡Obtuviste "
    //     0x3fff4c: add             x16, PP, #0x11, lsl #12  ; [pp+0x11308] "¡Obtuviste "
    //     0x3fff50: ldr             x16, [x16, #0x308]
    // 0x3fff54: StoreField: r2->field_f = r16
    //     0x3fff54: stur            w16, [x2, #0xf]
    // 0x3fff58: ldur            x3, [fp, #-0x40]
    // 0x3fff5c: r0 = BoxInt64Instr(r3)
    //     0x3fff5c: sbfiz           x0, x3, #1, #0x1f
    //     0x3fff60: cmp             x3, x0, asr #1
    //     0x3fff64: b.eq            #0x3fff70
    //     0x3fff68: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3fff6c: stur            x3, [x0, #7]
    // 0x3fff70: StoreField: r2->field_13 = r0
    //     0x3fff70: stur            w0, [x2, #0x13]
    // 0x3fff74: r16 = " puntos!"
    //     0x3fff74: add             x16, PP, #0x11, lsl #12  ; [pp+0x11310] " puntos!"
    //     0x3fff78: ldr             x16, [x16, #0x310]
    // 0x3fff7c: ArrayStore: r2[0] = r16  ; List_4
    //     0x3fff7c: stur            w16, [x2, #0x17]
    // 0x3fff80: str             x2, [SP]
    // 0x3fff84: r0 = _interpolate()
    //     0x3fff84: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x3fff88: ldur            x1, [fp, #-0x30]
    // 0x3fff8c: stur            x0, [fp, #-8]
    // 0x3fff90: r0 = TextSpan()
    //     0x3fff90: bl              #0x3031c8  ; AllocateTextSpanStub -> TextSpan (size=0x34)
    // 0x3fff94: mov             x2, x0
    // 0x3fff98: ldur            x0, [fp, #-8]
    // 0x3fff9c: stur            x2, [fp, #-0x28]
    // 0x3fffa0: StoreField: r2->field_b = r0
    //     0x3fffa0: stur            w0, [x2, #0xb]
    // 0x3fffa4: r0 = Instance__DeferringMouseCursor
    //     0x3fffa4: ldr             x0, [PP, #0x2f38]  ; [pp+0x2f38] Obj!_DeferringMouseCursor@5d6e01
    // 0x3fffa8: ArrayStore: r2[0] = r0  ; List_4
    //     0x3fffa8: stur            w0, [x2, #0x17]
    // 0x3fffac: ldur            x3, [fp, #-0x30]
    // 0x3fffb0: LoadField: r1 = r3->field_b
    //     0x3fffb0: ldur            w1, [x3, #0xb]
    // 0x3fffb4: LoadField: r4 = r3->field_f
    //     0x3fffb4: ldur            w4, [x3, #0xf]
    // 0x3fffb8: DecompressPointer r4
    //     0x3fffb8: add             x4, x4, HEAP, lsl #32
    // 0x3fffbc: LoadField: r5 = r4->field_b
    //     0x3fffbc: ldur            w5, [x4, #0xb]
    // 0x3fffc0: r4 = LoadInt32Instr(r1)
    //     0x3fffc0: sbfx            x4, x1, #1, #0x1f
    // 0x3fffc4: stur            x4, [fp, #-0x40]
    // 0x3fffc8: r1 = LoadInt32Instr(r5)
    //     0x3fffc8: sbfx            x1, x5, #1, #0x1f
    // 0x3fffcc: cmp             x4, x1
    // 0x3fffd0: b.ne            #0x3fffdc
    // 0x3fffd4: mov             x1, x3
    // 0x3fffd8: r0 = _growToNextCapacity()
    //     0x3fffd8: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3fffdc: ldur            x2, [fp, #-0x30]
    // 0x3fffe0: ldur            x3, [fp, #-0x40]
    // 0x3fffe4: add             x0, x3, #1
    // 0x3fffe8: lsl             x1, x0, #1
    // 0x3fffec: StoreField: r2->field_b = r1
    //     0x3fffec: stur            w1, [x2, #0xb]
    // 0x3ffff0: LoadField: r1 = r2->field_f
    //     0x3ffff0: ldur            w1, [x2, #0xf]
    // 0x3ffff4: DecompressPointer r1
    //     0x3ffff4: add             x1, x1, HEAP, lsl #32
    // 0x3ffff8: ldur            x0, [fp, #-0x28]
    // 0x3ffffc: ArrayStore: r1[r3] = r0  ; List_4
    //     0x3ffffc: add             x25, x1, x3, lsl #2
    //     0x400000: add             x25, x25, #0xf
    //     0x400004: str             w0, [x25]
    //     0x400008: tbz             w0, #0, #0x400024
    //     0x40000c: ldurb           w16, [x1, #-1]
    //     0x400010: ldurb           w17, [x0, #-1]
    //     0x400014: and             x16, x17, x16, lsr #2
    //     0x400018: tst             x16, HEAP, lsr #32
    //     0x40001c: b.eq            #0x400024
    //     0x400020: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x400024: ldur            x3, [fp, #-0x38]
    // 0x400028: ldur            x1, [fp, #-0x10]
    // 0x40002c: ldur            x0, [fp, #-0x48]
    // 0x400030: r0 = TextSpan()
    //     0x400030: bl              #0x3031c8  ; AllocateTextSpanStub -> TextSpan (size=0x34)
    // 0x400034: mov             x1, x0
    // 0x400038: ldur            x0, [fp, #-0x30]
    // 0x40003c: stur            x1, [fp, #-8]
    // 0x400040: StoreField: r1->field_f = r0
    //     0x400040: stur            w0, [x1, #0xf]
    // 0x400044: r0 = Instance__DeferringMouseCursor
    //     0x400044: ldr             x0, [PP, #0x2f38]  ; [pp+0x2f38] Obj!_DeferringMouseCursor@5d6e01
    // 0x400048: ArrayStore: r1[0] = r0  ; List_4
    //     0x400048: stur            w0, [x1, #0x17]
    // 0x40004c: ldur            x0, [fp, #-0x10]
    // 0x400050: StoreField: r1->field_7 = r0
    //     0x400050: stur            w0, [x1, #7]
    // 0x400054: r0 = Text()
    //     0x400054: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x400058: mov             x1, x0
    // 0x40005c: ldur            x0, [fp, #-8]
    // 0x400060: stur            x1, [fp, #-0x10]
    // 0x400064: StoreField: r1->field_f = r0
    //     0x400064: stur            w0, [x1, #0xf]
    // 0x400068: r0 = Instance_TextAlign
    //     0x400068: add             x0, PP, #0x11, lsl #12  ; [pp+0x11318] Obj!TextAlign@5dc011
    //     0x40006c: ldr             x0, [x0, #0x318]
    // 0x400070: StoreField: r1->field_1b = r0
    //     0x400070: stur            w0, [x1, #0x1b]
    // 0x400074: r0 = SizedBox()
    //     0x400074: bl              #0x363c60  ; AllocateSizedBoxStub -> SizedBox (size=0x18)
    // 0x400078: mov             x1, x0
    // 0x40007c: r0 = 300.000000
    //     0x40007c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11320] 300
    //     0x400080: ldr             x0, [x0, #0x320]
    // 0x400084: StoreField: r1->field_f = r0
    //     0x400084: stur            w0, [x1, #0xf]
    // 0x400088: ldur            x0, [fp, #-0x10]
    // 0x40008c: StoreField: r1->field_b = r0
    //     0x40008c: stur            w0, [x1, #0xb]
    // 0x400090: mov             x0, x1
    // 0x400094: ldur            x1, [fp, #-0x38]
    // 0x400098: ArrayStore: r1[2] = r0  ; List_4
    //     0x400098: add             x25, x1, #0x17
    //     0x40009c: str             w0, [x25]
    //     0x4000a0: tbz             w0, #0, #0x4000bc
    //     0x4000a4: ldurb           w16, [x1, #-1]
    //     0x4000a8: ldurb           w17, [x0, #-1]
    //     0x4000ac: and             x16, x17, x16, lsr #2
    //     0x4000b0: tst             x16, HEAP, lsr #32
    //     0x4000b4: b.eq            #0x4000bc
    //     0x4000b8: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x4000bc: ldur            x0, [fp, #-0x38]
    // 0x4000c0: r16 = Instance_SizedBox
    //     0x4000c0: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x4000c4: ldr             x16, [x16, #0xfd8]
    // 0x4000c8: StoreField: r0->field_1b = r16
    //     0x4000c8: stur            w16, [x0, #0x1b]
    // 0x4000cc: ldur            x1, [fp, #-0x48]
    // 0x4000d0: LoadField: r2 = r1->field_2b
    //     0x4000d0: ldur            w2, [x1, #0x2b]
    // 0x4000d4: DecompressPointer r2
    //     0x4000d4: add             x2, x2, HEAP, lsl #32
    // 0x4000d8: stur            x2, [fp, #-8]
    // 0x4000dc: r1 = <int>
    //     0x4000dc: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x4000e0: r0 = ValueListenableBuilder()
    //     0x4000e0: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x4000e4: mov             x3, x0
    // 0x4000e8: ldur            x0, [fp, #-8]
    // 0x4000ec: stur            x3, [fp, #-0x10]
    // 0x4000f0: StoreField: r3->field_f = r0
    //     0x4000f0: stur            w0, [x3, #0xf]
    // 0x4000f4: r1 = Function '<anonymous closure>':.
    //     0x4000f4: add             x1, PP, #0x11, lsl #12  ; [pp+0x11328] AnonymousClosure: (0x40079c), in [package:ricochlime/pages/game_over.dart] GameOverDialog::build (0x3ff5d4)
    //     0x4000f8: ldr             x1, [x1, #0x328]
    // 0x4000fc: r2 = Null
    //     0x4000fc: mov             x2, NULL
    // 0x400100: r0 = AllocateClosure()
    //     0x400100: bl              #0x5838bc  ; AllocateClosureStub
    // 0x400104: mov             x1, x0
    // 0x400108: ldur            x0, [fp, #-0x10]
    // 0x40010c: StoreField: r0->field_13 = r1
    //     0x40010c: stur            w1, [x0, #0x13]
    // 0x400110: r1 = Instance_CoinIcon
    //     0x400110: add             x1, PP, #0x11, lsl #12  ; [pp+0x11330] Obj!CoinIcon@5d8041
    //     0x400114: ldr             x1, [x1, #0x330]
    // 0x400118: ArrayStore: r0[0] = r1  ; List_4
    //     0x400118: stur            w1, [x0, #0x17]
    // 0x40011c: ldur            x1, [fp, #-0x38]
    // 0x400120: ArrayStore: r1[4] = r0  ; List_4
    //     0x400120: add             x25, x1, #0x1f
    //     0x400124: str             w0, [x25]
    //     0x400128: tbz             w0, #0, #0x400144
    //     0x40012c: ldurb           w16, [x1, #-1]
    //     0x400130: ldurb           w17, [x0, #-1]
    //     0x400134: and             x16, x17, x16, lsr #2
    //     0x400138: tst             x16, HEAP, lsr #32
    //     0x40013c: b.eq            #0x400144
    //     0x400140: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x400144: ldur            x1, [fp, #-0x38]
    // 0x400148: r16 = Instance_SizedBox
    //     0x400148: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x40014c: ldr             x16, [x16, #0xfd8]
    // 0x400150: StoreField: r1->field_23 = r16
    //     0x400150: stur            w16, [x1, #0x23]
    // 0x400154: r0 = LoadStaticField(0xc74)
    //     0x400154: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x400158: ldr             x0, [x0, #0x18e8]
    // 0x40015c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400160: cmp             w0, w16
    // 0x400164: b.ne            #0x400174
    // 0x400168: r2 = NesIcons
    //     0x400168: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x40016c: ldr             x2, [x2, #0xf70]
    // 0x400170: r0 = InitLateFinalStaticField()
    //     0x400170: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x400174: mov             x1, x0
    // 0x400178: stur            x0, [fp, #-8]
    // 0x40017c: LoadField: r0 = r1->field_1b
    //     0x40017c: ldur            w0, [x1, #0x1b]
    // 0x400180: DecompressPointer r0
    //     0x400180: add             x0, x0, HEAP, lsl #32
    // 0x400184: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400188: cmp             w0, w16
    // 0x40018c: b.ne            #0x40019c
    // 0x400190: r2 = redo
    //     0x400190: add             x2, PP, #0x11, lsl #12  ; [pp+0x11338] Field <NesIconCollection.redo>: late final (offset: 0x1c)
    //     0x400194: ldr             x2, [x2, #0x338]
    // 0x400198: r0 = InitLateFinalInstanceField()
    //     0x400198: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40019c: stur            x0, [fp, #-0x10]
    // 0x4001a0: r0 = NesIcon()
    //     0x4001a0: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x4001a4: mov             x1, x0
    // 0x4001a8: ldur            x0, [fp, #-0x10]
    // 0x4001ac: stur            x1, [fp, #-0x28]
    // 0x4001b0: StoreField: r1->field_b = r0
    //     0x4001b0: stur            w0, [x1, #0xb]
    // 0x4001b4: r16 = <AppLocale, Translations>
    //     0x4001b4: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4001b8: ldur            lr, [fp, #-0x20]
    // 0x4001bc: stp             lr, x16, [SP]
    // 0x4001c0: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x4001c0: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x4001c4: r0 = LocaleSettingsExt.currentTranslations()
    //     0x4001c4: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x4001c8: r1 = LoadClassIdInstr(r0)
    //     0x4001c8: ldur            x1, [x0, #-1]
    //     0x4001cc: ubfx            x1, x1, #0xc, #0x14
    // 0x4001d0: cmp             x1, #0x8dd
    // 0x4001d4: b.ne            #0x400200
    // 0x4001d8: mov             x1, x0
    // 0x4001dc: LoadField: r0 = r1->field_1b
    //     0x4001dc: ldur            w0, [x1, #0x1b]
    // 0x4001e0: DecompressPointer r0
    //     0x4001e0: add             x0, x0, HEAP, lsl #32
    // 0x4001e4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4001e8: cmp             w0, w16
    // 0x4001ec: b.ne            #0x4001fc
    // 0x4001f0: r2 = gameOverPage
    //     0x4001f0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11220] Field <Translations.gameOverPage>: late final (offset: 0x1c)
    //     0x4001f4: ldr             x2, [x2, #0x220]
    // 0x4001f8: r0 = InitLateFinalInstanceField()
    //     0x4001f8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4001fc: b               #0x400284
    // 0x400200: cmp             x1, #0x8df
    // 0x400204: b.ne            #0x400230
    // 0x400208: mov             x1, x0
    // 0x40020c: LoadField: r0 = r1->field_3f
    //     0x40020c: ldur            w0, [x1, #0x3f]
    // 0x400210: DecompressPointer r0
    //     0x400210: add             x0, x0, HEAP, lsl #32
    // 0x400214: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400218: cmp             w0, w16
    // 0x40021c: b.ne            #0x40022c
    // 0x400220: r2 = gameOverPage
    //     0x400220: add             x2, PP, #0x11, lsl #12  ; [pp+0x11228] Field <TranslationsRu.gameOverPage>: late final (offset: 0x40)
    //     0x400224: ldr             x2, [x2, #0x228]
    // 0x400228: r0 = InitLateFinalInstanceField()
    //     0x400228: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40022c: b               #0x400284
    // 0x400230: cmp             x1, #0x8e0
    // 0x400234: b.ne            #0x400260
    // 0x400238: mov             x1, x0
    // 0x40023c: LoadField: r0 = r1->field_3f
    //     0x40023c: ldur            w0, [x1, #0x3f]
    // 0x400240: DecompressPointer r0
    //     0x400240: add             x0, x0, HEAP, lsl #32
    // 0x400244: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400248: cmp             w0, w16
    // 0x40024c: b.ne            #0x40025c
    // 0x400250: r2 = gameOverPage
    //     0x400250: add             x2, PP, #0x11, lsl #12  ; [pp+0x11230] Field <TranslationsKk.gameOverPage>: late final (offset: 0x40)
    //     0x400254: ldr             x2, [x2, #0x230]
    // 0x400258: r0 = InitLateFinalInstanceField()
    //     0x400258: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40025c: b               #0x400284
    // 0x400260: mov             x1, x0
    // 0x400264: LoadField: r0 = r1->field_3f
    //     0x400264: ldur            w0, [x1, #0x3f]
    // 0x400268: DecompressPointer r0
    //     0x400268: add             x0, x0, HEAP, lsl #32
    // 0x40026c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400270: cmp             w0, w16
    // 0x400274: b.ne            #0x400284
    // 0x400278: r2 = gameOverPage
    //     0x400278: add             x2, PP, #0x11, lsl #12  ; [pp+0x11238] Field <TranslationsEs.gameOverPage>: late final (offset: 0x40)
    //     0x40027c: ldr             x2, [x2, #0x238]
    // 0x400280: r0 = InitLateFinalInstanceField()
    //     0x400280: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400284: r1 = LoadClassIdInstr(r0)
    //     0x400284: ldur            x1, [x0, #-1]
    //     0x400288: ubfx            x1, x1, #0xc, #0x14
    // 0x40028c: cmp             x1, #0xf0
    // 0x400290: b.ne            #0x4002a0
    // 0x400294: r4 = "Restart game"
    //     0x400294: add             x4, PP, #0x11, lsl #12  ; [pp+0x11340] "Restart game"
    //     0x400298: ldr             x4, [x4, #0x340]
    // 0x40029c: b               #0x4002d0
    // 0x4002a0: cmp             x1, #0xf1
    // 0x4002a4: b.ne            #0x4002b4
    // 0x4002a8: r4 = "Перезапустить игру"
    //     0x4002a8: add             x4, PP, #0x11, lsl #12  ; [pp+0x11348] "Перезапустить игру"
    //     0x4002ac: ldr             x4, [x4, #0x348]
    // 0x4002b0: b               #0x4002d0
    // 0x4002b4: cmp             x1, #0xf2
    // 0x4002b8: b.ne            #0x4002c8
    // 0x4002bc: r4 = "Жаңадан бастау"
    //     0x4002bc: add             x4, PP, #0x11, lsl #12  ; [pp+0x11350] "Жаңадан бастау"
    //     0x4002c0: ldr             x4, [x4, #0x350]
    // 0x4002c4: b               #0x4002d0
    // 0x4002c8: r4 = "Reinicia el juego"
    //     0x4002c8: add             x4, PP, #0x11, lsl #12  ; [pp+0x11358] "Reinicia el juego"
    //     0x4002cc: ldr             x4, [x4, #0x358]
    // 0x4002d0: ldur            x3, [fp, #-0x38]
    // 0x4002d4: ldur            x0, [fp, #-0x28]
    // 0x4002d8: ldur            x2, [fp, #-0x18]
    // 0x4002dc: stur            x4, [fp, #-0x10]
    // 0x4002e0: r1 = Function '<anonymous closure>':.
    //     0x4002e0: add             x1, PP, #0x11, lsl #12  ; [pp+0x11360] AnonymousClosure: (0x40072c), in [package:ricochlime/pages/game_over.dart] GameOverDialog::build (0x3ff5d4)
    //     0x4002e4: ldr             x1, [x1, #0x360]
    // 0x4002e8: r0 = AllocateClosure()
    //     0x4002e8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x4002ec: stur            x0, [fp, #-0x30]
    // 0x4002f0: r0 = DialogButton()
    //     0x4002f0: bl              #0x400698  ; AllocateDialogButtonStub -> DialogButton (size=0x20)
    // 0x4002f4: mov             x1, x0
    // 0x4002f8: ldur            x0, [fp, #-0x30]
    // 0x4002fc: StoreField: r1->field_b = r0
    //     0x4002fc: stur            w0, [x1, #0xb]
    // 0x400300: r0 = Instance_NesButtonType
    //     0x400300: add             x0, PP, #0x11, lsl #12  ; [pp+0x11028] Obj!NesButtonType@5d8e31
    //     0x400304: ldr             x0, [x0, #0x28]
    // 0x400308: StoreField: r1->field_f = r0
    //     0x400308: stur            w0, [x1, #0xf]
    // 0x40030c: ldur            x0, [fp, #-0x28]
    // 0x400310: StoreField: r1->field_13 = r0
    //     0x400310: stur            w0, [x1, #0x13]
    // 0x400314: r2 = Instance_CrossAxisAlignment
    //     0x400314: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x400318: ldr             x2, [x2, #0xfc0]
    // 0x40031c: ArrayStore: r1[0] = r2  ; List_4
    //     0x40031c: stur            w2, [x1, #0x17]
    // 0x400320: ldur            x0, [fp, #-0x10]
    // 0x400324: StoreField: r1->field_1b = r0
    //     0x400324: stur            w0, [x1, #0x1b]
    // 0x400328: mov             x0, x1
    // 0x40032c: ldur            x1, [fp, #-0x38]
    // 0x400330: ArrayStore: r1[6] = r0  ; List_4
    //     0x400330: add             x25, x1, #0x27
    //     0x400334: str             w0, [x25]
    //     0x400338: tbz             w0, #0, #0x400354
    //     0x40033c: ldurb           w16, [x1, #-1]
    //     0x400340: ldurb           w17, [x0, #-1]
    //     0x400344: and             x16, x17, x16, lsr #2
    //     0x400348: tst             x16, HEAP, lsr #32
    //     0x40034c: b.eq            #0x400354
    //     0x400350: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x400354: ldur            x0, [fp, #-0x38]
    // 0x400358: r16 = Instance_SizedBox
    //     0x400358: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x40035c: ldr             x16, [x16, #0xfd8]
    // 0x400360: StoreField: r0->field_2b = r16
    //     0x400360: stur            w16, [x0, #0x2b]
    // 0x400364: ldur            x1, [fp, #-8]
    // 0x400368: LoadField: r0 = r1->field_f
    //     0x400368: ldur            w0, [x1, #0xf]
    // 0x40036c: DecompressPointer r0
    //     0x40036c: add             x0, x0, HEAP, lsl #32
    // 0x400370: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400374: cmp             w0, w16
    // 0x400378: b.ne            #0x400388
    // 0x40037c: r2 = leftArrowIndicator
    //     0x40037c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11368] Field <NesIconCollection.leftArrowIndicator>: late final (offset: 0x10)
    //     0x400380: ldr             x2, [x2, #0x368]
    // 0x400384: r0 = InitLateFinalInstanceField()
    //     0x400384: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400388: stur            x0, [fp, #-8]
    // 0x40038c: r0 = NesIcon()
    //     0x40038c: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x400390: mov             x1, x0
    // 0x400394: ldur            x0, [fp, #-8]
    // 0x400398: stur            x1, [fp, #-0x10]
    // 0x40039c: StoreField: r1->field_b = r0
    //     0x40039c: stur            w0, [x1, #0xb]
    // 0x4003a0: r16 = <AppLocale, Translations>
    //     0x4003a0: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4003a4: ldur            lr, [fp, #-0x20]
    // 0x4003a8: stp             lr, x16, [SP]
    // 0x4003ac: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x4003ac: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x4003b0: r0 = LocaleSettingsExt.currentTranslations()
    //     0x4003b0: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x4003b4: r1 = LoadClassIdInstr(r0)
    //     0x4003b4: ldur            x1, [x0, #-1]
    //     0x4003b8: ubfx            x1, x1, #0xc, #0x14
    // 0x4003bc: cmp             x1, #0x8dd
    // 0x4003c0: b.ne            #0x4003ec
    // 0x4003c4: mov             x1, x0
    // 0x4003c8: LoadField: r0 = r1->field_1b
    //     0x4003c8: ldur            w0, [x1, #0x1b]
    // 0x4003cc: DecompressPointer r0
    //     0x4003cc: add             x0, x0, HEAP, lsl #32
    // 0x4003d0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4003d4: cmp             w0, w16
    // 0x4003d8: b.ne            #0x4003e8
    // 0x4003dc: r2 = gameOverPage
    //     0x4003dc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11220] Field <Translations.gameOverPage>: late final (offset: 0x1c)
    //     0x4003e0: ldr             x2, [x2, #0x220]
    // 0x4003e4: r0 = InitLateFinalInstanceField()
    //     0x4003e4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4003e8: b               #0x400470
    // 0x4003ec: cmp             x1, #0x8df
    // 0x4003f0: b.ne            #0x40041c
    // 0x4003f4: mov             x1, x0
    // 0x4003f8: LoadField: r0 = r1->field_3f
    //     0x4003f8: ldur            w0, [x1, #0x3f]
    // 0x4003fc: DecompressPointer r0
    //     0x4003fc: add             x0, x0, HEAP, lsl #32
    // 0x400400: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400404: cmp             w0, w16
    // 0x400408: b.ne            #0x400418
    // 0x40040c: r2 = gameOverPage
    //     0x40040c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11228] Field <TranslationsRu.gameOverPage>: late final (offset: 0x40)
    //     0x400410: ldr             x2, [x2, #0x228]
    // 0x400414: r0 = InitLateFinalInstanceField()
    //     0x400414: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400418: b               #0x400470
    // 0x40041c: cmp             x1, #0x8e0
    // 0x400420: b.ne            #0x40044c
    // 0x400424: mov             x1, x0
    // 0x400428: LoadField: r0 = r1->field_3f
    //     0x400428: ldur            w0, [x1, #0x3f]
    // 0x40042c: DecompressPointer r0
    //     0x40042c: add             x0, x0, HEAP, lsl #32
    // 0x400430: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400434: cmp             w0, w16
    // 0x400438: b.ne            #0x400448
    // 0x40043c: r2 = gameOverPage
    //     0x40043c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11230] Field <TranslationsKk.gameOverPage>: late final (offset: 0x40)
    //     0x400440: ldr             x2, [x2, #0x230]
    // 0x400444: r0 = InitLateFinalInstanceField()
    //     0x400444: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400448: b               #0x400470
    // 0x40044c: mov             x1, x0
    // 0x400450: LoadField: r0 = r1->field_3f
    //     0x400450: ldur            w0, [x1, #0x3f]
    // 0x400454: DecompressPointer r0
    //     0x400454: add             x0, x0, HEAP, lsl #32
    // 0x400458: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40045c: cmp             w0, w16
    // 0x400460: b.ne            #0x400470
    // 0x400464: r2 = gameOverPage
    //     0x400464: add             x2, PP, #0x11, lsl #12  ; [pp+0x11238] Field <TranslationsEs.gameOverPage>: late final (offset: 0x40)
    //     0x400468: ldr             x2, [x2, #0x238]
    // 0x40046c: r0 = InitLateFinalInstanceField()
    //     0x40046c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400470: r1 = LoadClassIdInstr(r0)
    //     0x400470: ldur            x1, [x0, #-1]
    //     0x400474: ubfx            x1, x1, #0xc, #0x14
    // 0x400478: cmp             x1, #0xf0
    // 0x40047c: b.ne            #0x40048c
    // 0x400480: r4 = "Home"
    //     0x400480: add             x4, PP, #0x11, lsl #12  ; [pp+0x11370] "Home"
    //     0x400484: ldr             x4, [x4, #0x370]
    // 0x400488: b               #0x4004bc
    // 0x40048c: cmp             x1, #0xf1
    // 0x400490: b.ne            #0x4004a0
    // 0x400494: r4 = "На главную"
    //     0x400494: add             x4, PP, #0x11, lsl #12  ; [pp+0x11378] "На главную"
    //     0x400498: ldr             x4, [x4, #0x378]
    // 0x40049c: b               #0x4004bc
    // 0x4004a0: cmp             x1, #0xf2
    // 0x4004a4: b.ne            #0x4004b4
    // 0x4004a8: r4 = "Мәзір"
    //     0x4004a8: add             x4, PP, #0x11, lsl #12  ; [pp+0x11380] "Мәзір"
    //     0x4004ac: ldr             x4, [x4, #0x380]
    // 0x4004b0: b               #0x4004bc
    // 0x4004b4: r4 = "Hogar"
    //     0x4004b4: add             x4, PP, #0x11, lsl #12  ; [pp+0x11388] "Hogar"
    //     0x4004b8: ldr             x4, [x4, #0x388]
    // 0x4004bc: ldur            x3, [fp, #-0x38]
    // 0x4004c0: ldur            x0, [fp, #-0x10]
    // 0x4004c4: ldur            x2, [fp, #-0x18]
    // 0x4004c8: stur            x4, [fp, #-8]
    // 0x4004cc: r1 = Function '<anonymous closure>':.
    //     0x4004cc: add             x1, PP, #0x11, lsl #12  ; [pp+0x11390] AnonymousClosure: (0x4006a4), in [package:ricochlime/pages/game_over.dart] GameOverDialog::build (0x3ff5d4)
    //     0x4004d0: ldr             x1, [x1, #0x390]
    // 0x4004d4: r0 = AllocateClosure()
    //     0x4004d4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x4004d8: stur            x0, [fp, #-0x18]
    // 0x4004dc: r0 = DialogButton()
    //     0x4004dc: bl              #0x400698  ; AllocateDialogButtonStub -> DialogButton (size=0x20)
    // 0x4004e0: mov             x1, x0
    // 0x4004e4: ldur            x0, [fp, #-0x18]
    // 0x4004e8: StoreField: r1->field_b = r0
    //     0x4004e8: stur            w0, [x1, #0xb]
    // 0x4004ec: r0 = Instance_NesButtonType
    //     0x4004ec: add             x0, PP, #0x11, lsl #12  ; [pp+0x11060] Obj!NesButtonType@5d8e11
    //     0x4004f0: ldr             x0, [x0, #0x60]
    // 0x4004f4: StoreField: r1->field_f = r0
    //     0x4004f4: stur            w0, [x1, #0xf]
    // 0x4004f8: ldur            x0, [fp, #-0x10]
    // 0x4004fc: StoreField: r1->field_13 = r0
    //     0x4004fc: stur            w0, [x1, #0x13]
    // 0x400500: r2 = Instance_CrossAxisAlignment
    //     0x400500: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x400504: ldr             x2, [x2, #0xfc0]
    // 0x400508: ArrayStore: r1[0] = r2  ; List_4
    //     0x400508: stur            w2, [x1, #0x17]
    // 0x40050c: ldur            x0, [fp, #-8]
    // 0x400510: StoreField: r1->field_1b = r0
    //     0x400510: stur            w0, [x1, #0x1b]
    // 0x400514: mov             x0, x1
    // 0x400518: ldur            x1, [fp, #-0x38]
    // 0x40051c: ArrayStore: r1[8] = r0  ; List_4
    //     0x40051c: add             x25, x1, #0x2f
    //     0x400520: str             w0, [x25]
    //     0x400524: tbz             w0, #0, #0x400540
    //     0x400528: ldurb           w16, [x1, #-1]
    //     0x40052c: ldurb           w17, [x0, #-1]
    //     0x400530: and             x16, x17, x16, lsr #2
    //     0x400534: tst             x16, HEAP, lsr #32
    //     0x400538: b.eq            #0x400540
    //     0x40053c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x400540: r1 = <Widget>
    //     0x400540: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x400544: r0 = AllocateGrowableArray()
    //     0x400544: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x400548: mov             x1, x0
    // 0x40054c: ldur            x0, [fp, #-0x38]
    // 0x400550: stur            x1, [fp, #-8]
    // 0x400554: StoreField: r1->field_f = r0
    //     0x400554: stur            w0, [x1, #0xf]
    // 0x400558: r0 = 18
    //     0x400558: mov             x0, #0x12
    // 0x40055c: StoreField: r1->field_b = r0
    //     0x40055c: stur            w0, [x1, #0xb]
    // 0x400560: r0 = Column()
    //     0x400560: bl              #0x3715fc  ; AllocateColumnStub -> Column (size=0x38)
    // 0x400564: mov             x1, x0
    // 0x400568: r0 = Instance_Axis
    //     0x400568: ldr             x0, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x40056c: stur            x1, [fp, #-0x10]
    // 0x400570: StoreField: r1->field_f = r0
    //     0x400570: stur            w0, [x1, #0xf]
    // 0x400574: r2 = Instance_MainAxisAlignment
    //     0x400574: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x400578: ldr             x2, [x2, #0xfb0]
    // 0x40057c: StoreField: r1->field_13 = r2
    //     0x40057c: stur            w2, [x1, #0x13]
    // 0x400580: r3 = Instance_MainAxisSize
    //     0x400580: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x400584: ldr             x3, [x3, #0xfb8]
    // 0x400588: ArrayStore: r1[0] = r3  ; List_4
    //     0x400588: stur            w3, [x1, #0x17]
    // 0x40058c: r3 = Instance_CrossAxisAlignment
    //     0x40058c: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x400590: ldr             x3, [x3, #0xfc0]
    // 0x400594: StoreField: r1->field_1b = r3
    //     0x400594: stur            w3, [x1, #0x1b]
    // 0x400598: r4 = Instance_VerticalDirection
    //     0x400598: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x40059c: ldr             x4, [x4, #0xfc8]
    // 0x4005a0: StoreField: r1->field_23 = r4
    //     0x4005a0: stur            w4, [x1, #0x23]
    // 0x4005a4: r5 = Instance_Clip
    //     0x4005a4: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x4005a8: ldr             x5, [x5, #0xfd0]
    // 0x4005ac: StoreField: r1->field_2b = r5
    //     0x4005ac: stur            w5, [x1, #0x2b]
    // 0x4005b0: StoreField: r1->field_2f = rZR
    //     0x4005b0: stur            xzr, [x1, #0x2f]
    // 0x4005b4: ldur            x6, [fp, #-8]
    // 0x4005b8: StoreField: r1->field_b = r6
    //     0x4005b8: stur            w6, [x1, #0xb]
    // 0x4005bc: r0 = FittedBox()
    //     0x4005bc: bl              #0x370e1c  ; AllocateFittedBoxStub -> FittedBox (size=0x1c)
    // 0x4005c0: mov             x3, x0
    // 0x4005c4: r0 = Instance_BoxFit
    //     0x4005c4: add             x0, PP, #0x11, lsl #12  ; [pp+0x110d8] Obj!BoxFit@5dae31
    //     0x4005c8: ldr             x0, [x0, #0xd8]
    // 0x4005cc: stur            x3, [fp, #-8]
    // 0x4005d0: StoreField: r3->field_f = r0
    //     0x4005d0: stur            w0, [x3, #0xf]
    // 0x4005d4: r0 = Instance_Alignment
    //     0x4005d4: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x4005d8: ldr             x0, [x0, #0xb18]
    // 0x4005dc: StoreField: r3->field_13 = r0
    //     0x4005dc: stur            w0, [x3, #0x13]
    // 0x4005e0: r0 = Instance_Clip
    //     0x4005e0: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x4005e4: ldr             x0, [x0, #0xfd0]
    // 0x4005e8: ArrayStore: r3[0] = r0  ; List_4
    //     0x4005e8: stur            w0, [x3, #0x17]
    // 0x4005ec: ldur            x1, [fp, #-0x10]
    // 0x4005f0: StoreField: r3->field_b = r1
    //     0x4005f0: stur            w1, [x3, #0xb]
    // 0x4005f4: r1 = Null
    //     0x4005f4: mov             x1, NULL
    // 0x4005f8: r2 = 2
    //     0x4005f8: mov             x2, #2
    // 0x4005fc: r0 = AllocateArray()
    //     0x4005fc: bl              #0x5845d8  ; AllocateArrayStub
    // 0x400600: mov             x2, x0
    // 0x400604: ldur            x0, [fp, #-8]
    // 0x400608: stur            x2, [fp, #-0x10]
    // 0x40060c: StoreField: r2->field_f = r0
    //     0x40060c: stur            w0, [x2, #0xf]
    // 0x400610: r1 = <Widget>
    //     0x400610: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x400614: r0 = AllocateGrowableArray()
    //     0x400614: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x400618: mov             x1, x0
    // 0x40061c: ldur            x0, [fp, #-0x10]
    // 0x400620: stur            x1, [fp, #-8]
    // 0x400624: StoreField: r1->field_f = r0
    //     0x400624: stur            w0, [x1, #0xf]
    // 0x400628: r0 = 2
    //     0x400628: mov             x0, #2
    // 0x40062c: StoreField: r1->field_b = r0
    //     0x40062c: stur            w0, [x1, #0xb]
    // 0x400630: r0 = Column()
    //     0x400630: bl              #0x3715fc  ; AllocateColumnStub -> Column (size=0x38)
    // 0x400634: r1 = Instance_Axis
    //     0x400634: ldr             x1, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x400638: StoreField: r0->field_f = r1
    //     0x400638: stur            w1, [x0, #0xf]
    // 0x40063c: r1 = Instance_MainAxisAlignment
    //     0x40063c: add             x1, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x400640: ldr             x1, [x1, #0xfb0]
    // 0x400644: StoreField: r0->field_13 = r1
    //     0x400644: stur            w1, [x0, #0x13]
    // 0x400648: r1 = Instance_MainAxisSize
    //     0x400648: add             x1, PP, #0x11, lsl #12  ; [pp+0x11398] Obj!MainAxisSize@5dac31
    //     0x40064c: ldr             x1, [x1, #0x398]
    // 0x400650: ArrayStore: r0[0] = r1  ; List_4
    //     0x400650: stur            w1, [x0, #0x17]
    // 0x400654: r1 = Instance_CrossAxisAlignment
    //     0x400654: add             x1, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x400658: ldr             x1, [x1, #0xfc0]
    // 0x40065c: StoreField: r0->field_1b = r1
    //     0x40065c: stur            w1, [x0, #0x1b]
    // 0x400660: r1 = Instance_VerticalDirection
    //     0x400660: add             x1, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x400664: ldr             x1, [x1, #0xfc8]
    // 0x400668: StoreField: r0->field_23 = r1
    //     0x400668: stur            w1, [x0, #0x23]
    // 0x40066c: r1 = Instance_Clip
    //     0x40066c: add             x1, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x400670: ldr             x1, [x1, #0xfd0]
    // 0x400674: StoreField: r0->field_2b = r1
    //     0x400674: stur            w1, [x0, #0x2b]
    // 0x400678: StoreField: r0->field_2f = rZR
    //     0x400678: stur            xzr, [x0, #0x2f]
    // 0x40067c: ldur            x1, [fp, #-8]
    // 0x400680: StoreField: r0->field_b = r1
    //     0x400680: stur            w1, [x0, #0xb]
    // 0x400684: LeaveFrame
    //     0x400684: mov             SP, fp
    //     0x400688: ldp             fp, lr, [SP], #0x10
    // 0x40068c: ret
    //     0x40068c: ret             
    // 0x400690: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x400690: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x400694: b               #0x3ff5fc
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x4006a4, size: 0x88
    // 0x4006a4: EnterFrame
    //     0x4006a4: stp             fp, lr, [SP, #-0x10]!
    //     0x4006a8: mov             fp, SP
    // 0x4006ac: AllocStack(0x20)
    //     0x4006ac: sub             SP, SP, #0x20
    // 0x4006b0: SetupParameters([dynamic _ /* r0 */])
    //     0x4006b0: ldr             x0, [fp, #0x10]
    //     0x4006b4: ldur            w1, [x0, #0x17]
    //     0x4006b8: add             x1, x1, HEAP, lsl #32
    // 0x4006bc: CheckStackOverflow
    //     0x4006bc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4006c0: cmp             SP, x16
    //     0x4006c4: b.ls            #0x400724
    // 0x4006c8: LoadField: r0 = r1->field_f
    //     0x4006c8: ldur            w0, [x1, #0xf]
    // 0x4006cc: DecompressPointer r0
    //     0x4006cc: add             x0, x0, HEAP, lsl #32
    // 0x4006d0: mov             x1, x0
    // 0x4006d4: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x4006d4: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x4006d8: r0 = of()
    //     0x4006d8: bl              #0x378724  ; [package:flutter/src/widgets/navigator.dart] Navigator::of
    // 0x4006dc: stur            x0, [fp, #-8]
    // 0x4006e0: r16 = <GameOverAction>
    //     0x4006e0: add             x16, PP, #0xc, lsl #12  ; [pp+0xca18] TypeArguments: <GameOverAction>
    //     0x4006e4: ldr             x16, [x16, #0xa18]
    // 0x4006e8: stp             x0, x16, [SP, #8]
    // 0x4006ec: r16 = Instance_GameOverAction
    //     0x4006ec: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7e8] Obj!GameOverAction@5d8981
    //     0x4006f0: ldr             x16, [x16, #0x7e8]
    // 0x4006f4: str             x16, [SP]
    // 0x4006f8: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x4006f8: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x4006fc: r0 = pop()
    //     0x4006fc: bl              #0x276d04  ; [package:flutter/src/widgets/navigator.dart] NavigatorState::pop
    // 0x400700: r16 = <Object?>
    //     0x400700: ldr             x16, [PP, #0xee8]  ; [pp+0xee8] TypeArguments: <Object?>
    // 0x400704: ldur            lr, [fp, #-8]
    // 0x400708: stp             lr, x16, [SP]
    // 0x40070c: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x40070c: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x400710: r0 = pop()
    //     0x400710: bl              #0x276d04  ; [package:flutter/src/widgets/navigator.dart] NavigatorState::pop
    // 0x400714: r0 = Null
    //     0x400714: mov             x0, NULL
    // 0x400718: LeaveFrame
    //     0x400718: mov             SP, fp
    //     0x40071c: ldp             fp, lr, [SP], #0x10
    // 0x400720: ret
    //     0x400720: ret             
    // 0x400724: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x400724: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x400728: b               #0x4006c8
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x40072c, size: 0x70
    // 0x40072c: EnterFrame
    //     0x40072c: stp             fp, lr, [SP, #-0x10]!
    //     0x400730: mov             fp, SP
    // 0x400734: AllocStack(0x18)
    //     0x400734: sub             SP, SP, #0x18
    // 0x400738: SetupParameters([dynamic _ /* r0 */])
    //     0x400738: ldr             x0, [fp, #0x10]
    //     0x40073c: ldur            w1, [x0, #0x17]
    //     0x400740: add             x1, x1, HEAP, lsl #32
    // 0x400744: CheckStackOverflow
    //     0x400744: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x400748: cmp             SP, x16
    //     0x40074c: b.ls            #0x400794
    // 0x400750: LoadField: r0 = r1->field_f
    //     0x400750: ldur            w0, [x1, #0xf]
    // 0x400754: DecompressPointer r0
    //     0x400754: add             x0, x0, HEAP, lsl #32
    // 0x400758: mov             x1, x0
    // 0x40075c: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x40075c: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x400760: r0 = of()
    //     0x400760: bl              #0x378724  ; [package:flutter/src/widgets/navigator.dart] Navigator::of
    // 0x400764: r16 = <GameOverAction>
    //     0x400764: add             x16, PP, #0xc, lsl #12  ; [pp+0xca18] TypeArguments: <GameOverAction>
    //     0x400768: ldr             x16, [x16, #0xa18]
    // 0x40076c: stp             x0, x16, [SP, #8]
    // 0x400770: r16 = Instance_GameOverAction
    //     0x400770: add             x16, PP, #0x11, lsl #12  ; [pp+0x113b0] Obj!GameOverAction@5d89a1
    //     0x400774: ldr             x16, [x16, #0x3b0]
    // 0x400778: str             x16, [SP]
    // 0x40077c: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x40077c: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x400780: r0 = pop()
    //     0x400780: bl              #0x276d04  ; [package:flutter/src/widgets/navigator.dart] NavigatorState::pop
    // 0x400784: r0 = Null
    //     0x400784: mov             x0, NULL
    // 0x400788: LeaveFrame
    //     0x400788: mov             SP, fp
    //     0x40078c: ldp             fp, lr, [SP], #0x10
    // 0x400790: ret
    //     0x400790: ret             
    // 0x400794: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x400794: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x400798: b               #0x400750
  }
  [closure] DialogButton <anonymous closure>(dynamic, BuildContext, int, Widget?) {
    // ** addr: 0x40079c, size: 0x248
    // 0x40079c: EnterFrame
    //     0x40079c: stp             fp, lr, [SP, #-0x10]!
    //     0x4007a0: mov             fp, SP
    // 0x4007a4: AllocStack(0x20)
    //     0x4007a4: sub             SP, SP, #0x20
    // 0x4007a8: SetupParameters([dynamic _ /* r0 */])
    //     0x4007a8: ldr             x0, [fp, #0x28]
    //     0x4007ac: ldur            w1, [x0, #0x17]
    //     0x4007b0: add             x1, x1, HEAP, lsl #32
    //     0x4007b4: stur            x1, [fp, #-8]
    // 0x4007b8: CheckStackOverflow
    //     0x4007b8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4007bc: cmp             SP, x16
    //     0x4007c0: b.ls            #0x4009dc
    // 0x4007c4: r1 = 1
    //     0x4007c4: mov             x1, #1
    // 0x4007c8: r0 = AllocateContext()
    //     0x4007c8: bl              #0x5834e8  ; AllocateContextStub
    // 0x4007cc: mov             x1, x0
    // 0x4007d0: ldur            x0, [fp, #-8]
    // 0x4007d4: stur            x1, [fp, #-0x10]
    // 0x4007d8: StoreField: r1->field_b = r0
    //     0x4007d8: stur            w0, [x1, #0xb]
    // 0x4007dc: ldr             x0, [fp, #0x20]
    // 0x4007e0: StoreField: r1->field_f = r0
    //     0x4007e0: stur            w0, [x1, #0xf]
    // 0x4007e4: r0 = LoadStaticField(0xccc)
    //     0x4007e4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x4007e8: ldr             x0, [x0, #0x1998]
    // 0x4007ec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4007f0: cmp             w0, w16
    // 0x4007f4: b.ne            #0x400804
    // 0x4007f8: r2 = stows
    //     0x4007f8: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x4007fc: ldr             x2, [x2, #0x310]
    // 0x400800: r0 = InitLateFinalStaticField()
    //     0x400800: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x400804: LoadField: r1 = r0->field_2b
    //     0x400804: ldur            w1, [x0, #0x2b]
    // 0x400808: DecompressPointer r1
    //     0x400808: add             x1, x1, HEAP, lsl #32
    // 0x40080c: LoadField: r0 = r1->field_43
    //     0x40080c: ldur            w0, [x1, #0x43]
    // 0x400810: DecompressPointer r0
    //     0x400810: add             x0, x0, HEAP, lsl #32
    // 0x400814: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400818: cmp             w0, w16
    // 0x40081c: b.ne            #0x40082c
    // 0x400820: r2 = _value
    //     0x400820: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x400824: ldr             x2, [x2, #0x4b0]
    // 0x400828: r0 = InitLateInstanceField()
    //     0x400828: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x40082c: r1 = LoadInt32Instr(r0)
    //     0x40082c: sbfx            x1, x0, #1, #0x1f
    //     0x400830: tbz             w0, #0, #0x400838
    //     0x400834: ldur            x1, [x0, #7]
    // 0x400838: cmp             x1, #0x64
    // 0x40083c: b.ge            #0x400848
    // 0x400840: r0 = Null
    //     0x400840: mov             x0, NULL
    // 0x400844: b               #0x400858
    // 0x400848: ldur            x2, [fp, #-0x10]
    // 0x40084c: r1 = Function '<anonymous closure>':.
    //     0x40084c: add             x1, PP, #0x11, lsl #12  ; [pp+0x113c0] AnonymousClosure: (0x4009e4), in [package:ricochlime/pages/game_over.dart] GameOverDialog::build (0x3ff5d4)
    //     0x400850: ldr             x1, [x1, #0x3c0]
    // 0x400854: r0 = AllocateClosure()
    //     0x400854: bl              #0x5838bc  ; AllocateClosureStub
    // 0x400858: stur            x0, [fp, #-8]
    // 0x40085c: r0 = LoadStaticField(0x468)
    //     0x40085c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x400860: ldr             x0, [x0, #0x8d0]
    // 0x400864: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400868: cmp             w0, w16
    // 0x40086c: b.ne            #0x400878
    // 0x400870: r2 = instance
    //     0x400870: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x400874: r0 = InitLateFinalStaticField()
    //     0x400874: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x400878: r16 = <AppLocale, Translations>
    //     0x400878: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x40087c: stp             x0, x16, [SP]
    // 0x400880: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x400880: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x400884: r0 = LocaleSettingsExt.currentTranslations()
    //     0x400884: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x400888: r1 = LoadClassIdInstr(r0)
    //     0x400888: ldur            x1, [x0, #-1]
    //     0x40088c: ubfx            x1, x1, #0xc, #0x14
    // 0x400890: cmp             x1, #0x8dd
    // 0x400894: b.ne            #0x4008c0
    // 0x400898: mov             x1, x0
    // 0x40089c: LoadField: r0 = r1->field_1b
    //     0x40089c: ldur            w0, [x1, #0x1b]
    // 0x4008a0: DecompressPointer r0
    //     0x4008a0: add             x0, x0, HEAP, lsl #32
    // 0x4008a4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4008a8: cmp             w0, w16
    // 0x4008ac: b.ne            #0x4008bc
    // 0x4008b0: r2 = gameOverPage
    //     0x4008b0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11220] Field <Translations.gameOverPage>: late final (offset: 0x1c)
    //     0x4008b4: ldr             x2, [x2, #0x220]
    // 0x4008b8: r0 = InitLateFinalInstanceField()
    //     0x4008b8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4008bc: b               #0x400944
    // 0x4008c0: cmp             x1, #0x8df
    // 0x4008c4: b.ne            #0x4008f0
    // 0x4008c8: mov             x1, x0
    // 0x4008cc: LoadField: r0 = r1->field_3f
    //     0x4008cc: ldur            w0, [x1, #0x3f]
    // 0x4008d0: DecompressPointer r0
    //     0x4008d0: add             x0, x0, HEAP, lsl #32
    // 0x4008d4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4008d8: cmp             w0, w16
    // 0x4008dc: b.ne            #0x4008ec
    // 0x4008e0: r2 = gameOverPage
    //     0x4008e0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11228] Field <TranslationsRu.gameOverPage>: late final (offset: 0x40)
    //     0x4008e4: ldr             x2, [x2, #0x228]
    // 0x4008e8: r0 = InitLateFinalInstanceField()
    //     0x4008e8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4008ec: b               #0x400944
    // 0x4008f0: cmp             x1, #0x8e0
    // 0x4008f4: b.ne            #0x400920
    // 0x4008f8: mov             x1, x0
    // 0x4008fc: LoadField: r0 = r1->field_3f
    //     0x4008fc: ldur            w0, [x1, #0x3f]
    // 0x400900: DecompressPointer r0
    //     0x400900: add             x0, x0, HEAP, lsl #32
    // 0x400904: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400908: cmp             w0, w16
    // 0x40090c: b.ne            #0x40091c
    // 0x400910: r2 = gameOverPage
    //     0x400910: add             x2, PP, #0x11, lsl #12  ; [pp+0x11230] Field <TranslationsKk.gameOverPage>: late final (offset: 0x40)
    //     0x400914: ldr             x2, [x2, #0x230]
    // 0x400918: r0 = InitLateFinalInstanceField()
    //     0x400918: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40091c: b               #0x400944
    // 0x400920: mov             x1, x0
    // 0x400924: LoadField: r0 = r1->field_3f
    //     0x400924: ldur            w0, [x1, #0x3f]
    // 0x400928: DecompressPointer r0
    //     0x400928: add             x0, x0, HEAP, lsl #32
    // 0x40092c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400930: cmp             w0, w16
    // 0x400934: b.ne            #0x400944
    // 0x400938: r2 = gameOverPage
    //     0x400938: add             x2, PP, #0x11, lsl #12  ; [pp+0x11238] Field <TranslationsEs.gameOverPage>: late final (offset: 0x40)
    //     0x40093c: ldr             x2, [x2, #0x238]
    // 0x400940: r0 = InitLateFinalInstanceField()
    //     0x400940: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400944: r1 = LoadClassIdInstr(r0)
    //     0x400944: ldur            x1, [x0, #-1]
    //     0x400948: ubfx            x1, x1, #0xc, #0x14
    // 0x40094c: cmp             x1, #0xf0
    // 0x400950: b.ne            #0x400960
    // 0x400954: r2 = "100 to continue"
    //     0x400954: add             x2, PP, #0x11, lsl #12  ; [pp+0x113c8] "100 to continue"
    //     0x400958: ldr             x2, [x2, #0x3c8]
    // 0x40095c: b               #0x400990
    // 0x400960: cmp             x1, #0xf1
    // 0x400964: b.ne            #0x400974
    // 0x400968: r2 = "Продолжить за 100"
    //     0x400968: add             x2, PP, #0x11, lsl #12  ; [pp+0x113d0] "Продолжить за 100"
    //     0x40096c: ldr             x2, [x2, #0x3d0]
    // 0x400970: b               #0x400990
    // 0x400974: cmp             x1, #0xf2
    // 0x400978: b.ne            #0x400988
    // 0x40097c: r2 = "Жалғастыру үшін 100"
    //     0x40097c: add             x2, PP, #0x11, lsl #12  ; [pp+0x113d8] "Жалғастыру үшін 100"
    //     0x400980: ldr             x2, [x2, #0x3d8]
    // 0x400984: b               #0x400990
    // 0x400988: r2 = "100 para continuar"
    //     0x400988: add             x2, PP, #0x11, lsl #12  ; [pp+0x113e0] "100 para continuar"
    //     0x40098c: ldr             x2, [x2, #0x3e0]
    // 0x400990: ldr             x1, [fp, #0x10]
    // 0x400994: ldur            x0, [fp, #-8]
    // 0x400998: stur            x2, [fp, #-0x10]
    // 0x40099c: r0 = DialogButton()
    //     0x40099c: bl              #0x400698  ; AllocateDialogButtonStub -> DialogButton (size=0x20)
    // 0x4009a0: ldur            x1, [fp, #-8]
    // 0x4009a4: StoreField: r0->field_b = r1
    //     0x4009a4: stur            w1, [x0, #0xb]
    // 0x4009a8: r1 = Instance_NesButtonType
    //     0x4009a8: add             x1, PP, #0x11, lsl #12  ; [pp+0x11028] Obj!NesButtonType@5d8e31
    //     0x4009ac: ldr             x1, [x1, #0x28]
    // 0x4009b0: StoreField: r0->field_f = r1
    //     0x4009b0: stur            w1, [x0, #0xf]
    // 0x4009b4: ldr             x1, [fp, #0x10]
    // 0x4009b8: StoreField: r0->field_13 = r1
    //     0x4009b8: stur            w1, [x0, #0x13]
    // 0x4009bc: r1 = Instance_CrossAxisAlignment
    //     0x4009bc: add             x1, PP, #0x11, lsl #12  ; [pp+0x113e8] Obj!CrossAxisAlignment@5daaf1
    //     0x4009c0: ldr             x1, [x1, #0x3e8]
    // 0x4009c4: ArrayStore: r0[0] = r1  ; List_4
    //     0x4009c4: stur            w1, [x0, #0x17]
    // 0x4009c8: ldur            x1, [fp, #-0x10]
    // 0x4009cc: StoreField: r0->field_1b = r1
    //     0x4009cc: stur            w1, [x0, #0x1b]
    // 0x4009d0: LeaveFrame
    //     0x4009d0: mov             SP, fp
    //     0x4009d4: ldp             fp, lr, [SP], #0x10
    // 0x4009d8: ret
    //     0x4009d8: ret             
    // 0x4009dc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4009dc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4009e0: b               #0x4007c4
  }
  [closure] Future<void> <anonymous closure>(dynamic) async {
    // ** addr: 0x4009e4, size: 0x180
    // 0x4009e4: EnterFrame
    //     0x4009e4: stp             fp, lr, [SP, #-0x10]!
    //     0x4009e8: mov             fp, SP
    // 0x4009ec: AllocStack(0x38)
    //     0x4009ec: sub             SP, SP, #0x38
    // 0x4009f0: SetupParameters(GameOverDialog this /* r1 */)
    //     0x4009f0: stur            NULL, [fp, #-8]
    //     0x4009f4: mov             x0, #0
    //     0x4009f8: add             x1, fp, w0, sxtw #2
    //     0x4009fc: ldr             x1, [x1, #0x10]
    //     0x400a00: ldur            w2, [x1, #0x17]
    //     0x400a04: add             x2, x2, HEAP, lsl #32
    //     0x400a08: stur            x2, [fp, #-0x10]
    // 0x400a0c: CheckStackOverflow
    //     0x400a0c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x400a10: cmp             SP, x16
    //     0x400a14: b.ls            #0x400b5c
    // 0x400a18: InitAsync() -> Future<void?>
    //     0x400a18: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x400a1c: bl              #0x2556b4  ; InitAsyncStub
    // 0x400a20: r0 = LoadStaticField(0xccc)
    //     0x400a20: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x400a24: ldr             x0, [x0, #0x1998]
    // 0x400a28: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400a2c: cmp             w0, w16
    // 0x400a30: b.ne            #0x400a40
    // 0x400a34: r2 = stows
    //     0x400a34: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x400a38: ldr             x2, [x2, #0x310]
    // 0x400a3c: r0 = InitLateFinalStaticField()
    //     0x400a3c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x400a40: stur            x0, [fp, #-0x20]
    // 0x400a44: LoadField: r2 = r0->field_2b
    //     0x400a44: ldur            w2, [x0, #0x2b]
    // 0x400a48: DecompressPointer r2
    //     0x400a48: add             x2, x2, HEAP, lsl #32
    // 0x400a4c: mov             x1, x2
    // 0x400a50: stur            x2, [fp, #-0x18]
    // 0x400a54: LoadField: r0 = r1->field_43
    //     0x400a54: ldur            w0, [x1, #0x43]
    // 0x400a58: DecompressPointer r0
    //     0x400a58: add             x0, x0, HEAP, lsl #32
    // 0x400a5c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400a60: cmp             w0, w16
    // 0x400a64: b.ne            #0x400a74
    // 0x400a68: r2 = _value
    //     0x400a68: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x400a6c: ldr             x2, [x2, #0x4b0]
    // 0x400a70: r0 = InitLateInstanceField()
    //     0x400a70: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x400a74: r1 = LoadInt32Instr(r0)
    //     0x400a74: sbfx            x1, x0, #1, #0x1f
    //     0x400a78: tbz             w0, #0, #0x400a80
    //     0x400a7c: ldur            x1, [x0, #7]
    // 0x400a80: cmp             x1, #0x64
    // 0x400a84: b.ge            #0x400a90
    // 0x400a88: r0 = Null
    //     0x400a88: mov             x0, NULL
    // 0x400a8c: r0 = ReturnAsyncNotFuture()
    //     0x400a8c: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x400a90: ldur            x4, [fp, #-0x10]
    // 0x400a94: ldur            x3, [fp, #-0x20]
    // 0x400a98: sub             x2, x1, #0x64
    // 0x400a9c: r0 = BoxInt64Instr(r2)
    //     0x400a9c: sbfiz           x0, x2, #1, #0x1f
    //     0x400aa0: cmp             x2, x0, asr #1
    //     0x400aa4: b.eq            #0x400ab0
    //     0x400aa8: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x400aac: stur            x2, [x0, #7]
    // 0x400ab0: ldur            x1, [fp, #-0x18]
    // 0x400ab4: mov             x2, x0
    // 0x400ab8: r0 = value=()
    //     0x400ab8: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x400abc: ldur            x0, [fp, #-0x20]
    // 0x400ac0: LoadField: r2 = r0->field_4f
    //     0x400ac0: ldur            w2, [x0, #0x4f]
    // 0x400ac4: DecompressPointer r2
    //     0x400ac4: add             x2, x2, HEAP, lsl #32
    // 0x400ac8: mov             x1, x2
    // 0x400acc: stur            x2, [fp, #-0x18]
    // 0x400ad0: LoadField: r0 = r1->field_43
    //     0x400ad0: ldur            w0, [x1, #0x43]
    // 0x400ad4: DecompressPointer r0
    //     0x400ad4: add             x0, x0, HEAP, lsl #32
    // 0x400ad8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400adc: cmp             w0, w16
    // 0x400ae0: b.ne            #0x400af0
    // 0x400ae4: r2 = _value
    //     0x400ae4: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x400ae8: ldr             x2, [x2, #0x4b0]
    // 0x400aec: r0 = InitLateInstanceField()
    //     0x400aec: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x400af0: r1 = LoadInt32Instr(r0)
    //     0x400af0: sbfx            x1, x0, #1, #0x1f
    //     0x400af4: tbz             w0, #0, #0x400afc
    //     0x400af8: ldur            x1, [x0, #7]
    // 0x400afc: add             x2, x1, #1
    // 0x400b00: r0 = BoxInt64Instr(r2)
    //     0x400b00: sbfiz           x0, x2, #1, #0x1f
    //     0x400b04: cmp             x2, x0, asr #1
    //     0x400b08: b.eq            #0x400b14
    //     0x400b0c: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x400b10: stur            x2, [x0, #7]
    // 0x400b14: ldur            x1, [fp, #-0x18]
    // 0x400b18: mov             x2, x0
    // 0x400b1c: r0 = value=()
    //     0x400b1c: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x400b20: ldur            x0, [fp, #-0x10]
    // 0x400b24: LoadField: r1 = r0->field_f
    //     0x400b24: ldur            w1, [x0, #0xf]
    // 0x400b28: DecompressPointer r1
    //     0x400b28: add             x1, x1, HEAP, lsl #32
    // 0x400b2c: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x400b2c: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x400b30: r0 = of()
    //     0x400b30: bl              #0x378724  ; [package:flutter/src/widgets/navigator.dart] Navigator::of
    // 0x400b34: r16 = <GameOverAction>
    //     0x400b34: add             x16, PP, #0xc, lsl #12  ; [pp+0xca18] TypeArguments: <GameOverAction>
    //     0x400b38: ldr             x16, [x16, #0xa18]
    // 0x400b3c: stp             x0, x16, [SP, #8]
    // 0x400b40: r16 = Instance_GameOverAction
    //     0x400b40: add             x16, PP, #0x11, lsl #12  ; [pp+0x113f0] Obj!GameOverAction@5d89c1
    //     0x400b44: ldr             x16, [x16, #0x3f0]
    // 0x400b48: str             x16, [SP]
    // 0x400b4c: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x400b4c: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x400b50: r0 = pop()
    //     0x400b50: bl              #0x276d04  ; [package:flutter/src/widgets/navigator.dart] NavigatorState::pop
    // 0x400b54: r0 = Null
    //     0x400b54: mov             x0, NULL
    // 0x400b58: r0 = ReturnAsyncNotFuture()
    //     0x400b58: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x400b5c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x400b5c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x400b60: b               #0x400a18
  }
}

// class id: 3838, size: 0x14, field offset: 0x14
enum GameOverAction extends _Enum {

  _Mint field_8;
  _OneByteString field_10;

  _ _enumToString(/* No info */) {
    // ** addr: 0x4a03a8, size: 0x64
    // 0x4a03a8: EnterFrame
    //     0x4a03a8: stp             fp, lr, [SP, #-0x10]!
    //     0x4a03ac: mov             fp, SP
    // 0x4a03b0: AllocStack(0x10)
    //     0x4a03b0: sub             SP, SP, #0x10
    // 0x4a03b4: SetupParameters(GameOverAction this /* r1 => r0, fp-0x8 */)
    //     0x4a03b4: mov             x0, x1
    //     0x4a03b8: stur            x1, [fp, #-8]
    // 0x4a03bc: CheckStackOverflow
    //     0x4a03bc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a03c0: cmp             SP, x16
    //     0x4a03c4: b.ls            #0x4a0404
    // 0x4a03c8: r1 = Null
    //     0x4a03c8: mov             x1, NULL
    // 0x4a03cc: r2 = 4
    //     0x4a03cc: mov             x2, #4
    // 0x4a03d0: r0 = AllocateArray()
    //     0x4a03d0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a03d4: r16 = "GameOverAction."
    //     0x4a03d4: add             x16, PP, #0xd, lsl #12  ; [pp+0xdcb0] "GameOverAction."
    //     0x4a03d8: ldr             x16, [x16, #0xcb0]
    // 0x4a03dc: StoreField: r0->field_f = r16
    //     0x4a03dc: stur            w16, [x0, #0xf]
    // 0x4a03e0: ldur            x1, [fp, #-8]
    // 0x4a03e4: LoadField: r2 = r1->field_f
    //     0x4a03e4: ldur            w2, [x1, #0xf]
    // 0x4a03e8: DecompressPointer r2
    //     0x4a03e8: add             x2, x2, HEAP, lsl #32
    // 0x4a03ec: StoreField: r0->field_13 = r2
    //     0x4a03ec: stur            w2, [x0, #0x13]
    // 0x4a03f0: str             x0, [SP]
    // 0x4a03f4: r0 = _interpolate()
    //     0x4a03f4: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a03f8: LeaveFrame
    //     0x4a03f8: mov             SP, fp
    //     0x4a03fc: ldp             fp, lr, [SP], #0x10
    // 0x4a0400: ret
    //     0x4a0400: ret             
    // 0x4a0404: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a0404: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a0408: b               #0x4a03c8
  }
}
