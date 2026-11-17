// lib: , url: package:ricochlime/utils/random_extension.dart

// class id: 1049332, size: 0x8
class :: {

  static _ RandomExtension.plusOrMinus(/* No info */) {
    // ** addr: 0x379fe8, size: 0x48
    // 0x379fe8: EnterFrame
    //     0x379fe8: stp             fp, lr, [SP, #-0x10]!
    //     0x379fec: mov             fp, SP
    // 0x379ff0: AllocStack(0x8)
    //     0x379ff0: sub             SP, SP, #8
    // 0x379ff4: SetupParameters(dynamic _ /* d0 => d0, fp-0x8 */)
    //     0x379ff4: stur            d0, [fp, #-8]
    // 0x379ff8: CheckStackOverflow
    //     0x379ff8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x379ffc: cmp             SP, x16
    //     0x37a000: b.ls            #0x37a028
    // 0x37a004: r0 = nextDouble()
    //     0x37a004: bl              #0x379d5c  ; [dart:math] _Random::nextDouble
    // 0x37a008: ldur            d1, [fp, #-8]
    // 0x37a00c: fmul            d2, d0, d1
    // 0x37a010: d3 = 2.000000
    //     0x37a010: fmov            d3, #2.00000000
    // 0x37a014: fmul            d4, d2, d3
    // 0x37a018: fsub            d0, d4, d1
    // 0x37a01c: LeaveFrame
    //     0x37a01c: mov             SP, fp
    //     0x37a020: ldp             fp, lr, [SP], #0x10
    // 0x37a024: ret
    //     0x37a024: ret             
    // 0x37a028: r0 = StackOverflowSharedWithFPURegs()
    //     0x37a028: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x37a02c: b               #0x37a004
  }
  static _ RandomExtension.nextBetween(/* No info */) {
    // ** addr: 0x3d3318, size: 0x4c
    // 0x3d3318: EnterFrame
    //     0x3d3318: stp             fp, lr, [SP, #-0x10]!
    //     0x3d331c: mov             fp, SP
    // 0x3d3320: AllocStack(0x10)
    //     0x3d3320: sub             SP, SP, #0x10
    // 0x3d3324: SetupParameters(dynamic _ /* d0 => d0, fp-0x8 */, dynamic _ /* d1 => d1, fp-0x10 */)
    //     0x3d3324: stur            d0, [fp, #-8]
    //     0x3d3328: stur            d1, [fp, #-0x10]
    // 0x3d332c: CheckStackOverflow
    //     0x3d332c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d3330: cmp             SP, x16
    //     0x3d3334: b.ls            #0x3d335c
    // 0x3d3338: r0 = nextDouble()
    //     0x3d3338: bl              #0x379d5c  ; [dart:math] _Random::nextDouble
    // 0x3d333c: ldur            d2, [fp, #-8]
    // 0x3d3340: ldur            d1, [fp, #-0x10]
    // 0x3d3344: fsub            d3, d1, d2
    // 0x3d3348: fmul            d1, d0, d3
    // 0x3d334c: fadd            d0, d2, d1
    // 0x3d3350: LeaveFrame
    //     0x3d3350: mov             SP, fp
    //     0x3d3354: ldp             fp, lr, [SP], #0x10
    // 0x3d3358: ret
    //     0x3d3358: ret             
    // 0x3d335c: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d335c: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d3360: b               #0x3d3338
  }
}
