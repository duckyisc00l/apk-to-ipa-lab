// lib: , url: package:ricochlime/utils/stows.dart

// class id: 1049336, size: 0x8
class :: {

  static late final Stows stows; // offset: 0xccc

  static Stows stows() {
    // ** addr: 0x288368, size: 0x40
    // 0x288368: EnterFrame
    //     0x288368: stp             fp, lr, [SP, #-0x10]!
    //     0x28836c: mov             fp, SP
    // 0x288370: AllocStack(0x8)
    //     0x288370: sub             SP, SP, #8
    // 0x288374: CheckStackOverflow
    //     0x288374: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x288378: cmp             SP, x16
    //     0x28837c: b.ls            #0x2883a0
    // 0x288380: r0 = Stows()
    //     0x288380: bl              #0x28ce58  ; AllocateStowsStub -> Stows (size=0x58)
    // 0x288384: mov             x1, x0
    // 0x288388: stur            x0, [fp, #-8]
    // 0x28838c: r0 = Stows()
    //     0x28838c: bl              #0x2883a8  ; [package:ricochlime/utils/stows.dart] Stows::Stows
    // 0x288390: ldur            x0, [fp, #-8]
    // 0x288394: LeaveFrame
    //     0x288394: mov             SP, fp
    //     0x288398: ldp             fp, lr, [SP], #0x10
    // 0x28839c: ret
    //     0x28839c: ret             
    // 0x2883a0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x2883a0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x2883a4: b               #0x288380
  }
}

// class id: 220, size: 0x58, field offset: 0x8
class Stows extends Object {

  _ Stows(/* No info */) {
    // ** addr: 0x2883a8, size: 0x738
    // 0x2883a8: EnterFrame
    //     0x2883a8: stp             fp, lr, [SP, #-0x10]!
    //     0x2883ac: mov             fp, SP
    // 0x2883b0: AllocStack(0x18)
    //     0x2883b0: sub             SP, SP, #0x18
    // 0x2883b4: SetupParameters(Stows this /* r1 => r0, fp-0x8 */)
    //     0x2883b4: mov             x0, x1
    //     0x2883b8: stur            x1, [fp, #-8]
    // 0x2883bc: CheckStackOverflow
    //     0x2883bc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x2883c0: cmp             SP, x16
    //     0x2883c4: b.ls            #0x288ad0
    // 0x2883c8: r1 = Function '<anonymous closure>':.
    //     0x2883c8: add             x1, PP, #8, lsl #12  ; [pp+0x8358] AnonymousClosure: (0x28cc58), in [package:ricochlime/utils/stows.dart] Stows::Stows (0x2883a8)
    //     0x2883cc: ldr             x1, [x1, #0x358]
    // 0x2883d0: r2 = Null
    //     0x2883d0: mov             x2, NULL
    // 0x2883d4: r0 = AllocateClosure()
    //     0x2883d4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x2883d8: r1 = <String, GameData?, Object?, GameData?>
    //     0x2883d8: add             x1, PP, #8, lsl #12  ; [pp+0x8360] TypeArguments: <String, GameData?, Object?, GameData?>
    //     0x2883dc: ldr             x1, [x1, #0x360]
    // 0x2883e0: stur            x0, [fp, #-0x10]
    // 0x2883e4: r0 = PlainStow()
    //     0x2883e4: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x2883e8: mov             x1, x0
    // 0x2883ec: ldur            x2, [fp, #-0x10]
    // 0x2883f0: stur            x0, [fp, #-0x10]
    // 0x2883f4: r0 = PlainStow.json()
    //     0x2883f4: bl              #0x28abf8  ; [package:stow_plain/src/plain_stow.dart] PlainStow::PlainStow.json
    // 0x2883f8: ldur            x0, [fp, #-0x10]
    // 0x2883fc: ldur            x2, [fp, #-8]
    // 0x288400: StoreField: r2->field_7 = r0
    //     0x288400: stur            w0, [x2, #7]
    //     0x288404: ldurb           w16, [x2, #-1]
    //     0x288408: ldurb           w17, [x0, #-1]
    //     0x28840c: and             x16, x17, x16, lsr #2
    //     0x288410: tst             x16, HEAP, lsr #32
    //     0x288414: b.eq            #0x28841c
    //     0x288418: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x28841c: r1 = <String, int, Object?, int>
    //     0x28841c: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x288420: ldr             x1, [x1, #0x368]
    // 0x288424: r0 = PlainStow()
    //     0x288424: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288428: mov             x1, x0
    // 0x28842c: r2 = "highScore"
    //     0x28842c: add             x2, PP, #8, lsl #12  ; [pp+0x8370] "highScore"
    //     0x288430: ldr             x2, [x2, #0x370]
    // 0x288434: r3 = 0
    //     0x288434: mov             x3, #0
    // 0x288438: r5 = Null
    //     0x288438: mov             x5, NULL
    // 0x28843c: stur            x0, [fp, #-0x10]
    // 0x288440: r0 = Stow()
    //     0x288440: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288444: ldur            x0, [fp, #-0x10]
    // 0x288448: ldur            x2, [fp, #-8]
    // 0x28844c: StoreField: r2->field_b = r0
    //     0x28844c: stur            w0, [x2, #0xb]
    //     0x288450: ldurb           w16, [x2, #-1]
    //     0x288454: ldurb           w17, [x0, #-1]
    //     0x288458: and             x16, x17, x16, lsr #2
    //     0x28845c: tst             x16, HEAP, lsr #32
    //     0x288460: b.eq            #0x288468
    //     0x288464: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288468: r1 = <String, bool, Object?, bool>
    //     0x288468: add             x1, PP, #8, lsl #12  ; [pp+0x8378] TypeArguments: <String, bool, Object?, bool>
    //     0x28846c: ldr             x1, [x1, #0x378]
    // 0x288470: r0 = PlainStow()
    //     0x288470: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288474: mov             x1, x0
    // 0x288478: r2 = "hyperlegibleFont"
    //     0x288478: add             x2, PP, #8, lsl #12  ; [pp+0x8380] "hyperlegibleFont"
    //     0x28847c: ldr             x2, [x2, #0x380]
    // 0x288480: r3 = false
    //     0x288480: add             x3, NULL, #0x30  ; false
    // 0x288484: r5 = Null
    //     0x288484: mov             x5, NULL
    // 0x288488: stur            x0, [fp, #-0x10]
    // 0x28848c: r0 = Stow()
    //     0x28848c: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288490: ldur            x0, [fp, #-0x10]
    // 0x288494: ldur            x2, [fp, #-8]
    // 0x288498: StoreField: r2->field_f = r0
    //     0x288498: stur            w0, [x2, #0xf]
    //     0x28849c: ldurb           w16, [x2, #-1]
    //     0x2884a0: ldurb           w17, [x0, #-1]
    //     0x2884a4: and             x16, x17, x16, lsr #2
    //     0x2884a8: tst             x16, HEAP, lsr #32
    //     0x2884ac: b.eq            #0x2884b4
    //     0x2884b0: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x2884b4: r1 = <String, bool, Object?, bool>
    //     0x2884b4: add             x1, PP, #8, lsl #12  ; [pp+0x8378] TypeArguments: <String, bool, Object?, bool>
    //     0x2884b8: ldr             x1, [x1, #0x378]
    // 0x2884bc: r0 = PlainStow()
    //     0x2884bc: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x2884c0: mov             x1, x0
    // 0x2884c4: r2 = "stylizedPageTransitions"
    //     0x2884c4: add             x2, PP, #8, lsl #12  ; [pp+0x8388] "stylizedPageTransitions"
    //     0x2884c8: ldr             x2, [x2, #0x388]
    // 0x2884cc: r3 = true
    //     0x2884cc: add             x3, NULL, #0x20  ; true
    // 0x2884d0: r5 = Null
    //     0x2884d0: mov             x5, NULL
    // 0x2884d4: stur            x0, [fp, #-0x10]
    // 0x2884d8: r0 = Stow()
    //     0x2884d8: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x2884dc: ldur            x0, [fp, #-0x10]
    // 0x2884e0: ldur            x2, [fp, #-8]
    // 0x2884e4: StoreField: r2->field_13 = r0
    //     0x2884e4: stur            w0, [x2, #0x13]
    //     0x2884e8: ldurb           w16, [x2, #-1]
    //     0x2884ec: ldurb           w17, [x0, #-1]
    //     0x2884f0: and             x16, x17, x16, lsr #2
    //     0x2884f4: tst             x16, HEAP, lsr #32
    //     0x2884f8: b.eq            #0x288500
    //     0x2884fc: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288500: r1 = <String, bool, Object?, bool>
    //     0x288500: add             x1, PP, #8, lsl #12  ; [pp+0x8378] TypeArguments: <String, bool, Object?, bool>
    //     0x288504: ldr             x1, [x1, #0x378]
    // 0x288508: r0 = PlainStow()
    //     0x288508: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x28850c: mov             x1, x0
    // 0x288510: r2 = "biggerBullets"
    //     0x288510: add             x2, PP, #8, lsl #12  ; [pp+0x8390] "biggerBullets"
    //     0x288514: ldr             x2, [x2, #0x390]
    // 0x288518: r3 = false
    //     0x288518: add             x3, NULL, #0x30  ; false
    // 0x28851c: r5 = Null
    //     0x28851c: mov             x5, NULL
    // 0x288520: stur            x0, [fp, #-0x10]
    // 0x288524: r0 = Stow()
    //     0x288524: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288528: ldur            x0, [fp, #-0x10]
    // 0x28852c: ldur            x2, [fp, #-8]
    // 0x288530: ArrayStore: r2[0] = r0  ; List_4
    //     0x288530: stur            w0, [x2, #0x17]
    //     0x288534: ldurb           w16, [x2, #-1]
    //     0x288538: ldurb           w17, [x0, #-1]
    //     0x28853c: and             x16, x17, x16, lsr #2
    //     0x288540: tst             x16, HEAP, lsr #32
    //     0x288544: b.eq            #0x28854c
    //     0x288548: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x28854c: r1 = <String, double, Object?, double>
    //     0x28854c: add             x1, PP, #8, lsl #12  ; [pp+0x8398] TypeArguments: <String, double, Object?, double>
    //     0x288550: ldr             x1, [x1, #0x398]
    // 0x288554: r0 = PlainStow()
    //     0x288554: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288558: mov             x1, x0
    // 0x28855c: r2 = "bgmVolume"
    //     0x28855c: add             x2, PP, #8, lsl #12  ; [pp+0x83a0] "bgmVolume"
    //     0x288560: ldr             x2, [x2, #0x3a0]
    // 0x288564: r3 = 0.000000
    //     0x288564: ldr             x3, [PP, #0x5c40]  ; [pp+0x5c40] 0
    // 0x288568: r5 = Null
    //     0x288568: mov             x5, NULL
    // 0x28856c: stur            x0, [fp, #-0x10]
    // 0x288570: r0 = Stow()
    //     0x288570: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288574: ldur            x0, [fp, #-0x10]
    // 0x288578: ldur            x2, [fp, #-8]
    // 0x28857c: StoreField: r2->field_1b = r0
    //     0x28857c: stur            w0, [x2, #0x1b]
    //     0x288580: ldurb           w16, [x2, #-1]
    //     0x288584: ldurb           w17, [x0, #-1]
    //     0x288588: and             x16, x17, x16, lsr #2
    //     0x28858c: tst             x16, HEAP, lsr #32
    //     0x288590: b.eq            #0x288598
    //     0x288594: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288598: r1 = <String, double, Object?, double>
    //     0x288598: add             x1, PP, #8, lsl #12  ; [pp+0x8398] TypeArguments: <String, double, Object?, double>
    //     0x28859c: ldr             x1, [x1, #0x398]
    // 0x2885a0: r0 = PlainStow()
    //     0x2885a0: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x2885a4: mov             x1, x0
    // 0x2885a8: r2 = "sfxVolume"
    //     0x2885a8: add             x2, PP, #8, lsl #12  ; [pp+0x83a8] "sfxVolume"
    //     0x2885ac: ldr             x2, [x2, #0x3a8]
    // 0x2885b0: r3 = 0.000000
    //     0x2885b0: ldr             x3, [PP, #0x5c40]  ; [pp+0x5c40] 0
    // 0x2885b4: r5 = Null
    //     0x2885b4: mov             x5, NULL
    // 0x2885b8: stur            x0, [fp, #-0x10]
    // 0x2885bc: r0 = Stow()
    //     0x2885bc: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x2885c0: ldur            x0, [fp, #-0x10]
    // 0x2885c4: ldur            x2, [fp, #-8]
    // 0x2885c8: StoreField: r2->field_1f = r0
    //     0x2885c8: stur            w0, [x2, #0x1f]
    //     0x2885cc: ldurb           w16, [x2, #-1]
    //     0x2885d0: ldurb           w17, [x0, #-1]
    //     0x2885d4: and             x16, x17, x16, lsr #2
    //     0x2885d8: tst             x16, HEAP, lsr #32
    //     0x2885dc: b.eq            #0x2885e4
    //     0x2885e0: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x2885e4: r1 = <String, bool, Object?, bool>
    //     0x2885e4: add             x1, PP, #8, lsl #12  ; [pp+0x8378] TypeArguments: <String, bool, Object?, bool>
    //     0x2885e8: ldr             x1, [x1, #0x378]
    // 0x2885ec: r0 = PlainStow()
    //     0x2885ec: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x2885f0: mov             x1, x0
    // 0x2885f4: r2 = "showUndoButton"
    //     0x2885f4: add             x2, PP, #8, lsl #12  ; [pp+0x83b0] "showUndoButton"
    //     0x2885f8: ldr             x2, [x2, #0x3b0]
    // 0x2885fc: r3 = true
    //     0x2885fc: add             x3, NULL, #0x20  ; true
    // 0x288600: r5 = Null
    //     0x288600: mov             x5, NULL
    // 0x288604: stur            x0, [fp, #-0x10]
    // 0x288608: r0 = Stow()
    //     0x288608: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x28860c: ldur            x0, [fp, #-0x10]
    // 0x288610: ldur            x2, [fp, #-8]
    // 0x288614: StoreField: r2->field_23 = r0
    //     0x288614: stur            w0, [x2, #0x23]
    //     0x288618: ldurb           w16, [x2, #-1]
    //     0x28861c: ldurb           w17, [x0, #-1]
    //     0x288620: and             x16, x17, x16, lsr #2
    //     0x288624: tst             x16, HEAP, lsr #32
    //     0x288628: b.eq            #0x288630
    //     0x28862c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288630: r1 = <String, bool, Object?, bool>
    //     0x288630: add             x1, PP, #8, lsl #12  ; [pp+0x8378] TypeArguments: <String, bool, Object?, bool>
    //     0x288634: ldr             x1, [x1, #0x378]
    // 0x288638: r0 = PlainStow()
    //     0x288638: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x28863c: mov             x1, x0
    // 0x288640: r2 = "showReflectionInAimGuide"
    //     0x288640: add             x2, PP, #8, lsl #12  ; [pp+0x83b8] "showReflectionInAimGuide"
    //     0x288644: ldr             x2, [x2, #0x3b8]
    // 0x288648: r3 = true
    //     0x288648: add             x3, NULL, #0x20  ; true
    // 0x28864c: r5 = Null
    //     0x28864c: mov             x5, NULL
    // 0x288650: stur            x0, [fp, #-0x10]
    // 0x288654: r0 = Stow()
    //     0x288654: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288658: ldur            x0, [fp, #-0x10]
    // 0x28865c: ldur            x2, [fp, #-8]
    // 0x288660: StoreField: r2->field_27 = r0
    //     0x288660: stur            w0, [x2, #0x27]
    //     0x288664: ldurb           w16, [x2, #-1]
    //     0x288668: ldurb           w17, [x0, #-1]
    //     0x28866c: and             x16, x17, x16, lsr #2
    //     0x288670: tst             x16, HEAP, lsr #32
    //     0x288674: b.eq            #0x28867c
    //     0x288678: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x28867c: r1 = <String, int, Object?, int>
    //     0x28867c: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x288680: ldr             x1, [x1, #0x368]
    // 0x288684: r0 = PlainStow()
    //     0x288684: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288688: mov             x1, x0
    // 0x28868c: r2 = "coins"
    //     0x28868c: add             x2, PP, #8, lsl #12  ; [pp+0x83c0] "coins"
    //     0x288690: ldr             x2, [x2, #0x3c0]
    // 0x288694: r3 = 0
    //     0x288694: mov             x3, #0
    // 0x288698: r5 = Null
    //     0x288698: mov             x5, NULL
    // 0x28869c: stur            x0, [fp, #-0x10]
    // 0x2886a0: r0 = Stow()
    //     0x2886a0: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x2886a4: ldur            x0, [fp, #-0x10]
    // 0x2886a8: ldur            x1, [fp, #-8]
    // 0x2886ac: StoreField: r1->field_2b = r0
    //     0x2886ac: stur            w0, [x1, #0x2b]
    //     0x2886b0: ldurb           w16, [x1, #-1]
    //     0x2886b4: ldurb           w17, [x0, #-1]
    //     0x2886b8: and             x16, x17, x16, lsr #2
    //     0x2886bc: tst             x16, HEAP, lsr #32
    //     0x2886c0: b.eq            #0x2886c8
    //     0x2886c4: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x2886c8: r0 = LoadStaticField(0xcd4)
    //     0x2886c8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x2886cc: ldr             x0, [x0, #0x19a8]
    // 0x2886d0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x2886d4: cmp             w0, w16
    // 0x2886d8: b.ne            #0x2886e8
    // 0x2886dc: r2 = bulletColors
    //     0x2886dc: add             x2, PP, #8, lsl #12  ; [pp+0x83c8] Field <ShopItems.bulletColors>: static late final (offset: 0xcd4)
    //     0x2886e0: ldr             x2, [x2, #0x3c8]
    // 0x2886e4: r0 = InitLateFinalStaticField()
    //     0x2886e4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x2886e8: mov             x2, x0
    // 0x2886ec: LoadField: r0 = r2->field_b
    //     0x2886ec: ldur            w0, [x2, #0xb]
    // 0x2886f0: r1 = LoadInt32Instr(r0)
    //     0x2886f0: sbfx            x1, x0, #1, #0x1f
    // 0x2886f4: cmp             x1, #0
    // 0x2886f8: b.le            #0x288ac4
    // 0x2886fc: ldur            x3, [fp, #-8]
    // 0x288700: mov             x0, x1
    // 0x288704: r1 = 0
    //     0x288704: mov             x1, #0
    // 0x288708: cmp             x1, x0
    // 0x28870c: b.hs            #0x288ad8
    // 0x288710: LoadField: r0 = r2->field_f
    //     0x288710: ldur            w0, [x2, #0xf]
    // 0x288714: DecompressPointer r0
    //     0x288714: add             x0, x0, HEAP, lsl #32
    // 0x288718: ArrayLoad: r2 = r0[0]  ; List_4
    //     0x288718: ldur            w2, [x0, #0x17]
    // 0x28871c: DecompressPointer r2
    //     0x28871c: add             x2, x2, HEAP, lsl #32
    // 0x288720: stur            x2, [fp, #-0x10]
    // 0x288724: r1 = <String, Color, Object?, Color>
    //     0x288724: add             x1, PP, #8, lsl #12  ; [pp+0x83d0] TypeArguments: <String, Color, Object?, Color>
    //     0x288728: ldr             x1, [x1, #0x3d0]
    // 0x28872c: r0 = PlainStow()
    //     0x28872c: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288730: r1 = <Color, int>
    //     0x288730: add             x1, PP, #8, lsl #12  ; [pp+0x83d8] TypeArguments: <Color, int>
    //     0x288734: ldr             x1, [x1, #0x3d8]
    // 0x288738: stur            x0, [fp, #-0x18]
    // 0x28873c: r0 = ColorCodec()
    //     0x28873c: bl              #0x288ae0  ; AllocateColorCodecStub -> ColorCodec (size=0xc)
    // 0x288740: ldur            x1, [fp, #-0x18]
    // 0x288744: ldur            x3, [fp, #-0x10]
    // 0x288748: mov             x5, x0
    // 0x28874c: r2 = "bulletColor"
    //     0x28874c: add             x2, PP, #8, lsl #12  ; [pp+0x83e0] "bulletColor"
    //     0x288750: ldr             x2, [x2, #0x3e0]
    // 0x288754: r0 = Stow()
    //     0x288754: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288758: ldur            x0, [fp, #-0x18]
    // 0x28875c: ldur            x1, [fp, #-8]
    // 0x288760: StoreField: r1->field_2f = r0
    //     0x288760: stur            w0, [x1, #0x2f]
    //     0x288764: ldurb           w16, [x1, #-1]
    //     0x288768: ldurb           w17, [x0, #-1]
    //     0x28876c: and             x16, x17, x16, lsr #2
    //     0x288770: tst             x16, HEAP, lsr #32
    //     0x288774: b.eq            #0x28877c
    //     0x288778: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x28877c: r0 = LoadStaticField(0xcd8)
    //     0x28877c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x288780: ldr             x0, [x0, #0x19b0]
    // 0x288784: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x288788: cmp             w0, w16
    // 0x28878c: b.ne            #0x28879c
    // 0x288790: r2 = bulletShapes
    //     0x288790: add             x2, PP, #8, lsl #12  ; [pp+0x83e8] Field <ShopItems.bulletShapes>: static late final (offset: 0xcd8)
    //     0x288794: ldr             x2, [x2, #0x3e8]
    // 0x288798: r0 = InitLateFinalStaticField()
    //     0x288798: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28879c: mov             x2, x0
    // 0x2887a0: LoadField: r0 = r2->field_b
    //     0x2887a0: ldur            w0, [x2, #0xb]
    // 0x2887a4: r1 = LoadInt32Instr(r0)
    //     0x2887a4: sbfx            x1, x0, #1, #0x1f
    // 0x2887a8: cmp             x1, #0
    // 0x2887ac: b.le            #0x288ab8
    // 0x2887b0: ldur            x3, [fp, #-8]
    // 0x2887b4: mov             x0, x1
    // 0x2887b8: r1 = 0
    //     0x2887b8: mov             x1, #0
    // 0x2887bc: cmp             x1, x0
    // 0x2887c0: b.hs            #0x288adc
    // 0x2887c4: LoadField: r0 = r2->field_f
    //     0x2887c4: ldur            w0, [x2, #0xf]
    // 0x2887c8: DecompressPointer r0
    //     0x2887c8: add             x0, x0, HEAP, lsl #32
    // 0x2887cc: LoadField: r2 = r0->field_7
    //     0x2887cc: ldur            w2, [x0, #7]
    // 0x2887d0: DecompressPointer r2
    //     0x2887d0: add             x2, x2, HEAP, lsl #32
    // 0x2887d4: stur            x2, [fp, #-0x10]
    // 0x2887d8: r1 = <String, String, Object?, String>
    //     0x2887d8: add             x1, PP, #8, lsl #12  ; [pp+0x83f0] TypeArguments: <String, String, Object?, String>
    //     0x2887dc: ldr             x1, [x1, #0x3f0]
    // 0x2887e0: r0 = PlainStow()
    //     0x2887e0: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x2887e4: mov             x1, x0
    // 0x2887e8: ldur            x3, [fp, #-0x10]
    // 0x2887ec: r2 = "bulletShape"
    //     0x2887ec: add             x2, PP, #8, lsl #12  ; [pp+0x83f8] "bulletShape"
    //     0x2887f0: ldr             x2, [x2, #0x3f8]
    // 0x2887f4: r5 = Null
    //     0x2887f4: mov             x5, NULL
    // 0x2887f8: stur            x0, [fp, #-0x10]
    // 0x2887fc: r0 = Stow()
    //     0x2887fc: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288800: ldur            x0, [fp, #-0x10]
    // 0x288804: ldur            x2, [fp, #-8]
    // 0x288808: StoreField: r2->field_33 = r0
    //     0x288808: stur            w0, [x2, #0x33]
    //     0x28880c: ldurb           w16, [x2, #-1]
    //     0x288810: ldurb           w17, [x0, #-1]
    //     0x288814: and             x16, x17, x16, lsr #2
    //     0x288818: tst             x16, HEAP, lsr #32
    //     0x28881c: b.eq            #0x288824
    //     0x288820: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288824: r1 = <String, int, Object?, int>
    //     0x288824: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x288828: ldr             x1, [x1, #0x368]
    // 0x28882c: r0 = PlainStow()
    //     0x28882c: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288830: mov             x1, x0
    // 0x288834: r2 = "maxFps"
    //     0x288834: add             x2, PP, #8, lsl #12  ; [pp+0x8400] "maxFps"
    //     0x288838: ldr             x2, [x2, #0x400]
    // 0x28883c: r3 = -2
    //     0x28883c: mov             x3, #-2
    // 0x288840: r5 = Null
    //     0x288840: mov             x5, NULL
    // 0x288844: stur            x0, [fp, #-0x10]
    // 0x288848: r0 = Stow()
    //     0x288848: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x28884c: ldur            x0, [fp, #-0x10]
    // 0x288850: ldur            x2, [fp, #-8]
    // 0x288854: StoreField: r2->field_37 = r0
    //     0x288854: stur            w0, [x2, #0x37]
    //     0x288858: ldurb           w16, [x2, #-1]
    //     0x28885c: ldurb           w17, [x0, #-1]
    //     0x288860: and             x16, x17, x16, lsr #2
    //     0x288864: tst             x16, HEAP, lsr #32
    //     0x288868: b.eq            #0x288870
    //     0x28886c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288870: r1 = <String, bool, Object?, bool>
    //     0x288870: add             x1, PP, #8, lsl #12  ; [pp+0x8378] TypeArguments: <String, bool, Object?, bool>
    //     0x288874: ldr             x1, [x1, #0x378]
    // 0x288878: r0 = PlainStow()
    //     0x288878: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x28887c: mov             x1, x0
    // 0x288880: r2 = "showFpsCounter"
    //     0x288880: add             x2, PP, #8, lsl #12  ; [pp+0x8408] "showFpsCounter"
    //     0x288884: ldr             x2, [x2, #0x408]
    // 0x288888: r3 = false
    //     0x288888: add             x3, NULL, #0x30  ; false
    // 0x28888c: r5 = Null
    //     0x28888c: mov             x5, NULL
    // 0x288890: stur            x0, [fp, #-0x10]
    // 0x288894: r0 = Stow()
    //     0x288894: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288898: ldur            x0, [fp, #-0x10]
    // 0x28889c: ldur            x2, [fp, #-8]
    // 0x2888a0: StoreField: r2->field_3b = r0
    //     0x2888a0: stur            w0, [x2, #0x3b]
    //     0x2888a4: ldurb           w16, [x2, #-1]
    //     0x2888a8: ldurb           w17, [x0, #-1]
    //     0x2888ac: and             x16, x17, x16, lsr #2
    //     0x2888b0: tst             x16, HEAP, lsr #32
    //     0x2888b4: b.eq            #0x2888bc
    //     0x2888b8: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x2888bc: r1 = <String, int, Object?, int>
    //     0x2888bc: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x2888c0: ldr             x1, [x1, #0x368]
    // 0x2888c4: r0 = PlainStow()
    //     0x2888c4: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x2888c8: mov             x1, x0
    // 0x2888cc: r2 = "totalCoinsGained"
    //     0x2888cc: add             x2, PP, #8, lsl #12  ; [pp+0x8410] "totalCoinsGained"
    //     0x2888d0: ldr             x2, [x2, #0x410]
    // 0x2888d4: r3 = 0
    //     0x2888d4: mov             x3, #0
    // 0x2888d8: r5 = Null
    //     0x2888d8: mov             x5, NULL
    // 0x2888dc: stur            x0, [fp, #-0x10]
    // 0x2888e0: r0 = Stow()
    //     0x2888e0: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x2888e4: ldur            x0, [fp, #-0x10]
    // 0x2888e8: ldur            x2, [fp, #-8]
    // 0x2888ec: StoreField: r2->field_3f = r0
    //     0x2888ec: stur            w0, [x2, #0x3f]
    //     0x2888f0: ldurb           w16, [x2, #-1]
    //     0x2888f4: ldurb           w17, [x0, #-1]
    //     0x2888f8: and             x16, x17, x16, lsr #2
    //     0x2888fc: tst             x16, HEAP, lsr #32
    //     0x288900: b.eq            #0x288908
    //     0x288904: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288908: r1 = <String, int, Object?, int>
    //     0x288908: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x28890c: ldr             x1, [x1, #0x368]
    // 0x288910: r0 = PlainStow()
    //     0x288910: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288914: mov             x1, x0
    // 0x288918: r2 = "totalBulletsGained"
    //     0x288918: add             x2, PP, #8, lsl #12  ; [pp+0x8418] "totalBulletsGained"
    //     0x28891c: ldr             x2, [x2, #0x418]
    // 0x288920: r3 = 0
    //     0x288920: mov             x3, #0
    // 0x288924: r5 = Null
    //     0x288924: mov             x5, NULL
    // 0x288928: stur            x0, [fp, #-0x10]
    // 0x28892c: r0 = Stow()
    //     0x28892c: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288930: ldur            x0, [fp, #-0x10]
    // 0x288934: ldur            x2, [fp, #-8]
    // 0x288938: StoreField: r2->field_43 = r0
    //     0x288938: stur            w0, [x2, #0x43]
    //     0x28893c: ldurb           w16, [x2, #-1]
    //     0x288940: ldurb           w17, [x0, #-1]
    //     0x288944: and             x16, x17, x16, lsr #2
    //     0x288948: tst             x16, HEAP, lsr #32
    //     0x28894c: b.eq            #0x288954
    //     0x288950: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288954: r1 = <String, int, Object?, int>
    //     0x288954: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x288958: ldr             x1, [x1, #0x368]
    // 0x28895c: r0 = PlainStow()
    //     0x28895c: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288960: mov             x1, x0
    // 0x288964: r2 = "totalMonstersKilled"
    //     0x288964: add             x2, PP, #8, lsl #12  ; [pp+0x8420] "totalMonstersKilled"
    //     0x288968: ldr             x2, [x2, #0x420]
    // 0x28896c: r3 = 0
    //     0x28896c: mov             x3, #0
    // 0x288970: r5 = Null
    //     0x288970: mov             x5, NULL
    // 0x288974: stur            x0, [fp, #-0x10]
    // 0x288978: r0 = Stow()
    //     0x288978: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x28897c: ldur            x0, [fp, #-0x10]
    // 0x288980: ldur            x2, [fp, #-8]
    // 0x288984: StoreField: r2->field_47 = r0
    //     0x288984: stur            w0, [x2, #0x47]
    //     0x288988: ldurb           w16, [x2, #-1]
    //     0x28898c: ldurb           w17, [x0, #-1]
    //     0x288990: and             x16, x17, x16, lsr #2
    //     0x288994: tst             x16, HEAP, lsr #32
    //     0x288998: b.eq            #0x2889a0
    //     0x28899c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x2889a0: r1 = <String, int, Object?, int>
    //     0x2889a0: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x2889a4: ldr             x1, [x1, #0x368]
    // 0x2889a8: r0 = PlainStow()
    //     0x2889a8: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x2889ac: mov             x1, x0
    // 0x2889b0: r2 = "totalGameOvers"
    //     0x2889b0: add             x2, PP, #8, lsl #12  ; [pp+0x8428] "totalGameOvers"
    //     0x2889b4: ldr             x2, [x2, #0x428]
    // 0x2889b8: r3 = 0
    //     0x2889b8: mov             x3, #0
    // 0x2889bc: r5 = Null
    //     0x2889bc: mov             x5, NULL
    // 0x2889c0: stur            x0, [fp, #-0x10]
    // 0x2889c4: r0 = Stow()
    //     0x2889c4: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x2889c8: ldur            x0, [fp, #-0x10]
    // 0x2889cc: ldur            x2, [fp, #-8]
    // 0x2889d0: StoreField: r2->field_4b = r0
    //     0x2889d0: stur            w0, [x2, #0x4b]
    //     0x2889d4: ldurb           w16, [x2, #-1]
    //     0x2889d8: ldurb           w17, [x0, #-1]
    //     0x2889dc: and             x16, x17, x16, lsr #2
    //     0x2889e0: tst             x16, HEAP, lsr #32
    //     0x2889e4: b.eq            #0x2889ec
    //     0x2889e8: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x2889ec: r1 = <String, int, Object?, int>
    //     0x2889ec: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x2889f0: ldr             x1, [x1, #0x368]
    // 0x2889f4: r0 = PlainStow()
    //     0x2889f4: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x2889f8: mov             x1, x0
    // 0x2889fc: r2 = "totalAdsWatched"
    //     0x2889fc: add             x2, PP, #8, lsl #12  ; [pp+0x8430] "totalAdsWatched"
    //     0x288a00: ldr             x2, [x2, #0x430]
    // 0x288a04: r3 = 0
    //     0x288a04: mov             x3, #0
    // 0x288a08: r5 = Null
    //     0x288a08: mov             x5, NULL
    // 0x288a0c: r0 = Stow()
    //     0x288a0c: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288a10: r1 = <String, int, Object?, int>
    //     0x288a10: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x288a14: ldr             x1, [x1, #0x368]
    // 0x288a18: r0 = PlainStow()
    //     0x288a18: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288a1c: mov             x1, x0
    // 0x288a20: r2 = "totalTimesContinued"
    //     0x288a20: add             x2, PP, #8, lsl #12  ; [pp+0x8438] "totalTimesContinued"
    //     0x288a24: ldr             x2, [x2, #0x438]
    // 0x288a28: r3 = 0
    //     0x288a28: mov             x3, #0
    // 0x288a2c: r5 = Null
    //     0x288a2c: mov             x5, NULL
    // 0x288a30: stur            x0, [fp, #-0x10]
    // 0x288a34: r0 = Stow()
    //     0x288a34: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288a38: ldur            x0, [fp, #-0x10]
    // 0x288a3c: ldur            x2, [fp, #-8]
    // 0x288a40: StoreField: r2->field_4f = r0
    //     0x288a40: stur            w0, [x2, #0x4f]
    //     0x288a44: ldurb           w16, [x2, #-1]
    //     0x288a48: ldurb           w17, [x0, #-1]
    //     0x288a4c: and             x16, x17, x16, lsr #2
    //     0x288a50: tst             x16, HEAP, lsr #32
    //     0x288a54: b.eq            #0x288a5c
    //     0x288a58: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x288a5c: r1 = <String, int, Object?, int>
    //     0x288a5c: add             x1, PP, #8, lsl #12  ; [pp+0x8368] TypeArguments: <String, int, Object?, int>
    //     0x288a60: ldr             x1, [x1, #0x368]
    // 0x288a64: r0 = PlainStow()
    //     0x288a64: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x288a68: mov             x1, x0
    // 0x288a6c: r2 = "totalTimesUndone"
    //     0x288a6c: add             x2, PP, #8, lsl #12  ; [pp+0x8440] "totalTimesUndone"
    //     0x288a70: ldr             x2, [x2, #0x440]
    // 0x288a74: r3 = 0
    //     0x288a74: mov             x3, #0
    // 0x288a78: r5 = Null
    //     0x288a78: mov             x5, NULL
    // 0x288a7c: stur            x0, [fp, #-0x10]
    // 0x288a80: r0 = Stow()
    //     0x288a80: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x288a84: ldur            x0, [fp, #-0x10]
    // 0x288a88: ldur            x1, [fp, #-8]
    // 0x288a8c: StoreField: r1->field_53 = r0
    //     0x288a8c: stur            w0, [x1, #0x53]
    //     0x288a90: ldurb           w16, [x1, #-1]
    //     0x288a94: ldurb           w17, [x0, #-1]
    //     0x288a98: and             x16, x17, x16, lsr #2
    //     0x288a9c: tst             x16, HEAP, lsr #32
    //     0x288aa0: b.eq            #0x288aa8
    //     0x288aa4: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x288aa8: r0 = Null
    //     0x288aa8: mov             x0, NULL
    // 0x288aac: LeaveFrame
    //     0x288aac: mov             SP, fp
    //     0x288ab0: ldp             fp, lr, [SP], #0x10
    // 0x288ab4: ret
    //     0x288ab4: ret             
    // 0x288ab8: r0 = noElement()
    //     0x288ab8: bl              #0x2390a8  ; [dart:_internal] IterableElementError::noElement
    // 0x288abc: r0 = Throw()
    //     0x288abc: bl              #0x5827dc  ; ThrowStub
    // 0x288ac0: brk             #0
    // 0x288ac4: r0 = noElement()
    //     0x288ac4: bl              #0x2390a8  ; [dart:_internal] IterableElementError::noElement
    // 0x288ac8: r0 = Throw()
    //     0x288ac8: bl              #0x5827dc  ; ThrowStub
    // 0x288acc: brk             #0
    // 0x288ad0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x288ad0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x288ad4: b               #0x2883c8
    // 0x288ad8: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x288ad8: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x288adc: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x288adc: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] GameData <anonymous closure>(dynamic, Object) {
    // ** addr: 0x28cc58, size: 0x60
    // 0x28cc58: EnterFrame
    //     0x28cc58: stp             fp, lr, [SP, #-0x10]!
    //     0x28cc5c: mov             fp, SP
    // 0x28cc60: AllocStack(0x8)
    //     0x28cc60: sub             SP, SP, #8
    // 0x28cc64: CheckStackOverflow
    //     0x28cc64: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28cc68: cmp             SP, x16
    //     0x28cc6c: b.ls            #0x28ccb0
    // 0x28cc70: ldr             x0, [fp, #0x10]
    // 0x28cc74: r2 = Null
    //     0x28cc74: mov             x2, NULL
    // 0x28cc78: r1 = Null
    //     0x28cc78: mov             x1, NULL
    // 0x28cc7c: r8 = Map<String, dynamic>
    //     0x28cc7c: ldr             x8, [PP, #0x4a98]  ; [pp+0x4a98] Type: Map<String, dynamic>
    // 0x28cc80: r3 = Null
    //     0x28cc80: add             x3, PP, #8, lsl #12  ; [pp+0x8448] Null
    //     0x28cc84: ldr             x3, [x3, #0x448]
    // 0x28cc88: r0 = Map<String, dynamic>()
    //     0x28cc88: bl              #0x284f98  ; IsType_Map<String, dynamic>_Stub
    // 0x28cc8c: r0 = GameData()
    //     0x28cc8c: bl              #0x28ce4c  ; AllocateGameDataStub -> GameData (size=0x14)
    // 0x28cc90: mov             x1, x0
    // 0x28cc94: ldr             x2, [fp, #0x10]
    // 0x28cc98: stur            x0, [fp, #-8]
    // 0x28cc9c: r0 = GameData.fromJson()
    //     0x28cc9c: bl              #0x28ccb8  ; [package:ricochlime/flame/game_data.dart] GameData::GameData.fromJson
    // 0x28cca0: ldur            x0, [fp, #-8]
    // 0x28cca4: LeaveFrame
    //     0x28cca4: mov             SP, fp
    //     0x28cca8: ldp             fp, lr, [SP], #0x10
    // 0x28ccac: ret
    //     0x28ccac: ret             
    // 0x28ccb0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28ccb0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28ccb4: b               #0x28cc70
  }
  _ addCoins(/* No info */) {
    // ** addr: 0x3776c4, size: 0x1d0
    // 0x3776c4: EnterFrame
    //     0x3776c4: stp             fp, lr, [SP, #-0x10]!
    //     0x3776c8: mov             fp, SP
    // 0x3776cc: AllocStack(0x20)
    //     0x3776cc: sub             SP, SP, #0x20
    // 0x3776d0: SetupParameters(Stows this /* r1 => r0, fp-0x10 */)
    //     0x3776d0: mov             x0, x1
    //     0x3776d4: stur            x1, [fp, #-0x10]
    // 0x3776d8: CheckStackOverflow
    //     0x3776d8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3776dc: cmp             SP, x16
    //     0x3776e0: b.ls            #0x37788c
    // 0x3776e4: LoadField: r2 = r0->field_2b
    //     0x3776e4: ldur            w2, [x0, #0x2b]
    // 0x3776e8: DecompressPointer r2
    //     0x3776e8: add             x2, x2, HEAP, lsl #32
    // 0x3776ec: mov             x1, x2
    // 0x3776f0: stur            x2, [fp, #-8]
    // 0x3776f4: LoadField: r0 = r1->field_43
    //     0x3776f4: ldur            w0, [x1, #0x43]
    // 0x3776f8: DecompressPointer r0
    //     0x3776f8: add             x0, x0, HEAP, lsl #32
    // 0x3776fc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x377700: cmp             w0, w16
    // 0x377704: b.ne            #0x377714
    // 0x377708: r2 = _value
    //     0x377708: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x37770c: ldr             x2, [x2, #0x4b0]
    // 0x377710: r0 = InitLateInstanceField()
    //     0x377710: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x377714: r1 = LoadInt32Instr(r0)
    //     0x377714: sbfx            x1, x0, #1, #0x1f
    //     0x377718: tbz             w0, #0, #0x377720
    //     0x37771c: ldur            x1, [x0, #7]
    // 0x377720: r17 = 100000
    //     0x377720: mov             x17, #0x86a0
    //     0x377724: movk            x17, #1, lsl #16
    // 0x377728: cmp             x1, x17
    // 0x37772c: b.gt            #0x37787c
    // 0x377730: r1 = LoadInt32Instr(r0)
    //     0x377730: sbfx            x1, x0, #1, #0x1f
    //     0x377734: tbz             w0, #0, #0x37773c
    //     0x377738: ldur            x1, [x0, #7]
    // 0x37773c: add             x0, x1, #1
    // 0x377740: stur            x0, [fp, #-0x20]
    // 0x377744: r17 = 100000
    //     0x377744: mov             x17, #0x86a0
    //     0x377748: movk            x17, #1, lsl #16
    // 0x37774c: cmp             x0, x17
    // 0x377750: b.le            #0x3777f4
    // 0x377754: ldur            x1, [fp, #-0x10]
    // 0x377758: ldur            x0, [fp, #-8]
    // 0x37775c: LoadField: r2 = r1->field_3f
    //     0x37775c: ldur            w2, [x1, #0x3f]
    // 0x377760: DecompressPointer r2
    //     0x377760: add             x2, x2, HEAP, lsl #32
    // 0x377764: mov             x1, x2
    // 0x377768: stur            x2, [fp, #-0x18]
    // 0x37776c: LoadField: r0 = r1->field_43
    //     0x37776c: ldur            w0, [x1, #0x43]
    // 0x377770: DecompressPointer r0
    //     0x377770: add             x0, x0, HEAP, lsl #32
    // 0x377774: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x377778: cmp             w0, w16
    // 0x37777c: b.ne            #0x37778c
    // 0x377780: r2 = _value
    //     0x377780: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x377784: ldr             x2, [x2, #0x4b0]
    // 0x377788: r0 = InitLateInstanceField()
    //     0x377788: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x37778c: ldur            x3, [fp, #-8]
    // 0x377790: LoadField: r1 = r3->field_43
    //     0x377790: ldur            w1, [x3, #0x43]
    // 0x377794: DecompressPointer r1
    //     0x377794: add             x1, x1, HEAP, lsl #32
    // 0x377798: r2 = LoadInt32Instr(r1)
    //     0x377798: sbfx            x2, x1, #1, #0x1f
    //     0x37779c: tbz             w1, #0, #0x3777a4
    //     0x3777a0: ldur            x2, [x1, #7]
    // 0x3777a4: r1 = 100000
    //     0x3777a4: mov             x1, #0x86a0
    //     0x3777a8: movk            x1, #1, lsl #16
    // 0x3777ac: sub             x4, x1, x2
    // 0x3777b0: r1 = LoadInt32Instr(r0)
    //     0x3777b0: sbfx            x1, x0, #1, #0x1f
    //     0x3777b4: tbz             w0, #0, #0x3777bc
    //     0x3777b8: ldur            x1, [x0, #7]
    // 0x3777bc: add             x2, x1, x4
    // 0x3777c0: r0 = BoxInt64Instr(r2)
    //     0x3777c0: sbfiz           x0, x2, #1, #0x1f
    //     0x3777c4: cmp             x2, x0, asr #1
    //     0x3777c8: b.eq            #0x3777d4
    //     0x3777cc: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3777d0: stur            x2, [x0, #7]
    // 0x3777d4: ldur            x1, [fp, #-0x18]
    // 0x3777d8: mov             x2, x0
    // 0x3777dc: r0 = value=()
    //     0x3777dc: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x3777e0: ldur            x1, [fp, #-8]
    // 0x3777e4: r2 = 200000
    //     0x3777e4: mov             x2, #0xd40
    //     0x3777e8: movk            x2, #3, lsl #16
    // 0x3777ec: r0 = value=()
    //     0x3777ec: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x3777f0: b               #0x37787c
    // 0x3777f4: ldur            x1, [fp, #-0x10]
    // 0x3777f8: LoadField: r2 = r1->field_3f
    //     0x3777f8: ldur            w2, [x1, #0x3f]
    // 0x3777fc: DecompressPointer r2
    //     0x3777fc: add             x2, x2, HEAP, lsl #32
    // 0x377800: mov             x1, x2
    // 0x377804: stur            x2, [fp, #-0x18]
    // 0x377808: LoadField: r0 = r1->field_43
    //     0x377808: ldur            w0, [x1, #0x43]
    // 0x37780c: DecompressPointer r0
    //     0x37780c: add             x0, x0, HEAP, lsl #32
    // 0x377810: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x377814: cmp             w0, w16
    // 0x377818: b.ne            #0x377828
    // 0x37781c: r2 = _value
    //     0x37781c: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x377820: ldr             x2, [x2, #0x4b0]
    // 0x377824: r0 = InitLateInstanceField()
    //     0x377824: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x377828: r1 = LoadInt32Instr(r0)
    //     0x377828: sbfx            x1, x0, #1, #0x1f
    //     0x37782c: tbz             w0, #0, #0x377834
    //     0x377830: ldur            x1, [x0, #7]
    // 0x377834: add             x2, x1, #1
    // 0x377838: r0 = BoxInt64Instr(r2)
    //     0x377838: sbfiz           x0, x2, #1, #0x1f
    //     0x37783c: cmp             x2, x0, asr #1
    //     0x377840: b.eq            #0x37784c
    //     0x377844: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x377848: stur            x2, [x0, #7]
    // 0x37784c: ldur            x1, [fp, #-0x18]
    // 0x377850: mov             x2, x0
    // 0x377854: r0 = value=()
    //     0x377854: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x377858: ldur            x2, [fp, #-0x20]
    // 0x37785c: r0 = BoxInt64Instr(r2)
    //     0x37785c: sbfiz           x0, x2, #1, #0x1f
    //     0x377860: cmp             x2, x0, asr #1
    //     0x377864: b.eq            #0x377870
    //     0x377868: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x37786c: stur            x2, [x0, #7]
    // 0x377870: ldur            x1, [fp, #-8]
    // 0x377874: mov             x2, x0
    // 0x377878: r0 = value=()
    //     0x377878: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x37787c: r0 = Null
    //     0x37787c: mov             x0, NULL
    // 0x377880: LeaveFrame
    //     0x377880: mov             SP, fp
    //     0x377884: ldp             fp, lr, [SP], #0x10
    // 0x377888: ret
    //     0x377888: ret             
    // 0x37788c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37788c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x377890: b               #0x3776e4
  }
}
