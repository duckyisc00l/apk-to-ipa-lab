// lib: , url: package:ricochlime/utils/ricochlime_audio.dart

// class id: 1049333, size: 0x8
class :: {

  static late final SoLoud _soLoud; // offset: 0xcfc

  static SoLoud _soLoud() {
    // ** addr: 0x287fa8, size: 0x48
    // 0x287fa8: EnterFrame
    //     0x287fa8: stp             fp, lr, [SP, #-0x10]!
    //     0x287fac: mov             fp, SP
    // 0x287fb0: CheckStackOverflow
    //     0x287fb0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x287fb4: cmp             SP, x16
    //     0x287fb8: b.ls            #0x287fe8
    // 0x287fbc: r0 = LoadStaticField(0xbc0)
    //     0x287fbc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x287fc0: ldr             x0, [x0, #0x1780]
    // 0x287fc4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x287fc8: cmp             w0, w16
    // 0x287fcc: b.ne            #0x287fdc
    // 0x287fd0: r2 = instance
    //     0x287fd0: add             x2, PP, #0xf, lsl #12  ; [pp+0xffb8] Field <SoLoud.instance>: static late final (offset: 0xbc0)
    //     0x287fd4: ldr             x2, [x2, #0xfb8]
    // 0x287fd8: r0 = InitLateFinalStaticField()
    //     0x287fd8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x287fdc: LeaveFrame
    //     0x287fdc: mov             SP, fp
    //     0x287fe0: ldp             fp, lr, [SP], #0x10
    // 0x287fe4: ret
    //     0x287fe4: ret             
    // 0x287fe8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x287fe8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x287fec: b               #0x287fbc
  }
}

// class id: 225, size: 0x20, field offset: 0x8
class _AudioPool extends Object {

  late final Duration _loopingStartAt; // offset: 0x18

  _ init(/* No info */) async {
    // ** addr: 0x28e7e8, size: 0x16c
    // 0x28e7e8: EnterFrame
    //     0x28e7e8: stp             fp, lr, [SP, #-0x10]!
    //     0x28e7ec: mov             fp, SP
    // 0x28e7f0: AllocStack(0x40)
    //     0x28e7f0: sub             SP, SP, #0x40
    // 0x28e7f4: SetupParameters(_AudioPool this /* r1 => r1, fp-0x10 */)
    //     0x28e7f4: stur            NULL, [fp, #-8]
    //     0x28e7f8: stur            x1, [fp, #-0x10]
    // 0x28e7fc: CheckStackOverflow
    //     0x28e7fc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28e800: cmp             SP, x16
    //     0x28e804: b.ls            #0x28e944
    // 0x28e808: InitAsync() -> Future<void?>
    //     0x28e808: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x28e80c: bl              #0x2556b4  ; InitAsyncStub
    // 0x28e810: ldur            x1, [fp, #-0x10]
    // 0x28e814: LoadField: r0 = r1->field_1b
    //     0x28e814: ldur            w0, [x1, #0x1b]
    // 0x28e818: DecompressPointer r0
    //     0x28e818: add             x0, x0, HEAP, lsl #32
    // 0x28e81c: stur            x0, [fp, #-0x28]
    // 0x28e820: LoadField: r2 = r1->field_7
    //     0x28e820: ldur            w2, [x1, #7]
    // 0x28e824: DecompressPointer r2
    //     0x28e824: add             x2, x2, HEAP, lsl #32
    // 0x28e828: stur            x2, [fp, #-0x20]
    // 0x28e82c: r3 = 0
    //     0x28e82c: mov             x3, #0
    // 0x28e830: stur            x3, [fp, #-0x18]
    // 0x28e834: CheckStackOverflow
    //     0x28e834: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28e838: cmp             SP, x16
    //     0x28e83c: b.ls            #0x28e94c
    // 0x28e840: cmp             x3, #0xa
    // 0x28e844: b.ge            #0x28e93c
    // 0x28e848: r0 = LoadStaticField(0xcfc)
    //     0x28e848: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28e84c: ldr             x0, [x0, #0x19f8]
    // 0x28e850: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28e854: cmp             w0, w16
    // 0x28e858: b.ne            #0x28e868
    // 0x28e85c: r2 = _soLoud
    //     0x28e85c: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x28e860: ldr             x2, [x2, #0xf58]
    // 0x28e864: r0 = InitLateFinalStaticField()
    //     0x28e864: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28e868: stur            x0, [fp, #-0x30]
    // 0x28e86c: r0 = LoadStaticField(0xccc)
    //     0x28e86c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28e870: ldr             x0, [x0, #0x1998]
    // 0x28e874: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28e878: cmp             w0, w16
    // 0x28e87c: b.ne            #0x28e88c
    // 0x28e880: r2 = stows
    //     0x28e880: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x28e884: ldr             x2, [x2, #0x310]
    // 0x28e888: r0 = InitLateFinalStaticField()
    //     0x28e888: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28e88c: LoadField: r1 = r0->field_1f
    //     0x28e88c: ldur            w1, [x0, #0x1f]
    // 0x28e890: DecompressPointer r1
    //     0x28e890: add             x1, x1, HEAP, lsl #32
    // 0x28e894: LoadField: r0 = r1->field_43
    //     0x28e894: ldur            w0, [x1, #0x43]
    // 0x28e898: DecompressPointer r0
    //     0x28e898: add             x0, x0, HEAP, lsl #32
    // 0x28e89c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28e8a0: cmp             w0, w16
    // 0x28e8a4: b.ne            #0x28e8b4
    // 0x28e8a8: r2 = _value
    //     0x28e8a8: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x28e8ac: ldr             x2, [x2, #0x4b0]
    // 0x28e8b0: r0 = InitLateInstanceField()
    //     0x28e8b0: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x28e8b4: ldur            x1, [fp, #-0x10]
    // 0x28e8b8: stur            x0, [fp, #-0x38]
    // 0x28e8bc: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x28e8bc: ldur            w0, [x1, #0x17]
    // 0x28e8c0: DecompressPointer r0
    //     0x28e8c0: add             x0, x0, HEAP, lsl #32
    // 0x28e8c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28e8c8: cmp             w0, w16
    // 0x28e8cc: b.ne            #0x28e8dc
    // 0x28e8d0: r2 = _loopingStartAt
    //     0x28e8d0: add             x2, PP, #0x14, lsl #12  ; [pp+0x14608] Field <_AudioPool@768034792._loopingStartAt@768034792>: late final (offset: 0x18)
    //     0x28e8d4: ldr             x2, [x2, #0x608]
    // 0x28e8d8: r0 = InitLateFinalInstanceField()
    //     0x28e8d8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x28e8dc: mov             x1, x0
    // 0x28e8e0: ldur            x0, [fp, #-0x38]
    // 0x28e8e4: LoadField: d0 = r0->field_7
    //     0x28e8e4: ldur            d0, [x0, #7]
    // 0x28e8e8: str             x1, [SP]
    // 0x28e8ec: ldur            x1, [fp, #-0x30]
    // 0x28e8f0: ldur            x2, [fp, #-0x20]
    // 0x28e8f4: r4 = const [0, 0x4, 0x1, 0x3, loopingStartAt, 0x3, null]
    //     0x28e8f4: add             x4, PP, #0x14, lsl #12  ; [pp+0x14610] List(7) [0, 0x4, 0x1, 0x3, "loopingStartAt", 0x3, Null]
    //     0x28e8f8: ldr             x4, [x4, #0x610]
    // 0x28e8fc: r0 = play()
    //     0x28e8fc: bl              #0x28d8f4  ; [package:flutter_soloud/src/soloud.dart] SoLoud::play
    // 0x28e900: mov             x2, x0
    // 0x28e904: r0 = BoxInt64Instr(r2)
    //     0x28e904: sbfiz           x0, x2, #1, #0x1f
    //     0x28e908: cmp             x2, x0, asr #1
    //     0x28e90c: b.eq            #0x28e918
    //     0x28e910: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x28e914: stur            x2, [x0, #7]
    // 0x28e918: ldur            x1, [fp, #-0x28]
    // 0x28e91c: mov             x2, x0
    // 0x28e920: r0 = _add()
    //     0x28e920: bl              #0x2392b0  ; [dart:collection] ListQueue::_add
    // 0x28e924: ldur            x1, [fp, #-0x18]
    // 0x28e928: add             x3, x1, #1
    // 0x28e92c: ldur            x1, [fp, #-0x10]
    // 0x28e930: ldur            x0, [fp, #-0x28]
    // 0x28e934: ldur            x2, [fp, #-0x20]
    // 0x28e938: b               #0x28e830
    // 0x28e93c: r0 = Null
    //     0x28e93c: mov             x0, NULL
    // 0x28e940: r0 = ReturnAsyncNotFuture()
    //     0x28e940: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x28e944: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28e944: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28e948: b               #0x28e808
    // 0x28e94c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28e94c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28e950: b               #0x28e840
  }
  Duration _loopingStartAt(_AudioPool) {
    // ** addr: 0x28e954, size: 0x40
    // 0x28e954: EnterFrame
    //     0x28e954: stp             fp, lr, [SP, #-0x10]!
    //     0x28e958: mov             fp, SP
    // 0x28e95c: CheckStackOverflow
    //     0x28e95c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28e960: cmp             SP, x16
    //     0x28e964: b.ls            #0x28e98c
    // 0x28e968: ldr             x0, [fp, #0x10]
    // 0x28e96c: LoadField: r1 = r0->field_b
    //     0x28e96c: ldur            w1, [x0, #0xb]
    // 0x28e970: DecompressPointer r1
    //     0x28e970: add             x1, x1, HEAP, lsl #32
    // 0x28e974: r2 = 0.900000
    //     0x28e974: add             x2, PP, #0x13, lsl #12  ; [pp+0x13030] 0.9
    //     0x28e978: ldr             x2, [x2, #0x30]
    // 0x28e97c: r0 = *()
    //     0x28e97c: bl              #0x236db8  ; [dart:core] Duration::*
    // 0x28e980: LeaveFrame
    //     0x28e980: mov             SP, fp
    //     0x28e984: ldp             fp, lr, [SP], #0x10
    // 0x28e988: ret
    //     0x28e988: ret             
    // 0x28e98c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28e98c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28e990: b               #0x28e968
  }
  _ _AudioPool(/* No info */) {
    // ** addr: 0x28e994, size: 0xf4
    // 0x28e994: EnterFrame
    //     0x28e994: stp             fp, lr, [SP, #-0x10]!
    //     0x28e998: mov             fp, SP
    // 0x28e99c: AllocStack(0x18)
    //     0x28e99c: sub             SP, SP, #0x18
    // 0x28e9a0: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28e9a4: mov             x3, x1
    // 0x28e9a8: stur            x1, [fp, #-8]
    // 0x28e9ac: stur            x2, [fp, #-0x10]
    // 0x28e9b0: CheckStackOverflow
    //     0x28e9b0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28e9b4: cmp             SP, x16
    //     0x28e9b8: b.ls            #0x28ea80
    // 0x28e9bc: ArrayStore: r3[0] = r0  ; List_4
    //     0x28e9bc: stur            w0, [x3, #0x17]
    // 0x28e9c0: r1 = <int>
    //     0x28e9c0: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x28e9c4: r0 = ListQueue()
    //     0x28e9c4: bl              #0x241fa8  ; AllocateListQueueStub -> ListQueue<X0> (size=0x28)
    // 0x28e9c8: mov             x1, x0
    // 0x28e9cc: stur            x0, [fp, #-0x18]
    // 0x28e9d0: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x28e9d0: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x28e9d4: r0 = ListQueue()
    //     0x28e9d4: bl              #0x241e38  ; [dart:collection] ListQueue::ListQueue
    // 0x28e9d8: ldur            x0, [fp, #-0x18]
    // 0x28e9dc: ldur            x1, [fp, #-8]
    // 0x28e9e0: StoreField: r1->field_1b = r0
    //     0x28e9e0: stur            w0, [x1, #0x1b]
    //     0x28e9e4: ldurb           w16, [x1, #-1]
    //     0x28e9e8: ldurb           w17, [x0, #-1]
    //     0x28e9ec: and             x16, x17, x16, lsr #2
    //     0x28e9f0: tst             x16, HEAP, lsr #32
    //     0x28e9f4: b.eq            #0x28e9fc
    //     0x28e9f8: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x28e9fc: ldur            x0, [fp, #-0x10]
    // 0x28ea00: StoreField: r1->field_7 = r0
    //     0x28ea00: stur            w0, [x1, #7]
    //     0x28ea04: ldurb           w16, [x1, #-1]
    //     0x28ea08: ldurb           w17, [x0, #-1]
    //     0x28ea0c: and             x16, x17, x16, lsr #2
    //     0x28ea10: tst             x16, HEAP, lsr #32
    //     0x28ea14: b.eq            #0x28ea1c
    //     0x28ea18: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x28ea1c: r0 = 10
    //     0x28ea1c: mov             x0, #0xa
    // 0x28ea20: StoreField: r1->field_f = r0
    //     0x28ea20: stur            x0, [x1, #0xf]
    // 0x28ea24: r0 = LoadStaticField(0xcfc)
    //     0x28ea24: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28ea28: ldr             x0, [x0, #0x19f8]
    // 0x28ea2c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ea30: cmp             w0, w16
    // 0x28ea34: b.ne            #0x28ea44
    // 0x28ea38: r2 = _soLoud
    //     0x28ea38: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x28ea3c: ldr             x2, [x2, #0xf58]
    // 0x28ea40: r0 = InitLateFinalStaticField()
    //     0x28ea40: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28ea44: mov             x1, x0
    // 0x28ea48: ldur            x2, [fp, #-0x10]
    // 0x28ea4c: r0 = getLength()
    //     0x28ea4c: bl              #0x28ea88  ; [package:flutter_soloud/src/soloud.dart] SoLoud::getLength
    // 0x28ea50: ldur            x1, [fp, #-8]
    // 0x28ea54: StoreField: r1->field_b = r0
    //     0x28ea54: stur            w0, [x1, #0xb]
    //     0x28ea58: ldurb           w16, [x1, #-1]
    //     0x28ea5c: ldurb           w17, [x0, #-1]
    //     0x28ea60: and             x16, x17, x16, lsr #2
    //     0x28ea64: tst             x16, HEAP, lsr #32
    //     0x28ea68: b.eq            #0x28ea70
    //     0x28ea6c: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x28ea70: r0 = Null
    //     0x28ea70: mov             x0, NULL
    // 0x28ea74: LeaveFrame
    //     0x28ea74: mov             SP, fp
    //     0x28ea78: ldp             fp, lr, [SP], #0x10
    // 0x28ea7c: ret
    //     0x28ea7c: ret             
    // 0x28ea80: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28ea80: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28ea84: b               #0x28e9bc
  }
  _ play(/* No info */) async {
    // ** addr: 0x5480f4, size: 0x180
    // 0x5480f4: EnterFrame
    //     0x5480f4: stp             fp, lr, [SP, #-0x10]!
    //     0x5480f8: mov             fp, SP
    // 0x5480fc: AllocStack(0x38)
    //     0x5480fc: sub             SP, SP, #0x38
    // 0x548100: SetupParameters(_AudioPool this /* r1 => r1, fp-0x10 */)
    //     0x548100: stur            NULL, [fp, #-8]
    //     0x548104: stur            x1, [fp, #-0x10]
    // 0x548108: CheckStackOverflow
    //     0x548108: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x54810c: cmp             SP, x16
    //     0x548110: b.ls            #0x54826c
    // 0x548114: r1 = 2
    //     0x548114: mov             x1, #2
    // 0x548118: r0 = AllocateContext()
    //     0x548118: bl              #0x5834e8  ; AllocateContextStub
    // 0x54811c: mov             x2, x0
    // 0x548120: ldur            x1, [fp, #-0x10]
    // 0x548124: stur            x2, [fp, #-0x18]
    // 0x548128: StoreField: r2->field_f = r1
    //     0x548128: stur            w1, [x2, #0xf]
    // 0x54812c: InitAsync() -> Future<void?>
    //     0x54812c: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x548130: bl              #0x2556b4  ; InitAsyncStub
    // 0x548134: ldur            x0, [fp, #-0x10]
    // 0x548138: LoadField: r1 = r0->field_1b
    //     0x548138: ldur            w1, [x0, #0x1b]
    // 0x54813c: DecompressPointer r1
    //     0x54813c: add             x1, x1, HEAP, lsl #32
    // 0x548140: LoadField: r2 = r1->field_f
    //     0x548140: ldur            x2, [x1, #0xf]
    // 0x548144: ArrayLoad: r3 = r1[0]  ; List_8
    //     0x548144: ldur            x3, [x1, #0x17]
    // 0x548148: cmp             x2, x3
    // 0x54814c: b.eq            #0x548264
    // 0x548150: ldur            x2, [fp, #-0x18]
    // 0x548154: r0 = removeFirst()
    //     0x548154: bl              #0x2419b8  ; [dart:collection] ListQueue::removeFirst
    // 0x548158: mov             x1, x0
    // 0x54815c: ldur            x2, [fp, #-0x18]
    // 0x548160: stur            x1, [fp, #-0x20]
    // 0x548164: StoreField: r2->field_13 = r0
    //     0x548164: stur            w0, [x2, #0x13]
    //     0x548168: tbz             w0, #0, #0x548184
    //     0x54816c: ldurb           w16, [x2, #-1]
    //     0x548170: ldurb           w17, [x0, #-1]
    //     0x548174: and             x16, x17, x16, lsr #2
    //     0x548178: tst             x16, HEAP, lsr #32
    //     0x54817c: b.eq            #0x548184
    //     0x548180: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x548184: r0 = LoadStaticField(0xcfc)
    //     0x548184: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x548188: ldr             x0, [x0, #0x19f8]
    // 0x54818c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x548190: cmp             w0, w16
    // 0x548194: b.ne            #0x5481a4
    // 0x548198: r2 = _soLoud
    //     0x548198: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x54819c: ldr             x2, [x2, #0xf58]
    // 0x5481a0: r0 = InitLateFinalStaticField()
    //     0x5481a0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x5481a4: mov             x1, x0
    // 0x5481a8: ldur            x2, [fp, #-0x20]
    // 0x5481ac: stur            x0, [fp, #-0x28]
    // 0x5481b0: r0 = seek()
    //     0x5481b0: bl              #0x5484a8  ; [package:flutter_soloud/src/soloud.dart] SoLoud::seek
    // 0x5481b4: r0 = LoadStaticField(0xccc)
    //     0x5481b4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x5481b8: ldr             x0, [x0, #0x1998]
    // 0x5481bc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x5481c0: cmp             w0, w16
    // 0x5481c4: b.ne            #0x5481d4
    // 0x5481c8: r2 = stows
    //     0x5481c8: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x5481cc: ldr             x2, [x2, #0x310]
    // 0x5481d0: r0 = InitLateFinalStaticField()
    //     0x5481d0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x5481d4: LoadField: r1 = r0->field_1f
    //     0x5481d4: ldur            w1, [x0, #0x1f]
    // 0x5481d8: DecompressPointer r1
    //     0x5481d8: add             x1, x1, HEAP, lsl #32
    // 0x5481dc: LoadField: r0 = r1->field_43
    //     0x5481dc: ldur            w0, [x1, #0x43]
    // 0x5481e0: DecompressPointer r0
    //     0x5481e0: add             x0, x0, HEAP, lsl #32
    // 0x5481e4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x5481e8: cmp             w0, w16
    // 0x5481ec: b.ne            #0x5481fc
    // 0x5481f0: r2 = _value
    //     0x5481f0: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x5481f4: ldr             x2, [x2, #0x4b0]
    // 0x5481f8: r0 = InitLateInstanceField()
    //     0x5481f8: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x5481fc: LoadField: d0 = r0->field_7
    //     0x5481fc: ldur            d0, [x0, #7]
    // 0x548200: ldur            x1, [fp, #-0x28]
    // 0x548204: ldur            x2, [fp, #-0x20]
    // 0x548208: r0 = setVolume()
    //     0x548208: bl              #0x548274  ; [package:flutter_soloud/src/soloud.dart] SoLoud::setVolume
    // 0x54820c: ldur            x1, [fp, #-0x28]
    // 0x548210: ldur            x2, [fp, #-0x20]
    // 0x548214: r0 = setPause()
    //     0x548214: bl              #0x28cfd4  ; [package:flutter_soloud/src/soloud.dart] SoLoud::setPause
    // 0x548218: ldur            x0, [fp, #-0x10]
    // 0x54821c: LoadField: r4 = r0->field_b
    //     0x54821c: ldur            w4, [x0, #0xb]
    // 0x548220: DecompressPointer r4
    //     0x548220: add             x4, x4, HEAP, lsl #32
    // 0x548224: ldur            x1, [fp, #-0x28]
    // 0x548228: ldur            x2, [fp, #-0x20]
    // 0x54822c: mov             x3, x4
    // 0x548230: stur            x4, [fp, #-0x30]
    // 0x548234: r0 = schedulePause()
    //     0x548234: bl              #0x283a98  ; [package:flutter_soloud/src/soloud.dart] SoLoud::schedulePause
    // 0x548238: ldur            x2, [fp, #-0x18]
    // 0x54823c: r1 = Function '<anonymous closure>':.
    //     0x54823c: add             x1, PP, #0x1f, lsl #12  ; [pp+0x1f730] AnonymousClosure: (0x5487fc), in [package:ricochlime/utils/ricochlime_audio.dart] _AudioPool::play (0x5480f4)
    //     0x548240: ldr             x1, [x1, #0x730]
    // 0x548244: r0 = AllocateClosure()
    //     0x548244: bl              #0x5838bc  ; AllocateClosureStub
    // 0x548248: str             x0, [SP]
    // 0x54824c: ldur            x2, [fp, #-0x30]
    // 0x548250: r1 = <Null?>
    //     0x548250: ldr             x1, [PP, #0x1a10]  ; [pp+0x1a10] TypeArguments: <Null?>
    // 0x548254: r4 = const [0, 0x3, 0x1, 0x3, null]
    //     0x548254: ldr             x4, [PP, #0x350]  ; [pp+0x350] List(5) [0, 0x3, 0x1, 0x3, Null]
    // 0x548258: r0 = Future.delayed()
    //     0x548258: bl              #0x282d8c  ; [dart:async] Future::Future.delayed
    // 0x54825c: r0 = Null
    //     0x54825c: mov             x0, NULL
    // 0x548260: r0 = ReturnAsyncNotFuture()
    //     0x548260: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x548264: r0 = Null
    //     0x548264: mov             x0, NULL
    // 0x548268: r0 = ReturnAsyncNotFuture()
    //     0x548268: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x54826c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x54826c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x548270: b               #0x548114
  }
  [closure] Null <anonymous closure>(dynamic) {
    // ** addr: 0x5487fc, size: 0x5c
    // 0x5487fc: EnterFrame
    //     0x5487fc: stp             fp, lr, [SP, #-0x10]!
    //     0x548800: mov             fp, SP
    // 0x548804: AllocStack(0x10)
    //     0x548804: sub             SP, SP, #0x10
    // 0x548808: SetupParameters([dynamic _ /* r0 */])
    //     0x548808: ldr             x0, [fp, #0x10]
    //     0x54880c: ldur            w1, [x0, #0x17]
    //     0x548810: add             x1, x1, HEAP, lsl #32
    // 0x548814: CheckStackOverflow
    //     0x548814: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x548818: cmp             SP, x16
    //     0x54881c: b.ls            #0x548850
    // 0x548820: LoadField: r0 = r1->field_f
    //     0x548820: ldur            w0, [x1, #0xf]
    // 0x548824: DecompressPointer r0
    //     0x548824: add             x0, x0, HEAP, lsl #32
    // 0x548828: LoadField: r2 = r0->field_1b
    //     0x548828: ldur            w2, [x0, #0x1b]
    // 0x54882c: DecompressPointer r2
    //     0x54882c: add             x2, x2, HEAP, lsl #32
    // 0x548830: LoadField: r0 = r1->field_13
    //     0x548830: ldur            w0, [x1, #0x13]
    // 0x548834: DecompressPointer r0
    //     0x548834: add             x0, x0, HEAP, lsl #32
    // 0x548838: stp             x0, x2, [SP]
    // 0x54883c: r0 = add()
    //     0x54883c: bl              #0x239244  ; [dart:collection] ListQueue::add
    // 0x548840: r0 = Null
    //     0x548840: mov             x0, NULL
    // 0x548844: LeaveFrame
    //     0x548844: mov             SP, fp
    //     0x548848: ldp             fp, lr, [SP], #0x10
    // 0x54884c: ret
    //     0x54884c: ret             
    // 0x548850: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x548850: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x548854: b               #0x548820
  }
}

// class id: 226, size: 0x14, field offset: 0x8
class RicochlimeAudio extends Object {

  static late final Future<void> _soLoudInitFuture; // offset: 0xcec
  static late FutureOr<AudioSource> _hitSfxAudioSource; // offset: 0xcf0
  static late FutureOr<AudioSource> _bgmAudioSource; // offset: 0xcf4

  _ pauseBgm(/* No info */) {
    // ** addr: 0x283940, size: 0x158
    // 0x283940: EnterFrame
    //     0x283940: stp             fp, lr, [SP, #-0x10]!
    //     0x283944: mov             fp, SP
    // 0x283948: AllocStack(0x10)
    //     0x283948: sub             SP, SP, #0x10
    // 0x28394c: SetupParameters(RicochlimeAudio this /* r1 => r1, fp-0x8 */)
    //     0x28394c: stur            x1, [fp, #-8]
    // 0x283950: CheckStackOverflow
    //     0x283950: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x283954: cmp             SP, x16
    //     0x283958: b.ls            #0x283a88
    // 0x28395c: r0 = LoadStaticField(0xccc)
    //     0x28395c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x283960: ldr             x0, [x0, #0x1998]
    // 0x283964: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x283968: cmp             w0, w16
    // 0x28396c: b.ne            #0x28397c
    // 0x283970: r2 = stows
    //     0x283970: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x283974: ldr             x2, [x2, #0x310]
    // 0x283978: r0 = InitLateFinalStaticField()
    //     0x283978: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28397c: LoadField: r1 = r0->field_1b
    //     0x28397c: ldur            w1, [x0, #0x1b]
    // 0x283980: DecompressPointer r1
    //     0x283980: add             x1, x1, HEAP, lsl #32
    // 0x283984: LoadField: r0 = r1->field_43
    //     0x283984: ldur            w0, [x1, #0x43]
    // 0x283988: DecompressPointer r0
    //     0x283988: add             x0, x0, HEAP, lsl #32
    // 0x28398c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x283990: cmp             w0, w16
    // 0x283994: b.ne            #0x2839a4
    // 0x283998: r2 = _value
    //     0x283998: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x28399c: ldr             x2, [x2, #0x4b0]
    // 0x2839a0: r0 = InitLateInstanceField()
    //     0x2839a0: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x2839a4: LoadField: d0 = r0->field_7
    //     0x2839a4: ldur            d0, [x0, #7]
    // 0x2839a8: d1 = 0.010000
    //     0x2839a8: add             x17, PP, #0xb, lsl #12  ; [pp+0xbb18] IMM: double(0.01) from 0x3f847ae147ae147b
    //     0x2839ac: ldr             d1, [x17, #0xb18]
    // 0x2839b0: fcmp            d1, d0
    // 0x2839b4: b.le            #0x2839c8
    // 0x2839b8: r0 = Null
    //     0x2839b8: mov             x0, NULL
    // 0x2839bc: LeaveFrame
    //     0x2839bc: mov             SP, fp
    //     0x2839c0: ldp             fp, lr, [SP], #0x10
    // 0x2839c4: ret
    //     0x2839c4: ret             
    // 0x2839c8: ldur            x0, [fp, #-8]
    // 0x2839cc: LoadField: r1 = r0->field_b
    //     0x2839cc: ldur            w1, [x0, #0xb]
    // 0x2839d0: DecompressPointer r1
    //     0x2839d0: add             x1, x1, HEAP, lsl #32
    // 0x2839d4: cmp             w1, NULL
    // 0x2839d8: b.ne            #0x2839ec
    // 0x2839dc: r0 = Null
    //     0x2839dc: mov             x0, NULL
    // 0x2839e0: LeaveFrame
    //     0x2839e0: mov             SP, fp
    //     0x2839e4: ldp             fp, lr, [SP], #0x10
    // 0x2839e8: ret
    //     0x2839e8: ret             
    // 0x2839ec: LoadField: r1 = r0->field_7
    //     0x2839ec: ldur            w1, [x0, #7]
    // 0x2839f0: DecompressPointer r1
    //     0x2839f0: add             x1, x1, HEAP, lsl #32
    // 0x2839f4: r2 = "Fading out bg music"
    //     0x2839f4: add             x2, PP, #0x14, lsl #12  ; [pp+0x14640] "Fading out bg music"
    //     0x2839f8: ldr             x2, [x2, #0x640]
    // 0x2839fc: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x2839fc: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x283a00: r0 = info()
    //     0x283a00: bl              #0x287f24  ; [package:logging/src/logger.dart] Logger::info
    // 0x283a04: r0 = LoadStaticField(0xcfc)
    //     0x283a04: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x283a08: ldr             x0, [x0, #0x19f8]
    // 0x283a0c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x283a10: cmp             w0, w16
    // 0x283a14: b.ne            #0x283a24
    // 0x283a18: r2 = _soLoud
    //     0x283a18: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x283a1c: ldr             x2, [x2, #0xf58]
    // 0x283a20: r0 = InitLateFinalStaticField()
    //     0x283a20: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x283a24: mov             x3, x0
    // 0x283a28: ldur            x0, [fp, #-8]
    // 0x283a2c: stur            x3, [fp, #-0x10]
    // 0x283a30: LoadField: r1 = r0->field_b
    //     0x283a30: ldur            w1, [x0, #0xb]
    // 0x283a34: DecompressPointer r1
    //     0x283a34: add             x1, x1, HEAP, lsl #32
    // 0x283a38: cmp             w1, NULL
    // 0x283a3c: b.eq            #0x283a90
    // 0x283a40: r2 = LoadInt32Instr(r1)
    //     0x283a40: sbfx            x2, x1, #1, #0x1f
    //     0x283a44: tbz             w1, #0, #0x283a4c
    //     0x283a48: ldur            x2, [x1, #7]
    // 0x283a4c: mov             x1, x3
    // 0x283a50: d0 = 0.000000
    //     0x283a50: eor             v0.16b, v0.16b, v0.16b
    // 0x283a54: r0 = fadeVolume()
    //     0x283a54: bl              #0x287a48  ; [package:flutter_soloud/src/soloud.dart] SoLoud::fadeVolume
    // 0x283a58: ldur            x0, [fp, #-8]
    // 0x283a5c: LoadField: r2 = r0->field_b
    //     0x283a5c: ldur            w2, [x0, #0xb]
    // 0x283a60: DecompressPointer r2
    //     0x283a60: add             x2, x2, HEAP, lsl #32
    // 0x283a64: cmp             w2, NULL
    // 0x283a68: b.eq            #0x283a94
    // 0x283a6c: ldur            x1, [fp, #-0x10]
    // 0x283a70: r3 = Instance_Duration
    //     0x283a70: ldr             x3, [PP, #0x2700]  ; [pp+0x2700] Obj!Duration@5dcca1
    // 0x283a74: r0 = schedulePause()
    //     0x283a74: bl              #0x283a98  ; [package:flutter_soloud/src/soloud.dart] SoLoud::schedulePause
    // 0x283a78: r0 = Null
    //     0x283a78: mov             x0, NULL
    // 0x283a7c: LeaveFrame
    //     0x283a7c: mov             SP, fp
    //     0x283a80: ldp             fp, lr, [SP], #0x10
    // 0x283a84: ret
    //     0x283a84: ret             
    // 0x283a88: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x283a88: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x283a8c: b               #0x28395c
    // 0x283a90: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x283a90: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x283a94: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x283a94: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  _ playBgm(/* No info */) async {
    // ** addr: 0x28ce64, size: 0x170
    // 0x28ce64: EnterFrame
    //     0x28ce64: stp             fp, lr, [SP, #-0x10]!
    //     0x28ce68: mov             fp, SP
    // 0x28ce6c: AllocStack(0x20)
    //     0x28ce6c: sub             SP, SP, #0x20
    // 0x28ce70: SetupParameters(RicochlimeAudio this /* r1 => r1, fp-0x10 */)
    //     0x28ce70: stur            NULL, [fp, #-8]
    //     0x28ce74: stur            x1, [fp, #-0x10]
    // 0x28ce78: CheckStackOverflow
    //     0x28ce78: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28ce7c: cmp             SP, x16
    //     0x28ce80: b.ls            #0x28cfc4
    // 0x28ce84: InitAsync() -> Future<void?>
    //     0x28ce84: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x28ce88: bl              #0x2556b4  ; InitAsyncStub
    // 0x28ce8c: r0 = LoadStaticField(0xccc)
    //     0x28ce8c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28ce90: ldr             x0, [x0, #0x1998]
    // 0x28ce94: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ce98: cmp             w0, w16
    // 0x28ce9c: b.ne            #0x28ceac
    // 0x28cea0: r2 = stows
    //     0x28cea0: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x28cea4: ldr             x2, [x2, #0x310]
    // 0x28cea8: r0 = InitLateFinalStaticField()
    //     0x28cea8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28ceac: LoadField: r2 = r0->field_1b
    //     0x28ceac: ldur            w2, [x0, #0x1b]
    // 0x28ceb0: DecompressPointer r2
    //     0x28ceb0: add             x2, x2, HEAP, lsl #32
    // 0x28ceb4: mov             x1, x2
    // 0x28ceb8: stur            x2, [fp, #-0x18]
    // 0x28cebc: LoadField: r0 = r1->field_43
    //     0x28cebc: ldur            w0, [x1, #0x43]
    // 0x28cec0: DecompressPointer r0
    //     0x28cec0: add             x0, x0, HEAP, lsl #32
    // 0x28cec4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28cec8: cmp             w0, w16
    // 0x28cecc: b.ne            #0x28cedc
    // 0x28ced0: r2 = _value
    //     0x28ced0: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x28ced4: ldr             x2, [x2, #0x4b0]
    // 0x28ced8: r0 = InitLateInstanceField()
    //     0x28ced8: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x28cedc: LoadField: d0 = r0->field_7
    //     0x28cedc: ldur            d0, [x0, #7]
    // 0x28cee0: d1 = 0.010000
    //     0x28cee0: add             x17, PP, #0xb, lsl #12  ; [pp+0xbb18] IMM: double(0.01) from 0x3f847ae147ae147b
    //     0x28cee4: ldr             d1, [x17, #0xb18]
    // 0x28cee8: fcmp            d1, d0
    // 0x28ceec: b.le            #0x28cef8
    // 0x28cef0: r0 = Null
    //     0x28cef0: mov             x0, NULL
    // 0x28cef4: r0 = ReturnAsyncNotFuture()
    //     0x28cef4: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x28cef8: ldur            x0, [fp, #-0x10]
    // 0x28cefc: LoadField: r1 = r0->field_b
    //     0x28cefc: ldur            w1, [x0, #0xb]
    // 0x28cf00: DecompressPointer r1
    //     0x28cf00: add             x1, x1, HEAP, lsl #32
    // 0x28cf04: cmp             w1, NULL
    // 0x28cf08: b.ne            #0x28cf20
    // 0x28cf0c: mov             x1, x0
    // 0x28cf10: r0 = init()
    //     0x28cf10: bl              #0x28d458  ; [package:ricochlime/utils/ricochlime_audio.dart] RicochlimeAudio::init
    // 0x28cf14: mov             x1, x0
    // 0x28cf18: stur            x1, [fp, #-0x20]
    // 0x28cf1c: r0 = Await()
    //     0x28cf1c: bl              #0x255470  ; AwaitStub
    // 0x28cf20: ldur            x0, [fp, #-0x10]
    // 0x28cf24: ldur            x3, [fp, #-0x18]
    // 0x28cf28: LoadField: r1 = r0->field_7
    //     0x28cf28: ldur            w1, [x0, #7]
    // 0x28cf2c: DecompressPointer r1
    //     0x28cf2c: add             x1, x1, HEAP, lsl #32
    // 0x28cf30: r2 = "Fading in bg music"
    //     0x28cf30: add             x2, PP, #0x14, lsl #12  ; [pp+0x146b8] "Fading in bg music"
    //     0x28cf34: ldr             x2, [x2, #0x6b8]
    // 0x28cf38: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x28cf38: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x28cf3c: r0 = info()
    //     0x28cf3c: bl              #0x287f24  ; [package:logging/src/logger.dart] Logger::info
    // 0x28cf40: r0 = LoadStaticField(0xcfc)
    //     0x28cf40: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28cf44: ldr             x0, [x0, #0x19f8]
    // 0x28cf48: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28cf4c: cmp             w0, w16
    // 0x28cf50: b.ne            #0x28cf60
    // 0x28cf54: r2 = _soLoud
    //     0x28cf54: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x28cf58: ldr             x2, [x2, #0xf58]
    // 0x28cf5c: r0 = InitLateFinalStaticField()
    //     0x28cf5c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28cf60: mov             x3, x0
    // 0x28cf64: ldur            x0, [fp, #-0x10]
    // 0x28cf68: stur            x3, [fp, #-0x20]
    // 0x28cf6c: LoadField: r1 = r0->field_b
    //     0x28cf6c: ldur            w1, [x0, #0xb]
    // 0x28cf70: DecompressPointer r1
    //     0x28cf70: add             x1, x1, HEAP, lsl #32
    // 0x28cf74: cmp             w1, NULL
    // 0x28cf78: b.eq            #0x28cfcc
    // 0x28cf7c: ldur            x2, [fp, #-0x18]
    // 0x28cf80: LoadField: r4 = r2->field_43
    //     0x28cf80: ldur            w4, [x2, #0x43]
    // 0x28cf84: DecompressPointer r4
    //     0x28cf84: add             x4, x4, HEAP, lsl #32
    // 0x28cf88: r2 = LoadInt32Instr(r1)
    //     0x28cf88: sbfx            x2, x1, #1, #0x1f
    //     0x28cf8c: tbz             w1, #0, #0x28cf94
    //     0x28cf90: ldur            x2, [x1, #7]
    // 0x28cf94: LoadField: d0 = r4->field_7
    //     0x28cf94: ldur            d0, [x4, #7]
    // 0x28cf98: mov             x1, x3
    // 0x28cf9c: r0 = fadeVolume()
    //     0x28cf9c: bl              #0x287a48  ; [package:flutter_soloud/src/soloud.dart] SoLoud::fadeVolume
    // 0x28cfa0: ldur            x0, [fp, #-0x10]
    // 0x28cfa4: LoadField: r2 = r0->field_b
    //     0x28cfa4: ldur            w2, [x0, #0xb]
    // 0x28cfa8: DecompressPointer r2
    //     0x28cfa8: add             x2, x2, HEAP, lsl #32
    // 0x28cfac: cmp             w2, NULL
    // 0x28cfb0: b.eq            #0x28cfd0
    // 0x28cfb4: ldur            x1, [fp, #-0x20]
    // 0x28cfb8: r0 = setPause()
    //     0x28cfb8: bl              #0x28cfd4  ; [package:flutter_soloud/src/soloud.dart] SoLoud::setPause
    // 0x28cfbc: r0 = Null
    //     0x28cfbc: mov             x0, NULL
    // 0x28cfc0: r0 = ReturnAsyncNotFuture()
    //     0x28cfc0: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x28cfc4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28cfc4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28cfc8: b               #0x28ce84
    // 0x28cfcc: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x28cfcc: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x28cfd0: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x28cfd0: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  _ init(/* No info */) async {
    // ** addr: 0x28d458, size: 0x1f8
    // 0x28d458: EnterFrame
    //     0x28d458: stp             fp, lr, [SP, #-0x10]!
    //     0x28d45c: mov             fp, SP
    // 0x28d460: AllocStack(0x20)
    //     0x28d460: sub             SP, SP, #0x20
    // 0x28d464: SetupParameters(RicochlimeAudio this /* r1 => r1, fp-0x10 */)
    //     0x28d464: stur            NULL, [fp, #-8]
    //     0x28d468: stur            x1, [fp, #-0x10]
    // 0x28d46c: CheckStackOverflow
    //     0x28d46c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28d470: cmp             SP, x16
    //     0x28d474: b.ls            #0x28d644
    // 0x28d478: InitAsync() -> Future<void?>
    //     0x28d478: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x28d47c: bl              #0x2556b4  ; InitAsyncStub
    // 0x28d480: r0 = LoadStaticField(0xcec)
    //     0x28d480: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28d484: ldr             x0, [x0, #0x19d8]
    // 0x28d488: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28d48c: cmp             w0, w16
    // 0x28d490: b.ne            #0x28d4a0
    // 0x28d494: r2 = _soLoudInitFuture
    //     0x28d494: add             x2, PP, #0xf, lsl #12  ; [pp+0xff38] Field <RicochlimeAudio._soLoudInitFuture@768034792>: static late final (offset: 0xcec)
    //     0x28d498: ldr             x2, [x2, #0xf38]
    // 0x28d49c: r0 = InitLateFinalStaticField()
    //     0x28d49c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28d4a0: mov             x1, x0
    // 0x28d4a4: stur            x1, [fp, #-0x18]
    // 0x28d4a8: r0 = Await()
    //     0x28d4a8: bl              #0x255470  ; AwaitStub
    // 0x28d4ac: r0 = _AudioPool()
    //     0x28d4ac: bl              #0x28edf8  ; Allocate_AudioPoolStub -> _AudioPool (size=0x20)
    // 0x28d4b0: stur            x0, [fp, #-0x18]
    // 0x28d4b4: r0 = LoadStaticField(0xcf0)
    //     0x28d4b4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28d4b8: ldr             x0, [x0, #0x19e0]
    // 0x28d4bc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28d4c0: cmp             w0, w16
    // 0x28d4c4: b.ne            #0x28d4d4
    // 0x28d4c8: r2 = _hitSfxAudioSource
    //     0x28d4c8: add             x2, PP, #0xf, lsl #12  ; [pp+0xff40] Field <RicochlimeAudio._hitSfxAudioSource@768034792>: static late (offset: 0xcf0)
    //     0x28d4cc: ldr             x2, [x2, #0xf40]
    // 0x28d4d0: r0 = InitLateStaticField()
    //     0x28d4d0: bl              #0x582704  ; InitLateStaticFieldStub
    // 0x28d4d4: mov             x2, x0
    // 0x28d4d8: r1 = <AudioSource>
    //     0x28d4d8: add             x1, PP, #0xf, lsl #12  ; [pp+0xff48] TypeArguments: <AudioSource>
    //     0x28d4dc: ldr             x1, [x1, #0xf48]
    // 0x28d4e0: stur            x2, [fp, #-0x20]
    // 0x28d4e4: r0 = AwaitWithTypeCheck()
    //     0x28d4e4: bl              #0x282454  ; AwaitWithTypeCheckStub
    // 0x28d4e8: ldur            x1, [fp, #-0x18]
    // 0x28d4ec: mov             x2, x0
    // 0x28d4f0: r0 = _AudioPool()
    //     0x28d4f0: bl              #0x28e994  ; [package:ricochlime/utils/ricochlime_audio.dart] _AudioPool::_AudioPool
    // 0x28d4f4: ldur            x0, [fp, #-0x18]
    // 0x28d4f8: ldur            x2, [fp, #-0x10]
    // 0x28d4fc: StoreField: r2->field_f = r0
    //     0x28d4fc: stur            w0, [x2, #0xf]
    //     0x28d500: ldurb           w16, [x2, #-1]
    //     0x28d504: ldurb           w17, [x0, #-1]
    //     0x28d508: and             x16, x17, x16, lsr #2
    //     0x28d50c: tst             x16, HEAP, lsr #32
    //     0x28d510: b.eq            #0x28d518
    //     0x28d514: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x28d518: ldur            x1, [fp, #-0x18]
    // 0x28d51c: r0 = init()
    //     0x28d51c: bl              #0x28e7e8  ; [package:ricochlime/utils/ricochlime_audio.dart] _AudioPool::init
    // 0x28d520: mov             x1, x0
    // 0x28d524: stur            x1, [fp, #-0x18]
    // 0x28d528: r0 = Await()
    //     0x28d528: bl              #0x255470  ; AwaitStub
    // 0x28d52c: ldur            x0, [fp, #-0x10]
    // 0x28d530: LoadField: r1 = r0->field_b
    //     0x28d530: ldur            w1, [x0, #0xb]
    // 0x28d534: DecompressPointer r1
    //     0x28d534: add             x1, x1, HEAP, lsl #32
    // 0x28d538: cmp             w1, NULL
    // 0x28d53c: b.ne            #0x28d5ec
    // 0x28d540: r0 = LoadStaticField(0xcfc)
    //     0x28d540: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28d544: ldr             x0, [x0, #0x19f8]
    // 0x28d548: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28d54c: cmp             w0, w16
    // 0x28d550: b.ne            #0x28d560
    // 0x28d554: r2 = _soLoud
    //     0x28d554: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x28d558: ldr             x2, [x2, #0xf58]
    // 0x28d55c: r0 = InitLateFinalStaticField()
    //     0x28d55c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28d560: stur            x0, [fp, #-0x18]
    // 0x28d564: r0 = LoadStaticField(0xcf4)
    //     0x28d564: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28d568: ldr             x0, [x0, #0x19e8]
    // 0x28d56c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28d570: cmp             w0, w16
    // 0x28d574: b.ne            #0x28d584
    // 0x28d578: r2 = _bgmAudioSource
    //     0x28d578: add             x2, PP, #0xf, lsl #12  ; [pp+0xff50] Field <RicochlimeAudio._bgmAudioSource@768034792>: static late (offset: 0xcf4)
    //     0x28d57c: ldr             x2, [x2, #0xf50]
    // 0x28d580: r0 = InitLateStaticField()
    //     0x28d580: bl              #0x582704  ; InitLateStaticFieldStub
    // 0x28d584: mov             x2, x0
    // 0x28d588: r1 = <AudioSource>
    //     0x28d588: add             x1, PP, #0xf, lsl #12  ; [pp+0xff48] TypeArguments: <AudioSource>
    //     0x28d58c: ldr             x1, [x1, #0xf48]
    // 0x28d590: stur            x2, [fp, #-0x20]
    // 0x28d594: r0 = AwaitWithTypeCheck()
    //     0x28d594: bl              #0x282454  ; AwaitWithTypeCheckStub
    // 0x28d598: ldur            x1, [fp, #-0x18]
    // 0x28d59c: mov             x2, x0
    // 0x28d5a0: d0 = 0.000000
    //     0x28d5a0: eor             v0.16b, v0.16b, v0.16b
    // 0x28d5a4: r4 = const [0, 0x3, 0, 0x3, null]
    //     0x28d5a4: ldr             x4, [PP, #0x310]  ; [pp+0x310] List(5) [0, 0x3, 0, 0x3, Null]
    // 0x28d5a8: r0 = play()
    //     0x28d5a8: bl              #0x28d8f4  ; [package:flutter_soloud/src/soloud.dart] SoLoud::play
    // 0x28d5ac: mov             x2, x0
    // 0x28d5b0: r0 = BoxInt64Instr(r2)
    //     0x28d5b0: sbfiz           x0, x2, #1, #0x1f
    //     0x28d5b4: cmp             x2, x0, asr #1
    //     0x28d5b8: b.eq            #0x28d5c4
    //     0x28d5bc: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x28d5c0: stur            x2, [x0, #7]
    // 0x28d5c4: ldur            x1, [fp, #-0x10]
    // 0x28d5c8: StoreField: r1->field_b = r0
    //     0x28d5c8: stur            w0, [x1, #0xb]
    //     0x28d5cc: tbz             w0, #0, #0x28d5e8
    //     0x28d5d0: ldurb           w16, [x1, #-1]
    //     0x28d5d4: ldurb           w17, [x0, #-1]
    //     0x28d5d8: and             x16, x17, x16, lsr #2
    //     0x28d5dc: tst             x16, HEAP, lsr #32
    //     0x28d5e0: b.eq            #0x28d5e8
    //     0x28d5e4: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x28d5e8: b               #0x28d5f0
    // 0x28d5ec: mov             x1, x0
    // 0x28d5f0: r0 = LoadStaticField(0xcfc)
    //     0x28d5f0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28d5f4: ldr             x0, [x0, #0x19f8]
    // 0x28d5f8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28d5fc: cmp             w0, w16
    // 0x28d600: b.ne            #0x28d610
    // 0x28d604: r2 = _soLoud
    //     0x28d604: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x28d608: ldr             x2, [x2, #0xf58]
    // 0x28d60c: r0 = InitLateFinalStaticField()
    //     0x28d60c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28d610: mov             x1, x0
    // 0x28d614: ldur            x0, [fp, #-0x10]
    // 0x28d618: LoadField: r2 = r0->field_b
    //     0x28d618: ldur            w2, [x0, #0xb]
    // 0x28d61c: DecompressPointer r2
    //     0x28d61c: add             x2, x2, HEAP, lsl #32
    // 0x28d620: cmp             w2, NULL
    // 0x28d624: b.eq            #0x28d64c
    // 0x28d628: r0 = LoadInt32Instr(r2)
    //     0x28d628: sbfx            x0, x2, #1, #0x1f
    //     0x28d62c: tbz             w2, #0, #0x28d634
    //     0x28d630: ldur            x0, [x2, #7]
    // 0x28d634: mov             x2, x0
    // 0x28d638: r0 = setProtectVoice()
    //     0x28d638: bl              #0x28d650  ; [package:flutter_soloud/src/soloud.dart] SoLoud::setProtectVoice
    // 0x28d63c: r0 = Null
    //     0x28d63c: mov             x0, NULL
    // 0x28d640: r0 = ReturnAsyncNotFuture()
    //     0x28d640: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x28d644: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28d644: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28d648: b               #0x28d478
    // 0x28d64c: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x28d64c: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  static FutureOr<AudioSource> _bgmAudioSource() {
    // ** addr: 0x28ee04, size: 0x58
    // 0x28ee04: EnterFrame
    //     0x28ee04: stp             fp, lr, [SP, #-0x10]!
    //     0x28ee08: mov             fp, SP
    // 0x28ee0c: CheckStackOverflow
    //     0x28ee0c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28ee10: cmp             SP, x16
    //     0x28ee14: b.ls            #0x28ee54
    // 0x28ee18: r0 = LoadStaticField(0xcfc)
    //     0x28ee18: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28ee1c: ldr             x0, [x0, #0x19f8]
    // 0x28ee20: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ee24: cmp             w0, w16
    // 0x28ee28: b.ne            #0x28ee38
    // 0x28ee2c: r2 = _soLoud
    //     0x28ee2c: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x28ee30: ldr             x2, [x2, #0xf58]
    // 0x28ee34: r0 = InitLateFinalStaticField()
    //     0x28ee34: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28ee38: mov             x1, x0
    // 0x28ee3c: r2 = "assets/audio/bgm/Ludum_Dare_32_Track_4.wav"
    //     0x28ee3c: add             x2, PP, #0xf, lsl #12  ; [pp+0xffd8] "assets/audio/bgm/Ludum_Dare_32_Track_4.wav"
    //     0x28ee40: ldr             x2, [x2, #0xfd8]
    // 0x28ee44: r0 = loadAsset()
    //     0x28ee44: bl              #0x28ee5c  ; [package:flutter_soloud/src/soloud.dart] SoLoud::loadAsset
    // 0x28ee48: LeaveFrame
    //     0x28ee48: mov             SP, fp
    //     0x28ee4c: ldp             fp, lr, [SP], #0x10
    // 0x28ee50: ret
    //     0x28ee50: ret             
    // 0x28ee54: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28ee54: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28ee58: b               #0x28ee18
  }
  static FutureOr<AudioSource> _hitSfxAudioSource() {
    // ** addr: 0x296d30, size: 0x58
    // 0x296d30: EnterFrame
    //     0x296d30: stp             fp, lr, [SP, #-0x10]!
    //     0x296d34: mov             fp, SP
    // 0x296d38: CheckStackOverflow
    //     0x296d38: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x296d3c: cmp             SP, x16
    //     0x296d40: b.ls            #0x296d80
    // 0x296d44: r0 = LoadStaticField(0xcfc)
    //     0x296d44: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x296d48: ldr             x0, [x0, #0x19f8]
    // 0x296d4c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x296d50: cmp             w0, w16
    // 0x296d54: b.ne            #0x296d64
    // 0x296d58: r2 = _soLoud
    //     0x296d58: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x296d5c: ldr             x2, [x2, #0xf58]
    // 0x296d60: r0 = InitLateFinalStaticField()
    //     0x296d60: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x296d64: mov             x1, x0
    // 0x296d68: r2 = "assets/audio/sfx/759825__noisyredfox__hitwood.wav"
    //     0x296d68: add             x2, PP, #0x10, lsl #12  ; [pp+0x10138] "assets/audio/sfx/759825__noisyredfox__hitwood.wav"
    //     0x296d6c: ldr             x2, [x2, #0x138]
    // 0x296d70: r0 = loadAsset()
    //     0x296d70: bl              #0x28ee5c  ; [package:flutter_soloud/src/soloud.dart] SoLoud::loadAsset
    // 0x296d74: LeaveFrame
    //     0x296d74: mov             SP, fp
    //     0x296d78: ldp             fp, lr, [SP], #0x10
    // 0x296d7c: ret
    //     0x296d7c: ret             
    // 0x296d80: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x296d80: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x296d84: b               #0x296d44
  }
  static Future<void> _soLoudInitFuture() {
    // ** addr: 0x296d88, size: 0x50
    // 0x296d88: EnterFrame
    //     0x296d88: stp             fp, lr, [SP, #-0x10]!
    //     0x296d8c: mov             fp, SP
    // 0x296d90: CheckStackOverflow
    //     0x296d90: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x296d94: cmp             SP, x16
    //     0x296d98: b.ls            #0x296dd0
    // 0x296d9c: r0 = LoadStaticField(0xcfc)
    //     0x296d9c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x296da0: ldr             x0, [x0, #0x19f8]
    // 0x296da4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x296da8: cmp             w0, w16
    // 0x296dac: b.ne            #0x296dbc
    // 0x296db0: r2 = _soLoud
    //     0x296db0: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x296db4: ldr             x2, [x2, #0xf58]
    // 0x296db8: r0 = InitLateFinalStaticField()
    //     0x296db8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x296dbc: mov             x1, x0
    // 0x296dc0: r0 = init()
    //     0x296dc0: bl              #0x296dd8  ; [package:flutter_soloud/src/soloud.dart] SoLoud::init
    // 0x296dc4: LeaveFrame
    //     0x296dc4: mov             SP, fp
    //     0x296dc8: ldp             fp, lr, [SP], #0x10
    // 0x296dcc: ret
    //     0x296dcc: ret             
    // 0x296dd0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x296dd0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x296dd4: b               #0x296d9c
  }
  static Future<void> load() async {
    // ** addr: 0x3c43c8, size: 0x108
    // 0x3c43c8: EnterFrame
    //     0x3c43c8: stp             fp, lr, [SP, #-0x10]!
    //     0x3c43cc: mov             fp, SP
    // 0x3c43d0: AllocStack(0x10)
    //     0x3c43d0: sub             SP, SP, #0x10
    // 0x3c43d4: SetupParameters()
    //     0x3c43d4: stur            NULL, [fp, #-8]
    // 0x3c43d8: CheckStackOverflow
    //     0x3c43d8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c43dc: cmp             SP, x16
    //     0x3c43e0: b.ls            #0x3c44c8
    // 0x3c43e4: InitAsync() -> Future<void?>
    //     0x3c43e4: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x3c43e8: bl              #0x2556b4  ; InitAsyncStub
    // 0x3c43ec: r0 = LoadStaticField(0xcec)
    //     0x3c43ec: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c43f0: ldr             x0, [x0, #0x19d8]
    // 0x3c43f4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c43f8: cmp             w0, w16
    // 0x3c43fc: b.ne            #0x3c440c
    // 0x3c4400: r2 = _soLoudInitFuture
    //     0x3c4400: add             x2, PP, #0xf, lsl #12  ; [pp+0xff38] Field <RicochlimeAudio._soLoudInitFuture@768034792>: static late final (offset: 0xcec)
    //     0x3c4404: ldr             x2, [x2, #0xf38]
    // 0x3c4408: r0 = InitLateFinalStaticField()
    //     0x3c4408: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c440c: mov             x1, x0
    // 0x3c4410: stur            x1, [fp, #-0x10]
    // 0x3c4414: r0 = Await()
    //     0x3c4414: bl              #0x255470  ; AwaitStub
    // 0x3c4418: r0 = LoadStaticField(0xcf0)
    //     0x3c4418: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c441c: ldr             x0, [x0, #0x19e0]
    // 0x3c4420: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c4424: cmp             w0, w16
    // 0x3c4428: b.ne            #0x3c4438
    // 0x3c442c: r2 = _hitSfxAudioSource
    //     0x3c442c: add             x2, PP, #0xf, lsl #12  ; [pp+0xff40] Field <RicochlimeAudio._hitSfxAudioSource@768034792>: static late (offset: 0xcf0)
    //     0x3c4430: ldr             x2, [x2, #0xf40]
    // 0x3c4434: r0 = InitLateStaticField()
    //     0x3c4434: bl              #0x582704  ; InitLateStaticFieldStub
    // 0x3c4438: mov             x2, x0
    // 0x3c443c: r1 = <AudioSource>
    //     0x3c443c: add             x1, PP, #0xf, lsl #12  ; [pp+0xff48] TypeArguments: <AudioSource>
    //     0x3c4440: ldr             x1, [x1, #0xf48]
    // 0x3c4444: stur            x2, [fp, #-0x10]
    // 0x3c4448: r0 = AwaitWithTypeCheck()
    //     0x3c4448: bl              #0x282454  ; AwaitWithTypeCheckStub
    // 0x3c444c: mov             x2, x0
    // 0x3c4450: StoreStaticField(0xcf0, r2)
    //     0x3c4450: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c4454: str             x2, [x0, #0x19e0]
    // 0x3c4458: r0 = LoadStaticField(0xcf4)
    //     0x3c4458: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c445c: ldr             x0, [x0, #0x19e8]
    // 0x3c4460: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c4464: cmp             w0, w16
    // 0x3c4468: b.ne            #0x3c4478
    // 0x3c446c: r2 = _bgmAudioSource
    //     0x3c446c: add             x2, PP, #0xf, lsl #12  ; [pp+0xff50] Field <RicochlimeAudio._bgmAudioSource@768034792>: static late (offset: 0xcf4)
    //     0x3c4470: ldr             x2, [x2, #0xf50]
    // 0x3c4474: r0 = InitLateStaticField()
    //     0x3c4474: bl              #0x582704  ; InitLateStaticFieldStub
    // 0x3c4478: mov             x2, x0
    // 0x3c447c: r1 = <AudioSource>
    //     0x3c447c: add             x1, PP, #0xf, lsl #12  ; [pp+0xff48] TypeArguments: <AudioSource>
    //     0x3c4480: ldr             x1, [x1, #0xf48]
    // 0x3c4484: stur            x2, [fp, #-0x10]
    // 0x3c4488: r0 = AwaitWithTypeCheck()
    //     0x3c4488: bl              #0x282454  ; AwaitWithTypeCheckStub
    // 0x3c448c: mov             x2, x0
    // 0x3c4490: StoreStaticField(0xcf4, r2)
    //     0x3c4490: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c4494: str             x2, [x0, #0x19e8]
    // 0x3c4498: r0 = LoadStaticField(0xcfc)
    //     0x3c4498: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c449c: ldr             x0, [x0, #0x19f8]
    // 0x3c44a0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c44a4: cmp             w0, w16
    // 0x3c44a8: b.ne            #0x3c44b8
    // 0x3c44ac: r2 = _soLoud
    //     0x3c44ac: add             x2, PP, #0xf, lsl #12  ; [pp+0xff58] Field <::._soLoud@768034792>: static late final (offset: 0xcfc)
    //     0x3c44b0: ldr             x2, [x2, #0xf58]
    // 0x3c44b4: r0 = InitLateFinalStaticField()
    //     0x3c44b4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c44b8: mov             x1, x0
    // 0x3c44bc: r0 = setMaxActiveVoiceCount()
    //     0x3c44bc: bl              #0x3c44d0  ; [package:flutter_soloud/src/soloud.dart] SoLoud::setMaxActiveVoiceCount
    // 0x3c44c0: r0 = Null
    //     0x3c44c0: mov             x0, NULL
    // 0x3c44c4: r0 = ReturnAsyncNotFuture()
    //     0x3c44c4: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x3c44c8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c44c8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c44cc: b               #0x3c43e4
  }
  _ playHitSfx(/* No info */) {
    // ** addr: 0x5480b0, size: 0x44
    // 0x5480b0: EnterFrame
    //     0x5480b0: stp             fp, lr, [SP, #-0x10]!
    //     0x5480b4: mov             fp, SP
    // 0x5480b8: CheckStackOverflow
    //     0x5480b8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x5480bc: cmp             SP, x16
    //     0x5480c0: b.ls            #0x5480ec
    // 0x5480c4: LoadField: r0 = r1->field_f
    //     0x5480c4: ldur            w0, [x1, #0xf]
    // 0x5480c8: DecompressPointer r0
    //     0x5480c8: add             x0, x0, HEAP, lsl #32
    // 0x5480cc: cmp             w0, NULL
    // 0x5480d0: b.eq            #0x5480dc
    // 0x5480d4: mov             x1, x0
    // 0x5480d8: r0 = play()
    //     0x5480d8: bl              #0x5480f4  ; [package:ricochlime/utils/ricochlime_audio.dart] _AudioPool::play
    // 0x5480dc: r0 = Null
    //     0x5480dc: mov             x0, NULL
    // 0x5480e0: LeaveFrame
    //     0x5480e0: mov             SP, fp
    //     0x5480e4: ldp             fp, lr, [SP], #0x10
    // 0x5480e8: ret
    //     0x5480e8: ret             
    // 0x5480ec: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5480ec: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5480f0: b               #0x5480c4
  }
}
