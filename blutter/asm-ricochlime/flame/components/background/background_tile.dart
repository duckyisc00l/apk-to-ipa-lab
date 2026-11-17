// lib: , url: package:ricochlime/flame/components/background/background_tile.dart

// class id: 1049303, size: 0x8
class :: {
}

// class id: 1883, size: 0x3c, field offset: 0x3c
abstract class FlickeringSprite extends HasPaint<dynamic> {
}

// class id: 1884, size: 0x3c, field offset: 0x3c
abstract class DarkeningSprite extends HasPaint<dynamic> {
}

// class id: 1900, size: 0x74, field offset: 0x70
class SkullSprite extends _MixinApplication419&SpriteComponent&HasGameReference&FlickeringSprite {

  _ onLoad(/* No info */) {
    // ** addr: 0x4353cc, size: 0x154
    // 0x4353cc: EnterFrame
    //     0x4353cc: stp             fp, lr, [SP, #-0x10]!
    //     0x4353d0: mov             fp, SP
    // 0x4353d4: AllocStack(0x30)
    //     0x4353d4: sub             SP, SP, #0x30
    // 0x4353d8: SetupParameters(SkullSprite this /* r1 => r0, fp-0x8 */)
    //     0x4353d8: mov             x0, x1
    //     0x4353dc: stur            x1, [fp, #-8]
    // 0x4353e0: CheckStackOverflow
    //     0x4353e0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4353e4: cmp             SP, x16
    //     0x4353e8: b.ls            #0x435518
    // 0x4353ec: LoadField: r1 = r0->field_57
    //     0x4353ec: ldur            w1, [x0, #0x57]
    // 0x4353f0: DecompressPointer r1
    //     0x4353f0: add             x1, x1, HEAP, lsl #32
    // 0x4353f4: cmp             w1, NULL
    // 0x4353f8: b.ne            #0x435430
    // 0x4353fc: mov             x1, x0
    // 0x435400: r0 = _findGameAndCheck()
    //     0x435400: bl              #0x435224  ; [dart:mixin_deduplication] _MixinApplication417&SpriteComponent&HasGameReference::_findGameAndCheck
    // 0x435404: mov             x1, x0
    // 0x435408: ldur            x3, [fp, #-8]
    // 0x43540c: StoreField: r3->field_57 = r0
    //     0x43540c: stur            w0, [x3, #0x57]
    //     0x435410: ldurb           w16, [x3, #-1]
    //     0x435414: ldurb           w17, [x0, #-1]
    //     0x435418: and             x16, x17, x16, lsr #2
    //     0x43541c: tst             x16, HEAP, lsr #32
    //     0x435420: b.eq            #0x435428
    //     0x435424: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x435428: mov             x0, x1
    // 0x43542c: b               #0x435438
    // 0x435430: mov             x3, x0
    // 0x435434: mov             x0, x1
    // 0x435438: LoadField: r1 = r0->field_47
    //     0x435438: ldur            w1, [x0, #0x47]
    // 0x43543c: DecompressPointer r1
    //     0x43543c: add             x1, x1, HEAP, lsl #32
    // 0x435440: r2 = "overworld.png"
    //     0x435440: add             x2, PP, #0xf, lsl #12  ; [pp+0xfee8] "overworld.png"
    //     0x435444: ldr             x2, [x2, #0xee8]
    // 0x435448: r0 = fromCache()
    //     0x435448: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x43544c: mov             x1, x0
    // 0x435450: ldur            x0, [fp, #-8]
    // 0x435454: stur            x1, [fp, #-0x10]
    // 0x435458: LoadField: r2 = r0->field_6f
    //     0x435458: ldur            w2, [x0, #0x6f]
    // 0x43545c: DecompressPointer r2
    //     0x43545c: add             x2, x2, HEAP, lsl #32
    // 0x435460: LoadField: d0 = r2->field_13
    //     0x435460: ldur            d0, [x2, #0x13]
    // 0x435464: stur            d0, [fp, #-0x30]
    // 0x435468: LoadField: d1 = r2->field_1b
    //     0x435468: ldur            d1, [x2, #0x1b]
    // 0x43546c: stur            d1, [fp, #-0x28]
    // 0x435470: r0 = Vector2()
    //     0x435470: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x435474: r4 = 4
    //     0x435474: mov             x4, #4
    // 0x435478: stur            x0, [fp, #-0x18]
    // 0x43547c: r0 = AllocateFloat32Array()
    //     0x43547c: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x435480: ldur            x3, [fp, #-0x18]
    // 0x435484: StoreField: r3->field_7 = r0
    //     0x435484: stur            w0, [x3, #7]
    // 0x435488: ldur            d0, [fp, #-0x28]
    // 0x43548c: fcvt            s1, d0
    // 0x435490: StoreField: r0->field_1b = d1
    //     0x435490: stur            s1, [x0, #0x1b]
    // 0x435494: ldur            d0, [fp, #-0x30]
    // 0x435498: fcvt            s1, d0
    // 0x43549c: ArrayStore: r0[0] = d1  ; List_8
    //     0x43549c: stur            s1, [x0, #0x17]
    // 0x4354a0: r0 = Vector2()
    //     0x4354a0: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x4354a4: r4 = 4
    //     0x4354a4: mov             x4, #4
    // 0x4354a8: stur            x0, [fp, #-0x20]
    // 0x4354ac: r0 = AllocateFloat32Array()
    //     0x4354ac: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x4354b0: ldur            x5, [fp, #-0x20]
    // 0x4354b4: StoreField: r5->field_7 = r0
    //     0x4354b4: stur            w0, [x5, #7]
    // 0x4354b8: d0 = 0.000000
    //     0x4354b8: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x4354bc: ldr             s0, [x17, #0xca8]
    // 0x4354c0: StoreField: r0->field_1b = d0
    //     0x4354c0: stur            s0, [x0, #0x1b]
    // 0x4354c4: ArrayStore: r0[0] = d0  ; List_8
    //     0x4354c4: stur            s0, [x0, #0x17]
    // 0x4354c8: r0 = Sprite()
    //     0x4354c8: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x4354cc: mov             x1, x0
    // 0x4354d0: ldur            x2, [fp, #-0x10]
    // 0x4354d4: ldur            x3, [fp, #-0x18]
    // 0x4354d8: ldur            x5, [fp, #-0x20]
    // 0x4354dc: stur            x0, [fp, #-0x10]
    // 0x4354e0: r0 = Sprite()
    //     0x4354e0: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x4354e4: ldur            x0, [fp, #-0x10]
    // 0x4354e8: ldur            x1, [fp, #-8]
    // 0x4354ec: StoreField: r1->field_4f = r0
    //     0x4354ec: stur            w0, [x1, #0x4f]
    //     0x4354f0: ldurb           w16, [x1, #-1]
    //     0x4354f4: ldurb           w17, [x0, #-1]
    //     0x4354f8: and             x16, x17, x16, lsr #2
    //     0x4354fc: tst             x16, HEAP, lsr #32
    //     0x435500: b.eq            #0x435508
    //     0x435504: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x435508: r0 = Null
    //     0x435508: mov             x0, NULL
    // 0x43550c: LeaveFrame
    //     0x43550c: mov             SP, fp
    //     0x435510: ldp             fp, lr, [SP], #0x10
    // 0x435514: ret
    //     0x435514: ret             
    // 0x435518: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x435518: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x43551c: b               #0x4353ec
  }
}

// class id: 1902, size: 0x60, field offset: 0x60
class GrassSprite extends _MixinApplication418&SpriteComponent&HasGameReference&DarkeningSprite {

  _ onLoad(/* No info */) {
    // ** addr: 0x4352a4, size: 0x128
    // 0x4352a4: EnterFrame
    //     0x4352a4: stp             fp, lr, [SP, #-0x10]!
    //     0x4352a8: mov             fp, SP
    // 0x4352ac: AllocStack(0x20)
    //     0x4352ac: sub             SP, SP, #0x20
    // 0x4352b0: SetupParameters(GrassSprite this /* r1 => r0, fp-0x8 */)
    //     0x4352b0: mov             x0, x1
    //     0x4352b4: stur            x1, [fp, #-8]
    // 0x4352b8: CheckStackOverflow
    //     0x4352b8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4352bc: cmp             SP, x16
    //     0x4352c0: b.ls            #0x4353c4
    // 0x4352c4: mov             x1, x0
    // 0x4352c8: r0 = onLoad()
    //     0x4352c8: bl              #0x43525c  ; [dart:mixin_deduplication] _MixinApplication418&SpriteComponent&HasGameReference&DarkeningSprite::onLoad
    // 0x4352cc: ldur            x0, [fp, #-8]
    // 0x4352d0: LoadField: r1 = r0->field_57
    //     0x4352d0: ldur            w1, [x0, #0x57]
    // 0x4352d4: DecompressPointer r1
    //     0x4352d4: add             x1, x1, HEAP, lsl #32
    // 0x4352d8: cmp             w1, NULL
    // 0x4352dc: b.ne            #0x435314
    // 0x4352e0: mov             x1, x0
    // 0x4352e4: r0 = _findGameAndCheck()
    //     0x4352e4: bl              #0x435224  ; [dart:mixin_deduplication] _MixinApplication417&SpriteComponent&HasGameReference::_findGameAndCheck
    // 0x4352e8: mov             x1, x0
    // 0x4352ec: ldur            x3, [fp, #-8]
    // 0x4352f0: StoreField: r3->field_57 = r0
    //     0x4352f0: stur            w0, [x3, #0x57]
    //     0x4352f4: ldurb           w16, [x3, #-1]
    //     0x4352f8: ldurb           w17, [x0, #-1]
    //     0x4352fc: and             x16, x17, x16, lsr #2
    //     0x435300: tst             x16, HEAP, lsr #32
    //     0x435304: b.eq            #0x43530c
    //     0x435308: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x43530c: mov             x0, x1
    // 0x435310: b               #0x43531c
    // 0x435314: mov             x3, x0
    // 0x435318: mov             x0, x1
    // 0x43531c: LoadField: r1 = r0->field_47
    //     0x43531c: ldur            w1, [x0, #0x47]
    // 0x435320: DecompressPointer r1
    //     0x435320: add             x1, x1, HEAP, lsl #32
    // 0x435324: r2 = "overworld.png"
    //     0x435324: add             x2, PP, #0xf, lsl #12  ; [pp+0xfee8] "overworld.png"
    //     0x435328: ldr             x2, [x2, #0xee8]
    // 0x43532c: r0 = fromCache()
    //     0x43532c: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x435330: stur            x0, [fp, #-0x10]
    // 0x435334: r0 = Vector2()
    //     0x435334: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x435338: r4 = 4
    //     0x435338: mov             x4, #4
    // 0x43533c: stur            x0, [fp, #-0x18]
    // 0x435340: r0 = AllocateFloat32Array()
    //     0x435340: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x435344: ldur            x3, [fp, #-0x18]
    // 0x435348: StoreField: r3->field_7 = r0
    //     0x435348: stur            w0, [x3, #7]
    // 0x43534c: r0 = Vector2()
    //     0x43534c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x435350: r4 = 4
    //     0x435350: mov             x4, #4
    // 0x435354: stur            x0, [fp, #-0x20]
    // 0x435358: r0 = AllocateFloat32Array()
    //     0x435358: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x43535c: ldur            x5, [fp, #-0x20]
    // 0x435360: StoreField: r5->field_7 = r0
    //     0x435360: stur            w0, [x5, #7]
    // 0x435364: d0 = 0.000000
    //     0x435364: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x435368: ldr             s0, [x17, #0xca8]
    // 0x43536c: StoreField: r0->field_1b = d0
    //     0x43536c: stur            s0, [x0, #0x1b]
    // 0x435370: ArrayStore: r0[0] = d0  ; List_8
    //     0x435370: stur            s0, [x0, #0x17]
    // 0x435374: r0 = Sprite()
    //     0x435374: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x435378: mov             x1, x0
    // 0x43537c: ldur            x2, [fp, #-0x10]
    // 0x435380: ldur            x3, [fp, #-0x18]
    // 0x435384: ldur            x5, [fp, #-0x20]
    // 0x435388: stur            x0, [fp, #-0x10]
    // 0x43538c: r0 = Sprite()
    //     0x43538c: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x435390: ldur            x0, [fp, #-0x10]
    // 0x435394: ldur            x1, [fp, #-8]
    // 0x435398: StoreField: r1->field_4f = r0
    //     0x435398: stur            w0, [x1, #0x4f]
    //     0x43539c: ldurb           w16, [x1, #-1]
    //     0x4353a0: ldurb           w17, [x0, #-1]
    //     0x4353a4: and             x16, x17, x16, lsr #2
    //     0x4353a8: tst             x16, HEAP, lsr #32
    //     0x4353ac: b.eq            #0x4353b4
    //     0x4353b0: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x4353b4: r0 = Null
    //     0x4353b4: mov             x0, NULL
    // 0x4353b8: LeaveFrame
    //     0x4353b8: mov             SP, fp
    //     0x4353bc: ldp             fp, lr, [SP], #0x10
    // 0x4353c0: ret
    //     0x4353c0: ret             
    // 0x4353c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4353c4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4353c8: b               #0x4352c4
  }
}

// class id: 1903, size: 0x64, field offset: 0x60
class GroundSprite extends _MixinApplication418&SpriteComponent&HasGameReference&DarkeningSprite {

  _ onLoad(/* No info */) {
    // ** addr: 0x434d4c, size: 0x42c
    // 0x434d4c: EnterFrame
    //     0x434d4c: stp             fp, lr, [SP, #-0x10]!
    //     0x434d50: mov             fp, SP
    // 0x434d54: AllocStack(0x38)
    //     0x434d54: sub             SP, SP, #0x38
    // 0x434d58: SetupParameters(GroundSprite this /* r1 => r0, fp-0x8 */)
    //     0x434d58: mov             x0, x1
    //     0x434d5c: stur            x1, [fp, #-8]
    // 0x434d60: CheckStackOverflow
    //     0x434d60: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x434d64: cmp             SP, x16
    //     0x434d68: b.ls            #0x435170
    // 0x434d6c: mov             x1, x0
    // 0x434d70: r0 = onLoad()
    //     0x434d70: bl              #0x43525c  ; [dart:mixin_deduplication] _MixinApplication418&SpriteComponent&HasGameReference&DarkeningSprite::onLoad
    // 0x434d74: ldur            x1, [fp, #-8]
    // 0x434d78: r0 = game()
    //     0x434d78: bl              #0x4351a8  ; [dart:mixin_deduplication] _MixinApplication417&SpriteComponent&HasGameReference::game
    // 0x434d7c: LoadField: r1 = r0->field_47
    //     0x434d7c: ldur            w1, [x0, #0x47]
    // 0x434d80: DecompressPointer r1
    //     0x434d80: add             x1, x1, HEAP, lsl #32
    // 0x434d84: r2 = "overworld.png"
    //     0x434d84: add             x2, PP, #0xf, lsl #12  ; [pp+0xfee8] "overworld.png"
    //     0x434d88: ldr             x2, [x2, #0xee8]
    // 0x434d8c: r0 = fromCache()
    //     0x434d8c: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x434d90: ldur            x1, [fp, #-8]
    // 0x434d94: stur            x0, [fp, #-0x18]
    // 0x434d98: LoadField: r2 = r1->field_5f
    //     0x434d98: ldur            w2, [x1, #0x5f]
    // 0x434d9c: DecompressPointer r2
    //     0x434d9c: add             x2, x2, HEAP, lsl #32
    // 0x434da0: stur            x2, [fp, #-0x10]
    // 0x434da4: r16 = Instance_Alignment
    //     0x434da4: add             x16, PP, #0x13, lsl #12  ; [pp+0x131d8] Obj!Alignment@5cc291
    //     0x434da8: ldr             x16, [x16, #0x1d8]
    // 0x434dac: stp             x2, x16, [SP]
    // 0x434db0: r0 = ==()
    //     0x434db0: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x434db4: tbnz            w0, #4, #0x434df4
    // 0x434db8: r0 = Vector2()
    //     0x434db8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434dbc: r4 = 4
    //     0x434dbc: mov             x4, #4
    // 0x434dc0: stur            x0, [fp, #-0x20]
    // 0x434dc4: r0 = AllocateFloat32Array()
    //     0x434dc4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434dc8: mov             x1, x0
    // 0x434dcc: ldur            x0, [fp, #-0x20]
    // 0x434dd0: StoreField: r0->field_7 = r1
    //     0x434dd0: stur            w1, [x0, #7]
    // 0x434dd4: d0 = 0.000000
    //     0x434dd4: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f690] IMM: 0x42c00000
    //     0x434dd8: ldr             s0, [x17, #0x690]
    // 0x434ddc: StoreField: r1->field_1b = d0
    //     0x434ddc: stur            s0, [x1, #0x1b]
    // 0x434de0: d0 = 0.000000
    //     0x434de0: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e0] IMM: 0x42400000
    //     0x434de4: ldr             s0, [x17, #0x8e0]
    // 0x434de8: ArrayStore: r1[0] = d0  ; List_8
    //     0x434de8: stur            s0, [x1, #0x17]
    // 0x434dec: mov             x3, x0
    // 0x434df0: b               #0x4350d8
    // 0x434df4: d0 = 0.000000
    //     0x434df4: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e0] IMM: 0x42400000
    //     0x434df8: ldr             s0, [x17, #0x8e0]
    // 0x434dfc: r16 = Instance_Alignment
    //     0x434dfc: add             x16, PP, #0x17, lsl #12  ; [pp+0x17258] Obj!Alignment@5cc2b1
    //     0x434e00: ldr             x16, [x16, #0x258]
    // 0x434e04: ldur            lr, [fp, #-0x10]
    // 0x434e08: stp             lr, x16, [SP]
    // 0x434e0c: r0 = ==()
    //     0x434e0c: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x434e10: tbnz            w0, #4, #0x434e50
    // 0x434e14: r0 = Vector2()
    //     0x434e14: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434e18: r4 = 4
    //     0x434e18: mov             x4, #4
    // 0x434e1c: stur            x0, [fp, #-0x20]
    // 0x434e20: r0 = AllocateFloat32Array()
    //     0x434e20: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434e24: mov             x1, x0
    // 0x434e28: ldur            x0, [fp, #-0x20]
    // 0x434e2c: StoreField: r0->field_7 = r1
    //     0x434e2c: stur            w1, [x0, #7]
    // 0x434e30: d0 = 0.000000
    //     0x434e30: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f698] IMM: 0x42e00000
    //     0x434e34: ldr             s0, [x17, #0x698]
    // 0x434e38: StoreField: r1->field_1b = d0
    //     0x434e38: stur            s0, [x1, #0x1b]
    // 0x434e3c: d1 = 0.000000
    //     0x434e3c: add             x17, PP, #8, lsl #12  ; [pp+0x8ca0] IMM: 0x42000000
    //     0x434e40: ldr             s1, [x17, #0xca0]
    // 0x434e44: ArrayStore: r1[0] = d1  ; List_8
    //     0x434e44: stur            s1, [x1, #0x17]
    // 0x434e48: mov             x3, x0
    // 0x434e4c: b               #0x4350d8
    // 0x434e50: d1 = 0.000000
    //     0x434e50: add             x17, PP, #8, lsl #12  ; [pp+0x8ca0] IMM: 0x42000000
    //     0x434e54: ldr             s1, [x17, #0xca0]
    // 0x434e58: d0 = 0.000000
    //     0x434e58: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f698] IMM: 0x42e00000
    //     0x434e5c: ldr             s0, [x17, #0x698]
    // 0x434e60: r16 = Instance_Alignment
    //     0x434e60: add             x16, PP, #0x1e, lsl #12  ; [pp+0x1e230] Obj!Alignment@5cc351
    //     0x434e64: ldr             x16, [x16, #0x230]
    // 0x434e68: ldur            lr, [fp, #-0x10]
    // 0x434e6c: stp             lr, x16, [SP]
    // 0x434e70: r0 = ==()
    //     0x434e70: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x434e74: tbnz            w0, #4, #0x434eb4
    // 0x434e78: r0 = Vector2()
    //     0x434e78: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434e7c: r4 = 4
    //     0x434e7c: mov             x4, #4
    // 0x434e80: stur            x0, [fp, #-0x20]
    // 0x434e84: r0 = AllocateFloat32Array()
    //     0x434e84: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434e88: mov             x1, x0
    // 0x434e8c: ldur            x0, [fp, #-0x20]
    // 0x434e90: StoreField: r0->field_7 = r1
    //     0x434e90: stur            w1, [x0, #7]
    // 0x434e94: d0 = 0.000000
    //     0x434e94: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f698] IMM: 0x42e00000
    //     0x434e98: ldr             s0, [x17, #0x698]
    // 0x434e9c: StoreField: r1->field_1b = d0
    //     0x434e9c: stur            s0, [x1, #0x1b]
    // 0x434ea0: d0 = 0.000000
    //     0x434ea0: add             x17, PP, #0xc, lsl #12  ; [pp+0xc740] IMM: 0x42800000
    //     0x434ea4: ldr             s0, [x17, #0x740]
    // 0x434ea8: ArrayStore: r1[0] = d0  ; List_8
    //     0x434ea8: stur            s0, [x1, #0x17]
    // 0x434eac: mov             x3, x0
    // 0x434eb0: b               #0x4350d8
    // 0x434eb4: r16 = Instance_Alignment
    //     0x434eb4: add             x16, PP, #0x17, lsl #12  ; [pp+0x17ec0] Obj!Alignment@5cc2d1
    //     0x434eb8: ldr             x16, [x16, #0xec0]
    // 0x434ebc: ldur            lr, [fp, #-0x10]
    // 0x434ec0: stp             lr, x16, [SP]
    // 0x434ec4: r0 = ==()
    //     0x434ec4: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x434ec8: tbnz            w0, #4, #0x434f08
    // 0x434ecc: r0 = Vector2()
    //     0x434ecc: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434ed0: r4 = 4
    //     0x434ed0: mov             x4, #4
    // 0x434ed4: stur            x0, [fp, #-0x20]
    // 0x434ed8: r0 = AllocateFloat32Array()
    //     0x434ed8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434edc: mov             x1, x0
    // 0x434ee0: ldur            x0, [fp, #-0x20]
    // 0x434ee4: StoreField: r0->field_7 = r1
    //     0x434ee4: stur            w1, [x0, #7]
    // 0x434ee8: d0 = 0.000000
    //     0x434ee8: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6a0] IMM: 0x43000000
    //     0x434eec: ldr             s0, [x17, #0x6a0]
    // 0x434ef0: StoreField: r1->field_1b = d0
    //     0x434ef0: stur            s0, [x1, #0x1b]
    // 0x434ef4: d0 = 0.000000
    //     0x434ef4: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e0] IMM: 0x42400000
    //     0x434ef8: ldr             s0, [x17, #0x8e0]
    // 0x434efc: ArrayStore: r1[0] = d0  ; List_8
    //     0x434efc: stur            s0, [x1, #0x17]
    // 0x434f00: mov             x3, x0
    // 0x434f04: b               #0x4350d8
    // 0x434f08: d0 = 0.000000
    //     0x434f08: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e0] IMM: 0x42400000
    //     0x434f0c: ldr             s0, [x17, #0x8e0]
    // 0x434f10: r16 = Instance_Alignment
    //     0x434f10: add             x16, PP, #0x1e, lsl #12  ; [pp+0x1e240] Obj!Alignment@5cc311
    //     0x434f14: ldr             x16, [x16, #0x240]
    // 0x434f18: ldur            lr, [fp, #-0x10]
    // 0x434f1c: stp             lr, x16, [SP]
    // 0x434f20: r0 = ==()
    //     0x434f20: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x434f24: tbnz            w0, #4, #0x434f64
    // 0x434f28: r0 = Vector2()
    //     0x434f28: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434f2c: r4 = 4
    //     0x434f2c: mov             x4, #4
    // 0x434f30: stur            x0, [fp, #-0x20]
    // 0x434f34: r0 = AllocateFloat32Array()
    //     0x434f34: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434f38: mov             x1, x0
    // 0x434f3c: ldur            x0, [fp, #-0x20]
    // 0x434f40: StoreField: r0->field_7 = r1
    //     0x434f40: stur            w1, [x0, #7]
    // 0x434f44: d0 = 0.000000
    //     0x434f44: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6a8] IMM: 0x43200000
    //     0x434f48: ldr             s0, [x17, #0x6a8]
    // 0x434f4c: StoreField: r1->field_1b = d0
    //     0x434f4c: stur            s0, [x1, #0x1b]
    // 0x434f50: d1 = 0.000000
    //     0x434f50: add             x17, PP, #8, lsl #12  ; [pp+0x8ca0] IMM: 0x42000000
    //     0x434f54: ldr             s1, [x17, #0xca0]
    // 0x434f58: ArrayStore: r1[0] = d1  ; List_8
    //     0x434f58: stur            s1, [x1, #0x17]
    // 0x434f5c: mov             x3, x0
    // 0x434f60: b               #0x4350d8
    // 0x434f64: d0 = 0.000000
    //     0x434f64: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6a8] IMM: 0x43200000
    //     0x434f68: ldr             s0, [x17, #0x6a8]
    // 0x434f6c: d1 = 0.000000
    //     0x434f6c: add             x17, PP, #8, lsl #12  ; [pp+0x8ca0] IMM: 0x42000000
    //     0x434f70: ldr             s1, [x17, #0xca0]
    // 0x434f74: r16 = Instance_Alignment
    //     0x434f74: add             x16, PP, #0x1e, lsl #12  ; [pp+0x1e248] Obj!Alignment@5cc2f1
    //     0x434f78: ldr             x16, [x16, #0x248]
    // 0x434f7c: ldur            lr, [fp, #-0x10]
    // 0x434f80: stp             lr, x16, [SP]
    // 0x434f84: r0 = ==()
    //     0x434f84: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x434f88: tbnz            w0, #4, #0x434fc8
    // 0x434f8c: r0 = Vector2()
    //     0x434f8c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434f90: r4 = 4
    //     0x434f90: mov             x4, #4
    // 0x434f94: stur            x0, [fp, #-0x20]
    // 0x434f98: r0 = AllocateFloat32Array()
    //     0x434f98: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434f9c: mov             x1, x0
    // 0x434fa0: ldur            x0, [fp, #-0x20]
    // 0x434fa4: StoreField: r0->field_7 = r1
    //     0x434fa4: stur            w1, [x0, #7]
    // 0x434fa8: d0 = 0.000000
    //     0x434fa8: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6a8] IMM: 0x43200000
    //     0x434fac: ldr             s0, [x17, #0x6a8]
    // 0x434fb0: StoreField: r1->field_1b = d0
    //     0x434fb0: stur            s0, [x1, #0x1b]
    // 0x434fb4: d1 = 0.000000
    //     0x434fb4: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e0] IMM: 0x42400000
    //     0x434fb8: ldr             s1, [x17, #0x8e0]
    // 0x434fbc: ArrayStore: r1[0] = d1  ; List_8
    //     0x434fbc: stur            s1, [x1, #0x17]
    // 0x434fc0: mov             x3, x0
    // 0x434fc4: b               #0x4350d8
    // 0x434fc8: d0 = 0.000000
    //     0x434fc8: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6a8] IMM: 0x43200000
    //     0x434fcc: ldr             s0, [x17, #0x6a8]
    // 0x434fd0: d1 = 0.000000
    //     0x434fd0: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e0] IMM: 0x42400000
    //     0x434fd4: ldr             s1, [x17, #0x8e0]
    // 0x434fd8: r16 = Instance_Alignment
    //     0x434fd8: add             x16, PP, #0x13, lsl #12  ; [pp+0x13988] Obj!Alignment@5cc371
    //     0x434fdc: ldr             x16, [x16, #0x988]
    // 0x434fe0: ldur            lr, [fp, #-0x10]
    // 0x434fe4: stp             lr, x16, [SP]
    // 0x434fe8: r0 = ==()
    //     0x434fe8: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x434fec: tbnz            w0, #4, #0x43502c
    // 0x434ff0: r0 = Vector2()
    //     0x434ff0: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434ff4: r4 = 4
    //     0x434ff4: mov             x4, #4
    // 0x434ff8: stur            x0, [fp, #-0x20]
    // 0x434ffc: r0 = AllocateFloat32Array()
    //     0x434ffc: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x435000: mov             x1, x0
    // 0x435004: ldur            x0, [fp, #-0x20]
    // 0x435008: StoreField: r0->field_7 = r1
    //     0x435008: stur            w1, [x0, #7]
    // 0x43500c: d0 = 0.000000
    //     0x43500c: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6b0] IMM: 0x43100000
    //     0x435010: ldr             s0, [x17, #0x6b0]
    // 0x435014: StoreField: r1->field_1b = d0
    //     0x435014: stur            s0, [x1, #0x1b]
    // 0x435018: d0 = 0.000000
    //     0x435018: add             x17, PP, #8, lsl #12  ; [pp+0x8ca0] IMM: 0x42000000
    //     0x43501c: ldr             s0, [x17, #0xca0]
    // 0x435020: ArrayStore: r1[0] = d0  ; List_8
    //     0x435020: stur            s0, [x1, #0x17]
    // 0x435024: mov             x3, x0
    // 0x435028: b               #0x4350d8
    // 0x43502c: d0 = 0.000000
    //     0x43502c: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6b0] IMM: 0x43100000
    //     0x435030: ldr             s0, [x17, #0x6b0]
    // 0x435034: r16 = Instance_Alignment
    //     0x435034: add             x16, PP, #0x1e, lsl #12  ; [pp+0x1e238] Obj!Alignment@5cc331
    //     0x435038: ldr             x16, [x16, #0x238]
    // 0x43503c: ldur            lr, [fp, #-0x10]
    // 0x435040: stp             lr, x16, [SP]
    // 0x435044: r0 = ==()
    //     0x435044: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x435048: tbnz            w0, #4, #0x435088
    // 0x43504c: r0 = Vector2()
    //     0x43504c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x435050: r4 = 4
    //     0x435050: mov             x4, #4
    // 0x435054: stur            x0, [fp, #-0x20]
    // 0x435058: r0 = AllocateFloat32Array()
    //     0x435058: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x43505c: mov             x1, x0
    // 0x435060: ldur            x0, [fp, #-0x20]
    // 0x435064: StoreField: r0->field_7 = r1
    //     0x435064: stur            w1, [x0, #7]
    // 0x435068: d0 = 0.000000
    //     0x435068: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6b0] IMM: 0x43100000
    //     0x43506c: ldr             s0, [x17, #0x6b0]
    // 0x435070: StoreField: r1->field_1b = d0
    //     0x435070: stur            s0, [x1, #0x1b]
    // 0x435074: d0 = 0.000000
    //     0x435074: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e0] IMM: 0x42400000
    //     0x435078: ldr             s0, [x17, #0x8e0]
    // 0x43507c: ArrayStore: r1[0] = d0  ; List_8
    //     0x43507c: stur            s0, [x1, #0x17]
    // 0x435080: mov             x3, x0
    // 0x435084: b               #0x4350d8
    // 0x435088: r16 = Instance_Alignment
    //     0x435088: add             x16, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x43508c: ldr             x16, [x16, #0xb18]
    // 0x435090: ldur            lr, [fp, #-0x10]
    // 0x435094: stp             lr, x16, [SP]
    // 0x435098: r0 = ==()
    //     0x435098: bl              #0x512ae4  ; [package:flutter/src/painting/alignment.dart] AlignmentGeometry::==
    // 0x43509c: tbnz            w0, #4, #0x43513c
    // 0x4350a0: r0 = Vector2()
    //     0x4350a0: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x4350a4: r4 = 4
    //     0x4350a4: mov             x4, #4
    // 0x4350a8: stur            x0, [fp, #-0x20]
    // 0x4350ac: r0 = AllocateFloat32Array()
    //     0x4350ac: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x4350b0: mov             x1, x0
    // 0x4350b4: ldur            x0, [fp, #-0x20]
    // 0x4350b8: StoreField: r0->field_7 = r1
    //     0x4350b8: stur            w1, [x0, #7]
    // 0x4350bc: d0 = 0.000000
    //     0x4350bc: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6a8] IMM: 0x43200000
    //     0x4350c0: ldr             s0, [x17, #0x6a8]
    // 0x4350c4: StoreField: r1->field_1b = d0
    //     0x4350c4: stur            s0, [x1, #0x1b]
    // 0x4350c8: d0 = 0.000000
    //     0x4350c8: add             x17, PP, #0x1f, lsl #12  ; [pp+0x1f6b8] IMM: 0x42a00000
    //     0x4350cc: ldr             s0, [x17, #0x6b8]
    // 0x4350d0: ArrayStore: r1[0] = d0  ; List_8
    //     0x4350d0: stur            s0, [x1, #0x17]
    // 0x4350d4: mov             x3, x0
    // 0x4350d8: stur            x3, [fp, #-0x20]
    // 0x4350dc: r0 = Vector2()
    //     0x4350dc: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x4350e0: r4 = 4
    //     0x4350e0: mov             x4, #4
    // 0x4350e4: stur            x0, [fp, #-0x28]
    // 0x4350e8: r0 = AllocateFloat32Array()
    //     0x4350e8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x4350ec: ldur            x5, [fp, #-0x28]
    // 0x4350f0: StoreField: r5->field_7 = r0
    //     0x4350f0: stur            w0, [x5, #7]
    // 0x4350f4: d0 = 0.000000
    //     0x4350f4: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x4350f8: ldr             s0, [x17, #0xca8]
    // 0x4350fc: StoreField: r0->field_1b = d0
    //     0x4350fc: stur            s0, [x0, #0x1b]
    // 0x435100: ArrayStore: r0[0] = d0  ; List_8
    //     0x435100: stur            s0, [x0, #0x17]
    // 0x435104: r0 = Sprite()
    //     0x435104: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x435108: mov             x1, x0
    // 0x43510c: ldur            x2, [fp, #-0x18]
    // 0x435110: ldur            x3, [fp, #-0x20]
    // 0x435114: ldur            x5, [fp, #-0x28]
    // 0x435118: stur            x0, [fp, #-0x18]
    // 0x43511c: r0 = Sprite()
    //     0x43511c: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x435120: ldur            x1, [fp, #-8]
    // 0x435124: ldur            x2, [fp, #-0x18]
    // 0x435128: r0 = sprite=()
    //     0x435128: bl              #0x435178  ; [package:flame/src/components/sprite_component.dart] SpriteComponent::sprite=
    // 0x43512c: r0 = Null
    //     0x43512c: mov             x0, NULL
    // 0x435130: LeaveFrame
    //     0x435130: mov             SP, fp
    //     0x435134: ldp             fp, lr, [SP], #0x10
    // 0x435138: ret
    //     0x435138: ret             
    // 0x43513c: ldur            x0, [fp, #-0x10]
    // 0x435140: r1 = Null
    //     0x435140: mov             x1, NULL
    // 0x435144: r2 = 4
    //     0x435144: mov             x2, #4
    // 0x435148: r0 = AllocateArray()
    //     0x435148: bl              #0x5845d8  ; AllocateArrayStub
    // 0x43514c: r16 = "Invalid alignment: "
    //     0x43514c: add             x16, PP, #0x1f, lsl #12  ; [pp+0x1f6c0] "Invalid alignment: "
    //     0x435150: ldr             x16, [x16, #0x6c0]
    // 0x435154: StoreField: r0->field_f = r16
    //     0x435154: stur            w16, [x0, #0xf]
    // 0x435158: ldur            x1, [fp, #-0x10]
    // 0x43515c: StoreField: r0->field_13 = r1
    //     0x43515c: stur            w1, [x0, #0x13]
    // 0x435160: str             x0, [SP]
    // 0x435164: r0 = _interpolate()
    //     0x435164: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x435168: r0 = Throw()
    //     0x435168: bl              #0x5827dc  ; ThrowStub
    // 0x43516c: brk             #0
    // 0x435170: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x435170: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x435174: b               #0x434d6c
  }
}

// class id: 3844, size: 0x24, field offset: 0x14
enum SkullType extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
  _Double field_14;
  _Double field_1c;

  static _ random(/* No info */) {
    // ** addr: 0x3d1f94, size: 0x5c
    // 0x3d1f94: EnterFrame
    //     0x3d1f94: stp             fp, lr, [SP, #-0x10]!
    //     0x3d1f98: mov             fp, SP
    // 0x3d1f9c: CheckStackOverflow
    //     0x3d1f9c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d1fa0: cmp             SP, x16
    //     0x3d1fa4: b.ls            #0x3d1fe4
    // 0x3d1fa8: r2 = 5
    //     0x3d1fa8: mov             x2, #5
    // 0x3d1fac: r0 = nextInt()
    //     0x3d1fac: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x3d1fb0: mov             x1, x0
    // 0x3d1fb4: mov             x2, x0
    // 0x3d1fb8: r0 = 5
    //     0x3d1fb8: mov             x0, #5
    // 0x3d1fbc: cmp             x1, x0
    // 0x3d1fc0: b.hs            #0x3d1fec
    // 0x3d1fc4: r1 = const [Instance of 'SkullType', Instance of 'SkullType', Instance of 'SkullType', Instance of 'SkullType', Instance of 'SkullType']
    //     0x3d1fc4: add             x1, PP, #0x13, lsl #12  ; [pp+0x13730] List<SkullType>(5)
    //     0x3d1fc8: ldr             x1, [x1, #0x730]
    // 0x3d1fcc: ArrayLoad: r0 = r1[r2]  ; Unknown_4
    //     0x3d1fcc: add             x16, x1, x2, lsl #2
    //     0x3d1fd0: ldur            w0, [x16, #0xf]
    // 0x3d1fd4: DecompressPointer r0
    //     0x3d1fd4: add             x0, x0, HEAP, lsl #32
    // 0x3d1fd8: LeaveFrame
    //     0x3d1fd8: mov             SP, fp
    //     0x3d1fdc: ldp             fp, lr, [SP], #0x10
    // 0x3d1fe0: ret
    //     0x3d1fe0: ret             
    // 0x3d1fe4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d1fe4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d1fe8: b               #0x3d1fa8
    // 0x3d1fec: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d1fec: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ _enumToString(/* No info */) {
    // ** addr: 0x4a0150, size: 0x64
    // 0x4a0150: EnterFrame
    //     0x4a0150: stp             fp, lr, [SP, #-0x10]!
    //     0x4a0154: mov             fp, SP
    // 0x4a0158: AllocStack(0x10)
    //     0x4a0158: sub             SP, SP, #0x10
    // 0x4a015c: SetupParameters(SkullType this /* r1 => r0, fp-0x8 */)
    //     0x4a015c: mov             x0, x1
    //     0x4a0160: stur            x1, [fp, #-8]
    // 0x4a0164: CheckStackOverflow
    //     0x4a0164: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a0168: cmp             SP, x16
    //     0x4a016c: b.ls            #0x4a01ac
    // 0x4a0170: r1 = Null
    //     0x4a0170: mov             x1, NULL
    // 0x4a0174: r2 = 4
    //     0x4a0174: mov             x2, #4
    // 0x4a0178: r0 = AllocateArray()
    //     0x4a0178: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a017c: r16 = "SkullType."
    //     0x4a017c: add             x16, PP, #0x16, lsl #12  ; [pp+0x167c8] "SkullType."
    //     0x4a0180: ldr             x16, [x16, #0x7c8]
    // 0x4a0184: StoreField: r0->field_f = r16
    //     0x4a0184: stur            w16, [x0, #0xf]
    // 0x4a0188: ldur            x1, [fp, #-8]
    // 0x4a018c: LoadField: r2 = r1->field_f
    //     0x4a018c: ldur            w2, [x1, #0xf]
    // 0x4a0190: DecompressPointer r2
    //     0x4a0190: add             x2, x2, HEAP, lsl #32
    // 0x4a0194: StoreField: r0->field_13 = r2
    //     0x4a0194: stur            w2, [x0, #0x13]
    // 0x4a0198: str             x0, [SP]
    // 0x4a019c: r0 = _interpolate()
    //     0x4a019c: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a01a0: LeaveFrame
    //     0x4a01a0: mov             SP, fp
    //     0x4a01a4: ldp             fp, lr, [SP], #0x10
    // 0x4a01a8: ret
    //     0x4a01a8: ret             
    // 0x4a01ac: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a01ac: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a01b0: b               #0x4a0170
  }
}
