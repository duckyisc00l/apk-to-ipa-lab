// lib: , url: package:ricochlime/utils/sprite_painter.dart

// class id: 1049335, size: 0x8
class :: {
}

// class id: 1526, size: 0x14, field offset: 0xc
//   const constructor, 
class SpritePainter extends CustomPainter {

  _ paint(/* No info */) {
    // ** addr: 0x4b75a8, size: 0x124
    // 0x4b75a8: EnterFrame
    //     0x4b75a8: stp             fp, lr, [SP, #-0x10]!
    //     0x4b75ac: mov             fp, SP
    // 0x4b75b0: AllocStack(0x38)
    //     0x4b75b0: sub             SP, SP, #0x38
    // 0x4b75b4: SetupParameters(dynamic _ /* r2 => r2, fp-0x10 */, dynamic _ /* r3 => r3, fp-0x18 */)
    //     0x4b75b4: stur            x2, [fp, #-0x10]
    //     0x4b75b8: stur            x3, [fp, #-0x18]
    // 0x4b75bc: CheckStackOverflow
    //     0x4b75bc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4b75c0: cmp             SP, x16
    //     0x4b75c4: b.ls            #0x4b76c0
    // 0x4b75c8: LoadField: r0 = r1->field_b
    //     0x4b75c8: ldur            w0, [x1, #0xb]
    // 0x4b75cc: DecompressPointer r0
    //     0x4b75cc: add             x0, x0, HEAP, lsl #32
    // 0x4b75d0: stur            x0, [fp, #-8]
    // 0x4b75d4: LoadField: r1 = r0->field_f
    //     0x4b75d4: ldur            w1, [x0, #0xf]
    // 0x4b75d8: DecompressPointer r1
    //     0x4b75d8: add             x1, x1, HEAP, lsl #32
    // 0x4b75dc: ArrayLoad: d0 = r1[0]  ; List_8
    //     0x4b75dc: ldur            d0, [x1, #0x17]
    // 0x4b75e0: LoadField: d1 = r1->field_7
    //     0x4b75e0: ldur            d1, [x1, #7]
    // 0x4b75e4: fsub            d2, d0, d1
    // 0x4b75e8: stur            d2, [fp, #-0x28]
    // 0x4b75ec: LoadField: d0 = r1->field_1f
    //     0x4b75ec: ldur            d0, [x1, #0x1f]
    // 0x4b75f0: LoadField: d1 = r1->field_f
    //     0x4b75f0: ldur            d1, [x1, #0xf]
    // 0x4b75f4: fsub            d3, d0, d1
    // 0x4b75f8: stur            d3, [fp, #-0x20]
    // 0x4b75fc: r0 = Size()
    //     0x4b75fc: bl              #0x23d898  ; AllocateSizeStub -> Size (size=0x18)
    // 0x4b7600: ldur            d0, [fp, #-0x28]
    // 0x4b7604: StoreField: r0->field_7 = d0
    //     0x4b7604: stur            d0, [x0, #7]
    // 0x4b7608: ldur            d0, [fp, #-0x20]
    // 0x4b760c: StoreField: r0->field_f = d0
    //     0x4b760c: stur            d0, [x0, #0xf]
    // 0x4b7610: mov             x2, x0
    // 0x4b7614: ldur            x3, [fp, #-0x18]
    // 0x4b7618: r1 = Instance_BoxFit
    //     0x4b7618: add             x1, PP, #0x12, lsl #12  ; [pp+0x12368] Obj!BoxFit@5dae51
    //     0x4b761c: ldr             x1, [x1, #0x368]
    // 0x4b7620: r0 = applyBoxFit()
    //     0x4b7620: bl              #0x2bf494  ; [package:flutter/src/painting/box_fit.dart] ::applyBoxFit
    // 0x4b7624: LoadField: r1 = r0->field_b
    //     0x4b7624: ldur            w1, [x0, #0xb]
    // 0x4b7628: DecompressPointer r1
    //     0x4b7628: add             x1, x1, HEAP, lsl #32
    // 0x4b762c: r0 = SizeExtension.toVector2()
    //     0x4b762c: bl              #0x384c6c  ; [package:flame/src/extensions/size.dart] ::SizeExtension.toVector2
    // 0x4b7630: ldur            x1, [fp, #-0x18]
    // 0x4b7634: stur            x0, [fp, #-0x18]
    // 0x4b7638: r0 = SizeExtension.toVector2()
    //     0x4b7638: bl              #0x384c6c  ; [package:flame/src/extensions/size.dart] ::SizeExtension.toVector2
    // 0x4b763c: mov             x2, x0
    // 0x4b7640: LoadField: r3 = r2->field_7
    //     0x4b7640: ldur            w3, [x2, #7]
    // 0x4b7644: DecompressPointer r3
    //     0x4b7644: add             x3, x3, HEAP, lsl #32
    // 0x4b7648: LoadField: r0 = r3->field_13
    //     0x4b7648: ldur            w0, [x3, #0x13]
    // 0x4b764c: r1 = LoadInt32Instr(r0)
    //     0x4b764c: sbfx            x1, x0, #1, #0x1f
    // 0x4b7650: mov             x0, x1
    // 0x4b7654: r1 = 1
    //     0x4b7654: mov             x1, #1
    // 0x4b7658: cmp             x1, x0
    // 0x4b765c: b.hs            #0x4b76c8
    // 0x4b7660: LoadField: d0 = r3->field_1b
    //     0x4b7660: ldur            s0, [x3, #0x1b]
    // 0x4b7664: fcvt            d1, s0
    // 0x4b7668: d0 = 0.500000
    //     0x4b7668: fmov            d0, #0.50000000
    // 0x4b766c: fmul            d2, d1, d0
    // 0x4b7670: fcvt            s1, d2
    // 0x4b7674: StoreField: r3->field_1b = d1
    //     0x4b7674: stur            s1, [x3, #0x1b]
    // 0x4b7678: ArrayLoad: d1 = r3[0]  ; List_8
    //     0x4b7678: ldur            s1, [x3, #0x17]
    // 0x4b767c: fcvt            d2, s1
    // 0x4b7680: fmul            d1, d2, d0
    // 0x4b7684: fcvt            s0, d1
    // 0x4b7688: ArrayStore: r3[0] = d0  ; List_8
    //     0x4b7688: stur            s0, [x3, #0x17]
    // 0x4b768c: r16 = Instance_Anchor
    //     0x4b768c: add             x16, PP, #8, lsl #12  ; [pp+0x8b30] Obj!Anchor@5cce91
    //     0x4b7690: ldr             x16, [x16, #0xb30]
    // 0x4b7694: stp             x16, x2, [SP]
    // 0x4b7698: ldur            x1, [fp, #-8]
    // 0x4b769c: ldur            x2, [fp, #-0x10]
    // 0x4b76a0: ldur            x3, [fp, #-0x18]
    // 0x4b76a4: r4 = const [0, 0x5, 0x2, 0x3, anchor, 0x4, position, 0x3, null]
    //     0x4b76a4: add             x4, PP, #0x15, lsl #12  ; [pp+0x15c48] List(9) [0, 0x5, 0x2, 0x3, "anchor", 0x4, "position", 0x3, Null]
    //     0x4b76a8: ldr             x4, [x4, #0xc48]
    // 0x4b76ac: r0 = render()
    //     0x4b76ac: bl              #0x3c9188  ; [package:flame/src/sprite.dart] Sprite::render
    // 0x4b76b0: r0 = Null
    //     0x4b76b0: mov             x0, NULL
    // 0x4b76b4: LeaveFrame
    //     0x4b76b4: mov             SP, fp
    //     0x4b76b8: ldp             fp, lr, [SP], #0x10
    // 0x4b76bc: ret
    //     0x4b76bc: ret             
    // 0x4b76c0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4b76c0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4b76c4: b               #0x4b75c8
    // 0x4b76c8: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x4b76c8: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ shouldRepaint(/* No info */) {
    // ** addr: 0x4d2ff0, size: 0x8c
    // 0x4d2ff0: EnterFrame
    //     0x4d2ff0: stp             fp, lr, [SP, #-0x10]!
    //     0x4d2ff4: mov             fp, SP
    // 0x4d2ff8: AllocStack(0x10)
    //     0x4d2ff8: sub             SP, SP, #0x10
    // 0x4d2ffc: SetupParameters(SpritePainter this /* r1 => r4, fp-0x8 */, dynamic _ /* r2 => r0, fp-0x10 */)
    //     0x4d2ffc: mov             x0, x2
    //     0x4d3000: mov             x4, x1
    //     0x4d3004: mov             x3, x2
    //     0x4d3008: stur            x1, [fp, #-8]
    //     0x4d300c: stur            x2, [fp, #-0x10]
    // 0x4d3010: r2 = Null
    //     0x4d3010: mov             x2, NULL
    // 0x4d3014: r1 = Null
    //     0x4d3014: mov             x1, NULL
    // 0x4d3018: r4 = 60
    //     0x4d3018: mov             x4, #0x3c
    // 0x4d301c: branchIfSmi(r0, 0x4d3028)
    //     0x4d301c: tbz             w0, #0, #0x4d3028
    // 0x4d3020: r4 = LoadClassIdInstr(r0)
    //     0x4d3020: ldur            x4, [x0, #-1]
    //     0x4d3024: ubfx            x4, x4, #0xc, #0x14
    // 0x4d3028: cmp             x4, #0x5f6
    // 0x4d302c: b.eq            #0x4d3044
    // 0x4d3030: r8 = SpritePainter
    //     0x4d3030: add             x8, PP, #0x15, lsl #12  ; [pp+0x15c30] Type: SpritePainter
    //     0x4d3034: ldr             x8, [x8, #0xc30]
    // 0x4d3038: r3 = Null
    //     0x4d3038: add             x3, PP, #0x15, lsl #12  ; [pp+0x15c38] Null
    //     0x4d303c: ldr             x3, [x3, #0xc38]
    // 0x4d3040: r0 = DefaultTypeTest()
    //     0x4d3040: bl              #0x582454  ; DefaultTypeTestStub
    // 0x4d3044: ldur            x1, [fp, #-0x10]
    // 0x4d3048: LoadField: r2 = r1->field_b
    //     0x4d3048: ldur            w2, [x1, #0xb]
    // 0x4d304c: DecompressPointer r2
    //     0x4d304c: add             x2, x2, HEAP, lsl #32
    // 0x4d3050: ldur            x1, [fp, #-8]
    // 0x4d3054: LoadField: r3 = r1->field_b
    //     0x4d3054: ldur            w3, [x1, #0xb]
    // 0x4d3058: DecompressPointer r3
    //     0x4d3058: add             x3, x3, HEAP, lsl #32
    // 0x4d305c: cmp             w2, w3
    // 0x4d3060: b.eq            #0x4d306c
    // 0x4d3064: r0 = true
    //     0x4d3064: add             x0, NULL, #0x20  ; true
    // 0x4d3068: b               #0x4d3070
    // 0x4d306c: r0 = false
    //     0x4d306c: add             x0, NULL, #0x30  ; false
    // 0x4d3070: LeaveFrame
    //     0x4d3070: mov             SP, fp
    //     0x4d3074: ldp             fp, lr, [SP], #0x10
    // 0x4d3078: ret
    //     0x4d3078: ret             
  }
}

// class id: 2757, size: 0x10, field offset: 0xc
//   const constructor, 
class SkullsWidget extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x42f284, size: 0x13c
    // 0x42f284: EnterFrame
    //     0x42f284: stp             fp, lr, [SP, #-0x10]!
    //     0x42f288: mov             fp, SP
    // 0x42f28c: AllocStack(0x28)
    //     0x42f28c: sub             SP, SP, #0x28
    // 0x42f290: SetupParameters(SkullsWidget this /* r1 => r1, fp-0x8 */)
    //     0x42f290: stur            x1, [fp, #-8]
    // 0x42f294: CheckStackOverflow
    //     0x42f294: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42f298: cmp             SP, x16
    //     0x42f29c: b.ls            #0x42f3b8
    // 0x42f2a0: r0 = LoadStaticField(0x860)
    //     0x42f2a0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42f2a4: ldr             x0, [x0, #0x10c0]
    // 0x42f2a8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42f2ac: cmp             w0, w16
    // 0x42f2b0: b.ne            #0x42f2c0
    // 0x42f2b4: r2 = instance
    //     0x42f2b4: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x42f2b8: ldr             x2, [x2, #0x6f0]
    // 0x42f2bc: r0 = InitLateFinalStaticField()
    //     0x42f2bc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42f2c0: LoadField: r1 = r0->field_47
    //     0x42f2c0: ldur            w1, [x0, #0x47]
    // 0x42f2c4: DecompressPointer r1
    //     0x42f2c4: add             x1, x1, HEAP, lsl #32
    // 0x42f2c8: r2 = "overworld.png"
    //     0x42f2c8: add             x2, PP, #0xf, lsl #12  ; [pp+0xfee8] "overworld.png"
    //     0x42f2cc: ldr             x2, [x2, #0xee8]
    // 0x42f2d0: r0 = fromCache()
    //     0x42f2d0: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x42f2d4: mov             x1, x0
    // 0x42f2d8: ldur            x0, [fp, #-8]
    // 0x42f2dc: stur            x1, [fp, #-0x10]
    // 0x42f2e0: LoadField: r2 = r0->field_b
    //     0x42f2e0: ldur            w2, [x0, #0xb]
    // 0x42f2e4: DecompressPointer r2
    //     0x42f2e4: add             x2, x2, HEAP, lsl #32
    // 0x42f2e8: LoadField: d0 = r2->field_13
    //     0x42f2e8: ldur            d0, [x2, #0x13]
    // 0x42f2ec: stur            d0, [fp, #-0x28]
    // 0x42f2f0: LoadField: d1 = r2->field_1b
    //     0x42f2f0: ldur            d1, [x2, #0x1b]
    // 0x42f2f4: stur            d1, [fp, #-0x20]
    // 0x42f2f8: r0 = Vector2()
    //     0x42f2f8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x42f2fc: r4 = 4
    //     0x42f2fc: mov             x4, #4
    // 0x42f300: stur            x0, [fp, #-8]
    // 0x42f304: r0 = AllocateFloat32Array()
    //     0x42f304: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x42f308: ldur            x3, [fp, #-8]
    // 0x42f30c: StoreField: r3->field_7 = r0
    //     0x42f30c: stur            w0, [x3, #7]
    // 0x42f310: ldur            d0, [fp, #-0x20]
    // 0x42f314: fcvt            s1, d0
    // 0x42f318: StoreField: r0->field_1b = d1
    //     0x42f318: stur            s1, [x0, #0x1b]
    // 0x42f31c: ldur            d0, [fp, #-0x28]
    // 0x42f320: fcvt            s1, d0
    // 0x42f324: ArrayStore: r0[0] = d1  ; List_8
    //     0x42f324: stur            s1, [x0, #0x17]
    // 0x42f328: r0 = Vector2()
    //     0x42f328: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x42f32c: r4 = 4
    //     0x42f32c: mov             x4, #4
    // 0x42f330: stur            x0, [fp, #-0x18]
    // 0x42f334: r0 = AllocateFloat32Array()
    //     0x42f334: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x42f338: ldur            x5, [fp, #-0x18]
    // 0x42f33c: StoreField: r5->field_7 = r0
    //     0x42f33c: stur            w0, [x5, #7]
    // 0x42f340: d0 = 0.000000
    //     0x42f340: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x42f344: ldr             s0, [x17, #0xca8]
    // 0x42f348: StoreField: r0->field_1b = d0
    //     0x42f348: stur            s0, [x0, #0x1b]
    // 0x42f34c: ArrayStore: r0[0] = d0  ; List_8
    //     0x42f34c: stur            s0, [x0, #0x17]
    // 0x42f350: r0 = Sprite()
    //     0x42f350: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x42f354: mov             x1, x0
    // 0x42f358: ldur            x2, [fp, #-0x10]
    // 0x42f35c: ldur            x3, [fp, #-8]
    // 0x42f360: ldur            x5, [fp, #-0x18]
    // 0x42f364: stur            x0, [fp, #-8]
    // 0x42f368: r0 = Sprite()
    //     0x42f368: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x42f36c: r0 = SpritePainter()
    //     0x42f36c: bl              #0x42f15c  ; AllocateSpritePainterStub -> SpritePainter (size=0x14)
    // 0x42f370: mov             x1, x0
    // 0x42f374: ldur            x0, [fp, #-8]
    // 0x42f378: stur            x1, [fp, #-0x10]
    // 0x42f37c: StoreField: r1->field_b = r0
    //     0x42f37c: stur            w0, [x1, #0xb]
    // 0x42f380: r0 = Instance_BoxFit
    //     0x42f380: add             x0, PP, #0x12, lsl #12  ; [pp+0x12368] Obj!BoxFit@5dae51
    //     0x42f384: ldr             x0, [x0, #0x368]
    // 0x42f388: StoreField: r1->field_f = r0
    //     0x42f388: stur            w0, [x1, #0xf]
    // 0x42f38c: r0 = CustomPaint()
    //     0x42f38c: bl              #0x35cd60  ; AllocateCustomPaintStub -> CustomPaint (size=0x24)
    // 0x42f390: ldur            x1, [fp, #-0x10]
    // 0x42f394: StoreField: r0->field_f = r1
    //     0x42f394: stur            w1, [x0, #0xf]
    // 0x42f398: r1 = Instance_Size
    //     0x42f398: ldr             x1, [PP, #0x31e0]  ; [pp+0x31e0] Obj!Size@5d00a1
    // 0x42f39c: ArrayStore: r0[0] = r1  ; List_4
    //     0x42f39c: stur            w1, [x0, #0x17]
    // 0x42f3a0: r1 = false
    //     0x42f3a0: add             x1, NULL, #0x30  ; false
    // 0x42f3a4: StoreField: r0->field_1b = r1
    //     0x42f3a4: stur            w1, [x0, #0x1b]
    // 0x42f3a8: StoreField: r0->field_1f = r1
    //     0x42f3a8: stur            w1, [x0, #0x1f]
    // 0x42f3ac: LeaveFrame
    //     0x42f3ac: mov             SP, fp
    //     0x42f3b0: ldp             fp, lr, [SP], #0x10
    // 0x42f3b4: ret
    //     0x42f3b4: ret             
    // 0x42f3b8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42f3b8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42f3bc: b               #0x42f2a0
  }
}

// class id: 2758, size: 0xc, field offset: 0xc
//   const constructor, 
class PlayerWidget extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x42f168, size: 0x11c
    // 0x42f168: EnterFrame
    //     0x42f168: stp             fp, lr, [SP, #-0x10]!
    //     0x42f16c: mov             fp, SP
    // 0x42f170: AllocStack(0x18)
    //     0x42f170: sub             SP, SP, #0x18
    // 0x42f174: CheckStackOverflow
    //     0x42f174: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42f178: cmp             SP, x16
    //     0x42f17c: b.ls            #0x42f27c
    // 0x42f180: r0 = LoadStaticField(0x860)
    //     0x42f180: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42f184: ldr             x0, [x0, #0x10c0]
    // 0x42f188: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42f18c: cmp             w0, w16
    // 0x42f190: b.ne            #0x42f1a0
    // 0x42f194: r2 = instance
    //     0x42f194: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x42f198: ldr             x2, [x2, #0x6f0]
    // 0x42f19c: r0 = InitLateFinalStaticField()
    //     0x42f19c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42f1a0: LoadField: r1 = r0->field_47
    //     0x42f1a0: ldur            w1, [x0, #0x47]
    // 0x42f1a4: DecompressPointer r1
    //     0x42f1a4: add             x1, x1, HEAP, lsl #32
    // 0x42f1a8: r2 = "character_subset.png"
    //     0x42f1a8: add             x2, PP, #0xe, lsl #12  ; [pp+0xe748] "character_subset.png"
    //     0x42f1ac: ldr             x2, [x2, #0x748]
    // 0x42f1b0: r0 = fromCache()
    //     0x42f1b0: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x42f1b4: stur            x0, [fp, #-8]
    // 0x42f1b8: r0 = Vector2()
    //     0x42f1b8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x42f1bc: r4 = 4
    //     0x42f1bc: mov             x4, #4
    // 0x42f1c0: stur            x0, [fp, #-0x10]
    // 0x42f1c4: r0 = AllocateFloat32Array()
    //     0x42f1c4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x42f1c8: ldur            x3, [fp, #-0x10]
    // 0x42f1cc: StoreField: r3->field_7 = r0
    //     0x42f1cc: stur            w0, [x3, #7]
    // 0x42f1d0: d0 = 0.000000
    //     0x42f1d0: add             x17, PP, #0xe, lsl #12  ; [pp+0xe750] IMM: 0x41b80000
    //     0x42f1d4: ldr             s0, [x17, #0x750]
    // 0x42f1d8: StoreField: r0->field_1b = d0
    //     0x42f1d8: stur            s0, [x0, #0x1b]
    // 0x42f1dc: ArrayStore: r0[0] = rZR  ; List_4
    //     0x42f1dc: stur            wzr, [x0, #0x17]
    // 0x42f1e0: r0 = Vector2()
    //     0x42f1e0: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x42f1e4: r4 = 4
    //     0x42f1e4: mov             x4, #4
    // 0x42f1e8: stur            x0, [fp, #-0x18]
    // 0x42f1ec: r0 = AllocateFloat32Array()
    //     0x42f1ec: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x42f1f0: ldur            x5, [fp, #-0x18]
    // 0x42f1f4: StoreField: r5->field_7 = r0
    //     0x42f1f4: stur            w0, [x5, #7]
    // 0x42f1f8: d0 = 0.000000
    //     0x42f1f8: add             x17, PP, #0xe, lsl #12  ; [pp+0xe750] IMM: 0x41b80000
    //     0x42f1fc: ldr             s0, [x17, #0x750]
    // 0x42f200: StoreField: r0->field_1b = d0
    //     0x42f200: stur            s0, [x0, #0x1b]
    // 0x42f204: d0 = 0.000000
    //     0x42f204: add             x17, PP, #0xe, lsl #12  ; [pp+0xe758] IMM: 0x41880000
    //     0x42f208: ldr             s0, [x17, #0x758]
    // 0x42f20c: ArrayStore: r0[0] = d0  ; List_8
    //     0x42f20c: stur            s0, [x0, #0x17]
    // 0x42f210: r0 = Sprite()
    //     0x42f210: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x42f214: mov             x1, x0
    // 0x42f218: ldur            x2, [fp, #-8]
    // 0x42f21c: ldur            x3, [fp, #-0x10]
    // 0x42f220: ldur            x5, [fp, #-0x18]
    // 0x42f224: stur            x0, [fp, #-8]
    // 0x42f228: r0 = Sprite()
    //     0x42f228: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x42f22c: r0 = SpritePainter()
    //     0x42f22c: bl              #0x42f15c  ; AllocateSpritePainterStub -> SpritePainter (size=0x14)
    // 0x42f230: mov             x1, x0
    // 0x42f234: ldur            x0, [fp, #-8]
    // 0x42f238: stur            x1, [fp, #-0x10]
    // 0x42f23c: StoreField: r1->field_b = r0
    //     0x42f23c: stur            w0, [x1, #0xb]
    // 0x42f240: r0 = Instance_BoxFit
    //     0x42f240: add             x0, PP, #0x12, lsl #12  ; [pp+0x12368] Obj!BoxFit@5dae51
    //     0x42f244: ldr             x0, [x0, #0x368]
    // 0x42f248: StoreField: r1->field_f = r0
    //     0x42f248: stur            w0, [x1, #0xf]
    // 0x42f24c: r0 = CustomPaint()
    //     0x42f24c: bl              #0x35cd60  ; AllocateCustomPaintStub -> CustomPaint (size=0x24)
    // 0x42f250: ldur            x1, [fp, #-0x10]
    // 0x42f254: StoreField: r0->field_f = r1
    //     0x42f254: stur            w1, [x0, #0xf]
    // 0x42f258: r1 = Instance_Size
    //     0x42f258: add             x1, PP, #0x13, lsl #12  ; [pp+0x13710] Obj!Size@5d01c1
    //     0x42f25c: ldr             x1, [x1, #0x710]
    // 0x42f260: ArrayStore: r0[0] = r1  ; List_4
    //     0x42f260: stur            w1, [x0, #0x17]
    // 0x42f264: r1 = false
    //     0x42f264: add             x1, NULL, #0x30  ; false
    // 0x42f268: StoreField: r0->field_1b = r1
    //     0x42f268: stur            w1, [x0, #0x1b]
    // 0x42f26c: StoreField: r0->field_1f = r1
    //     0x42f26c: stur            w1, [x0, #0x1f]
    // 0x42f270: LeaveFrame
    //     0x42f270: mov             SP, fp
    //     0x42f274: ldp             fp, lr, [SP], #0x10
    // 0x42f278: ret
    //     0x42f278: ret             
    // 0x42f27c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42f27c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42f280: b               #0x42f180
  }
}

// class id: 2759, size: 0x10, field offset: 0xc
//   const constructor, 
class MonsterWidget extends StatelessWidget {

  _OneByteString field_c;

  _ build(/* No info */) {
    // ** addr: 0x42f050, size: 0x10c
    // 0x42f050: EnterFrame
    //     0x42f050: stp             fp, lr, [SP, #-0x10]!
    //     0x42f054: mov             fp, SP
    // 0x42f058: AllocStack(0x18)
    //     0x42f058: sub             SP, SP, #0x18
    // 0x42f05c: SetupParameters(MonsterWidget this /* r1 => r1, fp-0x8 */)
    //     0x42f05c: stur            x1, [fp, #-8]
    // 0x42f060: CheckStackOverflow
    //     0x42f060: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42f064: cmp             SP, x16
    //     0x42f068: b.ls            #0x42f154
    // 0x42f06c: r0 = LoadStaticField(0x860)
    //     0x42f06c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42f070: ldr             x0, [x0, #0x10c0]
    // 0x42f074: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42f078: cmp             w0, w16
    // 0x42f07c: b.ne            #0x42f08c
    // 0x42f080: r2 = instance
    //     0x42f080: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x42f084: ldr             x2, [x2, #0x6f0]
    // 0x42f088: r0 = InitLateFinalStaticField()
    //     0x42f088: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42f08c: LoadField: r1 = r0->field_47
    //     0x42f08c: ldur            w1, [x0, #0x47]
    // 0x42f090: DecompressPointer r1
    //     0x42f090: add             x1, x1, HEAP, lsl #32
    // 0x42f094: ldur            x0, [fp, #-8]
    // 0x42f098: LoadField: r2 = r0->field_b
    //     0x42f098: ldur            w2, [x0, #0xb]
    // 0x42f09c: DecompressPointer r2
    //     0x42f09c: add             x2, x2, HEAP, lsl #32
    // 0x42f0a0: r0 = fromCache()
    //     0x42f0a0: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x42f0a4: stur            x0, [fp, #-8]
    // 0x42f0a8: r0 = Vector2()
    //     0x42f0a8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x42f0ac: r4 = 4
    //     0x42f0ac: mov             x4, #4
    // 0x42f0b0: stur            x0, [fp, #-0x10]
    // 0x42f0b4: r0 = AllocateFloat32Array()
    //     0x42f0b4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x42f0b8: ldur            x3, [fp, #-0x10]
    // 0x42f0bc: StoreField: r3->field_7 = r0
    //     0x42f0bc: stur            w0, [x3, #7]
    // 0x42f0c0: r0 = Vector2()
    //     0x42f0c0: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x42f0c4: r4 = 4
    //     0x42f0c4: mov             x4, #4
    // 0x42f0c8: stur            x0, [fp, #-0x18]
    // 0x42f0cc: r0 = AllocateFloat32Array()
    //     0x42f0cc: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x42f0d0: ldur            x5, [fp, #-0x18]
    // 0x42f0d4: StoreField: r5->field_7 = r0
    //     0x42f0d4: stur            w0, [x5, #7]
    // 0x42f0d8: d0 = 0.000000
    //     0x42f0d8: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8c0] IMM: 0x41c00000
    //     0x42f0dc: ldr             s0, [x17, #0x8c0]
    // 0x42f0e0: StoreField: r0->field_1b = d0
    //     0x42f0e0: stur            s0, [x0, #0x1b]
    // 0x42f0e4: ArrayStore: r0[0] = d0  ; List_8
    //     0x42f0e4: stur            s0, [x0, #0x17]
    // 0x42f0e8: r0 = Sprite()
    //     0x42f0e8: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x42f0ec: mov             x1, x0
    // 0x42f0f0: ldur            x2, [fp, #-8]
    // 0x42f0f4: ldur            x3, [fp, #-0x10]
    // 0x42f0f8: ldur            x5, [fp, #-0x18]
    // 0x42f0fc: stur            x0, [fp, #-8]
    // 0x42f100: r0 = Sprite()
    //     0x42f100: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x42f104: r0 = SpritePainter()
    //     0x42f104: bl              #0x42f15c  ; AllocateSpritePainterStub -> SpritePainter (size=0x14)
    // 0x42f108: mov             x1, x0
    // 0x42f10c: ldur            x0, [fp, #-8]
    // 0x42f110: stur            x1, [fp, #-0x10]
    // 0x42f114: StoreField: r1->field_b = r0
    //     0x42f114: stur            w0, [x1, #0xb]
    // 0x42f118: r0 = Instance_BoxFit
    //     0x42f118: add             x0, PP, #0x12, lsl #12  ; [pp+0x12368] Obj!BoxFit@5dae51
    //     0x42f11c: ldr             x0, [x0, #0x368]
    // 0x42f120: StoreField: r1->field_f = r0
    //     0x42f120: stur            w0, [x1, #0xf]
    // 0x42f124: r0 = CustomPaint()
    //     0x42f124: bl              #0x35cd60  ; AllocateCustomPaintStub -> CustomPaint (size=0x24)
    // 0x42f128: ldur            x1, [fp, #-0x10]
    // 0x42f12c: StoreField: r0->field_f = r1
    //     0x42f12c: stur            w1, [x0, #0xf]
    // 0x42f130: r1 = Instance_Size
    //     0x42f130: add             x1, PP, #0x13, lsl #12  ; [pp+0x13710] Obj!Size@5d01c1
    //     0x42f134: ldr             x1, [x1, #0x710]
    // 0x42f138: ArrayStore: r0[0] = r1  ; List_4
    //     0x42f138: stur            w1, [x0, #0x17]
    // 0x42f13c: r1 = false
    //     0x42f13c: add             x1, NULL, #0x30  ; false
    // 0x42f140: StoreField: r0->field_1b = r1
    //     0x42f140: stur            w1, [x0, #0x1b]
    // 0x42f144: StoreField: r0->field_1f = r1
    //     0x42f144: stur            w1, [x0, #0x1f]
    // 0x42f148: LeaveFrame
    //     0x42f148: mov             SP, fp
    //     0x42f14c: ldp             fp, lr, [SP], #0x10
    // 0x42f150: ret
    //     0x42f150: ret             
    // 0x42f154: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42f154: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42f158: b               #0x42f06c
  }
}
