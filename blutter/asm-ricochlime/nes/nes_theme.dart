// lib: , url: package:ricochlime/nes/nes_theme.dart

// class id: 1049321, size: 0x8
class :: {

  static _ nesThemeFrom(/* No info */) {
    // ** addr: 0x396af4, size: 0x520
    // 0x396af4: EnterFrame
    //     0x396af4: stp             fp, lr, [SP, #-0x10]!
    //     0x396af8: mov             fp, SP
    // 0x396afc: AllocStack(0x88)
    //     0x396afc: sub             SP, SP, #0x88
    // 0x396b00: SetupParameters(dynamic _ /* r1 => r0, fp-0x8 */, dynamic _ /* r2 => r2, fp-0x10 */)
    //     0x396b00: mov             x0, x1
    //     0x396b04: stur            x1, [fp, #-8]
    //     0x396b08: stur            x2, [fp, #-0x10]
    // 0x396b0c: CheckStackOverflow
    //     0x396b0c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x396b10: cmp             SP, x16
    //     0x396b14: b.ls            #0x39700c
    // 0x396b18: mov             x1, x0
    // 0x396b1c: r0 = _getTextTheme()
    //     0x396b1c: bl              #0x3b8f18  ; [package:ricochlime/nes/nes_theme.dart] ::_getTextTheme
    // 0x396b20: mov             x4, x0
    // 0x396b24: ldur            x0, [fp, #-0x10]
    // 0x396b28: stur            x4, [fp, #-0x28]
    // 0x396b2c: LoadField: r5 = r0->field_b
    //     0x396b2c: ldur            w5, [x0, #0xb]
    // 0x396b30: DecompressPointer r5
    //     0x396b30: add             x5, x5, HEAP, lsl #32
    // 0x396b34: stur            x5, [fp, #-0x20]
    // 0x396b38: LoadField: r6 = r0->field_7b
    //     0x396b38: ldur            w6, [x0, #0x7b]
    // 0x396b3c: DecompressPointer r6
    //     0x396b3c: add             x6, x6, HEAP, lsl #32
    // 0x396b40: mov             x1, x6
    // 0x396b44: mov             x2, x5
    // 0x396b48: stur            x6, [fp, #-0x18]
    // 0x396b4c: r3 = 0.300000
    //     0x396b4c: add             x3, PP, #9, lsl #12  ; [pp+0x91d0] 0.3
    //     0x396b50: ldr             x3, [x3, #0x1d0]
    // 0x396b54: r0 = lerp()
    //     0x396b54: bl              #0x3b8938  ; [dart:ui] Color::lerp
    // 0x396b58: mov             x2, x0
    // 0x396b5c: ldur            x0, [fp, #-0x10]
    // 0x396b60: stur            x2, [fp, #-0x60]
    // 0x396b64: LoadField: r1 = r0->field_4b
    //     0x396b64: ldur            w1, [x0, #0x4b]
    // 0x396b68: DecompressPointer r1
    //     0x396b68: add             x1, x1, HEAP, lsl #32
    // 0x396b6c: cmp             w1, NULL
    // 0x396b70: b.ne            #0x396b84
    // 0x396b74: LoadField: r1 = r0->field_2b
    //     0x396b74: ldur            w1, [x0, #0x2b]
    // 0x396b78: DecompressPointer r1
    //     0x396b78: add             x1, x1, HEAP, lsl #32
    // 0x396b7c: mov             x4, x1
    // 0x396b80: b               #0x396b88
    // 0x396b84: mov             x4, x1
    // 0x396b88: ldur            x3, [fp, #-8]
    // 0x396b8c: stur            x4, [fp, #-0x58]
    // 0x396b90: LoadField: r5 = r0->field_2b
    //     0x396b90: ldur            w5, [x0, #0x2b]
    // 0x396b94: DecompressPointer r5
    //     0x396b94: add             x5, x5, HEAP, lsl #32
    // 0x396b98: stur            x5, [fp, #-0x50]
    // 0x396b9c: LoadField: r6 = r0->field_6b
    //     0x396b9c: ldur            w6, [x0, #0x6b]
    // 0x396ba0: DecompressPointer r6
    //     0x396ba0: add             x6, x6, HEAP, lsl #32
    // 0x396ba4: stur            x6, [fp, #-0x48]
    // 0x396ba8: r16 = Instance_Brightness
    //     0x396ba8: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x396bac: cmp             w3, w16
    // 0x396bb0: b.ne            #0x396bc4
    // 0x396bb4: LoadField: r1 = r0->field_f
    //     0x396bb4: ldur            w1, [x0, #0xf]
    // 0x396bb8: DecompressPointer r1
    //     0x396bb8: add             x1, x1, HEAP, lsl #32
    // 0x396bbc: mov             x7, x1
    // 0x396bc0: b               #0x396bd0
    // 0x396bc4: LoadField: r1 = r0->field_7f
    //     0x396bc4: ldur            w1, [x0, #0x7f]
    // 0x396bc8: DecompressPointer r1
    //     0x396bc8: add             x1, x1, HEAP, lsl #32
    // 0x396bcc: mov             x7, x1
    // 0x396bd0: stur            x7, [fp, #-0x40]
    // 0x396bd4: r16 = Instance_Brightness
    //     0x396bd4: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x396bd8: cmp             w3, w16
    // 0x396bdc: b.ne            #0x396bf0
    // 0x396be0: LoadField: r1 = r0->field_7f
    //     0x396be0: ldur            w1, [x0, #0x7f]
    // 0x396be4: DecompressPointer r1
    //     0x396be4: add             x1, x1, HEAP, lsl #32
    // 0x396be8: mov             x8, x1
    // 0x396bec: b               #0x396bfc
    // 0x396bf0: LoadField: r1 = r0->field_f
    //     0x396bf0: ldur            w1, [x0, #0xf]
    // 0x396bf4: DecompressPointer r1
    //     0x396bf4: add             x1, x1, HEAP, lsl #32
    // 0x396bf8: mov             x8, x1
    // 0x396bfc: stur            x8, [fp, #-0x38]
    // 0x396c00: r16 = Instance_Brightness
    //     0x396c00: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x396c04: cmp             w3, w16
    // 0x396c08: b.ne            #0x396c6c
    // 0x396c0c: ldur            x9, [fp, #-0x20]
    // 0x396c10: LoadField: r10 = r0->field_f
    //     0x396c10: ldur            w10, [x0, #0xf]
    // 0x396c14: DecompressPointer r10
    //     0x396c14: add             x10, x10, HEAP, lsl #32
    // 0x396c18: stur            x10, [fp, #-0x30]
    // 0x396c1c: r1 = <NesIconTheme>
    //     0x396c1c: add             x1, PP, #9, lsl #12  ; [pp+0x91d8] TypeArguments: <NesIconTheme>
    //     0x396c20: ldr             x1, [x1, #0x1d8]
    // 0x396c24: r0 = NesIconTheme()
    //     0x396c24: bl              #0x3b892c  ; AllocateNesIconThemeStub -> NesIconTheme (size=0x24)
    // 0x396c28: mov             x1, x0
    // 0x396c2c: ldur            x0, [fp, #-0x30]
    // 0x396c30: StoreField: r1->field_13 = r0
    //     0x396c30: stur            w0, [x1, #0x13]
    // 0x396c34: ldur            x2, [fp, #-0x20]
    // 0x396c38: ArrayStore: r1[0] = r2  ; List_4
    //     0x396c38: stur            w2, [x1, #0x17]
    // 0x396c3c: ldur            x3, [fp, #-0x50]
    // 0x396c40: StoreField: r1->field_1b = r3
    //     0x396c40: stur            w3, [x1, #0x1b]
    // 0x396c44: r4 = Instance_MaterialColor
    //     0x396c44: add             x4, PP, #9, lsl #12  ; [pp+0x91e0] Obj!MaterialColor@5cfeb1
    //     0x396c48: ldr             x4, [x4, #0x1e0]
    // 0x396c4c: StoreField: r1->field_1f = r4
    //     0x396c4c: stur            w4, [x1, #0x1f]
    // 0x396c50: d0 = 32.000000
    //     0x396c50: add             x17, PP, #8, lsl #12  ; [pp+0x8700] IMM: double(32) from 0x4040000000000000
    //     0x396c54: ldr             d0, [x17, #0x700]
    // 0x396c58: StoreField: r1->field_b = d0
    //     0x396c58: stur            d0, [x1, #0xb]
    // 0x396c5c: mov             x2, x4
    // 0x396c60: mov             x4, x1
    // 0x396c64: mov             x0, x3
    // 0x396c68: b               #0x396d0c
    // 0x396c6c: mov             x3, x5
    // 0x396c70: mov             x5, x0
    // 0x396c74: ldur            x2, [fp, #-0x20]
    // 0x396c78: ldur            x6, [fp, #-0x18]
    // 0x396c7c: r4 = Instance_MaterialColor
    //     0x396c7c: add             x4, PP, #9, lsl #12  ; [pp+0x91e0] Obj!MaterialColor@5cfeb1
    //     0x396c80: ldr             x4, [x4, #0x1e0]
    // 0x396c84: d0 = 32.000000
    //     0x396c84: add             x17, PP, #8, lsl #12  ; [pp+0x8700] IMM: double(32) from 0x4040000000000000
    //     0x396c88: ldr             d0, [x17, #0x700]
    // 0x396c8c: LoadField: r7 = r5->field_7f
    //     0x396c8c: ldur            w7, [x5, #0x7f]
    // 0x396c90: DecompressPointer r7
    //     0x396c90: add             x7, x7, HEAP, lsl #32
    // 0x396c94: stur            x7, [fp, #-0x30]
    // 0x396c98: r0 = LoadClassIdInstr(r6)
    //     0x396c98: ldur            x0, [x6, #-1]
    //     0x396c9c: ubfx            x0, x0, #0xc, #0x14
    // 0x396ca0: r16 = 0.500000
    //     0x396ca0: add             x16, PP, #9, lsl #12  ; [pp+0x91e8] 0.5
    //     0x396ca4: ldr             x16, [x16, #0x1e8]
    // 0x396ca8: str             x16, [SP]
    // 0x396cac: mov             x1, x6
    // 0x396cb0: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x396cb0: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x396cb4: ldr             x4, [x4, #0x1f0]
    // 0x396cb8: r0 = GDT[cid_x0 + -0xf97]()
    //     0x396cb8: sub             lr, x0, #0xf97
    //     0x396cbc: ldr             lr, [x21, lr, lsl #3]
    //     0x396cc0: blr             lr
    // 0x396cc4: r1 = <NesIconTheme>
    //     0x396cc4: add             x1, PP, #9, lsl #12  ; [pp+0x91d8] TypeArguments: <NesIconTheme>
    //     0x396cc8: ldr             x1, [x1, #0x1d8]
    // 0x396ccc: stur            x0, [fp, #-0x68]
    // 0x396cd0: r0 = NesIconTheme()
    //     0x396cd0: bl              #0x3b892c  ; AllocateNesIconThemeStub -> NesIconTheme (size=0x24)
    // 0x396cd4: mov             x1, x0
    // 0x396cd8: ldur            x0, [fp, #-0x30]
    // 0x396cdc: StoreField: r1->field_13 = r0
    //     0x396cdc: stur            w0, [x1, #0x13]
    // 0x396ce0: ldur            x0, [fp, #-0x68]
    // 0x396ce4: ArrayStore: r1[0] = r0  ; List_4
    //     0x396ce4: stur            w0, [x1, #0x17]
    // 0x396ce8: ldur            x0, [fp, #-0x50]
    // 0x396cec: StoreField: r1->field_1b = r0
    //     0x396cec: stur            w0, [x1, #0x1b]
    // 0x396cf0: r2 = Instance_MaterialColor
    //     0x396cf0: add             x2, PP, #9, lsl #12  ; [pp+0x91e0] Obj!MaterialColor@5cfeb1
    //     0x396cf4: ldr             x2, [x2, #0x1e0]
    // 0x396cf8: StoreField: r1->field_1f = r2
    //     0x396cf8: stur            w2, [x1, #0x1f]
    // 0x396cfc: d0 = 32.000000
    //     0x396cfc: add             x17, PP, #8, lsl #12  ; [pp+0x8700] IMM: double(32) from 0x4040000000000000
    //     0x396d00: ldr             d0, [x17, #0x700]
    // 0x396d04: StoreField: r1->field_b = d0
    //     0x396d04: stur            d0, [x1, #0xb]
    // 0x396d08: mov             x4, x1
    // 0x396d0c: ldur            x3, [fp, #-8]
    // 0x396d10: stur            x4, [fp, #-0x68]
    // 0x396d14: r16 = Instance_Brightness
    //     0x396d14: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x396d18: cmp             w3, w16
    // 0x396d1c: b.ne            #0x396d84
    // 0x396d20: ldur            x5, [fp, #-0x10]
    // 0x396d24: ldur            x6, [fp, #-0x18]
    // 0x396d28: LoadField: r7 = r5->field_7f
    //     0x396d28: ldur            w7, [x5, #0x7f]
    // 0x396d2c: DecompressPointer r7
    //     0x396d2c: add             x7, x7, HEAP, lsl #32
    // 0x396d30: stur            x7, [fp, #-0x30]
    // 0x396d34: r1 = <NesIconTheme>
    //     0x396d34: add             x1, PP, #9, lsl #12  ; [pp+0x91d8] TypeArguments: <NesIconTheme>
    //     0x396d38: ldr             x1, [x1, #0x1d8]
    // 0x396d3c: r0 = NesIconTheme()
    //     0x396d3c: bl              #0x3b892c  ; AllocateNesIconThemeStub -> NesIconTheme (size=0x24)
    // 0x396d40: mov             x1, x0
    // 0x396d44: ldur            x0, [fp, #-0x30]
    // 0x396d48: StoreField: r1->field_13 = r0
    //     0x396d48: stur            w0, [x1, #0x13]
    // 0x396d4c: ldur            x0, [fp, #-0x18]
    // 0x396d50: ArrayStore: r1[0] = r0  ; List_4
    //     0x396d50: stur            w0, [x1, #0x17]
    // 0x396d54: ldur            x2, [fp, #-0x50]
    // 0x396d58: StoreField: r1->field_1b = r2
    //     0x396d58: stur            w2, [x1, #0x1b]
    // 0x396d5c: r3 = Instance_MaterialColor
    //     0x396d5c: add             x3, PP, #9, lsl #12  ; [pp+0x91e0] Obj!MaterialColor@5cfeb1
    //     0x396d60: ldr             x3, [x3, #0x1e0]
    // 0x396d64: StoreField: r1->field_1f = r3
    //     0x396d64: stur            w3, [x1, #0x1f]
    // 0x396d68: d0 = 32.000000
    //     0x396d68: add             x17, PP, #8, lsl #12  ; [pp+0x8700] IMM: double(32) from 0x4040000000000000
    //     0x396d6c: ldr             d0, [x17, #0x700]
    // 0x396d70: StoreField: r1->field_b = d0
    //     0x396d70: stur            d0, [x1, #0xb]
    // 0x396d74: mov             x4, x1
    // 0x396d78: mov             x0, x2
    // 0x396d7c: mov             x2, x3
    // 0x396d80: b               #0x396e04
    // 0x396d84: ldur            x4, [fp, #-0x10]
    // 0x396d88: mov             x3, x2
    // 0x396d8c: mov             x2, x0
    // 0x396d90: ldur            x0, [fp, #-0x18]
    // 0x396d94: LoadField: r5 = r4->field_f
    //     0x396d94: ldur            w5, [x4, #0xf]
    // 0x396d98: DecompressPointer r5
    //     0x396d98: add             x5, x5, HEAP, lsl #32
    // 0x396d9c: stur            x5, [fp, #-0x30]
    // 0x396da0: r16 = 0.500000
    //     0x396da0: add             x16, PP, #9, lsl #12  ; [pp+0x91e8] 0.5
    //     0x396da4: ldr             x16, [x16, #0x1e8]
    // 0x396da8: str             x16, [SP]
    // 0x396dac: ldur            x1, [fp, #-0x20]
    // 0x396db0: r4 = const [0, 0x2, 0x1, 0x1, alpha, 0x1, null]
    //     0x396db0: add             x4, PP, #9, lsl #12  ; [pp+0x91f0] List(7) [0, 0x2, 0x1, 0x1, "alpha", 0x1, Null]
    //     0x396db4: ldr             x4, [x4, #0x1f0]
    // 0x396db8: r0 = withValues()
    //     0x396db8: bl              #0x5491f4  ; [dart:ui] Color::withValues
    // 0x396dbc: r1 = <NesIconTheme>
    //     0x396dbc: add             x1, PP, #9, lsl #12  ; [pp+0x91d8] TypeArguments: <NesIconTheme>
    //     0x396dc0: ldr             x1, [x1, #0x1d8]
    // 0x396dc4: stur            x0, [fp, #-0x70]
    // 0x396dc8: r0 = NesIconTheme()
    //     0x396dc8: bl              #0x3b892c  ; AllocateNesIconThemeStub -> NesIconTheme (size=0x24)
    // 0x396dcc: mov             x1, x0
    // 0x396dd0: ldur            x0, [fp, #-0x30]
    // 0x396dd4: StoreField: r1->field_13 = r0
    //     0x396dd4: stur            w0, [x1, #0x13]
    // 0x396dd8: ldur            x0, [fp, #-0x70]
    // 0x396ddc: ArrayStore: r1[0] = r0  ; List_4
    //     0x396ddc: stur            w0, [x1, #0x17]
    // 0x396de0: ldur            x0, [fp, #-0x50]
    // 0x396de4: StoreField: r1->field_1b = r0
    //     0x396de4: stur            w0, [x1, #0x1b]
    // 0x396de8: r2 = Instance_MaterialColor
    //     0x396de8: add             x2, PP, #9, lsl #12  ; [pp+0x91e0] Obj!MaterialColor@5cfeb1
    //     0x396dec: ldr             x2, [x2, #0x1e0]
    // 0x396df0: StoreField: r1->field_1f = r2
    //     0x396df0: stur            w2, [x1, #0x1f]
    // 0x396df4: d0 = 32.000000
    //     0x396df4: add             x17, PP, #8, lsl #12  ; [pp+0x8700] IMM: double(32) from 0x4040000000000000
    //     0x396df8: ldr             d0, [x17, #0x700]
    // 0x396dfc: StoreField: r1->field_b = d0
    //     0x396dfc: stur            d0, [x1, #0xb]
    // 0x396e00: mov             x4, x1
    // 0x396e04: ldur            x3, [fp, #-8]
    // 0x396e08: stur            x4, [fp, #-0x70]
    // 0x396e0c: r16 = Instance_Brightness
    //     0x396e0c: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x396e10: cmp             w3, w16
    // 0x396e14: b.ne            #0x396e2c
    // 0x396e18: ldur            x5, [fp, #-0x10]
    // 0x396e1c: LoadField: r1 = r5->field_7f
    //     0x396e1c: ldur            w1, [x5, #0x7f]
    // 0x396e20: DecompressPointer r1
    //     0x396e20: add             x1, x1, HEAP, lsl #32
    // 0x396e24: mov             x19, x1
    // 0x396e28: b               #0x396e38
    // 0x396e2c: ldur            x5, [fp, #-0x10]
    // 0x396e30: r19 = Instance_Color
    //     0x396e30: add             x19, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x396e34: ldr             x19, [x19, #0x140]
    // 0x396e38: ldur            x14, [fp, #-0x28]
    // 0x396e3c: ldur            x8, [fp, #-0x20]
    // 0x396e40: ldur            x6, [fp, #-0x18]
    // 0x396e44: ldur            x9, [fp, #-0x60]
    // 0x396e48: ldur            x11, [fp, #-0x48]
    // 0x396e4c: ldur            x12, [fp, #-0x40]
    // 0x396e50: ldur            x13, [fp, #-0x38]
    // 0x396e54: ldur            x7, [fp, #-0x68]
    // 0x396e58: ldur            x10, [fp, #-0x58]
    // 0x396e5c: stur            x19, [fp, #-0x30]
    // 0x396e60: r1 = <NesButtonTheme>
    //     0x396e60: add             x1, PP, #9, lsl #12  ; [pp+0x91f8] TypeArguments: <NesButtonTheme>
    //     0x396e64: ldr             x1, [x1, #0x1f8]
    // 0x396e68: r0 = NesButtonTheme()
    //     0x396e68: bl              #0x3b8920  ; AllocateNesButtonThemeStub -> NesButtonTheme (size=0x3c)
    // 0x396e6c: mov             x2, x0
    // 0x396e70: ldur            x0, [fp, #-0x60]
    // 0x396e74: stur            x2, [fp, #-0x78]
    // 0x396e78: StoreField: r2->field_b = r0
    //     0x396e78: stur            w0, [x2, #0xb]
    // 0x396e7c: ldur            x7, [fp, #-0x20]
    // 0x396e80: StoreField: r2->field_f = r7
    //     0x396e80: stur            w7, [x2, #0xf]
    // 0x396e84: ldur            x0, [fp, #-0x58]
    // 0x396e88: StoreField: r2->field_13 = r0
    //     0x396e88: stur            w0, [x2, #0x13]
    // 0x396e8c: ldur            x0, [fp, #-0x50]
    // 0x396e90: ArrayStore: r2[0] = r0  ; List_4
    //     0x396e90: stur            w0, [x2, #0x17]
    // 0x396e94: ldur            x1, [fp, #-0x48]
    // 0x396e98: StoreField: r2->field_1b = r1
    //     0x396e98: stur            w1, [x2, #0x1b]
    // 0x396e9c: ldur            x1, [fp, #-0x40]
    // 0x396ea0: StoreField: r2->field_1f = r1
    //     0x396ea0: stur            w1, [x2, #0x1f]
    // 0x396ea4: ldur            x1, [fp, #-0x38]
    // 0x396ea8: StoreField: r2->field_23 = r1
    //     0x396ea8: stur            w1, [x2, #0x23]
    // 0x396eac: ldur            x1, [fp, #-0x68]
    // 0x396eb0: StoreField: r2->field_27 = r1
    //     0x396eb0: stur            w1, [x2, #0x27]
    // 0x396eb4: ldur            x1, [fp, #-0x70]
    // 0x396eb8: StoreField: r2->field_2b = r1
    //     0x396eb8: stur            w1, [x2, #0x2b]
    // 0x396ebc: ldur            x1, [fp, #-0x30]
    // 0x396ec0: StoreField: r2->field_2f = r1
    //     0x396ec0: stur            w1, [x2, #0x2f]
    // 0x396ec4: r1 = Closure: ({required Color color, required Color borderColor, required int pixelSize, required bool pressed, required bool hovered}) => NesDefaultButtonPainter from Function 'NesDefaultButtonPainter.': static.
    //     0x396ec4: add             x1, PP, #9, lsl #12  ; [pp+0x9200] Closure: ({required Color color, required Color borderColor, required int pixelSize, required bool pressed, required bool hovered}) => NesDefaultButtonPainter from Function 'NesDefaultButtonPainter.': static. (0x7c0333795288)
    //     0x396ec8: ldr             x1, [x1, #0x200]
    // 0x396ecc: StoreField: r2->field_37 = r1
    //     0x396ecc: stur            w1, [x2, #0x37]
    // 0x396ed0: ldur            x3, [fp, #-0x28]
    // 0x396ed4: LoadField: r4 = r3->field_3b
    //     0x396ed4: ldur            w4, [x3, #0x3b]
    // 0x396ed8: DecompressPointer r4
    //     0x396ed8: add             x4, x4, HEAP, lsl #32
    // 0x396edc: stur            x4, [fp, #-0x30]
    // 0x396ee0: r1 = <NesContainerTheme>
    //     0x396ee0: add             x1, PP, #9, lsl #12  ; [pp+0x9208] TypeArguments: <NesContainerTheme>
    //     0x396ee4: ldr             x1, [x1, #0x208]
    // 0x396ee8: r0 = NesContainerTheme()
    //     0x396ee8: bl              #0x3b8914  ; AllocateNesContainerThemeStub -> NesContainerTheme (size=0x28)
    // 0x396eec: mov             x2, x0
    // 0x396ef0: ldur            x0, [fp, #-0x18]
    // 0x396ef4: stur            x2, [fp, #-0x38]
    // 0x396ef8: StoreField: r2->field_b = r0
    //     0x396ef8: stur            w0, [x2, #0xb]
    // 0x396efc: r0 = Instance_Color
    //     0x396efc: add             x0, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x396f00: ldr             x0, [x0, #0x140]
    // 0x396f04: StoreField: r2->field_f = r0
    //     0x396f04: stur            w0, [x2, #0xf]
    // 0x396f08: ldur            x0, [fp, #-0x30]
    // 0x396f0c: StoreField: r2->field_13 = r0
    //     0x396f0c: stur            w0, [x2, #0x13]
    // 0x396f10: r0 = Instance_EdgeInsets
    //     0x396f10: add             x0, PP, #9, lsl #12  ; [pp+0x9210] Obj!EdgeInsets@5cbd71
    //     0x396f14: ldr             x0, [x0, #0x210]
    // 0x396f18: ArrayStore: r2[0] = r0  ; List_4
    //     0x396f18: stur            w0, [x2, #0x17]
    // 0x396f1c: r0 = Closure: ({required String? label, required int pixelSize, required TextStyle textStyle, required Color backgroundColor, required Color borderColor}) => NesContainerRoundedBorderPainter from Function 'NesContainerRoundedBorderPainter.': static.
    //     0x396f1c: add             x0, PP, #9, lsl #12  ; [pp+0x9218] Closure: ({required String? label, required int pixelSize, required TextStyle textStyle, required Color backgroundColor, required Color borderColor}) => NesContainerRoundedBorderPainter from Function 'NesContainerRoundedBorderPainter.': static. (0x7c03337b9684)
    //     0x396f20: ldr             x0, [x0, #0x218]
    // 0x396f24: StoreField: r2->field_1f = r0
    //     0x396f24: stur            w0, [x2, #0x1f]
    // 0x396f28: ldur            x0, [fp, #-0x10]
    // 0x396f2c: LoadField: r3 = r0->field_7f
    //     0x396f2c: ldur            w3, [x0, #0x7f]
    // 0x396f30: DecompressPointer r3
    //     0x396f30: add             x3, x3, HEAP, lsl #32
    // 0x396f34: stur            x3, [fp, #-0x30]
    // 0x396f38: LoadField: r4 = r0->field_f
    //     0x396f38: ldur            w4, [x0, #0xf]
    // 0x396f3c: DecompressPointer r4
    //     0x396f3c: add             x4, x4, HEAP, lsl #32
    // 0x396f40: stur            x4, [fp, #-0x18]
    // 0x396f44: r1 = <NesIconTheme>
    //     0x396f44: add             x1, PP, #9, lsl #12  ; [pp+0x91d8] TypeArguments: <NesIconTheme>
    //     0x396f48: ldr             x1, [x1, #0x1d8]
    // 0x396f4c: r0 = NesIconTheme()
    //     0x396f4c: bl              #0x3b892c  ; AllocateNesIconThemeStub -> NesIconTheme (size=0x24)
    // 0x396f50: mov             x2, x0
    // 0x396f54: ldur            x0, [fp, #-0x30]
    // 0x396f58: stur            x2, [fp, #-0x40]
    // 0x396f5c: StoreField: r2->field_13 = r0
    //     0x396f5c: stur            w0, [x2, #0x13]
    // 0x396f60: ldur            x0, [fp, #-0x18]
    // 0x396f64: ArrayStore: r2[0] = r0  ; List_4
    //     0x396f64: stur            w0, [x2, #0x17]
    // 0x396f68: ldur            x0, [fp, #-0x50]
    // 0x396f6c: StoreField: r2->field_1b = r0
    //     0x396f6c: stur            w0, [x2, #0x1b]
    // 0x396f70: r0 = Instance_MaterialColor
    //     0x396f70: add             x0, PP, #9, lsl #12  ; [pp+0x91e0] Obj!MaterialColor@5cfeb1
    //     0x396f74: ldr             x0, [x0, #0x1e0]
    // 0x396f78: StoreField: r2->field_1f = r0
    //     0x396f78: stur            w0, [x2, #0x1f]
    // 0x396f7c: d0 = 32.000000
    //     0x396f7c: add             x17, PP, #8, lsl #12  ; [pp+0x8700] IMM: double(32) from 0x4040000000000000
    //     0x396f80: ldr             d0, [x17, #0x700]
    // 0x396f84: StoreField: r2->field_b = d0
    //     0x396f84: stur            d0, [x2, #0xb]
    // 0x396f88: ldur            x0, [fp, #-8]
    // 0x396f8c: r16 = Instance_Brightness
    //     0x396f8c: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x396f90: cmp             w0, w16
    // 0x396f94: b.ne            #0x396fa4
    // 0x396f98: r3 = Instance_Color
    //     0x396f98: add             x3, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x396f9c: ldr             x3, [x3, #0x710]
    // 0x396fa0: b               #0x396fac
    // 0x396fa4: r3 = Instance_Color
    //     0x396fa4: add             x3, PP, #8, lsl #12  ; [pp+0x8d00] Obj!Color@5ce6e1
    //     0x396fa8: ldr             x3, [x3, #0xd00]
    // 0x396fac: stur            x3, [fp, #-0x18]
    // 0x396fb0: r1 = <NesOverlayTransitionTheme>
    //     0x396fb0: add             x1, PP, #9, lsl #12  ; [pp+0x9220] TypeArguments: <NesOverlayTransitionTheme>
    //     0x396fb4: ldr             x1, [x1, #0x220]
    // 0x396fb8: r0 = NesOverlayTransitionTheme()
    //     0x396fb8: bl              #0x3b8908  ; AllocateNesOverlayTransitionThemeStub -> NesOverlayTransitionTheme (size=0x10)
    // 0x396fbc: mov             x1, x0
    // 0x396fc0: ldur            x0, [fp, #-0x18]
    // 0x396fc4: StoreField: r1->field_b = r0
    //     0x396fc4: stur            w0, [x1, #0xb]
    // 0x396fc8: mov             x6, x1
    // 0x396fcc: ldur            x1, [fp, #-8]
    // 0x396fd0: ldur            x2, [fp, #-0x78]
    // 0x396fd4: ldur            x3, [fp, #-0x38]
    // 0x396fd8: ldur            x5, [fp, #-0x40]
    // 0x396fdc: ldur            x7, [fp, #-0x20]
    // 0x396fe0: r0 = flutterNesTheme()
    //     0x396fe0: bl              #0x397014  ; [package:nes_ui/src/theme.dart] ::flutterNesTheme
    // 0x396fe4: ldur            x16, [fp, #-0x10]
    // 0x396fe8: ldur            lr, [fp, #-0x28]
    // 0x396fec: stp             lr, x16, [SP]
    // 0x396ff0: mov             x1, x0
    // 0x396ff4: r4 = const [0, 0x3, 0x2, 0x1, colorScheme, 0x1, textTheme, 0x2, null]
    //     0x396ff4: add             x4, PP, #9, lsl #12  ; [pp+0x9228] List(9) [0, 0x3, 0x2, 0x1, "colorScheme", 0x1, "textTheme", 0x2, Null]
    //     0x396ff8: ldr             x4, [x4, #0x228]
    // 0x396ffc: r0 = copyWith()
    //     0x396ffc: bl              #0x31bfec  ; [package:flutter/src/material/theme_data.dart] ThemeData::copyWith
    // 0x397000: LeaveFrame
    //     0x397000: mov             SP, fp
    //     0x397004: ldp             fp, lr, [SP], #0x10
    // 0x397008: ret
    //     0x397008: ret             
    // 0x39700c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x39700c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x397010: b               #0x396b18
  }
  static _ _getTextTheme(/* No info */) {
    // ** addr: 0x3b8f18, size: 0xcc
    // 0x3b8f18: EnterFrame
    //     0x3b8f18: stp             fp, lr, [SP, #-0x10]!
    //     0x3b8f1c: mov             fp, SP
    // 0x3b8f20: AllocStack(0x10)
    //     0x3b8f20: sub             SP, SP, #0x10
    // 0x3b8f24: CheckStackOverflow
    //     0x3b8f24: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3b8f28: cmp             SP, x16
    //     0x3b8f2c: b.ls            #0x3b8fdc
    // 0x3b8f30: str             x1, [SP]
    // 0x3b8f34: r1 = Null
    //     0x3b8f34: mov             x1, NULL
    // 0x3b8f38: r4 = const [0, 0x2, 0x1, 0x1, brightness, 0x1, null]
    //     0x3b8f38: add             x4, PP, #0xb, lsl #12  ; [pp+0xb638] List(7) [0, 0x2, 0x1, 0x1, "brightness", 0x1, Null]
    //     0x3b8f3c: ldr             x4, [x4, #0x638]
    // 0x3b8f40: r0 = ThemeData()
    //     0x3b8f40: bl              #0x31e5ec  ; [package:flutter/src/material/theme_data.dart] ThemeData::ThemeData
    // 0x3b8f44: stur            x0, [fp, #-8]
    // 0x3b8f48: r0 = LoadStaticField(0xccc)
    //     0x3b8f48: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3b8f4c: ldr             x0, [x0, #0x1998]
    // 0x3b8f50: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3b8f54: cmp             w0, w16
    // 0x3b8f58: b.ne            #0x3b8f68
    // 0x3b8f5c: r2 = stows
    //     0x3b8f5c: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3b8f60: ldr             x2, [x2, #0x310]
    // 0x3b8f64: r0 = InitLateFinalStaticField()
    //     0x3b8f64: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3b8f68: LoadField: r1 = r0->field_f
    //     0x3b8f68: ldur            w1, [x0, #0xf]
    // 0x3b8f6c: DecompressPointer r1
    //     0x3b8f6c: add             x1, x1, HEAP, lsl #32
    // 0x3b8f70: LoadField: r0 = r1->field_43
    //     0x3b8f70: ldur            w0, [x1, #0x43]
    // 0x3b8f74: DecompressPointer r0
    //     0x3b8f74: add             x0, x0, HEAP, lsl #32
    // 0x3b8f78: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3b8f7c: cmp             w0, w16
    // 0x3b8f80: b.ne            #0x3b8f90
    // 0x3b8f84: r2 = _value
    //     0x3b8f84: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3b8f88: ldr             x2, [x2, #0x4b0]
    // 0x3b8f8c: r0 = InitLateInstanceField()
    //     0x3b8f8c: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3b8f90: tbnz            w0, #4, #0x3b8fb8
    // 0x3b8f94: ldur            x0, [fp, #-8]
    // 0x3b8f98: LoadField: r1 = r0->field_87
    //     0x3b8f98: ldur            w1, [x0, #0x87]
    // 0x3b8f9c: DecompressPointer r1
    //     0x3b8f9c: add             x1, x1, HEAP, lsl #32
    // 0x3b8fa0: str             x1, [SP]
    // 0x3b8fa4: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x3b8fa4: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x3b8fa8: r0 = atkinsonHyperlegibleTextTheme()
    //     0x3b8fa8: bl              #0x3b9304  ; [package:google_fonts/src/google_fonts_parts/part_a.g.dart] PartA::atkinsonHyperlegibleTextTheme
    // 0x3b8fac: LeaveFrame
    //     0x3b8fac: mov             SP, fp
    //     0x3b8fb0: ldp             fp, lr, [SP], #0x10
    // 0x3b8fb4: ret
    //     0x3b8fb4: ret             
    // 0x3b8fb8: ldur            x0, [fp, #-8]
    // 0x3b8fbc: LoadField: r1 = r0->field_87
    //     0x3b8fbc: ldur            w1, [x0, #0x87]
    // 0x3b8fc0: DecompressPointer r1
    //     0x3b8fc0: add             x1, x1, HEAP, lsl #32
    // 0x3b8fc4: str             x1, [SP]
    // 0x3b8fc8: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x3b8fc8: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x3b8fcc: r0 = silkscreenTextTheme()
    //     0x3b8fcc: bl              #0x3b8fe4  ; [package:google_fonts/src/google_fonts_parts/part_s.g.dart] PartS::silkscreenTextTheme
    // 0x3b8fd0: LeaveFrame
    //     0x3b8fd0: mov             SP, fp
    //     0x3b8fd4: ldp             fp, lr, [SP], #0x10
    // 0x3b8fd8: ret
    //     0x3b8fd8: ret             
    // 0x3b8fdc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3b8fdc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3b8fe0: b               #0x3b8f30
  }
}
