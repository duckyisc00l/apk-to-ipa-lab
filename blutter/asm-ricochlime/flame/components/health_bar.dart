// lib: , url: package:ricochlime/flame/components/health_bar.dart

// class id: 1049305, size: 0x8
class :: {
}

// class id: 1894, size: 0x5c, field offset: 0x48
class HealthBar extends PositionComponent {

  _ HealthBar(/* No info */) {
    // ** addr: 0x374db0, size: 0xcc
    // 0x374db0: EnterFrame
    //     0x374db0: stp             fp, lr, [SP, #-0x10]!
    //     0x374db4: mov             fp, SP
    // 0x374db8: AllocStack(0x18)
    //     0x374db8: sub             SP, SP, #0x18
    // 0x374dbc: SetupParameters(HealthBar this /* r1 => r1, fp-0x8 */, dynamic _ /* r5 => r0 */)
    //     0x374dbc: mov             x0, x5
    //     0x374dc0: stur            x1, [fp, #-8]
    // 0x374dc4: CheckStackOverflow
    //     0x374dc4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x374dc8: cmp             SP, x16
    //     0x374dcc: b.ls            #0x374e74
    // 0x374dd0: StoreField: r1->field_47 = r3
    //     0x374dd0: stur            x3, [x1, #0x47]
    // 0x374dd4: StoreField: r1->field_4f = r2
    //     0x374dd4: stur            x2, [x1, #0x4f]
    // 0x374dd8: StoreField: r1->field_57 = r0
    //     0x374dd8: stur            w0, [x1, #0x57]
    //     0x374ddc: ldurb           w16, [x1, #-1]
    //     0x374de0: ldurb           w17, [x0, #-1]
    //     0x374de4: and             x16, x17, x16, lsr #2
    //     0x374de8: tst             x16, HEAP, lsr #32
    //     0x374dec: b.eq            #0x374df4
    //     0x374df0: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x374df4: r0 = Vector2()
    //     0x374df4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x374df8: r4 = 4
    //     0x374df8: mov             x4, #4
    // 0x374dfc: stur            x0, [fp, #-0x10]
    // 0x374e00: r0 = AllocateFloat32Array()
    //     0x374e00: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x374e04: ldur            x3, [fp, #-0x10]
    // 0x374e08: StoreField: r3->field_7 = r0
    //     0x374e08: stur            w0, [x3, #7]
    // 0x374e0c: StoreField: r0->field_1b = rZR
    //     0x374e0c: stur            wzr, [x0, #0x1b]
    // 0x374e10: d0 = 0.000000
    //     0x374e10: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x374e14: ldr             s0, [x17, #0x9a8]
    // 0x374e18: ArrayStore: r0[0] = d0  ; List_8
    //     0x374e18: stur            s0, [x0, #0x17]
    // 0x374e1c: r0 = Vector2()
    //     0x374e1c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x374e20: r4 = 4
    //     0x374e20: mov             x4, #4
    // 0x374e24: stur            x0, [fp, #-0x18]
    // 0x374e28: r0 = AllocateFloat32Array()
    //     0x374e28: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x374e2c: ldur            x6, [fp, #-0x18]
    // 0x374e30: StoreField: r6->field_7 = r0
    //     0x374e30: stur            w0, [x6, #7]
    // 0x374e34: d0 = 0.000000
    //     0x374e34: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x374e38: ldr             s0, [x17, #0x9a8]
    // 0x374e3c: StoreField: r0->field_1b = d0
    //     0x374e3c: stur            s0, [x0, #0x1b]
    // 0x374e40: d0 = 0.000000
    //     0x374e40: add             x17, PP, #8, lsl #12  ; [pp+0x8cb8] IMM: 0x41400000
    //     0x374e44: ldr             s0, [x17, #0xcb8]
    // 0x374e48: ArrayStore: r0[0] = d0  ; List_8
    //     0x374e48: stur            s0, [x0, #0x17]
    // 0x374e4c: ldur            x1, [fp, #-8]
    // 0x374e50: ldur            x3, [fp, #-0x10]
    // 0x374e54: r2 = Instance_Anchor
    //     0x374e54: add             x2, PP, #8, lsl #12  ; [pp+0x8bd0] Obj!Anchor@5cce71
    //     0x374e58: ldr             x2, [x2, #0xbd0]
    // 0x374e5c: r5 = 2
    //     0x374e5c: mov             x5, #2
    // 0x374e60: r0 = PositionComponent()
    //     0x374e60: bl              #0x372c44  ; [package:flame/src/components/position_component.dart] PositionComponent::PositionComponent
    // 0x374e64: r0 = Null
    //     0x374e64: mov             x0, NULL
    // 0x374e68: LeaveFrame
    //     0x374e68: mov             SP, fp
    //     0x374e6c: ldp             fp, lr, [SP], #0x10
    // 0x374e70: ret
    //     0x374e70: ret             
    // 0x374e74: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x374e74: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x374e78: b               #0x374dd0
  }
  _ render(/* No info */) {
    // ** addr: 0x3c9ca4, size: 0xd8
    // 0x3c9ca4: EnterFrame
    //     0x3c9ca4: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9ca8: mov             fp, SP
    // 0x3c9cac: AllocStack(0x30)
    //     0x3c9cac: sub             SP, SP, #0x30
    // 0x3c9cb0: SetupParameters(HealthBar this /* r1 => r0, fp-0x8 */, dynamic _ /* r2 => r1, fp-0x10 */)
    //     0x3c9cb0: mov             x0, x1
    //     0x3c9cb4: stur            x1, [fp, #-8]
    //     0x3c9cb8: mov             x1, x2
    //     0x3c9cbc: stur            x2, [fp, #-0x10]
    // 0x3c9cc0: CheckStackOverflow
    //     0x3c9cc0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c9cc4: cmp             SP, x16
    //     0x3c9cc8: b.ls            #0x3c9d74
    // 0x3c9ccc: r16 = 136
    //     0x3c9ccc: mov             x16, #0x88
    // 0x3c9cd0: stp             x16, NULL, [SP]
    // 0x3c9cd4: r0 = ByteData()
    //     0x3c9cd4: bl              #0x23e6cc  ; [dart:typed_data] ByteData::ByteData
    // 0x3c9cd8: stur            x0, [fp, #-0x18]
    // 0x3c9cdc: r0 = Paint()
    //     0x3c9cdc: bl              #0x28bc30  ; AllocatePaintStub -> Paint (size=0x10)
    // 0x3c9ce0: mov             x2, x0
    // 0x3c9ce4: ldur            x0, [fp, #-0x18]
    // 0x3c9ce8: stur            x2, [fp, #-0x20]
    // 0x3c9cec: StoreField: r2->field_7 = r0
    //     0x3c9cec: stur            w0, [x2, #7]
    // 0x3c9cf0: ldur            x0, [fp, #-8]
    // 0x3c9cf4: LoadField: r1 = r0->field_57
    //     0x3c9cf4: ldur            w1, [x0, #0x57]
    // 0x3c9cf8: DecompressPointer r1
    //     0x3c9cf8: add             x1, x1, HEAP, lsl #32
    // 0x3c9cfc: r0 = colorFilter()
    //     0x3c9cfc: bl              #0x3c9f00  ; [dart:ui] Paint::colorFilter
    // 0x3c9d00: ldur            x1, [fp, #-0x20]
    // 0x3c9d04: mov             x2, x0
    // 0x3c9d08: r0 = colorFilter=()
    //     0x3c9d08: bl              #0x3badfc  ; [dart:ui] Paint::colorFilter=
    // 0x3c9d0c: ldur            x1, [fp, #-8]
    // 0x3c9d10: r0 = backgroundRect()
    //     0x3c9d10: bl              #0x3c9e40  ; [package:ricochlime/flame/components/health_bar.dart] HealthBar::backgroundRect
    // 0x3c9d14: ldur            x1, [fp, #-0x20]
    // 0x3c9d18: r2 = Instance_Color
    //     0x3c9d18: add             x2, PP, #8, lsl #12  ; [pp+0x8d00] Obj!Color@5ce6e1
    //     0x3c9d1c: ldr             x2, [x2, #0xd00]
    // 0x3c9d20: stur            x0, [fp, #-0x18]
    // 0x3c9d24: r0 = color=()
    //     0x3c9d24: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x3c9d28: ldur            x1, [fp, #-0x10]
    // 0x3c9d2c: ldur            x2, [fp, #-0x18]
    // 0x3c9d30: ldur            x3, [fp, #-0x20]
    // 0x3c9d34: r0 = drawRect()
    //     0x3c9d34: bl              #0x2e2fa4  ; [dart:ui] _NativeCanvas::drawRect
    // 0x3c9d38: ldur            x1, [fp, #-8]
    // 0x3c9d3c: r0 = foregroundRect()
    //     0x3c9d3c: bl              #0x3c9d7c  ; [package:ricochlime/flame/components/health_bar.dart] HealthBar::foregroundRect
    // 0x3c9d40: ldur            x1, [fp, #-0x20]
    // 0x3c9d44: r2 = Instance_Color
    //     0x3c9d44: add             x2, PP, #0xd, lsl #12  ; [pp+0xd270] Obj!Color@5cf791
    //     0x3c9d48: ldr             x2, [x2, #0x270]
    // 0x3c9d4c: stur            x0, [fp, #-8]
    // 0x3c9d50: r0 = color=()
    //     0x3c9d50: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x3c9d54: ldur            x1, [fp, #-0x10]
    // 0x3c9d58: ldur            x2, [fp, #-8]
    // 0x3c9d5c: ldur            x3, [fp, #-0x20]
    // 0x3c9d60: r0 = drawRect()
    //     0x3c9d60: bl              #0x2e2fa4  ; [dart:ui] _NativeCanvas::drawRect
    // 0x3c9d64: r0 = Null
    //     0x3c9d64: mov             x0, NULL
    // 0x3c9d68: LeaveFrame
    //     0x3c9d68: mov             SP, fp
    //     0x3c9d6c: ldp             fp, lr, [SP], #0x10
    // 0x3c9d70: ret
    //     0x3c9d70: ret             
    // 0x3c9d74: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c9d74: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c9d78: b               #0x3c9ccc
  }
  get _ foregroundRect(/* No info */) {
    // ** addr: 0x3c9d7c, size: 0xc4
    // 0x3c9d7c: EnterFrame
    //     0x3c9d7c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9d80: mov             fp, SP
    // 0x3c9d84: AllocStack(0x10)
    //     0x3c9d84: sub             SP, SP, #0x10
    // 0x3c9d88: d1 = 1.000000
    //     0x3c9d88: fmov            d1, #1.00000000
    // 0x3c9d8c: d0 = 0.500000
    //     0x3c9d8c: fmov            d0, #0.50000000
    // 0x3c9d90: mov             x2, x1
    // 0x3c9d94: LoadField: r0 = r2->field_3b
    //     0x3c9d94: ldur            w0, [x2, #0x3b]
    // 0x3c9d98: DecompressPointer r0
    //     0x3c9d98: add             x0, x0, HEAP, lsl #32
    // 0x3c9d9c: LoadField: r3 = r0->field_7
    //     0x3c9d9c: ldur            w3, [x0, #7]
    // 0x3c9da0: DecompressPointer r3
    //     0x3c9da0: add             x3, x3, HEAP, lsl #32
    // 0x3c9da4: LoadField: r0 = r3->field_13
    //     0x3c9da4: ldur            w0, [x3, #0x13]
    // 0x3c9da8: r4 = LoadInt32Instr(r0)
    //     0x3c9da8: sbfx            x4, x0, #1, #0x1f
    // 0x3c9dac: mov             x0, x4
    // 0x3c9db0: r1 = 0
    //     0x3c9db0: mov             x1, #0
    // 0x3c9db4: cmp             x1, x0
    // 0x3c9db8: b.hs            #0x3c9e38
    // 0x3c9dbc: ArrayLoad: d2 = r3[0]  ; List_8
    //     0x3c9dbc: ldur            s2, [x3, #0x17]
    // 0x3c9dc0: fcvt            d3, s2
    // 0x3c9dc4: fsub            d2, d3, d1
    // 0x3c9dc8: LoadField: r0 = r2->field_4f
    //     0x3c9dc8: ldur            x0, [x2, #0x4f]
    // 0x3c9dcc: scvtf           d3, x0
    // 0x3c9dd0: fmul            d4, d2, d3
    // 0x3c9dd4: LoadField: r0 = r2->field_47
    //     0x3c9dd4: ldur            x0, [x2, #0x47]
    // 0x3c9dd8: scvtf           d2, x0
    // 0x3c9ddc: fdiv            d3, d4, d2
    // 0x3c9de0: mov             x0, x4
    // 0x3c9de4: r1 = 1
    //     0x3c9de4: mov             x1, #1
    // 0x3c9de8: cmp             x1, x0
    // 0x3c9dec: b.hs            #0x3c9e3c
    // 0x3c9df0: LoadField: d2 = r3->field_1b
    //     0x3c9df0: ldur            s2, [x3, #0x1b]
    // 0x3c9df4: fcvt            d4, s2
    // 0x3c9df8: fsub            d2, d4, d1
    // 0x3c9dfc: fadd            d1, d3, d0
    // 0x3c9e00: stur            d1, [fp, #-0x10]
    // 0x3c9e04: fadd            d3, d2, d0
    // 0x3c9e08: stur            d3, [fp, #-8]
    // 0x3c9e0c: r0 = Rect()
    //     0x3c9e0c: bl              #0x23d854  ; AllocateRectStub -> Rect (size=0x28)
    // 0x3c9e10: d0 = 0.500000
    //     0x3c9e10: fmov            d0, #0.50000000
    // 0x3c9e14: StoreField: r0->field_7 = d0
    //     0x3c9e14: stur            d0, [x0, #7]
    // 0x3c9e18: StoreField: r0->field_f = d0
    //     0x3c9e18: stur            d0, [x0, #0xf]
    // 0x3c9e1c: ldur            d0, [fp, #-0x10]
    // 0x3c9e20: ArrayStore: r0[0] = d0  ; List_8
    //     0x3c9e20: stur            d0, [x0, #0x17]
    // 0x3c9e24: ldur            d0, [fp, #-8]
    // 0x3c9e28: StoreField: r0->field_1f = d0
    //     0x3c9e28: stur            d0, [x0, #0x1f]
    // 0x3c9e2c: LeaveFrame
    //     0x3c9e2c: mov             SP, fp
    //     0x3c9e30: ldp             fp, lr, [SP], #0x10
    // 0x3c9e34: ret
    //     0x3c9e34: ret             
    // 0x3c9e38: r0 = RangeErrorSharedWithFPURegs()
    //     0x3c9e38: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x3c9e3c: r0 = RangeErrorSharedWithFPURegs()
    //     0x3c9e3c: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  get _ backgroundRect(/* No info */) {
    // ** addr: 0x3c9e40, size: 0x44
    // 0x3c9e40: EnterFrame
    //     0x3c9e40: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9e44: mov             fp, SP
    // 0x3c9e48: CheckStackOverflow
    //     0x3c9e48: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c9e4c: cmp             SP, x16
    //     0x3c9e50: b.ls            #0x3c9e7c
    // 0x3c9e54: LoadField: r0 = r1->field_3b
    //     0x3c9e54: ldur            w0, [x1, #0x3b]
    // 0x3c9e58: DecompressPointer r0
    //     0x3c9e58: add             x0, x0, HEAP, lsl #32
    // 0x3c9e5c: mov             x1, x0
    // 0x3c9e60: r0 = Vector2Extension.toSize()
    //     0x3c9e60: bl              #0x3c9e84  ; [package:flame/src/extensions/vector2.dart] ::Vector2Extension.toSize
    // 0x3c9e64: mov             x2, x0
    // 0x3c9e68: r1 = Instance_Offset
    //     0x3c9e68: ldr             x1, [PP, #0x45a0]  ; [pp+0x45a0] Obj!Offset@5d02e1
    // 0x3c9e6c: r0 = &()
    //     0x3c9e6c: bl              #0x2bf430  ; [dart:ui] Offset::&
    // 0x3c9e70: LeaveFrame
    //     0x3c9e70: mov             SP, fp
    //     0x3c9e74: ldp             fp, lr, [SP], #0x10
    // 0x3c9e78: ret
    //     0x3c9e78: ret             
    // 0x3c9e7c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c9e7c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c9e80: b               #0x3c9e54
  }
}
