// lib: , url: package:ricochlime/ads/iap_state.dart

// class id: 1049300, size: 0x8
class :: {
}

// class id: 3845, size: 0x14, field offset: 0x14
enum IAPState extends _Enum {

  _Mint field_8;
  _OneByteString field_10;
  static late final EnumCodec<IAPState> codec; // offset: 0xcc0

  static EnumCodec<IAPState> codec() {
    // ** addr: 0x3c4784, size: 0x2c
    // 0x3c4784: EnterFrame
    //     0x3c4784: stp             fp, lr, [SP, #-0x10]!
    //     0x3c4788: mov             fp, SP
    // 0x3c478c: r1 = <IAPState, int, IAPState>
    //     0x3c478c: add             x1, PP, #0x10, lsl #12  ; [pp+0x107f0] TypeArguments: <IAPState, int, IAPState>
    //     0x3c4790: ldr             x1, [x1, #0x7f0]
    // 0x3c4794: r0 = EnumCodec()
    //     0x3c4794: bl              #0x3c47b0  ; AllocateEnumCodecStub -> EnumCodec<C2X0 bound Enum> (size=0x10)
    // 0x3c4798: r1 = const [Instance of 'IAPState', Instance of 'IAPState', Instance of 'IAPState']
    //     0x3c4798: add             x1, PP, #0xc, lsl #12  ; [pp+0xc248] List<IAPState>(3)
    //     0x3c479c: ldr             x1, [x1, #0x248]
    // 0x3c47a0: StoreField: r0->field_b = r1
    //     0x3c47a0: stur            w1, [x0, #0xb]
    // 0x3c47a4: LeaveFrame
    //     0x3c47a4: mov             SP, fp
    //     0x3c47a8: ldp             fp, lr, [SP], #0x10
    // 0x3c47ac: ret
    //     0x3c47ac: ret             
  }
  _ _enumToString(/* No info */) {
    // ** addr: 0x4a00ec, size: 0x64
    // 0x4a00ec: EnterFrame
    //     0x4a00ec: stp             fp, lr, [SP, #-0x10]!
    //     0x4a00f0: mov             fp, SP
    // 0x4a00f4: AllocStack(0x10)
    //     0x4a00f4: sub             SP, SP, #0x10
    // 0x4a00f8: SetupParameters(IAPState this /* r1 => r0, fp-0x8 */)
    //     0x4a00f8: mov             x0, x1
    //     0x4a00fc: stur            x1, [fp, #-8]
    // 0x4a0100: CheckStackOverflow
    //     0x4a0100: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a0104: cmp             SP, x16
    //     0x4a0108: b.ls            #0x4a0148
    // 0x4a010c: r1 = Null
    //     0x4a010c: mov             x1, NULL
    // 0x4a0110: r2 = 4
    //     0x4a0110: mov             x2, #4
    // 0x4a0114: r0 = AllocateArray()
    //     0x4a0114: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a0118: r16 = "IAPState."
    //     0x4a0118: add             x16, PP, #0xd, lsl #12  ; [pp+0xdcd8] "IAPState."
    //     0x4a011c: ldr             x16, [x16, #0xcd8]
    // 0x4a0120: StoreField: r0->field_f = r16
    //     0x4a0120: stur            w16, [x0, #0xf]
    // 0x4a0124: ldur            x1, [fp, #-8]
    // 0x4a0128: LoadField: r2 = r1->field_f
    //     0x4a0128: ldur            w2, [x1, #0xf]
    // 0x4a012c: DecompressPointer r2
    //     0x4a012c: add             x2, x2, HEAP, lsl #32
    // 0x4a0130: StoreField: r0->field_13 = r2
    //     0x4a0130: stur            w2, [x0, #0x13]
    // 0x4a0134: str             x0, [SP]
    // 0x4a0138: r0 = _interpolate()
    //     0x4a0138: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a013c: LeaveFrame
    //     0x4a013c: mov             SP, fp
    //     0x4a0140: ldp             fp, lr, [SP], #0x10
    // 0x4a0144: ret
    //     0x4a0144: ret             
    // 0x4a0148: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a0148: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a014c: b               #0x4a010c
  }
}
