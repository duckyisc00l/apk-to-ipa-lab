// lib: , url: package:ricochlime/flame/components/aim_guide.dart

// class id: 1049301, size: 0x8
class :: {
}

// class id: 261, size: 0x18, field offset: 0x8
class AimDetails extends Object {

  _ reflectionPoint(/* No info */) {
    // ** addr: 0x3c96e0, size: 0x1b4
    // 0x3c96e0: EnterFrame
    //     0x3c96e0: stp             fp, lr, [SP, #-0x10]!
    //     0x3c96e4: mov             fp, SP
    // 0x3c96e8: AllocStack(0x18)
    //     0x3c96e8: sub             SP, SP, #0x18
    // 0x3c96ec: d0 = 0.000000
    //     0x3c96ec: eor             v0.16b, v0.16b, v0.16b
    // 0x3c96f0: LoadField: r0 = r1->field_7
    //     0x3c96f0: ldur            w0, [x1, #7]
    // 0x3c96f4: DecompressPointer r0
    //     0x3c96f4: add             x0, x0, HEAP, lsl #32
    // 0x3c96f8: LoadField: r3 = r0->field_7
    //     0x3c96f8: ldur            w3, [x0, #7]
    // 0x3c96fc: DecompressPointer r3
    //     0x3c96fc: add             x3, x3, HEAP, lsl #32
    // 0x3c9700: LoadField: r0 = r3->field_13
    //     0x3c9700: ldur            w0, [x3, #0x13]
    // 0x3c9704: r4 = LoadInt32Instr(r0)
    //     0x3c9704: sbfx            x4, x0, #1, #0x1f
    // 0x3c9708: mov             x0, x4
    // 0x3c970c: r1 = 0
    //     0x3c970c: mov             x1, #0
    // 0x3c9710: cmp             x1, x0
    // 0x3c9714: b.hs            #0x3c9884
    // 0x3c9718: ArrayLoad: d1 = r3[0]  ; List_8
    //     0x3c9718: ldur            s1, [x3, #0x17]
    // 0x3c971c: fcvt            d2, s1
    // 0x3c9720: fcmp            d2, d0
    // 0x3c9724: b.ne            #0x3c979c
    // 0x3c9728: r5 = Instance_Rect
    //     0x3c9728: add             x5, PP, #0x1f, lsl #12  ; [pp+0x1fdf8] Obj!Rect@5d0071
    //     0x3c972c: ldr             x5, [x5, #0xdf8]
    // 0x3c9730: LoadField: d0 = r5->field_f
    //     0x3c9730: ldur            d0, [x5, #0xf]
    // 0x3c9734: LoadField: r3 = r2->field_7
    //     0x3c9734: ldur            w3, [x2, #7]
    // 0x3c9738: DecompressPointer r3
    //     0x3c9738: add             x3, x3, HEAP, lsl #32
    // 0x3c973c: LoadField: r0 = r3->field_13
    //     0x3c973c: ldur            w0, [x3, #0x13]
    // 0x3c9740: r1 = LoadInt32Instr(r0)
    //     0x3c9740: sbfx            x1, x0, #1, #0x1f
    // 0x3c9744: mov             x0, x1
    // 0x3c9748: r1 = 1
    //     0x3c9748: mov             x1, #1
    // 0x3c974c: cmp             x1, x0
    // 0x3c9750: b.hs            #0x3c9888
    // 0x3c9754: LoadField: d1 = r3->field_1b
    //     0x3c9754: ldur            s1, [x3, #0x1b]
    // 0x3c9758: fcvt            d2, s1
    // 0x3c975c: fsub            d1, d0, d2
    // 0x3c9760: stur            d1, [fp, #-0x10]
    // 0x3c9764: r0 = Vector2()
    //     0x3c9764: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3c9768: r4 = 4
    //     0x3c9768: mov             x4, #4
    // 0x3c976c: stur            x0, [fp, #-8]
    // 0x3c9770: r0 = AllocateFloat32Array()
    //     0x3c9770: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3c9774: mov             x1, x0
    // 0x3c9778: ldur            x0, [fp, #-8]
    // 0x3c977c: StoreField: r0->field_7 = r1
    //     0x3c977c: stur            w1, [x0, #7]
    // 0x3c9780: ldur            d0, [fp, #-0x10]
    // 0x3c9784: fcvt            s1, d0
    // 0x3c9788: StoreField: r1->field_1b = d1
    //     0x3c9788: stur            s1, [x1, #0x1b]
    // 0x3c978c: ArrayStore: r1[0] = rZR  ; List_4
    //     0x3c978c: stur            wzr, [x1, #0x17]
    // 0x3c9790: LeaveFrame
    //     0x3c9790: mov             SP, fp
    //     0x3c9794: ldp             fp, lr, [SP], #0x10
    // 0x3c9798: ret
    //     0x3c9798: ret             
    // 0x3c979c: r5 = Instance_Rect
    //     0x3c979c: add             x5, PP, #0x1f, lsl #12  ; [pp+0x1fdf8] Obj!Rect@5d0071
    //     0x3c97a0: ldr             x5, [x5, #0xdf8]
    // 0x3c97a4: mov             x0, x4
    // 0x3c97a8: r1 = 1
    //     0x3c97a8: mov             x1, #1
    // 0x3c97ac: cmp             x1, x0
    // 0x3c97b0: b.hs            #0x3c988c
    // 0x3c97b4: LoadField: d1 = r3->field_1b
    //     0x3c97b4: ldur            s1, [x3, #0x1b]
    // 0x3c97b8: fcvt            d3, s1
    // 0x3c97bc: fcmp            d2, d0
    // 0x3c97c0: b.ne            #0x3c97cc
    // 0x3c97c4: d5 = 0.000000
    //     0x3c97c4: eor             v5.16b, v5.16b, v5.16b
    // 0x3c97c8: b               #0x3c97e4
    // 0x3c97cc: fcmp            d0, d2
    // 0x3c97d0: b.le            #0x3c97dc
    // 0x3c97d4: fneg            d1, d2
    // 0x3c97d8: b               #0x3c97e0
    // 0x3c97dc: mov             v1.16b, v2.16b
    // 0x3c97e0: mov             v5.16b, v1.16b
    // 0x3c97e4: d4 = 120.000000
    //     0x3c97e4: add             x17, PP, #9, lsl #12  ; [pp+0x91a0] IMM: double(120) from 0x405e000000000000
    //     0x3c97e8: ldr             d4, [x17, #0x1a0]
    // 0x3c97ec: d1 = 2.000000
    //     0x3c97ec: fmov            d1, #2.00000000
    // 0x3c97f0: fdiv            d6, d3, d5
    // 0x3c97f4: fmul            d3, d6, d4
    // 0x3c97f8: fdiv            d4, d3, d1
    // 0x3c97fc: stur            d4, [fp, #-0x18]
    // 0x3c9800: fcmp            d2, d0
    // 0x3c9804: b.le            #0x3c9810
    // 0x3c9808: ArrayLoad: d0 = r5[0]  ; List_8
    //     0x3c9808: ldur            d0, [x5, #0x17]
    // 0x3c980c: b               #0x3c9814
    // 0x3c9810: LoadField: d0 = r5->field_7
    //     0x3c9810: ldur            d0, [x5, #7]
    // 0x3c9814: LoadField: r3 = r2->field_7
    //     0x3c9814: ldur            w3, [x2, #7]
    // 0x3c9818: DecompressPointer r3
    //     0x3c9818: add             x3, x3, HEAP, lsl #32
    // 0x3c981c: LoadField: r0 = r3->field_13
    //     0x3c981c: ldur            w0, [x3, #0x13]
    // 0x3c9820: r1 = LoadInt32Instr(r0)
    //     0x3c9820: sbfx            x1, x0, #1, #0x1f
    // 0x3c9824: mov             x0, x1
    // 0x3c9828: r1 = 0
    //     0x3c9828: mov             x1, #0
    // 0x3c982c: cmp             x1, x0
    // 0x3c9830: b.hs            #0x3c9890
    // 0x3c9834: ArrayLoad: d1 = r3[0]  ; List_8
    //     0x3c9834: ldur            s1, [x3, #0x17]
    // 0x3c9838: fcvt            d2, s1
    // 0x3c983c: fsub            d1, d0, d2
    // 0x3c9840: stur            d1, [fp, #-0x10]
    // 0x3c9844: r0 = Vector2()
    //     0x3c9844: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3c9848: r4 = 4
    //     0x3c9848: mov             x4, #4
    // 0x3c984c: stur            x0, [fp, #-8]
    // 0x3c9850: r0 = AllocateFloat32Array()
    //     0x3c9850: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3c9854: mov             x1, x0
    // 0x3c9858: ldur            x0, [fp, #-8]
    // 0x3c985c: StoreField: r0->field_7 = r1
    //     0x3c985c: stur            w1, [x0, #7]
    // 0x3c9860: ldur            d0, [fp, #-0x18]
    // 0x3c9864: fcvt            s1, d0
    // 0x3c9868: StoreField: r1->field_1b = d1
    //     0x3c9868: stur            s1, [x1, #0x1b]
    // 0x3c986c: ldur            d0, [fp, #-0x10]
    // 0x3c9870: fcvt            s1, d0
    // 0x3c9874: ArrayStore: r1[0] = d1  ; List_8
    //     0x3c9874: stur            s1, [x1, #0x17]
    // 0x3c9878: LeaveFrame
    //     0x3c9878: mov             SP, fp
    //     0x3c987c: ldp             fp, lr, [SP], #0x10
    // 0x3c9880: ret
    //     0x3c9880: ret             
    // 0x3c9884: r0 = RangeErrorSharedWithFPURegs()
    //     0x3c9884: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x3c9888: r0 = RangeErrorSharedWithFPURegs()
    //     0x3c9888: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x3c988c: r0 = RangeErrorSharedWithFPURegs()
    //     0x3c988c: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x3c9890: r0 = RangeErrorSharedWithFPURegs()
    //     0x3c9890: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
}

// class id: 1911, size: 0x5c, field offset: 0x4c
class AimGuide extends _MixinApplication264&PositionComponent&HasGameReference {

  _ aim(/* No info */) {
    // ** addr: 0x3767c4, size: 0x310
    // 0x3767c4: EnterFrame
    //     0x3767c4: stp             fp, lr, [SP, #-0x10]!
    //     0x3767c8: mov             fp, SP
    // 0x3767cc: AllocStack(0x30)
    //     0x3767cc: sub             SP, SP, #0x30
    // 0x3767d0: SetupParameters(AimGuide this /* r1 => r0, fp-0x8 */)
    //     0x3767d0: mov             x0, x1
    //     0x3767d4: stur            x1, [fp, #-8]
    // 0x3767d8: CheckStackOverflow
    //     0x3767d8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3767dc: cmp             SP, x16
    //     0x3767e0: b.ls            #0x376abc
    // 0x3767e4: LoadField: r1 = r0->field_37
    //     0x3767e4: ldur            w1, [x0, #0x37]
    // 0x3767e8: DecompressPointer r1
    //     0x3767e8: add             x1, x1, HEAP, lsl #32
    // 0x3767ec: LoadField: r3 = r1->field_37
    //     0x3767ec: ldur            w3, [x1, #0x37]
    // 0x3767f0: DecompressPointer r3
    //     0x3767f0: add             x3, x3, HEAP, lsl #32
    // 0x3767f4: mov             x1, x3
    // 0x3767f8: r0 = -()
    //     0x3767f8: bl              #0x28bf34  ; [package:vector_math/vector_math.dart] Vector2::-
    // 0x3767fc: mov             x1, x0
    // 0x376800: stur            x0, [fp, #-0x10]
    // 0x376804: r0 = length()
    //     0x376804: bl              #0x376ae0  ; [package:vector_math/vector_math.dart] Vector2::length
    // 0x376808: ldur            x0, [fp, #-0x10]
    // 0x37680c: stur            d0, [fp, #-0x30]
    // 0x376810: LoadField: r2 = r0->field_7
    //     0x376810: ldur            w2, [x0, #7]
    // 0x376814: DecompressPointer r2
    //     0x376814: add             x2, x2, HEAP, lsl #32
    // 0x376818: stur            x2, [fp, #-0x18]
    // 0x37681c: LoadField: r0 = r2->field_13
    //     0x37681c: ldur            w0, [x2, #0x13]
    // 0x376820: r1 = LoadInt32Instr(r0)
    //     0x376820: sbfx            x1, x0, #1, #0x1f
    // 0x376824: mov             x0, x1
    // 0x376828: r1 = 1
    //     0x376828: mov             x1, #1
    // 0x37682c: cmp             x1, x0
    // 0x376830: b.hs            #0x376ac4
    // 0x376834: LoadField: d1 = r2->field_1b
    //     0x376834: ldur            s1, [x2, #0x1b]
    // 0x376838: fcvt            d2, s1
    // 0x37683c: stur            d2, [fp, #-0x28]
    // 0x376840: d1 = 0.000000
    //     0x376840: eor             v1.16b, v1.16b, v1.16b
    // 0x376844: fcmp            d1, d2
    // 0x376848: r16 = true
    //     0x376848: add             x16, NULL, #0x20  ; true
    // 0x37684c: r17 = false
    //     0x37684c: add             x17, NULL, #0x30  ; false
    // 0x376850: csel            x0, x16, x17, gt
    // 0x376854: ldur            x1, [fp, #-8]
    // 0x376858: stur            x0, [fp, #-0x10]
    // 0x37685c: LoadField: r3 = r1->field_4b
    //     0x37685c: ldur            w3, [x1, #0x4b]
    // 0x376860: DecompressPointer r3
    //     0x376860: add             x3, x3, HEAP, lsl #32
    // 0x376864: cmp             w3, NULL
    // 0x376868: b.ne            #0x3768d0
    // 0x37686c: r0 = Vector2()
    //     0x37686c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x376870: r4 = 4
    //     0x376870: mov             x4, #4
    // 0x376874: stur            x0, [fp, #-0x20]
    // 0x376878: r0 = AllocateFloat32Array()
    //     0x376878: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x37687c: mov             x1, x0
    // 0x376880: ldur            x0, [fp, #-0x20]
    // 0x376884: StoreField: r0->field_7 = r1
    //     0x376884: stur            w1, [x0, #7]
    // 0x376888: r0 = AimDetails()
    //     0x376888: bl              #0x376ad4  ; AllocateAimDetailsStub -> AimDetails (size=0x18)
    // 0x37688c: mov             x1, x0
    // 0x376890: ldur            x2, [fp, #-0x20]
    // 0x376894: StoreField: r1->field_7 = r2
    //     0x376894: stur            w2, [x1, #7]
    // 0x376898: StoreField: r1->field_b = rZR
    //     0x376898: stur            xzr, [x1, #0xb]
    // 0x37689c: ldur            x2, [fp, #-0x10]
    // 0x3768a0: StoreField: r1->field_13 = r2
    //     0x3768a0: stur            w2, [x1, #0x13]
    // 0x3768a4: mov             x0, x1
    // 0x3768a8: ldur            x4, [fp, #-8]
    // 0x3768ac: StoreField: r4->field_4b = r0
    //     0x3768ac: stur            w0, [x4, #0x4b]
    //     0x3768b0: ldurb           w16, [x4, #-1]
    //     0x3768b4: ldurb           w17, [x0, #-1]
    //     0x3768b8: and             x16, x17, x16, lsr #2
    //     0x3768bc: tst             x16, HEAP, lsr #32
    //     0x3768c0: b.eq            #0x3768c8
    //     0x3768c4: bl              #0x582ca4  ; WriteBarrierWrappersStub
    // 0x3768c8: mov             x4, x1
    // 0x3768cc: b               #0x376928
    // 0x3768d0: mov             x2, x0
    // 0x3768d4: LoadField: r4 = r3->field_13
    //     0x3768d4: ldur            w4, [x3, #0x13]
    // 0x3768d8: DecompressPointer r4
    //     0x3768d8: add             x4, x4, HEAP, lsl #32
    // 0x3768dc: cmp             w4, w2
    // 0x3768e0: b.eq            #0x376920
    // 0x3768e4: LoadField: r4 = r3->field_7
    //     0x3768e4: ldur            w4, [x3, #7]
    // 0x3768e8: DecompressPointer r4
    //     0x3768e8: add             x4, x4, HEAP, lsl #32
    // 0x3768ec: LoadField: r5 = r4->field_7
    //     0x3768ec: ldur            w5, [x4, #7]
    // 0x3768f0: DecompressPointer r5
    //     0x3768f0: add             x5, x5, HEAP, lsl #32
    // 0x3768f4: LoadField: r4 = r5->field_13
    //     0x3768f4: ldur            w4, [x5, #0x13]
    // 0x3768f8: r0 = LoadInt32Instr(r4)
    //     0x3768f8: sbfx            x0, x4, #1, #0x1f
    // 0x3768fc: r1 = 1
    //     0x3768fc: mov             x1, #1
    // 0x376900: cmp             x1, x0
    // 0x376904: b.hs            #0x376ac8
    // 0x376908: StoreField: r5->field_1b = rZR
    //     0x376908: stur            wzr, [x5, #0x1b]
    // 0x37690c: ArrayStore: r5[0] = rZR  ; List_4
    //     0x37690c: stur            wzr, [x5, #0x17]
    // 0x376910: r0 = Null
    //     0x376910: mov             x0, NULL
    // 0x376914: LeaveFrame
    //     0x376914: mov             SP, fp
    //     0x376918: ldp             fp, lr, [SP], #0x10
    // 0x37691c: ret
    //     0x37691c: ret             
    // 0x376920: StoreField: r3->field_13 = r2
    //     0x376920: stur            w2, [x3, #0x13]
    // 0x376924: mov             x4, x3
    // 0x376928: ldur            d0, [fp, #-0x30]
    // 0x37692c: ldur            x3, [fp, #-0x18]
    // 0x376930: d1 = 0.000000
    //     0x376930: eor             v1.16b, v1.16b, v1.16b
    // 0x376934: ArrayLoad: d2 = r3[0]  ; List_8
    //     0x376934: ldur            s2, [x3, #0x17]
    // 0x376938: fcvt            d3, s2
    // 0x37693c: fdiv            d2, d3, d0
    // 0x376940: fcmp            d2, d1
    // 0x376944: b.ne            #0x376950
    // 0x376948: d4 = 0.000000
    //     0x376948: eor             v4.16b, v4.16b, v4.16b
    // 0x37694c: b               #0x376964
    // 0x376950: fcmp            d1, d2
    // 0x376954: b.le            #0x376960
    // 0x376958: fneg            d4, d2
    // 0x37695c: mov             v2.16b, v4.16b
    // 0x376960: mov             v4.16b, v2.16b
    // 0x376964: d2 = 0.999000
    //     0x376964: add             x17, PP, #0xd, lsl #12  ; [pp+0xd368] IMM: double(0.999) from 0x3feff7ced916872b
    //     0x376968: ldr             d2, [x17, #0x368]
    // 0x37696c: fcmp            d4, d2
    // 0x376970: b.le            #0x3769e8
    // 0x376974: fmul            d4, d0, d2
    // 0x376978: fcmp            d3, d1
    // 0x37697c: b.le            #0x376988
    // 0x376980: d5 = 1.000000
    //     0x376980: fmov            d5, #1.00000000
    // 0x376984: b               #0x37699c
    // 0x376988: fcmp            d1, d3
    // 0x37698c: b.le            #0x376998
    // 0x376990: d5 = -1.000000
    //     0x376990: fmov            d5, #-1.00000000
    // 0x376994: b               #0x37699c
    // 0x376998: mov             v5.16b, v3.16b
    // 0x37699c: ldur            d2, [fp, #-0x28]
    // 0x3769a0: d3 = 0.044710
    //     0x3769a0: add             x17, PP, #0xd, lsl #12  ; [pp+0xd370] IMM: double(0.04471017781221601) from 0x3fa6e4409f00ed95
    //     0x3769a4: ldr             d3, [x17, #0x370]
    // 0x3769a8: fmul            d6, d4, d5
    // 0x3769ac: fcvt            s4, d6
    // 0x3769b0: ArrayStore: r3[0] = d4  ; List_8
    //     0x3769b0: stur            s4, [x3, #0x17]
    // 0x3769b4: fmul            d4, d0, d3
    // 0x3769b8: fcmp            d2, d1
    // 0x3769bc: b.le            #0x3769c8
    // 0x3769c0: d1 = 1.000000
    //     0x3769c0: fmov            d1, #1.00000000
    // 0x3769c4: b               #0x3769dc
    // 0x3769c8: fcmp            d1, d2
    // 0x3769cc: b.le            #0x3769d8
    // 0x3769d0: d1 = -1.000000
    //     0x3769d0: fmov            d1, #-1.00000000
    // 0x3769d4: b               #0x3769dc
    // 0x3769d8: mov             v1.16b, v2.16b
    // 0x3769dc: fmul            d2, d4, d1
    // 0x3769e0: fcvt            s1, d2
    // 0x3769e4: StoreField: r3->field_1b = d1
    //     0x3769e4: stur            s1, [x3, #0x1b]
    // 0x3769e8: tbz             w2, #4, #0x376a14
    // 0x3769ec: ArrayLoad: d1 = r3[0]  ; List_8
    //     0x3769ec: ldur            s1, [x3, #0x17]
    // 0x3769f0: fcvt            d2, s1
    // 0x3769f4: fneg            d1, d2
    // 0x3769f8: fcvt            s2, d1
    // 0x3769fc: ArrayStore: r3[0] = d2  ; List_8
    //     0x3769fc: stur            s2, [x3, #0x17]
    // 0x376a00: LoadField: d1 = r3->field_1b
    //     0x376a00: ldur            s1, [x3, #0x1b]
    // 0x376a04: fcvt            d2, s1
    // 0x376a08: fneg            d1, d2
    // 0x376a0c: fcvt            s2, d1
    // 0x376a10: StoreField: r3->field_1b = d2
    //     0x376a10: stur            s2, [x3, #0x1b]
    // 0x376a14: d3 = 20.000000
    //     0x376a14: fmov            d3, #20.00000000
    // 0x376a18: d2 = 1.000000
    //     0x376a18: fmov            d2, #1.00000000
    // 0x376a1c: d1 = 10.000000
    //     0x376a1c: fmov            d1, #10.00000000
    // 0x376a20: tst             x2, #0x10
    // 0x376a24: csetm           x5, eq
    // 0x376a28: and             x5, x5, #8
    // 0x376a2c: add             x5, x5, #8
    // 0x376a30: fdiv            d4, d0, d1
    // 0x376a34: fdiv            d1, d4, d3
    // 0x376a38: r16 = LoadInt32Instr(r5)
    //     0x376a38: sbfx            x16, x5, #1, #0x1f
    // 0x376a3c: scvtf           d3, w16
    // 0x376a40: fmul            d4, d1, d3
    // 0x376a44: fmin            v1.2d, v2.2d, v4.2d
    // 0x376a48: StoreField: r4->field_b = d1
    //     0x376a48: stur            d1, [x4, #0xb]
    // 0x376a4c: LoadField: r2 = r4->field_7
    //     0x376a4c: ldur            w2, [x4, #7]
    // 0x376a50: DecompressPointer r2
    //     0x376a50: add             x2, x2, HEAP, lsl #32
    // 0x376a54: ArrayLoad: d1 = r3[0]  ; List_8
    //     0x376a54: ldur            s1, [x3, #0x17]
    // 0x376a58: fcvt            d2, s1
    // 0x376a5c: fdiv            d1, d2, d0
    // 0x376a60: LoadField: r4 = r2->field_7
    //     0x376a60: ldur            w4, [x2, #7]
    // 0x376a64: DecompressPointer r4
    //     0x376a64: add             x4, x4, HEAP, lsl #32
    // 0x376a68: LoadField: r2 = r4->field_13
    //     0x376a68: ldur            w2, [x4, #0x13]
    // 0x376a6c: r5 = LoadInt32Instr(r2)
    //     0x376a6c: sbfx            x5, x2, #1, #0x1f
    // 0x376a70: mov             x0, x5
    // 0x376a74: r1 = 0
    //     0x376a74: mov             x1, #0
    // 0x376a78: cmp             x1, x0
    // 0x376a7c: b.hs            #0x376acc
    // 0x376a80: fcvt            s2, d1
    // 0x376a84: ArrayStore: r4[0] = d2  ; List_8
    //     0x376a84: stur            s2, [x4, #0x17]
    // 0x376a88: LoadField: d1 = r3->field_1b
    //     0x376a88: ldur            s1, [x3, #0x1b]
    // 0x376a8c: fcvt            d2, s1
    // 0x376a90: fdiv            d1, d2, d0
    // 0x376a94: mov             x0, x5
    // 0x376a98: r1 = 1
    //     0x376a98: mov             x1, #1
    // 0x376a9c: cmp             x1, x0
    // 0x376aa0: b.hs            #0x376ad0
    // 0x376aa4: fcvt            s0, d1
    // 0x376aa8: StoreField: r4->field_1b = d0
    //     0x376aa8: stur            s0, [x4, #0x1b]
    // 0x376aac: r0 = Null
    //     0x376aac: mov             x0, NULL
    // 0x376ab0: LeaveFrame
    //     0x376ab0: mov             SP, fp
    //     0x376ab4: ldp             fp, lr, [SP], #0x10
    // 0x376ab8: ret
    //     0x376ab8: ret             
    // 0x376abc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x376abc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x376ac0: b               #0x3767e4
    // 0x376ac4: r0 = RangeErrorSharedWithFPURegs()
    //     0x376ac4: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x376ac8: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x376ac8: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x376acc: r0 = RangeErrorSharedWithFPURegs()
    //     0x376acc: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x376ad0: r0 = RangeErrorSharedWithFPURegs()
    //     0x376ad0: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  _ finishAim(/* No info */) {
    // ** addr: 0x386110, size: 0x80
    // 0x386110: EnterFrame
    //     0x386110: stp             fp, lr, [SP, #-0x10]!
    //     0x386114: mov             fp, SP
    // 0x386118: AllocStack(0x8)
    //     0x386118: sub             SP, SP, #8
    // 0x38611c: CheckStackOverflow
    //     0x38611c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x386120: cmp             SP, x16
    //     0x386124: b.ls            #0x386188
    // 0x386128: LoadField: r0 = r1->field_4b
    //     0x386128: ldur            w0, [x1, #0x4b]
    // 0x38612c: DecompressPointer r0
    //     0x38612c: add             x0, x0, HEAP, lsl #32
    // 0x386130: cmp             w0, NULL
    // 0x386134: b.ne            #0x386140
    // 0x386138: r0 = Null
    //     0x386138: mov             x0, NULL
    // 0x38613c: b               #0x38614c
    // 0x386140: LoadField: r2 = r0->field_7
    //     0x386140: ldur            w2, [x0, #7]
    // 0x386144: DecompressPointer r2
    //     0x386144: add             x2, x2, HEAP, lsl #32
    // 0x386148: mov             x0, x2
    // 0x38614c: stur            x0, [fp, #-8]
    // 0x386150: StoreField: r1->field_4b = rNULL
    //     0x386150: stur            NULL, [x1, #0x4b]
    // 0x386154: cmp             w0, NULL
    // 0x386158: b.eq            #0x386168
    // 0x38615c: mov             x1, x0
    // 0x386160: r0 = Vector2Extension.isZero()
    //     0x386160: bl              #0x384be8  ; [package:flame/src/extensions/vector2.dart] ::Vector2Extension.isZero
    // 0x386164: tbnz            w0, #4, #0x386178
    // 0x386168: r0 = Null
    //     0x386168: mov             x0, NULL
    // 0x38616c: LeaveFrame
    //     0x38616c: mov             SP, fp
    //     0x386170: ldp             fp, lr, [SP], #0x10
    // 0x386174: ret
    //     0x386174: ret             
    // 0x386178: ldur            x0, [fp, #-8]
    // 0x38617c: LeaveFrame
    //     0x38617c: mov             SP, fp
    //     0x386180: ldp             fp, lr, [SP], #0x10
    // 0x386184: ret
    //     0x386184: ret             
    // 0x386188: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x386188: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x38618c: b               #0x386128
  }
  _ render(/* No info */) {
    // ** addr: 0x3c8628, size: 0x62c
    // 0x3c8628: EnterFrame
    //     0x3c8628: stp             fp, lr, [SP, #-0x10]!
    //     0x3c862c: mov             fp, SP
    // 0x3c8630: AllocStack(0x68)
    //     0x3c8630: sub             SP, SP, #0x68
    // 0x3c8634: SetupParameters(AimGuide this /* r1 => r2, fp-0x18 */, dynamic _ /* r2 => r0, fp-0x20 */)
    //     0x3c8634: mov             x0, x2
    //     0x3c8638: stur            x2, [fp, #-0x20]
    //     0x3c863c: mov             x2, x1
    //     0x3c8640: stur            x1, [fp, #-0x18]
    // 0x3c8644: CheckStackOverflow
    //     0x3c8644: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c8648: cmp             SP, x16
    //     0x3c864c: b.ls            #0x3c8bc4
    // 0x3c8650: LoadField: r3 = r2->field_4b
    //     0x3c8650: ldur            w3, [x2, #0x4b]
    // 0x3c8654: DecompressPointer r3
    //     0x3c8654: add             x3, x3, HEAP, lsl #32
    // 0x3c8658: stur            x3, [fp, #-0x10]
    // 0x3c865c: cmp             w3, NULL
    // 0x3c8660: b.eq            #0x3c867c
    // 0x3c8664: LoadField: r4 = r3->field_7
    //     0x3c8664: ldur            w4, [x3, #7]
    // 0x3c8668: DecompressPointer r4
    //     0x3c8668: add             x4, x4, HEAP, lsl #32
    // 0x3c866c: mov             x1, x4
    // 0x3c8670: stur            x4, [fp, #-8]
    // 0x3c8674: r0 = Vector2Extension.isZero()
    //     0x3c8674: bl              #0x384be8  ; [package:flame/src/extensions/vector2.dart] ::Vector2Extension.isZero
    // 0x3c8678: tbnz            w0, #4, #0x3c868c
    // 0x3c867c: r0 = Null
    //     0x3c867c: mov             x0, NULL
    // 0x3c8680: LeaveFrame
    //     0x3c8680: mov             SP, fp
    //     0x3c8684: ldp             fp, lr, [SP], #0x10
    // 0x3c8688: ret
    //     0x3c8688: ret             
    // 0x3c868c: ldur            x0, [fp, #-0x18]
    // 0x3c8690: ldur            x3, [fp, #-0x10]
    // 0x3c8694: LoadField: r1 = r0->field_37
    //     0x3c8694: ldur            w1, [x0, #0x37]
    // 0x3c8698: DecompressPointer r1
    //     0x3c8698: add             x1, x1, HEAP, lsl #32
    // 0x3c869c: LoadField: r2 = r1->field_37
    //     0x3c869c: ldur            w2, [x1, #0x37]
    // 0x3c86a0: DecompressPointer r2
    //     0x3c86a0: add             x2, x2, HEAP, lsl #32
    // 0x3c86a4: mov             x1, x3
    // 0x3c86a8: r0 = reflectionPoint()
    //     0x3c86a8: bl              #0x3c96e0  ; [package:ricochlime/flame/components/aim_guide.dart] AimDetails::reflectionPoint
    // 0x3c86ac: mov             x1, x0
    // 0x3c86b0: stur            x0, [fp, #-0x28]
    // 0x3c86b4: r0 = length()
    //     0x3c86b4: bl              #0x376ae0  ; [package:vector_math/vector_math.dart] Vector2::length
    // 0x3c86b8: ldur            x0, [fp, #-0x10]
    // 0x3c86bc: stur            d0, [fp, #-0x50]
    // 0x3c86c0: LoadField: d1 = r0->field_b
    //     0x3c86c0: ldur            d1, [x0, #0xb]
    // 0x3c86c4: d2 = 20.000000
    //     0x3c86c4: fmov            d2, #20.00000000
    // 0x3c86c8: fmul            d3, d1, d2
    // 0x3c86cc: fcmp            d3, d3
    // 0x3c86d0: b.vs            #0x3c8bcc
    // 0x3c86d4: fcvtps          x0, d3
    // 0x3c86d8: asr             x16, x0, #0x1e
    // 0x3c86dc: cmp             x16, x0, asr #63
    // 0x3c86e0: b.ne            #0x3c8bcc
    // 0x3c86e4: lsl             x0, x0, #1
    // 0x3c86e8: d1 = 10.000000
    //     0x3c86e8: fmov            d1, #10.00000000
    // 0x3c86ec: fdiv            d2, d0, d1
    // 0x3c86f0: r2 = LoadInt32Instr(r0)
    //     0x3c86f0: sbfx            x2, x0, #1, #0x1f
    //     0x3c86f4: tbz             w0, #0, #0x3c86fc
    //     0x3c86f8: ldur            x2, [x0, #7]
    // 0x3c86fc: stur            x2, [fp, #-0x30]
    // 0x3c8700: scvtf           d1, x2
    // 0x3c8704: fcmp            d1, d2
    // 0x3c8708: b.le            #0x3c8740
    // 0x3c870c: r0 = inline_Allocate_Double()
    //     0x3c870c: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x3c8710: add             x0, x0, #0x10
    //     0x3c8714: cmp             x1, x0
    //     0x3c8718: b.ls            #0x3c8bec
    //     0x3c871c: str             x0, [THR, #0x60]  ; THR::top
    //     0x3c8720: sub             x0, x0, #0xf
    //     0x3c8724: mov             x1, #0xe19c
    //     0x3c8728: movk            x1, #3, lsl #16
    //     0x3c872c: stur            x1, [x0, #-1]
    // 0x3c8730: dmb             ishst
    // 0x3c8734: StoreField: r0->field_7 = d2
    //     0x3c8734: stur            d2, [x0, #7]
    // 0x3c8738: mov             x4, x0
    // 0x3c873c: b               #0x3c8810
    // 0x3c8740: fcmp            d2, d1
    // 0x3c8744: b.le            #0x3c8750
    // 0x3c8748: mov             x4, x0
    // 0x3c874c: b               #0x3c8810
    // 0x3c8750: r1 = 60
    //     0x3c8750: mov             x1, #0x3c
    // 0x3c8754: branchIfSmi(r0, 0x3c8760)
    //     0x3c8754: tbz             w0, #0, #0x3c8760
    // 0x3c8758: r1 = LoadClassIdInstr(r0)
    //     0x3c8758: ldur            x1, [x0, #-1]
    //     0x3c875c: ubfx            x1, x1, #0xc, #0x14
    // 0x3c8760: cmp             x1, #0x3e
    // 0x3c8764: b.ne            #0x3c87b4
    // 0x3c8768: d3 = 0.000000
    //     0x3c8768: eor             v3.16b, v3.16b, v3.16b
    // 0x3c876c: fcmp            d1, d3
    // 0x3c8770: b.ne            #0x3c87b4
    // 0x3c8774: fadd            d3, d1, d2
    // 0x3c8778: fmul            d4, d3, d1
    // 0x3c877c: fmul            d1, d4, d2
    // 0x3c8780: r0 = inline_Allocate_Double()
    //     0x3c8780: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x3c8784: add             x0, x0, #0x10
    //     0x3c8788: cmp             x1, x0
    //     0x3c878c: b.ls            #0x3c8c04
    //     0x3c8790: str             x0, [THR, #0x60]  ; THR::top
    //     0x3c8794: sub             x0, x0, #0xf
    //     0x3c8798: mov             x1, #0xe19c
    //     0x3c879c: movk            x1, #3, lsl #16
    //     0x3c87a0: stur            x1, [x0, #-1]
    // 0x3c87a4: dmb             ishst
    // 0x3c87a8: StoreField: r0->field_7 = d1
    //     0x3c87a8: stur            d1, [x0, #7]
    // 0x3c87ac: mov             x4, x0
    // 0x3c87b0: b               #0x3c8810
    // 0x3c87b4: cbnz            x2, #0x3c87d0
    // 0x3c87b8: fcmp            d2, #0.0
    // 0x3c87bc: b.vs            #0x3c87d0
    // 0x3c87c0: b.ne            #0x3c87cc
    // 0x3c87c4: r1 = 0.000000
    //     0x3c87c4: fmov            x1, d2
    // 0x3c87c8: cmp             x1, #0
    // 0x3c87cc: b.lt            #0x3c87d8
    // 0x3c87d0: fcmp            d2, d2
    // 0x3c87d4: b.vc            #0x3c880c
    // 0x3c87d8: r0 = inline_Allocate_Double()
    //     0x3c87d8: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x3c87dc: add             x0, x0, #0x10
    //     0x3c87e0: cmp             x1, x0
    //     0x3c87e4: b.ls            #0x3c8c1c
    //     0x3c87e8: str             x0, [THR, #0x60]  ; THR::top
    //     0x3c87ec: sub             x0, x0, #0xf
    //     0x3c87f0: mov             x1, #0xe19c
    //     0x3c87f4: movk            x1, #3, lsl #16
    //     0x3c87f8: stur            x1, [x0, #-1]
    // 0x3c87fc: dmb             ishst
    // 0x3c8800: StoreField: r0->field_7 = d2
    //     0x3c8800: stur            d2, [x0, #7]
    // 0x3c8804: mov             x4, x0
    // 0x3c8808: b               #0x3c8810
    // 0x3c880c: mov             x4, x0
    // 0x3c8810: ldur            x3, [fp, #-0x18]
    // 0x3c8814: stur            x4, [fp, #-0x10]
    // 0x3c8818: LoadField: r5 = r3->field_53
    //     0x3c8818: ldur            x5, [x3, #0x53]
    // 0x3c881c: r0 = BoxInt64Instr(r5)
    //     0x3c881c: sbfiz           x0, x5, #1, #0x1f
    //     0x3c8820: cmp             x5, x0, asr #1
    //     0x3c8824: b.eq            #0x3c8830
    //     0x3c8828: bl              #0x58491c  ; AllocateMintSharedWithFPURegsStub
    //     0x3c882c: stur            x5, [x0, #7]
    // 0x3c8830: r1 = 60
    //     0x3c8830: mov             x1, #0x3c
    // 0x3c8834: branchIfSmi(r4, 0x3c8840)
    //     0x3c8834: tbz             w4, #0, #0x3c8840
    // 0x3c8838: r1 = LoadClassIdInstr(r4)
    //     0x3c8838: ldur            x1, [x4, #-1]
    //     0x3c883c: ubfx            x1, x1, #0xc, #0x14
    // 0x3c8840: stp             x0, x4, [SP]
    // 0x3c8844: mov             x0, x1
    // 0x3c8848: r0 = GDT[cid_x0 + -0xfcd]()
    //     0x3c8848: sub             lr, x0, #0xfcd
    //     0x3c884c: ldr             lr, [x21, lr, lsl #3]
    //     0x3c8850: blr             lr
    // 0x3c8854: r1 = 60
    //     0x3c8854: mov             x1, #0x3c
    // 0x3c8858: branchIfSmi(r0, 0x3c8864)
    //     0x3c8858: tbz             w0, #0, #0x3c8864
    // 0x3c885c: r1 = LoadClassIdInstr(r0)
    //     0x3c885c: ldur            x1, [x0, #-1]
    //     0x3c8860: ubfx            x1, x1, #0xc, #0x14
    // 0x3c8864: mov             x16, x0
    // 0x3c8868: mov             x0, x1
    // 0x3c886c: mov             x1, x16
    // 0x3c8870: r0 = GDT[cid_x0 + -0xdf3]()
    //     0x3c8870: sub             lr, x0, #0xdf3
    //     0x3c8874: ldr             lr, [x21, lr, lsl #3]
    //     0x3c8878: blr             lr
    // 0x3c887c: r1 = 60
    //     0x3c887c: mov             x1, #0x3c
    // 0x3c8880: branchIfSmi(r0, 0x3c888c)
    //     0x3c8880: tbz             w0, #0, #0x3c888c
    // 0x3c8884: r1 = LoadClassIdInstr(r0)
    //     0x3c8884: ldur            x1, [x0, #-1]
    //     0x3c8888: ubfx            x1, x1, #0xc, #0x14
    // 0x3c888c: r16 = 0.500000
    //     0x3c888c: add             x16, PP, #9, lsl #12  ; [pp+0x91e8] 0.5
    //     0x3c8890: ldr             x16, [x16, #0x1e8]
    // 0x3c8894: stp             x16, x0, [SP]
    // 0x3c8898: mov             x0, x1
    // 0x3c889c: r0 = GDT[cid_x0 + -0xfec]()
    //     0x3c889c: sub             lr, x0, #0xfec
    //     0x3c88a0: ldr             lr, [x21, lr, lsl #3]
    //     0x3c88a4: blr             lr
    // 0x3c88a8: tbnz            w0, #4, #0x3c88bc
    // 0x3c88ac: ldur            x1, [fp, #-0x18]
    // 0x3c88b0: LoadField: r0 = r1->field_53
    //     0x3c88b0: ldur            x0, [x1, #0x53]
    // 0x3c88b4: mov             x1, x0
    // 0x3c88b8: b               #0x3c88fc
    // 0x3c88bc: ldur            x1, [fp, #-0x18]
    // 0x3c88c0: ldur            x0, [fp, #-0x10]
    // 0x3c88c4: r2 = 60
    //     0x3c88c4: mov             x2, #0x3c
    // 0x3c88c8: branchIfSmi(r0, 0x3c88d4)
    //     0x3c88c8: tbz             w0, #0, #0x3c88d4
    // 0x3c88cc: r2 = LoadClassIdInstr(r0)
    //     0x3c88cc: ldur            x2, [x0, #-1]
    //     0x3c88d0: ubfx            x2, x2, #0xc, #0x14
    // 0x3c88d4: str             x0, [SP]
    // 0x3c88d8: mov             x0, x2
    // 0x3c88dc: r0 = GDT[cid_x0 + -0xf84]()
    //     0x3c88dc: sub             lr, x0, #0xf84
    //     0x3c88e0: ldr             lr, [x21, lr, lsl #3]
    //     0x3c88e4: blr             lr
    // 0x3c88e8: r1 = LoadInt32Instr(r0)
    //     0x3c88e8: sbfx            x1, x0, #1, #0x1f
    //     0x3c88ec: tbz             w0, #0, #0x3c88f4
    //     0x3c88f0: ldur            x1, [x0, #7]
    // 0x3c88f4: ldur            x0, [fp, #-0x18]
    // 0x3c88f8: StoreField: r0->field_53 = r1
    //     0x3c88f8: stur            x1, [x0, #0x53]
    // 0x3c88fc: ldur            x0, [fp, #-0x30]
    // 0x3c8900: stur            x1, [fp, #-0x40]
    // 0x3c8904: sub             x2, x0, x1
    // 0x3c8908: stur            x2, [fp, #-0x38]
    // 0x3c890c: r0 = LoadStaticField(0xccc)
    //     0x3c890c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c8910: ldr             x0, [x0, #0x1998]
    // 0x3c8914: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8918: cmp             w0, w16
    // 0x3c891c: b.ne            #0x3c892c
    // 0x3c8920: r2 = stows
    //     0x3c8920: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3c8924: ldr             x2, [x2, #0x310]
    // 0x3c8928: r0 = InitLateFinalStaticField()
    //     0x3c8928: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c892c: LoadField: r1 = r0->field_27
    //     0x3c892c: ldur            w1, [x0, #0x27]
    // 0x3c8930: DecompressPointer r1
    //     0x3c8930: add             x1, x1, HEAP, lsl #32
    // 0x3c8934: LoadField: r0 = r1->field_43
    //     0x3c8934: ldur            w0, [x1, #0x43]
    // 0x3c8938: DecompressPointer r0
    //     0x3c8938: add             x0, x0, HEAP, lsl #32
    // 0x3c893c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c8940: cmp             w0, w16
    // 0x3c8944: b.ne            #0x3c8954
    // 0x3c8948: r2 = _value
    //     0x3c8948: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3c894c: ldr             x2, [x2, #0x4b0]
    // 0x3c8950: r0 = InitLateInstanceField()
    //     0x3c8950: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3c8954: tbnz            w0, #4, #0x3c8960
    // 0x3c8958: ldur            x3, [fp, #-0x30]
    // 0x3c895c: b               #0x3c8964
    // 0x3c8960: r3 = 1
    //     0x3c8960: mov             x3, #1
    // 0x3c8964: ldur            x2, [fp, #-0x40]
    // 0x3c8968: ldur            x1, [fp, #-0x38]
    // 0x3c896c: ldur            x0, [fp, #-0x30]
    // 0x3c8970: cmp             x1, x3
    // 0x3c8974: csel            x4, x3, x1, gt
    // 0x3c8978: stur            x4, [fp, #-0x48]
    // 0x3c897c: cmp             x2, x0
    // 0x3c8980: b.lt            #0x3c898c
    // 0x3c8984: d0 = 10.000000
    //     0x3c8984: fmov            d0, #10.00000000
    // 0x3c8988: b               #0x3c899c
    // 0x3c898c: ldur            d0, [fp, #-0x50]
    // 0x3c8990: scvtf           d1, x2
    // 0x3c8994: fdiv            d2, d0, d1
    // 0x3c8998: mov             v0.16b, v2.16b
    // 0x3c899c: ldur            x1, [fp, #-8]
    // 0x3c89a0: r0 = *()
    //     0x3c89a0: bl              #0x28c03c  ; [package:vector_math/vector_math.dart] Vector2::*
    // 0x3c89a4: mov             x2, x0
    // 0x3c89a8: ldur            x0, [fp, #-0x40]
    // 0x3c89ac: stur            x2, [fp, #-8]
    // 0x3c89b0: scvtf           d0, x0
    // 0x3c89b4: stur            d0, [fp, #-0x58]
    // 0x3c89b8: d1 = 0.000000
    //     0x3c89b8: eor             v1.16b, v1.16b, v1.16b
    // 0x3c89bc: stur            d1, [fp, #-0x50]
    // 0x3c89c0: CheckStackOverflow
    //     0x3c89c0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c89c4: cmp             SP, x16
    //     0x3c89c8: b.ls            #0x3c8c34
    // 0x3c89cc: fcmp            d0, d1
    // 0x3c89d0: b.le            #0x3c8a5c
    // 0x3c89d4: mov             x1, x2
    // 0x3c89d8: r0 = clone()
    //     0x3c89d8: bl              #0x28be08  ; [package:vector_math/vector_math.dart] Vector2::clone
    // 0x3c89dc: mov             x2, x0
    // 0x3c89e0: LoadField: r3 = r2->field_7
    //     0x3c89e0: ldur            w3, [x2, #7]
    // 0x3c89e4: DecompressPointer r3
    //     0x3c89e4: add             x3, x3, HEAP, lsl #32
    // 0x3c89e8: LoadField: r0 = r3->field_13
    //     0x3c89e8: ldur            w0, [x3, #0x13]
    // 0x3c89ec: r1 = LoadInt32Instr(r0)
    //     0x3c89ec: sbfx            x1, x0, #1, #0x1f
    // 0x3c89f0: mov             x0, x1
    // 0x3c89f4: r1 = 1
    //     0x3c89f4: mov             x1, #1
    // 0x3c89f8: cmp             x1, x0
    // 0x3c89fc: b.hs            #0x3c8c3c
    // 0x3c8a00: LoadField: d0 = r3->field_1b
    //     0x3c8a00: ldur            s0, [x3, #0x1b]
    // 0x3c8a04: fcvt            d1, s0
    // 0x3c8a08: ldur            d0, [fp, #-0x50]
    // 0x3c8a0c: fmul            d2, d1, d0
    // 0x3c8a10: fcvt            s1, d2
    // 0x3c8a14: StoreField: r3->field_1b = d1
    //     0x3c8a14: stur            s1, [x3, #0x1b]
    // 0x3c8a18: ArrayLoad: d1 = r3[0]  ; List_8
    //     0x3c8a18: ldur            s1, [x3, #0x17]
    // 0x3c8a1c: fcvt            d2, s1
    // 0x3c8a20: fmul            d1, d2, d0
    // 0x3c8a24: fcvt            s2, d1
    // 0x3c8a28: ArrayStore: r3[0] = d2  ; List_8
    //     0x3c8a28: stur            s2, [x3, #0x17]
    // 0x3c8a2c: r16 = 1.000000
    //     0x3c8a2c: ldr             x16, [PP, #0x78a0]  ; [pp+0x78a0] 1
    // 0x3c8a30: str             x16, [SP]
    // 0x3c8a34: ldur            x1, [fp, #-0x20]
    // 0x3c8a38: r4 = const [0, 0x3, 0x1, 0x2, opacity, 0x2, null]
    //     0x3c8a38: add             x4, PP, #0x1f, lsl #12  ; [pp+0x1fde8] List(7) [0, 0x3, 0x1, 0x2, "opacity", 0x2, Null]
    //     0x3c8a3c: ldr             x4, [x4, #0xde8]
    // 0x3c8a40: r0 = drawBullet()
    //     0x3c8a40: bl              #0x3c8c54  ; [package:ricochlime/flame/components/bullet.dart] Bullet::drawBullet
    // 0x3c8a44: ldur            d0, [fp, #-0x50]
    // 0x3c8a48: d2 = 1.000000
    //     0x3c8a48: fmov            d2, #1.00000000
    // 0x3c8a4c: fadd            d1, d0, d2
    // 0x3c8a50: ldur            x2, [fp, #-8]
    // 0x3c8a54: ldur            d0, [fp, #-0x58]
    // 0x3c8a58: b               #0x3c89bc
    // 0x3c8a5c: ldur            x3, [fp, #-0x48]
    // 0x3c8a60: d2 = 1.000000
    //     0x3c8a60: fmov            d2, #1.00000000
    // 0x3c8a64: d0 = -1.000000
    //     0x3c8a64: fmov            d0, #-1.00000000
    // 0x3c8a68: LoadField: r4 = r2->field_7
    //     0x3c8a68: ldur            w4, [x2, #7]
    // 0x3c8a6c: DecompressPointer r4
    //     0x3c8a6c: add             x4, x4, HEAP, lsl #32
    // 0x3c8a70: LoadField: r0 = r4->field_13
    //     0x3c8a70: ldur            w0, [x4, #0x13]
    // 0x3c8a74: r1 = LoadInt32Instr(r0)
    //     0x3c8a74: sbfx            x1, x0, #1, #0x1f
    // 0x3c8a78: mov             x0, x1
    // 0x3c8a7c: r1 = 0
    //     0x3c8a7c: mov             x1, #0
    // 0x3c8a80: cmp             x1, x0
    // 0x3c8a84: b.hs            #0x3c8c40
    // 0x3c8a88: ArrayLoad: d1 = r4[0]  ; List_8
    //     0x3c8a88: ldur            s1, [x4, #0x17]
    // 0x3c8a8c: fcvt            d3, s1
    // 0x3c8a90: fmul            d1, d3, d0
    // 0x3c8a94: fcvt            s0, d1
    // 0x3c8a98: ArrayStore: r4[0] = d0  ; List_8
    //     0x3c8a98: stur            s0, [x4, #0x17]
    // 0x3c8a9c: scvtf           d0, x3
    // 0x3c8aa0: stur            d0, [fp, #-0x58]
    // 0x3c8aa4: d1 = 0.000000
    //     0x3c8aa4: eor             v1.16b, v1.16b, v1.16b
    // 0x3c8aa8: stur            d1, [fp, #-0x50]
    // 0x3c8aac: CheckStackOverflow
    //     0x3c8aac: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c8ab0: cmp             SP, x16
    //     0x3c8ab4: b.ls            #0x3c8c44
    // 0x3c8ab8: fcmp            d0, d1
    // 0x3c8abc: b.le            #0x3c8bb4
    // 0x3c8ac0: mov             x1, x2
    // 0x3c8ac4: r0 = clone()
    //     0x3c8ac4: bl              #0x28be08  ; [package:vector_math/vector_math.dart] Vector2::clone
    // 0x3c8ac8: LoadField: r2 = r0->field_7
    //     0x3c8ac8: ldur            w2, [x0, #7]
    // 0x3c8acc: DecompressPointer r2
    //     0x3c8acc: add             x2, x2, HEAP, lsl #32
    // 0x3c8ad0: stur            x2, [fp, #-0x10]
    // 0x3c8ad4: LoadField: r0 = r2->field_13
    //     0x3c8ad4: ldur            w0, [x2, #0x13]
    // 0x3c8ad8: r1 = LoadInt32Instr(r0)
    //     0x3c8ad8: sbfx            x1, x0, #1, #0x1f
    // 0x3c8adc: mov             x0, x1
    // 0x3c8ae0: r1 = 1
    //     0x3c8ae0: mov             x1, #1
    // 0x3c8ae4: cmp             x1, x0
    // 0x3c8ae8: b.hs            #0x3c8c4c
    // 0x3c8aec: LoadField: d0 = r2->field_1b
    //     0x3c8aec: ldur            s0, [x2, #0x1b]
    // 0x3c8af0: fcvt            d1, s0
    // 0x3c8af4: ldur            d0, [fp, #-0x50]
    // 0x3c8af8: fmul            d2, d1, d0
    // 0x3c8afc: fcvt            s1, d2
    // 0x3c8b00: StoreField: r2->field_1b = d1
    //     0x3c8b00: stur            s1, [x2, #0x1b]
    // 0x3c8b04: ArrayLoad: d1 = r2[0]  ; List_8
    //     0x3c8b04: ldur            s1, [x2, #0x17]
    // 0x3c8b08: fcvt            d2, s1
    // 0x3c8b0c: fmul            d1, d2, d0
    // 0x3c8b10: fcvt            s2, d1
    // 0x3c8b14: ArrayStore: r2[0] = d2  ; List_8
    //     0x3c8b14: stur            s2, [x2, #0x17]
    // 0x3c8b18: ldur            x1, [fp, #-0x28]
    // 0x3c8b1c: r0 = clone()
    //     0x3c8b1c: bl              #0x28be08  ; [package:vector_math/vector_math.dart] Vector2::clone
    // 0x3c8b20: mov             x2, x0
    // 0x3c8b24: LoadField: r3 = r2->field_7
    //     0x3c8b24: ldur            w3, [x2, #7]
    // 0x3c8b28: DecompressPointer r3
    //     0x3c8b28: add             x3, x3, HEAP, lsl #32
    // 0x3c8b2c: LoadField: r0 = r3->field_13
    //     0x3c8b2c: ldur            w0, [x3, #0x13]
    // 0x3c8b30: r1 = LoadInt32Instr(r0)
    //     0x3c8b30: sbfx            x1, x0, #1, #0x1f
    // 0x3c8b34: mov             x0, x1
    // 0x3c8b38: r1 = 1
    //     0x3c8b38: mov             x1, #1
    // 0x3c8b3c: cmp             x1, x0
    // 0x3c8b40: b.hs            #0x3c8c50
    // 0x3c8b44: LoadField: d0 = r3->field_1b
    //     0x3c8b44: ldur            s0, [x3, #0x1b]
    // 0x3c8b48: fcvt            d1, s0
    // 0x3c8b4c: ldur            x0, [fp, #-0x10]
    // 0x3c8b50: LoadField: d0 = r0->field_1b
    //     0x3c8b50: ldur            s0, [x0, #0x1b]
    // 0x3c8b54: fcvt            d2, s0
    // 0x3c8b58: fadd            d0, d1, d2
    // 0x3c8b5c: fcvt            s1, d0
    // 0x3c8b60: StoreField: r3->field_1b = d1
    //     0x3c8b60: stur            s1, [x3, #0x1b]
    // 0x3c8b64: ArrayLoad: d0 = r3[0]  ; List_8
    //     0x3c8b64: ldur            s0, [x3, #0x17]
    // 0x3c8b68: fcvt            d1, s0
    // 0x3c8b6c: ArrayLoad: d0 = r0[0]  ; List_8
    //     0x3c8b6c: ldur            s0, [x0, #0x17]
    // 0x3c8b70: fcvt            d2, s0
    // 0x3c8b74: fadd            d0, d1, d2
    // 0x3c8b78: fcvt            s1, d0
    // 0x3c8b7c: ArrayStore: r3[0] = d1  ; List_8
    //     0x3c8b7c: stur            s1, [x3, #0x17]
    // 0x3c8b80: r16 = 0.800000
    //     0x3c8b80: add             x16, PP, #0x1f, lsl #12  ; [pp+0x1fdf0] 0.8
    //     0x3c8b84: ldr             x16, [x16, #0xdf0]
    // 0x3c8b88: str             x16, [SP]
    // 0x3c8b8c: ldur            x1, [fp, #-0x20]
    // 0x3c8b90: r4 = const [0, 0x3, 0x1, 0x2, opacity, 0x2, null]
    //     0x3c8b90: add             x4, PP, #0x1f, lsl #12  ; [pp+0x1fde8] List(7) [0, 0x3, 0x1, 0x2, "opacity", 0x2, Null]
    //     0x3c8b94: ldr             x4, [x4, #0xde8]
    // 0x3c8b98: r0 = drawBullet()
    //     0x3c8b98: bl              #0x3c8c54  ; [package:ricochlime/flame/components/bullet.dart] Bullet::drawBullet
    // 0x3c8b9c: ldur            d0, [fp, #-0x50]
    // 0x3c8ba0: d2 = 1.000000
    //     0x3c8ba0: fmov            d2, #1.00000000
    // 0x3c8ba4: fadd            d1, d0, d2
    // 0x3c8ba8: ldur            x2, [fp, #-8]
    // 0x3c8bac: ldur            d0, [fp, #-0x58]
    // 0x3c8bb0: b               #0x3c8aa8
    // 0x3c8bb4: r0 = Null
    //     0x3c8bb4: mov             x0, NULL
    // 0x3c8bb8: LeaveFrame
    //     0x3c8bb8: mov             SP, fp
    //     0x3c8bbc: ldp             fp, lr, [SP], #0x10
    // 0x3c8bc0: ret
    //     0x3c8bc0: ret             
    // 0x3c8bc4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c8bc4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c8bc8: b               #0x3c8650
    // 0x3c8bcc: stp             q0, q3, [SP, #-0x20]!
    // 0x3c8bd0: d0 = 0.000000
    //     0x3c8bd0: fmov            d0, d3
    // 0x3c8bd4: r0 = 66
    //     0x3c8bd4: mov             x0, #0x42
    // 0x3c8bd8: r30 = DoubleToIntegerStub
    //     0x3c8bd8: ldr             lr, [PP, #0x2cc0]  ; [pp+0x2cc0] Stub: DoubleToInteger (0x2318e4)
    // 0x3c8bdc: LoadField: r30 = r30->field_7
    //     0x3c8bdc: ldur            lr, [lr, #7]
    // 0x3c8be0: blr             lr
    // 0x3c8be4: ldp             q0, q3, [SP], #0x20
    // 0x3c8be8: b               #0x3c86e8
    // 0x3c8bec: stp             q0, q2, [SP, #-0x20]!
    // 0x3c8bf0: SaveReg r2
    //     0x3c8bf0: str             x2, [SP, #-8]!
    // 0x3c8bf4: r0 = AllocateDouble()
    //     0x3c8bf4: bl              #0x584528  ; AllocateDoubleStub
    // 0x3c8bf8: RestoreReg r2
    //     0x3c8bf8: ldr             x2, [SP], #8
    // 0x3c8bfc: ldp             q0, q2, [SP], #0x20
    // 0x3c8c00: b               #0x3c8734
    // 0x3c8c04: stp             q0, q1, [SP, #-0x20]!
    // 0x3c8c08: SaveReg r2
    //     0x3c8c08: str             x2, [SP, #-8]!
    // 0x3c8c0c: r0 = AllocateDouble()
    //     0x3c8c0c: bl              #0x584528  ; AllocateDoubleStub
    // 0x3c8c10: RestoreReg r2
    //     0x3c8c10: ldr             x2, [SP], #8
    // 0x3c8c14: ldp             q0, q1, [SP], #0x20
    // 0x3c8c18: b               #0x3c87a8
    // 0x3c8c1c: stp             q0, q2, [SP, #-0x20]!
    // 0x3c8c20: SaveReg r2
    //     0x3c8c20: str             x2, [SP, #-8]!
    // 0x3c8c24: r0 = AllocateDouble()
    //     0x3c8c24: bl              #0x584528  ; AllocateDoubleStub
    // 0x3c8c28: RestoreReg r2
    //     0x3c8c28: ldr             x2, [SP], #8
    // 0x3c8c2c: ldp             q0, q2, [SP], #0x20
    // 0x3c8c30: b               #0x3c8800
    // 0x3c8c34: r0 = StackOverflowSharedWithFPURegs()
    //     0x3c8c34: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3c8c38: b               #0x3c89cc
    // 0x3c8c3c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3c8c3c: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3c8c40: r0 = RangeErrorSharedWithFPURegs()
    //     0x3c8c40: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x3c8c44: r0 = StackOverflowSharedWithFPURegs()
    //     0x3c8c44: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3c8c48: b               #0x3c8ab8
    // 0x3c8c4c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3c8c4c: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3c8c50: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3c8c50: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ onLoad(/* No info */) async {
    // ** addr: 0x434444, size: 0x108
    // 0x434444: EnterFrame
    //     0x434444: stp             fp, lr, [SP, #-0x10]!
    //     0x434448: mov             fp, SP
    // 0x43444c: AllocStack(0x10)
    //     0x43444c: sub             SP, SP, #0x10
    // 0x434450: SetupParameters(AimGuide this /* r1 => r1, fp-0x10 */)
    //     0x434450: stur            NULL, [fp, #-8]
    //     0x434454: stur            x1, [fp, #-0x10]
    // 0x434458: CheckStackOverflow
    //     0x434458: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x43445c: cmp             SP, x16
    //     0x434460: b.ls            #0x434544
    // 0x434464: InitAsync() -> Future<void?>
    //     0x434464: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x434468: bl              #0x2556b4  ; InitAsyncStub
    // 0x43446c: r0 = Null
    //     0x43446c: mov             x0, NULL
    // 0x434470: r0 = Await()
    //     0x434470: bl              #0x255470  ; AwaitStub
    // 0x434474: ldur            x0, [fp, #-0x10]
    // 0x434478: LoadField: r1 = r0->field_47
    //     0x434478: ldur            w1, [x0, #0x47]
    // 0x43447c: DecompressPointer r1
    //     0x43447c: add             x1, x1, HEAP, lsl #32
    // 0x434480: cmp             w1, NULL
    // 0x434484: b.ne            #0x4344b8
    // 0x434488: mov             x1, x0
    // 0x43448c: r0 = _findGameAndCheck()
    //     0x43448c: bl              #0x3c9b84  ; [dart:mixin_deduplication] _MixinApplication264&PositionComponent&HasGameReference::_findGameAndCheck
    // 0x434490: mov             x1, x0
    // 0x434494: ldur            x2, [fp, #-0x10]
    // 0x434498: StoreField: r2->field_47 = r0
    //     0x434498: stur            w0, [x2, #0x47]
    //     0x43449c: ldurb           w16, [x2, #-1]
    //     0x4344a0: ldurb           w17, [x0, #-1]
    //     0x4344a4: and             x16, x17, x16, lsr #2
    //     0x4344a8: tst             x16, HEAP, lsr #32
    //     0x4344ac: b.eq            #0x4344b4
    //     0x4344b0: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x4344b4: b               #0x4344bc
    // 0x4344b8: mov             x2, x0
    // 0x4344bc: LoadField: r0 = r1->field_93
    //     0x4344bc: ldur            w0, [x1, #0x93]
    // 0x4344c0: DecompressPointer r0
    //     0x4344c0: add             x0, x0, HEAP, lsl #32
    // 0x4344c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4344c8: cmp             w0, w16
    // 0x4344cc: b.ne            #0x4344dc
    // 0x4344d0: r2 = player
    //     0x4344d0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x4344d4: ldr             x2, [x2, #0x700]
    // 0x4344d8: r0 = InitLateFinalInstanceField()
    //     0x4344d8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x4344dc: LoadField: r1 = r0->field_37
    //     0x4344dc: ldur            w1, [x0, #0x37]
    // 0x4344e0: DecompressPointer r1
    //     0x4344e0: add             x1, x1, HEAP, lsl #32
    // 0x4344e4: LoadField: r2 = r1->field_37
    //     0x4344e4: ldur            w2, [x1, #0x37]
    // 0x4344e8: DecompressPointer r2
    //     0x4344e8: add             x2, x2, HEAP, lsl #32
    // 0x4344ec: ldur            x0, [fp, #-0x10]
    // 0x4344f0: LoadField: r1 = r0->field_37
    //     0x4344f0: ldur            w1, [x0, #0x37]
    // 0x4344f4: DecompressPointer r1
    //     0x4344f4: add             x1, x1, HEAP, lsl #32
    // 0x4344f8: LoadField: r3 = r1->field_37
    //     0x4344f8: ldur            w3, [x1, #0x37]
    // 0x4344fc: DecompressPointer r3
    //     0x4344fc: add             x3, x3, HEAP, lsl #32
    // 0x434500: mov             x1, x3
    // 0x434504: r0 = setFrom()
    //     0x434504: bl              #0x549084  ; [package:flame/src/game/notifying_vector2.dart] NotifyingVector2::setFrom
    // 0x434508: ldur            x1, [fp, #-0x10]
    // 0x43450c: d0 = 0.000000
    //     0x43450c: eor             v0.16b, v0.16b, v0.16b
    // 0x434510: r0 = width=()
    //     0x434510: bl              #0x4345d4  ; [package:flame/src/components/position_component.dart] PositionComponent::width=
    // 0x434514: ldur            x1, [fp, #-0x10]
    // 0x434518: d0 = 0.000000
    //     0x434518: eor             v0.16b, v0.16b, v0.16b
    // 0x43451c: r0 = height=()
    //     0x43451c: bl              #0x434588  ; [package:flame/src/components/position_component.dart] PositionComponent::height=
    // 0x434520: ldur            x1, [fp, #-0x10]
    // 0x434524: r2 = Instance_Anchor
    //     0x434524: add             x2, PP, #8, lsl #12  ; [pp+0x8b30] Obj!Anchor@5cce91
    //     0x434528: ldr             x2, [x2, #0xb30]
    // 0x43452c: r0 = anchor=()
    //     0x43452c: bl              #0x43454c  ; [package:flame/src/components/position_component.dart] PositionComponent::anchor=
    // 0x434530: ldur            x1, [fp, #-0x10]
    // 0x434534: r2 = 2
    //     0x434534: mov             x2, #2
    // 0x434538: r0 = priority=()
    //     0x434538: bl              #0x3d3760  ; [package:flame/src/components/core/component.dart] Component::priority=
    // 0x43453c: r0 = Null
    //     0x43453c: mov             x0, NULL
    // 0x434540: r0 = ReturnAsyncNotFuture()
    //     0x434540: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x434544: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x434544: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x434548: b               #0x434464
  }
}
