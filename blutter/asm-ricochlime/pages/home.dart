// lib: , url: package:ricochlime/pages/home.dart

// class id: 1049324, size: 0x8
class :: {
}

// class id: 2554, size: 0x14, field offset: 0x14
class _HomePageButtonState<C1X0> extends State<C1X0> {

  _ build(/* No info */) {
    // ** addr: 0x3b9a7c, size: 0x438
    // 0x3b9a7c: EnterFrame
    //     0x3b9a7c: stp             fp, lr, [SP, #-0x10]!
    //     0x3b9a80: mov             fp, SP
    // 0x3b9a84: AllocStack(0x48)
    //     0x3b9a84: sub             SP, SP, #0x48
    // 0x3b9a88: SetupParameters(_HomePageButtonState<C1X0> this /* r1 => r0, fp-0x10 */)
    //     0x3b9a88: mov             x0, x1
    //     0x3b9a8c: stur            x1, [fp, #-0x10]
    // 0x3b9a90: CheckStackOverflow
    //     0x3b9a90: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3b9a94: cmp             SP, x16
    //     0x3b9a98: b.ls            #0x3b9e90
    // 0x3b9a9c: LoadField: r1 = r0->field_b
    //     0x3b9a9c: ldur            w1, [x0, #0xb]
    // 0x3b9aa0: DecompressPointer r1
    //     0x3b9aa0: add             x1, x1, HEAP, lsl #32
    // 0x3b9aa4: cmp             w1, NULL
    // 0x3b9aa8: b.eq            #0x3b9e98
    // 0x3b9aac: LoadField: r3 = r1->field_f
    //     0x3b9aac: ldur            w3, [x1, #0xf]
    // 0x3b9ab0: DecompressPointer r3
    //     0x3b9ab0: add             x3, x3, HEAP, lsl #32
    // 0x3b9ab4: stur            x3, [fp, #-8]
    // 0x3b9ab8: r1 = <Widget>
    //     0x3b9ab8: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x3b9abc: r2 = 0
    //     0x3b9abc: mov             x2, #0
    // 0x3b9ac0: r0 = _GrowableList()
    //     0x3b9ac0: bl              #0x237730  ; [dart:core] _GrowableList::_GrowableList
    // 0x3b9ac4: mov             x1, x0
    // 0x3b9ac8: ldur            x2, [fp, #-0x10]
    // 0x3b9acc: stur            x1, [fp, #-0x18]
    // 0x3b9ad0: LoadField: r0 = r2->field_b
    //     0x3b9ad0: ldur            w0, [x2, #0xb]
    // 0x3b9ad4: DecompressPointer r0
    //     0x3b9ad4: add             x0, x0, HEAP, lsl #32
    // 0x3b9ad8: cmp             w0, NULL
    // 0x3b9adc: b.eq            #0x3b9e9c
    // 0x3b9ae0: ArrayLoad: r3 = r0[0]  ; List_4
    //     0x3b9ae0: ldur            w3, [x0, #0x17]
    // 0x3b9ae4: DecompressPointer r3
    //     0x3b9ae4: add             x3, x3, HEAP, lsl #32
    // 0x3b9ae8: cmp             w3, NULL
    // 0x3b9aec: b.ne            #0x3b9af8
    // 0x3b9af0: r0 = Null
    //     0x3b9af0: mov             x0, NULL
    // 0x3b9af4: b               #0x3b9b0c
    // 0x3b9af8: str             x3, [SP]
    // 0x3b9afc: mov             x0, x3
    // 0x3b9b00: ClosureCall
    //     0x3b9b00: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    //     0x3b9b04: ldur            x2, [x0, #0x1f]
    //     0x3b9b08: blr             x2
    // 0x3b9b0c: cmp             w0, NULL
    // 0x3b9b10: b.ne            #0x3b9b1c
    // 0x3b9b14: ldur            x2, [fp, #-0x18]
    // 0x3b9b18: b               #0x3b9c00
    // 0x3b9b1c: r16 = true
    //     0x3b9b1c: add             x16, NULL, #0x20  ; true
    // 0x3b9b20: cmp             w0, w16
    // 0x3b9b24: b.ne            #0x3b9bfc
    // 0x3b9b28: ldur            x2, [fp, #-0x10]
    // 0x3b9b2c: ldur            x1, [fp, #-0x18]
    // 0x3b9b30: LoadField: r0 = r2->field_b
    //     0x3b9b30: ldur            w0, [x2, #0xb]
    // 0x3b9b34: DecompressPointer r0
    //     0x3b9b34: add             x0, x0, HEAP, lsl #32
    // 0x3b9b38: cmp             w0, NULL
    // 0x3b9b3c: b.eq            #0x3b9ea0
    // 0x3b9b40: LoadField: r3 = r0->field_13
    //     0x3b9b40: ldur            w3, [x0, #0x13]
    // 0x3b9b44: DecompressPointer r3
    //     0x3b9b44: add             x3, x3, HEAP, lsl #32
    // 0x3b9b48: stur            x3, [fp, #-0x20]
    // 0x3b9b4c: r0 = NesIcon()
    //     0x3b9b4c: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x3b9b50: mov             x1, x0
    // 0x3b9b54: ldur            x0, [fp, #-0x20]
    // 0x3b9b58: stur            x1, [fp, #-0x28]
    // 0x3b9b5c: StoreField: r1->field_b = r0
    //     0x3b9b5c: stur            w0, [x1, #0xb]
    // 0x3b9b60: r0 = BouncingIcon()
    //     0x3b9b60: bl              #0x3b9eb4  ; AllocateBouncingIconStub -> BouncingIcon (size=0x10)
    // 0x3b9b64: mov             x2, x0
    // 0x3b9b68: ldur            x0, [fp, #-0x28]
    // 0x3b9b6c: stur            x2, [fp, #-0x20]
    // 0x3b9b70: StoreField: r2->field_b = r0
    //     0x3b9b70: stur            w0, [x2, #0xb]
    // 0x3b9b74: ldur            x0, [fp, #-0x18]
    // 0x3b9b78: LoadField: r1 = r0->field_b
    //     0x3b9b78: ldur            w1, [x0, #0xb]
    // 0x3b9b7c: LoadField: r3 = r0->field_f
    //     0x3b9b7c: ldur            w3, [x0, #0xf]
    // 0x3b9b80: DecompressPointer r3
    //     0x3b9b80: add             x3, x3, HEAP, lsl #32
    // 0x3b9b84: LoadField: r4 = r3->field_b
    //     0x3b9b84: ldur            w4, [x3, #0xb]
    // 0x3b9b88: r3 = LoadInt32Instr(r1)
    //     0x3b9b88: sbfx            x3, x1, #1, #0x1f
    // 0x3b9b8c: stur            x3, [fp, #-0x30]
    // 0x3b9b90: r1 = LoadInt32Instr(r4)
    //     0x3b9b90: sbfx            x1, x4, #1, #0x1f
    // 0x3b9b94: cmp             x3, x1
    // 0x3b9b98: b.ne            #0x3b9ba4
    // 0x3b9b9c: mov             x1, x0
    // 0x3b9ba0: r0 = _growToNextCapacity()
    //     0x3b9ba0: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3b9ba4: ldur            x2, [fp, #-0x18]
    // 0x3b9ba8: ldur            x3, [fp, #-0x30]
    // 0x3b9bac: add             x4, x3, #1
    // 0x3b9bb0: lsl             x0, x4, #1
    // 0x3b9bb4: StoreField: r2->field_b = r0
    //     0x3b9bb4: stur            w0, [x2, #0xb]
    // 0x3b9bb8: LoadField: r5 = r2->field_f
    //     0x3b9bb8: ldur            w5, [x2, #0xf]
    // 0x3b9bbc: DecompressPointer r5
    //     0x3b9bbc: add             x5, x5, HEAP, lsl #32
    // 0x3b9bc0: mov             x1, x5
    // 0x3b9bc4: ldur            x0, [fp, #-0x20]
    // 0x3b9bc8: ArrayStore: r1[r3] = r0  ; List_4
    //     0x3b9bc8: add             x25, x1, x3, lsl #2
    //     0x3b9bcc: add             x25, x25, #0xf
    //     0x3b9bd0: str             w0, [x25]
    //     0x3b9bd4: tbz             w0, #0, #0x3b9bf0
    //     0x3b9bd8: ldurb           w16, [x1, #-1]
    //     0x3b9bdc: ldurb           w17, [x0, #-1]
    //     0x3b9be0: and             x16, x17, x16, lsr #2
    //     0x3b9be4: tst             x16, HEAP, lsr #32
    //     0x3b9be8: b.eq            #0x3b9bf0
    //     0x3b9bec: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3b9bf0: mov             x3, x4
    // 0x3b9bf4: mov             x0, x5
    // 0x3b9bf8: b               #0x3b9cb8
    // 0x3b9bfc: ldur            x2, [fp, #-0x18]
    // 0x3b9c00: ldur            x0, [fp, #-0x10]
    // 0x3b9c04: LoadField: r1 = r0->field_b
    //     0x3b9c04: ldur            w1, [x0, #0xb]
    // 0x3b9c08: DecompressPointer r1
    //     0x3b9c08: add             x1, x1, HEAP, lsl #32
    // 0x3b9c0c: cmp             w1, NULL
    // 0x3b9c10: b.eq            #0x3b9ea4
    // 0x3b9c14: LoadField: r3 = r1->field_13
    //     0x3b9c14: ldur            w3, [x1, #0x13]
    // 0x3b9c18: DecompressPointer r3
    //     0x3b9c18: add             x3, x3, HEAP, lsl #32
    // 0x3b9c1c: stur            x3, [fp, #-0x20]
    // 0x3b9c20: r0 = NesIcon()
    //     0x3b9c20: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x3b9c24: mov             x2, x0
    // 0x3b9c28: ldur            x0, [fp, #-0x20]
    // 0x3b9c2c: stur            x2, [fp, #-0x28]
    // 0x3b9c30: StoreField: r2->field_b = r0
    //     0x3b9c30: stur            w0, [x2, #0xb]
    // 0x3b9c34: ldur            x0, [fp, #-0x18]
    // 0x3b9c38: LoadField: r1 = r0->field_b
    //     0x3b9c38: ldur            w1, [x0, #0xb]
    // 0x3b9c3c: LoadField: r3 = r0->field_f
    //     0x3b9c3c: ldur            w3, [x0, #0xf]
    // 0x3b9c40: DecompressPointer r3
    //     0x3b9c40: add             x3, x3, HEAP, lsl #32
    // 0x3b9c44: LoadField: r4 = r3->field_b
    //     0x3b9c44: ldur            w4, [x3, #0xb]
    // 0x3b9c48: r3 = LoadInt32Instr(r1)
    //     0x3b9c48: sbfx            x3, x1, #1, #0x1f
    // 0x3b9c4c: stur            x3, [fp, #-0x30]
    // 0x3b9c50: r1 = LoadInt32Instr(r4)
    //     0x3b9c50: sbfx            x1, x4, #1, #0x1f
    // 0x3b9c54: cmp             x3, x1
    // 0x3b9c58: b.ne            #0x3b9c64
    // 0x3b9c5c: mov             x1, x0
    // 0x3b9c60: r0 = _growToNextCapacity()
    //     0x3b9c60: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3b9c64: ldur            x2, [fp, #-0x18]
    // 0x3b9c68: ldur            x3, [fp, #-0x30]
    // 0x3b9c6c: add             x4, x3, #1
    // 0x3b9c70: lsl             x0, x4, #1
    // 0x3b9c74: StoreField: r2->field_b = r0
    //     0x3b9c74: stur            w0, [x2, #0xb]
    // 0x3b9c78: LoadField: r5 = r2->field_f
    //     0x3b9c78: ldur            w5, [x2, #0xf]
    // 0x3b9c7c: DecompressPointer r5
    //     0x3b9c7c: add             x5, x5, HEAP, lsl #32
    // 0x3b9c80: mov             x1, x5
    // 0x3b9c84: ldur            x0, [fp, #-0x28]
    // 0x3b9c88: ArrayStore: r1[r3] = r0  ; List_4
    //     0x3b9c88: add             x25, x1, x3, lsl #2
    //     0x3b9c8c: add             x25, x25, #0xf
    //     0x3b9c90: str             w0, [x25]
    //     0x3b9c94: tbz             w0, #0, #0x3b9cb0
    //     0x3b9c98: ldurb           w16, [x1, #-1]
    //     0x3b9c9c: ldurb           w17, [x0, #-1]
    //     0x3b9ca0: and             x16, x17, x16, lsr #2
    //     0x3b9ca4: tst             x16, HEAP, lsr #32
    //     0x3b9ca8: b.eq            #0x3b9cb0
    //     0x3b9cac: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3b9cb0: mov             x3, x4
    // 0x3b9cb4: mov             x0, x5
    // 0x3b9cb8: stur            x3, [fp, #-0x30]
    // 0x3b9cbc: LoadField: r1 = r0->field_b
    //     0x3b9cbc: ldur            w1, [x0, #0xb]
    // 0x3b9cc0: r0 = LoadInt32Instr(r1)
    //     0x3b9cc0: sbfx            x0, x1, #1, #0x1f
    // 0x3b9cc4: cmp             x3, x0
    // 0x3b9cc8: b.ne            #0x3b9cd4
    // 0x3b9ccc: mov             x1, x2
    // 0x3b9cd0: r0 = _growToNextCapacity()
    //     0x3b9cd0: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3b9cd4: ldur            x4, [fp, #-0x10]
    // 0x3b9cd8: ldur            x2, [fp, #-0x18]
    // 0x3b9cdc: ldur            x3, [fp, #-0x30]
    // 0x3b9ce0: add             x5, x3, #1
    // 0x3b9ce4: stur            x5, [fp, #-0x38]
    // 0x3b9ce8: lsl             x0, x5, #1
    // 0x3b9cec: StoreField: r2->field_b = r0
    //     0x3b9cec: stur            w0, [x2, #0xb]
    // 0x3b9cf0: mov             x0, x5
    // 0x3b9cf4: mov             x1, x3
    // 0x3b9cf8: cmp             x1, x0
    // 0x3b9cfc: b.hs            #0x3b9ea8
    // 0x3b9d00: LoadField: r0 = r2->field_f
    //     0x3b9d00: ldur            w0, [x2, #0xf]
    // 0x3b9d04: DecompressPointer r0
    //     0x3b9d04: add             x0, x0, HEAP, lsl #32
    // 0x3b9d08: stur            x0, [fp, #-0x28]
    // 0x3b9d0c: add             x1, x0, x3, lsl #2
    // 0x3b9d10: r16 = Instance_SizedBox
    //     0x3b9d10: add             x16, PP, #0x13, lsl #12  ; [pp+0x13780] Obj!SizedBox@5d8361
    //     0x3b9d14: ldr             x16, [x16, #0x780]
    // 0x3b9d18: StoreField: r1->field_f = r16
    //     0x3b9d18: stur            w16, [x1, #0xf]
    // 0x3b9d1c: LoadField: r1 = r4->field_b
    //     0x3b9d1c: ldur            w1, [x4, #0xb]
    // 0x3b9d20: DecompressPointer r1
    //     0x3b9d20: add             x1, x1, HEAP, lsl #32
    // 0x3b9d24: cmp             w1, NULL
    // 0x3b9d28: b.eq            #0x3b9eac
    // 0x3b9d2c: LoadField: r3 = r1->field_1b
    //     0x3b9d2c: ldur            w3, [x1, #0x1b]
    // 0x3b9d30: DecompressPointer r3
    //     0x3b9d30: add             x3, x3, HEAP, lsl #32
    // 0x3b9d34: stur            x3, [fp, #-0x20]
    // 0x3b9d38: r0 = Text()
    //     0x3b9d38: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x3b9d3c: mov             x2, x0
    // 0x3b9d40: ldur            x0, [fp, #-0x20]
    // 0x3b9d44: stur            x2, [fp, #-0x40]
    // 0x3b9d48: StoreField: r2->field_b = r0
    //     0x3b9d48: stur            w0, [x2, #0xb]
    // 0x3b9d4c: r0 = Instance_TextStyle
    //     0x3b9d4c: add             x0, PP, #0x13, lsl #12  ; [pp+0x13788] Obj!TextStyle@5d5671
    //     0x3b9d50: ldr             x0, [x0, #0x788]
    // 0x3b9d54: StoreField: r2->field_13 = r0
    //     0x3b9d54: stur            w0, [x2, #0x13]
    // 0x3b9d58: ldur            x0, [fp, #-0x28]
    // 0x3b9d5c: LoadField: r1 = r0->field_b
    //     0x3b9d5c: ldur            w1, [x0, #0xb]
    // 0x3b9d60: r0 = LoadInt32Instr(r1)
    //     0x3b9d60: sbfx            x0, x1, #1, #0x1f
    // 0x3b9d64: ldur            x3, [fp, #-0x38]
    // 0x3b9d68: cmp             x3, x0
    // 0x3b9d6c: b.ne            #0x3b9d78
    // 0x3b9d70: ldur            x1, [fp, #-0x18]
    // 0x3b9d74: r0 = _growToNextCapacity()
    //     0x3b9d74: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3b9d78: ldur            x4, [fp, #-8]
    // 0x3b9d7c: ldur            x3, [fp, #-0x18]
    // 0x3b9d80: ldur            x2, [fp, #-0x38]
    // 0x3b9d84: add             x0, x2, #1
    // 0x3b9d88: lsl             x1, x0, #1
    // 0x3b9d8c: StoreField: r3->field_b = r1
    //     0x3b9d8c: stur            w1, [x3, #0xb]
    // 0x3b9d90: mov             x1, x2
    // 0x3b9d94: cmp             x1, x0
    // 0x3b9d98: b.hs            #0x3b9eb0
    // 0x3b9d9c: LoadField: r1 = r3->field_f
    //     0x3b9d9c: ldur            w1, [x3, #0xf]
    // 0x3b9da0: DecompressPointer r1
    //     0x3b9da0: add             x1, x1, HEAP, lsl #32
    // 0x3b9da4: ldur            x0, [fp, #-0x40]
    // 0x3b9da8: ArrayStore: r1[r2] = r0  ; List_4
    //     0x3b9da8: add             x25, x1, x2, lsl #2
    //     0x3b9dac: add             x25, x25, #0xf
    //     0x3b9db0: str             w0, [x25]
    //     0x3b9db4: tbz             w0, #0, #0x3b9dd0
    //     0x3b9db8: ldurb           w16, [x1, #-1]
    //     0x3b9dbc: ldurb           w17, [x0, #-1]
    //     0x3b9dc0: and             x16, x17, x16, lsr #2
    //     0x3b9dc4: tst             x16, HEAP, lsr #32
    //     0x3b9dc8: b.eq            #0x3b9dd0
    //     0x3b9dcc: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3b9dd0: r0 = Row()
    //     0x3b9dd0: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x3b9dd4: mov             x1, x0
    // 0x3b9dd8: r0 = Instance_Axis
    //     0x3b9dd8: ldr             x0, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x3b9ddc: stur            x1, [fp, #-0x20]
    // 0x3b9de0: StoreField: r1->field_f = r0
    //     0x3b9de0: stur            w0, [x1, #0xf]
    // 0x3b9de4: r0 = Instance_MainAxisAlignment
    //     0x3b9de4: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x3b9de8: ldr             x0, [x0, #0xfb0]
    // 0x3b9dec: StoreField: r1->field_13 = r0
    //     0x3b9dec: stur            w0, [x1, #0x13]
    // 0x3b9df0: r0 = Instance_MainAxisSize
    //     0x3b9df0: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x3b9df4: ldr             x0, [x0, #0xfb8]
    // 0x3b9df8: ArrayStore: r1[0] = r0  ; List_4
    //     0x3b9df8: stur            w0, [x1, #0x17]
    // 0x3b9dfc: r0 = Instance_CrossAxisAlignment
    //     0x3b9dfc: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x3b9e00: ldr             x0, [x0, #0xfc0]
    // 0x3b9e04: StoreField: r1->field_1b = r0
    //     0x3b9e04: stur            w0, [x1, #0x1b]
    // 0x3b9e08: r0 = Instance_VerticalDirection
    //     0x3b9e08: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x3b9e0c: ldr             x0, [x0, #0xfc8]
    // 0x3b9e10: StoreField: r1->field_23 = r0
    //     0x3b9e10: stur            w0, [x1, #0x23]
    // 0x3b9e14: r0 = Instance_Clip
    //     0x3b9e14: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x3b9e18: ldr             x0, [x0, #0xfd0]
    // 0x3b9e1c: StoreField: r1->field_2b = r0
    //     0x3b9e1c: stur            w0, [x1, #0x2b]
    // 0x3b9e20: StoreField: r1->field_2f = rZR
    //     0x3b9e20: stur            xzr, [x1, #0x2f]
    // 0x3b9e24: ldur            x0, [fp, #-0x18]
    // 0x3b9e28: StoreField: r1->field_b = r0
    //     0x3b9e28: stur            w0, [x1, #0xb]
    // 0x3b9e2c: r0 = NesButton()
    //     0x3b9e2c: bl              #0x380374  ; AllocateNesButtonStub -> NesButton (size=0x28)
    // 0x3b9e30: mov             x3, x0
    // 0x3b9e34: ldur            x0, [fp, #-8]
    // 0x3b9e38: stur            x3, [fp, #-0x18]
    // 0x3b9e3c: StoreField: r3->field_b = r0
    //     0x3b9e3c: stur            w0, [x3, #0xb]
    // 0x3b9e40: ldur            x0, [fp, #-0x20]
    // 0x3b9e44: StoreField: r3->field_f = r0
    //     0x3b9e44: stur            w0, [x3, #0xf]
    // 0x3b9e48: ldur            x2, [fp, #-0x10]
    // 0x3b9e4c: r1 = Function 'onPressed':.
    //     0x3b9e4c: add             x1, PP, #0x13, lsl #12  ; [pp+0x13790] AnonymousClosure: (0x3b9ec0), in [package:ricochlime/pages/home.dart] _HomePageButtonState::onPressed (0x3b9ef8)
    //     0x3b9e50: ldr             x1, [x1, #0x790]
    // 0x3b9e54: r0 = AllocateClosure()
    //     0x3b9e54: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3b9e58: mov             x1, x0
    // 0x3b9e5c: ldur            x0, [fp, #-0x18]
    // 0x3b9e60: ArrayStore: r0[0] = r1  ; List_4
    //     0x3b9e60: stur            w1, [x0, #0x17]
    // 0x3b9e64: r1 = false
    //     0x3b9e64: add             x1, NULL, #0x30  ; false
    // 0x3b9e68: StoreField: r0->field_23 = r1
    //     0x3b9e68: stur            w1, [x0, #0x23]
    // 0x3b9e6c: r0 = Center()
    //     0x3b9e6c: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x3b9e70: r1 = Instance_Alignment
    //     0x3b9e70: add             x1, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x3b9e74: ldr             x1, [x1, #0xb18]
    // 0x3b9e78: StoreField: r0->field_f = r1
    //     0x3b9e78: stur            w1, [x0, #0xf]
    // 0x3b9e7c: ldur            x1, [fp, #-0x18]
    // 0x3b9e80: StoreField: r0->field_b = r1
    //     0x3b9e80: stur            w1, [x0, #0xb]
    // 0x3b9e84: LeaveFrame
    //     0x3b9e84: mov             SP, fp
    //     0x3b9e88: ldp             fp, lr, [SP], #0x10
    // 0x3b9e8c: ret
    //     0x3b9e8c: ret             
    // 0x3b9e90: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3b9e90: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3b9e94: b               #0x3b9a9c
    // 0x3b9e98: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3b9e98: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3b9e9c: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3b9e9c: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3b9ea0: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3b9ea0: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3b9ea4: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3b9ea4: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3b9ea8: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3b9ea8: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3b9eac: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3b9eac: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3b9eb0: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3b9eb0: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] void onPressed(dynamic) {
    // ** addr: 0x3b9ec0, size: 0x38
    // 0x3b9ec0: EnterFrame
    //     0x3b9ec0: stp             fp, lr, [SP, #-0x10]!
    //     0x3b9ec4: mov             fp, SP
    // 0x3b9ec8: ldr             x0, [fp, #0x10]
    // 0x3b9ecc: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x3b9ecc: ldur            w1, [x0, #0x17]
    // 0x3b9ed0: DecompressPointer r1
    //     0x3b9ed0: add             x1, x1, HEAP, lsl #32
    // 0x3b9ed4: CheckStackOverflow
    //     0x3b9ed4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3b9ed8: cmp             SP, x16
    //     0x3b9edc: b.ls            #0x3b9ef0
    // 0x3b9ee0: r0 = onPressed()
    //     0x3b9ee0: bl              #0x3b9ef8  ; [package:ricochlime/pages/home.dart] _HomePageButtonState::onPressed
    // 0x3b9ee4: LeaveFrame
    //     0x3b9ee4: mov             SP, fp
    //     0x3b9ee8: ldp             fp, lr, [SP], #0x10
    // 0x3b9eec: ret
    //     0x3b9eec: ret             
    // 0x3b9ef0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3b9ef0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3b9ef4: b               #0x3b9ee0
  }
  _ onPressed(/* No info */) {
    // ** addr: 0x3b9ef8, size: 0x18c
    // 0x3b9ef8: EnterFrame
    //     0x3b9ef8: stp             fp, lr, [SP, #-0x10]!
    //     0x3b9efc: mov             fp, SP
    // 0x3b9f00: AllocStack(0x30)
    //     0x3b9f00: sub             SP, SP, #0x30
    // 0x3b9f04: SetupParameters(_HomePageButtonState<C1X0> this /* r1 => r1, fp-0x8 */)
    //     0x3b9f04: stur            x1, [fp, #-8]
    // 0x3b9f08: CheckStackOverflow
    //     0x3b9f08: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3b9f0c: cmp             SP, x16
    //     0x3b9f10: b.ls            #0x3ba070
    // 0x3b9f14: r1 = 1
    //     0x3b9f14: mov             x1, #1
    // 0x3b9f18: r0 = AllocateContext()
    //     0x3b9f18: bl              #0x5834e8  ; AllocateContextStub
    // 0x3b9f1c: mov             x1, x0
    // 0x3b9f20: ldur            x0, [fp, #-8]
    // 0x3b9f24: stur            x1, [fp, #-0x10]
    // 0x3b9f28: StoreField: r1->field_f = r0
    //     0x3b9f28: stur            w0, [x1, #0xf]
    // 0x3b9f2c: r0 = LoadStaticField(0xccc)
    //     0x3b9f2c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3b9f30: ldr             x0, [x0, #0x1998]
    // 0x3b9f34: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3b9f38: cmp             w0, w16
    // 0x3b9f3c: b.ne            #0x3b9f4c
    // 0x3b9f40: r2 = stows
    //     0x3b9f40: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3b9f44: ldr             x2, [x2, #0x310]
    // 0x3b9f48: r0 = InitLateFinalStaticField()
    //     0x3b9f48: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3b9f4c: LoadField: r1 = r0->field_13
    //     0x3b9f4c: ldur            w1, [x0, #0x13]
    // 0x3b9f50: DecompressPointer r1
    //     0x3b9f50: add             x1, x1, HEAP, lsl #32
    // 0x3b9f54: LoadField: r0 = r1->field_43
    //     0x3b9f54: ldur            w0, [x1, #0x43]
    // 0x3b9f58: DecompressPointer r0
    //     0x3b9f58: add             x0, x0, HEAP, lsl #32
    // 0x3b9f5c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3b9f60: cmp             w0, w16
    // 0x3b9f64: b.ne            #0x3b9f74
    // 0x3b9f68: r2 = _value
    //     0x3b9f68: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3b9f6c: ldr             x2, [x2, #0x4b0]
    // 0x3b9f70: r0 = InitLateInstanceField()
    //     0x3b9f70: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3b9f74: tbnz            w0, #4, #0x3b9f94
    // 0x3b9f78: ldur            x0, [fp, #-8]
    // 0x3b9f7c: LoadField: r1 = r0->field_f
    //     0x3b9f7c: ldur            w1, [x0, #0xf]
    // 0x3b9f80: DecompressPointer r1
    //     0x3b9f80: add             x1, x1, HEAP, lsl #32
    // 0x3b9f84: cmp             w1, NULL
    // 0x3b9f88: b.eq            #0x3ba078
    // 0x3b9f8c: r0 = disableAnimationsOf()
    //     0x3b9f8c: bl              #0x3ba15c  ; [package:flutter/src/widgets/media_query.dart] MediaQuery::disableAnimationsOf
    // 0x3b9f90: tbnz            w0, #4, #0x3b9fd8
    // 0x3b9f94: ldur            x0, [fp, #-8]
    // 0x3b9f98: LoadField: r1 = r0->field_b
    //     0x3b9f98: ldur            w1, [x0, #0xb]
    // 0x3b9f9c: DecompressPointer r1
    //     0x3b9f9c: add             x1, x1, HEAP, lsl #32
    // 0x3b9fa0: cmp             w1, NULL
    // 0x3b9fa4: b.eq            #0x3ba07c
    // 0x3b9fa8: LoadField: r2 = r1->field_1f
    //     0x3b9fa8: ldur            w2, [x1, #0x1f]
    // 0x3b9fac: DecompressPointer r2
    //     0x3b9fac: add             x2, x2, HEAP, lsl #32
    // 0x3b9fb0: stur            x2, [fp, #-0x18]
    // 0x3b9fb4: r1 = <void?>
    //     0x3b9fb4: ldr             x1, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x3b9fb8: r0 = MaterialPageRoute()
    //     0x3b9fb8: bl              #0x388aa8  ; AllocateMaterialPageRouteStub -> MaterialPageRoute<X0> (size=0xac)
    // 0x3b9fbc: mov             x1, x0
    // 0x3b9fc0: ldur            x2, [fp, #-0x18]
    // 0x3b9fc4: stur            x0, [fp, #-0x18]
    // 0x3b9fc8: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x3b9fc8: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x3b9fcc: r0 = MaterialPageRoute()
    //     0x3b9fcc: bl              #0x3889fc  ; [package:flutter/src/material/page.dart] MaterialPageRoute::MaterialPageRoute
    // 0x3b9fd0: ldur            x2, [fp, #-0x18]
    // 0x3b9fd4: b               #0x3b9ffc
    // 0x3b9fd8: ldur            x2, [fp, #-0x10]
    // 0x3b9fdc: r1 = Function '<anonymous closure>':.
    //     0x3b9fdc: add             x1, PP, #0x13, lsl #12  ; [pp+0x13798] AnonymousClosure: (0x3ba260), in [package:ricochlime/pages/home.dart] _HomePageButtonState::onPressed (0x3b9ef8)
    //     0x3b9fe0: ldr             x1, [x1, #0x798]
    // 0x3b9fe4: r0 = AllocateClosure()
    //     0x3b9fe4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3b9fe8: r16 = <void?>
    //     0x3b9fe8: ldr             x16, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x3b9fec: stp             x0, x16, [SP]
    // 0x3b9ff0: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x3b9ff0: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x3b9ff4: r0 = route()
    //     0x3b9ff4: bl              #0x3ba084  ; [package:nes_ui/src/screen_transitions/nes_vertical_close.dart] NesVerticalCloseTransition::route
    // 0x3b9ff8: mov             x2, x0
    // 0x3b9ffc: ldur            x0, [fp, #-8]
    // 0x3ba000: stur            x2, [fp, #-0x18]
    // 0x3ba004: LoadField: r1 = r0->field_f
    //     0x3ba004: ldur            w1, [x0, #0xf]
    // 0x3ba008: DecompressPointer r1
    //     0x3ba008: add             x1, x1, HEAP, lsl #32
    // 0x3ba00c: cmp             w1, NULL
    // 0x3ba010: b.eq            #0x3ba080
    // 0x3ba014: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x3ba014: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x3ba018: r0 = of()
    //     0x3ba018: bl              #0x378724  ; [package:flutter/src/widgets/navigator.dart] Navigator::of
    // 0x3ba01c: r16 = <void?>
    //     0x3ba01c: ldr             x16, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x3ba020: stp             x0, x16, [SP, #8]
    // 0x3ba024: ldur            x16, [fp, #-0x18]
    // 0x3ba028: str             x16, [SP]
    // 0x3ba02c: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x3ba02c: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x3ba030: r0 = push()
    //     0x3ba030: bl              #0x378510  ; [package:flutter/src/widgets/navigator.dart] NavigatorState::push
    // 0x3ba034: ldur            x2, [fp, #-0x10]
    // 0x3ba038: r1 = Function '<anonymous closure>':.
    //     0x3ba038: add             x1, PP, #0x13, lsl #12  ; [pp+0x137a0] AnonymousClosure: (0x3ba1a8), in [package:ricochlime/pages/home.dart] _HomePageButtonState::onPressed (0x3b9ef8)
    //     0x3ba03c: ldr             x1, [x1, #0x7a0]
    // 0x3ba040: stur            x0, [fp, #-8]
    // 0x3ba044: r0 = AllocateClosure()
    //     0x3ba044: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3ba048: r16 = <Null?>
    //     0x3ba048: ldr             x16, [PP, #0x1a10]  ; [pp+0x1a10] TypeArguments: <Null?>
    // 0x3ba04c: ldur            lr, [fp, #-8]
    // 0x3ba050: stp             lr, x16, [SP, #8]
    // 0x3ba054: str             x0, [SP]
    // 0x3ba058: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x3ba058: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x3ba05c: r0 = then()
    //     0x3ba05c: bl              #0x52a270  ; [dart:async] _Future::then
    // 0x3ba060: r0 = Null
    //     0x3ba060: mov             x0, NULL
    // 0x3ba064: LeaveFrame
    //     0x3ba064: mov             SP, fp
    //     0x3ba068: ldp             fp, lr, [SP], #0x10
    // 0x3ba06c: ret
    //     0x3ba06c: ret             
    // 0x3ba070: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3ba070: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3ba074: b               #0x3b9f14
    // 0x3ba078: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3ba078: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3ba07c: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3ba07c: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3ba080: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3ba080: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] Null <anonymous closure>(dynamic, void) {
    // ** addr: 0x3ba1a8, size: 0xb8
    // 0x3ba1a8: EnterFrame
    //     0x3ba1a8: stp             fp, lr, [SP, #-0x10]!
    //     0x3ba1ac: mov             fp, SP
    // 0x3ba1b0: AllocStack(0x8)
    //     0x3ba1b0: sub             SP, SP, #8
    // 0x3ba1b4: SetupParameters([dynamic _ /* r0 */])
    //     0x3ba1b4: ldr             x0, [fp, #0x18]
    //     0x3ba1b8: ldur            w1, [x0, #0x17]
    //     0x3ba1bc: add             x1, x1, HEAP, lsl #32
    // 0x3ba1c0: CheckStackOverflow
    //     0x3ba1c0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3ba1c4: cmp             SP, x16
    //     0x3ba1c8: b.ls            #0x3ba254
    // 0x3ba1cc: LoadField: r0 = r1->field_f
    //     0x3ba1cc: ldur            w0, [x1, #0xf]
    // 0x3ba1d0: DecompressPointer r0
    //     0x3ba1d0: add             x0, x0, HEAP, lsl #32
    // 0x3ba1d4: stur            x0, [fp, #-8]
    // 0x3ba1d8: LoadField: r1 = r0->field_b
    //     0x3ba1d8: ldur            w1, [x0, #0xb]
    // 0x3ba1dc: DecompressPointer r1
    //     0x3ba1dc: add             x1, x1, HEAP, lsl #32
    // 0x3ba1e0: cmp             w1, NULL
    // 0x3ba1e4: b.eq            #0x3ba25c
    // 0x3ba1e8: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x3ba1e8: ldur            w2, [x1, #0x17]
    // 0x3ba1ec: DecompressPointer r2
    //     0x3ba1ec: add             x2, x2, HEAP, lsl #32
    // 0x3ba1f0: cmp             w2, NULL
    // 0x3ba1f4: b.ne            #0x3ba208
    // 0x3ba1f8: r0 = Null
    //     0x3ba1f8: mov             x0, NULL
    // 0x3ba1fc: LeaveFrame
    //     0x3ba1fc: mov             SP, fp
    //     0x3ba200: ldp             fp, lr, [SP], #0x10
    // 0x3ba204: ret
    //     0x3ba204: ret             
    // 0x3ba208: LoadField: r1 = r0->field_f
    //     0x3ba208: ldur            w1, [x0, #0xf]
    // 0x3ba20c: DecompressPointer r1
    //     0x3ba20c: add             x1, x1, HEAP, lsl #32
    // 0x3ba210: cmp             w1, NULL
    // 0x3ba214: b.ne            #0x3ba228
    // 0x3ba218: r0 = Null
    //     0x3ba218: mov             x0, NULL
    // 0x3ba21c: LeaveFrame
    //     0x3ba21c: mov             SP, fp
    //     0x3ba220: ldp             fp, lr, [SP], #0x10
    // 0x3ba224: ret
    //     0x3ba224: ret             
    // 0x3ba228: r1 = Function '<anonymous closure>':.
    //     0x3ba228: add             x1, PP, #0x13, lsl #12  ; [pp+0x137a8] Function: [dart:ui] Shader::Shader._ (0x56ea68)
    //     0x3ba22c: ldr             x1, [x1, #0x7a8]
    // 0x3ba230: r2 = Null
    //     0x3ba230: mov             x2, NULL
    // 0x3ba234: r0 = AllocateClosure()
    //     0x3ba234: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3ba238: ldur            x1, [fp, #-8]
    // 0x3ba23c: mov             x2, x0
    // 0x3ba240: r0 = setState()
    //     0x3ba240: bl              #0x2398d8  ; [package:flutter/src/widgets/framework.dart] State::setState
    // 0x3ba244: r0 = Null
    //     0x3ba244: mov             x0, NULL
    // 0x3ba248: LeaveFrame
    //     0x3ba248: mov             SP, fp
    //     0x3ba24c: ldp             fp, lr, [SP], #0x10
    // 0x3ba250: ret
    //     0x3ba250: ret             
    // 0x3ba254: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3ba254: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3ba258: b               #0x3ba1cc
    // 0x3ba25c: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3ba25c: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  [closure] Widget <anonymous closure>(dynamic, BuildContext, Animation<double>, Animation<double>) {
    // ** addr: 0x3ba260, size: 0x70
    // 0x3ba260: EnterFrame
    //     0x3ba260: stp             fp, lr, [SP, #-0x10]!
    //     0x3ba264: mov             fp, SP
    // 0x3ba268: AllocStack(0x10)
    //     0x3ba268: sub             SP, SP, #0x10
    // 0x3ba26c: SetupParameters([dynamic _ /* r0 */])
    //     0x3ba26c: ldr             x0, [fp, #0x28]
    //     0x3ba270: ldur            w1, [x0, #0x17]
    //     0x3ba274: add             x1, x1, HEAP, lsl #32
    // 0x3ba278: CheckStackOverflow
    //     0x3ba278: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3ba27c: cmp             SP, x16
    //     0x3ba280: b.ls            #0x3ba2c4
    // 0x3ba284: LoadField: r0 = r1->field_f
    //     0x3ba284: ldur            w0, [x1, #0xf]
    // 0x3ba288: DecompressPointer r0
    //     0x3ba288: add             x0, x0, HEAP, lsl #32
    // 0x3ba28c: LoadField: r1 = r0->field_b
    //     0x3ba28c: ldur            w1, [x0, #0xb]
    // 0x3ba290: DecompressPointer r1
    //     0x3ba290: add             x1, x1, HEAP, lsl #32
    // 0x3ba294: cmp             w1, NULL
    // 0x3ba298: b.eq            #0x3ba2cc
    // 0x3ba29c: LoadField: r0 = r1->field_1f
    //     0x3ba29c: ldur            w0, [x1, #0x1f]
    // 0x3ba2a0: DecompressPointer r0
    //     0x3ba2a0: add             x0, x0, HEAP, lsl #32
    // 0x3ba2a4: ldr             x16, [fp, #0x20]
    // 0x3ba2a8: stp             x16, x0, [SP]
    // 0x3ba2ac: ClosureCall
    //     0x3ba2ac: ldr             x4, [PP, #0x530]  ; [pp+0x530] List(5) [0, 0x2, 0x2, 0x2, Null]
    //     0x3ba2b0: ldur            x2, [x0, #0x1f]
    //     0x3ba2b4: blr             x2
    // 0x3ba2b8: LeaveFrame
    //     0x3ba2b8: mov             SP, fp
    //     0x3ba2bc: ldp             fp, lr, [SP], #0x10
    // 0x3ba2c0: ret
    //     0x3ba2c0: ret             
    // 0x3ba2c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3ba2c4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3ba2c8: b               #0x3ba284
    // 0x3ba2cc: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3ba2cc: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
}

// class id: 2769, size: 0xc, field offset: 0xc
//   const constructor, 
class HomePage extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x400d28, size: 0xc94
    // 0x400d28: EnterFrame
    //     0x400d28: stp             fp, lr, [SP, #-0x10]!
    //     0x400d2c: mov             fp, SP
    // 0x400d30: AllocStack(0x58)
    //     0x400d30: sub             SP, SP, #0x58
    // 0x400d34: SetupParameters(HomePage this /* r1 => r0 */, dynamic _ /* r2 => r1 */)
    //     0x400d34: mov             x0, x1
    //     0x400d38: mov             x1, x2
    // 0x400d3c: CheckStackOverflow
    //     0x400d3c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x400d40: cmp             SP, x16
    //     0x400d44: b.ls            #0x4019b4
    // 0x400d48: r0 = of()
    //     0x400d48: bl              #0x31bb3c  ; [package:flutter/src/material/theme.dart] Theme::of
    // 0x400d4c: LoadField: r1 = r0->field_3f
    //     0x400d4c: ldur            w1, [x0, #0x3f]
    // 0x400d50: DecompressPointer r1
    //     0x400d50: add             x1, x1, HEAP, lsl #32
    // 0x400d54: LoadField: r0 = r1->field_7
    //     0x400d54: ldur            w0, [x1, #7]
    // 0x400d58: DecompressPointer r0
    //     0x400d58: add             x0, x0, HEAP, lsl #32
    // 0x400d5c: stur            x0, [fp, #-0x20]
    // 0x400d60: r16 = Instance_Brightness
    //     0x400d60: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x400d64: cmp             w0, w16
    // 0x400d68: b.ne            #0x400d74
    // 0x400d6c: r2 = Instance_Brightness
    //     0x400d6c: ldr             x2, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x400d70: b               #0x400d78
    // 0x400d74: r2 = Instance_Brightness
    //     0x400d74: ldr             x2, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x400d78: stur            x2, [fp, #-0x18]
    // 0x400d7c: LoadField: r3 = r1->field_7b
    //     0x400d7c: ldur            w3, [x1, #0x7b]
    // 0x400d80: DecompressPointer r3
    //     0x400d80: add             x3, x3, HEAP, lsl #32
    // 0x400d84: stur            x3, [fp, #-0x10]
    // 0x400d88: r16 = Instance_Brightness
    //     0x400d88: ldr             x16, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x400d8c: cmp             w0, w16
    // 0x400d90: b.ne            #0x400d9c
    // 0x400d94: r1 = Instance_Brightness
    //     0x400d94: ldr             x1, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x400d98: b               #0x400da0
    // 0x400d9c: r1 = Instance_Brightness
    //     0x400d9c: ldr             x1, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x400da0: stur            x1, [fp, #-8]
    // 0x400da4: r0 = SystemUiOverlayStyle()
    //     0x400da4: bl              #0x371638  ; AllocateSystemUiOverlayStyleStub -> SystemUiOverlayStyle (size=0x28)
    // 0x400da8: mov             x1, x0
    // 0x400dac: ldur            x0, [fp, #-0x10]
    // 0x400db0: stur            x1, [fp, #-0x28]
    // 0x400db4: StoreField: r1->field_7 = r0
    //     0x400db4: stur            w0, [x1, #7]
    // 0x400db8: ldur            x0, [fp, #-8]
    // 0x400dbc: StoreField: r1->field_f = r0
    //     0x400dbc: stur            w0, [x1, #0xf]
    // 0x400dc0: r0 = Instance_Color
    //     0x400dc0: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb28] Obj!Color@5ce711
    //     0x400dc4: ldr             x0, [x0, #0xb28]
    // 0x400dc8: ArrayStore: r1[0] = r0  ; List_4
    //     0x400dc8: stur            w0, [x1, #0x17]
    // 0x400dcc: ldur            x0, [fp, #-0x20]
    // 0x400dd0: StoreField: r1->field_1b = r0
    //     0x400dd0: stur            w0, [x1, #0x1b]
    // 0x400dd4: ldur            x0, [fp, #-0x18]
    // 0x400dd8: StoreField: r1->field_1f = r0
    //     0x400dd8: stur            w0, [x1, #0x1f]
    // 0x400ddc: r0 = LoadStaticField(0x468)
    //     0x400ddc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x400de0: ldr             x0, [x0, #0x8d0]
    // 0x400de4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400de8: cmp             w0, w16
    // 0x400dec: b.ne            #0x400df8
    // 0x400df0: r2 = instance
    //     0x400df0: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x400df4: r0 = InitLateFinalStaticField()
    //     0x400df4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x400df8: stur            x0, [fp, #-8]
    // 0x400dfc: r16 = <AppLocale, Translations>
    //     0x400dfc: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x400e00: stp             x0, x16, [SP]
    // 0x400e04: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x400e04: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x400e08: r0 = LocaleSettingsExt.currentTranslations()
    //     0x400e08: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x400e0c: r1 = LoadClassIdInstr(r0)
    //     0x400e0c: ldur            x1, [x0, #-1]
    //     0x400e10: ubfx            x1, x1, #0xc, #0x14
    // 0x400e14: cmp             x1, #0x8dd
    // 0x400e18: b.ne            #0x400e28
    // 0x400e1c: r0 = "Ricochlime"
    //     0x400e1c: add             x0, PP, #9, lsl #12  ; [pp+0x9110] "Ricochlime"
    //     0x400e20: ldr             x0, [x0, #0x110]
    // 0x400e24: b               #0x400e58
    // 0x400e28: cmp             x1, #0x8df
    // 0x400e2c: b.ne            #0x400e3c
    // 0x400e30: r0 = "Рикошлим"
    //     0x400e30: add             x0, PP, #9, lsl #12  ; [pp+0x9118] "Рикошлим"
    //     0x400e34: ldr             x0, [x0, #0x118]
    // 0x400e38: b               #0x400e58
    // 0x400e3c: cmp             x1, #0x8e0
    // 0x400e40: b.ne            #0x400e50
    // 0x400e44: r0 = "Рикошырыш"
    //     0x400e44: add             x0, PP, #9, lsl #12  ; [pp+0x9120] "Рикошырыш"
    //     0x400e48: ldr             x0, [x0, #0x120]
    // 0x400e4c: b               #0x400e58
    // 0x400e50: r0 = "Ricochlime"
    //     0x400e50: add             x0, PP, #9, lsl #12  ; [pp+0x9110] "Ricochlime"
    //     0x400e54: ldr             x0, [x0, #0x110]
    // 0x400e58: stur            x0, [fp, #-0x10]
    // 0x400e5c: r0 = Text()
    //     0x400e5c: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x400e60: mov             x3, x0
    // 0x400e64: ldur            x0, [fp, #-0x10]
    // 0x400e68: stur            x3, [fp, #-0x18]
    // 0x400e6c: StoreField: r3->field_b = r0
    //     0x400e6c: stur            w0, [x3, #0xb]
    // 0x400e70: r0 = Instance_TextStyle
    //     0x400e70: add             x0, PP, #0x10, lsl #12  ; [pp+0x10f68] Obj!TextStyle@5d57c1
    //     0x400e74: ldr             x0, [x0, #0xf68]
    // 0x400e78: StoreField: r3->field_13 = r0
    //     0x400e78: stur            w0, [x3, #0x13]
    // 0x400e7c: r1 = <Widget>
    //     0x400e7c: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x400e80: r2 = 20
    //     0x400e80: mov             x2, #0x14
    // 0x400e84: r0 = AllocateArray()
    //     0x400e84: bl              #0x5845d8  ; AllocateArrayStub
    // 0x400e88: mov             x1, x0
    // 0x400e8c: ldur            x0, [fp, #-0x18]
    // 0x400e90: stur            x1, [fp, #-0x10]
    // 0x400e94: StoreField: r1->field_f = r0
    //     0x400e94: stur            w0, [x1, #0xf]
    // 0x400e98: r0 = LoadStaticField(0xccc)
    //     0x400e98: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x400e9c: ldr             x0, [x0, #0x1998]
    // 0x400ea0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400ea4: cmp             w0, w16
    // 0x400ea8: b.ne            #0x400eb8
    // 0x400eac: r2 = stows
    //     0x400eac: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x400eb0: ldr             x2, [x2, #0x310]
    // 0x400eb4: r0 = InitLateFinalStaticField()
    //     0x400eb4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x400eb8: stur            x0, [fp, #-0x20]
    // 0x400ebc: LoadField: r1 = r0->field_1b
    //     0x400ebc: ldur            w1, [x0, #0x1b]
    // 0x400ec0: DecompressPointer r1
    //     0x400ec0: add             x1, x1, HEAP, lsl #32
    // 0x400ec4: stur            x1, [fp, #-0x18]
    // 0x400ec8: r0 = LoadStaticField(0xc74)
    //     0x400ec8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x400ecc: ldr             x0, [x0, #0x18e8]
    // 0x400ed0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400ed4: cmp             w0, w16
    // 0x400ed8: b.ne            #0x400ee8
    // 0x400edc: r2 = NesIcons
    //     0x400edc: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x400ee0: ldr             x2, [x2, #0xf70]
    // 0x400ee4: r0 = InitLateFinalStaticField()
    //     0x400ee4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x400ee8: mov             x1, x0
    // 0x400eec: stur            x0, [fp, #-0x30]
    // 0x400ef0: LoadField: r0 = r1->field_1f
    //     0x400ef0: ldur            w0, [x1, #0x1f]
    // 0x400ef4: DecompressPointer r0
    //     0x400ef4: add             x0, x0, HEAP, lsl #32
    // 0x400ef8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400efc: cmp             w0, w16
    // 0x400f00: b.ne            #0x400f10
    // 0x400f04: r2 = musicNote
    //     0x400f04: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f78] Field <NesIconCollection.musicNote>: late final (offset: 0x20)
    //     0x400f08: ldr             x2, [x2, #0xf78]
    // 0x400f0c: r0 = InitLateFinalInstanceField()
    //     0x400f0c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400f10: stur            x0, [fp, #-0x38]
    // 0x400f14: r0 = NesIconButton()
    //     0x400f14: bl              #0x37162c  ; AllocateNesIconButtonStub -> NesIconButton (size=0x3c)
    // 0x400f18: mov             x3, x0
    // 0x400f1c: ldur            x0, [fp, #-0x38]
    // 0x400f20: stur            x3, [fp, #-0x40]
    // 0x400f24: StoreField: r3->field_b = r0
    //     0x400f24: stur            w0, [x3, #0xb]
    // 0x400f28: r1 = Function '<anonymous closure>':.
    //     0x400f28: add             x1, PP, #0x10, lsl #12  ; [pp+0x10f80] AnonymousClosure: (0x402818), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x400f2c: ldr             x1, [x1, #0xf80]
    // 0x400f30: r2 = Null
    //     0x400f30: mov             x2, NULL
    // 0x400f34: r0 = AllocateClosure()
    //     0x400f34: bl              #0x5838bc  ; AllocateClosureStub
    // 0x400f38: mov             x1, x0
    // 0x400f3c: ldur            x0, [fp, #-0x40]
    // 0x400f40: StoreField: r0->field_f = r1
    //     0x400f40: stur            w1, [x0, #0xf]
    // 0x400f44: r3 = Instance_Size
    //     0x400f44: add             x3, PP, #0x10, lsl #12  ; [pp+0x10f88] Obj!Size@5d0161
    //     0x400f48: ldr             x3, [x3, #0xf88]
    // 0x400f4c: StoreField: r0->field_2f = r3
    //     0x400f4c: stur            w3, [x0, #0x2f]
    // 0x400f50: r1 = Function '<anonymous closure>':.
    //     0x400f50: add             x1, PP, #0x10, lsl #12  ; [pp+0x10f90] AnonymousClosure: (0x4024e4), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x400f54: ldr             x1, [x1, #0xf90]
    // 0x400f58: r2 = Null
    //     0x400f58: mov             x2, NULL
    // 0x400f5c: r0 = AllocateClosure()
    //     0x400f5c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x400f60: stur            x0, [fp, #-0x38]
    // 0x400f64: r0 = ListenableBuilder()
    //     0x400f64: bl              #0x36797c  ; AllocateListenableBuilderStub -> ListenableBuilder (size=0x18)
    // 0x400f68: mov             x2, x0
    // 0x400f6c: ldur            x0, [fp, #-0x38]
    // 0x400f70: stur            x2, [fp, #-0x48]
    // 0x400f74: StoreField: r2->field_f = r0
    //     0x400f74: stur            w0, [x2, #0xf]
    // 0x400f78: ldur            x0, [fp, #-0x40]
    // 0x400f7c: StoreField: r2->field_13 = r0
    //     0x400f7c: stur            w0, [x2, #0x13]
    // 0x400f80: ldur            x0, [fp, #-0x18]
    // 0x400f84: StoreField: r2->field_b = r0
    //     0x400f84: stur            w0, [x2, #0xb]
    // 0x400f88: ldur            x0, [fp, #-0x20]
    // 0x400f8c: LoadField: r3 = r0->field_1f
    //     0x400f8c: ldur            w3, [x0, #0x1f]
    // 0x400f90: DecompressPointer r3
    //     0x400f90: add             x3, x3, HEAP, lsl #32
    // 0x400f94: ldur            x1, [fp, #-0x30]
    // 0x400f98: stur            x3, [fp, #-0x18]
    // 0x400f9c: LoadField: r0 = r1->field_43
    //     0x400f9c: ldur            w0, [x1, #0x43]
    // 0x400fa0: DecompressPointer r0
    //     0x400fa0: add             x0, x0, HEAP, lsl #32
    // 0x400fa4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400fa8: cmp             w0, w16
    // 0x400fac: b.ne            #0x400fbc
    // 0x400fb0: r2 = bell
    //     0x400fb0: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f98] Field <NesIconCollection.bell>: late final (offset: 0x44)
    //     0x400fb4: ldr             x2, [x2, #0xf98]
    // 0x400fb8: r0 = InitLateFinalInstanceField()
    //     0x400fb8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400fbc: stur            x0, [fp, #-0x20]
    // 0x400fc0: r0 = NesIconButton()
    //     0x400fc0: bl              #0x37162c  ; AllocateNesIconButtonStub -> NesIconButton (size=0x3c)
    // 0x400fc4: mov             x3, x0
    // 0x400fc8: ldur            x0, [fp, #-0x20]
    // 0x400fcc: stur            x3, [fp, #-0x38]
    // 0x400fd0: StoreField: r3->field_b = r0
    //     0x400fd0: stur            w0, [x3, #0xb]
    // 0x400fd4: r1 = Function '<anonymous closure>':.
    //     0x400fd4: add             x1, PP, #0x10, lsl #12  ; [pp+0x10fa0] AnonymousClosure: (0x4023ac), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x400fd8: ldr             x1, [x1, #0xfa0]
    // 0x400fdc: r2 = Null
    //     0x400fdc: mov             x2, NULL
    // 0x400fe0: r0 = AllocateClosure()
    //     0x400fe0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x400fe4: mov             x1, x0
    // 0x400fe8: ldur            x0, [fp, #-0x38]
    // 0x400fec: StoreField: r0->field_f = r1
    //     0x400fec: stur            w1, [x0, #0xf]
    // 0x400ff0: r1 = Instance_Size
    //     0x400ff0: add             x1, PP, #0x10, lsl #12  ; [pp+0x10f88] Obj!Size@5d0161
    //     0x400ff4: ldr             x1, [x1, #0xf88]
    // 0x400ff8: StoreField: r0->field_2f = r1
    //     0x400ff8: stur            w1, [x0, #0x2f]
    // 0x400ffc: r1 = Function '<anonymous closure>':.
    //     0x400ffc: add             x1, PP, #0x10, lsl #12  ; [pp+0x10fa8] AnonymousClosure: (0x401eb4), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x401000: ldr             x1, [x1, #0xfa8]
    // 0x401004: r2 = Null
    //     0x401004: mov             x2, NULL
    // 0x401008: r0 = AllocateClosure()
    //     0x401008: bl              #0x5838bc  ; AllocateClosureStub
    // 0x40100c: stur            x0, [fp, #-0x20]
    // 0x401010: r0 = ListenableBuilder()
    //     0x401010: bl              #0x36797c  ; AllocateListenableBuilderStub -> ListenableBuilder (size=0x18)
    // 0x401014: mov             x3, x0
    // 0x401018: ldur            x0, [fp, #-0x20]
    // 0x40101c: stur            x3, [fp, #-0x40]
    // 0x401020: StoreField: r3->field_f = r0
    //     0x401020: stur            w0, [x3, #0xf]
    // 0x401024: ldur            x0, [fp, #-0x38]
    // 0x401028: StoreField: r3->field_13 = r0
    //     0x401028: stur            w0, [x3, #0x13]
    // 0x40102c: ldur            x0, [fp, #-0x18]
    // 0x401030: StoreField: r3->field_b = r0
    //     0x401030: stur            w0, [x3, #0xb]
    // 0x401034: r1 = Null
    //     0x401034: mov             x1, NULL
    // 0x401038: r2 = 4
    //     0x401038: mov             x2, #4
    // 0x40103c: r0 = AllocateArray()
    //     0x40103c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x401040: mov             x2, x0
    // 0x401044: ldur            x0, [fp, #-0x48]
    // 0x401048: stur            x2, [fp, #-0x18]
    // 0x40104c: StoreField: r2->field_f = r0
    //     0x40104c: stur            w0, [x2, #0xf]
    // 0x401050: ldur            x0, [fp, #-0x40]
    // 0x401054: StoreField: r2->field_13 = r0
    //     0x401054: stur            w0, [x2, #0x13]
    // 0x401058: r1 = <Widget>
    //     0x401058: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x40105c: r0 = AllocateGrowableArray()
    //     0x40105c: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x401060: mov             x1, x0
    // 0x401064: ldur            x0, [fp, #-0x18]
    // 0x401068: stur            x1, [fp, #-0x20]
    // 0x40106c: StoreField: r1->field_f = r0
    //     0x40106c: stur            w0, [x1, #0xf]
    // 0x401070: r0 = 4
    //     0x401070: mov             x0, #4
    // 0x401074: StoreField: r1->field_b = r0
    //     0x401074: stur            w0, [x1, #0xb]
    // 0x401078: r0 = Row()
    //     0x401078: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x40107c: mov             x1, x0
    // 0x401080: r0 = Instance_Axis
    //     0x401080: ldr             x0, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x401084: StoreField: r1->field_f = r0
    //     0x401084: stur            w0, [x1, #0xf]
    // 0x401088: r2 = Instance_MainAxisAlignment
    //     0x401088: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x40108c: ldr             x2, [x2, #0xfb0]
    // 0x401090: StoreField: r1->field_13 = r2
    //     0x401090: stur            w2, [x1, #0x13]
    // 0x401094: r3 = Instance_MainAxisSize
    //     0x401094: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x401098: ldr             x3, [x3, #0xfb8]
    // 0x40109c: ArrayStore: r1[0] = r3  ; List_4
    //     0x40109c: stur            w3, [x1, #0x17]
    // 0x4010a0: r4 = Instance_CrossAxisAlignment
    //     0x4010a0: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x4010a4: ldr             x4, [x4, #0xfc0]
    // 0x4010a8: StoreField: r1->field_1b = r4
    //     0x4010a8: stur            w4, [x1, #0x1b]
    // 0x4010ac: r5 = Instance_VerticalDirection
    //     0x4010ac: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x4010b0: ldr             x5, [x5, #0xfc8]
    // 0x4010b4: StoreField: r1->field_23 = r5
    //     0x4010b4: stur            w5, [x1, #0x23]
    // 0x4010b8: r6 = Instance_Clip
    //     0x4010b8: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x4010bc: ldr             x6, [x6, #0xfd0]
    // 0x4010c0: StoreField: r1->field_2b = r6
    //     0x4010c0: stur            w6, [x1, #0x2b]
    // 0x4010c4: d0 = 8.000000
    //     0x4010c4: fmov            d0, #8.00000000
    // 0x4010c8: StoreField: r1->field_2f = d0
    //     0x4010c8: stur            d0, [x1, #0x2f]
    // 0x4010cc: ldur            x0, [fp, #-0x20]
    // 0x4010d0: StoreField: r1->field_b = r0
    //     0x4010d0: stur            w0, [x1, #0xb]
    // 0x4010d4: mov             x0, x1
    // 0x4010d8: ldur            x1, [fp, #-0x10]
    // 0x4010dc: ArrayStore: r1[1] = r0  ; List_4
    //     0x4010dc: add             x25, x1, #0x13
    //     0x4010e0: str             w0, [x25]
    //     0x4010e4: tbz             w0, #0, #0x401100
    //     0x4010e8: ldurb           w16, [x1, #-1]
    //     0x4010ec: ldurb           w17, [x0, #-1]
    //     0x4010f0: and             x16, x17, x16, lsr #2
    //     0x4010f4: tst             x16, HEAP, lsr #32
    //     0x4010f8: b.eq            #0x401100
    //     0x4010fc: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x401100: ldur            x0, [fp, #-0x10]
    // 0x401104: r16 = Instance_SizedBox
    //     0x401104: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x401108: ldr             x16, [x16, #0xfd8]
    // 0x40110c: ArrayStore: r0[0] = r16  ; List_4
    //     0x40110c: stur            w16, [x0, #0x17]
    // 0x401110: ldur            x1, [fp, #-0x30]
    // 0x401114: LoadField: r0 = r1->field_3f
    //     0x401114: ldur            w0, [x1, #0x3f]
    // 0x401118: DecompressPointer r0
    //     0x401118: add             x0, x0, HEAP, lsl #32
    // 0x40111c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401120: cmp             w0, w16
    // 0x401124: b.ne            #0x401134
    // 0x401128: r2 = play
    //     0x401128: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fe0] Field <NesIconCollection.play>: late final (offset: 0x40)
    //     0x40112c: ldr             x2, [x2, #0xfe0]
    // 0x401130: r0 = InitLateFinalInstanceField()
    //     0x401130: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401134: stur            x0, [fp, #-0x18]
    // 0x401138: r16 = <AppLocale, Translations>
    //     0x401138: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x40113c: ldur            lr, [fp, #-8]
    // 0x401140: stp             lr, x16, [SP]
    // 0x401144: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x401144: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x401148: r0 = LocaleSettingsExt.currentTranslations()
    //     0x401148: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x40114c: r1 = LoadClassIdInstr(r0)
    //     0x40114c: ldur            x1, [x0, #-1]
    //     0x401150: ubfx            x1, x1, #0xc, #0x14
    // 0x401154: cmp             x1, #0x8dd
    // 0x401158: b.ne            #0x401184
    // 0x40115c: mov             x1, x0
    // 0x401160: LoadField: r0 = r1->field_f
    //     0x401160: ldur            w0, [x1, #0xf]
    // 0x401164: DecompressPointer r0
    //     0x401164: add             x0, x0, HEAP, lsl #32
    // 0x401168: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40116c: cmp             w0, w16
    // 0x401170: b.ne            #0x401180
    // 0x401174: r2 = homePage
    //     0x401174: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fe8] Field <Translations.homePage>: late final (offset: 0x10)
    //     0x401178: ldr             x2, [x2, #0xfe8]
    // 0x40117c: r0 = InitLateFinalInstanceField()
    //     0x40117c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401180: b               #0x401208
    // 0x401184: cmp             x1, #0x8df
    // 0x401188: b.ne            #0x4011b4
    // 0x40118c: mov             x1, x0
    // 0x401190: LoadField: r0 = r1->field_33
    //     0x401190: ldur            w0, [x1, #0x33]
    // 0x401194: DecompressPointer r0
    //     0x401194: add             x0, x0, HEAP, lsl #32
    // 0x401198: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40119c: cmp             w0, w16
    // 0x4011a0: b.ne            #0x4011b0
    // 0x4011a4: r2 = homePage
    //     0x4011a4: add             x2, PP, #0x10, lsl #12  ; [pp+0x10ff0] Field <TranslationsRu.homePage>: late final (offset: 0x34)
    //     0x4011a8: ldr             x2, [x2, #0xff0]
    // 0x4011ac: r0 = InitLateFinalInstanceField()
    //     0x4011ac: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4011b0: b               #0x401208
    // 0x4011b4: cmp             x1, #0x8e0
    // 0x4011b8: b.ne            #0x4011e4
    // 0x4011bc: mov             x1, x0
    // 0x4011c0: LoadField: r0 = r1->field_33
    //     0x4011c0: ldur            w0, [x1, #0x33]
    // 0x4011c4: DecompressPointer r0
    //     0x4011c4: add             x0, x0, HEAP, lsl #32
    // 0x4011c8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4011cc: cmp             w0, w16
    // 0x4011d0: b.ne            #0x4011e0
    // 0x4011d4: r2 = homePage
    //     0x4011d4: add             x2, PP, #0x10, lsl #12  ; [pp+0x10ff8] Field <TranslationsKk.homePage>: late final (offset: 0x34)
    //     0x4011d8: ldr             x2, [x2, #0xff8]
    // 0x4011dc: r0 = InitLateFinalInstanceField()
    //     0x4011dc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4011e0: b               #0x401208
    // 0x4011e4: mov             x1, x0
    // 0x4011e8: LoadField: r0 = r1->field_33
    //     0x4011e8: ldur            w0, [x1, #0x33]
    // 0x4011ec: DecompressPointer r0
    //     0x4011ec: add             x0, x0, HEAP, lsl #32
    // 0x4011f0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4011f4: cmp             w0, w16
    // 0x4011f8: b.ne            #0x401208
    // 0x4011fc: r2 = homePage
    //     0x4011fc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11000] Field <TranslationsEs.homePage>: late final (offset: 0x34)
    //     0x401200: ldr             x2, [x2]
    // 0x401204: r0 = InitLateFinalInstanceField()
    //     0x401204: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401208: r1 = LoadClassIdInstr(r0)
    //     0x401208: ldur            x1, [x0, #-1]
    //     0x40120c: ubfx            x1, x1, #0xc, #0x14
    // 0x401210: cmp             x1, #0xfc
    // 0x401214: b.ne            #0x401224
    // 0x401218: r3 = "Play"
    //     0x401218: add             x3, PP, #0x11, lsl #12  ; [pp+0x11008] "Play"
    //     0x40121c: ldr             x3, [x3, #8]
    // 0x401220: b               #0x401254
    // 0x401224: cmp             x1, #0xfd
    // 0x401228: b.ne            #0x401238
    // 0x40122c: r3 = "Играть"
    //     0x40122c: add             x3, PP, #0x11, lsl #12  ; [pp+0x11010] "Играть"
    //     0x401230: ldr             x3, [x3, #0x10]
    // 0x401234: b               #0x401254
    // 0x401238: cmp             x1, #0xfe
    // 0x40123c: b.ne            #0x40124c
    // 0x401240: r3 = "Ойнау"
    //     0x401240: add             x3, PP, #0x11, lsl #12  ; [pp+0x11018] "Ойнау"
    //     0x401244: ldr             x3, [x3, #0x18]
    // 0x401248: b               #0x401254
    // 0x40124c: r3 = "Jugar"
    //     0x40124c: add             x3, PP, #0x11, lsl #12  ; [pp+0x11020] "Jugar"
    //     0x401250: ldr             x3, [x3, #0x20]
    // 0x401254: ldur            x2, [fp, #-0x10]
    // 0x401258: ldur            x0, [fp, #-0x18]
    // 0x40125c: stur            x3, [fp, #-0x20]
    // 0x401260: r1 = Null
    //     0x401260: mov             x1, NULL
    // 0x401264: r0 = _HomePageButton()
    //     0x401264: bl              #0x4019bc  ; Allocate_HomePageButtonStub -> _HomePageButton<X0> (size=0x24)
    // 0x401268: mov             x3, x0
    // 0x40126c: r0 = Instance_NesButtonType
    //     0x40126c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11028] Obj!NesButtonType@5d8e31
    //     0x401270: ldr             x0, [x0, #0x28]
    // 0x401274: stur            x3, [fp, #-0x38]
    // 0x401278: StoreField: r3->field_f = r0
    //     0x401278: stur            w0, [x3, #0xf]
    // 0x40127c: ldur            x0, [fp, #-0x18]
    // 0x401280: StoreField: r3->field_13 = r0
    //     0x401280: stur            w0, [x3, #0x13]
    // 0x401284: ldur            x0, [fp, #-0x20]
    // 0x401288: StoreField: r3->field_1b = r0
    //     0x401288: stur            w0, [x3, #0x1b]
    // 0x40128c: r1 = Function '<anonymous closure>':.
    //     0x40128c: add             x1, PP, #0x11, lsl #12  ; [pp+0x11030] AnonymousClosure: (0x401c98), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x401290: ldr             x1, [x1, #0x30]
    // 0x401294: r2 = Null
    //     0x401294: mov             x2, NULL
    // 0x401298: r0 = AllocateClosure()
    //     0x401298: bl              #0x5838bc  ; AllocateClosureStub
    // 0x40129c: mov             x1, x0
    // 0x4012a0: ldur            x0, [fp, #-0x38]
    // 0x4012a4: StoreField: r0->field_1f = r1
    //     0x4012a4: stur            w1, [x0, #0x1f]
    // 0x4012a8: ldur            x1, [fp, #-0x10]
    // 0x4012ac: ArrayStore: r1[3] = r0  ; List_4
    //     0x4012ac: add             x25, x1, #0x1b
    //     0x4012b0: str             w0, [x25]
    //     0x4012b4: tbz             w0, #0, #0x4012d0
    //     0x4012b8: ldurb           w16, [x1, #-1]
    //     0x4012bc: ldurb           w17, [x0, #-1]
    //     0x4012c0: and             x16, x17, x16, lsr #2
    //     0x4012c4: tst             x16, HEAP, lsr #32
    //     0x4012c8: b.eq            #0x4012d0
    //     0x4012cc: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x4012d0: ldur            x0, [fp, #-0x10]
    // 0x4012d4: r16 = Instance_SizedBox
    //     0x4012d4: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x4012d8: ldr             x16, [x16, #0xfd8]
    // 0x4012dc: StoreField: r0->field_1f = r16
    //     0x4012dc: stur            w16, [x0, #0x1f]
    // 0x4012e0: ldur            x1, [fp, #-0x30]
    // 0x4012e4: LoadField: r0 = r1->field_3b
    //     0x4012e4: ldur            w0, [x1, #0x3b]
    // 0x4012e8: DecompressPointer r0
    //     0x4012e8: add             x0, x0, HEAP, lsl #32
    // 0x4012ec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4012f0: cmp             w0, w16
    // 0x4012f4: b.ne            #0x401304
    // 0x4012f8: r2 = market
    //     0x4012f8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11038] Field <NesIconCollection.market>: late final (offset: 0x3c)
    //     0x4012fc: ldr             x2, [x2, #0x38]
    // 0x401300: r0 = InitLateFinalInstanceField()
    //     0x401300: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401304: stur            x0, [fp, #-0x18]
    // 0x401308: r16 = <AppLocale, Translations>
    //     0x401308: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x40130c: ldur            lr, [fp, #-8]
    // 0x401310: stp             lr, x16, [SP]
    // 0x401314: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x401314: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x401318: r0 = LocaleSettingsExt.currentTranslations()
    //     0x401318: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x40131c: r1 = LoadClassIdInstr(r0)
    //     0x40131c: ldur            x1, [x0, #-1]
    //     0x401320: ubfx            x1, x1, #0xc, #0x14
    // 0x401324: cmp             x1, #0x8dd
    // 0x401328: b.ne            #0x401354
    // 0x40132c: mov             x1, x0
    // 0x401330: LoadField: r0 = r1->field_f
    //     0x401330: ldur            w0, [x1, #0xf]
    // 0x401334: DecompressPointer r0
    //     0x401334: add             x0, x0, HEAP, lsl #32
    // 0x401338: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40133c: cmp             w0, w16
    // 0x401340: b.ne            #0x401350
    // 0x401344: r2 = homePage
    //     0x401344: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fe8] Field <Translations.homePage>: late final (offset: 0x10)
    //     0x401348: ldr             x2, [x2, #0xfe8]
    // 0x40134c: r0 = InitLateFinalInstanceField()
    //     0x40134c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401350: b               #0x4013d8
    // 0x401354: cmp             x1, #0x8df
    // 0x401358: b.ne            #0x401384
    // 0x40135c: mov             x1, x0
    // 0x401360: LoadField: r0 = r1->field_33
    //     0x401360: ldur            w0, [x1, #0x33]
    // 0x401364: DecompressPointer r0
    //     0x401364: add             x0, x0, HEAP, lsl #32
    // 0x401368: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40136c: cmp             w0, w16
    // 0x401370: b.ne            #0x401380
    // 0x401374: r2 = homePage
    //     0x401374: add             x2, PP, #0x10, lsl #12  ; [pp+0x10ff0] Field <TranslationsRu.homePage>: late final (offset: 0x34)
    //     0x401378: ldr             x2, [x2, #0xff0]
    // 0x40137c: r0 = InitLateFinalInstanceField()
    //     0x40137c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401380: b               #0x4013d8
    // 0x401384: cmp             x1, #0x8e0
    // 0x401388: b.ne            #0x4013b4
    // 0x40138c: mov             x1, x0
    // 0x401390: LoadField: r0 = r1->field_33
    //     0x401390: ldur            w0, [x1, #0x33]
    // 0x401394: DecompressPointer r0
    //     0x401394: add             x0, x0, HEAP, lsl #32
    // 0x401398: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40139c: cmp             w0, w16
    // 0x4013a0: b.ne            #0x4013b0
    // 0x4013a4: r2 = homePage
    //     0x4013a4: add             x2, PP, #0x10, lsl #12  ; [pp+0x10ff8] Field <TranslationsKk.homePage>: late final (offset: 0x34)
    //     0x4013a8: ldr             x2, [x2, #0xff8]
    // 0x4013ac: r0 = InitLateFinalInstanceField()
    //     0x4013ac: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4013b0: b               #0x4013d8
    // 0x4013b4: mov             x1, x0
    // 0x4013b8: LoadField: r0 = r1->field_33
    //     0x4013b8: ldur            w0, [x1, #0x33]
    // 0x4013bc: DecompressPointer r0
    //     0x4013bc: add             x0, x0, HEAP, lsl #32
    // 0x4013c0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4013c4: cmp             w0, w16
    // 0x4013c8: b.ne            #0x4013d8
    // 0x4013cc: r2 = homePage
    //     0x4013cc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11000] Field <TranslationsEs.homePage>: late final (offset: 0x34)
    //     0x4013d0: ldr             x2, [x2]
    // 0x4013d4: r0 = InitLateFinalInstanceField()
    //     0x4013d4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4013d8: r1 = LoadClassIdInstr(r0)
    //     0x4013d8: ldur            x1, [x0, #-1]
    //     0x4013dc: ubfx            x1, x1, #0xc, #0x14
    // 0x4013e0: cmp             x1, #0xfc
    // 0x4013e4: b.ne            #0x4013f4
    // 0x4013e8: r3 = "Shop"
    //     0x4013e8: add             x3, PP, #0x11, lsl #12  ; [pp+0x11040] "Shop"
    //     0x4013ec: ldr             x3, [x3, #0x40]
    // 0x4013f0: b               #0x401424
    // 0x4013f4: cmp             x1, #0xfd
    // 0x4013f8: b.ne            #0x401408
    // 0x4013fc: r3 = "Купить"
    //     0x4013fc: add             x3, PP, #0x11, lsl #12  ; [pp+0x11048] "Купить"
    //     0x401400: ldr             x3, [x3, #0x48]
    // 0x401404: b               #0x401424
    // 0x401408: cmp             x1, #0xfe
    // 0x40140c: b.ne            #0x40141c
    // 0x401410: r3 = "дүкен"
    //     0x401410: add             x3, PP, #0x11, lsl #12  ; [pp+0x11050] "дүкен"
    //     0x401414: ldr             x3, [x3, #0x50]
    // 0x401418: b               #0x401424
    // 0x40141c: r3 = "Comercio"
    //     0x40141c: add             x3, PP, #0x11, lsl #12  ; [pp+0x11058] "Comercio"
    //     0x401420: ldr             x3, [x3, #0x58]
    // 0x401424: ldur            x2, [fp, #-0x10]
    // 0x401428: ldur            x0, [fp, #-0x18]
    // 0x40142c: stur            x3, [fp, #-0x20]
    // 0x401430: r1 = Null
    //     0x401430: mov             x1, NULL
    // 0x401434: r0 = _HomePageButton()
    //     0x401434: bl              #0x4019bc  ; Allocate_HomePageButtonStub -> _HomePageButton<X0> (size=0x24)
    // 0x401438: mov             x3, x0
    // 0x40143c: r0 = Instance_NesButtonType
    //     0x40143c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11060] Obj!NesButtonType@5d8e11
    //     0x401440: ldr             x0, [x0, #0x60]
    // 0x401444: stur            x3, [fp, #-0x38]
    // 0x401448: StoreField: r3->field_f = r0
    //     0x401448: stur            w0, [x3, #0xf]
    // 0x40144c: ldur            x1, [fp, #-0x18]
    // 0x401450: StoreField: r3->field_13 = r1
    //     0x401450: stur            w1, [x3, #0x13]
    // 0x401454: r1 = Function '<anonymous closure>':.
    //     0x401454: add             x1, PP, #0x11, lsl #12  ; [pp+0x11068] AnonymousClosure: (0x401a84), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x401458: ldr             x1, [x1, #0x68]
    // 0x40145c: r2 = Null
    //     0x40145c: mov             x2, NULL
    // 0x401460: r0 = AllocateClosure()
    //     0x401460: bl              #0x5838bc  ; AllocateClosureStub
    // 0x401464: mov             x1, x0
    // 0x401468: ldur            x0, [fp, #-0x38]
    // 0x40146c: ArrayStore: r0[0] = r1  ; List_4
    //     0x40146c: stur            w1, [x0, #0x17]
    // 0x401470: ldur            x1, [fp, #-0x20]
    // 0x401474: StoreField: r0->field_1b = r1
    //     0x401474: stur            w1, [x0, #0x1b]
    // 0x401478: r1 = Function '<anonymous closure>':.
    //     0x401478: add             x1, PP, #0x11, lsl #12  ; [pp+0x11070] AnonymousClosure: (0x401a78), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x40147c: ldr             x1, [x1, #0x70]
    // 0x401480: r2 = Null
    //     0x401480: mov             x2, NULL
    // 0x401484: r0 = AllocateClosure()
    //     0x401484: bl              #0x5838bc  ; AllocateClosureStub
    // 0x401488: mov             x1, x0
    // 0x40148c: ldur            x0, [fp, #-0x38]
    // 0x401490: StoreField: r0->field_1f = r1
    //     0x401490: stur            w1, [x0, #0x1f]
    // 0x401494: ldur            x1, [fp, #-0x10]
    // 0x401498: ArrayStore: r1[5] = r0  ; List_4
    //     0x401498: add             x25, x1, #0x23
    //     0x40149c: str             w0, [x25]
    //     0x4014a0: tbz             w0, #0, #0x4014bc
    //     0x4014a4: ldurb           w16, [x1, #-1]
    //     0x4014a8: ldurb           w17, [x0, #-1]
    //     0x4014ac: and             x16, x17, x16, lsr #2
    //     0x4014b0: tst             x16, HEAP, lsr #32
    //     0x4014b4: b.eq            #0x4014bc
    //     0x4014b8: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x4014bc: ldur            x0, [fp, #-0x10]
    // 0x4014c0: r16 = Instance_SizedBox
    //     0x4014c0: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x4014c4: ldr             x16, [x16, #0xfd8]
    // 0x4014c8: StoreField: r0->field_27 = r16
    //     0x4014c8: stur            w16, [x0, #0x27]
    // 0x4014cc: ldur            x1, [fp, #-0x30]
    // 0x4014d0: LoadField: r0 = r1->field_2b
    //     0x4014d0: ldur            w0, [x1, #0x2b]
    // 0x4014d4: DecompressPointer r0
    //     0x4014d4: add             x0, x0, HEAP, lsl #32
    // 0x4014d8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4014dc: cmp             w0, w16
    // 0x4014e0: b.ne            #0x4014f0
    // 0x4014e4: r2 = questionMarkBlock
    //     0x4014e4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11078] Field <NesIconCollection.questionMarkBlock>: late final (offset: 0x2c)
    //     0x4014e8: ldr             x2, [x2, #0x78]
    // 0x4014ec: r0 = InitLateFinalInstanceField()
    //     0x4014ec: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4014f0: stur            x0, [fp, #-0x18]
    // 0x4014f4: r16 = <AppLocale, Translations>
    //     0x4014f4: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4014f8: ldur            lr, [fp, #-8]
    // 0x4014fc: stp             lr, x16, [SP]
    // 0x401500: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x401500: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x401504: r0 = LocaleSettingsExt.currentTranslations()
    //     0x401504: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x401508: r1 = LoadClassIdInstr(r0)
    //     0x401508: ldur            x1, [x0, #-1]
    //     0x40150c: ubfx            x1, x1, #0xc, #0x14
    // 0x401510: cmp             x1, #0x8dd
    // 0x401514: b.ne            #0x401540
    // 0x401518: mov             x1, x0
    // 0x40151c: LoadField: r0 = r1->field_f
    //     0x40151c: ldur            w0, [x1, #0xf]
    // 0x401520: DecompressPointer r0
    //     0x401520: add             x0, x0, HEAP, lsl #32
    // 0x401524: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401528: cmp             w0, w16
    // 0x40152c: b.ne            #0x40153c
    // 0x401530: r2 = homePage
    //     0x401530: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fe8] Field <Translations.homePage>: late final (offset: 0x10)
    //     0x401534: ldr             x2, [x2, #0xfe8]
    // 0x401538: r0 = InitLateFinalInstanceField()
    //     0x401538: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40153c: b               #0x4015c4
    // 0x401540: cmp             x1, #0x8df
    // 0x401544: b.ne            #0x401570
    // 0x401548: mov             x1, x0
    // 0x40154c: LoadField: r0 = r1->field_33
    //     0x40154c: ldur            w0, [x1, #0x33]
    // 0x401550: DecompressPointer r0
    //     0x401550: add             x0, x0, HEAP, lsl #32
    // 0x401554: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401558: cmp             w0, w16
    // 0x40155c: b.ne            #0x40156c
    // 0x401560: r2 = homePage
    //     0x401560: add             x2, PP, #0x10, lsl #12  ; [pp+0x10ff0] Field <TranslationsRu.homePage>: late final (offset: 0x34)
    //     0x401564: ldr             x2, [x2, #0xff0]
    // 0x401568: r0 = InitLateFinalInstanceField()
    //     0x401568: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40156c: b               #0x4015c4
    // 0x401570: cmp             x1, #0x8e0
    // 0x401574: b.ne            #0x4015a0
    // 0x401578: mov             x1, x0
    // 0x40157c: LoadField: r0 = r1->field_33
    //     0x40157c: ldur            w0, [x1, #0x33]
    // 0x401580: DecompressPointer r0
    //     0x401580: add             x0, x0, HEAP, lsl #32
    // 0x401584: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401588: cmp             w0, w16
    // 0x40158c: b.ne            #0x40159c
    // 0x401590: r2 = homePage
    //     0x401590: add             x2, PP, #0x10, lsl #12  ; [pp+0x10ff8] Field <TranslationsKk.homePage>: late final (offset: 0x34)
    //     0x401594: ldr             x2, [x2, #0xff8]
    // 0x401598: r0 = InitLateFinalInstanceField()
    //     0x401598: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40159c: b               #0x4015c4
    // 0x4015a0: mov             x1, x0
    // 0x4015a4: LoadField: r0 = r1->field_33
    //     0x4015a4: ldur            w0, [x1, #0x33]
    // 0x4015a8: DecompressPointer r0
    //     0x4015a8: add             x0, x0, HEAP, lsl #32
    // 0x4015ac: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4015b0: cmp             w0, w16
    // 0x4015b4: b.ne            #0x4015c4
    // 0x4015b8: r2 = homePage
    //     0x4015b8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11000] Field <TranslationsEs.homePage>: late final (offset: 0x34)
    //     0x4015bc: ldr             x2, [x2]
    // 0x4015c0: r0 = InitLateFinalInstanceField()
    //     0x4015c0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4015c4: r1 = LoadClassIdInstr(r0)
    //     0x4015c4: ldur            x1, [x0, #-1]
    //     0x4015c8: ubfx            x1, x1, #0xc, #0x14
    // 0x4015cc: cmp             x1, #0xfc
    // 0x4015d0: b.ne            #0x4015e0
    // 0x4015d4: r3 = "Tutorial"
    //     0x4015d4: add             x3, PP, #0x11, lsl #12  ; [pp+0x11080] "Tutorial"
    //     0x4015d8: ldr             x3, [x3, #0x80]
    // 0x4015dc: b               #0x401610
    // 0x4015e0: cmp             x1, #0xfd
    // 0x4015e4: b.ne            #0x4015f4
    // 0x4015e8: r3 = "Как играть"
    //     0x4015e8: add             x3, PP, #0x11, lsl #12  ; [pp+0x11088] "Как играть"
    //     0x4015ec: ldr             x3, [x3, #0x88]
    // 0x4015f0: b               #0x401610
    // 0x4015f4: cmp             x1, #0xfe
    // 0x4015f8: b.ne            #0x401608
    // 0x4015fc: r3 = "Нұсқаулық"
    //     0x4015fc: add             x3, PP, #0x11, lsl #12  ; [pp+0x11090] "Нұсқаулық"
    //     0x401600: ldr             x3, [x3, #0x90]
    // 0x401604: b               #0x401610
    // 0x401608: r3 = "tutorial"
    //     0x401608: add             x3, PP, #0x11, lsl #12  ; [pp+0x11098] "tutorial"
    //     0x40160c: ldr             x3, [x3, #0x98]
    // 0x401610: ldur            x2, [fp, #-0x10]
    // 0x401614: ldur            x0, [fp, #-0x18]
    // 0x401618: stur            x3, [fp, #-0x20]
    // 0x40161c: r1 = Null
    //     0x40161c: mov             x1, NULL
    // 0x401620: r0 = _HomePageButton()
    //     0x401620: bl              #0x4019bc  ; Allocate_HomePageButtonStub -> _HomePageButton<X0> (size=0x24)
    // 0x401624: mov             x3, x0
    // 0x401628: r0 = Instance_NesButtonType
    //     0x401628: add             x0, PP, #0x11, lsl #12  ; [pp+0x11060] Obj!NesButtonType@5d8e11
    //     0x40162c: ldr             x0, [x0, #0x60]
    // 0x401630: stur            x3, [fp, #-0x38]
    // 0x401634: StoreField: r3->field_f = r0
    //     0x401634: stur            w0, [x3, #0xf]
    // 0x401638: ldur            x1, [fp, #-0x18]
    // 0x40163c: StoreField: r3->field_13 = r1
    //     0x40163c: stur            w1, [x3, #0x13]
    // 0x401640: ldur            x1, [fp, #-0x20]
    // 0x401644: StoreField: r3->field_1b = r1
    //     0x401644: stur            w1, [x3, #0x1b]
    // 0x401648: r1 = Function '<anonymous closure>':.
    //     0x401648: add             x1, PP, #0x11, lsl #12  ; [pp+0x110a0] AnonymousClosure: (0x401a20), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x40164c: ldr             x1, [x1, #0xa0]
    // 0x401650: r2 = Null
    //     0x401650: mov             x2, NULL
    // 0x401654: r0 = AllocateClosure()
    //     0x401654: bl              #0x5838bc  ; AllocateClosureStub
    // 0x401658: mov             x1, x0
    // 0x40165c: ldur            x0, [fp, #-0x38]
    // 0x401660: StoreField: r0->field_1f = r1
    //     0x401660: stur            w1, [x0, #0x1f]
    // 0x401664: ldur            x1, [fp, #-0x10]
    // 0x401668: ArrayStore: r1[7] = r0  ; List_4
    //     0x401668: add             x25, x1, #0x2b
    //     0x40166c: str             w0, [x25]
    //     0x401670: tbz             w0, #0, #0x40168c
    //     0x401674: ldurb           w16, [x1, #-1]
    //     0x401678: ldurb           w17, [x0, #-1]
    //     0x40167c: and             x16, x17, x16, lsr #2
    //     0x401680: tst             x16, HEAP, lsr #32
    //     0x401684: b.eq            #0x40168c
    //     0x401688: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x40168c: ldur            x0, [fp, #-0x10]
    // 0x401690: r16 = Instance_SizedBox
    //     0x401690: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x401694: ldr             x16, [x16, #0xfd8]
    // 0x401698: StoreField: r0->field_2f = r16
    //     0x401698: stur            w16, [x0, #0x2f]
    // 0x40169c: ldur            x1, [fp, #-0x30]
    // 0x4016a0: LoadField: r0 = r1->field_13
    //     0x4016a0: ldur            w0, [x1, #0x13]
    // 0x4016a4: DecompressPointer r0
    //     0x4016a4: add             x0, x0, HEAP, lsl #32
    // 0x4016a8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4016ac: cmp             w0, w16
    // 0x4016b0: b.ne            #0x4016c0
    // 0x4016b4: r2 = gamepad
    //     0x4016b4: add             x2, PP, #0x11, lsl #12  ; [pp+0x110a8] Field <NesIconCollection.gamepad>: late final (offset: 0x14)
    //     0x4016b8: ldr             x2, [x2, #0xa8]
    // 0x4016bc: r0 = InitLateFinalInstanceField()
    //     0x4016bc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4016c0: stur            x0, [fp, #-0x18]
    // 0x4016c4: r16 = <AppLocale, Translations>
    //     0x4016c4: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x4016c8: ldur            lr, [fp, #-8]
    // 0x4016cc: stp             lr, x16, [SP]
    // 0x4016d0: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x4016d0: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x4016d4: r0 = LocaleSettingsExt.currentTranslations()
    //     0x4016d4: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x4016d8: r1 = LoadClassIdInstr(r0)
    //     0x4016d8: ldur            x1, [x0, #-1]
    //     0x4016dc: ubfx            x1, x1, #0xc, #0x14
    // 0x4016e0: cmp             x1, #0x8dd
    // 0x4016e4: b.ne            #0x401710
    // 0x4016e8: mov             x1, x0
    // 0x4016ec: LoadField: r0 = r1->field_f
    //     0x4016ec: ldur            w0, [x1, #0xf]
    // 0x4016f0: DecompressPointer r0
    //     0x4016f0: add             x0, x0, HEAP, lsl #32
    // 0x4016f4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4016f8: cmp             w0, w16
    // 0x4016fc: b.ne            #0x40170c
    // 0x401700: r2 = homePage
    //     0x401700: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fe8] Field <Translations.homePage>: late final (offset: 0x10)
    //     0x401704: ldr             x2, [x2, #0xfe8]
    // 0x401708: r0 = InitLateFinalInstanceField()
    //     0x401708: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40170c: b               #0x401794
    // 0x401710: cmp             x1, #0x8df
    // 0x401714: b.ne            #0x401740
    // 0x401718: mov             x1, x0
    // 0x40171c: LoadField: r0 = r1->field_33
    //     0x40171c: ldur            w0, [x1, #0x33]
    // 0x401720: DecompressPointer r0
    //     0x401720: add             x0, x0, HEAP, lsl #32
    // 0x401724: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401728: cmp             w0, w16
    // 0x40172c: b.ne            #0x40173c
    // 0x401730: r2 = homePage
    //     0x401730: add             x2, PP, #0x10, lsl #12  ; [pp+0x10ff0] Field <TranslationsRu.homePage>: late final (offset: 0x34)
    //     0x401734: ldr             x2, [x2, #0xff0]
    // 0x401738: r0 = InitLateFinalInstanceField()
    //     0x401738: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40173c: b               #0x401794
    // 0x401740: cmp             x1, #0x8e0
    // 0x401744: b.ne            #0x401770
    // 0x401748: mov             x1, x0
    // 0x40174c: LoadField: r0 = r1->field_33
    //     0x40174c: ldur            w0, [x1, #0x33]
    // 0x401750: DecompressPointer r0
    //     0x401750: add             x0, x0, HEAP, lsl #32
    // 0x401754: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401758: cmp             w0, w16
    // 0x40175c: b.ne            #0x40176c
    // 0x401760: r2 = homePage
    //     0x401760: add             x2, PP, #0x10, lsl #12  ; [pp+0x10ff8] Field <TranslationsKk.homePage>: late final (offset: 0x34)
    //     0x401764: ldr             x2, [x2, #0xff8]
    // 0x401768: r0 = InitLateFinalInstanceField()
    //     0x401768: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x40176c: b               #0x401794
    // 0x401770: mov             x1, x0
    // 0x401774: LoadField: r0 = r1->field_33
    //     0x401774: ldur            w0, [x1, #0x33]
    // 0x401778: DecompressPointer r0
    //     0x401778: add             x0, x0, HEAP, lsl #32
    // 0x40177c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401780: cmp             w0, w16
    // 0x401784: b.ne            #0x401794
    // 0x401788: r2 = homePage
    //     0x401788: add             x2, PP, #0x11, lsl #12  ; [pp+0x11000] Field <TranslationsEs.homePage>: late final (offset: 0x34)
    //     0x40178c: ldr             x2, [x2]
    // 0x401790: r0 = InitLateFinalInstanceField()
    //     0x401790: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401794: r1 = LoadClassIdInstr(r0)
    //     0x401794: ldur            x1, [x0, #-1]
    //     0x401798: ubfx            x1, x1, #0xc, #0x14
    // 0x40179c: cmp             x1, #0xfc
    // 0x4017a0: b.ne            #0x4017b0
    // 0x4017a4: r4 = "Settings"
    //     0x4017a4: add             x4, PP, #0x11, lsl #12  ; [pp+0x110b0] "Settings"
    //     0x4017a8: ldr             x4, [x4, #0xb0]
    // 0x4017ac: b               #0x4017e0
    // 0x4017b0: cmp             x1, #0xfd
    // 0x4017b4: b.ne            #0x4017c4
    // 0x4017b8: r4 = "Настройки"
    //     0x4017b8: add             x4, PP, #0x11, lsl #12  ; [pp+0x110b8] "Настройки"
    //     0x4017bc: ldr             x4, [x4, #0xb8]
    // 0x4017c0: b               #0x4017e0
    // 0x4017c4: cmp             x1, #0xfe
    // 0x4017c8: b.ne            #0x4017d8
    // 0x4017cc: r4 = "Баптау"
    //     0x4017cc: add             x4, PP, #0x11, lsl #12  ; [pp+0x110c0] "Баптау"
    //     0x4017d0: ldr             x4, [x4, #0xc0]
    // 0x4017d4: b               #0x4017e0
    // 0x4017d8: r4 = "Ajustes"
    //     0x4017d8: add             x4, PP, #0x11, lsl #12  ; [pp+0x110c8] "Ajustes"
    //     0x4017dc: ldr             x4, [x4, #0xc8]
    // 0x4017e0: ldur            x3, [fp, #-0x28]
    // 0x4017e4: ldur            x2, [fp, #-0x10]
    // 0x4017e8: ldur            x0, [fp, #-0x18]
    // 0x4017ec: stur            x4, [fp, #-8]
    // 0x4017f0: r1 = Null
    //     0x4017f0: mov             x1, NULL
    // 0x4017f4: r0 = _HomePageButton()
    //     0x4017f4: bl              #0x4019bc  ; Allocate_HomePageButtonStub -> _HomePageButton<X0> (size=0x24)
    // 0x4017f8: mov             x3, x0
    // 0x4017fc: r0 = Instance_NesButtonType
    //     0x4017fc: add             x0, PP, #0x11, lsl #12  ; [pp+0x11060] Obj!NesButtonType@5d8e11
    //     0x401800: ldr             x0, [x0, #0x60]
    // 0x401804: stur            x3, [fp, #-0x20]
    // 0x401808: StoreField: r3->field_f = r0
    //     0x401808: stur            w0, [x3, #0xf]
    // 0x40180c: ldur            x0, [fp, #-0x18]
    // 0x401810: StoreField: r3->field_13 = r0
    //     0x401810: stur            w0, [x3, #0x13]
    // 0x401814: ldur            x0, [fp, #-8]
    // 0x401818: StoreField: r3->field_1b = r0
    //     0x401818: stur            w0, [x3, #0x1b]
    // 0x40181c: r1 = Function '<anonymous closure>':.
    //     0x40181c: add             x1, PP, #0x11, lsl #12  ; [pp+0x110d0] AnonymousClosure: (0x4019c8), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x401820: ldr             x1, [x1, #0xd0]
    // 0x401824: r2 = Null
    //     0x401824: mov             x2, NULL
    // 0x401828: r0 = AllocateClosure()
    //     0x401828: bl              #0x5838bc  ; AllocateClosureStub
    // 0x40182c: mov             x1, x0
    // 0x401830: ldur            x0, [fp, #-0x20]
    // 0x401834: StoreField: r0->field_1f = r1
    //     0x401834: stur            w1, [x0, #0x1f]
    // 0x401838: ldur            x1, [fp, #-0x10]
    // 0x40183c: ArrayStore: r1[9] = r0  ; List_4
    //     0x40183c: add             x25, x1, #0x33
    //     0x401840: str             w0, [x25]
    //     0x401844: tbz             w0, #0, #0x401860
    //     0x401848: ldurb           w16, [x1, #-1]
    //     0x40184c: ldurb           w17, [x0, #-1]
    //     0x401850: and             x16, x17, x16, lsr #2
    //     0x401854: tst             x16, HEAP, lsr #32
    //     0x401858: b.eq            #0x401860
    //     0x40185c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x401860: r1 = <Widget>
    //     0x401860: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x401864: r0 = AllocateGrowableArray()
    //     0x401864: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x401868: mov             x1, x0
    // 0x40186c: ldur            x0, [fp, #-0x10]
    // 0x401870: stur            x1, [fp, #-8]
    // 0x401874: StoreField: r1->field_f = r0
    //     0x401874: stur            w0, [x1, #0xf]
    // 0x401878: r0 = 20
    //     0x401878: mov             x0, #0x14
    // 0x40187c: StoreField: r1->field_b = r0
    //     0x40187c: stur            w0, [x1, #0xb]
    // 0x401880: r0 = Column()
    //     0x401880: bl              #0x3715fc  ; AllocateColumnStub -> Column (size=0x38)
    // 0x401884: mov             x1, x0
    // 0x401888: r0 = Instance_Axis
    //     0x401888: ldr             x0, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x40188c: stur            x1, [fp, #-0x10]
    // 0x401890: StoreField: r1->field_f = r0
    //     0x401890: stur            w0, [x1, #0xf]
    // 0x401894: r0 = Instance_MainAxisAlignment
    //     0x401894: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x401898: ldr             x0, [x0, #0xfb0]
    // 0x40189c: StoreField: r1->field_13 = r0
    //     0x40189c: stur            w0, [x1, #0x13]
    // 0x4018a0: r0 = Instance_MainAxisSize
    //     0x4018a0: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x4018a4: ldr             x0, [x0, #0xfb8]
    // 0x4018a8: ArrayStore: r1[0] = r0  ; List_4
    //     0x4018a8: stur            w0, [x1, #0x17]
    // 0x4018ac: r0 = Instance_CrossAxisAlignment
    //     0x4018ac: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x4018b0: ldr             x0, [x0, #0xfc0]
    // 0x4018b4: StoreField: r1->field_1b = r0
    //     0x4018b4: stur            w0, [x1, #0x1b]
    // 0x4018b8: r0 = Instance_VerticalDirection
    //     0x4018b8: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x4018bc: ldr             x0, [x0, #0xfc8]
    // 0x4018c0: StoreField: r1->field_23 = r0
    //     0x4018c0: stur            w0, [x1, #0x23]
    // 0x4018c4: r0 = Instance_Clip
    //     0x4018c4: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x4018c8: ldr             x0, [x0, #0xfd0]
    // 0x4018cc: StoreField: r1->field_2b = r0
    //     0x4018cc: stur            w0, [x1, #0x2b]
    // 0x4018d0: StoreField: r1->field_2f = rZR
    //     0x4018d0: stur            xzr, [x1, #0x2f]
    // 0x4018d4: ldur            x2, [fp, #-8]
    // 0x4018d8: StoreField: r1->field_b = r2
    //     0x4018d8: stur            w2, [x1, #0xb]
    // 0x4018dc: r0 = Padding()
    //     0x4018dc: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x4018e0: mov             x1, x0
    // 0x4018e4: r0 = Instance_EdgeInsets
    //     0x4018e4: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x4018e8: ldr             x0, [x0, #0xd48]
    // 0x4018ec: stur            x1, [fp, #-8]
    // 0x4018f0: StoreField: r1->field_f = r0
    //     0x4018f0: stur            w0, [x1, #0xf]
    // 0x4018f4: ldur            x0, [fp, #-0x10]
    // 0x4018f8: StoreField: r1->field_b = r0
    //     0x4018f8: stur            w0, [x1, #0xb]
    // 0x4018fc: r0 = FittedBox()
    //     0x4018fc: bl              #0x370e1c  ; AllocateFittedBoxStub -> FittedBox (size=0x1c)
    // 0x401900: mov             x1, x0
    // 0x401904: r0 = Instance_BoxFit
    //     0x401904: add             x0, PP, #0x11, lsl #12  ; [pp+0x110d8] Obj!BoxFit@5dae31
    //     0x401908: ldr             x0, [x0, #0xd8]
    // 0x40190c: stur            x1, [fp, #-0x10]
    // 0x401910: StoreField: r1->field_f = r0
    //     0x401910: stur            w0, [x1, #0xf]
    // 0x401914: r0 = Instance_Alignment
    //     0x401914: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x401918: ldr             x0, [x0, #0xb18]
    // 0x40191c: StoreField: r1->field_13 = r0
    //     0x40191c: stur            w0, [x1, #0x13]
    // 0x401920: r2 = Instance_Clip
    //     0x401920: add             x2, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x401924: ldr             x2, [x2, #0xfd0]
    // 0x401928: ArrayStore: r1[0] = r2  ; List_4
    //     0x401928: stur            w2, [x1, #0x17]
    // 0x40192c: ldur            x2, [fp, #-8]
    // 0x401930: StoreField: r1->field_b = r2
    //     0x401930: stur            w2, [x1, #0xb]
    // 0x401934: r0 = Center()
    //     0x401934: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x401938: mov             x1, x0
    // 0x40193c: r0 = Instance_Alignment
    //     0x40193c: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x401940: ldr             x0, [x0, #0xb18]
    // 0x401944: stur            x1, [fp, #-8]
    // 0x401948: StoreField: r1->field_f = r0
    //     0x401948: stur            w0, [x1, #0xf]
    // 0x40194c: ldur            x0, [fp, #-0x10]
    // 0x401950: StoreField: r1->field_b = r0
    //     0x401950: stur            w0, [x1, #0xb]
    // 0x401954: r0 = Scaffold()
    //     0x401954: bl              #0x370d84  ; AllocateScaffoldStub -> Scaffold (size=0x50)
    // 0x401958: mov             x2, x0
    // 0x40195c: ldur            x0, [fp, #-8]
    // 0x401960: stur            x2, [fp, #-0x10]
    // 0x401964: ArrayStore: r2[0] = r0  ; List_4
    //     0x401964: stur            w0, [x2, #0x17]
    // 0x401968: r0 = true
    //     0x401968: add             x0, NULL, #0x20  ; true
    // 0x40196c: StoreField: r2->field_47 = r0
    //     0x40196c: stur            w0, [x2, #0x47]
    // 0x401970: r1 = false
    //     0x401970: add             x1, NULL, #0x30  ; false
    // 0x401974: StoreField: r2->field_b = r1
    //     0x401974: stur            w1, [x2, #0xb]
    // 0x401978: StoreField: r2->field_f = r1
    //     0x401978: stur            w1, [x2, #0xf]
    // 0x40197c: r1 = Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static.
    //     0x40197c: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd50] Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static. (0x7c033375e380)
    //     0x401980: ldr             x1, [x1, #0xd50]
    // 0x401984: StoreField: r2->field_33 = r1
    //     0x401984: stur            w1, [x2, #0x33]
    // 0x401988: r1 = <SystemUiOverlayStyle>
    //     0x401988: ldr             x1, [PP, #0x4510]  ; [pp+0x4510] TypeArguments: <SystemUiOverlayStyle>
    // 0x40198c: r0 = AnnotatedRegion()
    //     0x40198c: bl              #0x370d78  ; AllocateAnnotatedRegionStub -> AnnotatedRegion<X0> (size=0x1c)
    // 0x401990: ldur            x1, [fp, #-0x28]
    // 0x401994: StoreField: r0->field_13 = r1
    //     0x401994: stur            w1, [x0, #0x13]
    // 0x401998: r1 = true
    //     0x401998: add             x1, NULL, #0x20  ; true
    // 0x40199c: ArrayStore: r0[0] = r1  ; List_4
    //     0x40199c: stur            w1, [x0, #0x17]
    // 0x4019a0: ldur            x1, [fp, #-0x10]
    // 0x4019a4: StoreField: r0->field_b = r1
    //     0x4019a4: stur            w1, [x0, #0xb]
    // 0x4019a8: LeaveFrame
    //     0x4019a8: mov             SP, fp
    //     0x4019ac: ldp             fp, lr, [SP], #0x10
    // 0x4019b0: ret
    //     0x4019b0: ret             
    // 0x4019b4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4019b4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4019b8: b               #0x400d48
  }
  [closure] SettingsPage <anonymous closure>(dynamic, BuildContext) {
    // ** addr: 0x4019c8, size: 0xc
    // 0x4019c8: r0 = Instance_SettingsPage
    //     0x4019c8: add             x0, PP, #0x11, lsl #12  ; [pp+0x110e0] Obj!SettingsPage@5d7ff1
    //     0x4019cc: ldr             x0, [x0, #0xe0]
    // 0x4019d0: ret
    //     0x4019d0: ret             
  }
  [closure] TutorialPage <anonymous closure>(dynamic, BuildContext) {
    // ** addr: 0x401a20, size: 0xc
    // 0x401a20: r0 = Instance_TutorialPage
    //     0x401a20: add             x0, PP, #0x11, lsl #12  ; [pp+0x11100] Obj!TutorialPage@5d7fd1
    //     0x401a24: ldr             x0, [x0, #0x100]
    // 0x401a28: ret
    //     0x401a28: ret             
  }
  [closure] ShopPage <anonymous closure>(dynamic, BuildContext) {
    // ** addr: 0x401a78, size: 0xc
    // 0x401a78: r0 = Instance_ShopPage
    //     0x401a78: add             x0, PP, #0x11, lsl #12  ; [pp+0x11110] Obj!ShopPage@5d7fe1
    //     0x401a7c: ldr             x0, [x0, #0x110]
    // 0x401a80: ret
    //     0x401a80: ret             
  }
  [closure] bool <anonymous closure>(dynamic) {
    // ** addr: 0x401a84, size: 0x6c
    // 0x401a84: EnterFrame
    //     0x401a84: stp             fp, lr, [SP, #-0x10]!
    //     0x401a88: mov             fp, SP
    // 0x401a8c: AllocStack(0x8)
    //     0x401a8c: sub             SP, SP, #8
    // 0x401a90: CheckStackOverflow
    //     0x401a90: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x401a94: cmp             SP, x16
    //     0x401a98: b.ls            #0x401ae8
    // 0x401a9c: r0 = LoadStaticField(0xcdc)
    //     0x401a9c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x401aa0: ldr             x0, [x0, #0x19b8]
    // 0x401aa4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401aa8: cmp             w0, w16
    // 0x401aac: b.ne            #0x401abc
    // 0x401ab0: r2 = allItems
    //     0x401ab0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11118] Field <ShopItems.allItems>: static late final (offset: 0xcdc)
    //     0x401ab4: ldr             x2, [x2, #0x118]
    // 0x401ab8: r0 = InitLateFinalStaticField()
    //     0x401ab8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x401abc: r1 = Function '<anonymous closure>':.
    //     0x401abc: add             x1, PP, #0x11, lsl #12  ; [pp+0x11120] AnonymousClosure: (0x401af0), in [package:ricochlime/pages/home.dart] HomePage::build (0x400d28)
    //     0x401ac0: ldr             x1, [x1, #0x120]
    // 0x401ac4: r2 = Null
    //     0x401ac4: mov             x2, NULL
    // 0x401ac8: stur            x0, [fp, #-8]
    // 0x401acc: r0 = AllocateClosure()
    //     0x401acc: bl              #0x5838bc  ; AllocateClosureStub
    // 0x401ad0: ldur            x1, [fp, #-8]
    // 0x401ad4: mov             x2, x0
    // 0x401ad8: r0 = any()
    //     0x401ad8: bl              #0x4510e8  ; [dart:collection] ListBase::any
    // 0x401adc: LeaveFrame
    //     0x401adc: mov             SP, fp
    //     0x401ae0: ldp             fp, lr, [SP], #0x10
    // 0x401ae4: ret
    //     0x401ae4: ret             
    // 0x401ae8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x401ae8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x401aec: b               #0x401a9c
  }
  [closure] bool <anonymous closure>(dynamic, ShopItem) {
    // ** addr: 0x401af0, size: 0xcc
    // 0x401af0: EnterFrame
    //     0x401af0: stp             fp, lr, [SP, #-0x10]!
    //     0x401af4: mov             fp, SP
    // 0x401af8: AllocStack(0x8)
    //     0x401af8: sub             SP, SP, #8
    // 0x401afc: CheckStackOverflow
    //     0x401afc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x401b00: cmp             SP, x16
    //     0x401b04: b.ls            #0x401bb4
    // 0x401b08: ldr             x0, [fp, #0x10]
    // 0x401b0c: LoadField: r1 = r0->field_13
    //     0x401b0c: ldur            w1, [x0, #0x13]
    // 0x401b10: DecompressPointer r1
    //     0x401b10: add             x1, x1, HEAP, lsl #32
    // 0x401b14: LoadField: r2 = r1->field_27
    //     0x401b14: ldur            w2, [x1, #0x27]
    // 0x401b18: DecompressPointer r2
    //     0x401b18: add             x2, x2, HEAP, lsl #32
    // 0x401b1c: r16 = Instance_ShopItemState
    //     0x401b1c: add             x16, PP, #8, lsl #12  ; [pp+0x8ce0] Obj!ShopItemState@5d8921
    //     0x401b20: ldr             x16, [x16, #0xce0]
    // 0x401b24: cmp             w2, w16
    // 0x401b28: b.ne            #0x401ba4
    // 0x401b2c: LoadField: r1 = r0->field_b
    //     0x401b2c: ldur            x1, [x0, #0xb]
    // 0x401b30: stur            x1, [fp, #-8]
    // 0x401b34: r0 = LoadStaticField(0xccc)
    //     0x401b34: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x401b38: ldr             x0, [x0, #0x1998]
    // 0x401b3c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401b40: cmp             w0, w16
    // 0x401b44: b.ne            #0x401b54
    // 0x401b48: r2 = stows
    //     0x401b48: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x401b4c: ldr             x2, [x2, #0x310]
    // 0x401b50: r0 = InitLateFinalStaticField()
    //     0x401b50: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x401b54: LoadField: r1 = r0->field_2b
    //     0x401b54: ldur            w1, [x0, #0x2b]
    // 0x401b58: DecompressPointer r1
    //     0x401b58: add             x1, x1, HEAP, lsl #32
    // 0x401b5c: LoadField: r0 = r1->field_43
    //     0x401b5c: ldur            w0, [x1, #0x43]
    // 0x401b60: DecompressPointer r0
    //     0x401b60: add             x0, x0, HEAP, lsl #32
    // 0x401b64: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401b68: cmp             w0, w16
    // 0x401b6c: b.ne            #0x401b7c
    // 0x401b70: r2 = _value
    //     0x401b70: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x401b74: ldr             x2, [x2, #0x4b0]
    // 0x401b78: r0 = InitLateInstanceField()
    //     0x401b78: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x401b7c: r1 = LoadInt32Instr(r0)
    //     0x401b7c: sbfx            x1, x0, #1, #0x1f
    //     0x401b80: tbz             w0, #0, #0x401b88
    //     0x401b84: ldur            x1, [x0, #7]
    // 0x401b88: ldur            x2, [fp, #-8]
    // 0x401b8c: cmp             x2, x1
    // 0x401b90: r16 = true
    //     0x401b90: add             x16, NULL, #0x20  ; true
    // 0x401b94: r17 = false
    //     0x401b94: add             x17, NULL, #0x30  ; false
    // 0x401b98: csel            x3, x16, x17, le
    // 0x401b9c: mov             x0, x3
    // 0x401ba0: b               #0x401ba8
    // 0x401ba4: r0 = false
    //     0x401ba4: add             x0, NULL, #0x30  ; false
    // 0x401ba8: LeaveFrame
    //     0x401ba8: mov             SP, fp
    //     0x401bac: ldp             fp, lr, [SP], #0x10
    // 0x401bb0: ret
    //     0x401bb0: ret             
    // 0x401bb4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x401bb4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x401bb8: b               #0x401b08
  }
  [closure] PlayPage <anonymous closure>(dynamic, BuildContext) {
    // ** addr: 0x401c98, size: 0xc
    // 0x401c98: r0 = Instance_PlayPage
    //     0x401c98: add             x0, PP, #0x11, lsl #12  ; [pp+0x11138] Obj!PlayPage@5d8261
    //     0x401c9c: ldr             x0, [x0, #0x138]
    // 0x401ca0: ret
    //     0x401ca0: ret             
  }
  [closure] NesTooltip <anonymous closure>(dynamic, BuildContext, Widget?) {
    // ** addr: 0x401eb4, size: 0x334
    // 0x401eb4: EnterFrame
    //     0x401eb4: stp             fp, lr, [SP, #-0x10]!
    //     0x401eb8: mov             fp, SP
    // 0x401ebc: AllocStack(0x30)
    //     0x401ebc: sub             SP, SP, #0x30
    // 0x401ec0: CheckStackOverflow
    //     0x401ec0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x401ec4: cmp             SP, x16
    //     0x401ec8: b.ls            #0x4021c0
    // 0x401ecc: r0 = LoadStaticField(0xccc)
    //     0x401ecc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x401ed0: ldr             x0, [x0, #0x1998]
    // 0x401ed4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401ed8: cmp             w0, w16
    // 0x401edc: b.ne            #0x401eec
    // 0x401ee0: r2 = stows
    //     0x401ee0: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x401ee4: ldr             x2, [x2, #0x310]
    // 0x401ee8: r0 = InitLateFinalStaticField()
    //     0x401ee8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x401eec: LoadField: r2 = r0->field_1f
    //     0x401eec: ldur            w2, [x0, #0x1f]
    // 0x401ef0: DecompressPointer r2
    //     0x401ef0: add             x2, x2, HEAP, lsl #32
    // 0x401ef4: mov             x1, x2
    // 0x401ef8: stur            x2, [fp, #-8]
    // 0x401efc: LoadField: r0 = r1->field_43
    //     0x401efc: ldur            w0, [x1, #0x43]
    // 0x401f00: DecompressPointer r0
    //     0x401f00: add             x0, x0, HEAP, lsl #32
    // 0x401f04: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401f08: cmp             w0, w16
    // 0x401f0c: b.ne            #0x401f1c
    // 0x401f10: r2 = _value
    //     0x401f10: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x401f14: ldr             x2, [x2, #0x4b0]
    // 0x401f18: r0 = InitLateInstanceField()
    //     0x401f18: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x401f1c: LoadField: d0 = r0->field_7
    //     0x401f1c: ldur            d0, [x0, #7]
    // 0x401f20: d1 = 0.050000
    //     0x401f20: ldr             d1, [PP, #0x7958]  ; [pp+0x7958] IMM: double(0.05) from 0x3fa999999999999a
    // 0x401f24: fcmp            d0, d1
    // 0x401f28: b.le            #0x401f38
    // 0x401f2c: mov             x2, x0
    // 0x401f30: StoreStaticField(0xd10, r2)
    //     0x401f30: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x401f34: str             x2, [x0, #0x1a20]
    // 0x401f38: r0 = LoadStaticField(0x468)
    //     0x401f38: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x401f3c: ldr             x0, [x0, #0x8d0]
    // 0x401f40: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401f44: cmp             w0, w16
    // 0x401f48: b.ne            #0x401f54
    // 0x401f4c: r2 = instance
    //     0x401f4c: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x401f50: r0 = InitLateFinalStaticField()
    //     0x401f50: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x401f54: r16 = <AppLocale, Translations>
    //     0x401f54: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x401f58: stp             x0, x16, [SP]
    // 0x401f5c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x401f5c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x401f60: r0 = LocaleSettingsExt.currentTranslations()
    //     0x401f60: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x401f64: r1 = LoadClassIdInstr(r0)
    //     0x401f64: ldur            x1, [x0, #-1]
    //     0x401f68: ubfx            x1, x1, #0xc, #0x14
    // 0x401f6c: cmp             x1, #0x8dd
    // 0x401f70: b.ne            #0x401f9c
    // 0x401f74: mov             x1, x0
    // 0x401f78: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x401f78: ldur            w0, [x1, #0x17]
    // 0x401f7c: DecompressPointer r0
    //     0x401f7c: add             x0, x0, HEAP, lsl #32
    // 0x401f80: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401f84: cmp             w0, w16
    // 0x401f88: b.ne            #0x401f98
    // 0x401f8c: r2 = settingsPage
    //     0x401f8c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x401f90: ldr             x2, [x2, #0x188]
    // 0x401f94: r0 = InitLateFinalInstanceField()
    //     0x401f94: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401f98: b               #0x402020
    // 0x401f9c: cmp             x1, #0x8df
    // 0x401fa0: b.ne            #0x401fcc
    // 0x401fa4: mov             x1, x0
    // 0x401fa8: LoadField: r0 = r1->field_3b
    //     0x401fa8: ldur            w0, [x1, #0x3b]
    // 0x401fac: DecompressPointer r0
    //     0x401fac: add             x0, x0, HEAP, lsl #32
    // 0x401fb0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401fb4: cmp             w0, w16
    // 0x401fb8: b.ne            #0x401fc8
    // 0x401fbc: r2 = settingsPage
    //     0x401fbc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x401fc0: ldr             x2, [x2, #0x190]
    // 0x401fc4: r0 = InitLateFinalInstanceField()
    //     0x401fc4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401fc8: b               #0x402020
    // 0x401fcc: cmp             x1, #0x8e0
    // 0x401fd0: b.ne            #0x401ffc
    // 0x401fd4: mov             x1, x0
    // 0x401fd8: LoadField: r0 = r1->field_3b
    //     0x401fd8: ldur            w0, [x1, #0x3b]
    // 0x401fdc: DecompressPointer r0
    //     0x401fdc: add             x0, x0, HEAP, lsl #32
    // 0x401fe0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401fe4: cmp             w0, w16
    // 0x401fe8: b.ne            #0x401ff8
    // 0x401fec: r2 = settingsPage
    //     0x401fec: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x401ff0: ldr             x2, [x2, #0x198]
    // 0x401ff4: r0 = InitLateFinalInstanceField()
    //     0x401ff4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401ff8: b               #0x402020
    // 0x401ffc: mov             x1, x0
    // 0x402000: LoadField: r0 = r1->field_3b
    //     0x402000: ldur            w0, [x1, #0x3b]
    // 0x402004: DecompressPointer r0
    //     0x402004: add             x0, x0, HEAP, lsl #32
    // 0x402008: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40200c: cmp             w0, w16
    // 0x402010: b.ne            #0x402020
    // 0x402014: r2 = settingsPage
    //     0x402014: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x402018: ldr             x2, [x2, #0x1a0]
    // 0x40201c: r0 = InitLateFinalInstanceField()
    //     0x40201c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402020: r1 = LoadClassIdInstr(r0)
    //     0x402020: ldur            x1, [x0, #-1]
    //     0x402024: ubfx            x1, x1, #0xc, #0x14
    // 0x402028: cmp             x1, #0xf4
    // 0x40202c: b.ne            #0x40203c
    // 0x402030: r3 = "Sound effects volume"
    //     0x402030: add             x3, PP, #0x11, lsl #12  ; [pp+0x111a8] "Sound effects volume"
    //     0x402034: ldr             x3, [x3, #0x1a8]
    // 0x402038: b               #0x40206c
    // 0x40203c: cmp             x1, #0xf5
    // 0x402040: b.ne            #0x402050
    // 0x402044: r3 = "Громкость звуковых эффектов"
    //     0x402044: add             x3, PP, #0x11, lsl #12  ; [pp+0x111b0] "Громкость звуковых эффектов"
    //     0x402048: ldr             x3, [x3, #0x1b0]
    // 0x40204c: b               #0x40206c
    // 0x402050: cmp             x1, #0xf6
    // 0x402054: b.ne            #0x402064
    // 0x402058: r3 = "Дыбыс әсерлерінің көлемі"
    //     0x402058: add             x3, PP, #0x11, lsl #12  ; [pp+0x111b8] "Дыбыс әсерлерінің көлемі"
    //     0x40205c: ldr             x3, [x3, #0x1b8]
    // 0x402060: b               #0x40206c
    // 0x402064: r3 = "Volumen de efectos de sonido"
    //     0x402064: add             x3, PP, #0x11, lsl #12  ; [pp+0x111c0] "Volumen de efectos de sonido"
    //     0x402068: ldr             x3, [x3, #0x1c0]
    // 0x40206c: ldur            x0, [fp, #-8]
    // 0x402070: stur            x3, [fp, #-0x10]
    // 0x402074: r1 = Null
    //     0x402074: mov             x1, NULL
    // 0x402078: r2 = 8
    //     0x402078: mov             x2, #8
    // 0x40207c: r0 = AllocateArray()
    //     0x40207c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x402080: mov             x1, x0
    // 0x402084: ldur            x0, [fp, #-0x10]
    // 0x402088: stur            x1, [fp, #-0x18]
    // 0x40208c: StoreField: r1->field_f = r0
    //     0x40208c: stur            w0, [x1, #0xf]
    // 0x402090: r16 = ": "
    //     0x402090: ldr             x16, [PP, #0x2538]  ; [pp+0x2538] ": "
    // 0x402094: StoreField: r1->field_13 = r16
    //     0x402094: stur            w16, [x1, #0x13]
    // 0x402098: ldur            x0, [fp, #-8]
    // 0x40209c: LoadField: r2 = r0->field_43
    //     0x40209c: ldur            w2, [x0, #0x43]
    // 0x4020a0: DecompressPointer r2
    //     0x4020a0: add             x2, x2, HEAP, lsl #32
    // 0x4020a4: LoadField: d0 = r2->field_7
    //     0x4020a4: ldur            d0, [x2, #7]
    // 0x4020a8: d1 = 100.000000
    //     0x4020a8: add             x17, PP, #0xb, lsl #12  ; [pp+0xb838] IMM: double(100) from 0x4059000000000000
    //     0x4020ac: ldr             d1, [x17, #0x838]
    // 0x4020b0: fmul            d2, d0, d1
    // 0x4020b4: r2 = inline_Allocate_Double()
    //     0x4020b4: ldp             x2, x3, [THR, #0x60]  ; THR::top
    //     0x4020b8: add             x2, x2, #0x10
    //     0x4020bc: cmp             x3, x2
    //     0x4020c0: b.ls            #0x4021c8
    //     0x4020c4: str             x2, [THR, #0x60]  ; THR::top
    //     0x4020c8: sub             x2, x2, #0xf
    //     0x4020cc: mov             x3, #0xe19c
    //     0x4020d0: movk            x3, #3, lsl #16
    //     0x4020d4: stur            x3, [x2, #-1]
    // 0x4020d8: dmb             ishst
    // 0x4020dc: StoreField: r2->field_7 = d2
    //     0x4020dc: stur            d2, [x2, #7]
    // 0x4020e0: r16 = 2
    //     0x4020e0: mov             x16, #2
    // 0x4020e4: stp             x16, x2, [SP]
    // 0x4020e8: r0 = ~/()
    //     0x4020e8: bl              #0x307dc0  ; [dart:core] _Double::~/
    // 0x4020ec: ldur            x1, [fp, #-0x18]
    // 0x4020f0: ArrayStore: r1[2] = r0  ; List_4
    //     0x4020f0: add             x25, x1, #0x17
    //     0x4020f4: str             w0, [x25]
    //     0x4020f8: tbz             w0, #0, #0x402114
    //     0x4020fc: ldurb           w16, [x1, #-1]
    //     0x402100: ldurb           w17, [x0, #-1]
    //     0x402104: and             x16, x17, x16, lsr #2
    //     0x402108: tst             x16, HEAP, lsr #32
    //     0x40210c: b.eq            #0x402114
    //     0x402110: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x402114: ldur            x0, [fp, #-0x18]
    // 0x402118: r16 = "%"
    //     0x402118: ldr             x16, [PP, #0x698]  ; [pp+0x698] "%"
    // 0x40211c: StoreField: r0->field_1b = r16
    //     0x40211c: stur            w16, [x0, #0x1b]
    // 0x402120: str             x0, [SP]
    // 0x402124: r0 = _interpolate()
    //     0x402124: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x402128: mov             x1, x0
    // 0x40212c: ldur            x0, [fp, #-8]
    // 0x402130: stur            x1, [fp, #-0x10]
    // 0x402134: LoadField: r2 = r0->field_43
    //     0x402134: ldur            w2, [x0, #0x43]
    // 0x402138: DecompressPointer r2
    //     0x402138: add             x2, x2, HEAP, lsl #32
    // 0x40213c: LoadField: d0 = r2->field_7
    //     0x40213c: ldur            d0, [x2, #7]
    // 0x402140: d1 = 0.050000
    //     0x402140: ldr             d1, [PP, #0x7958]  ; [pp+0x7958] IMM: double(0.05) from 0x3fa999999999999a
    // 0x402144: fcmp            d1, d0
    // 0x402148: b.lt            #0x402154
    // 0x40214c: d0 = 0.250000
    //     0x40214c: fmov            d0, #0.25000000
    // 0x402150: b               #0x402158
    // 0x402154: d0 = 1.000000
    //     0x402154: fmov            d0, #1.00000000
    // 0x402158: ldr             x0, [fp, #0x10]
    // 0x40215c: stur            d0, [fp, #-0x20]
    // 0x402160: cmp             w0, NULL
    // 0x402164: b.eq            #0x4021e4
    // 0x402168: r0 = Opacity()
    //     0x402168: bl              #0x35c488  ; AllocateOpacityStub -> Opacity (size=0x1c)
    // 0x40216c: ldur            d0, [fp, #-0x20]
    // 0x402170: stur            x0, [fp, #-8]
    // 0x402174: StoreField: r0->field_f = d0
    //     0x402174: stur            d0, [x0, #0xf]
    // 0x402178: r1 = false
    //     0x402178: add             x1, NULL, #0x30  ; false
    // 0x40217c: ArrayStore: r0[0] = r1  ; List_4
    //     0x40217c: stur            w1, [x0, #0x17]
    // 0x402180: ldr             x1, [fp, #0x10]
    // 0x402184: StoreField: r0->field_b = r1
    //     0x402184: stur            w1, [x0, #0xb]
    // 0x402188: r0 = NesTooltip()
    //     0x402188: bl              #0x371620  ; AllocateNesTooltipStub -> NesTooltip (size=0x1c)
    // 0x40218c: ldur            x1, [fp, #-8]
    // 0x402190: StoreField: r0->field_b = r1
    //     0x402190: stur            w1, [x0, #0xb]
    // 0x402194: ldur            x1, [fp, #-0x10]
    // 0x402198: StoreField: r0->field_f = r1
    //     0x402198: stur            w1, [x0, #0xf]
    // 0x40219c: r1 = Instance_NesTooltipArrowPlacement
    //     0x40219c: add             x1, PP, #0x11, lsl #12  ; [pp+0x111c8] Obj!NesTooltipArrowPlacement@5d8db1
    //     0x4021a0: ldr             x1, [x1, #0x1c8]
    // 0x4021a4: StoreField: r0->field_13 = r1
    //     0x4021a4: stur            w1, [x0, #0x13]
    // 0x4021a8: r1 = Instance_NesTooltipArrowDirection
    //     0x4021a8: add             x1, PP, #0x11, lsl #12  ; [pp+0x111d0] Obj!NesTooltipArrowDirection@5d8d51
    //     0x4021ac: ldr             x1, [x1, #0x1d0]
    // 0x4021b0: ArrayStore: r0[0] = r1  ; List_4
    //     0x4021b0: stur            w1, [x0, #0x17]
    // 0x4021b4: LeaveFrame
    //     0x4021b4: mov             SP, fp
    //     0x4021b8: ldp             fp, lr, [SP], #0x10
    // 0x4021bc: ret
    //     0x4021bc: ret             
    // 0x4021c0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4021c0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4021c4: b               #0x401ecc
    // 0x4021c8: SaveReg d2
    //     0x4021c8: str             q2, [SP, #-0x10]!
    // 0x4021cc: stp             x0, x1, [SP, #-0x10]!
    // 0x4021d0: r0 = AllocateDouble()
    //     0x4021d0: bl              #0x584528  ; AllocateDoubleStub
    // 0x4021d4: mov             x2, x0
    // 0x4021d8: ldp             x0, x1, [SP], #0x10
    // 0x4021dc: RestoreReg d2
    //     0x4021dc: ldr             q2, [SP], #0x10
    // 0x4021e0: b               #0x4020dc
    // 0x4021e4: r0 = NullCastErrorSharedWithFPURegs()
    //     0x4021e4: bl              #0x584dc0  ; NullCastErrorSharedWithFPURegsStub
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x4023ac, size: 0xec
    // 0x4023ac: EnterFrame
    //     0x4023ac: stp             fp, lr, [SP, #-0x10]!
    //     0x4023b0: mov             fp, SP
    // 0x4023b4: AllocStack(0x8)
    //     0x4023b4: sub             SP, SP, #8
    // 0x4023b8: CheckStackOverflow
    //     0x4023b8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4023bc: cmp             SP, x16
    //     0x4023c0: b.ls            #0x40247c
    // 0x4023c4: r0 = LoadStaticField(0xccc)
    //     0x4023c4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x4023c8: ldr             x0, [x0, #0x1998]
    // 0x4023cc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4023d0: cmp             w0, w16
    // 0x4023d4: b.ne            #0x4023e4
    // 0x4023d8: r2 = stows
    //     0x4023d8: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x4023dc: ldr             x2, [x2, #0x310]
    // 0x4023e0: r0 = InitLateFinalStaticField()
    //     0x4023e0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x4023e4: LoadField: r2 = r0->field_1f
    //     0x4023e4: ldur            w2, [x0, #0x1f]
    // 0x4023e8: DecompressPointer r2
    //     0x4023e8: add             x2, x2, HEAP, lsl #32
    // 0x4023ec: mov             x1, x2
    // 0x4023f0: stur            x2, [fp, #-8]
    // 0x4023f4: LoadField: r0 = r1->field_43
    //     0x4023f4: ldur            w0, [x1, #0x43]
    // 0x4023f8: DecompressPointer r0
    //     0x4023f8: add             x0, x0, HEAP, lsl #32
    // 0x4023fc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402400: cmp             w0, w16
    // 0x402404: b.ne            #0x402414
    // 0x402408: r2 = _value
    //     0x402408: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x40240c: ldr             x2, [x2, #0x4b0]
    // 0x402410: r0 = InitLateInstanceField()
    //     0x402410: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x402414: LoadField: d0 = r0->field_7
    //     0x402414: ldur            d0, [x0, #7]
    // 0x402418: d1 = 0.050000
    //     0x402418: ldr             d1, [PP, #0x7958]  ; [pp+0x7958] IMM: double(0.05) from 0x3fa999999999999a
    // 0x40241c: fcmp            d1, d0
    // 0x402420: b.lt            #0x402434
    // 0x402424: r0 = LoadStaticField(0xd10)
    //     0x402424: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402428: ldr             x0, [x0, #0x1a20]
    // 0x40242c: LoadField: d0 = r0->field_7
    //     0x40242c: ldur            d0, [x0, #7]
    // 0x402430: b               #0x402438
    // 0x402434: d0 = 0.000000
    //     0x402434: eor             v0.16b, v0.16b, v0.16b
    // 0x402438: r2 = inline_Allocate_Double()
    //     0x402438: ldp             x2, x0, [THR, #0x60]  ; THR::top
    //     0x40243c: add             x2, x2, #0x10
    //     0x402440: cmp             x0, x2
    //     0x402444: b.ls            #0x402484
    //     0x402448: str             x2, [THR, #0x60]  ; THR::top
    //     0x40244c: sub             x2, x2, #0xf
    //     0x402450: mov             x0, #0xe19c
    //     0x402454: movk            x0, #3, lsl #16
    //     0x402458: stur            x0, [x2, #-1]
    // 0x40245c: dmb             ishst
    // 0x402460: StoreField: r2->field_7 = d0
    //     0x402460: stur            d0, [x2, #7]
    // 0x402464: ldur            x1, [fp, #-8]
    // 0x402468: r0 = value=()
    //     0x402468: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x40246c: r0 = Null
    //     0x40246c: mov             x0, NULL
    // 0x402470: LeaveFrame
    //     0x402470: mov             SP, fp
    //     0x402474: ldp             fp, lr, [SP], #0x10
    // 0x402478: ret
    //     0x402478: ret             
    // 0x40247c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x40247c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x402480: b               #0x4023c4
    // 0x402484: SaveReg d0
    //     0x402484: str             q0, [SP, #-0x10]!
    // 0x402488: r0 = AllocateDouble()
    //     0x402488: bl              #0x584528  ; AllocateDoubleStub
    // 0x40248c: mov             x2, x0
    // 0x402490: RestoreReg d0
    //     0x402490: ldr             q0, [SP], #0x10
    // 0x402494: b               #0x402460
  }
  [closure] NesTooltip <anonymous closure>(dynamic, BuildContext, Widget?) {
    // ** addr: 0x4024e4, size: 0x334
    // 0x4024e4: EnterFrame
    //     0x4024e4: stp             fp, lr, [SP, #-0x10]!
    //     0x4024e8: mov             fp, SP
    // 0x4024ec: AllocStack(0x30)
    //     0x4024ec: sub             SP, SP, #0x30
    // 0x4024f0: CheckStackOverflow
    //     0x4024f0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4024f4: cmp             SP, x16
    //     0x4024f8: b.ls            #0x4027f0
    // 0x4024fc: r0 = LoadStaticField(0xccc)
    //     0x4024fc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402500: ldr             x0, [x0, #0x1998]
    // 0x402504: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402508: cmp             w0, w16
    // 0x40250c: b.ne            #0x40251c
    // 0x402510: r2 = stows
    //     0x402510: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x402514: ldr             x2, [x2, #0x310]
    // 0x402518: r0 = InitLateFinalStaticField()
    //     0x402518: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x40251c: LoadField: r2 = r0->field_1b
    //     0x40251c: ldur            w2, [x0, #0x1b]
    // 0x402520: DecompressPointer r2
    //     0x402520: add             x2, x2, HEAP, lsl #32
    // 0x402524: mov             x1, x2
    // 0x402528: stur            x2, [fp, #-8]
    // 0x40252c: LoadField: r0 = r1->field_43
    //     0x40252c: ldur            w0, [x1, #0x43]
    // 0x402530: DecompressPointer r0
    //     0x402530: add             x0, x0, HEAP, lsl #32
    // 0x402534: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402538: cmp             w0, w16
    // 0x40253c: b.ne            #0x40254c
    // 0x402540: r2 = _value
    //     0x402540: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x402544: ldr             x2, [x2, #0x4b0]
    // 0x402548: r0 = InitLateInstanceField()
    //     0x402548: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x40254c: LoadField: d0 = r0->field_7
    //     0x40254c: ldur            d0, [x0, #7]
    // 0x402550: d1 = 0.050000
    //     0x402550: ldr             d1, [PP, #0x7958]  ; [pp+0x7958] IMM: double(0.05) from 0x3fa999999999999a
    // 0x402554: fcmp            d0, d1
    // 0x402558: b.le            #0x402568
    // 0x40255c: mov             x2, x0
    // 0x402560: StoreStaticField(0xd0c, r2)
    //     0x402560: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402564: str             x2, [x0, #0x1a18]
    // 0x402568: r0 = LoadStaticField(0x468)
    //     0x402568: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x40256c: ldr             x0, [x0, #0x8d0]
    // 0x402570: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402574: cmp             w0, w16
    // 0x402578: b.ne            #0x402584
    // 0x40257c: r2 = instance
    //     0x40257c: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x402580: r0 = InitLateFinalStaticField()
    //     0x402580: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x402584: r16 = <AppLocale, Translations>
    //     0x402584: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x402588: stp             x0, x16, [SP]
    // 0x40258c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x40258c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x402590: r0 = LocaleSettingsExt.currentTranslations()
    //     0x402590: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x402594: r1 = LoadClassIdInstr(r0)
    //     0x402594: ldur            x1, [x0, #-1]
    //     0x402598: ubfx            x1, x1, #0xc, #0x14
    // 0x40259c: cmp             x1, #0x8dd
    // 0x4025a0: b.ne            #0x4025cc
    // 0x4025a4: mov             x1, x0
    // 0x4025a8: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x4025a8: ldur            w0, [x1, #0x17]
    // 0x4025ac: DecompressPointer r0
    //     0x4025ac: add             x0, x0, HEAP, lsl #32
    // 0x4025b0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4025b4: cmp             w0, w16
    // 0x4025b8: b.ne            #0x4025c8
    // 0x4025bc: r2 = settingsPage
    //     0x4025bc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11188] Field <Translations.settingsPage>: late final (offset: 0x18)
    //     0x4025c0: ldr             x2, [x2, #0x188]
    // 0x4025c4: r0 = InitLateFinalInstanceField()
    //     0x4025c4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4025c8: b               #0x402650
    // 0x4025cc: cmp             x1, #0x8df
    // 0x4025d0: b.ne            #0x4025fc
    // 0x4025d4: mov             x1, x0
    // 0x4025d8: LoadField: r0 = r1->field_3b
    //     0x4025d8: ldur            w0, [x1, #0x3b]
    // 0x4025dc: DecompressPointer r0
    //     0x4025dc: add             x0, x0, HEAP, lsl #32
    // 0x4025e0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4025e4: cmp             w0, w16
    // 0x4025e8: b.ne            #0x4025f8
    // 0x4025ec: r2 = settingsPage
    //     0x4025ec: add             x2, PP, #0x11, lsl #12  ; [pp+0x11190] Field <TranslationsRu.settingsPage>: late final (offset: 0x3c)
    //     0x4025f0: ldr             x2, [x2, #0x190]
    // 0x4025f4: r0 = InitLateFinalInstanceField()
    //     0x4025f4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4025f8: b               #0x402650
    // 0x4025fc: cmp             x1, #0x8e0
    // 0x402600: b.ne            #0x40262c
    // 0x402604: mov             x1, x0
    // 0x402608: LoadField: r0 = r1->field_3b
    //     0x402608: ldur            w0, [x1, #0x3b]
    // 0x40260c: DecompressPointer r0
    //     0x40260c: add             x0, x0, HEAP, lsl #32
    // 0x402610: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402614: cmp             w0, w16
    // 0x402618: b.ne            #0x402628
    // 0x40261c: r2 = settingsPage
    //     0x40261c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11198] Field <TranslationsKk.settingsPage>: late final (offset: 0x3c)
    //     0x402620: ldr             x2, [x2, #0x198]
    // 0x402624: r0 = InitLateFinalInstanceField()
    //     0x402624: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402628: b               #0x402650
    // 0x40262c: mov             x1, x0
    // 0x402630: LoadField: r0 = r1->field_3b
    //     0x402630: ldur            w0, [x1, #0x3b]
    // 0x402634: DecompressPointer r0
    //     0x402634: add             x0, x0, HEAP, lsl #32
    // 0x402638: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40263c: cmp             w0, w16
    // 0x402640: b.ne            #0x402650
    // 0x402644: r2 = settingsPage
    //     0x402644: add             x2, PP, #0x11, lsl #12  ; [pp+0x111a0] Field <TranslationsEs.settingsPage>: late final (offset: 0x3c)
    //     0x402648: ldr             x2, [x2, #0x1a0]
    // 0x40264c: r0 = InitLateFinalInstanceField()
    //     0x40264c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402650: r1 = LoadClassIdInstr(r0)
    //     0x402650: ldur            x1, [x0, #-1]
    //     0x402654: ubfx            x1, x1, #0xc, #0x14
    // 0x402658: cmp             x1, #0xf4
    // 0x40265c: b.ne            #0x40266c
    // 0x402660: r3 = "Music volume"
    //     0x402660: add             x3, PP, #0x11, lsl #12  ; [pp+0x111f8] "Music volume"
    //     0x402664: ldr             x3, [x3, #0x1f8]
    // 0x402668: b               #0x40269c
    // 0x40266c: cmp             x1, #0xf5
    // 0x402670: b.ne            #0x402680
    // 0x402674: r3 = "Громкость фоновой музыки"
    //     0x402674: add             x3, PP, #0x11, lsl #12  ; [pp+0x11200] "Громкость фоновой музыки"
    //     0x402678: ldr             x3, [x3, #0x200]
    // 0x40267c: b               #0x40269c
    // 0x402680: cmp             x1, #0xf6
    // 0x402684: b.ne            #0x402694
    // 0x402688: r3 = "Музыканың дыбыс деңгейі"
    //     0x402688: add             x3, PP, #0x11, lsl #12  ; [pp+0x11208] "Музыканың дыбыс деңгейі"
    //     0x40268c: ldr             x3, [x3, #0x208]
    // 0x402690: b               #0x40269c
    // 0x402694: r3 = "Volumen de música"
    //     0x402694: add             x3, PP, #0x11, lsl #12  ; [pp+0x11210] "Volumen de música"
    //     0x402698: ldr             x3, [x3, #0x210]
    // 0x40269c: ldur            x0, [fp, #-8]
    // 0x4026a0: stur            x3, [fp, #-0x10]
    // 0x4026a4: r1 = Null
    //     0x4026a4: mov             x1, NULL
    // 0x4026a8: r2 = 8
    //     0x4026a8: mov             x2, #8
    // 0x4026ac: r0 = AllocateArray()
    //     0x4026ac: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4026b0: mov             x1, x0
    // 0x4026b4: ldur            x0, [fp, #-0x10]
    // 0x4026b8: stur            x1, [fp, #-0x18]
    // 0x4026bc: StoreField: r1->field_f = r0
    //     0x4026bc: stur            w0, [x1, #0xf]
    // 0x4026c0: r16 = ": "
    //     0x4026c0: ldr             x16, [PP, #0x2538]  ; [pp+0x2538] ": "
    // 0x4026c4: StoreField: r1->field_13 = r16
    //     0x4026c4: stur            w16, [x1, #0x13]
    // 0x4026c8: ldur            x0, [fp, #-8]
    // 0x4026cc: LoadField: r2 = r0->field_43
    //     0x4026cc: ldur            w2, [x0, #0x43]
    // 0x4026d0: DecompressPointer r2
    //     0x4026d0: add             x2, x2, HEAP, lsl #32
    // 0x4026d4: LoadField: d0 = r2->field_7
    //     0x4026d4: ldur            d0, [x2, #7]
    // 0x4026d8: d1 = 100.000000
    //     0x4026d8: add             x17, PP, #0xb, lsl #12  ; [pp+0xb838] IMM: double(100) from 0x4059000000000000
    //     0x4026dc: ldr             d1, [x17, #0x838]
    // 0x4026e0: fmul            d2, d0, d1
    // 0x4026e4: r2 = inline_Allocate_Double()
    //     0x4026e4: ldp             x2, x3, [THR, #0x60]  ; THR::top
    //     0x4026e8: add             x2, x2, #0x10
    //     0x4026ec: cmp             x3, x2
    //     0x4026f0: b.ls            #0x4027f8
    //     0x4026f4: str             x2, [THR, #0x60]  ; THR::top
    //     0x4026f8: sub             x2, x2, #0xf
    //     0x4026fc: mov             x3, #0xe19c
    //     0x402700: movk            x3, #3, lsl #16
    //     0x402704: stur            x3, [x2, #-1]
    // 0x402708: dmb             ishst
    // 0x40270c: StoreField: r2->field_7 = d2
    //     0x40270c: stur            d2, [x2, #7]
    // 0x402710: r16 = 2
    //     0x402710: mov             x16, #2
    // 0x402714: stp             x16, x2, [SP]
    // 0x402718: r0 = ~/()
    //     0x402718: bl              #0x307dc0  ; [dart:core] _Double::~/
    // 0x40271c: ldur            x1, [fp, #-0x18]
    // 0x402720: ArrayStore: r1[2] = r0  ; List_4
    //     0x402720: add             x25, x1, #0x17
    //     0x402724: str             w0, [x25]
    //     0x402728: tbz             w0, #0, #0x402744
    //     0x40272c: ldurb           w16, [x1, #-1]
    //     0x402730: ldurb           w17, [x0, #-1]
    //     0x402734: and             x16, x17, x16, lsr #2
    //     0x402738: tst             x16, HEAP, lsr #32
    //     0x40273c: b.eq            #0x402744
    //     0x402740: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x402744: ldur            x0, [fp, #-0x18]
    // 0x402748: r16 = "%"
    //     0x402748: ldr             x16, [PP, #0x698]  ; [pp+0x698] "%"
    // 0x40274c: StoreField: r0->field_1b = r16
    //     0x40274c: stur            w16, [x0, #0x1b]
    // 0x402750: str             x0, [SP]
    // 0x402754: r0 = _interpolate()
    //     0x402754: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x402758: mov             x1, x0
    // 0x40275c: ldur            x0, [fp, #-8]
    // 0x402760: stur            x1, [fp, #-0x10]
    // 0x402764: LoadField: r2 = r0->field_43
    //     0x402764: ldur            w2, [x0, #0x43]
    // 0x402768: DecompressPointer r2
    //     0x402768: add             x2, x2, HEAP, lsl #32
    // 0x40276c: LoadField: d0 = r2->field_7
    //     0x40276c: ldur            d0, [x2, #7]
    // 0x402770: d1 = 0.050000
    //     0x402770: ldr             d1, [PP, #0x7958]  ; [pp+0x7958] IMM: double(0.05) from 0x3fa999999999999a
    // 0x402774: fcmp            d1, d0
    // 0x402778: b.lt            #0x402784
    // 0x40277c: d0 = 0.250000
    //     0x40277c: fmov            d0, #0.25000000
    // 0x402780: b               #0x402788
    // 0x402784: d0 = 1.000000
    //     0x402784: fmov            d0, #1.00000000
    // 0x402788: ldr             x0, [fp, #0x10]
    // 0x40278c: stur            d0, [fp, #-0x20]
    // 0x402790: cmp             w0, NULL
    // 0x402794: b.eq            #0x402814
    // 0x402798: r0 = Opacity()
    //     0x402798: bl              #0x35c488  ; AllocateOpacityStub -> Opacity (size=0x1c)
    // 0x40279c: ldur            d0, [fp, #-0x20]
    // 0x4027a0: stur            x0, [fp, #-8]
    // 0x4027a4: StoreField: r0->field_f = d0
    //     0x4027a4: stur            d0, [x0, #0xf]
    // 0x4027a8: r1 = false
    //     0x4027a8: add             x1, NULL, #0x30  ; false
    // 0x4027ac: ArrayStore: r0[0] = r1  ; List_4
    //     0x4027ac: stur            w1, [x0, #0x17]
    // 0x4027b0: ldr             x1, [fp, #0x10]
    // 0x4027b4: StoreField: r0->field_b = r1
    //     0x4027b4: stur            w1, [x0, #0xb]
    // 0x4027b8: r0 = NesTooltip()
    //     0x4027b8: bl              #0x371620  ; AllocateNesTooltipStub -> NesTooltip (size=0x1c)
    // 0x4027bc: ldur            x1, [fp, #-8]
    // 0x4027c0: StoreField: r0->field_b = r1
    //     0x4027c0: stur            w1, [x0, #0xb]
    // 0x4027c4: ldur            x1, [fp, #-0x10]
    // 0x4027c8: StoreField: r0->field_f = r1
    //     0x4027c8: stur            w1, [x0, #0xf]
    // 0x4027cc: r1 = Instance_NesTooltipArrowPlacement
    //     0x4027cc: add             x1, PP, #0x11, lsl #12  ; [pp+0x111c8] Obj!NesTooltipArrowPlacement@5d8db1
    //     0x4027d0: ldr             x1, [x1, #0x1c8]
    // 0x4027d4: StoreField: r0->field_13 = r1
    //     0x4027d4: stur            w1, [x0, #0x13]
    // 0x4027d8: r1 = Instance_NesTooltipArrowDirection
    //     0x4027d8: add             x1, PP, #0x11, lsl #12  ; [pp+0x111d0] Obj!NesTooltipArrowDirection@5d8d51
    //     0x4027dc: ldr             x1, [x1, #0x1d0]
    // 0x4027e0: ArrayStore: r0[0] = r1  ; List_4
    //     0x4027e0: stur            w1, [x0, #0x17]
    // 0x4027e4: LeaveFrame
    //     0x4027e4: mov             SP, fp
    //     0x4027e8: ldp             fp, lr, [SP], #0x10
    // 0x4027ec: ret
    //     0x4027ec: ret             
    // 0x4027f0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4027f0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4027f4: b               #0x4024fc
    // 0x4027f8: SaveReg d2
    //     0x4027f8: str             q2, [SP, #-0x10]!
    // 0x4027fc: stp             x0, x1, [SP, #-0x10]!
    // 0x402800: r0 = AllocateDouble()
    //     0x402800: bl              #0x584528  ; AllocateDoubleStub
    // 0x402804: mov             x2, x0
    // 0x402808: ldp             x0, x1, [SP], #0x10
    // 0x40280c: RestoreReg d2
    //     0x40280c: ldr             q2, [SP], #0x10
    // 0x402810: b               #0x40270c
    // 0x402814: r0 = NullCastErrorSharedWithFPURegs()
    //     0x402814: bl              #0x584dc0  ; NullCastErrorSharedWithFPURegsStub
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x402818, size: 0xec
    // 0x402818: EnterFrame
    //     0x402818: stp             fp, lr, [SP, #-0x10]!
    //     0x40281c: mov             fp, SP
    // 0x402820: AllocStack(0x8)
    //     0x402820: sub             SP, SP, #8
    // 0x402824: CheckStackOverflow
    //     0x402824: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x402828: cmp             SP, x16
    //     0x40282c: b.ls            #0x4028e8
    // 0x402830: r0 = LoadStaticField(0xccc)
    //     0x402830: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402834: ldr             x0, [x0, #0x1998]
    // 0x402838: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40283c: cmp             w0, w16
    // 0x402840: b.ne            #0x402850
    // 0x402844: r2 = stows
    //     0x402844: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x402848: ldr             x2, [x2, #0x310]
    // 0x40284c: r0 = InitLateFinalStaticField()
    //     0x40284c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x402850: LoadField: r2 = r0->field_1b
    //     0x402850: ldur            w2, [x0, #0x1b]
    // 0x402854: DecompressPointer r2
    //     0x402854: add             x2, x2, HEAP, lsl #32
    // 0x402858: mov             x1, x2
    // 0x40285c: stur            x2, [fp, #-8]
    // 0x402860: LoadField: r0 = r1->field_43
    //     0x402860: ldur            w0, [x1, #0x43]
    // 0x402864: DecompressPointer r0
    //     0x402864: add             x0, x0, HEAP, lsl #32
    // 0x402868: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x40286c: cmp             w0, w16
    // 0x402870: b.ne            #0x402880
    // 0x402874: r2 = _value
    //     0x402874: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x402878: ldr             x2, [x2, #0x4b0]
    // 0x40287c: r0 = InitLateInstanceField()
    //     0x40287c: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x402880: LoadField: d0 = r0->field_7
    //     0x402880: ldur            d0, [x0, #7]
    // 0x402884: d1 = 0.050000
    //     0x402884: ldr             d1, [PP, #0x7958]  ; [pp+0x7958] IMM: double(0.05) from 0x3fa999999999999a
    // 0x402888: fcmp            d1, d0
    // 0x40288c: b.lt            #0x4028a0
    // 0x402890: r0 = LoadStaticField(0xd0c)
    //     0x402890: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402894: ldr             x0, [x0, #0x1a18]
    // 0x402898: LoadField: d0 = r0->field_7
    //     0x402898: ldur            d0, [x0, #7]
    // 0x40289c: b               #0x4028a4
    // 0x4028a0: d0 = 0.000000
    //     0x4028a0: eor             v0.16b, v0.16b, v0.16b
    // 0x4028a4: r2 = inline_Allocate_Double()
    //     0x4028a4: ldp             x2, x0, [THR, #0x60]  ; THR::top
    //     0x4028a8: add             x2, x2, #0x10
    //     0x4028ac: cmp             x0, x2
    //     0x4028b0: b.ls            #0x4028f0
    //     0x4028b4: str             x2, [THR, #0x60]  ; THR::top
    //     0x4028b8: sub             x2, x2, #0xf
    //     0x4028bc: mov             x0, #0xe19c
    //     0x4028c0: movk            x0, #3, lsl #16
    //     0x4028c4: stur            x0, [x2, #-1]
    // 0x4028c8: dmb             ishst
    // 0x4028cc: StoreField: r2->field_7 = d0
    //     0x4028cc: stur            d0, [x2, #7]
    // 0x4028d0: ldur            x1, [fp, #-8]
    // 0x4028d4: r0 = value=()
    //     0x4028d4: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x4028d8: r0 = Null
    //     0x4028d8: mov             x0, NULL
    // 0x4028dc: LeaveFrame
    //     0x4028dc: mov             SP, fp
    //     0x4028e0: ldp             fp, lr, [SP], #0x10
    // 0x4028e4: ret
    //     0x4028e4: ret             
    // 0x4028e8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4028e8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4028ec: b               #0x402830
    // 0x4028f0: SaveReg d0
    //     0x4028f0: str             q0, [SP, #-0x10]!
    // 0x4028f4: r0 = AllocateDouble()
    //     0x4028f4: bl              #0x584528  ; AllocateDoubleStub
    // 0x4028f8: mov             x2, x0
    // 0x4028fc: RestoreReg d0
    //     0x4028fc: ldr             q0, [SP], #0x10
    // 0x402900: b               #0x4028cc
  }
}

// class id: 2867, size: 0x24, field offset: 0xc
//   const constructor, 
class _HomePageButton<X0> extends StatefulWidget {

  _ createState(/* No info */) {
    // ** addr: 0x43dd7c, size: 0x3c
    // 0x43dd7c: EnterFrame
    //     0x43dd7c: stp             fp, lr, [SP, #-0x10]!
    //     0x43dd80: mov             fp, SP
    // 0x43dd84: LoadField: r2 = r1->field_b
    //     0x43dd84: ldur            w2, [x1, #0xb]
    // 0x43dd88: DecompressPointer r2
    //     0x43dd88: add             x2, x2, HEAP, lsl #32
    // 0x43dd8c: r1 = Null
    //     0x43dd8c: mov             x1, NULL
    // 0x43dd90: r3 = <_HomePageButton<X0>, X0>
    //     0x43dd90: add             x3, PP, #0x12, lsl #12  ; [pp+0x12308] TypeArguments: <_HomePageButton<X0>, X0>
    //     0x43dd94: ldr             x3, [x3, #0x308]
    // 0x43dd98: r30 = InstantiateTypeArgumentsStub
    //     0x43dd98: ldr             lr, [PP, #0x738]  ; [pp+0x738] Stub: InstantiateTypeArguments (0x220fc4)
    // 0x43dd9c: LoadField: r30 = r30->field_7
    //     0x43dd9c: ldur            lr, [lr, #7]
    // 0x43dda0: blr             lr
    // 0x43dda4: mov             x1, x0
    // 0x43dda8: r0 = _HomePageButtonState()
    //     0x43dda8: bl              #0x43ddb8  ; Allocate_HomePageButtonStateStub -> _HomePageButtonState<C1X0> (size=0x14)
    // 0x43ddac: LeaveFrame
    //     0x43ddac: mov             SP, fp
    //     0x43ddb0: ldp             fp, lr, [SP], #0x10
    // 0x43ddb4: ret
    //     0x43ddb4: ret             
  }
}
