// lib: , url: package:ricochlime/pages/settings.dart

// class id: 1049328, size: 0x8
class :: {
}

// class id: 2766, size: 0xc, field offset: 0xc
//   const constructor, 
class SettingsPage extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x403480, size: 0x1d50
    // 0x403480: EnterFrame
    //     0x403480: stp             fp, lr, [SP, #-0x10]!
    //     0x403484: mov             fp, SP
    // 0x403488: AllocStack(0x70)
    //     0x403488: sub             SP, SP, #0x70
    // 0x40348c: SetupParameters(SettingsPage this /* r1 => r0 */, dynamic _ /* r2 => r1, fp-0x8 */)
    //     0x40348c: mov             x0, x1
    //     0x403490: mov             x1, x2
    //     0x403494: stur            x2, [fp, #-8]
    // 0x403498: CheckStackOverflow
    //     0x403498: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x40349c: cmp             SP, x16
    //     0x4034a0: b.ls            #0x4051c8
    // 0x4034a4: r1 = 2
    //     0x4034a4: mov             x1, #2
    // 0x4034a8: r0 = AllocateContext()
    //     0x4034a8: bl              #0x5834e8  ; AllocateContextStub
    // 0x4034ac: ldur            x1, [fp, #-8]
    // 0x4034b0: stur            x0, [fp, #-0x10]
    // 0x4034b4: StoreField: r0->field_f = r1
    //     0x4034b4: stur            w1, [x0, #0xf]
    // 0x4034b8: r0 = of()
    //     0x4034b8: bl              #0x31bb3c  ; [package:flutter/src/material/theme.dart] Theme::of
    // 0x4034bc: LoadField: r1 = r0->field_3f
    //     0x4034bc: ldur            w1, [x0, #0x3f]
    // 0x4034c0: DecompressPointer r1
    //     0x4034c0: add             x1, x1, HEAP, lsl #32
    // 0x4034c4: LoadField: r0 = r1->field_7b
    //     0x4034c4: ldur            w0, [x1, #0x7b]
    // 0x4034c8: DecompressPointer r0
    //     0x4034c8: add             x0, x0, HEAP, lsl #32
    // 0x4034cc: LoadField: r2 = r1->field_b
    //     0x4034cc: ldur            w2, [x1, #0xb]
    // 0x4034d0: DecompressPointer r2
    //     0x4034d0: add             x2, x2, HEAP, lsl #32
    // 0x4034d4: mov             x1, x0
    // 0x4034d8: r3 = 0.100000
    //     0x4034d8: add             x3, PP, #0x11, lsl #12  ; [pp+0x11f78] 0.1
    //     0x4034dc: ldr             x3, [x3, #0xf78]
    // 0x4034e0: r0 = lerp()
    //     0x4034e0: bl              #0x3b8938  ; [dart:ui] Color::lerp
    // 0x4034e4: mov             x1, x0
    // 0x4034e8: ldur            x2, [fp, #-0x10]
    // 0x4034ec: stur            x1, [fp, #-8]
    // 0x4034f0: StoreField: r2->field_13 = r0
    //     0x4034f0: stur            w0, [x2, #0x13]
    //     0x4034f4: ldurb           w16, [x2, #-1]
    //     0x4034f8: ldurb           w17, [x0, #-1]
    //     0x4034fc: and             x16, x17, x16, lsr #2
    //     0x403500: tst             x16, HEAP, lsr #32
    //     0x403504: b.eq            #0x40350c
    //     0x403508: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x40350c: r0 = LoadStaticField(0x468)
    //     0x40350c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x403510: ldr             x0, [x0, #0x8d0]
    // 0x403514: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403518: cmp             w0, w16
    // 0x40351c: b.ne            #0x403528
    // 0x403520: r2 = instance
    //     0x403520: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x403524: r0 = InitLateFinalStaticField()
    //     0x403524: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x403528: stur            x0, [fp, #-0x18]
    // 0x40352c: r16 = <AppLocale, Translations>
    //     0x40352c: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x403530: stp             x0, x16, [SP]
    // 0x403534: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x403534: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x403538: r0 = LocaleSettingsExt.currentTranslations()
    //     0x403538: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x40353c: r1 = LoadClassIdInstr(r0)
    //     0x40353c: ldur            x1, [x0, #-1]
    //     0x403540: ubfx            x1, x1, #0xc, #0x14
    // 0x403544: cmp             x1, #0x8dd
    // 0x403548: b.ne            #0x403574
    // 0x40354c: mov             x1, x0
    // 0x403550: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x403550: ldur            w0, [x1, #0x17]
    // 0x403554: DecompressPointer r0
    //     0x403554: add             x0, x0, HEAP, lsl #32
    // 0x403558: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40355c: cmp             w0, w16
    // 0x403560: b.ne            #0x403570
    // 0x403564: r2 = settingsPage
    //     0x403564: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x403568: ldr             x2, [x2, #0x188]
    // 0x40356c: r0 = InitLateFinalInstanceField()
    //     0x40356c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403570: b               #0x4035f8
    // 0x403574: cmp             x1, #0x8df
    // 0x403578: b.ne            #0x4035a4
    // 0x40357c: mov             x1, x0
    // 0x403580: LoadField: r0 = r1->field_3b
    //     0x403580: ldur            w0, [x1, #0x3b]
    // 0x403584: DecompressPointer r0
    //     0x403584: add             x0, x0, HEAP, lsl #32
    // 0x403588: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40358c: cmp             w0, w16
    // 0x403590: b.ne            #0x4035a0
    // 0x403594: r2 = settingsPage
    //     0x403594: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x403598: ldr             x2, [x2, #0x190]
    // 0x40359c: r0 = InitLateFinalInstanceField()
    //     0x40359c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4035a0: b               #0x4035f8
    // 0x4035a4: cmp             x1, #0x8e0
    // 0x4035a8: b.ne            #0x4035d4
    // 0x4035ac: mov             x1, x0
    // 0x4035b0: LoadField: r0 = r1->field_3b
    //     0x4035b0: ldur            w0, [x1, #0x3b]
    // 0x4035b4: DecompressPointer r0
    //     0x4035b4: add             x0, x0, HEAP, lsl #32
    // 0x4035b8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4035bc: cmp             w0, w16
    // 0x4035c0: b.ne            #0x4035d0
    // 0x4035c4: r2 = settingsPage
    //     0x4035c4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x4035c8: ldr             x2, [x2, #0x198]
    // 0x4035cc: r0 = InitLateFinalInstanceField()
    //     0x4035cc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4035d0: b               #0x4035f8
    // 0x4035d4: mov             x1, x0
    // 0x4035d8: LoadField: r0 = r1->field_3b
    //     0x4035d8: ldur            w0, [x1, #0x3b]
    // 0x4035dc: DecompressPointer r0
    //     0x4035dc: add             x0, x0, HEAP, lsl #32
    // 0x4035e0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4035e4: cmp             w0, w16
    // 0x4035e8: b.ne            #0x4035f8
    // 0x4035ec: r2 = settingsPage
    //     0x4035ec: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x4035f0: ldr             x2, [x2, #0x1a0]
    // 0x4035f4: r0 = InitLateFinalInstanceField()
    //     0x4035f4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4035f8: r1 = LoadClassIdInstr(r0)
    //     0x4035f8: ldur            x1, [x0, #-1]
    //     0x4035fc: ubfx            x1, x1, #0xc, #0x14
    // 0x403600: cmp             x1, #0xf4
    // 0x403604: b.ne            #0x403614
    // 0x403608: r0 = "Settings"
    //     0x403608: add             x0, PP, #0x11, lsl #12  ; [pp+0x110b0] "Settings"
    //     0x40360c: ldr             x0, [x0, #0xb0]
    // 0x403610: b               #0x403644
    // 0x403614: cmp             x1, #0xf5
    // 0x403618: b.ne            #0x403628
    // 0x40361c: r0 = "Настройки"
    //     0x40361c: add             x0, PP, #0x11, lsl #12  ; [pp+0x110b8] "Настройки"
    //     0x403620: ldr             x0, [x0, #0xb8]
    // 0x403624: b               #0x403644
    // 0x403628: cmp             x1, #0xf6
    // 0x40362c: b.ne            #0x40363c
    // 0x403630: r0 = "Баптау"
    //     0x403630: add             x0, PP, #0x11, lsl #12  ; [pp+0x110c0] "Баптау"
    //     0x403634: ldr             x0, [x0, #0xc0]
    // 0x403638: b               #0x403644
    // 0x40363c: r0 = "Ajustes"
    //     0x40363c: add             x0, PP, #0x11, lsl #12  ; [pp+0x110c8] "Ajustes"
    //     0x403640: ldr             x0, [x0, #0xc8]
    // 0x403644: stur            x0, [fp, #-0x20]
    // 0x403648: r0 = Text()
    //     0x403648: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x40364c: mov             x1, x0
    // 0x403650: ldur            x0, [fp, #-0x20]
    // 0x403654: stur            x1, [fp, #-0x28]
    // 0x403658: StoreField: r1->field_b = r0
    //     0x403658: stur            w0, [x1, #0xb]
    // 0x40365c: r0 = LoadStaticField(0xc74)
    //     0x40365c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x403660: ldr             x0, [x0, #0x18e8]
    // 0x403664: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403668: cmp             w0, w16
    // 0x40366c: b.ne            #0x40367c
    // 0x403670: r2 = NesIcons
    //     0x403670: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x403674: ldr             x2, [x2, #0xf70]
    // 0x403678: r0 = InitLateFinalStaticField()
    //     0x403678: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x40367c: mov             x1, x0
    // 0x403680: stur            x0, [fp, #-0x20]
    // 0x403684: LoadField: r0 = r1->field_f
    //     0x403684: ldur            w0, [x1, #0xf]
    // 0x403688: DecompressPointer r0
    //     0x403688: add             x0, x0, HEAP, lsl #32
    // 0x40368c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403690: cmp             w0, w16
    // 0x403694: b.ne            #0x4036a4
    // 0x403698: r2 = leftArrowIndicator
    //     0x403698: add             x2, PP, #0x11, lsl #12  ; [pp+0x11368] Field <NesIconCollection.leftArrowIndicator>: late final (offset: 0x10)
    //     0x40369c: ldr             x2, [x2, #0x368]
    // 0x4036a0: r0 = InitLateFinalInstanceField()
    //     0x4036a0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4036a4: stur            x0, [fp, #-0x30]
    // 0x4036a8: r0 = NesIconButton()
    //     0x4036a8: bl              #0x37162c  ; AllocateNesIconButtonStub -> NesIconButton (size=0x3c)
    // 0x4036ac: mov             x3, x0
    // 0x4036b0: ldur            x0, [fp, #-0x30]
    // 0x4036b4: stur            x3, [fp, #-0x38]
    // 0x4036b8: StoreField: r3->field_b = r0
    //     0x4036b8: stur            w0, [x3, #0xb]
    // 0x4036bc: ldur            x2, [fp, #-0x10]
    // 0x4036c0: r1 = Function '<anonymous closure>':.
    //     0x4036c0: add             x1, PP, #0x11, lsl #12  ; [pp+0x11f80] AnonymousClosure: (0x380094), in [package:nes_ui/src/widgets/dialogs/nes_dialog.dart] NesDialog::build (0x3fdcd8)
    //     0x4036c4: ldr             x1, [x1, #0xf80]
    // 0x4036c8: r0 = AllocateClosure()
    //     0x4036c8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x4036cc: mov             x1, x0
    // 0x4036d0: ldur            x0, [fp, #-0x38]
    // 0x4036d4: StoreField: r0->field_f = r1
    //     0x4036d4: stur            w1, [x0, #0xf]
    // 0x4036d8: r1 = Instance_Size
    //     0x4036d8: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c08] Obj!Size@5d0181
    //     0x4036dc: ldr             x1, [x1, #0xc08]
    // 0x4036e0: StoreField: r0->field_2f = r1
    //     0x4036e0: stur            w1, [x0, #0x2f]
    // 0x4036e4: r0 = Center()
    //     0x4036e4: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x4036e8: mov             x1, x0
    // 0x4036ec: r0 = Instance_Alignment
    //     0x4036ec: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x4036f0: ldr             x0, [x0, #0xb18]
    // 0x4036f4: stur            x1, [fp, #-0x30]
    // 0x4036f8: StoreField: r1->field_f = r0
    //     0x4036f8: stur            w0, [x1, #0xf]
    // 0x4036fc: ldur            x0, [fp, #-0x38]
    // 0x403700: StoreField: r1->field_b = r0
    //     0x403700: stur            w0, [x1, #0xb]
    // 0x403704: r0 = AppBar()
    //     0x403704: bl              #0x3715e4  ; AllocateAppBarStub -> AppBar (size=0x98)
    // 0x403708: stur            x0, [fp, #-0x38]
    // 0x40370c: r16 = 56.000000
    //     0x40370c: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c10] 56
    //     0x403710: ldr             x16, [x16, #0xc10]
    // 0x403714: ldur            lr, [fp, #-0x30]
    // 0x403718: stp             lr, x16, [SP]
    // 0x40371c: mov             x1, x0
    // 0x403720: ldur            x2, [fp, #-0x28]
    // 0x403724: r4 = const [0, 0x4, 0x2, 0x2, leading, 0x3, toolbarHeight, 0x2, null]
    //     0x403724: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c18] List(9) [0, 0x4, 0x2, 0x2, "leading", 0x3, "toolbarHeight", 0x2, Null]
    //     0x403728: ldr             x4, [x4, #0xc18]
    // 0x40372c: r0 = AppBar()
    //     0x40372c: bl              #0x370e34  ; [package:flutter/src/material/app_bar.dart] AppBar::AppBar
    // 0x403730: r16 = <AppLocale, Translations>
    //     0x403730: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x403734: ldur            lr, [fp, #-0x18]
    // 0x403738: stp             lr, x16, [SP]
    // 0x40373c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x40373c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x403740: r0 = LocaleSettingsExt.currentTranslations()
    //     0x403740: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x403744: r1 = LoadClassIdInstr(r0)
    //     0x403744: ldur            x1, [x0, #-1]
    //     0x403748: ubfx            x1, x1, #0xc, #0x14
    // 0x40374c: cmp             x1, #0x8dd
    // 0x403750: b.ne            #0x40377c
    // 0x403754: mov             x1, x0
    // 0x403758: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x403758: ldur            w0, [x1, #0x17]
    // 0x40375c: DecompressPointer r0
    //     0x40375c: add             x0, x0, HEAP, lsl #32
    // 0x403760: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403764: cmp             w0, w16
    // 0x403768: b.ne            #0x403778
    // 0x40376c: r2 = settingsPage
    //     0x40376c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x403770: ldr             x2, [x2, #0x188]
    // 0x403774: r0 = InitLateFinalInstanceField()
    //     0x403774: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403778: b               #0x403800
    // 0x40377c: cmp             x1, #0x8df
    // 0x403780: b.ne            #0x4037ac
    // 0x403784: mov             x1, x0
    // 0x403788: LoadField: r0 = r1->field_3b
    //     0x403788: ldur            w0, [x1, #0x3b]
    // 0x40378c: DecompressPointer r0
    //     0x40378c: add             x0, x0, HEAP, lsl #32
    // 0x403790: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403794: cmp             w0, w16
    // 0x403798: b.ne            #0x4037a8
    // 0x40379c: r2 = settingsPage
    //     0x40379c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x4037a0: ldr             x2, [x2, #0x190]
    // 0x4037a4: r0 = InitLateFinalInstanceField()
    //     0x4037a4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4037a8: b               #0x403800
    // 0x4037ac: cmp             x1, #0x8e0
    // 0x4037b0: b.ne            #0x4037dc
    // 0x4037b4: mov             x1, x0
    // 0x4037b8: LoadField: r0 = r1->field_3b
    //     0x4037b8: ldur            w0, [x1, #0x3b]
    // 0x4037bc: DecompressPointer r0
    //     0x4037bc: add             x0, x0, HEAP, lsl #32
    // 0x4037c0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4037c4: cmp             w0, w16
    // 0x4037c8: b.ne            #0x4037d8
    // 0x4037cc: r2 = settingsPage
    //     0x4037cc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x4037d0: ldr             x2, [x2, #0x198]
    // 0x4037d4: r0 = InitLateFinalInstanceField()
    //     0x4037d4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4037d8: b               #0x403800
    // 0x4037dc: mov             x1, x0
    // 0x4037e0: LoadField: r0 = r1->field_3b
    //     0x4037e0: ldur            w0, [x1, #0x3b]
    // 0x4037e4: DecompressPointer r0
    //     0x4037e4: add             x0, x0, HEAP, lsl #32
    // 0x4037e8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4037ec: cmp             w0, w16
    // 0x4037f0: b.ne            #0x403800
    // 0x4037f4: r2 = settingsPage
    //     0x4037f4: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x4037f8: ldr             x2, [x2, #0x1a0]
    // 0x4037fc: r0 = InitLateFinalInstanceField()
    //     0x4037fc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403800: r1 = LoadClassIdInstr(r0)
    //     0x403800: ldur            x1, [x0, #-1]
    //     0x403804: ubfx            x1, x1, #0xc, #0x14
    // 0x403808: cmp             x1, #0xf4
    // 0x40380c: b.ne            #0x40381c
    // 0x403810: r0 = "Gameplay"
    //     0x403810: add             x0, PP, #0x11, lsl #12  ; [pp+0x11f88] "Gameplay"
    //     0x403814: ldr             x0, [x0, #0xf88]
    // 0x403818: b               #0x40384c
    // 0x40381c: cmp             x1, #0xf5
    // 0x403820: b.ne            #0x403830
    // 0x403824: r0 = "Игра"
    //     0x403824: add             x0, PP, #0x11, lsl #12  ; [pp+0x11f90] "Игра"
    //     0x403828: ldr             x0, [x0, #0xf90]
    // 0x40382c: b               #0x40384c
    // 0x403830: cmp             x1, #0xf6
    // 0x403834: b.ne            #0x403844
    // 0x403838: r0 = "Ойын барысы"
    //     0x403838: add             x0, PP, #0x11, lsl #12  ; [pp+0x11f98] "Ойын барысы"
    //     0x40383c: ldr             x0, [x0, #0xf98]
    // 0x403840: b               #0x40384c
    // 0x403844: r0 = "Como se Juega"
    //     0x403844: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fa0] "Como se Juega"
    //     0x403848: ldr             x0, [x0, #0xfa0]
    // 0x40384c: stur            x0, [fp, #-0x28]
    // 0x403850: r0 = Text()
    //     0x403850: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x403854: mov             x1, x0
    // 0x403858: ldur            x0, [fp, #-0x28]
    // 0x40385c: stur            x1, [fp, #-0x30]
    // 0x403860: StoreField: r1->field_b = r0
    //     0x403860: stur            w0, [x1, #0xb]
    // 0x403864: r0 = Instance_TextStyle
    //     0x403864: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fa8] Obj!TextStyle@5d58a1
    //     0x403868: ldr             x0, [x0, #0xfa8]
    // 0x40386c: StoreField: r1->field_13 = r0
    //     0x40386c: stur            w0, [x1, #0x13]
    // 0x403870: r0 = Padding()
    //     0x403870: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x403874: mov             x3, x0
    // 0x403878: r0 = Instance_EdgeInsets
    //     0x403878: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fb0] Obj!EdgeInsets@5cbf51
    //     0x40387c: ldr             x0, [x0, #0xfb0]
    // 0x403880: stur            x3, [fp, #-0x28]
    // 0x403884: StoreField: r3->field_f = r0
    //     0x403884: stur            w0, [x3, #0xf]
    // 0x403888: ldur            x1, [fp, #-0x30]
    // 0x40388c: StoreField: r3->field_b = r1
    //     0x40388c: stur            w1, [x3, #0xb]
    // 0x403890: r1 = <Widget>
    //     0x403890: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x403894: r2 = 26
    //     0x403894: mov             x2, #0x1a
    // 0x403898: r0 = AllocateArray()
    //     0x403898: bl              #0x5845d8  ; AllocateArrayStub
    // 0x40389c: mov             x1, x0
    // 0x4038a0: ldur            x0, [fp, #-0x28]
    // 0x4038a4: stur            x1, [fp, #-0x30]
    // 0x4038a8: StoreField: r1->field_f = r0
    //     0x4038a8: stur            w0, [x1, #0xf]
    // 0x4038ac: r16 = <AppLocale, Translations>
    //     0x4038ac: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4038b0: ldur            lr, [fp, #-0x18]
    // 0x4038b4: stp             lr, x16, [SP]
    // 0x4038b8: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x4038b8: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x4038bc: r0 = LocaleSettingsExt.currentTranslations()
    //     0x4038bc: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x4038c0: r1 = LoadClassIdInstr(r0)
    //     0x4038c0: ldur            x1, [x0, #-1]
    //     0x4038c4: ubfx            x1, x1, #0xc, #0x14
    // 0x4038c8: cmp             x1, #0x8dd
    // 0x4038cc: b.ne            #0x4038f8
    // 0x4038d0: mov             x1, x0
    // 0x4038d4: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x4038d4: ldur            w0, [x1, #0x17]
    // 0x4038d8: DecompressPointer r0
    //     0x4038d8: add             x0, x0, HEAP, lsl #32
    // 0x4038dc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4038e0: cmp             w0, w16
    // 0x4038e4: b.ne            #0x4038f4
    // 0x4038e8: r2 = settingsPage
    //     0x4038e8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x4038ec: ldr             x2, [x2, #0x188]
    // 0x4038f0: r0 = InitLateFinalInstanceField()
    //     0x4038f0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4038f4: b               #0x40397c
    // 0x4038f8: cmp             x1, #0x8df
    // 0x4038fc: b.ne            #0x403928
    // 0x403900: mov             x1, x0
    // 0x403904: LoadField: r0 = r1->field_3b
    //     0x403904: ldur            w0, [x1, #0x3b]
    // 0x403908: DecompressPointer r0
    //     0x403908: add             x0, x0, HEAP, lsl #32
    // 0x40390c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403910: cmp             w0, w16
    // 0x403914: b.ne            #0x403924
    // 0x403918: r2 = settingsPage
    //     0x403918: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x40391c: ldr             x2, [x2, #0x190]
    // 0x403920: r0 = InitLateFinalInstanceField()
    //     0x403920: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403924: b               #0x40397c
    // 0x403928: cmp             x1, #0x8e0
    // 0x40392c: b.ne            #0x403958
    // 0x403930: mov             x1, x0
    // 0x403934: LoadField: r0 = r1->field_3b
    //     0x403934: ldur            w0, [x1, #0x3b]
    // 0x403938: DecompressPointer r0
    //     0x403938: add             x0, x0, HEAP, lsl #32
    // 0x40393c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403940: cmp             w0, w16
    // 0x403944: b.ne            #0x403954
    // 0x403948: r2 = settingsPage
    //     0x403948: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x40394c: ldr             x2, [x2, #0x198]
    // 0x403950: r0 = InitLateFinalInstanceField()
    //     0x403950: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403954: b               #0x40397c
    // 0x403958: mov             x1, x0
    // 0x40395c: LoadField: r0 = r1->field_3b
    //     0x40395c: ldur            w0, [x1, #0x3b]
    // 0x403960: DecompressPointer r0
    //     0x403960: add             x0, x0, HEAP, lsl #32
    // 0x403964: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403968: cmp             w0, w16
    // 0x40396c: b.ne            #0x40397c
    // 0x403970: r2 = settingsPage
    //     0x403970: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x403974: ldr             x2, [x2, #0x1a0]
    // 0x403978: r0 = InitLateFinalInstanceField()
    //     0x403978: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40397c: r1 = LoadClassIdInstr(r0)
    //     0x40397c: ldur            x1, [x0, #-1]
    //     0x403980: ubfx            x1, x1, #0xc, #0x14
    // 0x403984: cmp             x1, #0xf4
    // 0x403988: b.ne            #0x403998
    // 0x40398c: r1 = "Music volume"
    //     0x40398c: add             x1, PP, #0x11, lsl #12  ; [pp+0x111f8] "Music volume"
    //     0x403990: ldr             x1, [x1, #0x1f8]
    // 0x403994: b               #0x4039c8
    // 0x403998: cmp             x1, #0xf5
    // 0x40399c: b.ne            #0x4039ac
    // 0x4039a0: r1 = "Громкость фоновой музыки"
    //     0x4039a0: add             x1, PP, #0x11, lsl #12  ; [pp+0x11200] "Громкость фоновой музыки"
    //     0x4039a4: ldr             x1, [x1, #0x200]
    // 0x4039a8: b               #0x4039c8
    // 0x4039ac: cmp             x1, #0xf6
    // 0x4039b0: b.ne            #0x4039c0
    // 0x4039b4: r1 = "Музыканың дыбыс деңгейі"
    //     0x4039b4: add             x1, PP, #0x11, lsl #12  ; [pp+0x11208] "Музыканың дыбыс деңгейі"
    //     0x4039b8: ldr             x1, [x1, #0x208]
    // 0x4039bc: b               #0x4039c8
    // 0x4039c0: r1 = "Volumen de música"
    //     0x4039c0: add             x1, PP, #0x11, lsl #12  ; [pp+0x11210] "Volumen de música"
    //     0x4039c4: ldr             x1, [x1, #0x210]
    // 0x4039c8: ldur            x0, [fp, #-8]
    // 0x4039cc: stur            x1, [fp, #-0x28]
    // 0x4039d0: r0 = Text()
    //     0x4039d0: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x4039d4: mov             x2, x0
    // 0x4039d8: ldur            x0, [fp, #-0x28]
    // 0x4039dc: stur            x2, [fp, #-0x40]
    // 0x4039e0: StoreField: r2->field_b = r0
    //     0x4039e0: stur            w0, [x2, #0xb]
    // 0x4039e4: ldur            x1, [fp, #-0x20]
    // 0x4039e8: LoadField: r0 = r1->field_1f
    //     0x4039e8: ldur            w0, [x1, #0x1f]
    // 0x4039ec: DecompressPointer r0
    //     0x4039ec: add             x0, x0, HEAP, lsl #32
    // 0x4039f0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4039f4: cmp             w0, w16
    // 0x4039f8: b.ne            #0x403a08
    // 0x4039fc: r2 = musicNote
    //     0x4039fc: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f78] Field <NesIconCollection.musicNote>: late final (offset: 0x20)
    //     0x403a00: ldr             x2, [x2, #0xf78]
    // 0x403a04: r0 = InitLateFinalInstanceField()
    //     0x403a04: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403a08: stur            x0, [fp, #-0x28]
    // 0x403a0c: r0 = NesIcon()
    //     0x403a0c: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x403a10: mov             x1, x0
    // 0x403a14: ldur            x0, [fp, #-0x28]
    // 0x403a18: stur            x1, [fp, #-0x48]
    // 0x403a1c: StoreField: r1->field_b = r0
    //     0x403a1c: stur            w0, [x1, #0xb]
    // 0x403a20: r0 = LoadStaticField(0xccc)
    //     0x403a20: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x403a24: ldr             x0, [x0, #0x1998]
    // 0x403a28: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403a2c: cmp             w0, w16
    // 0x403a30: b.ne            #0x403a40
    // 0x403a34: r2 = stows
    //     0x403a34: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x403a38: ldr             x2, [x2, #0x310]
    // 0x403a3c: r0 = InitLateFinalStaticField()
    //     0x403a3c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x403a40: stur            x0, [fp, #-0x50]
    // 0x403a44: LoadField: r3 = r0->field_1b
    //     0x403a44: ldur            w3, [x0, #0x1b]
    // 0x403a48: DecompressPointer r3
    //     0x403a48: add             x3, x3, HEAP, lsl #32
    // 0x403a4c: stur            x3, [fp, #-0x28]
    // 0x403a50: r1 = Function '<anonymous closure>':.
    //     0x403a50: add             x1, PP, #0x11, lsl #12  ; [pp+0x11fb8] AnonymousClosure: (0x42b8d0), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x403a54: ldr             x1, [x1, #0xfb8]
    // 0x403a58: r2 = Null
    //     0x403a58: mov             x2, NULL
    // 0x403a5c: r0 = AllocateClosure()
    //     0x403a5c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x403a60: stur            x0, [fp, #-0x58]
    // 0x403a64: r0 = ListenableBuilder()
    //     0x403a64: bl              #0x36797c  ; AllocateListenableBuilderStub -> ListenableBuilder (size=0x18)
    // 0x403a68: mov             x1, x0
    // 0x403a6c: ldur            x0, [fp, #-0x58]
    // 0x403a70: stur            x1, [fp, #-0x60]
    // 0x403a74: StoreField: r1->field_f = r0
    //     0x403a74: stur            w0, [x1, #0xf]
    // 0x403a78: ldur            x0, [fp, #-0x28]
    // 0x403a7c: StoreField: r1->field_b = r0
    //     0x403a7c: stur            w0, [x1, #0xb]
    // 0x403a80: r0 = SizedBox()
    //     0x403a80: bl              #0x363c60  ; AllocateSizedBoxStub -> SizedBox (size=0x18)
    // 0x403a84: mov             x1, x0
    // 0x403a88: r0 = 200.000000
    //     0x403a88: add             x0, PP, #8, lsl #12  ; [pp+0x8720] 200
    //     0x403a8c: ldr             x0, [x0, #0x720]
    // 0x403a90: stur            x1, [fp, #-0x28]
    // 0x403a94: StoreField: r1->field_f = r0
    //     0x403a94: stur            w0, [x1, #0xf]
    // 0x403a98: ldur            x2, [fp, #-0x60]
    // 0x403a9c: StoreField: r1->field_b = r2
    //     0x403a9c: stur            w2, [x1, #0xb]
    // 0x403aa0: r0 = ListTile()
    //     0x403aa0: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x403aa4: mov             x1, x0
    // 0x403aa8: ldur            x0, [fp, #-0x48]
    // 0x403aac: stur            x1, [fp, #-0x58]
    // 0x403ab0: StoreField: r1->field_b = r0
    //     0x403ab0: stur            w0, [x1, #0xb]
    // 0x403ab4: ldur            x0, [fp, #-0x40]
    // 0x403ab8: StoreField: r1->field_f = r0
    //     0x403ab8: stur            w0, [x1, #0xf]
    // 0x403abc: ldur            x0, [fp, #-0x28]
    // 0x403ac0: ArrayStore: r1[0] = r0  ; List_4
    //     0x403ac0: stur            w0, [x1, #0x17]
    // 0x403ac4: r0 = Instance_RoundedRectangleBorder
    //     0x403ac4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x403ac8: ldr             x0, [x0, #0xfc0]
    // 0x403acc: StoreField: r1->field_27 = r0
    //     0x403acc: stur            w0, [x1, #0x27]
    // 0x403ad0: r2 = Instance_EdgeInsets
    //     0x403ad0: add             x2, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x403ad4: ldr             x2, [x2, #0xd48]
    // 0x403ad8: StoreField: r1->field_47 = r2
    //     0x403ad8: stur            w2, [x1, #0x47]
    // 0x403adc: r3 = true
    //     0x403adc: add             x3, NULL, #0x20  ; true
    // 0x403ae0: StoreField: r1->field_4b = r3
    //     0x403ae0: stur            w3, [x1, #0x4b]
    // 0x403ae4: r4 = false
    //     0x403ae4: add             x4, NULL, #0x30  ; false
    // 0x403ae8: StoreField: r1->field_5f = r4
    //     0x403ae8: stur            w4, [x1, #0x5f]
    // 0x403aec: StoreField: r1->field_73 = r4
    //     0x403aec: stur            w4, [x1, #0x73]
    // 0x403af0: ldur            x5, [fp, #-8]
    // 0x403af4: StoreField: r1->field_77 = r5
    //     0x403af4: stur            w5, [x1, #0x77]
    // 0x403af8: StoreField: r1->field_97 = r3
    //     0x403af8: stur            w3, [x1, #0x97]
    // 0x403afc: r0 = NesContainer()
    //     0x403afc: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x403b00: mov             x1, x0
    // 0x403b04: ldur            x0, [fp, #-0x58]
    // 0x403b08: stur            x1, [fp, #-0x28]
    // 0x403b0c: StoreField: r1->field_f = r0
    //     0x403b0c: stur            w0, [x1, #0xf]
    // 0x403b10: r0 = Instance_EdgeInsets
    //     0x403b10: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x403b14: ldr             x0, [x0, #0x498]
    // 0x403b18: StoreField: r1->field_23 = r0
    //     0x403b18: stur            w0, [x1, #0x23]
    // 0x403b1c: r0 = Padding()
    //     0x403b1c: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x403b20: r2 = Instance_EdgeInsets
    //     0x403b20: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x403b24: ldr             x2, [x2, #0xfc8]
    // 0x403b28: StoreField: r0->field_f = r2
    //     0x403b28: stur            w2, [x0, #0xf]
    // 0x403b2c: ldur            x1, [fp, #-0x28]
    // 0x403b30: StoreField: r0->field_b = r1
    //     0x403b30: stur            w1, [x0, #0xb]
    // 0x403b34: ldur            x1, [fp, #-0x30]
    // 0x403b38: ArrayStore: r1[1] = r0  ; List_4
    //     0x403b38: add             x25, x1, #0x13
    //     0x403b3c: str             w0, [x25]
    //     0x403b40: tbz             w0, #0, #0x403b5c
    //     0x403b44: ldurb           w16, [x1, #-1]
    //     0x403b48: ldurb           w17, [x0, #-1]
    //     0x403b4c: and             x16, x17, x16, lsr #2
    //     0x403b50: tst             x16, HEAP, lsr #32
    //     0x403b54: b.eq            #0x403b5c
    //     0x403b58: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x403b5c: r16 = <AppLocale, Translations>
    //     0x403b5c: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x403b60: ldur            lr, [fp, #-0x18]
    // 0x403b64: stp             lr, x16, [SP]
    // 0x403b68: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x403b68: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x403b6c: r0 = LocaleSettingsExt.currentTranslations()
    //     0x403b6c: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x403b70: r1 = LoadClassIdInstr(r0)
    //     0x403b70: ldur            x1, [x0, #-1]
    //     0x403b74: ubfx            x1, x1, #0xc, #0x14
    // 0x403b78: cmp             x1, #0x8dd
    // 0x403b7c: b.ne            #0x403ba8
    // 0x403b80: mov             x1, x0
    // 0x403b84: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x403b84: ldur            w0, [x1, #0x17]
    // 0x403b88: DecompressPointer r0
    //     0x403b88: add             x0, x0, HEAP, lsl #32
    // 0x403b8c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403b90: cmp             w0, w16
    // 0x403b94: b.ne            #0x403ba4
    // 0x403b98: r2 = settingsPage
    //     0x403b98: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x403b9c: ldr             x2, [x2, #0x188]
    // 0x403ba0: r0 = InitLateFinalInstanceField()
    //     0x403ba0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403ba4: b               #0x403c2c
    // 0x403ba8: cmp             x1, #0x8df
    // 0x403bac: b.ne            #0x403bd8
    // 0x403bb0: mov             x1, x0
    // 0x403bb4: LoadField: r0 = r1->field_3b
    //     0x403bb4: ldur            w0, [x1, #0x3b]
    // 0x403bb8: DecompressPointer r0
    //     0x403bb8: add             x0, x0, HEAP, lsl #32
    // 0x403bbc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403bc0: cmp             w0, w16
    // 0x403bc4: b.ne            #0x403bd4
    // 0x403bc8: r2 = settingsPage
    //     0x403bc8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x403bcc: ldr             x2, [x2, #0x190]
    // 0x403bd0: r0 = InitLateFinalInstanceField()
    //     0x403bd0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403bd4: b               #0x403c2c
    // 0x403bd8: cmp             x1, #0x8e0
    // 0x403bdc: b.ne            #0x403c08
    // 0x403be0: mov             x1, x0
    // 0x403be4: LoadField: r0 = r1->field_3b
    //     0x403be4: ldur            w0, [x1, #0x3b]
    // 0x403be8: DecompressPointer r0
    //     0x403be8: add             x0, x0, HEAP, lsl #32
    // 0x403bec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403bf0: cmp             w0, w16
    // 0x403bf4: b.ne            #0x403c04
    // 0x403bf8: r2 = settingsPage
    //     0x403bf8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x403bfc: ldr             x2, [x2, #0x198]
    // 0x403c00: r0 = InitLateFinalInstanceField()
    //     0x403c00: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403c04: b               #0x403c2c
    // 0x403c08: mov             x1, x0
    // 0x403c0c: LoadField: r0 = r1->field_3b
    //     0x403c0c: ldur            w0, [x1, #0x3b]
    // 0x403c10: DecompressPointer r0
    //     0x403c10: add             x0, x0, HEAP, lsl #32
    // 0x403c14: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403c18: cmp             w0, w16
    // 0x403c1c: b.ne            #0x403c2c
    // 0x403c20: r2 = settingsPage
    //     0x403c20: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x403c24: ldr             x2, [x2, #0x1a0]
    // 0x403c28: r0 = InitLateFinalInstanceField()
    //     0x403c28: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403c2c: r1 = LoadClassIdInstr(r0)
    //     0x403c2c: ldur            x1, [x0, #-1]
    //     0x403c30: ubfx            x1, x1, #0xc, #0x14
    // 0x403c34: cmp             x1, #0xf4
    // 0x403c38: b.ne            #0x403c48
    // 0x403c3c: r2 = "Sound effects volume"
    //     0x403c3c: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a8] "Sound effects volume"
    //     0x403c40: ldr             x2, [x2, #0x1a8]
    // 0x403c44: b               #0x403c78
    // 0x403c48: cmp             x1, #0xf5
    // 0x403c4c: b.ne            #0x403c5c
    // 0x403c50: r2 = "Громкость звуковых эффектов"
    //     0x403c50: add             x2, PP, #0x11, lsl #12  ; [pp+0x111b0] "Громкость звуковых эффектов"
    //     0x403c54: ldr             x2, [x2, #0x1b0]
    // 0x403c58: b               #0x403c78
    // 0x403c5c: cmp             x1, #0xf6
    // 0x403c60: b.ne            #0x403c70
    // 0x403c64: r2 = "Дыбыс әсерлерінің көлемі"
    //     0x403c64: add             x2, PP, #0x11, lsl #12  ; [pp+0x111b8] "Дыбыс әсерлерінің көлемі"
    //     0x403c68: ldr             x2, [x2, #0x1b8]
    // 0x403c6c: b               #0x403c78
    // 0x403c70: r2 = "Volumen de efectos de sonido"
    //     0x403c70: add             x2, PP, #0x11, lsl #12  ; [pp+0x111c0] "Volumen de efectos de sonido"
    //     0x403c74: ldr             x2, [x2, #0x1c0]
    // 0x403c78: ldur            x0, [fp, #-8]
    // 0x403c7c: ldur            x1, [fp, #-0x50]
    // 0x403c80: stur            x2, [fp, #-0x28]
    // 0x403c84: r0 = Text()
    //     0x403c84: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x403c88: mov             x2, x0
    // 0x403c8c: ldur            x0, [fp, #-0x28]
    // 0x403c90: stur            x2, [fp, #-0x40]
    // 0x403c94: StoreField: r2->field_b = r0
    //     0x403c94: stur            w0, [x2, #0xb]
    // 0x403c98: ldur            x1, [fp, #-0x20]
    // 0x403c9c: LoadField: r0 = r1->field_43
    //     0x403c9c: ldur            w0, [x1, #0x43]
    // 0x403ca0: DecompressPointer r0
    //     0x403ca0: add             x0, x0, HEAP, lsl #32
    // 0x403ca4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403ca8: cmp             w0, w16
    // 0x403cac: b.ne            #0x403cbc
    // 0x403cb0: r2 = bell
    //     0x403cb0: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f98] Field <NesIconCollection.bell>: late final (offset: 0x44)
    //     0x403cb4: ldr             x2, [x2, #0xf98]
    // 0x403cb8: r0 = InitLateFinalInstanceField()
    //     0x403cb8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403cbc: stur            x0, [fp, #-0x28]
    // 0x403cc0: r0 = NesIcon()
    //     0x403cc0: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x403cc4: mov             x3, x0
    // 0x403cc8: ldur            x0, [fp, #-0x28]
    // 0x403ccc: stur            x3, [fp, #-0x48]
    // 0x403cd0: StoreField: r3->field_b = r0
    //     0x403cd0: stur            w0, [x3, #0xb]
    // 0x403cd4: ldur            x0, [fp, #-0x50]
    // 0x403cd8: LoadField: r4 = r0->field_1f
    //     0x403cd8: ldur            w4, [x0, #0x1f]
    // 0x403cdc: DecompressPointer r4
    //     0x403cdc: add             x4, x4, HEAP, lsl #32
    // 0x403ce0: stur            x4, [fp, #-0x28]
    // 0x403ce4: r1 = Function '<anonymous closure>':.
    //     0x403ce4: add             x1, PP, #0x11, lsl #12  ; [pp+0x11fd0] AnonymousClosure: (0x42b7a0), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x403ce8: ldr             x1, [x1, #0xfd0]
    // 0x403cec: r2 = Null
    //     0x403cec: mov             x2, NULL
    // 0x403cf0: r0 = AllocateClosure()
    //     0x403cf0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x403cf4: stur            x0, [fp, #-0x58]
    // 0x403cf8: r0 = ListenableBuilder()
    //     0x403cf8: bl              #0x36797c  ; AllocateListenableBuilderStub -> ListenableBuilder (size=0x18)
    // 0x403cfc: mov             x1, x0
    // 0x403d00: ldur            x0, [fp, #-0x58]
    // 0x403d04: stur            x1, [fp, #-0x60]
    // 0x403d08: StoreField: r1->field_f = r0
    //     0x403d08: stur            w0, [x1, #0xf]
    // 0x403d0c: ldur            x0, [fp, #-0x28]
    // 0x403d10: StoreField: r1->field_b = r0
    //     0x403d10: stur            w0, [x1, #0xb]
    // 0x403d14: r0 = SizedBox()
    //     0x403d14: bl              #0x363c60  ; AllocateSizedBoxStub -> SizedBox (size=0x18)
    // 0x403d18: mov             x1, x0
    // 0x403d1c: r0 = 200.000000
    //     0x403d1c: add             x0, PP, #8, lsl #12  ; [pp+0x8720] 200
    //     0x403d20: ldr             x0, [x0, #0x720]
    // 0x403d24: stur            x1, [fp, #-0x28]
    // 0x403d28: StoreField: r1->field_f = r0
    //     0x403d28: stur            w0, [x1, #0xf]
    // 0x403d2c: ldur            x0, [fp, #-0x60]
    // 0x403d30: StoreField: r1->field_b = r0
    //     0x403d30: stur            w0, [x1, #0xb]
    // 0x403d34: r0 = ListTile()
    //     0x403d34: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x403d38: mov             x1, x0
    // 0x403d3c: ldur            x0, [fp, #-0x48]
    // 0x403d40: stur            x1, [fp, #-0x58]
    // 0x403d44: StoreField: r1->field_b = r0
    //     0x403d44: stur            w0, [x1, #0xb]
    // 0x403d48: ldur            x0, [fp, #-0x40]
    // 0x403d4c: StoreField: r1->field_f = r0
    //     0x403d4c: stur            w0, [x1, #0xf]
    // 0x403d50: ldur            x0, [fp, #-0x28]
    // 0x403d54: ArrayStore: r1[0] = r0  ; List_4
    //     0x403d54: stur            w0, [x1, #0x17]
    // 0x403d58: r0 = Instance_RoundedRectangleBorder
    //     0x403d58: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x403d5c: ldr             x0, [x0, #0xfc0]
    // 0x403d60: StoreField: r1->field_27 = r0
    //     0x403d60: stur            w0, [x1, #0x27]
    // 0x403d64: r2 = Instance_EdgeInsets
    //     0x403d64: add             x2, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x403d68: ldr             x2, [x2, #0xd48]
    // 0x403d6c: StoreField: r1->field_47 = r2
    //     0x403d6c: stur            w2, [x1, #0x47]
    // 0x403d70: r3 = true
    //     0x403d70: add             x3, NULL, #0x20  ; true
    // 0x403d74: StoreField: r1->field_4b = r3
    //     0x403d74: stur            w3, [x1, #0x4b]
    // 0x403d78: r4 = false
    //     0x403d78: add             x4, NULL, #0x30  ; false
    // 0x403d7c: StoreField: r1->field_5f = r4
    //     0x403d7c: stur            w4, [x1, #0x5f]
    // 0x403d80: StoreField: r1->field_73 = r4
    //     0x403d80: stur            w4, [x1, #0x73]
    // 0x403d84: ldur            x5, [fp, #-8]
    // 0x403d88: StoreField: r1->field_77 = r5
    //     0x403d88: stur            w5, [x1, #0x77]
    // 0x403d8c: StoreField: r1->field_97 = r3
    //     0x403d8c: stur            w3, [x1, #0x97]
    // 0x403d90: r0 = NesContainer()
    //     0x403d90: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x403d94: mov             x1, x0
    // 0x403d98: ldur            x0, [fp, #-0x58]
    // 0x403d9c: stur            x1, [fp, #-0x28]
    // 0x403da0: StoreField: r1->field_f = r0
    //     0x403da0: stur            w0, [x1, #0xf]
    // 0x403da4: r0 = Instance_EdgeInsets
    //     0x403da4: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x403da8: ldr             x0, [x0, #0x498]
    // 0x403dac: StoreField: r1->field_23 = r0
    //     0x403dac: stur            w0, [x1, #0x23]
    // 0x403db0: r0 = Padding()
    //     0x403db0: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x403db4: r2 = Instance_EdgeInsets
    //     0x403db4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x403db8: ldr             x2, [x2, #0xfc8]
    // 0x403dbc: StoreField: r0->field_f = r2
    //     0x403dbc: stur            w2, [x0, #0xf]
    // 0x403dc0: ldur            x1, [fp, #-0x28]
    // 0x403dc4: StoreField: r0->field_b = r1
    //     0x403dc4: stur            w1, [x0, #0xb]
    // 0x403dc8: ldur            x1, [fp, #-0x30]
    // 0x403dcc: ArrayStore: r1[2] = r0  ; List_4
    //     0x403dcc: add             x25, x1, #0x17
    //     0x403dd0: str             w0, [x25]
    //     0x403dd4: tbz             w0, #0, #0x403df0
    //     0x403dd8: ldurb           w16, [x1, #-1]
    //     0x403ddc: ldurb           w17, [x0, #-1]
    //     0x403de0: and             x16, x17, x16, lsr #2
    //     0x403de4: tst             x16, HEAP, lsr #32
    //     0x403de8: b.eq            #0x403df0
    //     0x403dec: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x403df0: ldur            x0, [fp, #-0x50]
    // 0x403df4: LoadField: r1 = r0->field_23
    //     0x403df4: ldur            w1, [x0, #0x23]
    // 0x403df8: DecompressPointer r1
    //     0x403df8: add             x1, x1, HEAP, lsl #32
    // 0x403dfc: stur            x1, [fp, #-0x28]
    // 0x403e00: r16 = <AppLocale, Translations>
    //     0x403e00: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x403e04: ldur            lr, [fp, #-0x18]
    // 0x403e08: stp             lr, x16, [SP]
    // 0x403e0c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x403e0c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x403e10: r0 = LocaleSettingsExt.currentTranslations()
    //     0x403e10: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x403e14: r1 = LoadClassIdInstr(r0)
    //     0x403e14: ldur            x1, [x0, #-1]
    //     0x403e18: ubfx            x1, x1, #0xc, #0x14
    // 0x403e1c: cmp             x1, #0x8dd
    // 0x403e20: b.ne            #0x403e4c
    // 0x403e24: mov             x1, x0
    // 0x403e28: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x403e28: ldur            w0, [x1, #0x17]
    // 0x403e2c: DecompressPointer r0
    //     0x403e2c: add             x0, x0, HEAP, lsl #32
    // 0x403e30: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403e34: cmp             w0, w16
    // 0x403e38: b.ne            #0x403e48
    // 0x403e3c: r2 = settingsPage
    //     0x403e3c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x403e40: ldr             x2, [x2, #0x188]
    // 0x403e44: r0 = InitLateFinalInstanceField()
    //     0x403e44: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403e48: b               #0x403ed0
    // 0x403e4c: cmp             x1, #0x8df
    // 0x403e50: b.ne            #0x403e7c
    // 0x403e54: mov             x1, x0
    // 0x403e58: LoadField: r0 = r1->field_3b
    //     0x403e58: ldur            w0, [x1, #0x3b]
    // 0x403e5c: DecompressPointer r0
    //     0x403e5c: add             x0, x0, HEAP, lsl #32
    // 0x403e60: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403e64: cmp             w0, w16
    // 0x403e68: b.ne            #0x403e78
    // 0x403e6c: r2 = settingsPage
    //     0x403e6c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x403e70: ldr             x2, [x2, #0x190]
    // 0x403e74: r0 = InitLateFinalInstanceField()
    //     0x403e74: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403e78: b               #0x403ed0
    // 0x403e7c: cmp             x1, #0x8e0
    // 0x403e80: b.ne            #0x403eac
    // 0x403e84: mov             x1, x0
    // 0x403e88: LoadField: r0 = r1->field_3b
    //     0x403e88: ldur            w0, [x1, #0x3b]
    // 0x403e8c: DecompressPointer r0
    //     0x403e8c: add             x0, x0, HEAP, lsl #32
    // 0x403e90: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403e94: cmp             w0, w16
    // 0x403e98: b.ne            #0x403ea8
    // 0x403e9c: r2 = settingsPage
    //     0x403e9c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x403ea0: ldr             x2, [x2, #0x198]
    // 0x403ea4: r0 = InitLateFinalInstanceField()
    //     0x403ea4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403ea8: b               #0x403ed0
    // 0x403eac: mov             x1, x0
    // 0x403eb0: LoadField: r0 = r1->field_3b
    //     0x403eb0: ldur            w0, [x1, #0x3b]
    // 0x403eb4: DecompressPointer r0
    //     0x403eb4: add             x0, x0, HEAP, lsl #32
    // 0x403eb8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x403ebc: cmp             w0, w16
    // 0x403ec0: b.ne            #0x403ed0
    // 0x403ec4: r2 = settingsPage
    //     0x403ec4: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x403ec8: ldr             x2, [x2, #0x1a0]
    // 0x403ecc: r0 = InitLateFinalInstanceField()
    //     0x403ecc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x403ed0: r1 = LoadClassIdInstr(r0)
    //     0x403ed0: ldur            x1, [x0, #-1]
    //     0x403ed4: ubfx            x1, x1, #0xc, #0x14
    // 0x403ed8: cmp             x1, #0xf4
    // 0x403edc: b.ne            #0x403eec
    // 0x403ee0: r2 = "Allow undoing moves"
    //     0x403ee0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fd8] "Allow undoing moves"
    //     0x403ee4: ldr             x2, [x2, #0xfd8]
    // 0x403ee8: b               #0x403f1c
    // 0x403eec: cmp             x1, #0xf5
    // 0x403ef0: b.ne            #0x403f00
    // 0x403ef4: r2 = "Разрешить отмену бросков"
    //     0x403ef4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fe0] "Разрешить отмену бросков"
    //     0x403ef8: ldr             x2, [x2, #0xfe0]
    // 0x403efc: b               #0x403f1c
    // 0x403f00: cmp             x1, #0xf6
    // 0x403f04: b.ne            #0x403f14
    // 0x403f08: r2 = "Қозғалысты қайтаруға рұқсат беріңіз"
    //     0x403f08: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fe8] "Қозғалысты қайтаруға рұқсат беріңіз"
    //     0x403f0c: ldr             x2, [x2, #0xfe8]
    // 0x403f10: b               #0x403f1c
    // 0x403f14: r2 = "Permitir deshacer movimientos"
    //     0x403f14: add             x2, PP, #0x11, lsl #12  ; [pp+0x11ff0] "Permitir deshacer movimientos"
    //     0x403f18: ldr             x2, [x2, #0xff0]
    // 0x403f1c: ldur            x1, [fp, #-0x28]
    // 0x403f20: ldur            x0, [fp, #-0x50]
    // 0x403f24: stur            x2, [fp, #-0x40]
    // 0x403f28: r0 = Text()
    //     0x403f28: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x403f2c: mov             x2, x0
    // 0x403f30: ldur            x0, [fp, #-0x40]
    // 0x403f34: stur            x2, [fp, #-0x48]
    // 0x403f38: StoreField: r2->field_b = r0
    //     0x403f38: stur            w0, [x2, #0xb]
    // 0x403f3c: r1 = <bool>
    //     0x403f3c: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x403f40: r0 = ValueListenableBuilder()
    //     0x403f40: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x403f44: mov             x3, x0
    // 0x403f48: ldur            x0, [fp, #-0x28]
    // 0x403f4c: stur            x3, [fp, #-0x40]
    // 0x403f50: StoreField: r3->field_f = r0
    //     0x403f50: stur            w0, [x3, #0xf]
    // 0x403f54: ldur            x2, [fp, #-0x10]
    // 0x403f58: r1 = Function '<anonymous closure>':.
    //     0x403f58: add             x1, PP, #0x11, lsl #12  ; [pp+0x11ff8] AnonymousClosure: (0x42b504), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x403f5c: ldr             x1, [x1, #0xff8]
    // 0x403f60: r0 = AllocateClosure()
    //     0x403f60: bl              #0x5838bc  ; AllocateClosureStub
    // 0x403f64: mov             x1, x0
    // 0x403f68: ldur            x0, [fp, #-0x40]
    // 0x403f6c: StoreField: r0->field_13 = r1
    //     0x403f6c: stur            w1, [x0, #0x13]
    // 0x403f70: ldur            x1, [fp, #-0x48]
    // 0x403f74: ArrayStore: r0[0] = r1  ; List_4
    //     0x403f74: stur            w1, [x0, #0x17]
    // 0x403f78: r0 = NesContainer()
    //     0x403f78: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x403f7c: mov             x1, x0
    // 0x403f80: ldur            x0, [fp, #-0x40]
    // 0x403f84: stur            x1, [fp, #-0x28]
    // 0x403f88: StoreField: r1->field_f = r0
    //     0x403f88: stur            w0, [x1, #0xf]
    // 0x403f8c: r0 = Instance_EdgeInsets
    //     0x403f8c: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x403f90: ldr             x0, [x0, #0x498]
    // 0x403f94: StoreField: r1->field_23 = r0
    //     0x403f94: stur            w0, [x1, #0x23]
    // 0x403f98: r0 = Padding()
    //     0x403f98: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x403f9c: r2 = Instance_EdgeInsets
    //     0x403f9c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x403fa0: ldr             x2, [x2, #0xfc8]
    // 0x403fa4: StoreField: r0->field_f = r2
    //     0x403fa4: stur            w2, [x0, #0xf]
    // 0x403fa8: ldur            x1, [fp, #-0x28]
    // 0x403fac: StoreField: r0->field_b = r1
    //     0x403fac: stur            w1, [x0, #0xb]
    // 0x403fb0: ldur            x1, [fp, #-0x30]
    // 0x403fb4: ArrayStore: r1[3] = r0  ; List_4
    //     0x403fb4: add             x25, x1, #0x1b
    //     0x403fb8: str             w0, [x25]
    //     0x403fbc: tbz             w0, #0, #0x403fd8
    //     0x403fc0: ldurb           w16, [x1, #-1]
    //     0x403fc4: ldurb           w17, [x0, #-1]
    //     0x403fc8: and             x16, x17, x16, lsr #2
    //     0x403fcc: tst             x16, HEAP, lsr #32
    //     0x403fd0: b.eq            #0x403fd8
    //     0x403fd4: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x403fd8: ldur            x0, [fp, #-0x50]
    // 0x403fdc: LoadField: r1 = r0->field_27
    //     0x403fdc: ldur            w1, [x0, #0x27]
    // 0x403fe0: DecompressPointer r1
    //     0x403fe0: add             x1, x1, HEAP, lsl #32
    // 0x403fe4: stur            x1, [fp, #-0x28]
    // 0x403fe8: r16 = <AppLocale, Translations>
    //     0x403fe8: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x403fec: ldur            lr, [fp, #-0x18]
    // 0x403ff0: stp             lr, x16, [SP]
    // 0x403ff4: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x403ff4: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x403ff8: r0 = LocaleSettingsExt.currentTranslations()
    //     0x403ff8: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x403ffc: r1 = LoadClassIdInstr(r0)
    //     0x403ffc: ldur            x1, [x0, #-1]
    //     0x404000: ubfx            x1, x1, #0xc, #0x14
    // 0x404004: cmp             x1, #0x8dd
    // 0x404008: b.ne            #0x404034
    // 0x40400c: mov             x1, x0
    // 0x404010: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x404010: ldur            w0, [x1, #0x17]
    // 0x404014: DecompressPointer r0
    //     0x404014: add             x0, x0, HEAP, lsl #32
    // 0x404018: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40401c: cmp             w0, w16
    // 0x404020: b.ne            #0x404030
    // 0x404024: r2 = settingsPage
    //     0x404024: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x404028: ldr             x2, [x2, #0x188]
    // 0x40402c: r0 = InitLateFinalInstanceField()
    //     0x40402c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404030: b               #0x4040b8
    // 0x404034: cmp             x1, #0x8df
    // 0x404038: b.ne            #0x404064
    // 0x40403c: mov             x1, x0
    // 0x404040: LoadField: r0 = r1->field_3b
    //     0x404040: ldur            w0, [x1, #0x3b]
    // 0x404044: DecompressPointer r0
    //     0x404044: add             x0, x0, HEAP, lsl #32
    // 0x404048: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40404c: cmp             w0, w16
    // 0x404050: b.ne            #0x404060
    // 0x404054: r2 = settingsPage
    //     0x404054: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x404058: ldr             x2, [x2, #0x190]
    // 0x40405c: r0 = InitLateFinalInstanceField()
    //     0x40405c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404060: b               #0x4040b8
    // 0x404064: cmp             x1, #0x8e0
    // 0x404068: b.ne            #0x404094
    // 0x40406c: mov             x1, x0
    // 0x404070: LoadField: r0 = r1->field_3b
    //     0x404070: ldur            w0, [x1, #0x3b]
    // 0x404074: DecompressPointer r0
    //     0x404074: add             x0, x0, HEAP, lsl #32
    // 0x404078: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40407c: cmp             w0, w16
    // 0x404080: b.ne            #0x404090
    // 0x404084: r2 = settingsPage
    //     0x404084: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x404088: ldr             x2, [x2, #0x198]
    // 0x40408c: r0 = InitLateFinalInstanceField()
    //     0x40408c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404090: b               #0x4040b8
    // 0x404094: mov             x1, x0
    // 0x404098: LoadField: r0 = r1->field_3b
    //     0x404098: ldur            w0, [x1, #0x3b]
    // 0x40409c: DecompressPointer r0
    //     0x40409c: add             x0, x0, HEAP, lsl #32
    // 0x4040a0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4040a4: cmp             w0, w16
    // 0x4040a8: b.ne            #0x4040b8
    // 0x4040ac: r2 = settingsPage
    //     0x4040ac: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x4040b0: ldr             x2, [x2, #0x1a0]
    // 0x4040b4: r0 = InitLateFinalInstanceField()
    //     0x4040b4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4040b8: r1 = LoadClassIdInstr(r0)
    //     0x4040b8: ldur            x1, [x0, #-1]
    //     0x4040bc: ubfx            x1, x1, #0xc, #0x14
    // 0x4040c0: cmp             x1, #0xf4
    // 0x4040c4: b.ne            #0x4040d4
    // 0x4040c8: r1 = "Show reflection in aim guide"
    //     0x4040c8: add             x1, PP, #0x12, lsl #12  ; [pp+0x12000] "Show reflection in aim guide"
    //     0x4040cc: ldr             x1, [x1]
    // 0x4040d0: b               #0x404104
    // 0x4040d4: cmp             x1, #0xf5
    // 0x4040d8: b.ne            #0x4040e8
    // 0x4040dc: r1 = "Показывать отскок в прицельной траектории"
    //     0x4040dc: add             x1, PP, #0x12, lsl #12  ; [pp+0x12008] "Показывать отскок в прицельной траектории"
    //     0x4040e0: ldr             x1, [x1, #8]
    // 0x4040e4: b               #0x404104
    // 0x4040e8: cmp             x1, #0xf6
    // 0x4040ec: b.ne            #0x4040fc
    // 0x4040f0: r1 = "Мақсат нұсқаулығында рефлексияны көрсетіңіз"
    //     0x4040f0: add             x1, PP, #0x12, lsl #12  ; [pp+0x12010] "Мақсат нұсқаулығында рефлексияны көрсетіңіз"
    //     0x4040f4: ldr             x1, [x1, #0x10]
    // 0x4040f8: b               #0x404104
    // 0x4040fc: r1 = "Mostrar reflejo en la guía de objetivos."
    //     0x4040fc: add             x1, PP, #0x12, lsl #12  ; [pp+0x12018] "Mostrar reflejo en la guía de objetivos."
    //     0x404100: ldr             x1, [x1, #0x18]
    // 0x404104: ldur            x0, [fp, #-0x28]
    // 0x404108: stur            x1, [fp, #-0x40]
    // 0x40410c: r0 = Text()
    //     0x40410c: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x404110: mov             x2, x0
    // 0x404114: ldur            x0, [fp, #-0x40]
    // 0x404118: stur            x2, [fp, #-0x48]
    // 0x40411c: StoreField: r2->field_b = r0
    //     0x40411c: stur            w0, [x2, #0xb]
    // 0x404120: r1 = <bool>
    //     0x404120: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x404124: r0 = ValueListenableBuilder()
    //     0x404124: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x404128: mov             x3, x0
    // 0x40412c: ldur            x0, [fp, #-0x28]
    // 0x404130: stur            x3, [fp, #-0x40]
    // 0x404134: StoreField: r3->field_f = r0
    //     0x404134: stur            w0, [x3, #0xf]
    // 0x404138: ldur            x2, [fp, #-0x10]
    // 0x40413c: r1 = Function '<anonymous closure>':.
    //     0x40413c: add             x1, PP, #0x12, lsl #12  ; [pp+0x12020] AnonymousClosure: (0x42b1a4), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x404140: ldr             x1, [x1, #0x20]
    // 0x404144: r0 = AllocateClosure()
    //     0x404144: bl              #0x5838bc  ; AllocateClosureStub
    // 0x404148: mov             x1, x0
    // 0x40414c: ldur            x0, [fp, #-0x40]
    // 0x404150: StoreField: r0->field_13 = r1
    //     0x404150: stur            w1, [x0, #0x13]
    // 0x404154: ldur            x1, [fp, #-0x48]
    // 0x404158: ArrayStore: r0[0] = r1  ; List_4
    //     0x404158: stur            w1, [x0, #0x17]
    // 0x40415c: r0 = NesContainer()
    //     0x40415c: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x404160: mov             x1, x0
    // 0x404164: ldur            x0, [fp, #-0x40]
    // 0x404168: stur            x1, [fp, #-0x28]
    // 0x40416c: StoreField: r1->field_f = r0
    //     0x40416c: stur            w0, [x1, #0xf]
    // 0x404170: r0 = Instance_EdgeInsets
    //     0x404170: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x404174: ldr             x0, [x0, #0x498]
    // 0x404178: StoreField: r1->field_23 = r0
    //     0x404178: stur            w0, [x1, #0x23]
    // 0x40417c: r0 = Padding()
    //     0x40417c: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x404180: r2 = Instance_EdgeInsets
    //     0x404180: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x404184: ldr             x2, [x2, #0xfc8]
    // 0x404188: StoreField: r0->field_f = r2
    //     0x404188: stur            w2, [x0, #0xf]
    // 0x40418c: ldur            x1, [fp, #-0x28]
    // 0x404190: StoreField: r0->field_b = r1
    //     0x404190: stur            w1, [x0, #0xb]
    // 0x404194: ldur            x1, [fp, #-0x30]
    // 0x404198: ArrayStore: r1[4] = r0  ; List_4
    //     0x404198: add             x25, x1, #0x1f
    //     0x40419c: str             w0, [x25]
    //     0x4041a0: tbz             w0, #0, #0x4041bc
    //     0x4041a4: ldurb           w16, [x1, #-1]
    //     0x4041a8: ldurb           w17, [x0, #-1]
    //     0x4041ac: and             x16, x17, x16, lsr #2
    //     0x4041b0: tst             x16, HEAP, lsr #32
    //     0x4041b4: b.eq            #0x4041bc
    //     0x4041b8: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x4041bc: r16 = <AppLocale, Translations>
    //     0x4041bc: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4041c0: ldur            lr, [fp, #-0x18]
    // 0x4041c4: stp             lr, x16, [SP]
    // 0x4041c8: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x4041c8: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x4041cc: r0 = LocaleSettingsExt.currentTranslations()
    //     0x4041cc: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x4041d0: r1 = LoadClassIdInstr(r0)
    //     0x4041d0: ldur            x1, [x0, #-1]
    //     0x4041d4: ubfx            x1, x1, #0xc, #0x14
    // 0x4041d8: cmp             x1, #0x8dd
    // 0x4041dc: b.ne            #0x404208
    // 0x4041e0: mov             x1, x0
    // 0x4041e4: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x4041e4: ldur            w0, [x1, #0x17]
    // 0x4041e8: DecompressPointer r0
    //     0x4041e8: add             x0, x0, HEAP, lsl #32
    // 0x4041ec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4041f0: cmp             w0, w16
    // 0x4041f4: b.ne            #0x404204
    // 0x4041f8: r2 = settingsPage
    //     0x4041f8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x4041fc: ldr             x2, [x2, #0x188]
    // 0x404200: r0 = InitLateFinalInstanceField()
    //     0x404200: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404204: b               #0x40428c
    // 0x404208: cmp             x1, #0x8df
    // 0x40420c: b.ne            #0x404238
    // 0x404210: mov             x1, x0
    // 0x404214: LoadField: r0 = r1->field_3b
    //     0x404214: ldur            w0, [x1, #0x3b]
    // 0x404218: DecompressPointer r0
    //     0x404218: add             x0, x0, HEAP, lsl #32
    // 0x40421c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404220: cmp             w0, w16
    // 0x404224: b.ne            #0x404234
    // 0x404228: r2 = settingsPage
    //     0x404228: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x40422c: ldr             x2, [x2, #0x190]
    // 0x404230: r0 = InitLateFinalInstanceField()
    //     0x404230: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404234: b               #0x40428c
    // 0x404238: cmp             x1, #0x8e0
    // 0x40423c: b.ne            #0x404268
    // 0x404240: mov             x1, x0
    // 0x404244: LoadField: r0 = r1->field_3b
    //     0x404244: ldur            w0, [x1, #0x3b]
    // 0x404248: DecompressPointer r0
    //     0x404248: add             x0, x0, HEAP, lsl #32
    // 0x40424c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404250: cmp             w0, w16
    // 0x404254: b.ne            #0x404264
    // 0x404258: r2 = settingsPage
    //     0x404258: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x40425c: ldr             x2, [x2, #0x198]
    // 0x404260: r0 = InitLateFinalInstanceField()
    //     0x404260: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404264: b               #0x40428c
    // 0x404268: mov             x1, x0
    // 0x40426c: LoadField: r0 = r1->field_3b
    //     0x40426c: ldur            w0, [x1, #0x3b]
    // 0x404270: DecompressPointer r0
    //     0x404270: add             x0, x0, HEAP, lsl #32
    // 0x404274: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404278: cmp             w0, w16
    // 0x40427c: b.ne            #0x40428c
    // 0x404280: r2 = settingsPage
    //     0x404280: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x404284: ldr             x2, [x2, #0x1a0]
    // 0x404288: r0 = InitLateFinalInstanceField()
    //     0x404288: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40428c: r1 = LoadClassIdInstr(r0)
    //     0x40428c: ldur            x1, [x0, #-1]
    //     0x404290: ubfx            x1, x1, #0xc, #0x14
    // 0x404294: cmp             x1, #0xf4
    // 0x404298: b.ne            #0x4042a8
    // 0x40429c: r2 = "Max FPS"
    //     0x40429c: add             x2, PP, #0x12, lsl #12  ; [pp+0x12028] "Max FPS"
    //     0x4042a0: ldr             x2, [x2, #0x28]
    // 0x4042a4: b               #0x4042d8
    // 0x4042a8: cmp             x1, #0xf5
    // 0x4042ac: b.ne            #0x4042bc
    // 0x4042b0: r2 = "Максимальный FPS"
    //     0x4042b0: add             x2, PP, #0x12, lsl #12  ; [pp+0x12030] "Максимальный FPS"
    //     0x4042b4: ldr             x2, [x2, #0x30]
    // 0x4042b8: b               #0x4042d8
    // 0x4042bc: cmp             x1, #0xf6
    // 0x4042c0: b.ne            #0x4042d0
    // 0x4042c4: r2 = "Максималды FPS"
    //     0x4042c4: add             x2, PP, #0x12, lsl #12  ; [pp+0x12038] "Максималды FPS"
    //     0x4042c8: ldr             x2, [x2, #0x38]
    // 0x4042cc: b               #0x4042d8
    // 0x4042d0: r2 = "FPS máx."
    //     0x4042d0: add             x2, PP, #0x12, lsl #12  ; [pp+0x12040] "FPS máx."
    //     0x4042d4: ldr             x2, [x2, #0x40]
    // 0x4042d8: ldur            x1, [fp, #-8]
    // 0x4042dc: ldur            x0, [fp, #-0x50]
    // 0x4042e0: stur            x2, [fp, #-0x28]
    // 0x4042e4: r0 = Text()
    //     0x4042e4: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x4042e8: mov             x2, x0
    // 0x4042ec: ldur            x0, [fp, #-0x28]
    // 0x4042f0: stur            x2, [fp, #-0x40]
    // 0x4042f4: StoreField: r2->field_b = r0
    //     0x4042f4: stur            w0, [x2, #0xb]
    // 0x4042f8: ldur            x1, [fp, #-0x20]
    // 0x4042fc: LoadField: r0 = r1->field_2f
    //     0x4042fc: ldur            w0, [x1, #0x2f]
    // 0x404300: DecompressPointer r0
    //     0x404300: add             x0, x0, HEAP, lsl #32
    // 0x404304: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404308: cmp             w0, w16
    // 0x40430c: b.ne            #0x40431c
    // 0x404310: r2 = camera
    //     0x404310: add             x2, PP, #0x12, lsl #12  ; [pp+0x12048] Field <NesIconCollection.camera>: late final (offset: 0x30)
    //     0x404314: ldr             x2, [x2, #0x48]
    // 0x404318: r0 = InitLateFinalInstanceField()
    //     0x404318: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40431c: stur            x0, [fp, #-0x28]
    // 0x404320: r0 = NesIcon()
    //     0x404320: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x404324: mov             x2, x0
    // 0x404328: ldur            x0, [fp, #-0x28]
    // 0x40432c: stur            x2, [fp, #-0x48]
    // 0x404330: StoreField: r2->field_b = r0
    //     0x404330: stur            w0, [x2, #0xb]
    // 0x404334: ldur            x0, [fp, #-0x50]
    // 0x404338: LoadField: r3 = r0->field_37
    //     0x404338: ldur            w3, [x0, #0x37]
    // 0x40433c: DecompressPointer r3
    //     0x40433c: add             x3, x3, HEAP, lsl #32
    // 0x404340: stur            x3, [fp, #-0x28]
    // 0x404344: r1 = <int>
    //     0x404344: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x404348: r0 = ValueListenableBuilder()
    //     0x404348: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x40434c: mov             x3, x0
    // 0x404350: ldur            x0, [fp, #-0x28]
    // 0x404354: stur            x3, [fp, #-0x58]
    // 0x404358: StoreField: r3->field_f = r0
    //     0x404358: stur            w0, [x3, #0xf]
    // 0x40435c: r1 = Function '<anonymous closure>':.
    //     0x40435c: add             x1, PP, #0x12, lsl #12  ; [pp+0x12050] AnonymousClosure: (0x42b024), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x404360: ldr             x1, [x1, #0x50]
    // 0x404364: r2 = Null
    //     0x404364: mov             x2, NULL
    // 0x404368: r0 = AllocateClosure()
    //     0x404368: bl              #0x5838bc  ; AllocateClosureStub
    // 0x40436c: mov             x1, x0
    // 0x404370: ldur            x0, [fp, #-0x58]
    // 0x404374: StoreField: r0->field_13 = r1
    //     0x404374: stur            w1, [x0, #0x13]
    // 0x404378: r0 = ListTile()
    //     0x404378: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x40437c: mov             x3, x0
    // 0x404380: ldur            x0, [fp, #-0x48]
    // 0x404384: stur            x3, [fp, #-0x28]
    // 0x404388: StoreField: r3->field_b = r0
    //     0x404388: stur            w0, [x3, #0xb]
    // 0x40438c: ldur            x0, [fp, #-0x40]
    // 0x404390: StoreField: r3->field_f = r0
    //     0x404390: stur            w0, [x3, #0xf]
    // 0x404394: ldur            x0, [fp, #-0x58]
    // 0x404398: ArrayStore: r3[0] = r0  ; List_4
    //     0x404398: stur            w0, [x3, #0x17]
    // 0x40439c: r0 = Instance_RoundedRectangleBorder
    //     0x40439c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x4043a0: ldr             x0, [x0, #0xfc0]
    // 0x4043a4: StoreField: r3->field_27 = r0
    //     0x4043a4: stur            w0, [x3, #0x27]
    // 0x4043a8: r4 = Instance_EdgeInsets
    //     0x4043a8: add             x4, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x4043ac: ldr             x4, [x4, #0xd48]
    // 0x4043b0: StoreField: r3->field_47 = r4
    //     0x4043b0: stur            w4, [x3, #0x47]
    // 0x4043b4: r5 = true
    //     0x4043b4: add             x5, NULL, #0x20  ; true
    // 0x4043b8: StoreField: r3->field_4b = r5
    //     0x4043b8: stur            w5, [x3, #0x4b]
    // 0x4043bc: r1 = Function '<anonymous closure>':.
    //     0x4043bc: add             x1, PP, #0x12, lsl #12  ; [pp+0x12058] AnonymousClosure: (0x42af58), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x4043c0: ldr             x1, [x1, #0x58]
    // 0x4043c4: r2 = Null
    //     0x4043c4: mov             x2, NULL
    // 0x4043c8: r0 = AllocateClosure()
    //     0x4043c8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x4043cc: mov             x1, x0
    // 0x4043d0: ldur            x0, [fp, #-0x28]
    // 0x4043d4: StoreField: r0->field_4f = r1
    //     0x4043d4: stur            w1, [x0, #0x4f]
    // 0x4043d8: r1 = false
    //     0x4043d8: add             x1, NULL, #0x30  ; false
    // 0x4043dc: StoreField: r0->field_5f = r1
    //     0x4043dc: stur            w1, [x0, #0x5f]
    // 0x4043e0: StoreField: r0->field_73 = r1
    //     0x4043e0: stur            w1, [x0, #0x73]
    // 0x4043e4: ldur            x2, [fp, #-8]
    // 0x4043e8: StoreField: r0->field_77 = r2
    //     0x4043e8: stur            w2, [x0, #0x77]
    // 0x4043ec: r3 = true
    //     0x4043ec: add             x3, NULL, #0x20  ; true
    // 0x4043f0: StoreField: r0->field_97 = r3
    //     0x4043f0: stur            w3, [x0, #0x97]
    // 0x4043f4: r0 = NesContainer()
    //     0x4043f4: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x4043f8: mov             x1, x0
    // 0x4043fc: ldur            x0, [fp, #-0x28]
    // 0x404400: stur            x1, [fp, #-0x40]
    // 0x404404: StoreField: r1->field_f = r0
    //     0x404404: stur            w0, [x1, #0xf]
    // 0x404408: r0 = Instance_EdgeInsets
    //     0x404408: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x40440c: ldr             x0, [x0, #0x498]
    // 0x404410: StoreField: r1->field_23 = r0
    //     0x404410: stur            w0, [x1, #0x23]
    // 0x404414: r0 = Padding()
    //     0x404414: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x404418: r2 = Instance_EdgeInsets
    //     0x404418: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x40441c: ldr             x2, [x2, #0xfc8]
    // 0x404420: StoreField: r0->field_f = r2
    //     0x404420: stur            w2, [x0, #0xf]
    // 0x404424: ldur            x1, [fp, #-0x40]
    // 0x404428: StoreField: r0->field_b = r1
    //     0x404428: stur            w1, [x0, #0xb]
    // 0x40442c: ldur            x1, [fp, #-0x30]
    // 0x404430: ArrayStore: r1[5] = r0  ; List_4
    //     0x404430: add             x25, x1, #0x23
    //     0x404434: str             w0, [x25]
    //     0x404438: tbz             w0, #0, #0x404454
    //     0x40443c: ldurb           w16, [x1, #-1]
    //     0x404440: ldurb           w17, [x0, #-1]
    //     0x404444: and             x16, x17, x16, lsr #2
    //     0x404448: tst             x16, HEAP, lsr #32
    //     0x40444c: b.eq            #0x404454
    //     0x404450: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x404454: ldur            x0, [fp, #-0x50]
    // 0x404458: LoadField: r1 = r0->field_3b
    //     0x404458: ldur            w1, [x0, #0x3b]
    // 0x40445c: DecompressPointer r1
    //     0x40445c: add             x1, x1, HEAP, lsl #32
    // 0x404460: stur            x1, [fp, #-0x28]
    // 0x404464: r16 = <AppLocale, Translations>
    //     0x404464: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x404468: ldur            lr, [fp, #-0x18]
    // 0x40446c: stp             lr, x16, [SP]
    // 0x404470: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x404470: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x404474: r0 = LocaleSettingsExt.currentTranslations()
    //     0x404474: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x404478: r1 = LoadClassIdInstr(r0)
    //     0x404478: ldur            x1, [x0, #-1]
    //     0x40447c: ubfx            x1, x1, #0xc, #0x14
    // 0x404480: cmp             x1, #0x8dd
    // 0x404484: b.ne            #0x4044b0
    // 0x404488: mov             x1, x0
    // 0x40448c: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x40448c: ldur            w0, [x1, #0x17]
    // 0x404490: DecompressPointer r0
    //     0x404490: add             x0, x0, HEAP, lsl #32
    // 0x404494: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404498: cmp             w0, w16
    // 0x40449c: b.ne            #0x4044ac
    // 0x4044a0: r2 = settingsPage
    //     0x4044a0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x4044a4: ldr             x2, [x2, #0x188]
    // 0x4044a8: r0 = InitLateFinalInstanceField()
    //     0x4044a8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4044ac: b               #0x404534
    // 0x4044b0: cmp             x1, #0x8df
    // 0x4044b4: b.ne            #0x4044e0
    // 0x4044b8: mov             x1, x0
    // 0x4044bc: LoadField: r0 = r1->field_3b
    //     0x4044bc: ldur            w0, [x1, #0x3b]
    // 0x4044c0: DecompressPointer r0
    //     0x4044c0: add             x0, x0, HEAP, lsl #32
    // 0x4044c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4044c8: cmp             w0, w16
    // 0x4044cc: b.ne            #0x4044dc
    // 0x4044d0: r2 = settingsPage
    //     0x4044d0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x4044d4: ldr             x2, [x2, #0x190]
    // 0x4044d8: r0 = InitLateFinalInstanceField()
    //     0x4044d8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4044dc: b               #0x404534
    // 0x4044e0: cmp             x1, #0x8e0
    // 0x4044e4: b.ne            #0x404510
    // 0x4044e8: mov             x1, x0
    // 0x4044ec: LoadField: r0 = r1->field_3b
    //     0x4044ec: ldur            w0, [x1, #0x3b]
    // 0x4044f0: DecompressPointer r0
    //     0x4044f0: add             x0, x0, HEAP, lsl #32
    // 0x4044f4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4044f8: cmp             w0, w16
    // 0x4044fc: b.ne            #0x40450c
    // 0x404500: r2 = settingsPage
    //     0x404500: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x404504: ldr             x2, [x2, #0x198]
    // 0x404508: r0 = InitLateFinalInstanceField()
    //     0x404508: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40450c: b               #0x404534
    // 0x404510: mov             x1, x0
    // 0x404514: LoadField: r0 = r1->field_3b
    //     0x404514: ldur            w0, [x1, #0x3b]
    // 0x404518: DecompressPointer r0
    //     0x404518: add             x0, x0, HEAP, lsl #32
    // 0x40451c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404520: cmp             w0, w16
    // 0x404524: b.ne            #0x404534
    // 0x404528: r2 = settingsPage
    //     0x404528: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x40452c: ldr             x2, [x2, #0x1a0]
    // 0x404530: r0 = InitLateFinalInstanceField()
    //     0x404530: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404534: r1 = LoadClassIdInstr(r0)
    //     0x404534: ldur            x1, [x0, #-1]
    //     0x404538: ubfx            x1, x1, #0xc, #0x14
    // 0x40453c: cmp             x1, #0xf4
    // 0x404540: b.ne            #0x404550
    // 0x404544: r1 = "Show FPS counter"
    //     0x404544: add             x1, PP, #0x12, lsl #12  ; [pp+0x12060] "Show FPS counter"
    //     0x404548: ldr             x1, [x1, #0x60]
    // 0x40454c: b               #0x404580
    // 0x404550: cmp             x1, #0xf5
    // 0x404554: b.ne            #0x404564
    // 0x404558: r1 = "Показать счетчик FPS"
    //     0x404558: add             x1, PP, #0x12, lsl #12  ; [pp+0x12068] "Показать счетчик FPS"
    //     0x40455c: ldr             x1, [x1, #0x68]
    // 0x404560: b               #0x404580
    // 0x404564: cmp             x1, #0xf6
    // 0x404568: b.ne            #0x404578
    // 0x40456c: r1 = "FPS есептегішін көрсету"
    //     0x40456c: add             x1, PP, #0x12, lsl #12  ; [pp+0x12070] "FPS есептегішін көрсету"
    //     0x404570: ldr             x1, [x1, #0x70]
    // 0x404574: b               #0x404580
    // 0x404578: r1 = "Mostrar contador de FPS"
    //     0x404578: add             x1, PP, #0x12, lsl #12  ; [pp+0x12078] "Mostrar contador de FPS"
    //     0x40457c: ldr             x1, [x1, #0x78]
    // 0x404580: ldur            x0, [fp, #-0x28]
    // 0x404584: stur            x1, [fp, #-0x40]
    // 0x404588: r0 = Text()
    //     0x404588: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x40458c: mov             x2, x0
    // 0x404590: ldur            x0, [fp, #-0x40]
    // 0x404594: stur            x2, [fp, #-0x48]
    // 0x404598: StoreField: r2->field_b = r0
    //     0x404598: stur            w0, [x2, #0xb]
    // 0x40459c: r1 = <bool>
    //     0x40459c: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x4045a0: r0 = ValueListenableBuilder()
    //     0x4045a0: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x4045a4: mov             x3, x0
    // 0x4045a8: ldur            x0, [fp, #-0x28]
    // 0x4045ac: stur            x3, [fp, #-0x40]
    // 0x4045b0: StoreField: r3->field_f = r0
    //     0x4045b0: stur            w0, [x3, #0xf]
    // 0x4045b4: ldur            x2, [fp, #-0x10]
    // 0x4045b8: r1 = Function '<anonymous closure>':.
    //     0x4045b8: add             x1, PP, #0x12, lsl #12  ; [pp+0x12080] AnonymousClosure: (0x42ac3c), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x4045bc: ldr             x1, [x1, #0x80]
    // 0x4045c0: r0 = AllocateClosure()
    //     0x4045c0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x4045c4: mov             x1, x0
    // 0x4045c8: ldur            x0, [fp, #-0x40]
    // 0x4045cc: StoreField: r0->field_13 = r1
    //     0x4045cc: stur            w1, [x0, #0x13]
    // 0x4045d0: ldur            x1, [fp, #-0x48]
    // 0x4045d4: ArrayStore: r0[0] = r1  ; List_4
    //     0x4045d4: stur            w1, [x0, #0x17]
    // 0x4045d8: r0 = NesContainer()
    //     0x4045d8: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x4045dc: mov             x1, x0
    // 0x4045e0: ldur            x0, [fp, #-0x40]
    // 0x4045e4: stur            x1, [fp, #-0x28]
    // 0x4045e8: StoreField: r1->field_f = r0
    //     0x4045e8: stur            w0, [x1, #0xf]
    // 0x4045ec: r0 = Instance_EdgeInsets
    //     0x4045ec: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x4045f0: ldr             x0, [x0, #0x498]
    // 0x4045f4: StoreField: r1->field_23 = r0
    //     0x4045f4: stur            w0, [x1, #0x23]
    // 0x4045f8: r0 = Padding()
    //     0x4045f8: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x4045fc: r2 = Instance_EdgeInsets
    //     0x4045fc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x404600: ldr             x2, [x2, #0xfc8]
    // 0x404604: StoreField: r0->field_f = r2
    //     0x404604: stur            w2, [x0, #0xf]
    // 0x404608: ldur            x1, [fp, #-0x28]
    // 0x40460c: StoreField: r0->field_b = r1
    //     0x40460c: stur            w1, [x0, #0xb]
    // 0x404610: ldur            x1, [fp, #-0x30]
    // 0x404614: ArrayStore: r1[6] = r0  ; List_4
    //     0x404614: add             x25, x1, #0x27
    //     0x404618: str             w0, [x25]
    //     0x40461c: tbz             w0, #0, #0x404638
    //     0x404620: ldurb           w16, [x1, #-1]
    //     0x404624: ldurb           w17, [x0, #-1]
    //     0x404628: and             x16, x17, x16, lsr #2
    //     0x40462c: tst             x16, HEAP, lsr #32
    //     0x404630: b.eq            #0x404638
    //     0x404634: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x404638: r16 = <AppLocale, Translations>
    //     0x404638: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x40463c: ldur            lr, [fp, #-0x18]
    // 0x404640: stp             lr, x16, [SP]
    // 0x404644: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x404644: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x404648: r0 = LocaleSettingsExt.currentTranslations()
    //     0x404648: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x40464c: r1 = LoadClassIdInstr(r0)
    //     0x40464c: ldur            x1, [x0, #-1]
    //     0x404650: ubfx            x1, x1, #0xc, #0x14
    // 0x404654: cmp             x1, #0x8dd
    // 0x404658: b.ne            #0x404684
    // 0x40465c: mov             x1, x0
    // 0x404660: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x404660: ldur            w0, [x1, #0x17]
    // 0x404664: DecompressPointer r0
    //     0x404664: add             x0, x0, HEAP, lsl #32
    // 0x404668: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40466c: cmp             w0, w16
    // 0x404670: b.ne            #0x404680
    // 0x404674: r2 = settingsPage
    //     0x404674: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x404678: ldr             x2, [x2, #0x188]
    // 0x40467c: r0 = InitLateFinalInstanceField()
    //     0x40467c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404680: b               #0x404708
    // 0x404684: cmp             x1, #0x8df
    // 0x404688: b.ne            #0x4046b4
    // 0x40468c: mov             x1, x0
    // 0x404690: LoadField: r0 = r1->field_3b
    //     0x404690: ldur            w0, [x1, #0x3b]
    // 0x404694: DecompressPointer r0
    //     0x404694: add             x0, x0, HEAP, lsl #32
    // 0x404698: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40469c: cmp             w0, w16
    // 0x4046a0: b.ne            #0x4046b0
    // 0x4046a4: r2 = settingsPage
    //     0x4046a4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x4046a8: ldr             x2, [x2, #0x190]
    // 0x4046ac: r0 = InitLateFinalInstanceField()
    //     0x4046ac: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4046b0: b               #0x404708
    // 0x4046b4: cmp             x1, #0x8e0
    // 0x4046b8: b.ne            #0x4046e4
    // 0x4046bc: mov             x1, x0
    // 0x4046c0: LoadField: r0 = r1->field_3b
    //     0x4046c0: ldur            w0, [x1, #0x3b]
    // 0x4046c4: DecompressPointer r0
    //     0x4046c4: add             x0, x0, HEAP, lsl #32
    // 0x4046c8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4046cc: cmp             w0, w16
    // 0x4046d0: b.ne            #0x4046e0
    // 0x4046d4: r2 = settingsPage
    //     0x4046d4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x4046d8: ldr             x2, [x2, #0x198]
    // 0x4046dc: r0 = InitLateFinalInstanceField()
    //     0x4046dc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4046e0: b               #0x404708
    // 0x4046e4: mov             x1, x0
    // 0x4046e8: LoadField: r0 = r1->field_3b
    //     0x4046e8: ldur            w0, [x1, #0x3b]
    // 0x4046ec: DecompressPointer r0
    //     0x4046ec: add             x0, x0, HEAP, lsl #32
    // 0x4046f0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4046f4: cmp             w0, w16
    // 0x4046f8: b.ne            #0x404708
    // 0x4046fc: r2 = settingsPage
    //     0x4046fc: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x404700: ldr             x2, [x2, #0x1a0]
    // 0x404704: r0 = InitLateFinalInstanceField()
    //     0x404704: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404708: r1 = LoadClassIdInstr(r0)
    //     0x404708: ldur            x1, [x0, #-1]
    //     0x40470c: ubfx            x1, x1, #0xc, #0x14
    // 0x404710: cmp             x1, #0xf4
    // 0x404714: b.ne            #0x404724
    // 0x404718: r1 = "Accessibility"
    //     0x404718: add             x1, PP, #0x12, lsl #12  ; [pp+0x12088] "Accessibility"
    //     0x40471c: ldr             x1, [x1, #0x88]
    // 0x404720: b               #0x404754
    // 0x404724: cmp             x1, #0xf5
    // 0x404728: b.ne            #0x404738
    // 0x40472c: r1 = "Доступность"
    //     0x40472c: add             x1, PP, #0x12, lsl #12  ; [pp+0x12090] "Доступность"
    //     0x404730: ldr             x1, [x1, #0x90]
    // 0x404734: b               #0x404754
    // 0x404738: cmp             x1, #0xf6
    // 0x40473c: b.ne            #0x40474c
    // 0x404740: r1 = "Қол жетімділік"
    //     0x404740: add             x1, PP, #0x12, lsl #12  ; [pp+0x12098] "Қол жетімділік"
    //     0x404744: ldr             x1, [x1, #0x98]
    // 0x404748: b               #0x404754
    // 0x40474c: r1 = "Accesibilidad"
    //     0x40474c: add             x1, PP, #0x12, lsl #12  ; [pp+0x120a0] "Accesibilidad"
    //     0x404750: ldr             x1, [x1, #0xa0]
    // 0x404754: ldur            x0, [fp, #-0x50]
    // 0x404758: stur            x1, [fp, #-0x28]
    // 0x40475c: r0 = Text()
    //     0x40475c: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x404760: mov             x1, x0
    // 0x404764: ldur            x0, [fp, #-0x28]
    // 0x404768: stur            x1, [fp, #-0x40]
    // 0x40476c: StoreField: r1->field_b = r0
    //     0x40476c: stur            w0, [x1, #0xb]
    // 0x404770: r0 = Instance_TextStyle
    //     0x404770: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fa8] Obj!TextStyle@5d58a1
    //     0x404774: ldr             x0, [x0, #0xfa8]
    // 0x404778: StoreField: r1->field_13 = r0
    //     0x404778: stur            w0, [x1, #0x13]
    // 0x40477c: r0 = Padding()
    //     0x40477c: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x404780: r2 = Instance_EdgeInsets
    //     0x404780: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fb0] Obj!EdgeInsets@5cbf51
    //     0x404784: ldr             x2, [x2, #0xfb0]
    // 0x404788: StoreField: r0->field_f = r2
    //     0x404788: stur            w2, [x0, #0xf]
    // 0x40478c: ldur            x1, [fp, #-0x40]
    // 0x404790: StoreField: r0->field_b = r1
    //     0x404790: stur            w1, [x0, #0xb]
    // 0x404794: ldur            x1, [fp, #-0x30]
    // 0x404798: ArrayStore: r1[7] = r0  ; List_4
    //     0x404798: add             x25, x1, #0x2b
    //     0x40479c: str             w0, [x25]
    //     0x4047a0: tbz             w0, #0, #0x4047bc
    //     0x4047a4: ldurb           w16, [x1, #-1]
    //     0x4047a8: ldurb           w17, [x0, #-1]
    //     0x4047ac: and             x16, x17, x16, lsr #2
    //     0x4047b0: tst             x16, HEAP, lsr #32
    //     0x4047b4: b.eq            #0x4047bc
    //     0x4047b8: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x4047bc: ldur            x0, [fp, #-0x50]
    // 0x4047c0: LoadField: r1 = r0->field_f
    //     0x4047c0: ldur            w1, [x0, #0xf]
    // 0x4047c4: DecompressPointer r1
    //     0x4047c4: add             x1, x1, HEAP, lsl #32
    // 0x4047c8: stur            x1, [fp, #-0x28]
    // 0x4047cc: r16 = <AppLocale, Translations>
    //     0x4047cc: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4047d0: ldur            lr, [fp, #-0x18]
    // 0x4047d4: stp             lr, x16, [SP]
    // 0x4047d8: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x4047d8: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x4047dc: r0 = LocaleSettingsExt.currentTranslations()
    //     0x4047dc: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x4047e0: r1 = LoadClassIdInstr(r0)
    //     0x4047e0: ldur            x1, [x0, #-1]
    //     0x4047e4: ubfx            x1, x1, #0xc, #0x14
    // 0x4047e8: cmp             x1, #0x8dd
    // 0x4047ec: b.ne            #0x404818
    // 0x4047f0: mov             x1, x0
    // 0x4047f4: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x4047f4: ldur            w0, [x1, #0x17]
    // 0x4047f8: DecompressPointer r0
    //     0x4047f8: add             x0, x0, HEAP, lsl #32
    // 0x4047fc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404800: cmp             w0, w16
    // 0x404804: b.ne            #0x404814
    // 0x404808: r2 = settingsPage
    //     0x404808: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x40480c: ldr             x2, [x2, #0x188]
    // 0x404810: r0 = InitLateFinalInstanceField()
    //     0x404810: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404814: b               #0x40489c
    // 0x404818: cmp             x1, #0x8df
    // 0x40481c: b.ne            #0x404848
    // 0x404820: mov             x1, x0
    // 0x404824: LoadField: r0 = r1->field_3b
    //     0x404824: ldur            w0, [x1, #0x3b]
    // 0x404828: DecompressPointer r0
    //     0x404828: add             x0, x0, HEAP, lsl #32
    // 0x40482c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404830: cmp             w0, w16
    // 0x404834: b.ne            #0x404844
    // 0x404838: r2 = settingsPage
    //     0x404838: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x40483c: ldr             x2, [x2, #0x190]
    // 0x404840: r0 = InitLateFinalInstanceField()
    //     0x404840: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404844: b               #0x40489c
    // 0x404848: cmp             x1, #0x8e0
    // 0x40484c: b.ne            #0x404878
    // 0x404850: mov             x1, x0
    // 0x404854: LoadField: r0 = r1->field_3b
    //     0x404854: ldur            w0, [x1, #0x3b]
    // 0x404858: DecompressPointer r0
    //     0x404858: add             x0, x0, HEAP, lsl #32
    // 0x40485c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404860: cmp             w0, w16
    // 0x404864: b.ne            #0x404874
    // 0x404868: r2 = settingsPage
    //     0x404868: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x40486c: ldr             x2, [x2, #0x198]
    // 0x404870: r0 = InitLateFinalInstanceField()
    //     0x404870: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404874: b               #0x40489c
    // 0x404878: mov             x1, x0
    // 0x40487c: LoadField: r0 = r1->field_3b
    //     0x40487c: ldur            w0, [x1, #0x3b]
    // 0x404880: DecompressPointer r0
    //     0x404880: add             x0, x0, HEAP, lsl #32
    // 0x404884: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404888: cmp             w0, w16
    // 0x40488c: b.ne            #0x40489c
    // 0x404890: r2 = settingsPage
    //     0x404890: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x404894: ldr             x2, [x2, #0x1a0]
    // 0x404898: r0 = InitLateFinalInstanceField()
    //     0x404898: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40489c: r1 = LoadClassIdInstr(r0)
    //     0x40489c: ldur            x1, [x0, #-1]
    //     0x4048a0: ubfx            x1, x1, #0xc, #0x14
    // 0x4048a4: cmp             x1, #0xf4
    // 0x4048a8: b.ne            #0x4048b8
    // 0x4048ac: r2 = "Easy-to-read font"
    //     0x4048ac: add             x2, PP, #0x12, lsl #12  ; [pp+0x120a8] "Easy-to-read font"
    //     0x4048b0: ldr             x2, [x2, #0xa8]
    // 0x4048b4: b               #0x4048e8
    // 0x4048b8: cmp             x1, #0xf5
    // 0x4048bc: b.ne            #0x4048cc
    // 0x4048c0: r2 = "Большой шрифт"
    //     0x4048c0: add             x2, PP, #0x12, lsl #12  ; [pp+0x120b0] "Большой шрифт"
    //     0x4048c4: ldr             x2, [x2, #0xb0]
    // 0x4048c8: b               #0x4048e8
    // 0x4048cc: cmp             x1, #0xf6
    // 0x4048d0: b.ne            #0x4048e0
    // 0x4048d4: r2 = "Оқуға оңай шрифт"
    //     0x4048d4: add             x2, PP, #0x12, lsl #12  ; [pp+0x120b8] "Оқуға оңай шрифт"
    //     0x4048d8: ldr             x2, [x2, #0xb8]
    // 0x4048dc: b               #0x4048e8
    // 0x4048e0: r2 = "Fuente fácil de leer"
    //     0x4048e0: add             x2, PP, #0x12, lsl #12  ; [pp+0x120c0] "Fuente fácil de leer"
    //     0x4048e4: ldr             x2, [x2, #0xc0]
    // 0x4048e8: ldur            x1, [fp, #-0x28]
    // 0x4048ec: ldur            x0, [fp, #-0x50]
    // 0x4048f0: stur            x2, [fp, #-0x40]
    // 0x4048f4: r0 = Text()
    //     0x4048f4: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x4048f8: mov             x2, x0
    // 0x4048fc: ldur            x0, [fp, #-0x40]
    // 0x404900: stur            x2, [fp, #-0x48]
    // 0x404904: StoreField: r2->field_b = r0
    //     0x404904: stur            w0, [x2, #0xb]
    // 0x404908: r1 = <bool>
    //     0x404908: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x40490c: r0 = ValueListenableBuilder()
    //     0x40490c: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x404910: mov             x3, x0
    // 0x404914: ldur            x0, [fp, #-0x28]
    // 0x404918: stur            x3, [fp, #-0x40]
    // 0x40491c: StoreField: r3->field_f = r0
    //     0x40491c: stur            w0, [x3, #0xf]
    // 0x404920: ldur            x2, [fp, #-0x10]
    // 0x404924: r1 = Function '<anonymous closure>':.
    //     0x404924: add             x1, PP, #0x12, lsl #12  ; [pp+0x120c8] AnonymousClosure: (0x42a954), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x404928: ldr             x1, [x1, #0xc8]
    // 0x40492c: r0 = AllocateClosure()
    //     0x40492c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x404930: mov             x1, x0
    // 0x404934: ldur            x0, [fp, #-0x40]
    // 0x404938: StoreField: r0->field_13 = r1
    //     0x404938: stur            w1, [x0, #0x13]
    // 0x40493c: ldur            x1, [fp, #-0x48]
    // 0x404940: ArrayStore: r0[0] = r1  ; List_4
    //     0x404940: stur            w1, [x0, #0x17]
    // 0x404944: r0 = NesContainer()
    //     0x404944: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x404948: mov             x1, x0
    // 0x40494c: ldur            x0, [fp, #-0x40]
    // 0x404950: stur            x1, [fp, #-0x28]
    // 0x404954: StoreField: r1->field_f = r0
    //     0x404954: stur            w0, [x1, #0xf]
    // 0x404958: r0 = Instance_EdgeInsets
    //     0x404958: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x40495c: ldr             x0, [x0, #0x498]
    // 0x404960: StoreField: r1->field_23 = r0
    //     0x404960: stur            w0, [x1, #0x23]
    // 0x404964: r0 = Padding()
    //     0x404964: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x404968: r2 = Instance_EdgeInsets
    //     0x404968: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x40496c: ldr             x2, [x2, #0xfc8]
    // 0x404970: StoreField: r0->field_f = r2
    //     0x404970: stur            w2, [x0, #0xf]
    // 0x404974: ldur            x1, [fp, #-0x28]
    // 0x404978: StoreField: r0->field_b = r1
    //     0x404978: stur            w1, [x0, #0xb]
    // 0x40497c: ldur            x1, [fp, #-0x30]
    // 0x404980: ArrayStore: r1[8] = r0  ; List_4
    //     0x404980: add             x25, x1, #0x2f
    //     0x404984: str             w0, [x25]
    //     0x404988: tbz             w0, #0, #0x4049a4
    //     0x40498c: ldurb           w16, [x1, #-1]
    //     0x404990: ldurb           w17, [x0, #-1]
    //     0x404994: and             x16, x17, x16, lsr #2
    //     0x404998: tst             x16, HEAP, lsr #32
    //     0x40499c: b.eq            #0x4049a4
    //     0x4049a0: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x4049a4: ldur            x0, [fp, #-0x50]
    // 0x4049a8: LoadField: r1 = r0->field_13
    //     0x4049a8: ldur            w1, [x0, #0x13]
    // 0x4049ac: DecompressPointer r1
    //     0x4049ac: add             x1, x1, HEAP, lsl #32
    // 0x4049b0: stur            x1, [fp, #-0x28]
    // 0x4049b4: r16 = <AppLocale, Translations>
    //     0x4049b4: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4049b8: ldur            lr, [fp, #-0x18]
    // 0x4049bc: stp             lr, x16, [SP]
    // 0x4049c0: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x4049c0: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x4049c4: r0 = LocaleSettingsExt.currentTranslations()
    //     0x4049c4: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x4049c8: r1 = LoadClassIdInstr(r0)
    //     0x4049c8: ldur            x1, [x0, #-1]
    //     0x4049cc: ubfx            x1, x1, #0xc, #0x14
    // 0x4049d0: cmp             x1, #0x8dd
    // 0x4049d4: b.ne            #0x404a00
    // 0x4049d8: mov             x1, x0
    // 0x4049dc: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x4049dc: ldur            w0, [x1, #0x17]
    // 0x4049e0: DecompressPointer r0
    //     0x4049e0: add             x0, x0, HEAP, lsl #32
    // 0x4049e4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4049e8: cmp             w0, w16
    // 0x4049ec: b.ne            #0x4049fc
    // 0x4049f0: r2 = settingsPage
    //     0x4049f0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x4049f4: ldr             x2, [x2, #0x188]
    // 0x4049f8: r0 = InitLateFinalInstanceField()
    //     0x4049f8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4049fc: b               #0x404a84
    // 0x404a00: cmp             x1, #0x8df
    // 0x404a04: b.ne            #0x404a30
    // 0x404a08: mov             x1, x0
    // 0x404a0c: LoadField: r0 = r1->field_3b
    //     0x404a0c: ldur            w0, [x1, #0x3b]
    // 0x404a10: DecompressPointer r0
    //     0x404a10: add             x0, x0, HEAP, lsl #32
    // 0x404a14: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404a18: cmp             w0, w16
    // 0x404a1c: b.ne            #0x404a2c
    // 0x404a20: r2 = settingsPage
    //     0x404a20: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x404a24: ldr             x2, [x2, #0x190]
    // 0x404a28: r0 = InitLateFinalInstanceField()
    //     0x404a28: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404a2c: b               #0x404a84
    // 0x404a30: cmp             x1, #0x8e0
    // 0x404a34: b.ne            #0x404a60
    // 0x404a38: mov             x1, x0
    // 0x404a3c: LoadField: r0 = r1->field_3b
    //     0x404a3c: ldur            w0, [x1, #0x3b]
    // 0x404a40: DecompressPointer r0
    //     0x404a40: add             x0, x0, HEAP, lsl #32
    // 0x404a44: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404a48: cmp             w0, w16
    // 0x404a4c: b.ne            #0x404a5c
    // 0x404a50: r2 = settingsPage
    //     0x404a50: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x404a54: ldr             x2, [x2, #0x198]
    // 0x404a58: r0 = InitLateFinalInstanceField()
    //     0x404a58: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404a5c: b               #0x404a84
    // 0x404a60: mov             x1, x0
    // 0x404a64: LoadField: r0 = r1->field_3b
    //     0x404a64: ldur            w0, [x1, #0x3b]
    // 0x404a68: DecompressPointer r0
    //     0x404a68: add             x0, x0, HEAP, lsl #32
    // 0x404a6c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404a70: cmp             w0, w16
    // 0x404a74: b.ne            #0x404a84
    // 0x404a78: r2 = settingsPage
    //     0x404a78: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x404a7c: ldr             x2, [x2, #0x1a0]
    // 0x404a80: r0 = InitLateFinalInstanceField()
    //     0x404a80: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404a84: r1 = LoadClassIdInstr(r0)
    //     0x404a84: ldur            x1, [x0, #-1]
    //     0x404a88: ubfx            x1, x1, #0xc, #0x14
    // 0x404a8c: cmp             x1, #0xf4
    // 0x404a90: b.ne            #0x404aa0
    // 0x404a94: r2 = "Stylized page transitions"
    //     0x404a94: add             x2, PP, #0x12, lsl #12  ; [pp+0x120d0] "Stylized page transitions"
    //     0x404a98: ldr             x2, [x2, #0xd0]
    // 0x404a9c: b               #0x404ad0
    // 0x404aa0: cmp             x1, #0xf5
    // 0x404aa4: b.ne            #0x404ab4
    // 0x404aa8: r2 = "Стилизованные переходы страниц"
    //     0x404aa8: add             x2, PP, #0x12, lsl #12  ; [pp+0x120d8] "Стилизованные переходы страниц"
    //     0x404aac: ldr             x2, [x2, #0xd8]
    // 0x404ab0: b               #0x404ad0
    // 0x404ab4: cmp             x1, #0xf6
    // 0x404ab8: b.ne            #0x404ac8
    // 0x404abc: r2 = "Стильденген беттердің ауысуы"
    //     0x404abc: add             x2, PP, #0x12, lsl #12  ; [pp+0x120e0] "Стильденген беттердің ауысуы"
    //     0x404ac0: ldr             x2, [x2, #0xe0]
    // 0x404ac4: b               #0x404ad0
    // 0x404ac8: r2 = "Transiciones de página estilizadas"
    //     0x404ac8: add             x2, PP, #0x12, lsl #12  ; [pp+0x120e8] "Transiciones de página estilizadas"
    //     0x404acc: ldr             x2, [x2, #0xe8]
    // 0x404ad0: ldur            x1, [fp, #-0x28]
    // 0x404ad4: ldur            x0, [fp, #-0x50]
    // 0x404ad8: stur            x2, [fp, #-0x40]
    // 0x404adc: r0 = Text()
    //     0x404adc: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x404ae0: mov             x2, x0
    // 0x404ae4: ldur            x0, [fp, #-0x40]
    // 0x404ae8: stur            x2, [fp, #-0x48]
    // 0x404aec: StoreField: r2->field_b = r0
    //     0x404aec: stur            w0, [x2, #0xb]
    // 0x404af0: r1 = <bool>
    //     0x404af0: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x404af4: r0 = ValueListenableBuilder()
    //     0x404af4: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x404af8: mov             x3, x0
    // 0x404afc: ldur            x0, [fp, #-0x28]
    // 0x404b00: stur            x3, [fp, #-0x40]
    // 0x404b04: StoreField: r3->field_f = r0
    //     0x404b04: stur            w0, [x3, #0xf]
    // 0x404b08: ldur            x2, [fp, #-0x10]
    // 0x404b0c: r1 = Function '<anonymous closure>':.
    //     0x404b0c: add             x1, PP, #0x12, lsl #12  ; [pp+0x120f0] AnonymousClosure: (0x42a66c), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x404b10: ldr             x1, [x1, #0xf0]
    // 0x404b14: r0 = AllocateClosure()
    //     0x404b14: bl              #0x5838bc  ; AllocateClosureStub
    // 0x404b18: mov             x1, x0
    // 0x404b1c: ldur            x0, [fp, #-0x40]
    // 0x404b20: StoreField: r0->field_13 = r1
    //     0x404b20: stur            w1, [x0, #0x13]
    // 0x404b24: ldur            x1, [fp, #-0x48]
    // 0x404b28: ArrayStore: r0[0] = r1  ; List_4
    //     0x404b28: stur            w1, [x0, #0x17]
    // 0x404b2c: r0 = NesContainer()
    //     0x404b2c: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x404b30: mov             x1, x0
    // 0x404b34: ldur            x0, [fp, #-0x40]
    // 0x404b38: stur            x1, [fp, #-0x28]
    // 0x404b3c: StoreField: r1->field_f = r0
    //     0x404b3c: stur            w0, [x1, #0xf]
    // 0x404b40: r0 = Instance_EdgeInsets
    //     0x404b40: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x404b44: ldr             x0, [x0, #0x498]
    // 0x404b48: StoreField: r1->field_23 = r0
    //     0x404b48: stur            w0, [x1, #0x23]
    // 0x404b4c: r0 = Padding()
    //     0x404b4c: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x404b50: r2 = Instance_EdgeInsets
    //     0x404b50: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x404b54: ldr             x2, [x2, #0xfc8]
    // 0x404b58: StoreField: r0->field_f = r2
    //     0x404b58: stur            w2, [x0, #0xf]
    // 0x404b5c: ldur            x1, [fp, #-0x28]
    // 0x404b60: StoreField: r0->field_b = r1
    //     0x404b60: stur            w1, [x0, #0xb]
    // 0x404b64: ldur            x1, [fp, #-0x30]
    // 0x404b68: ArrayStore: r1[9] = r0  ; List_4
    //     0x404b68: add             x25, x1, #0x33
    //     0x404b6c: str             w0, [x25]
    //     0x404b70: tbz             w0, #0, #0x404b8c
    //     0x404b74: ldurb           w16, [x1, #-1]
    //     0x404b78: ldurb           w17, [x0, #-1]
    //     0x404b7c: and             x16, x17, x16, lsr #2
    //     0x404b80: tst             x16, HEAP, lsr #32
    //     0x404b84: b.eq            #0x404b8c
    //     0x404b88: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x404b8c: ldur            x0, [fp, #-0x50]
    // 0x404b90: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x404b90: ldur            w1, [x0, #0x17]
    // 0x404b94: DecompressPointer r1
    //     0x404b94: add             x1, x1, HEAP, lsl #32
    // 0x404b98: stur            x1, [fp, #-0x28]
    // 0x404b9c: r16 = <AppLocale, Translations>
    //     0x404b9c: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x404ba0: ldur            lr, [fp, #-0x18]
    // 0x404ba4: stp             lr, x16, [SP]
    // 0x404ba8: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x404ba8: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x404bac: r0 = LocaleSettingsExt.currentTranslations()
    //     0x404bac: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x404bb0: r1 = LoadClassIdInstr(r0)
    //     0x404bb0: ldur            x1, [x0, #-1]
    //     0x404bb4: ubfx            x1, x1, #0xc, #0x14
    // 0x404bb8: cmp             x1, #0x8dd
    // 0x404bbc: b.ne            #0x404be8
    // 0x404bc0: mov             x1, x0
    // 0x404bc4: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x404bc4: ldur            w0, [x1, #0x17]
    // 0x404bc8: DecompressPointer r0
    //     0x404bc8: add             x0, x0, HEAP, lsl #32
    // 0x404bcc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404bd0: cmp             w0, w16
    // 0x404bd4: b.ne            #0x404be4
    // 0x404bd8: r2 = settingsPage
    //     0x404bd8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x404bdc: ldr             x2, [x2, #0x188]
    // 0x404be0: r0 = InitLateFinalInstanceField()
    //     0x404be0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404be4: b               #0x404c6c
    // 0x404be8: cmp             x1, #0x8df
    // 0x404bec: b.ne            #0x404c18
    // 0x404bf0: mov             x1, x0
    // 0x404bf4: LoadField: r0 = r1->field_3b
    //     0x404bf4: ldur            w0, [x1, #0x3b]
    // 0x404bf8: DecompressPointer r0
    //     0x404bf8: add             x0, x0, HEAP, lsl #32
    // 0x404bfc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404c00: cmp             w0, w16
    // 0x404c04: b.ne            #0x404c14
    // 0x404c08: r2 = settingsPage
    //     0x404c08: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x404c0c: ldr             x2, [x2, #0x190]
    // 0x404c10: r0 = InitLateFinalInstanceField()
    //     0x404c10: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404c14: b               #0x404c6c
    // 0x404c18: cmp             x1, #0x8e0
    // 0x404c1c: b.ne            #0x404c48
    // 0x404c20: mov             x1, x0
    // 0x404c24: LoadField: r0 = r1->field_3b
    //     0x404c24: ldur            w0, [x1, #0x3b]
    // 0x404c28: DecompressPointer r0
    //     0x404c28: add             x0, x0, HEAP, lsl #32
    // 0x404c2c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404c30: cmp             w0, w16
    // 0x404c34: b.ne            #0x404c44
    // 0x404c38: r2 = settingsPage
    //     0x404c38: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x404c3c: ldr             x2, [x2, #0x198]
    // 0x404c40: r0 = InitLateFinalInstanceField()
    //     0x404c40: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404c44: b               #0x404c6c
    // 0x404c48: mov             x1, x0
    // 0x404c4c: LoadField: r0 = r1->field_3b
    //     0x404c4c: ldur            w0, [x1, #0x3b]
    // 0x404c50: DecompressPointer r0
    //     0x404c50: add             x0, x0, HEAP, lsl #32
    // 0x404c54: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404c58: cmp             w0, w16
    // 0x404c5c: b.ne            #0x404c6c
    // 0x404c60: r2 = settingsPage
    //     0x404c60: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x404c64: ldr             x2, [x2, #0x1a0]
    // 0x404c68: r0 = InitLateFinalInstanceField()
    //     0x404c68: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404c6c: r1 = LoadClassIdInstr(r0)
    //     0x404c6c: ldur            x1, [x0, #-1]
    //     0x404c70: ubfx            x1, x1, #0xc, #0x14
    // 0x404c74: cmp             x1, #0xf4
    // 0x404c78: b.ne            #0x404c88
    // 0x404c7c: r1 = "Bigger bullets"
    //     0x404c7c: add             x1, PP, #0x12, lsl #12  ; [pp+0x120f8] "Bigger bullets"
    //     0x404c80: ldr             x1, [x1, #0xf8]
    // 0x404c84: b               #0x404cb8
    // 0x404c88: cmp             x1, #0xf5
    // 0x404c8c: b.ne            #0x404c9c
    // 0x404c90: r1 = "Большие мячики"
    //     0x404c90: add             x1, PP, #0x12, lsl #12  ; [pp+0x12100] "Большие мячики"
    //     0x404c94: ldr             x1, [x1, #0x100]
    // 0x404c98: b               #0x404cb8
    // 0x404c9c: cmp             x1, #0xf6
    // 0x404ca0: b.ne            #0x404cb0
    // 0x404ca4: r1 = "Үлкенірек оқтар"
    //     0x404ca4: add             x1, PP, #0x12, lsl #12  ; [pp+0x12108] "Үлкенірек оқтар"
    //     0x404ca8: ldr             x1, [x1, #0x108]
    // 0x404cac: b               #0x404cb8
    // 0x404cb0: r1 = "balas mas grandes"
    //     0x404cb0: add             x1, PP, #0x12, lsl #12  ; [pp+0x12110] "balas mas grandes"
    //     0x404cb4: ldr             x1, [x1, #0x110]
    // 0x404cb8: ldur            x0, [fp, #-0x28]
    // 0x404cbc: stur            x1, [fp, #-0x40]
    // 0x404cc0: r0 = Text()
    //     0x404cc0: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x404cc4: mov             x2, x0
    // 0x404cc8: ldur            x0, [fp, #-0x40]
    // 0x404ccc: stur            x2, [fp, #-0x48]
    // 0x404cd0: StoreField: r2->field_b = r0
    //     0x404cd0: stur            w0, [x2, #0xb]
    // 0x404cd4: r1 = <bool>
    //     0x404cd4: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x404cd8: r0 = ValueListenableBuilder()
    //     0x404cd8: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x404cdc: mov             x3, x0
    // 0x404ce0: ldur            x0, [fp, #-0x28]
    // 0x404ce4: stur            x3, [fp, #-0x40]
    // 0x404ce8: StoreField: r3->field_f = r0
    //     0x404ce8: stur            w0, [x3, #0xf]
    // 0x404cec: ldur            x2, [fp, #-0x10]
    // 0x404cf0: r1 = Function '<anonymous closure>':.
    //     0x404cf0: add             x1, PP, #0x12, lsl #12  ; [pp+0x12118] AnonymousClosure: (0x42a3b8), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x404cf4: ldr             x1, [x1, #0x118]
    // 0x404cf8: r0 = AllocateClosure()
    //     0x404cf8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x404cfc: mov             x1, x0
    // 0x404d00: ldur            x0, [fp, #-0x40]
    // 0x404d04: StoreField: r0->field_13 = r1
    //     0x404d04: stur            w1, [x0, #0x13]
    // 0x404d08: ldur            x1, [fp, #-0x48]
    // 0x404d0c: ArrayStore: r0[0] = r1  ; List_4
    //     0x404d0c: stur            w1, [x0, #0x17]
    // 0x404d10: r0 = NesContainer()
    //     0x404d10: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x404d14: mov             x1, x0
    // 0x404d18: ldur            x0, [fp, #-0x40]
    // 0x404d1c: stur            x1, [fp, #-0x28]
    // 0x404d20: StoreField: r1->field_f = r0
    //     0x404d20: stur            w0, [x1, #0xf]
    // 0x404d24: r0 = Instance_EdgeInsets
    //     0x404d24: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x404d28: ldr             x0, [x0, #0x498]
    // 0x404d2c: StoreField: r1->field_23 = r0
    //     0x404d2c: stur            w0, [x1, #0x23]
    // 0x404d30: r0 = Padding()
    //     0x404d30: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x404d34: r2 = Instance_EdgeInsets
    //     0x404d34: add             x2, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x404d38: ldr             x2, [x2, #0xfc8]
    // 0x404d3c: StoreField: r0->field_f = r2
    //     0x404d3c: stur            w2, [x0, #0xf]
    // 0x404d40: ldur            x1, [fp, #-0x28]
    // 0x404d44: StoreField: r0->field_b = r1
    //     0x404d44: stur            w1, [x0, #0xb]
    // 0x404d48: ldur            x1, [fp, #-0x30]
    // 0x404d4c: ArrayStore: r1[10] = r0  ; List_4
    //     0x404d4c: add             x25, x1, #0x37
    //     0x404d50: str             w0, [x25]
    //     0x404d54: tbz             w0, #0, #0x404d70
    //     0x404d58: ldurb           w16, [x1, #-1]
    //     0x404d5c: ldurb           w17, [x0, #-1]
    //     0x404d60: and             x16, x17, x16, lsr #2
    //     0x404d64: tst             x16, HEAP, lsr #32
    //     0x404d68: b.eq            #0x404d70
    //     0x404d6c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x404d70: r16 = <AppLocale, Translations>
    //     0x404d70: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x404d74: ldur            lr, [fp, #-0x18]
    // 0x404d78: stp             lr, x16, [SP]
    // 0x404d7c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x404d7c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x404d80: r0 = LocaleSettingsExt.currentTranslations()
    //     0x404d80: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x404d84: r1 = LoadClassIdInstr(r0)
    //     0x404d84: ldur            x1, [x0, #-1]
    //     0x404d88: ubfx            x1, x1, #0xc, #0x14
    // 0x404d8c: cmp             x1, #0x8dd
    // 0x404d90: b.ne            #0x404dbc
    // 0x404d94: mov             x1, x0
    // 0x404d98: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x404d98: ldur            w0, [x1, #0x17]
    // 0x404d9c: DecompressPointer r0
    //     0x404d9c: add             x0, x0, HEAP, lsl #32
    // 0x404da0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404da4: cmp             w0, w16
    // 0x404da8: b.ne            #0x404db8
    // 0x404dac: r2 = settingsPage
    //     0x404dac: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x404db0: ldr             x2, [x2, #0x188]
    // 0x404db4: r0 = InitLateFinalInstanceField()
    //     0x404db4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404db8: b               #0x404e40
    // 0x404dbc: cmp             x1, #0x8df
    // 0x404dc0: b.ne            #0x404dec
    // 0x404dc4: mov             x1, x0
    // 0x404dc8: LoadField: r0 = r1->field_3b
    //     0x404dc8: ldur            w0, [x1, #0x3b]
    // 0x404dcc: DecompressPointer r0
    //     0x404dcc: add             x0, x0, HEAP, lsl #32
    // 0x404dd0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404dd4: cmp             w0, w16
    // 0x404dd8: b.ne            #0x404de8
    // 0x404ddc: r2 = settingsPage
    //     0x404ddc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x404de0: ldr             x2, [x2, #0x190]
    // 0x404de4: r0 = InitLateFinalInstanceField()
    //     0x404de4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404de8: b               #0x404e40
    // 0x404dec: cmp             x1, #0x8e0
    // 0x404df0: b.ne            #0x404e1c
    // 0x404df4: mov             x1, x0
    // 0x404df8: LoadField: r0 = r1->field_3b
    //     0x404df8: ldur            w0, [x1, #0x3b]
    // 0x404dfc: DecompressPointer r0
    //     0x404dfc: add             x0, x0, HEAP, lsl #32
    // 0x404e00: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404e04: cmp             w0, w16
    // 0x404e08: b.ne            #0x404e18
    // 0x404e0c: r2 = settingsPage
    //     0x404e0c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x404e10: ldr             x2, [x2, #0x198]
    // 0x404e14: r0 = InitLateFinalInstanceField()
    //     0x404e14: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404e18: b               #0x404e40
    // 0x404e1c: mov             x1, x0
    // 0x404e20: LoadField: r0 = r1->field_3b
    //     0x404e20: ldur            w0, [x1, #0x3b]
    // 0x404e24: DecompressPointer r0
    //     0x404e24: add             x0, x0, HEAP, lsl #32
    // 0x404e28: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404e2c: cmp             w0, w16
    // 0x404e30: b.ne            #0x404e40
    // 0x404e34: r2 = settingsPage
    //     0x404e34: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x404e38: ldr             x2, [x2, #0x1a0]
    // 0x404e3c: r0 = InitLateFinalInstanceField()
    //     0x404e3c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404e40: r1 = LoadClassIdInstr(r0)
    //     0x404e40: ldur            x1, [x0, #-1]
    //     0x404e44: ubfx            x1, x1, #0xc, #0x14
    // 0x404e48: cmp             x1, #0xf4
    // 0x404e4c: b.ne            #0x404e5c
    // 0x404e50: r0 = "App info"
    //     0x404e50: add             x0, PP, #0x12, lsl #12  ; [pp+0x12120] "App info"
    //     0x404e54: ldr             x0, [x0, #0x120]
    // 0x404e58: b               #0x404e8c
    // 0x404e5c: cmp             x1, #0xf5
    // 0x404e60: b.ne            #0x404e70
    // 0x404e64: r0 = "О программе"
    //     0x404e64: add             x0, PP, #0x12, lsl #12  ; [pp+0x12128] "О программе"
    //     0x404e68: ldr             x0, [x0, #0x128]
    // 0x404e6c: b               #0x404e8c
    // 0x404e70: cmp             x1, #0xf6
    // 0x404e74: b.ne            #0x404e84
    // 0x404e78: r0 = "Қолданба ақпары"
    //     0x404e78: add             x0, PP, #0x12, lsl #12  ; [pp+0x12130] "Қолданба ақпары"
    //     0x404e7c: ldr             x0, [x0, #0x130]
    // 0x404e80: b               #0x404e8c
    // 0x404e84: r0 = "Informacion de la applicacion"
    //     0x404e84: add             x0, PP, #0x12, lsl #12  ; [pp+0x12138] "Informacion de la applicacion"
    //     0x404e88: ldr             x0, [x0, #0x138]
    // 0x404e8c: stur            x0, [fp, #-0x28]
    // 0x404e90: r0 = Text()
    //     0x404e90: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x404e94: mov             x1, x0
    // 0x404e98: ldur            x0, [fp, #-0x28]
    // 0x404e9c: stur            x1, [fp, #-0x40]
    // 0x404ea0: StoreField: r1->field_b = r0
    //     0x404ea0: stur            w0, [x1, #0xb]
    // 0x404ea4: r0 = Instance_TextStyle
    //     0x404ea4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fa8] Obj!TextStyle@5d58a1
    //     0x404ea8: ldr             x0, [x0, #0xfa8]
    // 0x404eac: StoreField: r1->field_13 = r0
    //     0x404eac: stur            w0, [x1, #0x13]
    // 0x404eb0: r0 = Padding()
    //     0x404eb0: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x404eb4: mov             x1, x0
    // 0x404eb8: r0 = Instance_EdgeInsets
    //     0x404eb8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fb0] Obj!EdgeInsets@5cbf51
    //     0x404ebc: ldr             x0, [x0, #0xfb0]
    // 0x404ec0: StoreField: r1->field_f = r0
    //     0x404ec0: stur            w0, [x1, #0xf]
    // 0x404ec4: ldur            x0, [fp, #-0x40]
    // 0x404ec8: StoreField: r1->field_b = r0
    //     0x404ec8: stur            w0, [x1, #0xb]
    // 0x404ecc: mov             x0, x1
    // 0x404ed0: ldur            x1, [fp, #-0x30]
    // 0x404ed4: ArrayStore: r1[11] = r0  ; List_4
    //     0x404ed4: add             x25, x1, #0x3b
    //     0x404ed8: str             w0, [x25]
    //     0x404edc: tbz             w0, #0, #0x404ef8
    //     0x404ee0: ldurb           w16, [x1, #-1]
    //     0x404ee4: ldurb           w17, [x0, #-1]
    //     0x404ee8: and             x16, x17, x16, lsr #2
    //     0x404eec: tst             x16, HEAP, lsr #32
    //     0x404ef0: b.eq            #0x404ef8
    //     0x404ef4: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x404ef8: r16 = <AppLocale, Translations>
    //     0x404ef8: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x404efc: ldur            lr, [fp, #-0x18]
    // 0x404f00: stp             lr, x16, [SP]
    // 0x404f04: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x404f04: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x404f08: r0 = LocaleSettingsExt.currentTranslations()
    //     0x404f08: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x404f0c: r1 = LoadClassIdInstr(r0)
    //     0x404f0c: ldur            x1, [x0, #-1]
    //     0x404f10: ubfx            x1, x1, #0xc, #0x14
    // 0x404f14: cmp             x1, #0x8dd
    // 0x404f18: b.ne            #0x404f44
    // 0x404f1c: mov             x1, x0
    // 0x404f20: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x404f20: ldur            w0, [x1, #0x17]
    // 0x404f24: DecompressPointer r0
    //     0x404f24: add             x0, x0, HEAP, lsl #32
    // 0x404f28: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404f2c: cmp             w0, w16
    // 0x404f30: b.ne            #0x404f40
    // 0x404f34: r2 = settingsPage
    //     0x404f34: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x404f38: ldr             x2, [x2, #0x188]
    // 0x404f3c: r0 = InitLateFinalInstanceField()
    //     0x404f3c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404f40: b               #0x404fc8
    // 0x404f44: cmp             x1, #0x8df
    // 0x404f48: b.ne            #0x404f74
    // 0x404f4c: mov             x1, x0
    // 0x404f50: LoadField: r0 = r1->field_3b
    //     0x404f50: ldur            w0, [x1, #0x3b]
    // 0x404f54: DecompressPointer r0
    //     0x404f54: add             x0, x0, HEAP, lsl #32
    // 0x404f58: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404f5c: cmp             w0, w16
    // 0x404f60: b.ne            #0x404f70
    // 0x404f64: r2 = settingsPage
    //     0x404f64: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x404f68: ldr             x2, [x2, #0x190]
    // 0x404f6c: r0 = InitLateFinalInstanceField()
    //     0x404f6c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404f70: b               #0x404fc8
    // 0x404f74: cmp             x1, #0x8e0
    // 0x404f78: b.ne            #0x404fa4
    // 0x404f7c: mov             x1, x0
    // 0x404f80: LoadField: r0 = r1->field_3b
    //     0x404f80: ldur            w0, [x1, #0x3b]
    // 0x404f84: DecompressPointer r0
    //     0x404f84: add             x0, x0, HEAP, lsl #32
    // 0x404f88: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404f8c: cmp             w0, w16
    // 0x404f90: b.ne            #0x404fa0
    // 0x404f94: r2 = settingsPage
    //     0x404f94: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x404f98: ldr             x2, [x2, #0x198]
    // 0x404f9c: r0 = InitLateFinalInstanceField()
    //     0x404f9c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404fa0: b               #0x404fc8
    // 0x404fa4: mov             x1, x0
    // 0x404fa8: LoadField: r0 = r1->field_3b
    //     0x404fa8: ldur            w0, [x1, #0x3b]
    // 0x404fac: DecompressPointer r0
    //     0x404fac: add             x0, x0, HEAP, lsl #32
    // 0x404fb0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x404fb4: cmp             w0, w16
    // 0x404fb8: b.ne            #0x404fc8
    // 0x404fbc: r2 = settingsPage
    //     0x404fbc: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x404fc0: ldr             x2, [x2, #0x1a0]
    // 0x404fc4: r0 = InitLateFinalInstanceField()
    //     0x404fc4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x404fc8: r1 = LoadClassIdInstr(r0)
    //     0x404fc8: ldur            x1, [x0, #-1]
    //     0x404fcc: ubfx            x1, x1, #0xc, #0x14
    // 0x404fd0: cmp             x1, #0xf4
    // 0x404fd4: b.ne            #0x404fe4
    // 0x404fd8: r3 = "App info"
    //     0x404fd8: add             x3, PP, #0x12, lsl #12  ; [pp+0x12120] "App info"
    //     0x404fdc: ldr             x3, [x3, #0x120]
    // 0x404fe0: b               #0x405014
    // 0x404fe4: cmp             x1, #0xf5
    // 0x404fe8: b.ne            #0x404ff8
    // 0x404fec: r3 = "О программе"
    //     0x404fec: add             x3, PP, #0x12, lsl #12  ; [pp+0x12128] "О программе"
    //     0x404ff0: ldr             x3, [x3, #0x128]
    // 0x404ff4: b               #0x405014
    // 0x404ff8: cmp             x1, #0xf6
    // 0x404ffc: b.ne            #0x40500c
    // 0x405000: r3 = "Қолданба ақпары"
    //     0x405000: add             x3, PP, #0x12, lsl #12  ; [pp+0x12130] "Қолданба ақпары"
    //     0x405004: ldr             x3, [x3, #0x130]
    // 0x405008: b               #0x405014
    // 0x40500c: r3 = "Informacion de la applicacion"
    //     0x40500c: add             x3, PP, #0x12, lsl #12  ; [pp+0x12138] "Informacion de la applicacion"
    //     0x405010: ldr             x3, [x3, #0x138]
    // 0x405014: ldur            x0, [fp, #-8]
    // 0x405018: ldur            x2, [fp, #-0x38]
    // 0x40501c: ldur            x1, [fp, #-0x30]
    // 0x405020: stur            x3, [fp, #-0x18]
    // 0x405024: r0 = Text()
    //     0x405024: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x405028: mov             x2, x0
    // 0x40502c: ldur            x0, [fp, #-0x18]
    // 0x405030: stur            x2, [fp, #-0x28]
    // 0x405034: StoreField: r2->field_b = r0
    //     0x405034: stur            w0, [x2, #0xb]
    // 0x405038: ldur            x1, [fp, #-0x20]
    // 0x40503c: LoadField: r0 = r1->field_27
    //     0x40503c: ldur            w0, [x1, #0x27]
    // 0x405040: DecompressPointer r0
    //     0x405040: add             x0, x0, HEAP, lsl #32
    // 0x405044: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x405048: cmp             w0, w16
    // 0x40504c: b.ne            #0x40505c
    // 0x405050: r2 = zoomIn
    //     0x405050: add             x2, PP, #0x12, lsl #12  ; [pp+0x12140] Field <NesIconCollection.zoomIn>: late final (offset: 0x28)
    //     0x405054: ldr             x2, [x2, #0x140]
    // 0x405058: r0 = InitLateFinalInstanceField()
    //     0x405058: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40505c: stur            x0, [fp, #-0x18]
    // 0x405060: r0 = NesIcon()
    //     0x405060: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x405064: mov             x1, x0
    // 0x405068: ldur            x0, [fp, #-0x18]
    // 0x40506c: stur            x1, [fp, #-0x20]
    // 0x405070: StoreField: r1->field_b = r0
    //     0x405070: stur            w0, [x1, #0xb]
    // 0x405074: r0 = ListTile()
    //     0x405074: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x405078: mov             x3, x0
    // 0x40507c: ldur            x0, [fp, #-0x20]
    // 0x405080: stur            x3, [fp, #-0x18]
    // 0x405084: StoreField: r3->field_b = r0
    //     0x405084: stur            w0, [x3, #0xb]
    // 0x405088: ldur            x0, [fp, #-0x28]
    // 0x40508c: StoreField: r3->field_f = r0
    //     0x40508c: stur            w0, [x3, #0xf]
    // 0x405090: r0 = Instance_RoundedRectangleBorder
    //     0x405090: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x405094: ldr             x0, [x0, #0xfc0]
    // 0x405098: StoreField: r3->field_27 = r0
    //     0x405098: stur            w0, [x3, #0x27]
    // 0x40509c: r0 = Instance_EdgeInsets
    //     0x40509c: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x4050a0: ldr             x0, [x0, #0xd48]
    // 0x4050a4: StoreField: r3->field_47 = r0
    //     0x4050a4: stur            w0, [x3, #0x47]
    // 0x4050a8: r0 = true
    //     0x4050a8: add             x0, NULL, #0x20  ; true
    // 0x4050ac: StoreField: r3->field_4b = r0
    //     0x4050ac: stur            w0, [x3, #0x4b]
    // 0x4050b0: ldur            x2, [fp, #-0x10]
    // 0x4050b4: r1 = Function '<anonymous closure>':.
    //     0x4050b4: add             x1, PP, #0x12, lsl #12  ; [pp+0x12148] AnonymousClosure: (0x4051d0), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x4050b8: ldr             x1, [x1, #0x148]
    // 0x4050bc: r0 = AllocateClosure()
    //     0x4050bc: bl              #0x5838bc  ; AllocateClosureStub
    // 0x4050c0: mov             x1, x0
    // 0x4050c4: ldur            x0, [fp, #-0x18]
    // 0x4050c8: StoreField: r0->field_4f = r1
    //     0x4050c8: stur            w1, [x0, #0x4f]
    // 0x4050cc: r1 = false
    //     0x4050cc: add             x1, NULL, #0x30  ; false
    // 0x4050d0: StoreField: r0->field_5f = r1
    //     0x4050d0: stur            w1, [x0, #0x5f]
    // 0x4050d4: StoreField: r0->field_73 = r1
    //     0x4050d4: stur            w1, [x0, #0x73]
    // 0x4050d8: ldur            x2, [fp, #-8]
    // 0x4050dc: StoreField: r0->field_77 = r2
    //     0x4050dc: stur            w2, [x0, #0x77]
    // 0x4050e0: r2 = true
    //     0x4050e0: add             x2, NULL, #0x20  ; true
    // 0x4050e4: StoreField: r0->field_97 = r2
    //     0x4050e4: stur            w2, [x0, #0x97]
    // 0x4050e8: r0 = NesContainer()
    //     0x4050e8: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x4050ec: mov             x1, x0
    // 0x4050f0: ldur            x0, [fp, #-0x18]
    // 0x4050f4: stur            x1, [fp, #-8]
    // 0x4050f8: StoreField: r1->field_f = r0
    //     0x4050f8: stur            w0, [x1, #0xf]
    // 0x4050fc: r0 = Instance_EdgeInsets
    //     0x4050fc: add             x0, PP, #0xe, lsl #12  ; [pp+0xe498] Obj!EdgeInsets@5cbc81
    //     0x405100: ldr             x0, [x0, #0x498]
    // 0x405104: StoreField: r1->field_23 = r0
    //     0x405104: stur            w0, [x1, #0x23]
    // 0x405108: r0 = Padding()
    //     0x405108: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x40510c: mov             x1, x0
    // 0x405110: r0 = Instance_EdgeInsets
    //     0x405110: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc8] Obj!EdgeInsets@5cbc51
    //     0x405114: ldr             x0, [x0, #0xfc8]
    // 0x405118: StoreField: r1->field_f = r0
    //     0x405118: stur            w0, [x1, #0xf]
    // 0x40511c: ldur            x0, [fp, #-8]
    // 0x405120: StoreField: r1->field_b = r0
    //     0x405120: stur            w0, [x1, #0xb]
    // 0x405124: mov             x0, x1
    // 0x405128: ldur            x1, [fp, #-0x30]
    // 0x40512c: ArrayStore: r1[12] = r0  ; List_4
    //     0x40512c: add             x25, x1, #0x3f
    //     0x405130: str             w0, [x25]
    //     0x405134: tbz             w0, #0, #0x405150
    //     0x405138: ldurb           w16, [x1, #-1]
    //     0x40513c: ldurb           w17, [x0, #-1]
    //     0x405140: and             x16, x17, x16, lsr #2
    //     0x405144: tst             x16, HEAP, lsr #32
    //     0x405148: b.eq            #0x405150
    //     0x40514c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x405150: r1 = <Widget>
    //     0x405150: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x405154: r0 = AllocateGrowableArray()
    //     0x405154: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x405158: mov             x1, x0
    // 0x40515c: ldur            x0, [fp, #-0x30]
    // 0x405160: stur            x1, [fp, #-8]
    // 0x405164: StoreField: r1->field_f = r0
    //     0x405164: stur            w0, [x1, #0xf]
    // 0x405168: r0 = 26
    //     0x405168: mov             x0, #0x1a
    // 0x40516c: StoreField: r1->field_b = r0
    //     0x40516c: stur            w0, [x1, #0xb]
    // 0x405170: r0 = ListView()
    //     0x405170: bl              #0x387858  ; AllocateListViewStub -> ListView (size=0x6c)
    // 0x405174: mov             x1, x0
    // 0x405178: ldur            x2, [fp, #-8]
    // 0x40517c: stur            x0, [fp, #-8]
    // 0x405180: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x405180: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x405184: r0 = ListView()
    //     0x405184: bl              #0x3883fc  ; [package:flutter/src/widgets/scroll_view.dart] ListView::ListView
    // 0x405188: r0 = Scaffold()
    //     0x405188: bl              #0x370d84  ; AllocateScaffoldStub -> Scaffold (size=0x50)
    // 0x40518c: ldur            x1, [fp, #-0x38]
    // 0x405190: StoreField: r0->field_13 = r1
    //     0x405190: stur            w1, [x0, #0x13]
    // 0x405194: ldur            x1, [fp, #-8]
    // 0x405198: ArrayStore: r0[0] = r1  ; List_4
    //     0x405198: stur            w1, [x0, #0x17]
    // 0x40519c: r1 = true
    //     0x40519c: add             x1, NULL, #0x20  ; true
    // 0x4051a0: StoreField: r0->field_47 = r1
    //     0x4051a0: stur            w1, [x0, #0x47]
    // 0x4051a4: r1 = false
    //     0x4051a4: add             x1, NULL, #0x30  ; false
    // 0x4051a8: StoreField: r0->field_b = r1
    //     0x4051a8: stur            w1, [x0, #0xb]
    // 0x4051ac: StoreField: r0->field_f = r1
    //     0x4051ac: stur            w1, [x0, #0xf]
    // 0x4051b0: r1 = Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static.
    //     0x4051b0: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd50] Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static. (0x7c033375e380)
    //     0x4051b4: ldr             x1, [x1, #0xd50]
    // 0x4051b8: StoreField: r0->field_33 = r1
    //     0x4051b8: stur            w1, [x0, #0x33]
    // 0x4051bc: LeaveFrame
    //     0x4051bc: mov             SP, fp
    //     0x4051c0: ldp             fp, lr, [SP], #0x10
    // 0x4051c4: ret
    //     0x4051c4: ret             
    // 0x4051c8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4051c8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4051cc: b               #0x4034a4
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x4051d0, size: 0x24c
    // 0x4051d0: EnterFrame
    //     0x4051d0: stp             fp, lr, [SP, #-0x10]!
    //     0x4051d4: mov             fp, SP
    // 0x4051d8: AllocStack(0x38)
    //     0x4051d8: sub             SP, SP, #0x38
    // 0x4051dc: SetupParameters([dynamic _ /* r0 */])
    //     0x4051dc: ldr             x0, [fp, #0x10]
    //     0x4051e0: ldur            w2, [x0, #0x17]
    //     0x4051e4: add             x2, x2, HEAP, lsl #32
    //     0x4051e8: stur            x2, [fp, #-8]
    // 0x4051ec: CheckStackOverflow
    //     0x4051ec: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4051f0: cmp             SP, x16
    //     0x4051f4: b.ls            #0x405414
    // 0x4051f8: LoadField: r1 = r2->field_f
    //     0x4051f8: ldur            w1, [x2, #0xf]
    // 0x4051fc: DecompressPointer r1
    //     0x4051fc: add             x1, x1, HEAP, lsl #32
    // 0x405200: r0 = sizeOf()
    //     0x405200: bl              #0x332910  ; [package:flutter/src/widgets/media_query.dart] MediaQuery::sizeOf
    // 0x405204: LoadField: d0 = r0->field_7
    //     0x405204: ldur            d0, [x0, #7]
    // 0x405208: d1 = 0.150000
    //     0x405208: add             x17, PP, #0xb, lsl #12  ; [pp+0xb5d0] IMM: double(0.15) from 0x3fc3333333333333
    //     0x40520c: ldr             d1, [x17, #0x5d0]
    // 0x405210: fmul            d2, d0, d1
    // 0x405214: d0 = 64.000000
    //     0x405214: add             x17, PP, #0x10, lsl #12  ; [pp+0x10958] IMM: double(64) from 0x4050000000000000
    //     0x405218: ldr             d0, [x17, #0x958]
    // 0x40521c: fmin            v1.2d, v0.2d, v2.2d
    // 0x405220: ldur            x0, [fp, #-8]
    // 0x405224: stur            d1, [fp, #-0x28]
    // 0x405228: LoadField: r5 = r0->field_f
    //     0x405228: ldur            w5, [x0, #0xf]
    // 0x40522c: DecompressPointer r5
    //     0x40522c: add             x5, x5, HEAP, lsl #32
    // 0x405230: stur            x5, [fp, #-0x10]
    // 0x405234: r0 = LoadStaticField(0x468)
    //     0x405234: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x405238: ldr             x0, [x0, #0x8d0]
    // 0x40523c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x405240: cmp             w0, w16
    // 0x405244: b.ne            #0x405250
    // 0x405248: r2 = instance
    //     0x405248: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x40524c: r0 = InitLateFinalStaticField()
    //     0x40524c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x405250: stur            x0, [fp, #-8]
    // 0x405254: r16 = <AppLocale, Translations>
    //     0x405254: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x405258: stp             x0, x16, [SP]
    // 0x40525c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x40525c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x405260: r0 = LocaleSettingsExt.currentTranslations()
    //     0x405260: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x405264: r1 = LoadClassIdInstr(r0)
    //     0x405264: ldur            x1, [x0, #-1]
    //     0x405268: ubfx            x1, x1, #0xc, #0x14
    // 0x40526c: cmp             x1, #0x8dd
    // 0x405270: b.ne            #0x405280
    // 0x405274: r3 = "Ricochlime"
    //     0x405274: add             x3, PP, #9, lsl #12  ; [pp+0x9110] "Ricochlime"
    //     0x405278: ldr             x3, [x3, #0x110]
    // 0x40527c: b               #0x4052b0
    // 0x405280: cmp             x1, #0x8df
    // 0x405284: b.ne            #0x405294
    // 0x405288: r3 = "Рикошлим"
    //     0x405288: add             x3, PP, #9, lsl #12  ; [pp+0x9118] "Рикошлим"
    //     0x40528c: ldr             x3, [x3, #0x118]
    // 0x405290: b               #0x4052b0
    // 0x405294: cmp             x1, #0x8e0
    // 0x405298: b.ne            #0x4052a8
    // 0x40529c: r3 = "Рикошырыш"
    //     0x40529c: add             x3, PP, #9, lsl #12  ; [pp+0x9120] "Рикошырыш"
    //     0x4052a0: ldr             x3, [x3, #0x120]
    // 0x4052a4: b               #0x4052b0
    // 0x4052a8: r3 = "Ricochlime"
    //     0x4052a8: add             x3, PP, #9, lsl #12  ; [pp+0x9110] "Ricochlime"
    //     0x4052ac: ldr             x3, [x3, #0x110]
    // 0x4052b0: stur            x3, [fp, #-0x18]
    // 0x4052b4: r0 = Image()
    //     0x4052b4: bl              #0x3ff384  ; AllocateImageStub -> Image (size=0x60)
    // 0x4052b8: mov             x1, x0
    // 0x4052bc: ldur            d0, [fp, #-0x28]
    // 0x4052c0: ldur            d1, [fp, #-0x28]
    // 0x4052c4: r2 = "assets/icon/icon.png"
    //     0x4052c4: add             x2, PP, #0x12, lsl #12  ; [pp+0x12150] "assets/icon/icon.png"
    //     0x4052c8: ldr             x2, [x2, #0x150]
    // 0x4052cc: stur            x0, [fp, #-0x20]
    // 0x4052d0: r4 = const [0, 0x4, 0, 0x4, null]
    //     0x4052d0: ldr             x4, [PP, #0x16c8]  ; [pp+0x16c8] List(5) [0, 0x4, 0, 0x4, Null]
    // 0x4052d4: r0 = Image.asset()
    //     0x4052d4: bl              #0x3ff1a0  ; [package:flutter/src/widgets/image.dart] Image::Image.asset
    // 0x4052d8: r16 = <AppLocale, Translations>
    //     0x4052d8: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4052dc: ldur            lr, [fp, #-8]
    // 0x4052e0: stp             lr, x16, [SP]
    // 0x4052e4: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x4052e4: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x4052e8: r0 = LocaleSettingsExt.currentTranslations()
    //     0x4052e8: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x4052ec: r1 = LoadClassIdInstr(r0)
    //     0x4052ec: ldur            x1, [x0, #-1]
    //     0x4052f0: ubfx            x1, x1, #0xc, #0x14
    // 0x4052f4: cmp             x1, #0x8dd
    // 0x4052f8: b.ne            #0x405324
    // 0x4052fc: mov             x1, x0
    // 0x405300: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x405300: ldur            w0, [x1, #0x17]
    // 0x405304: DecompressPointer r0
    //     0x405304: add             x0, x0, HEAP, lsl #32
    // 0x405308: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40530c: cmp             w0, w16
    // 0x405310: b.ne            #0x405320
    // 0x405314: r2 = settingsPage
    //     0x405314: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x405318: ldr             x2, [x2, #0x188]
    // 0x40531c: r0 = InitLateFinalInstanceField()
    //     0x40531c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x405320: b               #0x4053a8
    // 0x405324: cmp             x1, #0x8df
    // 0x405328: b.ne            #0x405354
    // 0x40532c: mov             x1, x0
    // 0x405330: LoadField: r0 = r1->field_3b
    //     0x405330: ldur            w0, [x1, #0x3b]
    // 0x405334: DecompressPointer r0
    //     0x405334: add             x0, x0, HEAP, lsl #32
    // 0x405338: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40533c: cmp             w0, w16
    // 0x405340: b.ne            #0x405350
    // 0x405344: r2 = settingsPage
    //     0x405344: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x405348: ldr             x2, [x2, #0x190]
    // 0x40534c: r0 = InitLateFinalInstanceField()
    //     0x40534c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x405350: b               #0x4053a8
    // 0x405354: cmp             x1, #0x8e0
    // 0x405358: b.ne            #0x405384
    // 0x40535c: mov             x1, x0
    // 0x405360: LoadField: r0 = r1->field_3b
    //     0x405360: ldur            w0, [x1, #0x3b]
    // 0x405364: DecompressPointer r0
    //     0x405364: add             x0, x0, HEAP, lsl #32
    // 0x405368: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40536c: cmp             w0, w16
    // 0x405370: b.ne            #0x405380
    // 0x405374: r2 = settingsPage
    //     0x405374: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x405378: ldr             x2, [x2, #0x198]
    // 0x40537c: r0 = InitLateFinalInstanceField()
    //     0x40537c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x405380: b               #0x4053a8
    // 0x405384: mov             x1, x0
    // 0x405388: LoadField: r0 = r1->field_3b
    //     0x405388: ldur            w0, [x1, #0x3b]
    // 0x40538c: DecompressPointer r0
    //     0x40538c: add             x0, x0, HEAP, lsl #32
    // 0x405390: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x405394: cmp             w0, w16
    // 0x405398: b.ne            #0x4053a8
    // 0x40539c: r2 = settingsPage
    //     0x40539c: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x4053a0: ldr             x2, [x2, #0x1a0]
    // 0x4053a4: r0 = InitLateFinalInstanceField()
    //     0x4053a4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4053a8: r1 = LoadClassIdInstr(r0)
    //     0x4053a8: ldur            x1, [x0, #-1]
    //     0x4053ac: ubfx            x1, x1, #0xc, #0x14
    // 0x4053b0: cmp             x1, #0xf4
    // 0x4053b4: b.ne            #0x4053c4
    // 0x4053b8: r2 = "Ricochlime  Copyright (C) 2023-2026  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions."
    //     0x4053b8: add             x2, PP, #0x12, lsl #12  ; [pp+0x12158] "Ricochlime  Copyright (C) 2023-2026  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions."
    //     0x4053bc: ldr             x2, [x2, #0x158]
    // 0x4053c0: b               #0x4053f4
    // 0x4053c4: cmp             x1, #0xf5
    // 0x4053c8: b.ne            #0x4053d8
    // 0x4053cc: r2 = "Ricochlime  Copyright (C) 2023-2026  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions."
    //     0x4053cc: add             x2, PP, #0x12, lsl #12  ; [pp+0x12158] "Ricochlime  Copyright (C) 2023-2026  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions."
    //     0x4053d0: ldr             x2, [x2, #0x158]
    // 0x4053d4: b               #0x4053f4
    // 0x4053d8: cmp             x1, #0xf6
    // 0x4053dc: b.ne            #0x4053ec
    // 0x4053e0: r2 = "Ricochlime  Copyright (C) 2023-2026  Adil Hanney\nБұл бағдарлама еш кепілдіксіз жеткізіледі. Ол еркін екенін ескере отырып, сіз оны кейбір шарттардың аясында еркін тарата аласыз."
    //     0x4053e0: add             x2, PP, #0x12, lsl #12  ; [pp+0x12160] "Ricochlime  Copyright (C) 2023-2026  Adil Hanney\nБұл бағдарлама еш кепілдіксіз жеткізіледі. Ол еркін екенін ескере отырып, сіз оны кейбір шарттардың аясында еркін тарата аласыз."
    //     0x4053e4: ldr             x2, [x2, #0x160]
    // 0x4053e8: b               #0x4053f4
    // 0x4053ec: r2 = "Ricochlime  Copyright (C) 2023-2026  Adil Hanney\nEste programa no tiene ninguna garantía. Este es un software gratuito y puede redistribuirlo bajo ciertas condiciones.\n"
    //     0x4053ec: add             x2, PP, #0x12, lsl #12  ; [pp+0x12168] "Ricochlime  Copyright (C) 2023-2026  Adil Hanney\nEste programa no tiene ninguna garantía. Este es un software gratuito y puede redistribuirlo bajo ciertas condiciones.\n"
    //     0x4053f0: ldr             x2, [x2, #0x168]
    // 0x4053f4: ldur            x1, [fp, #-0x20]
    // 0x4053f8: ldur            x3, [fp, #-0x18]
    // 0x4053fc: ldur            x5, [fp, #-0x10]
    // 0x405400: r0 = showAboutDialog()
    //     0x405400: bl              #0x40541c  ; [package:flutter/src/material/about.dart] ::showAboutDialog
    // 0x405404: r0 = Null
    //     0x405404: mov             x0, NULL
    // 0x405408: LeaveFrame
    //     0x405408: mov             SP, fp
    //     0x40540c: ldp             fp, lr, [SP], #0x10
    // 0x405410: ret
    //     0x405410: ret             
    // 0x405414: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x405414: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x405418: b               #0x4051f8
  }
  [closure] MergeSemantics <anonymous closure>(dynamic, BuildContext, bool, Widget?) {
    // ** addr: 0x42a3b8, size: 0x1ac
    // 0x42a3b8: EnterFrame
    //     0x42a3b8: stp             fp, lr, [SP, #-0x10]!
    //     0x42a3bc: mov             fp, SP
    // 0x42a3c0: AllocStack(0x20)
    //     0x42a3c0: sub             SP, SP, #0x20
    // 0x42a3c4: SetupParameters([dynamic _ /* r0 */])
    //     0x42a3c4: ldr             x0, [fp, #0x28]
    //     0x42a3c8: ldur            w1, [x0, #0x17]
    //     0x42a3cc: add             x1, x1, HEAP, lsl #32
    //     0x42a3d0: stur            x1, [fp, #-8]
    // 0x42a3d4: CheckStackOverflow
    //     0x42a3d4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42a3d8: cmp             SP, x16
    //     0x42a3dc: b.ls            #0x42a55c
    // 0x42a3e0: r0 = LoadStaticField(0xc74)
    //     0x42a3e0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a3e4: ldr             x0, [x0, #0x18e8]
    // 0x42a3e8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a3ec: cmp             w0, w16
    // 0x42a3f0: b.ne            #0x42a400
    // 0x42a3f4: r2 = NesIcons
    //     0x42a3f4: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x42a3f8: ldr             x2, [x2, #0xf70]
    // 0x42a3fc: r0 = InitLateFinalStaticField()
    //     0x42a3fc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a400: mov             x1, x0
    // 0x42a404: LoadField: r0 = r1->field_27
    //     0x42a404: ldur            w0, [x1, #0x27]
    // 0x42a408: DecompressPointer r0
    //     0x42a408: add             x0, x0, HEAP, lsl #32
    // 0x42a40c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a410: cmp             w0, w16
    // 0x42a414: b.ne            #0x42a424
    // 0x42a418: r2 = zoomIn
    //     0x42a418: add             x2, PP, #0x12, lsl #12  ; [pp+0x12140] Field <NesIconCollection.zoomIn>: late final (offset: 0x28)
    //     0x42a41c: ldr             x2, [x2, #0x140]
    // 0x42a420: r0 = InitLateFinalInstanceField()
    //     0x42a420: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42a424: stur            x0, [fp, #-0x10]
    // 0x42a428: r0 = NesIcon()
    //     0x42a428: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x42a42c: mov             x1, x0
    // 0x42a430: ldur            x0, [fp, #-0x10]
    // 0x42a434: stur            x1, [fp, #-0x18]
    // 0x42a438: StoreField: r1->field_b = r0
    //     0x42a438: stur            w0, [x1, #0xb]
    // 0x42a43c: ldur            x0, [fp, #-8]
    // 0x42a440: LoadField: r2 = r0->field_13
    //     0x42a440: ldur            w2, [x0, #0x13]
    // 0x42a444: DecompressPointer r2
    //     0x42a444: add             x2, x2, HEAP, lsl #32
    // 0x42a448: stur            x2, [fp, #-0x10]
    // 0x42a44c: r0 = LoadStaticField(0xccc)
    //     0x42a44c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a450: ldr             x0, [x0, #0x1998]
    // 0x42a454: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a458: cmp             w0, w16
    // 0x42a45c: b.ne            #0x42a46c
    // 0x42a460: r2 = stows
    //     0x42a460: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42a464: ldr             x2, [x2, #0x310]
    // 0x42a468: r0 = InitLateFinalStaticField()
    //     0x42a468: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a46c: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x42a46c: ldur            w1, [x0, #0x17]
    // 0x42a470: DecompressPointer r1
    //     0x42a470: add             x1, x1, HEAP, lsl #32
    // 0x42a474: LoadField: r0 = r1->field_43
    //     0x42a474: ldur            w0, [x1, #0x43]
    // 0x42a478: DecompressPointer r0
    //     0x42a478: add             x0, x0, HEAP, lsl #32
    // 0x42a47c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a480: cmp             w0, w16
    // 0x42a484: b.ne            #0x42a494
    // 0x42a488: r2 = _value
    //     0x42a488: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42a48c: ldr             x2, [x2, #0x4b0]
    // 0x42a490: r0 = InitLateInstanceField()
    //     0x42a490: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42a494: stur            x0, [fp, #-8]
    // 0x42a498: r0 = NesCheckBox()
    //     0x42a498: bl              #0x42a570  ; AllocateNesCheckBoxStub -> NesCheckBox (size=0x14)
    // 0x42a49c: mov             x3, x0
    // 0x42a4a0: ldur            x0, [fp, #-8]
    // 0x42a4a4: stur            x3, [fp, #-0x20]
    // 0x42a4a8: StoreField: r3->field_b = r0
    //     0x42a4a8: stur            w0, [x3, #0xb]
    // 0x42a4ac: r1 = Function '<anonymous closure>':.
    //     0x42a4ac: add             x1, PP, #0x12, lsl #12  ; [pp+0x12228] AnonymousClosure: (0x42a610), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42a4b0: ldr             x1, [x1, #0x228]
    // 0x42a4b4: r2 = Null
    //     0x42a4b4: mov             x2, NULL
    // 0x42a4b8: r0 = AllocateClosure()
    //     0x42a4b8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42a4bc: mov             x1, x0
    // 0x42a4c0: ldur            x0, [fp, #-0x20]
    // 0x42a4c4: StoreField: r0->field_f = r1
    //     0x42a4c4: stur            w1, [x0, #0xf]
    // 0x42a4c8: r0 = ListTile()
    //     0x42a4c8: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x42a4cc: mov             x3, x0
    // 0x42a4d0: ldur            x0, [fp, #-0x18]
    // 0x42a4d4: stur            x3, [fp, #-8]
    // 0x42a4d8: StoreField: r3->field_b = r0
    //     0x42a4d8: stur            w0, [x3, #0xb]
    // 0x42a4dc: ldr             x0, [fp, #0x10]
    // 0x42a4e0: StoreField: r3->field_f = r0
    //     0x42a4e0: stur            w0, [x3, #0xf]
    // 0x42a4e4: ldur            x0, [fp, #-0x20]
    // 0x42a4e8: ArrayStore: r3[0] = r0  ; List_4
    //     0x42a4e8: stur            w0, [x3, #0x17]
    // 0x42a4ec: r0 = Instance_RoundedRectangleBorder
    //     0x42a4ec: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x42a4f0: ldr             x0, [x0, #0xfc0]
    // 0x42a4f4: StoreField: r3->field_27 = r0
    //     0x42a4f4: stur            w0, [x3, #0x27]
    // 0x42a4f8: r0 = Instance_EdgeInsets
    //     0x42a4f8: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x42a4fc: ldr             x0, [x0, #0xd48]
    // 0x42a500: StoreField: r3->field_47 = r0
    //     0x42a500: stur            w0, [x3, #0x47]
    // 0x42a504: r0 = true
    //     0x42a504: add             x0, NULL, #0x20  ; true
    // 0x42a508: StoreField: r3->field_4b = r0
    //     0x42a508: stur            w0, [x3, #0x4b]
    // 0x42a50c: r1 = Function '<anonymous closure>':.
    //     0x42a50c: add             x1, PP, #0x12, lsl #12  ; [pp+0x12230] AnonymousClosure: (0x42a57c), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42a510: ldr             x1, [x1, #0x230]
    // 0x42a514: r2 = Null
    //     0x42a514: mov             x2, NULL
    // 0x42a518: r0 = AllocateClosure()
    //     0x42a518: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42a51c: mov             x1, x0
    // 0x42a520: ldur            x0, [fp, #-8]
    // 0x42a524: StoreField: r0->field_4f = r1
    //     0x42a524: stur            w1, [x0, #0x4f]
    // 0x42a528: r1 = false
    //     0x42a528: add             x1, NULL, #0x30  ; false
    // 0x42a52c: StoreField: r0->field_5f = r1
    //     0x42a52c: stur            w1, [x0, #0x5f]
    // 0x42a530: StoreField: r0->field_73 = r1
    //     0x42a530: stur            w1, [x0, #0x73]
    // 0x42a534: ldur            x1, [fp, #-0x10]
    // 0x42a538: StoreField: r0->field_77 = r1
    //     0x42a538: stur            w1, [x0, #0x77]
    // 0x42a53c: r1 = true
    //     0x42a53c: add             x1, NULL, #0x20  ; true
    // 0x42a540: StoreField: r0->field_97 = r1
    //     0x42a540: stur            w1, [x0, #0x97]
    // 0x42a544: r0 = MergeSemantics()
    //     0x42a544: bl              #0x42a564  ; AllocateMergeSemanticsStub -> MergeSemantics (size=0x10)
    // 0x42a548: ldur            x1, [fp, #-8]
    // 0x42a54c: StoreField: r0->field_b = r1
    //     0x42a54c: stur            w1, [x0, #0xb]
    // 0x42a550: LeaveFrame
    //     0x42a550: mov             SP, fp
    //     0x42a554: ldp             fp, lr, [SP], #0x10
    // 0x42a558: ret
    //     0x42a558: ret             
    // 0x42a55c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42a55c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42a560: b               #0x42a3e0
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42a57c, size: 0x94
    // 0x42a57c: EnterFrame
    //     0x42a57c: stp             fp, lr, [SP, #-0x10]!
    //     0x42a580: mov             fp, SP
    // 0x42a584: AllocStack(0x10)
    //     0x42a584: sub             SP, SP, #0x10
    // 0x42a588: CheckStackOverflow
    //     0x42a588: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42a58c: cmp             SP, x16
    //     0x42a590: b.ls            #0x42a608
    // 0x42a594: r0 = LoadStaticField(0xccc)
    //     0x42a594: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a598: ldr             x0, [x0, #0x1998]
    // 0x42a59c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a5a0: cmp             w0, w16
    // 0x42a5a4: b.ne            #0x42a5b4
    // 0x42a5a8: r2 = stows
    //     0x42a5a8: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42a5ac: ldr             x2, [x2, #0x310]
    // 0x42a5b0: r0 = InitLateFinalStaticField()
    //     0x42a5b0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a5b4: ArrayLoad: r2 = r0[0]  ; List_4
    //     0x42a5b4: ldur            w2, [x0, #0x17]
    // 0x42a5b8: DecompressPointer r2
    //     0x42a5b8: add             x2, x2, HEAP, lsl #32
    // 0x42a5bc: mov             x1, x2
    // 0x42a5c0: stur            x2, [fp, #-8]
    // 0x42a5c4: LoadField: r0 = r1->field_43
    //     0x42a5c4: ldur            w0, [x1, #0x43]
    // 0x42a5c8: DecompressPointer r0
    //     0x42a5c8: add             x0, x0, HEAP, lsl #32
    // 0x42a5cc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a5d0: cmp             w0, w16
    // 0x42a5d4: b.ne            #0x42a5e4
    // 0x42a5d8: r2 = _value
    //     0x42a5d8: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42a5dc: ldr             x2, [x2, #0x4b0]
    // 0x42a5e0: r0 = InitLateInstanceField()
    //     0x42a5e0: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42a5e4: eor             x3, x0, #0x10
    // 0x42a5e8: ldur            x1, [fp, #-8]
    // 0x42a5ec: mov             x2, x3
    // 0x42a5f0: stur            x3, [fp, #-0x10]
    // 0x42a5f4: r0 = value=()
    //     0x42a5f4: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42a5f8: ldur            x0, [fp, #-0x10]
    // 0x42a5fc: LeaveFrame
    //     0x42a5fc: mov             SP, fp
    //     0x42a600: ldp             fp, lr, [SP], #0x10
    // 0x42a604: ret
    //     0x42a604: ret             
    // 0x42a608: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42a608: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42a60c: b               #0x42a594
  }
  [closure] void <anonymous closure>(dynamic, bool) {
    // ** addr: 0x42a610, size: 0x5c
    // 0x42a610: EnterFrame
    //     0x42a610: stp             fp, lr, [SP, #-0x10]!
    //     0x42a614: mov             fp, SP
    // 0x42a618: CheckStackOverflow
    //     0x42a618: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42a61c: cmp             SP, x16
    //     0x42a620: b.ls            #0x42a664
    // 0x42a624: r0 = LoadStaticField(0xccc)
    //     0x42a624: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a628: ldr             x0, [x0, #0x1998]
    // 0x42a62c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a630: cmp             w0, w16
    // 0x42a634: b.ne            #0x42a644
    // 0x42a638: r2 = stows
    //     0x42a638: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42a63c: ldr             x2, [x2, #0x310]
    // 0x42a640: r0 = InitLateFinalStaticField()
    //     0x42a640: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a644: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x42a644: ldur            w1, [x0, #0x17]
    // 0x42a648: DecompressPointer r1
    //     0x42a648: add             x1, x1, HEAP, lsl #32
    // 0x42a64c: ldr             x2, [fp, #0x10]
    // 0x42a650: r0 = value=()
    //     0x42a650: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42a654: r0 = Null
    //     0x42a654: mov             x0, NULL
    // 0x42a658: LeaveFrame
    //     0x42a658: mov             SP, fp
    //     0x42a65c: ldp             fp, lr, [SP], #0x10
    // 0x42a660: ret
    //     0x42a660: ret             
    // 0x42a664: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42a664: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42a668: b               #0x42a624
  }
  [closure] MergeSemantics <anonymous closure>(dynamic, BuildContext, bool, Widget?) {
    // ** addr: 0x42a66c, size: 0x1ac
    // 0x42a66c: EnterFrame
    //     0x42a66c: stp             fp, lr, [SP, #-0x10]!
    //     0x42a670: mov             fp, SP
    // 0x42a674: AllocStack(0x20)
    //     0x42a674: sub             SP, SP, #0x20
    // 0x42a678: SetupParameters([dynamic _ /* r0 */])
    //     0x42a678: ldr             x0, [fp, #0x28]
    //     0x42a67c: ldur            w1, [x0, #0x17]
    //     0x42a680: add             x1, x1, HEAP, lsl #32
    //     0x42a684: stur            x1, [fp, #-8]
    // 0x42a688: CheckStackOverflow
    //     0x42a688: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42a68c: cmp             SP, x16
    //     0x42a690: b.ls            #0x42a810
    // 0x42a694: r0 = LoadStaticField(0xc74)
    //     0x42a694: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a698: ldr             x0, [x0, #0x18e8]
    // 0x42a69c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a6a0: cmp             w0, w16
    // 0x42a6a4: b.ne            #0x42a6b4
    // 0x42a6a8: r2 = NesIcons
    //     0x42a6a8: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x42a6ac: ldr             x2, [x2, #0xf70]
    // 0x42a6b0: r0 = InitLateFinalStaticField()
    //     0x42a6b0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a6b4: mov             x1, x0
    // 0x42a6b8: LoadField: r0 = r1->field_37
    //     0x42a6b8: ldur            w0, [x1, #0x37]
    // 0x42a6bc: DecompressPointer r0
    //     0x42a6bc: add             x0, x0, HEAP, lsl #32
    // 0x42a6c0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a6c4: cmp             w0, w16
    // 0x42a6c8: b.ne            #0x42a6d8
    // 0x42a6cc: r2 = energy
    //     0x42a6cc: add             x2, PP, #0x12, lsl #12  ; [pp+0x12238] Field <NesIconCollection.energy>: late final (offset: 0x38)
    //     0x42a6d0: ldr             x2, [x2, #0x238]
    // 0x42a6d4: r0 = InitLateFinalInstanceField()
    //     0x42a6d4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42a6d8: stur            x0, [fp, #-0x10]
    // 0x42a6dc: r0 = NesIcon()
    //     0x42a6dc: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x42a6e0: mov             x1, x0
    // 0x42a6e4: ldur            x0, [fp, #-0x10]
    // 0x42a6e8: stur            x1, [fp, #-0x18]
    // 0x42a6ec: StoreField: r1->field_b = r0
    //     0x42a6ec: stur            w0, [x1, #0xb]
    // 0x42a6f0: ldur            x0, [fp, #-8]
    // 0x42a6f4: LoadField: r2 = r0->field_13
    //     0x42a6f4: ldur            w2, [x0, #0x13]
    // 0x42a6f8: DecompressPointer r2
    //     0x42a6f8: add             x2, x2, HEAP, lsl #32
    // 0x42a6fc: stur            x2, [fp, #-0x10]
    // 0x42a700: r0 = LoadStaticField(0xccc)
    //     0x42a700: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a704: ldr             x0, [x0, #0x1998]
    // 0x42a708: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a70c: cmp             w0, w16
    // 0x42a710: b.ne            #0x42a720
    // 0x42a714: r2 = stows
    //     0x42a714: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42a718: ldr             x2, [x2, #0x310]
    // 0x42a71c: r0 = InitLateFinalStaticField()
    //     0x42a71c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a720: LoadField: r1 = r0->field_13
    //     0x42a720: ldur            w1, [x0, #0x13]
    // 0x42a724: DecompressPointer r1
    //     0x42a724: add             x1, x1, HEAP, lsl #32
    // 0x42a728: LoadField: r0 = r1->field_43
    //     0x42a728: ldur            w0, [x1, #0x43]
    // 0x42a72c: DecompressPointer r0
    //     0x42a72c: add             x0, x0, HEAP, lsl #32
    // 0x42a730: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a734: cmp             w0, w16
    // 0x42a738: b.ne            #0x42a748
    // 0x42a73c: r2 = _value
    //     0x42a73c: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42a740: ldr             x2, [x2, #0x4b0]
    // 0x42a744: r0 = InitLateInstanceField()
    //     0x42a744: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42a748: stur            x0, [fp, #-8]
    // 0x42a74c: r0 = NesCheckBox()
    //     0x42a74c: bl              #0x42a570  ; AllocateNesCheckBoxStub -> NesCheckBox (size=0x14)
    // 0x42a750: mov             x3, x0
    // 0x42a754: ldur            x0, [fp, #-8]
    // 0x42a758: stur            x3, [fp, #-0x20]
    // 0x42a75c: StoreField: r3->field_b = r0
    //     0x42a75c: stur            w0, [x3, #0xb]
    // 0x42a760: r1 = Function '<anonymous closure>':.
    //     0x42a760: add             x1, PP, #0x12, lsl #12  ; [pp+0x12240] AnonymousClosure: (0x42a8ac), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42a764: ldr             x1, [x1, #0x240]
    // 0x42a768: r2 = Null
    //     0x42a768: mov             x2, NULL
    // 0x42a76c: r0 = AllocateClosure()
    //     0x42a76c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42a770: mov             x1, x0
    // 0x42a774: ldur            x0, [fp, #-0x20]
    // 0x42a778: StoreField: r0->field_f = r1
    //     0x42a778: stur            w1, [x0, #0xf]
    // 0x42a77c: r0 = ListTile()
    //     0x42a77c: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x42a780: mov             x3, x0
    // 0x42a784: ldur            x0, [fp, #-0x18]
    // 0x42a788: stur            x3, [fp, #-8]
    // 0x42a78c: StoreField: r3->field_b = r0
    //     0x42a78c: stur            w0, [x3, #0xb]
    // 0x42a790: ldr             x0, [fp, #0x10]
    // 0x42a794: StoreField: r3->field_f = r0
    //     0x42a794: stur            w0, [x3, #0xf]
    // 0x42a798: ldur            x0, [fp, #-0x20]
    // 0x42a79c: ArrayStore: r3[0] = r0  ; List_4
    //     0x42a79c: stur            w0, [x3, #0x17]
    // 0x42a7a0: r0 = Instance_RoundedRectangleBorder
    //     0x42a7a0: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x42a7a4: ldr             x0, [x0, #0xfc0]
    // 0x42a7a8: StoreField: r3->field_27 = r0
    //     0x42a7a8: stur            w0, [x3, #0x27]
    // 0x42a7ac: r0 = Instance_EdgeInsets
    //     0x42a7ac: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x42a7b0: ldr             x0, [x0, #0xd48]
    // 0x42a7b4: StoreField: r3->field_47 = r0
    //     0x42a7b4: stur            w0, [x3, #0x47]
    // 0x42a7b8: r0 = true
    //     0x42a7b8: add             x0, NULL, #0x20  ; true
    // 0x42a7bc: StoreField: r3->field_4b = r0
    //     0x42a7bc: stur            w0, [x3, #0x4b]
    // 0x42a7c0: r1 = Function '<anonymous closure>':.
    //     0x42a7c0: add             x1, PP, #0x12, lsl #12  ; [pp+0x12248] AnonymousClosure: (0x42a818), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42a7c4: ldr             x1, [x1, #0x248]
    // 0x42a7c8: r2 = Null
    //     0x42a7c8: mov             x2, NULL
    // 0x42a7cc: r0 = AllocateClosure()
    //     0x42a7cc: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42a7d0: mov             x1, x0
    // 0x42a7d4: ldur            x0, [fp, #-8]
    // 0x42a7d8: StoreField: r0->field_4f = r1
    //     0x42a7d8: stur            w1, [x0, #0x4f]
    // 0x42a7dc: r1 = false
    //     0x42a7dc: add             x1, NULL, #0x30  ; false
    // 0x42a7e0: StoreField: r0->field_5f = r1
    //     0x42a7e0: stur            w1, [x0, #0x5f]
    // 0x42a7e4: StoreField: r0->field_73 = r1
    //     0x42a7e4: stur            w1, [x0, #0x73]
    // 0x42a7e8: ldur            x1, [fp, #-0x10]
    // 0x42a7ec: StoreField: r0->field_77 = r1
    //     0x42a7ec: stur            w1, [x0, #0x77]
    // 0x42a7f0: r1 = true
    //     0x42a7f0: add             x1, NULL, #0x20  ; true
    // 0x42a7f4: StoreField: r0->field_97 = r1
    //     0x42a7f4: stur            w1, [x0, #0x97]
    // 0x42a7f8: r0 = MergeSemantics()
    //     0x42a7f8: bl              #0x42a564  ; AllocateMergeSemanticsStub -> MergeSemantics (size=0x10)
    // 0x42a7fc: ldur            x1, [fp, #-8]
    // 0x42a800: StoreField: r0->field_b = r1
    //     0x42a800: stur            w1, [x0, #0xb]
    // 0x42a804: LeaveFrame
    //     0x42a804: mov             SP, fp
    //     0x42a808: ldp             fp, lr, [SP], #0x10
    // 0x42a80c: ret
    //     0x42a80c: ret             
    // 0x42a810: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42a810: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42a814: b               #0x42a694
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42a818, size: 0x94
    // 0x42a818: EnterFrame
    //     0x42a818: stp             fp, lr, [SP, #-0x10]!
    //     0x42a81c: mov             fp, SP
    // 0x42a820: AllocStack(0x10)
    //     0x42a820: sub             SP, SP, #0x10
    // 0x42a824: CheckStackOverflow
    //     0x42a824: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42a828: cmp             SP, x16
    //     0x42a82c: b.ls            #0x42a8a4
    // 0x42a830: r0 = LoadStaticField(0xccc)
    //     0x42a830: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a834: ldr             x0, [x0, #0x1998]
    // 0x42a838: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a83c: cmp             w0, w16
    // 0x42a840: b.ne            #0x42a850
    // 0x42a844: r2 = stows
    //     0x42a844: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42a848: ldr             x2, [x2, #0x310]
    // 0x42a84c: r0 = InitLateFinalStaticField()
    //     0x42a84c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a850: LoadField: r2 = r0->field_13
    //     0x42a850: ldur            w2, [x0, #0x13]
    // 0x42a854: DecompressPointer r2
    //     0x42a854: add             x2, x2, HEAP, lsl #32
    // 0x42a858: mov             x1, x2
    // 0x42a85c: stur            x2, [fp, #-8]
    // 0x42a860: LoadField: r0 = r1->field_43
    //     0x42a860: ldur            w0, [x1, #0x43]
    // 0x42a864: DecompressPointer r0
    //     0x42a864: add             x0, x0, HEAP, lsl #32
    // 0x42a868: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a86c: cmp             w0, w16
    // 0x42a870: b.ne            #0x42a880
    // 0x42a874: r2 = _value
    //     0x42a874: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42a878: ldr             x2, [x2, #0x4b0]
    // 0x42a87c: r0 = InitLateInstanceField()
    //     0x42a87c: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42a880: eor             x3, x0, #0x10
    // 0x42a884: ldur            x1, [fp, #-8]
    // 0x42a888: mov             x2, x3
    // 0x42a88c: stur            x3, [fp, #-0x10]
    // 0x42a890: r0 = value=()
    //     0x42a890: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42a894: ldur            x0, [fp, #-0x10]
    // 0x42a898: LeaveFrame
    //     0x42a898: mov             SP, fp
    //     0x42a89c: ldp             fp, lr, [SP], #0x10
    // 0x42a8a0: ret
    //     0x42a8a0: ret             
    // 0x42a8a4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42a8a4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42a8a8: b               #0x42a830
  }
  [closure] void <anonymous closure>(dynamic, bool) {
    // ** addr: 0x42a8ac, size: 0x5c
    // 0x42a8ac: EnterFrame
    //     0x42a8ac: stp             fp, lr, [SP, #-0x10]!
    //     0x42a8b0: mov             fp, SP
    // 0x42a8b4: CheckStackOverflow
    //     0x42a8b4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42a8b8: cmp             SP, x16
    //     0x42a8bc: b.ls            #0x42a900
    // 0x42a8c0: r0 = LoadStaticField(0xccc)
    //     0x42a8c0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a8c4: ldr             x0, [x0, #0x1998]
    // 0x42a8c8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a8cc: cmp             w0, w16
    // 0x42a8d0: b.ne            #0x42a8e0
    // 0x42a8d4: r2 = stows
    //     0x42a8d4: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42a8d8: ldr             x2, [x2, #0x310]
    // 0x42a8dc: r0 = InitLateFinalStaticField()
    //     0x42a8dc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a8e0: LoadField: r1 = r0->field_13
    //     0x42a8e0: ldur            w1, [x0, #0x13]
    // 0x42a8e4: DecompressPointer r1
    //     0x42a8e4: add             x1, x1, HEAP, lsl #32
    // 0x42a8e8: ldr             x2, [fp, #0x10]
    // 0x42a8ec: r0 = value=()
    //     0x42a8ec: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42a8f0: r0 = Null
    //     0x42a8f0: mov             x0, NULL
    // 0x42a8f4: LeaveFrame
    //     0x42a8f4: mov             SP, fp
    //     0x42a8f8: ldp             fp, lr, [SP], #0x10
    // 0x42a8fc: ret
    //     0x42a8fc: ret             
    // 0x42a900: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42a900: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42a904: b               #0x42a8c0
  }
  [closure] MergeSemantics <anonymous closure>(dynamic, BuildContext, bool, Widget?) {
    // ** addr: 0x42a954, size: 0x1ac
    // 0x42a954: EnterFrame
    //     0x42a954: stp             fp, lr, [SP, #-0x10]!
    //     0x42a958: mov             fp, SP
    // 0x42a95c: AllocStack(0x20)
    //     0x42a95c: sub             SP, SP, #0x20
    // 0x42a960: SetupParameters([dynamic _ /* r0 */])
    //     0x42a960: ldr             x0, [fp, #0x28]
    //     0x42a964: ldur            w1, [x0, #0x17]
    //     0x42a968: add             x1, x1, HEAP, lsl #32
    //     0x42a96c: stur            x1, [fp, #-8]
    // 0x42a970: CheckStackOverflow
    //     0x42a970: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42a974: cmp             SP, x16
    //     0x42a978: b.ls            #0x42aaf8
    // 0x42a97c: r0 = LoadStaticField(0xc74)
    //     0x42a97c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a980: ldr             x0, [x0, #0x18e8]
    // 0x42a984: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a988: cmp             w0, w16
    // 0x42a98c: b.ne            #0x42a99c
    // 0x42a990: r2 = NesIcons
    //     0x42a990: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x42a994: ldr             x2, [x2, #0xf70]
    // 0x42a998: r0 = InitLateFinalStaticField()
    //     0x42a998: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42a99c: mov             x1, x0
    // 0x42a9a0: LoadField: r0 = r1->field_23
    //     0x42a9a0: ldur            w0, [x1, #0x23]
    // 0x42a9a4: DecompressPointer r0
    //     0x42a9a4: add             x0, x0, HEAP, lsl #32
    // 0x42a9a8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a9ac: cmp             w0, w16
    // 0x42a9b0: b.ne            #0x42a9c0
    // 0x42a9b4: r2 = openEye
    //     0x42a9b4: add             x2, PP, #0x12, lsl #12  ; [pp+0x12258] Field <NesIconCollection.openEye>: late final (offset: 0x24)
    //     0x42a9b8: ldr             x2, [x2, #0x258]
    // 0x42a9bc: r0 = InitLateFinalInstanceField()
    //     0x42a9bc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42a9c0: stur            x0, [fp, #-0x10]
    // 0x42a9c4: r0 = NesIcon()
    //     0x42a9c4: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x42a9c8: mov             x1, x0
    // 0x42a9cc: ldur            x0, [fp, #-0x10]
    // 0x42a9d0: stur            x1, [fp, #-0x18]
    // 0x42a9d4: StoreField: r1->field_b = r0
    //     0x42a9d4: stur            w0, [x1, #0xb]
    // 0x42a9d8: ldur            x0, [fp, #-8]
    // 0x42a9dc: LoadField: r2 = r0->field_13
    //     0x42a9dc: ldur            w2, [x0, #0x13]
    // 0x42a9e0: DecompressPointer r2
    //     0x42a9e0: add             x2, x2, HEAP, lsl #32
    // 0x42a9e4: stur            x2, [fp, #-0x10]
    // 0x42a9e8: r0 = LoadStaticField(0xccc)
    //     0x42a9e8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42a9ec: ldr             x0, [x0, #0x1998]
    // 0x42a9f0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42a9f4: cmp             w0, w16
    // 0x42a9f8: b.ne            #0x42aa08
    // 0x42a9fc: r2 = stows
    //     0x42a9fc: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42aa00: ldr             x2, [x2, #0x310]
    // 0x42aa04: r0 = InitLateFinalStaticField()
    //     0x42aa04: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42aa08: LoadField: r1 = r0->field_f
    //     0x42aa08: ldur            w1, [x0, #0xf]
    // 0x42aa0c: DecompressPointer r1
    //     0x42aa0c: add             x1, x1, HEAP, lsl #32
    // 0x42aa10: LoadField: r0 = r1->field_43
    //     0x42aa10: ldur            w0, [x1, #0x43]
    // 0x42aa14: DecompressPointer r0
    //     0x42aa14: add             x0, x0, HEAP, lsl #32
    // 0x42aa18: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42aa1c: cmp             w0, w16
    // 0x42aa20: b.ne            #0x42aa30
    // 0x42aa24: r2 = _value
    //     0x42aa24: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42aa28: ldr             x2, [x2, #0x4b0]
    // 0x42aa2c: r0 = InitLateInstanceField()
    //     0x42aa2c: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42aa30: stur            x0, [fp, #-8]
    // 0x42aa34: r0 = NesCheckBox()
    //     0x42aa34: bl              #0x42a570  ; AllocateNesCheckBoxStub -> NesCheckBox (size=0x14)
    // 0x42aa38: mov             x3, x0
    // 0x42aa3c: ldur            x0, [fp, #-8]
    // 0x42aa40: stur            x3, [fp, #-0x20]
    // 0x42aa44: StoreField: r3->field_b = r0
    //     0x42aa44: stur            w0, [x3, #0xb]
    // 0x42aa48: r1 = Function '<anonymous closure>':.
    //     0x42aa48: add             x1, PP, #0x12, lsl #12  ; [pp+0x12260] AnonymousClosure: (0x42ab94), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42aa4c: ldr             x1, [x1, #0x260]
    // 0x42aa50: r2 = Null
    //     0x42aa50: mov             x2, NULL
    // 0x42aa54: r0 = AllocateClosure()
    //     0x42aa54: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42aa58: mov             x1, x0
    // 0x42aa5c: ldur            x0, [fp, #-0x20]
    // 0x42aa60: StoreField: r0->field_f = r1
    //     0x42aa60: stur            w1, [x0, #0xf]
    // 0x42aa64: r0 = ListTile()
    //     0x42aa64: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x42aa68: mov             x3, x0
    // 0x42aa6c: ldur            x0, [fp, #-0x18]
    // 0x42aa70: stur            x3, [fp, #-8]
    // 0x42aa74: StoreField: r3->field_b = r0
    //     0x42aa74: stur            w0, [x3, #0xb]
    // 0x42aa78: ldr             x0, [fp, #0x10]
    // 0x42aa7c: StoreField: r3->field_f = r0
    //     0x42aa7c: stur            w0, [x3, #0xf]
    // 0x42aa80: ldur            x0, [fp, #-0x20]
    // 0x42aa84: ArrayStore: r3[0] = r0  ; List_4
    //     0x42aa84: stur            w0, [x3, #0x17]
    // 0x42aa88: r0 = Instance_RoundedRectangleBorder
    //     0x42aa88: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x42aa8c: ldr             x0, [x0, #0xfc0]
    // 0x42aa90: StoreField: r3->field_27 = r0
    //     0x42aa90: stur            w0, [x3, #0x27]
    // 0x42aa94: r0 = Instance_EdgeInsets
    //     0x42aa94: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x42aa98: ldr             x0, [x0, #0xd48]
    // 0x42aa9c: StoreField: r3->field_47 = r0
    //     0x42aa9c: stur            w0, [x3, #0x47]
    // 0x42aaa0: r0 = true
    //     0x42aaa0: add             x0, NULL, #0x20  ; true
    // 0x42aaa4: StoreField: r3->field_4b = r0
    //     0x42aaa4: stur            w0, [x3, #0x4b]
    // 0x42aaa8: r1 = Function '<anonymous closure>':.
    //     0x42aaa8: add             x1, PP, #0x12, lsl #12  ; [pp+0x12268] AnonymousClosure: (0x42ab00), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42aaac: ldr             x1, [x1, #0x268]
    // 0x42aab0: r2 = Null
    //     0x42aab0: mov             x2, NULL
    // 0x42aab4: r0 = AllocateClosure()
    //     0x42aab4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42aab8: mov             x1, x0
    // 0x42aabc: ldur            x0, [fp, #-8]
    // 0x42aac0: StoreField: r0->field_4f = r1
    //     0x42aac0: stur            w1, [x0, #0x4f]
    // 0x42aac4: r1 = false
    //     0x42aac4: add             x1, NULL, #0x30  ; false
    // 0x42aac8: StoreField: r0->field_5f = r1
    //     0x42aac8: stur            w1, [x0, #0x5f]
    // 0x42aacc: StoreField: r0->field_73 = r1
    //     0x42aacc: stur            w1, [x0, #0x73]
    // 0x42aad0: ldur            x1, [fp, #-0x10]
    // 0x42aad4: StoreField: r0->field_77 = r1
    //     0x42aad4: stur            w1, [x0, #0x77]
    // 0x42aad8: r1 = true
    //     0x42aad8: add             x1, NULL, #0x20  ; true
    // 0x42aadc: StoreField: r0->field_97 = r1
    //     0x42aadc: stur            w1, [x0, #0x97]
    // 0x42aae0: r0 = MergeSemantics()
    //     0x42aae0: bl              #0x42a564  ; AllocateMergeSemanticsStub -> MergeSemantics (size=0x10)
    // 0x42aae4: ldur            x1, [fp, #-8]
    // 0x42aae8: StoreField: r0->field_b = r1
    //     0x42aae8: stur            w1, [x0, #0xb]
    // 0x42aaec: LeaveFrame
    //     0x42aaec: mov             SP, fp
    //     0x42aaf0: ldp             fp, lr, [SP], #0x10
    // 0x42aaf4: ret
    //     0x42aaf4: ret             
    // 0x42aaf8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42aaf8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42aafc: b               #0x42a97c
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42ab00, size: 0x94
    // 0x42ab00: EnterFrame
    //     0x42ab00: stp             fp, lr, [SP, #-0x10]!
    //     0x42ab04: mov             fp, SP
    // 0x42ab08: AllocStack(0x10)
    //     0x42ab08: sub             SP, SP, #0x10
    // 0x42ab0c: CheckStackOverflow
    //     0x42ab0c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ab10: cmp             SP, x16
    //     0x42ab14: b.ls            #0x42ab8c
    // 0x42ab18: r0 = LoadStaticField(0xccc)
    //     0x42ab18: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42ab1c: ldr             x0, [x0, #0x1998]
    // 0x42ab20: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ab24: cmp             w0, w16
    // 0x42ab28: b.ne            #0x42ab38
    // 0x42ab2c: r2 = stows
    //     0x42ab2c: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42ab30: ldr             x2, [x2, #0x310]
    // 0x42ab34: r0 = InitLateFinalStaticField()
    //     0x42ab34: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42ab38: LoadField: r2 = r0->field_f
    //     0x42ab38: ldur            w2, [x0, #0xf]
    // 0x42ab3c: DecompressPointer r2
    //     0x42ab3c: add             x2, x2, HEAP, lsl #32
    // 0x42ab40: mov             x1, x2
    // 0x42ab44: stur            x2, [fp, #-8]
    // 0x42ab48: LoadField: r0 = r1->field_43
    //     0x42ab48: ldur            w0, [x1, #0x43]
    // 0x42ab4c: DecompressPointer r0
    //     0x42ab4c: add             x0, x0, HEAP, lsl #32
    // 0x42ab50: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ab54: cmp             w0, w16
    // 0x42ab58: b.ne            #0x42ab68
    // 0x42ab5c: r2 = _value
    //     0x42ab5c: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42ab60: ldr             x2, [x2, #0x4b0]
    // 0x42ab64: r0 = InitLateInstanceField()
    //     0x42ab64: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42ab68: eor             x3, x0, #0x10
    // 0x42ab6c: ldur            x1, [fp, #-8]
    // 0x42ab70: mov             x2, x3
    // 0x42ab74: stur            x3, [fp, #-0x10]
    // 0x42ab78: r0 = value=()
    //     0x42ab78: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42ab7c: ldur            x0, [fp, #-0x10]
    // 0x42ab80: LeaveFrame
    //     0x42ab80: mov             SP, fp
    //     0x42ab84: ldp             fp, lr, [SP], #0x10
    // 0x42ab88: ret
    //     0x42ab88: ret             
    // 0x42ab8c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42ab8c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42ab90: b               #0x42ab18
  }
  [closure] void <anonymous closure>(dynamic, bool) {
    // ** addr: 0x42ab94, size: 0x5c
    // 0x42ab94: EnterFrame
    //     0x42ab94: stp             fp, lr, [SP, #-0x10]!
    //     0x42ab98: mov             fp, SP
    // 0x42ab9c: CheckStackOverflow
    //     0x42ab9c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42aba0: cmp             SP, x16
    //     0x42aba4: b.ls            #0x42abe8
    // 0x42aba8: r0 = LoadStaticField(0xccc)
    //     0x42aba8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42abac: ldr             x0, [x0, #0x1998]
    // 0x42abb0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42abb4: cmp             w0, w16
    // 0x42abb8: b.ne            #0x42abc8
    // 0x42abbc: r2 = stows
    //     0x42abbc: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42abc0: ldr             x2, [x2, #0x310]
    // 0x42abc4: r0 = InitLateFinalStaticField()
    //     0x42abc4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42abc8: LoadField: r1 = r0->field_f
    //     0x42abc8: ldur            w1, [x0, #0xf]
    // 0x42abcc: DecompressPointer r1
    //     0x42abcc: add             x1, x1, HEAP, lsl #32
    // 0x42abd0: ldr             x2, [fp, #0x10]
    // 0x42abd4: r0 = value=()
    //     0x42abd4: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42abd8: r0 = Null
    //     0x42abd8: mov             x0, NULL
    // 0x42abdc: LeaveFrame
    //     0x42abdc: mov             SP, fp
    //     0x42abe0: ldp             fp, lr, [SP], #0x10
    // 0x42abe4: ret
    //     0x42abe4: ret             
    // 0x42abe8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42abe8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42abec: b               #0x42aba8
  }
  [closure] MergeSemantics <anonymous closure>(dynamic, BuildContext, bool, Widget?) {
    // ** addr: 0x42ac3c, size: 0x22c
    // 0x42ac3c: EnterFrame
    //     0x42ac3c: stp             fp, lr, [SP, #-0x10]!
    //     0x42ac40: mov             fp, SP
    // 0x42ac44: AllocStack(0x30)
    //     0x42ac44: sub             SP, SP, #0x30
    // 0x42ac48: SetupParameters([dynamic _ /* r0 */])
    //     0x42ac48: ldr             x0, [fp, #0x28]
    //     0x42ac4c: ldur            w1, [x0, #0x17]
    //     0x42ac50: add             x1, x1, HEAP, lsl #32
    //     0x42ac54: stur            x1, [fp, #-8]
    // 0x42ac58: CheckStackOverflow
    //     0x42ac58: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ac5c: cmp             SP, x16
    //     0x42ac60: b.ls            #0x42ae60
    // 0x42ac64: r0 = LoadStaticField(0xccc)
    //     0x42ac64: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42ac68: ldr             x0, [x0, #0x1998]
    // 0x42ac6c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ac70: cmp             w0, w16
    // 0x42ac74: b.ne            #0x42ac84
    // 0x42ac78: r2 = stows
    //     0x42ac78: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42ac7c: ldr             x2, [x2, #0x310]
    // 0x42ac80: r0 = InitLateFinalStaticField()
    //     0x42ac80: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42ac84: stur            x0, [fp, #-0x10]
    // 0x42ac88: LoadField: r1 = r0->field_37
    //     0x42ac88: ldur            w1, [x0, #0x37]
    // 0x42ac8c: DecompressPointer r1
    //     0x42ac8c: add             x1, x1, HEAP, lsl #32
    // 0x42ac90: LoadField: r0 = r1->field_43
    //     0x42ac90: ldur            w0, [x1, #0x43]
    // 0x42ac94: DecompressPointer r0
    //     0x42ac94: add             x0, x0, HEAP, lsl #32
    // 0x42ac98: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ac9c: cmp             w0, w16
    // 0x42aca0: b.ne            #0x42acb0
    // 0x42aca4: r2 = _value
    //     0x42aca4: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42aca8: ldr             x2, [x2, #0x4b0]
    // 0x42acac: r0 = InitLateInstanceField()
    //     0x42acac: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42acb0: r1 = LoadInt32Instr(r0)
    //     0x42acb0: sbfx            x1, x0, #1, #0x1f
    //     0x42acb4: tbz             w0, #0, #0x42acbc
    //     0x42acb8: ldur            x1, [x0, #7]
    // 0x42acbc: tbz             x1, #0x3f, #0x42acc8
    // 0x42acc0: r5 = 60
    //     0x42acc0: mov             x5, #0x3c
    // 0x42acc4: b               #0x42accc
    // 0x42acc8: mov             x5, x1
    // 0x42accc: ldr             x4, [fp, #0x10]
    // 0x42acd0: ldur            x3, [fp, #-8]
    // 0x42acd4: ldur            x2, [fp, #-0x10]
    // 0x42acd8: r0 = BoxInt64Instr(r5)
    //     0x42acd8: sbfiz           x0, x5, #1, #0x1f
    //     0x42acdc: cmp             x5, x0, asr #1
    //     0x42ace0: b.eq            #0x42acec
    //     0x42ace4: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x42ace8: stur            x5, [x0, #7]
    // 0x42acec: r1 = 60
    //     0x42acec: mov             x1, #0x3c
    // 0x42acf0: branchIfSmi(r0, 0x42acfc)
    //     0x42acf0: tbz             w0, #0, #0x42acfc
    // 0x42acf4: r1 = LoadClassIdInstr(r0)
    //     0x42acf4: ldur            x1, [x0, #-1]
    //     0x42acf8: ubfx            x1, x1, #0xc, #0x14
    // 0x42acfc: str             x0, [SP]
    // 0x42ad00: mov             x0, x1
    // 0x42ad04: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x42ad04: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x42ad08: r0 = GDT[cid_x0 + 0x2f3d]()
    //     0x42ad08: mov             x17, #0x2f3d
    //     0x42ad0c: add             lr, x0, x17
    //     0x42ad10: ldr             lr, [x21, lr, lsl #3]
    //     0x42ad14: blr             lr
    // 0x42ad18: stur            x0, [fp, #-0x18]
    // 0x42ad1c: r0 = Text()
    //     0x42ad1c: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42ad20: mov             x1, x0
    // 0x42ad24: ldur            x0, [fp, #-0x18]
    // 0x42ad28: stur            x1, [fp, #-0x20]
    // 0x42ad2c: StoreField: r1->field_b = r0
    //     0x42ad2c: stur            w0, [x1, #0xb]
    // 0x42ad30: r0 = Instance_TextStyle
    //     0x42ad30: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ef0] Obj!TextStyle@5d5831
    //     0x42ad34: ldr             x0, [x0, #0xef0]
    // 0x42ad38: StoreField: r1->field_13 = r0
    //     0x42ad38: stur            w0, [x1, #0x13]
    // 0x42ad3c: r0 = BlockSemantics()
    //     0x42ad3c: bl              #0x388be0  ; AllocateBlockSemanticsStub -> BlockSemantics (size=0x14)
    // 0x42ad40: mov             x2, x0
    // 0x42ad44: r0 = true
    //     0x42ad44: add             x0, NULL, #0x20  ; true
    // 0x42ad48: stur            x2, [fp, #-0x28]
    // 0x42ad4c: StoreField: r2->field_f = r0
    //     0x42ad4c: stur            w0, [x2, #0xf]
    // 0x42ad50: ldur            x1, [fp, #-0x20]
    // 0x42ad54: StoreField: r2->field_b = r1
    //     0x42ad54: stur            w1, [x2, #0xb]
    // 0x42ad58: ldur            x1, [fp, #-8]
    // 0x42ad5c: LoadField: r3 = r1->field_13
    //     0x42ad5c: ldur            w3, [x1, #0x13]
    // 0x42ad60: DecompressPointer r3
    //     0x42ad60: add             x3, x3, HEAP, lsl #32
    // 0x42ad64: ldur            x1, [fp, #-0x10]
    // 0x42ad68: stur            x3, [fp, #-0x18]
    // 0x42ad6c: LoadField: r4 = r1->field_3b
    //     0x42ad6c: ldur            w4, [x1, #0x3b]
    // 0x42ad70: DecompressPointer r4
    //     0x42ad70: add             x4, x4, HEAP, lsl #32
    // 0x42ad74: mov             x1, x4
    // 0x42ad78: LoadField: r0 = r1->field_43
    //     0x42ad78: ldur            w0, [x1, #0x43]
    // 0x42ad7c: DecompressPointer r0
    //     0x42ad7c: add             x0, x0, HEAP, lsl #32
    // 0x42ad80: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ad84: cmp             w0, w16
    // 0x42ad88: b.ne            #0x42ad98
    // 0x42ad8c: r2 = _value
    //     0x42ad8c: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42ad90: ldr             x2, [x2, #0x4b0]
    // 0x42ad94: r0 = InitLateInstanceField()
    //     0x42ad94: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42ad98: stur            x0, [fp, #-8]
    // 0x42ad9c: r0 = NesCheckBox()
    //     0x42ad9c: bl              #0x42a570  ; AllocateNesCheckBoxStub -> NesCheckBox (size=0x14)
    // 0x42ada0: mov             x3, x0
    // 0x42ada4: ldur            x0, [fp, #-8]
    // 0x42ada8: stur            x3, [fp, #-0x10]
    // 0x42adac: StoreField: r3->field_b = r0
    //     0x42adac: stur            w0, [x3, #0xb]
    // 0x42adb0: r1 = Function '<anonymous closure>':.
    //     0x42adb0: add             x1, PP, #0x12, lsl #12  ; [pp+0x12278] AnonymousClosure: (0x42aefc), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42adb4: ldr             x1, [x1, #0x278]
    // 0x42adb8: r2 = Null
    //     0x42adb8: mov             x2, NULL
    // 0x42adbc: r0 = AllocateClosure()
    //     0x42adbc: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42adc0: mov             x1, x0
    // 0x42adc4: ldur            x0, [fp, #-0x10]
    // 0x42adc8: StoreField: r0->field_f = r1
    //     0x42adc8: stur            w1, [x0, #0xf]
    // 0x42adcc: r0 = ListTile()
    //     0x42adcc: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x42add0: mov             x3, x0
    // 0x42add4: ldur            x0, [fp, #-0x28]
    // 0x42add8: stur            x3, [fp, #-8]
    // 0x42addc: StoreField: r3->field_b = r0
    //     0x42addc: stur            w0, [x3, #0xb]
    // 0x42ade0: ldr             x0, [fp, #0x10]
    // 0x42ade4: StoreField: r3->field_f = r0
    //     0x42ade4: stur            w0, [x3, #0xf]
    // 0x42ade8: ldur            x0, [fp, #-0x10]
    // 0x42adec: ArrayStore: r3[0] = r0  ; List_4
    //     0x42adec: stur            w0, [x3, #0x17]
    // 0x42adf0: r0 = Instance_RoundedRectangleBorder
    //     0x42adf0: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x42adf4: ldr             x0, [x0, #0xfc0]
    // 0x42adf8: StoreField: r3->field_27 = r0
    //     0x42adf8: stur            w0, [x3, #0x27]
    // 0x42adfc: r0 = Instance_EdgeInsets
    //     0x42adfc: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x42ae00: ldr             x0, [x0, #0xd48]
    // 0x42ae04: StoreField: r3->field_47 = r0
    //     0x42ae04: stur            w0, [x3, #0x47]
    // 0x42ae08: r0 = true
    //     0x42ae08: add             x0, NULL, #0x20  ; true
    // 0x42ae0c: StoreField: r3->field_4b = r0
    //     0x42ae0c: stur            w0, [x3, #0x4b]
    // 0x42ae10: r1 = Function '<anonymous closure>':.
    //     0x42ae10: add             x1, PP, #0x12, lsl #12  ; [pp+0x12280] AnonymousClosure: (0x42ae68), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42ae14: ldr             x1, [x1, #0x280]
    // 0x42ae18: r2 = Null
    //     0x42ae18: mov             x2, NULL
    // 0x42ae1c: r0 = AllocateClosure()
    //     0x42ae1c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42ae20: mov             x1, x0
    // 0x42ae24: ldur            x0, [fp, #-8]
    // 0x42ae28: StoreField: r0->field_4f = r1
    //     0x42ae28: stur            w1, [x0, #0x4f]
    // 0x42ae2c: r1 = false
    //     0x42ae2c: add             x1, NULL, #0x30  ; false
    // 0x42ae30: StoreField: r0->field_5f = r1
    //     0x42ae30: stur            w1, [x0, #0x5f]
    // 0x42ae34: StoreField: r0->field_73 = r1
    //     0x42ae34: stur            w1, [x0, #0x73]
    // 0x42ae38: ldur            x1, [fp, #-0x18]
    // 0x42ae3c: StoreField: r0->field_77 = r1
    //     0x42ae3c: stur            w1, [x0, #0x77]
    // 0x42ae40: r1 = true
    //     0x42ae40: add             x1, NULL, #0x20  ; true
    // 0x42ae44: StoreField: r0->field_97 = r1
    //     0x42ae44: stur            w1, [x0, #0x97]
    // 0x42ae48: r0 = MergeSemantics()
    //     0x42ae48: bl              #0x42a564  ; AllocateMergeSemanticsStub -> MergeSemantics (size=0x10)
    // 0x42ae4c: ldur            x1, [fp, #-8]
    // 0x42ae50: StoreField: r0->field_b = r1
    //     0x42ae50: stur            w1, [x0, #0xb]
    // 0x42ae54: LeaveFrame
    //     0x42ae54: mov             SP, fp
    //     0x42ae58: ldp             fp, lr, [SP], #0x10
    // 0x42ae5c: ret
    //     0x42ae5c: ret             
    // 0x42ae60: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42ae60: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42ae64: b               #0x42ac64
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42ae68, size: 0x94
    // 0x42ae68: EnterFrame
    //     0x42ae68: stp             fp, lr, [SP, #-0x10]!
    //     0x42ae6c: mov             fp, SP
    // 0x42ae70: AllocStack(0x10)
    //     0x42ae70: sub             SP, SP, #0x10
    // 0x42ae74: CheckStackOverflow
    //     0x42ae74: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ae78: cmp             SP, x16
    //     0x42ae7c: b.ls            #0x42aef4
    // 0x42ae80: r0 = LoadStaticField(0xccc)
    //     0x42ae80: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42ae84: ldr             x0, [x0, #0x1998]
    // 0x42ae88: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ae8c: cmp             w0, w16
    // 0x42ae90: b.ne            #0x42aea0
    // 0x42ae94: r2 = stows
    //     0x42ae94: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42ae98: ldr             x2, [x2, #0x310]
    // 0x42ae9c: r0 = InitLateFinalStaticField()
    //     0x42ae9c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42aea0: LoadField: r2 = r0->field_3b
    //     0x42aea0: ldur            w2, [x0, #0x3b]
    // 0x42aea4: DecompressPointer r2
    //     0x42aea4: add             x2, x2, HEAP, lsl #32
    // 0x42aea8: mov             x1, x2
    // 0x42aeac: stur            x2, [fp, #-8]
    // 0x42aeb0: LoadField: r0 = r1->field_43
    //     0x42aeb0: ldur            w0, [x1, #0x43]
    // 0x42aeb4: DecompressPointer r0
    //     0x42aeb4: add             x0, x0, HEAP, lsl #32
    // 0x42aeb8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42aebc: cmp             w0, w16
    // 0x42aec0: b.ne            #0x42aed0
    // 0x42aec4: r2 = _value
    //     0x42aec4: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42aec8: ldr             x2, [x2, #0x4b0]
    // 0x42aecc: r0 = InitLateInstanceField()
    //     0x42aecc: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42aed0: eor             x3, x0, #0x10
    // 0x42aed4: ldur            x1, [fp, #-8]
    // 0x42aed8: mov             x2, x3
    // 0x42aedc: stur            x3, [fp, #-0x10]
    // 0x42aee0: r0 = value=()
    //     0x42aee0: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42aee4: ldur            x0, [fp, #-0x10]
    // 0x42aee8: LeaveFrame
    //     0x42aee8: mov             SP, fp
    //     0x42aeec: ldp             fp, lr, [SP], #0x10
    // 0x42aef0: ret
    //     0x42aef0: ret             
    // 0x42aef4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42aef4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42aef8: b               #0x42ae80
  }
  [closure] void <anonymous closure>(dynamic, bool) {
    // ** addr: 0x42aefc, size: 0x5c
    // 0x42aefc: EnterFrame
    //     0x42aefc: stp             fp, lr, [SP, #-0x10]!
    //     0x42af00: mov             fp, SP
    // 0x42af04: CheckStackOverflow
    //     0x42af04: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42af08: cmp             SP, x16
    //     0x42af0c: b.ls            #0x42af50
    // 0x42af10: r0 = LoadStaticField(0xccc)
    //     0x42af10: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42af14: ldr             x0, [x0, #0x1998]
    // 0x42af18: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42af1c: cmp             w0, w16
    // 0x42af20: b.ne            #0x42af30
    // 0x42af24: r2 = stows
    //     0x42af24: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42af28: ldr             x2, [x2, #0x310]
    // 0x42af2c: r0 = InitLateFinalStaticField()
    //     0x42af2c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42af30: LoadField: r1 = r0->field_3b
    //     0x42af30: ldur            w1, [x0, #0x3b]
    // 0x42af34: DecompressPointer r1
    //     0x42af34: add             x1, x1, HEAP, lsl #32
    // 0x42af38: ldr             x2, [fp, #0x10]
    // 0x42af3c: r0 = value=()
    //     0x42af3c: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42af40: r0 = Null
    //     0x42af40: mov             x0, NULL
    // 0x42af44: LeaveFrame
    //     0x42af44: mov             SP, fp
    //     0x42af48: ldp             fp, lr, [SP], #0x10
    // 0x42af4c: ret
    //     0x42af4c: ret             
    // 0x42af50: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42af50: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42af54: b               #0x42af10
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42af58, size: 0xcc
    // 0x42af58: EnterFrame
    //     0x42af58: stp             fp, lr, [SP, #-0x10]!
    //     0x42af5c: mov             fp, SP
    // 0x42af60: AllocStack(0x8)
    //     0x42af60: sub             SP, SP, #8
    // 0x42af64: CheckStackOverflow
    //     0x42af64: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42af68: cmp             SP, x16
    //     0x42af6c: b.ls            #0x42b01c
    // 0x42af70: r0 = LoadStaticField(0xccc)
    //     0x42af70: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42af74: ldr             x0, [x0, #0x1998]
    // 0x42af78: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42af7c: cmp             w0, w16
    // 0x42af80: b.ne            #0x42af90
    // 0x42af84: r2 = stows
    //     0x42af84: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42af88: ldr             x2, [x2, #0x310]
    // 0x42af8c: r0 = InitLateFinalStaticField()
    //     0x42af8c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42af90: LoadField: r2 = r0->field_37
    //     0x42af90: ldur            w2, [x0, #0x37]
    // 0x42af94: DecompressPointer r2
    //     0x42af94: add             x2, x2, HEAP, lsl #32
    // 0x42af98: mov             x1, x2
    // 0x42af9c: stur            x2, [fp, #-8]
    // 0x42afa0: LoadField: r0 = r1->field_43
    //     0x42afa0: ldur            w0, [x1, #0x43]
    // 0x42afa4: DecompressPointer r0
    //     0x42afa4: add             x0, x0, HEAP, lsl #32
    // 0x42afa8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42afac: cmp             w0, w16
    // 0x42afb0: b.ne            #0x42afc0
    // 0x42afb4: r2 = _value
    //     0x42afb4: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42afb8: ldr             x2, [x2, #0x4b0]
    // 0x42afbc: r0 = InitLateInstanceField()
    //     0x42afbc: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42afc0: r1 = LoadInt32Instr(r0)
    //     0x42afc0: sbfx            x1, x0, #1, #0x1f
    //     0x42afc4: tbz             w0, #0, #0x42afcc
    //     0x42afc8: ldur            x1, [x0, #7]
    // 0x42afcc: cmn             x1, #1
    // 0x42afd0: b.ne            #0x42afdc
    // 0x42afd4: r0 = 60
    //     0x42afd4: mov             x0, #0x3c
    // 0x42afd8: b               #0x42b000
    // 0x42afdc: cmp             x1, #0x3c
    // 0x42afe0: b.ne            #0x42afec
    // 0x42afe4: r0 = 30
    //     0x42afe4: mov             x0, #0x1e
    // 0x42afe8: b               #0x42b000
    // 0x42afec: cmp             x1, #0x1e
    // 0x42aff0: b.ne            #0x42affc
    // 0x42aff4: r0 = -1
    //     0x42aff4: mov             x0, #-1
    // 0x42aff8: b               #0x42b000
    // 0x42affc: r0 = 60
    //     0x42affc: mov             x0, #0x3c
    // 0x42b000: lsl             x2, x0, #1
    // 0x42b004: ldur            x1, [fp, #-8]
    // 0x42b008: r0 = value=()
    //     0x42b008: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42b00c: r0 = Null
    //     0x42b00c: mov             x0, NULL
    // 0x42b010: LeaveFrame
    //     0x42b010: mov             SP, fp
    //     0x42b014: ldp             fp, lr, [SP], #0x10
    // 0x42b018: ret
    //     0x42b018: ret             
    // 0x42b01c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b01c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b020: b               #0x42af70
  }
  [closure] StatelessWidget <anonymous closure>(dynamic, BuildContext, int, Widget?) {
    // ** addr: 0x42b024, size: 0xe8
    // 0x42b024: EnterFrame
    //     0x42b024: stp             fp, lr, [SP, #-0x10]!
    //     0x42b028: mov             fp, SP
    // 0x42b02c: AllocStack(0x10)
    //     0x42b02c: sub             SP, SP, #0x10
    // 0x42b030: CheckStackOverflow
    //     0x42b030: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b034: cmp             SP, x16
    //     0x42b038: b.ls            #0x42b104
    // 0x42b03c: ldr             x0, [fp, #0x18]
    // 0x42b040: cmn             w0, #2
    // 0x42b044: b.ne            #0x42b0b0
    // 0x42b048: r0 = LoadStaticField(0xc74)
    //     0x42b048: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b04c: ldr             x0, [x0, #0x18e8]
    // 0x42b050: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b054: cmp             w0, w16
    // 0x42b058: b.ne            #0x42b068
    // 0x42b05c: r2 = NesIcons
    //     0x42b05c: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x42b060: ldr             x2, [x2, #0xf70]
    // 0x42b064: r0 = InitLateFinalStaticField()
    //     0x42b064: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b068: mov             x1, x0
    // 0x42b06c: LoadField: r0 = r1->field_33
    //     0x42b06c: ldur            w0, [x1, #0x33]
    // 0x42b070: DecompressPointer r0
    //     0x42b070: add             x0, x0, HEAP, lsl #32
    // 0x42b074: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b078: cmp             w0, w16
    // 0x42b07c: b.ne            #0x42b08c
    // 0x42b080: r2 = infinite
    //     0x42b080: add             x2, PP, #0x12, lsl #12  ; [pp+0x12288] Field <NesIconCollection.infinite>: late final (offset: 0x34)
    //     0x42b084: ldr             x2, [x2, #0x288]
    // 0x42b088: r0 = InitLateFinalInstanceField()
    //     0x42b088: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42b08c: stur            x0, [fp, #-8]
    // 0x42b090: r0 = NesIcon()
    //     0x42b090: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x42b094: mov             x1, x0
    // 0x42b098: ldur            x0, [fp, #-8]
    // 0x42b09c: StoreField: r1->field_b = r0
    //     0x42b09c: stur            w0, [x1, #0xb]
    // 0x42b0a0: mov             x0, x1
    // 0x42b0a4: LeaveFrame
    //     0x42b0a4: mov             SP, fp
    //     0x42b0a8: ldp             fp, lr, [SP], #0x10
    // 0x42b0ac: ret
    //     0x42b0ac: ret             
    // 0x42b0b0: r1 = 60
    //     0x42b0b0: mov             x1, #0x3c
    // 0x42b0b4: branchIfSmi(r0, 0x42b0c0)
    //     0x42b0b4: tbz             w0, #0, #0x42b0c0
    // 0x42b0b8: r1 = LoadClassIdInstr(r0)
    //     0x42b0b8: ldur            x1, [x0, #-1]
    //     0x42b0bc: ubfx            x1, x1, #0xc, #0x14
    // 0x42b0c0: str             x0, [SP]
    // 0x42b0c4: mov             x0, x1
    // 0x42b0c8: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x42b0c8: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x42b0cc: r0 = GDT[cid_x0 + 0x2f3d]()
    //     0x42b0cc: mov             x17, #0x2f3d
    //     0x42b0d0: add             lr, x0, x17
    //     0x42b0d4: ldr             lr, [x21, lr, lsl #3]
    //     0x42b0d8: blr             lr
    // 0x42b0dc: stur            x0, [fp, #-8]
    // 0x42b0e0: r0 = Text()
    //     0x42b0e0: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42b0e4: ldur            x1, [fp, #-8]
    // 0x42b0e8: StoreField: r0->field_b = r1
    //     0x42b0e8: stur            w1, [x0, #0xb]
    // 0x42b0ec: r1 = Instance_TextStyle
    //     0x42b0ec: add             x1, PP, #0x11, lsl #12  ; [pp+0x11ef0] Obj!TextStyle@5d5831
    //     0x42b0f0: ldr             x1, [x1, #0xef0]
    // 0x42b0f4: StoreField: r0->field_13 = r1
    //     0x42b0f4: stur            w1, [x0, #0x13]
    // 0x42b0f8: LeaveFrame
    //     0x42b0f8: mov             SP, fp
    //     0x42b0fc: ldp             fp, lr, [SP], #0x10
    // 0x42b100: ret
    //     0x42b100: ret             
    // 0x42b104: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b104: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b108: b               #0x42b03c
  }
  [closure] MergeSemantics <anonymous closure>(dynamic, BuildContext, bool, Widget?) {
    // ** addr: 0x42b1a4, size: 0x1d8
    // 0x42b1a4: EnterFrame
    //     0x42b1a4: stp             fp, lr, [SP, #-0x10]!
    //     0x42b1a8: mov             fp, SP
    // 0x42b1ac: AllocStack(0x20)
    //     0x42b1ac: sub             SP, SP, #0x20
    // 0x42b1b0: SetupParameters([dynamic _ /* r0 */])
    //     0x42b1b0: ldr             x0, [fp, #0x28]
    //     0x42b1b4: ldur            w1, [x0, #0x17]
    //     0x42b1b8: add             x1, x1, HEAP, lsl #32
    //     0x42b1bc: stur            x1, [fp, #-8]
    // 0x42b1c0: CheckStackOverflow
    //     0x42b1c0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b1c4: cmp             SP, x16
    //     0x42b1c8: b.ls            #0x42b374
    // 0x42b1cc: r0 = LoadStaticField(0xccc)
    //     0x42b1cc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b1d0: ldr             x0, [x0, #0x1998]
    // 0x42b1d4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b1d8: cmp             w0, w16
    // 0x42b1dc: b.ne            #0x42b1ec
    // 0x42b1e0: r2 = stows
    //     0x42b1e0: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b1e4: ldr             x2, [x2, #0x310]
    // 0x42b1e8: r0 = InitLateFinalStaticField()
    //     0x42b1e8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b1ec: LoadField: r2 = r0->field_27
    //     0x42b1ec: ldur            w2, [x0, #0x27]
    // 0x42b1f0: DecompressPointer r2
    //     0x42b1f0: add             x2, x2, HEAP, lsl #32
    // 0x42b1f4: mov             x1, x2
    // 0x42b1f8: stur            x2, [fp, #-0x10]
    // 0x42b1fc: LoadField: r0 = r1->field_43
    //     0x42b1fc: ldur            w0, [x1, #0x43]
    // 0x42b200: DecompressPointer r0
    //     0x42b200: add             x0, x0, HEAP, lsl #32
    // 0x42b204: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b208: cmp             w0, w16
    // 0x42b20c: b.ne            #0x42b21c
    // 0x42b210: r2 = _value
    //     0x42b210: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42b214: ldr             x2, [x2, #0x4b0]
    // 0x42b218: r0 = InitLateInstanceField()
    //     0x42b218: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42b21c: tbnz            w0, #4, #0x42b248
    // 0x42b220: r0 = LoadStaticField(0xd04)
    //     0x42b220: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b224: ldr             x0, [x0, #0x1a08]
    // 0x42b228: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b22c: cmp             w0, w16
    // 0x42b230: b.ne            #0x42b240
    // 0x42b234: r2 = aimGuideWithReflection
    //     0x42b234: add             x2, PP, #0x12, lsl #12  ; [pp+0x122a0] Field <RicochlimeIcons.aimGuideWithReflection>: static late final (offset: 0xd04)
    //     0x42b238: ldr             x2, [x2, #0x2a0]
    // 0x42b23c: r0 = InitLateFinalStaticField()
    //     0x42b23c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b240: mov             x3, x0
    // 0x42b244: b               #0x42b26c
    // 0x42b248: r0 = LoadStaticField(0xd08)
    //     0x42b248: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b24c: ldr             x0, [x0, #0x1a10]
    // 0x42b250: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b254: cmp             w0, w16
    // 0x42b258: b.ne            #0x42b268
    // 0x42b25c: r2 = aimGuideWithoutReflection
    //     0x42b25c: add             x2, PP, #0x12, lsl #12  ; [pp+0x122a8] Field <RicochlimeIcons.aimGuideWithoutReflection>: static late final (offset: 0xd08)
    //     0x42b260: ldr             x2, [x2, #0x2a8]
    // 0x42b264: r0 = InitLateFinalStaticField()
    //     0x42b264: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b268: mov             x3, x0
    // 0x42b26c: ldr             x2, [fp, #0x10]
    // 0x42b270: ldur            x1, [fp, #-8]
    // 0x42b274: ldur            x0, [fp, #-0x10]
    // 0x42b278: stur            x3, [fp, #-0x18]
    // 0x42b27c: r0 = NesIcon()
    //     0x42b27c: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x42b280: mov             x1, x0
    // 0x42b284: ldur            x0, [fp, #-0x18]
    // 0x42b288: stur            x1, [fp, #-0x20]
    // 0x42b28c: StoreField: r1->field_b = r0
    //     0x42b28c: stur            w0, [x1, #0xb]
    // 0x42b290: ldur            x0, [fp, #-8]
    // 0x42b294: LoadField: r2 = r0->field_13
    //     0x42b294: ldur            w2, [x0, #0x13]
    // 0x42b298: DecompressPointer r2
    //     0x42b298: add             x2, x2, HEAP, lsl #32
    // 0x42b29c: ldur            x0, [fp, #-0x10]
    // 0x42b2a0: stur            x2, [fp, #-0x18]
    // 0x42b2a4: LoadField: r3 = r0->field_43
    //     0x42b2a4: ldur            w3, [x0, #0x43]
    // 0x42b2a8: DecompressPointer r3
    //     0x42b2a8: add             x3, x3, HEAP, lsl #32
    // 0x42b2ac: stur            x3, [fp, #-8]
    // 0x42b2b0: r0 = NesCheckBox()
    //     0x42b2b0: bl              #0x42a570  ; AllocateNesCheckBoxStub -> NesCheckBox (size=0x14)
    // 0x42b2b4: mov             x3, x0
    // 0x42b2b8: ldur            x0, [fp, #-8]
    // 0x42b2bc: stur            x3, [fp, #-0x10]
    // 0x42b2c0: StoreField: r3->field_b = r0
    //     0x42b2c0: stur            w0, [x3, #0xb]
    // 0x42b2c4: r1 = Function '<anonymous closure>':.
    //     0x42b2c4: add             x1, PP, #0x12, lsl #12  ; [pp+0x122b0] AnonymousClosure: (0x42b410), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42b2c8: ldr             x1, [x1, #0x2b0]
    // 0x42b2cc: r2 = Null
    //     0x42b2cc: mov             x2, NULL
    // 0x42b2d0: r0 = AllocateClosure()
    //     0x42b2d0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42b2d4: mov             x1, x0
    // 0x42b2d8: ldur            x0, [fp, #-0x10]
    // 0x42b2dc: StoreField: r0->field_f = r1
    //     0x42b2dc: stur            w1, [x0, #0xf]
    // 0x42b2e0: r0 = ListTile()
    //     0x42b2e0: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x42b2e4: mov             x3, x0
    // 0x42b2e8: ldur            x0, [fp, #-0x20]
    // 0x42b2ec: stur            x3, [fp, #-8]
    // 0x42b2f0: StoreField: r3->field_b = r0
    //     0x42b2f0: stur            w0, [x3, #0xb]
    // 0x42b2f4: ldr             x0, [fp, #0x10]
    // 0x42b2f8: StoreField: r3->field_f = r0
    //     0x42b2f8: stur            w0, [x3, #0xf]
    // 0x42b2fc: ldur            x0, [fp, #-0x10]
    // 0x42b300: ArrayStore: r3[0] = r0  ; List_4
    //     0x42b300: stur            w0, [x3, #0x17]
    // 0x42b304: r0 = Instance_RoundedRectangleBorder
    //     0x42b304: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x42b308: ldr             x0, [x0, #0xfc0]
    // 0x42b30c: StoreField: r3->field_27 = r0
    //     0x42b30c: stur            w0, [x3, #0x27]
    // 0x42b310: r0 = Instance_EdgeInsets
    //     0x42b310: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x42b314: ldr             x0, [x0, #0xd48]
    // 0x42b318: StoreField: r3->field_47 = r0
    //     0x42b318: stur            w0, [x3, #0x47]
    // 0x42b31c: r0 = true
    //     0x42b31c: add             x0, NULL, #0x20  ; true
    // 0x42b320: StoreField: r3->field_4b = r0
    //     0x42b320: stur            w0, [x3, #0x4b]
    // 0x42b324: r1 = Function '<anonymous closure>':.
    //     0x42b324: add             x1, PP, #0x12, lsl #12  ; [pp+0x122b8] AnonymousClosure: (0x42b37c), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42b328: ldr             x1, [x1, #0x2b8]
    // 0x42b32c: r2 = Null
    //     0x42b32c: mov             x2, NULL
    // 0x42b330: r0 = AllocateClosure()
    //     0x42b330: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42b334: mov             x1, x0
    // 0x42b338: ldur            x0, [fp, #-8]
    // 0x42b33c: StoreField: r0->field_4f = r1
    //     0x42b33c: stur            w1, [x0, #0x4f]
    // 0x42b340: r1 = false
    //     0x42b340: add             x1, NULL, #0x30  ; false
    // 0x42b344: StoreField: r0->field_5f = r1
    //     0x42b344: stur            w1, [x0, #0x5f]
    // 0x42b348: StoreField: r0->field_73 = r1
    //     0x42b348: stur            w1, [x0, #0x73]
    // 0x42b34c: ldur            x1, [fp, #-0x18]
    // 0x42b350: StoreField: r0->field_77 = r1
    //     0x42b350: stur            w1, [x0, #0x77]
    // 0x42b354: r1 = true
    //     0x42b354: add             x1, NULL, #0x20  ; true
    // 0x42b358: StoreField: r0->field_97 = r1
    //     0x42b358: stur            w1, [x0, #0x97]
    // 0x42b35c: r0 = MergeSemantics()
    //     0x42b35c: bl              #0x42a564  ; AllocateMergeSemanticsStub -> MergeSemantics (size=0x10)
    // 0x42b360: ldur            x1, [fp, #-8]
    // 0x42b364: StoreField: r0->field_b = r1
    //     0x42b364: stur            w1, [x0, #0xb]
    // 0x42b368: LeaveFrame
    //     0x42b368: mov             SP, fp
    //     0x42b36c: ldp             fp, lr, [SP], #0x10
    // 0x42b370: ret
    //     0x42b370: ret             
    // 0x42b374: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b374: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b378: b               #0x42b1cc
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42b37c, size: 0x94
    // 0x42b37c: EnterFrame
    //     0x42b37c: stp             fp, lr, [SP, #-0x10]!
    //     0x42b380: mov             fp, SP
    // 0x42b384: AllocStack(0x10)
    //     0x42b384: sub             SP, SP, #0x10
    // 0x42b388: CheckStackOverflow
    //     0x42b388: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b38c: cmp             SP, x16
    //     0x42b390: b.ls            #0x42b408
    // 0x42b394: r0 = LoadStaticField(0xccc)
    //     0x42b394: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b398: ldr             x0, [x0, #0x1998]
    // 0x42b39c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b3a0: cmp             w0, w16
    // 0x42b3a4: b.ne            #0x42b3b4
    // 0x42b3a8: r2 = stows
    //     0x42b3a8: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b3ac: ldr             x2, [x2, #0x310]
    // 0x42b3b0: r0 = InitLateFinalStaticField()
    //     0x42b3b0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b3b4: LoadField: r2 = r0->field_27
    //     0x42b3b4: ldur            w2, [x0, #0x27]
    // 0x42b3b8: DecompressPointer r2
    //     0x42b3b8: add             x2, x2, HEAP, lsl #32
    // 0x42b3bc: mov             x1, x2
    // 0x42b3c0: stur            x2, [fp, #-8]
    // 0x42b3c4: LoadField: r0 = r1->field_43
    //     0x42b3c4: ldur            w0, [x1, #0x43]
    // 0x42b3c8: DecompressPointer r0
    //     0x42b3c8: add             x0, x0, HEAP, lsl #32
    // 0x42b3cc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b3d0: cmp             w0, w16
    // 0x42b3d4: b.ne            #0x42b3e4
    // 0x42b3d8: r2 = _value
    //     0x42b3d8: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42b3dc: ldr             x2, [x2, #0x4b0]
    // 0x42b3e0: r0 = InitLateInstanceField()
    //     0x42b3e0: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42b3e4: eor             x3, x0, #0x10
    // 0x42b3e8: ldur            x1, [fp, #-8]
    // 0x42b3ec: mov             x2, x3
    // 0x42b3f0: stur            x3, [fp, #-0x10]
    // 0x42b3f4: r0 = value=()
    //     0x42b3f4: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42b3f8: ldur            x0, [fp, #-0x10]
    // 0x42b3fc: LeaveFrame
    //     0x42b3fc: mov             SP, fp
    //     0x42b400: ldp             fp, lr, [SP], #0x10
    // 0x42b404: ret
    //     0x42b404: ret             
    // 0x42b408: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b408: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b40c: b               #0x42b394
  }
  [closure] void <anonymous closure>(dynamic, bool) {
    // ** addr: 0x42b410, size: 0x5c
    // 0x42b410: EnterFrame
    //     0x42b410: stp             fp, lr, [SP, #-0x10]!
    //     0x42b414: mov             fp, SP
    // 0x42b418: CheckStackOverflow
    //     0x42b418: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b41c: cmp             SP, x16
    //     0x42b420: b.ls            #0x42b464
    // 0x42b424: r0 = LoadStaticField(0xccc)
    //     0x42b424: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b428: ldr             x0, [x0, #0x1998]
    // 0x42b42c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b430: cmp             w0, w16
    // 0x42b434: b.ne            #0x42b444
    // 0x42b438: r2 = stows
    //     0x42b438: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b43c: ldr             x2, [x2, #0x310]
    // 0x42b440: r0 = InitLateFinalStaticField()
    //     0x42b440: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b444: LoadField: r1 = r0->field_27
    //     0x42b444: ldur            w1, [x0, #0x27]
    // 0x42b448: DecompressPointer r1
    //     0x42b448: add             x1, x1, HEAP, lsl #32
    // 0x42b44c: ldr             x2, [fp, #0x10]
    // 0x42b450: r0 = value=()
    //     0x42b450: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42b454: ldr             x0, [fp, #0x10]
    // 0x42b458: LeaveFrame
    //     0x42b458: mov             SP, fp
    //     0x42b45c: ldp             fp, lr, [SP], #0x10
    // 0x42b460: ret
    //     0x42b460: ret             
    // 0x42b464: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b464: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b468: b               #0x42b424
  }
  [closure] MergeSemantics <anonymous closure>(dynamic, BuildContext, bool, Widget?) {
    // ** addr: 0x42b504, size: 0x1ac
    // 0x42b504: EnterFrame
    //     0x42b504: stp             fp, lr, [SP, #-0x10]!
    //     0x42b508: mov             fp, SP
    // 0x42b50c: AllocStack(0x20)
    //     0x42b50c: sub             SP, SP, #0x20
    // 0x42b510: SetupParameters([dynamic _ /* r0 */])
    //     0x42b510: ldr             x0, [fp, #0x28]
    //     0x42b514: ldur            w1, [x0, #0x17]
    //     0x42b518: add             x1, x1, HEAP, lsl #32
    //     0x42b51c: stur            x1, [fp, #-8]
    // 0x42b520: CheckStackOverflow
    //     0x42b520: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b524: cmp             SP, x16
    //     0x42b528: b.ls            #0x42b6a8
    // 0x42b52c: r0 = LoadStaticField(0xc74)
    //     0x42b52c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b530: ldr             x0, [x0, #0x18e8]
    // 0x42b534: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b538: cmp             w0, w16
    // 0x42b53c: b.ne            #0x42b54c
    // 0x42b540: r2 = NesIcons
    //     0x42b540: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x42b544: ldr             x2, [x2, #0xf70]
    // 0x42b548: r0 = InitLateFinalStaticField()
    //     0x42b548: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b54c: mov             x1, x0
    // 0x42b550: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x42b550: ldur            w0, [x1, #0x17]
    // 0x42b554: DecompressPointer r0
    //     0x42b554: add             x0, x0, HEAP, lsl #32
    // 0x42b558: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b55c: cmp             w0, w16
    // 0x42b560: b.ne            #0x42b570
    // 0x42b564: r2 = delete
    //     0x42b564: add             x2, PP, #0x12, lsl #12  ; [pp+0x122d0] Field <NesIconCollection.delete>: late final (offset: 0x18)
    //     0x42b568: ldr             x2, [x2, #0x2d0]
    // 0x42b56c: r0 = InitLateFinalInstanceField()
    //     0x42b56c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42b570: stur            x0, [fp, #-0x10]
    // 0x42b574: r0 = NesIcon()
    //     0x42b574: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x42b578: mov             x1, x0
    // 0x42b57c: ldur            x0, [fp, #-0x10]
    // 0x42b580: stur            x1, [fp, #-0x18]
    // 0x42b584: StoreField: r1->field_b = r0
    //     0x42b584: stur            w0, [x1, #0xb]
    // 0x42b588: ldur            x0, [fp, #-8]
    // 0x42b58c: LoadField: r2 = r0->field_13
    //     0x42b58c: ldur            w2, [x0, #0x13]
    // 0x42b590: DecompressPointer r2
    //     0x42b590: add             x2, x2, HEAP, lsl #32
    // 0x42b594: stur            x2, [fp, #-0x10]
    // 0x42b598: r0 = LoadStaticField(0xccc)
    //     0x42b598: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b59c: ldr             x0, [x0, #0x1998]
    // 0x42b5a0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b5a4: cmp             w0, w16
    // 0x42b5a8: b.ne            #0x42b5b8
    // 0x42b5ac: r2 = stows
    //     0x42b5ac: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b5b0: ldr             x2, [x2, #0x310]
    // 0x42b5b4: r0 = InitLateFinalStaticField()
    //     0x42b5b4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b5b8: LoadField: r1 = r0->field_23
    //     0x42b5b8: ldur            w1, [x0, #0x23]
    // 0x42b5bc: DecompressPointer r1
    //     0x42b5bc: add             x1, x1, HEAP, lsl #32
    // 0x42b5c0: LoadField: r0 = r1->field_43
    //     0x42b5c0: ldur            w0, [x1, #0x43]
    // 0x42b5c4: DecompressPointer r0
    //     0x42b5c4: add             x0, x0, HEAP, lsl #32
    // 0x42b5c8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b5cc: cmp             w0, w16
    // 0x42b5d0: b.ne            #0x42b5e0
    // 0x42b5d4: r2 = _value
    //     0x42b5d4: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42b5d8: ldr             x2, [x2, #0x4b0]
    // 0x42b5dc: r0 = InitLateInstanceField()
    //     0x42b5dc: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42b5e0: stur            x0, [fp, #-8]
    // 0x42b5e4: r0 = NesCheckBox()
    //     0x42b5e4: bl              #0x42a570  ; AllocateNesCheckBoxStub -> NesCheckBox (size=0x14)
    // 0x42b5e8: mov             x3, x0
    // 0x42b5ec: ldur            x0, [fp, #-8]
    // 0x42b5f0: stur            x3, [fp, #-0x20]
    // 0x42b5f4: StoreField: r3->field_b = r0
    //     0x42b5f4: stur            w0, [x3, #0xb]
    // 0x42b5f8: r1 = Function '<anonymous closure>':.
    //     0x42b5f8: add             x1, PP, #0x12, lsl #12  ; [pp+0x122d8] AnonymousClosure: (0x42b744), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42b5fc: ldr             x1, [x1, #0x2d8]
    // 0x42b600: r2 = Null
    //     0x42b600: mov             x2, NULL
    // 0x42b604: r0 = AllocateClosure()
    //     0x42b604: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42b608: mov             x1, x0
    // 0x42b60c: ldur            x0, [fp, #-0x20]
    // 0x42b610: StoreField: r0->field_f = r1
    //     0x42b610: stur            w1, [x0, #0xf]
    // 0x42b614: r0 = ListTile()
    //     0x42b614: bl              #0x3f2268  ; AllocateListTileStub -> ListTile (size=0xa0)
    // 0x42b618: mov             x3, x0
    // 0x42b61c: ldur            x0, [fp, #-0x18]
    // 0x42b620: stur            x3, [fp, #-8]
    // 0x42b624: StoreField: r3->field_b = r0
    //     0x42b624: stur            w0, [x3, #0xb]
    // 0x42b628: ldr             x0, [fp, #0x10]
    // 0x42b62c: StoreField: r3->field_f = r0
    //     0x42b62c: stur            w0, [x3, #0xf]
    // 0x42b630: ldur            x0, [fp, #-0x20]
    // 0x42b634: ArrayStore: r3[0] = r0  ; List_4
    //     0x42b634: stur            w0, [x3, #0x17]
    // 0x42b638: r0 = Instance_RoundedRectangleBorder
    //     0x42b638: add             x0, PP, #0x11, lsl #12  ; [pp+0x11fc0] Obj!RoundedRectangleBorder@5cc5c1
    //     0x42b63c: ldr             x0, [x0, #0xfc0]
    // 0x42b640: StoreField: r3->field_27 = r0
    //     0x42b640: stur            w0, [x3, #0x27]
    // 0x42b644: r0 = Instance_EdgeInsets
    //     0x42b644: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x42b648: ldr             x0, [x0, #0xd48]
    // 0x42b64c: StoreField: r3->field_47 = r0
    //     0x42b64c: stur            w0, [x3, #0x47]
    // 0x42b650: r0 = true
    //     0x42b650: add             x0, NULL, #0x20  ; true
    // 0x42b654: StoreField: r3->field_4b = r0
    //     0x42b654: stur            w0, [x3, #0x4b]
    // 0x42b658: r1 = Function '<anonymous closure>':.
    //     0x42b658: add             x1, PP, #0x12, lsl #12  ; [pp+0x122e0] AnonymousClosure: (0x42b6b0), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42b65c: ldr             x1, [x1, #0x2e0]
    // 0x42b660: r2 = Null
    //     0x42b660: mov             x2, NULL
    // 0x42b664: r0 = AllocateClosure()
    //     0x42b664: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42b668: mov             x1, x0
    // 0x42b66c: ldur            x0, [fp, #-8]
    // 0x42b670: StoreField: r0->field_4f = r1
    //     0x42b670: stur            w1, [x0, #0x4f]
    // 0x42b674: r1 = false
    //     0x42b674: add             x1, NULL, #0x30  ; false
    // 0x42b678: StoreField: r0->field_5f = r1
    //     0x42b678: stur            w1, [x0, #0x5f]
    // 0x42b67c: StoreField: r0->field_73 = r1
    //     0x42b67c: stur            w1, [x0, #0x73]
    // 0x42b680: ldur            x1, [fp, #-0x10]
    // 0x42b684: StoreField: r0->field_77 = r1
    //     0x42b684: stur            w1, [x0, #0x77]
    // 0x42b688: r1 = true
    //     0x42b688: add             x1, NULL, #0x20  ; true
    // 0x42b68c: StoreField: r0->field_97 = r1
    //     0x42b68c: stur            w1, [x0, #0x97]
    // 0x42b690: r0 = MergeSemantics()
    //     0x42b690: bl              #0x42a564  ; AllocateMergeSemanticsStub -> MergeSemantics (size=0x10)
    // 0x42b694: ldur            x1, [fp, #-8]
    // 0x42b698: StoreField: r0->field_b = r1
    //     0x42b698: stur            w1, [x0, #0xb]
    // 0x42b69c: LeaveFrame
    //     0x42b69c: mov             SP, fp
    //     0x42b6a0: ldp             fp, lr, [SP], #0x10
    // 0x42b6a4: ret
    //     0x42b6a4: ret             
    // 0x42b6a8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b6a8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b6ac: b               #0x42b52c
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42b6b0, size: 0x94
    // 0x42b6b0: EnterFrame
    //     0x42b6b0: stp             fp, lr, [SP, #-0x10]!
    //     0x42b6b4: mov             fp, SP
    // 0x42b6b8: AllocStack(0x10)
    //     0x42b6b8: sub             SP, SP, #0x10
    // 0x42b6bc: CheckStackOverflow
    //     0x42b6bc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b6c0: cmp             SP, x16
    //     0x42b6c4: b.ls            #0x42b73c
    // 0x42b6c8: r0 = LoadStaticField(0xccc)
    //     0x42b6c8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b6cc: ldr             x0, [x0, #0x1998]
    // 0x42b6d0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b6d4: cmp             w0, w16
    // 0x42b6d8: b.ne            #0x42b6e8
    // 0x42b6dc: r2 = stows
    //     0x42b6dc: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b6e0: ldr             x2, [x2, #0x310]
    // 0x42b6e4: r0 = InitLateFinalStaticField()
    //     0x42b6e4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b6e8: LoadField: r2 = r0->field_23
    //     0x42b6e8: ldur            w2, [x0, #0x23]
    // 0x42b6ec: DecompressPointer r2
    //     0x42b6ec: add             x2, x2, HEAP, lsl #32
    // 0x42b6f0: mov             x1, x2
    // 0x42b6f4: stur            x2, [fp, #-8]
    // 0x42b6f8: LoadField: r0 = r1->field_43
    //     0x42b6f8: ldur            w0, [x1, #0x43]
    // 0x42b6fc: DecompressPointer r0
    //     0x42b6fc: add             x0, x0, HEAP, lsl #32
    // 0x42b700: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b704: cmp             w0, w16
    // 0x42b708: b.ne            #0x42b718
    // 0x42b70c: r2 = _value
    //     0x42b70c: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42b710: ldr             x2, [x2, #0x4b0]
    // 0x42b714: r0 = InitLateInstanceField()
    //     0x42b714: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42b718: eor             x3, x0, #0x10
    // 0x42b71c: ldur            x1, [fp, #-8]
    // 0x42b720: mov             x2, x3
    // 0x42b724: stur            x3, [fp, #-0x10]
    // 0x42b728: r0 = value=()
    //     0x42b728: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42b72c: ldur            x0, [fp, #-0x10]
    // 0x42b730: LeaveFrame
    //     0x42b730: mov             SP, fp
    //     0x42b734: ldp             fp, lr, [SP], #0x10
    // 0x42b738: ret
    //     0x42b738: ret             
    // 0x42b73c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b73c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b740: b               #0x42b6c8
  }
  [closure] void <anonymous closure>(dynamic, bool) {
    // ** addr: 0x42b744, size: 0x5c
    // 0x42b744: EnterFrame
    //     0x42b744: stp             fp, lr, [SP, #-0x10]!
    //     0x42b748: mov             fp, SP
    // 0x42b74c: CheckStackOverflow
    //     0x42b74c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b750: cmp             SP, x16
    //     0x42b754: b.ls            #0x42b798
    // 0x42b758: r0 = LoadStaticField(0xccc)
    //     0x42b758: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b75c: ldr             x0, [x0, #0x1998]
    // 0x42b760: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b764: cmp             w0, w16
    // 0x42b768: b.ne            #0x42b778
    // 0x42b76c: r2 = stows
    //     0x42b76c: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b770: ldr             x2, [x2, #0x310]
    // 0x42b774: r0 = InitLateFinalStaticField()
    //     0x42b774: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b778: LoadField: r1 = r0->field_23
    //     0x42b778: ldur            w1, [x0, #0x23]
    // 0x42b77c: DecompressPointer r1
    //     0x42b77c: add             x1, x1, HEAP, lsl #32
    // 0x42b780: ldr             x2, [fp, #0x10]
    // 0x42b784: r0 = value=()
    //     0x42b784: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42b788: ldr             x0, [fp, #0x10]
    // 0x42b78c: LeaveFrame
    //     0x42b78c: mov             SP, fp
    //     0x42b790: ldp             fp, lr, [SP], #0x10
    // 0x42b794: ret
    //     0x42b794: ret             
    // 0x42b798: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b798: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b79c: b               #0x42b758
  }
  [closure] Slider <anonymous closure>(dynamic, BuildContext, Widget?) {
    // ** addr: 0x42b7a0, size: 0xc8
    // 0x42b7a0: EnterFrame
    //     0x42b7a0: stp             fp, lr, [SP, #-0x10]!
    //     0x42b7a4: mov             fp, SP
    // 0x42b7a8: AllocStack(0x10)
    //     0x42b7a8: sub             SP, SP, #0x10
    // 0x42b7ac: CheckStackOverflow
    //     0x42b7ac: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b7b0: cmp             SP, x16
    //     0x42b7b4: b.ls            #0x42b860
    // 0x42b7b8: r0 = LoadStaticField(0xccc)
    //     0x42b7b8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b7bc: ldr             x0, [x0, #0x1998]
    // 0x42b7c0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b7c4: cmp             w0, w16
    // 0x42b7c8: b.ne            #0x42b7d8
    // 0x42b7cc: r2 = stows
    //     0x42b7cc: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b7d0: ldr             x2, [x2, #0x310]
    // 0x42b7d4: r0 = InitLateFinalStaticField()
    //     0x42b7d4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b7d8: LoadField: r1 = r0->field_1f
    //     0x42b7d8: ldur            w1, [x0, #0x1f]
    // 0x42b7dc: DecompressPointer r1
    //     0x42b7dc: add             x1, x1, HEAP, lsl #32
    // 0x42b7e0: LoadField: r0 = r1->field_43
    //     0x42b7e0: ldur            w0, [x1, #0x43]
    // 0x42b7e4: DecompressPointer r0
    //     0x42b7e4: add             x0, x0, HEAP, lsl #32
    // 0x42b7e8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b7ec: cmp             w0, w16
    // 0x42b7f0: b.ne            #0x42b800
    // 0x42b7f4: r2 = _value
    //     0x42b7f4: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42b7f8: ldr             x2, [x2, #0x4b0]
    // 0x42b7fc: r0 = InitLateInstanceField()
    //     0x42b7fc: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42b800: LoadField: d0 = r0->field_7
    //     0x42b800: ldur            d0, [x0, #7]
    // 0x42b804: stur            d0, [fp, #-0x10]
    // 0x42b808: r0 = Slider()
    //     0x42b808: bl              #0x42b868  ; AllocateSliderStub -> Slider (size=0x74)
    // 0x42b80c: ldur            d0, [fp, #-0x10]
    // 0x42b810: stur            x0, [fp, #-8]
    // 0x42b814: StoreField: r0->field_b = d0
    //     0x42b814: stur            d0, [x0, #0xb]
    // 0x42b818: r1 = Function '<anonymous closure>':.
    //     0x42b818: add             x1, PP, #0x12, lsl #12  ; [pp+0x122f0] AnonymousClosure: (0x42b874), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42b81c: ldr             x1, [x1, #0x2f0]
    // 0x42b820: r2 = Null
    //     0x42b820: mov             x2, NULL
    // 0x42b824: r0 = AllocateClosure()
    //     0x42b824: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42b828: mov             x1, x0
    // 0x42b82c: ldur            x0, [fp, #-8]
    // 0x42b830: ArrayStore: r0[0] = r1  ; List_4
    //     0x42b830: stur            w1, [x0, #0x17]
    // 0x42b834: StoreField: r0->field_23 = rZR
    //     0x42b834: stur            xzr, [x0, #0x23]
    // 0x42b838: d0 = 1.000000
    //     0x42b838: fmov            d0, #1.00000000
    // 0x42b83c: StoreField: r0->field_2b = d0
    //     0x42b83c: stur            d0, [x0, #0x2b]
    // 0x42b840: r1 = false
    //     0x42b840: add             x1, NULL, #0x30  ; false
    // 0x42b844: StoreField: r0->field_5b = r1
    //     0x42b844: stur            w1, [x0, #0x5b]
    // 0x42b848: r1 = Instance__SliderType
    //     0x42b848: add             x1, PP, #0x12, lsl #12  ; [pp+0x122f8] Obj!_SliderType@5db211
    //     0x42b84c: ldr             x1, [x1, #0x2f8]
    // 0x42b850: StoreField: r0->field_6f = r1
    //     0x42b850: stur            w1, [x0, #0x6f]
    // 0x42b854: LeaveFrame
    //     0x42b854: mov             SP, fp
    //     0x42b858: ldp             fp, lr, [SP], #0x10
    // 0x42b85c: ret
    //     0x42b85c: ret             
    // 0x42b860: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b860: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b864: b               #0x42b7b8
  }
  [closure] void <anonymous closure>(dynamic, double) {
    // ** addr: 0x42b874, size: 0x5c
    // 0x42b874: EnterFrame
    //     0x42b874: stp             fp, lr, [SP, #-0x10]!
    //     0x42b878: mov             fp, SP
    // 0x42b87c: CheckStackOverflow
    //     0x42b87c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b880: cmp             SP, x16
    //     0x42b884: b.ls            #0x42b8c8
    // 0x42b888: r0 = LoadStaticField(0xccc)
    //     0x42b888: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b88c: ldr             x0, [x0, #0x1998]
    // 0x42b890: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b894: cmp             w0, w16
    // 0x42b898: b.ne            #0x42b8a8
    // 0x42b89c: r2 = stows
    //     0x42b89c: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b8a0: ldr             x2, [x2, #0x310]
    // 0x42b8a4: r0 = InitLateFinalStaticField()
    //     0x42b8a4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b8a8: LoadField: r1 = r0->field_1f
    //     0x42b8a8: ldur            w1, [x0, #0x1f]
    // 0x42b8ac: DecompressPointer r1
    //     0x42b8ac: add             x1, x1, HEAP, lsl #32
    // 0x42b8b0: ldr             x2, [fp, #0x10]
    // 0x42b8b4: r0 = value=()
    //     0x42b8b4: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42b8b8: r0 = Null
    //     0x42b8b8: mov             x0, NULL
    // 0x42b8bc: LeaveFrame
    //     0x42b8bc: mov             SP, fp
    //     0x42b8c0: ldp             fp, lr, [SP], #0x10
    // 0x42b8c4: ret
    //     0x42b8c4: ret             
    // 0x42b8c8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b8c8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b8cc: b               #0x42b888
  }
  [closure] Slider <anonymous closure>(dynamic, BuildContext, Widget?) {
    // ** addr: 0x42b8d0, size: 0xc8
    // 0x42b8d0: EnterFrame
    //     0x42b8d0: stp             fp, lr, [SP, #-0x10]!
    //     0x42b8d4: mov             fp, SP
    // 0x42b8d8: AllocStack(0x10)
    //     0x42b8d8: sub             SP, SP, #0x10
    // 0x42b8dc: CheckStackOverflow
    //     0x42b8dc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b8e0: cmp             SP, x16
    //     0x42b8e4: b.ls            #0x42b990
    // 0x42b8e8: r0 = LoadStaticField(0xccc)
    //     0x42b8e8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b8ec: ldr             x0, [x0, #0x1998]
    // 0x42b8f0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b8f4: cmp             w0, w16
    // 0x42b8f8: b.ne            #0x42b908
    // 0x42b8fc: r2 = stows
    //     0x42b8fc: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b900: ldr             x2, [x2, #0x310]
    // 0x42b904: r0 = InitLateFinalStaticField()
    //     0x42b904: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b908: LoadField: r1 = r0->field_1b
    //     0x42b908: ldur            w1, [x0, #0x1b]
    // 0x42b90c: DecompressPointer r1
    //     0x42b90c: add             x1, x1, HEAP, lsl #32
    // 0x42b910: LoadField: r0 = r1->field_43
    //     0x42b910: ldur            w0, [x1, #0x43]
    // 0x42b914: DecompressPointer r0
    //     0x42b914: add             x0, x0, HEAP, lsl #32
    // 0x42b918: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b91c: cmp             w0, w16
    // 0x42b920: b.ne            #0x42b930
    // 0x42b924: r2 = _value
    //     0x42b924: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42b928: ldr             x2, [x2, #0x4b0]
    // 0x42b92c: r0 = InitLateInstanceField()
    //     0x42b92c: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42b930: LoadField: d0 = r0->field_7
    //     0x42b930: ldur            d0, [x0, #7]
    // 0x42b934: stur            d0, [fp, #-0x10]
    // 0x42b938: r0 = Slider()
    //     0x42b938: bl              #0x42b868  ; AllocateSliderStub -> Slider (size=0x74)
    // 0x42b93c: ldur            d0, [fp, #-0x10]
    // 0x42b940: stur            x0, [fp, #-8]
    // 0x42b944: StoreField: r0->field_b = d0
    //     0x42b944: stur            d0, [x0, #0xb]
    // 0x42b948: r1 = Function '<anonymous closure>':.
    //     0x42b948: add             x1, PP, #0x12, lsl #12  ; [pp+0x12300] AnonymousClosure: (0x42b998), in [package:ricochlime/pages/settings.dart] SettingsPage::build (0x403480)
    //     0x42b94c: ldr             x1, [x1, #0x300]
    // 0x42b950: r2 = Null
    //     0x42b950: mov             x2, NULL
    // 0x42b954: r0 = AllocateClosure()
    //     0x42b954: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42b958: mov             x1, x0
    // 0x42b95c: ldur            x0, [fp, #-8]
    // 0x42b960: ArrayStore: r0[0] = r1  ; List_4
    //     0x42b960: stur            w1, [x0, #0x17]
    // 0x42b964: StoreField: r0->field_23 = rZR
    //     0x42b964: stur            xzr, [x0, #0x23]
    // 0x42b968: d0 = 1.000000
    //     0x42b968: fmov            d0, #1.00000000
    // 0x42b96c: StoreField: r0->field_2b = d0
    //     0x42b96c: stur            d0, [x0, #0x2b]
    // 0x42b970: r1 = false
    //     0x42b970: add             x1, NULL, #0x30  ; false
    // 0x42b974: StoreField: r0->field_5b = r1
    //     0x42b974: stur            w1, [x0, #0x5b]
    // 0x42b978: r1 = Instance__SliderType
    //     0x42b978: add             x1, PP, #0x12, lsl #12  ; [pp+0x122f8] Obj!_SliderType@5db211
    //     0x42b97c: ldr             x1, [x1, #0x2f8]
    // 0x42b980: StoreField: r0->field_6f = r1
    //     0x42b980: stur            w1, [x0, #0x6f]
    // 0x42b984: LeaveFrame
    //     0x42b984: mov             SP, fp
    //     0x42b988: ldp             fp, lr, [SP], #0x10
    // 0x42b98c: ret
    //     0x42b98c: ret             
    // 0x42b990: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b990: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b994: b               #0x42b8e8
  }
  [closure] void <anonymous closure>(dynamic, double) {
    // ** addr: 0x42b998, size: 0x5c
    // 0x42b998: EnterFrame
    //     0x42b998: stp             fp, lr, [SP, #-0x10]!
    //     0x42b99c: mov             fp, SP
    // 0x42b9a0: CheckStackOverflow
    //     0x42b9a0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b9a4: cmp             SP, x16
    //     0x42b9a8: b.ls            #0x42b9ec
    // 0x42b9ac: r0 = LoadStaticField(0xccc)
    //     0x42b9ac: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42b9b0: ldr             x0, [x0, #0x1998]
    // 0x42b9b4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42b9b8: cmp             w0, w16
    // 0x42b9bc: b.ne            #0x42b9cc
    // 0x42b9c0: r2 = stows
    //     0x42b9c0: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42b9c4: ldr             x2, [x2, #0x310]
    // 0x42b9c8: r0 = InitLateFinalStaticField()
    //     0x42b9c8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42b9cc: LoadField: r1 = r0->field_1b
    //     0x42b9cc: ldur            w1, [x0, #0x1b]
    // 0x42b9d0: DecompressPointer r1
    //     0x42b9d0: add             x1, x1, HEAP, lsl #32
    // 0x42b9d4: ldr             x2, [fp, #0x10]
    // 0x42b9d8: r0 = value=()
    //     0x42b9d8: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42b9dc: r0 = Null
    //     0x42b9dc: mov             x0, NULL
    // 0x42b9e0: LeaveFrame
    //     0x42b9e0: mov             SP, fp
    //     0x42b9e4: ldp             fp, lr, [SP], #0x10
    // 0x42b9e8: ret
    //     0x42b9e8: ret             
    // 0x42b9ec: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b9ec: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b9f0: b               #0x42b9ac
  }
}
