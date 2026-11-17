// lib: , url: package:ricochlime/ads/iap.dart

// class id: 1049299, size: 0x8
class :: {
}

// class id: 262, size: 0x8, field offset: 0x8
abstract class RicochlimeIAP extends Object {

  static Future<void> init() async {
    // ** addr: 0x3c45b4, size: 0x34
    // 0x3c45b4: EnterFrame
    //     0x3c45b4: stp             fp, lr, [SP, #-0x10]!
    //     0x3c45b8: mov             fp, SP
    // 0x3c45bc: AllocStack(0x8)
    //     0x3c45bc: sub             SP, SP, #8
    // 0x3c45c0: SetupParameters()
    //     0x3c45c0: stur            NULL, [fp, #-8]
    // 0x3c45c4: CheckStackOverflow
    //     0x3c45c4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c45c8: cmp             SP, x16
    //     0x3c45cc: b.ls            #0x3c45e0
    // 0x3c45d0: InitAsync() -> Future<void?>
    //     0x3c45d0: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x3c45d4: bl              #0x2556b4  ; InitAsyncStub
    // 0x3c45d8: r0 = init()
    //     0x3c45d8: bl              #0x3c45e8  ; [package:ricochlime/ads/iap.dart] RicochlimeProduct::init
    // 0x3c45dc: r0 = ReturnAsync()
    //     0x3c45dc: b               #0x26476c  ; ReturnAsyncStub
    // 0x3c45e0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c45e0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c45e4: b               #0x3c45d0
  }
}

// class id: 3846, size: 0x18, field offset: 0x14
enum RicochlimeProduct extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
  _OneByteString field_14;

  static void init() {
    // ** addr: 0x3c45e8, size: 0x15c
    // 0x3c45e8: EnterFrame
    //     0x3c45e8: stp             fp, lr, [SP, #-0x10]!
    //     0x3c45ec: mov             fp, SP
    // 0x3c45f0: AllocStack(0x38)
    //     0x3c45f0: sub             SP, SP, #0x38
    // 0x3c45f4: CheckStackOverflow
    //     0x3c45f4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c45f8: cmp             SP, x16
    //     0x3c45fc: b.ls            #0x3c4734
    // 0x3c4600: r0 = LoadStaticField(0xcb8)
    //     0x3c4600: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c4604: ldr             x0, [x0, #0x1970]
    // 0x3c4608: cmp             w0, NULL
    // 0x3c460c: b.ne            #0x3c4728
    // 0x3c4610: r16 = <RicochlimeProduct, PlainStow<IAPState>>
    //     0x3c4610: add             x16, PP, #0x10, lsl #12  ; [pp+0x107b8] TypeArguments: <RicochlimeProduct, PlainStow<IAPState>>
    //     0x3c4614: ldr             x16, [x16, #0x7b8]
    // 0x3c4618: ldr             lr, [THR, #0xa8]  ; THR::empty_array
    // 0x3c461c: stp             lr, x16, [SP]
    // 0x3c4620: r0 = Map._fromLiteral()
    //     0x3c4620: bl              #0x23b588  ; [dart:core] Map::Map._fromLiteral
    // 0x3c4624: stur            x0, [fp, #-0x18]
    // 0x3c4628: r1 = 0
    //     0x3c4628: mov             x1, #0
    // 0x3c462c: r3 = const [Instance of 'RicochlimeProduct', Instance of 'RicochlimeProduct']
    //     0x3c462c: add             x3, PP, #0x10, lsl #12  ; [pp+0x107c0] List<RicochlimeProduct>(2)
    //     0x3c4630: ldr             x3, [x3, #0x7c0]
    // 0x3c4634: CheckStackOverflow
    //     0x3c4634: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c4638: cmp             SP, x16
    //     0x3c463c: b.ls            #0x3c473c
    // 0x3c4640: cmp             x1, #2
    // 0x3c4644: b.ge            #0x3c4718
    // 0x3c4648: ArrayLoad: r4 = r3[r1]  ; Unknown_4
    //     0x3c4648: add             x16, x3, x1, lsl #2
    //     0x3c464c: ldur            w4, [x16, #0xf]
    // 0x3c4650: DecompressPointer r4
    //     0x3c4650: add             x4, x4, HEAP, lsl #32
    // 0x3c4654: stur            x4, [fp, #-0x10]
    // 0x3c4658: add             x5, x1, #1
    // 0x3c465c: stur            x5, [fp, #-8]
    // 0x3c4660: r1 = Null
    //     0x3c4660: mov             x1, NULL
    // 0x3c4664: r2 = 6
    //     0x3c4664: mov             x2, #6
    // 0x3c4668: r0 = AllocateArray()
    //     0x3c4668: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3c466c: r16 = "iap_"
    //     0x3c466c: add             x16, PP, #0x10, lsl #12  ; [pp+0x107c8] "iap_"
    //     0x3c4670: ldr             x16, [x16, #0x7c8]
    // 0x3c4674: StoreField: r0->field_f = r16
    //     0x3c4674: stur            w16, [x0, #0xf]
    // 0x3c4678: ldur            x2, [fp, #-0x10]
    // 0x3c467c: LoadField: r1 = r2->field_13
    //     0x3c467c: ldur            w1, [x2, #0x13]
    // 0x3c4680: DecompressPointer r1
    //     0x3c4680: add             x1, x1, HEAP, lsl #32
    // 0x3c4684: StoreField: r0->field_13 = r1
    //     0x3c4684: stur            w1, [x0, #0x13]
    // 0x3c4688: r16 = "_state"
    //     0x3c4688: add             x16, PP, #0x10, lsl #12  ; [pp+0x107d0] "_state"
    //     0x3c468c: ldr             x16, [x16, #0x7d0]
    // 0x3c4690: ArrayStore: r0[0] = r16  ; List_4
    //     0x3c4690: stur            w16, [x0, #0x17]
    // 0x3c4694: str             x0, [SP]
    // 0x3c4698: r0 = _interpolate()
    //     0x3c4698: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x3c469c: stur            x0, [fp, #-0x20]
    // 0x3c46a0: r0 = LoadStaticField(0xcc0)
    //     0x3c46a0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c46a4: ldr             x0, [x0, #0x1980]
    // 0x3c46a8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c46ac: cmp             w0, w16
    // 0x3c46b0: b.ne            #0x3c46c0
    // 0x3c46b4: r2 = codec
    //     0x3c46b4: add             x2, PP, #0x10, lsl #12  ; [pp+0x107d8] Field <IAPState.codec>: static late final (offset: 0xcc0)
    //     0x3c46b8: ldr             x2, [x2, #0x7d8]
    // 0x3c46bc: r0 = InitLateFinalStaticField()
    //     0x3c46bc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c46c0: r1 = <String, IAPState, Object?, IAPState>
    //     0x3c46c0: add             x1, PP, #0x10, lsl #12  ; [pp+0x107e0] TypeArguments: <String, IAPState, Object?, IAPState>
    //     0x3c46c4: ldr             x1, [x1, #0x7e0]
    // 0x3c46c8: stur            x0, [fp, #-0x28]
    // 0x3c46cc: r0 = PlainStow()
    //     0x3c46cc: bl              #0x28ac90  ; AllocatePlainStowStub -> PlainStow<C3X0> (size=0x4c)
    // 0x3c46d0: mov             x1, x0
    // 0x3c46d4: ldur            x2, [fp, #-0x20]
    // 0x3c46d8: ldur            x5, [fp, #-0x28]
    // 0x3c46dc: r3 = Instance_IAPState
    //     0x3c46dc: add             x3, PP, #0x10, lsl #12  ; [pp+0x107e8] Obj!IAPState@5d8c91
    //     0x3c46e0: ldr             x3, [x3, #0x7e8]
    // 0x3c46e4: stur            x0, [fp, #-0x20]
    // 0x3c46e8: r0 = Stow()
    //     0x3c46e8: bl              #0x288aec  ; [package:stow/src/abstract_stow.dart] Stow::Stow
    // 0x3c46ec: ldur            x16, [fp, #-0x10]
    // 0x3c46f0: str             x16, [SP]
    // 0x3c46f4: r0 = _getHash()
    //     0x3c46f4: bl              #0x280a30  ; [dart:core] ::_getHash
    // 0x3c46f8: r5 = LoadInt32Instr(r0)
    //     0x3c46f8: sbfx            x5, x0, #1, #0x1f
    // 0x3c46fc: ldur            x1, [fp, #-0x18]
    // 0x3c4700: ldur            x2, [fp, #-0x10]
    // 0x3c4704: ldur            x3, [fp, #-0x20]
    // 0x3c4708: r0 = _set()
    //     0x3c4708: bl              #0x23bc28  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::_set
    // 0x3c470c: ldur            x1, [fp, #-8]
    // 0x3c4710: ldur            x0, [fp, #-0x18]
    // 0x3c4714: b               #0x3c462c
    // 0x3c4718: ldur            x2, [fp, #-0x18]
    // 0x3c471c: StoreStaticField(0xcb8, r2)
    //     0x3c471c: ldr             x1, [THR, #0x78]  ; THR::field_table_values
    //     0x3c4720: str             x2, [x1, #0x1970]
    // 0x3c4724: ldur            x0, [fp, #-0x18]
    // 0x3c4728: LeaveFrame
    //     0x3c4728: mov             SP, fp
    //     0x3c472c: ldp             fp, lr, [SP], #0x10
    // 0x3c4730: ret
    //     0x3c4730: ret             
    // 0x3c4734: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c4734: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c4738: b               #0x3c4600
    // 0x3c473c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c473c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c4740: b               #0x3c4640
  }
  _ _enumToString(/* No info */) {
    // ** addr: 0x4a0088, size: 0x64
    // 0x4a0088: EnterFrame
    //     0x4a0088: stp             fp, lr, [SP, #-0x10]!
    //     0x4a008c: mov             fp, SP
    // 0x4a0090: AllocStack(0x10)
    //     0x4a0090: sub             SP, SP, #0x10
    // 0x4a0094: SetupParameters(RicochlimeProduct this /* r1 => r0, fp-0x8 */)
    //     0x4a0094: mov             x0, x1
    //     0x4a0098: stur            x1, [fp, #-8]
    // 0x4a009c: CheckStackOverflow
    //     0x4a009c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a00a0: cmp             SP, x16
    //     0x4a00a4: b.ls            #0x4a00e4
    // 0x4a00a8: r1 = Null
    //     0x4a00a8: mov             x1, NULL
    // 0x4a00ac: r2 = 4
    //     0x4a00ac: mov             x2, #4
    // 0x4a00b0: r0 = AllocateArray()
    //     0x4a00b0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a00b4: r16 = "RicochlimeProduct."
    //     0x4a00b4: add             x16, PP, #0x11, lsl #12  ; [pp+0x11438] "RicochlimeProduct."
    //     0x4a00b8: ldr             x16, [x16, #0x438]
    // 0x4a00bc: StoreField: r0->field_f = r16
    //     0x4a00bc: stur            w16, [x0, #0xf]
    // 0x4a00c0: ldur            x1, [fp, #-8]
    // 0x4a00c4: LoadField: r2 = r1->field_f
    //     0x4a00c4: ldur            w2, [x1, #0xf]
    // 0x4a00c8: DecompressPointer r2
    //     0x4a00c8: add             x2, x2, HEAP, lsl #32
    // 0x4a00cc: StoreField: r0->field_13 = r2
    //     0x4a00cc: stur            w2, [x0, #0x13]
    // 0x4a00d0: str             x0, [SP]
    // 0x4a00d4: r0 = _interpolate()
    //     0x4a00d4: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a00d8: LeaveFrame
    //     0x4a00d8: mov             SP, fp
    //     0x4a00dc: ldp             fp, lr, [SP], #0x10
    // 0x4a00e0: ret
    //     0x4a00e0: ret             
    // 0x4a00e4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a00e4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a00e8: b               #0x4a00a8
  }
}
