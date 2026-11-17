// lib: , url: package:ricochlime/flame/components/monster.dart

// class id: 1049306, size: 0x8
class :: {
}

// class id: 260, size: 0x24, field offset: 0x8
class _MonsterMovement extends Object {

  late final Vector2 velocity; // offset: 0x20

  Vector2 velocity(_MonsterMovement) {
    // ** addr: 0x37d820, size: 0x50
    // 0x37d820: EnterFrame
    //     0x37d820: stp             fp, lr, [SP, #-0x10]!
    //     0x37d824: mov             fp, SP
    // 0x37d828: CheckStackOverflow
    //     0x37d828: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d82c: cmp             SP, x16
    //     0x37d830: b.ls            #0x37d868
    // 0x37d834: ldr             x0, [fp, #0x10]
    // 0x37d838: LoadField: r1 = r0->field_b
    //     0x37d838: ldur            w1, [x0, #0xb]
    // 0x37d83c: DecompressPointer r1
    //     0x37d83c: add             x1, x1, HEAP, lsl #32
    // 0x37d840: LoadField: r2 = r0->field_7
    //     0x37d840: ldur            w2, [x0, #7]
    // 0x37d844: DecompressPointer r2
    //     0x37d844: add             x2, x2, HEAP, lsl #32
    // 0x37d848: r0 = -()
    //     0x37d848: bl              #0x28bf34  ; [package:vector_math/vector_math.dart] Vector2::-
    // 0x37d84c: mov             x1, x0
    // 0x37d850: ldr             x0, [fp, #0x10]
    // 0x37d854: LoadField: d0 = r0->field_f
    //     0x37d854: ldur            d0, [x0, #0xf]
    // 0x37d858: r0 = /()
    //     0x37d858: bl              #0x37d870  ; [package:vector_math/vector_math.dart] Vector2::/
    // 0x37d85c: LeaveFrame
    //     0x37d85c: mov             SP, fp
    //     0x37d860: ldp             fp, lr, [SP], #0x10
    // 0x37d864: ret
    //     0x37d864: ret             
    // 0x37d868: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d868: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d86c: b               #0x37d834
  }
}

// class id: 1890, size: 0xa4, field offset: 0x78
class Monster extends _MixinApplication267&BodyComponent&ContactCallbacks {

  late final MonsterAnimation _animation; // offset: 0x94
  late final HealthBar _healthBar; // offset: 0x98

  Map<String, dynamic> toJson(Monster) {
    // ** addr: 0x3721b0, size: 0x48
    // 0x3721b0: EnterFrame
    //     0x3721b0: stp             fp, lr, [SP, #-0x10]!
    //     0x3721b4: mov             fp, SP
    // 0x3721b8: CheckStackOverflow
    //     0x3721b8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3721bc: cmp             SP, x16
    //     0x3721c0: b.ls            #0x3721d8
    // 0x3721c4: ldr             x1, [fp, #0x10]
    // 0x3721c8: r0 = toJson()
    //     0x3721c8: bl              #0x3721e0  ; [package:ricochlime/flame/components/monster.dart] Monster::toJson
    // 0x3721cc: LeaveFrame
    //     0x3721cc: mov             SP, fp
    //     0x3721d0: ldp             fp, lr, [SP], #0x10
    // 0x3721d4: ret
    //     0x3721d4: ret             
    // 0x3721d8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3721d8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3721dc: b               #0x3721c4
  }
  Map<String, dynamic> toJson(Monster) {
    // ** addr: 0x3721e0, size: 0x480
    // 0x3721e0: EnterFrame
    //     0x3721e0: stp             fp, lr, [SP, #-0x10]!
    //     0x3721e4: mov             fp, SP
    // 0x3721e8: AllocStack(0x20)
    //     0x3721e8: sub             SP, SP, #0x20
    // 0x3721ec: SetupParameters(Monster this /* r1 => r1, fp-0x8 */)
    //     0x3721ec: stur            x1, [fp, #-8]
    // 0x3721f0: CheckStackOverflow
    //     0x3721f0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3721f4: cmp             SP, x16
    //     0x3721f8: b.ls            #0x3725c8
    // 0x3721fc: r16 = <String, dynamic>
    //     0x3721fc: ldr             x16, [PP, #0xfd0]  ; [pp+0xfd0] TypeArguments: <String, dynamic>
    // 0x372200: ldr             lr, [THR, #0xa8]  ; THR::empty_array
    // 0x372204: stp             lr, x16, [SP]
    // 0x372208: r0 = Map._fromLiteral()
    //     0x372208: bl              #0x23b588  ; [dart:core] Map::Map._fromLiteral
    // 0x37220c: mov             x20, x0
    // 0x372210: ldur            x19, [fp, #-8]
    // 0x372214: stur            x20, [fp, #-0x10]
    // 0x372218: LoadField: r0 = r19->field_8f
    //     0x372218: ldur            w0, [x19, #0x8f]
    // 0x37221c: DecompressPointer r0
    //     0x37221c: add             x0, x0, HEAP, lsl #32
    // 0x372220: cmp             w0, NULL
    // 0x372224: b.ne            #0x372230
    // 0x372228: r0 = Null
    //     0x372228: mov             x0, NULL
    // 0x37222c: b               #0x37228c
    // 0x372230: LoadField: r1 = r0->field_b
    //     0x372230: ldur            w1, [x0, #0xb]
    // 0x372234: DecompressPointer r1
    //     0x372234: add             x1, x1, HEAP, lsl #32
    // 0x372238: LoadField: r2 = r1->field_7
    //     0x372238: ldur            w2, [x1, #7]
    // 0x37223c: DecompressPointer r2
    //     0x37223c: add             x2, x2, HEAP, lsl #32
    // 0x372240: LoadField: r0 = r2->field_13
    //     0x372240: ldur            w0, [x2, #0x13]
    // 0x372244: r1 = LoadInt32Instr(r0)
    //     0x372244: sbfx            x1, x0, #1, #0x1f
    // 0x372248: mov             x0, x1
    // 0x37224c: r1 = 0
    //     0x37224c: mov             x1, #0
    // 0x372250: cmp             x1, x0
    // 0x372254: b.hs            #0x3725d0
    // 0x372258: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x372258: ldur            s0, [x2, #0x17]
    // 0x37225c: fcvt            d1, s0
    // 0x372260: r0 = inline_Allocate_Double()
    //     0x372260: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x372264: add             x0, x0, #0x10
    //     0x372268: cmp             x1, x0
    //     0x37226c: b.ls            #0x3725d4
    //     0x372270: str             x0, [THR, #0x60]  ; THR::top
    //     0x372274: sub             x0, x0, #0xf
    //     0x372278: mov             x1, #0xe19c
    //     0x37227c: movk            x1, #3, lsl #16
    //     0x372280: stur            x1, [x0, #-1]
    // 0x372284: dmb             ishst
    // 0x372288: StoreField: r0->field_7 = d1
    //     0x372288: stur            d1, [x0, #7]
    // 0x37228c: cmp             w0, NULL
    // 0x372290: b.ne            #0x372300
    // 0x372294: LoadField: r0 = r19->field_9f
    //     0x372294: ldur            w0, [x19, #0x9f]
    // 0x372298: DecompressPointer r0
    //     0x372298: add             x0, x0, HEAP, lsl #32
    // 0x37229c: tbnz            w0, #4, #0x3722c8
    // 0x3722a0: LoadField: r0 = r19->field_43
    //     0x3722a0: ldur            w0, [x19, #0x43]
    // 0x3722a4: DecompressPointer r0
    //     0x3722a4: add             x0, x0, HEAP, lsl #32
    // 0x3722a8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3722ac: cmp             w0, w16
    // 0x3722b0: b.eq            #0x3725ec
    // 0x3722b4: LoadField: r1 = r0->field_1b
    //     0x3722b4: ldur            w1, [x0, #0x1b]
    // 0x3722b8: DecompressPointer r1
    //     0x3722b8: add             x1, x1, HEAP, lsl #32
    // 0x3722bc: LoadField: r0 = r1->field_7
    //     0x3722bc: ldur            w0, [x1, #7]
    // 0x3722c0: DecompressPointer r0
    //     0x3722c0: add             x0, x0, HEAP, lsl #32
    // 0x3722c4: b               #0x3722d0
    // 0x3722c8: LoadField: r0 = r19->field_77
    //     0x3722c8: ldur            w0, [x19, #0x77]
    // 0x3722cc: DecompressPointer r0
    //     0x3722cc: add             x0, x0, HEAP, lsl #32
    // 0x3722d0: LoadField: r2 = r0->field_7
    //     0x3722d0: ldur            w2, [x0, #7]
    // 0x3722d4: DecompressPointer r2
    //     0x3722d4: add             x2, x2, HEAP, lsl #32
    // 0x3722d8: LoadField: r0 = r2->field_13
    //     0x3722d8: ldur            w0, [x2, #0x13]
    // 0x3722dc: r1 = LoadInt32Instr(r0)
    //     0x3722dc: sbfx            x1, x0, #1, #0x1f
    // 0x3722e0: mov             x0, x1
    // 0x3722e4: r1 = 0
    //     0x3722e4: mov             x1, #0
    // 0x3722e8: cmp             x1, x0
    // 0x3722ec: b.hs            #0x3725f8
    // 0x3722f0: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x3722f0: ldur            s0, [x2, #0x17]
    // 0x3722f4: fcvt            d1, s0
    // 0x3722f8: mov             v0.16b, v1.16b
    // 0x3722fc: b               #0x372304
    // 0x372300: LoadField: d0 = r0->field_7
    //     0x372300: ldur            d0, [x0, #7]
    // 0x372304: d1 = 10.000000
    //     0x372304: fmov            d1, #10.00000000
    // 0x372308: fmul            d2, d0, d1
    // 0x37230c: mov             v0.16b, v2.16b
    // 0x372310: stp             fp, lr, [SP, #-0x10]!
    // 0x372314: mov             fp, SP
    // 0x372318: CallRuntime_LibcRound(double) -> double
    //     0x372318: and             SP, SP, #0xfffffffffffffff0
    //     0x37231c: mov             sp, SP
    //     0x372320: ldr             x16, [THR, #0x770]  ; THR::LibcRound
    //     0x372324: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x372328: blr             x16
    //     0x37232c: mov             x16, #8
    //     0x372330: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x372334: ldr             x16, [THR, #0x690]  ; THR::saved_stack_limit
    //     0x372338: sub             sp, x16, #1, lsl #12
    //     0x37233c: mov             SP, fp
    //     0x372340: ldp             fp, lr, [SP], #0x10
    // 0x372344: mov             v1.16b, v0.16b
    // 0x372348: d0 = 10.000000
    //     0x372348: fmov            d0, #10.00000000
    // 0x37234c: fdiv            d2, d1, d0
    // 0x372350: r3 = inline_Allocate_Double()
    //     0x372350: ldp             x3, x0, [THR, #0x60]  ; THR::top
    //     0x372354: add             x3, x3, #0x10
    //     0x372358: cmp             x0, x3
    //     0x37235c: b.ls            #0x3725fc
    //     0x372360: str             x3, [THR, #0x60]  ; THR::top
    //     0x372364: sub             x3, x3, #0xf
    //     0x372368: mov             x0, #0xe19c
    //     0x37236c: movk            x0, #3, lsl #16
    //     0x372370: stur            x0, [x3, #-1]
    // 0x372374: dmb             ishst
    // 0x372378: StoreField: r3->field_7 = d2
    //     0x372378: stur            d2, [x3, #7]
    // 0x37237c: mov             x1, x20
    // 0x372380: r2 = "px"
    //     0x372380: add             x2, PP, #0xc, lsl #12  ; [pp+0xc968] "px"
    //     0x372384: ldr             x2, [x2, #0x968]
    // 0x372388: r0 = []=()
    //     0x372388: bl              #0x5464f0  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::[]=
    // 0x37238c: ldur            x19, [fp, #-8]
    // 0x372390: LoadField: r0 = r19->field_8f
    //     0x372390: ldur            w0, [x19, #0x8f]
    // 0x372394: DecompressPointer r0
    //     0x372394: add             x0, x0, HEAP, lsl #32
    // 0x372398: cmp             w0, NULL
    // 0x37239c: b.ne            #0x3723a8
    // 0x3723a0: r0 = Null
    //     0x3723a0: mov             x0, NULL
    // 0x3723a4: b               #0x372404
    // 0x3723a8: LoadField: r1 = r0->field_b
    //     0x3723a8: ldur            w1, [x0, #0xb]
    // 0x3723ac: DecompressPointer r1
    //     0x3723ac: add             x1, x1, HEAP, lsl #32
    // 0x3723b0: LoadField: r2 = r1->field_7
    //     0x3723b0: ldur            w2, [x1, #7]
    // 0x3723b4: DecompressPointer r2
    //     0x3723b4: add             x2, x2, HEAP, lsl #32
    // 0x3723b8: LoadField: r0 = r2->field_13
    //     0x3723b8: ldur            w0, [x2, #0x13]
    // 0x3723bc: r1 = LoadInt32Instr(r0)
    //     0x3723bc: sbfx            x1, x0, #1, #0x1f
    // 0x3723c0: mov             x0, x1
    // 0x3723c4: r1 = 1
    //     0x3723c4: mov             x1, #1
    // 0x3723c8: cmp             x1, x0
    // 0x3723cc: b.hs            #0x372618
    // 0x3723d0: LoadField: d0 = r2->field_1b
    //     0x3723d0: ldur            s0, [x2, #0x1b]
    // 0x3723d4: fcvt            d1, s0
    // 0x3723d8: r0 = inline_Allocate_Double()
    //     0x3723d8: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x3723dc: add             x0, x0, #0x10
    //     0x3723e0: cmp             x1, x0
    //     0x3723e4: b.ls            #0x37261c
    //     0x3723e8: str             x0, [THR, #0x60]  ; THR::top
    //     0x3723ec: sub             x0, x0, #0xf
    //     0x3723f0: mov             x1, #0xe19c
    //     0x3723f4: movk            x1, #3, lsl #16
    //     0x3723f8: stur            x1, [x0, #-1]
    // 0x3723fc: dmb             ishst
    // 0x372400: StoreField: r0->field_7 = d1
    //     0x372400: stur            d1, [x0, #7]
    // 0x372404: cmp             w0, NULL
    // 0x372408: b.ne            #0x372478
    // 0x37240c: LoadField: r0 = r19->field_9f
    //     0x37240c: ldur            w0, [x19, #0x9f]
    // 0x372410: DecompressPointer r0
    //     0x372410: add             x0, x0, HEAP, lsl #32
    // 0x372414: tbnz            w0, #4, #0x372440
    // 0x372418: LoadField: r0 = r19->field_43
    //     0x372418: ldur            w0, [x19, #0x43]
    // 0x37241c: DecompressPointer r0
    //     0x37241c: add             x0, x0, HEAP, lsl #32
    // 0x372420: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x372424: cmp             w0, w16
    // 0x372428: b.eq            #0x372634
    // 0x37242c: LoadField: r1 = r0->field_1b
    //     0x37242c: ldur            w1, [x0, #0x1b]
    // 0x372430: DecompressPointer r1
    //     0x372430: add             x1, x1, HEAP, lsl #32
    // 0x372434: LoadField: r0 = r1->field_7
    //     0x372434: ldur            w0, [x1, #7]
    // 0x372438: DecompressPointer r0
    //     0x372438: add             x0, x0, HEAP, lsl #32
    // 0x37243c: b               #0x372448
    // 0x372440: LoadField: r0 = r19->field_77
    //     0x372440: ldur            w0, [x19, #0x77]
    // 0x372444: DecompressPointer r0
    //     0x372444: add             x0, x0, HEAP, lsl #32
    // 0x372448: LoadField: r2 = r0->field_7
    //     0x372448: ldur            w2, [x0, #7]
    // 0x37244c: DecompressPointer r2
    //     0x37244c: add             x2, x2, HEAP, lsl #32
    // 0x372450: LoadField: r0 = r2->field_13
    //     0x372450: ldur            w0, [x2, #0x13]
    // 0x372454: r1 = LoadInt32Instr(r0)
    //     0x372454: sbfx            x1, x0, #1, #0x1f
    // 0x372458: mov             x0, x1
    // 0x37245c: r1 = 1
    //     0x37245c: mov             x1, #1
    // 0x372460: cmp             x1, x0
    // 0x372464: b.hs            #0x372640
    // 0x372468: LoadField: d0 = r2->field_1b
    //     0x372468: ldur            s0, [x2, #0x1b]
    // 0x37246c: fcvt            d1, s0
    // 0x372470: mov             v0.16b, v1.16b
    // 0x372474: b               #0x37247c
    // 0x372478: LoadField: d0 = r0->field_7
    //     0x372478: ldur            d0, [x0, #7]
    // 0x37247c: d1 = 10.000000
    //     0x37247c: fmov            d1, #10.00000000
    // 0x372480: fmul            d2, d0, d1
    // 0x372484: mov             v0.16b, v2.16b
    // 0x372488: stp             fp, lr, [SP, #-0x10]!
    // 0x37248c: mov             fp, SP
    // 0x372490: CallRuntime_LibcRound(double) -> double
    //     0x372490: and             SP, SP, #0xfffffffffffffff0
    //     0x372494: mov             sp, SP
    //     0x372498: ldr             x16, [THR, #0x770]  ; THR::LibcRound
    //     0x37249c: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x3724a0: blr             x16
    //     0x3724a4: mov             x16, #8
    //     0x3724a8: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x3724ac: ldr             x16, [THR, #0x690]  ; THR::saved_stack_limit
    //     0x3724b0: sub             sp, x16, #1, lsl #12
    //     0x3724b4: mov             SP, fp
    //     0x3724b8: ldp             fp, lr, [SP], #0x10
    // 0x3724bc: mov             v1.16b, v0.16b
    // 0x3724c0: d0 = 10.000000
    //     0x3724c0: fmov            d0, #10.00000000
    // 0x3724c4: fdiv            d2, d1, d0
    // 0x3724c8: r3 = inline_Allocate_Double()
    //     0x3724c8: ldp             x3, x0, [THR, #0x60]  ; THR::top
    //     0x3724cc: add             x3, x3, #0x10
    //     0x3724d0: cmp             x0, x3
    //     0x3724d4: b.ls            #0x372644
    //     0x3724d8: str             x3, [THR, #0x60]  ; THR::top
    //     0x3724dc: sub             x3, x3, #0xf
    //     0x3724e0: mov             x0, #0xe19c
    //     0x3724e4: movk            x0, #3, lsl #16
    //     0x3724e8: stur            x0, [x3, #-1]
    // 0x3724ec: dmb             ishst
    // 0x3724f0: StoreField: r3->field_7 = d2
    //     0x3724f0: stur            d2, [x3, #7]
    // 0x3724f4: ldur            x1, [fp, #-0x10]
    // 0x3724f8: r2 = "py"
    //     0x3724f8: add             x2, PP, #0xc, lsl #12  ; [pp+0xc970] "py"
    //     0x3724fc: ldr             x2, [x2, #0x970]
    // 0x372500: r0 = []=()
    //     0x372500: bl              #0x5464f0  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::[]=
    // 0x372504: ldur            x4, [fp, #-8]
    // 0x372508: LoadField: r2 = r4->field_7b
    //     0x372508: ldur            x2, [x4, #0x7b]
    // 0x37250c: r0 = BoxInt64Instr(r2)
    //     0x37250c: sbfiz           x0, x2, #1, #0x1f
    //     0x372510: cmp             x2, x0, asr #1
    //     0x372514: b.eq            #0x372520
    //     0x372518: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x37251c: stur            x2, [x0, #7]
    // 0x372520: ldur            x1, [fp, #-0x10]
    // 0x372524: mov             x3, x0
    // 0x372528: r2 = "maxHp"
    //     0x372528: add             x2, PP, #0xc, lsl #12  ; [pp+0xc978] "maxHp"
    //     0x37252c: ldr             x2, [x2, #0x978]
    // 0x372530: r0 = []=()
    //     0x372530: bl              #0x5464f0  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::[]=
    // 0x372534: ldur            x4, [fp, #-8]
    // 0x372538: LoadField: r2 = r4->field_83
    //     0x372538: ldur            x2, [x4, #0x83]
    // 0x37253c: LoadField: r0 = r4->field_7b
    //     0x37253c: ldur            x0, [x4, #0x7b]
    // 0x372540: cmp             x2, x0
    // 0x372544: b.eq            #0x372570
    // 0x372548: r0 = BoxInt64Instr(r2)
    //     0x372548: sbfiz           x0, x2, #1, #0x1f
    //     0x37254c: cmp             x2, x0, asr #1
    //     0x372550: b.eq            #0x37255c
    //     0x372554: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x372558: stur            x2, [x0, #7]
    // 0x37255c: ldur            x1, [fp, #-0x10]
    // 0x372560: mov             x3, x0
    // 0x372564: r2 = "hp"
    //     0x372564: add             x2, PP, #0xc, lsl #12  ; [pp+0xc980] "hp"
    //     0x372568: ldr             x2, [x2, #0x980]
    // 0x37256c: r0 = []=()
    //     0x37256c: bl              #0x5464f0  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::[]=
    // 0x372570: ldur            x0, [fp, #-8]
    // 0x372574: LoadField: r1 = r0->field_9b
    //     0x372574: ldur            w1, [x0, #0x9b]
    // 0x372578: DecompressPointer r1
    //     0x372578: add             x1, x1, HEAP, lsl #32
    // 0x37257c: r16 = Instance_KillReward
    //     0x37257c: add             x16, PP, #0xc, lsl #12  ; [pp+0xc988] Obj!KillReward@5d8ac1
    //     0x372580: ldr             x16, [x16, #0x988]
    // 0x372584: cmp             w1, w16
    // 0x372588: b.eq            #0x3725b8
    // 0x37258c: LoadField: r2 = r1->field_7
    //     0x37258c: ldur            x2, [x1, #7]
    // 0x372590: r0 = BoxInt64Instr(r2)
    //     0x372590: sbfiz           x0, x2, #1, #0x1f
    //     0x372594: cmp             x2, x0, asr #1
    //     0x372598: b.eq            #0x3725a4
    //     0x37259c: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3725a0: stur            x2, [x0, #7]
    // 0x3725a4: ldur            x1, [fp, #-0x10]
    // 0x3725a8: mov             x3, x0
    // 0x3725ac: r2 = "killReward"
    //     0x3725ac: add             x2, PP, #0xc, lsl #12  ; [pp+0xc990] "killReward"
    //     0x3725b0: ldr             x2, [x2, #0x990]
    // 0x3725b4: r0 = []=()
    //     0x3725b4: bl              #0x5464f0  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::[]=
    // 0x3725b8: ldur            x0, [fp, #-0x10]
    // 0x3725bc: LeaveFrame
    //     0x3725bc: mov             SP, fp
    //     0x3725c0: ldp             fp, lr, [SP], #0x10
    // 0x3725c4: ret
    //     0x3725c4: ret             
    // 0x3725c8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3725c8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3725cc: b               #0x3721fc
    // 0x3725d0: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3725d0: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3725d4: SaveReg d1
    //     0x3725d4: str             q1, [SP, #-0x10]!
    // 0x3725d8: stp             x19, x20, [SP, #-0x10]!
    // 0x3725dc: r0 = AllocateDouble()
    //     0x3725dc: bl              #0x584528  ; AllocateDoubleStub
    // 0x3725e0: ldp             x19, x20, [SP], #0x10
    // 0x3725e4: RestoreReg d1
    //     0x3725e4: ldr             q1, [SP], #0x10
    // 0x3725e8: b               #0x372288
    // 0x3725ec: r9 = body
    //     0x3725ec: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x3725f0: ldr             x9, [x9, #0x7a0]
    // 0x3725f4: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x3725f4: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x3725f8: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3725f8: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3725fc: stp             q0, q2, [SP, #-0x20]!
    // 0x372600: stp             x19, x20, [SP, #-0x10]!
    // 0x372604: r0 = AllocateDouble()
    //     0x372604: bl              #0x584528  ; AllocateDoubleStub
    // 0x372608: mov             x3, x0
    // 0x37260c: ldp             x19, x20, [SP], #0x10
    // 0x372610: ldp             q0, q2, [SP], #0x20
    // 0x372614: b               #0x372378
    // 0x372618: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x372618: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x37261c: SaveReg d1
    //     0x37261c: str             q1, [SP, #-0x10]!
    // 0x372620: SaveReg r19
    //     0x372620: str             x19, [SP, #-8]!
    // 0x372624: r0 = AllocateDouble()
    //     0x372624: bl              #0x584528  ; AllocateDoubleStub
    // 0x372628: RestoreReg r19
    //     0x372628: ldr             x19, [SP], #8
    // 0x37262c: RestoreReg d1
    //     0x37262c: ldr             q1, [SP], #0x10
    // 0x372630: b               #0x372400
    // 0x372634: r9 = body
    //     0x372634: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x372638: ldr             x9, [x9, #0x7a0]
    // 0x37263c: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x37263c: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x372640: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x372640: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x372644: SaveReg d2
    //     0x372644: str             q2, [SP, #-0x10]!
    // 0x372648: SaveReg r19
    //     0x372648: str             x19, [SP, #-8]!
    // 0x37264c: r0 = AllocateDouble()
    //     0x37264c: bl              #0x584528  ; AllocateDoubleStub
    // 0x372650: mov             x3, x0
    // 0x372654: RestoreReg r19
    //     0x372654: ldr             x19, [SP], #8
    // 0x372658: RestoreReg d2
    //     0x372658: ldr             q2, [SP], #0x10
    // 0x37265c: b               #0x3724f0
  }
  factory _ Monster.fromJson(/* No info */) {
    // ** addr: 0x3730b8, size: 0x3c4
    // 0x3730b8: EnterFrame
    //     0x3730b8: stp             fp, lr, [SP, #-0x10]!
    //     0x3730bc: mov             fp, SP
    // 0x3730c0: AllocStack(0x40)
    //     0x3730c0: sub             SP, SP, #0x40
    // 0x3730c4: SetupParameters(dynamic _ /* r2 => r3, fp-0x8 */)
    //     0x3730c4: mov             x3, x2
    //     0x3730c8: stur            x2, [fp, #-8]
    // 0x3730cc: CheckStackOverflow
    //     0x3730cc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3730d0: cmp             SP, x16
    //     0x3730d4: b.ls            #0x373470
    // 0x3730d8: r0 = LoadClassIdInstr(r3)
    //     0x3730d8: ldur            x0, [x3, #-1]
    //     0x3730dc: ubfx            x0, x0, #0xc, #0x14
    // 0x3730e0: mov             x1, x3
    // 0x3730e4: r2 = "px"
    //     0x3730e4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc968] "px"
    //     0x3730e8: ldr             x2, [x2, #0x968]
    // 0x3730ec: r0 = GDT[cid_x0 + -0x1000]()
    //     0x3730ec: sub             lr, x0, #1, lsl #12
    //     0x3730f0: ldr             lr, [x21, lr, lsl #3]
    //     0x3730f4: blr             lr
    // 0x3730f8: mov             x3, x0
    // 0x3730fc: r2 = Null
    //     0x3730fc: mov             x2, NULL
    // 0x373100: r1 = Null
    //     0x373100: mov             x1, NULL
    // 0x373104: stur            x3, [fp, #-0x10]
    // 0x373108: r4 = 60
    //     0x373108: mov             x4, #0x3c
    // 0x37310c: branchIfSmi(r0, 0x373118)
    //     0x37310c: tbz             w0, #0, #0x373118
    // 0x373110: r4 = LoadClassIdInstr(r0)
    //     0x373110: ldur            x4, [x0, #-1]
    //     0x373114: ubfx            x4, x4, #0xc, #0x14
    // 0x373118: cmp             x4, #0x3e
    // 0x37311c: b.eq            #0x373130
    // 0x373120: r8 = double
    //     0x373120: ldr             x8, [PP, #0x98]  ; [pp+0x98] Type: double
    // 0x373124: r3 = Null
    //     0x373124: add             x3, PP, #0xd, lsl #12  ; [pp+0xd1f8] Null
    //     0x373128: ldr             x3, [x3, #0x1f8]
    // 0x37312c: r0 = double()
    //     0x37312c: bl              #0x5893ec  ; IsType_double_Stub
    // 0x373130: ldur            x3, [fp, #-8]
    // 0x373134: r0 = LoadClassIdInstr(r3)
    //     0x373134: ldur            x0, [x3, #-1]
    //     0x373138: ubfx            x0, x0, #0xc, #0x14
    // 0x37313c: mov             x1, x3
    // 0x373140: r2 = "py"
    //     0x373140: add             x2, PP, #0xc, lsl #12  ; [pp+0xc970] "py"
    //     0x373144: ldr             x2, [x2, #0x970]
    // 0x373148: r0 = GDT[cid_x0 + -0x1000]()
    //     0x373148: sub             lr, x0, #1, lsl #12
    //     0x37314c: ldr             lr, [x21, lr, lsl #3]
    //     0x373150: blr             lr
    // 0x373154: mov             x3, x0
    // 0x373158: r2 = Null
    //     0x373158: mov             x2, NULL
    // 0x37315c: r1 = Null
    //     0x37315c: mov             x1, NULL
    // 0x373160: stur            x3, [fp, #-0x18]
    // 0x373164: r4 = 60
    //     0x373164: mov             x4, #0x3c
    // 0x373168: branchIfSmi(r0, 0x373174)
    //     0x373168: tbz             w0, #0, #0x373174
    // 0x37316c: r4 = LoadClassIdInstr(r0)
    //     0x37316c: ldur            x4, [x0, #-1]
    //     0x373170: ubfx            x4, x4, #0xc, #0x14
    // 0x373174: cmp             x4, #0x3e
    // 0x373178: b.eq            #0x37318c
    // 0x37317c: r8 = double
    //     0x37317c: ldr             x8, [PP, #0x98]  ; [pp+0x98] Type: double
    // 0x373180: r3 = Null
    //     0x373180: add             x3, PP, #0xd, lsl #12  ; [pp+0xd208] Null
    //     0x373184: ldr             x3, [x3, #0x208]
    // 0x373188: r0 = double()
    //     0x373188: bl              #0x5893ec  ; IsType_double_Stub
    // 0x37318c: r0 = Vector2()
    //     0x37318c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x373190: r4 = 4
    //     0x373190: mov             x4, #4
    // 0x373194: stur            x0, [fp, #-0x20]
    // 0x373198: r0 = AllocateFloat32Array()
    //     0x373198: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x37319c: ldur            x3, [fp, #-0x20]
    // 0x3731a0: StoreField: r3->field_7 = r0
    //     0x3731a0: stur            w0, [x3, #7]
    // 0x3731a4: ldur            x1, [fp, #-0x18]
    // 0x3731a8: LoadField: d0 = r1->field_7
    //     0x3731a8: ldur            d0, [x1, #7]
    // 0x3731ac: fcvt            s1, d0
    // 0x3731b0: StoreField: r0->field_1b = d1
    //     0x3731b0: stur            s1, [x0, #0x1b]
    // 0x3731b4: ldur            x1, [fp, #-0x10]
    // 0x3731b8: LoadField: d0 = r1->field_7
    //     0x3731b8: ldur            d0, [x1, #7]
    // 0x3731bc: fcvt            s1, d0
    // 0x3731c0: ArrayStore: r0[0] = d1  ; List_8
    //     0x3731c0: stur            s1, [x0, #0x17]
    // 0x3731c4: ldur            x4, [fp, #-8]
    // 0x3731c8: r0 = LoadClassIdInstr(r4)
    //     0x3731c8: ldur            x0, [x4, #-1]
    //     0x3731cc: ubfx            x0, x0, #0xc, #0x14
    // 0x3731d0: mov             x1, x4
    // 0x3731d4: r2 = "maxHp"
    //     0x3731d4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc978] "maxHp"
    //     0x3731d8: ldr             x2, [x2, #0x978]
    // 0x3731dc: r0 = GDT[cid_x0 + -0x1000]()
    //     0x3731dc: sub             lr, x0, #1, lsl #12
    //     0x3731e0: ldr             lr, [x21, lr, lsl #3]
    //     0x3731e4: blr             lr
    // 0x3731e8: mov             x3, x0
    // 0x3731ec: r2 = Null
    //     0x3731ec: mov             x2, NULL
    // 0x3731f0: r1 = Null
    //     0x3731f0: mov             x1, NULL
    // 0x3731f4: stur            x3, [fp, #-0x10]
    // 0x3731f8: branchIfSmi(r0, 0x373220)
    //     0x3731f8: tbz             w0, #0, #0x373220
    // 0x3731fc: r4 = LoadClassIdInstr(r0)
    //     0x3731fc: ldur            x4, [x0, #-1]
    //     0x373200: ubfx            x4, x4, #0xc, #0x14
    // 0x373204: sub             x4, x4, #0x3c
    // 0x373208: cmp             x4, #1
    // 0x37320c: b.ls            #0x373220
    // 0x373210: r8 = int
    //     0x373210: ldr             x8, [PP, #0x78]  ; [pp+0x78] Type: int
    // 0x373214: r3 = Null
    //     0x373214: add             x3, PP, #0xd, lsl #12  ; [pp+0xd218] Null
    //     0x373218: ldr             x3, [x3, #0x218]
    // 0x37321c: r0 = int()
    //     0x37321c: bl              #0x589a08  ; IsType_int_Stub
    // 0x373220: ldur            x3, [fp, #-8]
    // 0x373224: r0 = LoadClassIdInstr(r3)
    //     0x373224: ldur            x0, [x3, #-1]
    //     0x373228: ubfx            x0, x0, #0xc, #0x14
    // 0x37322c: mov             x1, x3
    // 0x373230: r2 = "hp"
    //     0x373230: add             x2, PP, #0xc, lsl #12  ; [pp+0xc980] "hp"
    //     0x373234: ldr             x2, [x2, #0x980]
    // 0x373238: r0 = GDT[cid_x0 + -0x1000]()
    //     0x373238: sub             lr, x0, #1, lsl #12
    //     0x37323c: ldr             lr, [x21, lr, lsl #3]
    //     0x373240: blr             lr
    // 0x373244: mov             x3, x0
    // 0x373248: r2 = Null
    //     0x373248: mov             x2, NULL
    // 0x37324c: r1 = Null
    //     0x37324c: mov             x1, NULL
    // 0x373250: stur            x3, [fp, #-0x18]
    // 0x373254: branchIfSmi(r0, 0x37327c)
    //     0x373254: tbz             w0, #0, #0x37327c
    // 0x373258: r4 = LoadClassIdInstr(r0)
    //     0x373258: ldur            x4, [x0, #-1]
    //     0x37325c: ubfx            x4, x4, #0xc, #0x14
    // 0x373260: sub             x4, x4, #0x3c
    // 0x373264: cmp             x4, #1
    // 0x373268: b.ls            #0x37327c
    // 0x37326c: r8 = int?
    //     0x37326c: ldr             x8, [PP, #0xec0]  ; [pp+0xec0] Type: int?
    // 0x373270: r3 = Null
    //     0x373270: add             x3, PP, #0xd, lsl #12  ; [pp+0xd228] Null
    //     0x373274: ldr             x3, [x3, #0x228]
    // 0x373278: r0 = int?()
    //     0x373278: bl              #0x5899cc  ; IsType_int?_Stub
    // 0x37327c: ldur            x0, [fp, #-0x18]
    // 0x373280: cmp             w0, NULL
    // 0x373284: b.ne            #0x3732a0
    // 0x373288: ldur            x3, [fp, #-0x10]
    // 0x37328c: r0 = LoadInt32Instr(r3)
    //     0x37328c: sbfx            x0, x3, #1, #0x1f
    //     0x373290: tbz             w3, #0, #0x373298
    //     0x373294: ldur            x0, [x3, #7]
    // 0x373298: mov             x5, x0
    // 0x37329c: b               #0x3732b4
    // 0x3732a0: ldur            x3, [fp, #-0x10]
    // 0x3732a4: r1 = LoadInt32Instr(r0)
    //     0x3732a4: sbfx            x1, x0, #1, #0x1f
    //     0x3732a8: tbz             w0, #0, #0x3732b0
    //     0x3732ac: ldur            x1, [x0, #7]
    // 0x3732b0: mov             x5, x1
    // 0x3732b4: ldur            x4, [fp, #-8]
    // 0x3732b8: stur            x5, [fp, #-0x28]
    // 0x3732bc: r0 = LoadClassIdInstr(r4)
    //     0x3732bc: ldur            x0, [x4, #-1]
    //     0x3732c0: ubfx            x0, x0, #0xc, #0x14
    // 0x3732c4: mov             x1, x4
    // 0x3732c8: r2 = "killReward"
    //     0x3732c8: add             x2, PP, #0xc, lsl #12  ; [pp+0xc990] "killReward"
    //     0x3732cc: ldr             x2, [x2, #0x990]
    // 0x3732d0: r0 = GDT[cid_x0 + -0x1000]()
    //     0x3732d0: sub             lr, x0, #1, lsl #12
    //     0x3732d4: ldr             lr, [x21, lr, lsl #3]
    //     0x3732d8: blr             lr
    // 0x3732dc: cmp             w0, NULL
    // 0x3732e0: b.eq            #0x373378
    // 0x3732e4: ldur            x1, [fp, #-8]
    // 0x3732e8: r0 = LoadClassIdInstr(r1)
    //     0x3732e8: ldur            x0, [x1, #-1]
    //     0x3732ec: ubfx            x0, x0, #0xc, #0x14
    // 0x3732f0: r2 = "killReward"
    //     0x3732f0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc990] "killReward"
    //     0x3732f4: ldr             x2, [x2, #0x990]
    // 0x3732f8: r0 = GDT[cid_x0 + -0x1000]()
    //     0x3732f8: sub             lr, x0, #1, lsl #12
    //     0x3732fc: ldr             lr, [x21, lr, lsl #3]
    //     0x373300: blr             lr
    // 0x373304: mov             x3, x0
    // 0x373308: r2 = Null
    //     0x373308: mov             x2, NULL
    // 0x37330c: r1 = Null
    //     0x37330c: mov             x1, NULL
    // 0x373310: stur            x3, [fp, #-0x18]
    // 0x373314: branchIfSmi(r0, 0x37333c)
    //     0x373314: tbz             w0, #0, #0x37333c
    // 0x373318: r4 = LoadClassIdInstr(r0)
    //     0x373318: ldur            x4, [x0, #-1]
    //     0x37331c: ubfx            x4, x4, #0xc, #0x14
    // 0x373320: sub             x4, x4, #0x3c
    // 0x373324: cmp             x4, #1
    // 0x373328: b.ls            #0x37333c
    // 0x37332c: r8 = int
    //     0x37332c: ldr             x8, [PP, #0x78]  ; [pp+0x78] Type: int
    // 0x373330: r3 = Null
    //     0x373330: add             x3, PP, #0xd, lsl #12  ; [pp+0xd238] Null
    //     0x373334: ldr             x3, [x3, #0x238]
    // 0x373338: r0 = int()
    //     0x373338: bl              #0x589a08  ; IsType_int_Stub
    // 0x37333c: ldur            x0, [fp, #-0x18]
    // 0x373340: r2 = LoadInt32Instr(r0)
    //     0x373340: sbfx            x2, x0, #1, #0x1f
    //     0x373344: tbz             w0, #0, #0x37334c
    //     0x373348: ldur            x2, [x0, #7]
    // 0x37334c: mov             x1, x2
    // 0x373350: r0 = 3
    //     0x373350: mov             x0, #3
    // 0x373354: cmp             x1, x0
    // 0x373358: b.hs            #0x373478
    // 0x37335c: r0 = const [Instance of 'KillReward', Instance of 'KillReward', Instance of 'KillReward']
    //     0x37335c: add             x0, PP, #0xd, lsl #12  ; [pp+0xd248] List<KillReward>(3)
    //     0x373360: ldr             x0, [x0, #0x248]
    // 0x373364: ArrayLoad: r1 = r0[r2]  ; Unknown_4
    //     0x373364: add             x16, x0, x2, lsl #2
    //     0x373368: ldur            w1, [x16, #0xf]
    // 0x37336c: DecompressPointer r1
    //     0x37336c: add             x1, x1, HEAP, lsl #32
    // 0x373370: mov             x3, x1
    // 0x373374: b               #0x3733f8
    // 0x373378: ldur            x1, [fp, #-8]
    // 0x37337c: r0 = LoadClassIdInstr(r1)
    //     0x37337c: ldur            x0, [x1, #-1]
    //     0x373380: ubfx            x0, x0, #0xc, #0x14
    // 0x373384: r2 = "givesPlayerABullet"
    //     0x373384: add             x2, PP, #0xd, lsl #12  ; [pp+0xd250] "givesPlayerABullet"
    //     0x373388: ldr             x2, [x2, #0x250]
    // 0x37338c: r0 = GDT[cid_x0 + -0x1000]()
    //     0x37338c: sub             lr, x0, #1, lsl #12
    //     0x373390: ldr             lr, [x21, lr, lsl #3]
    //     0x373394: blr             lr
    // 0x373398: mov             x3, x0
    // 0x37339c: r2 = Null
    //     0x37339c: mov             x2, NULL
    // 0x3733a0: r1 = Null
    //     0x3733a0: mov             x1, NULL
    // 0x3733a4: stur            x3, [fp, #-8]
    // 0x3733a8: r4 = 60
    //     0x3733a8: mov             x4, #0x3c
    // 0x3733ac: branchIfSmi(r0, 0x3733b8)
    //     0x3733ac: tbz             w0, #0, #0x3733b8
    // 0x3733b0: r4 = LoadClassIdInstr(r0)
    //     0x3733b0: ldur            x4, [x0, #-1]
    //     0x3733b4: ubfx            x4, x4, #0xc, #0x14
    // 0x3733b8: cmp             x4, #0x3f
    // 0x3733bc: b.eq            #0x3733d0
    // 0x3733c0: r8 = bool?
    //     0x3733c0: ldr             x8, [PP, #0xe40]  ; [pp+0xe40] Type: bool?
    // 0x3733c4: r3 = Null
    //     0x3733c4: add             x3, PP, #0xd, lsl #12  ; [pp+0xd258] Null
    //     0x3733c8: ldr             x3, [x3, #0x258]
    // 0x3733cc: r0 = DefaultNullableTypeTest()
    //     0x3733cc: bl              #0x58243c  ; DefaultNullableTypeTestStub
    // 0x3733d0: ldur            x0, [fp, #-8]
    // 0x3733d4: cmp             w0, NULL
    // 0x3733d8: b.eq            #0x3733ec
    // 0x3733dc: tbnz            w0, #4, #0x3733ec
    // 0x3733e0: r0 = Instance_KillReward
    //     0x3733e0: add             x0, PP, #0xc, lsl #12  ; [pp+0xc770] Obj!KillReward@5d8b01
    //     0x3733e4: ldr             x0, [x0, #0x770]
    // 0x3733e8: b               #0x3733f4
    // 0x3733ec: r0 = Instance_KillReward
    //     0x3733ec: add             x0, PP, #0xc, lsl #12  ; [pp+0xc988] Obj!KillReward@5d8ac1
    //     0x3733f0: ldr             x0, [x0, #0x988]
    // 0x3733f4: mov             x3, x0
    // 0x3733f8: ldur            x0, [fp, #-0x10]
    // 0x3733fc: ldur            x2, [fp, #-0x28]
    // 0x373400: stur            x3, [fp, #-0x18]
    // 0x373404: r4 = LoadInt32Instr(r0)
    //     0x373404: sbfx            x4, x0, #1, #0x1f
    //     0x373408: tbz             w0, #0, #0x373410
    //     0x37340c: ldur            x4, [x0, #7]
    // 0x373410: stur            x4, [fp, #-0x30]
    // 0x373414: r0 = BoxInt64Instr(r2)
    //     0x373414: sbfiz           x0, x2, #1, #0x1f
    //     0x373418: cmp             x2, x0, asr #1
    //     0x37341c: b.eq            #0x373428
    //     0x373420: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x373424: stur            x2, [x0, #7]
    // 0x373428: r1 = <Forge2DGame<Forge2DWorld>>
    //     0x373428: add             x1, PP, #0xc, lsl #12  ; [pp+0xc768] TypeArguments: <Forge2DGame<Forge2DWorld>>
    //     0x37342c: ldr             x1, [x1, #0x768]
    // 0x373430: stur            x0, [fp, #-8]
    // 0x373434: r0 = Monster()
    //     0x373434: bl              #0x375fcc  ; AllocateMonsterStub -> Monster (size=0xa4)
    // 0x373438: stur            x0, [fp, #-0x10]
    // 0x37343c: ldur            x16, [fp, #-8]
    // 0x373440: ldur            lr, [fp, #-0x18]
    // 0x373444: stp             lr, x16, [SP]
    // 0x373448: mov             x1, x0
    // 0x37344c: ldur            x2, [fp, #-0x20]
    // 0x373450: ldur            x3, [fp, #-0x30]
    // 0x373454: r4 = const [0, 0x5, 0x2, 0x3, hp, 0x3, killReward, 0x4, null]
    //     0x373454: add             x4, PP, #0xd, lsl #12  ; [pp+0xd268] List(9) [0, 0x5, 0x2, 0x3, "hp", 0x3, "killReward", 0x4, Null]
    //     0x373458: ldr             x4, [x4, #0x268]
    // 0x37345c: r0 = Monster()
    //     0x37345c: bl              #0x37347c  ; [package:ricochlime/flame/components/monster.dart] Monster::Monster
    // 0x373460: ldur            x0, [fp, #-0x10]
    // 0x373464: LeaveFrame
    //     0x373464: mov             SP, fp
    //     0x373468: ldp             fp, lr, [SP], #0x10
    // 0x37346c: ret
    //     0x37346c: ret             
    // 0x373470: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x373470: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x373474: b               #0x3730d8
    // 0x373478: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x373478: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ Monster(/* No info */) {
    // ** addr: 0x37347c, size: 0x374
    // 0x37347c: EnterFrame
    //     0x37347c: stp             fp, lr, [SP, #-0x10]!
    //     0x373480: mov             fp, SP
    // 0x373484: AllocStack(0x50)
    //     0x373484: sub             SP, SP, #0x50
    // 0x373488: SetupParameters(Monster this /* r1 => r2, fp-0x10 */, dynamic _ /* r2 => r1, fp-0x18 */)
    //     0x373488: stur            x1, [fp, #-0x10]
    //     0x37348c: mov             x16, x2
    //     0x373490: mov             x2, x1
    //     0x373494: mov             x1, x16
    //     0x373498: stur            x1, [fp, #-0x18]
    // 0x37349c: LoadField: r0 = r4->field_13
    //     0x37349c: ldur            w0, [x4, #0x13]
    // 0x3734a0: LoadField: r5 = r4->field_1f
    //     0x3734a0: ldur            w5, [x4, #0x1f]
    // 0x3734a4: DecompressPointer r5
    //     0x3734a4: add             x5, x5, HEAP, lsl #32
    // 0x3734a8: r16 = "hp"
    //     0x3734a8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc980] "hp"
    //     0x3734ac: ldr             x16, [x16, #0x980]
    // 0x3734b0: cmp             w5, w16
    // 0x3734b4: b.ne            #0x3734d8
    // 0x3734b8: LoadField: r5 = r4->field_23
    //     0x3734b8: ldur            w5, [x4, #0x23]
    // 0x3734bc: DecompressPointer r5
    //     0x3734bc: add             x5, x5, HEAP, lsl #32
    // 0x3734c0: sub             w6, w0, w5
    // 0x3734c4: add             x5, fp, w6, sxtw #2
    // 0x3734c8: ldr             x5, [x5, #8]
    // 0x3734cc: mov             x6, x5
    // 0x3734d0: r5 = 1
    //     0x3734d0: mov             x5, #1
    // 0x3734d4: b               #0x3734e0
    // 0x3734d8: r6 = Null
    //     0x3734d8: mov             x6, NULL
    // 0x3734dc: r5 = 0
    //     0x3734dc: mov             x5, #0
    // 0x3734e0: lsl             x7, x5, #1
    // 0x3734e4: lsl             w5, w7, #1
    // 0x3734e8: add             w7, w5, #8
    // 0x3734ec: ArrayLoad: r8 = r4[r7]  ; Unknown_4
    //     0x3734ec: add             x16, x4, w7, sxtw #1
    //     0x3734f0: ldur            w8, [x16, #0xf]
    // 0x3734f4: DecompressPointer r8
    //     0x3734f4: add             x8, x8, HEAP, lsl #32
    // 0x3734f8: r16 = "killReward"
    //     0x3734f8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc990] "killReward"
    //     0x3734fc: ldr             x16, [x16, #0x990]
    // 0x373500: cmp             w8, w16
    // 0x373504: b.ne            #0x37352c
    // 0x373508: add             w7, w5, #0xa
    // 0x37350c: ArrayLoad: r5 = r4[r7]  ; Unknown_4
    //     0x37350c: add             x16, x4, w7, sxtw #1
    //     0x373510: ldur            w5, [x16, #0xf]
    // 0x373514: DecompressPointer r5
    //     0x373514: add             x5, x5, HEAP, lsl #32
    // 0x373518: sub             w4, w0, w5
    // 0x37351c: add             x0, fp, w4, sxtw #2
    // 0x373520: ldr             x0, [x0, #8]
    // 0x373524: mov             x7, x0
    // 0x373528: b               #0x373530
    // 0x37352c: r7 = Null
    //     0x37352c: mov             x7, NULL
    // 0x373530: r5 = false
    //     0x373530: add             x5, NULL, #0x30  ; false
    // 0x373534: ldr             x4, [THR, #0x90]  ; THR::object_sentinel
    // 0x373538: r0 = Instance_KillReward
    //     0x373538: add             x0, PP, #0xc, lsl #12  ; [pp+0xc988] Obj!KillReward@5d8ac1
    //     0x37353c: ldr             x0, [x0, #0x988]
    // 0x373540: stur            x7, [fp, #-8]
    // 0x373544: CheckStackOverflow
    //     0x373544: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x373548: cmp             SP, x16
    //     0x37354c: b.ls            #0x3737e8
    // 0x373550: StoreField: r2->field_8b = r5
    //     0x373550: stur            w5, [x2, #0x8b]
    // 0x373554: StoreField: r2->field_93 = r4
    //     0x373554: stur            w4, [x2, #0x93]
    // 0x373558: StoreField: r2->field_97 = r4
    //     0x373558: stur            w4, [x2, #0x97]
    // 0x37355c: StoreField: r2->field_9b = r0
    //     0x37355c: stur            w0, [x2, #0x9b]
    // 0x373560: StoreField: r2->field_9f = r5
    //     0x373560: stur            w5, [x2, #0x9f]
    // 0x373564: mov             x0, x1
    // 0x373568: StoreField: r2->field_77 = r0
    //     0x373568: stur            w0, [x2, #0x77]
    //     0x37356c: ldurb           w16, [x2, #-1]
    //     0x373570: ldurb           w17, [x0, #-1]
    //     0x373574: and             x16, x17, x16, lsr #2
    //     0x373578: tst             x16, HEAP, lsr #32
    //     0x37357c: b.eq            #0x373584
    //     0x373580: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x373584: StoreField: r2->field_7b = r3
    //     0x373584: stur            x3, [x2, #0x7b]
    // 0x373588: cmp             w6, NULL
    // 0x37358c: b.ne            #0x373598
    // 0x373590: mov             x0, x3
    // 0x373594: b               #0x3735a4
    // 0x373598: r0 = LoadInt32Instr(r6)
    //     0x373598: sbfx            x0, x6, #1, #0x1f
    //     0x37359c: tbz             w6, #0, #0x3735a4
    //     0x3735a0: ldur            x0, [x6, #7]
    // 0x3735a4: StoreField: r2->field_83 = r0
    //     0x3735a4: stur            x0, [x2, #0x83]
    // 0x3735a8: r16 = 136
    //     0x3735a8: mov             x16, #0x88
    // 0x3735ac: stp             x16, NULL, [SP]
    // 0x3735b0: r0 = ByteData()
    //     0x3735b0: bl              #0x23e6cc  ; [dart:typed_data] ByteData::ByteData
    // 0x3735b4: stur            x0, [fp, #-0x20]
    // 0x3735b8: r0 = Paint()
    //     0x3735b8: bl              #0x28bc30  ; AllocatePaintStub -> Paint (size=0x10)
    // 0x3735bc: mov             x3, x0
    // 0x3735c0: ldur            x0, [fp, #-0x20]
    // 0x3735c4: stur            x3, [fp, #-0x28]
    // 0x3735c8: StoreField: r3->field_7 = r0
    //     0x3735c8: stur            w0, [x3, #7]
    // 0x3735cc: mov             x1, x3
    // 0x3735d0: r2 = Instance_Color
    //     0x3735d0: add             x2, PP, #0xd, lsl #12  ; [pp+0xd270] Obj!Color@5cf791
    //     0x3735d4: ldr             x2, [x2, #0x270]
    // 0x3735d8: r0 = color=()
    //     0x3735d8: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x3735dc: ldur            x1, [fp, #-0x18]
    // 0x3735e0: r0 = getPriorityFromPosition()
    //     0x3735e0: bl              #0x374bf8  ; [package:ricochlime/flame/components/monster.dart] Monster::getPriorityFromPosition
    // 0x3735e4: stur            x0, [fp, #-0x30]
    // 0x3735e8: r0 = BodyDef()
    //     0x3735e8: bl              #0x374bec  ; AllocateBodyDefStub -> BodyDef (size=0x54)
    // 0x3735ec: stur            x0, [fp, #-0x20]
    // 0x3735f0: r16 = true
    //     0x3735f0: add             x16, NULL, #0x20  ; true
    // 0x3735f4: str             x16, [SP]
    // 0x3735f8: mov             x1, x0
    // 0x3735fc: ldur            x2, [fp, #-0x18]
    // 0x373600: r4 = const [0, 0x3, 0x1, 0x2, fixedRotation, 0x2, null]
    //     0x373600: add             x4, PP, #0xd, lsl #12  ; [pp+0xd278] List(7) [0, 0x3, 0x1, 0x2, "fixedRotation", 0x2, Null]
    //     0x373604: ldr             x4, [x4, #0x278]
    // 0x373608: r0 = BodyDef()
    //     0x373608: bl              #0x37493c  ; [package:forge2d/src/dynamics/body_def.dart] BodyDef::BodyDef
    // 0x37360c: ldur            x2, [fp, #-0x30]
    // 0x373610: r0 = BoxInt64Instr(r2)
    //     0x373610: sbfiz           x0, x2, #1, #0x1f
    //     0x373614: cmp             x2, x0, asr #1
    //     0x373618: b.eq            #0x373624
    //     0x37361c: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x373620: stur            x2, [x0, #7]
    // 0x373624: ldur            x16, [fp, #-0x28]
    // 0x373628: stp             x0, x16, [SP, #0x10]
    // 0x37362c: r16 = false
    //     0x37362c: add             x16, NULL, #0x30  ; false
    // 0x373630: ldur            lr, [fp, #-0x20]
    // 0x373634: stp             lr, x16, [SP]
    // 0x373638: ldur            x1, [fp, #-0x10]
    // 0x37363c: r4 = const [0, 0x5, 0x4, 0x1, bodyDef, 0x4, paint, 0x1, priority, 0x2, renderBody, 0x3, null]
    //     0x37363c: add             x4, PP, #0xd, lsl #12  ; [pp+0xd280] List(13) [0, 0x5, 0x4, 0x1, "bodyDef", 0x4, "paint", 0x1, "priority", 0x2, "renderBody", 0x3, Null]
    //     0x373640: ldr             x4, [x4, #0x280]
    // 0x373644: r0 = BodyComponent()
    //     0x373644: bl              #0x374698  ; [package:flame_forge2d/body_component.dart] BodyComponent::BodyComponent
    // 0x373648: ldur            x2, [fp, #-8]
    // 0x37364c: cmp             w2, NULL
    // 0x373650: b.eq            #0x3736a8
    // 0x373654: ldur            x3, [fp, #-0x10]
    // 0x373658: mov             x0, x2
    // 0x37365c: StoreField: r3->field_9b = r0
    //     0x37365c: stur            w0, [x3, #0x9b]
    //     0x373660: ldurb           w16, [x3, #-1]
    //     0x373664: ldurb           w17, [x0, #-1]
    //     0x373668: and             x16, x17, x16, lsr #2
    //     0x37366c: tst             x16, HEAP, lsr #32
    //     0x373670: b.eq            #0x373678
    //     0x373674: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x373678: mov             x1, x3
    // 0x37367c: LoadField: r0 = r1->field_93
    //     0x37367c: ldur            w0, [x1, #0x93]
    // 0x373680: DecompressPointer r0
    //     0x373680: add             x0, x0, HEAP, lsl #32
    // 0x373684: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x373688: cmp             w0, w16
    // 0x37368c: b.ne            #0x37369c
    // 0x373690: r2 = _animation
    //     0x373690: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x373694: ldr             x2, [x2, #0x7d0]
    // 0x373698: r0 = InitLateFinalInstanceField()
    //     0x373698: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37369c: mov             x1, x0
    // 0x3736a0: ldur            x2, [fp, #-8]
    // 0x3736a4: r0 = setSpriteFromKillReward()
    //     0x3736a4: bl              #0x3743e4  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::setSpriteFromKillReward
    // 0x3736a8: ldur            x1, [fp, #-0x10]
    // 0x3736ac: r0 = PolygonShape()
    //     0x3736ac: bl              #0x3743d8  ; AllocatePolygonShapeStub -> PolygonShape (size=0x20)
    // 0x3736b0: mov             x1, x0
    // 0x3736b4: stur            x0, [fp, #-8]
    // 0x3736b8: r0 = PolygonShape()
    //     0x3736b8: bl              #0x3742c0  ; [package:forge2d/src/collision/shapes/polygon_shape.dart] PolygonShape::PolygonShape
    // 0x3736bc: r0 = Vector2()
    //     0x3736bc: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3736c0: r4 = 4
    //     0x3736c0: mov             x4, #4
    // 0x3736c4: stur            x0, [fp, #-0x18]
    // 0x3736c8: r0 = AllocateFloat32Array()
    //     0x3736c8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3736cc: ldur            x2, [fp, #-0x18]
    // 0x3736d0: StoreField: r2->field_7 = r0
    //     0x3736d0: stur            w0, [x2, #7]
    // 0x3736d4: d0 = 0.000000
    //     0x3736d4: add             x17, PP, #0xd, lsl #12  ; [pp+0xd288] IMM: 0x40a00000
    //     0x3736d8: ldr             s0, [x17, #0x288]
    // 0x3736dc: StoreField: r0->field_1b = d0
    //     0x3736dc: stur            s0, [x0, #0x1b]
    // 0x3736e0: d0 = 0.000000
    //     0x3736e0: add             x17, PP, #0xd, lsl #12  ; [pp+0xd290] IMM: 0x40f00000
    //     0x3736e4: ldr             s0, [x17, #0x290]
    // 0x3736e8: ArrayStore: r0[0] = d0  ; List_8
    //     0x3736e8: stur            s0, [x0, #0x17]
    // 0x3736ec: ldur            x1, [fp, #-8]
    // 0x3736f0: r0 = setAsBox()
    //     0x3736f0: bl              #0x3739dc  ; [package:forge2d/src/collision/shapes/polygon_shape.dart] PolygonShape::setAsBox
    // 0x3736f4: r0 = FixtureDef()
    //     0x3736f4: bl              #0x3739d0  ; AllocateFixtureDefStub -> FixtureDef (size=0x30)
    // 0x3736f8: stur            x0, [fp, #-0x18]
    // 0x3736fc: ldur            x16, [fp, #-0x10]
    // 0x373700: str             x16, [SP]
    // 0x373704: mov             x1, x0
    // 0x373708: ldur            x2, [fp, #-8]
    // 0x37370c: r4 = const [0, 0x3, 0x1, 0x2, userData, 0x2, null]
    //     0x37370c: add             x4, PP, #0xd, lsl #12  ; [pp+0xd298] List(7) [0, 0x3, 0x1, 0x2, "userData", 0x2, Null]
    //     0x373710: ldr             x4, [x4, #0x298]
    // 0x373714: r0 = FixtureDef()
    //     0x373714: bl              #0x3737f0  ; [package:forge2d/src/dynamics/fixture_def.dart] FixtureDef::FixtureDef
    // 0x373718: r1 = Null
    //     0x373718: mov             x1, NULL
    // 0x37371c: r2 = 2
    //     0x37371c: mov             x2, #2
    // 0x373720: r0 = AllocateArray()
    //     0x373720: bl              #0x5845d8  ; AllocateArrayStub
    // 0x373724: mov             x2, x0
    // 0x373728: ldur            x0, [fp, #-0x18]
    // 0x37372c: stur            x2, [fp, #-8]
    // 0x373730: StoreField: r2->field_f = r0
    //     0x373730: stur            w0, [x2, #0xf]
    // 0x373734: r1 = <FixtureDef>
    //     0x373734: add             x1, PP, #0xd, lsl #12  ; [pp+0xd2a0] TypeArguments: <FixtureDef>
    //     0x373738: ldr             x1, [x1, #0x2a0]
    // 0x37373c: r0 = AllocateGrowableArray()
    //     0x37373c: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x373740: mov             x1, x0
    // 0x373744: ldur            x0, [fp, #-8]
    // 0x373748: StoreField: r1->field_f = r0
    //     0x373748: stur            w0, [x1, #0xf]
    // 0x37374c: r0 = 2
    //     0x37374c: mov             x0, #2
    // 0x373750: StoreField: r1->field_b = r0
    //     0x373750: stur            w0, [x1, #0xb]
    // 0x373754: mov             x0, x1
    // 0x373758: ldur            x2, [fp, #-0x10]
    // 0x37375c: StoreField: r2->field_4b = r0
    //     0x37375c: stur            w0, [x2, #0x4b]
    //     0x373760: ldurb           w16, [x2, #-1]
    //     0x373764: ldurb           w17, [x0, #-1]
    //     0x373768: and             x16, x17, x16, lsr #2
    //     0x37376c: tst             x16, HEAP, lsr #32
    //     0x373770: b.eq            #0x373778
    //     0x373774: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x373778: mov             x1, x2
    // 0x37377c: LoadField: r0 = r1->field_93
    //     0x37377c: ldur            w0, [x1, #0x93]
    // 0x373780: DecompressPointer r0
    //     0x373780: add             x0, x0, HEAP, lsl #32
    // 0x373784: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x373788: cmp             w0, w16
    // 0x37378c: b.ne            #0x37379c
    // 0x373790: r2 = _animation
    //     0x373790: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x373794: ldr             x2, [x2, #0x7d0]
    // 0x373798: r0 = InitLateFinalInstanceField()
    //     0x373798: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37379c: ldur            x1, [fp, #-0x10]
    // 0x3737a0: mov             x2, x0
    // 0x3737a4: r0 = _addChild()
    //     0x3737a4: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x3737a8: ldur            x1, [fp, #-0x10]
    // 0x3737ac: LoadField: r0 = r1->field_97
    //     0x3737ac: ldur            w0, [x1, #0x97]
    // 0x3737b0: DecompressPointer r0
    //     0x3737b0: add             x0, x0, HEAP, lsl #32
    // 0x3737b4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3737b8: cmp             w0, w16
    // 0x3737bc: b.ne            #0x3737cc
    // 0x3737c0: r2 = _healthBar
    //     0x3737c0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc9a0] Field <Monster._healthBar@228109025>: late final (offset: 0x98)
    //     0x3737c4: ldr             x2, [x2, #0x9a0]
    // 0x3737c8: r0 = InitLateFinalInstanceField()
    //     0x3737c8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3737cc: ldur            x1, [fp, #-0x10]
    // 0x3737d0: mov             x2, x0
    // 0x3737d4: r0 = _addChild()
    //     0x3737d4: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x3737d8: r0 = Null
    //     0x3737d8: mov             x0, NULL
    // 0x3737dc: LeaveFrame
    //     0x3737dc: mov             SP, fp
    //     0x3737e0: ldp             fp, lr, [SP], #0x10
    // 0x3737e4: ret
    //     0x3737e4: ret             
    // 0x3737e8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3737e8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3737ec: b               #0x373550
  }
  static _ getPriorityFromPosition(/* No info */) {
    // ** addr: 0x374bf8, size: 0x12c
    // 0x374bf8: EnterFrame
    //     0x374bf8: stp             fp, lr, [SP, #-0x10]!
    //     0x374bfc: mov             fp, SP
    // 0x374c00: d0 = 213.333333
    //     0x374c00: add             x17, PP, #0xd, lsl #12  ; [pp+0xd0b8] IMM: double(213.33333333333334) from 0x406aaaaaaaaaaaab
    //     0x374c04: ldr             d0, [x17, #0xb8]
    // 0x374c08: CheckStackOverflow
    //     0x374c08: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x374c0c: cmp             SP, x16
    //     0x374c10: b.ls            #0x374ce4
    // 0x374c14: LoadField: r2 = r1->field_7
    //     0x374c14: ldur            w2, [x1, #7]
    // 0x374c18: DecompressPointer r2
    //     0x374c18: add             x2, x2, HEAP, lsl #32
    // 0x374c1c: LoadField: r0 = r2->field_13
    //     0x374c1c: ldur            w0, [x2, #0x13]
    // 0x374c20: r1 = LoadInt32Instr(r0)
    //     0x374c20: sbfx            x1, x0, #1, #0x1f
    // 0x374c24: mov             x0, x1
    // 0x374c28: r1 = 1
    //     0x374c28: mov             x1, #1
    // 0x374c2c: cmp             x1, x0
    // 0x374c30: b.hs            #0x374cec
    // 0x374c34: LoadField: d1 = r2->field_1b
    //     0x374c34: ldur            s1, [x2, #0x1b]
    // 0x374c38: fcvt            d2, s1
    // 0x374c3c: fdiv            d1, d2, d0
    // 0x374c40: r3 = inline_Allocate_Double()
    //     0x374c40: ldp             x3, x0, [THR, #0x60]  ; THR::top
    //     0x374c44: add             x3, x3, #0x10
    //     0x374c48: cmp             x0, x3
    //     0x374c4c: b.ls            #0x374cf0
    //     0x374c50: str             x3, [THR, #0x60]  ; THR::top
    //     0x374c54: sub             x3, x3, #0xf
    //     0x374c58: mov             x0, #0xe19c
    //     0x374c5c: movk            x0, #3, lsl #16
    //     0x374c60: stur            x0, [x3, #-1]
    // 0x374c64: dmb             ishst
    // 0x374c68: StoreField: r3->field_7 = d1
    //     0x374c68: stur            d1, [x3, #7]
    // 0x374c6c: r1 = -200
    //     0x374c6c: mov             x1, #-0xc8
    // 0x374c70: r2 = 0
    //     0x374c70: mov             x2, #0
    // 0x374c74: r0 = lerpDouble()
    //     0x374c74: bl              #0x2c2730  ; [dart:ui] ::lerpDouble
    // 0x374c78: LoadField: d0 = r0->field_7
    //     0x374c78: ldur            d0, [x0, #7]
    // 0x374c7c: stp             fp, lr, [SP, #-0x10]!
    // 0x374c80: mov             fp, SP
    // 0x374c84: CallRuntime_LibcRound(double) -> double
    //     0x374c84: and             SP, SP, #0xfffffffffffffff0
    //     0x374c88: mov             sp, SP
    //     0x374c8c: ldr             x16, [THR, #0x770]  ; THR::LibcRound
    //     0x374c90: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x374c94: blr             x16
    //     0x374c98: mov             x16, #8
    //     0x374c9c: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x374ca0: ldr             x16, [THR, #0x690]  ; THR::saved_stack_limit
    //     0x374ca4: sub             sp, x16, #1, lsl #12
    //     0x374ca8: mov             SP, fp
    //     0x374cac: ldp             fp, lr, [SP], #0x10
    // 0x374cb0: fcmp            d0, d0
    // 0x374cb4: b.vs            #0x374d04
    // 0x374cb8: fcvtzs          x1, d0
    // 0x374cbc: asr             x16, x1, #0x1e
    // 0x374cc0: cmp             x16, x1, asr #63
    // 0x374cc4: b.ne            #0x374d04
    // 0x374cc8: lsl             x1, x1, #1
    // 0x374ccc: r0 = LoadInt32Instr(r1)
    //     0x374ccc: sbfx            x0, x1, #1, #0x1f
    //     0x374cd0: tbz             w1, #0, #0x374cd8
    //     0x374cd4: ldur            x0, [x1, #7]
    // 0x374cd8: LeaveFrame
    //     0x374cd8: mov             SP, fp
    //     0x374cdc: ldp             fp, lr, [SP], #0x10
    // 0x374ce0: ret
    //     0x374ce0: ret             
    // 0x374ce4: r0 = StackOverflowSharedWithFPURegs()
    //     0x374ce4: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x374ce8: b               #0x374c14
    // 0x374cec: r0 = RangeErrorSharedWithFPURegs()
    //     0x374cec: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x374cf0: SaveReg d1
    //     0x374cf0: str             q1, [SP, #-0x10]!
    // 0x374cf4: r0 = AllocateDouble()
    //     0x374cf4: bl              #0x584528  ; AllocateDoubleStub
    // 0x374cf8: mov             x3, x0
    // 0x374cfc: RestoreReg d1
    //     0x374cfc: ldr             q1, [SP], #0x10
    // 0x374d00: b               #0x374c68
    // 0x374d04: SaveReg d0
    //     0x374d04: str             q0, [SP, #-0x10]!
    // 0x374d08: r0 = 76
    //     0x374d08: mov             x0, #0x4c
    // 0x374d0c: r30 = DoubleToIntegerStub
    //     0x374d0c: ldr             lr, [PP, #0x2cc0]  ; [pp+0x2cc0] Stub: DoubleToInteger (0x2318e4)
    // 0x374d10: LoadField: r30 = r30->field_7
    //     0x374d10: ldur            lr, [lr, #7]
    // 0x374d14: blr             lr
    // 0x374d18: mov             x1, x0
    // 0x374d1c: RestoreReg d0
    //     0x374d1c: ldr             q0, [SP], #0x10
    // 0x374d20: b               #0x374ccc
  }
  HealthBar _healthBar(Monster) {
    // ** addr: 0x374d24, size: 0x8c
    // 0x374d24: EnterFrame
    //     0x374d24: stp             fp, lr, [SP, #-0x10]!
    //     0x374d28: mov             fp, SP
    // 0x374d2c: AllocStack(0x18)
    //     0x374d2c: sub             SP, SP, #0x18
    // 0x374d30: CheckStackOverflow
    //     0x374d30: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x374d34: cmp             SP, x16
    //     0x374d38: b.ls            #0x374da8
    // 0x374d3c: ldr             x1, [fp, #0x10]
    // 0x374d40: LoadField: r3 = r1->field_7b
    //     0x374d40: ldur            x3, [x1, #0x7b]
    // 0x374d44: stur            x3, [fp, #-0x10]
    // 0x374d48: LoadField: r2 = r1->field_83
    //     0x374d48: ldur            x2, [x1, #0x83]
    // 0x374d4c: stur            x2, [fp, #-8]
    // 0x374d50: LoadField: r0 = r1->field_93
    //     0x374d50: ldur            w0, [x1, #0x93]
    // 0x374d54: DecompressPointer r0
    //     0x374d54: add             x0, x0, HEAP, lsl #32
    // 0x374d58: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x374d5c: cmp             w0, w16
    // 0x374d60: b.ne            #0x374d70
    // 0x374d64: r2 = _animation
    //     0x374d64: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x374d68: ldr             x2, [x2, #0x7d0]
    // 0x374d6c: r0 = InitLateFinalInstanceField()
    //     0x374d6c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x374d70: LoadField: r5 = r0->field_47
    //     0x374d70: ldur            w5, [x0, #0x47]
    // 0x374d74: DecompressPointer r5
    //     0x374d74: add             x5, x5, HEAP, lsl #32
    // 0x374d78: stur            x5, [fp, #-0x18]
    // 0x374d7c: r0 = HealthBar()
    //     0x374d7c: bl              #0x374e7c  ; AllocateHealthBarStub -> HealthBar (size=0x5c)
    // 0x374d80: mov             x1, x0
    // 0x374d84: ldur            x2, [fp, #-8]
    // 0x374d88: ldur            x3, [fp, #-0x10]
    // 0x374d8c: ldur            x5, [fp, #-0x18]
    // 0x374d90: stur            x0, [fp, #-0x18]
    // 0x374d94: r0 = HealthBar()
    //     0x374d94: bl              #0x374db0  ; [package:ricochlime/flame/components/health_bar.dart] HealthBar::HealthBar
    // 0x374d98: ldur            x0, [fp, #-0x18]
    // 0x374d9c: LeaveFrame
    //     0x374d9c: mov             SP, fp
    //     0x374da0: ldp             fp, lr, [SP], #0x10
    // 0x374da4: ret
    //     0x374da4: ret             
    // 0x374da8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x374da8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x374dac: b               #0x374d3c
  }
  MonsterAnimation _animation(Monster) {
    // ** addr: 0x374e88, size: 0x48
    // 0x374e88: EnterFrame
    //     0x374e88: stp             fp, lr, [SP, #-0x10]!
    //     0x374e8c: mov             fp, SP
    // 0x374e90: AllocStack(0x8)
    //     0x374e90: sub             SP, SP, #8
    // 0x374e94: CheckStackOverflow
    //     0x374e94: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x374e98: cmp             SP, x16
    //     0x374e9c: b.ls            #0x374ec8
    // 0x374ea0: r1 = <MonsterState>
    //     0x374ea0: add             x1, PP, #0xc, lsl #12  ; [pp+0xc858] TypeArguments: <MonsterState>
    //     0x374ea4: ldr             x1, [x1, #0x858]
    // 0x374ea8: r0 = MonsterAnimation()
    //     0x374ea8: bl              #0x375fc0  ; AllocateMonsterAnimationStub -> MonsterAnimation (size=0x80)
    // 0x374eac: mov             x1, x0
    // 0x374eb0: stur            x0, [fp, #-8]
    // 0x374eb4: r0 = MonsterAnimation._()
    //     0x374eb4: bl              #0x374ed0  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::MonsterAnimation._
    // 0x374eb8: ldur            x0, [fp, #-8]
    // 0x374ebc: LeaveFrame
    //     0x374ebc: mov             SP, fp
    //     0x374ec0: ldp             fp, lr, [SP], #0x10
    // 0x374ec4: ret
    //     0x374ec4: ret             
    // 0x374ec8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x374ec8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x374ecc: b               #0x374ea0
  }
  set _ hp=(/* No info */) {
    // ** addr: 0x377494, size: 0x218
    // 0x377494: EnterFrame
    //     0x377494: stp             fp, lr, [SP, #-0x10]!
    //     0x377498: mov             fp, SP
    // 0x37749c: AllocStack(0x20)
    //     0x37749c: sub             SP, SP, #0x20
    // 0x3774a0: SetupParameters(Monster this /* r1 => r0, fp-0x8 */, dynamic _ /* r2 => r2, fp-0x10 */)
    //     0x3774a0: mov             x0, x1
    //     0x3774a4: stur            x1, [fp, #-8]
    //     0x3774a8: stur            x2, [fp, #-0x10]
    // 0x3774ac: CheckStackOverflow
    //     0x3774ac: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3774b0: cmp             SP, x16
    //     0x3774b4: b.ls            #0x3776a4
    // 0x3774b8: StoreField: r0->field_83 = r2
    //     0x3774b8: stur            x2, [x0, #0x83]
    // 0x3774bc: mov             x1, x0
    // 0x3774c0: LoadField: r0 = r1->field_97
    //     0x3774c0: ldur            w0, [x1, #0x97]
    // 0x3774c4: DecompressPointer r0
    //     0x3774c4: add             x0, x0, HEAP, lsl #32
    // 0x3774c8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3774cc: cmp             w0, w16
    // 0x3774d0: b.ne            #0x3774e0
    // 0x3774d4: r2 = _healthBar
    //     0x3774d4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc9a0] Field <Monster._healthBar@228109025>: late final (offset: 0x98)
    //     0x3774d8: ldr             x2, [x2, #0x9a0]
    // 0x3774dc: r0 = InitLateFinalInstanceField()
    //     0x3774dc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3774e0: mov             x1, x0
    // 0x3774e4: ldur            x0, [fp, #-0x10]
    // 0x3774e8: StoreField: r1->field_4f = r0
    //     0x3774e8: stur            x0, [x1, #0x4f]
    // 0x3774ec: ldur            x0, [fp, #-8]
    // 0x3774f0: LoadField: r1 = r0->field_83
    //     0x3774f0: ldur            x1, [x0, #0x83]
    // 0x3774f4: cmp             x1, #0
    // 0x3774f8: b.gt            #0x377694
    // 0x3774fc: mov             x1, x0
    // 0x377500: LoadField: r0 = r1->field_93
    //     0x377500: ldur            w0, [x1, #0x93]
    // 0x377504: DecompressPointer r0
    //     0x377504: add             x0, x0, HEAP, lsl #32
    // 0x377508: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37750c: cmp             w0, w16
    // 0x377510: b.ne            #0x377520
    // 0x377514: r2 = _animation
    //     0x377514: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x377518: ldr             x2, [x2, #0x7d0]
    // 0x37751c: r0 = InitLateFinalInstanceField()
    //     0x37751c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x377520: mov             x1, x0
    // 0x377524: r2 = Instance_MonsterState
    //     0x377524: add             x2, PP, #0xc, lsl #12  ; [pp+0xc870] Obj!MonsterState@5d8b81
    //     0x377528: ldr             x2, [x2, #0x870]
    // 0x37752c: r0 = current=()
    //     0x37752c: bl              #0x3780ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::current=
    // 0x377530: ldur            x0, [fp, #-8]
    // 0x377534: LoadField: r1 = r0->field_97
    //     0x377534: ldur            w1, [x0, #0x97]
    // 0x377538: DecompressPointer r1
    //     0x377538: add             x1, x1, HEAP, lsl #32
    // 0x37753c: r0 = removeFromParent()
    //     0x37753c: bl              #0x3779a0  ; [package:flame/src/components/core/component.dart] Component::removeFromParent
    // 0x377540: ldur            x1, [fp, #-8]
    // 0x377544: LoadField: r0 = r1->field_8b
    //     0x377544: ldur            w0, [x1, #0x8b]
    // 0x377548: DecompressPointer r0
    //     0x377548: add             x0, x0, HEAP, lsl #32
    // 0x37754c: tbz             w0, #4, #0x377694
    // 0x377550: r0 = LoadStaticField(0xccc)
    //     0x377550: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x377554: ldr             x0, [x0, #0x1998]
    // 0x377558: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37755c: cmp             w0, w16
    // 0x377560: b.ne            #0x377570
    // 0x377564: r2 = stows
    //     0x377564: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x377568: ldr             x2, [x2, #0x310]
    // 0x37756c: r0 = InitLateFinalStaticField()
    //     0x37756c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x377570: stur            x0, [fp, #-0x20]
    // 0x377574: LoadField: r2 = r0->field_47
    //     0x377574: ldur            w2, [x0, #0x47]
    // 0x377578: DecompressPointer r2
    //     0x377578: add             x2, x2, HEAP, lsl #32
    // 0x37757c: mov             x1, x2
    // 0x377580: stur            x2, [fp, #-0x18]
    // 0x377584: LoadField: r0 = r1->field_43
    //     0x377584: ldur            w0, [x1, #0x43]
    // 0x377588: DecompressPointer r0
    //     0x377588: add             x0, x0, HEAP, lsl #32
    // 0x37758c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x377590: cmp             w0, w16
    // 0x377594: b.ne            #0x3775a4
    // 0x377598: r2 = _value
    //     0x377598: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x37759c: ldr             x2, [x2, #0x4b0]
    // 0x3775a0: r0 = InitLateInstanceField()
    //     0x3775a0: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3775a4: r1 = LoadInt32Instr(r0)
    //     0x3775a4: sbfx            x1, x0, #1, #0x1f
    //     0x3775a8: tbz             w0, #0, #0x3775b0
    //     0x3775ac: ldur            x1, [x0, #7]
    // 0x3775b0: add             x2, x1, #1
    // 0x3775b4: r0 = BoxInt64Instr(r2)
    //     0x3775b4: sbfiz           x0, x2, #1, #0x1f
    //     0x3775b8: cmp             x2, x0, asr #1
    //     0x3775bc: b.eq            #0x3775c8
    //     0x3775c0: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3775c4: stur            x2, [x0, #7]
    // 0x3775c8: ldur            x1, [fp, #-0x18]
    // 0x3775cc: mov             x2, x0
    // 0x3775d0: r0 = value=()
    //     0x3775d0: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x3775d4: ldur            x0, [fp, #-8]
    // 0x3775d8: LoadField: r1 = r0->field_9b
    //     0x3775d8: ldur            w1, [x0, #0x9b]
    // 0x3775dc: DecompressPointer r1
    //     0x3775dc: add             x1, x1, HEAP, lsl #32
    // 0x3775e0: LoadField: r2 = r1->field_7
    //     0x3775e0: ldur            x2, [x1, #7]
    // 0x3775e4: cmp             x2, #1
    // 0x3775e8: b.gt            #0x377680
    // 0x3775ec: cmp             x2, #0
    // 0x3775f0: b.gt            #0x3775fc
    // 0x3775f4: mov             x1, x0
    // 0x3775f8: b               #0x37768c
    // 0x3775fc: ldur            x2, [fp, #-0x20]
    // 0x377600: mov             x1, x0
    // 0x377604: r0 = game()
    //     0x377604: bl              #0x377894  ; [dart:mixin_deduplication] _MixinApplication265&Component&HasGameReference::game
    // 0x377608: LoadField: r1 = r0->field_ab
    //     0x377608: ldur            x1, [x0, #0xab]
    // 0x37760c: add             x2, x1, #1
    // 0x377610: StoreField: r0->field_ab = r2
    //     0x377610: stur            x2, [x0, #0xab]
    // 0x377614: ldur            x1, [fp, #-0x20]
    // 0x377618: LoadField: r0 = r1->field_43
    //     0x377618: ldur            w0, [x1, #0x43]
    // 0x37761c: DecompressPointer r0
    //     0x37761c: add             x0, x0, HEAP, lsl #32
    // 0x377620: mov             x1, x0
    // 0x377624: stur            x0, [fp, #-0x18]
    // 0x377628: LoadField: r0 = r1->field_43
    //     0x377628: ldur            w0, [x1, #0x43]
    // 0x37762c: DecompressPointer r0
    //     0x37762c: add             x0, x0, HEAP, lsl #32
    // 0x377630: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x377634: cmp             w0, w16
    // 0x377638: b.ne            #0x377648
    // 0x37763c: r2 = _value
    //     0x37763c: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x377640: ldr             x2, [x2, #0x4b0]
    // 0x377644: r0 = InitLateInstanceField()
    //     0x377644: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x377648: r1 = LoadInt32Instr(r0)
    //     0x377648: sbfx            x1, x0, #1, #0x1f
    //     0x37764c: tbz             w0, #0, #0x377654
    //     0x377650: ldur            x1, [x0, #7]
    // 0x377654: add             x2, x1, #1
    // 0x377658: r0 = BoxInt64Instr(r2)
    //     0x377658: sbfiz           x0, x2, #1, #0x1f
    //     0x37765c: cmp             x2, x0, asr #1
    //     0x377660: b.eq            #0x37766c
    //     0x377664: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x377668: stur            x2, [x0, #7]
    // 0x37766c: ldur            x1, [fp, #-0x18]
    // 0x377670: mov             x2, x0
    // 0x377674: r0 = value=()
    //     0x377674: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x377678: ldur            x1, [fp, #-8]
    // 0x37767c: b               #0x37768c
    // 0x377680: ldur            x1, [fp, #-0x20]
    // 0x377684: r0 = addCoins()
    //     0x377684: bl              #0x3776c4  ; [package:ricochlime/utils/stows.dart] Stows::addCoins
    // 0x377688: ldur            x1, [fp, #-8]
    // 0x37768c: r2 = true
    //     0x37768c: add             x2, NULL, #0x20  ; true
    // 0x377690: StoreField: r1->field_8b = r2
    //     0x377690: stur            w2, [x1, #0x8b]
    // 0x377694: r0 = Null
    //     0x377694: mov             x0, NULL
    // 0x377698: LeaveFrame
    //     0x377698: mov             SP, fp
    //     0x37769c: ldp             fp, lr, [SP], #0x10
    // 0x3776a0: ret
    //     0x3776a0: ret             
    // 0x3776a4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3776a4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3776a8: b               #0x3774b8
  }
  get _ isDead(/* No info */) {
    // ** addr: 0x3776ac, size: 0x18
    // 0x3776ac: LoadField: r2 = r1->field_83
    //     0x3776ac: ldur            x2, [x1, #0x83]
    // 0x3776b0: cmp             x2, #0
    // 0x3776b4: r16 = true
    //     0x3776b4: add             x16, NULL, #0x20  ; true
    // 0x3776b8: r17 = false
    //     0x3776b8: add             x17, NULL, #0x30  ; false
    // 0x3776bc: csel            x0, x16, x17, le
    // 0x3776c0: ret
    //     0x3776c0: ret             
  }
  _ startRagdoll(/* No info */) {
    // ** addr: 0x379068, size: 0x354
    // 0x379068: EnterFrame
    //     0x379068: stp             fp, lr, [SP, #-0x10]!
    //     0x37906c: mov             fp, SP
    // 0x379070: AllocStack(0x20)
    //     0x379070: sub             SP, SP, #0x20
    // 0x379074: SetupParameters(Monster this /* r1 => r0, fp-0x8 */)
    //     0x379074: mov             x0, x1
    //     0x379078: stur            x1, [fp, #-8]
    // 0x37907c: CheckStackOverflow
    //     0x37907c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x379080: cmp             SP, x16
    //     0x379084: b.ls            #0x3793a0
    // 0x379088: LoadField: r1 = r0->field_83
    //     0x379088: ldur            x1, [x0, #0x83]
    // 0x37908c: cmp             x1, #0
    // 0x379090: b.gt            #0x3790a4
    // 0x379094: r0 = Null
    //     0x379094: mov             x0, NULL
    // 0x379098: LeaveFrame
    //     0x379098: mov             SP, fp
    //     0x37909c: ldp             fp, lr, [SP], #0x10
    // 0x3790a0: ret
    //     0x3790a0: ret             
    // 0x3790a4: mov             x1, x0
    // 0x3790a8: LoadField: r0 = r1->field_93
    //     0x3790a8: ldur            w0, [x1, #0x93]
    // 0x3790ac: DecompressPointer r0
    //     0x3790ac: add             x0, x0, HEAP, lsl #32
    // 0x3790b0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3790b4: cmp             w0, w16
    // 0x3790b8: b.ne            #0x3790c8
    // 0x3790bc: r2 = _animation
    //     0x3790bc: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x3790c0: ldr             x2, [x2, #0x7d0]
    // 0x3790c4: r0 = InitLateFinalInstanceField()
    //     0x3790c4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3790c8: LoadField: r1 = r0->field_4f
    //     0x3790c8: ldur            w1, [x0, #0x4f]
    // 0x3790cc: DecompressPointer r1
    //     0x3790cc: add             x1, x1, HEAP, lsl #32
    // 0x3790d0: r16 = Instance_MonsterState
    //     0x3790d0: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7d8] Obj!MonsterState@5d8b61
    //     0x3790d4: ldr             x16, [x16, #0x7d8]
    // 0x3790d8: cmp             w1, w16
    // 0x3790dc: b.ne            #0x3790f0
    // 0x3790e0: r0 = Null
    //     0x3790e0: mov             x0, NULL
    // 0x3790e4: LeaveFrame
    //     0x3790e4: mov             SP, fp
    //     0x3790e8: ldp             fp, lr, [SP], #0x10
    // 0x3790ec: ret
    //     0x3790ec: ret             
    // 0x3790f0: ldur            x0, [fp, #-8]
    // 0x3790f4: mov             x1, x0
    // 0x3790f8: LoadField: r0 = r1->field_97
    //     0x3790f8: ldur            w0, [x1, #0x97]
    // 0x3790fc: DecompressPointer r0
    //     0x3790fc: add             x0, x0, HEAP, lsl #32
    // 0x379100: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x379104: cmp             w0, w16
    // 0x379108: b.ne            #0x379118
    // 0x37910c: r2 = _healthBar
    //     0x37910c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc9a0] Field <Monster._healthBar@228109025>: late final (offset: 0x98)
    //     0x379110: ldr             x2, [x2, #0x9a0]
    // 0x379114: r0 = InitLateFinalInstanceField()
    //     0x379114: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x379118: ldur            x1, [fp, #-8]
    // 0x37911c: mov             x2, x0
    // 0x379120: r0 = _removeChild()
    //     0x379120: bl              #0x3779e4  ; [package:flame/src/components/core/component.dart] Component::_removeChild
    // 0x379124: ldur            x0, [fp, #-8]
    // 0x379128: LoadField: r1 = r0->field_93
    //     0x379128: ldur            w1, [x0, #0x93]
    // 0x37912c: DecompressPointer r1
    //     0x37912c: add             x1, x1, HEAP, lsl #32
    // 0x379130: r2 = Instance_MonsterState
    //     0x379130: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d8] Obj!MonsterState@5d8b61
    //     0x379134: ldr             x2, [x2, #0x7d8]
    // 0x379138: r0 = current=()
    //     0x379138: bl              #0x3780ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::current=
    // 0x37913c: ldur            x0, [fp, #-8]
    // 0x379140: LoadField: r3 = r0->field_43
    //     0x379140: ldur            w3, [x0, #0x43]
    // 0x379144: DecompressPointer r3
    //     0x379144: add             x3, x3, HEAP, lsl #32
    // 0x379148: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37914c: cmp             w3, w16
    // 0x379150: b.eq            #0x3793a8
    // 0x379154: mov             x1, x3
    // 0x379158: stur            x3, [fp, #-0x10]
    // 0x37915c: r2 = Instance_BodyType
    //     0x37915c: add             x2, PP, #0xd, lsl #12  ; [pp+0xd088] Obj!BodyType@5d9051
    //     0x379160: ldr             x2, [x2, #0x88]
    // 0x379164: r0 = setType()
    //     0x379164: bl              #0x37a030  ; [package:forge2d/src/dynamics/body.dart] Body::setType
    // 0x379168: ldur            x0, [fp, #-0x10]
    // 0x37916c: LoadField: r2 = r0->field_27
    //     0x37916c: ldur            w2, [x0, #0x27]
    // 0x379170: DecompressPointer r2
    //     0x379170: add             x2, x2, HEAP, lsl #32
    // 0x379174: ldur            x3, [fp, #-8]
    // 0x379178: stur            x2, [fp, #-0x18]
    // 0x37917c: LoadField: r1 = r3->field_3b
    //     0x37917c: ldur            w1, [x3, #0x3b]
    // 0x379180: DecompressPointer r1
    //     0x379180: add             x1, x1, HEAP, lsl #32
    // 0x379184: cmp             w1, NULL
    // 0x379188: b.ne            #0x3791bc
    // 0x37918c: mov             x1, x3
    // 0x379190: r0 = _findGameAndCheck()
    //     0x379190: bl              #0x377910  ; [dart:mixin_deduplication] _MixinApplication265&Component&HasGameReference::_findGameAndCheck
    // 0x379194: mov             x1, x0
    // 0x379198: ldur            x2, [fp, #-8]
    // 0x37919c: StoreField: r2->field_3b = r0
    //     0x37919c: stur            w0, [x2, #0x3b]
    //     0x3791a0: ldurb           w16, [x2, #-1]
    //     0x3791a4: ldurb           w17, [x0, #-1]
    //     0x3791a8: and             x16, x17, x16, lsr #2
    //     0x3791ac: tst             x16, HEAP, lsr #32
    //     0x3791b0: b.eq            #0x3791b8
    //     0x3791b4: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3791b8: b               #0x3791c0
    // 0x3791bc: mov             x2, x3
    // 0x3791c0: ldur            x0, [fp, #-0x18]
    // 0x3791c4: LoadField: r0 = r1->field_a7
    //     0x3791c4: ldur            w0, [x1, #0xa7]
    // 0x3791c8: DecompressPointer r0
    //     0x3791c8: add             x0, x0, HEAP, lsl #32
    // 0x3791cc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3791d0: cmp             w0, w16
    // 0x3791d4: b.ne            #0x3791e4
    // 0x3791d8: r2 = random
    //     0x3791d8: add             x2, PP, #0xd, lsl #12  ; [pp+0xd090] Field <RicochlimeGame.random>: late (offset: 0xa8)
    //     0x3791dc: ldr             x2, [x2, #0x90]
    // 0x3791e0: r0 = InitLateInstanceField()
    //     0x3791e0: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3791e4: mov             x1, x0
    // 0x3791e8: d0 = 6.400000
    //     0x3791e8: add             x17, PP, #0xd, lsl #12  ; [pp+0xd098] IMM: double(6.4) from 0x401999999999999a
    //     0x3791ec: ldr             d0, [x17, #0x98]
    // 0x3791f0: r0 = RandomExtension.plusOrMinus()
    //     0x3791f0: bl              #0x379fe8  ; [package:ricochlime/utils/random_extension.dart] ::RandomExtension.plusOrMinus
    // 0x3791f4: ldur            x0, [fp, #-0x18]
    // 0x3791f8: LoadField: r2 = r0->field_7
    //     0x3791f8: ldur            w2, [x0, #7]
    // 0x3791fc: DecompressPointer r2
    //     0x3791fc: add             x2, x2, HEAP, lsl #32
    // 0x379200: LoadField: r0 = r2->field_13
    //     0x379200: ldur            w0, [x2, #0x13]
    // 0x379204: r1 = LoadInt32Instr(r0)
    //     0x379204: sbfx            x1, x0, #1, #0x1f
    // 0x379208: mov             x0, x1
    // 0x37920c: r1 = 1
    //     0x37920c: mov             x1, #1
    // 0x379210: cmp             x1, x0
    // 0x379214: b.hs            #0x3793b4
    // 0x379218: d1 = 0.000000
    //     0x379218: add             x17, PP, #0xd, lsl #12  ; [pp+0xd0a0] IMM: 0x412aaaab
    //     0x37921c: ldr             s1, [x17, #0xa0]
    // 0x379220: StoreField: r2->field_1b = d1
    //     0x379220: stur            s1, [x2, #0x1b]
    // 0x379224: fcvt            s1, d0
    // 0x379228: ArrayStore: r2[0] = d1  ; List_8
    //     0x379228: stur            s1, [x2, #0x17]
    // 0x37922c: ldur            x0, [fp, #-8]
    // 0x379230: LoadField: r1 = r0->field_3b
    //     0x379230: ldur            w1, [x0, #0x3b]
    // 0x379234: DecompressPointer r1
    //     0x379234: add             x1, x1, HEAP, lsl #32
    // 0x379238: cmp             w1, NULL
    // 0x37923c: b.ne            #0x379270
    // 0x379240: mov             x1, x0
    // 0x379244: r0 = _findGameAndCheck()
    //     0x379244: bl              #0x377910  ; [dart:mixin_deduplication] _MixinApplication265&Component&HasGameReference::_findGameAndCheck
    // 0x379248: mov             x1, x0
    // 0x37924c: ldur            x2, [fp, #-8]
    // 0x379250: StoreField: r2->field_3b = r0
    //     0x379250: stur            w0, [x2, #0x3b]
    //     0x379254: ldurb           w16, [x2, #-1]
    //     0x379258: ldurb           w17, [x0, #-1]
    //     0x37925c: and             x16, x17, x16, lsr #2
    //     0x379260: tst             x16, HEAP, lsr #32
    //     0x379264: b.eq            #0x37926c
    //     0x379268: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x37926c: b               #0x379274
    // 0x379270: mov             x2, x0
    // 0x379274: LoadField: r0 = r1->field_a7
    //     0x379274: ldur            w0, [x1, #0xa7]
    // 0x379278: DecompressPointer r0
    //     0x379278: add             x0, x0, HEAP, lsl #32
    // 0x37927c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x379280: cmp             w0, w16
    // 0x379284: b.ne            #0x379294
    // 0x379288: r2 = random
    //     0x379288: add             x2, PP, #0xd, lsl #12  ; [pp+0xd090] Field <RicochlimeGame.random>: late (offset: 0xa8)
    //     0x37928c: ldr             x2, [x2, #0x90]
    // 0x379290: r0 = InitLateInstanceField()
    //     0x379290: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x379294: mov             x1, x0
    // 0x379298: r0 = nextDouble()
    //     0x379298: bl              #0x379d5c  ; [dart:math] _Random::nextDouble
    // 0x37929c: mov             v1.16b, v0.16b
    // 0x3792a0: d0 = 3.141593
    //     0x3792a0: add             x17, PP, #0xb, lsl #12  ; [pp+0xb908] IMM: double(3.141592653589793) from 0x400921fb54442d18
    //     0x3792a4: ldr             d0, [x17, #0x908]
    // 0x3792a8: fmul            d2, d1, d0
    // 0x3792ac: d0 = 2.000000
    //     0x3792ac: fmov            d0, #2.00000000
    // 0x3792b0: fdiv            d1, d2, d0
    // 0x3792b4: d0 = 0.785398
    //     0x3792b4: add             x17, PP, #0xd, lsl #12  ; [pp+0xd0a8] IMM: double(0.7853981633974483) from 0x3fe921fb54442d18
    //     0x3792b8: ldr             d0, [x17, #0xa8]
    // 0x3792bc: fsub            d2, d1, d0
    // 0x3792c0: ldur            x1, [fp, #-0x10]
    // 0x3792c4: mov             v0.16b, v2.16b
    // 0x3792c8: r0 = angularVelocity=()
    //     0x3792c8: bl              #0x379c20  ; [package:forge2d/src/dynamics/body.dart] Body::angularVelocity=
    // 0x3792cc: ldur            x0, [fp, #-8]
    // 0x3792d0: LoadField: r1 = r0->field_43
    //     0x3792d0: ldur            w1, [x0, #0x43]
    // 0x3792d4: DecompressPointer r1
    //     0x3792d4: add             x1, x1, HEAP, lsl #32
    // 0x3792d8: LoadField: r0 = r1->field_1b
    //     0x3792d8: ldur            w0, [x1, #0x1b]
    // 0x3792dc: DecompressPointer r0
    //     0x3792dc: add             x0, x0, HEAP, lsl #32
    // 0x3792e0: LoadField: r1 = r0->field_7
    //     0x3792e0: ldur            w1, [x0, #7]
    // 0x3792e4: DecompressPointer r1
    //     0x3792e4: add             x1, x1, HEAP, lsl #32
    // 0x3792e8: LoadField: r2 = r1->field_7
    //     0x3792e8: ldur            w2, [x1, #7]
    // 0x3792ec: DecompressPointer r2
    //     0x3792ec: add             x2, x2, HEAP, lsl #32
    // 0x3792f0: LoadField: r0 = r2->field_13
    //     0x3792f0: ldur            w0, [x2, #0x13]
    // 0x3792f4: r1 = LoadInt32Instr(r0)
    //     0x3792f4: sbfx            x1, x0, #1, #0x1f
    // 0x3792f8: mov             x0, x1
    // 0x3792fc: r1 = 1
    //     0x3792fc: mov             x1, #1
    // 0x379300: cmp             x1, x0
    // 0x379304: b.hs            #0x3793b8
    // 0x379308: LoadField: d0 = r2->field_1b
    //     0x379308: ldur            s0, [x2, #0x1b]
    // 0x37930c: fcvt            d1, s0
    // 0x379310: d0 = 170.666667
    //     0x379310: add             x17, PP, #0xd, lsl #12  ; [pp+0xd0b0] IMM: double(170.66666666666669) from 0x4065555555555556
    //     0x379314: ldr             d0, [x17, #0xb0]
    // 0x379318: fcmp            d1, d0
    // 0x37931c: b.le            #0x379328
    // 0x379320: d0 = 0.000000
    //     0x379320: eor             v0.16b, v0.16b, v0.16b
    // 0x379324: b               #0x379338
    // 0x379328: d0 = 213.333333
    //     0x379328: add             x17, PP, #0xd, lsl #12  ; [pp+0xd0b8] IMM: double(213.33333333333334) from 0x406aaaaaaaaaaaab
    //     0x37932c: ldr             d0, [x17, #0xb8]
    // 0x379330: fsub            d2, d0, d1
    // 0x379334: mov             v0.16b, v2.16b
    // 0x379338: ldur            x1, [fp, #-0x10]
    // 0x37933c: stur            d0, [fp, #-0x20]
    // 0x379340: r0 = Vector2()
    //     0x379340: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x379344: r4 = 4
    //     0x379344: mov             x4, #4
    // 0x379348: stur            x0, [fp, #-8]
    // 0x37934c: r0 = AllocateFloat32Array()
    //     0x37934c: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x379350: mov             x1, x0
    // 0x379354: ldur            x0, [fp, #-8]
    // 0x379358: StoreField: r0->field_7 = r1
    //     0x379358: stur            w1, [x0, #7]
    // 0x37935c: ldur            d0, [fp, #-0x20]
    // 0x379360: fcvt            s1, d0
    // 0x379364: StoreField: r1->field_1b = d1
    //     0x379364: stur            s1, [x1, #0x1b]
    // 0x379368: ArrayStore: r1[0] = rZR  ; List_4
    //     0x379368: stur            wzr, [x1, #0x17]
    // 0x37936c: ldur            x1, [fp, #-0x10]
    // 0x379370: StoreField: r1->field_7f = r0
    //     0x379370: stur            w0, [x1, #0x7f]
    //     0x379374: ldurb           w16, [x1, #-1]
    //     0x379378: ldurb           w17, [x0, #-1]
    //     0x37937c: and             x16, x17, x16, lsr #2
    //     0x379380: tst             x16, HEAP, lsr #32
    //     0x379384: b.eq            #0x37938c
    //     0x379388: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x37938c: r0 = setFixedRotation()
    //     0x37938c: bl              #0x3793bc  ; [package:forge2d/src/dynamics/body.dart] Body::setFixedRotation
    // 0x379390: r0 = Null
    //     0x379390: mov             x0, NULL
    // 0x379394: LeaveFrame
    //     0x379394: mov             SP, fp
    //     0x379398: ldp             fp, lr, [SP], #0x10
    // 0x37939c: ret
    //     0x37939c: ret             
    // 0x3793a0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3793a0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3793a4: b               #0x379088
    // 0x3793a8: r9 = body
    //     0x3793a8: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x3793ac: ldr             x9, [x9, #0x7a0]
    // 0x3793b0: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x3793b0: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x3793b4: r0 = RangeErrorSharedWithFPURegs()
    //     0x3793b4: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x3793b8: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3793b8: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ moveInFromTop(/* No info */) {
    // ** addr: 0x37d414, size: 0x150
    // 0x37d414: EnterFrame
    //     0x37d414: stp             fp, lr, [SP, #-0x10]!
    //     0x37d418: mov             fp, SP
    // 0x37d41c: AllocStack(0x18)
    //     0x37d41c: sub             SP, SP, #0x18
    // 0x37d420: SetupParameters(Monster this /* r1 => r0, fp-0x8 */)
    //     0x37d420: mov             x0, x1
    //     0x37d424: stur            x1, [fp, #-8]
    // 0x37d428: CheckStackOverflow
    //     0x37d428: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d42c: cmp             SP, x16
    //     0x37d430: b.ls            #0x37d540
    // 0x37d434: LoadField: r1 = r0->field_9f
    //     0x37d434: ldur            w1, [x0, #0x9f]
    // 0x37d438: DecompressPointer r1
    //     0x37d438: add             x1, x1, HEAP, lsl #32
    // 0x37d43c: tbnz            w1, #4, #0x37d468
    // 0x37d440: LoadField: r1 = r0->field_43
    //     0x37d440: ldur            w1, [x0, #0x43]
    // 0x37d444: DecompressPointer r1
    //     0x37d444: add             x1, x1, HEAP, lsl #32
    // 0x37d448: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d44c: cmp             w1, w16
    // 0x37d450: b.eq            #0x37d548
    // 0x37d454: LoadField: r2 = r1->field_1b
    //     0x37d454: ldur            w2, [x1, #0x1b]
    // 0x37d458: DecompressPointer r2
    //     0x37d458: add             x2, x2, HEAP, lsl #32
    // 0x37d45c: LoadField: r1 = r2->field_7
    //     0x37d45c: ldur            w1, [x2, #7]
    // 0x37d460: DecompressPointer r1
    //     0x37d460: add             x1, x1, HEAP, lsl #32
    // 0x37d464: b               #0x37d470
    // 0x37d468: LoadField: r1 = r0->field_77
    //     0x37d468: ldur            w1, [x0, #0x77]
    // 0x37d46c: DecompressPointer r1
    //     0x37d46c: add             x1, x1, HEAP, lsl #32
    // 0x37d470: r0 = clone()
    //     0x37d470: bl              #0x28be08  ; [package:vector_math/vector_math.dart] Vector2::clone
    // 0x37d474: mov             x2, x0
    // 0x37d478: stur            x2, [fp, #-0x10]
    // 0x37d47c: LoadField: r3 = r2->field_7
    //     0x37d47c: ldur            w3, [x2, #7]
    // 0x37d480: DecompressPointer r3
    //     0x37d480: add             x3, x3, HEAP, lsl #32
    // 0x37d484: LoadField: r0 = r3->field_13
    //     0x37d484: ldur            w0, [x3, #0x13]
    // 0x37d488: r1 = LoadInt32Instr(r0)
    //     0x37d488: sbfx            x1, x0, #1, #0x1f
    // 0x37d48c: mov             x0, x1
    // 0x37d490: r1 = 1
    //     0x37d490: mov             x1, #1
    // 0x37d494: cmp             x1, x0
    // 0x37d498: b.hs            #0x37d554
    // 0x37d49c: LoadField: d0 = r3->field_1b
    //     0x37d49c: ldur            s0, [x3, #0x1b]
    // 0x37d4a0: fcvt            d1, s0
    // 0x37d4a4: d0 = 16.000000
    //     0x37d4a4: fmov            d0, #16.00000000
    // 0x37d4a8: fsub            d2, d1, d0
    // 0x37d4ac: fcvt            s0, d2
    // 0x37d4b0: StoreField: r3->field_1b = d0
    //     0x37d4b0: stur            s0, [x3, #0x1b]
    // 0x37d4b4: ldur            x0, [fp, #-8]
    // 0x37d4b8: LoadField: r1 = r0->field_9f
    //     0x37d4b8: ldur            w1, [x0, #0x9f]
    // 0x37d4bc: DecompressPointer r1
    //     0x37d4bc: add             x1, x1, HEAP, lsl #32
    // 0x37d4c0: tbnz            w1, #4, #0x37d4ec
    // 0x37d4c4: LoadField: r1 = r0->field_43
    //     0x37d4c4: ldur            w1, [x0, #0x43]
    // 0x37d4c8: DecompressPointer r1
    //     0x37d4c8: add             x1, x1, HEAP, lsl #32
    // 0x37d4cc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d4d0: cmp             w1, w16
    // 0x37d4d4: b.eq            #0x37d558
    // 0x37d4d8: LoadField: r3 = r1->field_1b
    //     0x37d4d8: ldur            w3, [x1, #0x1b]
    // 0x37d4dc: DecompressPointer r3
    //     0x37d4dc: add             x3, x3, HEAP, lsl #32
    // 0x37d4e0: LoadField: r1 = r3->field_7
    //     0x37d4e0: ldur            w1, [x3, #7]
    // 0x37d4e4: DecompressPointer r1
    //     0x37d4e4: add             x1, x1, HEAP, lsl #32
    // 0x37d4e8: b               #0x37d4f4
    // 0x37d4ec: LoadField: r1 = r0->field_77
    //     0x37d4ec: ldur            w1, [x0, #0x77]
    // 0x37d4f0: DecompressPointer r1
    //     0x37d4f0: add             x1, x1, HEAP, lsl #32
    // 0x37d4f4: r0 = clone()
    //     0x37d4f4: bl              #0x28be08  ; [package:vector_math/vector_math.dart] Vector2::clone
    // 0x37d4f8: stur            x0, [fp, #-0x18]
    // 0x37d4fc: r0 = _MonsterMovement()
    //     0x37d4fc: bl              #0x37d900  ; Allocate_MonsterMovementStub -> _MonsterMovement (size=0x24)
    // 0x37d500: ArrayStore: r0[0] = rZR  ; List_8
    //     0x37d500: stur            xzr, [x0, #0x17]
    // 0x37d504: ldr             x1, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d508: StoreField: r0->field_1f = r1
    //     0x37d508: stur            w1, [x0, #0x1f]
    // 0x37d50c: ldur            x1, [fp, #-0x10]
    // 0x37d510: StoreField: r0->field_7 = r1
    //     0x37d510: stur            w1, [x0, #7]
    // 0x37d514: ldur            x1, [fp, #-0x18]
    // 0x37d518: StoreField: r0->field_b = r1
    //     0x37d518: stur            w1, [x0, #0xb]
    // 0x37d51c: d0 = 1.000000
    //     0x37d51c: fmov            d0, #1.00000000
    // 0x37d520: StoreField: r0->field_f = d0
    //     0x37d520: stur            d0, [x0, #0xf]
    // 0x37d524: ldur            x1, [fp, #-8]
    // 0x37d528: mov             x2, x0
    // 0x37d52c: r0 = _startMovement()
    //     0x37d52c: bl              #0x37d564  ; [package:ricochlime/flame/components/monster.dart] Monster::_startMovement
    // 0x37d530: r0 = Null
    //     0x37d530: mov             x0, NULL
    // 0x37d534: LeaveFrame
    //     0x37d534: mov             SP, fp
    //     0x37d538: ldp             fp, lr, [SP], #0x10
    // 0x37d53c: ret
    //     0x37d53c: ret             
    // 0x37d540: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d540: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d544: b               #0x37d434
    // 0x37d548: r9 = body
    //     0x37d548: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x37d54c: ldr             x9, [x9, #0x7a0]
    // 0x37d550: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x37d550: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x37d554: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x37d554: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x37d558: r9 = body
    //     0x37d558: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x37d55c: ldr             x9, [x9, #0x7a0]
    // 0x37d560: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x37d560: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
  }
  _ _startMovement(/* No info */) {
    // ** addr: 0x37d564, size: 0x170
    // 0x37d564: EnterFrame
    //     0x37d564: stp             fp, lr, [SP, #-0x10]!
    //     0x37d568: mov             fp, SP
    // 0x37d56c: AllocStack(0x18)
    //     0x37d56c: sub             SP, SP, #0x18
    // 0x37d570: SetupParameters(Monster this /* r1 => r3, fp-0x8 */, dynamic _ /* r2 => r2, fp-0x10 */)
    //     0x37d570: mov             x3, x1
    //     0x37d574: stur            x1, [fp, #-8]
    //     0x37d578: stur            x2, [fp, #-0x10]
    // 0x37d57c: CheckStackOverflow
    //     0x37d57c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d580: cmp             SP, x16
    //     0x37d584: b.ls            #0x37d6c4
    // 0x37d588: mov             x0, x2
    // 0x37d58c: StoreField: r3->field_8f = r0
    //     0x37d58c: stur            w0, [x3, #0x8f]
    //     0x37d590: ldurb           w16, [x3, #-1]
    //     0x37d594: ldurb           w17, [x0, #-1]
    //     0x37d598: and             x16, x17, x16, lsr #2
    //     0x37d59c: tst             x16, HEAP, lsr #32
    //     0x37d5a0: b.eq            #0x37d5a8
    //     0x37d5a4: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x37d5a8: mov             x1, x3
    // 0x37d5ac: LoadField: r0 = r1->field_93
    //     0x37d5ac: ldur            w0, [x1, #0x93]
    // 0x37d5b0: DecompressPointer r0
    //     0x37d5b0: add             x0, x0, HEAP, lsl #32
    // 0x37d5b4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d5b8: cmp             w0, w16
    // 0x37d5bc: b.ne            #0x37d5cc
    // 0x37d5c0: r2 = _animation
    //     0x37d5c0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x37d5c4: ldr             x2, [x2, #0x7d0]
    // 0x37d5c8: r0 = InitLateFinalInstanceField()
    //     0x37d5c8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37d5cc: mov             x1, x0
    // 0x37d5d0: r2 = true
    //     0x37d5d0: add             x2, NULL, #0x20  ; true
    // 0x37d5d4: r0 = walking=()
    //     0x37d5d4: bl              #0x37d7d0  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::walking=
    // 0x37d5d8: ldur            x1, [fp, #-8]
    // 0x37d5dc: r0 = createBody()
    //     0x37d5dc: bl              #0x547ab4  ; [package:ricochlime/flame/components/monster.dart] Monster::createBody
    // 0x37d5e0: mov             x3, x0
    // 0x37d5e4: ldur            x1, [fp, #-8]
    // 0x37d5e8: stur            x3, [fp, #-0x18]
    // 0x37d5ec: StoreField: r1->field_43 = r0
    //     0x37d5ec: stur            w0, [x1, #0x43]
    //     0x37d5f0: ldurb           w16, [x1, #-1]
    //     0x37d5f4: ldurb           w17, [x0, #-1]
    //     0x37d5f8: and             x16, x17, x16, lsr #2
    //     0x37d5fc: tst             x16, HEAP, lsr #32
    //     0x37d600: b.eq            #0x37d608
    //     0x37d604: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x37d608: LoadField: r0 = r3->field_1b
    //     0x37d608: ldur            w0, [x3, #0x1b]
    // 0x37d60c: DecompressPointer r0
    //     0x37d60c: add             x0, x0, HEAP, lsl #32
    // 0x37d610: LoadField: r1 = r0->field_7
    //     0x37d610: ldur            w1, [x0, #7]
    // 0x37d614: DecompressPointer r1
    //     0x37d614: add             x1, x1, HEAP, lsl #32
    // 0x37d618: ldur            x4, [fp, #-0x10]
    // 0x37d61c: LoadField: r0 = r4->field_7
    //     0x37d61c: ldur            w0, [x4, #7]
    // 0x37d620: DecompressPointer r0
    //     0x37d620: add             x0, x0, HEAP, lsl #32
    // 0x37d624: LoadField: r2 = r0->field_7
    //     0x37d624: ldur            w2, [x0, #7]
    // 0x37d628: DecompressPointer r2
    //     0x37d628: add             x2, x2, HEAP, lsl #32
    // 0x37d62c: LoadField: r5 = r1->field_7
    //     0x37d62c: ldur            w5, [x1, #7]
    // 0x37d630: DecompressPointer r5
    //     0x37d630: add             x5, x5, HEAP, lsl #32
    // 0x37d634: LoadField: r0 = r2->field_13
    //     0x37d634: ldur            w0, [x2, #0x13]
    // 0x37d638: r1 = LoadInt32Instr(r0)
    //     0x37d638: sbfx            x1, x0, #1, #0x1f
    // 0x37d63c: mov             x0, x1
    // 0x37d640: r1 = 1
    //     0x37d640: mov             x1, #1
    // 0x37d644: cmp             x1, x0
    // 0x37d648: b.hs            #0x37d6cc
    // 0x37d64c: LoadField: d0 = r2->field_1b
    //     0x37d64c: ldur            s0, [x2, #0x1b]
    // 0x37d650: LoadField: r0 = r5->field_13
    //     0x37d650: ldur            w0, [x5, #0x13]
    // 0x37d654: r1 = LoadInt32Instr(r0)
    //     0x37d654: sbfx            x1, x0, #1, #0x1f
    // 0x37d658: mov             x0, x1
    // 0x37d65c: r1 = 1
    //     0x37d65c: mov             x1, #1
    // 0x37d660: cmp             x1, x0
    // 0x37d664: b.hs            #0x37d6d0
    // 0x37d668: StoreField: r5->field_1b = d0
    //     0x37d668: stur            s0, [x5, #0x1b]
    // 0x37d66c: ArrayLoad: d0 = r2[0]  ; List_8
    //     0x37d66c: ldur            s0, [x2, #0x17]
    // 0x37d670: ArrayStore: r5[0] = d0  ; List_8
    //     0x37d670: stur            s0, [x5, #0x17]
    // 0x37d674: mov             x1, x3
    // 0x37d678: r2 = Instance_BodyType
    //     0x37d678: add             x2, PP, #0xd, lsl #12  ; [pp+0xd100] Obj!BodyType@5d9031
    //     0x37d67c: ldr             x2, [x2, #0x100]
    // 0x37d680: r0 = setType()
    //     0x37d680: bl              #0x37a030  ; [package:forge2d/src/dynamics/body.dart] Body::setType
    // 0x37d684: ldur            x1, [fp, #-0x10]
    // 0x37d688: LoadField: r0 = r1->field_1f
    //     0x37d688: ldur            w0, [x1, #0x1f]
    // 0x37d68c: DecompressPointer r0
    //     0x37d68c: add             x0, x0, HEAP, lsl #32
    // 0x37d690: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d694: cmp             w0, w16
    // 0x37d698: b.ne            #0x37d6a8
    // 0x37d69c: r2 = velocity
    //     0x37d69c: add             x2, PP, #0xd, lsl #12  ; [pp+0xd378] Field <_MonsterMovement@228109025.velocity>: late final (offset: 0x20)
    //     0x37d6a0: ldr             x2, [x2, #0x378]
    // 0x37d6a4: r0 = InitLateFinalInstanceField()
    //     0x37d6a4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37d6a8: ldur            x1, [fp, #-0x18]
    // 0x37d6ac: mov             x2, x0
    // 0x37d6b0: r0 = linearVelocity=()
    //     0x37d6b0: bl              #0x37d6d4  ; [package:forge2d/src/dynamics/body.dart] Body::linearVelocity=
    // 0x37d6b4: r0 = Null
    //     0x37d6b4: mov             x0, NULL
    // 0x37d6b8: LeaveFrame
    //     0x37d6b8: mov             SP, fp
    //     0x37d6bc: ldp             fp, lr, [SP], #0x10
    // 0x37d6c0: ret
    //     0x37d6c0: ret             
    // 0x37d6c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d6c4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d6c8: b               #0x37d588
    // 0x37d6cc: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x37d6cc: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x37d6d0: r0 = RangeErrorSharedWithFPURegs()
    //     0x37d6d0: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  _ moveDown(/* No info */) {
    // ** addr: 0x37dea4, size: 0xf8
    // 0x37dea4: EnterFrame
    //     0x37dea4: stp             fp, lr, [SP, #-0x10]!
    //     0x37dea8: mov             fp, SP
    // 0x37deac: AllocStack(0x20)
    //     0x37deac: sub             SP, SP, #0x20
    // 0x37deb0: SetupParameters(Monster this /* r1 => r0, fp-0x8 */)
    //     0x37deb0: mov             x0, x1
    //     0x37deb4: stur            x1, [fp, #-8]
    // 0x37deb8: CheckStackOverflow
    //     0x37deb8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37debc: cmp             SP, x16
    //     0x37dec0: b.ls            #0x37df88
    // 0x37dec4: LoadField: r1 = r0->field_43
    //     0x37dec4: ldur            w1, [x0, #0x43]
    // 0x37dec8: DecompressPointer r1
    //     0x37dec8: add             x1, x1, HEAP, lsl #32
    // 0x37decc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37ded0: cmp             w1, w16
    // 0x37ded4: b.eq            #0x37df90
    // 0x37ded8: LoadField: r2 = r1->field_1b
    //     0x37ded8: ldur            w2, [x1, #0x1b]
    // 0x37dedc: DecompressPointer r2
    //     0x37dedc: add             x2, x2, HEAP, lsl #32
    // 0x37dee0: LoadField: r1 = r2->field_7
    //     0x37dee0: ldur            w1, [x2, #7]
    // 0x37dee4: DecompressPointer r1
    //     0x37dee4: add             x1, x1, HEAP, lsl #32
    // 0x37dee8: r0 = clone()
    //     0x37dee8: bl              #0x28be08  ; [package:vector_math/vector_math.dart] Vector2::clone
    // 0x37deec: ldur            x1, [fp, #-8]
    // 0x37def0: stur            x0, [fp, #-0x18]
    // 0x37def4: LoadField: r2 = r1->field_43
    //     0x37def4: ldur            w2, [x1, #0x43]
    // 0x37def8: DecompressPointer r2
    //     0x37def8: add             x2, x2, HEAP, lsl #32
    // 0x37defc: LoadField: r3 = r2->field_1b
    //     0x37defc: ldur            w3, [x2, #0x1b]
    // 0x37df00: DecompressPointer r3
    //     0x37df00: add             x3, x3, HEAP, lsl #32
    // 0x37df04: LoadField: r2 = r3->field_7
    //     0x37df04: ldur            w2, [x3, #7]
    // 0x37df08: DecompressPointer r2
    //     0x37df08: add             x2, x2, HEAP, lsl #32
    // 0x37df0c: stur            x2, [fp, #-0x10]
    // 0x37df10: r0 = Vector2()
    //     0x37df10: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x37df14: r4 = 4
    //     0x37df14: mov             x4, #4
    // 0x37df18: stur            x0, [fp, #-0x20]
    // 0x37df1c: r0 = AllocateFloat32Array()
    //     0x37df1c: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x37df20: ldur            x2, [fp, #-0x20]
    // 0x37df24: StoreField: r2->field_7 = r0
    //     0x37df24: stur            w0, [x2, #7]
    // 0x37df28: d0 = 0.000000
    //     0x37df28: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x37df2c: ldr             s0, [x17, #0xca8]
    // 0x37df30: StoreField: r0->field_1b = d0
    //     0x37df30: stur            s0, [x0, #0x1b]
    // 0x37df34: ArrayStore: r0[0] = rZR  ; List_4
    //     0x37df34: stur            wzr, [x0, #0x17]
    // 0x37df38: ldur            x1, [fp, #-0x10]
    // 0x37df3c: r0 = +()
    //     0x37df3c: bl              #0x28bd50  ; [package:vector_math/vector_math.dart] Vector2::+
    // 0x37df40: stur            x0, [fp, #-0x10]
    // 0x37df44: r0 = _MonsterMovement()
    //     0x37df44: bl              #0x37d900  ; Allocate_MonsterMovementStub -> _MonsterMovement (size=0x24)
    // 0x37df48: ArrayStore: r0[0] = rZR  ; List_8
    //     0x37df48: stur            xzr, [x0, #0x17]
    // 0x37df4c: ldr             x1, [THR, #0x90]  ; THR::object_sentinel
    // 0x37df50: StoreField: r0->field_1f = r1
    //     0x37df50: stur            w1, [x0, #0x1f]
    // 0x37df54: ldur            x1, [fp, #-0x18]
    // 0x37df58: StoreField: r0->field_7 = r1
    //     0x37df58: stur            w1, [x0, #7]
    // 0x37df5c: ldur            x1, [fp, #-0x10]
    // 0x37df60: StoreField: r0->field_b = r1
    //     0x37df60: stur            w1, [x0, #0xb]
    // 0x37df64: d0 = 1.000000
    //     0x37df64: fmov            d0, #1.00000000
    // 0x37df68: StoreField: r0->field_f = d0
    //     0x37df68: stur            d0, [x0, #0xf]
    // 0x37df6c: ldur            x1, [fp, #-8]
    // 0x37df70: mov             x2, x0
    // 0x37df74: r0 = _startMovement()
    //     0x37df74: bl              #0x37d564  ; [package:ricochlime/flame/components/monster.dart] Monster::_startMovement
    // 0x37df78: r0 = Null
    //     0x37df78: mov             x0, NULL
    // 0x37df7c: LeaveFrame
    //     0x37df7c: mov             SP, fp
    //     0x37df80: ldp             fp, lr, [SP], #0x10
    // 0x37df84: ret
    //     0x37df84: ret             
    // 0x37df88: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37df88: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37df8c: b               #0x37dec4
    // 0x37df90: r9 = body
    //     0x37df90: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x37df94: ldr             x9, [x9, #0x7a0]
    // 0x37df98: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x37df98: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
  }
  _ update(/* No info */) {
    // ** addr: 0x3d353c, size: 0x224
    // 0x3d353c: EnterFrame
    //     0x3d353c: stp             fp, lr, [SP, #-0x10]!
    //     0x3d3540: mov             fp, SP
    // 0x3d3544: AllocStack(0x18)
    //     0x3d3544: sub             SP, SP, #0x18
    // 0x3d3548: SetupParameters(Monster this /* r1 => r0, fp-0x8 */)
    //     0x3d3548: mov             x0, x1
    //     0x3d354c: stur            x1, [fp, #-8]
    // 0x3d3550: CheckStackOverflow
    //     0x3d3550: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d3554: cmp             SP, x16
    //     0x3d3558: b.ls            #0x3d3734
    // 0x3d355c: LoadField: r1 = r0->field_83
    //     0x3d355c: ldur            x1, [x0, #0x83]
    // 0x3d3560: cmp             x1, #0
    // 0x3d3564: b.gt            #0x3d35d4
    // 0x3d3568: LoadField: r1 = r0->field_43
    //     0x3d3568: ldur            w1, [x0, #0x43]
    // 0x3d356c: DecompressPointer r1
    //     0x3d356c: add             x1, x1, HEAP, lsl #32
    // 0x3d3570: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d3574: cmp             w1, w16
    // 0x3d3578: b.eq            #0x3d373c
    // 0x3d357c: LoadField: r2 = r1->field_b
    //     0x3d357c: ldur            x2, [x1, #0xb]
    // 0x3d3580: tbz             w2, #5, #0x3d3588
    // 0x3d3584: r0 = setActive()
    //     0x3d3584: bl              #0x3d3888  ; [package:forge2d/src/dynamics/body.dart] Body::setActive
    // 0x3d3588: ldur            x1, [fp, #-8]
    // 0x3d358c: LoadField: r0 = r1->field_93
    //     0x3d358c: ldur            w0, [x1, #0x93]
    // 0x3d3590: DecompressPointer r0
    //     0x3d3590: add             x0, x0, HEAP, lsl #32
    // 0x3d3594: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d3598: cmp             w0, w16
    // 0x3d359c: b.ne            #0x3d35ac
    // 0x3d35a0: r2 = _animation
    //     0x3d35a0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x3d35a4: ldr             x2, [x2, #0x7d0]
    // 0x3d35a8: r0 = InitLateFinalInstanceField()
    //     0x3d35a8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d35ac: LoadField: r1 = r0->field_1b
    //     0x3d35ac: ldur            w1, [x0, #0x1b]
    // 0x3d35b0: DecompressPointer r1
    //     0x3d35b0: add             x1, x1, HEAP, lsl #32
    // 0x3d35b4: cmp             w1, NULL
    // 0x3d35b8: b.ne            #0x3d35c4
    // 0x3d35bc: ldur            x1, [fp, #-8]
    // 0x3d35c0: r0 = removeFromParent()
    //     0x3d35c0: bl              #0x3779a0  ; [package:flame/src/components/core/component.dart] Component::removeFromParent
    // 0x3d35c4: r0 = Null
    //     0x3d35c4: mov             x0, NULL
    // 0x3d35c8: LeaveFrame
    //     0x3d35c8: mov             SP, fp
    //     0x3d35cc: ldp             fp, lr, [SP], #0x10
    // 0x3d35d0: ret
    //     0x3d35d0: ret             
    // 0x3d35d4: LoadField: r1 = r0->field_8f
    //     0x3d35d4: ldur            w1, [x0, #0x8f]
    // 0x3d35d8: DecompressPointer r1
    //     0x3d35d8: add             x1, x1, HEAP, lsl #32
    // 0x3d35dc: cmp             w1, NULL
    // 0x3d35e0: b.eq            #0x3d3724
    // 0x3d35e4: ArrayLoad: d1 = r1[0]  ; List_8
    //     0x3d35e4: ldur            d1, [x1, #0x17]
    // 0x3d35e8: fadd            d2, d1, d0
    // 0x3d35ec: ArrayStore: r1[0] = d2  ; List_8
    //     0x3d35ec: stur            d2, [x1, #0x17]
    // 0x3d35f0: LoadField: d0 = r1->field_f
    //     0x3d35f0: ldur            d0, [x1, #0xf]
    // 0x3d35f4: fcmp            d2, d0
    // 0x3d35f8: b.lt            #0x3d3724
    // 0x3d35fc: LoadField: r3 = r0->field_43
    //     0x3d35fc: ldur            w3, [x0, #0x43]
    // 0x3d3600: DecompressPointer r3
    //     0x3d3600: add             x3, x3, HEAP, lsl #32
    // 0x3d3604: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d3608: cmp             w3, w16
    // 0x3d360c: b.eq            #0x3d3748
    // 0x3d3610: mov             x1, x3
    // 0x3d3614: stur            x3, [fp, #-0x10]
    // 0x3d3618: r2 = Instance_BodyType
    //     0x3d3618: add             x2, PP, #0xd, lsl #12  ; [pp+0xd0f8] Obj!BodyType@5d9011
    //     0x3d361c: ldr             x2, [x2, #0xf8]
    // 0x3d3620: r0 = setType()
    //     0x3d3620: bl              #0x37a030  ; [package:forge2d/src/dynamics/body.dart] Body::setType
    // 0x3d3624: r0 = Vector2()
    //     0x3d3624: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3d3628: r4 = 4
    //     0x3d3628: mov             x4, #4
    // 0x3d362c: stur            x0, [fp, #-0x18]
    // 0x3d3630: r0 = AllocateFloat32Array()
    //     0x3d3630: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3d3634: ldur            x2, [fp, #-0x18]
    // 0x3d3638: StoreField: r2->field_7 = r0
    //     0x3d3638: stur            w0, [x2, #7]
    // 0x3d363c: ldur            x1, [fp, #-0x10]
    // 0x3d3640: r0 = linearVelocity=()
    //     0x3d3640: bl              #0x37d6d4  ; [package:forge2d/src/dynamics/body.dart] Body::linearVelocity=
    // 0x3d3644: ldur            x0, [fp, #-0x10]
    // 0x3d3648: LoadField: r1 = r0->field_1b
    //     0x3d3648: ldur            w1, [x0, #0x1b]
    // 0x3d364c: DecompressPointer r1
    //     0x3d364c: add             x1, x1, HEAP, lsl #32
    // 0x3d3650: LoadField: r0 = r1->field_7
    //     0x3d3650: ldur            w0, [x1, #7]
    // 0x3d3654: DecompressPointer r0
    //     0x3d3654: add             x0, x0, HEAP, lsl #32
    // 0x3d3658: ldur            x2, [fp, #-8]
    // 0x3d365c: LoadField: r1 = r2->field_8f
    //     0x3d365c: ldur            w1, [x2, #0x8f]
    // 0x3d3660: DecompressPointer r1
    //     0x3d3660: add             x1, x1, HEAP, lsl #32
    // 0x3d3664: cmp             w1, NULL
    // 0x3d3668: b.eq            #0x3d3754
    // 0x3d366c: LoadField: r3 = r1->field_b
    //     0x3d366c: ldur            w3, [x1, #0xb]
    // 0x3d3670: DecompressPointer r3
    //     0x3d3670: add             x3, x3, HEAP, lsl #32
    // 0x3d3674: LoadField: r4 = r3->field_7
    //     0x3d3674: ldur            w4, [x3, #7]
    // 0x3d3678: DecompressPointer r4
    //     0x3d3678: add             x4, x4, HEAP, lsl #32
    // 0x3d367c: LoadField: r3 = r0->field_7
    //     0x3d367c: ldur            w3, [x0, #7]
    // 0x3d3680: DecompressPointer r3
    //     0x3d3680: add             x3, x3, HEAP, lsl #32
    // 0x3d3684: LoadField: r0 = r4->field_13
    //     0x3d3684: ldur            w0, [x4, #0x13]
    // 0x3d3688: r1 = LoadInt32Instr(r0)
    //     0x3d3688: sbfx            x1, x0, #1, #0x1f
    // 0x3d368c: mov             x0, x1
    // 0x3d3690: r1 = 1
    //     0x3d3690: mov             x1, #1
    // 0x3d3694: cmp             x1, x0
    // 0x3d3698: b.hs            #0x3d3758
    // 0x3d369c: LoadField: d0 = r4->field_1b
    //     0x3d369c: ldur            s0, [x4, #0x1b]
    // 0x3d36a0: LoadField: r0 = r3->field_13
    //     0x3d36a0: ldur            w0, [x3, #0x13]
    // 0x3d36a4: r1 = LoadInt32Instr(r0)
    //     0x3d36a4: sbfx            x1, x0, #1, #0x1f
    // 0x3d36a8: mov             x0, x1
    // 0x3d36ac: r1 = 1
    //     0x3d36ac: mov             x1, #1
    // 0x3d36b0: cmp             x1, x0
    // 0x3d36b4: b.hs            #0x3d375c
    // 0x3d36b8: StoreField: r3->field_1b = d0
    //     0x3d36b8: stur            s0, [x3, #0x1b]
    // 0x3d36bc: ArrayLoad: d0 = r4[0]  ; List_8
    //     0x3d36bc: ldur            s0, [x4, #0x17]
    // 0x3d36c0: ArrayStore: r3[0] = d0  ; List_8
    //     0x3d36c0: stur            s0, [x3, #0x17]
    // 0x3d36c4: StoreField: r2->field_8f = rNULL
    //     0x3d36c4: stur            NULL, [x2, #0x8f]
    // 0x3d36c8: mov             x1, x2
    // 0x3d36cc: LoadField: r0 = r1->field_93
    //     0x3d36cc: ldur            w0, [x1, #0x93]
    // 0x3d36d0: DecompressPointer r0
    //     0x3d36d0: add             x0, x0, HEAP, lsl #32
    // 0x3d36d4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d36d8: cmp             w0, w16
    // 0x3d36dc: b.ne            #0x3d36ec
    // 0x3d36e0: r2 = _animation
    //     0x3d36e0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x3d36e4: ldr             x2, [x2, #0x7d0]
    // 0x3d36e8: r0 = InitLateFinalInstanceField()
    //     0x3d36e8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3d36ec: mov             x1, x0
    // 0x3d36f0: r2 = false
    //     0x3d36f0: add             x2, NULL, #0x30  ; false
    // 0x3d36f4: r0 = walking=()
    //     0x3d36f4: bl              #0x37d7d0  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::walking=
    // 0x3d36f8: ldur            x0, [fp, #-8]
    // 0x3d36fc: LoadField: r1 = r0->field_43
    //     0x3d36fc: ldur            w1, [x0, #0x43]
    // 0x3d3700: DecompressPointer r1
    //     0x3d3700: add             x1, x1, HEAP, lsl #32
    // 0x3d3704: LoadField: r2 = r1->field_1b
    //     0x3d3704: ldur            w2, [x1, #0x1b]
    // 0x3d3708: DecompressPointer r2
    //     0x3d3708: add             x2, x2, HEAP, lsl #32
    // 0x3d370c: LoadField: r1 = r2->field_7
    //     0x3d370c: ldur            w1, [x2, #7]
    // 0x3d3710: DecompressPointer r1
    //     0x3d3710: add             x1, x1, HEAP, lsl #32
    // 0x3d3714: r0 = getPriorityFromPosition()
    //     0x3d3714: bl              #0x374bf8  ; [package:ricochlime/flame/components/monster.dart] Monster::getPriorityFromPosition
    // 0x3d3718: ldur            x1, [fp, #-8]
    // 0x3d371c: mov             x2, x0
    // 0x3d3720: r0 = priority=()
    //     0x3d3720: bl              #0x3d3760  ; [package:flame/src/components/core/component.dart] Component::priority=
    // 0x3d3724: r0 = Null
    //     0x3d3724: mov             x0, NULL
    // 0x3d3728: LeaveFrame
    //     0x3d3728: mov             SP, fp
    //     0x3d372c: ldp             fp, lr, [SP], #0x10
    // 0x3d3730: ret
    //     0x3d3730: ret             
    // 0x3d3734: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d3734: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d3738: b               #0x3d355c
    // 0x3d373c: r9 = body
    //     0x3d373c: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x3d3740: ldr             x9, [x9, #0x7a0]
    // 0x3d3744: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x3d3744: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x3d3748: r9 = body
    //     0x3d3748: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x3d374c: ldr             x9, [x9, #0x7a0]
    // 0x3d3750: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x3d3750: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x3d3754: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3d3754: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x3d3758: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3d3758: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3d375c: r0 = RangeErrorSharedWithFPURegs()
    //     0x3d375c: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  _ createBody(/* No info */) {
    // ** addr: 0x547ab4, size: 0x9c
    // 0x547ab4: EnterFrame
    //     0x547ab4: stp             fp, lr, [SP, #-0x10]!
    //     0x547ab8: mov             fp, SP
    // 0x547abc: AllocStack(0x48)
    //     0x547abc: sub             SP, SP, #0x48
    // 0x547ac0: SetupParameters(Monster this /* r1 => r0, fp-0x48 */)
    //     0x547ac0: mov             x0, x1
    //     0x547ac4: stur            x1, [fp, #-0x48]
    // 0x547ac8: CheckStackOverflow
    //     0x547ac8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x547acc: cmp             SP, x16
    //     0x547ad0: b.ls            #0x547b3c
    // 0x547ad4: LoadField: r1 = r0->field_9f
    //     0x547ad4: ldur            w1, [x0, #0x9f]
    // 0x547ad8: DecompressPointer r1
    //     0x547ad8: add             x1, x1, HEAP, lsl #32
    // 0x547adc: tbnz            w1, #4, #0x547b04
    // 0x547ae0: LoadField: r1 = r0->field_43
    //     0x547ae0: ldur            w1, [x0, #0x43]
    // 0x547ae4: DecompressPointer r1
    //     0x547ae4: add             x1, x1, HEAP, lsl #32
    // 0x547ae8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x547aec: cmp             w1, w16
    // 0x547af0: b.eq            #0x547b44
    // 0x547af4: mov             x0, x1
    // 0x547af8: LeaveFrame
    //     0x547af8: mov             SP, fp
    //     0x547afc: ldp             fp, lr, [SP], #0x10
    // 0x547b00: ret
    //     0x547b00: ret             
    // 0x547b04: mov             x1, x0
    // 0x547b08: r0 = createBody()
    //     0x547b08: bl              #0x547b50  ; [package:flame_forge2d/body_component.dart] BodyComponent::createBody
    // 0x547b0c: ldur            x2, [fp, #-0x48]
    // 0x547b10: r3 = true
    //     0x547b10: add             x3, NULL, #0x20  ; true
    // 0x547b14: StoreField: r2->field_9f = r3
    //     0x547b14: stur            w3, [x2, #0x9f]
    // 0x547b18: LeaveFrame
    //     0x547b18: mov             SP, fp
    //     0x547b1c: ldp             fp, lr, [SP], #0x10
    // 0x547b20: ret
    //     0x547b20: ret             
    // 0x547b24: sub             SP, fp, #0x48
    // 0x547b28: ldur            x2, [fp, #-0x48]
    // 0x547b2c: r3 = true
    //     0x547b2c: add             x3, NULL, #0x20  ; true
    // 0x547b30: StoreField: r2->field_9f = r3
    //     0x547b30: stur            w3, [x2, #0x9f]
    // 0x547b34: r0 = ReThrow()
    //     0x547b34: bl              #0x5827b0  ; ReThrowStub
    // 0x547b38: brk             #0
    // 0x547b3c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x547b3c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x547b40: b               #0x547ad4
    // 0x547b44: r9 = body
    //     0x547b44: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x547b48: ldr             x9, [x9, #0x7a0]
    // 0x547b4c: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x547b4c: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
  }
  _ beginContact(/* No info */) {
    // ** addr: 0x547fcc, size: 0xe4
    // 0x547fcc: EnterFrame
    //     0x547fcc: stp             fp, lr, [SP, #-0x10]!
    //     0x547fd0: mov             fp, SP
    // 0x547fd4: AllocStack(0x8)
    //     0x547fd4: sub             SP, SP, #8
    // 0x547fd8: SetupParameters(Monster this /* r1 => r0, fp-0x8 */)
    //     0x547fd8: mov             x0, x1
    //     0x547fdc: stur            x1, [fp, #-8]
    // 0x547fe0: CheckStackOverflow
    //     0x547fe0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x547fe4: cmp             SP, x16
    //     0x547fe8: b.ls            #0x5480a8
    // 0x547fec: LoadField: r1 = r0->field_83
    //     0x547fec: ldur            x1, [x0, #0x83]
    // 0x547ff0: cmp             x1, #0
    // 0x547ff4: b.gt            #0x548008
    // 0x547ff8: r0 = Null
    //     0x547ff8: mov             x0, NULL
    // 0x547ffc: LeaveFrame
    //     0x547ffc: mov             SP, fp
    //     0x548000: ldp             fp, lr, [SP], #0x10
    // 0x548004: ret
    //     0x548004: ret             
    // 0x548008: r3 = 60
    //     0x548008: mov             x3, #0x3c
    // 0x54800c: branchIfSmi(r2, 0x548018)
    //     0x54800c: tbz             w2, #0, #0x548018
    // 0x548010: r3 = LoadClassIdInstr(r2)
    //     0x548010: ldur            x3, [x2, #-1]
    //     0x548014: ubfx            x3, x3, #0xc, #0x14
    // 0x548018: cmp             x3, #0x763
    // 0x54801c: b.ne            #0x548098
    // 0x548020: sub             x2, x1, #1
    // 0x548024: mov             x1, x0
    // 0x548028: r0 = hp=()
    //     0x548028: bl              #0x377494  ; [package:ricochlime/flame/components/monster.dart] Monster::hp=
    // 0x54802c: ldur            x0, [fp, #-8]
    // 0x548030: LoadField: r1 = r0->field_3b
    //     0x548030: ldur            w1, [x0, #0x3b]
    // 0x548034: DecompressPointer r1
    //     0x548034: add             x1, x1, HEAP, lsl #32
    // 0x548038: cmp             w1, NULL
    // 0x54803c: b.ne            #0x548070
    // 0x548040: mov             x1, x0
    // 0x548044: r0 = _findGameAndCheck()
    //     0x548044: bl              #0x377910  ; [dart:mixin_deduplication] _MixinApplication265&Component&HasGameReference::_findGameAndCheck
    // 0x548048: mov             x2, x0
    // 0x54804c: ldur            x1, [fp, #-8]
    // 0x548050: StoreField: r1->field_3b = r0
    //     0x548050: stur            w0, [x1, #0x3b]
    //     0x548054: ldurb           w16, [x1, #-1]
    //     0x548058: ldurb           w17, [x0, #-1]
    //     0x54805c: and             x16, x17, x16, lsr #2
    //     0x548060: tst             x16, HEAP, lsr #32
    //     0x548064: b.eq            #0x54806c
    //     0x548068: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x54806c: mov             x1, x2
    // 0x548070: LoadField: r0 = r1->field_9f
    //     0x548070: ldur            w0, [x1, #0x9f]
    // 0x548074: DecompressPointer r0
    //     0x548074: add             x0, x0, HEAP, lsl #32
    // 0x548078: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x54807c: cmp             w0, w16
    // 0x548080: b.ne            #0x548090
    // 0x548084: r2 = audio
    //     0x548084: add             x2, PP, #0x14, lsl #12  ; [pp+0x14548] Field <RicochlimeGame.audio>: late final (offset: 0xa0)
    //     0x548088: ldr             x2, [x2, #0x548]
    // 0x54808c: r0 = InitLateFinalInstanceField()
    //     0x54808c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x548090: mov             x1, x0
    // 0x548094: r0 = playHitSfx()
    //     0x548094: bl              #0x5480b0  ; [package:ricochlime/utils/ricochlime_audio.dart] RicochlimeAudio::playHitSfx
    // 0x548098: r0 = Null
    //     0x548098: mov             x0, NULL
    // 0x54809c: LeaveFrame
    //     0x54809c: mov             SP, fp
    //     0x5480a0: ldp             fp, lr, [SP], #0x10
    // 0x5480a4: ret
    //     0x5480a4: ret             
    // 0x5480a8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5480a8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5480ac: b               #0x547fec
  }
}

// class id: 1908, size: 0x80, field offset: 0x78
class MonsterAnimation extends _MixinApplication269&SpriteAnimationGroupComponent&HasGameReference {

  static late final Vector2 _relativePosition; // offset: 0x898

  _ setSpriteFromKillReward(/* No info */) {
    // ** addr: 0x3743e4, size: 0x1e8
    // 0x3743e4: EnterFrame
    //     0x3743e4: stp             fp, lr, [SP, #-0x10]!
    //     0x3743e8: mov             fp, SP
    // 0x3743ec: AllocStack(0x10)
    //     0x3743ec: sub             SP, SP, #0x10
    // 0x3743f0: SetupParameters(MonsterAnimation this /* r1 => r3, fp-0x8 */)
    //     0x3743f0: mov             x3, x1
    //     0x3743f4: stur            x1, [fp, #-8]
    // 0x3743f8: CheckStackOverflow
    //     0x3743f8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3743fc: cmp             SP, x16
    //     0x374400: b.ls            #0x3745b4
    // 0x374404: LoadField: r0 = r2->field_7
    //     0x374404: ldur            x0, [x2, #7]
    // 0x374408: cmp             x0, #1
    // 0x37440c: b.gt            #0x374430
    // 0x374410: cmp             x0, #0
    // 0x374414: b.gt            #0x374424
    // 0x374418: r0 = "log_normal.png"
    //     0x374418: add             x0, PP, #0xc, lsl #12  ; [pp+0xc860] "log_normal.png"
    //     0x37441c: ldr             x0, [x0, #0x860]
    // 0x374420: b               #0x374438
    // 0x374424: r0 = "log_green.png"
    //     0x374424: add             x0, PP, #0xd, lsl #12  ; [pp+0xd2f8] "log_green.png"
    //     0x374428: ldr             x0, [x0, #0x2f8]
    // 0x37442c: b               #0x374438
    // 0x374430: r0 = "log_gold.png"
    //     0x374430: add             x0, PP, #0xd, lsl #12  ; [pp+0xd300] "log_gold.png"
    //     0x374434: ldr             x0, [x0, #0x300]
    // 0x374438: StoreField: r3->field_7b = r0
    //     0x374438: stur            w0, [x3, #0x7b]
    //     0x37443c: ldurb           w16, [x3, #-1]
    //     0x374440: ldurb           w17, [x0, #-1]
    //     0x374444: and             x16, x17, x16, lsr #2
    //     0x374448: tst             x16, HEAP, lsr #32
    //     0x37444c: b.eq            #0x374454
    //     0x374450: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x374454: mov             x1, x3
    // 0x374458: r0 = animations()
    //     0x374458: bl              #0x3745ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::animations
    // 0x37445c: stur            x0, [fp, #-0x10]
    // 0x374460: cmp             w0, NULL
    // 0x374464: b.ne            #0x374478
    // 0x374468: r0 = Null
    //     0x374468: mov             x0, NULL
    // 0x37446c: LeaveFrame
    //     0x37446c: mov             SP, fp
    //     0x374470: ldp             fp, lr, [SP], #0x10
    // 0x374474: ret
    //     0x374474: ret             
    // 0x374478: ldur            x1, [fp, #-8]
    // 0x37447c: r0 = LoadStaticField(0x860)
    //     0x37447c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x374480: ldr             x0, [x0, #0x10c0]
    // 0x374484: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x374488: cmp             w0, w16
    // 0x37448c: b.ne            #0x37449c
    // 0x374490: r2 = instance
    //     0x374490: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x374494: ldr             x2, [x2, #0x6f0]
    // 0x374498: r0 = InitLateFinalStaticField()
    //     0x374498: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37449c: LoadField: r1 = r0->field_47
    //     0x37449c: ldur            w1, [x0, #0x47]
    // 0x3744a0: DecompressPointer r1
    //     0x3744a0: add             x1, x1, HEAP, lsl #32
    // 0x3744a4: ldur            x0, [fp, #-8]
    // 0x3744a8: LoadField: r2 = r0->field_7b
    //     0x3744a8: ldur            w2, [x0, #0x7b]
    // 0x3744ac: DecompressPointer r2
    //     0x3744ac: add             x2, x2, HEAP, lsl #32
    // 0x3744b0: r0 = fromCache()
    //     0x3744b0: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x3744b4: ldur            x1, [fp, #-0x10]
    // 0x3744b8: stur            x0, [fp, #-8]
    // 0x3744bc: r0 = values()
    //     0x3744bc: bl              #0x51e330  ; [dart:collection] MapView::values
    // 0x3744c0: r1 = LoadClassIdInstr(r0)
    //     0x3744c0: ldur            x1, [x0, #-1]
    //     0x3744c4: ubfx            x1, x1, #0xc, #0x14
    // 0x3744c8: mov             x16, x0
    // 0x3744cc: mov             x0, x1
    // 0x3744d0: mov             x1, x16
    // 0x3744d4: r0 = GDT[cid_x0 + 0xfc4]()
    //     0x3744d4: add             lr, x0, #0xfc4
    //     0x3744d8: ldr             lr, [x21, lr, lsl #3]
    //     0x3744dc: blr             lr
    // 0x3744e0: mov             x2, x0
    // 0x3744e4: stur            x2, [fp, #-0x10]
    // 0x3744e8: CheckStackOverflow
    //     0x3744e8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3744ec: cmp             SP, x16
    //     0x3744f0: b.ls            #0x3745bc
    // 0x3744f4: r0 = LoadClassIdInstr(r2)
    //     0x3744f4: ldur            x0, [x2, #-1]
    //     0x3744f8: ubfx            x0, x0, #0xc, #0x14
    // 0x3744fc: mov             x1, x2
    // 0x374500: r0 = GDT[cid_x0 + -0x1000]()
    //     0x374500: sub             lr, x0, #1, lsl #12
    //     0x374504: ldr             lr, [x21, lr, lsl #3]
    //     0x374508: blr             lr
    // 0x37450c: tbnz            w0, #4, #0x3745a4
    // 0x374510: ldur            x2, [fp, #-0x10]
    // 0x374514: r0 = LoadClassIdInstr(r2)
    //     0x374514: ldur            x0, [x2, #-1]
    //     0x374518: ubfx            x0, x0, #0xc, #0x14
    // 0x37451c: mov             x1, x2
    // 0x374520: r0 = GDT[cid_x0 + -0xfe0]()
    //     0x374520: sub             lr, x0, #0xfe0
    //     0x374524: ldr             lr, [x21, lr, lsl #3]
    //     0x374528: blr             lr
    // 0x37452c: LoadField: r1 = r0->field_7
    //     0x37452c: ldur            w1, [x0, #7]
    // 0x374530: DecompressPointer r1
    //     0x374530: add             x1, x1, HEAP, lsl #32
    // 0x374534: LoadField: r2 = r1->field_b
    //     0x374534: ldur            w2, [x1, #0xb]
    // 0x374538: r3 = LoadInt32Instr(r2)
    //     0x374538: sbfx            x3, x2, #1, #0x1f
    // 0x37453c: LoadField: r2 = r1->field_f
    //     0x37453c: ldur            w2, [x1, #0xf]
    // 0x374540: DecompressPointer r2
    //     0x374540: add             x2, x2, HEAP, lsl #32
    // 0x374544: r1 = 0
    //     0x374544: mov             x1, #0
    // 0x374548: CheckStackOverflow
    //     0x374548: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37454c: cmp             SP, x16
    //     0x374550: b.ls            #0x3745c4
    // 0x374554: cmp             x1, x3
    // 0x374558: b.ge            #0x37459c
    // 0x37455c: ArrayLoad: r4 = r2[r1]  ; Unknown_4
    //     0x37455c: add             x16, x2, x1, lsl #2
    //     0x374560: ldur            w4, [x16, #0xf]
    // 0x374564: DecompressPointer r4
    //     0x374564: add             x4, x4, HEAP, lsl #32
    // 0x374568: add             x5, x1, #1
    // 0x37456c: LoadField: r1 = r4->field_7
    //     0x37456c: ldur            w1, [x4, #7]
    // 0x374570: DecompressPointer r1
    //     0x374570: add             x1, x1, HEAP, lsl #32
    // 0x374574: ldur            x0, [fp, #-8]
    // 0x374578: StoreField: r1->field_b = r0
    //     0x374578: stur            w0, [x1, #0xb]
    //     0x37457c: ldurb           w16, [x1, #-1]
    //     0x374580: ldurb           w17, [x0, #-1]
    //     0x374584: and             x16, x17, x16, lsr #2
    //     0x374588: tst             x16, HEAP, lsr #32
    //     0x37458c: b.eq            #0x374594
    //     0x374590: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x374594: mov             x1, x5
    // 0x374598: b               #0x374548
    // 0x37459c: ldur            x2, [fp, #-0x10]
    // 0x3745a0: b               #0x3744e8
    // 0x3745a4: r0 = Null
    //     0x3745a4: mov             x0, NULL
    // 0x3745a8: LeaveFrame
    //     0x3745a8: mov             SP, fp
    //     0x3745ac: ldp             fp, lr, [SP], #0x10
    // 0x3745b0: ret
    //     0x3745b0: ret             
    // 0x3745b4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3745b4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3745b8: b               #0x374404
    // 0x3745bc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3745bc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3745c0: b               #0x3744f4
    // 0x3745c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3745c4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3745c8: b               #0x374554
  }
  _ MonsterAnimation._(/* No info */) {
    // ** addr: 0x374ed0, size: 0xdc
    // 0x374ed0: EnterFrame
    //     0x374ed0: stp             fp, lr, [SP, #-0x10]!
    //     0x374ed4: mov             fp, SP
    // 0x374ed8: AllocStack(0x20)
    //     0x374ed8: sub             SP, SP, #0x20
    // 0x374edc: r2 = false
    //     0x374edc: add             x2, NULL, #0x30  ; false
    // 0x374ee0: r0 = "log_normal.png"
    //     0x374ee0: add             x0, PP, #0xc, lsl #12  ; [pp+0xc860] "log_normal.png"
    //     0x374ee4: ldr             x0, [x0, #0x860]
    // 0x374ee8: stur            x1, [fp, #-8]
    // 0x374eec: CheckStackOverflow
    //     0x374eec: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x374ef0: cmp             SP, x16
    //     0x374ef4: b.ls            #0x374fa4
    // 0x374ef8: StoreField: r1->field_77 = r2
    //     0x374ef8: stur            w2, [x1, #0x77]
    // 0x374efc: StoreField: r1->field_7b = r0
    //     0x374efc: stur            w0, [x1, #0x7b]
    // 0x374f00: r0 = LoadStaticField(0x898)
    //     0x374f00: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x374f04: ldr             x0, [x0, #0x1130]
    // 0x374f08: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x374f0c: cmp             w0, w16
    // 0x374f10: b.ne            #0x374f20
    // 0x374f14: r2 = _relativePosition
    //     0x374f14: add             x2, PP, #0xc, lsl #12  ; [pp+0xc868] Field <MonsterAnimation._relativePosition@228109025>: static late final (offset: 0x898)
    //     0x374f18: ldr             x2, [x2, #0x868]
    // 0x374f1c: r0 = InitLateFinalStaticField()
    //     0x374f1c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x374f20: mov             x1, x0
    // 0x374f24: r0 = clone()
    //     0x374f24: bl              #0x28be08  ; [package:vector_math/vector_math.dart] Vector2::clone
    // 0x374f28: r1 = Null
    //     0x374f28: mov             x1, NULL
    // 0x374f2c: r2 = 4
    //     0x374f2c: mov             x2, #4
    // 0x374f30: stur            x0, [fp, #-0x10]
    // 0x374f34: r0 = AllocateArray()
    //     0x374f34: bl              #0x5845d8  ; AllocateArrayStub
    // 0x374f38: r16 = Instance_MonsterState
    //     0x374f38: add             x16, PP, #0xc, lsl #12  ; [pp+0xc870] Obj!MonsterState@5d8b81
    //     0x374f3c: ldr             x16, [x16, #0x870]
    // 0x374f40: StoreField: r0->field_f = r16
    //     0x374f40: stur            w16, [x0, #0xf]
    // 0x374f44: r16 = true
    //     0x374f44: add             x16, NULL, #0x20  ; true
    // 0x374f48: StoreField: r0->field_13 = r16
    //     0x374f48: stur            w16, [x0, #0x13]
    // 0x374f4c: r16 = <MonsterState, bool>
    //     0x374f4c: add             x16, PP, #0xc, lsl #12  ; [pp+0xc878] TypeArguments: <MonsterState, bool>
    //     0x374f50: ldr             x16, [x16, #0x878]
    // 0x374f54: stp             x0, x16, [SP]
    // 0x374f58: r0 = Map._fromLiteral()
    //     0x374f58: bl              #0x23b588  ; [dart:core] Map::Map._fromLiteral
    // 0x374f5c: ldur            x1, [fp, #-8]
    // 0x374f60: ldur            x3, [fp, #-0x10]
    // 0x374f64: mov             x6, x0
    // 0x374f68: r2 = Null
    //     0x374f68: mov             x2, NULL
    // 0x374f6c: r5 = Null
    //     0x374f6c: mov             x5, NULL
    // 0x374f70: r7 = Null
    //     0x374f70: mov             x7, NULL
    // 0x374f74: r0 = SpriteAnimationGroupComponent()
    //     0x374f74: bl              #0x372798  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::SpriteAnimationGroupComponent
    // 0x374f78: ldur            x0, [fp, #-8]
    // 0x374f7c: LoadField: r1 = r0->field_7b
    //     0x374f7c: ldur            w1, [x0, #0x7b]
    // 0x374f80: DecompressPointer r1
    //     0x374f80: add             x1, x1, HEAP, lsl #32
    // 0x374f84: r0 = getAnimations()
    //     0x374f84: bl              #0x375394  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::getAnimations
    // 0x374f88: ldur            x1, [fp, #-8]
    // 0x374f8c: mov             x2, x0
    // 0x374f90: r0 = animations=()
    //     0x374f90: bl              #0x374fac  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::animations=
    // 0x374f94: r0 = Null
    //     0x374f94: mov             x0, NULL
    // 0x374f98: LeaveFrame
    //     0x374f98: mov             SP, fp
    //     0x374f9c: ldp             fp, lr, [SP], #0x10
    // 0x374fa0: ret
    //     0x374fa0: ret             
    // 0x374fa4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x374fa4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x374fa8: b               #0x374ef8
  }
  static _ getAnimations(/* No info */) {
    // ** addr: 0x375394, size: 0x35c
    // 0x375394: EnterFrame
    //     0x375394: stp             fp, lr, [SP, #-0x10]!
    //     0x375398: mov             fp, SP
    // 0x37539c: AllocStack(0x30)
    //     0x37539c: sub             SP, SP, #0x30
    // 0x3753a0: SetupParameters(dynamic _ /* r1 => r2, fp-0x8 */)
    //     0x3753a0: mov             x2, x1
    //     0x3753a4: stur            x1, [fp, #-8]
    // 0x3753a8: CheckStackOverflow
    //     0x3753a8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3753ac: cmp             SP, x16
    //     0x3753b0: b.ls            #0x3756e8
    // 0x3753b4: r0 = LoadStaticField(0x860)
    //     0x3753b4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3753b8: ldr             x0, [x0, #0x10c0]
    // 0x3753bc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3753c0: cmp             w0, w16
    // 0x3753c4: b.ne            #0x3753d4
    // 0x3753c8: r2 = instance
    //     0x3753c8: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x3753cc: ldr             x2, [x2, #0x6f0]
    // 0x3753d0: r0 = InitLateFinalStaticField()
    //     0x3753d0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3753d4: LoadField: r1 = r0->field_47
    //     0x3753d4: ldur            w1, [x0, #0x47]
    // 0x3753d8: DecompressPointer r1
    //     0x3753d8: add             x1, x1, HEAP, lsl #32
    // 0x3753dc: ldur            x2, [fp, #-8]
    // 0x3753e0: r0 = fromCache()
    //     0x3753e0: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x3753e4: r1 = Null
    //     0x3753e4: mov             x1, NULL
    // 0x3753e8: r2 = 16
    //     0x3753e8: mov             x2, #0x10
    // 0x3753ec: stur            x0, [fp, #-8]
    // 0x3753f0: r0 = AllocateArray()
    //     0x3753f0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3753f4: stur            x0, [fp, #-0x10]
    // 0x3753f8: r16 = Instance_MonsterState
    //     0x3753f8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc8b8] Obj!MonsterState@5d8b41
    //     0x3753fc: ldr             x16, [x16, #0x8b8]
    // 0x375400: StoreField: r0->field_f = r16
    //     0x375400: stur            w16, [x0, #0xf]
    // 0x375404: r0 = Vector2()
    //     0x375404: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x375408: r4 = 4
    //     0x375408: mov             x4, #4
    // 0x37540c: stur            x0, [fp, #-0x18]
    // 0x375410: r0 = AllocateFloat32Array()
    //     0x375410: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x375414: ldur            x5, [fp, #-0x18]
    // 0x375418: StoreField: r5->field_7 = r0
    //     0x375418: stur            w0, [x5, #7]
    // 0x37541c: d0 = 0.000000
    //     0x37541c: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8c0] IMM: 0x41c00000
    //     0x375420: ldr             s0, [x17, #0x8c0]
    // 0x375424: StoreField: r0->field_1b = d0
    //     0x375424: stur            s0, [x0, #0x1b]
    // 0x375428: ArrayStore: r0[0] = d0  ; List_8
    //     0x375428: stur            s0, [x0, #0x17]
    // 0x37542c: r0 = Vector2()
    //     0x37542c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x375430: r4 = 4
    //     0x375430: mov             x4, #4
    // 0x375434: stur            x0, [fp, #-0x20]
    // 0x375438: r0 = AllocateFloat32Array()
    //     0x375438: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x37543c: ldur            x3, [fp, #-0x20]
    // 0x375440: StoreField: r3->field_7 = r0
    //     0x375440: stur            w0, [x3, #7]
    // 0x375444: StoreField: r0->field_1b = rZR
    //     0x375444: stur            wzr, [x0, #0x1b]
    // 0x375448: ArrayStore: r0[0] = rZR  ; List_4
    //     0x375448: stur            wzr, [x0, #0x17]
    // 0x37544c: ldur            x5, [fp, #-0x18]
    // 0x375450: r1 = Null
    //     0x375450: mov             x1, NULL
    // 0x375454: r2 = 2
    //     0x375454: mov             x2, #2
    // 0x375458: d0 = 0.500000
    //     0x375458: fmov            d0, #0.50000000
    // 0x37545c: r4 = const [0, 0x5, 0, 0x5, null]
    //     0x37545c: ldr             x4, [PP, #0x16f0]  ; [pp+0x16f0] List(5) [0, 0x5, 0, 0x5, Null]
    // 0x375460: r0 = SpriteAnimationData.sequenced()
    //     0x375460: bl              #0x375a10  ; [package:flame/src/sprite_animation.dart] SpriteAnimationData::SpriteAnimationData.sequenced
    // 0x375464: ldur            x2, [fp, #-8]
    // 0x375468: mov             x3, x0
    // 0x37546c: r1 = Null
    //     0x37546c: mov             x1, NULL
    // 0x375470: r0 = SpriteAnimation.fromFrameData()
    //     0x375470: bl              #0x3756f0  ; [package:flame/src/sprite_animation.dart] SpriteAnimation::SpriteAnimation.fromFrameData
    // 0x375474: ldur            x1, [fp, #-0x10]
    // 0x375478: ArrayStore: r1[1] = r0  ; List_4
    //     0x375478: add             x25, x1, #0x13
    //     0x37547c: str             w0, [x25]
    //     0x375480: tbz             w0, #0, #0x37549c
    //     0x375484: ldurb           w16, [x1, #-1]
    //     0x375488: ldurb           w17, [x0, #-1]
    //     0x37548c: and             x16, x17, x16, lsr #2
    //     0x375490: tst             x16, HEAP, lsr #32
    //     0x375494: b.eq            #0x37549c
    //     0x375498: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x37549c: ldur            x1, [fp, #-0x10]
    // 0x3754a0: r16 = Instance_MonsterState
    //     0x3754a0: add             x16, PP, #0xc, lsl #12  ; [pp+0xc8c8] Obj!MonsterState@5d8b21
    //     0x3754a4: ldr             x16, [x16, #0x8c8]
    // 0x3754a8: ArrayStore: r1[0] = r16  ; List_4
    //     0x3754a8: stur            w16, [x1, #0x17]
    // 0x3754ac: r0 = Vector2()
    //     0x3754ac: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3754b0: r4 = 4
    //     0x3754b0: mov             x4, #4
    // 0x3754b4: stur            x0, [fp, #-0x18]
    // 0x3754b8: r0 = AllocateFloat32Array()
    //     0x3754b8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3754bc: ldur            x5, [fp, #-0x18]
    // 0x3754c0: StoreField: r5->field_7 = r0
    //     0x3754c0: stur            w0, [x5, #7]
    // 0x3754c4: d0 = 0.000000
    //     0x3754c4: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8c0] IMM: 0x41c00000
    //     0x3754c8: ldr             s0, [x17, #0x8c0]
    // 0x3754cc: StoreField: r0->field_1b = d0
    //     0x3754cc: stur            s0, [x0, #0x1b]
    // 0x3754d0: ArrayStore: r0[0] = d0  ; List_8
    //     0x3754d0: stur            s0, [x0, #0x17]
    // 0x3754d4: r0 = Vector2()
    //     0x3754d4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3754d8: r4 = 4
    //     0x3754d8: mov             x4, #4
    // 0x3754dc: stur            x0, [fp, #-0x20]
    // 0x3754e0: r0 = AllocateFloat32Array()
    //     0x3754e0: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3754e4: ldur            x3, [fp, #-0x20]
    // 0x3754e8: StoreField: r3->field_7 = r0
    //     0x3754e8: stur            w0, [x3, #7]
    // 0x3754ec: d1 = 0.000000
    //     0x3754ec: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8c0] IMM: 0x41c00000
    //     0x3754f0: ldr             s1, [x17, #0x8c0]
    // 0x3754f4: StoreField: r0->field_1b = d1
    //     0x3754f4: stur            s1, [x0, #0x1b]
    // 0x3754f8: ArrayStore: r0[0] = rZR  ; List_4
    //     0x3754f8: stur            wzr, [x0, #0x17]
    // 0x3754fc: ldur            x5, [fp, #-0x18]
    // 0x375500: r1 = Null
    //     0x375500: mov             x1, NULL
    // 0x375504: r2 = 4
    //     0x375504: mov             x2, #4
    // 0x375508: d0 = 0.250000
    //     0x375508: fmov            d0, #0.25000000
    // 0x37550c: r4 = const [0, 0x5, 0, 0x5, null]
    //     0x37550c: ldr             x4, [PP, #0x16f0]  ; [pp+0x16f0] List(5) [0, 0x5, 0, 0x5, Null]
    // 0x375510: r0 = SpriteAnimationData.sequenced()
    //     0x375510: bl              #0x375a10  ; [package:flame/src/sprite_animation.dart] SpriteAnimationData::SpriteAnimationData.sequenced
    // 0x375514: ldur            x2, [fp, #-8]
    // 0x375518: mov             x3, x0
    // 0x37551c: r1 = Null
    //     0x37551c: mov             x1, NULL
    // 0x375520: r0 = SpriteAnimation.fromFrameData()
    //     0x375520: bl              #0x3756f0  ; [package:flame/src/sprite_animation.dart] SpriteAnimation::SpriteAnimation.fromFrameData
    // 0x375524: ldur            x1, [fp, #-0x10]
    // 0x375528: ArrayStore: r1[3] = r0  ; List_4
    //     0x375528: add             x25, x1, #0x1b
    //     0x37552c: str             w0, [x25]
    //     0x375530: tbz             w0, #0, #0x37554c
    //     0x375534: ldurb           w16, [x1, #-1]
    //     0x375538: ldurb           w17, [x0, #-1]
    //     0x37553c: and             x16, x17, x16, lsr #2
    //     0x375540: tst             x16, HEAP, lsr #32
    //     0x375544: b.eq            #0x37554c
    //     0x375548: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x37554c: ldur            x1, [fp, #-0x10]
    // 0x375550: r16 = Instance_MonsterState
    //     0x375550: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7d8] Obj!MonsterState@5d8b61
    //     0x375554: ldr             x16, [x16, #0x7d8]
    // 0x375558: StoreField: r1->field_1f = r16
    //     0x375558: stur            w16, [x1, #0x1f]
    // 0x37555c: r0 = Vector2()
    //     0x37555c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x375560: r4 = 4
    //     0x375560: mov             x4, #4
    // 0x375564: stur            x0, [fp, #-0x18]
    // 0x375568: r0 = AllocateFloat32Array()
    //     0x375568: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x37556c: ldur            x5, [fp, #-0x18]
    // 0x375570: StoreField: r5->field_7 = r0
    //     0x375570: stur            w0, [x5, #7]
    // 0x375574: d0 = 0.000000
    //     0x375574: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8c0] IMM: 0x41c00000
    //     0x375578: ldr             s0, [x17, #0x8c0]
    // 0x37557c: StoreField: r0->field_1b = d0
    //     0x37557c: stur            s0, [x0, #0x1b]
    // 0x375580: ArrayStore: r0[0] = d0  ; List_8
    //     0x375580: stur            s0, [x0, #0x17]
    // 0x375584: r0 = Vector2()
    //     0x375584: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x375588: r4 = 4
    //     0x375588: mov             x4, #4
    // 0x37558c: stur            x0, [fp, #-0x20]
    // 0x375590: r0 = AllocateFloat32Array()
    //     0x375590: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x375594: ldur            x3, [fp, #-0x20]
    // 0x375598: StoreField: r3->field_7 = r0
    //     0x375598: stur            w0, [x3, #7]
    // 0x37559c: StoreField: r0->field_1b = rZR
    //     0x37559c: stur            wzr, [x0, #0x1b]
    // 0x3755a0: d0 = 0.000000
    //     0x3755a0: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8d0] IMM: 0x42900000
    //     0x3755a4: ldr             s0, [x17, #0x8d0]
    // 0x3755a8: ArrayStore: r0[0] = d0  ; List_8
    //     0x3755a8: stur            s0, [x0, #0x17]
    // 0x3755ac: r16 = false
    //     0x3755ac: add             x16, NULL, #0x30  ; false
    // 0x3755b0: str             x16, [SP]
    // 0x3755b4: ldur            x5, [fp, #-0x18]
    // 0x3755b8: r1 = Null
    //     0x3755b8: mov             x1, NULL
    // 0x3755bc: r2 = 1
    //     0x3755bc: mov             x2, #1
    // 0x3755c0: d0 = 1.000000
    //     0x3755c0: fmov            d0, #1.00000000
    // 0x3755c4: r4 = const [0, 0x6, 0x1, 0x5, loop, 0x5, null]
    //     0x3755c4: add             x4, PP, #0xc, lsl #12  ; [pp+0xc8d8] List(7) [0, 0x6, 0x1, 0x5, "loop", 0x5, Null]
    //     0x3755c8: ldr             x4, [x4, #0x8d8]
    // 0x3755cc: r0 = SpriteAnimationData.sequenced()
    //     0x3755cc: bl              #0x375a10  ; [package:flame/src/sprite_animation.dart] SpriteAnimationData::SpriteAnimationData.sequenced
    // 0x3755d0: ldur            x2, [fp, #-8]
    // 0x3755d4: mov             x3, x0
    // 0x3755d8: r1 = Null
    //     0x3755d8: mov             x1, NULL
    // 0x3755dc: r0 = SpriteAnimation.fromFrameData()
    //     0x3755dc: bl              #0x3756f0  ; [package:flame/src/sprite_animation.dart] SpriteAnimation::SpriteAnimation.fromFrameData
    // 0x3755e0: ldur            x1, [fp, #-0x10]
    // 0x3755e4: ArrayStore: r1[5] = r0  ; List_4
    //     0x3755e4: add             x25, x1, #0x23
    //     0x3755e8: str             w0, [x25]
    //     0x3755ec: tbz             w0, #0, #0x375608
    //     0x3755f0: ldurb           w16, [x1, #-1]
    //     0x3755f4: ldurb           w17, [x0, #-1]
    //     0x3755f8: and             x16, x17, x16, lsr #2
    //     0x3755fc: tst             x16, HEAP, lsr #32
    //     0x375600: b.eq            #0x375608
    //     0x375604: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x375608: ldur            x1, [fp, #-0x10]
    // 0x37560c: r16 = Instance_MonsterState
    //     0x37560c: add             x16, PP, #0xc, lsl #12  ; [pp+0xc870] Obj!MonsterState@5d8b81
    //     0x375610: ldr             x16, [x16, #0x870]
    // 0x375614: StoreField: r1->field_27 = r16
    //     0x375614: stur            w16, [x1, #0x27]
    // 0x375618: r0 = Vector2()
    //     0x375618: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x37561c: r4 = 4
    //     0x37561c: mov             x4, #4
    // 0x375620: stur            x0, [fp, #-0x18]
    // 0x375624: r0 = AllocateFloat32Array()
    //     0x375624: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x375628: ldur            x5, [fp, #-0x18]
    // 0x37562c: StoreField: r5->field_7 = r0
    //     0x37562c: stur            w0, [x5, #7]
    // 0x375630: d0 = 0.000000
    //     0x375630: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8c0] IMM: 0x41c00000
    //     0x375634: ldr             s0, [x17, #0x8c0]
    // 0x375638: StoreField: r0->field_1b = d0
    //     0x375638: stur            s0, [x0, #0x1b]
    // 0x37563c: ArrayStore: r0[0] = d0  ; List_8
    //     0x37563c: stur            s0, [x0, #0x17]
    // 0x375640: r0 = Vector2()
    //     0x375640: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x375644: r4 = 4
    //     0x375644: mov             x4, #4
    // 0x375648: stur            x0, [fp, #-0x20]
    // 0x37564c: r0 = AllocateFloat32Array()
    //     0x37564c: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x375650: ldur            x3, [fp, #-0x20]
    // 0x375654: StoreField: r3->field_7 = r0
    //     0x375654: stur            w0, [x3, #7]
    // 0x375658: d0 = 0.000000
    //     0x375658: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e0] IMM: 0x42400000
    //     0x37565c: ldr             s0, [x17, #0x8e0]
    // 0x375660: StoreField: r0->field_1b = d0
    //     0x375660: stur            s0, [x0, #0x1b]
    // 0x375664: ArrayStore: r0[0] = rZR  ; List_4
    //     0x375664: stur            wzr, [x0, #0x17]
    // 0x375668: r16 = false
    //     0x375668: add             x16, NULL, #0x30  ; false
    // 0x37566c: str             x16, [SP]
    // 0x375670: ldur            x5, [fp, #-0x18]
    // 0x375674: r1 = Null
    //     0x375674: mov             x1, NULL
    // 0x375678: r2 = 3
    //     0x375678: mov             x2, #3
    // 0x37567c: d0 = 0.100000
    //     0x37567c: add             x17, PP, #0xc, lsl #12  ; [pp+0xc8e8] IMM: double(0.09999999999999999) from 0x3fb9999999999999
    //     0x375680: ldr             d0, [x17, #0x8e8]
    // 0x375684: r4 = const [0, 0x6, 0x1, 0x5, loop, 0x5, null]
    //     0x375684: add             x4, PP, #0xc, lsl #12  ; [pp+0xc8d8] List(7) [0, 0x6, 0x1, 0x5, "loop", 0x5, Null]
    //     0x375688: ldr             x4, [x4, #0x8d8]
    // 0x37568c: r0 = SpriteAnimationData.sequenced()
    //     0x37568c: bl              #0x375a10  ; [package:flame/src/sprite_animation.dart] SpriteAnimationData::SpriteAnimationData.sequenced
    // 0x375690: ldur            x2, [fp, #-8]
    // 0x375694: mov             x3, x0
    // 0x375698: r1 = Null
    //     0x375698: mov             x1, NULL
    // 0x37569c: r0 = SpriteAnimation.fromFrameData()
    //     0x37569c: bl              #0x3756f0  ; [package:flame/src/sprite_animation.dart] SpriteAnimation::SpriteAnimation.fromFrameData
    // 0x3756a0: ldur            x1, [fp, #-0x10]
    // 0x3756a4: ArrayStore: r1[7] = r0  ; List_4
    //     0x3756a4: add             x25, x1, #0x2b
    //     0x3756a8: str             w0, [x25]
    //     0x3756ac: tbz             w0, #0, #0x3756c8
    //     0x3756b0: ldurb           w16, [x1, #-1]
    //     0x3756b4: ldurb           w17, [x0, #-1]
    //     0x3756b8: and             x16, x17, x16, lsr #2
    //     0x3756bc: tst             x16, HEAP, lsr #32
    //     0x3756c0: b.eq            #0x3756c8
    //     0x3756c4: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3756c8: r16 = <MonsterState, SpriteAnimation>
    //     0x3756c8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc8f0] TypeArguments: <MonsterState, SpriteAnimation>
    //     0x3756cc: ldr             x16, [x16, #0x8f0]
    // 0x3756d0: ldur            lr, [fp, #-0x10]
    // 0x3756d4: stp             lr, x16, [SP]
    // 0x3756d8: r0 = Map._fromLiteral()
    //     0x3756d8: bl              #0x23b588  ; [dart:core] Map::Map._fromLiteral
    // 0x3756dc: LeaveFrame
    //     0x3756dc: mov             SP, fp
    //     0x3756e0: ldp             fp, lr, [SP], #0x10
    // 0x3756e4: ret
    //     0x3756e4: ret             
    // 0x3756e8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3756e8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3756ec: b               #0x3753b4
  }
  static Vector2 _relativePosition() {
    // ** addr: 0x375f7c, size: 0x44
    // 0x375f7c: EnterFrame
    //     0x375f7c: stp             fp, lr, [SP, #-0x10]!
    //     0x375f80: mov             fp, SP
    // 0x375f84: AllocStack(0x8)
    //     0x375f84: sub             SP, SP, #8
    // 0x375f88: r0 = Vector2()
    //     0x375f88: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x375f8c: r4 = 4
    //     0x375f8c: mov             x4, #4
    // 0x375f90: stur            x0, [fp, #-8]
    // 0x375f94: r0 = AllocateFloat32Array()
    //     0x375f94: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x375f98: mov             x1, x0
    // 0x375f9c: ldur            x0, [fp, #-8]
    // 0x375fa0: StoreField: r0->field_7 = r1
    //     0x375fa0: stur            w1, [x0, #7]
    // 0x375fa4: d0 = -nan
    //     0x375fa4: add             x17, PP, #0xc, lsl #12  ; [pp+0xc938] IMM: double(-nan) from 0xffffffffc0000000
    //     0x375fa8: ldr             s0, [x17, #0x938]
    // 0x375fac: StoreField: r1->field_1b = d0
    //     0x375fac: stur            s0, [x1, #0x1b]
    // 0x375fb0: ArrayStore: r1[0] = d0  ; List_8
    //     0x375fb0: stur            s0, [x1, #0x17]
    // 0x375fb4: LeaveFrame
    //     0x375fb4: mov             SP, fp
    //     0x375fb8: ldp             fp, lr, [SP], #0x10
    // 0x375fbc: ret
    //     0x375fbc: ret             
  }
  set _ walking=(/* No info */) {
    // ** addr: 0x37d7d0, size: 0x50
    // 0x37d7d0: EnterFrame
    //     0x37d7d0: stp             fp, lr, [SP, #-0x10]!
    //     0x37d7d4: mov             fp, SP
    // 0x37d7d8: CheckStackOverflow
    //     0x37d7d8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d7dc: cmp             SP, x16
    //     0x37d7e0: b.ls            #0x37d818
    // 0x37d7e4: StoreField: r1->field_77 = r2
    //     0x37d7e4: stur            w2, [x1, #0x77]
    // 0x37d7e8: tbnz            w2, #4, #0x37d7fc
    // 0x37d7ec: r2 = Instance_MonsterState
    //     0x37d7ec: add             x2, PP, #0xc, lsl #12  ; [pp+0xc8c8] Obj!MonsterState@5d8b21
    //     0x37d7f0: ldr             x2, [x2, #0x8c8]
    // 0x37d7f4: r0 = current=()
    //     0x37d7f4: bl              #0x3780ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::current=
    // 0x37d7f8: b               #0x37d808
    // 0x37d7fc: r2 = Instance_MonsterState
    //     0x37d7fc: add             x2, PP, #0xc, lsl #12  ; [pp+0xc8b8] Obj!MonsterState@5d8b41
    //     0x37d800: ldr             x2, [x2, #0x8b8]
    // 0x37d804: r0 = current=()
    //     0x37d804: bl              #0x3780ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::current=
    // 0x37d808: r0 = Null
    //     0x37d808: mov             x0, NULL
    // 0x37d80c: LeaveFrame
    //     0x37d80c: mov             SP, fp
    //     0x37d810: ldp             fp, lr, [SP], #0x10
    // 0x37d814: ret
    //     0x37d814: ret             
    // 0x37d818: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d818: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d81c: b               #0x37d7e4
  }
  static _ preloadSprites(/* No info */) {
    // ** addr: 0x3c60bc, size: 0xe8
    // 0x3c60bc: EnterFrame
    //     0x3c60bc: stp             fp, lr, [SP, #-0x10]!
    //     0x3c60c0: mov             fp, SP
    // 0x3c60c4: AllocStack(0x30)
    //     0x3c60c4: sub             SP, SP, #0x30
    // 0x3c60c8: SetupParameters(dynamic _ /* r1 => r0, fp-0x8 */)
    //     0x3c60c8: mov             x0, x1
    //     0x3c60cc: stur            x1, [fp, #-8]
    // 0x3c60d0: CheckStackOverflow
    //     0x3c60d0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c60d4: cmp             SP, x16
    //     0x3c60d8: b.ls            #0x3c619c
    // 0x3c60dc: LoadField: r1 = r0->field_47
    //     0x3c60dc: ldur            w1, [x0, #0x47]
    // 0x3c60e0: DecompressPointer r1
    //     0x3c60e0: add             x1, x1, HEAP, lsl #32
    // 0x3c60e4: r2 = "log_normal.png"
    //     0x3c60e4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc860] "log_normal.png"
    //     0x3c60e8: ldr             x2, [x2, #0x860]
    // 0x3c60ec: r0 = load()
    //     0x3c60ec: bl              #0x3c4ce0  ; [package:flame/src/cache/images.dart] Images::load
    // 0x3c60f0: mov             x3, x0
    // 0x3c60f4: ldur            x0, [fp, #-8]
    // 0x3c60f8: stur            x3, [fp, #-0x10]
    // 0x3c60fc: LoadField: r1 = r0->field_47
    //     0x3c60fc: ldur            w1, [x0, #0x47]
    // 0x3c6100: DecompressPointer r1
    //     0x3c6100: add             x1, x1, HEAP, lsl #32
    // 0x3c6104: r2 = "log_green.png"
    //     0x3c6104: add             x2, PP, #0xd, lsl #12  ; [pp+0xd2f8] "log_green.png"
    //     0x3c6108: ldr             x2, [x2, #0x2f8]
    // 0x3c610c: r0 = load()
    //     0x3c610c: bl              #0x3c4ce0  ; [package:flame/src/cache/images.dart] Images::load
    // 0x3c6110: mov             x3, x0
    // 0x3c6114: ldur            x0, [fp, #-8]
    // 0x3c6118: stur            x3, [fp, #-0x18]
    // 0x3c611c: LoadField: r1 = r0->field_47
    //     0x3c611c: ldur            w1, [x0, #0x47]
    // 0x3c6120: DecompressPointer r1
    //     0x3c6120: add             x1, x1, HEAP, lsl #32
    // 0x3c6124: r2 = "log_gold.png"
    //     0x3c6124: add             x2, PP, #0xd, lsl #12  ; [pp+0xd300] "log_gold.png"
    //     0x3c6128: ldr             x2, [x2, #0x300]
    // 0x3c612c: r0 = load()
    //     0x3c612c: bl              #0x3c4ce0  ; [package:flame/src/cache/images.dart] Images::load
    // 0x3c6130: r1 = Null
    //     0x3c6130: mov             x1, NULL
    // 0x3c6134: r2 = 6
    //     0x3c6134: mov             x2, #6
    // 0x3c6138: stur            x0, [fp, #-8]
    // 0x3c613c: r0 = AllocateArray()
    //     0x3c613c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3c6140: mov             x2, x0
    // 0x3c6144: ldur            x0, [fp, #-0x10]
    // 0x3c6148: stur            x2, [fp, #-0x20]
    // 0x3c614c: StoreField: r2->field_f = r0
    //     0x3c614c: stur            w0, [x2, #0xf]
    // 0x3c6150: ldur            x0, [fp, #-0x18]
    // 0x3c6154: StoreField: r2->field_13 = r0
    //     0x3c6154: stur            w0, [x2, #0x13]
    // 0x3c6158: ldur            x0, [fp, #-8]
    // 0x3c615c: ArrayStore: r2[0] = r0  ; List_4
    //     0x3c615c: stur            w0, [x2, #0x17]
    // 0x3c6160: r1 = <Future<Image>>
    //     0x3c6160: add             x1, PP, #0xf, lsl #12  ; [pp+0xfee0] TypeArguments: <Future<Image>>
    //     0x3c6164: ldr             x1, [x1, #0xee0]
    // 0x3c6168: r0 = AllocateGrowableArray()
    //     0x3c6168: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3c616c: mov             x1, x0
    // 0x3c6170: ldur            x0, [fp, #-0x20]
    // 0x3c6174: StoreField: r1->field_f = r0
    //     0x3c6174: stur            w0, [x1, #0xf]
    // 0x3c6178: r0 = 6
    //     0x3c6178: mov             x0, #6
    // 0x3c617c: StoreField: r1->field_b = r0
    //     0x3c617c: stur            w0, [x1, #0xb]
    // 0x3c6180: r16 = <Image>
    //     0x3c6180: ldr             x16, [PP, #0x1180]  ; [pp+0x1180] TypeArguments: <Image>
    // 0x3c6184: stp             x1, x16, [SP]
    // 0x3c6188: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x3c6188: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x3c618c: r0 = wait()
    //     0x3c618c: bl              #0x263a08  ; [dart:async] Future::wait
    // 0x3c6190: LeaveFrame
    //     0x3c6190: mov             SP, fp
    //     0x3c6194: ldp             fp, lr, [SP], #0x10
    // 0x3c6198: ret
    //     0x3c6198: ret             
    // 0x3c619c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c619c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c61a0: b               #0x3c60dc
  }
  _ onLoad(/* No info */) async {
    // ** addr: 0x4348d4, size: 0x8c
    // 0x4348d4: EnterFrame
    //     0x4348d4: stp             fp, lr, [SP, #-0x10]!
    //     0x4348d8: mov             fp, SP
    // 0x4348dc: AllocStack(0x18)
    //     0x4348dc: sub             SP, SP, #0x18
    // 0x4348e0: SetupParameters(MonsterAnimation this /* r1 => r1, fp-0x10 */)
    //     0x4348e0: stur            NULL, [fp, #-8]
    //     0x4348e4: stur            x1, [fp, #-0x10]
    // 0x4348e8: CheckStackOverflow
    //     0x4348e8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4348ec: cmp             SP, x16
    //     0x4348f0: b.ls            #0x434958
    // 0x4348f4: InitAsync() -> Future<void?>
    //     0x4348f4: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x4348f8: bl              #0x2556b4  ; InitAsyncStub
    // 0x4348fc: r0 = Null
    //     0x4348fc: mov             x0, NULL
    // 0x434900: r0 = Await()
    //     0x434900: bl              #0x255470  ; AwaitStub
    // 0x434904: ldur            x1, [fp, #-0x10]
    // 0x434908: r2 = Instance_MonsterState
    //     0x434908: add             x2, PP, #0xc, lsl #12  ; [pp+0xc8b8] Obj!MonsterState@5d8b41
    //     0x43490c: ldr             x2, [x2, #0x8b8]
    // 0x434910: r0 = current=()
    //     0x434910: bl              #0x3780ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::current=
    // 0x434914: ldur            x0, [fp, #-0x10]
    // 0x434918: LoadField: r2 = r0->field_77
    //     0x434918: ldur            w2, [x0, #0x77]
    // 0x43491c: DecompressPointer r2
    //     0x43491c: add             x2, x2, HEAP, lsl #32
    // 0x434920: mov             x1, x0
    // 0x434924: r0 = walking=()
    //     0x434924: bl              #0x37d7d0  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::walking=
    // 0x434928: ldur            x0, [fp, #-0x10]
    // 0x43492c: LoadField: r2 = r0->field_3b
    //     0x43492c: ldur            w2, [x0, #0x3b]
    // 0x434930: DecompressPointer r2
    //     0x434930: add             x2, x2, HEAP, lsl #32
    // 0x434934: mov             x1, x2
    // 0x434938: stur            x2, [fp, #-0x18]
    // 0x43493c: d0 = 20.000000
    //     0x43493c: fmov            d0, #20.00000000
    // 0x434940: r0 = x=()
    //     0x434940: bl              #0x549020  ; [package:flame/src/game/notifying_vector2.dart] NotifyingVector2::x=
    // 0x434944: ldur            x1, [fp, #-0x18]
    // 0x434948: d0 = 20.000000
    //     0x434948: fmov            d0, #20.00000000
    // 0x43494c: r0 = y=()
    //     0x43494c: bl              #0x548fbc  ; [package:flame/src/game/notifying_vector2.dart] NotifyingVector2::y=
    // 0x434950: r0 = Null
    //     0x434950: mov             x0, NULL
    // 0x434954: r0 = ReturnAsyncNotFuture()
    //     0x434954: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x434958: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x434958: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x43495c: b               #0x4348f4
  }
}

// class id: 3842, size: 0x14, field offset: 0x14
enum KillReward extends _Enum {

  _Mint field_8;
  _OneByteString field_10;

  _ _enumToString(/* No info */) {
    // ** addr: 0x4a0218, size: 0x64
    // 0x4a0218: EnterFrame
    //     0x4a0218: stp             fp, lr, [SP, #-0x10]!
    //     0x4a021c: mov             fp, SP
    // 0x4a0220: AllocStack(0x10)
    //     0x4a0220: sub             SP, SP, #0x10
    // 0x4a0224: SetupParameters(KillReward this /* r1 => r0, fp-0x8 */)
    //     0x4a0224: mov             x0, x1
    //     0x4a0228: stur            x1, [fp, #-8]
    // 0x4a022c: CheckStackOverflow
    //     0x4a022c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a0230: cmp             SP, x16
    //     0x4a0234: b.ls            #0x4a0274
    // 0x4a0238: r1 = Null
    //     0x4a0238: mov             x1, NULL
    // 0x4a023c: r2 = 4
    //     0x4a023c: mov             x2, #4
    // 0x4a0240: r0 = AllocateArray()
    //     0x4a0240: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a0244: r16 = "KillReward."
    //     0x4a0244: add             x16, PP, #0xe, lsl #12  ; [pp+0xe770] "KillReward."
    //     0x4a0248: ldr             x16, [x16, #0x770]
    // 0x4a024c: StoreField: r0->field_f = r16
    //     0x4a024c: stur            w16, [x0, #0xf]
    // 0x4a0250: ldur            x1, [fp, #-8]
    // 0x4a0254: LoadField: r2 = r1->field_f
    //     0x4a0254: ldur            w2, [x1, #0xf]
    // 0x4a0258: DecompressPointer r2
    //     0x4a0258: add             x2, x2, HEAP, lsl #32
    // 0x4a025c: StoreField: r0->field_13 = r2
    //     0x4a025c: stur            w2, [x0, #0x13]
    // 0x4a0260: str             x0, [SP]
    // 0x4a0264: r0 = _interpolate()
    //     0x4a0264: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a0268: LeaveFrame
    //     0x4a0268: mov             SP, fp
    //     0x4a026c: ldp             fp, lr, [SP], #0x10
    // 0x4a0270: ret
    //     0x4a0270: ret             
    // 0x4a0274: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a0274: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a0278: b               #0x4a0238
  }
}

// class id: 3843, size: 0x14, field offset: 0x14
enum MonsterState extends _Enum {

  _Mint field_8;
  _OneByteString field_10;

  _ _enumToString(/* No info */) {
    // ** addr: 0x4a01b4, size: 0x64
    // 0x4a01b4: EnterFrame
    //     0x4a01b4: stp             fp, lr, [SP, #-0x10]!
    //     0x4a01b8: mov             fp, SP
    // 0x4a01bc: AllocStack(0x10)
    //     0x4a01bc: sub             SP, SP, #0x10
    // 0x4a01c0: SetupParameters(MonsterState this /* r1 => r0, fp-0x8 */)
    //     0x4a01c0: mov             x0, x1
    //     0x4a01c4: stur            x1, [fp, #-8]
    // 0x4a01c8: CheckStackOverflow
    //     0x4a01c8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a01cc: cmp             SP, x16
    //     0x4a01d0: b.ls            #0x4a0210
    // 0x4a01d4: r1 = Null
    //     0x4a01d4: mov             x1, NULL
    // 0x4a01d8: r2 = 4
    //     0x4a01d8: mov             x2, #4
    // 0x4a01dc: r0 = AllocateArray()
    //     0x4a01dc: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a01e0: r16 = "MonsterState."
    //     0x4a01e0: add             x16, PP, #0xe, lsl #12  ; [pp+0xe768] "MonsterState."
    //     0x4a01e4: ldr             x16, [x16, #0x768]
    // 0x4a01e8: StoreField: r0->field_f = r16
    //     0x4a01e8: stur            w16, [x0, #0xf]
    // 0x4a01ec: ldur            x1, [fp, #-8]
    // 0x4a01f0: LoadField: r2 = r1->field_f
    //     0x4a01f0: ldur            w2, [x1, #0xf]
    // 0x4a01f4: DecompressPointer r2
    //     0x4a01f4: add             x2, x2, HEAP, lsl #32
    // 0x4a01f8: StoreField: r0->field_13 = r2
    //     0x4a01f8: stur            w2, [x0, #0x13]
    // 0x4a01fc: str             x0, [SP]
    // 0x4a0200: r0 = _interpolate()
    //     0x4a0200: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a0204: LeaveFrame
    //     0x4a0204: mov             SP, fp
    //     0x4a0208: ldp             fp, lr, [SP], #0x10
    // 0x4a020c: ret
    //     0x4a020c: ret             
    // 0x4a0210: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a0210: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a0214: b               #0x4a01d4
  }
}
