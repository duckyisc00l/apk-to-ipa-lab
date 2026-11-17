// lib: , url: package:ricochlime/flame/components/bullet.dart

// class id: 1049304, size: 0x8
class :: {
}

// class id: 1891, size: 0x88, field offset: 0x78
class Bullet extends _MixinApplication267&BodyComponent&ContactCallbacks {

  static _ drawBullet(/* No info */) {
    // ** addr: 0x3c8c54, size: 0x528
    // 0x3c8c54: EnterFrame
    //     0x3c8c54: stp             fp, lr, [SP, #-0x10]!
    //     0x3c8c58: mov             fp, SP
    // 0x3c8c5c: AllocStack(0x78)
    //     0x3c8c5c: sub             SP, SP, #0x78
    // 0x3c8c60: SetupParameters(dynamic _ /* r1 => r0, fp-0x10 */, dynamic _ /* r2 => r2, fp-0x18 */, {dynamic bulletColor = Null /* r5 */, dynamic bulletShape = Null /* r6, fp-0x8 */, _Double opacity = 1.000000 /* d0, fp-0x50 */, _Double radius = 2.000000 /* d1, fp-0x48 */})
    //     0x3c8c60: mov             x0, x1
    //     0x3c8c64: stur            x1, [fp, #-0x10]
    //     0x3c8c68: stur            x2, [fp, #-0x18]
    //     0x3c8c6c: ldur            w1, [x4, #0x13]
    //     0x3c8c70: ldur            w3, [x4, #0x1f]
    //     0x3c8c74: add             x3, x3, HEAP, lsl #32
    //     0x3c8c78: add             x16, PP, #8, lsl #12  ; [pp+0x83e0] "bulletColor"
    //     0x3c8c7c: ldr             x16, [x16, #0x3e0]
    //     0x3c8c80: cmp             w3, w16
    //     0x3c8c84: b.ne            #0x3c8ca8
    //     0x3c8c88: ldur            w3, [x4, #0x23]
    //     0x3c8c8c: add             x3, x3, HEAP, lsl #32
    //     0x3c8c90: sub             w5, w1, w3
    //     0x3c8c94: add             x3, fp, w5, sxtw #2
    //     0x3c8c98: ldr             x3, [x3, #8]
    //     0x3c8c9c: mov             x5, x3
    //     0x3c8ca0: mov             x3, #1
    //     0x3c8ca4: b               #0x3c8cb0
    //     0x3c8ca8: mov             x5, NULL
    //     0x3c8cac: mov             x3, #0
    //     0x3c8cb0: lsl             x6, x3, #1
    //     0x3c8cb4: lsl             w7, w6, #1
    //     0x3c8cb8: add             w8, w7, #8
    //     0x3c8cbc: add             x16, x4, w8, sxtw #1
    //     0x3c8cc0: ldur            w9, [x16, #0xf]
    //     0x3c8cc4: add             x9, x9, HEAP, lsl #32
    //     0x3c8cc8: add             x16, PP, #8, lsl #12  ; [pp+0x83f8] "bulletShape"
    //     0x3c8ccc: ldr             x16, [x16, #0x3f8]
    //     0x3c8cd0: cmp             w9, w16
    //     0x3c8cd4: b.ne            #0x3c8d08
    //     0x3c8cd8: add             w3, w7, #0xa
    //     0x3c8cdc: add             x16, x4, w3, sxtw #1
    //     0x3c8ce0: ldur            w7, [x16, #0xf]
    //     0x3c8ce4: add             x7, x7, HEAP, lsl #32
    //     0x3c8ce8: sub             w3, w1, w7
    //     0x3c8cec: add             x7, fp, w3, sxtw #2
    //     0x3c8cf0: ldr             x7, [x7, #8]
    //     0x3c8cf4: add             w3, w6, #2
    //     0x3c8cf8: sbfx            x6, x3, #1, #0x1f
    //     0x3c8cfc: mov             x3, x6
    //     0x3c8d00: mov             x6, x7
    //     0x3c8d04: b               #0x3c8d0c
    //     0x3c8d08: mov             x6, NULL
    //     0x3c8d0c: stur            x6, [fp, #-8]
    //     0x3c8d10: lsl             x7, x3, #1
    //     0x3c8d14: lsl             w8, w7, #1
    //     0x3c8d18: add             w9, w8, #8
    //     0x3c8d1c: add             x16, x4, w9, sxtw #1
    //     0x3c8d20: ldur            w10, [x16, #0xf]
    //     0x3c8d24: add             x10, x10, HEAP, lsl #32
    //     0x3c8d28: add             x16, PP, #0x15, lsl #12  ; [pp+0x15d30] "opacity"
    //     0x3c8d2c: ldr             x16, [x16, #0xd30]
    //     0x3c8d30: cmp             w10, w16
    //     0x3c8d34: b.ne            #0x3c8d68
    //     0x3c8d38: add             w3, w8, #0xa
    //     0x3c8d3c: add             x16, x4, w3, sxtw #1
    //     0x3c8d40: ldur            w8, [x16, #0xf]
    //     0x3c8d44: add             x8, x8, HEAP, lsl #32
    //     0x3c8d48: sub             w3, w1, w8
    //     0x3c8d4c: add             x8, fp, w3, sxtw #2
    //     0x3c8d50: ldr             x8, [x8, #8]
    //     0x3c8d54: add             w3, w7, #2
    //     0x3c8d58: ldur            d0, [x8, #7]
    //     0x3c8d5c: sbfx            x7, x3, #1, #0x1f
    //     0x3c8d60: mov             x3, x7
    //     0x3c8d64: b               #0x3c8d6c
    //     0x3c8d68: fmov            d0, #1.00000000
    //     0x3c8d6c: stur            d0, [fp, #-0x50]
    //     0x3c8d70: lsl             x7, x3, #1
    //     0x3c8d74: lsl             w3, w7, #1
    //     0x3c8d78: add             w7, w3, #8
    //     0x3c8d7c: add             x16, x4, w7, sxtw #1
    //     0x3c8d80: ldur            w8, [x16, #0xf]
    //     0x3c8d84: add             x8, x8, HEAP, lsl #32
    //     0x3c8d88: add             x16, PP, #0xd, lsl #12  ; [pp+0xd3a8] "radius"
    //     0x3c8d8c: ldr             x16, [x16, #0x3a8]
    //     0x3c8d90: cmp             w8, w16
    //     0x3c8d94: b.ne            #0x3c8dbc
    //     0x3c8d98: add             w7, w3, #0xa
    //     0x3c8d9c: add             x16, x4, w7, sxtw #1
    //     0x3c8da0: ldur            w3, [x16, #0xf]
    //     0x3c8da4: add             x3, x3, HEAP, lsl #32
    //     0x3c8da8: sub             w4, w1, w3
    //     0x3c8dac: add             x1, fp, w4, sxtw #2
    //     0x3c8db0: ldr             x1, [x1, #8]
    //     0x3c8db4: ldur            d1, [x1, #7]
    //     0x3c8db8: b               #0x3c8dc0
    //     0x3c8dbc: fmov            d1, #2.00000000
    //     0x3c8dc0: stur            d1, [fp, #-0x48]
    // 0x3c8dc4: CheckStackOverflow
    //     0x3c8dc4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c8dc8: cmp             SP, x16
    //     0x3c8dcc: b.ls            #0x3c915c
    // 0x3c8dd0: cmp             w5, NULL
    // 0x3c8dd4: b.ne            #0x3c8e28
    // 0x3c8dd8: r0 = LoadStaticField(0xccc)
    //     0x3c8dd8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c8ddc: ldr             x0, [x0, #0x1998]
    // 0x3c8de0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8de4: cmp             w0, w16
    // 0x3c8de8: b.ne            #0x3c8df8
    // 0x3c8dec: r2 = stows
    //     0x3c8dec: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3c8df0: ldr             x2, [x2, #0x310]
    // 0x3c8df4: r0 = InitLateFinalStaticField()
    //     0x3c8df4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c8df8: LoadField: r1 = r0->field_2f
    //     0x3c8df8: ldur            w1, [x0, #0x2f]
    // 0x3c8dfc: DecompressPointer r1
    //     0x3c8dfc: add             x1, x1, HEAP, lsl #32
    // 0x3c8e00: LoadField: r0 = r1->field_43
    //     0x3c8e00: ldur            w0, [x1, #0x43]
    // 0x3c8e04: DecompressPointer r0
    //     0x3c8e04: add             x0, x0, HEAP, lsl #32
    // 0x3c8e08: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8e0c: cmp             w0, w16
    // 0x3c8e10: b.ne            #0x3c8e20
    // 0x3c8e14: r2 = _value
    //     0x3c8e14: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3c8e18: ldr             x2, [x2, #0x4b0]
    // 0x3c8e1c: r0 = InitLateInstanceField()
    //     0x3c8e1c: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3c8e20: mov             x1, x0
    // 0x3c8e24: b               #0x3c8e2c
    // 0x3c8e28: mov             x1, x5
    // 0x3c8e2c: ldur            x0, [fp, #-8]
    // 0x3c8e30: stur            x1, [fp, #-0x20]
    // 0x3c8e34: cmp             w0, NULL
    // 0x3c8e38: b.ne            #0x3c8ecc
    // 0x3c8e3c: r0 = LoadStaticField(0xccc)
    //     0x3c8e3c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c8e40: ldr             x0, [x0, #0x1998]
    // 0x3c8e44: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8e48: cmp             w0, w16
    // 0x3c8e4c: b.ne            #0x3c8e5c
    // 0x3c8e50: r2 = stows
    //     0x3c8e50: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3c8e54: ldr             x2, [x2, #0x310]
    // 0x3c8e58: r0 = InitLateFinalStaticField()
    //     0x3c8e58: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c8e5c: LoadField: r1 = r0->field_33
    //     0x3c8e5c: ldur            w1, [x0, #0x33]
    // 0x3c8e60: DecompressPointer r1
    //     0x3c8e60: add             x1, x1, HEAP, lsl #32
    // 0x3c8e64: LoadField: r0 = r1->field_43
    //     0x3c8e64: ldur            w0, [x1, #0x43]
    // 0x3c8e68: DecompressPointer r0
    //     0x3c8e68: add             x0, x0, HEAP, lsl #32
    // 0x3c8e6c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8e70: cmp             w0, w16
    // 0x3c8e74: b.ne            #0x3c8e84
    // 0x3c8e78: r2 = _value
    //     0x3c8e78: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3c8e7c: ldr             x2, [x2, #0x4b0]
    // 0x3c8e80: r0 = InitLateInstanceField()
    //     0x3c8e80: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3c8e84: mov             x1, x0
    // 0x3c8e88: r0 = getBulletShape()
    //     0x3c8e88: bl              #0x3c9590  ; [package:ricochlime/utils/shop_items.dart] ShopItems::getBulletShape
    // 0x3c8e8c: cmp             w0, NULL
    // 0x3c8e90: b.ne            #0x3c8ea0
    // 0x3c8e94: r0 = defaultBulletShape()
    //     0x3c8e94: bl              #0x3c950c  ; [package:ricochlime/utils/shop_items.dart] ShopItems::defaultBulletShape
    // 0x3c8e98: mov             x1, x0
    // 0x3c8e9c: b               #0x3c8ea4
    // 0x3c8ea0: mov             x1, x0
    // 0x3c8ea4: LoadField: r0 = r1->field_1b
    //     0x3c8ea4: ldur            w0, [x1, #0x1b]
    // 0x3c8ea8: DecompressPointer r0
    //     0x3c8ea8: add             x0, x0, HEAP, lsl #32
    // 0x3c8eac: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8eb0: cmp             w0, w16
    // 0x3c8eb4: b.ne            #0x3c8ec4
    // 0x3c8eb8: r2 = sprite
    //     0x3c8eb8: add             x2, PP, #0x13, lsl #12  ; [pp+0x13758] Field <BulletShapeShopItem.sprite>: late final (offset: 0x1c)
    //     0x3c8ebc: ldr             x2, [x2, #0x758]
    // 0x3c8ec0: r0 = InitLateFinalInstanceField()
    //     0x3c8ec0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3c8ec4: mov             x1, x0
    // 0x3c8ec8: b               #0x3c8ed0
    // 0x3c8ecc: mov             x1, x0
    // 0x3c8ed0: stur            x1, [fp, #-8]
    // 0x3c8ed4: r0 = LoadStaticField(0xccc)
    //     0x3c8ed4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c8ed8: ldr             x0, [x0, #0x1998]
    // 0x3c8edc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8ee0: cmp             w0, w16
    // 0x3c8ee4: b.ne            #0x3c8ef4
    // 0x3c8ee8: r2 = stows
    //     0x3c8ee8: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3c8eec: ldr             x2, [x2, #0x310]
    // 0x3c8ef0: r0 = InitLateFinalStaticField()
    //     0x3c8ef0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c8ef4: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x3c8ef4: ldur            w1, [x0, #0x17]
    // 0x3c8ef8: DecompressPointer r1
    //     0x3c8ef8: add             x1, x1, HEAP, lsl #32
    // 0x3c8efc: LoadField: r0 = r1->field_43
    //     0x3c8efc: ldur            w0, [x1, #0x43]
    // 0x3c8f00: DecompressPointer r0
    //     0x3c8f00: add             x0, x0, HEAP, lsl #32
    // 0x3c8f04: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8f08: cmp             w0, w16
    // 0x3c8f0c: b.ne            #0x3c8f1c
    // 0x3c8f10: r2 = _value
    //     0x3c8f10: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3c8f14: ldr             x2, [x2, #0x4b0]
    // 0x3c8f18: r0 = InitLateInstanceField()
    //     0x3c8f18: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3c8f1c: tbnz            w0, #4, #0x3c8f30
    // 0x3c8f20: ldur            d0, [fp, #-0x48]
    // 0x3c8f24: d1 = 2.000000
    //     0x3c8f24: fmov            d1, #2.00000000
    // 0x3c8f28: fmul            d2, d0, d1
    // 0x3c8f2c: b               #0x3c8f3c
    // 0x3c8f30: ldur            d0, [fp, #-0x48]
    // 0x3c8f34: d1 = 2.000000
    //     0x3c8f34: fmov            d1, #2.00000000
    // 0x3c8f38: mov             v2.16b, v0.16b
    // 0x3c8f3c: ldur            d0, [fp, #-0x50]
    // 0x3c8f40: ldur            x0, [fp, #-0x20]
    // 0x3c8f44: ldur            x1, [fp, #-8]
    // 0x3c8f48: stur            d2, [fp, #-0x60]
    // 0x3c8f4c: LoadField: r2 = r1->field_f
    //     0x3c8f4c: ldur            w2, [x1, #0xf]
    // 0x3c8f50: DecompressPointer r2
    //     0x3c8f50: add             x2, x2, HEAP, lsl #32
    // 0x3c8f54: ArrayLoad: d3 = r2[0]  ; List_8
    //     0x3c8f54: ldur            d3, [x2, #0x17]
    // 0x3c8f58: LoadField: d4 = r2->field_7
    //     0x3c8f58: ldur            d4, [x2, #7]
    // 0x3c8f5c: fsub            d5, d3, d4
    // 0x3c8f60: stur            d5, [fp, #-0x58]
    // 0x3c8f64: LoadField: d3 = r2->field_1f
    //     0x3c8f64: ldur            d3, [x2, #0x1f]
    // 0x3c8f68: LoadField: d4 = r2->field_f
    //     0x3c8f68: ldur            d4, [x2, #0xf]
    // 0x3c8f6c: fsub            d6, d3, d4
    // 0x3c8f70: stur            d6, [fp, #-0x48]
    // 0x3c8f74: r0 = Size()
    //     0x3c8f74: bl              #0x23d898  ; AllocateSizeStub -> Size (size=0x18)
    // 0x3c8f78: ldur            d0, [fp, #-0x58]
    // 0x3c8f7c: stur            x0, [fp, #-0x28]
    // 0x3c8f80: StoreField: r0->field_7 = d0
    //     0x3c8f80: stur            d0, [x0, #7]
    // 0x3c8f84: ldur            d0, [fp, #-0x48]
    // 0x3c8f88: StoreField: r0->field_f = d0
    //     0x3c8f88: stur            d0, [x0, #0xf]
    // 0x3c8f8c: ldur            d1, [fp, #-0x60]
    // 0x3c8f90: d0 = 2.000000
    //     0x3c8f90: fmov            d0, #2.00000000
    // 0x3c8f94: fmul            d2, d1, d0
    // 0x3c8f98: stur            d2, [fp, #-0x48]
    // 0x3c8f9c: r0 = Size()
    //     0x3c8f9c: bl              #0x23d898  ; AllocateSizeStub -> Size (size=0x18)
    // 0x3c8fa0: ldur            d0, [fp, #-0x48]
    // 0x3c8fa4: StoreField: r0->field_7 = d0
    //     0x3c8fa4: stur            d0, [x0, #7]
    // 0x3c8fa8: StoreField: r0->field_f = d0
    //     0x3c8fa8: stur            d0, [x0, #0xf]
    // 0x3c8fac: ldur            x2, [fp, #-0x28]
    // 0x3c8fb0: mov             x3, x0
    // 0x3c8fb4: r1 = Instance_BoxFit
    //     0x3c8fb4: add             x1, PP, #0x12, lsl #12  ; [pp+0x12368] Obj!BoxFit@5dae51
    //     0x3c8fb8: ldr             x1, [x1, #0x368]
    // 0x3c8fbc: r0 = applyBoxFit()
    //     0x3c8fbc: bl              #0x2bf494  ; [package:flutter/src/painting/box_fit.dart] ::applyBoxFit
    // 0x3c8fc0: LoadField: r1 = r0->field_b
    //     0x3c8fc0: ldur            w1, [x0, #0xb]
    // 0x3c8fc4: DecompressPointer r1
    //     0x3c8fc4: add             x1, x1, HEAP, lsl #32
    // 0x3c8fc8: r0 = SizeExtension.toVector2()
    //     0x3c8fc8: bl              #0x384c6c  ; [package:flame/src/extensions/size.dart] ::SizeExtension.toVector2
    // 0x3c8fcc: mov             x1, x0
    // 0x3c8fd0: d0 = 1.200000
    //     0x3c8fd0: add             x17, PP, #0x15, lsl #12  ; [pp+0x15d38] IMM: double(1.2) from 0x3ff3333333333333
    //     0x3c8fd4: ldr             d0, [x17, #0xd38]
    // 0x3c8fd8: stur            x0, [fp, #-0x28]
    // 0x3c8fdc: r0 = *()
    //     0x3c8fdc: bl              #0x28c03c  ; [package:vector_math/vector_math.dart] Vector2::*
    // 0x3c8fe0: stur            x0, [fp, #-0x30]
    // 0x3c8fe4: r16 = 136
    //     0x3c8fe4: mov             x16, #0x88
    // 0x3c8fe8: stp             x16, NULL, [SP]
    // 0x3c8fec: r0 = ByteData()
    //     0x3c8fec: bl              #0x23e6cc  ; [dart:typed_data] ByteData::ByteData
    // 0x3c8ff0: stur            x0, [fp, #-0x38]
    // 0x3c8ff4: r0 = Paint()
    //     0x3c8ff4: bl              #0x28bc30  ; AllocatePaintStub -> Paint (size=0x10)
    // 0x3c8ff8: mov             x2, x0
    // 0x3c8ffc: ldur            x0, [fp, #-0x38]
    // 0x3c9000: stur            x2, [fp, #-0x40]
    // 0x3c9004: StoreField: r2->field_7 = r0
    //     0x3c9004: stur            w0, [x2, #7]
    // 0x3c9008: ldur            d0, [fp, #-0x50]
    // 0x3c900c: r0 = inline_Allocate_Double()
    //     0x3c900c: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x3c9010: add             x0, x0, #0x10
    //     0x3c9014: cmp             x1, x0
    //     0x3c9018: b.ls            #0x3c9164
    //     0x3c901c: str             x0, [THR, #0x60]  ; THR::top
    //     0x3c9020: sub             x0, x0, #0xf
    //     0x3c9024: mov             x1, #0xe19c
    //     0x3c9028: movk            x1, #3, lsl #16
    //     0x3c902c: stur            x1, [x0, #-1]
    // 0x3c9030: dmb             ishst
    // 0x3c9034: StoreField: r0->field_7 = d0
    //     0x3c9034: stur            d0, [x0, #7]
    // 0x3c9038: stur            x0, [fp, #-0x38]
    // 0x3c903c: str             x0, [SP]
    // 0x3c9040: r1 = Instance_Color
    //     0x3c9040: add             x1, PP, #8, lsl #12  ; [pp+0x8d00] Obj!Color@5ce6e1
    //     0x3c9044: ldr             x1, [x1, #0xd00]
    // 0x3c9048: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x3c9048: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x3c904c: ldr             x4, [x4, #0x1f0]
    // 0x3c9050: r0 = withValues()
    //     0x3c9050: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x3c9054: ldur            x1, [fp, #-0x40]
    // 0x3c9058: mov             x2, x0
    // 0x3c905c: r0 = color=()
    //     0x3c905c: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x3c9060: ldur            x1, [fp, #-0x40]
    // 0x3c9064: r2 = Instance_ColorFilter
    //     0x3c9064: add             x2, PP, #0x15, lsl #12  ; [pp+0x15d40] Obj!ColorFilter@5cd511
    //     0x3c9068: ldr             x2, [x2, #0xd40]
    // 0x3c906c: r0 = colorFilter=()
    //     0x3c906c: bl              #0x3badfc  ; [dart:ui] Paint::colorFilter=
    // 0x3c9070: ldur            x16, [fp, #-0x18]
    // 0x3c9074: r30 = Instance_Anchor
    //     0x3c9074: add             lr, PP, #8, lsl #12  ; [pp+0x8b30] Obj!Anchor@5cce91
    //     0x3c9078: ldr             lr, [lr, #0xb30]
    // 0x3c907c: stp             lr, x16, [SP, #8]
    // 0x3c9080: ldur            x16, [fp, #-0x40]
    // 0x3c9084: str             x16, [SP]
    // 0x3c9088: ldur            x1, [fp, #-8]
    // 0x3c908c: ldur            x2, [fp, #-0x10]
    // 0x3c9090: ldur            x3, [fp, #-0x30]
    // 0x3c9094: r4 = const [0, 0x6, 0x3, 0x3, anchor, 0x4, overridePaint, 0x5, position, 0x3, null]
    //     0x3c9094: add             x4, PP, #0x15, lsl #12  ; [pp+0x15d48] List(11) [0, 0x6, 0x3, 0x3, "anchor", 0x4, "overridePaint", 0x5, "position", 0x3, Null]
    //     0x3c9098: ldr             x4, [x4, #0xd48]
    // 0x3c909c: r0 = render()
    //     0x3c909c: bl              #0x3c9188  ; [package:flame/src/sprite.dart] Sprite::render
    // 0x3c90a0: r16 = 136
    //     0x3c90a0: mov             x16, #0x88
    // 0x3c90a4: stp             x16, NULL, [SP]
    // 0x3c90a8: r0 = ByteData()
    //     0x3c90a8: bl              #0x23e6cc  ; [dart:typed_data] ByteData::ByteData
    // 0x3c90ac: stur            x0, [fp, #-0x30]
    // 0x3c90b0: r0 = Paint()
    //     0x3c90b0: bl              #0x28bc30  ; AllocatePaintStub -> Paint (size=0x10)
    // 0x3c90b4: mov             x2, x0
    // 0x3c90b8: ldur            x0, [fp, #-0x30]
    // 0x3c90bc: stur            x2, [fp, #-0x40]
    // 0x3c90c0: StoreField: r2->field_7 = r0
    //     0x3c90c0: stur            w0, [x2, #7]
    // 0x3c90c4: ldur            x16, [fp, #-0x38]
    // 0x3c90c8: str             x16, [SP]
    // 0x3c90cc: r1 = Instance_Color
    //     0x3c90cc: add             x1, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x3c90d0: ldr             x1, [x1, #0x710]
    // 0x3c90d4: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x3c90d4: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x3c90d8: ldr             x4, [x4, #0x1f0]
    // 0x3c90dc: r0 = withValues()
    //     0x3c90dc: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x3c90e0: ldur            x1, [fp, #-0x40]
    // 0x3c90e4: mov             x2, x0
    // 0x3c90e8: r0 = color=()
    //     0x3c90e8: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x3c90ec: r0 = ColorFilter()
    //     0x3c90ec: bl              #0x3c917c  ; AllocateColorFilterStub -> ColorFilter (size=0x1c)
    // 0x3c90f0: mov             x1, x0
    // 0x3c90f4: ldur            x0, [fp, #-0x20]
    // 0x3c90f8: StoreField: r1->field_7 = r0
    //     0x3c90f8: stur            w0, [x1, #7]
    // 0x3c90fc: r0 = Instance_BlendMode
    //     0x3c90fc: add             x0, PP, #0x15, lsl #12  ; [pp+0x15d50] Obj!BlendMode@5dc951
    //     0x3c9100: ldr             x0, [x0, #0xd50]
    // 0x3c9104: StoreField: r1->field_b = r0
    //     0x3c9104: stur            w0, [x1, #0xb]
    // 0x3c9108: r0 = 1
    //     0x3c9108: mov             x0, #1
    // 0x3c910c: StoreField: r1->field_13 = r0
    //     0x3c910c: stur            x0, [x1, #0x13]
    // 0x3c9110: mov             x2, x1
    // 0x3c9114: ldur            x1, [fp, #-0x40]
    // 0x3c9118: r0 = colorFilter=()
    //     0x3c9118: bl              #0x3badfc  ; [dart:ui] Paint::colorFilter=
    // 0x3c911c: ldur            x16, [fp, #-0x18]
    // 0x3c9120: r30 = Instance_Anchor
    //     0x3c9120: add             lr, PP, #8, lsl #12  ; [pp+0x8b30] Obj!Anchor@5cce91
    //     0x3c9124: ldr             lr, [lr, #0xb30]
    // 0x3c9128: stp             lr, x16, [SP, #8]
    // 0x3c912c: ldur            x16, [fp, #-0x40]
    // 0x3c9130: str             x16, [SP]
    // 0x3c9134: ldur            x1, [fp, #-8]
    // 0x3c9138: ldur            x2, [fp, #-0x10]
    // 0x3c913c: ldur            x3, [fp, #-0x28]
    // 0x3c9140: r4 = const [0, 0x6, 0x3, 0x3, anchor, 0x4, overridePaint, 0x5, position, 0x3, null]
    //     0x3c9140: add             x4, PP, #0x15, lsl #12  ; [pp+0x15d48] List(11) [0, 0x6, 0x3, 0x3, "anchor", 0x4, "overridePaint", 0x5, "position", 0x3, Null]
    //     0x3c9144: ldr             x4, [x4, #0xd48]
    // 0x3c9148: r0 = render()
    //     0x3c9148: bl              #0x3c9188  ; [package:flame/src/sprite.dart] Sprite::render
    // 0x3c914c: r0 = Null
    //     0x3c914c: mov             x0, NULL
    // 0x3c9150: LeaveFrame
    //     0x3c9150: mov             SP, fp
    //     0x3c9154: ldp             fp, lr, [SP], #0x10
    // 0x3c9158: ret
    //     0x3c9158: ret             
    // 0x3c915c: r0 = StackOverflowSharedWithFPURegs()
    //     0x3c915c: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3c9160: b               #0x3c8dd0
    // 0x3c9164: SaveReg d0
    //     0x3c9164: str             q0, [SP, #-0x10]!
    // 0x3c9168: SaveReg r2
    //     0x3c9168: str             x2, [SP, #-8]!
    // 0x3c916c: r0 = AllocateDouble()
    //     0x3c916c: bl              #0x584528  ; AllocateDoubleStub
    // 0x3c9170: RestoreReg r2
    //     0x3c9170: ldr             x2, [SP], #8
    // 0x3c9174: RestoreReg d0
    //     0x3c9174: ldr             q0, [SP], #0x10
    // 0x3c9178: b               #0x3c9034
  }
  _ render(/* No info */) {
    // ** addr: 0x3c9fc8, size: 0x60
    // 0x3c9fc8: EnterFrame
    //     0x3c9fc8: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9fcc: mov             fp, SP
    // 0x3c9fd0: AllocStack(0x10)
    //     0x3c9fd0: sub             SP, SP, #0x10
    // 0x3c9fd4: SetupParameters(Bullet this /* r1 => r0 */, dynamic _ /* r2 => r1, fp-0x8 */)
    //     0x3c9fd4: mov             x0, x1
    //     0x3c9fd8: mov             x1, x2
    //     0x3c9fdc: stur            x2, [fp, #-8]
    // 0x3c9fe0: CheckStackOverflow
    //     0x3c9fe0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c9fe4: cmp             SP, x16
    //     0x3c9fe8: b.ls            #0x3ca020
    // 0x3c9fec: r0 = Vector2()
    //     0x3c9fec: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3c9ff0: r4 = 4
    //     0x3c9ff0: mov             x4, #4
    // 0x3c9ff4: stur            x0, [fp, #-0x10]
    // 0x3c9ff8: r0 = AllocateFloat32Array()
    //     0x3c9ff8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3c9ffc: ldur            x2, [fp, #-0x10]
    // 0x3ca000: StoreField: r2->field_7 = r0
    //     0x3ca000: stur            w0, [x2, #7]
    // 0x3ca004: ldur            x1, [fp, #-8]
    // 0x3ca008: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x3ca008: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x3ca00c: r0 = drawBullet()
    //     0x3ca00c: bl              #0x3c8c54  ; [package:ricochlime/flame/components/bullet.dart] Bullet::drawBullet
    // 0x3ca010: r0 = Null
    //     0x3ca010: mov             x0, NULL
    // 0x3ca014: LeaveFrame
    //     0x3ca014: mov             SP, fp
    //     0x3ca018: ldp             fp, lr, [SP], #0x10
    // 0x3ca01c: ret
    //     0x3ca01c: ret             
    // 0x3ca020: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3ca020: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3ca024: b               #0x3c9fec
  }
  _ update(/* No info */) {
    // ** addr: 0x3d3364, size: 0x13c
    // 0x3d3364: EnterFrame
    //     0x3d3364: stp             fp, lr, [SP, #-0x10]!
    //     0x3d3368: mov             fp, SP
    // 0x3d336c: AllocStack(0x10)
    //     0x3d336c: sub             SP, SP, #0x10
    // 0x3d3370: SetupParameters(Bullet this /* r1 => r2, fp-0x8 */)
    //     0x3d3370: mov             x2, x1
    //     0x3d3374: stur            x1, [fp, #-8]
    // 0x3d3378: CheckStackOverflow
    //     0x3d3378: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d337c: cmp             SP, x16
    //     0x3d3380: b.ls            #0x3d3488
    // 0x3d3384: LoadField: r0 = r2->field_43
    //     0x3d3384: ldur            w0, [x2, #0x43]
    // 0x3d3388: DecompressPointer r0
    //     0x3d3388: add             x0, x0, HEAP, lsl #32
    // 0x3d338c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d3390: cmp             w0, w16
    // 0x3d3394: b.eq            #0x3d3490
    // 0x3d3398: LoadField: r1 = r0->field_1b
    //     0x3d3398: ldur            w1, [x0, #0x1b]
    // 0x3d339c: DecompressPointer r1
    //     0x3d339c: add             x1, x1, HEAP, lsl #32
    // 0x3d33a0: LoadField: r0 = r1->field_7
    //     0x3d33a0: ldur            w0, [x1, #7]
    // 0x3d33a4: DecompressPointer r0
    //     0x3d33a4: add             x0, x0, HEAP, lsl #32
    // 0x3d33a8: LoadField: r3 = r0->field_7
    //     0x3d33a8: ldur            w3, [x0, #7]
    // 0x3d33ac: DecompressPointer r3
    //     0x3d33ac: add             x3, x3, HEAP, lsl #32
    // 0x3d33b0: LoadField: r0 = r3->field_13
    //     0x3d33b0: ldur            w0, [x3, #0x13]
    // 0x3d33b4: r1 = LoadInt32Instr(r0)
    //     0x3d33b4: sbfx            x1, x0, #1, #0x1f
    // 0x3d33b8: mov             x0, x1
    // 0x3d33bc: r1 = 1
    //     0x3d33bc: mov             x1, #1
    // 0x3d33c0: cmp             x1, x0
    // 0x3d33c4: b.hs            #0x3d349c
    // 0x3d33c8: LoadField: d0 = r3->field_1b
    //     0x3d33c8: ldur            s0, [x3, #0x1b]
    // 0x3d33cc: fcvt            d1, s0
    // 0x3d33d0: stur            d1, [fp, #-0x10]
    // 0x3d33d4: LoadField: r0 = r2->field_3b
    //     0x3d33d4: ldur            w0, [x2, #0x3b]
    // 0x3d33d8: DecompressPointer r0
    //     0x3d33d8: add             x0, x0, HEAP, lsl #32
    // 0x3d33dc: cmp             w0, NULL
    // 0x3d33e0: b.ne            #0x3d3414
    // 0x3d33e4: mov             x1, x2
    // 0x3d33e8: r0 = _findGameAndCheck()
    //     0x3d33e8: bl              #0x377910  ; [dart:mixin_deduplication] _MixinApplication265&Component&HasGameReference::_findGameAndCheck
    // 0x3d33ec: mov             x1, x0
    // 0x3d33f0: ldur            x2, [fp, #-8]
    // 0x3d33f4: StoreField: r2->field_3b = r0
    //     0x3d33f4: stur            w0, [x2, #0x3b]
    //     0x3d33f8: ldurb           w16, [x2, #-1]
    //     0x3d33fc: ldurb           w17, [x0, #-1]
    //     0x3d3400: and             x16, x17, x16, lsr #2
    //     0x3d3404: tst             x16, HEAP, lsr #32
    //     0x3d3408: b.eq            #0x3d3410
    //     0x3d340c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3d3410: b               #0x3d3418
    // 0x3d3414: mov             x1, x0
    // 0x3d3418: ldur            d0, [fp, #-0x10]
    // 0x3d341c: LoadField: r0 = r1->field_9b
    //     0x3d341c: ldur            w0, [x1, #0x9b]
    // 0x3d3420: DecompressPointer r0
    //     0x3d3420: add             x0, x0, HEAP, lsl #32
    // 0x3d3424: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d3428: cmp             w0, w16
    // 0x3d342c: b.ne            #0x3d343c
    // 0x3d3430: r2 = background
    //     0x3d3430: add             x2, PP, #0xc, lsl #12  ; [pp+0xc6f8] Field <RicochlimeGame.background>: late final (offset: 0x9c)
    //     0x3d3434: ldr             x2, [x2, #0x6f8]
    // 0x3d3438: r0 = InitLateFinalInstanceField()
    //     0x3d3438: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d343c: mov             x1, x0
    // 0x3d3440: LoadField: r0 = r1->field_4b
    //     0x3d3440: ldur            w0, [x1, #0x4b]
    // 0x3d3444: DecompressPointer r0
    //     0x3d3444: add             x0, x0, HEAP, lsl #32
    // 0x3d3448: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d344c: cmp             w0, w16
    // 0x3d3450: b.ne            #0x3d3460
    // 0x3d3454: r2 = bottomOfIsland
    //     0x3d3454: add             x2, PP, #0x1e, lsl #12  ; [pp+0x1e218] Field <Background.bottomOfIsland>: late final (offset: 0x4c)
    //     0x3d3458: ldr             x2, [x2, #0x218]
    // 0x3d345c: r0 = InitLateFinalInstanceField()
    //     0x3d345c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d3460: LoadField: d0 = r0->field_7
    //     0x3d3460: ldur            d0, [x0, #7]
    // 0x3d3464: ldur            d1, [fp, #-0x10]
    // 0x3d3468: fcmp            d1, d0
    // 0x3d346c: b.le            #0x3d3478
    // 0x3d3470: ldur            x1, [fp, #-8]
    // 0x3d3474: r0 = removeFromParent()
    //     0x3d3474: bl              #0x3779a0  ; [package:flame/src/components/core/component.dart] Component::removeFromParent
    // 0x3d3478: r0 = Null
    //     0x3d3478: mov             x0, NULL
    // 0x3d347c: LeaveFrame
    //     0x3d347c: mov             SP, fp
    //     0x3d3480: ldp             fp, lr, [SP], #0x10
    // 0x3d3484: ret
    //     0x3d3484: ret             
    // 0x3d3488: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d3488: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d348c: b               #0x3d3384
    // 0x3d3490: r9 = body
    //     0x3d3490: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x3d3494: ldr             x9, [x9, #0x7a0]
    // 0x3d3498: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x3d3498: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x3d349c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d349c: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ createBody(/* No info */) {
    // ** addr: 0x5465b8, size: 0x178
    // 0x5465b8: EnterFrame
    //     0x5465b8: stp             fp, lr, [SP, #-0x10]!
    //     0x5465bc: mov             fp, SP
    // 0x5465c0: AllocStack(0x20)
    //     0x5465c0: sub             SP, SP, #0x20
    // 0x5465c4: SetupParameters(Bullet this /* r1 => r1, fp-0x8 */)
    //     0x5465c4: stur            x1, [fp, #-8]
    // 0x5465c8: CheckStackOverflow
    //     0x5465c8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x5465cc: cmp             SP, x16
    //     0x5465d0: b.ls            #0x54671c
    // 0x5465d4: r0 = CircleShape()
    //     0x5465d4: bl              #0x547aa8  ; AllocateCircleShapeStub -> CircleShape (size=0x18)
    // 0x5465d8: mov             x1, x0
    // 0x5465dc: stur            x0, [fp, #-0x10]
    // 0x5465e0: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x5465e0: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x5465e4: r0 = CircleShape()
    //     0x5465e4: bl              #0x547960  ; [package:forge2d/src/collision/shapes/circle_shape.dart] CircleShape::CircleShape
    // 0x5465e8: ldur            x0, [fp, #-0x10]
    // 0x5465ec: d0 = 2.000000
    //     0x5465ec: fmov            d0, #2.00000000
    // 0x5465f0: StoreField: r0->field_b = d0
    //     0x5465f0: stur            d0, [x0, #0xb]
    // 0x5465f4: r0 = Filter()
    //     0x5465f4: bl              #0x3739c4  ; AllocateFilterStub -> Filter (size=0x20)
    // 0x5465f8: stur            x0, [fp, #-0x18]
    // 0x5465fc: ArrayStore: r0[0] = rZR  ; List_8
    //     0x5465fc: stur            xzr, [x0, #0x17]
    // 0x546600: r1 = 4
    //     0x546600: mov             x1, #4
    // 0x546604: StoreField: r0->field_7 = r1
    //     0x546604: stur            x1, [x0, #7]
    // 0x546608: r1 = 65531
    //     0x546608: mov             x1, #0xfffb
    // 0x54660c: StoreField: r0->field_f = r1
    //     0x54660c: stur            x1, [x0, #0xf]
    // 0x546610: r0 = FixtureDef()
    //     0x546610: bl              #0x3739d0  ; AllocateFixtureDefStub -> FixtureDef (size=0x30)
    // 0x546614: mov             x2, x0
    // 0x546618: ldur            x0, [fp, #-0x10]
    // 0x54661c: stur            x2, [fp, #-0x20]
    // 0x546620: StoreField: r2->field_7 = r0
    //     0x546620: stur            w0, [x2, #7]
    // 0x546624: ldur            x0, [fp, #-8]
    // 0x546628: StoreField: r2->field_b = r0
    //     0x546628: stur            w0, [x2, #0xb]
    // 0x54662c: StoreField: r2->field_f = rZR
    //     0x54662c: stur            xzr, [x2, #0xf]
    // 0x546630: d0 = 1.000000
    //     0x546630: fmov            d0, #1.00000000
    // 0x546634: ArrayStore: r2[0] = d0  ; List_8
    //     0x546634: stur            d0, [x2, #0x17]
    // 0x546638: StoreField: r2->field_1f = d0
    //     0x546638: stur            d0, [x2, #0x1f]
    // 0x54663c: r3 = false
    //     0x54663c: add             x3, NULL, #0x30  ; false
    // 0x546640: StoreField: r2->field_27 = r3
    //     0x546640: stur            w3, [x2, #0x27]
    // 0x546644: ldur            x1, [fp, #-0x18]
    // 0x546648: StoreField: r2->field_2b = r1
    //     0x546648: stur            w1, [x2, #0x2b]
    // 0x54664c: LoadField: r1 = r0->field_7b
    //     0x54664c: ldur            w1, [x0, #0x7b]
    // 0x546650: DecompressPointer r1
    //     0x546650: add             x1, x1, HEAP, lsl #32
    // 0x546654: d0 = 200.000000
    //     0x546654: add             x17, PP, #0xb, lsl #12  ; [pp+0xbb08] IMM: double(200) from 0x4069000000000000
    //     0x546658: ldr             d0, [x17, #0xb08]
    // 0x54665c: r0 = *()
    //     0x54665c: bl              #0x28c03c  ; [package:vector_math/vector_math.dart] Vector2::*
    // 0x546660: mov             x2, x0
    // 0x546664: ldur            x0, [fp, #-8]
    // 0x546668: stur            x2, [fp, #-0x10]
    // 0x54666c: LoadField: r1 = r0->field_77
    //     0x54666c: ldur            w1, [x0, #0x77]
    // 0x546670: DecompressPointer r1
    //     0x546670: add             x1, x1, HEAP, lsl #32
    // 0x546674: r0 = clone()
    //     0x546674: bl              #0x28be08  ; [package:vector_math/vector_math.dart] Vector2::clone
    // 0x546678: stur            x0, [fp, #-0x18]
    // 0x54667c: r0 = BodyDef()
    //     0x54667c: bl              #0x374bec  ; AllocateBodyDefStub -> BodyDef (size=0x54)
    // 0x546680: mov             x1, x0
    // 0x546684: r0 = Instance_BodyType
    //     0x546684: add             x0, PP, #0xd, lsl #12  ; [pp+0xd088] Obj!BodyType@5d9051
    //     0x546688: ldr             x0, [x0, #0x88]
    // 0x54668c: StoreField: r1->field_7 = r0
    //     0x54668c: stur            w0, [x1, #7]
    // 0x546690: StoreField: r1->field_13 = rZR
    //     0x546690: stur            xzr, [x1, #0x13]
    // 0x546694: d0 = 6.283185
    //     0x546694: add             x17, PP, #0xb, lsl #12  ; [pp+0xba20] IMM: double(6.283185307179586) from 0x401921fb54442d18
    //     0x546698: ldr             d0, [x17, #0xa20]
    // 0x54669c: StoreField: r1->field_1f = d0
    //     0x54669c: stur            d0, [x1, #0x1f]
    // 0x5466a0: StoreField: r1->field_27 = rZR
    //     0x5466a0: stur            xzr, [x1, #0x27]
    // 0x5466a4: StoreField: r1->field_2f = rZR
    //     0x5466a4: stur            xzr, [x1, #0x2f]
    // 0x5466a8: r0 = true
    //     0x5466a8: add             x0, NULL, #0x20  ; true
    // 0x5466ac: StoreField: r1->field_37 = r0
    //     0x5466ac: stur            w0, [x1, #0x37]
    // 0x5466b0: StoreField: r1->field_3b = r0
    //     0x5466b0: stur            w0, [x1, #0x3b]
    // 0x5466b4: r2 = false
    //     0x5466b4: add             x2, NULL, #0x30  ; false
    // 0x5466b8: StoreField: r1->field_3f = r2
    //     0x5466b8: stur            w2, [x1, #0x3f]
    // 0x5466bc: StoreField: r1->field_43 = r2
    //     0x5466bc: stur            w2, [x1, #0x43]
    // 0x5466c0: StoreField: r1->field_47 = r0
    //     0x5466c0: stur            w0, [x1, #0x47]
    // 0x5466c4: ldur            x0, [fp, #-0x18]
    // 0x5466c8: StoreField: r1->field_f = r0
    //     0x5466c8: stur            w0, [x1, #0xf]
    // 0x5466cc: ldur            x0, [fp, #-0x10]
    // 0x5466d0: StoreField: r1->field_1b = r0
    //     0x5466d0: stur            w0, [x1, #0x1b]
    // 0x5466d4: ldur            x0, [fp, #-8]
    // 0x5466d8: LoadField: r2 = r0->field_53
    //     0x5466d8: ldur            w2, [x0, #0x53]
    // 0x5466dc: DecompressPointer r2
    //     0x5466dc: add             x2, x2, HEAP, lsl #32
    // 0x5466e0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x5466e4: cmp             w2, w16
    // 0x5466e8: b.eq            #0x546724
    // 0x5466ec: mov             x16, x1
    // 0x5466f0: mov             x1, x2
    // 0x5466f4: mov             x2, x16
    // 0x5466f8: r0 = createBody()
    //     0x5466f8: bl              #0x5471f4  ; [package:flame_forge2d/forge2d_world.dart] Forge2DWorld::createBody
    // 0x5466fc: mov             x1, x0
    // 0x546700: ldur            x2, [fp, #-0x20]
    // 0x546704: stur            x0, [fp, #-8]
    // 0x546708: r0 = createFixture()
    //     0x546708: bl              #0x546730  ; [package:forge2d/src/dynamics/body.dart] Body::createFixture
    // 0x54670c: ldur            x0, [fp, #-8]
    // 0x546710: LeaveFrame
    //     0x546710: mov             SP, fp
    //     0x546714: ldp             fp, lr, [SP], #0x10
    // 0x546718: ret
    //     0x546718: ret             
    // 0x54671c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54671c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x546720: b               #0x5465d4
    // 0x546724: r9 = world
    //     0x546724: add             x9, PP, #0xd, lsl #12  ; [pp+0xd380] Field <BodyComponent.world>: late (offset: 0x54)
    //     0x546728: ldr             x9, [x9, #0x380]
    // 0x54672c: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x54672c: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
  }
  _ endContact(/* No info */) {
    // ** addr: 0x548858, size: 0xe4
    // 0x548858: EnterFrame
    //     0x548858: stp             fp, lr, [SP, #-0x10]!
    //     0x54885c: mov             fp, SP
    // 0x548860: AllocStack(0x8)
    //     0x548860: sub             SP, SP, #8
    // 0x548864: SetupParameters(Bullet this /* r1 => r0, fp-0x8 */)
    //     0x548864: mov             x0, x1
    //     0x548868: stur            x1, [fp, #-8]
    // 0x54886c: CheckStackOverflow
    //     0x54886c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x548870: cmp             SP, x16
    //     0x548874: b.ls            #0x548924
    // 0x548878: LoadField: r1 = r0->field_43
    //     0x548878: ldur            w1, [x0, #0x43]
    // 0x54887c: DecompressPointer r1
    //     0x54887c: add             x1, x1, HEAP, lsl #32
    // 0x548880: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x548884: cmp             w1, w16
    // 0x548888: b.eq            #0x54892c
    // 0x54888c: LoadField: r2 = r1->field_27
    //     0x54888c: ldur            w2, [x1, #0x27]
    // 0x548890: DecompressPointer r2
    //     0x548890: add             x2, x2, HEAP, lsl #32
    // 0x548894: mov             x1, x2
    // 0x548898: r0 = isVelocityHorizontal()
    //     0x548898: bl              #0x54893c  ; [package:ricochlime/flame/components/bullet.dart] Bullet::isVelocityHorizontal
    // 0x54889c: tbnz            w0, #4, #0x5488b8
    // 0x5488a0: ldur            x2, [fp, #-8]
    // 0x5488a4: LoadField: r3 = r2->field_7f
    //     0x5488a4: ldur            x3, [x2, #0x7f]
    // 0x5488a8: add             x4, x3, #1
    // 0x5488ac: StoreField: r2->field_7f = r4
    //     0x5488ac: stur            x4, [x2, #0x7f]
    // 0x5488b0: mov             x3, x4
    // 0x5488b4: b               #0x5488c4
    // 0x5488b8: ldur            x2, [fp, #-8]
    // 0x5488bc: StoreField: r2->field_7f = rZR
    //     0x5488bc: stur            xzr, [x2, #0x7f]
    // 0x5488c0: r3 = 0
    //     0x5488c0: mov             x3, #0
    // 0x5488c4: cmp             x3, #0x32
    // 0x5488c8: b.lt            #0x548914
    // 0x5488cc: d0 = 10.481556
    //     0x5488cc: add             x17, PP, #0x1b, lsl #12  ; [pp+0x1ba88] IMM: double(10.48155585660824) from 0x4024f68e7d3ea8c9
    //     0x5488d0: ldr             d0, [x17, #0xa88]
    // 0x5488d4: LoadField: r3 = r2->field_43
    //     0x5488d4: ldur            w3, [x2, #0x43]
    // 0x5488d8: DecompressPointer r3
    //     0x5488d8: add             x3, x3, HEAP, lsl #32
    // 0x5488dc: LoadField: r2 = r3->field_27
    //     0x5488dc: ldur            w2, [x3, #0x27]
    // 0x5488e0: DecompressPointer r2
    //     0x5488e0: add             x2, x2, HEAP, lsl #32
    // 0x5488e4: LoadField: r3 = r2->field_7
    //     0x5488e4: ldur            w3, [x2, #7]
    // 0x5488e8: DecompressPointer r3
    //     0x5488e8: add             x3, x3, HEAP, lsl #32
    // 0x5488ec: LoadField: r2 = r3->field_13
    //     0x5488ec: ldur            w2, [x3, #0x13]
    // 0x5488f0: r0 = LoadInt32Instr(r2)
    //     0x5488f0: sbfx            x0, x2, #1, #0x1f
    // 0x5488f4: r1 = 1
    //     0x5488f4: mov             x1, #1
    // 0x5488f8: cmp             x1, x0
    // 0x5488fc: b.hs            #0x548938
    // 0x548900: LoadField: d1 = r3->field_1b
    //     0x548900: ldur            s1, [x3, #0x1b]
    // 0x548904: fcvt            d2, s1
    // 0x548908: fadd            d1, d2, d0
    // 0x54890c: fcvt            s0, d1
    // 0x548910: StoreField: r3->field_1b = d0
    //     0x548910: stur            s0, [x3, #0x1b]
    // 0x548914: r0 = Null
    //     0x548914: mov             x0, NULL
    // 0x548918: LeaveFrame
    //     0x548918: mov             SP, fp
    //     0x54891c: ldp             fp, lr, [SP], #0x10
    // 0x548920: ret
    //     0x548920: ret             
    // 0x548924: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x548924: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x548928: b               #0x548878
    // 0x54892c: r9 = body
    //     0x54892c: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x548930: ldr             x9, [x9, #0x7a0]
    // 0x548934: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x548934: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x548938: r0 = RangeErrorSharedWithFPURegs()
    //     0x548938: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  static _ isVelocityHorizontal(/* No info */) {
    // ** addr: 0x54893c, size: 0xbc
    // 0x54893c: EnterFrame
    //     0x54893c: stp             fp, lr, [SP, #-0x10]!
    //     0x548940: mov             fp, SP
    // 0x548944: d0 = 0.000000
    //     0x548944: eor             v0.16b, v0.16b, v0.16b
    // 0x548948: LoadField: r2 = r1->field_7
    //     0x548948: ldur            w2, [x1, #7]
    // 0x54894c: DecompressPointer r2
    //     0x54894c: add             x2, x2, HEAP, lsl #32
    // 0x548950: LoadField: r3 = r2->field_13
    //     0x548950: ldur            w3, [x2, #0x13]
    // 0x548954: r4 = LoadInt32Instr(r3)
    //     0x548954: sbfx            x4, x3, #1, #0x1f
    // 0x548958: mov             x0, x4
    // 0x54895c: r1 = 0
    //     0x54895c: mov             x1, #0
    // 0x548960: cmp             x1, x0
    // 0x548964: b.hs            #0x5489f0
    // 0x548968: ArrayLoad: d1 = r2[0]  ; List_8
    //     0x548968: ldur            s1, [x2, #0x17]
    // 0x54896c: fcvt            d2, s1
    // 0x548970: fcmp            d2, d0
    // 0x548974: b.ne            #0x548988
    // 0x548978: r0 = false
    //     0x548978: add             x0, NULL, #0x30  ; false
    // 0x54897c: LeaveFrame
    //     0x54897c: mov             SP, fp
    //     0x548980: ldp             fp, lr, [SP], #0x10
    // 0x548984: ret
    //     0x548984: ret             
    // 0x548988: mov             x0, x4
    // 0x54898c: r1 = 1
    //     0x54898c: mov             x1, #1
    // 0x548990: cmp             x1, x0
    // 0x548994: b.hs            #0x5489f4
    // 0x548998: LoadField: d1 = r2->field_1b
    //     0x548998: ldur            s1, [x2, #0x1b]
    // 0x54899c: fcvt            d3, s1
    // 0x5489a0: fdiv            d1, d3, d2
    // 0x5489a4: fcmp            d1, d0
    // 0x5489a8: b.ne            #0x5489b4
    // 0x5489ac: d1 = 0.000000
    //     0x5489ac: eor             v1.16b, v1.16b, v1.16b
    // 0x5489b0: b               #0x5489cc
    // 0x5489b4: fcmp            d0, d1
    // 0x5489b8: b.le            #0x5489c4
    // 0x5489bc: fneg            d0, d1
    // 0x5489c0: b               #0x5489c8
    // 0x5489c4: mov             v0.16b, v1.16b
    // 0x5489c8: mov             v1.16b, v0.16b
    // 0x5489cc: d0 = 0.052408
    //     0x5489cc: add             x17, PP, #0x1b, lsl #12  ; [pp+0x1ba90] IMM: double(0.0524077792830412) from 0x3faad53144273e72
    //     0x5489d0: ldr             d0, [x17, #0xa90]
    // 0x5489d4: fcmp            d0, d1
    // 0x5489d8: r16 = true
    //     0x5489d8: add             x16, NULL, #0x20  ; true
    // 0x5489dc: r17 = false
    //     0x5489dc: add             x17, NULL, #0x30  ; false
    // 0x5489e0: csel            x0, x16, x17, gt
    // 0x5489e4: LeaveFrame
    //     0x5489e4: mov             SP, fp
    //     0x5489e8: ldp             fp, lr, [SP], #0x10
    // 0x5489ec: ret
    //     0x5489ec: ret             
    // 0x5489f0: r0 = RangeErrorSharedWithFPURegs()
    //     0x5489f0: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x5489f4: r0 = RangeErrorSharedWithFPURegs()
    //     0x5489f4: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
}
