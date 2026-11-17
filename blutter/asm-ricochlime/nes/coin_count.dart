// lib: , url: package:ricochlime/nes/coin_count.dart

// class id: 1049318, size: 0x8
class :: {
}

// class id: 2773, size: 0x10, field offset: 0xc
//   const constructor, 
class CoinCount extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x3feda0, size: 0x178
    // 0x3feda0: EnterFrame
    //     0x3feda0: stp             fp, lr, [SP, #-0x10]!
    //     0x3feda4: mov             fp, SP
    // 0x3feda8: AllocStack(0x18)
    //     0x3feda8: sub             SP, SP, #0x18
    // 0x3fedac: SetupParameters(CoinCount this /* r1 => r1, fp-0x8 */)
    //     0x3fedac: stur            x1, [fp, #-8]
    // 0x3fedb0: CheckStackOverflow
    //     0x3fedb0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3fedb4: cmp             SP, x16
    //     0x3fedb8: b.ls            #0x3fef10
    // 0x3fedbc: r1 = 1
    //     0x3fedbc: mov             x1, #1
    // 0x3fedc0: r0 = AllocateContext()
    //     0x3fedc0: bl              #0x5834e8  ; AllocateContextStub
    // 0x3fedc4: mov             x1, x0
    // 0x3fedc8: ldur            x0, [fp, #-8]
    // 0x3fedcc: stur            x1, [fp, #-0x10]
    // 0x3fedd0: StoreField: r1->field_f = r0
    //     0x3fedd0: stur            w0, [x1, #0xf]
    // 0x3fedd4: r0 = LoadStaticField(0xccc)
    //     0x3fedd4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3fedd8: ldr             x0, [x0, #0x1998]
    // 0x3feddc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3fede0: cmp             w0, w16
    // 0x3fede4: b.ne            #0x3fedf4
    // 0x3fede8: r2 = stows
    //     0x3fede8: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3fedec: ldr             x2, [x2, #0x310]
    // 0x3fedf0: r0 = InitLateFinalStaticField()
    //     0x3fedf0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3fedf4: LoadField: r2 = r0->field_2b
    //     0x3fedf4: ldur            w2, [x0, #0x2b]
    // 0x3fedf8: DecompressPointer r2
    //     0x3fedf8: add             x2, x2, HEAP, lsl #32
    // 0x3fedfc: stur            x2, [fp, #-8]
    // 0x3fee00: r1 = <int>
    //     0x3fee00: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x3fee04: r0 = ValueListenableBuilder()
    //     0x3fee04: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x3fee08: mov             x3, x0
    // 0x3fee0c: ldur            x0, [fp, #-8]
    // 0x3fee10: stur            x3, [fp, #-0x18]
    // 0x3fee14: StoreField: r3->field_f = r0
    //     0x3fee14: stur            w0, [x3, #0xf]
    // 0x3fee18: ldur            x2, [fp, #-0x10]
    // 0x3fee1c: r1 = Function '<anonymous closure>':.
    //     0x3fee1c: add             x1, PP, #0x13, lsl #12  ; [pp+0x137c8] AnonymousClosure: (0x3fef18), in [package:ricochlime/nes/coin_count.dart] CoinCount::build (0x3feda0)
    //     0x3fee20: ldr             x1, [x1, #0x7c8]
    // 0x3fee24: r0 = AllocateClosure()
    //     0x3fee24: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3fee28: mov             x1, x0
    // 0x3fee2c: ldur            x0, [fp, #-0x18]
    // 0x3fee30: StoreField: r0->field_13 = r1
    //     0x3fee30: stur            w1, [x0, #0x13]
    // 0x3fee34: r1 = Null
    //     0x3fee34: mov             x1, NULL
    // 0x3fee38: r2 = 6
    //     0x3fee38: mov             x2, #6
    // 0x3fee3c: r0 = AllocateArray()
    //     0x3fee3c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3fee40: mov             x2, x0
    // 0x3fee44: ldur            x0, [fp, #-0x18]
    // 0x3fee48: stur            x2, [fp, #-8]
    // 0x3fee4c: StoreField: r2->field_f = r0
    //     0x3fee4c: stur            w0, [x2, #0xf]
    // 0x3fee50: r16 = Instance_SizedBox
    //     0x3fee50: add             x16, PP, #0x13, lsl #12  ; [pp+0x137d0] Obj!SizedBox@5d83a1
    //     0x3fee54: ldr             x16, [x16, #0x7d0]
    // 0x3fee58: StoreField: r2->field_13 = r16
    //     0x3fee58: stur            w16, [x2, #0x13]
    // 0x3fee5c: r16 = Instance_CoinIcon
    //     0x3fee5c: add             x16, PP, #0x13, lsl #12  ; [pp+0x137d8] Obj!CoinIcon@5d8021
    //     0x3fee60: ldr             x16, [x16, #0x7d8]
    // 0x3fee64: ArrayStore: r2[0] = r16  ; List_4
    //     0x3fee64: stur            w16, [x2, #0x17]
    // 0x3fee68: r1 = <Widget>
    //     0x3fee68: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x3fee6c: r0 = AllocateGrowableArray()
    //     0x3fee6c: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3fee70: mov             x1, x0
    // 0x3fee74: ldur            x0, [fp, #-8]
    // 0x3fee78: stur            x1, [fp, #-0x10]
    // 0x3fee7c: StoreField: r1->field_f = r0
    //     0x3fee7c: stur            w0, [x1, #0xf]
    // 0x3fee80: r0 = 6
    //     0x3fee80: mov             x0, #6
    // 0x3fee84: StoreField: r1->field_b = r0
    //     0x3fee84: stur            w0, [x1, #0xb]
    // 0x3fee88: r0 = Row()
    //     0x3fee88: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x3fee8c: mov             x1, x0
    // 0x3fee90: r0 = Instance_Axis
    //     0x3fee90: ldr             x0, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x3fee94: stur            x1, [fp, #-8]
    // 0x3fee98: StoreField: r1->field_f = r0
    //     0x3fee98: stur            w0, [x1, #0xf]
    // 0x3fee9c: r0 = Instance_MainAxisAlignment
    //     0x3fee9c: add             x0, PP, #0x13, lsl #12  ; [pp+0x13778] Obj!MainAxisAlignment@5dabd1
    //     0x3feea0: ldr             x0, [x0, #0x778]
    // 0x3feea4: StoreField: r1->field_13 = r0
    //     0x3feea4: stur            w0, [x1, #0x13]
    // 0x3feea8: r0 = Instance_MainAxisSize
    //     0x3feea8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11398] Obj!MainAxisSize@5dac31
    //     0x3feeac: ldr             x0, [x0, #0x398]
    // 0x3feeb0: ArrayStore: r1[0] = r0  ; List_4
    //     0x3feeb0: stur            w0, [x1, #0x17]
    // 0x3feeb4: r0 = Instance_CrossAxisAlignment
    //     0x3feeb4: add             x0, PP, #0x13, lsl #12  ; [pp+0x137e0] Obj!CrossAxisAlignment@5daad1
    //     0x3feeb8: ldr             x0, [x0, #0x7e0]
    // 0x3feebc: StoreField: r1->field_1b = r0
    //     0x3feebc: stur            w0, [x1, #0x1b]
    // 0x3feec0: r0 = Instance_VerticalDirection
    //     0x3feec0: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x3feec4: ldr             x0, [x0, #0xfc8]
    // 0x3feec8: StoreField: r1->field_23 = r0
    //     0x3feec8: stur            w0, [x1, #0x23]
    // 0x3feecc: r0 = Instance_TextBaseline
    //     0x3feecc: add             x0, PP, #0x13, lsl #12  ; [pp+0x137e8] Obj!TextBaseline@5dbf31
    //     0x3feed0: ldr             x0, [x0, #0x7e8]
    // 0x3feed4: StoreField: r1->field_27 = r0
    //     0x3feed4: stur            w0, [x1, #0x27]
    // 0x3feed8: r0 = Instance_Clip
    //     0x3feed8: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x3feedc: ldr             x0, [x0, #0xfd0]
    // 0x3feee0: StoreField: r1->field_2b = r0
    //     0x3feee0: stur            w0, [x1, #0x2b]
    // 0x3feee4: StoreField: r1->field_2f = rZR
    //     0x3feee4: stur            xzr, [x1, #0x2f]
    // 0x3feee8: ldur            x0, [fp, #-0x10]
    // 0x3feeec: StoreField: r1->field_b = r0
    //     0x3feeec: stur            w0, [x1, #0xb]
    // 0x3feef0: r0 = IgnorePointer()
    //     0x3feef0: bl              #0x36a90c  ; AllocateIgnorePointerStub -> IgnorePointer (size=0x18)
    // 0x3feef4: r1 = true
    //     0x3feef4: add             x1, NULL, #0x20  ; true
    // 0x3feef8: StoreField: r0->field_f = r1
    //     0x3feef8: stur            w1, [x0, #0xf]
    // 0x3feefc: ldur            x1, [fp, #-8]
    // 0x3fef00: StoreField: r0->field_b = r1
    //     0x3fef00: stur            w1, [x0, #0xb]
    // 0x3fef04: LeaveFrame
    //     0x3fef04: mov             SP, fp
    //     0x3fef08: ldp             fp, lr, [SP], #0x10
    // 0x3fef0c: ret
    //     0x3fef0c: ret             
    // 0x3fef10: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3fef10: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3fef14: b               #0x3fedbc
  }
  [closure] Text <anonymous closure>(dynamic, BuildContext, int, Widget?) {
    // ** addr: 0x3fef18, size: 0xd4
    // 0x3fef18: EnterFrame
    //     0x3fef18: stp             fp, lr, [SP, #-0x10]!
    //     0x3fef1c: mov             fp, SP
    // 0x3fef20: AllocStack(0x20)
    //     0x3fef20: sub             SP, SP, #0x20
    // 0x3fef24: SetupParameters([dynamic _ /* r0 */])
    //     0x3fef24: ldr             x0, [fp, #0x28]
    //     0x3fef28: ldur            w1, [x0, #0x17]
    //     0x3fef2c: add             x1, x1, HEAP, lsl #32
    //     0x3fef30: stur            x1, [fp, #-8]
    // 0x3fef34: CheckStackOverflow
    //     0x3fef34: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3fef38: cmp             SP, x16
    //     0x3fef3c: b.ls            #0x3fefe4
    // 0x3fef40: ldr             x0, [fp, #0x18]
    // 0x3fef44: r2 = 60
    //     0x3fef44: mov             x2, #0x3c
    // 0x3fef48: branchIfSmi(r0, 0x3fef54)
    //     0x3fef48: tbz             w0, #0, #0x3fef54
    // 0x3fef4c: r2 = LoadClassIdInstr(r0)
    //     0x3fef4c: ldur            x2, [x0, #-1]
    //     0x3fef50: ubfx            x2, x2, #0xc, #0x14
    // 0x3fef54: str             x0, [SP]
    // 0x3fef58: mov             x0, x2
    // 0x3fef5c: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x3fef5c: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x3fef60: r0 = GDT[cid_x0 + 0x2f3d]()
    //     0x3fef60: mov             x17, #0x2f3d
    //     0x3fef64: add             lr, x0, x17
    //     0x3fef68: ldr             lr, [x21, lr, lsl #3]
    //     0x3fef6c: blr             lr
    // 0x3fef70: mov             x1, x0
    // 0x3fef74: ldur            x0, [fp, #-8]
    // 0x3fef78: stur            x1, [fp, #-0x10]
    // 0x3fef7c: LoadField: r2 = r0->field_f
    //     0x3fef7c: ldur            w2, [x0, #0xf]
    // 0x3fef80: DecompressPointer r2
    //     0x3fef80: add             x2, x2, HEAP, lsl #32
    // 0x3fef84: LoadField: r0 = r2->field_b
    //     0x3fef84: ldur            w0, [x2, #0xb]
    // 0x3fef88: DecompressPointer r0
    //     0x3fef88: add             x0, x0, HEAP, lsl #32
    // 0x3fef8c: stur            x0, [fp, #-8]
    // 0x3fef90: r0 = TextStyle()
    //     0x3fef90: bl              #0x31e4c4  ; AllocateTextStyleStub -> TextStyle (size=0x70)
    // 0x3fef94: mov             x1, x0
    // 0x3fef98: r0 = true
    //     0x3fef98: add             x0, NULL, #0x20  ; true
    // 0x3fef9c: stur            x1, [fp, #-0x18]
    // 0x3fefa0: StoreField: r1->field_7 = r0
    //     0x3fefa0: stur            w0, [x1, #7]
    // 0x3fefa4: ldur            x0, [fp, #-8]
    // 0x3fefa8: StoreField: r1->field_b = r0
    //     0x3fefa8: stur            w0, [x1, #0xb]
    // 0x3fefac: r0 = 32.000000
    //     0x3fefac: add             x0, PP, #0x13, lsl #12  ; [pp+0x137f0] 32
    //     0x3fefb0: ldr             x0, [x0, #0x7f0]
    // 0x3fefb4: StoreField: r1->field_1f = r0
    //     0x3fefb4: stur            w0, [x1, #0x1f]
    // 0x3fefb8: r0 = 0.600000
    //     0x3fefb8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11270] 0.6
    //     0x3fefbc: ldr             x0, [x0, #0x270]
    // 0x3fefc0: StoreField: r1->field_37 = r0
    //     0x3fefc0: stur            w0, [x1, #0x37]
    // 0x3fefc4: r0 = Text()
    //     0x3fefc4: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x3fefc8: ldur            x1, [fp, #-0x10]
    // 0x3fefcc: StoreField: r0->field_b = r1
    //     0x3fefcc: stur            w1, [x0, #0xb]
    // 0x3fefd0: ldur            x1, [fp, #-0x18]
    // 0x3fefd4: StoreField: r0->field_13 = r1
    //     0x3fefd4: stur            w1, [x0, #0x13]
    // 0x3fefd8: LeaveFrame
    //     0x3fefd8: mov             SP, fp
    //     0x3fefdc: ldp             fp, lr, [SP], #0x10
    // 0x3fefe0: ret
    //     0x3fefe0: ret             
    // 0x3fefe4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3fefe4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3fefe8: b               #0x3fef40
  }
}
