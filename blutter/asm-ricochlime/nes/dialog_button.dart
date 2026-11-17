// lib: , url: package:ricochlime/nes/dialog_button.dart

// class id: 1049320, size: 0x8
class :: {
}

// class id: 2771, size: 0x20, field offset: 0xc
//   const constructor, 
class DialogButton extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x3ff390, size: 0x244
    // 0x3ff390: EnterFrame
    //     0x3ff390: stp             fp, lr, [SP, #-0x10]!
    //     0x3ff394: mov             fp, SP
    // 0x3ff398: AllocStack(0x40)
    //     0x3ff398: sub             SP, SP, #0x40
    // 0x3ff39c: SetupParameters(DialogButton this /* r1 => r0, fp-0x20 */)
    //     0x3ff39c: mov             x0, x1
    //     0x3ff3a0: stur            x1, [fp, #-0x20]
    // 0x3ff3a4: CheckStackOverflow
    //     0x3ff3a4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3ff3a8: cmp             SP, x16
    //     0x3ff3ac: b.ls            #0x3ff5cc
    // 0x3ff3b0: LoadField: r3 = r0->field_b
    //     0x3ff3b0: ldur            w3, [x0, #0xb]
    // 0x3ff3b4: DecompressPointer r3
    //     0x3ff3b4: add             x3, x3, HEAP, lsl #32
    // 0x3ff3b8: stur            x3, [fp, #-0x18]
    // 0x3ff3bc: LoadField: r4 = r0->field_f
    //     0x3ff3bc: ldur            w4, [x0, #0xf]
    // 0x3ff3c0: DecompressPointer r4
    //     0x3ff3c0: add             x4, x4, HEAP, lsl #32
    // 0x3ff3c4: stur            x4, [fp, #-0x10]
    // 0x3ff3c8: ArrayLoad: r5 = r0[0]  ; List_4
    //     0x3ff3c8: ldur            w5, [x0, #0x17]
    // 0x3ff3cc: DecompressPointer r5
    //     0x3ff3cc: add             x5, x5, HEAP, lsl #32
    // 0x3ff3d0: stur            x5, [fp, #-8]
    // 0x3ff3d4: r1 = <Widget>
    //     0x3ff3d4: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x3ff3d8: r2 = 0
    //     0x3ff3d8: mov             x2, #0
    // 0x3ff3dc: r0 = _GrowableList()
    //     0x3ff3dc: bl              #0x237730  ; [dart:core] _GrowableList::_GrowableList
    // 0x3ff3e0: mov             x3, x0
    // 0x3ff3e4: ldur            x0, [fp, #-0x20]
    // 0x3ff3e8: stur            x3, [fp, #-0x30]
    // 0x3ff3ec: LoadField: r4 = r0->field_13
    //     0x3ff3ec: ldur            w4, [x0, #0x13]
    // 0x3ff3f0: DecompressPointer r4
    //     0x3ff3f0: add             x4, x4, HEAP, lsl #32
    // 0x3ff3f4: stur            x4, [fp, #-0x28]
    // 0x3ff3f8: cmp             w4, NULL
    // 0x3ff3fc: b.eq            #0x3ff454
    // 0x3ff400: r5 = 4
    //     0x3ff400: mov             x5, #4
    // 0x3ff404: mov             x2, x5
    // 0x3ff408: r1 = Null
    //     0x3ff408: mov             x1, NULL
    // 0x3ff40c: r0 = AllocateArray()
    //     0x3ff40c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3ff410: mov             x2, x0
    // 0x3ff414: ldur            x0, [fp, #-0x28]
    // 0x3ff418: stur            x2, [fp, #-0x38]
    // 0x3ff41c: StoreField: r2->field_f = r0
    //     0x3ff41c: stur            w0, [x2, #0xf]
    // 0x3ff420: r16 = Instance_SizedBox
    //     0x3ff420: add             x16, PP, #0x12, lsl #12  ; [pp+0x12310] Obj!SizedBox@5d83c1
    //     0x3ff424: ldr             x16, [x16, #0x310]
    // 0x3ff428: StoreField: r2->field_13 = r16
    //     0x3ff428: stur            w16, [x2, #0x13]
    // 0x3ff42c: r1 = <Widget>
    //     0x3ff42c: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x3ff430: r0 = AllocateGrowableArray()
    //     0x3ff430: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3ff434: mov             x1, x0
    // 0x3ff438: ldur            x0, [fp, #-0x38]
    // 0x3ff43c: StoreField: r1->field_f = r0
    //     0x3ff43c: stur            w0, [x1, #0xf]
    // 0x3ff440: r0 = 4
    //     0x3ff440: mov             x0, #4
    // 0x3ff444: StoreField: r1->field_b = r0
    //     0x3ff444: stur            w0, [x1, #0xb]
    // 0x3ff448: mov             x2, x1
    // 0x3ff44c: ldur            x1, [fp, #-0x30]
    // 0x3ff450: r0 = addAll()
    //     0x3ff450: bl              #0x237fd8  ; [dart:core] _GrowableList::addAll
    // 0x3ff454: ldur            x0, [fp, #-0x20]
    // 0x3ff458: ldur            x1, [fp, #-0x30]
    // 0x3ff45c: LoadField: r2 = r0->field_1b
    //     0x3ff45c: ldur            w2, [x0, #0x1b]
    // 0x3ff460: DecompressPointer r2
    //     0x3ff460: add             x2, x2, HEAP, lsl #32
    // 0x3ff464: stur            x2, [fp, #-0x28]
    // 0x3ff468: r0 = Text()
    //     0x3ff468: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x3ff46c: mov             x2, x0
    // 0x3ff470: ldur            x0, [fp, #-0x28]
    // 0x3ff474: stur            x2, [fp, #-0x20]
    // 0x3ff478: StoreField: r2->field_b = r0
    //     0x3ff478: stur            w0, [x2, #0xb]
    // 0x3ff47c: r0 = Instance_TextStyle
    //     0x3ff47c: add             x0, PP, #0x12, lsl #12  ; [pp+0x12318] Obj!TextStyle@5d56e1
    //     0x3ff480: ldr             x0, [x0, #0x318]
    // 0x3ff484: StoreField: r2->field_13 = r0
    //     0x3ff484: stur            w0, [x2, #0x13]
    // 0x3ff488: r0 = false
    //     0x3ff488: add             x0, NULL, #0x30  ; false
    // 0x3ff48c: StoreField: r2->field_27 = r0
    //     0x3ff48c: stur            w0, [x2, #0x27]
    // 0x3ff490: ldur            x0, [fp, #-0x30]
    // 0x3ff494: LoadField: r1 = r0->field_b
    //     0x3ff494: ldur            w1, [x0, #0xb]
    // 0x3ff498: LoadField: r3 = r0->field_f
    //     0x3ff498: ldur            w3, [x0, #0xf]
    // 0x3ff49c: DecompressPointer r3
    //     0x3ff49c: add             x3, x3, HEAP, lsl #32
    // 0x3ff4a0: LoadField: r4 = r3->field_b
    //     0x3ff4a0: ldur            w4, [x3, #0xb]
    // 0x3ff4a4: r3 = LoadInt32Instr(r1)
    //     0x3ff4a4: sbfx            x3, x1, #1, #0x1f
    // 0x3ff4a8: stur            x3, [fp, #-0x40]
    // 0x3ff4ac: r1 = LoadInt32Instr(r4)
    //     0x3ff4ac: sbfx            x1, x4, #1, #0x1f
    // 0x3ff4b0: cmp             x3, x1
    // 0x3ff4b4: b.ne            #0x3ff4c0
    // 0x3ff4b8: mov             x1, x0
    // 0x3ff4bc: r0 = _growToNextCapacity()
    //     0x3ff4bc: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3ff4c0: ldur            x4, [fp, #-0x18]
    // 0x3ff4c4: ldur            x5, [fp, #-0x10]
    // 0x3ff4c8: ldur            x6, [fp, #-8]
    // 0x3ff4cc: ldur            x2, [fp, #-0x30]
    // 0x3ff4d0: ldur            x3, [fp, #-0x40]
    // 0x3ff4d4: add             x0, x3, #1
    // 0x3ff4d8: lsl             x1, x0, #1
    // 0x3ff4dc: StoreField: r2->field_b = r1
    //     0x3ff4dc: stur            w1, [x2, #0xb]
    // 0x3ff4e0: LoadField: r1 = r2->field_f
    //     0x3ff4e0: ldur            w1, [x2, #0xf]
    // 0x3ff4e4: DecompressPointer r1
    //     0x3ff4e4: add             x1, x1, HEAP, lsl #32
    // 0x3ff4e8: ldur            x0, [fp, #-0x20]
    // 0x3ff4ec: ArrayStore: r1[r3] = r0  ; List_4
    //     0x3ff4ec: add             x25, x1, x3, lsl #2
    //     0x3ff4f0: add             x25, x25, #0xf
    //     0x3ff4f4: str             w0, [x25]
    //     0x3ff4f8: tbz             w0, #0, #0x3ff514
    //     0x3ff4fc: ldurb           w16, [x1, #-1]
    //     0x3ff500: ldurb           w17, [x0, #-1]
    //     0x3ff504: and             x16, x17, x16, lsr #2
    //     0x3ff508: tst             x16, HEAP, lsr #32
    //     0x3ff50c: b.eq            #0x3ff514
    //     0x3ff510: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3ff514: r0 = Row()
    //     0x3ff514: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x3ff518: mov             x1, x0
    // 0x3ff51c: r0 = Instance_Axis
    //     0x3ff51c: ldr             x0, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x3ff520: stur            x1, [fp, #-0x20]
    // 0x3ff524: StoreField: r1->field_f = r0
    //     0x3ff524: stur            w0, [x1, #0xf]
    // 0x3ff528: r0 = Instance_MainAxisAlignment
    //     0x3ff528: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x3ff52c: ldr             x0, [x0, #0xfb0]
    // 0x3ff530: StoreField: r1->field_13 = r0
    //     0x3ff530: stur            w0, [x1, #0x13]
    // 0x3ff534: r0 = Instance_MainAxisSize
    //     0x3ff534: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x3ff538: ldr             x0, [x0, #0xfb8]
    // 0x3ff53c: ArrayStore: r1[0] = r0  ; List_4
    //     0x3ff53c: stur            w0, [x1, #0x17]
    // 0x3ff540: ldur            x0, [fp, #-8]
    // 0x3ff544: StoreField: r1->field_1b = r0
    //     0x3ff544: stur            w0, [x1, #0x1b]
    // 0x3ff548: r0 = Instance_VerticalDirection
    //     0x3ff548: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x3ff54c: ldr             x0, [x0, #0xfc8]
    // 0x3ff550: StoreField: r1->field_23 = r0
    //     0x3ff550: stur            w0, [x1, #0x23]
    // 0x3ff554: r0 = Instance_Clip
    //     0x3ff554: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x3ff558: ldr             x0, [x0, #0xfd0]
    // 0x3ff55c: StoreField: r1->field_2b = r0
    //     0x3ff55c: stur            w0, [x1, #0x2b]
    // 0x3ff560: StoreField: r1->field_2f = rZR
    //     0x3ff560: stur            xzr, [x1, #0x2f]
    // 0x3ff564: ldur            x0, [fp, #-0x30]
    // 0x3ff568: StoreField: r1->field_b = r0
    //     0x3ff568: stur            w0, [x1, #0xb]
    // 0x3ff56c: r0 = NesButton()
    //     0x3ff56c: bl              #0x380374  ; AllocateNesButtonStub -> NesButton (size=0x28)
    // 0x3ff570: mov             x1, x0
    // 0x3ff574: ldur            x0, [fp, #-0x10]
    // 0x3ff578: stur            x1, [fp, #-8]
    // 0x3ff57c: StoreField: r1->field_b = r0
    //     0x3ff57c: stur            w0, [x1, #0xb]
    // 0x3ff580: ldur            x0, [fp, #-0x20]
    // 0x3ff584: StoreField: r1->field_f = r0
    //     0x3ff584: stur            w0, [x1, #0xf]
    // 0x3ff588: ldur            x0, [fp, #-0x18]
    // 0x3ff58c: ArrayStore: r1[0] = r0  ; List_4
    //     0x3ff58c: stur            w0, [x1, #0x17]
    // 0x3ff590: cmp             w0, NULL
    // 0x3ff594: b.ne            #0x3ff5a0
    // 0x3ff598: r0 = true
    //     0x3ff598: add             x0, NULL, #0x20  ; true
    // 0x3ff59c: b               #0x3ff5a4
    // 0x3ff5a0: r0 = false
    //     0x3ff5a0: add             x0, NULL, #0x30  ; false
    // 0x3ff5a4: StoreField: r1->field_23 = r0
    //     0x3ff5a4: stur            w0, [x1, #0x23]
    // 0x3ff5a8: r0 = Center()
    //     0x3ff5a8: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x3ff5ac: r1 = Instance_Alignment
    //     0x3ff5ac: add             x1, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x3ff5b0: ldr             x1, [x1, #0xb18]
    // 0x3ff5b4: StoreField: r0->field_f = r1
    //     0x3ff5b4: stur            w1, [x0, #0xf]
    // 0x3ff5b8: ldur            x1, [fp, #-8]
    // 0x3ff5bc: StoreField: r0->field_b = r1
    //     0x3ff5bc: stur            w1, [x0, #0xb]
    // 0x3ff5c0: LeaveFrame
    //     0x3ff5c0: mov             SP, fp
    //     0x3ff5c4: ldp             fp, lr, [SP], #0x10
    // 0x3ff5c8: ret
    //     0x3ff5c8: ret             
    // 0x3ff5cc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3ff5cc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3ff5d0: b               #0x3ff3b0
  }
}
