// lib: , url: package:ricochlime/flame/game_data.dart

// class id: 1049309, size: 0x8
class :: {
}

// class id: 259, size: 0x14, field offset: 0x8
class GameData extends Object {

  Map<String, dynamic> toJson(GameData) {
    // ** addr: 0x28cb68, size: 0x48
    // 0x28cb68: EnterFrame
    //     0x28cb68: stp             fp, lr, [SP, #-0x10]!
    //     0x28cb6c: mov             fp, SP
    // 0x28cb70: CheckStackOverflow
    //     0x28cb70: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28cb74: cmp             SP, x16
    //     0x28cb78: b.ls            #0x28cb90
    // 0x28cb7c: ldr             x1, [fp, #0x10]
    // 0x28cb80: r0 = toJson()
    //     0x28cb80: bl              #0x28cb98  ; [package:ricochlime/flame/game_data.dart] GameData::toJson
    // 0x28cb84: LeaveFrame
    //     0x28cb84: mov             SP, fp
    //     0x28cb88: ldp             fp, lr, [SP], #0x10
    // 0x28cb8c: ret
    //     0x28cb8c: ret             
    // 0x28cb90: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28cb90: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28cb94: b               #0x28cb7c
  }
  Map<String, dynamic> toJson(GameData) {
    // ** addr: 0x28cb98, size: 0x94
    // 0x28cb98: EnterFrame
    //     0x28cb98: stp             fp, lr, [SP, #-0x10]!
    //     0x28cb9c: mov             fp, SP
    // 0x28cba0: AllocStack(0x18)
    //     0x28cba0: sub             SP, SP, #0x18
    // 0x28cba4: SetupParameters(GameData this /* r1 => r0, fp-0x8 */)
    //     0x28cba4: mov             x0, x1
    //     0x28cba8: stur            x1, [fp, #-8]
    // 0x28cbac: CheckStackOverflow
    //     0x28cbac: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28cbb0: cmp             SP, x16
    //     0x28cbb4: b.ls            #0x28cc24
    // 0x28cbb8: r1 = Null
    //     0x28cbb8: mov             x1, NULL
    // 0x28cbbc: r2 = 8
    //     0x28cbbc: mov             x2, #8
    // 0x28cbc0: r0 = AllocateArray()
    //     0x28cbc0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x28cbc4: mov             x2, x0
    // 0x28cbc8: r16 = "score"
    //     0x28cbc8: add             x16, PP, #8, lsl #12  ; [pp+0x8458] "score"
    //     0x28cbcc: ldr             x16, [x16, #0x458]
    // 0x28cbd0: StoreField: r2->field_f = r16
    //     0x28cbd0: stur            w16, [x2, #0xf]
    // 0x28cbd4: ldur            x3, [fp, #-8]
    // 0x28cbd8: LoadField: r4 = r3->field_7
    //     0x28cbd8: ldur            x4, [x3, #7]
    // 0x28cbdc: r0 = BoxInt64Instr(r4)
    //     0x28cbdc: sbfiz           x0, x4, #1, #0x1f
    //     0x28cbe0: cmp             x4, x0, asr #1
    //     0x28cbe4: b.eq            #0x28cbf0
    //     0x28cbe8: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x28cbec: stur            x4, [x0, #7]
    // 0x28cbf0: StoreField: r2->field_13 = r0
    //     0x28cbf0: stur            w0, [x2, #0x13]
    // 0x28cbf4: r16 = "monsters"
    //     0x28cbf4: add             x16, PP, #8, lsl #12  ; [pp+0x8470] "monsters"
    //     0x28cbf8: ldr             x16, [x16, #0x470]
    // 0x28cbfc: ArrayStore: r2[0] = r16  ; List_4
    //     0x28cbfc: stur            w16, [x2, #0x17]
    // 0x28cc00: LoadField: r0 = r3->field_f
    //     0x28cc00: ldur            w0, [x3, #0xf]
    // 0x28cc04: DecompressPointer r0
    //     0x28cc04: add             x0, x0, HEAP, lsl #32
    // 0x28cc08: StoreField: r2->field_1b = r0
    //     0x28cc08: stur            w0, [x2, #0x1b]
    // 0x28cc0c: r16 = <String, dynamic>
    //     0x28cc0c: ldr             x16, [PP, #0xfd0]  ; [pp+0xfd0] TypeArguments: <String, dynamic>
    // 0x28cc10: stp             x2, x16, [SP]
    // 0x28cc14: r0 = Map._fromLiteral()
    //     0x28cc14: bl              #0x23b588  ; [dart:core] Map::Map._fromLiteral
    // 0x28cc18: LeaveFrame
    //     0x28cc18: mov             SP, fp
    //     0x28cc1c: ldp             fp, lr, [SP], #0x10
    // 0x28cc20: ret
    //     0x28cc20: ret             
    // 0x28cc24: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28cc24: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28cc28: b               #0x28cbb8
  }
  _ GameData.fromJson(/* No info */) {
    // ** addr: 0x28ccb8, size: 0x194
    // 0x28ccb8: EnterFrame
    //     0x28ccb8: stp             fp, lr, [SP, #-0x10]!
    //     0x28ccbc: mov             fp, SP
    // 0x28ccc0: AllocStack(0x28)
    //     0x28ccc0: sub             SP, SP, #0x28
    // 0x28ccc4: SetupParameters(GameData this /* r1 => r4, fp-0x8 */, dynamic _ /* r2 => r3, fp-0x10 */)
    //     0x28ccc4: mov             x4, x1
    //     0x28ccc8: mov             x3, x2
    //     0x28cccc: stur            x1, [fp, #-8]
    //     0x28ccd0: stur            x2, [fp, #-0x10]
    // 0x28ccd4: CheckStackOverflow
    //     0x28ccd4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x28ccd8: cmp             SP, x16
    //     0x28ccdc: b.ls            #0x28ce44
    // 0x28cce0: r0 = LoadClassIdInstr(r3)
    //     0x28cce0: ldur            x0, [x3, #-1]
    //     0x28cce4: ubfx            x0, x0, #0xc, #0x14
    // 0x28cce8: mov             x1, x3
    // 0x28ccec: r2 = "score"
    //     0x28ccec: add             x2, PP, #8, lsl #12  ; [pp+0x8458] "score"
    //     0x28ccf0: ldr             x2, [x2, #0x458]
    // 0x28ccf4: r0 = GDT[cid_x0 + -0x1000]()
    //     0x28ccf4: sub             lr, x0, #1, lsl #12
    //     0x28ccf8: ldr             lr, [x21, lr, lsl #3]
    //     0x28ccfc: blr             lr
    // 0x28cd00: mov             x3, x0
    // 0x28cd04: r2 = Null
    //     0x28cd04: mov             x2, NULL
    // 0x28cd08: r1 = Null
    //     0x28cd08: mov             x1, NULL
    // 0x28cd0c: stur            x3, [fp, #-0x18]
    // 0x28cd10: branchIfSmi(r0, 0x28cd38)
    //     0x28cd10: tbz             w0, #0, #0x28cd38
    // 0x28cd14: r4 = LoadClassIdInstr(r0)
    //     0x28cd14: ldur            x4, [x0, #-1]
    //     0x28cd18: ubfx            x4, x4, #0xc, #0x14
    // 0x28cd1c: sub             x4, x4, #0x3c
    // 0x28cd20: cmp             x4, #1
    // 0x28cd24: b.ls            #0x28cd38
    // 0x28cd28: r8 = int
    //     0x28cd28: ldr             x8, [PP, #0x78]  ; [pp+0x78] Type: int
    // 0x28cd2c: r3 = Null
    //     0x28cd2c: add             x3, PP, #8, lsl #12  ; [pp+0x8460] Null
    //     0x28cd30: ldr             x3, [x3, #0x460]
    // 0x28cd34: r0 = int()
    //     0x28cd34: bl              #0x589a08  ; IsType_int_Stub
    // 0x28cd38: ldur            x0, [fp, #-0x18]
    // 0x28cd3c: r1 = LoadInt32Instr(r0)
    //     0x28cd3c: sbfx            x1, x0, #1, #0x1f
    //     0x28cd40: tbz             w0, #0, #0x28cd48
    //     0x28cd44: ldur            x1, [x0, #7]
    // 0x28cd48: ldur            x3, [fp, #-8]
    // 0x28cd4c: StoreField: r3->field_7 = r1
    //     0x28cd4c: stur            x1, [x3, #7]
    // 0x28cd50: ldur            x4, [fp, #-0x10]
    // 0x28cd54: r0 = LoadClassIdInstr(r4)
    //     0x28cd54: ldur            x0, [x4, #-1]
    //     0x28cd58: ubfx            x0, x0, #0xc, #0x14
    // 0x28cd5c: mov             x1, x4
    // 0x28cd60: r2 = "monsters"
    //     0x28cd60: add             x2, PP, #8, lsl #12  ; [pp+0x8470] "monsters"
    //     0x28cd64: ldr             x2, [x2, #0x470]
    // 0x28cd68: r0 = GDT[cid_x0 + -0x1000]()
    //     0x28cd68: sub             lr, x0, #1, lsl #12
    //     0x28cd6c: ldr             lr, [x21, lr, lsl #3]
    //     0x28cd70: blr             lr
    // 0x28cd74: cmp             w0, NULL
    // 0x28cd78: b.ne            #0x28cda4
    // 0x28cd7c: ldur            x1, [fp, #-0x10]
    // 0x28cd80: r0 = LoadClassIdInstr(r1)
    //     0x28cd80: ldur            x0, [x1, #-1]
    //     0x28cd84: ubfx            x0, x0, #0xc, #0x14
    // 0x28cd88: r2 = "slimes"
    //     0x28cd88: add             x2, PP, #8, lsl #12  ; [pp+0x8478] "slimes"
    //     0x28cd8c: ldr             x2, [x2, #0x478]
    // 0x28cd90: r0 = GDT[cid_x0 + -0x1000]()
    //     0x28cd90: sub             lr, x0, #1, lsl #12
    //     0x28cd94: ldr             lr, [x21, lr, lsl #3]
    //     0x28cd98: blr             lr
    // 0x28cd9c: mov             x4, x0
    // 0x28cda0: b               #0x28cda8
    // 0x28cda4: mov             x4, x0
    // 0x28cda8: ldur            x3, [fp, #-8]
    // 0x28cdac: mov             x0, x4
    // 0x28cdb0: stur            x4, [fp, #-0x10]
    // 0x28cdb4: r2 = Null
    //     0x28cdb4: mov             x2, NULL
    // 0x28cdb8: r1 = Null
    //     0x28cdb8: mov             x1, NULL
    // 0x28cdbc: r4 = 60
    //     0x28cdbc: mov             x4, #0x3c
    // 0x28cdc0: branchIfSmi(r0, 0x28cdcc)
    //     0x28cdc0: tbz             w0, #0, #0x28cdcc
    // 0x28cdc4: r4 = LoadClassIdInstr(r0)
    //     0x28cdc4: ldur            x4, [x0, #-1]
    //     0x28cdc8: ubfx            x4, x4, #0xc, #0x14
    // 0x28cdcc: sub             x4, x4, #0x5a
    // 0x28cdd0: cmp             x4, #2
    // 0x28cdd4: b.ls            #0x28cde8
    // 0x28cdd8: r8 = List
    //     0x28cdd8: ldr             x8, [PP, #0x3590]  ; [pp+0x3590] Type: List
    // 0x28cddc: r3 = Null
    //     0x28cddc: add             x3, PP, #8, lsl #12  ; [pp+0x8480] Null
    //     0x28cde0: ldr             x3, [x3, #0x480]
    // 0x28cde4: r0 = List()
    //     0x28cde4: bl              #0x58aacc  ; IsType_List_Stub
    // 0x28cde8: ldur            x0, [fp, #-0x10]
    // 0x28cdec: r1 = LoadClassIdInstr(r0)
    //     0x28cdec: ldur            x1, [x0, #-1]
    //     0x28cdf0: ubfx            x1, x1, #0xc, #0x14
    // 0x28cdf4: r16 = <Map<String, dynamic>>
    //     0x28cdf4: ldr             x16, [PP, #0x4de0]  ; [pp+0x4de0] TypeArguments: <Map<String, dynamic>>
    // 0x28cdf8: stp             x0, x16, [SP]
    // 0x28cdfc: mov             x0, x1
    // 0x28ce00: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x28ce00: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x28ce04: r0 = GDT[cid_x0 + 0x7cfe]()
    //     0x28ce04: mov             x17, #0x7cfe
    //     0x28ce08: add             lr, x0, x17
    //     0x28ce0c: ldr             lr, [x21, lr, lsl #3]
    //     0x28ce10: blr             lr
    // 0x28ce14: ldur            x1, [fp, #-8]
    // 0x28ce18: StoreField: r1->field_f = r0
    //     0x28ce18: stur            w0, [x1, #0xf]
    //     0x28ce1c: ldurb           w16, [x1, #-1]
    //     0x28ce20: ldurb           w17, [x0, #-1]
    //     0x28ce24: and             x16, x17, x16, lsr #2
    //     0x28ce28: tst             x16, HEAP, lsr #32
    //     0x28ce2c: b.eq            #0x28ce34
    //     0x28ce30: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x28ce34: r0 = Null
    //     0x28ce34: mov             x0, NULL
    // 0x28ce38: LeaveFrame
    //     0x28ce38: mov             SP, fp
    //     0x28ce3c: ldp             fp, lr, [SP], #0x10
    // 0x28ce40: ret
    //     0x28ce40: ret             
    // 0x28ce44: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x28ce44: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x28ce48: b               #0x28cce0
  }
  _ GameData(/* No info */) {
    // ** addr: 0x37d2a4, size: 0x9c
    // 0x37d2a4: EnterFrame
    //     0x37d2a4: stp             fp, lr, [SP, #-0x10]!
    //     0x37d2a8: mov             fp, SP
    // 0x37d2ac: AllocStack(0x28)
    //     0x37d2ac: sub             SP, SP, #0x28
    // 0x37d2b0: SetupParameters(GameData this /* r1 => r4, fp-0x8 */, dynamic _ /* r2 => r0, fp-0x10 */)
    //     0x37d2b0: mov             x4, x1
    //     0x37d2b4: mov             x0, x2
    //     0x37d2b8: stur            x1, [fp, #-8]
    //     0x37d2bc: stur            x2, [fp, #-0x10]
    // 0x37d2c0: CheckStackOverflow
    //     0x37d2c0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d2c4: cmp             SP, x16
    //     0x37d2c8: b.ls            #0x37d338
    // 0x37d2cc: StoreField: r4->field_7 = r3
    //     0x37d2cc: stur            x3, [x4, #7]
    // 0x37d2d0: r1 = Function '<anonymous closure>':.
    //     0x37d2d0: add             x1, PP, #0xc, lsl #12  ; [pp+0xc960] AnonymousClosure: (0x37d340), in [package:ricochlime/flame/game_data.dart] GameData::GameData (0x37d2a4)
    //     0x37d2d4: ldr             x1, [x1, #0x960]
    // 0x37d2d8: r2 = Null
    //     0x37d2d8: mov             x2, NULL
    // 0x37d2dc: r0 = AllocateClosure()
    //     0x37d2dc: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37d2e0: r16 = <Map<String, dynamic>>
    //     0x37d2e0: ldr             x16, [PP, #0x4de0]  ; [pp+0x4de0] TypeArguments: <Map<String, dynamic>>
    // 0x37d2e4: ldur            lr, [fp, #-0x10]
    // 0x37d2e8: stp             lr, x16, [SP, #8]
    // 0x37d2ec: str             x0, [SP]
    // 0x37d2f0: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x37d2f0: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x37d2f4: r0 = map()
    //     0x37d2f4: bl              #0x313b78  ; [dart:_internal] WhereIterable::map
    // 0x37d2f8: LoadField: r1 = r0->field_7
    //     0x37d2f8: ldur            w1, [x0, #7]
    // 0x37d2fc: DecompressPointer r1
    //     0x37d2fc: add             x1, x1, HEAP, lsl #32
    // 0x37d300: mov             x2, x0
    // 0x37d304: r0 = _GrowableList.of()
    //     0x37d304: bl              #0x237258  ; [dart:core] _GrowableList::_GrowableList.of
    // 0x37d308: ldur            x1, [fp, #-8]
    // 0x37d30c: StoreField: r1->field_f = r0
    //     0x37d30c: stur            w0, [x1, #0xf]
    //     0x37d310: ldurb           w16, [x1, #-1]
    //     0x37d314: ldurb           w17, [x0, #-1]
    //     0x37d318: and             x16, x17, x16, lsr #2
    //     0x37d31c: tst             x16, HEAP, lsr #32
    //     0x37d320: b.eq            #0x37d328
    //     0x37d324: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x37d328: r0 = Null
    //     0x37d328: mov             x0, NULL
    // 0x37d32c: LeaveFrame
    //     0x37d32c: mov             SP, fp
    //     0x37d330: ldp             fp, lr, [SP], #0x10
    // 0x37d334: ret
    //     0x37d334: ret             
    // 0x37d338: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d338: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d33c: b               #0x37d2cc
  }
  [closure] Map<String, dynamic> <anonymous closure>(dynamic, Monster) {
    // ** addr: 0x37d340, size: 0x30
    // 0x37d340: EnterFrame
    //     0x37d340: stp             fp, lr, [SP, #-0x10]!
    //     0x37d344: mov             fp, SP
    // 0x37d348: CheckStackOverflow
    //     0x37d348: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d34c: cmp             SP, x16
    //     0x37d350: b.ls            #0x37d368
    // 0x37d354: ldr             x1, [fp, #0x10]
    // 0x37d358: r0 = toJson()
    //     0x37d358: bl              #0x3721e0  ; [package:ricochlime/flame/components/monster.dart] Monster::toJson
    // 0x37d35c: LeaveFrame
    //     0x37d35c: mov             SP, fp
    //     0x37d360: ldp             fp, lr, [SP], #0x10
    // 0x37d364: ret
    //     0x37d364: ret             
    // 0x37d368: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d368: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d36c: b               #0x37d354
  }
}
