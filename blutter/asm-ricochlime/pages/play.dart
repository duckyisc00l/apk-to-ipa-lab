// lib: , url: package:ricochlime/pages/play.dart

// class id: 1049326, size: 0x8
class :: {
}

// class id: 2615, size: 0x14, field offset: 0x14
class _PlayPageState extends _MixinApplication272&State&WidgetsBindingObserver {

  _ didChangeAppLifecycleState(/* No info */) {
    // ** addr: 0x28381c, size: 0x104
    // 0x28381c: EnterFrame
    //     0x28381c: stp             fp, lr, [SP, #-0x10]!
    //     0x283820: mov             fp, SP
    // 0x283824: CheckStackOverflow
    //     0x283824: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x283828: cmp             SP, x16
    //     0x28382c: b.ls            #0x283918
    // 0x283830: r16 = Instance_AppLifecycleState
    //     0x283830: ldr             x16, [PP, #0x3bc0]  ; [pp+0x3bc0] Obj!AppLifecycleState@5dc771
    // 0x283834: cmp             w2, w16
    // 0x283838: b.ne            #0x28388c
    // 0x28383c: r0 = LoadStaticField(0x860)
    //     0x28383c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x283840: ldr             x0, [x0, #0x10c0]
    // 0x283844: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x283848: cmp             w0, w16
    // 0x28384c: b.ne            #0x28385c
    // 0x283850: r2 = instance
    //     0x283850: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x283854: ldr             x2, [x2, #0x6f0]
    // 0x283858: r0 = InitLateFinalStaticField()
    //     0x283858: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28385c: mov             x1, x0
    // 0x283860: LoadField: r0 = r1->field_9f
    //     0x283860: ldur            w0, [x1, #0x9f]
    // 0x283864: DecompressPointer r0
    //     0x283864: add             x0, x0, HEAP, lsl #32
    // 0x283868: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28386c: cmp             w0, w16
    // 0x283870: b.ne            #0x283880
    // 0x283874: r2 = audio
    //     0x283874: add             x2, PP, #0x14, lsl #12  ; [pp+0x14548] Field <RicochlimeGame.audio>: late final (offset: 0xa0)
    //     0x283878: ldr             x2, [x2, #0x548]
    // 0x28387c: r0 = InitLateFinalInstanceField()
    //     0x28387c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x283880: mov             x1, x0
    // 0x283884: r0 = playBgm()
    //     0x283884: bl              #0x28ce64  ; [package:ricochlime/utils/ricochlime_audio.dart] RicochlimeAudio::playBgm
    // 0x283888: b               #0x283908
    // 0x28388c: r16 = Instance_AppLifecycleState
    //     0x28388c: ldr             x16, [PP, #0x4998]  ; [pp+0x4998] Obj!AppLifecycleState@5dc751
    // 0x283890: cmp             w2, w16
    // 0x283894: b.eq            #0x2838bc
    // 0x283898: r16 = Instance_AppLifecycleState
    //     0x283898: ldr             x16, [PP, #0x49f8]  ; [pp+0x49f8] Obj!AppLifecycleState@5dc731
    // 0x28389c: cmp             w2, w16
    // 0x2838a0: b.eq            #0x2838bc
    // 0x2838a4: r16 = Instance_AppLifecycleState
    //     0x2838a4: ldr             x16, [PP, #0x4a08]  ; [pp+0x4a08] Obj!AppLifecycleState@5dc711
    // 0x2838a8: cmp             w2, w16
    // 0x2838ac: b.eq            #0x2838bc
    // 0x2838b0: r16 = Instance_AppLifecycleState
    //     0x2838b0: ldr             x16, [PP, #0x4a18]  ; [pp+0x4a18] Obj!AppLifecycleState@5dc6f1
    // 0x2838b4: cmp             w2, w16
    // 0x2838b8: b.ne            #0x283908
    // 0x2838bc: r0 = LoadStaticField(0x860)
    //     0x2838bc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x2838c0: ldr             x0, [x0, #0x10c0]
    // 0x2838c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x2838c8: cmp             w0, w16
    // 0x2838cc: b.ne            #0x2838dc
    // 0x2838d0: r2 = instance
    //     0x2838d0: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x2838d4: ldr             x2, [x2, #0x6f0]
    // 0x2838d8: r0 = InitLateFinalStaticField()
    //     0x2838d8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x2838dc: mov             x1, x0
    // 0x2838e0: LoadField: r0 = r1->field_9f
    //     0x2838e0: ldur            w0, [x1, #0x9f]
    // 0x2838e4: DecompressPointer r0
    //     0x2838e4: add             x0, x0, HEAP, lsl #32
    // 0x2838e8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x2838ec: cmp             w0, w16
    // 0x2838f0: b.ne            #0x283900
    // 0x2838f4: r2 = audio
    //     0x2838f4: add             x2, PP, #0x14, lsl #12  ; [pp+0x14548] Field <RicochlimeGame.audio>: late final (offset: 0xa0)
    //     0x2838f8: ldr             x2, [x2, #0x548]
    // 0x2838fc: r0 = InitLateFinalInstanceField()
    //     0x2838fc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x283900: mov             x1, x0
    // 0x283904: r0 = pauseBgm()
    //     0x283904: bl              #0x283940  ; [package:ricochlime/utils/ricochlime_audio.dart] RicochlimeAudio::pauseBgm
    // 0x283908: r0 = Null
    //     0x283908: mov             x0, NULL
    // 0x28390c: LeaveFrame
    //     0x28390c: mov             SP, fp
    //     0x283910: ldp             fp, lr, [SP], #0x10
    // 0x283914: ret
    //     0x283914: ret             
    // 0x283918: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x283918: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28391c: b               #0x283830
  }
  _ build(/* No info */) {
    // ** addr: 0x36fcd0, size: 0x1050
    // 0x36fcd0: EnterFrame
    //     0x36fcd0: stp             fp, lr, [SP, #-0x10]!
    //     0x36fcd4: mov             fp, SP
    // 0x36fcd8: AllocStack(0xd0)
    //     0x36fcd8: sub             SP, SP, #0xd0
    // 0x36fcdc: SetupParameters(_PlayPageState this /* r1 => r0, fp-0x8 */, dynamic _ /* r2 => r1, fp-0x10 */)
    //     0x36fcdc: mov             x0, x1
    //     0x36fce0: stur            x1, [fp, #-8]
    //     0x36fce4: mov             x1, x2
    //     0x36fce8: stur            x2, [fp, #-0x10]
    // 0x36fcec: CheckStackOverflow
    //     0x36fcec: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x36fcf0: cmp             SP, x16
    //     0x36fcf4: b.ls            #0x370ce8
    // 0x36fcf8: r1 = 1
    //     0x36fcf8: mov             x1, #1
    // 0x36fcfc: r0 = AllocateContext()
    //     0x36fcfc: bl              #0x5834e8  ; AllocateContextStub
    // 0x36fd00: ldur            x1, [fp, #-0x10]
    // 0x36fd04: stur            x0, [fp, #-0x18]
    // 0x36fd08: StoreField: r0->field_f = r1
    //     0x36fd08: stur            w1, [x0, #0xf]
    // 0x36fd0c: r0 = maybeOf()
    //     0x36fd0c: bl              #0x338c84  ; [package:flutter/src/widgets/basic.dart] Directionality::maybeOf
    // 0x36fd10: cmp             w0, NULL
    // 0x36fd14: b.ne            #0x36fd1c
    // 0x36fd18: r0 = Instance_TextDirection
    //     0x36fd18: ldr             x0, [PP, #0x4090]  ; [pp+0x4090] Obj!TextDirection@5dbeb1
    // 0x36fd1c: ldur            x2, [fp, #-0x18]
    // 0x36fd20: stur            x0, [fp, #-0x10]
    // 0x36fd24: LoadField: r1 = r2->field_f
    //     0x36fd24: ldur            w1, [x2, #0xf]
    // 0x36fd28: DecompressPointer r1
    //     0x36fd28: add             x1, x1, HEAP, lsl #32
    // 0x36fd2c: r0 = of()
    //     0x36fd2c: bl              #0x31bb3c  ; [package:flutter/src/material/theme.dart] Theme::of
    // 0x36fd30: LoadField: r2 = r0->field_3f
    //     0x36fd30: ldur            w2, [x0, #0x3f]
    // 0x36fd34: DecompressPointer r2
    //     0x36fd34: add             x2, x2, HEAP, lsl #32
    // 0x36fd38: ldur            x0, [fp, #-0x18]
    // 0x36fd3c: stur            x2, [fp, #-0x20]
    // 0x36fd40: LoadField: r1 = r0->field_f
    //     0x36fd40: ldur            w1, [x0, #0xf]
    // 0x36fd44: DecompressPointer r1
    //     0x36fd44: add             x1, x1, HEAP, lsl #32
    // 0x36fd48: r0 = sizeOf()
    //     0x36fd48: bl              #0x332910  ; [package:flutter/src/widgets/media_query.dart] MediaQuery::sizeOf
    // 0x36fd4c: stur            x0, [fp, #-0x28]
    // 0x36fd50: r0 = LoadStaticField(0x86c)
    //     0x36fd50: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x36fd54: ldr             x0, [x0, #0x10d8]
    // 0x36fd58: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36fd5c: cmp             w0, w16
    // 0x36fd60: b.ne            #0x36fd70
    // 0x36fd64: r2 = isDarkMode
    //     0x36fd64: add             x2, PP, #0x14, lsl #12  ; [pp+0x14380] Field <RicochlimeGame.isDarkMode>: static late final (offset: 0x86c)
    //     0x36fd68: ldr             x2, [x2, #0x380]
    // 0x36fd6c: r0 = InitLateFinalStaticField()
    //     0x36fd6c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x36fd70: LoadField: r1 = r0->field_27
    //     0x36fd70: ldur            w1, [x0, #0x27]
    // 0x36fd74: DecompressPointer r1
    //     0x36fd74: add             x1, x1, HEAP, lsl #32
    // 0x36fd78: tbnz            w1, #4, #0x36fd88
    // 0x36fd7c: r2 = Instance_Color
    //     0x36fd7c: add             x2, PP, #9, lsl #12  ; [pp+0x9130] Obj!Color@5cf7f1
    //     0x36fd80: ldr             x2, [x2, #0x130]
    // 0x36fd84: b               #0x36fd90
    // 0x36fd88: r2 = Instance_Color
    //     0x36fd88: add             x2, PP, #8, lsl #12  ; [pp+0x8d18] Obj!Color@5ce4d1
    //     0x36fd8c: ldr             x2, [x2, #0xd18]
    // 0x36fd90: ldur            x0, [fp, #-0x20]
    // 0x36fd94: stur            x2, [fp, #-0x48]
    // 0x36fd98: LoadField: r3 = r0->field_7
    //     0x36fd98: ldur            w3, [x0, #7]
    // 0x36fd9c: DecompressPointer r3
    //     0x36fd9c: add             x3, x3, HEAP, lsl #32
    // 0x36fda0: stur            x3, [fp, #-0x40]
    // 0x36fda4: r16 = Instance_Brightness
    //     0x36fda4: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x36fda8: cmp             w3, w16
    // 0x36fdac: b.ne            #0x36fdb8
    // 0x36fdb0: r0 = Instance_Brightness
    //     0x36fdb0: ldr             x0, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x36fdb4: b               #0x36fdbc
    // 0x36fdb8: r0 = Instance_Brightness
    //     0x36fdb8: ldr             x0, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x36fdbc: stur            x0, [fp, #-0x38]
    // 0x36fdc0: tbnz            w1, #4, #0x36fdd0
    // 0x36fdc4: r1 = Instance_Color
    //     0x36fdc4: add             x1, PP, #9, lsl #12  ; [pp+0x9130] Obj!Color@5cf7f1
    //     0x36fdc8: ldr             x1, [x1, #0x130]
    // 0x36fdcc: b               #0x36fdd8
    // 0x36fdd0: r1 = Instance_Color
    //     0x36fdd0: add             x1, PP, #8, lsl #12  ; [pp+0x8d18] Obj!Color@5ce4d1
    //     0x36fdd4: ldr             x1, [x1, #0xd18]
    // 0x36fdd8: stur            x1, [fp, #-0x30]
    // 0x36fddc: r16 = Instance_Brightness
    //     0x36fddc: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x36fde0: cmp             w3, w16
    // 0x36fde4: b.ne            #0x36fdf0
    // 0x36fde8: r4 = Instance_Brightness
    //     0x36fde8: ldr             x4, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x36fdec: b               #0x36fdf4
    // 0x36fdf0: r4 = Instance_Brightness
    //     0x36fdf0: ldr             x4, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x36fdf4: stur            x4, [fp, #-0x20]
    // 0x36fdf8: r0 = SystemUiOverlayStyle()
    //     0x36fdf8: bl              #0x371638  ; AllocateSystemUiOverlayStyleStub -> SystemUiOverlayStyle (size=0x28)
    // 0x36fdfc: mov             x1, x0
    // 0x36fe00: ldur            x0, [fp, #-0x30]
    // 0x36fe04: stur            x1, [fp, #-0x50]
    // 0x36fe08: StoreField: r1->field_7 = r0
    //     0x36fe08: stur            w0, [x1, #7]
    // 0x36fe0c: ldur            x0, [fp, #-0x20]
    // 0x36fe10: StoreField: r1->field_f = r0
    //     0x36fe10: stur            w0, [x1, #0xf]
    // 0x36fe14: r0 = Instance_Color
    //     0x36fe14: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb28] Obj!Color@5ce711
    //     0x36fe18: ldr             x0, [x0, #0xb28]
    // 0x36fe1c: ArrayStore: r1[0] = r0  ; List_4
    //     0x36fe1c: stur            w0, [x1, #0x17]
    // 0x36fe20: ldur            x0, [fp, #-0x40]
    // 0x36fe24: StoreField: r1->field_1b = r0
    //     0x36fe24: stur            w0, [x1, #0x1b]
    // 0x36fe28: ldur            x0, [fp, #-0x38]
    // 0x36fe2c: StoreField: r1->field_1f = r0
    //     0x36fe2c: stur            w0, [x1, #0x1f]
    // 0x36fe30: r0 = LoadStaticField(0xccc)
    //     0x36fe30: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x36fe34: ldr             x0, [x0, #0x1998]
    // 0x36fe38: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36fe3c: cmp             w0, w16
    // 0x36fe40: b.ne            #0x36fe50
    // 0x36fe44: r2 = stows
    //     0x36fe44: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x36fe48: ldr             x2, [x2, #0x310]
    // 0x36fe4c: r0 = InitLateFinalStaticField()
    //     0x36fe4c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x36fe50: stur            x0, [fp, #-0x30]
    // 0x36fe54: LoadField: r2 = r0->field_3b
    //     0x36fe54: ldur            w2, [x0, #0x3b]
    // 0x36fe58: DecompressPointer r2
    //     0x36fe58: add             x2, x2, HEAP, lsl #32
    // 0x36fe5c: mov             x1, x2
    // 0x36fe60: stur            x2, [fp, #-0x20]
    // 0x36fe64: LoadField: r0 = r1->field_43
    //     0x36fe64: ldur            w0, [x1, #0x43]
    // 0x36fe68: DecompressPointer r0
    //     0x36fe68: add             x0, x0, HEAP, lsl #32
    // 0x36fe6c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36fe70: cmp             w0, w16
    // 0x36fe74: b.ne            #0x36fe84
    // 0x36fe78: r2 = _value
    //     0x36fe78: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x36fe7c: ldr             x2, [x2, #0x4b0]
    // 0x36fe80: r0 = InitLateInstanceField()
    //     0x36fe80: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x36fe84: tbnz            w0, #4, #0x36fe94
    // 0x36fe88: d1 = 88.000000
    //     0x36fe88: add             x17, PP, #0xb, lsl #12  ; [pp+0xb3b0] IMM: double(88) from 0x4056000000000000
    //     0x36fe8c: ldr             d1, [x17, #0x3b0]
    // 0x36fe90: b               #0x36fe98
    // 0x36fe94: d1 = 0.000000
    //     0x36fe94: eor             v1.16b, v1.16b, v1.16b
    // 0x36fe98: d0 = 80.000000
    //     0x36fe98: add             x17, PP, #0xb, lsl #12  ; [pp+0xbc18] IMM: double(80) from 0x4054000000000000
    //     0x36fe9c: ldr             d0, [x17, #0xc18]
    // 0x36fea0: fadd            d2, d1, d0
    // 0x36fea4: stur            d2, [fp, #-0x90]
    // 0x36fea8: r0 = LoadStaticField(0xc74)
    //     0x36fea8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x36feac: ldr             x0, [x0, #0x18e8]
    // 0x36feb0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36feb4: cmp             w0, w16
    // 0x36feb8: b.ne            #0x36fec8
    // 0x36febc: r2 = NesIcons
    //     0x36febc: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x36fec0: ldr             x2, [x2, #0xf70]
    // 0x36fec4: r0 = InitLateFinalStaticField()
    //     0x36fec4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x36fec8: mov             x1, x0
    // 0x36fecc: stur            x0, [fp, #-0x38]
    // 0x36fed0: LoadField: r0 = r1->field_f
    //     0x36fed0: ldur            w0, [x1, #0xf]
    // 0x36fed4: DecompressPointer r0
    //     0x36fed4: add             x0, x0, HEAP, lsl #32
    // 0x36fed8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36fedc: cmp             w0, w16
    // 0x36fee0: b.ne            #0x36fef0
    // 0x36fee4: r2 = leftArrowIndicator
    //     0x36fee4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11368] Field <NesIconCollection.leftArrowIndicator>: late final (offset: 0x10)
    //     0x36fee8: ldr             x2, [x2, #0x368]
    // 0x36feec: r0 = InitLateFinalInstanceField()
    //     0x36feec: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x36fef0: stur            x0, [fp, #-0x40]
    // 0x36fef4: r16 = 0.900000
    //     0x36fef4: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x36fef8: ldr             x16, [x16, #0x30]
    // 0x36fefc: str             x16, [SP]
    // 0x36ff00: r1 = Instance_Color
    //     0x36ff00: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x36ff04: ldr             x1, [x1, #0x710]
    // 0x36ff08: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x36ff08: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x36ff0c: ldr             x4, [x4, #0x1f0]
    // 0x36ff10: r0 = withValues()
    //     0x36ff10: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x36ff14: stur            x0, [fp, #-0x58]
    // 0x36ff18: r16 = 0.900000
    //     0x36ff18: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x36ff1c: ldr             x16, [x16, #0x30]
    // 0x36ff20: str             x16, [SP]
    // 0x36ff24: r1 = Instance_Color
    //     0x36ff24: add             x1, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x36ff28: ldr             x1, [x1, #0x140]
    // 0x36ff2c: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x36ff2c: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x36ff30: ldr             x4, [x4, #0x1f0]
    // 0x36ff34: r0 = withValues()
    //     0x36ff34: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x36ff38: stur            x0, [fp, #-0x60]
    // 0x36ff3c: r0 = NesIconButton()
    //     0x36ff3c: bl              #0x37162c  ; AllocateNesIconButtonStub -> NesIconButton (size=0x3c)
    // 0x36ff40: mov             x3, x0
    // 0x36ff44: ldur            x0, [fp, #-0x40]
    // 0x36ff48: stur            x3, [fp, #-0x68]
    // 0x36ff4c: StoreField: r3->field_b = r0
    //     0x36ff4c: stur            w0, [x3, #0xb]
    // 0x36ff50: ldur            x2, [fp, #-0x18]
    // 0x36ff54: r1 = Function '<anonymous closure>':.
    //     0x36ff54: add             x1, PP, #0x14, lsl #12  ; [pp+0x14388] AnonymousClosure: (0x380094), in [package:nes_ui/src/widgets/dialogs/nes_dialog.dart] NesDialog::build (0x3fdcd8)
    //     0x36ff58: ldr             x1, [x1, #0x388]
    // 0x36ff5c: r0 = AllocateClosure()
    //     0x36ff5c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x36ff60: mov             x1, x0
    // 0x36ff64: ldur            x0, [fp, #-0x68]
    // 0x36ff68: StoreField: r0->field_f = r1
    //     0x36ff68: stur            w1, [x0, #0xf]
    // 0x36ff6c: r1 = Instance_Size
    //     0x36ff6c: add             x1, PP, #0x14, lsl #12  ; [pp+0x14390] Obj!Size@5d0101
    //     0x36ff70: ldr             x1, [x1, #0x390]
    // 0x36ff74: StoreField: r0->field_2f = r1
    //     0x36ff74: stur            w1, [x0, #0x2f]
    // 0x36ff78: ldur            x2, [fp, #-0x58]
    // 0x36ff7c: StoreField: r0->field_27 = r2
    //     0x36ff7c: stur            w2, [x0, #0x27]
    // 0x36ff80: ldur            x2, [fp, #-0x60]
    // 0x36ff84: StoreField: r0->field_2b = r2
    //     0x36ff84: stur            w2, [x0, #0x2b]
    // 0x36ff88: r0 = LoadStaticField(0x468)
    //     0x36ff88: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x36ff8c: ldr             x0, [x0, #0x8d0]
    // 0x36ff90: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36ff94: cmp             w0, w16
    // 0x36ff98: b.ne            #0x36ffa4
    // 0x36ff9c: r2 = instance
    //     0x36ff9c: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x36ffa0: r0 = InitLateFinalStaticField()
    //     0x36ffa0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x36ffa4: stur            x0, [fp, #-0x40]
    // 0x36ffa8: r16 = <AppLocale, Translations>
    //     0x36ffa8: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x36ffac: stp             x0, x16, [SP]
    // 0x36ffb0: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x36ffb0: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x36ffb4: r0 = LocaleSettingsExt.currentTranslations()
    //     0x36ffb4: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x36ffb8: r1 = LoadClassIdInstr(r0)
    //     0x36ffb8: ldur            x1, [x0, #-1]
    //     0x36ffbc: ubfx            x1, x1, #0xc, #0x14
    // 0x36ffc0: cmp             x1, #0x8dd
    // 0x36ffc4: b.ne            #0x36fff0
    // 0x36ffc8: mov             x1, x0
    // 0x36ffcc: LoadField: r0 = r1->field_1f
    //     0x36ffcc: ldur            w0, [x1, #0x1f]
    // 0x36ffd0: DecompressPointer r0
    //     0x36ffd0: add             x0, x0, HEAP, lsl #32
    // 0x36ffd4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36ffd8: cmp             w0, w16
    // 0x36ffdc: b.ne            #0x36ffec
    // 0x36ffe0: r2 = restartGameDialog
    //     0x36ffe0: add             x2, PP, #0x14, lsl #12  ; [pp+0x14398] Field <Translations.restartGameDialog>: late final (offset: 0x20)
    //     0x36ffe4: ldr             x2, [x2, #0x398]
    // 0x36ffe8: r0 = InitLateFinalInstanceField()
    //     0x36ffe8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x36ffec: b               #0x370074
    // 0x36fff0: cmp             x1, #0x8df
    // 0x36fff4: b.ne            #0x370020
    // 0x36fff8: mov             x1, x0
    // 0x36fffc: LoadField: r0 = r1->field_43
    //     0x36fffc: ldur            w0, [x1, #0x43]
    // 0x370000: DecompressPointer r0
    //     0x370000: add             x0, x0, HEAP, lsl #32
    // 0x370004: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370008: cmp             w0, w16
    // 0x37000c: b.ne            #0x37001c
    // 0x370010: r2 = restartGameDialog
    //     0x370010: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a0] Field <TranslationsRu.restartGameDialog>: late final (offset: 0x44)
    //     0x370014: ldr             x2, [x2, #0x3a0]
    // 0x370018: r0 = InitLateFinalInstanceField()
    //     0x370018: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37001c: b               #0x370074
    // 0x370020: cmp             x1, #0x8e0
    // 0x370024: b.ne            #0x370050
    // 0x370028: mov             x1, x0
    // 0x37002c: LoadField: r0 = r1->field_43
    //     0x37002c: ldur            w0, [x1, #0x43]
    // 0x370030: DecompressPointer r0
    //     0x370030: add             x0, x0, HEAP, lsl #32
    // 0x370034: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370038: cmp             w0, w16
    // 0x37003c: b.ne            #0x37004c
    // 0x370040: r2 = restartGameDialog
    //     0x370040: add             x2, PP, #0x14, lsl #12  ; [pp+0x143a8] Field <TranslationsKk.restartGameDialog>: late final (offset: 0x44)
    //     0x370044: ldr             x2, [x2, #0x3a8]
    // 0x370048: r0 = InitLateFinalInstanceField()
    //     0x370048: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37004c: b               #0x370074
    // 0x370050: mov             x1, x0
    // 0x370054: LoadField: r0 = r1->field_43
    //     0x370054: ldur            w0, [x1, #0x43]
    // 0x370058: DecompressPointer r0
    //     0x370058: add             x0, x0, HEAP, lsl #32
    // 0x37005c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370060: cmp             w0, w16
    // 0x370064: b.ne            #0x370074
    // 0x370068: r2 = restartGameDialog
    //     0x370068: add             x2, PP, #0x14, lsl #12  ; [pp+0x143b0] Field <TranslationsEs.restartGameDialog>: late final (offset: 0x44)
    //     0x37006c: ldr             x2, [x2, #0x3b0]
    // 0x370070: r0 = InitLateFinalInstanceField()
    //     0x370070: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x370074: r1 = LoadClassIdInstr(r0)
    //     0x370074: ldur            x1, [x0, #-1]
    //     0x370078: ubfx            x1, x1, #0xc, #0x14
    // 0x37007c: cmp             x1, #0xec
    // 0x370080: b.ne            #0x370090
    // 0x370084: r2 = "Restart game\?"
    //     0x370084: add             x2, PP, #0x14, lsl #12  ; [pp+0x143b8] "Restart game\?"
    //     0x370088: ldr             x2, [x2, #0x3b8]
    // 0x37008c: b               #0x3700c0
    // 0x370090: cmp             x1, #0xed
    // 0x370094: b.ne            #0x3700a4
    // 0x370098: r2 = "Перезапустить игру\?"
    //     0x370098: add             x2, PP, #0x14, lsl #12  ; [pp+0x143c0] "Перезапустить игру\?"
    //     0x37009c: ldr             x2, [x2, #0x3c0]
    // 0x3700a0: b               #0x3700c0
    // 0x3700a4: cmp             x1, #0xee
    // 0x3700a8: b.ne            #0x3700b8
    // 0x3700ac: r2 = "Ойынды қайта бастау керек пе\?"
    //     0x3700ac: add             x2, PP, #0x14, lsl #12  ; [pp+0x143c8] "Ойынды қайта бастау керек пе\?"
    //     0x3700b0: ldr             x2, [x2, #0x3c8]
    // 0x3700b4: b               #0x3700c0
    // 0x3700b8: r2 = "¿Reinicia el juego\?"
    //     0x3700b8: add             x2, PP, #0x14, lsl #12  ; [pp+0x143d0] "¿Reinicia el juego\?"
    //     0x3700bc: ldr             x2, [x2, #0x3d0]
    // 0x3700c0: ldur            x0, [fp, #-0x10]
    // 0x3700c4: stur            x2, [fp, #-0x58]
    // 0x3700c8: LoadField: r1 = r0->field_7
    //     0x3700c8: ldur            x1, [x0, #7]
    // 0x3700cc: cmp             x1, #0
    // 0x3700d0: b.gt            #0x3700e0
    // 0x3700d4: r4 = Instance_NesTooltipArrowPlacement
    //     0x3700d4: add             x4, PP, #0x14, lsl #12  ; [pp+0x143d8] Obj!NesTooltipArrowPlacement@5d8d91
    //     0x3700d8: ldr             x4, [x4, #0x3d8]
    // 0x3700dc: b               #0x3700e8
    // 0x3700e0: r4 = Instance_NesTooltipArrowPlacement
    //     0x3700e0: add             x4, PP, #0x14, lsl #12  ; [pp+0x143e0] Obj!NesTooltipArrowPlacement@5d8d71
    //     0x3700e4: ldr             x4, [x4, #0x3e0]
    // 0x3700e8: ldur            x3, [fp, #-0x20]
    // 0x3700ec: ldur            x0, [fp, #-0x68]
    // 0x3700f0: ldur            x1, [fp, #-0x38]
    // 0x3700f4: stur            x4, [fp, #-0x10]
    // 0x3700f8: LoadField: r0 = r1->field_1b
    //     0x3700f8: ldur            w0, [x1, #0x1b]
    // 0x3700fc: DecompressPointer r0
    //     0x3700fc: add             x0, x0, HEAP, lsl #32
    // 0x370100: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370104: cmp             w0, w16
    // 0x370108: b.ne            #0x370118
    // 0x37010c: r2 = redo
    //     0x37010c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11338] Field <NesIconCollection.redo>: late final (offset: 0x1c)
    //     0x370110: ldr             x2, [x2, #0x338]
    // 0x370114: r0 = InitLateFinalInstanceField()
    //     0x370114: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x370118: stur            x0, [fp, #-0x60]
    // 0x37011c: r16 = 0.900000
    //     0x37011c: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x370120: ldr             x16, [x16, #0x30]
    // 0x370124: str             x16, [SP]
    // 0x370128: r1 = Instance_Color
    //     0x370128: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x37012c: ldr             x1, [x1, #0x710]
    // 0x370130: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x370130: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x370134: ldr             x4, [x4, #0x1f0]
    // 0x370138: r0 = withValues()
    //     0x370138: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x37013c: stur            x0, [fp, #-0x70]
    // 0x370140: r16 = 0.900000
    //     0x370140: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x370144: ldr             x16, [x16, #0x30]
    // 0x370148: str             x16, [SP]
    // 0x37014c: r1 = Instance_Color
    //     0x37014c: add             x1, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x370150: ldr             x1, [x1, #0x140]
    // 0x370154: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x370154: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x370158: ldr             x4, [x4, #0x1f0]
    // 0x37015c: r0 = withValues()
    //     0x37015c: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x370160: stur            x0, [fp, #-0x78]
    // 0x370164: r0 = NesIconButton()
    //     0x370164: bl              #0x37162c  ; AllocateNesIconButtonStub -> NesIconButton (size=0x3c)
    // 0x370168: mov             x3, x0
    // 0x37016c: ldur            x0, [fp, #-0x60]
    // 0x370170: stur            x3, [fp, #-0x80]
    // 0x370174: StoreField: r3->field_b = r0
    //     0x370174: stur            w0, [x3, #0xb]
    // 0x370178: ldur            x2, [fp, #-0x18]
    // 0x37017c: r1 = Function '<anonymous closure>':.
    //     0x37017c: add             x1, PP, #0x14, lsl #12  ; [pp+0x143e8] AnonymousClosure: (0x37fdd8), in [package:ricochlime/pages/play.dart] _PlayPageState::build (0x36fcd0)
    //     0x370180: ldr             x1, [x1, #0x3e8]
    // 0x370184: r0 = AllocateClosure()
    //     0x370184: bl              #0x5838bc  ; AllocateClosureStub
    // 0x370188: mov             x1, x0
    // 0x37018c: ldur            x0, [fp, #-0x80]
    // 0x370190: StoreField: r0->field_f = r1
    //     0x370190: stur            w1, [x0, #0xf]
    // 0x370194: r1 = Instance_Size
    //     0x370194: add             x1, PP, #0x14, lsl #12  ; [pp+0x14390] Obj!Size@5d0101
    //     0x370198: ldr             x1, [x1, #0x390]
    // 0x37019c: StoreField: r0->field_2f = r1
    //     0x37019c: stur            w1, [x0, #0x2f]
    // 0x3701a0: ldur            x2, [fp, #-0x70]
    // 0x3701a4: StoreField: r0->field_27 = r2
    //     0x3701a4: stur            w2, [x0, #0x27]
    // 0x3701a8: ldur            x2, [fp, #-0x78]
    // 0x3701ac: StoreField: r0->field_2b = r2
    //     0x3701ac: stur            w2, [x0, #0x2b]
    // 0x3701b0: r0 = NesTooltip()
    //     0x3701b0: bl              #0x371620  ; AllocateNesTooltipStub -> NesTooltip (size=0x1c)
    // 0x3701b4: mov             x3, x0
    // 0x3701b8: ldur            x0, [fp, #-0x80]
    // 0x3701bc: stur            x3, [fp, #-0x18]
    // 0x3701c0: StoreField: r3->field_b = r0
    //     0x3701c0: stur            w0, [x3, #0xb]
    // 0x3701c4: ldur            x0, [fp, #-0x58]
    // 0x3701c8: StoreField: r3->field_f = r0
    //     0x3701c8: stur            w0, [x3, #0xf]
    // 0x3701cc: ldur            x0, [fp, #-0x10]
    // 0x3701d0: StoreField: r3->field_13 = r0
    //     0x3701d0: stur            w0, [x3, #0x13]
    // 0x3701d4: r0 = Instance_NesTooltipArrowDirection
    //     0x3701d4: add             x0, PP, #0x14, lsl #12  ; [pp+0x143f0] Obj!NesTooltipArrowDirection@5d8d31
    //     0x3701d8: ldr             x0, [x0, #0x3f0]
    // 0x3701dc: ArrayStore: r3[0] = r0  ; List_4
    //     0x3701dc: stur            w0, [x3, #0x17]
    // 0x3701e0: r1 = Null
    //     0x3701e0: mov             x1, NULL
    // 0x3701e4: r2 = 6
    //     0x3701e4: mov             x2, #6
    // 0x3701e8: r0 = AllocateArray()
    //     0x3701e8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3701ec: stur            x0, [fp, #-0x10]
    // 0x3701f0: r16 = Instance_SizedBox
    //     0x3701f0: add             x16, PP, #0x14, lsl #12  ; [pp+0x143f8] Obj!SizedBox@5d8321
    //     0x3701f4: ldr             x16, [x16, #0x3f8]
    // 0x3701f8: StoreField: r0->field_f = r16
    //     0x3701f8: stur            w16, [x0, #0xf]
    // 0x3701fc: ldur            x1, [fp, #-0x68]
    // 0x370200: StoreField: r0->field_13 = r1
    //     0x370200: stur            w1, [x0, #0x13]
    // 0x370204: ldur            x1, [fp, #-0x18]
    // 0x370208: ArrayStore: r0[0] = r1  ; List_4
    //     0x370208: stur            w1, [x0, #0x17]
    // 0x37020c: r1 = <Widget>
    //     0x37020c: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x370210: r0 = AllocateGrowableArray()
    //     0x370210: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x370214: mov             x2, x0
    // 0x370218: ldur            x0, [fp, #-0x10]
    // 0x37021c: stur            x2, [fp, #-0x18]
    // 0x370220: StoreField: r2->field_f = r0
    //     0x370220: stur            w0, [x2, #0xf]
    // 0x370224: r0 = 6
    //     0x370224: mov             x0, #6
    // 0x370228: StoreField: r2->field_b = r0
    //     0x370228: stur            w0, [x2, #0xb]
    // 0x37022c: ldur            x0, [fp, #-0x20]
    // 0x370230: LoadField: r1 = r0->field_43
    //     0x370230: ldur            w1, [x0, #0x43]
    // 0x370234: DecompressPointer r1
    //     0x370234: add             x1, x1, HEAP, lsl #32
    // 0x370238: tbnz            w1, #4, #0x370268
    // 0x37023c: mov             x1, x2
    // 0x370240: r0 = _growToNextCapacity()
    //     0x370240: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x370244: ldur            x0, [fp, #-0x18]
    // 0x370248: r1 = 8
    //     0x370248: mov             x1, #8
    // 0x37024c: StoreField: r0->field_b = r1
    //     0x37024c: stur            w1, [x0, #0xb]
    // 0x370250: LoadField: r1 = r0->field_f
    //     0x370250: ldur            w1, [x0, #0xf]
    // 0x370254: DecompressPointer r1
    //     0x370254: add             x1, x1, HEAP, lsl #32
    // 0x370258: r16 = Instance_FpsCounter
    //     0x370258: add             x16, PP, #0x14, lsl #12  ; [pp+0x14400] Obj!FpsCounter@5d8001
    //     0x37025c: ldr             x16, [x16, #0x400]
    // 0x370260: StoreField: r1->field_1b = r16
    //     0x370260: stur            w16, [x1, #0x1b]
    // 0x370264: b               #0x37026c
    // 0x370268: mov             x0, x2
    // 0x37026c: ldur            x2, [fp, #-0x28]
    // 0x370270: ldur            d0, [fp, #-0x90]
    // 0x370274: ldur            x1, [fp, #-0x30]
    // 0x370278: r0 = Row()
    //     0x370278: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x37027c: mov             x2, x0
    // 0x370280: r0 = Instance_Axis
    //     0x370280: ldr             x0, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x370284: stur            x2, [fp, #-0x20]
    // 0x370288: StoreField: r2->field_f = r0
    //     0x370288: stur            w0, [x2, #0xf]
    // 0x37028c: r0 = Instance_MainAxisAlignment
    //     0x37028c: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x370290: ldr             x0, [x0, #0xfb0]
    // 0x370294: StoreField: r2->field_13 = r0
    //     0x370294: stur            w0, [x2, #0x13]
    // 0x370298: r3 = Instance_MainAxisSize
    //     0x370298: add             x3, PP, #0x11, lsl #12  ; [pp+0x11398] Obj!MainAxisSize@5dac31
    //     0x37029c: ldr             x3, [x3, #0x398]
    // 0x3702a0: ArrayStore: r2[0] = r3  ; List_4
    //     0x3702a0: stur            w3, [x2, #0x17]
    // 0x3702a4: r4 = Instance_CrossAxisAlignment
    //     0x3702a4: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x3702a8: ldr             x4, [x4, #0xfc0]
    // 0x3702ac: StoreField: r2->field_1b = r4
    //     0x3702ac: stur            w4, [x2, #0x1b]
    // 0x3702b0: r5 = Instance_VerticalDirection
    //     0x3702b0: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x3702b4: ldr             x5, [x5, #0xfc8]
    // 0x3702b8: StoreField: r2->field_23 = r5
    //     0x3702b8: stur            w5, [x2, #0x23]
    // 0x3702bc: r6 = Instance_Clip
    //     0x3702bc: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x3702c0: ldr             x6, [x6, #0xfd0]
    // 0x3702c4: StoreField: r2->field_2b = r6
    //     0x3702c4: stur            w6, [x2, #0x2b]
    // 0x3702c8: d0 = 16.000000
    //     0x3702c8: fmov            d0, #16.00000000
    // 0x3702cc: StoreField: r2->field_2f = d0
    //     0x3702cc: stur            d0, [x2, #0x2f]
    // 0x3702d0: ldur            x1, [fp, #-0x18]
    // 0x3702d4: StoreField: r2->field_b = r1
    //     0x3702d4: stur            w1, [x2, #0xb]
    // 0x3702d8: ldur            x7, [fp, #-0x30]
    // 0x3702dc: LoadField: r8 = r7->field_b
    //     0x3702dc: ldur            w8, [x7, #0xb]
    // 0x3702e0: DecompressPointer r8
    //     0x3702e0: add             x8, x8, HEAP, lsl #32
    // 0x3702e4: stur            x8, [fp, #-0x10]
    // 0x3702e8: r1 = <int>
    //     0x3702e8: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x3702ec: r0 = ValueListenableBuilder()
    //     0x3702ec: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x3702f0: mov             x3, x0
    // 0x3702f4: ldur            x0, [fp, #-0x10]
    // 0x3702f8: stur            x3, [fp, #-0x18]
    // 0x3702fc: StoreField: r3->field_f = r0
    //     0x3702fc: stur            w0, [x3, #0xf]
    // 0x370300: r1 = Function '<anonymous closure>':.
    //     0x370300: add             x1, PP, #0x14, lsl #12  ; [pp+0x14408] AnonymousClosure: (0x37fb58), in [package:ricochlime/pages/play.dart] _PlayPageState::build (0x36fcd0)
    //     0x370304: ldr             x1, [x1, #0x408]
    // 0x370308: r2 = Null
    //     0x370308: mov             x2, NULL
    // 0x37030c: r0 = AllocateClosure()
    //     0x37030c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x370310: mov             x1, x0
    // 0x370314: ldur            x0, [fp, #-0x18]
    // 0x370318: StoreField: r0->field_13 = r1
    //     0x370318: stur            w1, [x0, #0x13]
    // 0x37031c: r0 = LoadStaticField(0x868)
    //     0x37031c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x370320: ldr             x0, [x0, #0x10d0]
    // 0x370324: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370328: cmp             w0, w16
    // 0x37032c: b.ne            #0x37033c
    // 0x370330: r2 = score
    //     0x370330: add             x2, PP, #0xc, lsl #12  ; [pp+0xc780] Field <RicochlimeGame.score>: static late final (offset: 0x868)
    //     0x370334: ldr             x2, [x2, #0x780]
    // 0x370338: r0 = InitLateFinalStaticField()
    //     0x370338: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37033c: r1 = <int>
    //     0x37033c: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x370340: stur            x0, [fp, #-0x10]
    // 0x370344: r0 = ValueListenableBuilder()
    //     0x370344: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x370348: mov             x3, x0
    // 0x37034c: ldur            x0, [fp, #-0x10]
    // 0x370350: stur            x3, [fp, #-0x58]
    // 0x370354: StoreField: r3->field_f = r0
    //     0x370354: stur            w0, [x3, #0xf]
    // 0x370358: r1 = Function '<anonymous closure>':.
    //     0x370358: add             x1, PP, #0x14, lsl #12  ; [pp+0x14410] AnonymousClosure: (0x37faa4), in [package:ricochlime/pages/play.dart] _PlayPageState::build (0x36fcd0)
    //     0x37035c: ldr             x1, [x1, #0x410]
    // 0x370360: r2 = Null
    //     0x370360: mov             x2, NULL
    // 0x370364: r0 = AllocateClosure()
    //     0x370364: bl              #0x5838bc  ; AllocateClosureStub
    // 0x370368: mov             x1, x0
    // 0x37036c: ldur            x0, [fp, #-0x58]
    // 0x370370: StoreField: r0->field_13 = r1
    //     0x370370: stur            w1, [x0, #0x13]
    // 0x370374: r1 = Null
    //     0x370374: mov             x1, NULL
    // 0x370378: r2 = 4
    //     0x370378: mov             x2, #4
    // 0x37037c: r0 = AllocateArray()
    //     0x37037c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x370380: mov             x2, x0
    // 0x370384: ldur            x0, [fp, #-0x18]
    // 0x370388: stur            x2, [fp, #-0x10]
    // 0x37038c: StoreField: r2->field_f = r0
    //     0x37038c: stur            w0, [x2, #0xf]
    // 0x370390: ldur            x0, [fp, #-0x58]
    // 0x370394: StoreField: r2->field_13 = r0
    //     0x370394: stur            w0, [x2, #0x13]
    // 0x370398: r1 = <Widget>
    //     0x370398: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x37039c: r0 = AllocateGrowableArray()
    //     0x37039c: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3703a0: mov             x1, x0
    // 0x3703a4: ldur            x0, [fp, #-0x10]
    // 0x3703a8: stur            x1, [fp, #-0x18]
    // 0x3703ac: StoreField: r1->field_f = r0
    //     0x3703ac: stur            w0, [x1, #0xf]
    // 0x3703b0: r2 = 4
    //     0x3703b0: mov             x2, #4
    // 0x3703b4: StoreField: r1->field_b = r2
    //     0x3703b4: stur            w2, [x1, #0xb]
    // 0x3703b8: r0 = Column()
    //     0x3703b8: bl              #0x3715fc  ; AllocateColumnStub -> Column (size=0x38)
    // 0x3703bc: mov             x2, x0
    // 0x3703c0: r0 = Instance_Axis
    //     0x3703c0: ldr             x0, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x3703c4: stur            x2, [fp, #-0x10]
    // 0x3703c8: StoreField: r2->field_f = r0
    //     0x3703c8: stur            w0, [x2, #0xf]
    // 0x3703cc: r3 = Instance_MainAxisAlignment
    //     0x3703cc: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x3703d0: ldr             x3, [x3, #0xfb0]
    // 0x3703d4: StoreField: r2->field_13 = r3
    //     0x3703d4: stur            w3, [x2, #0x13]
    // 0x3703d8: r4 = Instance_MainAxisSize
    //     0x3703d8: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x3703dc: ldr             x4, [x4, #0xfb8]
    // 0x3703e0: ArrayStore: r2[0] = r4  ; List_4
    //     0x3703e0: stur            w4, [x2, #0x17]
    // 0x3703e4: r5 = Instance_CrossAxisAlignment
    //     0x3703e4: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x3703e8: ldr             x5, [x5, #0xfc0]
    // 0x3703ec: StoreField: r2->field_1b = r5
    //     0x3703ec: stur            w5, [x2, #0x1b]
    // 0x3703f0: r6 = Instance_VerticalDirection
    //     0x3703f0: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x3703f4: ldr             x6, [x6, #0xfc8]
    // 0x3703f8: StoreField: r2->field_23 = r6
    //     0x3703f8: stur            w6, [x2, #0x23]
    // 0x3703fc: r7 = Instance_Clip
    //     0x3703fc: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x370400: ldr             x7, [x7, #0xfd0]
    // 0x370404: StoreField: r2->field_2b = r7
    //     0x370404: stur            w7, [x2, #0x2b]
    // 0x370408: d0 = 4.000000
    //     0x370408: fmov            d0, #4.00000000
    // 0x37040c: StoreField: r2->field_2f = d0
    //     0x37040c: stur            d0, [x2, #0x2f]
    // 0x370410: ldur            x1, [fp, #-0x18]
    // 0x370414: StoreField: r2->field_b = r1
    //     0x370414: stur            w1, [x2, #0xb]
    // 0x370418: r16 = 0.900000
    //     0x370418: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x37041c: ldr             x16, [x16, #0x30]
    // 0x370420: str             x16, [SP]
    // 0x370424: r1 = Instance_Color
    //     0x370424: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x370428: ldr             x1, [x1, #0x710]
    // 0x37042c: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x37042c: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x370430: ldr             x4, [x4, #0x1f0]
    // 0x370434: r0 = withValues()
    //     0x370434: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x370438: stur            x0, [fp, #-0x18]
    // 0x37043c: r0 = CoinCount()
    //     0x37043c: bl              #0x3715f0  ; AllocateCoinCountStub -> CoinCount (size=0x10)
    // 0x370440: mov             x1, x0
    // 0x370444: ldur            x0, [fp, #-0x18]
    // 0x370448: stur            x1, [fp, #-0x58]
    // 0x37044c: StoreField: r1->field_b = r0
    //     0x37044c: stur            w0, [x1, #0xb]
    // 0x370450: r0 = Padding()
    //     0x370450: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x370454: mov             x3, x0
    // 0x370458: r0 = Instance_EdgeInsetsDirectional
    //     0x370458: add             x0, PP, #0x14, lsl #12  ; [pp+0x14418] Obj!EdgeInsetsDirectional@5cbbc1
    //     0x37045c: ldr             x0, [x0, #0x418]
    // 0x370460: stur            x3, [fp, #-0x18]
    // 0x370464: StoreField: r3->field_f = r0
    //     0x370464: stur            w0, [x3, #0xf]
    // 0x370468: ldur            x0, [fp, #-0x58]
    // 0x37046c: StoreField: r3->field_b = r0
    //     0x37046c: stur            w0, [x3, #0xb]
    // 0x370470: r1 = Null
    //     0x370470: mov             x1, NULL
    // 0x370474: r2 = 2
    //     0x370474: mov             x2, #2
    // 0x370478: r0 = AllocateArray()
    //     0x370478: bl              #0x5845d8  ; AllocateArrayStub
    // 0x37047c: mov             x2, x0
    // 0x370480: ldur            x0, [fp, #-0x18]
    // 0x370484: stur            x2, [fp, #-0x58]
    // 0x370488: StoreField: r2->field_f = r0
    //     0x370488: stur            w0, [x2, #0xf]
    // 0x37048c: r1 = <Widget>
    //     0x37048c: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x370490: r0 = AllocateGrowableArray()
    //     0x370490: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x370494: mov             x1, x0
    // 0x370498: ldur            x0, [fp, #-0x58]
    // 0x37049c: stur            x1, [fp, #-0x60]
    // 0x3704a0: StoreField: r1->field_f = r0
    //     0x3704a0: stur            w0, [x1, #0xf]
    // 0x3704a4: r2 = 2
    //     0x3704a4: mov             x2, #2
    // 0x3704a8: StoreField: r1->field_b = r2
    //     0x3704a8: stur            w2, [x1, #0xb]
    // 0x3704ac: ldur            d0, [fp, #-0x90]
    // 0x3704b0: r0 = inline_Allocate_Double()
    //     0x3704b0: ldp             x0, x3, [THR, #0x60]  ; THR::top
    //     0x3704b4: add             x0, x0, #0x10
    //     0x3704b8: cmp             x3, x0
    //     0x3704bc: b.ls            #0x370cf0
    //     0x3704c0: str             x0, [THR, #0x60]  ; THR::top
    //     0x3704c4: sub             x0, x0, #0xf
    //     0x3704c8: mov             x3, #0xe19c
    //     0x3704cc: movk            x3, #3, lsl #16
    //     0x3704d0: stur            x3, [x0, #-1]
    // 0x3704d4: dmb             ishst
    // 0x3704d8: StoreField: r0->field_7 = d0
    //     0x3704d8: stur            d0, [x0, #7]
    // 0x3704dc: stur            x0, [fp, #-0x18]
    // 0x3704e0: r0 = AppBar()
    //     0x3704e0: bl              #0x3715e4  ; AllocateAppBarStub -> AppBar (size=0x98)
    // 0x3704e4: stur            x0, [fp, #-0x58]
    // 0x3704e8: r16 = Instance_Color
    //     0x3704e8: add             x16, PP, #0xc, lsl #12  ; [pp+0xcb28] Obj!Color@5ce711
    //     0x3704ec: ldr             x16, [x16, #0xb28]
    // 0x3704f0: r30 = 0.000000
    //     0x3704f0: ldr             lr, [PP, #0x5c40]  ; [pp+0x5c40] 0
    // 0x3704f4: stp             lr, x16, [SP, #0x28]
    // 0x3704f8: r16 = Instance_SystemUiOverlayStyle
    //     0x3704f8: add             x16, PP, #0x10, lsl #12  ; [pp+0x10838] Obj!SystemUiOverlayStyle@5d06f1
    //     0x3704fc: ldr             x16, [x16, #0x838]
    // 0x370500: ldur            lr, [fp, #-0x18]
    // 0x370504: stp             lr, x16, [SP, #0x18]
    // 0x370508: ldur            x16, [fp, #-0x20]
    // 0x37050c: r30 = true
    //     0x37050c: add             lr, NULL, #0x20  ; true
    // 0x370510: stp             lr, x16, [SP, #8]
    // 0x370514: ldur            x16, [fp, #-0x60]
    // 0x370518: str             x16, [SP]
    // 0x37051c: mov             x1, x0
    // 0x370520: ldur            x2, [fp, #-0x10]
    // 0x370524: r4 = const [0, 0x9, 0x7, 0x2, actions, 0x8, backgroundColor, 0x2, centerTitle, 0x7, elevation, 0x3, leading, 0x6, leadingWidth, 0x5, systemOverlayStyle, 0x4, null]
    //     0x370524: add             x4, PP, #0x14, lsl #12  ; [pp+0x14420] List(19) [0, 0x9, 0x7, 0x2, "actions", 0x8, "backgroundColor", 0x2, "centerTitle", 0x7, "elevation", 0x3, "leading", 0x6, "leadingWidth", 0x5, "systemOverlayStyle", 0x4, Null]
    //     0x370528: ldr             x4, [x4, #0x420]
    // 0x37052c: r0 = AppBar()
    //     0x37052c: bl              #0x370e34  ; [package:flutter/src/material/app_bar.dart] AppBar::AppBar
    // 0x370530: r0 = LoadStaticField(0x860)
    //     0x370530: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x370534: ldr             x0, [x0, #0x10c0]
    // 0x370538: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37053c: cmp             w0, w16
    // 0x370540: b.ne            #0x370550
    // 0x370544: r2 = instance
    //     0x370544: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x370548: ldr             x2, [x2, #0x6f0]
    // 0x37054c: r0 = InitLateFinalStaticField()
    //     0x37054c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x370550: r1 = <RicochlimeGame>
    //     0x370550: add             x1, PP, #0x14, lsl #12  ; [pp+0x14428] TypeArguments: <RicochlimeGame>
    //     0x370554: ldr             x1, [x1, #0x428]
    // 0x370558: stur            x0, [fp, #-0x10]
    // 0x37055c: r0 = GameWidget()
    //     0x37055c: bl              #0x370e28  ; AllocateGameWidgetStub -> GameWidget<X0 bound Game> (size=0x40)
    // 0x370560: ldur            x1, [fp, #-0x10]
    // 0x370564: stur            x0, [fp, #-0x18]
    // 0x370568: StoreField: r0->field_f = r1
    //     0x370568: stur            w1, [x0, #0xf]
    // 0x37056c: r2 = true
    //     0x37056c: add             x2, NULL, #0x20  ; true
    // 0x370570: StoreField: r0->field_2f = r2
    //     0x370570: stur            w2, [x0, #0x2f]
    // 0x370574: StoreField: r0->field_37 = r2
    //     0x370574: stur            w2, [x0, #0x37]
    // 0x370578: r3 = Instance_HitTestBehavior
    //     0x370578: add             x3, PP, #0xe, lsl #12  ; [pp+0xe980] Obj!HitTestBehavior@5daa71
    //     0x37057c: ldr             x3, [x3, #0x980]
    // 0x370580: StoreField: r0->field_3b = r3
    //     0x370580: stur            w3, [x0, #0x3b]
    // 0x370584: r0 = SizedBox()
    //     0x370584: bl              #0x363c60  ; AllocateSizedBoxStub -> SizedBox (size=0x18)
    // 0x370588: mov             x1, x0
    // 0x37058c: r0 = 128.000000
    //     0x37058c: add             x0, PP, #0x14, lsl #12  ; [pp+0x14430] 128
    //     0x370590: ldr             x0, [x0, #0x430]
    // 0x370594: stur            x1, [fp, #-0x20]
    // 0x370598: StoreField: r1->field_f = r0
    //     0x370598: stur            w0, [x1, #0xf]
    // 0x37059c: r0 = 213.333333
    //     0x37059c: add             x0, PP, #0x14, lsl #12  ; [pp+0x14438] 213.33333333333334
    //     0x3705a0: ldr             x0, [x0, #0x438]
    // 0x3705a4: StoreField: r1->field_13 = r0
    //     0x3705a4: stur            w0, [x1, #0x13]
    // 0x3705a8: ldur            x0, [fp, #-0x18]
    // 0x3705ac: StoreField: r1->field_b = r0
    //     0x3705ac: stur            w0, [x1, #0xb]
    // 0x3705b0: r0 = FittedBox()
    //     0x3705b0: bl              #0x370e1c  ; AllocateFittedBoxStub -> FittedBox (size=0x1c)
    // 0x3705b4: mov             x1, x0
    // 0x3705b8: r0 = Instance_BoxFit
    //     0x3705b8: add             x0, PP, #0x12, lsl #12  ; [pp+0x12368] Obj!BoxFit@5dae51
    //     0x3705bc: ldr             x0, [x0, #0x368]
    // 0x3705c0: stur            x1, [fp, #-0x18]
    // 0x3705c4: StoreField: r1->field_f = r0
    //     0x3705c4: stur            w0, [x1, #0xf]
    // 0x3705c8: r0 = Instance_Alignment
    //     0x3705c8: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x3705cc: ldr             x0, [x0, #0xb18]
    // 0x3705d0: StoreField: r1->field_13 = r0
    //     0x3705d0: stur            w0, [x1, #0x13]
    // 0x3705d4: r0 = Instance_Clip
    //     0x3705d4: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x3705d8: ldr             x0, [x0, #0xfd0]
    // 0x3705dc: ArrayStore: r1[0] = r0  ; List_4
    //     0x3705dc: stur            w0, [x1, #0x17]
    // 0x3705e0: ldur            x2, [fp, #-0x20]
    // 0x3705e4: StoreField: r1->field_b = r2
    //     0x3705e4: stur            w2, [x1, #0xb]
    // 0x3705e8: r0 = Padding()
    //     0x3705e8: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x3705ec: mov             x2, x0
    // 0x3705f0: r0 = Instance_EdgeInsets
    //     0x3705f0: add             x0, PP, #0x14, lsl #12  ; [pp+0x14440] Obj!EdgeInsets@5cbcb1
    //     0x3705f4: ldr             x0, [x0, #0x440]
    // 0x3705f8: stur            x2, [fp, #-0x20]
    // 0x3705fc: StoreField: r2->field_f = r0
    //     0x3705fc: stur            w0, [x2, #0xf]
    // 0x370600: ldur            x1, [fp, #-0x18]
    // 0x370604: StoreField: r2->field_b = r1
    //     0x370604: stur            w1, [x2, #0xb]
    // 0x370608: r1 = <StackParentData>
    //     0x370608: add             x1, PP, #0x11, lsl #12  ; [pp+0x114e8] TypeArguments: <StackParentData>
    //     0x37060c: ldr             x1, [x1, #0x4e8]
    // 0x370610: r0 = Positioned()
    //     0x370610: bl              #0x36e7f8  ; AllocatePositionedStub -> Positioned (size=0x30)
    // 0x370614: mov             x3, x0
    // 0x370618: r0 = 0.000000
    //     0x370618: ldr             x0, [PP, #0x5c40]  ; [pp+0x5c40] 0
    // 0x37061c: stur            x3, [fp, #-0x18]
    // 0x370620: StoreField: r3->field_13 = r0
    //     0x370620: stur            w0, [x3, #0x13]
    // 0x370624: ArrayStore: r3[0] = rZR  ; List_8
    //     0x370624: stur            xzr, [x3, #0x17]
    // 0x370628: StoreField: r3->field_1f = r0
    //     0x370628: stur            w0, [x3, #0x1f]
    // 0x37062c: StoreField: r3->field_23 = r0
    //     0x37062c: stur            w0, [x3, #0x23]
    // 0x370630: ldur            x1, [fp, #-0x20]
    // 0x370634: StoreField: r3->field_b = r1
    //     0x370634: stur            w1, [x3, #0xb]
    // 0x370638: ldur            x2, [fp, #-0x28]
    // 0x37063c: LoadField: d0 = r2->field_f
    //     0x37063c: ldur            d0, [x2, #0xf]
    // 0x370640: ldur            x1, [fp, #-8]
    // 0x370644: stur            d0, [fp, #-0x90]
    // 0x370648: r0 = _playerPos()
    //     0x370648: bl              #0x370d9c  ; [package:ricochlime/pages/play.dart] _PlayPageState::_playerPos
    // 0x37064c: mov             v1.16b, v0.16b
    // 0x370650: ldur            d0, [fp, #-0x90]
    // 0x370654: fsub            d2, d0, d1
    // 0x370658: stur            d2, [fp, #-0x98]
    // 0x37065c: r0 = LoadStaticField(0x870)
    //     0x37065c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x370660: ldr             x0, [x0, #0x10e0]
    // 0x370664: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370668: cmp             w0, w16
    // 0x37066c: b.ne            #0x37067c
    // 0x370670: r2 = timeDilation
    //     0x370670: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7c0] Field <RicochlimeGame.timeDilation>: static late final (offset: 0x870)
    //     0x370674: ldr             x2, [x2, #0x7c0]
    // 0x370678: r0 = InitLateFinalStaticField()
    //     0x370678: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37067c: r1 = <double>
    //     0x37067c: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x370680: stur            x0, [fp, #-8]
    // 0x370684: r0 = ValueListenableBuilder()
    //     0x370684: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x370688: mov             x3, x0
    // 0x37068c: ldur            x0, [fp, #-8]
    // 0x370690: stur            x3, [fp, #-0x20]
    // 0x370694: StoreField: r3->field_f = r0
    //     0x370694: stur            w0, [x3, #0xf]
    // 0x370698: r1 = Function '<anonymous closure>':.
    //     0x370698: add             x1, PP, #0x14, lsl #12  ; [pp+0x14448] AnonymousClosure: (0x37f5b4), in [package:ricochlime/pages/play.dart] _PlayPageState::build (0x36fcd0)
    //     0x37069c: ldr             x1, [x1, #0x448]
    // 0x3706a0: r2 = Null
    //     0x3706a0: mov             x2, NULL
    // 0x3706a4: r0 = AllocateClosure()
    //     0x3706a4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3706a8: mov             x1, x0
    // 0x3706ac: ldur            x0, [fp, #-0x20]
    // 0x3706b0: StoreField: r0->field_13 = r1
    //     0x3706b0: stur            w1, [x0, #0x13]
    // 0x3706b4: r0 = IgnorePointer()
    //     0x3706b4: bl              #0x36a90c  ; AllocateIgnorePointerStub -> IgnorePointer (size=0x18)
    // 0x3706b8: mov             x3, x0
    // 0x3706bc: r0 = true
    //     0x3706bc: add             x0, NULL, #0x20  ; true
    // 0x3706c0: stur            x3, [fp, #-8]
    // 0x3706c4: StoreField: r3->field_f = r0
    //     0x3706c4: stur            w0, [x3, #0xf]
    // 0x3706c8: ldur            x1, [fp, #-0x20]
    // 0x3706cc: StoreField: r3->field_b = r1
    //     0x3706cc: stur            w1, [x3, #0xb]
    // 0x3706d0: r1 = Null
    //     0x3706d0: mov             x1, NULL
    // 0x3706d4: r2 = 2
    //     0x3706d4: mov             x2, #2
    // 0x3706d8: r0 = AllocateArray()
    //     0x3706d8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3706dc: mov             x2, x0
    // 0x3706e0: ldur            x0, [fp, #-8]
    // 0x3706e4: stur            x2, [fp, #-0x20]
    // 0x3706e8: StoreField: r2->field_f = r0
    //     0x3706e8: stur            w0, [x2, #0xf]
    // 0x3706ec: r1 = <Widget>
    //     0x3706ec: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x3706f0: r0 = AllocateGrowableArray()
    //     0x3706f0: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3706f4: mov             x2, x0
    // 0x3706f8: ldur            x0, [fp, #-0x20]
    // 0x3706fc: stur            x2, [fp, #-8]
    // 0x370700: StoreField: r2->field_f = r0
    //     0x370700: stur            w0, [x2, #0xf]
    // 0x370704: r0 = 2
    //     0x370704: mov             x0, #2
    // 0x370708: StoreField: r2->field_b = r0
    //     0x370708: stur            w0, [x2, #0xb]
    // 0x37070c: ldur            x0, [fp, #-0x30]
    // 0x370710: LoadField: r1 = r0->field_23
    //     0x370710: ldur            w1, [x0, #0x23]
    // 0x370714: DecompressPointer r1
    //     0x370714: add             x1, x1, HEAP, lsl #32
    // 0x370718: LoadField: r0 = r1->field_43
    //     0x370718: ldur            w0, [x1, #0x43]
    // 0x37071c: DecompressPointer r0
    //     0x37071c: add             x0, x0, HEAP, lsl #32
    // 0x370720: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370724: cmp             w0, w16
    // 0x370728: b.ne            #0x370738
    // 0x37072c: r2 = _value
    //     0x37072c: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x370730: ldr             x2, [x2, #0x4b0]
    // 0x370734: r0 = InitLateInstanceField()
    //     0x370734: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x370738: tbnz            w0, #4, #0x370a38
    // 0x37073c: ldur            x1, [fp, #-0x10]
    // 0x370740: LoadField: r0 = r1->field_8f
    //     0x370740: ldur            w0, [x1, #0x8f]
    // 0x370744: DecompressPointer r0
    //     0x370744: add             x0, x0, HEAP, lsl #32
    // 0x370748: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37074c: cmp             w0, w16
    // 0x370750: b.ne            #0x370760
    // 0x370754: r2 = state
    //     0x370754: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x370758: ldr             x2, [x2, #0x790]
    // 0x37075c: r0 = InitLateFinalInstanceField()
    //     0x37075c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x370760: stur            x0, [fp, #-0x10]
    // 0x370764: r16 = <AppLocale, Translations>
    //     0x370764: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x370768: ldur            lr, [fp, #-0x40]
    // 0x37076c: stp             lr, x16, [SP]
    // 0x370770: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x370770: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x370774: r0 = LocaleSettingsExt.currentTranslations()
    //     0x370774: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x370778: r1 = LoadClassIdInstr(r0)
    //     0x370778: ldur            x1, [x0, #-1]
    //     0x37077c: ubfx            x1, x1, #0xc, #0x14
    // 0x370780: cmp             x1, #0x8dd
    // 0x370784: b.ne            #0x3707b0
    // 0x370788: mov             x1, x0
    // 0x37078c: LoadField: r0 = r1->field_13
    //     0x37078c: ldur            w0, [x1, #0x13]
    // 0x370790: DecompressPointer r0
    //     0x370790: add             x0, x0, HEAP, lsl #32
    // 0x370794: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370798: cmp             w0, w16
    // 0x37079c: b.ne            #0x3707ac
    // 0x3707a0: r2 = playPage
    //     0x3707a0: add             x2, PP, #0x12, lsl #12  ; [pp+0x12320] Field <Translations.playPage>: late final (offset: 0x14)
    //     0x3707a4: ldr             x2, [x2, #0x320]
    // 0x3707a8: r0 = InitLateFinalInstanceField()
    //     0x3707a8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3707ac: b               #0x370834
    // 0x3707b0: cmp             x1, #0x8df
    // 0x3707b4: b.ne            #0x3707e0
    // 0x3707b8: mov             x1, x0
    // 0x3707bc: LoadField: r0 = r1->field_37
    //     0x3707bc: ldur            w0, [x1, #0x37]
    // 0x3707c0: DecompressPointer r0
    //     0x3707c0: add             x0, x0, HEAP, lsl #32
    // 0x3707c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3707c8: cmp             w0, w16
    // 0x3707cc: b.ne            #0x3707dc
    // 0x3707d0: r2 = playPage
    //     0x3707d0: add             x2, PP, #0x12, lsl #12  ; [pp+0x12328] Field <TranslationsRu.playPage>: late final (offset: 0x38)
    //     0x3707d4: ldr             x2, [x2, #0x328]
    // 0x3707d8: r0 = InitLateFinalInstanceField()
    //     0x3707d8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3707dc: b               #0x370834
    // 0x3707e0: cmp             x1, #0x8e0
    // 0x3707e4: b.ne            #0x370810
    // 0x3707e8: mov             x1, x0
    // 0x3707ec: LoadField: r0 = r1->field_37
    //     0x3707ec: ldur            w0, [x1, #0x37]
    // 0x3707f0: DecompressPointer r0
    //     0x3707f0: add             x0, x0, HEAP, lsl #32
    // 0x3707f4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3707f8: cmp             w0, w16
    // 0x3707fc: b.ne            #0x37080c
    // 0x370800: r2 = playPage
    //     0x370800: add             x2, PP, #0x12, lsl #12  ; [pp+0x12330] Field <TranslationsKk.playPage>: late final (offset: 0x38)
    //     0x370804: ldr             x2, [x2, #0x330]
    // 0x370808: r0 = InitLateFinalInstanceField()
    //     0x370808: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37080c: b               #0x370834
    // 0x370810: mov             x1, x0
    // 0x370814: LoadField: r0 = r1->field_37
    //     0x370814: ldur            w0, [x1, #0x37]
    // 0x370818: DecompressPointer r0
    //     0x370818: add             x0, x0, HEAP, lsl #32
    // 0x37081c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370820: cmp             w0, w16
    // 0x370824: b.ne            #0x370834
    // 0x370828: r2 = playPage
    //     0x370828: add             x2, PP, #0x12, lsl #12  ; [pp+0x12338] Field <TranslationsEs.playPage>: late final (offset: 0x38)
    //     0x37082c: ldr             x2, [x2, #0x338]
    // 0x370830: r0 = InitLateFinalInstanceField()
    //     0x370830: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x370834: r1 = LoadClassIdInstr(r0)
    //     0x370834: ldur            x1, [x0, #-1]
    //     0x370838: ubfx            x1, x1, #0xc, #0x14
    // 0x37083c: cmp             x1, #0xf8
    // 0x370840: b.ne            #0x370850
    // 0x370844: r3 = "Undo move"
    //     0x370844: add             x3, PP, #0x14, lsl #12  ; [pp+0x14450] "Undo move"
    //     0x370848: ldr             x3, [x3, #0x450]
    // 0x37084c: b               #0x370880
    // 0x370850: cmp             x1, #0xf9
    // 0x370854: b.ne            #0x370864
    // 0x370858: r3 = "Отменить бросок"
    //     0x370858: add             x3, PP, #0x14, lsl #12  ; [pp+0x14458] "Отменить бросок"
    //     0x37085c: ldr             x3, [x3, #0x458]
    // 0x370860: b               #0x370880
    // 0x370864: cmp             x1, #0xfa
    // 0x370868: b.ne            #0x370878
    // 0x37086c: r3 = "Қозғалысты болдырмау"
    //     0x37086c: add             x3, PP, #0x14, lsl #12  ; [pp+0x14460] "Қозғалысты болдырмау"
    //     0x370870: ldr             x3, [x3, #0x460]
    // 0x370874: b               #0x370880
    // 0x370878: r3 = "Deshacer movimiento"
    //     0x370878: add             x3, PP, #0x14, lsl #12  ; [pp+0x14468] "Deshacer movimiento"
    //     0x37087c: ldr             x3, [x3, #0x468]
    // 0x370880: ldur            x0, [fp, #-0x10]
    // 0x370884: ldur            x2, [fp, #-8]
    // 0x370888: ldur            x1, [fp, #-0x38]
    // 0x37088c: stur            x3, [fp, #-0x20]
    // 0x370890: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x370890: ldur            w0, [x1, #0x17]
    // 0x370894: DecompressPointer r0
    //     0x370894: add             x0, x0, HEAP, lsl #32
    // 0x370898: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37089c: cmp             w0, w16
    // 0x3708a0: b.ne            #0x3708b0
    // 0x3708a4: r2 = delete
    //     0x3708a4: add             x2, PP, #0x12, lsl #12  ; [pp+0x122d0] Field <NesIconCollection.delete>: late final (offset: 0x18)
    //     0x3708a8: ldr             x2, [x2, #0x2d0]
    // 0x3708ac: r0 = InitLateFinalInstanceField()
    //     0x3708ac: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3708b0: stur            x0, [fp, #-0x28]
    // 0x3708b4: r16 = 0.900000
    //     0x3708b4: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x3708b8: ldr             x16, [x16, #0x30]
    // 0x3708bc: str             x16, [SP]
    // 0x3708c0: r1 = Instance_Color
    //     0x3708c0: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x3708c4: ldr             x1, [x1, #0x710]
    // 0x3708c8: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x3708c8: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x3708cc: ldr             x4, [x4, #0x1f0]
    // 0x3708d0: r0 = withValues()
    //     0x3708d0: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x3708d4: stur            x0, [fp, #-0x30]
    // 0x3708d8: r16 = 0.900000
    //     0x3708d8: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x3708dc: ldr             x16, [x16, #0x30]
    // 0x3708e0: str             x16, [SP]
    // 0x3708e4: r1 = Instance_Color
    //     0x3708e4: add             x1, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x3708e8: ldr             x1, [x1, #0x140]
    // 0x3708ec: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x3708ec: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x3708f0: ldr             x4, [x4, #0x1f0]
    // 0x3708f4: r0 = withValues()
    //     0x3708f4: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x3708f8: stur            x0, [fp, #-0x38]
    // 0x3708fc: r0 = NesIconButton()
    //     0x3708fc: bl              #0x37162c  ; AllocateNesIconButtonStub -> NesIconButton (size=0x3c)
    // 0x370900: mov             x3, x0
    // 0x370904: ldur            x0, [fp, #-0x28]
    // 0x370908: stur            x3, [fp, #-0x40]
    // 0x37090c: StoreField: r3->field_b = r0
    //     0x37090c: stur            w0, [x3, #0xb]
    // 0x370910: r1 = Function '<anonymous closure>':.
    //     0x370910: add             x1, PP, #0x14, lsl #12  ; [pp+0x14470] AnonymousClosure: (0x371710), in [package:ricochlime/pages/play.dart] _PlayPageState::build (0x36fcd0)
    //     0x370914: ldr             x1, [x1, #0x470]
    // 0x370918: r2 = Null
    //     0x370918: mov             x2, NULL
    // 0x37091c: r0 = AllocateClosure()
    //     0x37091c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x370920: mov             x1, x0
    // 0x370924: ldur            x0, [fp, #-0x40]
    // 0x370928: StoreField: r0->field_f = r1
    //     0x370928: stur            w1, [x0, #0xf]
    // 0x37092c: r1 = Instance_Size
    //     0x37092c: add             x1, PP, #0x14, lsl #12  ; [pp+0x14390] Obj!Size@5d0101
    //     0x370930: ldr             x1, [x1, #0x390]
    // 0x370934: StoreField: r0->field_2f = r1
    //     0x370934: stur            w1, [x0, #0x2f]
    // 0x370938: ldur            x1, [fp, #-0x30]
    // 0x37093c: StoreField: r0->field_27 = r1
    //     0x37093c: stur            w1, [x0, #0x27]
    // 0x370940: ldur            x1, [fp, #-0x38]
    // 0x370944: StoreField: r0->field_2b = r1
    //     0x370944: stur            w1, [x0, #0x2b]
    // 0x370948: r0 = NesTooltip()
    //     0x370948: bl              #0x371620  ; AllocateNesTooltipStub -> NesTooltip (size=0x1c)
    // 0x37094c: mov             x2, x0
    // 0x370950: ldur            x0, [fp, #-0x40]
    // 0x370954: stur            x2, [fp, #-0x28]
    // 0x370958: StoreField: r2->field_b = r0
    //     0x370958: stur            w0, [x2, #0xb]
    // 0x37095c: ldur            x0, [fp, #-0x20]
    // 0x370960: StoreField: r2->field_f = r0
    //     0x370960: stur            w0, [x2, #0xf]
    // 0x370964: r0 = Instance_NesTooltipArrowPlacement
    //     0x370964: add             x0, PP, #0x11, lsl #12  ; [pp+0x111c8] Obj!NesTooltipArrowPlacement@5d8db1
    //     0x370968: ldr             x0, [x0, #0x1c8]
    // 0x37096c: StoreField: r2->field_13 = r0
    //     0x37096c: stur            w0, [x2, #0x13]
    // 0x370970: r0 = Instance_NesTooltipArrowDirection
    //     0x370970: add             x0, PP, #0x14, lsl #12  ; [pp+0x143f0] Obj!NesTooltipArrowDirection@5d8d31
    //     0x370974: ldr             x0, [x0, #0x3f0]
    // 0x370978: ArrayStore: r2[0] = r0  ; List_4
    //     0x370978: stur            w0, [x2, #0x17]
    // 0x37097c: r1 = <GameState>
    //     0x37097c: add             x1, PP, #0xc, lsl #12  ; [pp+0xc7a8] TypeArguments: <GameState>
    //     0x370980: ldr             x1, [x1, #0x7a8]
    // 0x370984: r0 = ValueListenableBuilder()
    //     0x370984: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x370988: mov             x3, x0
    // 0x37098c: ldur            x0, [fp, #-0x10]
    // 0x370990: stur            x3, [fp, #-0x20]
    // 0x370994: StoreField: r3->field_f = r0
    //     0x370994: stur            w0, [x3, #0xf]
    // 0x370998: r1 = Function '<anonymous closure>':.
    //     0x370998: add             x1, PP, #0x14, lsl #12  ; [pp+0x14478] AnonymousClosure: (0x371644), in [package:ricochlime/pages/play.dart] _PlayPageState::build (0x36fcd0)
    //     0x37099c: ldr             x1, [x1, #0x478]
    // 0x3709a0: r2 = Null
    //     0x3709a0: mov             x2, NULL
    // 0x3709a4: r0 = AllocateClosure()
    //     0x3709a4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3709a8: mov             x1, x0
    // 0x3709ac: ldur            x0, [fp, #-0x20]
    // 0x3709b0: StoreField: r0->field_13 = r1
    //     0x3709b0: stur            w1, [x0, #0x13]
    // 0x3709b4: ldur            x1, [fp, #-0x28]
    // 0x3709b8: ArrayStore: r0[0] = r1  ; List_4
    //     0x3709b8: stur            w1, [x0, #0x17]
    // 0x3709bc: ldur            x2, [fp, #-8]
    // 0x3709c0: LoadField: r1 = r2->field_b
    //     0x3709c0: ldur            w1, [x2, #0xb]
    // 0x3709c4: LoadField: r3 = r2->field_f
    //     0x3709c4: ldur            w3, [x2, #0xf]
    // 0x3709c8: DecompressPointer r3
    //     0x3709c8: add             x3, x3, HEAP, lsl #32
    // 0x3709cc: LoadField: r4 = r3->field_b
    //     0x3709cc: ldur            w4, [x3, #0xb]
    // 0x3709d0: r3 = LoadInt32Instr(r1)
    //     0x3709d0: sbfx            x3, x1, #1, #0x1f
    // 0x3709d4: stur            x3, [fp, #-0x88]
    // 0x3709d8: r1 = LoadInt32Instr(r4)
    //     0x3709d8: sbfx            x1, x4, #1, #0x1f
    // 0x3709dc: cmp             x3, x1
    // 0x3709e0: b.ne            #0x3709ec
    // 0x3709e4: mov             x1, x2
    // 0x3709e8: r0 = _growToNextCapacity()
    //     0x3709e8: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3709ec: ldur            x2, [fp, #-8]
    // 0x3709f0: ldur            x3, [fp, #-0x88]
    // 0x3709f4: add             x0, x3, #1
    // 0x3709f8: lsl             x1, x0, #1
    // 0x3709fc: StoreField: r2->field_b = r1
    //     0x3709fc: stur            w1, [x2, #0xb]
    // 0x370a00: LoadField: r1 = r2->field_f
    //     0x370a00: ldur            w1, [x2, #0xf]
    // 0x370a04: DecompressPointer r1
    //     0x370a04: add             x1, x1, HEAP, lsl #32
    // 0x370a08: ldur            x0, [fp, #-0x20]
    // 0x370a0c: ArrayStore: r1[r3] = r0  ; List_4
    //     0x370a0c: add             x25, x1, x3, lsl #2
    //     0x370a10: add             x25, x25, #0xf
    //     0x370a14: str             w0, [x25]
    //     0x370a18: tbz             w0, #0, #0x370a34
    //     0x370a1c: ldurb           w16, [x1, #-1]
    //     0x370a20: ldurb           w17, [x0, #-1]
    //     0x370a24: and             x16, x17, x16, lsr #2
    //     0x370a28: tst             x16, HEAP, lsr #32
    //     0x370a2c: b.eq            #0x370a34
    //     0x370a30: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x370a34: b               #0x370a3c
    // 0x370a38: ldur            x2, [fp, #-8]
    // 0x370a3c: ldur            x4, [fp, #-0x48]
    // 0x370a40: ldur            x3, [fp, #-0x50]
    // 0x370a44: ldur            x1, [fp, #-0x58]
    // 0x370a48: ldur            x0, [fp, #-0x18]
    // 0x370a4c: ldur            d0, [fp, #-0x98]
    // 0x370a50: r0 = Column()
    //     0x370a50: bl              #0x3715fc  ; AllocateColumnStub -> Column (size=0x38)
    // 0x370a54: mov             x1, x0
    // 0x370a58: r0 = Instance_Axis
    //     0x370a58: ldr             x0, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x370a5c: stur            x1, [fp, #-0x10]
    // 0x370a60: StoreField: r1->field_f = r0
    //     0x370a60: stur            w0, [x1, #0xf]
    // 0x370a64: r2 = Instance_MainAxisAlignment
    //     0x370a64: add             x2, PP, #0x14, lsl #12  ; [pp+0x14480] Obj!MainAxisAlignment@5dabf1
    //     0x370a68: ldr             x2, [x2, #0x480]
    // 0x370a6c: StoreField: r1->field_13 = r2
    //     0x370a6c: stur            w2, [x1, #0x13]
    // 0x370a70: r2 = Instance_MainAxisSize
    //     0x370a70: add             x2, PP, #0x11, lsl #12  ; [pp+0x11398] Obj!MainAxisSize@5dac31
    //     0x370a74: ldr             x2, [x2, #0x398]
    // 0x370a78: ArrayStore: r1[0] = r2  ; List_4
    //     0x370a78: stur            w2, [x1, #0x17]
    // 0x370a7c: r2 = Instance_CrossAxisAlignment
    //     0x370a7c: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x370a80: ldr             x2, [x2, #0xfc0]
    // 0x370a84: StoreField: r1->field_1b = r2
    //     0x370a84: stur            w2, [x1, #0x1b]
    // 0x370a88: r3 = Instance_VerticalDirection
    //     0x370a88: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x370a8c: ldr             x3, [x3, #0xfc8]
    // 0x370a90: StoreField: r1->field_23 = r3
    //     0x370a90: stur            w3, [x1, #0x23]
    // 0x370a94: r4 = Instance_Clip
    //     0x370a94: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x370a98: ldr             x4, [x4, #0xfd0]
    // 0x370a9c: StoreField: r1->field_2b = r4
    //     0x370a9c: stur            w4, [x1, #0x2b]
    // 0x370aa0: StoreField: r1->field_2f = rZR
    //     0x370aa0: stur            xzr, [x1, #0x2f]
    // 0x370aa4: ldur            x5, [fp, #-8]
    // 0x370aa8: StoreField: r1->field_b = r5
    //     0x370aa8: stur            w5, [x1, #0xb]
    // 0x370aac: r0 = Padding()
    //     0x370aac: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x370ab0: mov             x2, x0
    // 0x370ab4: r0 = Instance_EdgeInsets
    //     0x370ab4: add             x0, PP, #0x14, lsl #12  ; [pp+0x14440] Obj!EdgeInsets@5cbcb1
    //     0x370ab8: ldr             x0, [x0, #0x440]
    // 0x370abc: stur            x2, [fp, #-8]
    // 0x370ac0: StoreField: r2->field_f = r0
    //     0x370ac0: stur            w0, [x2, #0xf]
    // 0x370ac4: ldur            x0, [fp, #-0x10]
    // 0x370ac8: StoreField: r2->field_b = r0
    //     0x370ac8: stur            w0, [x2, #0xb]
    // 0x370acc: r1 = <StackParentData>
    //     0x370acc: add             x1, PP, #0x11, lsl #12  ; [pp+0x114e8] TypeArguments: <StackParentData>
    //     0x370ad0: ldr             x1, [x1, #0x4e8]
    // 0x370ad4: r0 = Positioned()
    //     0x370ad4: bl              #0x36e7f8  ; AllocatePositionedStub -> Positioned (size=0x30)
    // 0x370ad8: mov             x3, x0
    // 0x370adc: r0 = 0.000000
    //     0x370adc: ldr             x0, [PP, #0x5c40]  ; [pp+0x5c40] 0
    // 0x370ae0: stur            x3, [fp, #-0x10]
    // 0x370ae4: StoreField: r3->field_13 = r0
    //     0x370ae4: stur            w0, [x3, #0x13]
    // 0x370ae8: ArrayStore: r3[0] = rZR  ; List_8
    //     0x370ae8: stur            xzr, [x3, #0x17]
    // 0x370aec: StoreField: r3->field_1f = r0
    //     0x370aec: stur            w0, [x3, #0x1f]
    // 0x370af0: ldur            d0, [fp, #-0x98]
    // 0x370af4: r0 = inline_Allocate_Double()
    //     0x370af4: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x370af8: add             x0, x0, #0x10
    //     0x370afc: cmp             x1, x0
    //     0x370b00: b.ls            #0x370d08
    //     0x370b04: str             x0, [THR, #0x60]  ; THR::top
    //     0x370b08: sub             x0, x0, #0xf
    //     0x370b0c: mov             x1, #0xe19c
    //     0x370b10: movk            x1, #3, lsl #16
    //     0x370b14: stur            x1, [x0, #-1]
    // 0x370b18: dmb             ishst
    // 0x370b1c: StoreField: r0->field_7 = d0
    //     0x370b1c: stur            d0, [x0, #7]
    // 0x370b20: StoreField: r3->field_23 = r0
    //     0x370b20: stur            w0, [x3, #0x23]
    // 0x370b24: ldur            x0, [fp, #-8]
    // 0x370b28: StoreField: r3->field_b = r0
    //     0x370b28: stur            w0, [x3, #0xb]
    // 0x370b2c: r1 = Null
    //     0x370b2c: mov             x1, NULL
    // 0x370b30: r2 = 4
    //     0x370b30: mov             x2, #4
    // 0x370b34: r0 = AllocateArray()
    //     0x370b34: bl              #0x5845d8  ; AllocateArrayStub
    // 0x370b38: mov             x2, x0
    // 0x370b3c: ldur            x0, [fp, #-0x18]
    // 0x370b40: stur            x2, [fp, #-8]
    // 0x370b44: StoreField: r2->field_f = r0
    //     0x370b44: stur            w0, [x2, #0xf]
    // 0x370b48: ldur            x0, [fp, #-0x10]
    // 0x370b4c: StoreField: r2->field_13 = r0
    //     0x370b4c: stur            w0, [x2, #0x13]
    // 0x370b50: r1 = <Widget>
    //     0x370b50: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x370b54: r0 = AllocateGrowableArray()
    //     0x370b54: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x370b58: mov             x1, x0
    // 0x370b5c: ldur            x0, [fp, #-8]
    // 0x370b60: stur            x1, [fp, #-0x10]
    // 0x370b64: StoreField: r1->field_f = r0
    //     0x370b64: stur            w0, [x1, #0xf]
    // 0x370b68: r2 = 4
    //     0x370b68: mov             x2, #4
    // 0x370b6c: StoreField: r1->field_b = r2
    //     0x370b6c: stur            w2, [x1, #0xb]
    // 0x370b70: r0 = Stack()
    //     0x370b70: bl              #0x35d6bc  ; AllocateStackStub -> Stack (size=0x20)
    // 0x370b74: mov             x2, x0
    // 0x370b78: r0 = Instance_AlignmentDirectional
    //     0x370b78: add             x0, PP, #0x11, lsl #12  ; [pp+0x114f8] Obj!AlignmentDirectional@5cc1b1
    //     0x370b7c: ldr             x0, [x0, #0x4f8]
    // 0x370b80: stur            x2, [fp, #-8]
    // 0x370b84: StoreField: r2->field_f = r0
    //     0x370b84: stur            w0, [x2, #0xf]
    // 0x370b88: r0 = Instance_StackFit
    //     0x370b88: add             x0, PP, #0x11, lsl #12  ; [pp+0x11500] Obj!StackFit@5da9d1
    //     0x370b8c: ldr             x0, [x0, #0x500]
    // 0x370b90: ArrayStore: r2[0] = r0  ; List_4
    //     0x370b90: stur            w0, [x2, #0x17]
    // 0x370b94: r0 = Instance_Clip
    //     0x370b94: add             x0, PP, #0x11, lsl #12  ; [pp+0x11df8] Obj!Clip@5dc831
    //     0x370b98: ldr             x0, [x0, #0xdf8]
    // 0x370b9c: StoreField: r2->field_1b = r0
    //     0x370b9c: stur            w0, [x2, #0x1b]
    // 0x370ba0: ldur            x0, [fp, #-0x10]
    // 0x370ba4: StoreField: r2->field_b = r0
    //     0x370ba4: stur            w0, [x2, #0xb]
    // 0x370ba8: r1 = <FlexParentData>
    //     0x370ba8: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x370bac: ldr             x1, [x1, #0xc40]
    // 0x370bb0: r0 = Expanded()
    //     0x370bb0: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x370bb4: mov             x3, x0
    // 0x370bb8: r0 = 1
    //     0x370bb8: mov             x0, #1
    // 0x370bbc: stur            x3, [fp, #-0x10]
    // 0x370bc0: StoreField: r3->field_13 = r0
    //     0x370bc0: stur            x0, [x3, #0x13]
    // 0x370bc4: r0 = Instance_FlexFit
    //     0x370bc4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x370bc8: ldr             x0, [x0, #0xc48]
    // 0x370bcc: StoreField: r3->field_1b = r0
    //     0x370bcc: stur            w0, [x3, #0x1b]
    // 0x370bd0: ldur            x0, [fp, #-8]
    // 0x370bd4: StoreField: r3->field_b = r0
    //     0x370bd4: stur            w0, [x3, #0xb]
    // 0x370bd8: r1 = Null
    //     0x370bd8: mov             x1, NULL
    // 0x370bdc: r2 = 4
    //     0x370bdc: mov             x2, #4
    // 0x370be0: r0 = AllocateArray()
    //     0x370be0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x370be4: stur            x0, [fp, #-8]
    // 0x370be8: r16 = Instance_SizedBox
    //     0x370be8: add             x16, PP, #0x14, lsl #12  ; [pp+0x14488] Obj!SizedBox@5d8301
    //     0x370bec: ldr             x16, [x16, #0x488]
    // 0x370bf0: StoreField: r0->field_f = r16
    //     0x370bf0: stur            w16, [x0, #0xf]
    // 0x370bf4: ldur            x1, [fp, #-0x10]
    // 0x370bf8: StoreField: r0->field_13 = r1
    //     0x370bf8: stur            w1, [x0, #0x13]
    // 0x370bfc: r1 = <Widget>
    //     0x370bfc: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x370c00: r0 = AllocateGrowableArray()
    //     0x370c00: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x370c04: mov             x1, x0
    // 0x370c08: ldur            x0, [fp, #-8]
    // 0x370c0c: stur            x1, [fp, #-0x10]
    // 0x370c10: StoreField: r1->field_f = r0
    //     0x370c10: stur            w0, [x1, #0xf]
    // 0x370c14: r0 = 4
    //     0x370c14: mov             x0, #4
    // 0x370c18: StoreField: r1->field_b = r0
    //     0x370c18: stur            w0, [x1, #0xb]
    // 0x370c1c: r0 = Column()
    //     0x370c1c: bl              #0x3715fc  ; AllocateColumnStub -> Column (size=0x38)
    // 0x370c20: mov             x1, x0
    // 0x370c24: r0 = Instance_Axis
    //     0x370c24: ldr             x0, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x370c28: stur            x1, [fp, #-8]
    // 0x370c2c: StoreField: r1->field_f = r0
    //     0x370c2c: stur            w0, [x1, #0xf]
    // 0x370c30: r0 = Instance_MainAxisAlignment
    //     0x370c30: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x370c34: ldr             x0, [x0, #0xfb0]
    // 0x370c38: StoreField: r1->field_13 = r0
    //     0x370c38: stur            w0, [x1, #0x13]
    // 0x370c3c: r0 = Instance_MainAxisSize
    //     0x370c3c: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x370c40: ldr             x0, [x0, #0xfb8]
    // 0x370c44: ArrayStore: r1[0] = r0  ; List_4
    //     0x370c44: stur            w0, [x1, #0x17]
    // 0x370c48: r0 = Instance_CrossAxisAlignment
    //     0x370c48: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x370c4c: ldr             x0, [x0, #0xfc0]
    // 0x370c50: StoreField: r1->field_1b = r0
    //     0x370c50: stur            w0, [x1, #0x1b]
    // 0x370c54: r0 = Instance_VerticalDirection
    //     0x370c54: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x370c58: ldr             x0, [x0, #0xfc8]
    // 0x370c5c: StoreField: r1->field_23 = r0
    //     0x370c5c: stur            w0, [x1, #0x23]
    // 0x370c60: r0 = Instance_Clip
    //     0x370c60: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x370c64: ldr             x0, [x0, #0xfd0]
    // 0x370c68: StoreField: r1->field_2b = r0
    //     0x370c68: stur            w0, [x1, #0x2b]
    // 0x370c6c: StoreField: r1->field_2f = rZR
    //     0x370c6c: stur            xzr, [x1, #0x2f]
    // 0x370c70: ldur            x0, [fp, #-0x10]
    // 0x370c74: StoreField: r1->field_b = r0
    //     0x370c74: stur            w0, [x1, #0xb]
    // 0x370c78: r0 = Scaffold()
    //     0x370c78: bl              #0x370d84  ; AllocateScaffoldStub -> Scaffold (size=0x50)
    // 0x370c7c: mov             x2, x0
    // 0x370c80: ldur            x0, [fp, #-0x58]
    // 0x370c84: stur            x2, [fp, #-0x10]
    // 0x370c88: StoreField: r2->field_13 = r0
    //     0x370c88: stur            w0, [x2, #0x13]
    // 0x370c8c: ldur            x0, [fp, #-8]
    // 0x370c90: ArrayStore: r2[0] = r0  ; List_4
    //     0x370c90: stur            w0, [x2, #0x17]
    // 0x370c94: ldur            x0, [fp, #-0x48]
    // 0x370c98: StoreField: r2->field_37 = r0
    //     0x370c98: stur            w0, [x2, #0x37]
    // 0x370c9c: r0 = true
    //     0x370c9c: add             x0, NULL, #0x20  ; true
    // 0x370ca0: StoreField: r2->field_47 = r0
    //     0x370ca0: stur            w0, [x2, #0x47]
    // 0x370ca4: r1 = false
    //     0x370ca4: add             x1, NULL, #0x30  ; false
    // 0x370ca8: StoreField: r2->field_b = r1
    //     0x370ca8: stur            w1, [x2, #0xb]
    // 0x370cac: StoreField: r2->field_f = r1
    //     0x370cac: stur            w1, [x2, #0xf]
    // 0x370cb0: r1 = Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static.
    //     0x370cb0: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd50] Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static. (0x7c033375e380)
    //     0x370cb4: ldr             x1, [x1, #0xd50]
    // 0x370cb8: StoreField: r2->field_33 = r1
    //     0x370cb8: stur            w1, [x2, #0x33]
    // 0x370cbc: r1 = <SystemUiOverlayStyle>
    //     0x370cbc: ldr             x1, [PP, #0x4510]  ; [pp+0x4510] TypeArguments: <SystemUiOverlayStyle>
    // 0x370cc0: r0 = AnnotatedRegion()
    //     0x370cc0: bl              #0x370d78  ; AllocateAnnotatedRegionStub -> AnnotatedRegion<X0> (size=0x1c)
    // 0x370cc4: ldur            x1, [fp, #-0x50]
    // 0x370cc8: StoreField: r0->field_13 = r1
    //     0x370cc8: stur            w1, [x0, #0x13]
    // 0x370ccc: r1 = true
    //     0x370ccc: add             x1, NULL, #0x20  ; true
    // 0x370cd0: ArrayStore: r0[0] = r1  ; List_4
    //     0x370cd0: stur            w1, [x0, #0x17]
    // 0x370cd4: ldur            x1, [fp, #-0x10]
    // 0x370cd8: StoreField: r0->field_b = r1
    //     0x370cd8: stur            w1, [x0, #0xb]
    // 0x370cdc: LeaveFrame
    //     0x370cdc: mov             SP, fp
    //     0x370ce0: ldp             fp, lr, [SP], #0x10
    // 0x370ce4: ret
    //     0x370ce4: ret             
    // 0x370ce8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x370ce8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x370cec: b               #0x36fcf8
    // 0x370cf0: SaveReg d0
    //     0x370cf0: str             q0, [SP, #-0x10]!
    // 0x370cf4: stp             x1, x2, [SP, #-0x10]!
    // 0x370cf8: r0 = AllocateDouble()
    //     0x370cf8: bl              #0x584528  ; AllocateDoubleStub
    // 0x370cfc: ldp             x1, x2, [SP], #0x10
    // 0x370d00: RestoreReg d0
    //     0x370d00: ldr             q0, [SP], #0x10
    // 0x370d04: b               #0x3704d8
    // 0x370d08: SaveReg d0
    //     0x370d08: str             q0, [SP, #-0x10]!
    // 0x370d0c: SaveReg r3
    //     0x370d0c: str             x3, [SP, #-8]!
    // 0x370d10: r0 = AllocateDouble()
    //     0x370d10: bl              #0x584528  ; AllocateDoubleStub
    // 0x370d14: RestoreReg r3
    //     0x370d14: ldr             x3, [SP], #8
    // 0x370d18: RestoreReg d0
    //     0x370d18: ldr             q0, [SP], #0x10
    // 0x370d1c: b               #0x370b1c
  }
  _ _playerPos(/* No info */) {
    // ** addr: 0x370d9c, size: 0x80
    // 0x370d9c: EnterFrame
    //     0x370d9c: stp             fp, lr, [SP, #-0x10]!
    //     0x370da0: mov             fp, SP
    // 0x370da4: AllocStack(0x8)
    //     0x370da4: sub             SP, SP, #8
    // 0x370da8: SetupParameters(dynamic _ /* r2 => r0, fp-0x8 */)
    //     0x370da8: mov             x0, x2
    //     0x370dac: stur            x2, [fp, #-8]
    // 0x370db0: CheckStackOverflow
    //     0x370db0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x370db4: cmp             SP, x16
    //     0x370db8: b.ls            #0x370e14
    // 0x370dbc: mov             x3, x0
    // 0x370dc0: r1 = Instance_BoxFit
    //     0x370dc0: add             x1, PP, #0x12, lsl #12  ; [pp+0x12368] Obj!BoxFit@5dae51
    //     0x370dc4: ldr             x1, [x1, #0x368]
    // 0x370dc8: r2 = Instance_Size
    //     0x370dc8: add             x2, PP, #0x14, lsl #12  ; [pp+0x14538] Obj!Size@5d00c1
    //     0x370dcc: ldr             x2, [x2, #0x538]
    // 0x370dd0: r0 = applyBoxFit()
    //     0x370dd0: bl              #0x2bf494  ; [package:flutter/src/painting/box_fit.dart] ::applyBoxFit
    // 0x370dd4: mov             x1, x0
    // 0x370dd8: ldur            x0, [fp, #-8]
    // 0x370ddc: LoadField: d1 = r0->field_f
    //     0x370ddc: ldur            d1, [x0, #0xf]
    // 0x370de0: LoadField: r0 = r1->field_b
    //     0x370de0: ldur            w0, [x1, #0xb]
    // 0x370de4: DecompressPointer r0
    //     0x370de4: add             x0, x0, HEAP, lsl #32
    // 0x370de8: LoadField: d2 = r0->field_f
    //     0x370de8: ldur            d2, [x0, #0xf]
    // 0x370dec: fsub            d3, d1, d2
    // 0x370df0: d1 = 2.000000
    //     0x370df0: fmov            d1, #2.00000000
    // 0x370df4: fdiv            d4, d3, d1
    // 0x370df8: d1 = 0.720000
    //     0x370df8: add             x17, PP, #0x14, lsl #12  ; [pp+0x14540] IMM: double(0.72) from 0x3fe70a3d70a3d70a
    //     0x370dfc: ldr             d1, [x17, #0x540]
    // 0x370e00: fmul            d3, d2, d1
    // 0x370e04: fadd            d0, d4, d3
    // 0x370e08: LeaveFrame
    //     0x370e08: mov             SP, fp
    //     0x370e0c: ldp             fp, lr, [SP], #0x10
    // 0x370e10: ret
    //     0x370e10: ret             
    // 0x370e14: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x370e14: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x370e18: b               #0x370dbc
  }
  [closure] AnimatedOpacity <anonymous closure>(dynamic, BuildContext, GameState, Widget?) {
    // ** addr: 0x371644, size: 0xa0
    // 0x371644: EnterFrame
    //     0x371644: stp             fp, lr, [SP, #-0x10]!
    //     0x371648: mov             fp, SP
    // 0x37164c: AllocStack(0x18)
    //     0x37164c: sub             SP, SP, #0x18
    // 0x371650: ldr             x0, [fp, #0x18]
    // 0x371654: r16 = Instance_GameState
    //     0x371654: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7b8] Obj!GameState@5d8a01
    //     0x371658: ldr             x16, [x16, #0x7b8]
    // 0x37165c: cmp             w0, w16
    // 0x371660: r16 = true
    //     0x371660: add             x16, NULL, #0x20  ; true
    // 0x371664: r17 = false
    //     0x371664: add             x17, NULL, #0x30  ; false
    // 0x371668: csel            x1, x16, x17, eq
    // 0x37166c: tbnz            w1, #4, #0x371678
    // 0x371670: d0 = 1.000000
    //     0x371670: fmov            d0, #1.00000000
    // 0x371674: b               #0x37167c
    // 0x371678: d0 = 0.000000
    //     0x371678: eor             v0.16b, v0.16b, v0.16b
    // 0x37167c: ldr             x0, [fp, #0x10]
    // 0x371680: stur            d0, [fp, #-0x18]
    // 0x371684: eor             x2, x1, #0x10
    // 0x371688: stur            x2, [fp, #-8]
    // 0x37168c: r0 = IgnorePointer()
    //     0x37168c: bl              #0x36a90c  ; AllocateIgnorePointerStub -> IgnorePointer (size=0x18)
    // 0x371690: mov             x1, x0
    // 0x371694: ldur            x0, [fp, #-8]
    // 0x371698: stur            x1, [fp, #-0x10]
    // 0x37169c: StoreField: r1->field_f = r0
    //     0x37169c: stur            w0, [x1, #0xf]
    // 0x3716a0: ldr             x0, [fp, #0x10]
    // 0x3716a4: StoreField: r1->field_b = r0
    //     0x3716a4: stur            w0, [x1, #0xb]
    // 0x3716a8: r0 = AnimatedOpacity()
    //     0x3716a8: bl              #0x3716e4  ; AllocateAnimatedOpacityStub -> AnimatedOpacity (size=0x28)
    // 0x3716ac: ldur            x1, [fp, #-0x10]
    // 0x3716b0: ArrayStore: r0[0] = r1  ; List_4
    //     0x3716b0: stur            w1, [x0, #0x17]
    // 0x3716b4: ldur            d0, [fp, #-0x18]
    // 0x3716b8: StoreField: r0->field_1b = d0
    //     0x3716b8: stur            d0, [x0, #0x1b]
    // 0x3716bc: r1 = false
    //     0x3716bc: add             x1, NULL, #0x30  ; false
    // 0x3716c0: StoreField: r0->field_23 = r1
    //     0x3716c0: stur            w1, [x0, #0x23]
    // 0x3716c4: r1 = Instance__Linear
    //     0x3716c4: ldr             x1, [PP, #0x7870]  ; [pp+0x7870] Obj!_Linear@5cce21
    // 0x3716c8: StoreField: r0->field_b = r1
    //     0x3716c8: stur            w1, [x0, #0xb]
    // 0x3716cc: r1 = Instance_Duration
    //     0x3716cc: add             x1, PP, #9, lsl #12  ; [pp+0x9188] Obj!Duration@5dcd01
    //     0x3716d0: ldr             x1, [x1, #0x188]
    // 0x3716d4: StoreField: r0->field_f = r1
    //     0x3716d4: stur            w1, [x0, #0xf]
    // 0x3716d8: LeaveFrame
    //     0x3716d8: mov             SP, fp
    //     0x3716dc: ldp             fp, lr, [SP], #0x10
    // 0x3716e0: ret
    //     0x3716e0: ret             
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x371710, size: 0xd8
    // 0x371710: EnterFrame
    //     0x371710: stp             fp, lr, [SP, #-0x10]!
    //     0x371714: mov             fp, SP
    // 0x371718: AllocStack(0x8)
    //     0x371718: sub             SP, SP, #8
    // 0x37171c: CheckStackOverflow
    //     0x37171c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371720: cmp             SP, x16
    //     0x371724: b.ls            #0x3717e0
    // 0x371728: r0 = LoadStaticField(0x860)
    //     0x371728: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37172c: ldr             x0, [x0, #0x10c0]
    // 0x371730: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x371734: cmp             w0, w16
    // 0x371738: b.ne            #0x371748
    // 0x37173c: r2 = instance
    //     0x37173c: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x371740: ldr             x2, [x2, #0x6f0]
    // 0x371744: r0 = InitLateFinalStaticField()
    //     0x371744: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x371748: mov             x1, x0
    // 0x37174c: r0 = cancelCurrentTurn()
    //     0x37174c: bl              #0x3717e8  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::cancelCurrentTurn
    // 0x371750: r0 = LoadStaticField(0xccc)
    //     0x371750: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x371754: ldr             x0, [x0, #0x1998]
    // 0x371758: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37175c: cmp             w0, w16
    // 0x371760: b.ne            #0x371770
    // 0x371764: r2 = stows
    //     0x371764: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x371768: ldr             x2, [x2, #0x310]
    // 0x37176c: r0 = InitLateFinalStaticField()
    //     0x37176c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x371770: LoadField: r2 = r0->field_53
    //     0x371770: ldur            w2, [x0, #0x53]
    // 0x371774: DecompressPointer r2
    //     0x371774: add             x2, x2, HEAP, lsl #32
    // 0x371778: mov             x1, x2
    // 0x37177c: stur            x2, [fp, #-8]
    // 0x371780: LoadField: r0 = r1->field_43
    //     0x371780: ldur            w0, [x1, #0x43]
    // 0x371784: DecompressPointer r0
    //     0x371784: add             x0, x0, HEAP, lsl #32
    // 0x371788: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37178c: cmp             w0, w16
    // 0x371790: b.ne            #0x3717a0
    // 0x371794: r2 = _value
    //     0x371794: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x371798: ldr             x2, [x2, #0x4b0]
    // 0x37179c: r0 = InitLateInstanceField()
    //     0x37179c: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3717a0: r1 = LoadInt32Instr(r0)
    //     0x3717a0: sbfx            x1, x0, #1, #0x1f
    //     0x3717a4: tbz             w0, #0, #0x3717ac
    //     0x3717a8: ldur            x1, [x0, #7]
    // 0x3717ac: add             x2, x1, #1
    // 0x3717b0: r0 = BoxInt64Instr(r2)
    //     0x3717b0: sbfiz           x0, x2, #1, #0x1f
    //     0x3717b4: cmp             x2, x0, asr #1
    //     0x3717b8: b.eq            #0x3717c4
    //     0x3717bc: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3717c0: stur            x2, [x0, #7]
    // 0x3717c4: ldur            x1, [fp, #-8]
    // 0x3717c8: mov             x2, x0
    // 0x3717cc: r0 = value=()
    //     0x3717cc: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x3717d0: r0 = Null
    //     0x3717d0: mov             x0, NULL
    // 0x3717d4: LeaveFrame
    //     0x3717d4: mov             SP, fp
    //     0x3717d8: ldp             fp, lr, [SP], #0x10
    // 0x3717dc: ret
    //     0x3717dc: ret             
    // 0x3717e0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3717e0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3717e4: b               #0x371728
  }
  [closure] Future<GameOverAction> showGameOverDialog(dynamic) {
    // ** addr: 0x377310, size: 0x38
    // 0x377310: EnterFrame
    //     0x377310: stp             fp, lr, [SP, #-0x10]!
    //     0x377314: mov             fp, SP
    // 0x377318: ldr             x0, [fp, #0x10]
    // 0x37731c: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x37731c: ldur            w1, [x0, #0x17]
    // 0x377320: DecompressPointer r1
    //     0x377320: add             x1, x1, HEAP, lsl #32
    // 0x377324: CheckStackOverflow
    //     0x377324: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x377328: cmp             SP, x16
    //     0x37732c: b.ls            #0x377340
    // 0x377330: r0 = showGameOverDialog()
    //     0x377330: bl              #0x37822c  ; [package:ricochlime/pages/play.dart] _PlayPageState::showGameOverDialog
    // 0x377334: LeaveFrame
    //     0x377334: mov             SP, fp
    //     0x377338: ldp             fp, lr, [SP], #0x10
    // 0x37733c: ret
    //     0x37733c: ret             
    // 0x377340: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x377340: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x377344: b               #0x377330
  }
  _ showGameOverDialog(/* No info */) async {
    // ** addr: 0x37822c, size: 0xf0
    // 0x37822c: EnterFrame
    //     0x37822c: stp             fp, lr, [SP, #-0x10]!
    //     0x378230: mov             fp, SP
    // 0x378234: AllocStack(0xa8)
    //     0x378234: sub             SP, SP, #0xa8
    // 0x378238: SetupParameters(_PlayPageState this /* r1 => r1, fp-0x78 */)
    //     0x378238: stur            NULL, [fp, #-8]
    //     0x37823c: stur            x1, [fp, #-0x78]
    // 0x378240: CheckStackOverflow
    //     0x378240: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x378244: cmp             SP, x16
    //     0x378248: b.ls            #0x378314
    // 0x37824c: InitAsync() -> Future<GameOverAction>
    //     0x37824c: add             x0, PP, #0xc, lsl #12  ; [pp+0xca18] TypeArguments: <GameOverAction>
    //     0x378250: ldr             x0, [x0, #0xa18]
    //     0x378254: bl              #0x2556b4  ; InitAsyncStub
    // 0x378258: ldur            x0, [fp, #-0x78]
    // 0x37825c: LoadField: r3 = r0->field_f
    //     0x37825c: ldur            w3, [x0, #0xf]
    // 0x378260: DecompressPointer r3
    //     0x378260: add             x3, x3, HEAP, lsl #32
    // 0x378264: stur            x3, [fp, #-0x80]
    // 0x378268: cmp             w3, NULL
    // 0x37826c: b.ne            #0x37827c
    // 0x378270: r0 = Instance_GameOverAction
    //     0x378270: add             x0, PP, #0xc, lsl #12  ; [pp+0xc7e8] Obj!GameOverAction@5d8981
    //     0x378274: ldr             x0, [x0, #0x7e8]
    // 0x378278: r0 = ReturnAsyncNotFuture()
    //     0x378278: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37827c: r1 = LoadStaticField(0x8a4)
    //     0x37827c: ldr             x1, [THR, #0x78]  ; THR::field_table_values
    //     0x378280: ldr             x1, [x1, #0x1148]
    // 0x378284: tbnz            w1, #4, #0x378294
    // 0x378288: r0 = Instance_GameOverAction
    //     0x378288: add             x0, PP, #0xc, lsl #12  ; [pp+0xc7e8] Obj!GameOverAction@5d8981
    //     0x37828c: ldr             x0, [x0, #0x7e8]
    // 0x378290: r0 = ReturnAsyncNotFuture()
    //     0x378290: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x378294: r2 = true
    //     0x378294: add             x2, NULL, #0x20  ; true
    // 0x378298: StoreStaticField(0x8a4, r2)
    //     0x378298: ldr             x1, [THR, #0x78]  ; THR::field_table_values
    //     0x37829c: str             x2, [x1, #0x1148]
    // 0x3782a0: r1 = Function '<anonymous closure>':.
    //     0x3782a0: add             x1, PP, #0xc, lsl #12  ; [pp+0xca20] AnonymousClosure: (0x378fc4), in [package:ricochlime/pages/play.dart] _PlayPageState::showGameOverDialog (0x37822c)
    //     0x3782a4: ldr             x1, [x1, #0xa20]
    // 0x3782a8: r2 = Null
    //     0x3782a8: mov             x2, NULL
    // 0x3782ac: r0 = AllocateClosure()
    //     0x3782ac: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3782b0: stur            x0, [fp, #-0x88]
    // 0x3782b4: r16 = <GameOverAction>
    //     0x3782b4: add             x16, PP, #0xc, lsl #12  ; [pp+0xca18] TypeArguments: <GameOverAction>
    //     0x3782b8: ldr             x16, [x16, #0xa18]
    // 0x3782bc: stp             x0, x16, [SP, #8]
    // 0x3782c0: ldur            x16, [fp, #-0x80]
    // 0x3782c4: str             x16, [SP]
    // 0x3782c8: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x3782c8: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x3782cc: r0 = show()
    //     0x3782cc: bl              #0x37831c  ; [package:nes_ui/src/widgets/dialogs/nes_dialog.dart] NesDialog::show
    // 0x3782d0: mov             x1, x0
    // 0x3782d4: stur            x1, [fp, #-0x90]
    // 0x3782d8: r0 = Await()
    //     0x3782d8: bl              #0x255470  ; AwaitStub
    // 0x3782dc: cmp             w0, NULL
    // 0x3782e0: b.ne            #0x3782ec
    // 0x3782e4: r0 = Instance_GameOverAction
    //     0x3782e4: add             x0, PP, #0xc, lsl #12  ; [pp+0xc7e8] Obj!GameOverAction@5d8981
    //     0x3782e8: ldr             x0, [x0, #0x7e8]
    // 0x3782ec: r2 = false
    //     0x3782ec: add             x2, NULL, #0x30  ; false
    // 0x3782f0: StoreStaticField(0x8a4, r2)
    //     0x3782f0: ldr             x1, [THR, #0x78]  ; THR::field_table_values
    //     0x3782f4: str             x2, [x1, #0x1148]
    // 0x3782f8: r0 = ReturnAsync()
    //     0x3782f8: b               #0x26476c  ; ReturnAsyncStub
    // 0x3782fc: sub             SP, fp, #0xa8
    // 0x378300: r2 = false
    //     0x378300: add             x2, NULL, #0x30  ; false
    // 0x378304: StoreStaticField(0x8a4, r2)
    //     0x378304: ldr             x3, [THR, #0x78]  ; THR::field_table_values
    //     0x378308: str             x2, [x3, #0x1148]
    // 0x37830c: r0 = ReThrow()
    //     0x37830c: bl              #0x5827b0  ; ReThrowStub
    // 0x378310: brk             #0
    // 0x378314: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x378314: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x378318: b               #0x37824c
  }
  [closure] GameOverDialog <anonymous closure>(dynamic, BuildContext) {
    // ** addr: 0x378fc4, size: 0x98
    // 0x378fc4: EnterFrame
    //     0x378fc4: stp             fp, lr, [SP, #-0x10]!
    //     0x378fc8: mov             fp, SP
    // 0x378fcc: AllocStack(0x10)
    //     0x378fcc: sub             SP, SP, #0x10
    // 0x378fd0: CheckStackOverflow
    //     0x378fd0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x378fd4: cmp             SP, x16
    //     0x378fd8: b.ls            #0x379054
    // 0x378fdc: r0 = LoadStaticField(0x868)
    //     0x378fdc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x378fe0: ldr             x0, [x0, #0x10d0]
    // 0x378fe4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x378fe8: cmp             w0, w16
    // 0x378fec: b.ne            #0x378ffc
    // 0x378ff0: r2 = score
    //     0x378ff0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc780] Field <RicochlimeGame.score>: static late final (offset: 0x868)
    //     0x378ff4: ldr             x2, [x2, #0x780]
    // 0x378ff8: r0 = InitLateFinalStaticField()
    //     0x378ff8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x378ffc: LoadField: r1 = r0->field_27
    //     0x378ffc: ldur            w1, [x0, #0x27]
    // 0x379000: DecompressPointer r1
    //     0x379000: add             x1, x1, HEAP, lsl #32
    // 0x379004: stur            x1, [fp, #-8]
    // 0x379008: r0 = LoadStaticField(0x860)
    //     0x379008: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37900c: ldr             x0, [x0, #0x10c0]
    // 0x379010: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x379014: cmp             w0, w16
    // 0x379018: b.ne            #0x379028
    // 0x37901c: r2 = instance
    //     0x37901c: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x379020: ldr             x2, [x2, #0x6f0]
    // 0x379024: r0 = InitLateFinalStaticField()
    //     0x379024: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x379028: ldur            x0, [fp, #-8]
    // 0x37902c: r1 = LoadInt32Instr(r0)
    //     0x37902c: sbfx            x1, x0, #1, #0x1f
    //     0x379030: tbz             w0, #0, #0x379038
    //     0x379034: ldur            x1, [x0, #7]
    // 0x379038: stur            x1, [fp, #-0x10]
    // 0x37903c: r0 = GameOverDialog()
    //     0x37903c: bl              #0x37905c  ; AllocateGameOverDialogStub -> GameOverDialog (size=0x14)
    // 0x379040: ldur            x1, [fp, #-0x10]
    // 0x379044: StoreField: r0->field_b = r1
    //     0x379044: stur            x1, [x0, #0xb]
    // 0x379048: LeaveFrame
    //     0x379048: mov             SP, fp
    //     0x37904c: ldp             fp, lr, [SP], #0x10
    // 0x379050: ret
    //     0x379050: ret             
    // 0x379054: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x379054: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x379058: b               #0x378fdc
  }
  [closure] AnimatedOpacity <anonymous closure>(dynamic, BuildContext, double, Widget?) {
    // ** addr: 0x37f5b4, size: 0x124
    // 0x37f5b4: EnterFrame
    //     0x37f5b4: stp             fp, lr, [SP, #-0x10]!
    //     0x37f5b8: mov             fp, SP
    // 0x37f5bc: AllocStack(0x28)
    //     0x37f5bc: sub             SP, SP, #0x28
    // 0x37f5c0: SetupParameters()
    //     0x37f5c0: fmov            d0, #1.00000000
    // 0x37f5c0: d0 = 1.000000
    // 0x37f5c4: CheckStackOverflow
    //     0x37f5c4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37f5c8: cmp             SP, x16
    //     0x37f5cc: b.ls            #0x37f6d0
    // 0x37f5d0: ldr             x1, [fp, #0x18]
    // 0x37f5d4: LoadField: d1 = r1->field_7
    //     0x37f5d4: ldur            d1, [x1, #7]
    // 0x37f5d8: fcmp            d1, d0
    // 0x37f5dc: b.ne            #0x37f5e8
    // 0x37f5e0: d0 = 0.000000
    //     0x37f5e0: eor             v0.16b, v0.16b, v0.16b
    // 0x37f5e4: b               #0x37f5ec
    // 0x37f5e8: d0 = 1.000000
    //     0x37f5e8: fmov            d0, #1.00000000
    // 0x37f5ec: stur            d0, [fp, #-0x20]
    // 0x37f5f0: r2 = 1
    //     0x37f5f0: mov             x2, #1
    // 0x37f5f4: r0 = toStringAsFixed()
    //     0x37f5f4: bl              #0x37f6e4  ; [dart:core] _Double::toStringAsFixed
    // 0x37f5f8: r1 = Null
    //     0x37f5f8: mov             x1, NULL
    // 0x37f5fc: r2 = 4
    //     0x37f5fc: mov             x2, #4
    // 0x37f600: stur            x0, [fp, #-8]
    // 0x37f604: r0 = AllocateArray()
    //     0x37f604: bl              #0x5845d8  ; AllocateArrayStub
    // 0x37f608: mov             x1, x0
    // 0x37f60c: ldur            x0, [fp, #-8]
    // 0x37f610: StoreField: r1->field_f = r0
    //     0x37f610: stur            w0, [x1, #0xf]
    // 0x37f614: r16 = "x"
    //     0x37f614: add             x16, PP, #0x14, lsl #12  ; [pp+0x14498] "x"
    //     0x37f618: ldr             x16, [x16, #0x498]
    // 0x37f61c: StoreField: r1->field_13 = r16
    //     0x37f61c: stur            w16, [x1, #0x13]
    // 0x37f620: str             x1, [SP]
    // 0x37f624: r0 = _interpolate()
    //     0x37f624: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x37f628: stur            x0, [fp, #-8]
    // 0x37f62c: r16 = 0.900000
    //     0x37f62c: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x37f630: ldr             x16, [x16, #0x30]
    // 0x37f634: str             x16, [SP]
    // 0x37f638: r1 = Instance_Color
    //     0x37f638: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x37f63c: ldr             x1, [x1, #0x710]
    // 0x37f640: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x37f640: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x37f644: ldr             x4, [x4, #0x1f0]
    // 0x37f648: r0 = withValues()
    //     0x37f648: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x37f64c: stur            x0, [fp, #-0x10]
    // 0x37f650: r0 = TextStyle()
    //     0x37f650: bl              #0x31e4c4  ; AllocateTextStyleStub -> TextStyle (size=0x70)
    // 0x37f654: mov             x1, x0
    // 0x37f658: r0 = true
    //     0x37f658: add             x0, NULL, #0x20  ; true
    // 0x37f65c: stur            x1, [fp, #-0x18]
    // 0x37f660: StoreField: r1->field_7 = r0
    //     0x37f660: stur            w0, [x1, #7]
    // 0x37f664: ldur            x0, [fp, #-0x10]
    // 0x37f668: StoreField: r1->field_b = r0
    //     0x37f668: stur            w0, [x1, #0xb]
    // 0x37f66c: r0 = 32.000000
    //     0x37f66c: add             x0, PP, #0x13, lsl #12  ; [pp+0x137f0] 32
    //     0x37f670: ldr             x0, [x0, #0x7f0]
    // 0x37f674: StoreField: r1->field_1f = r0
    //     0x37f674: stur            w0, [x1, #0x1f]
    // 0x37f678: r0 = Text()
    //     0x37f678: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x37f67c: mov             x1, x0
    // 0x37f680: ldur            x0, [fp, #-8]
    // 0x37f684: stur            x1, [fp, #-0x10]
    // 0x37f688: StoreField: r1->field_b = r0
    //     0x37f688: stur            w0, [x1, #0xb]
    // 0x37f68c: ldur            x0, [fp, #-0x18]
    // 0x37f690: StoreField: r1->field_13 = r0
    //     0x37f690: stur            w0, [x1, #0x13]
    // 0x37f694: r0 = AnimatedOpacity()
    //     0x37f694: bl              #0x3716e4  ; AllocateAnimatedOpacityStub -> AnimatedOpacity (size=0x28)
    // 0x37f698: ldur            x1, [fp, #-0x10]
    // 0x37f69c: ArrayStore: r0[0] = r1  ; List_4
    //     0x37f69c: stur            w1, [x0, #0x17]
    // 0x37f6a0: ldur            d0, [fp, #-0x20]
    // 0x37f6a4: StoreField: r0->field_1b = d0
    //     0x37f6a4: stur            d0, [x0, #0x1b]
    // 0x37f6a8: r1 = false
    //     0x37f6a8: add             x1, NULL, #0x30  ; false
    // 0x37f6ac: StoreField: r0->field_23 = r1
    //     0x37f6ac: stur            w1, [x0, #0x23]
    // 0x37f6b0: r1 = Instance__Linear
    //     0x37f6b0: ldr             x1, [PP, #0x7870]  ; [pp+0x7870] Obj!_Linear@5cce21
    // 0x37f6b4: StoreField: r0->field_b = r1
    //     0x37f6b4: stur            w1, [x0, #0xb]
    // 0x37f6b8: r1 = Instance_Duration
    //     0x37f6b8: add             x1, PP, #9, lsl #12  ; [pp+0x9188] Obj!Duration@5dcd01
    //     0x37f6bc: ldr             x1, [x1, #0x188]
    // 0x37f6c0: StoreField: r0->field_f = r1
    //     0x37f6c0: stur            w1, [x0, #0xf]
    // 0x37f6c4: LeaveFrame
    //     0x37f6c4: mov             SP, fp
    //     0x37f6c8: ldp             fp, lr, [SP], #0x10
    // 0x37f6cc: ret
    //     0x37f6cc: ret             
    // 0x37f6d0: r0 = StackOverflowSharedWithFPURegs()
    //     0x37f6d0: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x37f6d4: b               #0x37f5d0
  }
  [closure] Text <anonymous closure>(dynamic, BuildContext, int, Widget?) {
    // ** addr: 0x37faa4, size: 0xb4
    // 0x37faa4: EnterFrame
    //     0x37faa4: stp             fp, lr, [SP, #-0x10]!
    //     0x37faa8: mov             fp, SP
    // 0x37faac: AllocStack(0x20)
    //     0x37faac: sub             SP, SP, #0x20
    // 0x37fab0: CheckStackOverflow
    //     0x37fab0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37fab4: cmp             SP, x16
    //     0x37fab8: b.ls            #0x37fb50
    // 0x37fabc: ldr             x16, [fp, #0x18]
    // 0x37fac0: str             x16, [SP]
    // 0x37fac4: r0 = _interpolateSingle()
    //     0x37fac4: bl              #0x2412a0  ; [dart:core] _StringBase::_interpolateSingle
    // 0x37fac8: stur            x0, [fp, #-8]
    // 0x37facc: r16 = 0.900000
    //     0x37facc: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x37fad0: ldr             x16, [x16, #0x30]
    // 0x37fad4: str             x16, [SP]
    // 0x37fad8: r1 = Instance_Color
    //     0x37fad8: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x37fadc: ldr             x1, [x1, #0x710]
    // 0x37fae0: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x37fae0: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x37fae4: ldr             x4, [x4, #0x1f0]
    // 0x37fae8: r0 = withValues()
    //     0x37fae8: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x37faec: stur            x0, [fp, #-0x10]
    // 0x37faf0: r0 = TextStyle()
    //     0x37faf0: bl              #0x31e4c4  ; AllocateTextStyleStub -> TextStyle (size=0x70)
    // 0x37faf4: mov             x1, x0
    // 0x37faf8: r0 = true
    //     0x37faf8: add             x0, NULL, #0x20  ; true
    // 0x37fafc: stur            x1, [fp, #-0x18]
    // 0x37fb00: StoreField: r1->field_7 = r0
    //     0x37fb00: stur            w0, [x1, #7]
    // 0x37fb04: ldur            x0, [fp, #-0x10]
    // 0x37fb08: StoreField: r1->field_b = r0
    //     0x37fb08: stur            w0, [x1, #0xb]
    // 0x37fb0c: r0 = 32.000000
    //     0x37fb0c: add             x0, PP, #0x13, lsl #12  ; [pp+0x137f0] 32
    //     0x37fb10: ldr             x0, [x0, #0x7f0]
    // 0x37fb14: StoreField: r1->field_1f = r0
    //     0x37fb14: stur            w0, [x1, #0x1f]
    // 0x37fb18: r0 = 0.700000
    //     0x37fb18: add             x0, PP, #0x14, lsl #12  ; [pp+0x144e0] 0.7
    //     0x37fb1c: ldr             x0, [x0, #0x4e0]
    // 0x37fb20: StoreField: r1->field_37 = r0
    //     0x37fb20: stur            w0, [x1, #0x37]
    // 0x37fb24: r0 = Text()
    //     0x37fb24: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x37fb28: ldur            x1, [fp, #-8]
    // 0x37fb2c: StoreField: r0->field_b = r1
    //     0x37fb2c: stur            w1, [x0, #0xb]
    // 0x37fb30: ldur            x1, [fp, #-0x18]
    // 0x37fb34: StoreField: r0->field_13 = r1
    //     0x37fb34: stur            w1, [x0, #0x13]
    // 0x37fb38: r1 = Instance_TextAlign
    //     0x37fb38: add             x1, PP, #0x11, lsl #12  ; [pp+0x11318] Obj!TextAlign@5dc011
    //     0x37fb3c: ldr             x1, [x1, #0x318]
    // 0x37fb40: StoreField: r0->field_1b = r1
    //     0x37fb40: stur            w1, [x0, #0x1b]
    // 0x37fb44: LeaveFrame
    //     0x37fb44: mov             SP, fp
    //     0x37fb48: ldp             fp, lr, [SP], #0x10
    // 0x37fb4c: ret
    //     0x37fb4c: ret             
    // 0x37fb50: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37fb50: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37fb54: b               #0x37fabc
  }
  [closure] Text <anonymous closure>(dynamic, BuildContext, int, Widget?) {
    // ** addr: 0x37fb58, size: 0x280
    // 0x37fb58: EnterFrame
    //     0x37fb58: stp             fp, lr, [SP, #-0x10]!
    //     0x37fb5c: mov             fp, SP
    // 0x37fb60: AllocStack(0x28)
    //     0x37fb60: sub             SP, SP, #0x28
    // 0x37fb64: CheckStackOverflow
    //     0x37fb64: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37fb68: cmp             SP, x16
    //     0x37fb6c: b.ls            #0x37fdd0
    // 0x37fb70: ldr             x0, [fp, #0x18]
    // 0x37fb74: r1 = LoadInt32Instr(r0)
    //     0x37fb74: sbfx            x1, x0, #1, #0x1f
    //     0x37fb78: tbz             w0, #0, #0x37fb80
    //     0x37fb7c: ldur            x1, [x0, #7]
    // 0x37fb80: cmp             x1, #0
    // 0x37fb84: b.gt            #0x37fb90
    // 0x37fb88: r0 = ""
    //     0x37fb88: ldr             x0, [PP, #0x490]  ; [pp+0x490] ""
    // 0x37fb8c: b               #0x37fd4c
    // 0x37fb90: r0 = LoadStaticField(0x468)
    //     0x37fb90: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37fb94: ldr             x0, [x0, #0x8d0]
    // 0x37fb98: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37fb9c: cmp             w0, w16
    // 0x37fba0: b.ne            #0x37fbac
    // 0x37fba4: r2 = instance
    //     0x37fba4: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x37fba8: r0 = InitLateFinalStaticField()
    //     0x37fba8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37fbac: r16 = <AppLocale, Translations>
    //     0x37fbac: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x37fbb0: stp             x0, x16, [SP]
    // 0x37fbb4: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x37fbb4: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x37fbb8: r0 = LocaleSettingsExt.currentTranslations()
    //     0x37fbb8: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x37fbbc: r1 = LoadClassIdInstr(r0)
    //     0x37fbbc: ldur            x1, [x0, #-1]
    //     0x37fbc0: ubfx            x1, x1, #0xc, #0x14
    // 0x37fbc4: cmp             x1, #0x8dd
    // 0x37fbc8: b.ne            #0x37fbf4
    // 0x37fbcc: mov             x1, x0
    // 0x37fbd0: LoadField: r0 = r1->field_13
    //     0x37fbd0: ldur            w0, [x1, #0x13]
    // 0x37fbd4: DecompressPointer r0
    //     0x37fbd4: add             x0, x0, HEAP, lsl #32
    // 0x37fbd8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37fbdc: cmp             w0, w16
    // 0x37fbe0: b.ne            #0x37fbf0
    // 0x37fbe4: r2 = playPage
    //     0x37fbe4: add             x2, PP, #0x12, lsl #12  ; [pp+0x12320] Field <Translations.playPage>: late final (offset: 0x14)
    //     0x37fbe8: ldr             x2, [x2, #0x320]
    // 0x37fbec: r0 = InitLateFinalInstanceField()
    //     0x37fbec: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37fbf0: b               #0x37fc78
    // 0x37fbf4: cmp             x1, #0x8df
    // 0x37fbf8: b.ne            #0x37fc24
    // 0x37fbfc: mov             x1, x0
    // 0x37fc00: LoadField: r0 = r1->field_37
    //     0x37fc00: ldur            w0, [x1, #0x37]
    // 0x37fc04: DecompressPointer r0
    //     0x37fc04: add             x0, x0, HEAP, lsl #32
    // 0x37fc08: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37fc0c: cmp             w0, w16
    // 0x37fc10: b.ne            #0x37fc20
    // 0x37fc14: r2 = playPage
    //     0x37fc14: add             x2, PP, #0x12, lsl #12  ; [pp+0x12328] Field <TranslationsRu.playPage>: late final (offset: 0x38)
    //     0x37fc18: ldr             x2, [x2, #0x328]
    // 0x37fc1c: r0 = InitLateFinalInstanceField()
    //     0x37fc1c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37fc20: b               #0x37fc78
    // 0x37fc24: cmp             x1, #0x8e0
    // 0x37fc28: b.ne            #0x37fc54
    // 0x37fc2c: mov             x1, x0
    // 0x37fc30: LoadField: r0 = r1->field_37
    //     0x37fc30: ldur            w0, [x1, #0x37]
    // 0x37fc34: DecompressPointer r0
    //     0x37fc34: add             x0, x0, HEAP, lsl #32
    // 0x37fc38: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37fc3c: cmp             w0, w16
    // 0x37fc40: b.ne            #0x37fc50
    // 0x37fc44: r2 = playPage
    //     0x37fc44: add             x2, PP, #0x12, lsl #12  ; [pp+0x12330] Field <TranslationsKk.playPage>: late final (offset: 0x38)
    //     0x37fc48: ldr             x2, [x2, #0x330]
    // 0x37fc4c: r0 = InitLateFinalInstanceField()
    //     0x37fc4c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37fc50: b               #0x37fc78
    // 0x37fc54: mov             x1, x0
    // 0x37fc58: LoadField: r0 = r1->field_37
    //     0x37fc58: ldur            w0, [x1, #0x37]
    // 0x37fc5c: DecompressPointer r0
    //     0x37fc5c: add             x0, x0, HEAP, lsl #32
    // 0x37fc60: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37fc64: cmp             w0, w16
    // 0x37fc68: b.ne            #0x37fc78
    // 0x37fc6c: r2 = playPage
    //     0x37fc6c: add             x2, PP, #0x12, lsl #12  ; [pp+0x12338] Field <TranslationsEs.playPage>: late final (offset: 0x38)
    //     0x37fc70: ldr             x2, [x2, #0x338]
    // 0x37fc74: r0 = InitLateFinalInstanceField()
    //     0x37fc74: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37fc78: r1 = LoadClassIdInstr(r0)
    //     0x37fc78: ldur            x1, [x0, #-1]
    //     0x37fc7c: ubfx            x1, x1, #0xc, #0x14
    // 0x37fc80: cmp             x1, #0xf8
    // 0x37fc84: b.ne            #0x37fcb8
    // 0x37fc88: ldr             x0, [fp, #0x18]
    // 0x37fc8c: r1 = Null
    //     0x37fc8c: mov             x1, NULL
    // 0x37fc90: r2 = 4
    //     0x37fc90: mov             x2, #4
    // 0x37fc94: r0 = AllocateArray()
    //     0x37fc94: bl              #0x5845d8  ; AllocateArrayStub
    // 0x37fc98: r16 = "Best: "
    //     0x37fc98: add             x16, PP, #0x14, lsl #12  ; [pp+0x144e8] "Best: "
    //     0x37fc9c: ldr             x16, [x16, #0x4e8]
    // 0x37fca0: StoreField: r0->field_f = r16
    //     0x37fca0: stur            w16, [x0, #0xf]
    // 0x37fca4: ldr             x3, [fp, #0x18]
    // 0x37fca8: StoreField: r0->field_13 = r3
    //     0x37fca8: stur            w3, [x0, #0x13]
    // 0x37fcac: str             x0, [SP]
    // 0x37fcb0: r0 = _interpolate()
    //     0x37fcb0: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x37fcb4: b               #0x37fd4c
    // 0x37fcb8: ldr             x3, [fp, #0x18]
    // 0x37fcbc: cmp             x1, #0xf9
    // 0x37fcc0: b.ne            #0x37fcf0
    // 0x37fcc4: r1 = Null
    //     0x37fcc4: mov             x1, NULL
    // 0x37fcc8: r2 = 4
    //     0x37fcc8: mov             x2, #4
    // 0x37fccc: r0 = AllocateArray()
    //     0x37fccc: bl              #0x5845d8  ; AllocateArrayStub
    // 0x37fcd0: r16 = "Лучший: "
    //     0x37fcd0: add             x16, PP, #0x14, lsl #12  ; [pp+0x144f0] "Лучший: "
    //     0x37fcd4: ldr             x16, [x16, #0x4f0]
    // 0x37fcd8: StoreField: r0->field_f = r16
    //     0x37fcd8: stur            w16, [x0, #0xf]
    // 0x37fcdc: ldr             x3, [fp, #0x18]
    // 0x37fce0: StoreField: r0->field_13 = r3
    //     0x37fce0: stur            w3, [x0, #0x13]
    // 0x37fce4: str             x0, [SP]
    // 0x37fce8: r0 = _interpolate()
    //     0x37fce8: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x37fcec: b               #0x37fd4c
    // 0x37fcf0: cmp             x1, #0xfa
    // 0x37fcf4: b.ne            #0x37fd24
    // 0x37fcf8: r1 = Null
    //     0x37fcf8: mov             x1, NULL
    // 0x37fcfc: r2 = 4
    //     0x37fcfc: mov             x2, #4
    // 0x37fd00: r0 = AllocateArray()
    //     0x37fd00: bl              #0x5845d8  ; AllocateArrayStub
    // 0x37fd04: r16 = "Үздік: "
    //     0x37fd04: add             x16, PP, #0x14, lsl #12  ; [pp+0x144f8] "Үздік: "
    //     0x37fd08: ldr             x16, [x16, #0x4f8]
    // 0x37fd0c: StoreField: r0->field_f = r16
    //     0x37fd0c: stur            w16, [x0, #0xf]
    // 0x37fd10: ldr             x3, [fp, #0x18]
    // 0x37fd14: StoreField: r0->field_13 = r3
    //     0x37fd14: stur            w3, [x0, #0x13]
    // 0x37fd18: str             x0, [SP]
    // 0x37fd1c: r0 = _interpolate()
    //     0x37fd1c: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x37fd20: b               #0x37fd4c
    // 0x37fd24: r1 = Null
    //     0x37fd24: mov             x1, NULL
    // 0x37fd28: r2 = 4
    //     0x37fd28: mov             x2, #4
    // 0x37fd2c: r0 = AllocateArray()
    //     0x37fd2c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x37fd30: r16 = "Mejor: "
    //     0x37fd30: add             x16, PP, #0x14, lsl #12  ; [pp+0x14500] "Mejor: "
    //     0x37fd34: ldr             x16, [x16, #0x500]
    // 0x37fd38: StoreField: r0->field_f = r16
    //     0x37fd38: stur            w16, [x0, #0xf]
    // 0x37fd3c: ldr             x1, [fp, #0x18]
    // 0x37fd40: StoreField: r0->field_13 = r1
    //     0x37fd40: stur            w1, [x0, #0x13]
    // 0x37fd44: str             x0, [SP]
    // 0x37fd48: r0 = _interpolate()
    //     0x37fd48: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x37fd4c: stur            x0, [fp, #-8]
    // 0x37fd50: r16 = 0.900000
    //     0x37fd50: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x37fd54: ldr             x16, [x16, #0x30]
    // 0x37fd58: str             x16, [SP]
    // 0x37fd5c: r1 = Instance_Color
    //     0x37fd5c: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x37fd60: ldr             x1, [x1, #0x710]
    // 0x37fd64: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x37fd64: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x37fd68: ldr             x4, [x4, #0x1f0]
    // 0x37fd6c: r0 = withValues()
    //     0x37fd6c: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x37fd70: stur            x0, [fp, #-0x10]
    // 0x37fd74: r0 = TextStyle()
    //     0x37fd74: bl              #0x31e4c4  ; AllocateTextStyleStub -> TextStyle (size=0x70)
    // 0x37fd78: mov             x1, x0
    // 0x37fd7c: r0 = true
    //     0x37fd7c: add             x0, NULL, #0x20  ; true
    // 0x37fd80: stur            x1, [fp, #-0x18]
    // 0x37fd84: StoreField: r1->field_7 = r0
    //     0x37fd84: stur            w0, [x1, #7]
    // 0x37fd88: ldur            x0, [fp, #-0x10]
    // 0x37fd8c: StoreField: r1->field_b = r0
    //     0x37fd8c: stur            w0, [x1, #0xb]
    // 0x37fd90: r0 = 12.000000
    //     0x37fd90: add             x0, PP, #0x14, lsl #12  ; [pp+0x14508] 12
    //     0x37fd94: ldr             x0, [x0, #0x508]
    // 0x37fd98: StoreField: r1->field_1f = r0
    //     0x37fd98: stur            w0, [x1, #0x1f]
    // 0x37fd9c: r0 = 1.000000
    //     0x37fd9c: ldr             x0, [PP, #0x78a0]  ; [pp+0x78a0] 1
    // 0x37fda0: StoreField: r1->field_37 = r0
    //     0x37fda0: stur            w0, [x1, #0x37]
    // 0x37fda4: r0 = Text()
    //     0x37fda4: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x37fda8: ldur            x1, [fp, #-8]
    // 0x37fdac: StoreField: r0->field_b = r1
    //     0x37fdac: stur            w1, [x0, #0xb]
    // 0x37fdb0: ldur            x1, [fp, #-0x18]
    // 0x37fdb4: StoreField: r0->field_13 = r1
    //     0x37fdb4: stur            w1, [x0, #0x13]
    // 0x37fdb8: r1 = Instance_TextAlign
    //     0x37fdb8: add             x1, PP, #0x11, lsl #12  ; [pp+0x11318] Obj!TextAlign@5dc011
    //     0x37fdbc: ldr             x1, [x1, #0x318]
    // 0x37fdc0: StoreField: r0->field_1b = r1
    //     0x37fdc0: stur            w1, [x0, #0x1b]
    // 0x37fdc4: LeaveFrame
    //     0x37fdc4: mov             SP, fp
    //     0x37fdc8: ldp             fp, lr, [SP], #0x10
    // 0x37fdcc: ret
    //     0x37fdcc: ret             
    // 0x37fdd0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37fdd0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37fdd4: b               #0x37fb70
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x37fdd8, size: 0x68
    // 0x37fdd8: EnterFrame
    //     0x37fdd8: stp             fp, lr, [SP, #-0x10]!
    //     0x37fddc: mov             fp, SP
    // 0x37fde0: AllocStack(0x20)
    //     0x37fde0: sub             SP, SP, #0x20
    // 0x37fde4: SetupParameters([dynamic _ /* r0 */])
    //     0x37fde4: ldr             x0, [fp, #0x10]
    //     0x37fde8: ldur            w1, [x0, #0x17]
    //     0x37fdec: add             x1, x1, HEAP, lsl #32
    // 0x37fdf0: CheckStackOverflow
    //     0x37fdf0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37fdf4: cmp             SP, x16
    //     0x37fdf8: b.ls            #0x37fe38
    // 0x37fdfc: LoadField: r0 = r1->field_f
    //     0x37fdfc: ldur            w0, [x1, #0xf]
    // 0x37fe00: DecompressPointer r0
    //     0x37fe00: add             x0, x0, HEAP, lsl #32
    // 0x37fe04: stur            x0, [fp, #-8]
    // 0x37fe08: r1 = Function '<anonymous closure>':.
    //     0x37fe08: add             x1, PP, #0x14, lsl #12  ; [pp+0x14510] AnonymousClosure: (0x37fe40), in [package:ricochlime/pages/play.dart] _PlayPageState::build (0x36fcd0)
    //     0x37fe0c: ldr             x1, [x1, #0x510]
    // 0x37fe10: r2 = Null
    //     0x37fe10: mov             x2, NULL
    // 0x37fe14: r0 = AllocateClosure()
    //     0x37fe14: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37fe18: stp             x0, NULL, [SP, #8]
    // 0x37fe1c: ldur            x16, [fp, #-8]
    // 0x37fe20: str             x16, [SP]
    // 0x37fe24: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x37fe24: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x37fe28: r0 = show()
    //     0x37fe28: bl              #0x37831c  ; [package:nes_ui/src/widgets/dialogs/nes_dialog.dart] NesDialog::show
    // 0x37fe2c: LeaveFrame
    //     0x37fe2c: mov             SP, fp
    //     0x37fe30: ldp             fp, lr, [SP], #0x10
    // 0x37fe34: ret
    //     0x37fe34: ret             
    // 0x37fe38: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37fe38: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37fe3c: b               #0x37fdfc
  }
  [closure] RestartGameDialog <anonymous closure>(dynamic, BuildContext) {
    // ** addr: 0x37fe40, size: 0x6c
    // 0x37fe40: EnterFrame
    //     0x37fe40: stp             fp, lr, [SP, #-0x10]!
    //     0x37fe44: mov             fp, SP
    // 0x37fe48: AllocStack(0x8)
    //     0x37fe48: sub             SP, SP, #8
    // 0x37fe4c: CheckStackOverflow
    //     0x37fe4c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37fe50: cmp             SP, x16
    //     0x37fe54: b.ls            #0x37fea4
    // 0x37fe58: r0 = LoadStaticField(0x860)
    //     0x37fe58: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37fe5c: ldr             x0, [x0, #0x10c0]
    // 0x37fe60: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37fe64: cmp             w0, w16
    // 0x37fe68: b.ne            #0x37fe78
    // 0x37fe6c: r2 = instance
    //     0x37fe6c: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x37fe70: ldr             x2, [x2, #0x6f0]
    // 0x37fe74: r0 = InitLateFinalStaticField()
    //     0x37fe74: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37fe78: mov             x2, x0
    // 0x37fe7c: r1 = Function 'restartGame':.
    //     0x37fe7c: add             x1, PP, #0x14, lsl #12  ; [pp+0x14518] AnonymousClosure: (0x37745c), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::restartGame (0x377348)
    //     0x37fe80: ldr             x1, [x1, #0x518]
    // 0x37fe84: r0 = AllocateClosure()
    //     0x37fe84: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37fe88: stur            x0, [fp, #-8]
    // 0x37fe8c: r0 = RestartGameDialog()
    //     0x37fe8c: bl              #0x37feac  ; AllocateRestartGameDialogStub -> RestartGameDialog (size=0x10)
    // 0x37fe90: ldur            x1, [fp, #-8]
    // 0x37fe94: StoreField: r0->field_b = r1
    //     0x37fe94: stur            w1, [x0, #0xb]
    // 0x37fe98: LeaveFrame
    //     0x37fe98: mov             SP, fp
    //     0x37fe9c: ldp             fp, lr, [SP], #0x10
    // 0x37fea0: ret
    //     0x37fea0: ret             
    // 0x37fea4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37fea4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37fea8: b               #0x37fe58
  }
  _ initState(/* No info */) {
    // ** addr: 0x3bf2ec, size: 0x270
    // 0x3bf2ec: EnterFrame
    //     0x3bf2ec: stp             fp, lr, [SP, #-0x10]!
    //     0x3bf2f0: mov             fp, SP
    // 0x3bf2f4: AllocStack(0x20)
    //     0x3bf2f4: sub             SP, SP, #0x20
    // 0x3bf2f8: SetupParameters(_PlayPageState this /* r1 => r2, fp-0x8 */)
    //     0x3bf2f8: mov             x2, x1
    //     0x3bf2fc: stur            x1, [fp, #-8]
    // 0x3bf300: CheckStackOverflow
    //     0x3bf300: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3bf304: cmp             SP, x16
    //     0x3bf308: b.ls            #0x3bf54c
    // 0x3bf30c: r0 = LoadStaticField(0x860)
    //     0x3bf30c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3bf310: ldr             x0, [x0, #0x10c0]
    // 0x3bf314: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3bf318: cmp             w0, w16
    // 0x3bf31c: b.ne            #0x3bf32c
    // 0x3bf320: r2 = instance
    //     0x3bf320: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x3bf324: ldr             x2, [x2, #0x6f0]
    // 0x3bf328: r0 = InitLateFinalStaticField()
    //     0x3bf328: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3bf32c: ldur            x2, [fp, #-8]
    // 0x3bf330: r1 = Function 'showGameOverDialog':.
    //     0x3bf330: add             x1, PP, #0x14, lsl #12  ; [pp+0x146f0] AnonymousClosure: (0x377310), in [package:ricochlime/pages/play.dart] _PlayPageState::showGameOverDialog (0x37822c)
    //     0x3bf334: ldr             x1, [x1, #0x6f0]
    // 0x3bf338: stur            x0, [fp, #-0x10]
    // 0x3bf33c: r0 = AllocateClosure()
    //     0x3bf33c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3bf340: ldur            x2, [fp, #-0x10]
    // 0x3bf344: StoreField: r2->field_bf = r0
    //     0x3bf344: stur            w0, [x2, #0xbf]
    //     0x3bf348: ldurb           w16, [x2, #-1]
    //     0x3bf34c: ldurb           w17, [x0, #-1]
    //     0x3bf350: and             x16, x17, x16, lsr #2
    //     0x3bf354: tst             x16, HEAP, lsr #32
    //     0x3bf358: b.eq            #0x3bf360
    //     0x3bf35c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3bf360: mov             x1, x2
    // 0x3bf364: LoadField: r0 = r1->field_9f
    //     0x3bf364: ldur            w0, [x1, #0x9f]
    // 0x3bf368: DecompressPointer r0
    //     0x3bf368: add             x0, x0, HEAP, lsl #32
    // 0x3bf36c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3bf370: cmp             w0, w16
    // 0x3bf374: b.ne            #0x3bf384
    // 0x3bf378: r2 = audio
    //     0x3bf378: add             x2, PP, #0x14, lsl #12  ; [pp+0x14548] Field <RicochlimeGame.audio>: late final (offset: 0xa0)
    //     0x3bf37c: ldr             x2, [x2, #0x548]
    // 0x3bf380: r0 = InitLateFinalInstanceField()
    //     0x3bf380: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3bf384: mov             x1, x0
    // 0x3bf388: r0 = playBgm()
    //     0x3bf388: bl              #0x28ce64  ; [package:ricochlime/utils/ricochlime_audio.dart] RicochlimeAudio::playBgm
    // 0x3bf38c: r0 = LoadStaticField(0x62c)
    //     0x3bf38c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3bf390: ldr             x0, [x0, #0xc58]
    // 0x3bf394: cmp             w0, NULL
    // 0x3bf398: b.eq            #0x3bf554
    // 0x3bf39c: LoadField: r2 = r0->field_f3
    //     0x3bf39c: ldur            w2, [x0, #0xf3]
    // 0x3bf3a0: DecompressPointer r2
    //     0x3bf3a0: add             x2, x2, HEAP, lsl #32
    // 0x3bf3a4: stur            x2, [fp, #-0x20]
    // 0x3bf3a8: LoadField: r0 = r2->field_b
    //     0x3bf3a8: ldur            w0, [x2, #0xb]
    // 0x3bf3ac: LoadField: r1 = r2->field_f
    //     0x3bf3ac: ldur            w1, [x2, #0xf]
    // 0x3bf3b0: DecompressPointer r1
    //     0x3bf3b0: add             x1, x1, HEAP, lsl #32
    // 0x3bf3b4: LoadField: r3 = r1->field_b
    //     0x3bf3b4: ldur            w3, [x1, #0xb]
    // 0x3bf3b8: r4 = LoadInt32Instr(r0)
    //     0x3bf3b8: sbfx            x4, x0, #1, #0x1f
    // 0x3bf3bc: stur            x4, [fp, #-0x18]
    // 0x3bf3c0: r0 = LoadInt32Instr(r3)
    //     0x3bf3c0: sbfx            x0, x3, #1, #0x1f
    // 0x3bf3c4: cmp             x4, x0
    // 0x3bf3c8: b.ne            #0x3bf3d4
    // 0x3bf3cc: mov             x1, x2
    // 0x3bf3d0: r0 = _growToNextCapacity()
    //     0x3bf3d0: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3bf3d4: ldur            x0, [fp, #-0x20]
    // 0x3bf3d8: ldur            x2, [fp, #-0x18]
    // 0x3bf3dc: add             x1, x2, #1
    // 0x3bf3e0: lsl             x3, x1, #1
    // 0x3bf3e4: StoreField: r0->field_b = r3
    //     0x3bf3e4: stur            w3, [x0, #0xb]
    // 0x3bf3e8: LoadField: r1 = r0->field_f
    //     0x3bf3e8: ldur            w1, [x0, #0xf]
    // 0x3bf3ec: DecompressPointer r1
    //     0x3bf3ec: add             x1, x1, HEAP, lsl #32
    // 0x3bf3f0: ldur            x0, [fp, #-8]
    // 0x3bf3f4: ArrayStore: r1[r2] = r0  ; List_4
    //     0x3bf3f4: add             x25, x1, x2, lsl #2
    //     0x3bf3f8: add             x25, x25, #0xf
    //     0x3bf3fc: str             w0, [x25]
    //     0x3bf400: tbz             w0, #0, #0x3bf41c
    //     0x3bf404: ldurb           w16, [x1, #-1]
    //     0x3bf408: ldurb           w17, [x0, #-1]
    //     0x3bf40c: and             x16, x17, x16, lsr #2
    //     0x3bf410: tst             x16, HEAP, lsr #32
    //     0x3bf414: b.eq            #0x3bf41c
    //     0x3bf418: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3bf41c: ldur            x1, [fp, #-0x10]
    // 0x3bf420: LoadField: r0 = r1->field_8f
    //     0x3bf420: ldur            w0, [x1, #0x8f]
    // 0x3bf424: DecompressPointer r0
    //     0x3bf424: add             x0, x0, HEAP, lsl #32
    // 0x3bf428: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3bf42c: cmp             w0, w16
    // 0x3bf430: b.ne            #0x3bf440
    // 0x3bf434: r2 = state
    //     0x3bf434: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x3bf438: ldr             x2, [x2, #0x790]
    // 0x3bf43c: r0 = InitLateFinalInstanceField()
    //     0x3bf43c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3bf440: LoadField: r1 = r0->field_27
    //     0x3bf440: ldur            w1, [x0, #0x27]
    // 0x3bf444: DecompressPointer r1
    //     0x3bf444: add             x1, x1, HEAP, lsl #32
    // 0x3bf448: r16 = Instance_GameState
    //     0x3bf448: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x3bf44c: ldr             x16, [x16, #0x7c8]
    // 0x3bf450: cmp             w1, w16
    // 0x3bf454: b.ne            #0x3bf53c
    // 0x3bf458: r0 = LoadStaticField(0x62c)
    //     0x3bf458: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3bf45c: ldr             x0, [x0, #0xc58]
    // 0x3bf460: cmp             w0, NULL
    // 0x3bf464: b.eq            #0x3bf558
    // 0x3bf468: LoadField: r3 = r0->field_53
    //     0x3bf468: ldur            w3, [x0, #0x53]
    // 0x3bf46c: DecompressPointer r3
    //     0x3bf46c: add             x3, x3, HEAP, lsl #32
    // 0x3bf470: stur            x3, [fp, #-0x10]
    // 0x3bf474: LoadField: r0 = r3->field_7
    //     0x3bf474: ldur            w0, [x3, #7]
    // 0x3bf478: DecompressPointer r0
    //     0x3bf478: add             x0, x0, HEAP, lsl #32
    // 0x3bf47c: stur            x0, [fp, #-8]
    // 0x3bf480: r1 = Function '<anonymous closure>':.
    //     0x3bf480: add             x1, PP, #0x14, lsl #12  ; [pp+0x146f8] AnonymousClosure: (0x3bf55c), in [package:ricochlime/pages/play.dart] _PlayPageState::initState (0x3bf2ec)
    //     0x3bf484: ldr             x1, [x1, #0x6f8]
    // 0x3bf488: r2 = Null
    //     0x3bf488: mov             x2, NULL
    // 0x3bf48c: r0 = AllocateClosure()
    //     0x3bf48c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3bf490: ldur            x2, [fp, #-8]
    // 0x3bf494: mov             x3, x0
    // 0x3bf498: r1 = Null
    //     0x3bf498: mov             x1, NULL
    // 0x3bf49c: stur            x3, [fp, #-8]
    // 0x3bf4a0: cmp             w2, NULL
    // 0x3bf4a4: b.eq            #0x3bf4c4
    // 0x3bf4a8: ArrayLoad: r4 = r2[0]  ; List_4
    //     0x3bf4a8: ldur            w4, [x2, #0x17]
    // 0x3bf4ac: DecompressPointer r4
    //     0x3bf4ac: add             x4, x4, HEAP, lsl #32
    // 0x3bf4b0: r8 = X0
    //     0x3bf4b0: ldr             x8, [PP, #0x5c8]  ; [pp+0x5c8] TypeParameter: X0
    // 0x3bf4b4: LoadField: r9 = r4->field_7
    //     0x3bf4b4: ldur            x9, [x4, #7]
    // 0x3bf4b8: r3 = Null
    //     0x3bf4b8: add             x3, PP, #0x14, lsl #12  ; [pp+0x14700] Null
    //     0x3bf4bc: ldr             x3, [x3, #0x700]
    // 0x3bf4c0: blr             x9
    // 0x3bf4c4: ldur            x0, [fp, #-0x10]
    // 0x3bf4c8: LoadField: r1 = r0->field_b
    //     0x3bf4c8: ldur            w1, [x0, #0xb]
    // 0x3bf4cc: LoadField: r2 = r0->field_f
    //     0x3bf4cc: ldur            w2, [x0, #0xf]
    // 0x3bf4d0: DecompressPointer r2
    //     0x3bf4d0: add             x2, x2, HEAP, lsl #32
    // 0x3bf4d4: LoadField: r3 = r2->field_b
    //     0x3bf4d4: ldur            w3, [x2, #0xb]
    // 0x3bf4d8: r2 = LoadInt32Instr(r1)
    //     0x3bf4d8: sbfx            x2, x1, #1, #0x1f
    // 0x3bf4dc: stur            x2, [fp, #-0x18]
    // 0x3bf4e0: r1 = LoadInt32Instr(r3)
    //     0x3bf4e0: sbfx            x1, x3, #1, #0x1f
    // 0x3bf4e4: cmp             x2, x1
    // 0x3bf4e8: b.ne            #0x3bf4f4
    // 0x3bf4ec: mov             x1, x0
    // 0x3bf4f0: r0 = _growToNextCapacity()
    //     0x3bf4f0: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3bf4f4: ldur            x2, [fp, #-0x10]
    // 0x3bf4f8: ldur            x3, [fp, #-0x18]
    // 0x3bf4fc: add             x4, x3, #1
    // 0x3bf500: lsl             x5, x4, #1
    // 0x3bf504: StoreField: r2->field_b = r5
    //     0x3bf504: stur            w5, [x2, #0xb]
    // 0x3bf508: LoadField: r1 = r2->field_f
    //     0x3bf508: ldur            w1, [x2, #0xf]
    // 0x3bf50c: DecompressPointer r1
    //     0x3bf50c: add             x1, x1, HEAP, lsl #32
    // 0x3bf510: ldur            x0, [fp, #-8]
    // 0x3bf514: ArrayStore: r1[r3] = r0  ; List_4
    //     0x3bf514: add             x25, x1, x3, lsl #2
    //     0x3bf518: add             x25, x25, #0xf
    //     0x3bf51c: str             w0, [x25]
    //     0x3bf520: tbz             w0, #0, #0x3bf53c
    //     0x3bf524: ldurb           w16, [x1, #-1]
    //     0x3bf528: ldurb           w17, [x0, #-1]
    //     0x3bf52c: and             x16, x17, x16, lsr #2
    //     0x3bf530: tst             x16, HEAP, lsr #32
    //     0x3bf534: b.eq            #0x3bf53c
    //     0x3bf538: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3bf53c: r0 = Null
    //     0x3bf53c: mov             x0, NULL
    // 0x3bf540: LeaveFrame
    //     0x3bf540: mov             SP, fp
    //     0x3bf544: ldp             fp, lr, [SP], #0x10
    // 0x3bf548: ret
    //     0x3bf548: ret             
    // 0x3bf54c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3bf54c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3bf550: b               #0x3bf30c
    // 0x3bf554: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3bf554: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3bf558: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3bf558: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] void <anonymous closure>(dynamic, Duration) {
    // ** addr: 0x3bf55c, size: 0x50
    // 0x3bf55c: EnterFrame
    //     0x3bf55c: stp             fp, lr, [SP, #-0x10]!
    //     0x3bf560: mov             fp, SP
    // 0x3bf564: CheckStackOverflow
    //     0x3bf564: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3bf568: cmp             SP, x16
    //     0x3bf56c: b.ls            #0x3bf5a4
    // 0x3bf570: r0 = LoadStaticField(0x860)
    //     0x3bf570: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3bf574: ldr             x0, [x0, #0x10c0]
    // 0x3bf578: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3bf57c: cmp             w0, w16
    // 0x3bf580: b.ne            #0x3bf590
    // 0x3bf584: r2 = instance
    //     0x3bf584: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x3bf588: ldr             x2, [x2, #0x6f0]
    // 0x3bf58c: r0 = InitLateFinalStaticField()
    //     0x3bf58c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3bf590: mov             x1, x0
    // 0x3bf594: r0 = gameOver()
    //     0x3bf594: bl              #0x376b2c  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::gameOver
    // 0x3bf598: LeaveFrame
    //     0x3bf598: mov             SP, fp
    //     0x3bf59c: ldp             fp, lr, [SP], #0x10
    // 0x3bf5a0: ret
    //     0x3bf5a0: ret             
    // 0x3bf5a4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3bf5a4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3bf5a8: b               #0x3bf570
  }
  _ didChangeDependencies(/* No info */) {
    // ** addr: 0x3ebe74, size: 0xc0
    // 0x3ebe74: EnterFrame
    //     0x3ebe74: stp             fp, lr, [SP, #-0x10]!
    //     0x3ebe78: mov             fp, SP
    // 0x3ebe7c: AllocStack(0x10)
    //     0x3ebe7c: sub             SP, SP, #0x10
    // 0x3ebe80: SetupParameters(_PlayPageState this /* r1 => r0, fp-0x8 */)
    //     0x3ebe80: mov             x0, x1
    //     0x3ebe84: stur            x1, [fp, #-8]
    // 0x3ebe88: CheckStackOverflow
    //     0x3ebe88: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3ebe8c: cmp             SP, x16
    //     0x3ebe90: b.ls            #0x3ebf24
    // 0x3ebe94: LoadField: r1 = r0->field_f
    //     0x3ebe94: ldur            w1, [x0, #0xf]
    // 0x3ebe98: DecompressPointer r1
    //     0x3ebe98: add             x1, x1, HEAP, lsl #32
    // 0x3ebe9c: cmp             w1, NULL
    // 0x3ebea0: b.eq            #0x3ebf2c
    // 0x3ebea4: r0 = disableAnimationsOf()
    //     0x3ebea4: bl              #0x3ba15c  ; [package:flutter/src/widgets/media_query.dart] MediaQuery::disableAnimationsOf
    // 0x3ebea8: r0 = LoadStaticField(0x86c)
    //     0x3ebea8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3ebeac: ldr             x0, [x0, #0x10d8]
    // 0x3ebeb0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ebeb4: cmp             w0, w16
    // 0x3ebeb8: b.ne            #0x3ebec8
    // 0x3ebebc: r2 = isDarkMode
    //     0x3ebebc: add             x2, PP, #0x14, lsl #12  ; [pp+0x14380] Field <RicochlimeGame.isDarkMode>: static late final (offset: 0x86c)
    //     0x3ebec0: ldr             x2, [x2, #0x380]
    // 0x3ebec4: r0 = InitLateFinalStaticField()
    //     0x3ebec4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3ebec8: mov             x2, x0
    // 0x3ebecc: ldur            x0, [fp, #-8]
    // 0x3ebed0: stur            x2, [fp, #-0x10]
    // 0x3ebed4: LoadField: r1 = r0->field_f
    //     0x3ebed4: ldur            w1, [x0, #0xf]
    // 0x3ebed8: DecompressPointer r1
    //     0x3ebed8: add             x1, x1, HEAP, lsl #32
    // 0x3ebedc: cmp             w1, NULL
    // 0x3ebee0: b.eq            #0x3ebf30
    // 0x3ebee4: r0 = of()
    //     0x3ebee4: bl              #0x31bb3c  ; [package:flutter/src/material/theme.dart] Theme::of
    // 0x3ebee8: LoadField: r1 = r0->field_3f
    //     0x3ebee8: ldur            w1, [x0, #0x3f]
    // 0x3ebeec: DecompressPointer r1
    //     0x3ebeec: add             x1, x1, HEAP, lsl #32
    // 0x3ebef0: LoadField: r0 = r1->field_7
    //     0x3ebef0: ldur            w0, [x1, #7]
    // 0x3ebef4: DecompressPointer r0
    //     0x3ebef4: add             x0, x0, HEAP, lsl #32
    // 0x3ebef8: r16 = Instance_Brightness
    //     0x3ebef8: ldr             x16, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x3ebefc: cmp             w0, w16
    // 0x3ebf00: r16 = true
    //     0x3ebf00: add             x16, NULL, #0x20  ; true
    // 0x3ebf04: r17 = false
    //     0x3ebf04: add             x17, NULL, #0x30  ; false
    // 0x3ebf08: csel            x2, x16, x17, eq
    // 0x3ebf0c: ldur            x1, [fp, #-0x10]
    // 0x3ebf10: r0 = value=()
    //     0x3ebf10: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x3ebf14: r0 = Null
    //     0x3ebf14: mov             x0, NULL
    // 0x3ebf18: LeaveFrame
    //     0x3ebf18: mov             SP, fp
    //     0x3ebf1c: ldp             fp, lr, [SP], #0x10
    // 0x3ebf20: ret
    //     0x3ebf20: ret             
    // 0x3ebf24: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3ebf24: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3ebf28: b               #0x3ebe94
    // 0x3ebf2c: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3ebf2c: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3ebf30: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3ebf30: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  _ dispose(/* No info */) {
    // ** addr: 0x443fdc, size: 0xb0
    // 0x443fdc: EnterFrame
    //     0x443fdc: stp             fp, lr, [SP, #-0x10]!
    //     0x443fe0: mov             fp, SP
    // 0x443fe4: AllocStack(0x10)
    //     0x443fe4: sub             SP, SP, #0x10
    // 0x443fe8: SetupParameters(_PlayPageState this /* r1 => r2, fp-0x8 */)
    //     0x443fe8: mov             x2, x1
    //     0x443fec: stur            x1, [fp, #-8]
    // 0x443ff0: CheckStackOverflow
    //     0x443ff0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x443ff4: cmp             SP, x16
    //     0x443ff8: b.ls            #0x444080
    // 0x443ffc: r0 = LoadStaticField(0x860)
    //     0x443ffc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x444000: ldr             x0, [x0, #0x10c0]
    // 0x444004: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x444008: cmp             w0, w16
    // 0x44400c: b.ne            #0x44401c
    // 0x444010: r2 = instance
    //     0x444010: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x444014: ldr             x2, [x2, #0x6f0]
    // 0x444018: r0 = InitLateFinalStaticField()
    //     0x444018: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x44401c: stur            x0, [fp, #-0x10]
    // 0x444020: StoreField: r0->field_bf = rNULL
    //     0x444020: stur            NULL, [x0, #0xbf]
    // 0x444024: mov             x1, x0
    // 0x444028: r0 = cancelCurrentTurn()
    //     0x444028: bl              #0x3717e8  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::cancelCurrentTurn
    // 0x44402c: ldur            x1, [fp, #-0x10]
    // 0x444030: LoadField: r0 = r1->field_9f
    //     0x444030: ldur            w0, [x1, #0x9f]
    // 0x444034: DecompressPointer r0
    //     0x444034: add             x0, x0, HEAP, lsl #32
    // 0x444038: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x44403c: cmp             w0, w16
    // 0x444040: b.ne            #0x444050
    // 0x444044: r2 = audio
    //     0x444044: add             x2, PP, #0x14, lsl #12  ; [pp+0x14548] Field <RicochlimeGame.audio>: late final (offset: 0xa0)
    //     0x444048: ldr             x2, [x2, #0x548]
    // 0x44404c: r0 = InitLateFinalInstanceField()
    //     0x44404c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x444050: mov             x1, x0
    // 0x444054: r0 = pauseBgm()
    //     0x444054: bl              #0x283940  ; [package:ricochlime/utils/ricochlime_audio.dart] RicochlimeAudio::pauseBgm
    // 0x444058: r1 = LoadStaticField(0x62c)
    //     0x444058: ldr             x1, [THR, #0x78]  ; THR::field_table_values
    //     0x44405c: ldr             x1, [x1, #0xc58]
    // 0x444060: cmp             w1, NULL
    // 0x444064: b.eq            #0x444088
    // 0x444068: ldur            x2, [fp, #-8]
    // 0x44406c: r0 = removeObserver()
    //     0x44406c: bl              #0x44315c  ; [dart:mixin_deduplication] _MixinApplication166&BindingBase&GestureBinding&SchedulerBinding&ServicesBinding&PaintingBinding&SemanticsBinding&RendererBinding&WidgetsBinding::removeObserver
    // 0x444070: r0 = Null
    //     0x444070: mov             x0, NULL
    // 0x444074: LeaveFrame
    //     0x444074: mov             SP, fp
    //     0x444078: ldp             fp, lr, [SP], #0x10
    // 0x44407c: ret
    //     0x44407c: ret             
    // 0x444080: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x444080: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x444084: b               #0x443ffc
    // 0x444088: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x444088: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
}

// class id: 2768, size: 0xc, field offset: 0xc
//   const constructor, 
class FpsCounter extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x402950, size: 0x80
    // 0x402950: EnterFrame
    //     0x402950: stp             fp, lr, [SP, #-0x10]!
    //     0x402954: mov             fp, SP
    // 0x402958: AllocStack(0x10)
    //     0x402958: sub             SP, SP, #0x10
    // 0x40295c: CheckStackOverflow
    //     0x40295c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x402960: cmp             SP, x16
    //     0x402964: b.ls            #0x4029c8
    // 0x402968: r0 = LoadStaticField(0x87c)
    //     0x402968: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x40296c: ldr             x0, [x0, #0x10f8]
    // 0x402970: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402974: cmp             w0, w16
    // 0x402978: b.ne            #0x402988
    // 0x40297c: r2 = fpsStream
    //     0x40297c: add             x2, PP, #0x16, lsl #12  ; [pp+0x168f8] Field <RicochlimeGame.fpsStream>: static late final (offset: 0x87c)
    //     0x402980: ldr             x2, [x2, #0x8f8]
    // 0x402984: r0 = InitLateFinalStaticField()
    //     0x402984: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x402988: r1 = Function '<anonymous closure>':.
    //     0x402988: add             x1, PP, #0x16, lsl #12  ; [pp+0x16900] AnonymousClosure: (0x402a5c), in [package:ricochlime/pages/play.dart] FpsCounter::build (0x402950)
    //     0x40298c: ldr             x1, [x1, #0x900]
    // 0x402990: r2 = Null
    //     0x402990: mov             x2, NULL
    // 0x402994: stur            x0, [fp, #-8]
    // 0x402998: r0 = AllocateClosure()
    //     0x402998: bl              #0x5838bc  ; AllocateClosureStub
    // 0x40299c: r1 = <int, AsyncSnapshot<int>, int>
    //     0x40299c: add             x1, PP, #0x16, lsl #12  ; [pp+0x16908] TypeArguments: <int, AsyncSnapshot<int>, int>
    //     0x4029a0: ldr             x1, [x1, #0x908]
    // 0x4029a4: stur            x0, [fp, #-0x10]
    // 0x4029a8: r0 = StreamBuilder()
    //     0x4029a8: bl              #0x4029d0  ; AllocateStreamBuilderStub -> StreamBuilder<C2X0> (size=0x1c)
    // 0x4029ac: ldur            x1, [fp, #-0x10]
    // 0x4029b0: StoreField: r0->field_13 = r1
    //     0x4029b0: stur            w1, [x0, #0x13]
    // 0x4029b4: ldur            x1, [fp, #-8]
    // 0x4029b8: StoreField: r0->field_f = r1
    //     0x4029b8: stur            w1, [x0, #0xf]
    // 0x4029bc: LeaveFrame
    //     0x4029bc: mov             SP, fp
    //     0x4029c0: ldp             fp, lr, [SP], #0x10
    // 0x4029c4: ret
    //     0x4029c4: ret             
    // 0x4029c8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4029c8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4029cc: b               #0x402968
  }
  [closure] Text <anonymous closure>(dynamic, BuildContext, AsyncSnapshot<int>) {
    // ** addr: 0x402a5c, size: 0xe0
    // 0x402a5c: EnterFrame
    //     0x402a5c: stp             fp, lr, [SP, #-0x10]!
    //     0x402a60: mov             fp, SP
    // 0x402a64: AllocStack(0x20)
    //     0x402a64: sub             SP, SP, #0x20
    // 0x402a68: CheckStackOverflow
    //     0x402a68: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x402a6c: cmp             SP, x16
    //     0x402a70: b.ls            #0x402b34
    // 0x402a74: ldr             x0, [fp, #0x10]
    // 0x402a78: LoadField: r1 = r0->field_f
    //     0x402a78: ldur            w1, [x0, #0xf]
    // 0x402a7c: DecompressPointer r1
    //     0x402a7c: add             x1, x1, HEAP, lsl #32
    // 0x402a80: cmp             w1, NULL
    // 0x402a84: b.ne            #0x402a94
    // 0x402a88: r0 = LoadStaticField(0x880)
    //     0x402a88: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402a8c: ldr             x0, [x0, #0x1100]
    // 0x402a90: b               #0x402a98
    // 0x402a94: mov             x0, x1
    // 0x402a98: r1 = 60
    //     0x402a98: mov             x1, #0x3c
    // 0x402a9c: branchIfSmi(r0, 0x402aa8)
    //     0x402a9c: tbz             w0, #0, #0x402aa8
    // 0x402aa0: r1 = LoadClassIdInstr(r0)
    //     0x402aa0: ldur            x1, [x0, #-1]
    //     0x402aa4: ubfx            x1, x1, #0xc, #0x14
    // 0x402aa8: str             x0, [SP]
    // 0x402aac: mov             x0, x1
    // 0x402ab0: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x402ab0: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x402ab4: r0 = GDT[cid_x0 + 0x2f3d]()
    //     0x402ab4: mov             x17, #0x2f3d
    //     0x402ab8: add             lr, x0, x17
    //     0x402abc: ldr             lr, [x21, lr, lsl #3]
    //     0x402ac0: blr             lr
    // 0x402ac4: stur            x0, [fp, #-8]
    // 0x402ac8: r16 = 0.900000
    //     0x402ac8: add             x16, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x402acc: ldr             x16, [x16, #0x30]
    // 0x402ad0: str             x16, [SP]
    // 0x402ad4: r1 = Instance_Color
    //     0x402ad4: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x402ad8: ldr             x1, [x1, #0x710]
    // 0x402adc: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x402adc: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x402ae0: ldr             x4, [x4, #0x1f0]
    // 0x402ae4: r0 = withValues()
    //     0x402ae4: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x402ae8: stur            x0, [fp, #-0x10]
    // 0x402aec: r0 = TextStyle()
    //     0x402aec: bl              #0x31e4c4  ; AllocateTextStyleStub -> TextStyle (size=0x70)
    // 0x402af0: mov             x1, x0
    // 0x402af4: r0 = true
    //     0x402af4: add             x0, NULL, #0x20  ; true
    // 0x402af8: stur            x1, [fp, #-0x18]
    // 0x402afc: StoreField: r1->field_7 = r0
    //     0x402afc: stur            w0, [x1, #7]
    // 0x402b00: ldur            x0, [fp, #-0x10]
    // 0x402b04: StoreField: r1->field_b = r0
    //     0x402b04: stur            w0, [x1, #0xb]
    // 0x402b08: r0 = 24.000000
    //     0x402b08: add             x0, PP, #0xe, lsl #12  ; [pp+0xe480] 24
    //     0x402b0c: ldr             x0, [x0, #0x480]
    // 0x402b10: StoreField: r1->field_1f = r0
    //     0x402b10: stur            w0, [x1, #0x1f]
    // 0x402b14: r0 = Text()
    //     0x402b14: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x402b18: ldur            x1, [fp, #-8]
    // 0x402b1c: StoreField: r0->field_b = r1
    //     0x402b1c: stur            w1, [x0, #0xb]
    // 0x402b20: ldur            x1, [fp, #-0x18]
    // 0x402b24: StoreField: r0->field_13 = r1
    //     0x402b24: stur            w1, [x0, #0x13]
    // 0x402b28: LeaveFrame
    //     0x402b28: mov             SP, fp
    //     0x402b2c: ldp             fp, lr, [SP], #0x10
    // 0x402b30: ret
    //     0x402b30: ret             
    // 0x402b34: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x402b34: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x402b38: b               #0x402a74
  }
}

// class id: 2865, size: 0xc, field offset: 0xc
//   const constructor, 
class PlayPage extends StatefulWidget {

  _ createState(/* No info */) {
    // ** addr: 0x43ddfc, size: 0x24
    // 0x43ddfc: EnterFrame
    //     0x43ddfc: stp             fp, lr, [SP, #-0x10]!
    //     0x43de00: mov             fp, SP
    // 0x43de04: mov             x0, x1
    // 0x43de08: r1 = <PlayPage>
    //     0x43de08: add             x1, PP, #0x12, lsl #12  ; [pp+0x12c18] TypeArguments: <PlayPage>
    //     0x43de0c: ldr             x1, [x1, #0xc18]
    // 0x43de10: r0 = _PlayPageState()
    //     0x43de10: bl              #0x43de20  ; Allocate_PlayPageStateStub -> _PlayPageState (size=0x14)
    // 0x43de14: LeaveFrame
    //     0x43de14: mov             SP, fp
    //     0x43de18: ldp             fp, lr, [SP], #0x10
    // 0x43de1c: ret
    //     0x43de1c: ret             
  }
}
