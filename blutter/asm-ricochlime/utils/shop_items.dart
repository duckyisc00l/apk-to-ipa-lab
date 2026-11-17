// lib: , url: package:ricochlime/utils/shop_items.dart

// class id: 1049334, size: 0x8
class :: {

  static late final Future<SharedPreferences> _sharedPreferences; // offset: 0xce0

  static Future<SharedPreferences> _sharedPreferences() {
    // ** addr: 0x28b5e8, size: 0x2c
    // 0x28b5e8: EnterFrame
    //     0x28b5e8: stp             fp, lr, [SP, #-0x10]!
    //     0x28b5ec: mov             fp, SP
    // 0x28b5f0: CheckStackOverflow
    //     0x28b5f0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28b5f4: cmp             SP, x16
    //     0x28b5f8: b.ls            #0x28b60c
    // 0x28b5fc: r0 = getInstance()
    //     0x28b5fc: bl              #0x2898d0  ; [package:shared_preferences/src/shared_preferences_legacy.dart] SharedPreferences::getInstance
    // 0x28b600: LeaveFrame
    //     0x28b600: mov             SP, fp
    //     0x28b604: ldp             fp, lr, [SP], #0x10
    // 0x28b608: ret
    //     0x28b608: ret             
    // 0x28b60c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28b60c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28b610: b               #0x28b5fc
  }
}

// class id: 221, size: 0x18, field offset: 0x8
abstract class ShopItem extends Object {

  _ ShopItem(/* No info */) {
    // ** addr: 0x28b2e0, size: 0xe4
    // 0x28b2e0: EnterFrame
    //     0x28b2e0: stp             fp, lr, [SP, #-0x10]!
    //     0x28b2e4: mov             fp, SP
    // 0x28b2e8: AllocStack(0x20)
    //     0x28b2e8: sub             SP, SP, #0x20
    // 0x28b2ec: SetupParameters(ShopItem this /* r1 => r2, fp-0x8 */, dynamic _ /* r2 => r0, fp-0x10 */, dynamic _ /* r3 => r3, fp-0x18 */)
    //     0x28b2ec: mov             x0, x2
    //     0x28b2f0: stur            x2, [fp, #-0x10]
    //     0x28b2f4: mov             x2, x1
    //     0x28b2f8: stur            x1, [fp, #-8]
    //     0x28b2fc: stur            x3, [fp, #-0x18]
    // 0x28b300: CheckStackOverflow
    //     0x28b300: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28b304: cmp             SP, x16
    //     0x28b308: b.ls            #0x28b3bc
    // 0x28b30c: r1 = <ShopItemState>
    //     0x28b30c: add             x1, PP, #8, lsl #12  ; [pp+0x8cc0] TypeArguments: <ShopItemState>
    //     0x28b310: ldr             x1, [x1, #0xcc0]
    // 0x28b314: r0 = ValueNotifier()
    //     0x28b314: bl              #0x28b614  ; AllocateValueNotifierStub -> ValueNotifier<X0> (size=0x2c)
    // 0x28b318: mov             x1, x0
    // 0x28b31c: r0 = Instance_ShopItemState
    //     0x28b31c: add             x0, PP, #8, lsl #12  ; [pp+0x8cc8] Obj!ShopItemState@5d8961
    //     0x28b320: ldr             x0, [x0, #0xcc8]
    // 0x28b324: stur            x1, [fp, #-0x20]
    // 0x28b328: StoreField: r1->field_27 = r0
    //     0x28b328: stur            w0, [x1, #0x27]
    // 0x28b32c: StoreField: r1->field_7 = rZR
    //     0x28b32c: stur            xzr, [x1, #7]
    // 0x28b330: StoreField: r1->field_13 = rZR
    //     0x28b330: stur            xzr, [x1, #0x13]
    // 0x28b334: StoreField: r1->field_1b = rZR
    //     0x28b334: stur            xzr, [x1, #0x1b]
    // 0x28b338: r0 = LoadStaticField(0x448)
    //     0x28b338: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28b33c: ldr             x0, [x0, #0x890]
    // 0x28b340: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28b344: cmp             w0, w16
    // 0x28b348: b.ne            #0x28b354
    // 0x28b34c: r2 = _emptyListeners
    //     0x28b34c: ldr             x2, [PP, #0x36b8]  ; [pp+0x36b8] Field <ChangeNotifier._emptyListeners@27329750>: static late final (offset: 0x448)
    // 0x28b350: r0 = InitLateFinalStaticField()
    //     0x28b350: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28b354: mov             x1, x0
    // 0x28b358: ldur            x0, [fp, #-0x20]
    // 0x28b35c: StoreField: r0->field_f = r1
    //     0x28b35c: stur            w1, [x0, #0xf]
    // 0x28b360: ldur            x1, [fp, #-8]
    // 0x28b364: StoreField: r1->field_13 = r0
    //     0x28b364: stur            w0, [x1, #0x13]
    //     0x28b368: ldurb           w16, [x1, #-1]
    //     0x28b36c: ldurb           w17, [x0, #-1]
    //     0x28b370: and             x16, x17, x16, lsr #2
    //     0x28b374: tst             x16, HEAP, lsr #32
    //     0x28b378: b.eq            #0x28b380
    //     0x28b37c: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x28b380: ldur            x0, [fp, #-0x10]
    // 0x28b384: StoreField: r1->field_7 = r0
    //     0x28b384: stur            w0, [x1, #7]
    //     0x28b388: ldurb           w16, [x1, #-1]
    //     0x28b38c: ldurb           w17, [x0, #-1]
    //     0x28b390: and             x16, x17, x16, lsr #2
    //     0x28b394: tst             x16, HEAP, lsr #32
    //     0x28b398: b.eq            #0x28b3a0
    //     0x28b39c: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x28b3a0: ldur            x0, [fp, #-0x18]
    // 0x28b3a4: StoreField: r1->field_b = r0
    //     0x28b3a4: stur            x0, [x1, #0xb]
    // 0x28b3a8: r0 = _loadState()
    //     0x28b3a8: bl              #0x28b3e8  ; [package:ricochlime/utils/shop_items.dart] ShopItem::_loadState
    // 0x28b3ac: r0 = Null
    //     0x28b3ac: mov             x0, NULL
    // 0x28b3b0: LeaveFrame
    //     0x28b3b0: mov             SP, fp
    //     0x28b3b4: ldp             fp, lr, [SP], #0x10
    // 0x28b3b8: ret
    //     0x28b3b8: ret             
    // 0x28b3bc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28b3bc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28b3c0: b               #0x28b30c
  }
  _ _loadState(/* No info */) async {
    // ** addr: 0x28b3e8, size: 0xec
    // 0x28b3e8: EnterFrame
    //     0x28b3e8: stp             fp, lr, [SP, #-0x10]!
    //     0x28b3ec: mov             fp, SP
    // 0x28b3f0: AllocStack(0x18)
    //     0x28b3f0: sub             SP, SP, #0x18
    // 0x28b3f4: SetupParameters(ShopItem this /* r1 => r1, fp-0x10 */)
    //     0x28b3f4: stur            NULL, [fp, #-8]
    //     0x28b3f8: stur            x1, [fp, #-0x10]
    // 0x28b3fc: CheckStackOverflow
    //     0x28b3fc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28b400: cmp             SP, x16
    //     0x28b404: b.ls            #0x28b4cc
    // 0x28b408: InitAsync() -> Future<void?>
    //     0x28b408: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x28b40c: bl              #0x2556b4  ; InitAsyncStub
    // 0x28b410: ldur            x1, [fp, #-0x10]
    // 0x28b414: LoadField: r0 = r1->field_b
    //     0x28b414: ldur            x0, [x1, #0xb]
    // 0x28b418: tbz             x0, #0x3f, #0x28b43c
    // 0x28b41c: LoadField: r0 = r1->field_13
    //     0x28b41c: ldur            w0, [x1, #0x13]
    // 0x28b420: DecompressPointer r0
    //     0x28b420: add             x0, x0, HEAP, lsl #32
    // 0x28b424: mov             x1, x0
    // 0x28b428: r2 = Instance_ShopItemState
    //     0x28b428: add             x2, PP, #8, lsl #12  ; [pp+0x8cd0] Obj!ShopItemState@5d8941
    //     0x28b42c: ldr             x2, [x2, #0xcd0]
    // 0x28b430: r0 = value=()
    //     0x28b430: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x28b434: r0 = Null
    //     0x28b434: mov             x0, NULL
    // 0x28b438: r0 = ReturnAsyncNotFuture()
    //     0x28b438: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x28b43c: r0 = LoadStaticField(0xce0)
    //     0x28b43c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28b440: ldr             x0, [x0, #0x19c0]
    // 0x28b444: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28b448: cmp             w0, w16
    // 0x28b44c: b.ne            #0x28b45c
    // 0x28b450: r2 = _sharedPreferences
    //     0x28b450: add             x2, PP, #8, lsl #12  ; [pp+0x8cd8] Field <::._sharedPreferences@763041672>: static late final (offset: 0xce0)
    //     0x28b454: ldr             x2, [x2, #0xcd8]
    // 0x28b458: r0 = InitLateFinalStaticField()
    //     0x28b458: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28b45c: mov             x1, x0
    // 0x28b460: stur            x1, [fp, #-0x18]
    // 0x28b464: r0 = Await()
    //     0x28b464: bl              #0x255470  ; AwaitStub
    // 0x28b468: ldur            x1, [fp, #-0x10]
    // 0x28b46c: stur            x0, [fp, #-0x18]
    // 0x28b470: r0 = prefsKey()
    //     0x28b470: bl              #0x28b564  ; [package:ricochlime/utils/shop_items.dart] ShopItem::prefsKey
    // 0x28b474: ldur            x1, [fp, #-0x18]
    // 0x28b478: mov             x2, x0
    // 0x28b47c: r0 = getBool()
    //     0x28b47c: bl              #0x28b4d4  ; [package:shared_preferences/src/shared_preferences_legacy.dart] SharedPreferences::getBool
    // 0x28b480: cmp             w0, NULL
    // 0x28b484: b.ne            #0x28b490
    // 0x28b488: r1 = false
    //     0x28b488: add             x1, NULL, #0x30  ; false
    // 0x28b48c: b               #0x28b494
    // 0x28b490: mov             x1, x0
    // 0x28b494: ldur            x0, [fp, #-0x10]
    // 0x28b498: LoadField: r2 = r0->field_13
    //     0x28b498: ldur            w2, [x0, #0x13]
    // 0x28b49c: DecompressPointer r2
    //     0x28b49c: add             x2, x2, HEAP, lsl #32
    // 0x28b4a0: tbnz            w1, #4, #0x28b4b0
    // 0x28b4a4: r0 = Instance_ShopItemState
    //     0x28b4a4: add             x0, PP, #8, lsl #12  ; [pp+0x8cd0] Obj!ShopItemState@5d8941
    //     0x28b4a8: ldr             x0, [x0, #0xcd0]
    // 0x28b4ac: b               #0x28b4b8
    // 0x28b4b0: r0 = Instance_ShopItemState
    //     0x28b4b0: add             x0, PP, #8, lsl #12  ; [pp+0x8ce0] Obj!ShopItemState@5d8921
    //     0x28b4b4: ldr             x0, [x0, #0xce0]
    // 0x28b4b8: mov             x1, x2
    // 0x28b4bc: mov             x2, x0
    // 0x28b4c0: r0 = value=()
    //     0x28b4c0: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x28b4c4: r0 = Null
    //     0x28b4c4: mov             x0, NULL
    // 0x28b4c8: r0 = ReturnAsyncNotFuture()
    //     0x28b4c8: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x28b4cc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28b4cc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28b4d0: b               #0x28b408
  }
  get _ prefsKey(/* No info */) {
    // ** addr: 0x28b564, size: 0x64
    // 0x28b564: EnterFrame
    //     0x28b564: stp             fp, lr, [SP, #-0x10]!
    //     0x28b568: mov             fp, SP
    // 0x28b56c: AllocStack(0x10)
    //     0x28b56c: sub             SP, SP, #0x10
    // 0x28b570: SetupParameters(ShopItem this /* r1 => r0, fp-0x8 */)
    //     0x28b570: mov             x0, x1
    //     0x28b574: stur            x1, [fp, #-8]
    // 0x28b578: CheckStackOverflow
    //     0x28b578: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28b57c: cmp             SP, x16
    //     0x28b580: b.ls            #0x28b5c0
    // 0x28b584: r1 = Null
    //     0x28b584: mov             x1, NULL
    // 0x28b588: r2 = 4
    //     0x28b588: mov             x2, #4
    // 0x28b58c: r0 = AllocateArray()
    //     0x28b58c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x28b590: r16 = "shopItemPurchased:"
    //     0x28b590: add             x16, PP, #8, lsl #12  ; [pp+0x8cf8] "shopItemPurchased:"
    //     0x28b594: ldr             x16, [x16, #0xcf8]
    // 0x28b598: StoreField: r0->field_f = r16
    //     0x28b598: stur            w16, [x0, #0xf]
    // 0x28b59c: ldur            x1, [fp, #-8]
    // 0x28b5a0: LoadField: r2 = r1->field_7
    //     0x28b5a0: ldur            w2, [x1, #7]
    // 0x28b5a4: DecompressPointer r2
    //     0x28b5a4: add             x2, x2, HEAP, lsl #32
    // 0x28b5a8: StoreField: r0->field_13 = r2
    //     0x28b5a8: stur            w2, [x0, #0x13]
    // 0x28b5ac: str             x0, [SP]
    // 0x28b5b0: r0 = _interpolate()
    //     0x28b5b0: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x28b5b4: LeaveFrame
    //     0x28b5b4: mov             SP, fp
    //     0x28b5b8: ldp             fp, lr, [SP], #0x10
    // 0x28b5bc: ret
    //     0x28b5bc: ret             
    // 0x28b5c0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28b5c0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28b5c4: b               #0x28b584
  }
  _ purchase(/* No info */) async {
    // ** addr: 0x42ce9c, size: 0x1b4
    // 0x42ce9c: EnterFrame
    //     0x42ce9c: stp             fp, lr, [SP, #-0x10]!
    //     0x42cea0: mov             fp, SP
    // 0x42cea4: AllocStack(0x38)
    //     0x42cea4: sub             SP, SP, #0x38
    // 0x42cea8: SetupParameters(ShopItem this /* r1 => r1, fp-0x10 */)
    //     0x42cea8: stur            NULL, [fp, #-8]
    //     0x42ceac: stur            x1, [fp, #-0x10]
    // 0x42ceb0: CheckStackOverflow
    //     0x42ceb0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ceb4: cmp             SP, x16
    //     0x42ceb8: b.ls            #0x42d048
    // 0x42cebc: InitAsync() -> Future<bool>
    //     0x42cebc: ldr             x0, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    //     0x42cec0: bl              #0x2556b4  ; InitAsyncStub
    // 0x42cec4: ldur            x0, [fp, #-0x10]
    // 0x42cec8: LoadField: r1 = r0->field_13
    //     0x42cec8: ldur            w1, [x0, #0x13]
    // 0x42cecc: DecompressPointer r1
    //     0x42cecc: add             x1, x1, HEAP, lsl #32
    // 0x42ced0: stur            x1, [fp, #-0x18]
    // 0x42ced4: LoadField: r2 = r1->field_27
    //     0x42ced4: ldur            w2, [x1, #0x27]
    // 0x42ced8: DecompressPointer r2
    //     0x42ced8: add             x2, x2, HEAP, lsl #32
    // 0x42cedc: r16 = Instance_ShopItemState
    //     0x42cedc: add             x16, PP, #8, lsl #12  ; [pp+0x8cd0] Obj!ShopItemState@5d8941
    //     0x42cee0: ldr             x16, [x16, #0xcd0]
    // 0x42cee4: cmp             w2, w16
    // 0x42cee8: b.ne            #0x42cef4
    // 0x42ceec: r0 = true
    //     0x42ceec: add             x0, NULL, #0x20  ; true
    // 0x42cef0: r0 = ReturnAsyncNotFuture()
    //     0x42cef0: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x42cef4: r0 = LoadStaticField(0xccc)
    //     0x42cef4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42cef8: ldr             x0, [x0, #0x1998]
    // 0x42cefc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42cf00: cmp             w0, w16
    // 0x42cf04: b.ne            #0x42cf14
    // 0x42cf08: r2 = stows
    //     0x42cf08: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42cf0c: ldr             x2, [x2, #0x310]
    // 0x42cf10: r0 = InitLateFinalStaticField()
    //     0x42cf10: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42cf14: LoadField: r2 = r0->field_2b
    //     0x42cf14: ldur            w2, [x0, #0x2b]
    // 0x42cf18: DecompressPointer r2
    //     0x42cf18: add             x2, x2, HEAP, lsl #32
    // 0x42cf1c: mov             x1, x2
    // 0x42cf20: stur            x2, [fp, #-0x20]
    // 0x42cf24: LoadField: r0 = r1->field_43
    //     0x42cf24: ldur            w0, [x1, #0x43]
    // 0x42cf28: DecompressPointer r0
    //     0x42cf28: add             x0, x0, HEAP, lsl #32
    // 0x42cf2c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42cf30: cmp             w0, w16
    // 0x42cf34: b.ne            #0x42cf44
    // 0x42cf38: r2 = _value
    //     0x42cf38: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42cf3c: ldr             x2, [x2, #0x4b0]
    // 0x42cf40: r0 = InitLateInstanceField()
    //     0x42cf40: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42cf44: mov             x1, x0
    // 0x42cf48: ldur            x0, [fp, #-0x10]
    // 0x42cf4c: LoadField: r2 = r0->field_b
    //     0x42cf4c: ldur            x2, [x0, #0xb]
    // 0x42cf50: stur            x2, [fp, #-0x28]
    // 0x42cf54: r3 = LoadInt32Instr(r1)
    //     0x42cf54: sbfx            x3, x1, #1, #0x1f
    //     0x42cf58: tbz             w1, #0, #0x42cf60
    //     0x42cf5c: ldur            x3, [x1, #7]
    // 0x42cf60: cmp             x3, x2
    // 0x42cf64: b.ge            #0x42cf70
    // 0x42cf68: r0 = false
    //     0x42cf68: add             x0, NULL, #0x30  ; false
    // 0x42cf6c: r0 = ReturnAsyncNotFuture()
    //     0x42cf6c: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x42cf70: ldur            x1, [fp, #-0x20]
    // 0x42cf74: r0 = LoadStaticField(0xce0)
    //     0x42cf74: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42cf78: ldr             x0, [x0, #0x19c0]
    // 0x42cf7c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42cf80: cmp             w0, w16
    // 0x42cf84: b.ne            #0x42cf94
    // 0x42cf88: r2 = _sharedPreferences
    //     0x42cf88: add             x2, PP, #8, lsl #12  ; [pp+0x8cd8] Field <::._sharedPreferences@763041672>: static late final (offset: 0xce0)
    //     0x42cf8c: ldr             x2, [x2, #0xcd8]
    // 0x42cf90: r0 = InitLateFinalStaticField()
    //     0x42cf90: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42cf94: mov             x1, x0
    // 0x42cf98: stur            x1, [fp, #-0x30]
    // 0x42cf9c: r0 = Await()
    //     0x42cf9c: bl              #0x255470  ; AwaitStub
    // 0x42cfa0: r1 = Null
    //     0x42cfa0: mov             x1, NULL
    // 0x42cfa4: r2 = 4
    //     0x42cfa4: mov             x2, #4
    // 0x42cfa8: stur            x0, [fp, #-0x30]
    // 0x42cfac: r0 = AllocateArray()
    //     0x42cfac: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42cfb0: r16 = "shopItemPurchased:"
    //     0x42cfb0: add             x16, PP, #8, lsl #12  ; [pp+0x8cf8] "shopItemPurchased:"
    //     0x42cfb4: ldr             x16, [x16, #0xcf8]
    // 0x42cfb8: StoreField: r0->field_f = r16
    //     0x42cfb8: stur            w16, [x0, #0xf]
    // 0x42cfbc: ldur            x1, [fp, #-0x10]
    // 0x42cfc0: LoadField: r2 = r1->field_7
    //     0x42cfc0: ldur            w2, [x1, #7]
    // 0x42cfc4: DecompressPointer r2
    //     0x42cfc4: add             x2, x2, HEAP, lsl #32
    // 0x42cfc8: StoreField: r0->field_13 = r2
    //     0x42cfc8: stur            w2, [x0, #0x13]
    // 0x42cfcc: str             x0, [SP]
    // 0x42cfd0: r0 = _interpolate()
    //     0x42cfd0: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x42cfd4: ldur            x1, [fp, #-0x30]
    // 0x42cfd8: mov             x2, x0
    // 0x42cfdc: r3 = true
    //     0x42cfdc: add             x3, NULL, #0x20  ; true
    // 0x42cfe0: r0 = setBool()
    //     0x42cfe0: bl              #0x28aa64  ; [package:shared_preferences/src/shared_preferences_legacy.dart] SharedPreferences::setBool
    // 0x42cfe4: mov             x1, x0
    // 0x42cfe8: stur            x1, [fp, #-0x30]
    // 0x42cfec: r0 = Await()
    //     0x42cfec: bl              #0x255470  ; AwaitStub
    // 0x42cff0: ldur            x1, [fp, #-0x18]
    // 0x42cff4: r2 = Instance_ShopItemState
    //     0x42cff4: add             x2, PP, #8, lsl #12  ; [pp+0x8cd0] Obj!ShopItemState@5d8941
    //     0x42cff8: ldr             x2, [x2, #0xcd0]
    // 0x42cffc: r0 = value=()
    //     0x42cffc: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x42d000: ldur            x2, [fp, #-0x20]
    // 0x42d004: LoadField: r0 = r2->field_43
    //     0x42d004: ldur            w0, [x2, #0x43]
    // 0x42d008: DecompressPointer r0
    //     0x42d008: add             x0, x0, HEAP, lsl #32
    // 0x42d00c: r1 = LoadInt32Instr(r0)
    //     0x42d00c: sbfx            x1, x0, #1, #0x1f
    //     0x42d010: tbz             w0, #0, #0x42d018
    //     0x42d014: ldur            x1, [x0, #7]
    // 0x42d018: ldur            x0, [fp, #-0x28]
    // 0x42d01c: sub             x3, x1, x0
    // 0x42d020: r0 = BoxInt64Instr(r3)
    //     0x42d020: sbfiz           x0, x3, #1, #0x1f
    //     0x42d024: cmp             x3, x0, asr #1
    //     0x42d028: b.eq            #0x42d034
    //     0x42d02c: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x42d030: stur            x3, [x0, #7]
    // 0x42d034: mov             x1, x2
    // 0x42d038: mov             x2, x0
    // 0x42d03c: r0 = value=()
    //     0x42d03c: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42d040: r0 = true
    //     0x42d040: add             x0, NULL, #0x20  ; true
    // 0x42d044: r0 = ReturnAsyncNotFuture()
    //     0x42d044: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x42d048: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42d048: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42d04c: b               #0x42cebc
  }
}

// class id: 222, size: 0x20, field offset: 0x18
class BulletShapeShopItem extends ShopItem {

  late final Sprite sprite; // offset: 0x1c

  Sprite sprite(BulletShapeShopItem) {
    // ** addr: 0x3c9694, size: 0x4c
    // 0x3c9694: EnterFrame
    //     0x3c9694: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9698: mov             fp, SP
    // 0x3c969c: AllocStack(0x8)
    //     0x3c969c: sub             SP, SP, #8
    // 0x3c96a0: CheckStackOverflow
    //     0x3c96a0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c96a4: cmp             SP, x16
    //     0x3c96a8: b.ls            #0x3c96d8
    // 0x3c96ac: ldr             x0, [fp, #0x10]
    // 0x3c96b0: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x3c96b0: ldur            w1, [x0, #0x17]
    // 0x3c96b4: DecompressPointer r1
    //     0x3c96b4: add             x1, x1, HEAP, lsl #32
    // 0x3c96b8: str             x1, [SP]
    // 0x3c96bc: mov             x0, x1
    // 0x3c96c0: ClosureCall
    //     0x3c96c0: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    //     0x3c96c4: ldur            x2, [x0, #0x1f]
    //     0x3c96c8: blr             x2
    // 0x3c96cc: LeaveFrame
    //     0x3c96cc: mov             SP, fp
    //     0x3c96d0: ldp             fp, lr, [SP], #0x10
    // 0x3c96d4: ret
    //     0x3c96d4: ret             
    // 0x3c96d8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c96d8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c96dc: b               #0x3c96ac
  }
}

// class id: 223, size: 0x1c, field offset: 0x18
class BulletColorShopItem extends ShopItem {

  _ BulletColorShopItem(/* No info */) {
    // ** addr: 0x28ca44, size: 0x100
    // 0x28ca44: EnterFrame
    //     0x28ca44: stp             fp, lr, [SP, #-0x10]!
    //     0x28ca48: mov             fp, SP
    // 0x28ca4c: AllocStack(0x28)
    //     0x28ca4c: sub             SP, SP, #0x28
    // 0x28ca50: SetupParameters(BulletColorShopItem this /* r1 => r5, fp-0x8 */, dynamic _ /* r2 => r4, fp-0x10 */, dynamic _ /* r3 => r3, fp-0x18 */)
    //     0x28ca50: mov             x5, x1
    //     0x28ca54: mov             x4, x2
    //     0x28ca58: stur            x1, [fp, #-8]
    //     0x28ca5c: stur            x2, [fp, #-0x10]
    //     0x28ca60: stur            x3, [fp, #-0x18]
    // 0x28ca64: CheckStackOverflow
    //     0x28ca64: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28ca68: cmp             SP, x16
    //     0x28ca6c: b.ls            #0x28cb3c
    // 0x28ca70: mov             x0, x4
    // 0x28ca74: ArrayStore: r5[0] = r0  ; List_4
    //     0x28ca74: stur            w0, [x5, #0x17]
    //     0x28ca78: ldurb           w16, [x5, #-1]
    //     0x28ca7c: ldurb           w17, [x0, #-1]
    //     0x28ca80: and             x16, x17, x16, lsr #2
    //     0x28ca84: tst             x16, HEAP, lsr #32
    //     0x28ca88: b.eq            #0x28ca90
    //     0x28ca8c: bl              #0x582cc4  ; WriteBarrierWrappersStub
    // 0x28ca90: r1 = Null
    //     0x28ca90: mov             x1, NULL
    // 0x28ca94: r2 = 4
    //     0x28ca94: mov             x2, #4
    // 0x28ca98: r0 = AllocateArray()
    //     0x28ca98: bl              #0x5845d8  ; AllocateArrayStub
    // 0x28ca9c: mov             x2, x0
    // 0x28caa0: stur            x2, [fp, #-0x20]
    // 0x28caa4: r16 = "bullet"
    //     0x28caa4: add             x16, PP, #8, lsl #12  ; [pp+0x8d60] "bullet"
    //     0x28caa8: ldr             x16, [x16, #0xd60]
    // 0x28caac: StoreField: r2->field_f = r16
    //     0x28caac: stur            w16, [x2, #0xf]
    // 0x28cab0: ldur            x1, [fp, #-0x10]
    // 0x28cab4: r0 = LoadClassIdInstr(r1)
    //     0x28cab4: ldur            x0, [x1, #-1]
    //     0x28cab8: ubfx            x0, x0, #0xc, #0x14
    // 0x28cabc: r0 = GDT[cid_x0 + -0xa73]()
    //     0x28cabc: sub             lr, x0, #0xa73
    //     0x28cac0: ldr             lr, [x21, lr, lsl #3]
    //     0x28cac4: blr             lr
    // 0x28cac8: mov             x2, x0
    // 0x28cacc: r0 = BoxInt64Instr(r2)
    //     0x28cacc: sbfiz           x0, x2, #1, #0x1f
    //     0x28cad0: cmp             x2, x0, asr #1
    //     0x28cad4: b.eq            #0x28cae0
    //     0x28cad8: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x28cadc: stur            x2, [x0, #7]
    // 0x28cae0: mov             x1, x0
    // 0x28cae4: r0 = _toPow2String()
    //     0x28cae4: bl              #0x280710  ; [dart:core] _IntegerImplementation::_toPow2String
    // 0x28cae8: ldur            x1, [fp, #-0x20]
    // 0x28caec: ArrayStore: r1[1] = r0  ; List_4
    //     0x28caec: add             x25, x1, #0x13
    //     0x28caf0: str             w0, [x25]
    //     0x28caf4: tbz             w0, #0, #0x28cb10
    //     0x28caf8: ldurb           w16, [x1, #-1]
    //     0x28cafc: ldurb           w17, [x0, #-1]
    //     0x28cb00: and             x16, x17, x16, lsr #2
    //     0x28cb04: tst             x16, HEAP, lsr #32
    //     0x28cb08: b.eq            #0x28cb10
    //     0x28cb0c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x28cb10: ldur            x16, [fp, #-0x20]
    // 0x28cb14: str             x16, [SP]
    // 0x28cb18: r0 = _interpolate()
    //     0x28cb18: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x28cb1c: ldur            x1, [fp, #-8]
    // 0x28cb20: mov             x2, x0
    // 0x28cb24: ldur            x3, [fp, #-0x18]
    // 0x28cb28: r0 = ShopItem()
    //     0x28cb28: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28cb2c: r0 = Null
    //     0x28cb2c: mov             x0, NULL
    // 0x28cb30: LeaveFrame
    //     0x28cb30: mov             SP, fp
    //     0x28cb34: ldp             fp, lr, [SP], #0x10
    // 0x28cb38: ret
    //     0x28cb38: ret             
    // 0x28cb3c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28cb3c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28cb40: b               #0x28ca70
  }
}

// class id: 224, size: 0x8, field offset: 0x8
abstract class ShopItems extends Object {

  static late final List<BulletColorShopItem> bulletColors; // offset: 0xcd4
  static late final List<BulletShapeShopItem> bulletShapes; // offset: 0xcd8
  static late final List<ShopItem> allItems; // offset: 0xcdc

  static List<BulletShapeShopItem> bulletShapes() {
    // ** addr: 0x28ac9c, size: 0x2ec
    // 0x28ac9c: EnterFrame
    //     0x28ac9c: stp             fp, lr, [SP, #-0x10]!
    //     0x28aca0: mov             fp, SP
    // 0x28aca4: AllocStack(0x58)
    //     0x28aca4: sub             SP, SP, #0x58
    // 0x28aca8: CheckStackOverflow
    //     0x28aca8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28acac: cmp             SP, x16
    //     0x28acb0: b.ls            #0x28af80
    // 0x28acb4: r0 = BulletShapeShopItem()
    //     0x28acb4: bl              #0x28b620  ; AllocateBulletShapeShopItemStub -> BulletShapeShopItem (size=0x20)
    // 0x28acb8: mov             x3, x0
    // 0x28acbc: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28acc0: stur            x3, [fp, #-8]
    // 0x28acc4: StoreField: r3->field_1b = r0
    //     0x28acc4: stur            w0, [x3, #0x1b]
    // 0x28acc8: r1 = Function '<anonymous closure>': static.
    //     0x28acc8: add             x1, PP, #8, lsl #12  ; [pp+0x8668] AnonymousClosure: static (0x28c67c), in [package:ricochlime/utils/shop_items.dart] ShopItems::bulletShapes (0x28ac9c)
    //     0x28accc: ldr             x1, [x1, #0x668]
    // 0x28acd0: r2 = Null
    //     0x28acd0: mov             x2, NULL
    // 0x28acd4: r0 = AllocateClosure()
    //     0x28acd4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x28acd8: mov             x1, x0
    // 0x28acdc: ldur            x0, [fp, #-8]
    // 0x28ace0: ArrayStore: r0[0] = r1  ; List_4
    //     0x28ace0: stur            w1, [x0, #0x17]
    // 0x28ace4: mov             x1, x0
    // 0x28ace8: r2 = "bulletShapeCircle"
    //     0x28ace8: add             x2, PP, #8, lsl #12  ; [pp+0x8670] "bulletShapeCircle"
    //     0x28acec: ldr             x2, [x2, #0x670]
    // 0x28acf0: r3 = -1
    //     0x28acf0: mov             x3, #-1
    // 0x28acf4: r0 = ShopItem()
    //     0x28acf4: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28acf8: r0 = BulletShapeShopItem()
    //     0x28acf8: bl              #0x28b620  ; AllocateBulletShapeShopItemStub -> BulletShapeShopItem (size=0x20)
    // 0x28acfc: mov             x3, x0
    // 0x28ad00: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ad04: stur            x3, [fp, #-0x10]
    // 0x28ad08: StoreField: r3->field_1b = r0
    //     0x28ad08: stur            w0, [x3, #0x1b]
    // 0x28ad0c: r1 = Function '<anonymous closure>': static.
    //     0x28ad0c: add             x1, PP, #8, lsl #12  ; [pp+0x8678] AnonymousClosure: static (0x28c5a0), in [package:ricochlime/utils/shop_items.dart] ShopItems::bulletShapes (0x28ac9c)
    //     0x28ad10: ldr             x1, [x1, #0x678]
    // 0x28ad14: r2 = Null
    //     0x28ad14: mov             x2, NULL
    // 0x28ad18: r0 = AllocateClosure()
    //     0x28ad18: bl              #0x5838bc  ; AllocateClosureStub
    // 0x28ad1c: mov             x1, x0
    // 0x28ad20: ldur            x0, [fp, #-0x10]
    // 0x28ad24: ArrayStore: r0[0] = r1  ; List_4
    //     0x28ad24: stur            w1, [x0, #0x17]
    // 0x28ad28: mov             x1, x0
    // 0x28ad2c: r2 = "bulletShapeArrow"
    //     0x28ad2c: add             x2, PP, #8, lsl #12  ; [pp+0x8680] "bulletShapeArrow"
    //     0x28ad30: ldr             x2, [x2, #0x680]
    // 0x28ad34: r3 = 1000
    //     0x28ad34: mov             x3, #0x3e8
    // 0x28ad38: r0 = ShopItem()
    //     0x28ad38: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28ad3c: r0 = BulletShapeShopItem()
    //     0x28ad3c: bl              #0x28b620  ; AllocateBulletShapeShopItemStub -> BulletShapeShopItem (size=0x20)
    // 0x28ad40: mov             x3, x0
    // 0x28ad44: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ad48: stur            x3, [fp, #-0x18]
    // 0x28ad4c: StoreField: r3->field_1b = r0
    //     0x28ad4c: stur            w0, [x3, #0x1b]
    // 0x28ad50: r1 = Function '<anonymous closure>': static.
    //     0x28ad50: add             x1, PP, #8, lsl #12  ; [pp+0x8688] AnonymousClosure: static (0x28c4cc), in [package:ricochlime/utils/shop_items.dart] ShopItems::bulletShapes (0x28ac9c)
    //     0x28ad54: ldr             x1, [x1, #0x688]
    // 0x28ad58: r2 = Null
    //     0x28ad58: mov             x2, NULL
    // 0x28ad5c: r0 = AllocateClosure()
    //     0x28ad5c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x28ad60: mov             x1, x0
    // 0x28ad64: ldur            x0, [fp, #-0x18]
    // 0x28ad68: ArrayStore: r0[0] = r1  ; List_4
    //     0x28ad68: stur            w1, [x0, #0x17]
    // 0x28ad6c: mov             x1, x0
    // 0x28ad70: r2 = "bulletShapeShuriken"
    //     0x28ad70: add             x2, PP, #8, lsl #12  ; [pp+0x8690] "bulletShapeShuriken"
    //     0x28ad74: ldr             x2, [x2, #0x690]
    // 0x28ad78: r3 = 1000
    //     0x28ad78: mov             x3, #0x3e8
    // 0x28ad7c: r0 = ShopItem()
    //     0x28ad7c: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28ad80: r0 = BulletShapeShopItem()
    //     0x28ad80: bl              #0x28b620  ; AllocateBulletShapeShopItemStub -> BulletShapeShopItem (size=0x20)
    // 0x28ad84: mov             x3, x0
    // 0x28ad88: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ad8c: stur            x3, [fp, #-0x20]
    // 0x28ad90: StoreField: r3->field_1b = r0
    //     0x28ad90: stur            w0, [x3, #0x1b]
    // 0x28ad94: r1 = Function '<anonymous closure>': static.
    //     0x28ad94: add             x1, PP, #8, lsl #12  ; [pp+0x8698] AnonymousClosure: static (0x28c3f8), in [package:ricochlime/utils/shop_items.dart] ShopItems::bulletShapes (0x28ac9c)
    //     0x28ad98: ldr             x1, [x1, #0x698]
    // 0x28ad9c: r2 = Null
    //     0x28ad9c: mov             x2, NULL
    // 0x28ada0: r0 = AllocateClosure()
    //     0x28ada0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x28ada4: mov             x1, x0
    // 0x28ada8: ldur            x0, [fp, #-0x20]
    // 0x28adac: ArrayStore: r0[0] = r1  ; List_4
    //     0x28adac: stur            w1, [x0, #0x17]
    // 0x28adb0: mov             x1, x0
    // 0x28adb4: r2 = "bulletShapeDonut"
    //     0x28adb4: add             x2, PP, #8, lsl #12  ; [pp+0x86a0] "bulletShapeDonut"
    //     0x28adb8: ldr             x2, [x2, #0x6a0]
    // 0x28adbc: r3 = 1000
    //     0x28adbc: mov             x3, #0x3e8
    // 0x28adc0: r0 = ShopItem()
    //     0x28adc0: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28adc4: r0 = BulletShapeShopItem()
    //     0x28adc4: bl              #0x28b620  ; AllocateBulletShapeShopItemStub -> BulletShapeShopItem (size=0x20)
    // 0x28adc8: mov             x3, x0
    // 0x28adcc: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28add0: stur            x3, [fp, #-0x28]
    // 0x28add4: StoreField: r3->field_1b = r0
    //     0x28add4: stur            w0, [x3, #0x1b]
    // 0x28add8: r1 = Function '<anonymous closure>': static.
    //     0x28add8: add             x1, PP, #8, lsl #12  ; [pp+0x86a8] AnonymousClosure: static (0x28c324), in [package:ricochlime/utils/shop_items.dart] ShopItems::bulletShapes (0x28ac9c)
    //     0x28addc: ldr             x1, [x1, #0x6a8]
    // 0x28ade0: r2 = Null
    //     0x28ade0: mov             x2, NULL
    // 0x28ade4: r0 = AllocateClosure()
    //     0x28ade4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x28ade8: mov             x1, x0
    // 0x28adec: ldur            x0, [fp, #-0x28]
    // 0x28adf0: ArrayStore: r0[0] = r1  ; List_4
    //     0x28adf0: stur            w1, [x0, #0x17]
    // 0x28adf4: mov             x1, x0
    // 0x28adf8: r2 = "bulletShapeIntricate"
    //     0x28adf8: add             x2, PP, #8, lsl #12  ; [pp+0x86b0] "bulletShapeIntricate"
    //     0x28adfc: ldr             x2, [x2, #0x6b0]
    // 0x28ae00: r3 = 1000
    //     0x28ae00: mov             x3, #0x3e8
    // 0x28ae04: r0 = ShopItem()
    //     0x28ae04: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28ae08: r0 = BulletShapeShopItem()
    //     0x28ae08: bl              #0x28b620  ; AllocateBulletShapeShopItemStub -> BulletShapeShopItem (size=0x20)
    // 0x28ae0c: mov             x3, x0
    // 0x28ae10: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ae14: stur            x3, [fp, #-0x30]
    // 0x28ae18: StoreField: r3->field_1b = r0
    //     0x28ae18: stur            w0, [x3, #0x1b]
    // 0x28ae1c: r1 = Function '<anonymous closure>': static.
    //     0x28ae1c: add             x1, PP, #8, lsl #12  ; [pp+0x86b8] AnonymousClosure: static (0x28c248), in [package:ricochlime/utils/shop_items.dart] ShopItems::bulletShapes (0x28ac9c)
    //     0x28ae20: ldr             x1, [x1, #0x6b8]
    // 0x28ae24: r2 = Null
    //     0x28ae24: mov             x2, NULL
    // 0x28ae28: r0 = AllocateClosure()
    //     0x28ae28: bl              #0x5838bc  ; AllocateClosureStub
    // 0x28ae2c: mov             x1, x0
    // 0x28ae30: ldur            x0, [fp, #-0x30]
    // 0x28ae34: ArrayStore: r0[0] = r1  ; List_4
    //     0x28ae34: stur            w1, [x0, #0x17]
    // 0x28ae38: mov             x1, x0
    // 0x28ae3c: r2 = "bulletShapeDiamond"
    //     0x28ae3c: add             x2, PP, #8, lsl #12  ; [pp+0x86c0] "bulletShapeDiamond"
    //     0x28ae40: ldr             x2, [x2, #0x6c0]
    // 0x28ae44: r3 = 1000
    //     0x28ae44: mov             x3, #0x3e8
    // 0x28ae48: r0 = ShopItem()
    //     0x28ae48: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28ae4c: r0 = BulletShapeShopItem()
    //     0x28ae4c: bl              #0x28b620  ; AllocateBulletShapeShopItemStub -> BulletShapeShopItem (size=0x20)
    // 0x28ae50: mov             x3, x0
    // 0x28ae54: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ae58: stur            x3, [fp, #-0x38]
    // 0x28ae5c: StoreField: r3->field_1b = r0
    //     0x28ae5c: stur            w0, [x3, #0x1b]
    // 0x28ae60: r1 = Function '<anonymous closure>': static.
    //     0x28ae60: add             x1, PP, #8, lsl #12  ; [pp+0x86c8] AnonymousClosure: static (0x28c174), in [package:ricochlime/utils/shop_items.dart] ShopItems::bulletShapes (0x28ac9c)
    //     0x28ae64: ldr             x1, [x1, #0x6c8]
    // 0x28ae68: r2 = Null
    //     0x28ae68: mov             x2, NULL
    // 0x28ae6c: r0 = AllocateClosure()
    //     0x28ae6c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x28ae70: mov             x1, x0
    // 0x28ae74: ldur            x0, [fp, #-0x38]
    // 0x28ae78: ArrayStore: r0[0] = r1  ; List_4
    //     0x28ae78: stur            w1, [x0, #0x17]
    // 0x28ae7c: mov             x1, x0
    // 0x28ae80: r2 = "bulletShapeSmiley"
    //     0x28ae80: add             x2, PP, #8, lsl #12  ; [pp+0x86d0] "bulletShapeSmiley"
    //     0x28ae84: ldr             x2, [x2, #0x6d0]
    // 0x28ae88: r3 = 1000
    //     0x28ae88: mov             x3, #0x3e8
    // 0x28ae8c: r0 = ShopItem()
    //     0x28ae8c: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28ae90: r0 = BulletShapeShopItem()
    //     0x28ae90: bl              #0x28b620  ; AllocateBulletShapeShopItemStub -> BulletShapeShopItem (size=0x20)
    // 0x28ae94: mov             x3, x0
    // 0x28ae98: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x28ae9c: stur            x3, [fp, #-0x40]
    // 0x28aea0: StoreField: r3->field_1b = r0
    //     0x28aea0: stur            w0, [x3, #0x1b]
    // 0x28aea4: r1 = Function '<anonymous closure>': static.
    //     0x28aea4: add             x1, PP, #8, lsl #12  ; [pp+0x86d8] AnonymousClosure: static (0x28b64c), in [package:ricochlime/utils/shop_items.dart] ShopItems::bulletShapes (0x28ac9c)
    //     0x28aea8: ldr             x1, [x1, #0x6d8]
    // 0x28aeac: r2 = Null
    //     0x28aeac: mov             x2, NULL
    // 0x28aeb0: r0 = AllocateClosure()
    //     0x28aeb0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x28aeb4: mov             x1, x0
    // 0x28aeb8: ldur            x0, [fp, #-0x40]
    // 0x28aebc: ArrayStore: r0[0] = r1  ; List_4
    //     0x28aebc: stur            w1, [x0, #0x17]
    // 0x28aec0: mov             x1, x0
    // 0x28aec4: r2 = "bulletShapeCross"
    //     0x28aec4: add             x2, PP, #8, lsl #12  ; [pp+0x86e0] "bulletShapeCross"
    //     0x28aec8: ldr             x2, [x2, #0x6e0]
    // 0x28aecc: r3 = 1000
    //     0x28aecc: mov             x3, #0x3e8
    // 0x28aed0: r0 = ShopItem()
    //     0x28aed0: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28aed4: r1 = Null
    //     0x28aed4: mov             x1, NULL
    // 0x28aed8: r2 = 16
    //     0x28aed8: mov             x2, #0x10
    // 0x28aedc: r0 = AllocateArray()
    //     0x28aedc: bl              #0x5845d8  ; AllocateArrayStub
    // 0x28aee0: mov             x2, x0
    // 0x28aee4: ldur            x0, [fp, #-8]
    // 0x28aee8: stur            x2, [fp, #-0x48]
    // 0x28aeec: StoreField: r2->field_f = r0
    //     0x28aeec: stur            w0, [x2, #0xf]
    // 0x28aef0: ldur            x0, [fp, #-0x10]
    // 0x28aef4: StoreField: r2->field_13 = r0
    //     0x28aef4: stur            w0, [x2, #0x13]
    // 0x28aef8: ldur            x0, [fp, #-0x18]
    // 0x28aefc: ArrayStore: r2[0] = r0  ; List_4
    //     0x28aefc: stur            w0, [x2, #0x17]
    // 0x28af00: ldur            x0, [fp, #-0x20]
    // 0x28af04: StoreField: r2->field_1b = r0
    //     0x28af04: stur            w0, [x2, #0x1b]
    // 0x28af08: ldur            x0, [fp, #-0x28]
    // 0x28af0c: StoreField: r2->field_1f = r0
    //     0x28af0c: stur            w0, [x2, #0x1f]
    // 0x28af10: ldur            x0, [fp, #-0x30]
    // 0x28af14: StoreField: r2->field_23 = r0
    //     0x28af14: stur            w0, [x2, #0x23]
    // 0x28af18: ldur            x0, [fp, #-0x38]
    // 0x28af1c: StoreField: r2->field_27 = r0
    //     0x28af1c: stur            w0, [x2, #0x27]
    // 0x28af20: ldur            x0, [fp, #-0x40]
    // 0x28af24: StoreField: r2->field_2b = r0
    //     0x28af24: stur            w0, [x2, #0x2b]
    // 0x28af28: r1 = Null
    //     0x28af28: mov             x1, NULL
    // 0x28af2c: r0 = AllocateGrowableArray()
    //     0x28af2c: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x28af30: mov             x1, x0
    // 0x28af34: ldur            x0, [fp, #-0x48]
    // 0x28af38: StoreField: r1->field_f = r0
    //     0x28af38: stur            w0, [x1, #0xf]
    // 0x28af3c: r0 = 16
    //     0x28af3c: mov             x0, #0x10
    // 0x28af40: StoreField: r1->field_b = r0
    //     0x28af40: stur            w0, [x1, #0xb]
    // 0x28af44: r16 = false
    //     0x28af44: add             x16, NULL, #0x30  ; false
    // 0x28af48: str             x16, [SP]
    // 0x28af4c: mov             x2, x1
    // 0x28af50: r1 = <BulletShapeShopItem>
    //     0x28af50: add             x1, PP, #8, lsl #12  ; [pp+0x86e8] TypeArguments: <BulletShapeShopItem>
    //     0x28af54: ldr             x1, [x1, #0x6e8]
    // 0x28af58: r4 = const [0, 0x3, 0x1, 0x2, growable, 0x2, null]
    //     0x28af58: ldr             x4, [PP, #0x7288]  ; [pp+0x7288] List(7) [0, 0x3, 0x1, 0x2, "growable", 0x2, Null]
    // 0x28af5c: r0 = List.from()
    //     0x28af5c: bl              #0x28b068  ; [dart:core] List::List.from
    // 0x28af60: r16 = <BulletShapeShopItem>
    //     0x28af60: add             x16, PP, #8, lsl #12  ; [pp+0x86e8] TypeArguments: <BulletShapeShopItem>
    //     0x28af64: ldr             x16, [x16, #0x6e8]
    // 0x28af68: stp             x0, x16, [SP]
    // 0x28af6c: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x28af6c: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x28af70: r0 = makeFixedListUnmodifiable()
    //     0x28af70: bl              #0x28afe0  ; [dart:_internal] ::makeFixedListUnmodifiable
    // 0x28af74: LeaveFrame
    //     0x28af74: mov             SP, fp
    //     0x28af78: ldp             fp, lr, [SP], #0x10
    // 0x28af7c: ret
    //     0x28af7c: ret             
    // 0x28af80: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28af80: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28af84: b               #0x28acb4
  }
  [closure] static Sprite <anonymous closure>(dynamic) {
    // ** addr: 0x28b64c, size: 0xb0
    // 0x28b64c: EnterFrame
    //     0x28b64c: stp             fp, lr, [SP, #-0x10]!
    //     0x28b650: mov             fp, SP
    // 0x28b654: AllocStack(0x18)
    //     0x28b654: sub             SP, SP, #0x18
    // 0x28b658: CheckStackOverflow
    //     0x28b658: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28b65c: cmp             SP, x16
    //     0x28b660: b.ls            #0x28b6f4
    // 0x28b664: r0 = LoadStaticField(0x860)
    //     0x28b664: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28b668: ldr             x0, [x0, #0x10c0]
    // 0x28b66c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28b670: cmp             w0, w16
    // 0x28b674: b.ne            #0x28b684
    // 0x28b678: r2 = instance
    //     0x28b678: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x28b67c: ldr             x2, [x2, #0x6f0]
    // 0x28b680: r0 = InitLateFinalStaticField()
    //     0x28b680: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28b684: LoadField: r1 = r0->field_47
    //     0x28b684: ldur            w1, [x0, #0x47]
    // 0x28b688: DecompressPointer r1
    //     0x28b688: add             x1, x1, HEAP, lsl #32
    // 0x28b68c: r2 = "bullet_shapes.png"
    //     0x28b68c: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x28b690: ldr             x2, [x2, #0x6f8]
    // 0x28b694: r0 = fromCache()
    //     0x28b694: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x28b698: r1 = Null
    //     0x28b698: mov             x1, NULL
    // 0x28b69c: d0 = 16.000000
    //     0x28b69c: fmov            d0, #16.00000000
    // 0x28b6a0: d1 = 32.000000
    //     0x28b6a0: add             x17, PP, #8, lsl #12  ; [pp+0x8700] IMM: double(32) from 0x4040000000000000
    //     0x28b6a4: ldr             d1, [x17, #0x700]
    // 0x28b6a8: stur            x0, [fp, #-8]
    // 0x28b6ac: r0 = Vector2()
    //     0x28b6ac: bl              #0x28bc74  ; [package:vector_math/vector_math.dart] Vector2::Vector2
    // 0x28b6b0: r1 = Null
    //     0x28b6b0: mov             x1, NULL
    // 0x28b6b4: d0 = 16.000000
    //     0x28b6b4: fmov            d0, #16.00000000
    // 0x28b6b8: d1 = 16.000000
    //     0x28b6b8: fmov            d1, #16.00000000
    // 0x28b6bc: stur            x0, [fp, #-0x10]
    // 0x28b6c0: r0 = Vector2()
    //     0x28b6c0: bl              #0x28bc74  ; [package:vector_math/vector_math.dart] Vector2::Vector2
    // 0x28b6c4: stur            x0, [fp, #-0x18]
    // 0x28b6c8: r0 = Sprite()
    //     0x28b6c8: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x28b6cc: mov             x1, x0
    // 0x28b6d0: ldur            x2, [fp, #-8]
    // 0x28b6d4: ldur            x3, [fp, #-0x10]
    // 0x28b6d8: ldur            x5, [fp, #-0x18]
    // 0x28b6dc: stur            x0, [fp, #-8]
    // 0x28b6e0: r0 = Sprite()
    //     0x28b6e0: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x28b6e4: ldur            x0, [fp, #-8]
    // 0x28b6e8: LeaveFrame
    //     0x28b6e8: mov             SP, fp
    //     0x28b6ec: ldp             fp, lr, [SP], #0x10
    // 0x28b6f0: ret
    //     0x28b6f0: ret             
    // 0x28b6f4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28b6f4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28b6f8: b               #0x28b664
  }
  [closure] static Sprite <anonymous closure>(dynamic) {
    // ** addr: 0x28c174, size: 0xd4
    // 0x28c174: EnterFrame
    //     0x28c174: stp             fp, lr, [SP, #-0x10]!
    //     0x28c178: mov             fp, SP
    // 0x28c17c: AllocStack(0x18)
    //     0x28c17c: sub             SP, SP, #0x18
    // 0x28c180: CheckStackOverflow
    //     0x28c180: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c184: cmp             SP, x16
    //     0x28c188: b.ls            #0x28c240
    // 0x28c18c: r0 = LoadStaticField(0x860)
    //     0x28c18c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28c190: ldr             x0, [x0, #0x10c0]
    // 0x28c194: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28c198: cmp             w0, w16
    // 0x28c19c: b.ne            #0x28c1ac
    // 0x28c1a0: r2 = instance
    //     0x28c1a0: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x28c1a4: ldr             x2, [x2, #0x6f0]
    // 0x28c1a8: r0 = InitLateFinalStaticField()
    //     0x28c1a8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28c1ac: LoadField: r1 = r0->field_47
    //     0x28c1ac: ldur            w1, [x0, #0x47]
    // 0x28c1b0: DecompressPointer r1
    //     0x28c1b0: add             x1, x1, HEAP, lsl #32
    // 0x28c1b4: r2 = "bullet_shapes.png"
    //     0x28c1b4: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x28c1b8: ldr             x2, [x2, #0x6f8]
    // 0x28c1bc: r0 = fromCache()
    //     0x28c1bc: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x28c1c0: stur            x0, [fp, #-8]
    // 0x28c1c4: r0 = Vector2()
    //     0x28c1c4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c1c8: r4 = 4
    //     0x28c1c8: mov             x4, #4
    // 0x28c1cc: stur            x0, [fp, #-0x10]
    // 0x28c1d0: r0 = AllocateFloat32Array()
    //     0x28c1d0: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c1d4: ldur            x3, [fp, #-0x10]
    // 0x28c1d8: StoreField: r3->field_7 = r0
    //     0x28c1d8: stur            w0, [x3, #7]
    // 0x28c1dc: d0 = 0.000000
    //     0x28c1dc: add             x17, PP, #8, lsl #12  ; [pp+0x8ca0] IMM: 0x42000000
    //     0x28c1e0: ldr             s0, [x17, #0xca0]
    // 0x28c1e4: StoreField: r0->field_1b = d0
    //     0x28c1e4: stur            s0, [x0, #0x1b]
    // 0x28c1e8: ArrayStore: r0[0] = rZR  ; List_4
    //     0x28c1e8: stur            wzr, [x0, #0x17]
    // 0x28c1ec: r0 = Vector2()
    //     0x28c1ec: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c1f0: r4 = 4
    //     0x28c1f0: mov             x4, #4
    // 0x28c1f4: stur            x0, [fp, #-0x18]
    // 0x28c1f8: r0 = AllocateFloat32Array()
    //     0x28c1f8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c1fc: ldur            x5, [fp, #-0x18]
    // 0x28c200: StoreField: r5->field_7 = r0
    //     0x28c200: stur            w0, [x5, #7]
    // 0x28c204: d0 = 0.000000
    //     0x28c204: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c208: ldr             s0, [x17, #0xca8]
    // 0x28c20c: StoreField: r0->field_1b = d0
    //     0x28c20c: stur            s0, [x0, #0x1b]
    // 0x28c210: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c210: stur            s0, [x0, #0x17]
    // 0x28c214: r0 = Sprite()
    //     0x28c214: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x28c218: mov             x1, x0
    // 0x28c21c: ldur            x2, [fp, #-8]
    // 0x28c220: ldur            x3, [fp, #-0x10]
    // 0x28c224: ldur            x5, [fp, #-0x18]
    // 0x28c228: stur            x0, [fp, #-8]
    // 0x28c22c: r0 = Sprite()
    //     0x28c22c: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x28c230: ldur            x0, [fp, #-8]
    // 0x28c234: LeaveFrame
    //     0x28c234: mov             SP, fp
    //     0x28c238: ldp             fp, lr, [SP], #0x10
    // 0x28c23c: ret
    //     0x28c23c: ret             
    // 0x28c240: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28c240: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28c244: b               #0x28c18c
  }
  [closure] static Sprite <anonymous closure>(dynamic) {
    // ** addr: 0x28c248, size: 0xdc
    // 0x28c248: EnterFrame
    //     0x28c248: stp             fp, lr, [SP, #-0x10]!
    //     0x28c24c: mov             fp, SP
    // 0x28c250: AllocStack(0x18)
    //     0x28c250: sub             SP, SP, #0x18
    // 0x28c254: CheckStackOverflow
    //     0x28c254: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c258: cmp             SP, x16
    //     0x28c25c: b.ls            #0x28c31c
    // 0x28c260: r0 = LoadStaticField(0x860)
    //     0x28c260: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28c264: ldr             x0, [x0, #0x10c0]
    // 0x28c268: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28c26c: cmp             w0, w16
    // 0x28c270: b.ne            #0x28c280
    // 0x28c274: r2 = instance
    //     0x28c274: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x28c278: ldr             x2, [x2, #0x6f0]
    // 0x28c27c: r0 = InitLateFinalStaticField()
    //     0x28c27c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28c280: LoadField: r1 = r0->field_47
    //     0x28c280: ldur            w1, [x0, #0x47]
    // 0x28c284: DecompressPointer r1
    //     0x28c284: add             x1, x1, HEAP, lsl #32
    // 0x28c288: r2 = "bullet_shapes.png"
    //     0x28c288: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x28c28c: ldr             x2, [x2, #0x6f8]
    // 0x28c290: r0 = fromCache()
    //     0x28c290: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x28c294: stur            x0, [fp, #-8]
    // 0x28c298: r0 = Vector2()
    //     0x28c298: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c29c: r4 = 4
    //     0x28c29c: mov             x4, #4
    // 0x28c2a0: stur            x0, [fp, #-0x10]
    // 0x28c2a4: r0 = AllocateFloat32Array()
    //     0x28c2a4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c2a8: ldur            x3, [fp, #-0x10]
    // 0x28c2ac: StoreField: r3->field_7 = r0
    //     0x28c2ac: stur            w0, [x3, #7]
    // 0x28c2b0: d0 = 0.000000
    //     0x28c2b0: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c2b4: ldr             s0, [x17, #0xca8]
    // 0x28c2b8: StoreField: r0->field_1b = d0
    //     0x28c2b8: stur            s0, [x0, #0x1b]
    // 0x28c2bc: d1 = 0.000000
    //     0x28c2bc: add             x17, PP, #8, lsl #12  ; [pp+0x8ca0] IMM: 0x42000000
    //     0x28c2c0: ldr             s1, [x17, #0xca0]
    // 0x28c2c4: ArrayStore: r0[0] = d1  ; List_8
    //     0x28c2c4: stur            s1, [x0, #0x17]
    // 0x28c2c8: r0 = Vector2()
    //     0x28c2c8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c2cc: r4 = 4
    //     0x28c2cc: mov             x4, #4
    // 0x28c2d0: stur            x0, [fp, #-0x18]
    // 0x28c2d4: r0 = AllocateFloat32Array()
    //     0x28c2d4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c2d8: ldur            x5, [fp, #-0x18]
    // 0x28c2dc: StoreField: r5->field_7 = r0
    //     0x28c2dc: stur            w0, [x5, #7]
    // 0x28c2e0: d0 = 0.000000
    //     0x28c2e0: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c2e4: ldr             s0, [x17, #0xca8]
    // 0x28c2e8: StoreField: r0->field_1b = d0
    //     0x28c2e8: stur            s0, [x0, #0x1b]
    // 0x28c2ec: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c2ec: stur            s0, [x0, #0x17]
    // 0x28c2f0: r0 = Sprite()
    //     0x28c2f0: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x28c2f4: mov             x1, x0
    // 0x28c2f8: ldur            x2, [fp, #-8]
    // 0x28c2fc: ldur            x3, [fp, #-0x10]
    // 0x28c300: ldur            x5, [fp, #-0x18]
    // 0x28c304: stur            x0, [fp, #-8]
    // 0x28c308: r0 = Sprite()
    //     0x28c308: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x28c30c: ldur            x0, [fp, #-8]
    // 0x28c310: LeaveFrame
    //     0x28c310: mov             SP, fp
    //     0x28c314: ldp             fp, lr, [SP], #0x10
    // 0x28c318: ret
    //     0x28c318: ret             
    // 0x28c31c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28c31c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28c320: b               #0x28c260
  }
  [closure] static Sprite <anonymous closure>(dynamic) {
    // ** addr: 0x28c324, size: 0xd4
    // 0x28c324: EnterFrame
    //     0x28c324: stp             fp, lr, [SP, #-0x10]!
    //     0x28c328: mov             fp, SP
    // 0x28c32c: AllocStack(0x18)
    //     0x28c32c: sub             SP, SP, #0x18
    // 0x28c330: CheckStackOverflow
    //     0x28c330: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c334: cmp             SP, x16
    //     0x28c338: b.ls            #0x28c3f0
    // 0x28c33c: r0 = LoadStaticField(0x860)
    //     0x28c33c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28c340: ldr             x0, [x0, #0x10c0]
    // 0x28c344: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28c348: cmp             w0, w16
    // 0x28c34c: b.ne            #0x28c35c
    // 0x28c350: r2 = instance
    //     0x28c350: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x28c354: ldr             x2, [x2, #0x6f0]
    // 0x28c358: r0 = InitLateFinalStaticField()
    //     0x28c358: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28c35c: LoadField: r1 = r0->field_47
    //     0x28c35c: ldur            w1, [x0, #0x47]
    // 0x28c360: DecompressPointer r1
    //     0x28c360: add             x1, x1, HEAP, lsl #32
    // 0x28c364: r2 = "bullet_shapes.png"
    //     0x28c364: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x28c368: ldr             x2, [x2, #0x6f8]
    // 0x28c36c: r0 = fromCache()
    //     0x28c36c: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x28c370: stur            x0, [fp, #-8]
    // 0x28c374: r0 = Vector2()
    //     0x28c374: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c378: r4 = 4
    //     0x28c378: mov             x4, #4
    // 0x28c37c: stur            x0, [fp, #-0x10]
    // 0x28c380: r0 = AllocateFloat32Array()
    //     0x28c380: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c384: ldur            x3, [fp, #-0x10]
    // 0x28c388: StoreField: r3->field_7 = r0
    //     0x28c388: stur            w0, [x3, #7]
    // 0x28c38c: d0 = 0.000000
    //     0x28c38c: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c390: ldr             s0, [x17, #0xca8]
    // 0x28c394: StoreField: r0->field_1b = d0
    //     0x28c394: stur            s0, [x0, #0x1b]
    // 0x28c398: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c398: stur            s0, [x0, #0x17]
    // 0x28c39c: r0 = Vector2()
    //     0x28c39c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c3a0: r4 = 4
    //     0x28c3a0: mov             x4, #4
    // 0x28c3a4: stur            x0, [fp, #-0x18]
    // 0x28c3a8: r0 = AllocateFloat32Array()
    //     0x28c3a8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c3ac: ldur            x5, [fp, #-0x18]
    // 0x28c3b0: StoreField: r5->field_7 = r0
    //     0x28c3b0: stur            w0, [x5, #7]
    // 0x28c3b4: d0 = 0.000000
    //     0x28c3b4: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c3b8: ldr             s0, [x17, #0xca8]
    // 0x28c3bc: StoreField: r0->field_1b = d0
    //     0x28c3bc: stur            s0, [x0, #0x1b]
    // 0x28c3c0: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c3c0: stur            s0, [x0, #0x17]
    // 0x28c3c4: r0 = Sprite()
    //     0x28c3c4: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x28c3c8: mov             x1, x0
    // 0x28c3cc: ldur            x2, [fp, #-8]
    // 0x28c3d0: ldur            x3, [fp, #-0x10]
    // 0x28c3d4: ldur            x5, [fp, #-0x18]
    // 0x28c3d8: stur            x0, [fp, #-8]
    // 0x28c3dc: r0 = Sprite()
    //     0x28c3dc: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x28c3e0: ldur            x0, [fp, #-8]
    // 0x28c3e4: LeaveFrame
    //     0x28c3e4: mov             SP, fp
    //     0x28c3e8: ldp             fp, lr, [SP], #0x10
    // 0x28c3ec: ret
    //     0x28c3ec: ret             
    // 0x28c3f0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28c3f0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28c3f4: b               #0x28c33c
  }
  [closure] static Sprite <anonymous closure>(dynamic) {
    // ** addr: 0x28c3f8, size: 0xd4
    // 0x28c3f8: EnterFrame
    //     0x28c3f8: stp             fp, lr, [SP, #-0x10]!
    //     0x28c3fc: mov             fp, SP
    // 0x28c400: AllocStack(0x18)
    //     0x28c400: sub             SP, SP, #0x18
    // 0x28c404: CheckStackOverflow
    //     0x28c404: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c408: cmp             SP, x16
    //     0x28c40c: b.ls            #0x28c4c4
    // 0x28c410: r0 = LoadStaticField(0x860)
    //     0x28c410: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28c414: ldr             x0, [x0, #0x10c0]
    // 0x28c418: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28c41c: cmp             w0, w16
    // 0x28c420: b.ne            #0x28c430
    // 0x28c424: r2 = instance
    //     0x28c424: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x28c428: ldr             x2, [x2, #0x6f0]
    // 0x28c42c: r0 = InitLateFinalStaticField()
    //     0x28c42c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28c430: LoadField: r1 = r0->field_47
    //     0x28c430: ldur            w1, [x0, #0x47]
    // 0x28c434: DecompressPointer r1
    //     0x28c434: add             x1, x1, HEAP, lsl #32
    // 0x28c438: r2 = "bullet_shapes.png"
    //     0x28c438: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x28c43c: ldr             x2, [x2, #0x6f8]
    // 0x28c440: r0 = fromCache()
    //     0x28c440: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x28c444: stur            x0, [fp, #-8]
    // 0x28c448: r0 = Vector2()
    //     0x28c448: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c44c: r4 = 4
    //     0x28c44c: mov             x4, #4
    // 0x28c450: stur            x0, [fp, #-0x10]
    // 0x28c454: r0 = AllocateFloat32Array()
    //     0x28c454: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c458: ldur            x3, [fp, #-0x10]
    // 0x28c45c: StoreField: r3->field_7 = r0
    //     0x28c45c: stur            w0, [x3, #7]
    // 0x28c460: d0 = 0.000000
    //     0x28c460: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c464: ldr             s0, [x17, #0xca8]
    // 0x28c468: StoreField: r0->field_1b = d0
    //     0x28c468: stur            s0, [x0, #0x1b]
    // 0x28c46c: ArrayStore: r0[0] = rZR  ; List_4
    //     0x28c46c: stur            wzr, [x0, #0x17]
    // 0x28c470: r0 = Vector2()
    //     0x28c470: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c474: r4 = 4
    //     0x28c474: mov             x4, #4
    // 0x28c478: stur            x0, [fp, #-0x18]
    // 0x28c47c: r0 = AllocateFloat32Array()
    //     0x28c47c: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c480: ldur            x5, [fp, #-0x18]
    // 0x28c484: StoreField: r5->field_7 = r0
    //     0x28c484: stur            w0, [x5, #7]
    // 0x28c488: d0 = 0.000000
    //     0x28c488: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c48c: ldr             s0, [x17, #0xca8]
    // 0x28c490: StoreField: r0->field_1b = d0
    //     0x28c490: stur            s0, [x0, #0x1b]
    // 0x28c494: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c494: stur            s0, [x0, #0x17]
    // 0x28c498: r0 = Sprite()
    //     0x28c498: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x28c49c: mov             x1, x0
    // 0x28c4a0: ldur            x2, [fp, #-8]
    // 0x28c4a4: ldur            x3, [fp, #-0x10]
    // 0x28c4a8: ldur            x5, [fp, #-0x18]
    // 0x28c4ac: stur            x0, [fp, #-8]
    // 0x28c4b0: r0 = Sprite()
    //     0x28c4b0: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x28c4b4: ldur            x0, [fp, #-8]
    // 0x28c4b8: LeaveFrame
    //     0x28c4b8: mov             SP, fp
    //     0x28c4bc: ldp             fp, lr, [SP], #0x10
    // 0x28c4c0: ret
    //     0x28c4c0: ret             
    // 0x28c4c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28c4c4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28c4c8: b               #0x28c410
  }
  [closure] static Sprite <anonymous closure>(dynamic) {
    // ** addr: 0x28c4cc, size: 0xd4
    // 0x28c4cc: EnterFrame
    //     0x28c4cc: stp             fp, lr, [SP, #-0x10]!
    //     0x28c4d0: mov             fp, SP
    // 0x28c4d4: AllocStack(0x18)
    //     0x28c4d4: sub             SP, SP, #0x18
    // 0x28c4d8: CheckStackOverflow
    //     0x28c4d8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c4dc: cmp             SP, x16
    //     0x28c4e0: b.ls            #0x28c598
    // 0x28c4e4: r0 = LoadStaticField(0x860)
    //     0x28c4e4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28c4e8: ldr             x0, [x0, #0x10c0]
    // 0x28c4ec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28c4f0: cmp             w0, w16
    // 0x28c4f4: b.ne            #0x28c504
    // 0x28c4f8: r2 = instance
    //     0x28c4f8: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x28c4fc: ldr             x2, [x2, #0x6f0]
    // 0x28c500: r0 = InitLateFinalStaticField()
    //     0x28c500: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28c504: LoadField: r1 = r0->field_47
    //     0x28c504: ldur            w1, [x0, #0x47]
    // 0x28c508: DecompressPointer r1
    //     0x28c508: add             x1, x1, HEAP, lsl #32
    // 0x28c50c: r2 = "bullet_shapes.png"
    //     0x28c50c: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x28c510: ldr             x2, [x2, #0x6f8]
    // 0x28c514: r0 = fromCache()
    //     0x28c514: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x28c518: stur            x0, [fp, #-8]
    // 0x28c51c: r0 = Vector2()
    //     0x28c51c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c520: r4 = 4
    //     0x28c520: mov             x4, #4
    // 0x28c524: stur            x0, [fp, #-0x10]
    // 0x28c528: r0 = AllocateFloat32Array()
    //     0x28c528: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c52c: ldur            x3, [fp, #-0x10]
    // 0x28c530: StoreField: r3->field_7 = r0
    //     0x28c530: stur            w0, [x3, #7]
    // 0x28c534: StoreField: r0->field_1b = rZR
    //     0x28c534: stur            wzr, [x0, #0x1b]
    // 0x28c538: d0 = 0.000000
    //     0x28c538: add             x17, PP, #8, lsl #12  ; [pp+0x8ca0] IMM: 0x42000000
    //     0x28c53c: ldr             s0, [x17, #0xca0]
    // 0x28c540: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c540: stur            s0, [x0, #0x17]
    // 0x28c544: r0 = Vector2()
    //     0x28c544: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c548: r4 = 4
    //     0x28c548: mov             x4, #4
    // 0x28c54c: stur            x0, [fp, #-0x18]
    // 0x28c550: r0 = AllocateFloat32Array()
    //     0x28c550: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c554: ldur            x5, [fp, #-0x18]
    // 0x28c558: StoreField: r5->field_7 = r0
    //     0x28c558: stur            w0, [x5, #7]
    // 0x28c55c: d0 = 0.000000
    //     0x28c55c: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c560: ldr             s0, [x17, #0xca8]
    // 0x28c564: StoreField: r0->field_1b = d0
    //     0x28c564: stur            s0, [x0, #0x1b]
    // 0x28c568: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c568: stur            s0, [x0, #0x17]
    // 0x28c56c: r0 = Sprite()
    //     0x28c56c: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x28c570: mov             x1, x0
    // 0x28c574: ldur            x2, [fp, #-8]
    // 0x28c578: ldur            x3, [fp, #-0x10]
    // 0x28c57c: ldur            x5, [fp, #-0x18]
    // 0x28c580: stur            x0, [fp, #-8]
    // 0x28c584: r0 = Sprite()
    //     0x28c584: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x28c588: ldur            x0, [fp, #-8]
    // 0x28c58c: LeaveFrame
    //     0x28c58c: mov             SP, fp
    //     0x28c590: ldp             fp, lr, [SP], #0x10
    // 0x28c594: ret
    //     0x28c594: ret             
    // 0x28c598: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28c598: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28c59c: b               #0x28c4e4
  }
  [closure] static Sprite <anonymous closure>(dynamic) {
    // ** addr: 0x28c5a0, size: 0xdc
    // 0x28c5a0: EnterFrame
    //     0x28c5a0: stp             fp, lr, [SP, #-0x10]!
    //     0x28c5a4: mov             fp, SP
    // 0x28c5a8: AllocStack(0x18)
    //     0x28c5a8: sub             SP, SP, #0x18
    // 0x28c5ac: CheckStackOverflow
    //     0x28c5ac: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c5b0: cmp             SP, x16
    //     0x28c5b4: b.ls            #0x28c674
    // 0x28c5b8: r0 = LoadStaticField(0x860)
    //     0x28c5b8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28c5bc: ldr             x0, [x0, #0x10c0]
    // 0x28c5c0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28c5c4: cmp             w0, w16
    // 0x28c5c8: b.ne            #0x28c5d8
    // 0x28c5cc: r2 = instance
    //     0x28c5cc: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x28c5d0: ldr             x2, [x2, #0x6f0]
    // 0x28c5d4: r0 = InitLateFinalStaticField()
    //     0x28c5d4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28c5d8: LoadField: r1 = r0->field_47
    //     0x28c5d8: ldur            w1, [x0, #0x47]
    // 0x28c5dc: DecompressPointer r1
    //     0x28c5dc: add             x1, x1, HEAP, lsl #32
    // 0x28c5e0: r2 = "bullet_shapes.png"
    //     0x28c5e0: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x28c5e4: ldr             x2, [x2, #0x6f8]
    // 0x28c5e8: r0 = fromCache()
    //     0x28c5e8: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x28c5ec: stur            x0, [fp, #-8]
    // 0x28c5f0: r0 = Vector2()
    //     0x28c5f0: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c5f4: r4 = 4
    //     0x28c5f4: mov             x4, #4
    // 0x28c5f8: stur            x0, [fp, #-0x10]
    // 0x28c5fc: r0 = AllocateFloat32Array()
    //     0x28c5fc: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c600: ldur            x3, [fp, #-0x10]
    // 0x28c604: StoreField: r3->field_7 = r0
    //     0x28c604: stur            w0, [x3, #7]
    // 0x28c608: StoreField: r0->field_1b = rZR
    //     0x28c608: stur            wzr, [x0, #0x1b]
    // 0x28c60c: d0 = 0.000000
    //     0x28c60c: add             x17, PP, #8, lsl #12  ; [pp+0x8cb0] IMM: 0x41900000
    //     0x28c610: ldr             s0, [x17, #0xcb0]
    // 0x28c614: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c614: stur            s0, [x0, #0x17]
    // 0x28c618: r0 = Vector2()
    //     0x28c618: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c61c: r4 = 4
    //     0x28c61c: mov             x4, #4
    // 0x28c620: stur            x0, [fp, #-0x18]
    // 0x28c624: r0 = AllocateFloat32Array()
    //     0x28c624: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c628: ldur            x5, [fp, #-0x18]
    // 0x28c62c: StoreField: r5->field_7 = r0
    //     0x28c62c: stur            w0, [x5, #7]
    // 0x28c630: d0 = 0.000000
    //     0x28c630: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c634: ldr             s0, [x17, #0xca8]
    // 0x28c638: StoreField: r0->field_1b = d0
    //     0x28c638: stur            s0, [x0, #0x1b]
    // 0x28c63c: d0 = 0.000000
    //     0x28c63c: add             x17, PP, #8, lsl #12  ; [pp+0x8cb8] IMM: 0x41400000
    //     0x28c640: ldr             s0, [x17, #0xcb8]
    // 0x28c644: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c644: stur            s0, [x0, #0x17]
    // 0x28c648: r0 = Sprite()
    //     0x28c648: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x28c64c: mov             x1, x0
    // 0x28c650: ldur            x2, [fp, #-8]
    // 0x28c654: ldur            x3, [fp, #-0x10]
    // 0x28c658: ldur            x5, [fp, #-0x18]
    // 0x28c65c: stur            x0, [fp, #-8]
    // 0x28c660: r0 = Sprite()
    //     0x28c660: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x28c664: ldur            x0, [fp, #-8]
    // 0x28c668: LeaveFrame
    //     0x28c668: mov             SP, fp
    //     0x28c66c: ldp             fp, lr, [SP], #0x10
    // 0x28c670: ret
    //     0x28c670: ret             
    // 0x28c674: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28c674: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28c678: b               #0x28c5b8
  }
  [closure] static Sprite <anonymous closure>(dynamic) {
    // ** addr: 0x28c67c, size: 0xcc
    // 0x28c67c: EnterFrame
    //     0x28c67c: stp             fp, lr, [SP, #-0x10]!
    //     0x28c680: mov             fp, SP
    // 0x28c684: AllocStack(0x18)
    //     0x28c684: sub             SP, SP, #0x18
    // 0x28c688: CheckStackOverflow
    //     0x28c688: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c68c: cmp             SP, x16
    //     0x28c690: b.ls            #0x28c740
    // 0x28c694: r0 = LoadStaticField(0x860)
    //     0x28c694: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x28c698: ldr             x0, [x0, #0x10c0]
    // 0x28c69c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x28c6a0: cmp             w0, w16
    // 0x28c6a4: b.ne            #0x28c6b4
    // 0x28c6a8: r2 = instance
    //     0x28c6a8: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x28c6ac: ldr             x2, [x2, #0x6f0]
    // 0x28c6b0: r0 = InitLateFinalStaticField()
    //     0x28c6b0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x28c6b4: LoadField: r1 = r0->field_47
    //     0x28c6b4: ldur            w1, [x0, #0x47]
    // 0x28c6b8: DecompressPointer r1
    //     0x28c6b8: add             x1, x1, HEAP, lsl #32
    // 0x28c6bc: r2 = "bullet_shapes.png"
    //     0x28c6bc: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x28c6c0: ldr             x2, [x2, #0x6f8]
    // 0x28c6c4: r0 = fromCache()
    //     0x28c6c4: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x28c6c8: stur            x0, [fp, #-8]
    // 0x28c6cc: r0 = Vector2()
    //     0x28c6cc: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c6d0: r4 = 4
    //     0x28c6d0: mov             x4, #4
    // 0x28c6d4: stur            x0, [fp, #-0x10]
    // 0x28c6d8: r0 = AllocateFloat32Array()
    //     0x28c6d8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c6dc: ldur            x3, [fp, #-0x10]
    // 0x28c6e0: StoreField: r3->field_7 = r0
    //     0x28c6e0: stur            w0, [x3, #7]
    // 0x28c6e4: StoreField: r0->field_1b = rZR
    //     0x28c6e4: stur            wzr, [x0, #0x1b]
    // 0x28c6e8: ArrayStore: r0[0] = rZR  ; List_4
    //     0x28c6e8: stur            wzr, [x0, #0x17]
    // 0x28c6ec: r0 = Vector2()
    //     0x28c6ec: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x28c6f0: r4 = 4
    //     0x28c6f0: mov             x4, #4
    // 0x28c6f4: stur            x0, [fp, #-0x18]
    // 0x28c6f8: r0 = AllocateFloat32Array()
    //     0x28c6f8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x28c6fc: ldur            x5, [fp, #-0x18]
    // 0x28c700: StoreField: r5->field_7 = r0
    //     0x28c700: stur            w0, [x5, #7]
    // 0x28c704: d0 = 0.000000
    //     0x28c704: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x28c708: ldr             s0, [x17, #0xca8]
    // 0x28c70c: StoreField: r0->field_1b = d0
    //     0x28c70c: stur            s0, [x0, #0x1b]
    // 0x28c710: ArrayStore: r0[0] = d0  ; List_8
    //     0x28c710: stur            s0, [x0, #0x17]
    // 0x28c714: r0 = Sprite()
    //     0x28c714: bl              #0x28bc68  ; AllocateSpriteStub -> Sprite (size=0x14)
    // 0x28c718: mov             x1, x0
    // 0x28c71c: ldur            x2, [fp, #-8]
    // 0x28c720: ldur            x3, [fp, #-0x10]
    // 0x28c724: ldur            x5, [fp, #-0x18]
    // 0x28c728: stur            x0, [fp, #-8]
    // 0x28c72c: r0 = Sprite()
    //     0x28c72c: bl              #0x28b6fc  ; [package:flame/src/sprite.dart] Sprite::Sprite
    // 0x28c730: ldur            x0, [fp, #-8]
    // 0x28c734: LeaveFrame
    //     0x28c734: mov             SP, fp
    //     0x28c738: ldp             fp, lr, [SP], #0x10
    // 0x28c73c: ret
    //     0x28c73c: ret             
    // 0x28c740: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28c740: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28c744: b               #0x28c694
  }
  static List<BulletColorShopItem> bulletColors() {
    // ** addr: 0x28c748, size: 0x2dc
    // 0x28c748: EnterFrame
    //     0x28c748: stp             fp, lr, [SP, #-0x10]!
    //     0x28c74c: mov             fp, SP
    // 0x28c750: AllocStack(0x48)
    //     0x28c750: sub             SP, SP, #0x48
    // 0x28c754: CheckStackOverflow
    //     0x28c754: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c758: cmp             SP, x16
    //     0x28c75c: b.ls            #0x28ca14
    // 0x28c760: r0 = BulletColorShopItem()
    //     0x28c760: bl              #0x28cb44  ; AllocateBulletColorShopItemStub -> BulletColorShopItem (size=0x1c)
    // 0x28c764: mov             x1, x0
    // 0x28c768: r2 = Instance_Color
    //     0x28c768: add             x2, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x28c76c: ldr             x2, [x2, #0x710]
    // 0x28c770: r3 = -1
    //     0x28c770: mov             x3, #-1
    // 0x28c774: stur            x0, [fp, #-8]
    // 0x28c778: r0 = BulletColorShopItem()
    //     0x28c778: bl              #0x28ca44  ; [package:ricochlime/utils/shop_items.dart] BulletColorShopItem::BulletColorShopItem
    // 0x28c77c: r0 = BulletColorShopItem()
    //     0x28c77c: bl              #0x28cb44  ; AllocateBulletColorShopItemStub -> BulletColorShopItem (size=0x1c)
    // 0x28c780: mov             x1, x0
    // 0x28c784: r2 = Instance_Color
    //     0x28c784: add             x2, PP, #8, lsl #12  ; [pp+0x8d00] Obj!Color@5ce6e1
    //     0x28c788: ldr             x2, [x2, #0xd00]
    // 0x28c78c: r3 = -1
    //     0x28c78c: mov             x3, #-1
    // 0x28c790: stur            x0, [fp, #-0x10]
    // 0x28c794: r0 = BulletColorShopItem()
    //     0x28c794: bl              #0x28ca44  ; [package:ricochlime/utils/shop_items.dart] BulletColorShopItem::BulletColorShopItem
    // 0x28c798: r1 = Null
    //     0x28c798: mov             x1, NULL
    // 0x28c79c: r2 = 4
    //     0x28c79c: mov             x2, #4
    // 0x28c7a0: r0 = AllocateArray()
    //     0x28c7a0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x28c7a4: mov             x2, x0
    // 0x28c7a8: ldur            x0, [fp, #-8]
    // 0x28c7ac: stur            x2, [fp, #-0x18]
    // 0x28c7b0: StoreField: r2->field_f = r0
    //     0x28c7b0: stur            w0, [x2, #0xf]
    // 0x28c7b4: ldur            x0, [fp, #-0x10]
    // 0x28c7b8: StoreField: r2->field_13 = r0
    //     0x28c7b8: stur            w0, [x2, #0x13]
    // 0x28c7bc: r1 = Null
    //     0x28c7bc: mov             x1, NULL
    // 0x28c7c0: r0 = AllocateGrowableArray()
    //     0x28c7c0: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x28c7c4: mov             x3, x0
    // 0x28c7c8: ldur            x0, [fp, #-0x18]
    // 0x28c7cc: stur            x3, [fp, #-8]
    // 0x28c7d0: StoreField: r3->field_f = r0
    //     0x28c7d0: stur            w0, [x3, #0xf]
    // 0x28c7d4: r0 = 4
    //     0x28c7d4: mov             x0, #4
    // 0x28c7d8: StoreField: r3->field_b = r0
    //     0x28c7d8: stur            w0, [x3, #0xb]
    // 0x28c7dc: r1 = <Color>
    //     0x28c7dc: add             x1, PP, #8, lsl #12  ; [pp+0x8d08] TypeArguments: <Color>
    //     0x28c7e0: ldr             x1, [x1, #0xd08]
    // 0x28c7e4: r2 = 20
    //     0x28c7e4: mov             x2, #0x14
    // 0x28c7e8: r0 = AllocateArray()
    //     0x28c7e8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x28c7ec: stur            x0, [fp, #-0x18]
    // 0x28c7f0: r16 = Instance_MaterialColor
    //     0x28c7f0: add             x16, PP, #8, lsl #12  ; [pp+0x8d10] Obj!MaterialColor@5cfe71
    //     0x28c7f4: ldr             x16, [x16, #0xd10]
    // 0x28c7f8: StoreField: r0->field_f = r16
    //     0x28c7f8: stur            w16, [x0, #0xf]
    // 0x28c7fc: r16 = Instance_Color
    //     0x28c7fc: add             x16, PP, #8, lsl #12  ; [pp+0x8d18] Obj!Color@5ce4d1
    //     0x28c800: ldr             x16, [x16, #0xd18]
    // 0x28c804: StoreField: r0->field_13 = r16
    //     0x28c804: stur            w16, [x0, #0x13]
    // 0x28c808: r16 = Instance_MaterialColor
    //     0x28c808: add             x16, PP, #8, lsl #12  ; [pp+0x8d20] Obj!MaterialColor@5cfe31
    //     0x28c80c: ldr             x16, [x16, #0xd20]
    // 0x28c810: ArrayStore: r0[0] = r16  ; List_4
    //     0x28c810: stur            w16, [x0, #0x17]
    // 0x28c814: r16 = Instance_MaterialColor
    //     0x28c814: add             x16, PP, #8, lsl #12  ; [pp+0x8d28] Obj!MaterialColor@5cfdf1
    //     0x28c818: ldr             x16, [x16, #0xd28]
    // 0x28c81c: StoreField: r0->field_1b = r16
    //     0x28c81c: stur            w16, [x0, #0x1b]
    // 0x28c820: r16 = Instance_MaterialColor
    //     0x28c820: add             x16, PP, #8, lsl #12  ; [pp+0x8d30] Obj!MaterialColor@5cfdb1
    //     0x28c824: ldr             x16, [x16, #0xd30]
    // 0x28c828: StoreField: r0->field_1f = r16
    //     0x28c828: stur            w16, [x0, #0x1f]
    // 0x28c82c: r16 = Instance_MaterialColor
    //     0x28c82c: add             x16, PP, #8, lsl #12  ; [pp+0x8d38] Obj!MaterialColor@5cfd71
    //     0x28c830: ldr             x16, [x16, #0xd38]
    // 0x28c834: StoreField: r0->field_23 = r16
    //     0x28c834: stur            w16, [x0, #0x23]
    // 0x28c838: r16 = Instance_MaterialColor
    //     0x28c838: add             x16, PP, #8, lsl #12  ; [pp+0x8d40] Obj!MaterialColor@5cfd31
    //     0x28c83c: ldr             x16, [x16, #0xd40]
    // 0x28c840: StoreField: r0->field_27 = r16
    //     0x28c840: stur            w16, [x0, #0x27]
    // 0x28c844: r16 = Instance_MaterialColor
    //     0x28c844: add             x16, PP, #8, lsl #12  ; [pp+0x8d48] Obj!MaterialColor@5cfcf1
    //     0x28c848: ldr             x16, [x16, #0xd48]
    // 0x28c84c: StoreField: r0->field_2b = r16
    //     0x28c84c: stur            w16, [x0, #0x2b]
    // 0x28c850: r16 = Instance_MaterialColor
    //     0x28c850: add             x16, PP, #8, lsl #12  ; [pp+0x8d50] Obj!MaterialColor@5cfcb1
    //     0x28c854: ldr             x16, [x16, #0xd50]
    // 0x28c858: StoreField: r0->field_2f = r16
    //     0x28c858: stur            w16, [x0, #0x2f]
    // 0x28c85c: r16 = Instance_MaterialColor
    //     0x28c85c: add             x16, PP, #8, lsl #12  ; [pp+0x8d58] Obj!MaterialColor@5cfc71
    //     0x28c860: ldr             x16, [x16, #0xd58]
    // 0x28c864: StoreField: r0->field_33 = r16
    //     0x28c864: stur            w16, [x0, #0x33]
    // 0x28c868: ldur            x1, [fp, #-8]
    // 0x28c86c: r2 = 0
    //     0x28c86c: mov             x2, #0
    // 0x28c870: CheckStackOverflow
    //     0x28c870: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28c874: cmp             SP, x16
    //     0x28c878: b.ls            #0x28ca1c
    // 0x28c87c: cmp             x2, #0xa
    // 0x28c880: b.ge            #0x28c9d4
    // 0x28c884: ArrayLoad: r3 = r0[r2]  ; Unknown_4
    //     0x28c884: add             x16, x0, x2, lsl #2
    //     0x28c888: ldur            w3, [x16, #0xf]
    // 0x28c88c: DecompressPointer r3
    //     0x28c88c: add             x3, x3, HEAP, lsl #32
    // 0x28c890: stur            x3, [fp, #-0x10]
    // 0x28c894: add             x4, x2, #1
    // 0x28c898: stur            x4, [fp, #-0x20]
    // 0x28c89c: r0 = BulletColorShopItem()
    //     0x28c89c: bl              #0x28cb44  ; AllocateBulletColorShopItemStub -> BulletColorShopItem (size=0x1c)
    // 0x28c8a0: mov             x3, x0
    // 0x28c8a4: ldur            x0, [fp, #-0x10]
    // 0x28c8a8: stur            x3, [fp, #-0x28]
    // 0x28c8ac: ArrayStore: r3[0] = r0  ; List_4
    //     0x28c8ac: stur            w0, [x3, #0x17]
    // 0x28c8b0: r1 = Null
    //     0x28c8b0: mov             x1, NULL
    // 0x28c8b4: r2 = 4
    //     0x28c8b4: mov             x2, #4
    // 0x28c8b8: r0 = AllocateArray()
    //     0x28c8b8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x28c8bc: mov             x2, x0
    // 0x28c8c0: stur            x2, [fp, #-0x30]
    // 0x28c8c4: r16 = "bullet"
    //     0x28c8c4: add             x16, PP, #8, lsl #12  ; [pp+0x8d60] "bullet"
    //     0x28c8c8: ldr             x16, [x16, #0xd60]
    // 0x28c8cc: StoreField: r2->field_f = r16
    //     0x28c8cc: stur            w16, [x2, #0xf]
    // 0x28c8d0: ldur            x1, [fp, #-0x10]
    // 0x28c8d4: r0 = LoadClassIdInstr(r1)
    //     0x28c8d4: ldur            x0, [x1, #-1]
    //     0x28c8d8: ubfx            x0, x0, #0xc, #0x14
    // 0x28c8dc: r0 = GDT[cid_x0 + -0xa73]()
    //     0x28c8dc: sub             lr, x0, #0xa73
    //     0x28c8e0: ldr             lr, [x21, lr, lsl #3]
    //     0x28c8e4: blr             lr
    // 0x28c8e8: mov             x2, x0
    // 0x28c8ec: r0 = BoxInt64Instr(r2)
    //     0x28c8ec: sbfiz           x0, x2, #1, #0x1f
    //     0x28c8f0: cmp             x2, x0, asr #1
    //     0x28c8f4: b.eq            #0x28c900
    //     0x28c8f8: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x28c8fc: stur            x2, [x0, #7]
    // 0x28c900: mov             x1, x0
    // 0x28c904: r0 = _toPow2String()
    //     0x28c904: bl              #0x280710  ; [dart:core] _IntegerImplementation::_toPow2String
    // 0x28c908: ldur            x1, [fp, #-0x30]
    // 0x28c90c: ArrayStore: r1[1] = r0  ; List_4
    //     0x28c90c: add             x25, x1, #0x13
    //     0x28c910: str             w0, [x25]
    //     0x28c914: tbz             w0, #0, #0x28c930
    //     0x28c918: ldurb           w16, [x1, #-1]
    //     0x28c91c: ldurb           w17, [x0, #-1]
    //     0x28c920: and             x16, x17, x16, lsr #2
    //     0x28c924: tst             x16, HEAP, lsr #32
    //     0x28c928: b.eq            #0x28c930
    //     0x28c92c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x28c930: ldur            x16, [fp, #-0x30]
    // 0x28c934: str             x16, [SP]
    // 0x28c938: r0 = _interpolate()
    //     0x28c938: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x28c93c: ldur            x1, [fp, #-0x28]
    // 0x28c940: mov             x2, x0
    // 0x28c944: r3 = 200
    //     0x28c944: mov             x3, #0xc8
    // 0x28c948: r0 = ShopItem()
    //     0x28c948: bl              #0x28b2e0  ; [package:ricochlime/utils/shop_items.dart] ShopItem::ShopItem
    // 0x28c94c: ldur            x0, [fp, #-8]
    // 0x28c950: LoadField: r1 = r0->field_b
    //     0x28c950: ldur            w1, [x0, #0xb]
    // 0x28c954: LoadField: r2 = r0->field_f
    //     0x28c954: ldur            w2, [x0, #0xf]
    // 0x28c958: DecompressPointer r2
    //     0x28c958: add             x2, x2, HEAP, lsl #32
    // 0x28c95c: LoadField: r3 = r2->field_b
    //     0x28c95c: ldur            w3, [x2, #0xb]
    // 0x28c960: r2 = LoadInt32Instr(r1)
    //     0x28c960: sbfx            x2, x1, #1, #0x1f
    // 0x28c964: stur            x2, [fp, #-0x38]
    // 0x28c968: r1 = LoadInt32Instr(r3)
    //     0x28c968: sbfx            x1, x3, #1, #0x1f
    // 0x28c96c: cmp             x2, x1
    // 0x28c970: b.ne            #0x28c97c
    // 0x28c974: mov             x1, x0
    // 0x28c978: r0 = _growToNextCapacity()
    //     0x28c978: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x28c97c: ldur            x3, [fp, #-8]
    // 0x28c980: ldur            x2, [fp, #-0x38]
    // 0x28c984: add             x0, x2, #1
    // 0x28c988: lsl             x1, x0, #1
    // 0x28c98c: StoreField: r3->field_b = r1
    //     0x28c98c: stur            w1, [x3, #0xb]
    // 0x28c990: LoadField: r1 = r3->field_f
    //     0x28c990: ldur            w1, [x3, #0xf]
    // 0x28c994: DecompressPointer r1
    //     0x28c994: add             x1, x1, HEAP, lsl #32
    // 0x28c998: ldur            x0, [fp, #-0x28]
    // 0x28c99c: ArrayStore: r1[r2] = r0  ; List_4
    //     0x28c99c: add             x25, x1, x2, lsl #2
    //     0x28c9a0: add             x25, x25, #0xf
    //     0x28c9a4: str             w0, [x25]
    //     0x28c9a8: tbz             w0, #0, #0x28c9c4
    //     0x28c9ac: ldurb           w16, [x1, #-1]
    //     0x28c9b0: ldurb           w17, [x0, #-1]
    //     0x28c9b4: and             x16, x17, x16, lsr #2
    //     0x28c9b8: tst             x16, HEAP, lsr #32
    //     0x28c9bc: b.eq            #0x28c9c4
    //     0x28c9c0: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x28c9c4: ldur            x2, [fp, #-0x20]
    // 0x28c9c8: ldur            x0, [fp, #-0x18]
    // 0x28c9cc: mov             x1, x3
    // 0x28c9d0: b               #0x28c870
    // 0x28c9d4: mov             x3, x1
    // 0x28c9d8: r16 = false
    //     0x28c9d8: add             x16, NULL, #0x30  ; false
    // 0x28c9dc: str             x16, [SP]
    // 0x28c9e0: mov             x2, x3
    // 0x28c9e4: r1 = <BulletColorShopItem>
    //     0x28c9e4: add             x1, PP, #8, lsl #12  ; [pp+0x8d68] TypeArguments: <BulletColorShopItem>
    //     0x28c9e8: ldr             x1, [x1, #0xd68]
    // 0x28c9ec: r4 = const [0, 0x3, 0x1, 0x2, growable, 0x2, null]
    //     0x28c9ec: ldr             x4, [PP, #0x7288]  ; [pp+0x7288] List(7) [0, 0x3, 0x1, 0x2, "growable", 0x2, Null]
    // 0x28c9f0: r0 = List.from()
    //     0x28c9f0: bl              #0x28b068  ; [dart:core] List::List.from
    // 0x28c9f4: r16 = <BulletColorShopItem>
    //     0x28c9f4: add             x16, PP, #8, lsl #12  ; [pp+0x8d68] TypeArguments: <BulletColorShopItem>
    //     0x28c9f8: ldr             x16, [x16, #0xd68]
    // 0x28c9fc: stp             x0, x16, [SP]
    // 0x28ca00: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x28ca00: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x28ca04: r0 = makeFixedListUnmodifiable()
    //     0x28ca04: bl              #0x28afe0  ; [dart:_internal] ::makeFixedListUnmodifiable
    // 0x28ca08: LeaveFrame
    //     0x28ca08: mov             SP, fp
    //     0x28ca0c: ldp             fp, lr, [SP], #0x10
    // 0x28ca10: ret
    //     0x28ca10: ret             
    // 0x28ca14: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28ca14: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28ca18: b               #0x28c760
    // 0x28ca1c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28ca1c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28ca20: b               #0x28c87c
  }
  static _ preloadSprites(/* No info */) {
    // ** addr: 0x3c4ca0, size: 0x40
    // 0x3c4ca0: EnterFrame
    //     0x3c4ca0: stp             fp, lr, [SP, #-0x10]!
    //     0x3c4ca4: mov             fp, SP
    // 0x3c4ca8: CheckStackOverflow
    //     0x3c4ca8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c4cac: cmp             SP, x16
    //     0x3c4cb0: b.ls            #0x3c4cd8
    // 0x3c4cb4: LoadField: r0 = r1->field_47
    //     0x3c4cb4: ldur            w0, [x1, #0x47]
    // 0x3c4cb8: DecompressPointer r0
    //     0x3c4cb8: add             x0, x0, HEAP, lsl #32
    // 0x3c4cbc: mov             x1, x0
    // 0x3c4cc0: r2 = "bullet_shapes.png"
    //     0x3c4cc0: add             x2, PP, #8, lsl #12  ; [pp+0x86f8] "bullet_shapes.png"
    //     0x3c4cc4: ldr             x2, [x2, #0x6f8]
    // 0x3c4cc8: r0 = load()
    //     0x3c4cc8: bl              #0x3c4ce0  ; [package:flame/src/cache/images.dart] Images::load
    // 0x3c4ccc: LeaveFrame
    //     0x3c4ccc: mov             SP, fp
    //     0x3c4cd0: ldp             fp, lr, [SP], #0x10
    // 0x3c4cd4: ret
    //     0x3c4cd4: ret             
    // 0x3c4cd8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c4cd8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c4cdc: b               #0x3c4cb4
  }
  get _ defaultBulletShape(/* No info */) {
    // ** addr: 0x3c950c, size: 0x84
    // 0x3c950c: EnterFrame
    //     0x3c950c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9510: mov             fp, SP
    // 0x3c9514: CheckStackOverflow
    //     0x3c9514: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c9518: cmp             SP, x16
    //     0x3c951c: b.ls            #0x3c9584
    // 0x3c9520: r0 = LoadStaticField(0xcd8)
    //     0x3c9520: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c9524: ldr             x0, [x0, #0x19b0]
    // 0x3c9528: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c952c: cmp             w0, w16
    // 0x3c9530: b.ne            #0x3c9540
    // 0x3c9534: r2 = bulletShapes
    //     0x3c9534: add             x2, PP, #8, lsl #12  ; [pp+0x83e8] Field <ShopItems.bulletShapes>: static late final (offset: 0xcd8)
    //     0x3c9538: ldr             x2, [x2, #0x3e8]
    // 0x3c953c: r0 = InitLateFinalStaticField()
    //     0x3c953c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c9540: mov             x2, x0
    // 0x3c9544: LoadField: r0 = r2->field_b
    //     0x3c9544: ldur            w0, [x2, #0xb]
    // 0x3c9548: r1 = LoadInt32Instr(r0)
    //     0x3c9548: sbfx            x1, x0, #1, #0x1f
    // 0x3c954c: cmp             x1, #0
    // 0x3c9550: b.le            #0x3c9578
    // 0x3c9554: mov             x0, x1
    // 0x3c9558: r1 = 0
    //     0x3c9558: mov             x1, #0
    // 0x3c955c: cmp             x1, x0
    // 0x3c9560: b.hs            #0x3c958c
    // 0x3c9564: LoadField: r0 = r2->field_f
    //     0x3c9564: ldur            w0, [x2, #0xf]
    // 0x3c9568: DecompressPointer r0
    //     0x3c9568: add             x0, x0, HEAP, lsl #32
    // 0x3c956c: LeaveFrame
    //     0x3c956c: mov             SP, fp
    //     0x3c9570: ldp             fp, lr, [SP], #0x10
    // 0x3c9574: ret
    //     0x3c9574: ret             
    // 0x3c9578: r0 = noElement()
    //     0x3c9578: bl              #0x2390a8  ; [dart:_internal] IterableElementError::noElement
    // 0x3c957c: r0 = Throw()
    //     0x3c957c: bl              #0x5827dc  ; ThrowStub
    // 0x3c9580: brk             #0
    // 0x3c9584: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c9584: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c9588: b               #0x3c9520
    // 0x3c958c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3c958c: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  static _ getBulletShape(/* No info */) {
    // ** addr: 0x3c9590, size: 0x9c
    // 0x3c9590: EnterFrame
    //     0x3c9590: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9594: mov             fp, SP
    // 0x3c9598: AllocStack(0x20)
    //     0x3c9598: sub             SP, SP, #0x20
    // 0x3c959c: SetupParameters(dynamic _ /* r1 => r1, fp-0x8 */)
    //     0x3c959c: stur            x1, [fp, #-8]
    // 0x3c95a0: CheckStackOverflow
    //     0x3c95a0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c95a4: cmp             SP, x16
    //     0x3c95a8: b.ls            #0x3c9624
    // 0x3c95ac: r1 = 1
    //     0x3c95ac: mov             x1, #1
    // 0x3c95b0: r0 = AllocateContext()
    //     0x3c95b0: bl              #0x5834e8  ; AllocateContextStub
    // 0x3c95b4: mov             x1, x0
    // 0x3c95b8: ldur            x0, [fp, #-8]
    // 0x3c95bc: stur            x1, [fp, #-0x10]
    // 0x3c95c0: StoreField: r1->field_f = r0
    //     0x3c95c0: stur            w0, [x1, #0xf]
    // 0x3c95c4: r0 = LoadStaticField(0xcd8)
    //     0x3c95c4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c95c8: ldr             x0, [x0, #0x19b0]
    // 0x3c95cc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c95d0: cmp             w0, w16
    // 0x3c95d4: b.ne            #0x3c95e4
    // 0x3c95d8: r2 = bulletShapes
    //     0x3c95d8: add             x2, PP, #8, lsl #12  ; [pp+0x83e8] Field <ShopItems.bulletShapes>: static late final (offset: 0xcd8)
    //     0x3c95dc: ldr             x2, [x2, #0x3e8]
    // 0x3c95e0: r0 = InitLateFinalStaticField()
    //     0x3c95e0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c95e4: ldur            x2, [fp, #-0x10]
    // 0x3c95e8: r1 = Function '<anonymous closure>': static.
    //     0x3c95e8: add             x1, PP, #0x15, lsl #12  ; [pp+0x15da8] AnonymousClosure: static (0x3c962c), in [package:ricochlime/utils/shop_items.dart] ShopItems::getBulletShape (0x3c9590)
    //     0x3c95ec: ldr             x1, [x1, #0xda8]
    // 0x3c95f0: stur            x0, [fp, #-8]
    // 0x3c95f4: r0 = AllocateClosure()
    //     0x3c95f4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c95f8: ldur            x1, [fp, #-8]
    // 0x3c95fc: mov             x2, x0
    // 0x3c9600: r0 = where()
    //     0x3c9600: bl              #0x4367bc  ; [dart:_compact_hash] __Set&_HashVMBase&SetMixin::where
    // 0x3c9604: r16 = <BulletShapeShopItem>
    //     0x3c9604: add             x16, PP, #8, lsl #12  ; [pp+0x86e8] TypeArguments: <BulletShapeShopItem>
    //     0x3c9608: ldr             x16, [x16, #0x6e8]
    // 0x3c960c: stp             x0, x16, [SP]
    // 0x3c9610: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x3c9610: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x3c9614: r0 = IterableExtensions.firstOrNull()
    //     0x3c9614: bl              #0x2a28dc  ; [dart:collection] ::IterableExtensions.firstOrNull
    // 0x3c9618: LeaveFrame
    //     0x3c9618: mov             SP, fp
    //     0x3c961c: ldp             fp, lr, [SP], #0x10
    // 0x3c9620: ret
    //     0x3c9620: ret             
    // 0x3c9624: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c9624: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c9628: b               #0x3c95ac
  }
  [closure] static bool <anonymous closure>(dynamic, BulletShapeShopItem) {
    // ** addr: 0x3c962c, size: 0x68
    // 0x3c962c: EnterFrame
    //     0x3c962c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c9630: mov             fp, SP
    // 0x3c9634: AllocStack(0x10)
    //     0x3c9634: sub             SP, SP, #0x10
    // 0x3c9638: SetupParameters([dynamic _ /* r0 */])
    //     0x3c9638: ldr             x0, [fp, #0x18]
    //     0x3c963c: ldur            w1, [x0, #0x17]
    //     0x3c9640: add             x1, x1, HEAP, lsl #32
    // 0x3c9644: CheckStackOverflow
    //     0x3c9644: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c9648: cmp             SP, x16
    //     0x3c964c: b.ls            #0x3c968c
    // 0x3c9650: ldr             x0, [fp, #0x10]
    // 0x3c9654: LoadField: r2 = r0->field_7
    //     0x3c9654: ldur            w2, [x0, #7]
    // 0x3c9658: DecompressPointer r2
    //     0x3c9658: add             x2, x2, HEAP, lsl #32
    // 0x3c965c: LoadField: r0 = r1->field_f
    //     0x3c965c: ldur            w0, [x1, #0xf]
    // 0x3c9660: DecompressPointer r0
    //     0x3c9660: add             x0, x0, HEAP, lsl #32
    // 0x3c9664: r1 = LoadClassIdInstr(r2)
    //     0x3c9664: ldur            x1, [x2, #-1]
    //     0x3c9668: ubfx            x1, x1, #0xc, #0x14
    // 0x3c966c: stp             x0, x2, [SP]
    // 0x3c9670: mov             x0, x1
    // 0x3c9674: mov             lr, x0
    // 0x3c9678: ldr             lr, [x21, lr, lsl #3]
    // 0x3c967c: blr             lr
    // 0x3c9680: LeaveFrame
    //     0x3c9680: mov             SP, fp
    //     0x3c9684: ldp             fp, lr, [SP], #0x10
    // 0x3c9688: ret
    //     0x3c9688: ret             
    // 0x3c968c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c968c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c9690: b               #0x3c9650
  }
  static List<ShopItem> allItems() {
    // ** addr: 0x401bbc, size: 0x90
    // 0x401bbc: EnterFrame
    //     0x401bbc: stp             fp, lr, [SP, #-0x10]!
    //     0x401bc0: mov             fp, SP
    // 0x401bc4: AllocStack(0x8)
    //     0x401bc4: sub             SP, SP, #8
    // 0x401bc8: CheckStackOverflow
    //     0x401bc8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x401bcc: cmp             SP, x16
    //     0x401bd0: b.ls            #0x401c44
    // 0x401bd4: r0 = LoadStaticField(0xcd4)
    //     0x401bd4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x401bd8: ldr             x0, [x0, #0x19a8]
    // 0x401bdc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401be0: cmp             w0, w16
    // 0x401be4: b.ne            #0x401bf4
    // 0x401be8: r2 = bulletColors
    //     0x401be8: add             x2, PP, #8, lsl #12  ; [pp+0x83c8] Field <ShopItems.bulletColors>: static late final (offset: 0xcd4)
    //     0x401bec: ldr             x2, [x2, #0x3c8]
    // 0x401bf0: r0 = InitLateFinalStaticField()
    //     0x401bf0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x401bf4: mov             x2, x0
    // 0x401bf8: r1 = <ShopItem>
    //     0x401bf8: add             x1, PP, #0x11, lsl #12  ; [pp+0x11128] TypeArguments: <ShopItem>
    //     0x401bfc: ldr             x1, [x1, #0x128]
    // 0x401c00: r0 = _GrowableList._ofArray()
    //     0x401c00: bl              #0x2379c8  ; [dart:core] _GrowableList::_GrowableList._ofArray
    // 0x401c04: stur            x0, [fp, #-8]
    // 0x401c08: r0 = LoadStaticField(0xcd8)
    //     0x401c08: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x401c0c: ldr             x0, [x0, #0x19b0]
    // 0x401c10: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401c14: cmp             w0, w16
    // 0x401c18: b.ne            #0x401c28
    // 0x401c1c: r2 = bulletShapes
    //     0x401c1c: add             x2, PP, #8, lsl #12  ; [pp+0x83e8] Field <ShopItems.bulletShapes>: static late final (offset: 0xcd8)
    //     0x401c20: ldr             x2, [x2, #0x3e8]
    // 0x401c24: r0 = InitLateFinalStaticField()
    //     0x401c24: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x401c28: ldur            x1, [fp, #-8]
    // 0x401c2c: mov             x2, x0
    // 0x401c30: r0 = addAll()
    //     0x401c30: bl              #0x237fd8  ; [dart:core] _GrowableList::addAll
    // 0x401c34: ldur            x0, [fp, #-8]
    // 0x401c38: LeaveFrame
    //     0x401c38: mov             SP, fp
    //     0x401c3c: ldp             fp, lr, [SP], #0x10
    // 0x401c40: ret
    //     0x401c40: ret             
    // 0x401c44: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x401c44: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x401c48: b               #0x401bd4
  }
}

// class id: 1527, size: 0x14, field offset: 0xc
//   const constructor, 
class BulletPainter extends CustomPainter {

  _ paint(/* No info */) {
    // ** addr: 0x4b7488, size: 0x120
    // 0x4b7488: EnterFrame
    //     0x4b7488: stp             fp, lr, [SP, #-0x10]!
    //     0x4b748c: mov             fp, SP
    // 0x4b7490: AllocStack(0x50)
    //     0x4b7490: sub             SP, SP, #0x50
    // 0x4b7494: d0 = 2.000000
    //     0x4b7494: fmov            d0, #2.00000000
    // 0x4b7498: mov             x0, x1
    // 0x4b749c: stur            x1, [fp, #-8]
    // 0x4b74a0: mov             x1, x2
    // 0x4b74a4: stur            x2, [fp, #-0x10]
    // 0x4b74a8: CheckStackOverflow
    //     0x4b74a8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4b74ac: cmp             SP, x16
    //     0x4b74b0: b.ls            #0x4b7580
    // 0x4b74b4: LoadField: d1 = r3->field_7
    //     0x4b74b4: ldur            d1, [x3, #7]
    // 0x4b74b8: stur            d1, [fp, #-0x38]
    // 0x4b74bc: fdiv            d2, d1, d0
    // 0x4b74c0: stur            d2, [fp, #-0x30]
    // 0x4b74c4: LoadField: d3 = r3->field_f
    //     0x4b74c4: ldur            d3, [x3, #0xf]
    // 0x4b74c8: stur            d3, [fp, #-0x28]
    // 0x4b74cc: fdiv            d4, d3, d0
    // 0x4b74d0: stur            d4, [fp, #-0x20]
    // 0x4b74d4: r0 = Vector2()
    //     0x4b74d4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x4b74d8: r4 = 4
    //     0x4b74d8: mov             x4, #4
    // 0x4b74dc: stur            x0, [fp, #-0x18]
    // 0x4b74e0: r0 = AllocateFloat32Array()
    //     0x4b74e0: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x4b74e4: ldur            x2, [fp, #-0x18]
    // 0x4b74e8: StoreField: r2->field_7 = r0
    //     0x4b74e8: stur            w0, [x2, #7]
    // 0x4b74ec: ldur            d0, [fp, #-0x20]
    // 0x4b74f0: fcvt            s1, d0
    // 0x4b74f4: StoreField: r0->field_1b = d1
    //     0x4b74f4: stur            s1, [x0, #0x1b]
    // 0x4b74f8: ldur            d0, [fp, #-0x30]
    // 0x4b74fc: fcvt            s1, d0
    // 0x4b7500: ArrayStore: r0[0] = d1  ; List_8
    //     0x4b7500: stur            s1, [x0, #0x17]
    // 0x4b7504: ldur            d0, [fp, #-0x38]
    // 0x4b7508: ldur            d1, [fp, #-0x28]
    // 0x4b750c: fmin            v2.2d, v0.2d, v1.2d
    // 0x4b7510: d0 = 2.000000
    //     0x4b7510: fmov            d0, #2.00000000
    // 0x4b7514: fdiv            d1, d2, d0
    // 0x4b7518: ldur            x0, [fp, #-8]
    // 0x4b751c: LoadField: r1 = r0->field_b
    //     0x4b751c: ldur            w1, [x0, #0xb]
    // 0x4b7520: DecompressPointer r1
    //     0x4b7520: add             x1, x1, HEAP, lsl #32
    // 0x4b7524: LoadField: r3 = r0->field_f
    //     0x4b7524: ldur            w3, [x0, #0xf]
    // 0x4b7528: DecompressPointer r3
    //     0x4b7528: add             x3, x3, HEAP, lsl #32
    // 0x4b752c: r0 = inline_Allocate_Double()
    //     0x4b752c: ldp             x0, x4, [THR, #0x60]  ; THR::top
    //     0x4b7530: add             x0, x0, #0x10
    //     0x4b7534: cmp             x4, x0
    //     0x4b7538: b.ls            #0x4b7588
    //     0x4b753c: str             x0, [THR, #0x60]  ; THR::top
    //     0x4b7540: sub             x0, x0, #0xf
    //     0x4b7544: mov             x4, #0xe19c
    //     0x4b7548: movk            x4, #3, lsl #16
    //     0x4b754c: stur            x4, [x0, #-1]
    // 0x4b7550: dmb             ishst
    // 0x4b7554: StoreField: r0->field_7 = d1
    //     0x4b7554: stur            d1, [x0, #7]
    // 0x4b7558: stp             x1, x0, [SP, #8]
    // 0x4b755c: str             x3, [SP]
    // 0x4b7560: ldur            x1, [fp, #-0x10]
    // 0x4b7564: r4 = const [0, 0x5, 0x3, 0x2, bulletColor, 0x3, bulletShape, 0x4, radius, 0x2, null]
    //     0x4b7564: add             x4, PP, #0x15, lsl #12  ; [pp+0x15d28] List(11) [0, 0x5, 0x3, 0x2, "bulletColor", 0x3, "bulletShape", 0x4, "radius", 0x2, Null]
    //     0x4b7568: ldr             x4, [x4, #0xd28]
    // 0x4b756c: r0 = drawBullet()
    //     0x4b756c: bl              #0x3c8c54  ; [package:ricochlime/flame/components/bullet.dart] Bullet::drawBullet
    // 0x4b7570: r0 = Null
    //     0x4b7570: mov             x0, NULL
    // 0x4b7574: LeaveFrame
    //     0x4b7574: mov             SP, fp
    //     0x4b7578: ldp             fp, lr, [SP], #0x10
    // 0x4b757c: ret
    //     0x4b757c: ret             
    // 0x4b7580: r0 = StackOverflowSharedWithFPURegs()
    //     0x4b7580: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x4b7584: b               #0x4b74b4
    // 0x4b7588: SaveReg d1
    //     0x4b7588: str             q1, [SP, #-0x10]!
    // 0x4b758c: stp             x2, x3, [SP, #-0x10]!
    // 0x4b7590: SaveReg r1
    //     0x4b7590: str             x1, [SP, #-8]!
    // 0x4b7594: r0 = AllocateDouble()
    //     0x4b7594: bl              #0x584528  ; AllocateDoubleStub
    // 0x4b7598: RestoreReg r1
    //     0x4b7598: ldr             x1, [SP], #8
    // 0x4b759c: ldp             x2, x3, [SP], #0x10
    // 0x4b75a0: RestoreReg d1
    //     0x4b75a0: ldr             q1, [SP], #0x10
    // 0x4b75a4: b               #0x4b7554
  }
  _ shouldRepaint(/* No info */) {
    // ** addr: 0x4d2f10, size: 0xe0
    // 0x4d2f10: EnterFrame
    //     0x4d2f10: stp             fp, lr, [SP, #-0x10]!
    //     0x4d2f14: mov             fp, SP
    // 0x4d2f18: AllocStack(0x20)
    //     0x4d2f18: sub             SP, SP, #0x20
    // 0x4d2f1c: SetupParameters(BulletPainter this /* r1 => r4, fp-0x8 */, dynamic _ /* r2 => r3, fp-0x10 */)
    //     0x4d2f1c: mov             x4, x1
    //     0x4d2f20: mov             x3, x2
    //     0x4d2f24: stur            x1, [fp, #-8]
    //     0x4d2f28: stur            x2, [fp, #-0x10]
    // 0x4d2f2c: CheckStackOverflow
    //     0x4d2f2c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4d2f30: cmp             SP, x16
    //     0x4d2f34: b.ls            #0x4d2fe8
    // 0x4d2f38: mov             x0, x3
    // 0x4d2f3c: r2 = Null
    //     0x4d2f3c: mov             x2, NULL
    // 0x4d2f40: r1 = Null
    //     0x4d2f40: mov             x1, NULL
    // 0x4d2f44: r4 = 60
    //     0x4d2f44: mov             x4, #0x3c
    // 0x4d2f48: branchIfSmi(r0, 0x4d2f54)
    //     0x4d2f48: tbz             w0, #0, #0x4d2f54
    // 0x4d2f4c: r4 = LoadClassIdInstr(r0)
    //     0x4d2f4c: ldur            x4, [x0, #-1]
    //     0x4d2f50: ubfx            x4, x4, #0xc, #0x14
    // 0x4d2f54: cmp             x4, #0x5f7
    // 0x4d2f58: b.eq            #0x4d2f70
    // 0x4d2f5c: r8 = BulletPainter
    //     0x4d2f5c: add             x8, PP, #0x15, lsl #12  ; [pp+0x15d10] Type: BulletPainter
    //     0x4d2f60: ldr             x8, [x8, #0xd10]
    // 0x4d2f64: r3 = Null
    //     0x4d2f64: add             x3, PP, #0x15, lsl #12  ; [pp+0x15d18] Null
    //     0x4d2f68: ldr             x3, [x3, #0xd18]
    // 0x4d2f6c: r0 = DefaultTypeTest()
    //     0x4d2f6c: bl              #0x582454  ; DefaultTypeTestStub
    // 0x4d2f70: ldur            x1, [fp, #-0x10]
    // 0x4d2f74: LoadField: r0 = r1->field_b
    //     0x4d2f74: ldur            w0, [x1, #0xb]
    // 0x4d2f78: DecompressPointer r0
    //     0x4d2f78: add             x0, x0, HEAP, lsl #32
    // 0x4d2f7c: ldur            x2, [fp, #-8]
    // 0x4d2f80: LoadField: r3 = r2->field_b
    //     0x4d2f80: ldur            w3, [x2, #0xb]
    // 0x4d2f84: DecompressPointer r3
    //     0x4d2f84: add             x3, x3, HEAP, lsl #32
    // 0x4d2f88: r4 = LoadClassIdInstr(r0)
    //     0x4d2f88: ldur            x4, [x0, #-1]
    //     0x4d2f8c: ubfx            x4, x4, #0xc, #0x14
    // 0x4d2f90: stp             x3, x0, [SP]
    // 0x4d2f94: mov             x0, x4
    // 0x4d2f98: mov             lr, x0
    // 0x4d2f9c: ldr             lr, [x21, lr, lsl #3]
    // 0x4d2fa0: blr             lr
    // 0x4d2fa4: tbz             w0, #4, #0x4d2fb0
    // 0x4d2fa8: r0 = true
    //     0x4d2fa8: add             x0, NULL, #0x20  ; true
    // 0x4d2fac: b               #0x4d2fdc
    // 0x4d2fb0: ldur            x2, [fp, #-8]
    // 0x4d2fb4: ldur            x1, [fp, #-0x10]
    // 0x4d2fb8: LoadField: r3 = r1->field_f
    //     0x4d2fb8: ldur            w3, [x1, #0xf]
    // 0x4d2fbc: DecompressPointer r3
    //     0x4d2fbc: add             x3, x3, HEAP, lsl #32
    // 0x4d2fc0: LoadField: r1 = r2->field_f
    //     0x4d2fc0: ldur            w1, [x2, #0xf]
    // 0x4d2fc4: DecompressPointer r1
    //     0x4d2fc4: add             x1, x1, HEAP, lsl #32
    // 0x4d2fc8: cmp             w3, w1
    // 0x4d2fcc: r16 = true
    //     0x4d2fcc: add             x16, NULL, #0x20  ; true
    // 0x4d2fd0: r17 = false
    //     0x4d2fd0: add             x17, NULL, #0x30  ; false
    // 0x4d2fd4: csel            x2, x16, x17, ne
    // 0x4d2fd8: mov             x0, x2
    // 0x4d2fdc: LeaveFrame
    //     0x4d2fdc: mov             SP, fp
    //     0x4d2fe0: ldp             fp, lr, [SP], #0x10
    // 0x4d2fe4: ret
    //     0x4d2fe4: ret             
    // 0x4d2fe8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4d2fe8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4d2fec: b               #0x4d2f38
  }
}

// class id: 3837, size: 0x14, field offset: 0x14
enum ShopItemState extends _Enum {

  _Mint field_8;
  _OneByteString field_10;

  _ _enumToString(/* No info */) {
    // ** addr: 0x4a040c, size: 0x64
    // 0x4a040c: EnterFrame
    //     0x4a040c: stp             fp, lr, [SP, #-0x10]!
    //     0x4a0410: mov             fp, SP
    // 0x4a0414: AllocStack(0x10)
    //     0x4a0414: sub             SP, SP, #0x10
    // 0x4a0418: SetupParameters(ShopItemState this /* r1 => r0, fp-0x8 */)
    //     0x4a0418: mov             x0, x1
    //     0x4a041c: stur            x1, [fp, #-8]
    // 0x4a0420: CheckStackOverflow
    //     0x4a0420: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a0424: cmp             SP, x16
    //     0x4a0428: b.ls            #0x4a0468
    // 0x4a042c: r1 = Null
    //     0x4a042c: mov             x1, NULL
    // 0x4a0430: r2 = 4
    //     0x4a0430: mov             x2, #4
    // 0x4a0434: r0 = AllocateArray()
    //     0x4a0434: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a0438: r16 = "ShopItemState."
    //     0x4a0438: add             x16, PP, #0xc, lsl #12  ; [pp+0xc1b8] "ShopItemState."
    //     0x4a043c: ldr             x16, [x16, #0x1b8]
    // 0x4a0440: StoreField: r0->field_f = r16
    //     0x4a0440: stur            w16, [x0, #0xf]
    // 0x4a0444: ldur            x1, [fp, #-8]
    // 0x4a0448: LoadField: r2 = r1->field_f
    //     0x4a0448: ldur            w2, [x1, #0xf]
    // 0x4a044c: DecompressPointer r2
    //     0x4a044c: add             x2, x2, HEAP, lsl #32
    // 0x4a0450: StoreField: r0->field_13 = r2
    //     0x4a0450: stur            w2, [x0, #0x13]
    // 0x4a0454: str             x0, [SP]
    // 0x4a0458: r0 = _interpolate()
    //     0x4a0458: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a045c: LeaveFrame
    //     0x4a045c: mov             SP, fp
    //     0x4a0460: ldp             fp, lr, [SP], #0x10
    // 0x4a0464: ret
    //     0x4a0464: ret             
    // 0x4a0468: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a0468: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a046c: b               #0x4a042c
  }
}
