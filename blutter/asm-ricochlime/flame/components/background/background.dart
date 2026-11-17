// lib: , url: package:ricochlime/flame/components/background/background.dart

// class id: 1049302, size: 0x8
class :: {
}

// class id: 1910, size: 0x58, field offset: 0x4c
class Background extends _MixinApplication264&PositionComponent&HasGameReference {

  late final double bottomOfIsland; // offset: 0x4c

  static _ preloadSprites(/* No info */) {
    // ** addr: 0x3c621c, size: 0x40
    // 0x3c621c: EnterFrame
    //     0x3c621c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c6220: mov             fp, SP
    // 0x3c6224: CheckStackOverflow
    //     0x3c6224: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c6228: cmp             SP, x16
    //     0x3c622c: b.ls            #0x3c6254
    // 0x3c6230: LoadField: r0 = r1->field_47
    //     0x3c6230: ldur            w0, [x1, #0x47]
    // 0x3c6234: DecompressPointer r0
    //     0x3c6234: add             x0, x0, HEAP, lsl #32
    // 0x3c6238: mov             x1, x0
    // 0x3c623c: r2 = "overworld.png"
    //     0x3c623c: add             x2, PP, #0xf, lsl #12  ; [pp+0xfee8] "overworld.png"
    //     0x3c6240: ldr             x2, [x2, #0xee8]
    // 0x3c6244: r0 = load()
    //     0x3c6244: bl              #0x3c4ce0  ; [package:flame/src/cache/images.dart] Images::load
    // 0x3c6248: LeaveFrame
    //     0x3c6248: mov             SP, fp
    //     0x3c624c: ldp             fp, lr, [SP], #0x10
    // 0x3c6250: ret
    //     0x3c6250: ret             
    // 0x3c6254: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c6254: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c6258: b               #0x3c6230
  }
  _ render(/* No info */) {
    // ** addr: 0x3c9894, size: 0x160
    // 0x3c9894: EnterFrame
    //     0x3c9894: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9898: mov             fp, SP
    // 0x3c989c: AllocStack(0x48)
    //     0x3c989c: sub             SP, SP, #0x48
    // 0x3c98a0: SetupParameters(Background this /* r1 => r0, fp-0x8 */, dynamic _ /* r2 => r1, fp-0x10 */)
    //     0x3c98a0: mov             x0, x1
    //     0x3c98a4: stur            x1, [fp, #-8]
    //     0x3c98a8: mov             x1, x2
    //     0x3c98ac: stur            x2, [fp, #-0x10]
    // 0x3c98b0: CheckStackOverflow
    //     0x3c98b0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c98b4: cmp             SP, x16
    //     0x3c98b8: b.ls            #0x3c99e8
    // 0x3c98bc: r0 = LoadStaticField(0x86c)
    //     0x3c98bc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c98c0: ldr             x0, [x0, #0x10d8]
    // 0x3c98c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c98c8: cmp             w0, w16
    // 0x3c98cc: b.ne            #0x3c98dc
    // 0x3c98d0: r2 = isDarkMode
    //     0x3c98d0: add             x2, PP, #0x14, lsl #12  ; [pp+0x14380] Field <RicochlimeGame.isDarkMode>: static late final (offset: 0x86c)
    //     0x3c98d4: ldr             x2, [x2, #0x380]
    // 0x3c98d8: r0 = InitLateFinalStaticField()
    //     0x3c98d8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c98dc: LoadField: r1 = r0->field_27
    //     0x3c98dc: ldur            w1, [x0, #0x27]
    // 0x3c98e0: DecompressPointer r1
    //     0x3c98e0: add             x1, x1, HEAP, lsl #32
    // 0x3c98e4: tbnz            w1, #4, #0x3c98f4
    // 0x3c98e8: r3 = Instance_Color
    //     0x3c98e8: add             x3, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x3c98ec: ldr             x3, [x3, #0x140]
    // 0x3c98f0: b               #0x3c98fc
    // 0x3c98f4: r3 = Instance_Color
    //     0x3c98f4: add             x3, PP, #9, lsl #12  ; [pp+0x9128] Obj!Color@5cfb51
    //     0x3c98f8: ldr             x3, [x3, #0x128]
    // 0x3c98fc: ldur            x2, [fp, #-8]
    // 0x3c9900: d0 = 4.000000
    //     0x3c9900: fmov            d0, #4.00000000
    // 0x3c9904: stur            x3, [fp, #-0x18]
    // 0x3c9908: LoadField: r0 = r2->field_3b
    //     0x3c9908: ldur            w0, [x2, #0x3b]
    // 0x3c990c: DecompressPointer r0
    //     0x3c990c: add             x0, x0, HEAP, lsl #32
    // 0x3c9910: LoadField: r4 = r0->field_7
    //     0x3c9910: ldur            w4, [x0, #7]
    // 0x3c9914: DecompressPointer r4
    //     0x3c9914: add             x4, x4, HEAP, lsl #32
    // 0x3c9918: LoadField: r0 = r4->field_13
    //     0x3c9918: ldur            w0, [x4, #0x13]
    // 0x3c991c: r1 = LoadInt32Instr(r0)
    //     0x3c991c: sbfx            x1, x0, #1, #0x1f
    // 0x3c9920: mov             x0, x1
    // 0x3c9924: r1 = 0
    //     0x3c9924: mov             x1, #0
    // 0x3c9928: cmp             x1, x0
    // 0x3c992c: b.hs            #0x3c99f0
    // 0x3c9930: ArrayLoad: d1 = r4[0]  ; List_8
    //     0x3c9930: ldur            s1, [x4, #0x17]
    // 0x3c9934: fcvt            d2, s1
    // 0x3c9938: fsub            d1, d2, d0
    // 0x3c993c: mov             x1, x2
    // 0x3c9940: stur            d1, [fp, #-0x30]
    // 0x3c9944: LoadField: r0 = r1->field_4b
    //     0x3c9944: ldur            w0, [x1, #0x4b]
    // 0x3c9948: DecompressPointer r0
    //     0x3c9948: add             x0, x0, HEAP, lsl #32
    // 0x3c994c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c9950: cmp             w0, w16
    // 0x3c9954: b.ne            #0x3c9964
    // 0x3c9958: r2 = bottomOfIsland
    //     0x3c9958: add             x2, PP, #0x1e, lsl #12  ; [pp+0x1e218] Field <Background.bottomOfIsland>: late final (offset: 0x4c)
    //     0x3c995c: ldr             x2, [x2, #0x218]
    // 0x3c9960: r0 = InitLateFinalInstanceField()
    //     0x3c9960: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3c9964: LoadField: d0 = r0->field_7
    //     0x3c9964: ldur            d0, [x0, #7]
    // 0x3c9968: d1 = 4.000000
    //     0x3c9968: fmov            d1, #4.00000000
    // 0x3c996c: fsub            d2, d0, d1
    // 0x3c9970: stur            d2, [fp, #-0x38]
    // 0x3c9974: r0 = Rect()
    //     0x3c9974: bl              #0x23d854  ; AllocateRectStub -> Rect (size=0x28)
    // 0x3c9978: d0 = 4.000000
    //     0x3c9978: fmov            d0, #4.00000000
    // 0x3c997c: stur            x0, [fp, #-8]
    // 0x3c9980: StoreField: r0->field_7 = d0
    //     0x3c9980: stur            d0, [x0, #7]
    // 0x3c9984: StoreField: r0->field_f = d0
    //     0x3c9984: stur            d0, [x0, #0xf]
    // 0x3c9988: ldur            d0, [fp, #-0x30]
    // 0x3c998c: ArrayStore: r0[0] = d0  ; List_8
    //     0x3c998c: stur            d0, [x0, #0x17]
    // 0x3c9990: ldur            d0, [fp, #-0x38]
    // 0x3c9994: StoreField: r0->field_1f = d0
    //     0x3c9994: stur            d0, [x0, #0x1f]
    // 0x3c9998: r16 = 136
    //     0x3c9998: mov             x16, #0x88
    // 0x3c999c: stp             x16, NULL, [SP]
    // 0x3c99a0: r0 = ByteData()
    //     0x3c99a0: bl              #0x23e6cc  ; [dart:typed_data] ByteData::ByteData
    // 0x3c99a4: stur            x0, [fp, #-0x20]
    // 0x3c99a8: r0 = Paint()
    //     0x3c99a8: bl              #0x28bc30  ; AllocatePaintStub -> Paint (size=0x10)
    // 0x3c99ac: mov             x3, x0
    // 0x3c99b0: ldur            x0, [fp, #-0x20]
    // 0x3c99b4: stur            x3, [fp, #-0x28]
    // 0x3c99b8: StoreField: r3->field_7 = r0
    //     0x3c99b8: stur            w0, [x3, #7]
    // 0x3c99bc: mov             x1, x3
    // 0x3c99c0: ldur            x2, [fp, #-0x18]
    // 0x3c99c4: r0 = color=()
    //     0x3c99c4: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x3c99c8: ldur            x1, [fp, #-0x10]
    // 0x3c99cc: ldur            x2, [fp, #-8]
    // 0x3c99d0: ldur            x3, [fp, #-0x28]
    // 0x3c99d4: r0 = drawRect()
    //     0x3c99d4: bl              #0x2e2fa4  ; [dart:ui] _NativeCanvas::drawRect
    // 0x3c99d8: r0 = Null
    //     0x3c99d8: mov             x0, NULL
    // 0x3c99dc: LeaveFrame
    //     0x3c99dc: mov             SP, fp
    //     0x3c99e0: ldp             fp, lr, [SP], #0x10
    // 0x3c99e4: ret
    //     0x3c99e4: ret             
    // 0x3c99e8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c99e8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c99ec: b               #0x3c98bc
    // 0x3c99f0: r0 = RangeErrorSharedWithFPURegs()
    //     0x3c99f0: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  double bottomOfIsland(Background) {
    // ** addr: 0x3c99f4, size: 0x114
    // 0x3c99f4: EnterFrame
    //     0x3c99f4: stp             fp, lr, [SP, #-0x10]!
    //     0x3c99f8: mov             fp, SP
    // 0x3c99fc: CheckStackOverflow
    //     0x3c99fc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c9a00: cmp             SP, x16
    //     0x3c9a04: b.ls            #0x3c9aec
    // 0x3c9a08: ldr             x0, [fp, #0x10]
    // 0x3c9a0c: LoadField: r1 = r0->field_47
    //     0x3c9a0c: ldur            w1, [x0, #0x47]
    // 0x3c9a10: DecompressPointer r1
    //     0x3c9a10: add             x1, x1, HEAP, lsl #32
    // 0x3c9a14: cmp             w1, NULL
    // 0x3c9a18: b.ne            #0x3c9a4c
    // 0x3c9a1c: mov             x1, x0
    // 0x3c9a20: r0 = _findGameAndCheck()
    //     0x3c9a20: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3c9a24: mov             x2, x0
    // 0x3c9a28: ldr             x1, [fp, #0x10]
    // 0x3c9a2c: StoreField: r1->field_47 = r0
    //     0x3c9a2c: stur            w0, [x1, #0x47]
    //     0x3c9a30: ldurb           w16, [x1, #-1]
    //     0x3c9a34: ldurb           w17, [x0, #-1]
    //     0x3c9a38: and             x16, x17, x16, lsr #2
    //     0x3c9a3c: tst             x16, HEAP, lsr #32
    //     0x3c9a40: b.eq            #0x3c9a48
    //     0x3c9a44: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3c9a48: mov             x1, x2
    // 0x3c9a4c: LoadField: r0 = r1->field_93
    //     0x3c9a4c: ldur            w0, [x1, #0x93]
    // 0x3c9a50: DecompressPointer r0
    //     0x3c9a50: add             x0, x0, HEAP, lsl #32
    // 0x3c9a54: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c9a58: cmp             w0, w16
    // 0x3c9a5c: b.ne            #0x3c9a6c
    // 0x3c9a60: r2 = player
    //     0x3c9a60: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x3c9a64: ldr             x2, [x2, #0x700]
    // 0x3c9a68: r0 = InitLateFinalInstanceField()
    //     0x3c9a68: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3c9a6c: LoadField: r2 = r0->field_37
    //     0x3c9a6c: ldur            w2, [x0, #0x37]
    // 0x3c9a70: DecompressPointer r2
    //     0x3c9a70: add             x2, x2, HEAP, lsl #32
    // 0x3c9a74: LoadField: r3 = r2->field_37
    //     0x3c9a74: ldur            w3, [x2, #0x37]
    // 0x3c9a78: DecompressPointer r3
    //     0x3c9a78: add             x3, x3, HEAP, lsl #32
    // 0x3c9a7c: LoadField: r2 = r3->field_7
    //     0x3c9a7c: ldur            w2, [x3, #7]
    // 0x3c9a80: DecompressPointer r2
    //     0x3c9a80: add             x2, x2, HEAP, lsl #32
    // 0x3c9a84: LoadField: r3 = r2->field_13
    //     0x3c9a84: ldur            w3, [x2, #0x13]
    // 0x3c9a88: r0 = LoadInt32Instr(r3)
    //     0x3c9a88: sbfx            x0, x3, #1, #0x1f
    // 0x3c9a8c: r1 = 1
    //     0x3c9a8c: mov             x1, #1
    // 0x3c9a90: cmp             x1, x0
    // 0x3c9a94: b.hs            #0x3c9af4
    // 0x3c9a98: LoadField: d0 = r2->field_1b
    //     0x3c9a98: ldur            s0, [x2, #0x1b]
    // 0x3c9a9c: fcvt            d1, s0
    // 0x3c9aa0: d0 = 9.200000
    //     0x3c9aa0: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e210] IMM: double(9.200000000000001) from 0x4022666666666667
    //     0x3c9aa4: ldr             d0, [x17, #0x210]
    // 0x3c9aa8: fadd            d2, d1, d0
    // 0x3c9aac: d0 = 8.000000
    //     0x3c9aac: fmov            d0, #8.00000000
    // 0x3c9ab0: fadd            d1, d2, d0
    // 0x3c9ab4: r0 = inline_Allocate_Double()
    //     0x3c9ab4: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x3c9ab8: add             x0, x0, #0x10
    //     0x3c9abc: cmp             x1, x0
    //     0x3c9ac0: b.ls            #0x3c9af8
    //     0x3c9ac4: str             x0, [THR, #0x60]  ; THR::top
    //     0x3c9ac8: sub             x0, x0, #0xf
    //     0x3c9acc: mov             x1, #0xe19c
    //     0x3c9ad0: movk            x1, #3, lsl #16
    //     0x3c9ad4: stur            x1, [x0, #-1]
    // 0x3c9ad8: dmb             ishst
    // 0x3c9adc: StoreField: r0->field_7 = d1
    //     0x3c9adc: stur            d1, [x0, #7]
    // 0x3c9ae0: LeaveFrame
    //     0x3c9ae0: mov             SP, fp
    //     0x3c9ae4: ldp             fp, lr, [SP], #0x10
    // 0x3c9ae8: ret
    //     0x3c9ae8: ret             
    // 0x3c9aec: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c9aec: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c9af0: b               #0x3c9a08
    // 0x3c9af4: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3c9af4: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3c9af8: SaveReg d1
    //     0x3c9af8: str             q1, [SP, #-0x10]!
    // 0x3c9afc: r0 = AllocateDouble()
    //     0x3c9afc: bl              #0x584528  ; AllocateDoubleStub
    // 0x3c9b00: RestoreReg d1
    //     0x3c9b00: ldr             q1, [SP], #0x10
    // 0x3c9b04: b               #0x3c9adc
  }
  _ update(/* No info */) {
    // ** addr: 0x3d16e0, size: 0xac
    // 0x3d16e0: EnterFrame
    //     0x3d16e0: stp             fp, lr, [SP, #-0x10]!
    //     0x3d16e4: mov             fp, SP
    // 0x3d16e8: AllocStack(0x10)
    //     0x3d16e8: sub             SP, SP, #0x10
    // 0x3d16ec: SetupParameters(Background this /* r1 => r0, fp-0x10 */)
    //     0x3d16ec: mov             x0, x1
    //     0x3d16f0: stur            x1, [fp, #-0x10]
    // 0x3d16f4: CheckStackOverflow
    //     0x3d16f4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d16f8: cmp             SP, x16
    //     0x3d16fc: b.ls            #0x3d1784
    // 0x3d1700: LoadField: r2 = r0->field_4f
    //     0x3d1700: ldur            x2, [x0, #0x4f]
    // 0x3d1704: stur            x2, [fp, #-8]
    // 0x3d1708: LoadField: r1 = r0->field_47
    //     0x3d1708: ldur            w1, [x0, #0x47]
    // 0x3d170c: DecompressPointer r1
    //     0x3d170c: add             x1, x1, HEAP, lsl #32
    // 0x3d1710: cmp             w1, NULL
    // 0x3d1714: b.ne            #0x3d174c
    // 0x3d1718: mov             x1, x0
    // 0x3d171c: r0 = _findGameAndCheck()
    //     0x3d171c: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d1720: mov             x1, x0
    // 0x3d1724: ldur            x2, [fp, #-0x10]
    // 0x3d1728: StoreField: r2->field_47 = r0
    //     0x3d1728: stur            w0, [x2, #0x47]
    //     0x3d172c: ldurb           w16, [x2, #-1]
    //     0x3d1730: ldurb           w17, [x0, #-1]
    //     0x3d1734: and             x16, x17, x16, lsr #2
    //     0x3d1738: tst             x16, HEAP, lsr #32
    //     0x3d173c: b.eq            #0x3d1744
    //     0x3d1740: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d1744: mov             x3, x1
    // 0x3d1748: b               #0x3d1754
    // 0x3d174c: mov             x2, x0
    // 0x3d1750: mov             x3, x1
    // 0x3d1754: ldur            x0, [fp, #-8]
    // 0x3d1758: LoadField: r4 = r3->field_b3
    //     0x3d1758: ldur            x4, [x3, #0xb3]
    // 0x3d175c: cmp             x0, x4
    // 0x3d1760: b.eq            #0x3d1774
    // 0x3d1764: LoadField: r0 = r1->field_b3
    //     0x3d1764: ldur            x0, [x1, #0xb3]
    // 0x3d1768: StoreField: r2->field_4f = r0
    //     0x3d1768: stur            x0, [x2, #0x4f]
    // 0x3d176c: mov             x1, x2
    // 0x3d1770: r0 = _updateChildren()
    //     0x3d1770: bl              #0x3d178c  ; [package:ricochlime/flame/components/background/background.dart] Background::_updateChildren
    // 0x3d1774: r0 = Null
    //     0x3d1774: mov             x0, NULL
    // 0x3d1778: LeaveFrame
    //     0x3d1778: mov             SP, fp
    //     0x3d177c: ldp             fp, lr, [SP], #0x10
    // 0x3d1780: ret
    //     0x3d1780: ret             
    // 0x3d1784: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d1784: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d1788: b               #0x3d1700
  }
  _ _updateChildren(/* No info */) {
    // ** addr: 0x3d178c, size: 0x68
    // 0x3d178c: EnterFrame
    //     0x3d178c: stp             fp, lr, [SP, #-0x10]!
    //     0x3d1790: mov             fp, SP
    // 0x3d1794: AllocStack(0x8)
    //     0x3d1794: sub             SP, SP, #8
    // 0x3d1798: SetupParameters(Background this /* r1 => r0, fp-0x8 */)
    //     0x3d1798: mov             x0, x1
    //     0x3d179c: stur            x1, [fp, #-8]
    // 0x3d17a0: CheckStackOverflow
    //     0x3d17a0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d17a4: cmp             SP, x16
    //     0x3d17a8: b.ls            #0x3d17ec
    // 0x3d17ac: r1 = Function '<anonymous closure>':.
    //     0x3d17ac: add             x1, PP, #0x1e, lsl #12  ; [pp+0x1e1f8] AnonymousClosure: (0x3d2e40), in [package:ricochlime/flame/components/background/background.dart] Background::_updateChildren (0x3d178c)
    //     0x3d17b0: ldr             x1, [x1, #0x1f8]
    // 0x3d17b4: r2 = Null
    //     0x3d17b4: mov             x2, NULL
    // 0x3d17b8: r0 = AllocateClosure()
    //     0x3d17b8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3d17bc: ldur            x1, [fp, #-8]
    // 0x3d17c0: mov             x2, x0
    // 0x3d17c4: r0 = removeWhere()
    //     0x3d17c4: bl              #0x37e810  ; [package:flame/src/components/core/component.dart] Component::removeWhere
    // 0x3d17c8: ldur            x1, [fp, #-8]
    // 0x3d17cc: r0 = _getTiles()
    //     0x3d17cc: bl              #0x3d17f4  ; [package:ricochlime/flame/components/background/background.dart] Background::_getTiles
    // 0x3d17d0: ldur            x1, [fp, #-8]
    // 0x3d17d4: mov             x2, x0
    // 0x3d17d8: r0 = addAll()
    //     0x3d17d8: bl              #0x2a5410  ; [package:flame/src/components/core/component.dart] Component::addAll
    // 0x3d17dc: r0 = Null
    //     0x3d17dc: mov             x0, NULL
    // 0x3d17e0: LeaveFrame
    //     0x3d17e0: mov             SP, fp
    //     0x3d17e4: ldp             fp, lr, [SP], #0x10
    // 0x3d17e8: ret
    //     0x3d17e8: ret             
    // 0x3d17ec: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d17ec: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d17f0: b               #0x3d17ac
  }
  _ _getTiles(/* No info */) {
    // ** addr: 0x3d17f4, size: 0x140
    // 0x3d17f4: EnterFrame
    //     0x3d17f4: stp             fp, lr, [SP, #-0x10]!
    //     0x3d17f8: mov             fp, SP
    // 0x3d17fc: AllocStack(0x20)
    //     0x3d17fc: sub             SP, SP, #0x20
    // 0x3d1800: SetupParameters(Background this /* r1 => r1, fp-0x10 */)
    //     0x3d1800: stur            NULL, [fp, #-8]
    //     0x3d1804: stur            x1, [fp, #-0x10]
    // 0x3d1808: CheckStackOverflow
    //     0x3d1808: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d180c: cmp             SP, x16
    //     0x3d1810: b.ls            #0x3d192c
    // 0x3d1814: r0 = <SpriteComponent>
    //     0x3d1814: add             x0, PP, #0x1e, lsl #12  ; [pp+0x1e200] TypeArguments: <SpriteComponent>
    //     0x3d1818: ldr             x0, [x0, #0x200]
    // 0x3d181c: r0 = InitSyncStar()
    //     0x3d181c: bl              #0x2f0934  ; InitSyncStarStub
    // 0x3d1820: r0 = Null
    //     0x3d1820: mov             x0, NULL
    // 0x3d1824: r0 = SuspendSyncStarAtStart()
    //     0x3d1824: bl              #0x2f07a8  ; SuspendSyncStarAtStartStub
    // 0x3d1828: r16 = 246
    //     0x3d1828: mov             x16, #0xf6
    // 0x3d182c: str             x16, [SP]
    // 0x3d1830: r1 = Null
    //     0x3d1830: mov             x1, NULL
    // 0x3d1834: r4 = const [0, 0x2, 0x1, 0x2, null]
    //     0x3d1834: ldr             x4, [PP, #0x928]  ; [pp+0x928] List(5) [0, 0x2, 0x1, 0x2, Null]
    // 0x3d1838: r0 = Random()
    //     0x3d1838: bl              #0x37e1a8  ; [dart:math] Random::Random
    // 0x3d183c: mov             x1, x0
    // 0x3d1840: r0 = 0
    //     0x3d1840: mov             x0, #0
    // 0x3d1844: add             x2, fp, w0, sxtw #2
    // 0x3d1848: LoadField: r2 = r2->field_fffffff8
    //     0x3d1848: ldur            x2, [x2, #-8]
    // 0x3d184c: ArrayLoad: r3 = r2[0]  ; List_4
    //     0x3d184c: ldur            w3, [x2, #0x17]
    // 0x3d1850: DecompressPointer r3
    //     0x3d1850: add             x3, x3, HEAP, lsl #32
    // 0x3d1854: mov             x2, x1
    // 0x3d1858: ldur            x1, [fp, #-0x10]
    // 0x3d185c: stur            x3, [fp, #-0x18]
    // 0x3d1860: r0 = _getGrassTuftTiles()
    //     0x3d1860: bl              #0x3d2b34  ; [package:ricochlime/flame/components/background/background.dart] Background::_getGrassTuftTiles
    // 0x3d1864: ldur            x1, [fp, #-0x18]
    // 0x3d1868: StoreField: r1->field_1b = r0
    //     0x3d1868: stur            w0, [x1, #0x1b]
    //     0x3d186c: ldurb           w16, [x1, #-1]
    //     0x3d1870: ldurb           w17, [x0, #-1]
    //     0x3d1874: and             x16, x17, x16, lsr #2
    //     0x3d1878: tst             x16, HEAP, lsr #32
    //     0x3d187c: b.eq            #0x3d1884
    //     0x3d1880: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d1884: r0 = true
    //     0x3d1884: add             x0, NULL, #0x20  ; true
    // 0x3d1888: r0 = SuspendSyncStarAtYield()
    //     0x3d1888: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d188c: r0 = 0
    //     0x3d188c: mov             x0, #0
    // 0x3d1890: add             x1, fp, w0, sxtw #2
    // 0x3d1894: LoadField: r1 = r1->field_fffffff8
    //     0x3d1894: ldur            x1, [x1, #-8]
    // 0x3d1898: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x3d1898: ldur            w2, [x1, #0x17]
    // 0x3d189c: DecompressPointer r2
    //     0x3d189c: add             x2, x2, HEAP, lsl #32
    // 0x3d18a0: ldur            x1, [fp, #-0x10]
    // 0x3d18a4: stur            x2, [fp, #-0x18]
    // 0x3d18a8: r0 = _getIslandTiles()
    //     0x3d18a8: bl              #0x3d2124  ; [package:ricochlime/flame/components/background/background.dart] Background::_getIslandTiles
    // 0x3d18ac: ldur            x1, [fp, #-0x18]
    // 0x3d18b0: StoreField: r1->field_1b = r0
    //     0x3d18b0: stur            w0, [x1, #0x1b]
    //     0x3d18b4: ldurb           w16, [x1, #-1]
    //     0x3d18b8: ldurb           w17, [x0, #-1]
    //     0x3d18bc: and             x16, x17, x16, lsr #2
    //     0x3d18c0: tst             x16, HEAP, lsr #32
    //     0x3d18c4: b.eq            #0x3d18cc
    //     0x3d18c8: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d18cc: r0 = true
    //     0x3d18cc: add             x0, NULL, #0x20  ; true
    // 0x3d18d0: r0 = SuspendSyncStarAtYield()
    //     0x3d18d0: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d18d4: r0 = 0
    //     0x3d18d4: mov             x0, #0
    // 0x3d18d8: add             x1, fp, w0, sxtw #2
    // 0x3d18dc: LoadField: r1 = r1->field_fffffff8
    //     0x3d18dc: ldur            x1, [x1, #-8]
    // 0x3d18e0: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x3d18e0: ldur            w0, [x1, #0x17]
    // 0x3d18e4: DecompressPointer r0
    //     0x3d18e4: add             x0, x0, HEAP, lsl #32
    // 0x3d18e8: ldur            x1, [fp, #-0x10]
    // 0x3d18ec: stur            x0, [fp, #-0x18]
    // 0x3d18f0: r0 = getSkullTiles()
    //     0x3d18f0: bl              #0x3d1934  ; [package:ricochlime/flame/components/background/background.dart] Background::getSkullTiles
    // 0x3d18f4: ldur            x1, [fp, #-0x18]
    // 0x3d18f8: StoreField: r1->field_1b = r0
    //     0x3d18f8: stur            w0, [x1, #0x1b]
    //     0x3d18fc: ldurb           w16, [x1, #-1]
    //     0x3d1900: ldurb           w17, [x0, #-1]
    //     0x3d1904: and             x16, x17, x16, lsr #2
    //     0x3d1908: tst             x16, HEAP, lsr #32
    //     0x3d190c: b.eq            #0x3d1914
    //     0x3d1910: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d1914: r0 = true
    //     0x3d1914: add             x0, NULL, #0x20  ; true
    // 0x3d1918: r0 = SuspendSyncStarAtYield()
    //     0x3d1918: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d191c: r0 = false
    //     0x3d191c: add             x0, NULL, #0x30  ; false
    // 0x3d1920: LeaveFrame
    //     0x3d1920: mov             SP, fp
    //     0x3d1924: ldp             fp, lr, [SP], #0x10
    // 0x3d1928: ret
    //     0x3d1928: ret             
    // 0x3d192c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d192c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d1930: b               #0x3d1814
  }
  _ getSkullTiles(/* No info */) {
    // ** addr: 0x3d1934, size: 0x660
    // 0x3d1934: EnterFrame
    //     0x3d1934: stp             fp, lr, [SP, #-0x10]!
    //     0x3d1938: mov             fp, SP
    // 0x3d193c: AllocStack(0x78)
    //     0x3d193c: sub             SP, SP, #0x78
    // 0x3d1940: SetupParameters(Background this /* r1 => r1, fp-0x10 */)
    //     0x3d1940: stur            NULL, [fp, #-8]
    //     0x3d1944: stur            x1, [fp, #-0x10]
    // 0x3d1948: CheckStackOverflow
    //     0x3d1948: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d194c: cmp             SP, x16
    //     0x3d1950: b.ls            #0x3d1f68
    // 0x3d1954: r0 = <SkullSprite>
    //     0x3d1954: add             x0, PP, #0x1e, lsl #12  ; [pp+0x1e208] TypeArguments: <SkullSprite>
    //     0x3d1958: ldr             x0, [x0, #0x208]
    // 0x3d195c: r0 = InitSyncStar()
    //     0x3d195c: bl              #0x2f0934  ; InitSyncStarStub
    // 0x3d1960: r0 = Null
    //     0x3d1960: mov             x0, NULL
    // 0x3d1964: r0 = SuspendSyncStarAtStart()
    //     0x3d1964: bl              #0x2f07a8  ; SuspendSyncStarAtStartStub
    // 0x3d1968: r16 = 2468
    //     0x3d1968: mov             x16, #0x9a4
    // 0x3d196c: str             x16, [SP]
    // 0x3d1970: r1 = Null
    //     0x3d1970: mov             x1, NULL
    // 0x3d1974: r4 = const [0, 0x2, 0x1, 0x2, null]
    //     0x3d1974: ldr             x4, [PP, #0x928]  ; [pp+0x928] List(5) [0, 0x2, 0x1, 0x2, Null]
    // 0x3d1978: r0 = Random()
    //     0x3d1978: bl              #0x37e1a8  ; [dart:math] Random::Random
    // 0x3d197c: mov             x2, x0
    // 0x3d1980: ldur            x0, [fp, #-0x10]
    // 0x3d1984: stur            x2, [fp, #-0x18]
    // 0x3d1988: LoadField: r1 = r0->field_47
    //     0x3d1988: ldur            w1, [x0, #0x47]
    // 0x3d198c: DecompressPointer r1
    //     0x3d198c: add             x1, x1, HEAP, lsl #32
    // 0x3d1990: cmp             w1, NULL
    // 0x3d1994: b.ne            #0x3d19c8
    // 0x3d1998: mov             x1, x0
    // 0x3d199c: r0 = _findGameAndCheck()
    //     0x3d199c: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d19a0: mov             x1, x0
    // 0x3d19a4: ldur            x2, [fp, #-0x10]
    // 0x3d19a8: StoreField: r2->field_47 = r0
    //     0x3d19a8: stur            w0, [x2, #0x47]
    //     0x3d19ac: ldurb           w16, [x2, #-1]
    //     0x3d19b0: ldurb           w17, [x0, #-1]
    //     0x3d19b4: and             x16, x17, x16, lsr #2
    //     0x3d19b8: tst             x16, HEAP, lsr #32
    //     0x3d19bc: b.eq            #0x3d19c4
    //     0x3d19c0: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d19c4: b               #0x3d19cc
    // 0x3d19c8: mov             x2, x0
    // 0x3d19cc: LoadField: r0 = r1->field_93
    //     0x3d19cc: ldur            w0, [x1, #0x93]
    // 0x3d19d0: DecompressPointer r0
    //     0x3d19d0: add             x0, x0, HEAP, lsl #32
    // 0x3d19d4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d19d8: cmp             w0, w16
    // 0x3d19dc: b.ne            #0x3d19ec
    // 0x3d19e0: r2 = player
    //     0x3d19e0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x3d19e4: ldr             x2, [x2, #0x700]
    // 0x3d19e8: r0 = InitLateFinalInstanceField()
    //     0x3d19e8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d19ec: LoadField: r1 = r0->field_37
    //     0x3d19ec: ldur            w1, [x0, #0x37]
    // 0x3d19f0: DecompressPointer r1
    //     0x3d19f0: add             x1, x1, HEAP, lsl #32
    // 0x3d19f4: LoadField: r0 = r1->field_37
    //     0x3d19f4: ldur            w0, [x1, #0x37]
    // 0x3d19f8: DecompressPointer r0
    //     0x3d19f8: add             x0, x0, HEAP, lsl #32
    // 0x3d19fc: LoadField: r2 = r0->field_7
    //     0x3d19fc: ldur            w2, [x0, #7]
    // 0x3d1a00: DecompressPointer r2
    //     0x3d1a00: add             x2, x2, HEAP, lsl #32
    // 0x3d1a04: LoadField: r0 = r2->field_13
    //     0x3d1a04: ldur            w0, [x2, #0x13]
    // 0x3d1a08: r1 = LoadInt32Instr(r0)
    //     0x3d1a08: sbfx            x1, x0, #1, #0x1f
    // 0x3d1a0c: mov             x0, x1
    // 0x3d1a10: r1 = 1
    //     0x3d1a10: mov             x1, #1
    // 0x3d1a14: cmp             x1, x0
    // 0x3d1a18: b.hs            #0x3d1f70
    // 0x3d1a1c: LoadField: d0 = r2->field_1b
    //     0x3d1a1c: ldur            s0, [x2, #0x1b]
    // 0x3d1a20: fcvt            d1, s0
    // 0x3d1a24: d0 = 9.200000
    //     0x3d1a24: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e210] IMM: double(9.200000000000001) from 0x4022666666666667
    //     0x3d1a28: ldr             d0, [x17, #0x210]
    // 0x3d1a2c: fsub            d2, d1, d0
    // 0x3d1a30: ldur            x0, [fp, #-0x10]
    // 0x3d1a34: stur            d2, [fp, #-0x48]
    // 0x3d1a38: LoadField: r1 = r0->field_47
    //     0x3d1a38: ldur            w1, [x0, #0x47]
    // 0x3d1a3c: DecompressPointer r1
    //     0x3d1a3c: add             x1, x1, HEAP, lsl #32
    // 0x3d1a40: cmp             w1, NULL
    // 0x3d1a44: b.ne            #0x3d1a7c
    // 0x3d1a48: mov             x1, x0
    // 0x3d1a4c: r0 = _findGameAndCheck()
    //     0x3d1a4c: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d1a50: mov             x1, x0
    // 0x3d1a54: ldur            x2, [fp, #-0x10]
    // 0x3d1a58: StoreField: r2->field_47 = r0
    //     0x3d1a58: stur            w0, [x2, #0x47]
    //     0x3d1a5c: ldurb           w16, [x2, #-1]
    //     0x3d1a60: ldurb           w17, [x0, #-1]
    //     0x3d1a64: and             x16, x17, x16, lsr #2
    //     0x3d1a68: tst             x16, HEAP, lsr #32
    //     0x3d1a6c: b.eq            #0x3d1a74
    //     0x3d1a70: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d1a74: mov             x0, x1
    // 0x3d1a78: b               #0x3d1a84
    // 0x3d1a7c: mov             x2, x0
    // 0x3d1a80: mov             x0, x1
    // 0x3d1a84: ldur            d0, [fp, #-0x48]
    // 0x3d1a88: d1 = 16.000000
    //     0x3d1a88: fmov            d1, #16.00000000
    // 0x3d1a8c: LoadField: r1 = r0->field_b3
    //     0x3d1a8c: ldur            x1, [x0, #0xb3]
    // 0x3d1a90: scvtf           d2, x1
    // 0x3d1a94: fmul            d3, d2, d1
    // 0x3d1a98: fsub            d1, d0, d3
    // 0x3d1a9c: mov             x1, x2
    // 0x3d1aa0: stur            d1, [fp, #-0x50]
    // 0x3d1aa4: LoadField: r0 = r1->field_4b
    //     0x3d1aa4: ldur            w0, [x1, #0x4b]
    // 0x3d1aa8: DecompressPointer r0
    //     0x3d1aa8: add             x0, x0, HEAP, lsl #32
    // 0x3d1aac: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d1ab0: cmp             w0, w16
    // 0x3d1ab4: b.ne            #0x3d1ac4
    // 0x3d1ab8: r2 = bottomOfIsland
    //     0x3d1ab8: add             x2, PP, #0x1e, lsl #12  ; [pp+0x1e218] Field <Background.bottomOfIsland>: late final (offset: 0x4c)
    //     0x3d1abc: ldr             x2, [x2, #0x218]
    // 0x3d1ac0: r0 = InitLateFinalInstanceField()
    //     0x3d1ac0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d1ac4: LoadField: d0 = r0->field_7
    //     0x3d1ac4: ldur            d0, [x0, #7]
    // 0x3d1ac8: stp             fp, lr, [SP, #-0x10]!
    // 0x3d1acc: mov             fp, SP
    // 0x3d1ad0: CallRuntime_LibcRound(double) -> double
    //     0x3d1ad0: and             SP, SP, #0xfffffffffffffff0
    //     0x3d1ad4: mov             sp, SP
    //     0x3d1ad8: ldr             x16, [THR, #0x770]  ; THR::LibcRound
    //     0x3d1adc: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x3d1ae0: blr             x16
    //     0x3d1ae4: mov             x16, #8
    //     0x3d1ae8: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x3d1aec: ldr             x16, [THR, #0x690]  ; THR::saved_stack_limit
    //     0x3d1af0: sub             sp, x16, #1, lsl #12
    //     0x3d1af4: mov             SP, fp
    //     0x3d1af8: ldp             fp, lr, [SP], #0x10
    // 0x3d1afc: mov             v1.16b, v0.16b
    // 0x3d1b00: d0 = 12.000000
    //     0x3d1b00: fmov            d0, #12.00000000
    // 0x3d1b04: fsub            d2, d1, d0
    // 0x3d1b08: ldur            x0, [fp, #-0x10]
    // 0x3d1b0c: ldur            d0, [fp, #-0x50]
    // 0x3d1b10: d1 = 4.000000
    //     0x3d1b10: fmov            d1, #4.00000000
    // 0x3d1b14: stur            d2, [fp, #-0x68]
    // 0x3d1b18: CheckStackOverflow
    //     0x3d1b18: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d1b1c: cmp             SP, x16
    //     0x3d1b20: b.ls            #0x3d1f74
    // 0x3d1b24: fcmp            d2, d0
    // 0x3d1b28: b.le            #0x3d1f58
    // 0x3d1b2c: fadd            d3, d2, d1
    // 0x3d1b30: stur            d3, [fp, #-0x60]
    // 0x3d1b34: fcvt            s4, d2
    // 0x3d1b38: stur            d4, [fp, #-0x58]
    // 0x3d1b3c: d5 = 4.000000
    //     0x3d1b3c: fmov            d5, #4.00000000
    // 0x3d1b40: stur            d5, [fp, #-0x48]
    // 0x3d1b44: CheckStackOverflow
    //     0x3d1b44: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d1b48: cmp             SP, x16
    //     0x3d1b4c: b.ls            #0x3d1f7c
    // 0x3d1b50: LoadField: r1 = r0->field_47
    //     0x3d1b50: ldur            w1, [x0, #0x47]
    // 0x3d1b54: DecompressPointer r1
    //     0x3d1b54: add             x1, x1, HEAP, lsl #32
    // 0x3d1b58: cmp             w1, NULL
    // 0x3d1b5c: b.ne            #0x3d1b94
    // 0x3d1b60: mov             x1, x0
    // 0x3d1b64: r0 = _findGameAndCheck()
    //     0x3d1b64: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d1b68: mov             x1, x0
    // 0x3d1b6c: ldur            x2, [fp, #-0x10]
    // 0x3d1b70: StoreField: r2->field_47 = r0
    //     0x3d1b70: stur            w0, [x2, #0x47]
    //     0x3d1b74: ldurb           w16, [x2, #-1]
    //     0x3d1b78: ldurb           w17, [x0, #-1]
    //     0x3d1b7c: and             x16, x17, x16, lsr #2
    //     0x3d1b80: tst             x16, HEAP, lsr #32
    //     0x3d1b84: b.eq            #0x3d1b8c
    //     0x3d1b88: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d1b8c: mov             x0, x1
    // 0x3d1b90: b               #0x3d1b9c
    // 0x3d1b94: mov             x2, x0
    // 0x3d1b98: mov             x0, x1
    // 0x3d1b9c: ldur            d0, [fp, #-0x48]
    // 0x3d1ba0: LoadField: r1 = r0->field_83
    //     0x3d1ba0: ldur            w1, [x0, #0x83]
    // 0x3d1ba4: DecompressPointer r1
    //     0x3d1ba4: add             x1, x1, HEAP, lsl #32
    // 0x3d1ba8: LoadField: r0 = r1->field_37
    //     0x3d1ba8: ldur            w0, [x1, #0x37]
    // 0x3d1bac: DecompressPointer r0
    //     0x3d1bac: add             x0, x0, HEAP, lsl #32
    // 0x3d1bb0: mov             x1, x0
    // 0x3d1bb4: r0 = size()
    //     0x3d1bb4: bl              #0x435520  ; [package:flame/src/camera/viewport.dart] Viewport::size
    // 0x3d1bb8: LoadField: r2 = r0->field_7
    //     0x3d1bb8: ldur            w2, [x0, #7]
    // 0x3d1bbc: DecompressPointer r2
    //     0x3d1bbc: add             x2, x2, HEAP, lsl #32
    // 0x3d1bc0: LoadField: r0 = r2->field_13
    //     0x3d1bc0: ldur            w0, [x2, #0x13]
    // 0x3d1bc4: r1 = LoadInt32Instr(r0)
    //     0x3d1bc4: sbfx            x1, x0, #1, #0x1f
    // 0x3d1bc8: mov             x0, x1
    // 0x3d1bcc: r1 = 0
    //     0x3d1bcc: mov             x1, #0
    // 0x3d1bd0: cmp             x1, x0
    // 0x3d1bd4: b.hs            #0x3d1f84
    // 0x3d1bd8: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x3d1bd8: ldur            s0, [x2, #0x17]
    // 0x3d1bdc: fcvt            d1, s0
    // 0x3d1be0: d0 = 4.000000
    //     0x3d1be0: fmov            d0, #4.00000000
    // 0x3d1be4: fsub            d2, d1, d0
    // 0x3d1be8: ldur            d1, [fp, #-0x48]
    // 0x3d1bec: fcmp            d2, d1
    // 0x3d1bf0: b.le            #0x3d1f48
    // 0x3d1bf4: ldur            x0, [fp, #-0x10]
    // 0x3d1bf8: LoadField: r1 = r0->field_47
    //     0x3d1bf8: ldur            w1, [x0, #0x47]
    // 0x3d1bfc: DecompressPointer r1
    //     0x3d1bfc: add             x1, x1, HEAP, lsl #32
    // 0x3d1c00: cmp             w1, NULL
    // 0x3d1c04: b.ne            #0x3d1c38
    // 0x3d1c08: mov             x1, x0
    // 0x3d1c0c: r0 = _findGameAndCheck()
    //     0x3d1c0c: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d1c10: mov             x1, x0
    // 0x3d1c14: ldur            x2, [fp, #-0x10]
    // 0x3d1c18: StoreField: r2->field_47 = r0
    //     0x3d1c18: stur            w0, [x2, #0x47]
    //     0x3d1c1c: ldurb           w16, [x2, #-1]
    //     0x3d1c20: ldurb           w17, [x0, #-1]
    //     0x3d1c24: and             x16, x17, x16, lsr #2
    //     0x3d1c28: tst             x16, HEAP, lsr #32
    //     0x3d1c2c: b.eq            #0x3d1c34
    //     0x3d1c30: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d1c34: b               #0x3d1c3c
    // 0x3d1c38: mov             x2, x0
    // 0x3d1c3c: ldur            d0, [fp, #-0x60]
    // 0x3d1c40: LoadField: r0 = r1->field_93
    //     0x3d1c40: ldur            w0, [x1, #0x93]
    // 0x3d1c44: DecompressPointer r0
    //     0x3d1c44: add             x0, x0, HEAP, lsl #32
    // 0x3d1c48: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d1c4c: cmp             w0, w16
    // 0x3d1c50: b.ne            #0x3d1c60
    // 0x3d1c54: r2 = player
    //     0x3d1c54: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x3d1c58: ldr             x2, [x2, #0x700]
    // 0x3d1c5c: r0 = InitLateFinalInstanceField()
    //     0x3d1c5c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d1c60: LoadField: r1 = r0->field_37
    //     0x3d1c60: ldur            w1, [x0, #0x37]
    // 0x3d1c64: DecompressPointer r1
    //     0x3d1c64: add             x1, x1, HEAP, lsl #32
    // 0x3d1c68: LoadField: r0 = r1->field_37
    //     0x3d1c68: ldur            w0, [x1, #0x37]
    // 0x3d1c6c: DecompressPointer r0
    //     0x3d1c6c: add             x0, x0, HEAP, lsl #32
    // 0x3d1c70: LoadField: r2 = r0->field_7
    //     0x3d1c70: ldur            w2, [x0, #7]
    // 0x3d1c74: DecompressPointer r2
    //     0x3d1c74: add             x2, x2, HEAP, lsl #32
    // 0x3d1c78: LoadField: r0 = r2->field_13
    //     0x3d1c78: ldur            w0, [x2, #0x13]
    // 0x3d1c7c: r1 = LoadInt32Instr(r0)
    //     0x3d1c7c: sbfx            x1, x0, #1, #0x1f
    // 0x3d1c80: mov             x0, x1
    // 0x3d1c84: r1 = 1
    //     0x3d1c84: mov             x1, #1
    // 0x3d1c88: cmp             x1, x0
    // 0x3d1c8c: b.hs            #0x3d1f88
    // 0x3d1c90: LoadField: d0 = r2->field_1b
    //     0x3d1c90: ldur            s0, [x2, #0x1b]
    // 0x3d1c94: fcvt            d1, s0
    // 0x3d1c98: ldur            d0, [fp, #-0x60]
    // 0x3d1c9c: fsub            d2, d0, d1
    // 0x3d1ca0: d1 = 0.000000
    //     0x3d1ca0: eor             v1.16b, v1.16b, v1.16b
    // 0x3d1ca4: fcmp            d2, d1
    // 0x3d1ca8: b.ne            #0x3d1cb4
    // 0x3d1cac: d3 = 0.000000
    //     0x3d1cac: eor             v3.16b, v3.16b, v3.16b
    // 0x3d1cb0: b               #0x3d1cc8
    // 0x3d1cb4: fcmp            d1, d2
    // 0x3d1cb8: b.le            #0x3d1cc4
    // 0x3d1cbc: fneg            d3, d2
    // 0x3d1cc0: mov             v2.16b, v3.16b
    // 0x3d1cc4: mov             v3.16b, v2.16b
    // 0x3d1cc8: d2 = 17.000000
    //     0x3d1cc8: fmov            d2, #17.00000000
    // 0x3d1ccc: fcmp            d2, d3
    // 0x3d1cd0: b.le            #0x3d1dcc
    // 0x3d1cd4: ldur            x0, [fp, #-0x10]
    // 0x3d1cd8: ldur            d4, [fp, #-0x48]
    // 0x3d1cdc: d3 = 4.000000
    //     0x3d1cdc: fmov            d3, #4.00000000
    // 0x3d1ce0: fadd            d5, d4, d3
    // 0x3d1ce4: stur            d5, [fp, #-0x70]
    // 0x3d1ce8: LoadField: r1 = r0->field_47
    //     0x3d1ce8: ldur            w1, [x0, #0x47]
    // 0x3d1cec: DecompressPointer r1
    //     0x3d1cec: add             x1, x1, HEAP, lsl #32
    // 0x3d1cf0: cmp             w1, NULL
    // 0x3d1cf4: b.ne            #0x3d1d28
    // 0x3d1cf8: mov             x1, x0
    // 0x3d1cfc: r0 = _findGameAndCheck()
    //     0x3d1cfc: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d1d00: mov             x1, x0
    // 0x3d1d04: ldur            x2, [fp, #-0x10]
    // 0x3d1d08: StoreField: r2->field_47 = r0
    //     0x3d1d08: stur            w0, [x2, #0x47]
    //     0x3d1d0c: ldurb           w16, [x2, #-1]
    //     0x3d1d10: ldurb           w17, [x0, #-1]
    //     0x3d1d14: and             x16, x17, x16, lsr #2
    //     0x3d1d18: tst             x16, HEAP, lsr #32
    //     0x3d1d1c: b.eq            #0x3d1d24
    //     0x3d1d20: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d1d24: b               #0x3d1d2c
    // 0x3d1d28: mov             x2, x0
    // 0x3d1d2c: ldur            d0, [fp, #-0x70]
    // 0x3d1d30: LoadField: r0 = r1->field_93
    //     0x3d1d30: ldur            w0, [x1, #0x93]
    // 0x3d1d34: DecompressPointer r0
    //     0x3d1d34: add             x0, x0, HEAP, lsl #32
    // 0x3d1d38: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d1d3c: cmp             w0, w16
    // 0x3d1d40: b.ne            #0x3d1d50
    // 0x3d1d44: r2 = player
    //     0x3d1d44: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x3d1d48: ldr             x2, [x2, #0x700]
    // 0x3d1d4c: r0 = InitLateFinalInstanceField()
    //     0x3d1d4c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d1d50: LoadField: r1 = r0->field_37
    //     0x3d1d50: ldur            w1, [x0, #0x37]
    // 0x3d1d54: DecompressPointer r1
    //     0x3d1d54: add             x1, x1, HEAP, lsl #32
    // 0x3d1d58: LoadField: r0 = r1->field_37
    //     0x3d1d58: ldur            w0, [x1, #0x37]
    // 0x3d1d5c: DecompressPointer r0
    //     0x3d1d5c: add             x0, x0, HEAP, lsl #32
    // 0x3d1d60: LoadField: r2 = r0->field_7
    //     0x3d1d60: ldur            w2, [x0, #7]
    // 0x3d1d64: DecompressPointer r2
    //     0x3d1d64: add             x2, x2, HEAP, lsl #32
    // 0x3d1d68: LoadField: r0 = r2->field_13
    //     0x3d1d68: ldur            w0, [x2, #0x13]
    // 0x3d1d6c: r1 = LoadInt32Instr(r0)
    //     0x3d1d6c: sbfx            x1, x0, #1, #0x1f
    // 0x3d1d70: mov             x0, x1
    // 0x3d1d74: r1 = 0
    //     0x3d1d74: mov             x1, #0
    // 0x3d1d78: cmp             x1, x0
    // 0x3d1d7c: b.hs            #0x3d1f8c
    // 0x3d1d80: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x3d1d80: ldur            s0, [x2, #0x17]
    // 0x3d1d84: fcvt            d1, s0
    // 0x3d1d88: ldur            d0, [fp, #-0x70]
    // 0x3d1d8c: fsub            d2, d0, d1
    // 0x3d1d90: d0 = 0.000000
    //     0x3d1d90: eor             v0.16b, v0.16b, v0.16b
    // 0x3d1d94: fcmp            d2, d0
    // 0x3d1d98: b.ne            #0x3d1da4
    // 0x3d1d9c: d2 = 0.000000
    //     0x3d1d9c: eor             v2.16b, v2.16b, v2.16b
    // 0x3d1da0: b               #0x3d1dbc
    // 0x3d1da4: fcmp            d0, d2
    // 0x3d1da8: b.le            #0x3d1db4
    // 0x3d1dac: fneg            d1, d2
    // 0x3d1db0: b               #0x3d1db8
    // 0x3d1db4: mov             v1.16b, v2.16b
    // 0x3d1db8: mov             v2.16b, v1.16b
    // 0x3d1dbc: d1 = 17.000000
    //     0x3d1dbc: fmov            d1, #17.00000000
    // 0x3d1dc0: fcmp            d1, d2
    // 0x3d1dc4: b.le            #0x3d1dd4
    // 0x3d1dc8: b               #0x3d1f20
    // 0x3d1dcc: mov             v0.16b, v1.16b
    // 0x3d1dd0: mov             v1.16b, v2.16b
    // 0x3d1dd4: ldur            x1, [fp, #-0x18]
    // 0x3d1dd8: r2 = 67108864
    //     0x3d1dd8: mov             x2, #0x4000000
    // 0x3d1ddc: r0 = nextInt()
    //     0x3d1ddc: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x3d1de0: scvtf           d0, x0
    // 0x3d1de4: d1 = 134217728.000000
    //     0x3d1de4: add             x17, PP, #0xd, lsl #12  ; [pp+0xd110] IMM: double(134217728) from 0x41a0000000000000
    //     0x3d1de8: ldr             d1, [x17, #0x110]
    // 0x3d1dec: fmul            d2, d0, d1
    // 0x3d1df0: ldur            x1, [fp, #-0x18]
    // 0x3d1df4: stur            d2, [fp, #-0x70]
    // 0x3d1df8: r2 = 134217728
    //     0x3d1df8: mov             x2, #0x8000000
    // 0x3d1dfc: r0 = nextInt()
    //     0x3d1dfc: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x3d1e00: scvtf           d0, x0
    // 0x3d1e04: ldur            d1, [fp, #-0x70]
    // 0x3d1e08: fadd            d2, d1, d0
    // 0x3d1e0c: d0 = 9007199254740992.000000
    //     0x3d1e0c: ldr             d0, [PP, #0xf70]  ; [pp+0xf70] IMM: double(9007199254740992) from 0x4340000000000000
    // 0x3d1e10: fdiv            d1, d2, d0
    // 0x3d1e14: d2 = 0.300000
    //     0x3d1e14: add             x17, PP, #0xd, lsl #12  ; [pp+0xd3c8] IMM: double(0.3) from 0x3fd3333333333333
    //     0x3d1e18: ldr             d2, [x17, #0x3c8]
    // 0x3d1e1c: fcmp            d1, d2
    // 0x3d1e20: b.gt            #0x3d1f20
    // 0x3d1e24: ldur            d1, [fp, #-0x48]
    // 0x3d1e28: ldur            d3, [fp, #-0x58]
    // 0x3d1e2c: r0 = 0
    //     0x3d1e2c: mov             x0, #0
    // 0x3d1e30: add             x1, fp, w0, sxtw #2
    // 0x3d1e34: LoadField: r1 = r1->field_fffffff8
    //     0x3d1e34: ldur            x1, [x1, #-8]
    // 0x3d1e38: ArrayLoad: r3 = r1[0]  ; List_4
    //     0x3d1e38: ldur            w3, [x1, #0x17]
    // 0x3d1e3c: DecompressPointer r3
    //     0x3d1e3c: add             x3, x3, HEAP, lsl #32
    // 0x3d1e40: ldur            x1, [fp, #-0x18]
    // 0x3d1e44: stur            x3, [fp, #-0x20]
    // 0x3d1e48: r2 = 5
    //     0x3d1e48: mov             x2, #5
    // 0x3d1e4c: r0 = nextInt()
    //     0x3d1e4c: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x3d1e50: mov             x1, x0
    // 0x3d1e54: mov             x2, x0
    // 0x3d1e58: r0 = 5
    //     0x3d1e58: mov             x0, #5
    // 0x3d1e5c: cmp             x1, x0
    // 0x3d1e60: b.hs            #0x3d1f90
    // 0x3d1e64: r0 = const [Instance of 'SkullType', Instance of 'SkullType', Instance of 'SkullType', Instance of 'SkullType', Instance of 'SkullType']
    //     0x3d1e64: add             x0, PP, #0x13, lsl #12  ; [pp+0x13730] List<SkullType>(5)
    //     0x3d1e68: ldr             x0, [x0, #0x730]
    // 0x3d1e6c: ArrayLoad: r1 = r0[r2]  ; Unknown_4
    //     0x3d1e6c: add             x16, x0, x2, lsl #2
    //     0x3d1e70: ldur            w1, [x16, #0xf]
    // 0x3d1e74: DecompressPointer r1
    //     0x3d1e74: add             x1, x1, HEAP, lsl #32
    // 0x3d1e78: stur            x1, [fp, #-0x28]
    // 0x3d1e7c: r0 = Vector2()
    //     0x3d1e7c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d1e80: r4 = 4
    //     0x3d1e80: mov             x4, #4
    // 0x3d1e84: stur            x0, [fp, #-0x30]
    // 0x3d1e88: r0 = AllocateFloat32Array()
    //     0x3d1e88: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d1e8c: ldur            x2, [fp, #-0x30]
    // 0x3d1e90: StoreField: r2->field_7 = r0
    //     0x3d1e90: stur            w0, [x2, #7]
    // 0x3d1e94: ldur            d0, [fp, #-0x58]
    // 0x3d1e98: StoreField: r0->field_1b = d0
    //     0x3d1e98: stur            s0, [x0, #0x1b]
    // 0x3d1e9c: ldur            d1, [fp, #-0x48]
    // 0x3d1ea0: fcvt            s2, d1
    // 0x3d1ea4: ArrayStore: r0[0] = d2  ; List_8
    //     0x3d1ea4: stur            s2, [x0, #0x17]
    // 0x3d1ea8: r0 = Vector2()
    //     0x3d1ea8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d1eac: r4 = 4
    //     0x3d1eac: mov             x4, #4
    // 0x3d1eb0: stur            x0, [fp, #-0x38]
    // 0x3d1eb4: r0 = AllocateFloat32Array()
    //     0x3d1eb4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d1eb8: ldur            x3, [fp, #-0x38]
    // 0x3d1ebc: StoreField: r3->field_7 = r0
    //     0x3d1ebc: stur            w0, [x3, #7]
    // 0x3d1ec0: d0 = 0.000000
    //     0x3d1ec0: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d1ec4: ldr             s0, [x17, #0x220]
    // 0x3d1ec8: StoreField: r0->field_1b = d0
    //     0x3d1ec8: stur            s0, [x0, #0x1b]
    // 0x3d1ecc: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d1ecc: stur            s0, [x0, #0x17]
    // 0x3d1ed0: r0 = SkullSprite()
    //     0x3d1ed0: bl              #0x3d2118  ; AllocateSkullSpriteStub -> SkullSprite (size=0x74)
    // 0x3d1ed4: mov             x4, x0
    // 0x3d1ed8: ldur            x0, [fp, #-0x28]
    // 0x3d1edc: stur            x4, [fp, #-0x40]
    // 0x3d1ee0: StoreField: r4->field_6f = r0
    //     0x3d1ee0: stur            w0, [x4, #0x6f]
    // 0x3d1ee4: mov             x1, x4
    // 0x3d1ee8: ldur            x2, [fp, #-0x30]
    // 0x3d1eec: ldur            x3, [fp, #-0x38]
    // 0x3d1ef0: r0 = _MixinApplication419&SpriteComponent&HasGameReference&FlickeringSprite()
    //     0x3d1ef0: bl              #0x3d2010  ; [dart:mixin_deduplication] _MixinApplication419&SpriteComponent&HasGameReference&FlickeringSprite::_MixinApplication419&SpriteComponent&HasGameReference&FlickeringSprite
    // 0x3d1ef4: ldur            x0, [fp, #-0x40]
    // 0x3d1ef8: ldur            x1, [fp, #-0x20]
    // 0x3d1efc: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d1efc: stur            w0, [x1, #0x17]
    //     0x3d1f00: ldurb           w16, [x1, #-1]
    //     0x3d1f04: ldurb           w17, [x0, #-1]
    //     0x3d1f08: and             x16, x17, x16, lsr #2
    //     0x3d1f0c: tst             x16, HEAP, lsr #32
    //     0x3d1f10: b.eq            #0x3d1f18
    //     0x3d1f14: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d1f18: r0 = true
    //     0x3d1f18: add             x0, NULL, #0x20  ; true
    // 0x3d1f1c: r0 = SuspendSyncStarAtYield()
    //     0x3d1f1c: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d1f20: ldur            d0, [fp, #-0x48]
    // 0x3d1f24: d1 = 8.000000
    //     0x3d1f24: fmov            d1, #8.00000000
    // 0x3d1f28: fadd            d5, d0, d1
    // 0x3d1f2c: ldur            x0, [fp, #-0x10]
    // 0x3d1f30: ldur            d0, [fp, #-0x50]
    // 0x3d1f34: ldur            d2, [fp, #-0x68]
    // 0x3d1f38: ldur            d3, [fp, #-0x60]
    // 0x3d1f3c: ldur            d4, [fp, #-0x58]
    // 0x3d1f40: d1 = 4.000000
    //     0x3d1f40: fmov            d1, #4.00000000
    // 0x3d1f44: b               #0x3d1b40
    // 0x3d1f48: ldur            d0, [fp, #-0x68]
    // 0x3d1f4c: d1 = 8.000000
    //     0x3d1f4c: fmov            d1, #8.00000000
    // 0x3d1f50: fsub            d2, d0, d1
    // 0x3d1f54: b               #0x3d1b08
    // 0x3d1f58: r0 = false
    //     0x3d1f58: add             x0, NULL, #0x30  ; false
    // 0x3d1f5c: LeaveFrame
    //     0x3d1f5c: mov             SP, fp
    //     0x3d1f60: ldp             fp, lr, [SP], #0x10
    // 0x3d1f64: ret
    //     0x3d1f64: ret             
    // 0x3d1f68: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d1f68: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d1f6c: b               #0x3d1954
    // 0x3d1f70: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d1f70: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3d1f74: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d1f74: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d1f78: b               #0x3d1b24
    // 0x3d1f7c: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d1f7c: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d1f80: b               #0x3d1b50
    // 0x3d1f84: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d1f84: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3d1f88: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d1f88: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3d1f8c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d1f8c: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3d1f90: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d1f90: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ _getIslandTiles(/* No info */) {
    // ** addr: 0x3d2124, size: 0xa04
    // 0x3d2124: EnterFrame
    //     0x3d2124: stp             fp, lr, [SP, #-0x10]!
    //     0x3d2128: mov             fp, SP
    // 0x3d212c: AllocStack(0x48)
    //     0x3d212c: sub             SP, SP, #0x48
    // 0x3d2130: SetupParameters(Background this /* r1 => r1, fp-0x10 */)
    //     0x3d2130: stur            NULL, [fp, #-8]
    //     0x3d2134: stur            x1, [fp, #-0x10]
    // 0x3d2138: CheckStackOverflow
    //     0x3d2138: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d213c: cmp             SP, x16
    //     0x3d2140: b.ls            #0x3d2b00
    // 0x3d2144: r0 = <SpriteComponent>
    //     0x3d2144: add             x0, PP, #0x1e, lsl #12  ; [pp+0x1e200] TypeArguments: <SpriteComponent>
    //     0x3d2148: ldr             x0, [x0, #0x200]
    // 0x3d214c: r0 = InitSyncStar()
    //     0x3d214c: bl              #0x2f0934  ; InitSyncStarStub
    // 0x3d2150: r0 = Null
    //     0x3d2150: mov             x0, NULL
    // 0x3d2154: r0 = SuspendSyncStarAtStart()
    //     0x3d2154: bl              #0x2f07a8  ; SuspendSyncStarAtStartStub
    // 0x3d2158: d0 = 8.000000
    //     0x3d2158: fmov            d0, #8.00000000
    // 0x3d215c: ldur            x0, [fp, #-0x10]
    // 0x3d2160: stur            d0, [fp, #-0x38]
    // 0x3d2164: CheckStackOverflow
    //     0x3d2164: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d2168: cmp             SP, x16
    //     0x3d216c: b.ls            #0x3d2b08
    // 0x3d2170: LoadField: r1 = r0->field_47
    //     0x3d2170: ldur            w1, [x0, #0x47]
    // 0x3d2174: DecompressPointer r1
    //     0x3d2174: add             x1, x1, HEAP, lsl #32
    // 0x3d2178: cmp             w1, NULL
    // 0x3d217c: b.ne            #0x3d21b4
    // 0x3d2180: mov             x1, x0
    // 0x3d2184: r0 = _findGameAndCheck()
    //     0x3d2184: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d2188: mov             x1, x0
    // 0x3d218c: ldur            x2, [fp, #-0x10]
    // 0x3d2190: StoreField: r2->field_47 = r0
    //     0x3d2190: stur            w0, [x2, #0x47]
    //     0x3d2194: ldurb           w16, [x2, #-1]
    //     0x3d2198: ldurb           w17, [x0, #-1]
    //     0x3d219c: and             x16, x17, x16, lsr #2
    //     0x3d21a0: tst             x16, HEAP, lsr #32
    //     0x3d21a4: b.eq            #0x3d21ac
    //     0x3d21a8: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d21ac: mov             x0, x1
    // 0x3d21b0: b               #0x3d21bc
    // 0x3d21b4: mov             x2, x0
    // 0x3d21b8: mov             x0, x1
    // 0x3d21bc: ldur            d0, [fp, #-0x38]
    // 0x3d21c0: LoadField: r1 = r0->field_83
    //     0x3d21c0: ldur            w1, [x0, #0x83]
    // 0x3d21c4: DecompressPointer r1
    //     0x3d21c4: add             x1, x1, HEAP, lsl #32
    // 0x3d21c8: LoadField: r0 = r1->field_37
    //     0x3d21c8: ldur            w0, [x1, #0x37]
    // 0x3d21cc: DecompressPointer r0
    //     0x3d21cc: add             x0, x0, HEAP, lsl #32
    // 0x3d21d0: mov             x1, x0
    // 0x3d21d4: r0 = size()
    //     0x3d21d4: bl              #0x435520  ; [package:flame/src/camera/viewport.dart] Viewport::size
    // 0x3d21d8: LoadField: r2 = r0->field_7
    //     0x3d21d8: ldur            w2, [x0, #7]
    // 0x3d21dc: DecompressPointer r2
    //     0x3d21dc: add             x2, x2, HEAP, lsl #32
    // 0x3d21e0: LoadField: r0 = r2->field_13
    //     0x3d21e0: ldur            w0, [x2, #0x13]
    // 0x3d21e4: r1 = LoadInt32Instr(r0)
    //     0x3d21e4: sbfx            x1, x0, #1, #0x1f
    // 0x3d21e8: mov             x0, x1
    // 0x3d21ec: r1 = 0
    //     0x3d21ec: mov             x1, #0
    // 0x3d21f0: cmp             x1, x0
    // 0x3d21f4: b.hs            #0x3d2b10
    // 0x3d21f8: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x3d21f8: ldur            s0, [x2, #0x17]
    // 0x3d21fc: fcvt            d1, s0
    // 0x3d2200: d0 = 8.000000
    //     0x3d2200: fmov            d0, #8.00000000
    // 0x3d2204: fsub            d2, d1, d0
    // 0x3d2208: ldur            d1, [fp, #-0x38]
    // 0x3d220c: fcmp            d2, d1
    // 0x3d2210: b.le            #0x3d23ec
    // 0x3d2214: r0 = 0
    //     0x3d2214: mov             x0, #0
    // 0x3d2218: add             x1, fp, w0, sxtw #2
    // 0x3d221c: LoadField: r1 = r1->field_fffffff8
    //     0x3d221c: ldur            x1, [x1, #-8]
    // 0x3d2220: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x3d2220: ldur            w2, [x1, #0x17]
    // 0x3d2224: DecompressPointer r2
    //     0x3d2224: add             x2, x2, HEAP, lsl #32
    // 0x3d2228: stur            x2, [fp, #-0x18]
    // 0x3d222c: r0 = Vector2()
    //     0x3d222c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2230: r4 = 4
    //     0x3d2230: mov             x4, #4
    // 0x3d2234: stur            x0, [fp, #-0x20]
    // 0x3d2238: r0 = AllocateFloat32Array()
    //     0x3d2238: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d223c: ldur            x2, [fp, #-0x20]
    // 0x3d2240: StoreField: r2->field_7 = r0
    //     0x3d2240: stur            w0, [x2, #7]
    // 0x3d2244: StoreField: r0->field_1b = rZR
    //     0x3d2244: stur            wzr, [x0, #0x1b]
    // 0x3d2248: ldur            d0, [fp, #-0x38]
    // 0x3d224c: fcvt            s1, d0
    // 0x3d2250: stur            d1, [fp, #-0x40]
    // 0x3d2254: ArrayStore: r0[0] = d1  ; List_8
    //     0x3d2254: stur            s1, [x0, #0x17]
    // 0x3d2258: r0 = Vector2()
    //     0x3d2258: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d225c: r4 = 4
    //     0x3d225c: mov             x4, #4
    // 0x3d2260: stur            x0, [fp, #-0x28]
    // 0x3d2264: r0 = AllocateFloat32Array()
    //     0x3d2264: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2268: ldur            x3, [fp, #-0x28]
    // 0x3d226c: StoreField: r3->field_7 = r0
    //     0x3d226c: stur            w0, [x3, #7]
    // 0x3d2270: d0 = 0.000000
    //     0x3d2270: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d2274: ldr             s0, [x17, #0x220]
    // 0x3d2278: StoreField: r0->field_1b = d0
    //     0x3d2278: stur            s0, [x0, #0x1b]
    // 0x3d227c: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d227c: stur            s0, [x0, #0x17]
    // 0x3d2280: r0 = GroundSprite()
    //     0x3d2280: bl              #0x3d2b28  ; AllocateGroundSpriteStub -> GroundSprite (size=0x64)
    // 0x3d2284: mov             x4, x0
    // 0x3d2288: r0 = Instance_Alignment
    //     0x3d2288: add             x0, PP, #0x17, lsl #12  ; [pp+0x17ec0] Obj!Alignment@5cc2d1
    //     0x3d228c: ldr             x0, [x0, #0xec0]
    // 0x3d2290: stur            x4, [fp, #-0x30]
    // 0x3d2294: StoreField: r4->field_5f = r0
    //     0x3d2294: stur            w0, [x4, #0x5f]
    // 0x3d2298: r5 = false
    //     0x3d2298: add             x5, NULL, #0x30  ; false
    // 0x3d229c: StoreField: r4->field_5b = r5
    //     0x3d229c: stur            w5, [x4, #0x5b]
    // 0x3d22a0: mov             x1, x4
    // 0x3d22a4: ldur            x2, [fp, #-0x20]
    // 0x3d22a8: ldur            x3, [fp, #-0x28]
    // 0x3d22ac: r0 = SpriteComponent()
    //     0x3d22ac: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d22b0: ldur            x0, [fp, #-0x30]
    // 0x3d22b4: ldur            x1, [fp, #-0x18]
    // 0x3d22b8: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d22b8: stur            w0, [x1, #0x17]
    //     0x3d22bc: ldurb           w16, [x1, #-1]
    //     0x3d22c0: ldurb           w17, [x0, #-1]
    //     0x3d22c4: and             x16, x17, x16, lsr #2
    //     0x3d22c8: tst             x16, HEAP, lsr #32
    //     0x3d22cc: b.eq            #0x3d22d4
    //     0x3d22d0: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d22d4: r0 = true
    //     0x3d22d4: add             x0, NULL, #0x20  ; true
    // 0x3d22d8: r0 = SuspendSyncStarAtYield()
    //     0x3d22d8: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d22dc: r0 = 0
    //     0x3d22dc: mov             x0, #0
    // 0x3d22e0: add             x1, fp, w0, sxtw #2
    // 0x3d22e4: LoadField: r1 = r1->field_fffffff8
    //     0x3d22e4: ldur            x1, [x1, #-8]
    // 0x3d22e8: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x3d22e8: ldur            w2, [x1, #0x17]
    // 0x3d22ec: DecompressPointer r2
    //     0x3d22ec: add             x2, x2, HEAP, lsl #32
    // 0x3d22f0: ldur            x1, [fp, #-0x10]
    // 0x3d22f4: stur            x2, [fp, #-0x18]
    // 0x3d22f8: LoadField: r0 = r1->field_4b
    //     0x3d22f8: ldur            w0, [x1, #0x4b]
    // 0x3d22fc: DecompressPointer r0
    //     0x3d22fc: add             x0, x0, HEAP, lsl #32
    // 0x3d2300: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d2304: cmp             w0, w16
    // 0x3d2308: b.ne            #0x3d2318
    // 0x3d230c: r2 = bottomOfIsland
    //     0x3d230c: add             x2, PP, #0x1e, lsl #12  ; [pp+0x1e218] Field <Background.bottomOfIsland>: late final (offset: 0x4c)
    //     0x3d2310: ldr             x2, [x2, #0x218]
    // 0x3d2314: r0 = InitLateFinalInstanceField()
    //     0x3d2314: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d2318: LoadField: d0 = r0->field_7
    //     0x3d2318: ldur            d0, [x0, #7]
    // 0x3d231c: d1 = 8.000000
    //     0x3d231c: fmov            d1, #8.00000000
    // 0x3d2320: fsub            d2, d0, d1
    // 0x3d2324: stur            d2, [fp, #-0x48]
    // 0x3d2328: r0 = Vector2()
    //     0x3d2328: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d232c: r4 = 4
    //     0x3d232c: mov             x4, #4
    // 0x3d2330: stur            x0, [fp, #-0x20]
    // 0x3d2334: r0 = AllocateFloat32Array()
    //     0x3d2334: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2338: ldur            x2, [fp, #-0x20]
    // 0x3d233c: StoreField: r2->field_7 = r0
    //     0x3d233c: stur            w0, [x2, #7]
    // 0x3d2340: ldur            d0, [fp, #-0x48]
    // 0x3d2344: fcvt            s1, d0
    // 0x3d2348: StoreField: r0->field_1b = d1
    //     0x3d2348: stur            s1, [x0, #0x1b]
    // 0x3d234c: ldur            d0, [fp, #-0x40]
    // 0x3d2350: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d2350: stur            s0, [x0, #0x17]
    // 0x3d2354: r0 = Vector2()
    //     0x3d2354: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2358: r4 = 4
    //     0x3d2358: mov             x4, #4
    // 0x3d235c: stur            x0, [fp, #-0x28]
    // 0x3d2360: r0 = AllocateFloat32Array()
    //     0x3d2360: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2364: ldur            x3, [fp, #-0x28]
    // 0x3d2368: StoreField: r3->field_7 = r0
    //     0x3d2368: stur            w0, [x3, #7]
    // 0x3d236c: d0 = 0.000000
    //     0x3d236c: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d2370: ldr             s0, [x17, #0x220]
    // 0x3d2374: StoreField: r0->field_1b = d0
    //     0x3d2374: stur            s0, [x0, #0x1b]
    // 0x3d2378: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d2378: stur            s0, [x0, #0x17]
    // 0x3d237c: r0 = GroundSprite()
    //     0x3d237c: bl              #0x3d2b28  ; AllocateGroundSpriteStub -> GroundSprite (size=0x64)
    // 0x3d2380: mov             x4, x0
    // 0x3d2384: r0 = Instance_Alignment
    //     0x3d2384: add             x0, PP, #0x13, lsl #12  ; [pp+0x131d8] Obj!Alignment@5cc291
    //     0x3d2388: ldr             x0, [x0, #0x1d8]
    // 0x3d238c: stur            x4, [fp, #-0x30]
    // 0x3d2390: StoreField: r4->field_5f = r0
    //     0x3d2390: stur            w0, [x4, #0x5f]
    // 0x3d2394: r5 = false
    //     0x3d2394: add             x5, NULL, #0x30  ; false
    // 0x3d2398: StoreField: r4->field_5b = r5
    //     0x3d2398: stur            w5, [x4, #0x5b]
    // 0x3d239c: mov             x1, x4
    // 0x3d23a0: ldur            x2, [fp, #-0x20]
    // 0x3d23a4: ldur            x3, [fp, #-0x28]
    // 0x3d23a8: r0 = SpriteComponent()
    //     0x3d23a8: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d23ac: ldur            x0, [fp, #-0x30]
    // 0x3d23b0: ldur            x1, [fp, #-0x18]
    // 0x3d23b4: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d23b4: stur            w0, [x1, #0x17]
    //     0x3d23b8: ldurb           w16, [x1, #-1]
    //     0x3d23bc: ldurb           w17, [x0, #-1]
    //     0x3d23c0: and             x16, x17, x16, lsr #2
    //     0x3d23c4: tst             x16, HEAP, lsr #32
    //     0x3d23c8: b.eq            #0x3d23d0
    //     0x3d23cc: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d23d0: r0 = true
    //     0x3d23d0: add             x0, NULL, #0x20  ; true
    // 0x3d23d4: r0 = SuspendSyncStarAtYield()
    //     0x3d23d4: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d23d8: ldur            d1, [fp, #-0x38]
    // 0x3d23dc: d0 = 8.000000
    //     0x3d23dc: fmov            d0, #8.00000000
    // 0x3d23e0: fadd            d2, d1, d0
    // 0x3d23e4: mov             v0.16b, v2.16b
    // 0x3d23e8: b               #0x3d215c
    // 0x3d23ec: d1 = 8.000000
    //     0x3d23ec: fmov            d1, #8.00000000
    // 0x3d23f0: ldur            x0, [fp, #-0x10]
    // 0x3d23f4: stur            d1, [fp, #-0x38]
    // 0x3d23f8: CheckStackOverflow
    //     0x3d23f8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d23fc: cmp             SP, x16
    //     0x3d2400: b.ls            #0x3d2b14
    // 0x3d2404: mov             x1, x0
    // 0x3d2408: LoadField: r0 = r1->field_4b
    //     0x3d2408: ldur            w0, [x1, #0x4b]
    // 0x3d240c: DecompressPointer r0
    //     0x3d240c: add             x0, x0, HEAP, lsl #32
    // 0x3d2410: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d2414: cmp             w0, w16
    // 0x3d2418: b.ne            #0x3d2428
    // 0x3d241c: r2 = bottomOfIsland
    //     0x3d241c: add             x2, PP, #0x1e, lsl #12  ; [pp+0x1e218] Field <Background.bottomOfIsland>: late final (offset: 0x4c)
    //     0x3d2420: ldr             x2, [x2, #0x218]
    // 0x3d2424: r0 = InitLateFinalInstanceField()
    //     0x3d2424: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d2428: LoadField: d0 = r0->field_7
    //     0x3d2428: ldur            d0, [x0, #7]
    // 0x3d242c: d1 = 8.000000
    //     0x3d242c: fmov            d1, #8.00000000
    // 0x3d2430: fsub            d2, d0, d1
    // 0x3d2434: ldur            d0, [fp, #-0x38]
    // 0x3d2438: fcmp            d2, d0
    // 0x3d243c: b.le            #0x3d2684
    // 0x3d2440: ldur            x1, [fp, #-0x10]
    // 0x3d2444: r0 = 0
    //     0x3d2444: mov             x0, #0
    // 0x3d2448: add             x2, fp, w0, sxtw #2
    // 0x3d244c: LoadField: r2 = r2->field_fffffff8
    //     0x3d244c: ldur            x2, [x2, #-8]
    // 0x3d2450: ArrayLoad: r3 = r2[0]  ; List_4
    //     0x3d2450: ldur            w3, [x2, #0x17]
    // 0x3d2454: DecompressPointer r3
    //     0x3d2454: add             x3, x3, HEAP, lsl #32
    // 0x3d2458: stur            x3, [fp, #-0x18]
    // 0x3d245c: r0 = Vector2()
    //     0x3d245c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2460: r4 = 4
    //     0x3d2460: mov             x4, #4
    // 0x3d2464: stur            x0, [fp, #-0x20]
    // 0x3d2468: r0 = AllocateFloat32Array()
    //     0x3d2468: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d246c: ldur            x2, [fp, #-0x20]
    // 0x3d2470: StoreField: r2->field_7 = r0
    //     0x3d2470: stur            w0, [x2, #7]
    // 0x3d2474: ldur            d0, [fp, #-0x38]
    // 0x3d2478: fcvt            s1, d0
    // 0x3d247c: stur            d1, [fp, #-0x40]
    // 0x3d2480: StoreField: r0->field_1b = d1
    //     0x3d2480: stur            s1, [x0, #0x1b]
    // 0x3d2484: ArrayStore: r0[0] = rZR  ; List_4
    //     0x3d2484: stur            wzr, [x0, #0x17]
    // 0x3d2488: r0 = Vector2()
    //     0x3d2488: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d248c: r4 = 4
    //     0x3d248c: mov             x4, #4
    // 0x3d2490: stur            x0, [fp, #-0x28]
    // 0x3d2494: r0 = AllocateFloat32Array()
    //     0x3d2494: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2498: ldur            x3, [fp, #-0x28]
    // 0x3d249c: StoreField: r3->field_7 = r0
    //     0x3d249c: stur            w0, [x3, #7]
    // 0x3d24a0: d0 = 0.000000
    //     0x3d24a0: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d24a4: ldr             s0, [x17, #0x220]
    // 0x3d24a8: StoreField: r0->field_1b = d0
    //     0x3d24a8: stur            s0, [x0, #0x1b]
    // 0x3d24ac: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d24ac: stur            s0, [x0, #0x17]
    // 0x3d24b0: r0 = GroundSprite()
    //     0x3d24b0: bl              #0x3d2b28  ; AllocateGroundSpriteStub -> GroundSprite (size=0x64)
    // 0x3d24b4: mov             x4, x0
    // 0x3d24b8: r0 = Instance_Alignment
    //     0x3d24b8: add             x0, PP, #0x1e, lsl #12  ; [pp+0x1e230] Obj!Alignment@5cc351
    //     0x3d24bc: ldr             x0, [x0, #0x230]
    // 0x3d24c0: stur            x4, [fp, #-0x30]
    // 0x3d24c4: StoreField: r4->field_5f = r0
    //     0x3d24c4: stur            w0, [x4, #0x5f]
    // 0x3d24c8: r5 = false
    //     0x3d24c8: add             x5, NULL, #0x30  ; false
    // 0x3d24cc: StoreField: r4->field_5b = r5
    //     0x3d24cc: stur            w5, [x4, #0x5b]
    // 0x3d24d0: mov             x1, x4
    // 0x3d24d4: ldur            x2, [fp, #-0x20]
    // 0x3d24d8: ldur            x3, [fp, #-0x28]
    // 0x3d24dc: r0 = SpriteComponent()
    //     0x3d24dc: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d24e0: ldur            x0, [fp, #-0x30]
    // 0x3d24e4: ldur            x1, [fp, #-0x18]
    // 0x3d24e8: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d24e8: stur            w0, [x1, #0x17]
    //     0x3d24ec: ldurb           w16, [x1, #-1]
    //     0x3d24f0: ldurb           w17, [x0, #-1]
    //     0x3d24f4: and             x16, x17, x16, lsr #2
    //     0x3d24f8: tst             x16, HEAP, lsr #32
    //     0x3d24fc: b.eq            #0x3d2504
    //     0x3d2500: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d2504: r0 = true
    //     0x3d2504: add             x0, NULL, #0x20  ; true
    // 0x3d2508: r0 = SuspendSyncStarAtYield()
    //     0x3d2508: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d250c: r0 = 0
    //     0x3d250c: mov             x0, #0
    // 0x3d2510: add             x1, fp, w0, sxtw #2
    // 0x3d2514: LoadField: r1 = r1->field_fffffff8
    //     0x3d2514: ldur            x1, [x1, #-8]
    // 0x3d2518: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x3d2518: ldur            w2, [x1, #0x17]
    // 0x3d251c: DecompressPointer r2
    //     0x3d251c: add             x2, x2, HEAP, lsl #32
    // 0x3d2520: ldur            x3, [fp, #-0x10]
    // 0x3d2524: stur            x2, [fp, #-0x18]
    // 0x3d2528: LoadField: r1 = r3->field_47
    //     0x3d2528: ldur            w1, [x3, #0x47]
    // 0x3d252c: DecompressPointer r1
    //     0x3d252c: add             x1, x1, HEAP, lsl #32
    // 0x3d2530: cmp             w1, NULL
    // 0x3d2534: b.ne            #0x3d2568
    // 0x3d2538: mov             x1, x3
    // 0x3d253c: r0 = _findGameAndCheck()
    //     0x3d253c: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d2540: mov             x1, x0
    // 0x3d2544: ldur            x2, [fp, #-0x10]
    // 0x3d2548: StoreField: r2->field_47 = r0
    //     0x3d2548: stur            w0, [x2, #0x47]
    //     0x3d254c: ldurb           w16, [x2, #-1]
    //     0x3d2550: ldurb           w17, [x0, #-1]
    //     0x3d2554: and             x16, x17, x16, lsr #2
    //     0x3d2558: tst             x16, HEAP, lsr #32
    //     0x3d255c: b.eq            #0x3d2564
    //     0x3d2560: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d2564: b               #0x3d256c
    // 0x3d2568: mov             x2, x3
    // 0x3d256c: ldur            d0, [fp, #-0x38]
    // 0x3d2570: ldur            x0, [fp, #-0x18]
    // 0x3d2574: ldur            d1, [fp, #-0x40]
    // 0x3d2578: LoadField: r3 = r1->field_83
    //     0x3d2578: ldur            w3, [x1, #0x83]
    // 0x3d257c: DecompressPointer r3
    //     0x3d257c: add             x3, x3, HEAP, lsl #32
    // 0x3d2580: LoadField: r1 = r3->field_37
    //     0x3d2580: ldur            w1, [x3, #0x37]
    // 0x3d2584: DecompressPointer r1
    //     0x3d2584: add             x1, x1, HEAP, lsl #32
    // 0x3d2588: r0 = size()
    //     0x3d2588: bl              #0x435520  ; [package:flame/src/camera/viewport.dart] Viewport::size
    // 0x3d258c: LoadField: r2 = r0->field_7
    //     0x3d258c: ldur            w2, [x0, #7]
    // 0x3d2590: DecompressPointer r2
    //     0x3d2590: add             x2, x2, HEAP, lsl #32
    // 0x3d2594: LoadField: r0 = r2->field_13
    //     0x3d2594: ldur            w0, [x2, #0x13]
    // 0x3d2598: r1 = LoadInt32Instr(r0)
    //     0x3d2598: sbfx            x1, x0, #1, #0x1f
    // 0x3d259c: mov             x0, x1
    // 0x3d25a0: r1 = 0
    //     0x3d25a0: mov             x1, #0
    // 0x3d25a4: cmp             x1, x0
    // 0x3d25a8: b.hs            #0x3d2b1c
    // 0x3d25ac: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x3d25ac: ldur            s0, [x2, #0x17]
    // 0x3d25b0: fcvt            d1, s0
    // 0x3d25b4: d0 = 8.000000
    //     0x3d25b4: fmov            d0, #8.00000000
    // 0x3d25b8: fsub            d2, d1, d0
    // 0x3d25bc: stur            d2, [fp, #-0x48]
    // 0x3d25c0: r0 = Vector2()
    //     0x3d25c0: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d25c4: r4 = 4
    //     0x3d25c4: mov             x4, #4
    // 0x3d25c8: stur            x0, [fp, #-0x20]
    // 0x3d25cc: r0 = AllocateFloat32Array()
    //     0x3d25cc: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d25d0: ldur            x2, [fp, #-0x20]
    // 0x3d25d4: StoreField: r2->field_7 = r0
    //     0x3d25d4: stur            w0, [x2, #7]
    // 0x3d25d8: ldur            d0, [fp, #-0x40]
    // 0x3d25dc: StoreField: r0->field_1b = d0
    //     0x3d25dc: stur            s0, [x0, #0x1b]
    // 0x3d25e0: ldur            d0, [fp, #-0x48]
    // 0x3d25e4: fcvt            s1, d0
    // 0x3d25e8: ArrayStore: r0[0] = d1  ; List_8
    //     0x3d25e8: stur            s1, [x0, #0x17]
    // 0x3d25ec: r0 = Vector2()
    //     0x3d25ec: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d25f0: r4 = 4
    //     0x3d25f0: mov             x4, #4
    // 0x3d25f4: stur            x0, [fp, #-0x28]
    // 0x3d25f8: r0 = AllocateFloat32Array()
    //     0x3d25f8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d25fc: ldur            x3, [fp, #-0x28]
    // 0x3d2600: StoreField: r3->field_7 = r0
    //     0x3d2600: stur            w0, [x3, #7]
    // 0x3d2604: d0 = 0.000000
    //     0x3d2604: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d2608: ldr             s0, [x17, #0x220]
    // 0x3d260c: StoreField: r0->field_1b = d0
    //     0x3d260c: stur            s0, [x0, #0x1b]
    // 0x3d2610: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d2610: stur            s0, [x0, #0x17]
    // 0x3d2614: r0 = GroundSprite()
    //     0x3d2614: bl              #0x3d2b28  ; AllocateGroundSpriteStub -> GroundSprite (size=0x64)
    // 0x3d2618: mov             x4, x0
    // 0x3d261c: r0 = Instance_Alignment
    //     0x3d261c: add             x0, PP, #0x17, lsl #12  ; [pp+0x17258] Obj!Alignment@5cc2b1
    //     0x3d2620: ldr             x0, [x0, #0x258]
    // 0x3d2624: stur            x4, [fp, #-0x30]
    // 0x3d2628: StoreField: r4->field_5f = r0
    //     0x3d2628: stur            w0, [x4, #0x5f]
    // 0x3d262c: r5 = false
    //     0x3d262c: add             x5, NULL, #0x30  ; false
    // 0x3d2630: StoreField: r4->field_5b = r5
    //     0x3d2630: stur            w5, [x4, #0x5b]
    // 0x3d2634: mov             x1, x4
    // 0x3d2638: ldur            x2, [fp, #-0x20]
    // 0x3d263c: ldur            x3, [fp, #-0x28]
    // 0x3d2640: r0 = SpriteComponent()
    //     0x3d2640: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d2644: ldur            x0, [fp, #-0x30]
    // 0x3d2648: ldur            x1, [fp, #-0x18]
    // 0x3d264c: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d264c: stur            w0, [x1, #0x17]
    //     0x3d2650: ldurb           w16, [x1, #-1]
    //     0x3d2654: ldurb           w17, [x0, #-1]
    //     0x3d2658: and             x16, x17, x16, lsr #2
    //     0x3d265c: tst             x16, HEAP, lsr #32
    //     0x3d2660: b.eq            #0x3d2668
    //     0x3d2664: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d2668: r0 = true
    //     0x3d2668: add             x0, NULL, #0x20  ; true
    // 0x3d266c: r0 = SuspendSyncStarAtYield()
    //     0x3d266c: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d2670: ldur            d1, [fp, #-0x38]
    // 0x3d2674: d0 = 8.000000
    //     0x3d2674: fmov            d0, #8.00000000
    // 0x3d2678: fadd            d2, d1, d0
    // 0x3d267c: mov             v1.16b, v2.16b
    // 0x3d2680: b               #0x3d23f0
    // 0x3d2684: ldur            x1, [fp, #-0x10]
    // 0x3d2688: mov             v0.16b, v1.16b
    // 0x3d268c: r0 = 0
    //     0x3d268c: mov             x0, #0
    // 0x3d2690: add             x2, fp, w0, sxtw #2
    // 0x3d2694: LoadField: r2 = r2->field_fffffff8
    //     0x3d2694: ldur            x2, [x2, #-8]
    // 0x3d2698: ArrayLoad: r3 = r2[0]  ; List_4
    //     0x3d2698: ldur            w3, [x2, #0x17]
    // 0x3d269c: DecompressPointer r3
    //     0x3d269c: add             x3, x3, HEAP, lsl #32
    // 0x3d26a0: stur            x3, [fp, #-0x18]
    // 0x3d26a4: r0 = Vector2()
    //     0x3d26a4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d26a8: r4 = 4
    //     0x3d26a8: mov             x4, #4
    // 0x3d26ac: stur            x0, [fp, #-0x20]
    // 0x3d26b0: r0 = AllocateFloat32Array()
    //     0x3d26b0: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d26b4: ldur            x2, [fp, #-0x20]
    // 0x3d26b8: StoreField: r2->field_7 = r0
    //     0x3d26b8: stur            w0, [x2, #7]
    // 0x3d26bc: StoreField: r0->field_1b = rZR
    //     0x3d26bc: stur            wzr, [x0, #0x1b]
    // 0x3d26c0: ArrayStore: r0[0] = rZR  ; List_4
    //     0x3d26c0: stur            wzr, [x0, #0x17]
    // 0x3d26c4: r0 = Vector2()
    //     0x3d26c4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d26c8: r4 = 4
    //     0x3d26c8: mov             x4, #4
    // 0x3d26cc: stur            x0, [fp, #-0x28]
    // 0x3d26d0: r0 = AllocateFloat32Array()
    //     0x3d26d0: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d26d4: ldur            x3, [fp, #-0x28]
    // 0x3d26d8: StoreField: r3->field_7 = r0
    //     0x3d26d8: stur            w0, [x3, #7]
    // 0x3d26dc: d0 = 0.000000
    //     0x3d26dc: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d26e0: ldr             s0, [x17, #0x220]
    // 0x3d26e4: StoreField: r0->field_1b = d0
    //     0x3d26e4: stur            s0, [x0, #0x1b]
    // 0x3d26e8: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d26e8: stur            s0, [x0, #0x17]
    // 0x3d26ec: r0 = GroundSprite()
    //     0x3d26ec: bl              #0x3d2b28  ; AllocateGroundSpriteStub -> GroundSprite (size=0x64)
    // 0x3d26f0: mov             x4, x0
    // 0x3d26f4: r0 = Instance_Alignment
    //     0x3d26f4: add             x0, PP, #0x13, lsl #12  ; [pp+0x13988] Obj!Alignment@5cc371
    //     0x3d26f8: ldr             x0, [x0, #0x988]
    // 0x3d26fc: stur            x4, [fp, #-0x30]
    // 0x3d2700: StoreField: r4->field_5f = r0
    //     0x3d2700: stur            w0, [x4, #0x5f]
    // 0x3d2704: r0 = false
    //     0x3d2704: add             x0, NULL, #0x30  ; false
    // 0x3d2708: StoreField: r4->field_5b = r0
    //     0x3d2708: stur            w0, [x4, #0x5b]
    // 0x3d270c: mov             x1, x4
    // 0x3d2710: ldur            x2, [fp, #-0x20]
    // 0x3d2714: ldur            x3, [fp, #-0x28]
    // 0x3d2718: r0 = SpriteComponent()
    //     0x3d2718: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d271c: ldur            x0, [fp, #-0x30]
    // 0x3d2720: ldur            x1, [fp, #-0x18]
    // 0x3d2724: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d2724: stur            w0, [x1, #0x17]
    //     0x3d2728: ldurb           w16, [x1, #-1]
    //     0x3d272c: ldurb           w17, [x0, #-1]
    //     0x3d2730: and             x16, x17, x16, lsr #2
    //     0x3d2734: tst             x16, HEAP, lsr #32
    //     0x3d2738: b.eq            #0x3d2740
    //     0x3d273c: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d2740: r0 = true
    //     0x3d2740: add             x0, NULL, #0x20  ; true
    // 0x3d2744: r0 = SuspendSyncStarAtYield()
    //     0x3d2744: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d2748: r0 = 0
    //     0x3d2748: mov             x0, #0
    // 0x3d274c: add             x1, fp, w0, sxtw #2
    // 0x3d2750: LoadField: r1 = r1->field_fffffff8
    //     0x3d2750: ldur            x1, [x1, #-8]
    // 0x3d2754: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x3d2754: ldur            w2, [x1, #0x17]
    // 0x3d2758: DecompressPointer r2
    //     0x3d2758: add             x2, x2, HEAP, lsl #32
    // 0x3d275c: ldur            x3, [fp, #-0x10]
    // 0x3d2760: stur            x2, [fp, #-0x18]
    // 0x3d2764: LoadField: r1 = r3->field_47
    //     0x3d2764: ldur            w1, [x3, #0x47]
    // 0x3d2768: DecompressPointer r1
    //     0x3d2768: add             x1, x1, HEAP, lsl #32
    // 0x3d276c: cmp             w1, NULL
    // 0x3d2770: b.ne            #0x3d27a4
    // 0x3d2774: mov             x1, x3
    // 0x3d2778: r0 = _findGameAndCheck()
    //     0x3d2778: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d277c: mov             x1, x0
    // 0x3d2780: ldur            x2, [fp, #-0x10]
    // 0x3d2784: StoreField: r2->field_47 = r0
    //     0x3d2784: stur            w0, [x2, #0x47]
    //     0x3d2788: ldurb           w16, [x2, #-1]
    //     0x3d278c: ldurb           w17, [x0, #-1]
    //     0x3d2790: and             x16, x17, x16, lsr #2
    //     0x3d2794: tst             x16, HEAP, lsr #32
    //     0x3d2798: b.eq            #0x3d27a0
    //     0x3d279c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d27a0: b               #0x3d27a8
    // 0x3d27a4: mov             x2, x3
    // 0x3d27a8: ldur            x0, [fp, #-0x18]
    // 0x3d27ac: LoadField: r3 = r1->field_83
    //     0x3d27ac: ldur            w3, [x1, #0x83]
    // 0x3d27b0: DecompressPointer r3
    //     0x3d27b0: add             x3, x3, HEAP, lsl #32
    // 0x3d27b4: LoadField: r1 = r3->field_37
    //     0x3d27b4: ldur            w1, [x3, #0x37]
    // 0x3d27b8: DecompressPointer r1
    //     0x3d27b8: add             x1, x1, HEAP, lsl #32
    // 0x3d27bc: r0 = size()
    //     0x3d27bc: bl              #0x435520  ; [package:flame/src/camera/viewport.dart] Viewport::size
    // 0x3d27c0: LoadField: r2 = r0->field_7
    //     0x3d27c0: ldur            w2, [x0, #7]
    // 0x3d27c4: DecompressPointer r2
    //     0x3d27c4: add             x2, x2, HEAP, lsl #32
    // 0x3d27c8: LoadField: r0 = r2->field_13
    //     0x3d27c8: ldur            w0, [x2, #0x13]
    // 0x3d27cc: r1 = LoadInt32Instr(r0)
    //     0x3d27cc: sbfx            x1, x0, #1, #0x1f
    // 0x3d27d0: mov             x0, x1
    // 0x3d27d4: r1 = 0
    //     0x3d27d4: mov             x1, #0
    // 0x3d27d8: cmp             x1, x0
    // 0x3d27dc: b.hs            #0x3d2b20
    // 0x3d27e0: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x3d27e0: ldur            s0, [x2, #0x17]
    // 0x3d27e4: fcvt            d1, s0
    // 0x3d27e8: d0 = 8.000000
    //     0x3d27e8: fmov            d0, #8.00000000
    // 0x3d27ec: fsub            d2, d1, d0
    // 0x3d27f0: stur            d2, [fp, #-0x38]
    // 0x3d27f4: r0 = Vector2()
    //     0x3d27f4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d27f8: r4 = 4
    //     0x3d27f8: mov             x4, #4
    // 0x3d27fc: stur            x0, [fp, #-0x20]
    // 0x3d2800: r0 = AllocateFloat32Array()
    //     0x3d2800: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2804: ldur            x2, [fp, #-0x20]
    // 0x3d2808: StoreField: r2->field_7 = r0
    //     0x3d2808: stur            w0, [x2, #7]
    // 0x3d280c: StoreField: r0->field_1b = rZR
    //     0x3d280c: stur            wzr, [x0, #0x1b]
    // 0x3d2810: ldur            d0, [fp, #-0x38]
    // 0x3d2814: fcvt            s1, d0
    // 0x3d2818: ArrayStore: r0[0] = d1  ; List_8
    //     0x3d2818: stur            s1, [x0, #0x17]
    // 0x3d281c: r0 = Vector2()
    //     0x3d281c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2820: r4 = 4
    //     0x3d2820: mov             x4, #4
    // 0x3d2824: stur            x0, [fp, #-0x28]
    // 0x3d2828: r0 = AllocateFloat32Array()
    //     0x3d2828: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d282c: ldur            x3, [fp, #-0x28]
    // 0x3d2830: StoreField: r3->field_7 = r0
    //     0x3d2830: stur            w0, [x3, #7]
    // 0x3d2834: d0 = 0.000000
    //     0x3d2834: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d2838: ldr             s0, [x17, #0x220]
    // 0x3d283c: StoreField: r0->field_1b = d0
    //     0x3d283c: stur            s0, [x0, #0x1b]
    // 0x3d2840: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d2840: stur            s0, [x0, #0x17]
    // 0x3d2844: r0 = GroundSprite()
    //     0x3d2844: bl              #0x3d2b28  ; AllocateGroundSpriteStub -> GroundSprite (size=0x64)
    // 0x3d2848: mov             x4, x0
    // 0x3d284c: r0 = Instance_Alignment
    //     0x3d284c: add             x0, PP, #0x1e, lsl #12  ; [pp+0x1e238] Obj!Alignment@5cc331
    //     0x3d2850: ldr             x0, [x0, #0x238]
    // 0x3d2854: stur            x4, [fp, #-0x30]
    // 0x3d2858: StoreField: r4->field_5f = r0
    //     0x3d2858: stur            w0, [x4, #0x5f]
    // 0x3d285c: r0 = false
    //     0x3d285c: add             x0, NULL, #0x30  ; false
    // 0x3d2860: StoreField: r4->field_5b = r0
    //     0x3d2860: stur            w0, [x4, #0x5b]
    // 0x3d2864: mov             x1, x4
    // 0x3d2868: ldur            x2, [fp, #-0x20]
    // 0x3d286c: ldur            x3, [fp, #-0x28]
    // 0x3d2870: r0 = SpriteComponent()
    //     0x3d2870: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d2874: ldur            x0, [fp, #-0x30]
    // 0x3d2878: ldur            x1, [fp, #-0x18]
    // 0x3d287c: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d287c: stur            w0, [x1, #0x17]
    //     0x3d2880: ldurb           w16, [x1, #-1]
    //     0x3d2884: ldurb           w17, [x0, #-1]
    //     0x3d2888: and             x16, x17, x16, lsr #2
    //     0x3d288c: tst             x16, HEAP, lsr #32
    //     0x3d2890: b.eq            #0x3d2898
    //     0x3d2894: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d2898: r0 = true
    //     0x3d2898: add             x0, NULL, #0x20  ; true
    // 0x3d289c: r0 = SuspendSyncStarAtYield()
    //     0x3d289c: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d28a0: r0 = 0
    //     0x3d28a0: mov             x0, #0
    // 0x3d28a4: add             x1, fp, w0, sxtw #2
    // 0x3d28a8: LoadField: r1 = r1->field_fffffff8
    //     0x3d28a8: ldur            x1, [x1, #-8]
    // 0x3d28ac: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x3d28ac: ldur            w2, [x1, #0x17]
    // 0x3d28b0: DecompressPointer r2
    //     0x3d28b0: add             x2, x2, HEAP, lsl #32
    // 0x3d28b4: ldur            x1, [fp, #-0x10]
    // 0x3d28b8: stur            x2, [fp, #-0x18]
    // 0x3d28bc: LoadField: r3 = r1->field_4b
    //     0x3d28bc: ldur            w3, [x1, #0x4b]
    // 0x3d28c0: DecompressPointer r3
    //     0x3d28c0: add             x3, x3, HEAP, lsl #32
    // 0x3d28c4: LoadField: d0 = r3->field_7
    //     0x3d28c4: ldur            d0, [x3, #7]
    // 0x3d28c8: d1 = 8.000000
    //     0x3d28c8: fmov            d1, #8.00000000
    // 0x3d28cc: fsub            d2, d0, d1
    // 0x3d28d0: stur            d2, [fp, #-0x38]
    // 0x3d28d4: r0 = Vector2()
    //     0x3d28d4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d28d8: r4 = 4
    //     0x3d28d8: mov             x4, #4
    // 0x3d28dc: stur            x0, [fp, #-0x20]
    // 0x3d28e0: r0 = AllocateFloat32Array()
    //     0x3d28e0: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d28e4: ldur            x2, [fp, #-0x20]
    // 0x3d28e8: StoreField: r2->field_7 = r0
    //     0x3d28e8: stur            w0, [x2, #7]
    // 0x3d28ec: ldur            d0, [fp, #-0x38]
    // 0x3d28f0: fcvt            s1, d0
    // 0x3d28f4: StoreField: r0->field_1b = d1
    //     0x3d28f4: stur            s1, [x0, #0x1b]
    // 0x3d28f8: ArrayStore: r0[0] = rZR  ; List_4
    //     0x3d28f8: stur            wzr, [x0, #0x17]
    // 0x3d28fc: r0 = Vector2()
    //     0x3d28fc: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2900: r4 = 4
    //     0x3d2900: mov             x4, #4
    // 0x3d2904: stur            x0, [fp, #-0x28]
    // 0x3d2908: r0 = AllocateFloat32Array()
    //     0x3d2908: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d290c: ldur            x3, [fp, #-0x28]
    // 0x3d2910: StoreField: r3->field_7 = r0
    //     0x3d2910: stur            w0, [x3, #7]
    // 0x3d2914: d0 = 0.000000
    //     0x3d2914: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d2918: ldr             s0, [x17, #0x220]
    // 0x3d291c: StoreField: r0->field_1b = d0
    //     0x3d291c: stur            s0, [x0, #0x1b]
    // 0x3d2920: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d2920: stur            s0, [x0, #0x17]
    // 0x3d2924: r0 = GroundSprite()
    //     0x3d2924: bl              #0x3d2b28  ; AllocateGroundSpriteStub -> GroundSprite (size=0x64)
    // 0x3d2928: mov             x4, x0
    // 0x3d292c: r0 = Instance_Alignment
    //     0x3d292c: add             x0, PP, #0x1e, lsl #12  ; [pp+0x1e240] Obj!Alignment@5cc311
    //     0x3d2930: ldr             x0, [x0, #0x240]
    // 0x3d2934: stur            x4, [fp, #-0x30]
    // 0x3d2938: StoreField: r4->field_5f = r0
    //     0x3d2938: stur            w0, [x4, #0x5f]
    // 0x3d293c: r0 = false
    //     0x3d293c: add             x0, NULL, #0x30  ; false
    // 0x3d2940: StoreField: r4->field_5b = r0
    //     0x3d2940: stur            w0, [x4, #0x5b]
    // 0x3d2944: mov             x1, x4
    // 0x3d2948: ldur            x2, [fp, #-0x20]
    // 0x3d294c: ldur            x3, [fp, #-0x28]
    // 0x3d2950: r0 = SpriteComponent()
    //     0x3d2950: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d2954: ldur            x0, [fp, #-0x30]
    // 0x3d2958: ldur            x1, [fp, #-0x18]
    // 0x3d295c: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d295c: stur            w0, [x1, #0x17]
    //     0x3d2960: ldurb           w16, [x1, #-1]
    //     0x3d2964: ldurb           w17, [x0, #-1]
    //     0x3d2968: and             x16, x17, x16, lsr #2
    //     0x3d296c: tst             x16, HEAP, lsr #32
    //     0x3d2970: b.eq            #0x3d2978
    //     0x3d2974: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d2978: r0 = true
    //     0x3d2978: add             x0, NULL, #0x20  ; true
    // 0x3d297c: r0 = SuspendSyncStarAtYield()
    //     0x3d297c: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d2980: r0 = 0
    //     0x3d2980: mov             x0, #0
    // 0x3d2984: add             x1, fp, w0, sxtw #2
    // 0x3d2988: LoadField: r1 = r1->field_fffffff8
    //     0x3d2988: ldur            x1, [x1, #-8]
    // 0x3d298c: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x3d298c: ldur            w0, [x1, #0x17]
    // 0x3d2990: DecompressPointer r0
    //     0x3d2990: add             x0, x0, HEAP, lsl #32
    // 0x3d2994: ldur            x2, [fp, #-0x10]
    // 0x3d2998: stur            x0, [fp, #-0x18]
    // 0x3d299c: LoadField: r1 = r2->field_47
    //     0x3d299c: ldur            w1, [x2, #0x47]
    // 0x3d29a0: DecompressPointer r1
    //     0x3d29a0: add             x1, x1, HEAP, lsl #32
    // 0x3d29a4: cmp             w1, NULL
    // 0x3d29a8: b.ne            #0x3d29d8
    // 0x3d29ac: mov             x1, x2
    // 0x3d29b0: r0 = _findGameAndCheck()
    //     0x3d29b0: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d29b4: mov             x1, x0
    // 0x3d29b8: ldur            x2, [fp, #-0x10]
    // 0x3d29bc: StoreField: r2->field_47 = r0
    //     0x3d29bc: stur            w0, [x2, #0x47]
    //     0x3d29c0: ldurb           w16, [x2, #-1]
    //     0x3d29c4: ldurb           w17, [x0, #-1]
    //     0x3d29c8: and             x16, x17, x16, lsr #2
    //     0x3d29cc: tst             x16, HEAP, lsr #32
    //     0x3d29d0: b.eq            #0x3d29d8
    //     0x3d29d4: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d29d8: ldur            x0, [fp, #-0x18]
    // 0x3d29dc: LoadField: r3 = r1->field_83
    //     0x3d29dc: ldur            w3, [x1, #0x83]
    // 0x3d29e0: DecompressPointer r3
    //     0x3d29e0: add             x3, x3, HEAP, lsl #32
    // 0x3d29e4: LoadField: r1 = r3->field_37
    //     0x3d29e4: ldur            w1, [x3, #0x37]
    // 0x3d29e8: DecompressPointer r1
    //     0x3d29e8: add             x1, x1, HEAP, lsl #32
    // 0x3d29ec: r0 = size()
    //     0x3d29ec: bl              #0x435520  ; [package:flame/src/camera/viewport.dart] Viewport::size
    // 0x3d29f0: LoadField: r2 = r0->field_7
    //     0x3d29f0: ldur            w2, [x0, #7]
    // 0x3d29f4: DecompressPointer r2
    //     0x3d29f4: add             x2, x2, HEAP, lsl #32
    // 0x3d29f8: LoadField: r0 = r2->field_13
    //     0x3d29f8: ldur            w0, [x2, #0x13]
    // 0x3d29fc: r1 = LoadInt32Instr(r0)
    //     0x3d29fc: sbfx            x1, x0, #1, #0x1f
    // 0x3d2a00: mov             x0, x1
    // 0x3d2a04: r1 = 0
    //     0x3d2a04: mov             x1, #0
    // 0x3d2a08: cmp             x1, x0
    // 0x3d2a0c: b.hs            #0x3d2b24
    // 0x3d2a10: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x3d2a10: ldur            s0, [x2, #0x17]
    // 0x3d2a14: fcvt            d1, s0
    // 0x3d2a18: d0 = 8.000000
    //     0x3d2a18: fmov            d0, #8.00000000
    // 0x3d2a1c: fsub            d2, d1, d0
    // 0x3d2a20: ldur            x0, [fp, #-0x10]
    // 0x3d2a24: stur            d2, [fp, #-0x40]
    // 0x3d2a28: LoadField: r1 = r0->field_4b
    //     0x3d2a28: ldur            w1, [x0, #0x4b]
    // 0x3d2a2c: DecompressPointer r1
    //     0x3d2a2c: add             x1, x1, HEAP, lsl #32
    // 0x3d2a30: LoadField: d1 = r1->field_7
    //     0x3d2a30: ldur            d1, [x1, #7]
    // 0x3d2a34: fsub            d3, d1, d0
    // 0x3d2a38: stur            d3, [fp, #-0x38]
    // 0x3d2a3c: r0 = Vector2()
    //     0x3d2a3c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2a40: r4 = 4
    //     0x3d2a40: mov             x4, #4
    // 0x3d2a44: stur            x0, [fp, #-0x10]
    // 0x3d2a48: r0 = AllocateFloat32Array()
    //     0x3d2a48: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2a4c: ldur            x2, [fp, #-0x10]
    // 0x3d2a50: StoreField: r2->field_7 = r0
    //     0x3d2a50: stur            w0, [x2, #7]
    // 0x3d2a54: ldur            d0, [fp, #-0x38]
    // 0x3d2a58: fcvt            s1, d0
    // 0x3d2a5c: StoreField: r0->field_1b = d1
    //     0x3d2a5c: stur            s1, [x0, #0x1b]
    // 0x3d2a60: ldur            d0, [fp, #-0x40]
    // 0x3d2a64: fcvt            s1, d0
    // 0x3d2a68: ArrayStore: r0[0] = d1  ; List_8
    //     0x3d2a68: stur            s1, [x0, #0x17]
    // 0x3d2a6c: r0 = Vector2()
    //     0x3d2a6c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2a70: r4 = 4
    //     0x3d2a70: mov             x4, #4
    // 0x3d2a74: stur            x0, [fp, #-0x20]
    // 0x3d2a78: r0 = AllocateFloat32Array()
    //     0x3d2a78: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2a7c: ldur            x3, [fp, #-0x20]
    // 0x3d2a80: StoreField: r3->field_7 = r0
    //     0x3d2a80: stur            w0, [x3, #7]
    // 0x3d2a84: d0 = 0.000000
    //     0x3d2a84: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d2a88: ldr             s0, [x17, #0x220]
    // 0x3d2a8c: StoreField: r0->field_1b = d0
    //     0x3d2a8c: stur            s0, [x0, #0x1b]
    // 0x3d2a90: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d2a90: stur            s0, [x0, #0x17]
    // 0x3d2a94: r0 = GroundSprite()
    //     0x3d2a94: bl              #0x3d2b28  ; AllocateGroundSpriteStub -> GroundSprite (size=0x64)
    // 0x3d2a98: mov             x4, x0
    // 0x3d2a9c: r0 = Instance_Alignment
    //     0x3d2a9c: add             x0, PP, #0x1e, lsl #12  ; [pp+0x1e248] Obj!Alignment@5cc2f1
    //     0x3d2aa0: ldr             x0, [x0, #0x248]
    // 0x3d2aa4: stur            x4, [fp, #-0x28]
    // 0x3d2aa8: StoreField: r4->field_5f = r0
    //     0x3d2aa8: stur            w0, [x4, #0x5f]
    // 0x3d2aac: r0 = false
    //     0x3d2aac: add             x0, NULL, #0x30  ; false
    // 0x3d2ab0: StoreField: r4->field_5b = r0
    //     0x3d2ab0: stur            w0, [x4, #0x5b]
    // 0x3d2ab4: mov             x1, x4
    // 0x3d2ab8: ldur            x2, [fp, #-0x10]
    // 0x3d2abc: ldur            x3, [fp, #-0x20]
    // 0x3d2ac0: r0 = SpriteComponent()
    //     0x3d2ac0: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d2ac4: ldur            x0, [fp, #-0x28]
    // 0x3d2ac8: ldur            x1, [fp, #-0x18]
    // 0x3d2acc: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d2acc: stur            w0, [x1, #0x17]
    //     0x3d2ad0: ldurb           w16, [x1, #-1]
    //     0x3d2ad4: ldurb           w17, [x0, #-1]
    //     0x3d2ad8: and             x16, x17, x16, lsr #2
    //     0x3d2adc: tst             x16, HEAP, lsr #32
    //     0x3d2ae0: b.eq            #0x3d2ae8
    //     0x3d2ae4: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d2ae8: r0 = true
    //     0x3d2ae8: add             x0, NULL, #0x20  ; true
    // 0x3d2aec: r0 = SuspendSyncStarAtYield()
    //     0x3d2aec: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d2af0: r0 = false
    //     0x3d2af0: add             x0, NULL, #0x30  ; false
    // 0x3d2af4: LeaveFrame
    //     0x3d2af4: mov             SP, fp
    //     0x3d2af8: ldp             fp, lr, [SP], #0x10
    // 0x3d2afc: ret
    //     0x3d2afc: ret             
    // 0x3d2b00: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d2b00: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d2b04: b               #0x3d2144
    // 0x3d2b08: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d2b08: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d2b0c: b               #0x3d2170
    // 0x3d2b10: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d2b10: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3d2b14: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d2b14: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d2b18: b               #0x3d2404
    // 0x3d2b1c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d2b1c: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3d2b20: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d2b20: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3d2b24: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d2b24: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ _getGrassTuftTiles(/* No info */) {
    // ** addr: 0x3d2b34, size: 0x300
    // 0x3d2b34: EnterFrame
    //     0x3d2b34: stp             fp, lr, [SP, #-0x10]!
    //     0x3d2b38: mov             fp, SP
    // 0x3d2b3c: AllocStack(0x58)
    //     0x3d2b3c: sub             SP, SP, #0x58
    // 0x3d2b40: SetupParameters(Background this /* r1 => r2, fp-0x10 */, dynamic _ /* r2 => r1, fp-0x18 */)
    //     0x3d2b40: stur            NULL, [fp, #-8]
    //     0x3d2b44: stur            x1, [fp, #-0x10]
    //     0x3d2b48: mov             x16, x2
    //     0x3d2b4c: mov             x2, x1
    //     0x3d2b50: mov             x1, x16
    //     0x3d2b54: stur            x1, [fp, #-0x18]
    // 0x3d2b58: CheckStackOverflow
    //     0x3d2b58: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d2b5c: cmp             SP, x16
    //     0x3d2b60: b.ls            #0x3d2e18
    // 0x3d2b64: r0 = <SpriteComponent>
    //     0x3d2b64: add             x0, PP, #0x1e, lsl #12  ; [pp+0x1e200] TypeArguments: <SpriteComponent>
    //     0x3d2b68: ldr             x0, [x0, #0x200]
    // 0x3d2b6c: r0 = InitSyncStar()
    //     0x3d2b6c: bl              #0x2f0934  ; InitSyncStarStub
    // 0x3d2b70: r0 = Null
    //     0x3d2b70: mov             x0, NULL
    // 0x3d2b74: r0 = SuspendSyncStarAtStart()
    //     0x3d2b74: bl              #0x2f07a8  ; SuspendSyncStarAtStartStub
    // 0x3d2b78: d1 = 0.000000
    //     0x3d2b78: eor             v1.16b, v1.16b, v1.16b
    // 0x3d2b7c: d0 = 8.000000
    //     0x3d2b7c: fmov            d0, #8.00000000
    // 0x3d2b80: ldur            x0, [fp, #-0x10]
    // 0x3d2b84: stur            d1, [fp, #-0x40]
    // 0x3d2b88: stur            d0, [fp, #-0x48]
    // 0x3d2b8c: CheckStackOverflow
    //     0x3d2b8c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d2b90: cmp             SP, x16
    //     0x3d2b94: b.ls            #0x3d2e20
    // 0x3d2b98: mov             x1, x0
    // 0x3d2b9c: LoadField: r0 = r1->field_4b
    //     0x3d2b9c: ldur            w0, [x1, #0x4b]
    // 0x3d2ba0: DecompressPointer r0
    //     0x3d2ba0: add             x0, x0, HEAP, lsl #32
    // 0x3d2ba4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d2ba8: cmp             w0, w16
    // 0x3d2bac: b.ne            #0x3d2bbc
    // 0x3d2bb0: r2 = bottomOfIsland
    //     0x3d2bb0: add             x2, PP, #0x1e, lsl #12  ; [pp+0x1e218] Field <Background.bottomOfIsland>: late final (offset: 0x4c)
    //     0x3d2bb4: ldr             x2, [x2, #0x218]
    // 0x3d2bb8: r0 = InitLateFinalInstanceField()
    //     0x3d2bb8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d2bbc: LoadField: d0 = r0->field_7
    //     0x3d2bbc: ldur            d0, [x0, #7]
    // 0x3d2bc0: d1 = 8.000000
    //     0x3d2bc0: fmov            d1, #8.00000000
    // 0x3d2bc4: fsub            d2, d0, d1
    // 0x3d2bc8: ldur            d0, [fp, #-0x48]
    // 0x3d2bcc: fcmp            d2, d0
    // 0x3d2bd0: b.le            #0x3d2e08
    // 0x3d2bd4: ldur            d3, [fp, #-0x40]
    // 0x3d2bd8: d2 = 0.800000
    //     0x3d2bd8: add             x17, PP, #0x16, lsl #12  ; [pp+0x16248] IMM: double(0.8) from 0x3fe999999999999a
    //     0x3d2bdc: ldr             d2, [x17, #0x248]
    // 0x3d2be0: fmul            d4, d3, d2
    // 0x3d2be4: ldur            x1, [fp, #-0x18]
    // 0x3d2be8: stur            d4, [fp, #-0x50]
    // 0x3d2bec: r0 = nextDouble()
    //     0x3d2bec: bl              #0x379d5c  ; [dart:math] _Random::nextDouble
    // 0x3d2bf0: mov             v1.16b, v0.16b
    // 0x3d2bf4: d0 = 4.000000
    //     0x3d2bf4: fmov            d0, #4.00000000
    // 0x3d2bf8: fmul            d2, d1, d0
    // 0x3d2bfc: d1 = 2.000000
    //     0x3d2bfc: fmov            d1, #2.00000000
    // 0x3d2c00: fmul            d3, d2, d1
    // 0x3d2c04: fsub            d2, d3, d0
    // 0x3d2c08: d3 = 0.200000
    //     0x3d2c08: add             x17, PP, #8, lsl #12  ; [pp+0x8c40] IMM: double(0.2) from 0x3fc999999999999a
    //     0x3d2c0c: ldr             d3, [x17, #0xc40]
    // 0x3d2c10: fmul            d4, d2, d3
    // 0x3d2c14: ldur            d2, [fp, #-0x50]
    // 0x3d2c18: fadd            d5, d2, d4
    // 0x3d2c1c: stur            d5, [fp, #-0x58]
    // 0x3d2c20: d2 = 8.000000
    //     0x3d2c20: fmov            d2, #8.00000000
    // 0x3d2c24: fadd            d4, d5, d2
    // 0x3d2c28: ldur            d6, [fp, #-0x48]
    // 0x3d2c2c: fcvt            s7, d6
    // 0x3d2c30: stur            d7, [fp, #-0x50]
    // 0x3d2c34: ldur            x0, [fp, #-0x10]
    // 0x3d2c38: stur            d4, [fp, #-0x40]
    // 0x3d2c3c: CheckStackOverflow
    //     0x3d2c3c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d2c40: cmp             SP, x16
    //     0x3d2c44: b.ls            #0x3d2e28
    // 0x3d2c48: LoadField: r1 = r0->field_47
    //     0x3d2c48: ldur            w1, [x0, #0x47]
    // 0x3d2c4c: DecompressPointer r1
    //     0x3d2c4c: add             x1, x1, HEAP, lsl #32
    // 0x3d2c50: cmp             w1, NULL
    // 0x3d2c54: b.ne            #0x3d2c8c
    // 0x3d2c58: mov             x1, x0
    // 0x3d2c5c: r0 = _findGameAndCheck()
    //     0x3d2c5c: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x3d2c60: mov             x1, x0
    // 0x3d2c64: ldur            x2, [fp, #-0x10]
    // 0x3d2c68: StoreField: r2->field_47 = r0
    //     0x3d2c68: stur            w0, [x2, #0x47]
    //     0x3d2c6c: ldurb           w16, [x2, #-1]
    //     0x3d2c70: ldurb           w17, [x0, #-1]
    //     0x3d2c74: and             x16, x17, x16, lsr #2
    //     0x3d2c78: tst             x16, HEAP, lsr #32
    //     0x3d2c7c: b.eq            #0x3d2c84
    //     0x3d2c80: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d2c84: mov             x0, x1
    // 0x3d2c88: b               #0x3d2c94
    // 0x3d2c8c: mov             x2, x0
    // 0x3d2c90: mov             x0, x1
    // 0x3d2c94: ldur            d0, [fp, #-0x40]
    // 0x3d2c98: LoadField: r1 = r0->field_83
    //     0x3d2c98: ldur            w1, [x0, #0x83]
    // 0x3d2c9c: DecompressPointer r1
    //     0x3d2c9c: add             x1, x1, HEAP, lsl #32
    // 0x3d2ca0: LoadField: r0 = r1->field_37
    //     0x3d2ca0: ldur            w0, [x1, #0x37]
    // 0x3d2ca4: DecompressPointer r0
    //     0x3d2ca4: add             x0, x0, HEAP, lsl #32
    // 0x3d2ca8: mov             x1, x0
    // 0x3d2cac: r0 = size()
    //     0x3d2cac: bl              #0x435520  ; [package:flame/src/camera/viewport.dart] Viewport::size
    // 0x3d2cb0: LoadField: r2 = r0->field_7
    //     0x3d2cb0: ldur            w2, [x0, #7]
    // 0x3d2cb4: DecompressPointer r2
    //     0x3d2cb4: add             x2, x2, HEAP, lsl #32
    // 0x3d2cb8: LoadField: r0 = r2->field_13
    //     0x3d2cb8: ldur            w0, [x2, #0x13]
    // 0x3d2cbc: r1 = LoadInt32Instr(r0)
    //     0x3d2cbc: sbfx            x1, x0, #1, #0x1f
    // 0x3d2cc0: mov             x0, x1
    // 0x3d2cc4: r1 = 0
    //     0x3d2cc4: mov             x1, #0
    // 0x3d2cc8: cmp             x1, x0
    // 0x3d2ccc: b.hs            #0x3d2e30
    // 0x3d2cd0: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x3d2cd0: ldur            s0, [x2, #0x17]
    // 0x3d2cd4: fcvt            d1, s0
    // 0x3d2cd8: d0 = 8.000000
    //     0x3d2cd8: fmov            d0, #8.00000000
    // 0x3d2cdc: fsub            d2, d1, d0
    // 0x3d2ce0: ldur            d1, [fp, #-0x40]
    // 0x3d2ce4: fcmp            d2, d1
    // 0x3d2ce8: b.le            #0x3d2df0
    // 0x3d2cec: ldur            x1, [fp, #-0x18]
    // 0x3d2cf0: r2 = 2
    //     0x3d2cf0: mov             x2, #2
    // 0x3d2cf4: r0 = nextInt()
    //     0x3d2cf4: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x3d2cf8: cbz             x0, #0x3d2dc0
    // 0x3d2cfc: ldur            d0, [fp, #-0x40]
    // 0x3d2d00: ldur            d1, [fp, #-0x50]
    // 0x3d2d04: r0 = 0
    //     0x3d2d04: mov             x0, #0
    // 0x3d2d08: add             x1, fp, w0, sxtw #2
    // 0x3d2d0c: LoadField: r1 = r1->field_fffffff8
    //     0x3d2d0c: ldur            x1, [x1, #-8]
    // 0x3d2d10: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x3d2d10: ldur            w2, [x1, #0x17]
    // 0x3d2d14: DecompressPointer r2
    //     0x3d2d14: add             x2, x2, HEAP, lsl #32
    // 0x3d2d18: stur            x2, [fp, #-0x20]
    // 0x3d2d1c: r0 = Vector2()
    //     0x3d2d1c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2d20: r4 = 4
    //     0x3d2d20: mov             x4, #4
    // 0x3d2d24: stur            x0, [fp, #-0x28]
    // 0x3d2d28: r0 = AllocateFloat32Array()
    //     0x3d2d28: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2d2c: ldur            x2, [fp, #-0x28]
    // 0x3d2d30: StoreField: r2->field_7 = r0
    //     0x3d2d30: stur            w0, [x2, #7]
    // 0x3d2d34: ldur            d0, [fp, #-0x50]
    // 0x3d2d38: StoreField: r0->field_1b = d0
    //     0x3d2d38: stur            s0, [x0, #0x1b]
    // 0x3d2d3c: ldur            d1, [fp, #-0x40]
    // 0x3d2d40: fcvt            s2, d1
    // 0x3d2d44: ArrayStore: r0[0] = d2  ; List_8
    //     0x3d2d44: stur            s2, [x0, #0x17]
    // 0x3d2d48: r0 = Vector2()
    //     0x3d2d48: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d2d4c: r4 = 4
    //     0x3d2d4c: mov             x4, #4
    // 0x3d2d50: stur            x0, [fp, #-0x30]
    // 0x3d2d54: r0 = AllocateFloat32Array()
    //     0x3d2d54: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d2d58: ldur            x3, [fp, #-0x30]
    // 0x3d2d5c: StoreField: r3->field_7 = r0
    //     0x3d2d5c: stur            w0, [x3, #7]
    // 0x3d2d60: d0 = 0.000000
    //     0x3d2d60: add             x17, PP, #0x1e, lsl #12  ; [pp+0x1e220] IMM: 0x41000000
    //     0x3d2d64: ldr             s0, [x17, #0x220]
    // 0x3d2d68: StoreField: r0->field_1b = d0
    //     0x3d2d68: stur            s0, [x0, #0x1b]
    // 0x3d2d6c: ArrayStore: r0[0] = d0  ; List_8
    //     0x3d2d6c: stur            s0, [x0, #0x17]
    // 0x3d2d70: r0 = GrassSprite()
    //     0x3d2d70: bl              #0x3d2e34  ; AllocateGrassSpriteStub -> GrassSprite (size=0x60)
    // 0x3d2d74: mov             x4, x0
    // 0x3d2d78: r0 = false
    //     0x3d2d78: add             x0, NULL, #0x30  ; false
    // 0x3d2d7c: stur            x4, [fp, #-0x38]
    // 0x3d2d80: StoreField: r4->field_5b = r0
    //     0x3d2d80: stur            w0, [x4, #0x5b]
    // 0x3d2d84: mov             x1, x4
    // 0x3d2d88: ldur            x2, [fp, #-0x28]
    // 0x3d2d8c: ldur            x3, [fp, #-0x30]
    // 0x3d2d90: r0 = SpriteComponent()
    //     0x3d2d90: bl              #0x3d2098  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::SpriteComponent
    // 0x3d2d94: ldur            x0, [fp, #-0x38]
    // 0x3d2d98: ldur            x1, [fp, #-0x20]
    // 0x3d2d9c: ArrayStore: r1[0] = r0  ; List_4
    //     0x3d2d9c: stur            w0, [x1, #0x17]
    //     0x3d2da0: ldurb           w16, [x1, #-1]
    //     0x3d2da4: ldurb           w17, [x0, #-1]
    //     0x3d2da8: and             x16, x17, x16, lsr #2
    //     0x3d2dac: tst             x16, HEAP, lsr #32
    //     0x3d2db0: b.eq            #0x3d2db8
    //     0x3d2db4: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3d2db8: r0 = true
    //     0x3d2db8: add             x0, NULL, #0x20  ; true
    // 0x3d2dbc: r0 = SuspendSyncStarAtYield()
    //     0x3d2dbc: bl              #0x2f0620  ; SuspendSyncStarAtYieldStub
    // 0x3d2dc0: ldur            d0, [fp, #-0x40]
    // 0x3d2dc4: d1 = 8.000000
    //     0x3d2dc4: fmov            d1, #8.00000000
    // 0x3d2dc8: fadd            d4, d0, d1
    // 0x3d2dcc: ldur            d6, [fp, #-0x48]
    // 0x3d2dd0: ldur            d5, [fp, #-0x58]
    // 0x3d2dd4: ldur            d7, [fp, #-0x50]
    // 0x3d2dd8: mov             v2.16b, v1.16b
    // 0x3d2ddc: d1 = 2.000000
    //     0x3d2ddc: fmov            d1, #2.00000000
    // 0x3d2de0: d0 = 4.000000
    //     0x3d2de0: fmov            d0, #4.00000000
    // 0x3d2de4: d3 = 0.200000
    //     0x3d2de4: add             x17, PP, #8, lsl #12  ; [pp+0x8c40] IMM: double(0.2) from 0x3fc999999999999a
    //     0x3d2de8: ldr             d3, [x17, #0xc40]
    // 0x3d2dec: b               #0x3d2c34
    // 0x3d2df0: mov             v1.16b, v0.16b
    // 0x3d2df4: ldur            d0, [fp, #-0x48]
    // 0x3d2df8: fadd            d2, d0, d1
    // 0x3d2dfc: ldur            d1, [fp, #-0x58]
    // 0x3d2e00: mov             v0.16b, v2.16b
    // 0x3d2e04: b               #0x3d2b80
    // 0x3d2e08: r0 = false
    //     0x3d2e08: add             x0, NULL, #0x30  ; false
    // 0x3d2e0c: LeaveFrame
    //     0x3d2e0c: mov             SP, fp
    //     0x3d2e10: ldp             fp, lr, [SP], #0x10
    // 0x3d2e14: ret
    //     0x3d2e14: ret             
    // 0x3d2e18: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d2e18: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d2e1c: b               #0x3d2b64
    // 0x3d2e20: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d2e20: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d2e24: b               #0x3d2b98
    // 0x3d2e28: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d2e28: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d2e2c: b               #0x3d2c48
    // 0x3d2e30: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d2e30: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] bool <anonymous closure>(dynamic, Component) {
    // ** addr: 0x3d2e40, size: 0x24
    // 0x3d2e40: ldr             x1, [SP]
    // 0x3d2e44: r2 = LoadClassIdInstr(r1)
    //     0x3d2e44: ldur            x2, [x1, #-1]
    //     0x3d2e48: ubfx            x2, x2, #0xc, #0x14
    // 0x3d2e4c: sub             x16, x2, #0x76c
    // 0x3d2e50: cmp             x16, #3
    // 0x3d2e54: r16 = true
    //     0x3d2e54: add             x16, NULL, #0x20  ; true
    // 0x3d2e58: r17 = false
    //     0x3d2e58: add             x17, NULL, #0x30  ; false
    // 0x3d2e5c: csel            x0, x16, x17, ls
    // 0x3d2e60: ret
    //     0x3d2e60: ret             
  }
  _ Background(/* No info */) {
    // ** addr: 0x3d34e0, size: 0x50
    // 0x3d34e0: EnterFrame
    //     0x3d34e0: stp             fp, lr, [SP, #-0x10]!
    //     0x3d34e4: mov             fp, SP
    // 0x3d34e8: ldr             x2, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d34ec: r0 = -1
    //     0x3d34ec: mov             x0, #-1
    // 0x3d34f0: CheckStackOverflow
    //     0x3d34f0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d34f4: cmp             SP, x16
    //     0x3d34f8: b.ls            #0x3d3528
    // 0x3d34fc: StoreField: r1->field_4b = r2
    //     0x3d34fc: stur            w2, [x1, #0x4b]
    // 0x3d3500: StoreField: r1->field_4f = r0
    //     0x3d3500: stur            x0, [x1, #0x4f]
    // 0x3d3504: r2 = Null
    //     0x3d3504: mov             x2, NULL
    // 0x3d3508: r3 = Null
    //     0x3d3508: mov             x3, NULL
    // 0x3d350c: r5 = Null
    //     0x3d350c: mov             x5, NULL
    // 0x3d3510: r6 = Null
    //     0x3d3510: mov             x6, NULL
    // 0x3d3514: r0 = PositionComponent()
    //     0x3d3514: bl              #0x372c44  ; [package:flame/src/components/position_component.dart] PositionComponent::PositionComponent
    // 0x3d3518: r0 = Null
    //     0x3d3518: mov             x0, NULL
    // 0x3d351c: LeaveFrame
    //     0x3d351c: mov             SP, fp
    //     0x3d3520: ldp             fp, lr, [SP], #0x10
    // 0x3d3524: ret
    //     0x3d3524: ret             
    // 0x3d3528: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d3528: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d352c: b               #0x3d34fc
  }
  _ onLoad(/* No info */) async {
    // ** addr: 0x434620, size: 0x9c
    // 0x434620: EnterFrame
    //     0x434620: stp             fp, lr, [SP, #-0x10]!
    //     0x434624: mov             fp, SP
    // 0x434628: AllocStack(0x18)
    //     0x434628: sub             SP, SP, #0x18
    // 0x43462c: SetupParameters(Background this /* r1 => r1, fp-0x10 */)
    //     0x43462c: stur            NULL, [fp, #-8]
    //     0x434630: stur            x1, [fp, #-0x10]
    // 0x434634: CheckStackOverflow
    //     0x434634: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x434638: cmp             SP, x16
    //     0x43463c: b.ls            #0x4346b4
    // 0x434640: InitAsync() -> Future<void?>
    //     0x434640: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x434644: bl              #0x2556b4  ; InitAsyncStub
    // 0x434648: r0 = Null
    //     0x434648: mov             x0, NULL
    // 0x43464c: r0 = Await()
    //     0x43464c: bl              #0x255470  ; AwaitStub
    // 0x434650: r0 = Vector2()
    //     0x434650: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434654: r4 = 4
    //     0x434654: mov             x4, #4
    // 0x434658: stur            x0, [fp, #-0x18]
    // 0x43465c: r0 = AllocateFloat32Array()
    //     0x43465c: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434660: ldur            x2, [fp, #-0x18]
    // 0x434664: StoreField: r2->field_7 = r0
    //     0x434664: stur            w0, [x2, #7]
    // 0x434668: ldur            x0, [fp, #-0x10]
    // 0x43466c: LoadField: r1 = r0->field_37
    //     0x43466c: ldur            w1, [x0, #0x37]
    // 0x434670: DecompressPointer r1
    //     0x434670: add             x1, x1, HEAP, lsl #32
    // 0x434674: LoadField: r3 = r1->field_37
    //     0x434674: ldur            w3, [x1, #0x37]
    // 0x434678: DecompressPointer r3
    //     0x434678: add             x3, x3, HEAP, lsl #32
    // 0x43467c: mov             x1, x3
    // 0x434680: r0 = setFrom()
    //     0x434680: bl              #0x549084  ; [package:flame/src/game/notifying_vector2.dart] NotifyingVector2::setFrom
    // 0x434684: ldur            x1, [fp, #-0x10]
    // 0x434688: r0 = game()
    //     0x434688: bl              #0x3c9b08  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::game
    // 0x43468c: mov             x1, x0
    // 0x434690: r0 = size()
    //     0x434690: bl              #0x4338c8  ; [package:flame/src/game/flame_game.dart] FlameGame::size
    // 0x434694: ldur            x1, [fp, #-0x10]
    // 0x434698: mov             x2, x0
    // 0x43469c: r0 = size=()
    //     0x43469c: bl              #0x4346bc  ; [package:flame/src/components/position_component.dart] PositionComponent::size=
    // 0x4346a0: ldur            x1, [fp, #-0x10]
    // 0x4346a4: r2 = -101
    //     0x4346a4: mov             x2, #-0x65
    // 0x4346a8: r0 = priority=()
    //     0x4346a8: bl              #0x3d3760  ; [package:flame/src/components/core/component.dart] Component::priority=
    // 0x4346ac: r0 = Null
    //     0x4346ac: mov             x0, NULL
    // 0x4346b0: r0 = ReturnAsyncNotFuture()
    //     0x4346b0: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x4346b4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4346b4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4346b8: b               #0x434640
  }
}
