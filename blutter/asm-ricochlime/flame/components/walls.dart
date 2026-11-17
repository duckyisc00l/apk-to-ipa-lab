// lib: , url: package:ricochlime/flame/components/walls.dart

// class id: 1049308, size: 0x8
class :: {

  static _ createBoundaries(/* No info */) {
    // ** addr: 0x433bd4, size: 0x4a4
    // 0x433bd4: EnterFrame
    //     0x433bd4: stp             fp, lr, [SP, #-0x10]!
    //     0x433bd8: mov             fp, SP
    // 0x433bdc: AllocStack(0x40)
    //     0x433bdc: sub             SP, SP, #0x40
    // 0x433be0: CheckStackOverflow
    //     0x433be0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x433be4: cmp             SP, x16
    //     0x433be8: b.ls            #0x434070
    // 0x433bec: r1 = 4
    //     0x433bec: mov             x1, #4
    // 0x433bf0: r0 = AllocateContext()
    //     0x433bf0: bl              #0x5834e8  ; AllocateContextStub
    // 0x433bf4: r1 = Function '#topLeft#initializer': static.
    //     0x433bf4: add             x1, PP, #0xd, lsl #12  ; [pp+0xd408] AnonymousClosure: static (0x434400), in [package:ricochlime/flame/components/walls.dart] ::createBoundaries (0x433bd4)
    //     0x433bf8: ldr             x1, [x1, #0x408]
    // 0x433bfc: r2 = Null
    //     0x433bfc: mov             x2, NULL
    // 0x433c00: stur            x0, [fp, #-8]
    // 0x433c04: r0 = AllocateClosure()
    //     0x433c04: bl              #0x5838bc  ; AllocateClosureStub
    // 0x433c08: mov             x1, x0
    // 0x433c0c: ldur            x0, [fp, #-8]
    // 0x433c10: StoreField: r0->field_f = r1
    //     0x433c10: stur            w1, [x0, #0xf]
    // 0x433c14: ldr             x3, [THR, #0x90]  ; THR::object_sentinel
    // 0x433c18: StoreField: r0->field_13 = r3
    //     0x433c18: stur            w3, [x0, #0x13]
    // 0x433c1c: r1 = Function '#bottomRight#initializer': static.
    //     0x433c1c: add             x1, PP, #0xd, lsl #12  ; [pp+0xd410] AnonymousClosure: static (0x4343b4), in [package:ricochlime/flame/components/walls.dart] ::createBoundaries (0x433bd4)
    //     0x433c20: ldr             x1, [x1, #0x410]
    // 0x433c24: r2 = Null
    //     0x433c24: mov             x2, NULL
    // 0x433c28: r0 = AllocateClosure()
    //     0x433c28: bl              #0x5838bc  ; AllocateClosureStub
    // 0x433c2c: mov             x1, x0
    // 0x433c30: ldur            x0, [fp, #-8]
    // 0x433c34: ArrayStore: r0[0] = r1  ; List_4
    //     0x433c34: stur            w1, [x0, #0x17]
    // 0x433c38: ldr             x1, [THR, #0x90]  ; THR::object_sentinel
    // 0x433c3c: StoreField: r0->field_1b = r1
    //     0x433c3c: stur            w1, [x0, #0x1b]
    // 0x433c40: mov             x2, x0
    // 0x433c44: r1 = Function '#topRight#initializer': static.
    //     0x433c44: add             x1, PP, #0xd, lsl #12  ; [pp+0xd418] AnonymousClosure: static (0x43422c), in [package:ricochlime/flame/components/walls.dart] ::createBoundaries (0x433bd4)
    //     0x433c48: ldr             x1, [x1, #0x418]
    // 0x433c4c: r0 = AllocateClosure()
    //     0x433c4c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x433c50: ldur            x2, [fp, #-8]
    // 0x433c54: r1 = Function '#bottomLeft#initializer': static.
    //     0x433c54: add             x1, PP, #0xd, lsl #12  ; [pp+0xd420] AnonymousClosure: static (0x4340a4), in [package:ricochlime/flame/components/walls.dart] ::createBoundaries (0x433bd4)
    //     0x433c58: ldr             x1, [x1, #0x420]
    // 0x433c5c: stur            x0, [fp, #-0x10]
    // 0x433c60: r0 = AllocateClosure()
    //     0x433c60: bl              #0x5838bc  ; AllocateClosureStub
    // 0x433c64: r1 = <Wall>
    //     0x433c64: add             x1, PP, #0xd, lsl #12  ; [pp+0xd428] TypeArguments: <Wall>
    //     0x433c68: ldr             x1, [x1, #0x428]
    // 0x433c6c: r2 = 0
    //     0x433c6c: mov             x2, #0
    // 0x433c70: stur            x0, [fp, #-0x18]
    // 0x433c74: r0 = _GrowableList()
    //     0x433c74: bl              #0x237730  ; [dart:core] _GrowableList::_GrowableList
    // 0x433c78: mov             x1, x0
    // 0x433c7c: ldur            x0, [fp, #-8]
    // 0x433c80: stur            x1, [fp, #-0x20]
    // 0x433c84: LoadField: r2 = r0->field_13
    //     0x433c84: ldur            w2, [x0, #0x13]
    // 0x433c88: DecompressPointer r2
    //     0x433c88: add             x2, x2, HEAP, lsl #32
    // 0x433c8c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x433c90: cmp             w2, w16
    // 0x433c94: b.ne            #0x433cec
    // 0x433c98: r0 = Vector2()
    //     0x433c98: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x433c9c: r4 = 4
    //     0x433c9c: mov             x4, #4
    // 0x433ca0: stur            x0, [fp, #-0x28]
    // 0x433ca4: r0 = AllocateFloat32Array()
    //     0x433ca4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x433ca8: ldur            x1, [fp, #-0x28]
    // 0x433cac: StoreField: r1->field_7 = r0
    //     0x433cac: stur            w0, [x1, #7]
    // 0x433cb0: d0 = 0.000000
    //     0x433cb0: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x433cb4: ldr             s0, [x17, #0x9a8]
    // 0x433cb8: StoreField: r0->field_1b = d0
    //     0x433cb8: stur            s0, [x0, #0x1b]
    // 0x433cbc: ArrayStore: r0[0] = d0  ; List_8
    //     0x433cbc: stur            s0, [x0, #0x17]
    // 0x433cc0: mov             x0, x1
    // 0x433cc4: ldur            x3, [fp, #-8]
    // 0x433cc8: StoreField: r3->field_13 = r0
    //     0x433cc8: stur            w0, [x3, #0x13]
    //     0x433ccc: ldurb           w16, [x3, #-1]
    //     0x433cd0: ldurb           w17, [x0, #-1]
    //     0x433cd4: and             x16, x17, x16, lsr #2
    //     0x433cd8: tst             x16, HEAP, lsr #32
    //     0x433cdc: b.eq            #0x433ce4
    //     0x433ce0: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x433ce4: mov             x2, x1
    // 0x433ce8: b               #0x433cf8
    // 0x433cec: mov             x3, x0
    // 0x433cf0: d0 = 0.000000
    //     0x433cf0: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x433cf4: ldr             s0, [x17, #0x9a8]
    // 0x433cf8: ldur            x1, [fp, #-0x20]
    // 0x433cfc: stur            x2, [fp, #-0x28]
    // 0x433d00: ldur            x16, [fp, #-0x10]
    // 0x433d04: str             x16, [SP]
    // 0x433d08: ldur            x0, [fp, #-0x10]
    // 0x433d0c: ClosureCall
    //     0x433d0c: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    //     0x433d10: ldur            x2, [x0, #0x1f]
    //     0x433d14: blr             x2
    // 0x433d18: r1 = <Forge2DGame<Forge2DWorld>>
    //     0x433d18: add             x1, PP, #0xc, lsl #12  ; [pp+0xc768] TypeArguments: <Forge2DGame<Forge2DWorld>>
    //     0x433d1c: ldr             x1, [x1, #0x768]
    // 0x433d20: stur            x0, [fp, #-0x10]
    // 0x433d24: r0 = Wall()
    //     0x433d24: bl              #0x434078  ; AllocateWallStub -> Wall (size=0x70)
    // 0x433d28: mov             x2, x0
    // 0x433d2c: ldur            x0, [fp, #-0x28]
    // 0x433d30: stur            x2, [fp, #-0x30]
    // 0x433d34: StoreField: r2->field_67 = r0
    //     0x433d34: stur            w0, [x2, #0x67]
    // 0x433d38: ldur            x0, [fp, #-0x10]
    // 0x433d3c: StoreField: r2->field_6b = r0
    //     0x433d3c: stur            w0, [x2, #0x6b]
    // 0x433d40: mov             x1, x2
    // 0x433d44: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x433d44: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x433d48: r0 = BodyComponent()
    //     0x433d48: bl              #0x374698  ; [package:flame_forge2d/body_component.dart] BodyComponent::BodyComponent
    // 0x433d4c: ldur            x0, [fp, #-0x30]
    // 0x433d50: r2 = false
    //     0x433d50: add             x2, NULL, #0x30  ; false
    // 0x433d54: StoreField: r0->field_4f = r2
    //     0x433d54: stur            w2, [x0, #0x4f]
    // 0x433d58: ldur            x3, [fp, #-0x20]
    // 0x433d5c: LoadField: r1 = r3->field_b
    //     0x433d5c: ldur            w1, [x3, #0xb]
    // 0x433d60: LoadField: r4 = r3->field_f
    //     0x433d60: ldur            w4, [x3, #0xf]
    // 0x433d64: DecompressPointer r4
    //     0x433d64: add             x4, x4, HEAP, lsl #32
    // 0x433d68: LoadField: r5 = r4->field_b
    //     0x433d68: ldur            w5, [x4, #0xb]
    // 0x433d6c: r4 = LoadInt32Instr(r1)
    //     0x433d6c: sbfx            x4, x1, #1, #0x1f
    // 0x433d70: stur            x4, [fp, #-0x38]
    // 0x433d74: r1 = LoadInt32Instr(r5)
    //     0x433d74: sbfx            x1, x5, #1, #0x1f
    // 0x433d78: cmp             x4, x1
    // 0x433d7c: b.ne            #0x433d88
    // 0x433d80: mov             x1, x3
    // 0x433d84: r0 = _growToNextCapacity()
    //     0x433d84: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x433d88: ldur            x4, [fp, #-8]
    // 0x433d8c: ldur            x2, [fp, #-0x20]
    // 0x433d90: ldur            x3, [fp, #-0x38]
    // 0x433d94: add             x0, x3, #1
    // 0x433d98: lsl             x1, x0, #1
    // 0x433d9c: StoreField: r2->field_b = r1
    //     0x433d9c: stur            w1, [x2, #0xb]
    // 0x433da0: LoadField: r1 = r2->field_f
    //     0x433da0: ldur            w1, [x2, #0xf]
    // 0x433da4: DecompressPointer r1
    //     0x433da4: add             x1, x1, HEAP, lsl #32
    // 0x433da8: ldur            x0, [fp, #-0x30]
    // 0x433dac: ArrayStore: r1[r3] = r0  ; List_4
    //     0x433dac: add             x25, x1, x3, lsl #2
    //     0x433db0: add             x25, x25, #0xf
    //     0x433db4: str             w0, [x25]
    //     0x433db8: tbz             w0, #0, #0x433dd4
    //     0x433dbc: ldurb           w16, [x1, #-1]
    //     0x433dc0: ldurb           w17, [x0, #-1]
    //     0x433dc4: and             x16, x17, x16, lsr #2
    //     0x433dc8: tst             x16, HEAP, lsr #32
    //     0x433dcc: b.eq            #0x433dd4
    //     0x433dd0: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x433dd4: LoadField: r0 = r4->field_1b
    //     0x433dd4: ldur            w0, [x4, #0x1b]
    // 0x433dd8: DecompressPointer r0
    //     0x433dd8: add             x0, x0, HEAP, lsl #32
    // 0x433ddc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x433de0: cmp             w0, w16
    // 0x433de4: b.ne            #0x433e44
    // 0x433de8: r0 = Vector2()
    //     0x433de8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x433dec: r4 = 4
    //     0x433dec: mov             x4, #4
    // 0x433df0: stur            x0, [fp, #-0x28]
    // 0x433df4: r0 = AllocateFloat32Array()
    //     0x433df4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x433df8: ldur            x1, [fp, #-0x28]
    // 0x433dfc: StoreField: r1->field_7 = r0
    //     0x433dfc: stur            w0, [x1, #7]
    // 0x433e00: d0 = 0.000000
    //     0x433e00: add             x17, PP, #0xd, lsl #12  ; [pp+0xd430] IMM: 0x43535555
    //     0x433e04: ldr             s0, [x17, #0x430]
    // 0x433e08: StoreField: r0->field_1b = d0
    //     0x433e08: stur            s0, [x0, #0x1b]
    // 0x433e0c: d0 = 0.000000
    //     0x433e0c: add             x17, PP, #0xd, lsl #12  ; [pp+0xd438] IMM: 0x42fc0000
    //     0x433e10: ldr             s0, [x17, #0x438]
    // 0x433e14: ArrayStore: r0[0] = d0  ; List_8
    //     0x433e14: stur            s0, [x0, #0x17]
    // 0x433e18: mov             x0, x1
    // 0x433e1c: ldur            x2, [fp, #-8]
    // 0x433e20: StoreField: r2->field_1b = r0
    //     0x433e20: stur            w0, [x2, #0x1b]
    //     0x433e24: ldurb           w16, [x2, #-1]
    //     0x433e28: ldurb           w17, [x0, #-1]
    //     0x433e2c: and             x16, x17, x16, lsr #2
    //     0x433e30: tst             x16, HEAP, lsr #32
    //     0x433e34: b.eq            #0x433e3c
    //     0x433e38: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x433e3c: mov             x4, x1
    // 0x433e40: b               #0x433e4c
    // 0x433e44: mov             x2, x4
    // 0x433e48: mov             x4, x0
    // 0x433e4c: ldur            x0, [fp, #-0x20]
    // 0x433e50: ldur            x3, [fp, #-0x10]
    // 0x433e54: stur            x4, [fp, #-0x28]
    // 0x433e58: r1 = <Forge2DGame<Forge2DWorld>>
    //     0x433e58: add             x1, PP, #0xc, lsl #12  ; [pp+0xc768] TypeArguments: <Forge2DGame<Forge2DWorld>>
    //     0x433e5c: ldr             x1, [x1, #0x768]
    // 0x433e60: r0 = Wall()
    //     0x433e60: bl              #0x434078  ; AllocateWallStub -> Wall (size=0x70)
    // 0x433e64: mov             x2, x0
    // 0x433e68: ldur            x0, [fp, #-0x10]
    // 0x433e6c: stur            x2, [fp, #-0x30]
    // 0x433e70: StoreField: r2->field_67 = r0
    //     0x433e70: stur            w0, [x2, #0x67]
    // 0x433e74: ldur            x0, [fp, #-0x28]
    // 0x433e78: StoreField: r2->field_6b = r0
    //     0x433e78: stur            w0, [x2, #0x6b]
    // 0x433e7c: mov             x1, x2
    // 0x433e80: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x433e80: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x433e84: r0 = BodyComponent()
    //     0x433e84: bl              #0x374698  ; [package:flame_forge2d/body_component.dart] BodyComponent::BodyComponent
    // 0x433e88: ldur            x0, [fp, #-0x30]
    // 0x433e8c: r2 = false
    //     0x433e8c: add             x2, NULL, #0x30  ; false
    // 0x433e90: StoreField: r0->field_4f = r2
    //     0x433e90: stur            w2, [x0, #0x4f]
    // 0x433e94: ldur            x3, [fp, #-0x20]
    // 0x433e98: LoadField: r1 = r3->field_b
    //     0x433e98: ldur            w1, [x3, #0xb]
    // 0x433e9c: LoadField: r4 = r3->field_f
    //     0x433e9c: ldur            w4, [x3, #0xf]
    // 0x433ea0: DecompressPointer r4
    //     0x433ea0: add             x4, x4, HEAP, lsl #32
    // 0x433ea4: LoadField: r5 = r4->field_b
    //     0x433ea4: ldur            w5, [x4, #0xb]
    // 0x433ea8: r4 = LoadInt32Instr(r1)
    //     0x433ea8: sbfx            x4, x1, #1, #0x1f
    // 0x433eac: stur            x4, [fp, #-0x38]
    // 0x433eb0: r1 = LoadInt32Instr(r5)
    //     0x433eb0: sbfx            x1, x5, #1, #0x1f
    // 0x433eb4: cmp             x4, x1
    // 0x433eb8: b.ne            #0x433ec4
    // 0x433ebc: mov             x1, x3
    // 0x433ec0: r0 = _growToNextCapacity()
    //     0x433ec0: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x433ec4: ldur            x4, [fp, #-8]
    // 0x433ec8: ldur            x2, [fp, #-0x20]
    // 0x433ecc: ldur            x3, [fp, #-0x38]
    // 0x433ed0: add             x0, x3, #1
    // 0x433ed4: lsl             x1, x0, #1
    // 0x433ed8: StoreField: r2->field_b = r1
    //     0x433ed8: stur            w1, [x2, #0xb]
    // 0x433edc: LoadField: r1 = r2->field_f
    //     0x433edc: ldur            w1, [x2, #0xf]
    // 0x433ee0: DecompressPointer r1
    //     0x433ee0: add             x1, x1, HEAP, lsl #32
    // 0x433ee4: ldur            x0, [fp, #-0x30]
    // 0x433ee8: ArrayStore: r1[r3] = r0  ; List_4
    //     0x433ee8: add             x25, x1, x3, lsl #2
    //     0x433eec: add             x25, x25, #0xf
    //     0x433ef0: str             w0, [x25]
    //     0x433ef4: tbz             w0, #0, #0x433f10
    //     0x433ef8: ldurb           w16, [x1, #-1]
    //     0x433efc: ldurb           w17, [x0, #-1]
    //     0x433f00: and             x16, x17, x16, lsr #2
    //     0x433f04: tst             x16, HEAP, lsr #32
    //     0x433f08: b.eq            #0x433f10
    //     0x433f0c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x433f10: ldur            x16, [fp, #-0x18]
    // 0x433f14: str             x16, [SP]
    // 0x433f18: ldur            x0, [fp, #-0x18]
    // 0x433f1c: ClosureCall
    //     0x433f1c: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    //     0x433f20: ldur            x2, [x0, #0x1f]
    //     0x433f24: blr             x2
    // 0x433f28: mov             x1, x0
    // 0x433f2c: ldur            x0, [fp, #-8]
    // 0x433f30: stur            x1, [fp, #-0x10]
    // 0x433f34: LoadField: r2 = r0->field_13
    //     0x433f34: ldur            w2, [x0, #0x13]
    // 0x433f38: DecompressPointer r2
    //     0x433f38: add             x2, x2, HEAP, lsl #32
    // 0x433f3c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x433f40: cmp             w2, w16
    // 0x433f44: b.ne            #0x433f9c
    // 0x433f48: r0 = Vector2()
    //     0x433f48: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x433f4c: r4 = 4
    //     0x433f4c: mov             x4, #4
    // 0x433f50: stur            x0, [fp, #-0x18]
    // 0x433f54: r0 = AllocateFloat32Array()
    //     0x433f54: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x433f58: ldur            x1, [fp, #-0x18]
    // 0x433f5c: StoreField: r1->field_7 = r0
    //     0x433f5c: stur            w0, [x1, #7]
    // 0x433f60: d0 = 0.000000
    //     0x433f60: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x433f64: ldr             s0, [x17, #0x9a8]
    // 0x433f68: StoreField: r0->field_1b = d0
    //     0x433f68: stur            s0, [x0, #0x1b]
    // 0x433f6c: ArrayStore: r0[0] = d0  ; List_8
    //     0x433f6c: stur            s0, [x0, #0x17]
    // 0x433f70: mov             x0, x1
    // 0x433f74: ldur            x2, [fp, #-8]
    // 0x433f78: StoreField: r2->field_13 = r0
    //     0x433f78: stur            w0, [x2, #0x13]
    //     0x433f7c: ldurb           w16, [x2, #-1]
    //     0x433f80: ldurb           w17, [x0, #-1]
    //     0x433f84: and             x16, x17, x16, lsr #2
    //     0x433f88: tst             x16, HEAP, lsr #32
    //     0x433f8c: b.eq            #0x433f94
    //     0x433f90: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x433f94: mov             x3, x1
    // 0x433f98: b               #0x433fa0
    // 0x433f9c: mov             x3, x2
    // 0x433fa0: ldur            x2, [fp, #-0x20]
    // 0x433fa4: ldur            x0, [fp, #-0x10]
    // 0x433fa8: stur            x3, [fp, #-8]
    // 0x433fac: r1 = <Forge2DGame<Forge2DWorld>>
    //     0x433fac: add             x1, PP, #0xc, lsl #12  ; [pp+0xc768] TypeArguments: <Forge2DGame<Forge2DWorld>>
    //     0x433fb0: ldr             x1, [x1, #0x768]
    // 0x433fb4: r0 = Wall()
    //     0x433fb4: bl              #0x434078  ; AllocateWallStub -> Wall (size=0x70)
    // 0x433fb8: mov             x2, x0
    // 0x433fbc: ldur            x0, [fp, #-0x10]
    // 0x433fc0: stur            x2, [fp, #-0x18]
    // 0x433fc4: StoreField: r2->field_67 = r0
    //     0x433fc4: stur            w0, [x2, #0x67]
    // 0x433fc8: ldur            x0, [fp, #-8]
    // 0x433fcc: StoreField: r2->field_6b = r0
    //     0x433fcc: stur            w0, [x2, #0x6b]
    // 0x433fd0: mov             x1, x2
    // 0x433fd4: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x433fd4: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x433fd8: r0 = BodyComponent()
    //     0x433fd8: bl              #0x374698  ; [package:flame_forge2d/body_component.dart] BodyComponent::BodyComponent
    // 0x433fdc: ldur            x0, [fp, #-0x18]
    // 0x433fe0: r1 = false
    //     0x433fe0: add             x1, NULL, #0x30  ; false
    // 0x433fe4: StoreField: r0->field_4f = r1
    //     0x433fe4: stur            w1, [x0, #0x4f]
    // 0x433fe8: ldur            x2, [fp, #-0x20]
    // 0x433fec: LoadField: r1 = r2->field_b
    //     0x433fec: ldur            w1, [x2, #0xb]
    // 0x433ff0: LoadField: r3 = r2->field_f
    //     0x433ff0: ldur            w3, [x2, #0xf]
    // 0x433ff4: DecompressPointer r3
    //     0x433ff4: add             x3, x3, HEAP, lsl #32
    // 0x433ff8: LoadField: r4 = r3->field_b
    //     0x433ff8: ldur            w4, [x3, #0xb]
    // 0x433ffc: r3 = LoadInt32Instr(r1)
    //     0x433ffc: sbfx            x3, x1, #1, #0x1f
    // 0x434000: stur            x3, [fp, #-0x38]
    // 0x434004: r1 = LoadInt32Instr(r4)
    //     0x434004: sbfx            x1, x4, #1, #0x1f
    // 0x434008: cmp             x3, x1
    // 0x43400c: b.ne            #0x434018
    // 0x434010: mov             x1, x2
    // 0x434014: r0 = _growToNextCapacity()
    //     0x434014: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x434018: ldur            x2, [fp, #-0x20]
    // 0x43401c: ldur            x3, [fp, #-0x38]
    // 0x434020: add             x4, x3, #1
    // 0x434024: lsl             x5, x4, #1
    // 0x434028: StoreField: r2->field_b = r5
    //     0x434028: stur            w5, [x2, #0xb]
    // 0x43402c: LoadField: r1 = r2->field_f
    //     0x43402c: ldur            w1, [x2, #0xf]
    // 0x434030: DecompressPointer r1
    //     0x434030: add             x1, x1, HEAP, lsl #32
    // 0x434034: ldur            x0, [fp, #-0x18]
    // 0x434038: ArrayStore: r1[r3] = r0  ; List_4
    //     0x434038: add             x25, x1, x3, lsl #2
    //     0x43403c: add             x25, x25, #0xf
    //     0x434040: str             w0, [x25]
    //     0x434044: tbz             w0, #0, #0x434060
    //     0x434048: ldurb           w16, [x1, #-1]
    //     0x43404c: ldurb           w17, [x0, #-1]
    //     0x434050: and             x16, x17, x16, lsr #2
    //     0x434054: tst             x16, HEAP, lsr #32
    //     0x434058: b.eq            #0x434060
    //     0x43405c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x434060: mov             x0, x2
    // 0x434064: LeaveFrame
    //     0x434064: mov             SP, fp
    //     0x434068: ldp             fp, lr, [SP], #0x10
    // 0x43406c: ret
    //     0x43406c: ret             
    // 0x434070: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x434070: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x434074: b               #0x433bec
  }
  [closure] static Vector2 #bottomLeft#initializer(dynamic) {
    // ** addr: 0x4340a4, size: 0x188
    // 0x4340a4: EnterFrame
    //     0x4340a4: stp             fp, lr, [SP, #-0x10]!
    //     0x4340a8: mov             fp, SP
    // 0x4340ac: AllocStack(0x20)
    //     0x4340ac: sub             SP, SP, #0x20
    // 0x4340b0: SetupParameters([dynamic _ /* r0 */])
    //     0x4340b0: ldr             x0, [fp, #0x10]
    //     0x4340b4: ldur            w1, [x0, #0x17]
    //     0x4340b8: add             x1, x1, HEAP, lsl #32
    //     0x4340bc: stur            x1, [fp, #-8]
    // 0x4340c0: LoadField: r0 = r1->field_13
    //     0x4340c0: ldur            w0, [x1, #0x13]
    // 0x4340c4: DecompressPointer r0
    //     0x4340c4: add             x0, x0, HEAP, lsl #32
    // 0x4340c8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4340cc: cmp             w0, w16
    // 0x4340d0: b.ne            #0x434128
    // 0x4340d4: r0 = Vector2()
    //     0x4340d4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x4340d8: r4 = 4
    //     0x4340d8: mov             x4, #4
    // 0x4340dc: stur            x0, [fp, #-0x10]
    // 0x4340e0: r0 = AllocateFloat32Array()
    //     0x4340e0: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x4340e4: ldur            x1, [fp, #-0x10]
    // 0x4340e8: StoreField: r1->field_7 = r0
    //     0x4340e8: stur            w0, [x1, #7]
    // 0x4340ec: d0 = 0.000000
    //     0x4340ec: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x4340f0: ldr             s0, [x17, #0x9a8]
    // 0x4340f4: StoreField: r0->field_1b = d0
    //     0x4340f4: stur            s0, [x0, #0x1b]
    // 0x4340f8: ArrayStore: r0[0] = d0  ; List_8
    //     0x4340f8: stur            s0, [x0, #0x17]
    // 0x4340fc: mov             x0, x1
    // 0x434100: ldur            x2, [fp, #-8]
    // 0x434104: StoreField: r2->field_13 = r0
    //     0x434104: stur            w0, [x2, #0x13]
    //     0x434108: ldurb           w16, [x2, #-1]
    //     0x43410c: ldurb           w17, [x0, #-1]
    //     0x434110: and             x16, x17, x16, lsr #2
    //     0x434114: tst             x16, HEAP, lsr #32
    //     0x434118: b.eq            #0x434120
    //     0x43411c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x434120: mov             x0, x1
    // 0x434124: b               #0x43412c
    // 0x434128: mov             x2, x1
    // 0x43412c: LoadField: r3 = r0->field_7
    //     0x43412c: ldur            w3, [x0, #7]
    // 0x434130: DecompressPointer r3
    //     0x434130: add             x3, x3, HEAP, lsl #32
    // 0x434134: LoadField: r0 = r3->field_13
    //     0x434134: ldur            w0, [x3, #0x13]
    // 0x434138: r1 = LoadInt32Instr(r0)
    //     0x434138: sbfx            x1, x0, #1, #0x1f
    // 0x43413c: mov             x0, x1
    // 0x434140: r1 = 0
    //     0x434140: mov             x1, #0
    // 0x434144: cmp             x1, x0
    // 0x434148: b.hs            #0x434224
    // 0x43414c: ArrayLoad: d0 = r3[0]  ; List_8
    //     0x43414c: ldur            s0, [x3, #0x17]
    // 0x434150: stur            d0, [fp, #-0x18]
    // 0x434154: LoadField: r0 = r2->field_1b
    //     0x434154: ldur            w0, [x2, #0x1b]
    // 0x434158: DecompressPointer r0
    //     0x434158: add             x0, x0, HEAP, lsl #32
    // 0x43415c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x434160: cmp             w0, w16
    // 0x434164: b.ne            #0x4341c0
    // 0x434168: r0 = Vector2()
    //     0x434168: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x43416c: r4 = 4
    //     0x43416c: mov             x4, #4
    // 0x434170: stur            x0, [fp, #-0x10]
    // 0x434174: r0 = AllocateFloat32Array()
    //     0x434174: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434178: ldur            x1, [fp, #-0x10]
    // 0x43417c: StoreField: r1->field_7 = r0
    //     0x43417c: stur            w0, [x1, #7]
    // 0x434180: d0 = 0.000000
    //     0x434180: add             x17, PP, #0xd, lsl #12  ; [pp+0xd430] IMM: 0x43535555
    //     0x434184: ldr             s0, [x17, #0x430]
    // 0x434188: StoreField: r0->field_1b = d0
    //     0x434188: stur            s0, [x0, #0x1b]
    // 0x43418c: d0 = 0.000000
    //     0x43418c: add             x17, PP, #0xd, lsl #12  ; [pp+0xd438] IMM: 0x42fc0000
    //     0x434190: ldr             s0, [x17, #0x438]
    // 0x434194: ArrayStore: r0[0] = d0  ; List_8
    //     0x434194: stur            s0, [x0, #0x17]
    // 0x434198: mov             x0, x1
    // 0x43419c: ldur            x2, [fp, #-8]
    // 0x4341a0: StoreField: r2->field_1b = r0
    //     0x4341a0: stur            w0, [x2, #0x1b]
    //     0x4341a4: ldurb           w16, [x2, #-1]
    //     0x4341a8: ldurb           w17, [x0, #-1]
    //     0x4341ac: and             x16, x17, x16, lsr #2
    //     0x4341b0: tst             x16, HEAP, lsr #32
    //     0x4341b4: b.eq            #0x4341bc
    //     0x4341b8: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x4341bc: mov             x0, x1
    // 0x4341c0: ldur            d0, [fp, #-0x18]
    // 0x4341c4: LoadField: r2 = r0->field_7
    //     0x4341c4: ldur            w2, [x0, #7]
    // 0x4341c8: DecompressPointer r2
    //     0x4341c8: add             x2, x2, HEAP, lsl #32
    // 0x4341cc: LoadField: r0 = r2->field_13
    //     0x4341cc: ldur            w0, [x2, #0x13]
    // 0x4341d0: r1 = LoadInt32Instr(r0)
    //     0x4341d0: sbfx            x1, x0, #1, #0x1f
    // 0x4341d4: mov             x0, x1
    // 0x4341d8: r1 = 1
    //     0x4341d8: mov             x1, #1
    // 0x4341dc: cmp             x1, x0
    // 0x4341e0: b.hs            #0x434228
    // 0x4341e4: LoadField: d1 = r2->field_1b
    //     0x4341e4: ldur            s1, [x2, #0x1b]
    // 0x4341e8: stur            d1, [fp, #-0x20]
    // 0x4341ec: r0 = Vector2()
    //     0x4341ec: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x4341f0: r4 = 4
    //     0x4341f0: mov             x4, #4
    // 0x4341f4: stur            x0, [fp, #-8]
    // 0x4341f8: r0 = AllocateFloat32Array()
    //     0x4341f8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x4341fc: mov             x1, x0
    // 0x434200: ldur            x0, [fp, #-8]
    // 0x434204: StoreField: r0->field_7 = r1
    //     0x434204: stur            w1, [x0, #7]
    // 0x434208: ldur            d0, [fp, #-0x20]
    // 0x43420c: StoreField: r1->field_1b = d0
    //     0x43420c: stur            s0, [x1, #0x1b]
    // 0x434210: ldur            d0, [fp, #-0x18]
    // 0x434214: ArrayStore: r1[0] = d0  ; List_8
    //     0x434214: stur            s0, [x1, #0x17]
    // 0x434218: LeaveFrame
    //     0x434218: mov             SP, fp
    //     0x43421c: ldp             fp, lr, [SP], #0x10
    // 0x434220: ret
    //     0x434220: ret             
    // 0x434224: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x434224: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x434228: r0 = RangeErrorSharedWithFPURegs()
    //     0x434228: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  [closure] static Vector2 #topRight#initializer(dynamic) {
    // ** addr: 0x43422c, size: 0x188
    // 0x43422c: EnterFrame
    //     0x43422c: stp             fp, lr, [SP, #-0x10]!
    //     0x434230: mov             fp, SP
    // 0x434234: AllocStack(0x20)
    //     0x434234: sub             SP, SP, #0x20
    // 0x434238: SetupParameters([dynamic _ /* r0 */])
    //     0x434238: ldr             x0, [fp, #0x10]
    //     0x43423c: ldur            w1, [x0, #0x17]
    //     0x434240: add             x1, x1, HEAP, lsl #32
    //     0x434244: stur            x1, [fp, #-8]
    // 0x434248: LoadField: r0 = r1->field_1b
    //     0x434248: ldur            w0, [x1, #0x1b]
    // 0x43424c: DecompressPointer r0
    //     0x43424c: add             x0, x0, HEAP, lsl #32
    // 0x434250: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x434254: cmp             w0, w16
    // 0x434258: b.ne            #0x4342b8
    // 0x43425c: r0 = Vector2()
    //     0x43425c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434260: r4 = 4
    //     0x434260: mov             x4, #4
    // 0x434264: stur            x0, [fp, #-0x10]
    // 0x434268: r0 = AllocateFloat32Array()
    //     0x434268: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x43426c: ldur            x1, [fp, #-0x10]
    // 0x434270: StoreField: r1->field_7 = r0
    //     0x434270: stur            w0, [x1, #7]
    // 0x434274: d0 = 0.000000
    //     0x434274: add             x17, PP, #0xd, lsl #12  ; [pp+0xd430] IMM: 0x43535555
    //     0x434278: ldr             s0, [x17, #0x430]
    // 0x43427c: StoreField: r0->field_1b = d0
    //     0x43427c: stur            s0, [x0, #0x1b]
    // 0x434280: d0 = 0.000000
    //     0x434280: add             x17, PP, #0xd, lsl #12  ; [pp+0xd438] IMM: 0x42fc0000
    //     0x434284: ldr             s0, [x17, #0x438]
    // 0x434288: ArrayStore: r0[0] = d0  ; List_8
    //     0x434288: stur            s0, [x0, #0x17]
    // 0x43428c: mov             x0, x1
    // 0x434290: ldur            x2, [fp, #-8]
    // 0x434294: StoreField: r2->field_1b = r0
    //     0x434294: stur            w0, [x2, #0x1b]
    //     0x434298: ldurb           w16, [x2, #-1]
    //     0x43429c: ldurb           w17, [x0, #-1]
    //     0x4342a0: and             x16, x17, x16, lsr #2
    //     0x4342a4: tst             x16, HEAP, lsr #32
    //     0x4342a8: b.eq            #0x4342b0
    //     0x4342ac: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x4342b0: mov             x0, x1
    // 0x4342b4: b               #0x4342bc
    // 0x4342b8: mov             x2, x1
    // 0x4342bc: LoadField: r3 = r0->field_7
    //     0x4342bc: ldur            w3, [x0, #7]
    // 0x4342c0: DecompressPointer r3
    //     0x4342c0: add             x3, x3, HEAP, lsl #32
    // 0x4342c4: LoadField: r0 = r3->field_13
    //     0x4342c4: ldur            w0, [x3, #0x13]
    // 0x4342c8: r1 = LoadInt32Instr(r0)
    //     0x4342c8: sbfx            x1, x0, #1, #0x1f
    // 0x4342cc: mov             x0, x1
    // 0x4342d0: r1 = 0
    //     0x4342d0: mov             x1, #0
    // 0x4342d4: cmp             x1, x0
    // 0x4342d8: b.hs            #0x4343ac
    // 0x4342dc: ArrayLoad: d0 = r3[0]  ; List_8
    //     0x4342dc: ldur            s0, [x3, #0x17]
    // 0x4342e0: stur            d0, [fp, #-0x18]
    // 0x4342e4: LoadField: r0 = r2->field_13
    //     0x4342e4: ldur            w0, [x2, #0x13]
    // 0x4342e8: DecompressPointer r0
    //     0x4342e8: add             x0, x0, HEAP, lsl #32
    // 0x4342ec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4342f0: cmp             w0, w16
    // 0x4342f4: b.ne            #0x434348
    // 0x4342f8: r0 = Vector2()
    //     0x4342f8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x4342fc: r4 = 4
    //     0x4342fc: mov             x4, #4
    // 0x434300: stur            x0, [fp, #-0x10]
    // 0x434304: r0 = AllocateFloat32Array()
    //     0x434304: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434308: ldur            x1, [fp, #-0x10]
    // 0x43430c: StoreField: r1->field_7 = r0
    //     0x43430c: stur            w0, [x1, #7]
    // 0x434310: d0 = 0.000000
    //     0x434310: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x434314: ldr             s0, [x17, #0x9a8]
    // 0x434318: StoreField: r0->field_1b = d0
    //     0x434318: stur            s0, [x0, #0x1b]
    // 0x43431c: ArrayStore: r0[0] = d0  ; List_8
    //     0x43431c: stur            s0, [x0, #0x17]
    // 0x434320: mov             x0, x1
    // 0x434324: ldur            x2, [fp, #-8]
    // 0x434328: StoreField: r2->field_13 = r0
    //     0x434328: stur            w0, [x2, #0x13]
    //     0x43432c: ldurb           w16, [x2, #-1]
    //     0x434330: ldurb           w17, [x0, #-1]
    //     0x434334: and             x16, x17, x16, lsr #2
    //     0x434338: tst             x16, HEAP, lsr #32
    //     0x43433c: b.eq            #0x434344
    //     0x434340: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x434344: mov             x0, x1
    // 0x434348: ldur            d0, [fp, #-0x18]
    // 0x43434c: LoadField: r2 = r0->field_7
    //     0x43434c: ldur            w2, [x0, #7]
    // 0x434350: DecompressPointer r2
    //     0x434350: add             x2, x2, HEAP, lsl #32
    // 0x434354: LoadField: r0 = r2->field_13
    //     0x434354: ldur            w0, [x2, #0x13]
    // 0x434358: r1 = LoadInt32Instr(r0)
    //     0x434358: sbfx            x1, x0, #1, #0x1f
    // 0x43435c: mov             x0, x1
    // 0x434360: r1 = 1
    //     0x434360: mov             x1, #1
    // 0x434364: cmp             x1, x0
    // 0x434368: b.hs            #0x4343b0
    // 0x43436c: LoadField: d1 = r2->field_1b
    //     0x43436c: ldur            s1, [x2, #0x1b]
    // 0x434370: stur            d1, [fp, #-0x20]
    // 0x434374: r0 = Vector2()
    //     0x434374: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434378: r4 = 4
    //     0x434378: mov             x4, #4
    // 0x43437c: stur            x0, [fp, #-8]
    // 0x434380: r0 = AllocateFloat32Array()
    //     0x434380: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434384: mov             x1, x0
    // 0x434388: ldur            x0, [fp, #-8]
    // 0x43438c: StoreField: r0->field_7 = r1
    //     0x43438c: stur            w1, [x0, #7]
    // 0x434390: ldur            d0, [fp, #-0x20]
    // 0x434394: StoreField: r1->field_1b = d0
    //     0x434394: stur            s0, [x1, #0x1b]
    // 0x434398: ldur            d0, [fp, #-0x18]
    // 0x43439c: ArrayStore: r1[0] = d0  ; List_8
    //     0x43439c: stur            s0, [x1, #0x17]
    // 0x4343a0: LeaveFrame
    //     0x4343a0: mov             SP, fp
    //     0x4343a4: ldp             fp, lr, [SP], #0x10
    // 0x4343a8: ret
    //     0x4343a8: ret             
    // 0x4343ac: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x4343ac: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x4343b0: r0 = RangeErrorSharedWithFPURegs()
    //     0x4343b0: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  [closure] static Vector2 #bottomRight#initializer(dynamic) {
    // ** addr: 0x4343b4, size: 0x4c
    // 0x4343b4: EnterFrame
    //     0x4343b4: stp             fp, lr, [SP, #-0x10]!
    //     0x4343b8: mov             fp, SP
    // 0x4343bc: AllocStack(0x8)
    //     0x4343bc: sub             SP, SP, #8
    // 0x4343c0: r0 = Vector2()
    //     0x4343c0: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x4343c4: r4 = 4
    //     0x4343c4: mov             x4, #4
    // 0x4343c8: stur            x0, [fp, #-8]
    // 0x4343cc: r0 = AllocateFloat32Array()
    //     0x4343cc: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x4343d0: mov             x1, x0
    // 0x4343d4: ldur            x0, [fp, #-8]
    // 0x4343d8: StoreField: r0->field_7 = r1
    //     0x4343d8: stur            w1, [x0, #7]
    // 0x4343dc: d0 = 0.000000
    //     0x4343dc: add             x17, PP, #0xd, lsl #12  ; [pp+0xd430] IMM: 0x43535555
    //     0x4343e0: ldr             s0, [x17, #0x430]
    // 0x4343e4: StoreField: r1->field_1b = d0
    //     0x4343e4: stur            s0, [x1, #0x1b]
    // 0x4343e8: d0 = 0.000000
    //     0x4343e8: add             x17, PP, #0xd, lsl #12  ; [pp+0xd438] IMM: 0x42fc0000
    //     0x4343ec: ldr             s0, [x17, #0x438]
    // 0x4343f0: ArrayStore: r1[0] = d0  ; List_8
    //     0x4343f0: stur            s0, [x1, #0x17]
    // 0x4343f4: LeaveFrame
    //     0x4343f4: mov             SP, fp
    //     0x4343f8: ldp             fp, lr, [SP], #0x10
    // 0x4343fc: ret
    //     0x4343fc: ret             
  }
  [closure] static Vector2 #topLeft#initializer(dynamic) {
    // ** addr: 0x434400, size: 0x44
    // 0x434400: EnterFrame
    //     0x434400: stp             fp, lr, [SP, #-0x10]!
    //     0x434404: mov             fp, SP
    // 0x434408: AllocStack(0x8)
    //     0x434408: sub             SP, SP, #8
    // 0x43440c: r0 = Vector2()
    //     0x43440c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434410: r4 = 4
    //     0x434410: mov             x4, #4
    // 0x434414: stur            x0, [fp, #-8]
    // 0x434418: r0 = AllocateFloat32Array()
    //     0x434418: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x43441c: mov             x1, x0
    // 0x434420: ldur            x0, [fp, #-8]
    // 0x434424: StoreField: r0->field_7 = r1
    //     0x434424: stur            w1, [x0, #7]
    // 0x434428: d0 = 0.000000
    //     0x434428: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x43442c: ldr             s0, [x17, #0x9a8]
    // 0x434430: StoreField: r1->field_1b = d0
    //     0x434430: stur            s0, [x1, #0x1b]
    // 0x434434: ArrayStore: r1[0] = d0  ; List_8
    //     0x434434: stur            s0, [x1, #0x17]
    // 0x434438: LeaveFrame
    //     0x434438: mov             SP, fp
    //     0x43443c: ldp             fp, lr, [SP], #0x10
    // 0x434440: ret
    //     0x434440: ret             
  }
}

// class id: 1888, size: 0x70, field offset: 0x68
class Wall extends BodyComponent<dynamic> {

  _ createBody(/* No info */) {
    // ** addr: 0x547c8c, size: 0xf0
    // 0x547c8c: EnterFrame
    //     0x547c8c: stp             fp, lr, [SP, #-0x10]!
    //     0x547c90: mov             fp, SP
    // 0x547c94: AllocStack(0x28)
    //     0x547c94: sub             SP, SP, #0x28
    // 0x547c98: SetupParameters(Wall this /* r1 => r1, fp-0x8 */)
    //     0x547c98: stur            x1, [fp, #-8]
    // 0x547c9c: CheckStackOverflow
    //     0x547c9c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x547ca0: cmp             SP, x16
    //     0x547ca4: b.ls            #0x547d68
    // 0x547ca8: r0 = EdgeShape()
    //     0x547ca8: bl              #0x547fc0  ; AllocateEdgeShapeStub -> EdgeShape (size=0x2c)
    // 0x547cac: mov             x1, x0
    // 0x547cb0: stur            x0, [fp, #-0x10]
    // 0x547cb4: r0 = EdgeShape()
    //     0x547cb4: bl              #0x547e54  ; [package:forge2d/src/collision/shapes/edge_shape.dart] EdgeShape::EdgeShape
    // 0x547cb8: ldur            x0, [fp, #-8]
    // 0x547cbc: LoadField: r2 = r0->field_67
    //     0x547cbc: ldur            w2, [x0, #0x67]
    // 0x547cc0: DecompressPointer r2
    //     0x547cc0: add             x2, x2, HEAP, lsl #32
    // 0x547cc4: LoadField: r3 = r0->field_6b
    //     0x547cc4: ldur            w3, [x0, #0x6b]
    // 0x547cc8: DecompressPointer r3
    //     0x547cc8: add             x3, x3, HEAP, lsl #32
    // 0x547ccc: ldur            x1, [fp, #-0x10]
    // 0x547cd0: r0 = set()
    //     0x547cd0: bl              #0x547d7c  ; [package:forge2d/src/collision/shapes/edge_shape.dart] EdgeShape::set
    // 0x547cd4: r0 = FixtureDef()
    //     0x547cd4: bl              #0x3739d0  ; AllocateFixtureDefStub -> FixtureDef (size=0x30)
    // 0x547cd8: mov             x1, x0
    // 0x547cdc: ldur            x2, [fp, #-0x10]
    // 0x547ce0: stur            x0, [fp, #-0x10]
    // 0x547ce4: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x547ce4: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x547ce8: r0 = FixtureDef()
    //     0x547ce8: bl              #0x3737f0  ; [package:forge2d/src/dynamics/fixture_def.dart] FixtureDef::FixtureDef
    // 0x547cec: r0 = Vector2()
    //     0x547cec: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x547cf0: r4 = 4
    //     0x547cf0: mov             x4, #4
    // 0x547cf4: stur            x0, [fp, #-0x18]
    // 0x547cf8: r0 = AllocateFloat32Array()
    //     0x547cf8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x547cfc: ldur            x2, [fp, #-0x18]
    // 0x547d00: StoreField: r2->field_7 = r0
    //     0x547d00: stur            w0, [x2, #7]
    // 0x547d04: r0 = BodyDef()
    //     0x547d04: bl              #0x374bec  ; AllocateBodyDefStub -> BodyDef (size=0x54)
    // 0x547d08: stur            x0, [fp, #-0x20]
    // 0x547d0c: ldur            x16, [fp, #-8]
    // 0x547d10: str             x16, [SP]
    // 0x547d14: mov             x1, x0
    // 0x547d18: ldur            x2, [fp, #-0x18]
    // 0x547d1c: r4 = const [0, 0x3, 0x1, 0x2, userData, 0x2, null]
    //     0x547d1c: add             x4, PP, #0xd, lsl #12  ; [pp+0xd298] List(7) [0, 0x3, 0x1, 0x2, "userData", 0x2, Null]
    //     0x547d20: ldr             x4, [x4, #0x298]
    // 0x547d24: r0 = BodyDef()
    //     0x547d24: bl              #0x37493c  ; [package:forge2d/src/dynamics/body_def.dart] BodyDef::BodyDef
    // 0x547d28: ldur            x0, [fp, #-8]
    // 0x547d2c: LoadField: r1 = r0->field_53
    //     0x547d2c: ldur            w1, [x0, #0x53]
    // 0x547d30: DecompressPointer r1
    //     0x547d30: add             x1, x1, HEAP, lsl #32
    // 0x547d34: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x547d38: cmp             w1, w16
    // 0x547d3c: b.eq            #0x547d70
    // 0x547d40: ldur            x2, [fp, #-0x20]
    // 0x547d44: r0 = createBody()
    //     0x547d44: bl              #0x5471f4  ; [package:flame_forge2d/forge2d_world.dart] Forge2DWorld::createBody
    // 0x547d48: mov             x1, x0
    // 0x547d4c: ldur            x2, [fp, #-0x10]
    // 0x547d50: stur            x0, [fp, #-8]
    // 0x547d54: r0 = createFixture()
    //     0x547d54: bl              #0x546730  ; [package:forge2d/src/dynamics/body.dart] Body::createFixture
    // 0x547d58: ldur            x0, [fp, #-8]
    // 0x547d5c: LeaveFrame
    //     0x547d5c: mov             SP, fp
    //     0x547d60: ldp             fp, lr, [SP], #0x10
    // 0x547d64: ret
    //     0x547d64: ret             
    // 0x547d68: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x547d68: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x547d6c: b               #0x547ca8
    // 0x547d70: r9 = world
    //     0x547d70: add             x9, PP, #0xd, lsl #12  ; [pp+0xd380] Field <BodyComponent.world>: late (offset: 0x54)
    //     0x547d74: ldr             x9, [x9, #0x380]
    // 0x547d78: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x547d78: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
  }
}
