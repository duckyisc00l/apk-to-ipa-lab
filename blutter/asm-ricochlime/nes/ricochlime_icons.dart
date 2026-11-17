// lib: , url: package:ricochlime/nes/ricochlime_icons.dart

// class id: 1049322, size: 0x8
class :: {
}

// class id: 227, size: 0x8, field offset: 0x8
abstract class RicochlimeIcons extends Object {

  static late final NesIconData aimGuideWithReflection; // offset: 0xd04
  static late final NesIconData aimGuideWithoutReflection; // offset: 0xd08

  static NesIconData aimGuideWithoutReflection() {
    // ** addr: 0x42b46c, size: 0x4c
    // 0x42b46c: EnterFrame
    //     0x42b46c: stp             fp, lr, [SP, #-0x10]!
    //     0x42b470: mov             fp, SP
    // 0x42b474: AllocStack(0x8)
    //     0x42b474: sub             SP, SP, #8
    // 0x42b478: CheckStackOverflow
    //     0x42b478: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b47c: cmp             SP, x16
    //     0x42b480: b.ls            #0x42b4b0
    // 0x42b484: r1 = Null
    //     0x42b484: mov             x1, NULL
    // 0x42b488: r2 = "8,8;32,-1;1,1;9,-1;1,0;9,-1;1,0;9,-1;1,0;1,-1"
    //     0x42b488: add             x2, PP, #0x12, lsl #12  ; [pp+0x122c0] "8,8;32,-1;1,1;9,-1;1,0;9,-1;1,0;9,-1;1,0;1,-1"
    //     0x42b48c: ldr             x2, [x2, #0x2c0]
    // 0x42b490: r0 = MiniSprite.fromDataString()
    //     0x42b490: bl              #0x38041c  ; [package:mini_sprite/src/mini_sprite.dart] MiniSprite::MiniSprite.fromDataString
    // 0x42b494: stur            x0, [fp, #-8]
    // 0x42b498: r0 = NesIconData()
    //     0x42b498: bl              #0x380410  ; AllocateNesIconDataStub -> NesIconData (size=0xc)
    // 0x42b49c: ldur            x1, [fp, #-8]
    // 0x42b4a0: StoreField: r0->field_7 = r1
    //     0x42b4a0: stur            w1, [x0, #7]
    // 0x42b4a4: LeaveFrame
    //     0x42b4a4: mov             SP, fp
    //     0x42b4a8: ldp             fp, lr, [SP], #0x10
    // 0x42b4ac: ret
    //     0x42b4ac: ret             
    // 0x42b4b0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b4b0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b4b4: b               #0x42b484
  }
  static NesIconData aimGuideWithReflection() {
    // ** addr: 0x42b4b8, size: 0x4c
    // 0x42b4b8: EnterFrame
    //     0x42b4b8: stp             fp, lr, [SP, #-0x10]!
    //     0x42b4bc: mov             fp, SP
    // 0x42b4c0: AllocStack(0x8)
    //     0x42b4c0: sub             SP, SP, #8
    // 0x42b4c4: CheckStackOverflow
    //     0x42b4c4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42b4c8: cmp             SP, x16
    //     0x42b4cc: b.ls            #0x42b4fc
    // 0x42b4d0: r1 = Null
    //     0x42b4d0: mov             x1, NULL
    // 0x42b4d4: r2 = "8,8;14,-1;1,0;5,-1;1,0;5,-1;1,0;5,-1;1,0;9,-1;1,0;9,-1;1,0;9,-1;1,0;1,-1"
    //     0x42b4d4: add             x2, PP, #0x12, lsl #12  ; [pp+0x122c8] "8,8;14,-1;1,0;5,-1;1,0;5,-1;1,0;5,-1;1,0;9,-1;1,0;9,-1;1,0;9,-1;1,0;1,-1"
    //     0x42b4d8: ldr             x2, [x2, #0x2c8]
    // 0x42b4dc: r0 = MiniSprite.fromDataString()
    //     0x42b4dc: bl              #0x38041c  ; [package:mini_sprite/src/mini_sprite.dart] MiniSprite::MiniSprite.fromDataString
    // 0x42b4e0: stur            x0, [fp, #-8]
    // 0x42b4e4: r0 = NesIconData()
    //     0x42b4e4: bl              #0x380410  ; AllocateNesIconDataStub -> NesIconData (size=0xc)
    // 0x42b4e8: ldur            x1, [fp, #-8]
    // 0x42b4ec: StoreField: r0->field_7 = r1
    //     0x42b4ec: stur            w1, [x0, #7]
    // 0x42b4f0: LeaveFrame
    //     0x42b4f0: mov             SP, fp
    //     0x42b4f4: ldp             fp, lr, [SP], #0x10
    // 0x42b4f8: ret
    //     0x42b4f8: ret             
    // 0x42b4fc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42b4fc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42b500: b               #0x42b4d0
  }
}
