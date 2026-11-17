// lib: , url: package:ricochlime/flame/ticker.dart

// class id: 1049311, size: 0x8
class :: {
}

// class id: 258, size: 0xc, field offset: 0x8
class Ticker extends Object {

  _ delayed(/* No info */) async {
    // ** addr: 0x37e964, size: 0x448
    // 0x37e964: EnterFrame
    //     0x37e964: stp             fp, lr, [SP, #-0x10]!
    //     0x37e968: mov             fp, SP
    // 0x37e96c: AllocStack(0xe8)
    //     0x37e96c: sub             SP, SP, #0xe8
    // 0x37e970: SetupParameters(Ticker this /* r1 => r1, fp-0xb8 */, dynamic _ /* r2 => r2, fp-0xc0 */, {dynamic onTick = Null /* r3, fp-0xb0 */})
    //     0x37e970: stur            NULL, [fp, #-8]
    //     0x37e974: stur            x1, [fp, #-0xb8]
    //     0x37e978: stur            x2, [fp, #-0xc0]
    //     0x37e97c: ldur            w0, [x4, #0x13]
    //     0x37e980: ldur            w3, [x4, #0x1f]
    //     0x37e984: add             x3, x3, HEAP, lsl #32
    //     0x37e988: add             x16, PP, #0xc, lsl #12  ; [pp+0xcfb8] "onTick"
    //     0x37e98c: ldr             x16, [x16, #0xfb8]
    //     0x37e990: cmp             w3, w16
    //     0x37e994: b.ne            #0x37e9b4
    //     0x37e998: ldur            w3, [x4, #0x23]
    //     0x37e99c: add             x3, x3, HEAP, lsl #32
    //     0x37e9a0: sub             w4, w0, w3
    //     0x37e9a4: add             x0, fp, w4, sxtw #2
    //     0x37e9a8: ldr             x0, [x0, #8]
    //     0x37e9ac: mov             x3, x0
    //     0x37e9b0: b               #0x37e9b8
    //     0x37e9b4: mov             x3, NULL
    //     0x37e9b8: stur            x3, [fp, #-0xb0]
    // 0x37e9bc: CheckStackOverflow
    //     0x37e9bc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37e9c0: cmp             SP, x16
    //     0x37e9c4: b.ls            #0x37ed7c
    // 0x37e9c8: InitAsync() -> Future<double>
    //     0x37e9c8: ldr             x0, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    //     0x37e9cc: bl              #0x2556b4  ; InitAsyncStub
    // 0x37e9d0: ldur            x0, [fp, #-0xc0]
    // 0x37e9d4: LoadField: r1 = r0->field_7
    //     0x37e9d4: ldur            x1, [x0, #7]
    // 0x37e9d8: r0 = 1000
    //     0x37e9d8: mov             x0, #0x3e8
    // 0x37e9dc: sdiv            x2, x1, x0
    // 0x37e9e0: scvtf           d0, x2
    // 0x37e9e4: d1 = 1000.000000
    //     0x37e9e4: add             x17, PP, #0xc, lsl #12  ; [pp+0xcfc0] IMM: double(1000) from 0x408f400000000000
    //     0x37e9e8: ldr             d1, [x17, #0xfc0]
    // 0x37e9ec: fdiv            d2, d0, d1
    // 0x37e9f0: ldur            x1, [fp, #-0xb8]
    // 0x37e9f4: stur            d2, [fp, #-0xd0]
    // 0x37e9f8: r0 = onTick()
    //     0x37e9f8: bl              #0x37f580  ; [package:ricochlime/flame/ticker.dart] Ticker::onTick
    // 0x37e9fc: r1 = <double>
    //     0x37e9fc: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x37ea00: stur            x0, [fp, #-0xb8]
    // 0x37ea04: r0 = _StreamIterator()
    //     0x37ea04: bl              #0x37f574  ; Allocate_StreamIteratorStub -> _StreamIterator<X0> (size=0x18)
    // 0x37ea08: mov             x2, x0
    // 0x37ea0c: r0 = false
    //     0x37ea0c: add             x0, NULL, #0x30  ; false
    // 0x37ea10: stur            x2, [fp, #-0xc0]
    // 0x37ea14: StoreField: r2->field_13 = r0
    //     0x37ea14: stur            w0, [x2, #0x13]
    // 0x37ea18: ldur            x1, [fp, #-0xb8]
    // 0x37ea1c: StoreField: r2->field_f = r1
    //     0x37ea1c: stur            w1, [x2, #0xf]
    // 0x37ea20: ldur            d0, [fp, #-0xd0]
    // 0x37ea24: d1 = 0.000000
    //     0x37ea24: eor             v1.16b, v1.16b, v1.16b
    // 0x37ea28: ldur            x3, [fp, #-0xb0]
    // 0x37ea2c: stur            d1, [fp, #-0xd8]
    // 0x37ea30: CheckStackOverflow
    //     0x37ea30: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37ea34: cmp             SP, x16
    //     0x37ea38: b.ls            #0x37ed84
    // 0x37ea3c: LoadField: r4 = r2->field_b
    //     0x37ea3c: ldur            w4, [x2, #0xb]
    // 0x37ea40: DecompressPointer r4
    //     0x37ea40: add             x4, x4, HEAP, lsl #32
    // 0x37ea44: stur            x4, [fp, #-0xb8]
    // 0x37ea48: cmp             w4, NULL
    // 0x37ea4c: b.eq            #0x37eadc
    // 0x37ea50: LoadField: r1 = r2->field_13
    //     0x37ea50: ldur            w1, [x2, #0x13]
    // 0x37ea54: DecompressPointer r1
    //     0x37ea54: add             x1, x1, HEAP, lsl #32
    // 0x37ea58: tbnz            w1, #4, #0x37ecb8
    // 0x37ea5c: r1 = <bool>
    //     0x37ea5c: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x37ea60: r0 = _Future()
    //     0x37ea60: bl              #0x255644  ; Allocate_FutureStub -> _Future<X0> (size=0x1c)
    // 0x37ea64: stur            x0, [fp, #-0xc8]
    // 0x37ea68: StoreField: r0->field_b = rZR
    //     0x37ea68: stur            xzr, [x0, #0xb]
    // 0x37ea6c: r0 = LoadStaticField(0x358)
    //     0x37ea6c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37ea70: ldr             x0, [x0, #0x6b0]
    // 0x37ea74: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37ea78: cmp             w0, w16
    // 0x37ea7c: b.ne            #0x37ea88
    // 0x37ea80: r2 = _current
    //     0x37ea80: ldr             x2, [PP, #0x650]  ; [pp+0x650] Field <Zone._current@5048458>: static late (offset: 0x358)
    // 0x37ea84: r0 = InitLateStaticField()
    //     0x37ea84: bl              #0x582704  ; InitLateStaticFieldStub
    // 0x37ea88: ldur            x2, [fp, #-0xc8]
    // 0x37ea8c: StoreField: r2->field_13 = r0
    //     0x37ea8c: stur            w0, [x2, #0x13]
    // 0x37ea90: mov             x0, x2
    // 0x37ea94: ldur            x3, [fp, #-0xc0]
    // 0x37ea98: StoreField: r3->field_f = r0
    //     0x37ea98: stur            w0, [x3, #0xf]
    //     0x37ea9c: ldurb           w16, [x3, #-1]
    //     0x37eaa0: ldurb           w17, [x0, #-1]
    //     0x37eaa4: and             x16, x17, x16, lsr #2
    //     0x37eaa8: tst             x16, HEAP, lsr #32
    //     0x37eaac: b.eq            #0x37eab4
    //     0x37eab0: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x37eab4: r4 = false
    //     0x37eab4: add             x4, NULL, #0x30  ; false
    // 0x37eab8: StoreField: r3->field_13 = r4
    //     0x37eab8: stur            w4, [x3, #0x13]
    // 0x37eabc: ldur            x1, [fp, #-0xb8]
    // 0x37eac0: r0 = LoadClassIdInstr(r1)
    //     0x37eac0: ldur            x0, [x1, #-1]
    //     0x37eac4: ubfx            x0, x0, #0xc, #0x14
    // 0x37eac8: r0 = GDT[cid_x0 + -0xff8]()
    //     0x37eac8: sub             lr, x0, #0xff8
    //     0x37eacc: ldr             lr, [x21, lr, lsl #3]
    //     0x37ead0: blr             lr
    // 0x37ead4: ldur            x1, [fp, #-0xc8]
    // 0x37ead8: b               #0x37eae8
    // 0x37eadc: ldur            x1, [fp, #-0xc0]
    // 0x37eae0: r0 = _initializeOrDone()
    //     0x37eae0: bl              #0x37f04c  ; [dart:async] _StreamIterator::_initializeOrDone
    // 0x37eae4: mov             x1, x0
    // 0x37eae8: mov             x0, x1
    // 0x37eaec: stur            x1, [fp, #-0xb8]
    // 0x37eaf0: r0 = Await()
    //     0x37eaf0: bl              #0x255470  ; AwaitStub
    // 0x37eaf4: r16 = true
    //     0x37eaf4: add             x16, NULL, #0x20  ; true
    // 0x37eaf8: cmp             w0, w16
    // 0x37eafc: b.ne            #0x37ece8
    // 0x37eb00: ldur            x3, [fp, #-0xc0]
    // 0x37eb04: LoadField: r0 = r3->field_13
    //     0x37eb04: ldur            w0, [x3, #0x13]
    // 0x37eb08: DecompressPointer r0
    //     0x37eb08: add             x0, x0, HEAP, lsl #32
    // 0x37eb0c: tbnz            w0, #4, #0x37eb64
    // 0x37eb10: LoadField: r4 = r3->field_f
    //     0x37eb10: ldur            w4, [x3, #0xf]
    // 0x37eb14: DecompressPointer r4
    //     0x37eb14: add             x4, x4, HEAP, lsl #32
    // 0x37eb18: mov             x0, x4
    // 0x37eb1c: stur            x4, [fp, #-0xb8]
    // 0x37eb20: r2 = Null
    //     0x37eb20: mov             x2, NULL
    // 0x37eb24: r1 = Null
    //     0x37eb24: mov             x1, NULL
    // 0x37eb28: r4 = 60
    //     0x37eb28: mov             x4, #0x3c
    // 0x37eb2c: branchIfSmi(r0, 0x37eb38)
    //     0x37eb2c: tbz             w0, #0, #0x37eb38
    // 0x37eb30: r4 = LoadClassIdInstr(r0)
    //     0x37eb30: ldur            x4, [x0, #-1]
    //     0x37eb34: ubfx            x4, x4, #0xc, #0x14
    // 0x37eb38: cmp             x4, #0x3e
    // 0x37eb3c: b.eq            #0x37eb50
    // 0x37eb40: r8 = double
    //     0x37eb40: ldr             x8, [PP, #0x98]  ; [pp+0x98] Type: double
    // 0x37eb44: r3 = Null
    //     0x37eb44: add             x3, PP, #0xc, lsl #12  ; [pp+0xcfc8] Null
    //     0x37eb48: ldr             x3, [x3, #0xfc8]
    // 0x37eb4c: r0 = double()
    //     0x37eb4c: bl              #0x5893ec  ; IsType_double_Stub
    // 0x37eb50: ldur            x0, [fp, #-0xb8]
    // 0x37eb54: LoadField: d0 = r0->field_7
    //     0x37eb54: ldur            d0, [x0, #7]
    // 0x37eb58: mov             v1.16b, v0.16b
    // 0x37eb5c: r1 = Null
    //     0x37eb5c: mov             x1, NULL
    // 0x37eb60: b               #0x37eba0
    // 0x37eb64: r3 = Null
    //     0x37eb64: mov             x3, NULL
    // 0x37eb68: mov             x0, x3
    // 0x37eb6c: mov             x2, x3
    // 0x37eb70: mov             x1, x3
    // 0x37eb74: r4 = LoadClassIdInstr(r0)
    //     0x37eb74: ldur            x4, [x0, #-1]
    //     0x37eb78: ubfx            x4, x4, #0xc, #0x14
    // 0x37eb7c: cmp             x4, #0x3e
    // 0x37eb80: b.eq            #0x37eb94
    // 0x37eb84: r8 = double
    //     0x37eb84: ldr             x8, [PP, #0x98]  ; [pp+0x98] Type: double
    // 0x37eb88: r3 = Null
    //     0x37eb88: add             x3, PP, #0xc, lsl #12  ; [pp+0xcfd8] Null
    //     0x37eb8c: ldr             x3, [x3, #0xfd8]
    // 0x37eb90: r0 = double()
    //     0x37eb90: bl              #0x5893ec  ; IsType_double_Stub
    // 0x37eb94: r1 = Null
    //     0x37eb94: mov             x1, NULL
    // 0x37eb98: LoadField: d0 = r1->field_7
    //     0x37eb98: ldur            d0, [x1, #7]
    // 0x37eb9c: mov             v1.16b, v0.16b
    // 0x37eba0: ldur            x2, [fp, #-0xb0]
    // 0x37eba4: ldur            d0, [fp, #-0xd8]
    // 0x37eba8: fadd            d2, d0, d1
    // 0x37ebac: stur            d2, [fp, #-0xe0]
    // 0x37ebb0: cmp             w2, NULL
    // 0x37ebb4: b.ne            #0x37ebc0
    // 0x37ebb8: mov             v1.16b, v2.16b
    // 0x37ebbc: b               #0x37ebe8
    // 0x37ebc0: str             x2, [SP]
    // 0x37ebc4: mov             x0, x2
    // 0x37ebc8: ClosureCall
    //     0x37ebc8: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    //     0x37ebcc: ldur            x2, [x0, #0x1f]
    //     0x37ebd0: blr             x2
    // 0x37ebd4: r16 = Instance_TickerDelayedInstruction
    //     0x37ebd4: add             x16, PP, #0xc, lsl #12  ; [pp+0xcfe8] Obj!TickerDelayedInstruction@5d89e1
    //     0x37ebd8: ldr             x16, [x16, #0xfe8]
    // 0x37ebdc: cmp             w0, w16
    // 0x37ebe0: b.eq            #0x37ec5c
    // 0x37ebe4: ldur            d1, [fp, #-0xe0]
    // 0x37ebe8: ldur            d2, [fp, #-0xd0]
    // 0x37ebec: fcmp            d1, d2
    // 0x37ebf0: b.ge            #0x37ec04
    // 0x37ebf4: mov             v0.16b, v2.16b
    // 0x37ebf8: ldur            x2, [fp, #-0xc0]
    // 0x37ebfc: r0 = false
    //     0x37ebfc: add             x0, NULL, #0x30  ; false
    // 0x37ec00: b               #0x37ea28
    // 0x37ec04: ldur            x1, [fp, #-0xc0]
    // 0x37ec08: LoadField: r0 = r1->field_b
    //     0x37ec08: ldur            w0, [x1, #0xb]
    // 0x37ec0c: DecompressPointer r0
    //     0x37ec0c: add             x0, x0, HEAP, lsl #32
    // 0x37ec10: cmp             w0, NULL
    // 0x37ec14: b.eq            #0x37ec28
    // 0x37ec18: r0 = cancel()
    //     0x37ec18: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x37ec1c: mov             x1, x0
    // 0x37ec20: stur            x1, [fp, #-0xb8]
    // 0x37ec24: r0 = Await()
    //     0x37ec24: bl              #0x255470  ; AwaitStub
    // 0x37ec28: ldur            d0, [fp, #-0xe0]
    // 0x37ec2c: r0 = inline_Allocate_Double()
    //     0x37ec2c: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x37ec30: add             x0, x0, #0x10
    //     0x37ec34: cmp             x1, x0
    //     0x37ec38: b.ls            #0x37ed8c
    //     0x37ec3c: str             x0, [THR, #0x60]  ; THR::top
    //     0x37ec40: sub             x0, x0, #0xf
    //     0x37ec44: mov             x1, #0xe19c
    //     0x37ec48: movk            x1, #3, lsl #16
    //     0x37ec4c: stur            x1, [x0, #-1]
    // 0x37ec50: dmb             ishst
    // 0x37ec54: StoreField: r0->field_7 = d0
    //     0x37ec54: stur            d0, [x0, #7]
    // 0x37ec58: r0 = ReturnAsyncNotFuture()
    //     0x37ec58: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37ec5c: ldur            x1, [fp, #-0xc0]
    // 0x37ec60: ldur            d0, [fp, #-0xe0]
    // 0x37ec64: LoadField: r0 = r1->field_b
    //     0x37ec64: ldur            w0, [x1, #0xb]
    // 0x37ec68: DecompressPointer r0
    //     0x37ec68: add             x0, x0, HEAP, lsl #32
    // 0x37ec6c: cmp             w0, NULL
    // 0x37ec70: b.eq            #0x37ec84
    // 0x37ec74: r0 = cancel()
    //     0x37ec74: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x37ec78: mov             x1, x0
    // 0x37ec7c: stur            x1, [fp, #-0xb8]
    // 0x37ec80: r0 = Await()
    //     0x37ec80: bl              #0x255470  ; AwaitStub
    // 0x37ec84: ldur            d0, [fp, #-0xe0]
    // 0x37ec88: r0 = inline_Allocate_Double()
    //     0x37ec88: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x37ec8c: add             x0, x0, #0x10
    //     0x37ec90: cmp             x1, x0
    //     0x37ec94: b.ls            #0x37ed9c
    //     0x37ec98: str             x0, [THR, #0x60]  ; THR::top
    //     0x37ec9c: sub             x0, x0, #0xf
    //     0x37eca0: mov             x1, #0xe19c
    //     0x37eca4: movk            x1, #3, lsl #16
    //     0x37eca8: stur            x1, [x0, #-1]
    // 0x37ecac: dmb             ishst
    // 0x37ecb0: StoreField: r0->field_7 = d0
    //     0x37ecb0: stur            d0, [x0, #7]
    // 0x37ecb4: r0 = ReturnAsyncNotFuture()
    //     0x37ecb4: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37ecb8: mov             v2.16b, v0.16b
    // 0x37ecbc: mov             x1, x2
    // 0x37ecc0: mov             v0.16b, v1.16b
    // 0x37ecc4: r0 = StateError()
    //     0x37ecc4: bl              #0x2390c8  ; AllocateStateErrorStub -> StateError (size=0x10)
    // 0x37ecc8: mov             x1, x0
    // 0x37eccc: r0 = "Already waiting for next."
    //     0x37eccc: add             x0, PP, #0xc, lsl #12  ; [pp+0xcff0] "Already waiting for next."
    //     0x37ecd0: ldr             x0, [x0, #0xff0]
    // 0x37ecd4: stur            x1, [fp, #-0xb8]
    // 0x37ecd8: StoreField: r1->field_b = r0
    //     0x37ecd8: stur            w0, [x1, #0xb]
    // 0x37ecdc: mov             x0, x1
    // 0x37ece0: r0 = Throw()
    //     0x37ece0: bl              #0x5827dc  ; ThrowStub
    // 0x37ece4: brk             #0
    // 0x37ece8: ldur            x2, [fp, #-0xc0]
    // 0x37ecec: LoadField: r0 = r2->field_b
    //     0x37ecec: ldur            w0, [x2, #0xb]
    // 0x37ecf0: DecompressPointer r0
    //     0x37ecf0: add             x0, x0, HEAP, lsl #32
    // 0x37ecf4: cmp             w0, NULL
    // 0x37ecf8: b.eq            #0x37ed10
    // 0x37ecfc: mov             x1, x2
    // 0x37ed00: r0 = cancel()
    //     0x37ed00: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x37ed04: mov             x1, x0
    // 0x37ed08: stur            x1, [fp, #-0xb0]
    // 0x37ed0c: r0 = Await()
    //     0x37ed0c: bl              #0x255470  ; AwaitStub
    // 0x37ed10: r0 = StateError()
    //     0x37ed10: bl              #0x2390c8  ; AllocateStateErrorStub -> StateError (size=0x10)
    // 0x37ed14: mov             x1, x0
    // 0x37ed18: r0 = "Ticker.delayed: Game was disposed before the duration passed"
    //     0x37ed18: add             x0, PP, #0xc, lsl #12  ; [pp+0xcff8] "Ticker.delayed: Game was disposed before the duration passed"
    //     0x37ed1c: ldr             x0, [x0, #0xff8]
    // 0x37ed20: StoreField: r1->field_b = r0
    //     0x37ed20: stur            w0, [x1, #0xb]
    // 0x37ed24: mov             x0, x1
    // 0x37ed28: r0 = Throw()
    //     0x37ed28: bl              #0x5827dc  ; ThrowStub
    // 0x37ed2c: brk             #0
    // 0x37ed30: sub             SP, fp, #0xe8
    // 0x37ed34: ldur            x2, [fp, #-0xc0]
    // 0x37ed38: mov             x3, x0
    // 0x37ed3c: stur            x0, [fp, #-0xb0]
    // 0x37ed40: mov             x0, x1
    // 0x37ed44: stur            x1, [fp, #-0xb8]
    // 0x37ed48: LoadField: r1 = r2->field_b
    //     0x37ed48: ldur            w1, [x2, #0xb]
    // 0x37ed4c: DecompressPointer r1
    //     0x37ed4c: add             x1, x1, HEAP, lsl #32
    // 0x37ed50: cmp             w1, NULL
    // 0x37ed54: b.eq            #0x37ed6c
    // 0x37ed58: mov             x1, x2
    // 0x37ed5c: r0 = cancel()
    //     0x37ed5c: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x37ed60: mov             x1, x0
    // 0x37ed64: stur            x1, [fp, #-0xc0]
    // 0x37ed68: r0 = Await()
    //     0x37ed68: bl              #0x255470  ; AwaitStub
    // 0x37ed6c: ldur            x0, [fp, #-0xb0]
    // 0x37ed70: ldur            x1, [fp, #-0xb8]
    // 0x37ed74: r0 = ReThrow()
    //     0x37ed74: bl              #0x5827b0  ; ReThrowStub
    // 0x37ed78: brk             #0
    // 0x37ed7c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37ed7c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37ed80: b               #0x37e9c8
    // 0x37ed84: r0 = StackOverflowSharedWithFPURegs()
    //     0x37ed84: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x37ed88: b               #0x37ea3c
    // 0x37ed8c: SaveReg d0
    //     0x37ed8c: str             q0, [SP, #-0x10]!
    // 0x37ed90: r0 = AllocateDouble()
    //     0x37ed90: bl              #0x584528  ; AllocateDoubleStub
    // 0x37ed94: RestoreReg d0
    //     0x37ed94: ldr             q0, [SP], #0x10
    // 0x37ed98: b               #0x37ec54
    // 0x37ed9c: SaveReg d0
    //     0x37ed9c: str             q0, [SP, #-0x10]!
    // 0x37eda0: r0 = AllocateDouble()
    //     0x37eda0: bl              #0x584528  ; AllocateDoubleStub
    // 0x37eda4: RestoreReg d0
    //     0x37eda4: ldr             q0, [SP], #0x10
    // 0x37eda8: b               #0x37ecb0
  }
  get _ onTick(/* No info */) {
    // ** addr: 0x37f580, size: 0x34
    // 0x37f580: EnterFrame
    //     0x37f580: stp             fp, lr, [SP, #-0x10]!
    //     0x37f584: mov             fp, SP
    // 0x37f588: AllocStack(0x8)
    //     0x37f588: sub             SP, SP, #8
    // 0x37f58c: LoadField: r0 = r1->field_7
    //     0x37f58c: ldur            w0, [x1, #7]
    // 0x37f590: DecompressPointer r0
    //     0x37f590: add             x0, x0, HEAP, lsl #32
    // 0x37f594: stur            x0, [fp, #-8]
    // 0x37f598: r1 = <double>
    //     0x37f598: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x37f59c: r0 = _BroadcastStream()
    //     0x37f59c: bl              #0x29c328  ; Allocate_BroadcastStreamStub -> _BroadcastStream<X0> (size=0x10)
    // 0x37f5a0: ldur            x1, [fp, #-8]
    // 0x37f5a4: StoreField: r0->field_b = r1
    //     0x37f5a4: stur            w1, [x0, #0xb]
    // 0x37f5a8: LeaveFrame
    //     0x37f5a8: mov             SP, fp
    //     0x37f5ac: ldp             fp, lr, [SP], #0x10
    // 0x37f5b0: ret
    //     0x37f5b0: ret             
  }
  _ tick(/* No info */) {
    // ** addr: 0x3d159c, size: 0x84
    // 0x3d159c: EnterFrame
    //     0x3d159c: stp             fp, lr, [SP, #-0x10]!
    //     0x3d15a0: mov             fp, SP
    // 0x3d15a4: CheckStackOverflow
    //     0x3d15a4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d15a8: cmp             SP, x16
    //     0x3d15ac: b.ls            #0x3d15fc
    // 0x3d15b0: LoadField: r0 = r1->field_7
    //     0x3d15b0: ldur            w0, [x1, #7]
    // 0x3d15b4: DecompressPointer r0
    //     0x3d15b4: add             x0, x0, HEAP, lsl #32
    // 0x3d15b8: r2 = inline_Allocate_Double()
    //     0x3d15b8: ldp             x2, x1, [THR, #0x60]  ; THR::top
    //     0x3d15bc: add             x2, x2, #0x10
    //     0x3d15c0: cmp             x1, x2
    //     0x3d15c4: b.ls            #0x3d1604
    //     0x3d15c8: str             x2, [THR, #0x60]  ; THR::top
    //     0x3d15cc: sub             x2, x2, #0xf
    //     0x3d15d0: mov             x1, #0xe19c
    //     0x3d15d4: movk            x1, #3, lsl #16
    //     0x3d15d8: stur            x1, [x2, #-1]
    // 0x3d15dc: dmb             ishst
    // 0x3d15e0: StoreField: r2->field_7 = d0
    //     0x3d15e0: stur            d0, [x2, #7]
    // 0x3d15e4: mov             x1, x0
    // 0x3d15e8: r0 = add()
    //     0x3d15e8: bl              #0x4c50a0  ; [dart:async] _BroadcastStreamController::add
    // 0x3d15ec: r0 = Null
    //     0x3d15ec: mov             x0, NULL
    // 0x3d15f0: LeaveFrame
    //     0x3d15f0: mov             SP, fp
    //     0x3d15f4: ldp             fp, lr, [SP], #0x10
    // 0x3d15f8: ret
    //     0x3d15f8: ret             
    // 0x3d15fc: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d15fc: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d1600: b               #0x3d15b0
    // 0x3d1604: SaveReg d0
    //     0x3d1604: str             q0, [SP, #-0x10]!
    // 0x3d1608: SaveReg r0
    //     0x3d1608: str             x0, [SP, #-8]!
    // 0x3d160c: r0 = AllocateDouble()
    //     0x3d160c: bl              #0x584528  ; AllocateDoubleStub
    // 0x3d1610: mov             x2, x0
    // 0x3d1614: RestoreReg r0
    //     0x3d1614: ldr             x0, [SP], #8
    // 0x3d1618: RestoreReg d0
    //     0x3d1618: ldr             q0, [SP], #0x10
    // 0x3d161c: b               #0x3d15e0
  }
}

// class id: 3839, size: 0x14, field offset: 0x14
enum TickerDelayedInstruction extends _Enum {

  _Mint field_8;
  _OneByteString field_10;

  _ _enumToString(/* No info */) {
    // ** addr: 0x4a0344, size: 0x64
    // 0x4a0344: EnterFrame
    //     0x4a0344: stp             fp, lr, [SP, #-0x10]!
    //     0x4a0348: mov             fp, SP
    // 0x4a034c: AllocStack(0x10)
    //     0x4a034c: sub             SP, SP, #0x10
    // 0x4a0350: SetupParameters(TickerDelayedInstruction this /* r1 => r0, fp-0x8 */)
    //     0x4a0350: mov             x0, x1
    //     0x4a0354: stur            x1, [fp, #-8]
    // 0x4a0358: CheckStackOverflow
    //     0x4a0358: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a035c: cmp             SP, x16
    //     0x4a0360: b.ls            #0x4a03a0
    // 0x4a0364: r1 = Null
    //     0x4a0364: mov             x1, NULL
    // 0x4a0368: r2 = 4
    //     0x4a0368: mov             x2, #4
    // 0x4a036c: r0 = AllocateArray()
    //     0x4a036c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a0370: r16 = "TickerDelayedInstruction."
    //     0x4a0370: add             x16, PP, #0xd, lsl #12  ; [pp+0xdcb8] "TickerDelayedInstruction."
    //     0x4a0374: ldr             x16, [x16, #0xcb8]
    // 0x4a0378: StoreField: r0->field_f = r16
    //     0x4a0378: stur            w16, [x0, #0xf]
    // 0x4a037c: ldur            x1, [fp, #-8]
    // 0x4a0380: LoadField: r2 = r1->field_f
    //     0x4a0380: ldur            w2, [x1, #0xf]
    // 0x4a0384: DecompressPointer r2
    //     0x4a0384: add             x2, x2, HEAP, lsl #32
    // 0x4a0388: StoreField: r0->field_13 = r2
    //     0x4a0388: stur            w2, [x0, #0x13]
    // 0x4a038c: str             x0, [SP]
    // 0x4a0390: r0 = _interpolate()
    //     0x4a0390: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a0394: LeaveFrame
    //     0x4a0394: mov             SP, fp
    //     0x4a0398: ldp             fp, lr, [SP], #0x10
    // 0x4a039c: ret
    //     0x4a039c: ret             
    // 0x4a03a0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a03a0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a03a4: b               #0x4a0364
  }
}
