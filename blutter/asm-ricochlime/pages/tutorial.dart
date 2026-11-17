// lib: , url: package:ricochlime/pages/tutorial.dart

// class id: 1049330, size: 0x8
class :: {
}

// class id: 1528, size: 0x10, field offset: 0xc
//   const constructor, 
class _BounceOffWallsGraphicPainter extends CustomPainter {

  _ paint(/* No info */) {
    // ** addr: 0x4b7184, size: 0x304
    // 0x4b7184: EnterFrame
    //     0x4b7184: stp             fp, lr, [SP, #-0x10]!
    //     0x4b7188: mov             fp, SP
    // 0x4b718c: AllocStack(0xb8)
    //     0x4b718c: sub             SP, SP, #0xb8
    // 0x4b7190: SetupParameters(_BounceOffWallsGraphicPainter this /* r1 => r0, fp-0x8 */, dynamic _ /* r2 => r1, fp-0x10 */, dynamic _ /* r3 => r3, fp-0x18 */)
    //     0x4b7190: mov             x0, x1
    //     0x4b7194: stur            x1, [fp, #-8]
    //     0x4b7198: mov             x1, x2
    //     0x4b719c: stur            x2, [fp, #-0x10]
    //     0x4b71a0: stur            x3, [fp, #-0x18]
    // 0x4b71a4: CheckStackOverflow
    //     0x4b71a4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4b71a8: cmp             SP, x16
    //     0x4b71ac: b.ls            #0x4b7474
    // 0x4b71b0: r16 = 136
    //     0x4b71b0: mov             x16, #0x88
    // 0x4b71b4: stp             x16, NULL, [SP]
    // 0x4b71b8: r0 = ByteData()
    //     0x4b71b8: bl              #0x23e6cc  ; [dart:typed_data] ByteData::ByteData
    // 0x4b71bc: stur            x0, [fp, #-0x20]
    // 0x4b71c0: r0 = Paint()
    //     0x4b71c0: bl              #0x28bc30  ; AllocatePaintStub -> Paint (size=0x10)
    // 0x4b71c4: ldur            x3, [fp, #-0x20]
    // 0x4b71c8: stur            x0, [fp, #-0x30]
    // 0x4b71cc: StoreField: r0->field_7 = r3
    //     0x4b71cc: stur            w3, [x0, #7]
    // 0x4b71d0: ldur            x1, [fp, #-8]
    // 0x4b71d4: LoadField: r4 = r1->field_b
    //     0x4b71d4: ldur            w4, [x1, #0xb]
    // 0x4b71d8: DecompressPointer r4
    //     0x4b71d8: add             x4, x4, HEAP, lsl #32
    // 0x4b71dc: mov             x1, x0
    // 0x4b71e0: mov             x2, x4
    // 0x4b71e4: stur            x4, [fp, #-0x28]
    // 0x4b71e8: r0 = color=()
    //     0x4b71e8: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x4b71ec: ldur            x3, [fp, #-0x20]
    // 0x4b71f0: ArrayLoad: r0 = r3[0]  ; List_4
    //     0x4b71f0: ldur            w0, [x3, #0x17]
    // 0x4b71f4: DecompressPointer r0
    //     0x4b71f4: add             x0, x0, HEAP, lsl #32
    // 0x4b71f8: stur            x0, [fp, #-8]
    // 0x4b71fc: LoadField: r1 = r0->field_7
    //     0x4b71fc: ldur            x1, [x0, #7]
    // 0x4b7200: d0 = 0.000000
    //     0x4b7200: add             x17, PP, #0xc, lsl #12  ; [pp+0xc9a8] IMM: 0x40000000
    //     0x4b7204: ldr             s0, [x17, #0x9a8]
    // 0x4b7208: str             s0, [x1, #0x20]
    // 0x4b720c: LoadField: r1 = r0->field_7
    //     0x4b720c: ldur            x1, [x0, #7]
    // 0x4b7210: r2 = 1
    //     0x4b7210: mov             x2, #1
    // 0x4b7214: str             w2, [x1, #0x1c]
    // 0x4b7218: ldur            x1, [fp, #-0x18]
    // 0x4b721c: LoadField: d0 = r1->field_7
    //     0x4b721c: ldur            d0, [x1, #7]
    // 0x4b7220: stur            d0, [fp, #-0x68]
    // 0x4b7224: LoadField: d1 = r1->field_f
    //     0x4b7224: ldur            d1, [x1, #0xf]
    // 0x4b7228: stur            d1, [fp, #-0x60]
    // 0x4b722c: r0 = Offset()
    //     0x4b722c: bl              #0x23da08  ; AllocateOffsetStub -> Offset (size=0x18)
    // 0x4b7230: ldur            d0, [fp, #-0x68]
    // 0x4b7234: StoreField: r0->field_7 = d0
    //     0x4b7234: stur            d0, [x0, #7]
    // 0x4b7238: ldur            d1, [fp, #-0x60]
    // 0x4b723c: StoreField: r0->field_f = d1
    //     0x4b723c: stur            d1, [x0, #0xf]
    // 0x4b7240: ldur            x2, [fp, #-0x28]
    // 0x4b7244: LoadField: d2 = r2->field_f
    //     0x4b7244: ldur            d2, [x2, #0xf]
    // 0x4b7248: stur            d2, [fp, #-0xa8]
    // 0x4b724c: ArrayLoad: d3 = r2[0]  ; List_8
    //     0x4b724c: ldur            d3, [x2, #0x17]
    // 0x4b7250: stur            d3, [fp, #-0xa0]
    // 0x4b7254: LoadField: d4 = r2->field_1f
    //     0x4b7254: ldur            d4, [x2, #0x1f]
    // 0x4b7258: stur            d4, [fp, #-0x98]
    // 0x4b725c: LoadField: r1 = r2->field_27
    //     0x4b725c: ldur            w1, [x2, #0x27]
    // 0x4b7260: DecompressPointer r1
    //     0x4b7260: add             x1, x1, HEAP, lsl #32
    // 0x4b7264: stur            x1, [fp, #-0x18]
    // 0x4b7268: mov             x5, x0
    // 0x4b726c: mov             v9.16b, v0.16b
    // 0x4b7270: mov             v8.16b, v1.16b
    // 0x4b7274: r4 = 1
    //     0x4b7274: mov             x4, #1
    // 0x4b7278: ldur            x3, [fp, #-0x10]
    // 0x4b727c: ldur            x0, [fp, #-0x30]
    // 0x4b7280: d7 = 7.000000
    //     0x4b7280: fmov            d7, #7.00000000
    // 0x4b7284: d6 = 1.000000
    //     0x4b7284: fmov            d6, #1.00000000
    // 0x4b7288: d5 = 0.700000
    //     0x4b7288: add             x17, PP, #0x15, lsl #12  ; [pp+0x15cf8] IMM: double(0.7) from 0x3fe6666666666666
    //     0x4b728c: ldr             d5, [x17, #0xcf8]
    // 0x4b7290: stur            x4, [fp, #-0x38]
    // 0x4b7294: stur            x5, [fp, #-0x58]
    // 0x4b7298: stur            d9, [fp, #-0x88]
    // 0x4b729c: stur            d8, [fp, #-0x90]
    // 0x4b72a0: CheckStackOverflow
    //     0x4b72a0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4b72a4: cmp             SP, x16
    //     0x4b72a8: b.ls            #0x4b747c
    // 0x4b72ac: cmp             x4, #7
    // 0x4b72b0: b.ge            #0x4b73d8
    // 0x4b72b4: scvtf           d10, x4
    // 0x4b72b8: fdiv            d11, d10, d7
    // 0x4b72bc: stur            d11, [fp, #-0x80]
    // 0x4b72c0: tbnz            w4, #0, #0x4b72cc
    // 0x4b72c4: mov             v10.16b, v0.16b
    // 0x4b72c8: b               #0x4b72d0
    // 0x4b72cc: d10 = 0.000000
    //     0x4b72cc: eor             v10.16b, v10.16b, v10.16b
    // 0x4b72d0: stur            d10, [fp, #-0x78]
    // 0x4b72d4: fmul            d12, d11, d5
    // 0x4b72d8: fsub            d13, d6, d12
    // 0x4b72dc: fmul            d12, d1, d13
    // 0x4b72e0: stur            d12, [fp, #-0x70]
    // 0x4b72e4: r0 = Offset()
    //     0x4b72e4: bl              #0x23da08  ; AllocateOffsetStub -> Offset (size=0x18)
    // 0x4b72e8: ldur            d2, [fp, #-0x78]
    // 0x4b72ec: stur            x0, [fp, #-0x40]
    // 0x4b72f0: StoreField: r0->field_7 = d2
    //     0x4b72f0: stur            d2, [x0, #7]
    // 0x4b72f4: ldur            d3, [fp, #-0x70]
    // 0x4b72f8: StoreField: r0->field_f = d3
    //     0x4b72f8: stur            d3, [x0, #0xf]
    // 0x4b72fc: r0 = Color()
    //     0x4b72fc: bl              #0x2eee4c  ; AllocateColorStub -> Color (size=0x2c)
    // 0x4b7300: mov             x1, x0
    // 0x4b7304: ldur            x0, [fp, #-0x18]
    // 0x4b7308: StoreField: r1->field_27 = r0
    //     0x4b7308: stur            w0, [x1, #0x27]
    // 0x4b730c: ldur            d0, [fp, #-0x80]
    // 0x4b7310: StoreField: r1->field_7 = d0
    //     0x4b7310: stur            d0, [x1, #7]
    // 0x4b7314: ldur            d0, [fp, #-0xa8]
    // 0x4b7318: StoreField: r1->field_f = d0
    //     0x4b7318: stur            d0, [x1, #0xf]
    // 0x4b731c: ldur            d1, [fp, #-0xa0]
    // 0x4b7320: ArrayStore: r1[0] = d1  ; List_8
    //     0x4b7320: stur            d1, [x1, #0x17]
    // 0x4b7324: ldur            d2, [fp, #-0x98]
    // 0x4b7328: StoreField: r1->field_1f = d2
    //     0x4b7328: stur            d2, [x1, #0x1f]
    // 0x4b732c: mov             x2, x1
    // 0x4b7330: ldur            x1, [fp, #-0x30]
    // 0x4b7334: r0 = color=()
    //     0x4b7334: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x4b7338: ldur            x0, [fp, #-0x30]
    // 0x4b733c: LoadField: r2 = r0->field_b
    //     0x4b733c: ldur            w2, [x0, #0xb]
    // 0x4b7340: DecompressPointer r2
    //     0x4b7340: add             x2, x2, HEAP, lsl #32
    // 0x4b7344: ldur            x3, [fp, #-0x10]
    // 0x4b7348: stur            x2, [fp, #-0x50]
    // 0x4b734c: LoadField: r1 = r3->field_7
    //     0x4b734c: ldur            w1, [x3, #7]
    // 0x4b7350: DecompressPointer r1
    //     0x4b7350: add             x1, x1, HEAP, lsl #32
    // 0x4b7354: cmp             w1, NULL
    // 0x4b7358: b.eq            #0x4b7484
    // 0x4b735c: LoadField: r4 = r1->field_7
    //     0x4b735c: ldur            x4, [x1, #7]
    // 0x4b7360: ldr             x1, [x4]
    // 0x4b7364: cbz             x1, #0x4b7464
    // 0x4b7368: ldur            x4, [fp, #-0x38]
    // 0x4b736c: mov             x5, x1
    // 0x4b7370: stur            x5, [fp, #-0x48]
    // 0x4b7374: r1 = <Never>
    //     0x4b7374: ldr             x1, [PP, #0x1c8]  ; [pp+0x1c8] TypeArguments: <Never>
    // 0x4b7378: r0 = Pointer()
    //     0x4b7378: bl              #0x23e410  ; AllocatePointerStub -> Pointer<X0 bound NativeType> (size=-0x8)
    // 0x4b737c: mov             x1, x0
    // 0x4b7380: ldur            x0, [fp, #-0x48]
    // 0x4b7384: StoreField: r1->field_7 = r0
    //     0x4b7384: stur            x0, [x1, #7]
    // 0x4b7388: ldur            d0, [fp, #-0x88]
    // 0x4b738c: ldur            d1, [fp, #-0x90]
    // 0x4b7390: ldur            d2, [fp, #-0x78]
    // 0x4b7394: ldur            d3, [fp, #-0x70]
    // 0x4b7398: ldur            x2, [fp, #-0x50]
    // 0x4b739c: ldur            x3, [fp, #-0x20]
    // 0x4b73a0: r0 = __drawLine$Method$FfiNative()
    //     0x4b73a0: bl              #0x3cabec  ; [dart:ui] _NativeCanvas::__drawLine$Method$FfiNative
    // 0x4b73a4: ldur            x0, [fp, #-0x38]
    // 0x4b73a8: add             x4, x0, #1
    // 0x4b73ac: ldur            x5, [fp, #-0x40]
    // 0x4b73b0: ldur            d9, [fp, #-0x78]
    // 0x4b73b4: ldur            d8, [fp, #-0x70]
    // 0x4b73b8: ldur            x2, [fp, #-0x28]
    // 0x4b73bc: ldur            d2, [fp, #-0xa8]
    // 0x4b73c0: ldur            d3, [fp, #-0xa0]
    // 0x4b73c4: ldur            d4, [fp, #-0x98]
    // 0x4b73c8: ldur            x1, [fp, #-0x18]
    // 0x4b73cc: ldur            d0, [fp, #-0x68]
    // 0x4b73d0: ldur            d1, [fp, #-0x60]
    // 0x4b73d4: b               #0x4b7278
    // 0x4b73d8: ldur            x0, [fp, #-8]
    // 0x4b73dc: d3 = 0.400000
    //     0x4b73dc: add             x17, PP, #0xb, lsl #12  ; [pp+0xbae8] IMM: double(0.4) from 0x3fd999999999999a
    //     0x4b73e0: ldr             d3, [x17, #0xae8]
    // 0x4b73e4: d2 = 0.300000
    //     0x4b73e4: add             x17, PP, #0xd, lsl #12  ; [pp+0xd3c8] IMM: double(0.3) from 0x3fd3333333333333
    //     0x4b73e8: ldr             d2, [x17, #0x3c8]
    // 0x4b73ec: fmul            d4, d0, d3
    // 0x4b73f0: stur            d4, [fp, #-0x70]
    // 0x4b73f4: fmul            d0, d1, d2
    // 0x4b73f8: stur            d0, [fp, #-0x68]
    // 0x4b73fc: r0 = Offset()
    //     0x4b73fc: bl              #0x23da08  ; AllocateOffsetStub -> Offset (size=0x18)
    // 0x4b7400: ldur            d0, [fp, #-0x70]
    // 0x4b7404: stur            x0, [fp, #-0x18]
    // 0x4b7408: StoreField: r0->field_7 = d0
    //     0x4b7408: stur            d0, [x0, #7]
    // 0x4b740c: ldur            d0, [fp, #-0x68]
    // 0x4b7410: StoreField: r0->field_f = d0
    //     0x4b7410: stur            d0, [x0, #0xf]
    // 0x4b7414: ldur            x1, [fp, #-0x30]
    // 0x4b7418: ldur            x2, [fp, #-0x28]
    // 0x4b741c: r0 = color=()
    //     0x4b741c: bl              #0x28ba3c  ; [dart:ui] Paint::color=
    // 0x4b7420: ldur            x1, [fp, #-0x10]
    // 0x4b7424: ldur            x2, [fp, #-0x58]
    // 0x4b7428: ldur            x3, [fp, #-0x18]
    // 0x4b742c: ldur            x5, [fp, #-0x30]
    // 0x4b7430: r0 = drawLine()
    //     0x4b7430: bl              #0x3cab14  ; [dart:ui] _NativeCanvas::drawLine
    // 0x4b7434: ldur            x0, [fp, #-8]
    // 0x4b7438: LoadField: r1 = r0->field_7
    //     0x4b7438: ldur            x1, [x0, #7]
    // 0x4b743c: str             wzr, [x1, #0x1c]
    // 0x4b7440: ldur            x1, [fp, #-0x10]
    // 0x4b7444: ldur            x2, [fp, #-0x18]
    // 0x4b7448: ldur            x3, [fp, #-0x30]
    // 0x4b744c: d0 = 4.000000
    //     0x4b744c: fmov            d0, #4.00000000
    // 0x4b7450: r0 = drawCircle()
    //     0x4b7450: bl              #0x3caecc  ; [dart:ui] _NativeCanvas::drawCircle
    // 0x4b7454: r0 = Null
    //     0x4b7454: mov             x0, NULL
    // 0x4b7458: LeaveFrame
    //     0x4b7458: mov             SP, fp
    //     0x4b745c: ldp             fp, lr, [SP], #0x10
    // 0x4b7460: ret
    //     0x4b7460: ret             
    // 0x4b7464: r16 = "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    //     0x4b7464: ldr             x16, [PP, #0x5b8]  ; [pp+0x5b8] "A Dart object attempted to access a native peer, but the native peer has been collected (nullptr). This is usually the result of calling methods on a native-backed object when the native resources have already been disposed."
    // 0x4b7468: str             x16, [SP]
    // 0x4b746c: r0 = _throwNew()
    //     0x4b746c: bl              #0x2390d4  ; [dart:core] StateError::_throwNew
    // 0x4b7470: brk             #0
    // 0x4b7474: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4b7474: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4b7478: b               #0x4b71b0
    // 0x4b747c: r0 = StackOverflowSharedWithFPURegs()
    //     0x4b747c: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x4b7480: b               #0x4b72ac
    // 0x4b7484: r0 = NullErrorSharedWithoutFPURegs()
    //     0x4b7484: bl              #0x584f24  ; NullErrorSharedWithoutFPURegsStub
  }
  _ shouldRepaint(/* No info */) {
    // ** addr: 0x4d2e74, size: 0x9c
    // 0x4d2e74: EnterFrame
    //     0x4d2e74: stp             fp, lr, [SP, #-0x10]!
    //     0x4d2e78: mov             fp, SP
    // 0x4d2e7c: AllocStack(0x20)
    //     0x4d2e7c: sub             SP, SP, #0x20
    // 0x4d2e80: SetupParameters(_BounceOffWallsGraphicPainter this /* r1 => r4, fp-0x8 */, dynamic _ /* r2 => r3, fp-0x10 */)
    //     0x4d2e80: mov             x4, x1
    //     0x4d2e84: mov             x3, x2
    //     0x4d2e88: stur            x1, [fp, #-8]
    //     0x4d2e8c: stur            x2, [fp, #-0x10]
    // 0x4d2e90: CheckStackOverflow
    //     0x4d2e90: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4d2e94: cmp             SP, x16
    //     0x4d2e98: b.ls            #0x4d2f08
    // 0x4d2e9c: mov             x0, x3
    // 0x4d2ea0: r2 = Null
    //     0x4d2ea0: mov             x2, NULL
    // 0x4d2ea4: r1 = Null
    //     0x4d2ea4: mov             x1, NULL
    // 0x4d2ea8: r4 = 60
    //     0x4d2ea8: mov             x4, #0x3c
    // 0x4d2eac: branchIfSmi(r0, 0x4d2eb8)
    //     0x4d2eac: tbz             w0, #0, #0x4d2eb8
    // 0x4d2eb0: r4 = LoadClassIdInstr(r0)
    //     0x4d2eb0: ldur            x4, [x0, #-1]
    //     0x4d2eb4: ubfx            x4, x4, #0xc, #0x14
    // 0x4d2eb8: cmp             x4, #0x5f8
    // 0x4d2ebc: b.eq            #0x4d2ed4
    // 0x4d2ec0: r8 = _BounceOffWallsGraphicPainter
    //     0x4d2ec0: add             x8, PP, #0x15, lsl #12  ; [pp+0x15ce0] Type: _BounceOffWallsGraphicPainter
    //     0x4d2ec4: ldr             x8, [x8, #0xce0]
    // 0x4d2ec8: r3 = Null
    //     0x4d2ec8: add             x3, PP, #0x15, lsl #12  ; [pp+0x15ce8] Null
    //     0x4d2ecc: ldr             x3, [x3, #0xce8]
    // 0x4d2ed0: r0 = DefaultTypeTest()
    //     0x4d2ed0: bl              #0x582454  ; DefaultTypeTestStub
    // 0x4d2ed4: ldur            x0, [fp, #-8]
    // 0x4d2ed8: LoadField: r1 = r0->field_b
    //     0x4d2ed8: ldur            w1, [x0, #0xb]
    // 0x4d2edc: DecompressPointer r1
    //     0x4d2edc: add             x1, x1, HEAP, lsl #32
    // 0x4d2ee0: ldur            x0, [fp, #-0x10]
    // 0x4d2ee4: LoadField: r2 = r0->field_b
    //     0x4d2ee4: ldur            w2, [x0, #0xb]
    // 0x4d2ee8: DecompressPointer r2
    //     0x4d2ee8: add             x2, x2, HEAP, lsl #32
    // 0x4d2eec: stp             x2, x1, [SP]
    // 0x4d2ef0: r0 = ==()
    //     0x4d2ef0: bl              #0x509788  ; [dart:ui] Color::==
    // 0x4d2ef4: eor             x1, x0, #0x10
    // 0x4d2ef8: mov             x0, x1
    // 0x4d2efc: LeaveFrame
    //     0x4d2efc: mov             SP, fp
    //     0x4d2f00: ldp             fp, lr, [SP], #0x10
    // 0x4d2f04: ret
    //     0x4d2f04: ret             
    // 0x4d2f08: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4d2f08: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4d2f0c: b               #0x4d2e9c
  }
}

// class id: 2760, size: 0x14, field offset: 0xc
//   const constructor, 
class _SkullsGraphic extends StatelessWidget {

  _Mint field_c;

  _ build(/* No info */) {
    // ** addr: 0x42ecc4, size: 0x1c8
    // 0x42ecc4: EnterFrame
    //     0x42ecc4: stp             fp, lr, [SP, #-0x10]!
    //     0x42ecc8: mov             fp, SP
    // 0x42eccc: AllocStack(0x38)
    //     0x42eccc: sub             SP, SP, #0x38
    // 0x42ecd0: SetupParameters(_SkullsGraphic this /* r1 => r0, fp-0x8 */)
    //     0x42ecd0: mov             x0, x1
    //     0x42ecd4: stur            x1, [fp, #-8]
    // 0x42ecd8: CheckStackOverflow
    //     0x42ecd8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ecdc: cmp             SP, x16
    //     0x42ece0: b.ls            #0x42ee78
    // 0x42ece4: r16 = 246
    //     0x42ece4: mov             x16, #0xf6
    // 0x42ece8: str             x16, [SP]
    // 0x42ecec: r1 = Null
    //     0x42ecec: mov             x1, NULL
    // 0x42ecf0: r4 = const [0, 0x2, 0x1, 0x2, null]
    //     0x42ecf0: ldr             x4, [PP, #0x928]  ; [pp+0x928] List(5) [0, 0x2, 0x1, 0x2, Null]
    // 0x42ecf4: r0 = Random()
    //     0x42ecf4: bl              #0x37e1a8  ; [dart:math] Random::Random
    // 0x42ecf8: stur            x0, [fp, #-0x10]
    // 0x42ecfc: r1 = 2
    //     0x42ecfc: mov             x1, #2
    // 0x42ed00: r0 = AllocateContext()
    //     0x42ed00: bl              #0x5834e8  ; AllocateContextStub
    // 0x42ed04: mov             x3, x0
    // 0x42ed08: ldur            x0, [fp, #-0x10]
    // 0x42ed0c: stur            x3, [fp, #-0x28]
    // 0x42ed10: StoreField: r3->field_f = r0
    //     0x42ed10: stur            w0, [x3, #0xf]
    // 0x42ed14: ldur            x1, [fp, #-8]
    // 0x42ed18: LoadField: r4 = r1->field_b
    //     0x42ed18: ldur            x4, [x1, #0xb]
    // 0x42ed1c: stur            x4, [fp, #-0x20]
    // 0x42ed20: mul             x5, x4, x4
    // 0x42ed24: mov             x2, x5
    // 0x42ed28: stur            x5, [fp, #-0x18]
    // 0x42ed2c: r1 = <SkullType>
    //     0x42ed2c: add             x1, PP, #0x13, lsl #12  ; [pp+0x13718] TypeArguments: <SkullType>
    //     0x42ed30: ldr             x1, [x1, #0x718]
    // 0x42ed34: r0 = _GrowableList()
    //     0x42ed34: bl              #0x237730  ; [dart:core] _GrowableList::_GrowableList
    // 0x42ed38: stur            x0, [fp, #-8]
    // 0x42ed3c: r2 = 0
    //     0x42ed3c: mov             x2, #0
    // 0x42ed40: stur            x2, [fp, #-0x30]
    // 0x42ed44: CheckStackOverflow
    //     0x42ed44: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ed48: cmp             SP, x16
    //     0x42ed4c: b.ls            #0x42ee80
    // 0x42ed50: LoadField: r1 = r0->field_b
    //     0x42ed50: ldur            w1, [x0, #0xb]
    // 0x42ed54: r3 = LoadInt32Instr(r1)
    //     0x42ed54: sbfx            x3, x1, #1, #0x1f
    // 0x42ed58: cmp             x2, x3
    // 0x42ed5c: b.ge            #0x42edd0
    // 0x42ed60: ldur            x1, [fp, #-0x10]
    // 0x42ed64: r0 = random()
    //     0x42ed64: bl              #0x3d1f94  ; [package:ricochlime/flame/components/background/background_tile.dart] SkullType::random
    // 0x42ed68: mov             x2, x0
    // 0x42ed6c: ldur            x3, [fp, #-8]
    // 0x42ed70: LoadField: r0 = r3->field_b
    //     0x42ed70: ldur            w0, [x3, #0xb]
    // 0x42ed74: r1 = LoadInt32Instr(r0)
    //     0x42ed74: sbfx            x1, x0, #1, #0x1f
    // 0x42ed78: mov             x0, x1
    // 0x42ed7c: ldur            x1, [fp, #-0x30]
    // 0x42ed80: cmp             x1, x0
    // 0x42ed84: b.hs            #0x42ee88
    // 0x42ed88: LoadField: r1 = r3->field_f
    //     0x42ed88: ldur            w1, [x3, #0xf]
    // 0x42ed8c: DecompressPointer r1
    //     0x42ed8c: add             x1, x1, HEAP, lsl #32
    // 0x42ed90: mov             x0, x2
    // 0x42ed94: ldur            x2, [fp, #-0x30]
    // 0x42ed98: ArrayStore: r1[r2] = r0  ; List_4
    //     0x42ed98: add             x25, x1, x2, lsl #2
    //     0x42ed9c: add             x25, x25, #0xf
    //     0x42eda0: str             w0, [x25]
    //     0x42eda4: tbz             w0, #0, #0x42edc0
    //     0x42eda8: ldurb           w16, [x1, #-1]
    //     0x42edac: ldurb           w17, [x0, #-1]
    //     0x42edb0: and             x16, x17, x16, lsr #2
    //     0x42edb4: tst             x16, HEAP, lsr #32
    //     0x42edb8: b.eq            #0x42edc0
    //     0x42edbc: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42edc0: add             x0, x2, #1
    // 0x42edc4: mov             x2, x0
    // 0x42edc8: mov             x0, x3
    // 0x42edcc: b               #0x42ed40
    // 0x42edd0: ldur            x2, [fp, #-0x28]
    // 0x42edd4: ldur            x1, [fp, #-0x20]
    // 0x42edd8: mov             x3, x0
    // 0x42eddc: mov             x0, x3
    // 0x42ede0: StoreField: r2->field_13 = r0
    //     0x42ede0: stur            w0, [x2, #0x13]
    //     0x42ede4: ldurb           w16, [x2, #-1]
    //     0x42ede8: ldurb           w17, [x0, #-1]
    //     0x42edec: and             x16, x17, x16, lsr #2
    //     0x42edf0: tst             x16, HEAP, lsr #32
    //     0x42edf4: b.eq            #0x42edfc
    //     0x42edf8: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x42edfc: r0 = SliverGridDelegateWithFixedCrossAxisCount()
    //     0x42edfc: bl              #0x42efbc  ; AllocateSliverGridDelegateWithFixedCrossAxisCountStub -> SliverGridDelegateWithFixedCrossAxisCount (size=0x2c)
    // 0x42ee00: mov             x3, x0
    // 0x42ee04: ldur            x0, [fp, #-0x20]
    // 0x42ee08: stur            x3, [fp, #-8]
    // 0x42ee0c: StoreField: r3->field_7 = r0
    //     0x42ee0c: stur            x0, [x3, #7]
    // 0x42ee10: StoreField: r3->field_f = rZR
    //     0x42ee10: stur            xzr, [x3, #0xf]
    // 0x42ee14: ArrayStore: r3[0] = rZR  ; List_8
    //     0x42ee14: stur            xzr, [x3, #0x17]
    // 0x42ee18: d0 = 1.000000
    //     0x42ee18: fmov            d0, #1.00000000
    // 0x42ee1c: StoreField: r3->field_1f = d0
    //     0x42ee1c: stur            d0, [x3, #0x1f]
    // 0x42ee20: ldur            x2, [fp, #-0x28]
    // 0x42ee24: r1 = Function '<anonymous closure>':.
    //     0x42ee24: add             x1, PP, #0x13, lsl #12  ; [pp+0x13720] AnonymousClosure: (0x42efc8), in [package:ricochlime/pages/tutorial.dart] _SkullsGraphic::build (0x42ecc4)
    //     0x42ee28: ldr             x1, [x1, #0x720]
    // 0x42ee2c: r0 = AllocateClosure()
    //     0x42ee2c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42ee30: stur            x0, [fp, #-0x10]
    // 0x42ee34: r0 = GridView()
    //     0x42ee34: bl              #0x42efb0  ; AllocateGridViewStub -> GridView (size=0x64)
    // 0x42ee38: mov             x1, x0
    // 0x42ee3c: ldur            x2, [fp, #-8]
    // 0x42ee40: ldur            x3, [fp, #-0x10]
    // 0x42ee44: ldur            x5, [fp, #-0x18]
    // 0x42ee48: stur            x0, [fp, #-8]
    // 0x42ee4c: r0 = GridView.builder()
    //     0x42ee4c: bl              #0x42ee8c  ; [package:flutter/src/widgets/scroll_view.dart] GridView::GridView.builder
    // 0x42ee50: r0 = SizedBox()
    //     0x42ee50: bl              #0x363c60  ; AllocateSizedBoxStub -> SizedBox (size=0x18)
    // 0x42ee54: r1 = 100.000000
    //     0x42ee54: add             x1, PP, #0x13, lsl #12  ; [pp+0x13728] 100
    //     0x42ee58: ldr             x1, [x1, #0x728]
    // 0x42ee5c: StoreField: r0->field_f = r1
    //     0x42ee5c: stur            w1, [x0, #0xf]
    // 0x42ee60: StoreField: r0->field_13 = r1
    //     0x42ee60: stur            w1, [x0, #0x13]
    // 0x42ee64: ldur            x1, [fp, #-8]
    // 0x42ee68: StoreField: r0->field_b = r1
    //     0x42ee68: stur            w1, [x0, #0xb]
    // 0x42ee6c: LeaveFrame
    //     0x42ee6c: mov             SP, fp
    //     0x42ee70: ldp             fp, lr, [SP], #0x10
    // 0x42ee74: ret
    //     0x42ee74: ret             
    // 0x42ee78: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42ee78: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42ee7c: b               #0x42ece4
    // 0x42ee80: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42ee80: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42ee84: b               #0x42ed50
    // 0x42ee88: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x42ee88: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] SkullsWidget <anonymous closure>(dynamic, BuildContext, int) {
    // ** addr: 0x42efc8, size: 0x7c
    // 0x42efc8: EnterFrame
    //     0x42efc8: stp             fp, lr, [SP, #-0x10]!
    //     0x42efcc: mov             fp, SP
    // 0x42efd0: AllocStack(0x8)
    //     0x42efd0: sub             SP, SP, #8
    // 0x42efd4: SetupParameters([dynamic _ /* r0 */])
    //     0x42efd4: ldr             x0, [fp, #0x20]
    //     0x42efd8: ldur            w1, [x0, #0x17]
    //     0x42efdc: add             x1, x1, HEAP, lsl #32
    // 0x42efe0: LoadField: r2 = r1->field_13
    //     0x42efe0: ldur            w2, [x1, #0x13]
    // 0x42efe4: DecompressPointer r2
    //     0x42efe4: add             x2, x2, HEAP, lsl #32
    // 0x42efe8: LoadField: r0 = r2->field_b
    //     0x42efe8: ldur            w0, [x2, #0xb]
    // 0x42efec: ldr             x1, [fp, #0x10]
    // 0x42eff0: r3 = LoadInt32Instr(r1)
    //     0x42eff0: sbfx            x3, x1, #1, #0x1f
    //     0x42eff4: tbz             w1, #0, #0x42effc
    //     0x42eff8: ldur            x3, [x1, #7]
    // 0x42effc: r1 = LoadInt32Instr(r0)
    //     0x42effc: sbfx            x1, x0, #1, #0x1f
    // 0x42f000: mov             x0, x1
    // 0x42f004: mov             x1, x3
    // 0x42f008: cmp             x1, x0
    // 0x42f00c: b.hs            #0x42f040
    // 0x42f010: LoadField: r0 = r2->field_f
    //     0x42f010: ldur            w0, [x2, #0xf]
    // 0x42f014: DecompressPointer r0
    //     0x42f014: add             x0, x0, HEAP, lsl #32
    // 0x42f018: ArrayLoad: r1 = r0[r3]  ; Unknown_4
    //     0x42f018: add             x16, x0, x3, lsl #2
    //     0x42f01c: ldur            w1, [x16, #0xf]
    // 0x42f020: DecompressPointer r1
    //     0x42f020: add             x1, x1, HEAP, lsl #32
    // 0x42f024: stur            x1, [fp, #-8]
    // 0x42f028: r0 = SkullsWidget()
    //     0x42f028: bl              #0x42f044  ; AllocateSkullsWidgetStub -> SkullsWidget (size=0x10)
    // 0x42f02c: ldur            x1, [fp, #-8]
    // 0x42f030: StoreField: r0->field_b = r1
    //     0x42f030: stur            w1, [x0, #0xb]
    // 0x42f034: LeaveFrame
    //     0x42f034: mov             SP, fp
    //     0x42f038: ldp             fp, lr, [SP], #0x10
    // 0x42f03c: ret
    //     0x42f03c: ret             
    // 0x42f040: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x42f040: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
}

// class id: 2761, size: 0xc, field offset: 0xc
//   const constructor, 
class _BounceOffWallsGraphic extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x42ec14, size: 0xa4
    // 0x42ec14: EnterFrame
    //     0x42ec14: stp             fp, lr, [SP, #-0x10]!
    //     0x42ec18: mov             fp, SP
    // 0x42ec1c: AllocStack(0x10)
    //     0x42ec1c: sub             SP, SP, #0x10
    // 0x42ec20: SetupParameters(_BounceOffWallsGraphic this /* r1 => r0 */, dynamic _ /* r2 => r1 */)
    //     0x42ec20: mov             x0, x1
    //     0x42ec24: mov             x1, x2
    // 0x42ec28: CheckStackOverflow
    //     0x42ec28: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ec2c: cmp             SP, x16
    //     0x42ec30: b.ls            #0x42ecb0
    // 0x42ec34: r0 = of()
    //     0x42ec34: bl              #0x31bb3c  ; [package:flutter/src/material/theme.dart] Theme::of
    // 0x42ec38: LoadField: r1 = r0->field_3f
    //     0x42ec38: ldur            w1, [x0, #0x3f]
    // 0x42ec3c: DecompressPointer r1
    //     0x42ec3c: add             x1, x1, HEAP, lsl #32
    // 0x42ec40: LoadField: r0 = r1->field_7
    //     0x42ec40: ldur            w0, [x1, #7]
    // 0x42ec44: DecompressPointer r0
    //     0x42ec44: add             x0, x0, HEAP, lsl #32
    // 0x42ec48: r16 = Instance_Brightness
    //     0x42ec48: ldr             x16, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x42ec4c: cmp             w0, w16
    // 0x42ec50: b.ne            #0x42ec60
    // 0x42ec54: r0 = Instance_Color
    //     0x42ec54: add             x0, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x42ec58: ldr             x0, [x0, #0x710]
    // 0x42ec5c: b               #0x42ec68
    // 0x42ec60: r0 = Instance_Color
    //     0x42ec60: add             x0, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x42ec64: ldr             x0, [x0, #0x140]
    // 0x42ec68: stur            x0, [fp, #-8]
    // 0x42ec6c: r0 = _BounceOffWallsGraphicPainter()
    //     0x42ec6c: bl              #0x42ecb8  ; Allocate_BounceOffWallsGraphicPainterStub -> _BounceOffWallsGraphicPainter (size=0x10)
    // 0x42ec70: mov             x1, x0
    // 0x42ec74: ldur            x0, [fp, #-8]
    // 0x42ec78: stur            x1, [fp, #-0x10]
    // 0x42ec7c: StoreField: r1->field_b = r0
    //     0x42ec7c: stur            w0, [x1, #0xb]
    // 0x42ec80: r0 = CustomPaint()
    //     0x42ec80: bl              #0x35cd60  ; AllocateCustomPaintStub -> CustomPaint (size=0x24)
    // 0x42ec84: ldur            x1, [fp, #-0x10]
    // 0x42ec88: StoreField: r0->field_f = r1
    //     0x42ec88: stur            w1, [x0, #0xf]
    // 0x42ec8c: r1 = Instance_Size
    //     0x42ec8c: add             x1, PP, #0x13, lsl #12  ; [pp+0x13710] Obj!Size@5d01c1
    //     0x42ec90: ldr             x1, [x1, #0x710]
    // 0x42ec94: ArrayStore: r0[0] = r1  ; List_4
    //     0x42ec94: stur            w1, [x0, #0x17]
    // 0x42ec98: r1 = false
    //     0x42ec98: add             x1, NULL, #0x30  ; false
    // 0x42ec9c: StoreField: r0->field_1b = r1
    //     0x42ec9c: stur            w1, [x0, #0x1b]
    // 0x42eca0: StoreField: r0->field_1f = r1
    //     0x42eca0: stur            w1, [x0, #0x1f]
    // 0x42eca4: LeaveFrame
    //     0x42eca4: mov             SP, fp
    //     0x42eca8: ldp             fp, lr, [SP], #0x10
    // 0x42ecac: ret
    //     0x42ecac: ret             
    // 0x42ecb0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42ecb0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42ecb4: b               #0x42ec34
  }
}

// class id: 2762, size: 0x10, field offset: 0xc
//   const constructor, 
class _TutorialGraphic extends StatelessWidget {

  FittedBox field_c;

  _ build(/* No info */) {
    // ** addr: 0x42eb74, size: 0xa0
    // 0x42eb74: EnterFrame
    //     0x42eb74: stp             fp, lr, [SP, #-0x10]!
    //     0x42eb78: mov             fp, SP
    // 0x42eb7c: AllocStack(0x8)
    //     0x42eb7c: sub             SP, SP, #8
    // 0x42eb80: SetupParameters(_TutorialGraphic this /* r1 => r0 */, dynamic _ /* r2 => r1 */)
    //     0x42eb80: mov             x0, x1
    //     0x42eb84: mov             x1, x2
    // 0x42eb88: CheckStackOverflow
    //     0x42eb88: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42eb8c: cmp             SP, x16
    //     0x42eb90: b.ls            #0x42ec0c
    // 0x42eb94: r0 = of()
    //     0x42eb94: bl              #0x31bb3c  ; [package:flutter/src/material/theme.dart] Theme::of
    // 0x42eb98: LoadField: r1 = r0->field_3f
    //     0x42eb98: ldur            w1, [x0, #0x3f]
    // 0x42eb9c: DecompressPointer r1
    //     0x42eb9c: add             x1, x1, HEAP, lsl #32
    // 0x42eba0: LoadField: r0 = r1->field_7
    //     0x42eba0: ldur            w0, [x1, #7]
    // 0x42eba4: DecompressPointer r0
    //     0x42eba4: add             x0, x0, HEAP, lsl #32
    // 0x42eba8: r16 = Instance_Brightness
    //     0x42eba8: ldr             x16, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x42ebac: cmp             w0, w16
    // 0x42ebb0: b.ne            #0x42ebc0
    // 0x42ebb4: r0 = Instance_Color
    //     0x42ebb4: add             x0, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x42ebb8: ldr             x0, [x0, #0x140]
    // 0x42ebbc: b               #0x42ebc8
    // 0x42ebc0: r0 = Instance_Color
    //     0x42ebc0: add             x0, PP, #9, lsl #12  ; [pp+0x9128] Obj!Color@5cfb51
    //     0x42ebc4: ldr             x0, [x0, #0x128]
    // 0x42ebc8: stur            x0, [fp, #-8]
    // 0x42ebcc: r0 = NesContainer()
    //     0x42ebcc: bl              #0x3803ac  ; AllocateNesContainerStub -> NesContainer (size=0x30)
    // 0x42ebd0: r1 = Instance_FittedBox
    //     0x42ebd0: add             x1, PP, #0x13, lsl #12  ; [pp+0x13738] Obj!FittedBox@5d8501
    //     0x42ebd4: ldr             x1, [x1, #0x738]
    // 0x42ebd8: StoreField: r0->field_f = r1
    //     0x42ebd8: stur            w1, [x0, #0xf]
    // 0x42ebdc: r1 = 100.000000
    //     0x42ebdc: add             x1, PP, #0x13, lsl #12  ; [pp+0x13728] 100
    //     0x42ebe0: ldr             x1, [x1, #0x728]
    // 0x42ebe4: StoreField: r0->field_13 = r1
    //     0x42ebe4: stur            w1, [x0, #0x13]
    // 0x42ebe8: ArrayStore: r0[0] = r1  ; List_4
    //     0x42ebe8: stur            w1, [x0, #0x17]
    // 0x42ebec: ldur            x1, [fp, #-8]
    // 0x42ebf0: StoreField: r0->field_1b = r1
    //     0x42ebf0: stur            w1, [x0, #0x1b]
    // 0x42ebf4: r1 = Instance_EdgeInsets
    //     0x42ebf4: add             x1, PP, #0xe, lsl #12  ; [pp+0xe3b8] Obj!EdgeInsets@5cbe91
    //     0x42ebf8: ldr             x1, [x1, #0x3b8]
    // 0x42ebfc: StoreField: r0->field_23 = r1
    //     0x42ebfc: stur            w1, [x0, #0x23]
    // 0x42ec00: LeaveFrame
    //     0x42ec00: mov             SP, fp
    //     0x42ec04: ldp             fp, lr, [SP], #0x10
    // 0x42ec08: ret
    //     0x42ec08: ret             
    // 0x42ec0c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42ec0c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42ec10: b               #0x42eb94
  }
}

// class id: 2763, size: 0xc, field offset: 0xc
//   const constructor, 
class TutorialPage extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x42d050, size: 0x183c
    // 0x42d050: EnterFrame
    //     0x42d050: stp             fp, lr, [SP, #-0x10]!
    //     0x42d054: mov             fp, SP
    // 0x42d058: AllocStack(0x40)
    //     0x42d058: sub             SP, SP, #0x40
    // 0x42d05c: SetupParameters(dynamic _ /* r2 => r2, fp-0x8 */)
    //     0x42d05c: stur            x2, [fp, #-8]
    // 0x42d060: CheckStackOverflow
    //     0x42d060: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42d064: cmp             SP, x16
    //     0x42d068: b.ls            #0x42e884
    // 0x42d06c: r1 = 1
    //     0x42d06c: mov             x1, #1
    // 0x42d070: r0 = AllocateContext()
    //     0x42d070: bl              #0x5834e8  ; AllocateContextStub
    // 0x42d074: mov             x1, x0
    // 0x42d078: ldur            x0, [fp, #-8]
    // 0x42d07c: stur            x1, [fp, #-0x10]
    // 0x42d080: StoreField: r1->field_f = r0
    //     0x42d080: stur            w0, [x1, #0xf]
    // 0x42d084: r0 = LoadStaticField(0x468)
    //     0x42d084: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42d088: ldr             x0, [x0, #0x8d0]
    // 0x42d08c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d090: cmp             w0, w16
    // 0x42d094: b.ne            #0x42d0a0
    // 0x42d098: r2 = instance
    //     0x42d098: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x42d09c: r0 = InitLateFinalStaticField()
    //     0x42d09c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42d0a0: stur            x0, [fp, #-8]
    // 0x42d0a4: r16 = <AppLocale, Translations>
    //     0x42d0a4: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42d0a8: stp             x0, x16, [SP]
    // 0x42d0ac: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42d0ac: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42d0b0: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42d0b0: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42d0b4: r1 = LoadClassIdInstr(r0)
    //     0x42d0b4: ldur            x1, [x0, #-1]
    //     0x42d0b8: ubfx            x1, x1, #0xc, #0x14
    // 0x42d0bc: cmp             x1, #0x8dd
    // 0x42d0c0: b.ne            #0x42d0ec
    // 0x42d0c4: mov             x1, x0
    // 0x42d0c8: LoadField: r0 = r1->field_23
    //     0x42d0c8: ldur            w0, [x1, #0x23]
    // 0x42d0cc: DecompressPointer r0
    //     0x42d0cc: add             x0, x0, HEAP, lsl #32
    // 0x42d0d0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d0d4: cmp             w0, w16
    // 0x42d0d8: b.ne            #0x42d0e8
    // 0x42d0dc: r2 = tutorialPage
    //     0x42d0dc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42d0e0: ldr             x2, [x2, #0xbe0]
    // 0x42d0e4: r0 = InitLateFinalInstanceField()
    //     0x42d0e4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d0e8: b               #0x42d170
    // 0x42d0ec: cmp             x1, #0x8df
    // 0x42d0f0: b.ne            #0x42d11c
    // 0x42d0f4: mov             x1, x0
    // 0x42d0f8: LoadField: r0 = r1->field_47
    //     0x42d0f8: ldur            w0, [x1, #0x47]
    // 0x42d0fc: DecompressPointer r0
    //     0x42d0fc: add             x0, x0, HEAP, lsl #32
    // 0x42d100: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d104: cmp             w0, w16
    // 0x42d108: b.ne            #0x42d118
    // 0x42d10c: r2 = tutorialPage
    //     0x42d10c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42d110: ldr             x2, [x2, #0xbe8]
    // 0x42d114: r0 = InitLateFinalInstanceField()
    //     0x42d114: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d118: b               #0x42d170
    // 0x42d11c: cmp             x1, #0x8e0
    // 0x42d120: b.ne            #0x42d14c
    // 0x42d124: mov             x1, x0
    // 0x42d128: LoadField: r0 = r1->field_47
    //     0x42d128: ldur            w0, [x1, #0x47]
    // 0x42d12c: DecompressPointer r0
    //     0x42d12c: add             x0, x0, HEAP, lsl #32
    // 0x42d130: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d134: cmp             w0, w16
    // 0x42d138: b.ne            #0x42d148
    // 0x42d13c: r2 = tutorialPage
    //     0x42d13c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42d140: ldr             x2, [x2, #0xbf0]
    // 0x42d144: r0 = InitLateFinalInstanceField()
    //     0x42d144: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d148: b               #0x42d170
    // 0x42d14c: mov             x1, x0
    // 0x42d150: LoadField: r0 = r1->field_47
    //     0x42d150: ldur            w0, [x1, #0x47]
    // 0x42d154: DecompressPointer r0
    //     0x42d154: add             x0, x0, HEAP, lsl #32
    // 0x42d158: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d15c: cmp             w0, w16
    // 0x42d160: b.ne            #0x42d170
    // 0x42d164: r2 = tutorialPage
    //     0x42d164: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42d168: ldr             x2, [x2, #0xbf8]
    // 0x42d16c: r0 = InitLateFinalInstanceField()
    //     0x42d16c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d170: r1 = LoadClassIdInstr(r0)
    //     0x42d170: ldur            x1, [x0, #-1]
    //     0x42d174: ubfx            x1, x1, #0xc, #0x14
    // 0x42d178: cmp             x1, #0xe8
    // 0x42d17c: b.ne            #0x42d18c
    // 0x42d180: r0 = "Tutorial"
    //     0x42d180: add             x0, PP, #0x11, lsl #12  ; [pp+0x11080] "Tutorial"
    //     0x42d184: ldr             x0, [x0, #0x80]
    // 0x42d188: b               #0x42d1bc
    // 0x42d18c: cmp             x1, #0xe9
    // 0x42d190: b.ne            #0x42d1a0
    // 0x42d194: r0 = "Как играть"
    //     0x42d194: add             x0, PP, #0x11, lsl #12  ; [pp+0x11088] "Как играть"
    //     0x42d198: ldr             x0, [x0, #0x88]
    // 0x42d19c: b               #0x42d1bc
    // 0x42d1a0: cmp             x1, #0xea
    // 0x42d1a4: b.ne            #0x42d1b4
    // 0x42d1a8: r0 = "Нұсқаулық"
    //     0x42d1a8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11090] "Нұсқаулық"
    //     0x42d1ac: ldr             x0, [x0, #0x90]
    // 0x42d1b0: b               #0x42d1bc
    // 0x42d1b4: r0 = "tutorial"
    //     0x42d1b4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11098] "tutorial"
    //     0x42d1b8: ldr             x0, [x0, #0x98]
    // 0x42d1bc: stur            x0, [fp, #-0x18]
    // 0x42d1c0: r0 = Text()
    //     0x42d1c0: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42d1c4: mov             x1, x0
    // 0x42d1c8: ldur            x0, [fp, #-0x18]
    // 0x42d1cc: stur            x1, [fp, #-0x20]
    // 0x42d1d0: StoreField: r1->field_b = r0
    //     0x42d1d0: stur            w0, [x1, #0xb]
    // 0x42d1d4: r0 = LoadStaticField(0xc74)
    //     0x42d1d4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42d1d8: ldr             x0, [x0, #0x18e8]
    // 0x42d1dc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d1e0: cmp             w0, w16
    // 0x42d1e4: b.ne            #0x42d1f4
    // 0x42d1e8: r2 = NesIcons
    //     0x42d1e8: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x42d1ec: ldr             x2, [x2, #0xf70]
    // 0x42d1f0: r0 = InitLateFinalStaticField()
    //     0x42d1f0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42d1f4: mov             x1, x0
    // 0x42d1f8: stur            x0, [fp, #-0x18]
    // 0x42d1fc: LoadField: r0 = r1->field_f
    //     0x42d1fc: ldur            w0, [x1, #0xf]
    // 0x42d200: DecompressPointer r0
    //     0x42d200: add             x0, x0, HEAP, lsl #32
    // 0x42d204: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d208: cmp             w0, w16
    // 0x42d20c: b.ne            #0x42d21c
    // 0x42d210: r2 = leftArrowIndicator
    //     0x42d210: add             x2, PP, #0x11, lsl #12  ; [pp+0x11368] Field <NesIconCollection.leftArrowIndicator>: late final (offset: 0x10)
    //     0x42d214: ldr             x2, [x2, #0x368]
    // 0x42d218: r0 = InitLateFinalInstanceField()
    //     0x42d218: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d21c: stur            x0, [fp, #-0x28]
    // 0x42d220: r0 = NesIconButton()
    //     0x42d220: bl              #0x37162c  ; AllocateNesIconButtonStub -> NesIconButton (size=0x3c)
    // 0x42d224: mov             x3, x0
    // 0x42d228: ldur            x0, [fp, #-0x28]
    // 0x42d22c: stur            x3, [fp, #-0x30]
    // 0x42d230: StoreField: r3->field_b = r0
    //     0x42d230: stur            w0, [x3, #0xb]
    // 0x42d234: ldur            x2, [fp, #-0x10]
    // 0x42d238: r1 = Function '<anonymous closure>':.
    //     0x42d238: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c00] AnonymousClosure: (0x380094), in [package:nes_ui/src/widgets/dialogs/nes_dialog.dart] NesDialog::build (0x3fdcd8)
    //     0x42d23c: ldr             x1, [x1, #0xc00]
    // 0x42d240: r0 = AllocateClosure()
    //     0x42d240: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42d244: mov             x1, x0
    // 0x42d248: ldur            x0, [fp, #-0x30]
    // 0x42d24c: StoreField: r0->field_f = r1
    //     0x42d24c: stur            w1, [x0, #0xf]
    // 0x42d250: r1 = Instance_Size
    //     0x42d250: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c08] Obj!Size@5d0181
    //     0x42d254: ldr             x1, [x1, #0xc08]
    // 0x42d258: StoreField: r0->field_2f = r1
    //     0x42d258: stur            w1, [x0, #0x2f]
    // 0x42d25c: r0 = Center()
    //     0x42d25c: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x42d260: mov             x1, x0
    // 0x42d264: r0 = Instance_Alignment
    //     0x42d264: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x42d268: ldr             x0, [x0, #0xb18]
    // 0x42d26c: stur            x1, [fp, #-0x10]
    // 0x42d270: StoreField: r1->field_f = r0
    //     0x42d270: stur            w0, [x1, #0xf]
    // 0x42d274: ldur            x2, [fp, #-0x30]
    // 0x42d278: StoreField: r1->field_b = r2
    //     0x42d278: stur            w2, [x1, #0xb]
    // 0x42d27c: r0 = AppBar()
    //     0x42d27c: bl              #0x3715e4  ; AllocateAppBarStub -> AppBar (size=0x98)
    // 0x42d280: stur            x0, [fp, #-0x28]
    // 0x42d284: r16 = 56.000000
    //     0x42d284: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c10] 56
    //     0x42d288: ldr             x16, [x16, #0xc10]
    // 0x42d28c: ldur            lr, [fp, #-0x10]
    // 0x42d290: stp             lr, x16, [SP]
    // 0x42d294: mov             x1, x0
    // 0x42d298: ldur            x2, [fp, #-0x20]
    // 0x42d29c: r4 = const [0, 0x4, 0x2, 0x2, leading, 0x3, toolbarHeight, 0x2, null]
    //     0x42d29c: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c18] List(9) [0, 0x4, 0x2, 0x2, "leading", 0x3, "toolbarHeight", 0x2, Null]
    //     0x42d2a0: ldr             x4, [x4, #0xc18]
    // 0x42d2a4: r0 = AppBar()
    //     0x42d2a4: bl              #0x370e34  ; [package:flutter/src/material/app_bar.dart] AppBar::AppBar
    // 0x42d2a8: r0 = LoadStaticField(0x860)
    //     0x42d2a8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42d2ac: ldr             x0, [x0, #0x10c0]
    // 0x42d2b0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d2b4: cmp             w0, w16
    // 0x42d2b8: b.ne            #0x42d2c8
    // 0x42d2bc: r2 = instance
    //     0x42d2bc: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x42d2c0: ldr             x2, [x2, #0x6f0]
    // 0x42d2c4: r0 = InitLateFinalStaticField()
    //     0x42d2c4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42d2c8: mov             x1, x0
    // 0x42d2cc: LoadField: r0 = r1->field_cf
    //     0x42d2cc: ldur            w0, [x1, #0xcf]
    // 0x42d2d0: DecompressPointer r0
    //     0x42d2d0: add             x0, x0, HEAP, lsl #32
    // 0x42d2d4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d2d8: cmp             w0, w16
    // 0x42d2dc: b.ne            #0x42d2ec
    // 0x42d2e0: r2 = pointAndClickEnabled
    //     0x42d2e0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11c20] Field <RicochlimeGame.pointAndClickEnabled>: late final (offset: 0xd0)
    //     0x42d2e4: ldr             x2, [x2, #0xc20]
    // 0x42d2e8: r0 = InitLateFinalInstanceField()
    //     0x42d2e8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d2ec: r16 = <AppLocale, Translations>
    //     0x42d2ec: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42d2f0: ldur            lr, [fp, #-8]
    // 0x42d2f4: stp             lr, x16, [SP]
    // 0x42d2f8: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42d2f8: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42d2fc: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42d2fc: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42d300: r1 = LoadClassIdInstr(r0)
    //     0x42d300: ldur            x1, [x0, #-1]
    //     0x42d304: ubfx            x1, x1, #0xc, #0x14
    // 0x42d308: cmp             x1, #0x8dd
    // 0x42d30c: b.ne            #0x42d338
    // 0x42d310: mov             x1, x0
    // 0x42d314: LoadField: r0 = r1->field_23
    //     0x42d314: ldur            w0, [x1, #0x23]
    // 0x42d318: DecompressPointer r0
    //     0x42d318: add             x0, x0, HEAP, lsl #32
    // 0x42d31c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d320: cmp             w0, w16
    // 0x42d324: b.ne            #0x42d334
    // 0x42d328: r2 = tutorialPage
    //     0x42d328: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42d32c: ldr             x2, [x2, #0xbe0]
    // 0x42d330: r0 = InitLateFinalInstanceField()
    //     0x42d330: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d334: b               #0x42d3bc
    // 0x42d338: cmp             x1, #0x8df
    // 0x42d33c: b.ne            #0x42d368
    // 0x42d340: mov             x1, x0
    // 0x42d344: LoadField: r0 = r1->field_47
    //     0x42d344: ldur            w0, [x1, #0x47]
    // 0x42d348: DecompressPointer r0
    //     0x42d348: add             x0, x0, HEAP, lsl #32
    // 0x42d34c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d350: cmp             w0, w16
    // 0x42d354: b.ne            #0x42d364
    // 0x42d358: r2 = tutorialPage
    //     0x42d358: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42d35c: ldr             x2, [x2, #0xbe8]
    // 0x42d360: r0 = InitLateFinalInstanceField()
    //     0x42d360: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d364: b               #0x42d3bc
    // 0x42d368: cmp             x1, #0x8e0
    // 0x42d36c: b.ne            #0x42d398
    // 0x42d370: mov             x1, x0
    // 0x42d374: LoadField: r0 = r1->field_47
    //     0x42d374: ldur            w0, [x1, #0x47]
    // 0x42d378: DecompressPointer r0
    //     0x42d378: add             x0, x0, HEAP, lsl #32
    // 0x42d37c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d380: cmp             w0, w16
    // 0x42d384: b.ne            #0x42d394
    // 0x42d388: r2 = tutorialPage
    //     0x42d388: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42d38c: ldr             x2, [x2, #0xbf0]
    // 0x42d390: r0 = InitLateFinalInstanceField()
    //     0x42d390: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d394: b               #0x42d3bc
    // 0x42d398: mov             x1, x0
    // 0x42d39c: LoadField: r0 = r1->field_47
    //     0x42d39c: ldur            w0, [x1, #0x47]
    // 0x42d3a0: DecompressPointer r0
    //     0x42d3a0: add             x0, x0, HEAP, lsl #32
    // 0x42d3a4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d3a8: cmp             w0, w16
    // 0x42d3ac: b.ne            #0x42d3bc
    // 0x42d3b0: r2 = tutorialPage
    //     0x42d3b0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42d3b4: ldr             x2, [x2, #0xbf8]
    // 0x42d3b8: r0 = InitLateFinalInstanceField()
    //     0x42d3b8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d3bc: r1 = LoadClassIdInstr(r0)
    //     0x42d3bc: ldur            x1, [x0, #-1]
    //     0x42d3c0: ubfx            x1, x1, #0xc, #0x14
    // 0x42d3c4: cmp             x1, #0xe8
    // 0x42d3c8: b.ne            #0x42d3d8
    // 0x42d3cc: r0 = "Defeat the monsters by dragging to aim and releasing to shoot."
    //     0x42d3cc: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c28] "Defeat the monsters by dragging to aim and releasing to shoot."
    //     0x42d3d0: ldr             x0, [x0, #0xc28]
    // 0x42d3d4: b               #0x42d408
    // 0x42d3d8: cmp             x1, #0xe9
    // 0x42d3dc: b.ne            #0x42d3ec
    // 0x42d3e0: r0 = "Defeat the monsters by dragging to aim and releasing to shoot."
    //     0x42d3e0: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c28] "Defeat the monsters by dragging to aim and releasing to shoot."
    //     0x42d3e4: ldr             x0, [x0, #0xc28]
    // 0x42d3e8: b               #0x42d408
    // 0x42d3ec: cmp             x1, #0xea
    // 0x42d3f0: b.ne            #0x42d400
    // 0x42d3f4: r0 = "Мақсатқа апару және ату үшін босату арқылы құбыжықтарды жеңіңіз."
    //     0x42d3f4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c30] "Мақсатқа апару және ату үшін босату арқылы құбыжықтарды жеңіңіз."
    //     0x42d3f8: ldr             x0, [x0, #0xc30]
    // 0x42d3fc: b               #0x42d408
    // 0x42d400: r0 = "Derrota a los monstruos arrastrándolos para apuntar y soltándolos para disparar."
    //     0x42d400: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c38] "Derrota a los monstruos arrastrándolos para apuntar y soltándolos para disparar."
    //     0x42d404: ldr             x0, [x0, #0xc38]
    // 0x42d408: stur            x0, [fp, #-0x10]
    // 0x42d40c: r0 = Text()
    //     0x42d40c: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42d410: mov             x2, x0
    // 0x42d414: ldur            x0, [fp, #-0x10]
    // 0x42d418: stur            x2, [fp, #-0x20]
    // 0x42d41c: StoreField: r2->field_b = r0
    //     0x42d41c: stur            w0, [x2, #0xb]
    // 0x42d420: r1 = <FlexParentData>
    //     0x42d420: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42d424: ldr             x1, [x1, #0xc40]
    // 0x42d428: r0 = Expanded()
    //     0x42d428: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42d42c: mov             x3, x0
    // 0x42d430: r0 = 1
    //     0x42d430: mov             x0, #1
    // 0x42d434: stur            x3, [fp, #-0x10]
    // 0x42d438: StoreField: r3->field_13 = r0
    //     0x42d438: stur            x0, [x3, #0x13]
    // 0x42d43c: r4 = Instance_FlexFit
    //     0x42d43c: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42d440: ldr             x4, [x4, #0xc48]
    // 0x42d444: StoreField: r3->field_1b = r4
    //     0x42d444: stur            w4, [x3, #0x1b]
    // 0x42d448: ldur            x1, [fp, #-0x20]
    // 0x42d44c: StoreField: r3->field_b = r1
    //     0x42d44c: stur            w1, [x3, #0xb]
    // 0x42d450: r1 = Null
    //     0x42d450: mov             x1, NULL
    // 0x42d454: r2 = 4
    //     0x42d454: mov             x2, #4
    // 0x42d458: r0 = AllocateArray()
    //     0x42d458: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42d45c: stur            x0, [fp, #-0x20]
    // 0x42d460: r16 = Instance_MonsterWidget
    //     0x42d460: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c50] Obj!MonsterWidget@5d7f61
    //     0x42d464: ldr             x16, [x16, #0xc50]
    // 0x42d468: StoreField: r0->field_f = r16
    //     0x42d468: stur            w16, [x0, #0xf]
    // 0x42d46c: ldur            x1, [fp, #-0x10]
    // 0x42d470: StoreField: r0->field_13 = r1
    //     0x42d470: stur            w1, [x0, #0x13]
    // 0x42d474: r1 = <Widget>
    //     0x42d474: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42d478: r0 = AllocateGrowableArray()
    //     0x42d478: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42d47c: mov             x1, x0
    // 0x42d480: ldur            x0, [fp, #-0x20]
    // 0x42d484: stur            x1, [fp, #-0x10]
    // 0x42d488: StoreField: r1->field_f = r0
    //     0x42d488: stur            w0, [x1, #0xf]
    // 0x42d48c: r2 = 4
    //     0x42d48c: mov             x2, #4
    // 0x42d490: StoreField: r1->field_b = r2
    //     0x42d490: stur            w2, [x1, #0xb]
    // 0x42d494: r0 = Row()
    //     0x42d494: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42d498: mov             x3, x0
    // 0x42d49c: r0 = Instance_Axis
    //     0x42d49c: ldr             x0, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42d4a0: stur            x3, [fp, #-0x20]
    // 0x42d4a4: StoreField: r3->field_f = r0
    //     0x42d4a4: stur            w0, [x3, #0xf]
    // 0x42d4a8: r4 = Instance_MainAxisAlignment
    //     0x42d4a8: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42d4ac: ldr             x4, [x4, #0xfb0]
    // 0x42d4b0: StoreField: r3->field_13 = r4
    //     0x42d4b0: stur            w4, [x3, #0x13]
    // 0x42d4b4: r5 = Instance_MainAxisSize
    //     0x42d4b4: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42d4b8: ldr             x5, [x5, #0xfb8]
    // 0x42d4bc: ArrayStore: r3[0] = r5  ; List_4
    //     0x42d4bc: stur            w5, [x3, #0x17]
    // 0x42d4c0: r6 = Instance_CrossAxisAlignment
    //     0x42d4c0: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42d4c4: ldr             x6, [x6, #0xfc0]
    // 0x42d4c8: StoreField: r3->field_1b = r6
    //     0x42d4c8: stur            w6, [x3, #0x1b]
    // 0x42d4cc: r7 = Instance_VerticalDirection
    //     0x42d4cc: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42d4d0: ldr             x7, [x7, #0xfc8]
    // 0x42d4d4: StoreField: r3->field_23 = r7
    //     0x42d4d4: stur            w7, [x3, #0x23]
    // 0x42d4d8: r8 = Instance_Clip
    //     0x42d4d8: add             x8, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42d4dc: ldr             x8, [x8, #0xfd0]
    // 0x42d4e0: StoreField: r3->field_2b = r8
    //     0x42d4e0: stur            w8, [x3, #0x2b]
    // 0x42d4e4: StoreField: r3->field_2f = rZR
    //     0x42d4e4: stur            xzr, [x3, #0x2f]
    // 0x42d4e8: ldur            x1, [fp, #-0x10]
    // 0x42d4ec: StoreField: r3->field_b = r1
    //     0x42d4ec: stur            w1, [x3, #0xb]
    // 0x42d4f0: r1 = <Widget>
    //     0x42d4f0: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42d4f4: r2 = 36
    //     0x42d4f4: mov             x2, #0x24
    // 0x42d4f8: r0 = AllocateArray()
    //     0x42d4f8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42d4fc: mov             x1, x0
    // 0x42d500: ldur            x0, [fp, #-0x20]
    // 0x42d504: stur            x1, [fp, #-0x10]
    // 0x42d508: StoreField: r1->field_f = r0
    //     0x42d508: stur            w0, [x1, #0xf]
    // 0x42d50c: r16 = Instance_SizedBox
    //     0x42d50c: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c58] Obj!SizedBox@5d8401
    //     0x42d510: ldr             x16, [x16, #0xc58]
    // 0x42d514: StoreField: r1->field_13 = r16
    //     0x42d514: stur            w16, [x1, #0x13]
    // 0x42d518: r16 = <AppLocale, Translations>
    //     0x42d518: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42d51c: ldur            lr, [fp, #-8]
    // 0x42d520: stp             lr, x16, [SP]
    // 0x42d524: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42d524: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42d528: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42d528: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42d52c: r1 = LoadClassIdInstr(r0)
    //     0x42d52c: ldur            x1, [x0, #-1]
    //     0x42d530: ubfx            x1, x1, #0xc, #0x14
    // 0x42d534: cmp             x1, #0x8dd
    // 0x42d538: b.ne            #0x42d564
    // 0x42d53c: mov             x1, x0
    // 0x42d540: LoadField: r0 = r1->field_23
    //     0x42d540: ldur            w0, [x1, #0x23]
    // 0x42d544: DecompressPointer r0
    //     0x42d544: add             x0, x0, HEAP, lsl #32
    // 0x42d548: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d54c: cmp             w0, w16
    // 0x42d550: b.ne            #0x42d560
    // 0x42d554: r2 = tutorialPage
    //     0x42d554: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42d558: ldr             x2, [x2, #0xbe0]
    // 0x42d55c: r0 = InitLateFinalInstanceField()
    //     0x42d55c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d560: b               #0x42d5e8
    // 0x42d564: cmp             x1, #0x8df
    // 0x42d568: b.ne            #0x42d594
    // 0x42d56c: mov             x1, x0
    // 0x42d570: LoadField: r0 = r1->field_47
    //     0x42d570: ldur            w0, [x1, #0x47]
    // 0x42d574: DecompressPointer r0
    //     0x42d574: add             x0, x0, HEAP, lsl #32
    // 0x42d578: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d57c: cmp             w0, w16
    // 0x42d580: b.ne            #0x42d590
    // 0x42d584: r2 = tutorialPage
    //     0x42d584: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42d588: ldr             x2, [x2, #0xbe8]
    // 0x42d58c: r0 = InitLateFinalInstanceField()
    //     0x42d58c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d590: b               #0x42d5e8
    // 0x42d594: cmp             x1, #0x8e0
    // 0x42d598: b.ne            #0x42d5c4
    // 0x42d59c: mov             x1, x0
    // 0x42d5a0: LoadField: r0 = r1->field_47
    //     0x42d5a0: ldur            w0, [x1, #0x47]
    // 0x42d5a4: DecompressPointer r0
    //     0x42d5a4: add             x0, x0, HEAP, lsl #32
    // 0x42d5a8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d5ac: cmp             w0, w16
    // 0x42d5b0: b.ne            #0x42d5c0
    // 0x42d5b4: r2 = tutorialPage
    //     0x42d5b4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42d5b8: ldr             x2, [x2, #0xbf0]
    // 0x42d5bc: r0 = InitLateFinalInstanceField()
    //     0x42d5bc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d5c0: b               #0x42d5e8
    // 0x42d5c4: mov             x1, x0
    // 0x42d5c8: LoadField: r0 = r1->field_47
    //     0x42d5c8: ldur            w0, [x1, #0x47]
    // 0x42d5cc: DecompressPointer r0
    //     0x42d5cc: add             x0, x0, HEAP, lsl #32
    // 0x42d5d0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d5d4: cmp             w0, w16
    // 0x42d5d8: b.ne            #0x42d5e8
    // 0x42d5dc: r2 = tutorialPage
    //     0x42d5dc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42d5e0: ldr             x2, [x2, #0xbf8]
    // 0x42d5e4: r0 = InitLateFinalInstanceField()
    //     0x42d5e4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d5e8: r1 = LoadClassIdInstr(r0)
    //     0x42d5e8: ldur            x1, [x0, #-1]
    //     0x42d5ec: ubfx            x1, x1, #0xc, #0x14
    // 0x42d5f0: cmp             x1, #0xe8
    // 0x42d5f4: b.ne            #0x42d604
    // 0x42d5f8: r0 = "After defeating a gold monster, you\'ll get a coin."
    //     0x42d5f8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c60] "After defeating a gold monster, you\'ll get a coin."
    //     0x42d5fc: ldr             x0, [x0, #0xc60]
    // 0x42d600: b               #0x42d634
    // 0x42d604: cmp             x1, #0xe9
    // 0x42d608: b.ne            #0x42d618
    // 0x42d60c: r0 = "Убив золотого монстра получаете монетку."
    //     0x42d60c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c68] "Убив золотого монстра получаете монетку."
    //     0x42d610: ldr             x0, [x0, #0xc68]
    // 0x42d614: b               #0x42d634
    // 0x42d618: cmp             x1, #0xea
    // 0x42d61c: b.ne            #0x42d62c
    // 0x42d620: r0 = "Алтын құбыжықты жеңгеннен кейін сіз тиын аласыз."
    //     0x42d620: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c70] "Алтын құбыжықты жеңгеннен кейін сіз тиын аласыз."
    //     0x42d624: ldr             x0, [x0, #0xc70]
    // 0x42d628: b               #0x42d634
    // 0x42d62c: r0 = "Después de derrotar a un monstruo dorado, obtendrás una moneda."
    //     0x42d62c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c78] "Después de derrotar a un monstruo dorado, obtendrás una moneda."
    //     0x42d630: ldr             x0, [x0, #0xc78]
    // 0x42d634: ldur            x1, [fp, #-0x10]
    // 0x42d638: stur            x0, [fp, #-0x20]
    // 0x42d63c: r0 = Text()
    //     0x42d63c: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42d640: mov             x2, x0
    // 0x42d644: ldur            x0, [fp, #-0x20]
    // 0x42d648: stur            x2, [fp, #-0x30]
    // 0x42d64c: StoreField: r2->field_b = r0
    //     0x42d64c: stur            w0, [x2, #0xb]
    // 0x42d650: r1 = <FlexParentData>
    //     0x42d650: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42d654: ldr             x1, [x1, #0xc40]
    // 0x42d658: r0 = Expanded()
    //     0x42d658: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42d65c: mov             x3, x0
    // 0x42d660: r0 = 1
    //     0x42d660: mov             x0, #1
    // 0x42d664: stur            x3, [fp, #-0x20]
    // 0x42d668: StoreField: r3->field_13 = r0
    //     0x42d668: stur            x0, [x3, #0x13]
    // 0x42d66c: r4 = Instance_FlexFit
    //     0x42d66c: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42d670: ldr             x4, [x4, #0xc48]
    // 0x42d674: StoreField: r3->field_1b = r4
    //     0x42d674: stur            w4, [x3, #0x1b]
    // 0x42d678: ldur            x1, [fp, #-0x30]
    // 0x42d67c: StoreField: r3->field_b = r1
    //     0x42d67c: stur            w1, [x3, #0xb]
    // 0x42d680: r1 = Null
    //     0x42d680: mov             x1, NULL
    // 0x42d684: r2 = 4
    //     0x42d684: mov             x2, #4
    // 0x42d688: r0 = AllocateArray()
    //     0x42d688: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42d68c: stur            x0, [fp, #-0x30]
    // 0x42d690: r16 = Instance_MonsterWidget
    //     0x42d690: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c80] Obj!MonsterWidget@5d7f51
    //     0x42d694: ldr             x16, [x16, #0xc80]
    // 0x42d698: StoreField: r0->field_f = r16
    //     0x42d698: stur            w16, [x0, #0xf]
    // 0x42d69c: ldur            x1, [fp, #-0x20]
    // 0x42d6a0: StoreField: r0->field_13 = r1
    //     0x42d6a0: stur            w1, [x0, #0x13]
    // 0x42d6a4: r1 = <Widget>
    //     0x42d6a4: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42d6a8: r0 = AllocateGrowableArray()
    //     0x42d6a8: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42d6ac: mov             x1, x0
    // 0x42d6b0: ldur            x0, [fp, #-0x30]
    // 0x42d6b4: stur            x1, [fp, #-0x20]
    // 0x42d6b8: StoreField: r1->field_f = r0
    //     0x42d6b8: stur            w0, [x1, #0xf]
    // 0x42d6bc: r2 = 4
    //     0x42d6bc: mov             x2, #4
    // 0x42d6c0: StoreField: r1->field_b = r2
    //     0x42d6c0: stur            w2, [x1, #0xb]
    // 0x42d6c4: r0 = Row()
    //     0x42d6c4: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42d6c8: r2 = Instance_Axis
    //     0x42d6c8: ldr             x2, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42d6cc: StoreField: r0->field_f = r2
    //     0x42d6cc: stur            w2, [x0, #0xf]
    // 0x42d6d0: r3 = Instance_MainAxisAlignment
    //     0x42d6d0: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42d6d4: ldr             x3, [x3, #0xfb0]
    // 0x42d6d8: StoreField: r0->field_13 = r3
    //     0x42d6d8: stur            w3, [x0, #0x13]
    // 0x42d6dc: r4 = Instance_MainAxisSize
    //     0x42d6dc: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42d6e0: ldr             x4, [x4, #0xfb8]
    // 0x42d6e4: ArrayStore: r0[0] = r4  ; List_4
    //     0x42d6e4: stur            w4, [x0, #0x17]
    // 0x42d6e8: r5 = Instance_CrossAxisAlignment
    //     0x42d6e8: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42d6ec: ldr             x5, [x5, #0xfc0]
    // 0x42d6f0: StoreField: r0->field_1b = r5
    //     0x42d6f0: stur            w5, [x0, #0x1b]
    // 0x42d6f4: r6 = Instance_VerticalDirection
    //     0x42d6f4: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42d6f8: ldr             x6, [x6, #0xfc8]
    // 0x42d6fc: StoreField: r0->field_23 = r6
    //     0x42d6fc: stur            w6, [x0, #0x23]
    // 0x42d700: r7 = Instance_Clip
    //     0x42d700: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42d704: ldr             x7, [x7, #0xfd0]
    // 0x42d708: StoreField: r0->field_2b = r7
    //     0x42d708: stur            w7, [x0, #0x2b]
    // 0x42d70c: StoreField: r0->field_2f = rZR
    //     0x42d70c: stur            xzr, [x0, #0x2f]
    // 0x42d710: ldur            x1, [fp, #-0x20]
    // 0x42d714: StoreField: r0->field_b = r1
    //     0x42d714: stur            w1, [x0, #0xb]
    // 0x42d718: ldur            x1, [fp, #-0x10]
    // 0x42d71c: ArrayStore: r1[2] = r0  ; List_4
    //     0x42d71c: add             x25, x1, #0x17
    //     0x42d720: str             w0, [x25]
    //     0x42d724: tbz             w0, #0, #0x42d740
    //     0x42d728: ldurb           w16, [x1, #-1]
    //     0x42d72c: ldurb           w17, [x0, #-1]
    //     0x42d730: and             x16, x17, x16, lsr #2
    //     0x42d734: tst             x16, HEAP, lsr #32
    //     0x42d738: b.eq            #0x42d740
    //     0x42d73c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42d740: ldur            x1, [fp, #-0x10]
    // 0x42d744: r16 = Instance_SizedBox
    //     0x42d744: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c58] Obj!SizedBox@5d8401
    //     0x42d748: ldr             x16, [x16, #0xc58]
    // 0x42d74c: StoreField: r1->field_1b = r16
    //     0x42d74c: stur            w16, [x1, #0x1b]
    // 0x42d750: r16 = <AppLocale, Translations>
    //     0x42d750: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42d754: ldur            lr, [fp, #-8]
    // 0x42d758: stp             lr, x16, [SP]
    // 0x42d75c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42d75c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42d760: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42d760: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42d764: r1 = LoadClassIdInstr(r0)
    //     0x42d764: ldur            x1, [x0, #-1]
    //     0x42d768: ubfx            x1, x1, #0xc, #0x14
    // 0x42d76c: cmp             x1, #0x8dd
    // 0x42d770: b.ne            #0x42d79c
    // 0x42d774: mov             x1, x0
    // 0x42d778: LoadField: r0 = r1->field_23
    //     0x42d778: ldur            w0, [x1, #0x23]
    // 0x42d77c: DecompressPointer r0
    //     0x42d77c: add             x0, x0, HEAP, lsl #32
    // 0x42d780: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d784: cmp             w0, w16
    // 0x42d788: b.ne            #0x42d798
    // 0x42d78c: r2 = tutorialPage
    //     0x42d78c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42d790: ldr             x2, [x2, #0xbe0]
    // 0x42d794: r0 = InitLateFinalInstanceField()
    //     0x42d794: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d798: b               #0x42d820
    // 0x42d79c: cmp             x1, #0x8df
    // 0x42d7a0: b.ne            #0x42d7cc
    // 0x42d7a4: mov             x1, x0
    // 0x42d7a8: LoadField: r0 = r1->field_47
    //     0x42d7a8: ldur            w0, [x1, #0x47]
    // 0x42d7ac: DecompressPointer r0
    //     0x42d7ac: add             x0, x0, HEAP, lsl #32
    // 0x42d7b0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d7b4: cmp             w0, w16
    // 0x42d7b8: b.ne            #0x42d7c8
    // 0x42d7bc: r2 = tutorialPage
    //     0x42d7bc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42d7c0: ldr             x2, [x2, #0xbe8]
    // 0x42d7c4: r0 = InitLateFinalInstanceField()
    //     0x42d7c4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d7c8: b               #0x42d820
    // 0x42d7cc: cmp             x1, #0x8e0
    // 0x42d7d0: b.ne            #0x42d7fc
    // 0x42d7d4: mov             x1, x0
    // 0x42d7d8: LoadField: r0 = r1->field_47
    //     0x42d7d8: ldur            w0, [x1, #0x47]
    // 0x42d7dc: DecompressPointer r0
    //     0x42d7dc: add             x0, x0, HEAP, lsl #32
    // 0x42d7e0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d7e4: cmp             w0, w16
    // 0x42d7e8: b.ne            #0x42d7f8
    // 0x42d7ec: r2 = tutorialPage
    //     0x42d7ec: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42d7f0: ldr             x2, [x2, #0xbf0]
    // 0x42d7f4: r0 = InitLateFinalInstanceField()
    //     0x42d7f4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d7f8: b               #0x42d820
    // 0x42d7fc: mov             x1, x0
    // 0x42d800: LoadField: r0 = r1->field_47
    //     0x42d800: ldur            w0, [x1, #0x47]
    // 0x42d804: DecompressPointer r0
    //     0x42d804: add             x0, x0, HEAP, lsl #32
    // 0x42d808: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d80c: cmp             w0, w16
    // 0x42d810: b.ne            #0x42d820
    // 0x42d814: r2 = tutorialPage
    //     0x42d814: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42d818: ldr             x2, [x2, #0xbf8]
    // 0x42d81c: r0 = InitLateFinalInstanceField()
    //     0x42d81c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d820: r1 = LoadClassIdInstr(r0)
    //     0x42d820: ldur            x1, [x0, #-1]
    //     0x42d824: ubfx            x1, x1, #0xc, #0x14
    // 0x42d828: cmp             x1, #0xe8
    // 0x42d82c: b.ne            #0x42d83c
    // 0x42d830: r0 = "After defeating a green monster, you\'ll get an extra bullet."
    //     0x42d830: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c88] "After defeating a green monster, you\'ll get an extra bullet."
    //     0x42d834: ldr             x0, [x0, #0xc88]
    // 0x42d838: b               #0x42d86c
    // 0x42d83c: cmp             x1, #0xe9
    // 0x42d840: b.ne            #0x42d850
    // 0x42d844: r0 = "Убив зелёного монстра получаете дополнительный мячик."
    //     0x42d844: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c90] "Убив зелёного монстра получаете дополнительный мячик."
    //     0x42d848: ldr             x0, [x0, #0xc90]
    // 0x42d84c: b               #0x42d86c
    // 0x42d850: cmp             x1, #0xea
    // 0x42d854: b.ne            #0x42d864
    // 0x42d858: r0 = "Жасыл құбыжықты жеңгеннен кейін сіз қосымша оқ аласыз."
    //     0x42d858: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c98] "Жасыл құбыжықты жеңгеннен кейін сіз қосымша оқ аласыз."
    //     0x42d85c: ldr             x0, [x0, #0xc98]
    // 0x42d860: b               #0x42d86c
    // 0x42d864: r0 = "Después de derrotar a un monstruo verde, recibirás una bala extra."
    //     0x42d864: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ca0] "Después de derrotar a un monstruo verde, recibirás una bala extra."
    //     0x42d868: ldr             x0, [x0, #0xca0]
    // 0x42d86c: ldur            x1, [fp, #-0x10]
    // 0x42d870: stur            x0, [fp, #-0x20]
    // 0x42d874: r0 = Text()
    //     0x42d874: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42d878: mov             x2, x0
    // 0x42d87c: ldur            x0, [fp, #-0x20]
    // 0x42d880: stur            x2, [fp, #-0x30]
    // 0x42d884: StoreField: r2->field_b = r0
    //     0x42d884: stur            w0, [x2, #0xb]
    // 0x42d888: r1 = <FlexParentData>
    //     0x42d888: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42d88c: ldr             x1, [x1, #0xc40]
    // 0x42d890: r0 = Expanded()
    //     0x42d890: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42d894: mov             x3, x0
    // 0x42d898: r0 = 1
    //     0x42d898: mov             x0, #1
    // 0x42d89c: stur            x3, [fp, #-0x20]
    // 0x42d8a0: StoreField: r3->field_13 = r0
    //     0x42d8a0: stur            x0, [x3, #0x13]
    // 0x42d8a4: r4 = Instance_FlexFit
    //     0x42d8a4: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42d8a8: ldr             x4, [x4, #0xc48]
    // 0x42d8ac: StoreField: r3->field_1b = r4
    //     0x42d8ac: stur            w4, [x3, #0x1b]
    // 0x42d8b0: ldur            x1, [fp, #-0x30]
    // 0x42d8b4: StoreField: r3->field_b = r1
    //     0x42d8b4: stur            w1, [x3, #0xb]
    // 0x42d8b8: r1 = Null
    //     0x42d8b8: mov             x1, NULL
    // 0x42d8bc: r2 = 4
    //     0x42d8bc: mov             x2, #4
    // 0x42d8c0: r0 = AllocateArray()
    //     0x42d8c0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42d8c4: stur            x0, [fp, #-0x30]
    // 0x42d8c8: r16 = Instance_MonsterWidget
    //     0x42d8c8: add             x16, PP, #0x11, lsl #12  ; [pp+0x11ca8] Obj!MonsterWidget@5d7f41
    //     0x42d8cc: ldr             x16, [x16, #0xca8]
    // 0x42d8d0: StoreField: r0->field_f = r16
    //     0x42d8d0: stur            w16, [x0, #0xf]
    // 0x42d8d4: ldur            x1, [fp, #-0x20]
    // 0x42d8d8: StoreField: r0->field_13 = r1
    //     0x42d8d8: stur            w1, [x0, #0x13]
    // 0x42d8dc: r1 = <Widget>
    //     0x42d8dc: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42d8e0: r0 = AllocateGrowableArray()
    //     0x42d8e0: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42d8e4: mov             x1, x0
    // 0x42d8e8: ldur            x0, [fp, #-0x30]
    // 0x42d8ec: stur            x1, [fp, #-0x20]
    // 0x42d8f0: StoreField: r1->field_f = r0
    //     0x42d8f0: stur            w0, [x1, #0xf]
    // 0x42d8f4: r0 = 4
    //     0x42d8f4: mov             x0, #4
    // 0x42d8f8: StoreField: r1->field_b = r0
    //     0x42d8f8: stur            w0, [x1, #0xb]
    // 0x42d8fc: r0 = Row()
    //     0x42d8fc: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42d900: r2 = Instance_Axis
    //     0x42d900: ldr             x2, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42d904: StoreField: r0->field_f = r2
    //     0x42d904: stur            w2, [x0, #0xf]
    // 0x42d908: r3 = Instance_MainAxisAlignment
    //     0x42d908: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42d90c: ldr             x3, [x3, #0xfb0]
    // 0x42d910: StoreField: r0->field_13 = r3
    //     0x42d910: stur            w3, [x0, #0x13]
    // 0x42d914: r4 = Instance_MainAxisSize
    //     0x42d914: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42d918: ldr             x4, [x4, #0xfb8]
    // 0x42d91c: ArrayStore: r0[0] = r4  ; List_4
    //     0x42d91c: stur            w4, [x0, #0x17]
    // 0x42d920: r5 = Instance_CrossAxisAlignment
    //     0x42d920: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42d924: ldr             x5, [x5, #0xfc0]
    // 0x42d928: StoreField: r0->field_1b = r5
    //     0x42d928: stur            w5, [x0, #0x1b]
    // 0x42d92c: r6 = Instance_VerticalDirection
    //     0x42d92c: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42d930: ldr             x6, [x6, #0xfc8]
    // 0x42d934: StoreField: r0->field_23 = r6
    //     0x42d934: stur            w6, [x0, #0x23]
    // 0x42d938: r7 = Instance_Clip
    //     0x42d938: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42d93c: ldr             x7, [x7, #0xfd0]
    // 0x42d940: StoreField: r0->field_2b = r7
    //     0x42d940: stur            w7, [x0, #0x2b]
    // 0x42d944: StoreField: r0->field_2f = rZR
    //     0x42d944: stur            xzr, [x0, #0x2f]
    // 0x42d948: ldur            x1, [fp, #-0x20]
    // 0x42d94c: StoreField: r0->field_b = r1
    //     0x42d94c: stur            w1, [x0, #0xb]
    // 0x42d950: ldur            x1, [fp, #-0x10]
    // 0x42d954: ArrayStore: r1[4] = r0  ; List_4
    //     0x42d954: add             x25, x1, #0x1f
    //     0x42d958: str             w0, [x25]
    //     0x42d95c: tbz             w0, #0, #0x42d978
    //     0x42d960: ldurb           w16, [x1, #-1]
    //     0x42d964: ldurb           w17, [x0, #-1]
    //     0x42d968: and             x16, x17, x16, lsr #2
    //     0x42d96c: tst             x16, HEAP, lsr #32
    //     0x42d970: b.eq            #0x42d978
    //     0x42d974: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42d978: ldur            x1, [fp, #-0x10]
    // 0x42d97c: r16 = Instance_SizedBox
    //     0x42d97c: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x42d980: ldr             x16, [x16, #0xfd8]
    // 0x42d984: StoreField: r1->field_23 = r16
    //     0x42d984: stur            w16, [x1, #0x23]
    // 0x42d988: r16 = <AppLocale, Translations>
    //     0x42d988: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42d98c: ldur            lr, [fp, #-8]
    // 0x42d990: stp             lr, x16, [SP]
    // 0x42d994: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42d994: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42d998: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42d998: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42d99c: r1 = LoadClassIdInstr(r0)
    //     0x42d99c: ldur            x1, [x0, #-1]
    //     0x42d9a0: ubfx            x1, x1, #0xc, #0x14
    // 0x42d9a4: cmp             x1, #0x8dd
    // 0x42d9a8: b.ne            #0x42d9d4
    // 0x42d9ac: mov             x1, x0
    // 0x42d9b0: LoadField: r0 = r1->field_23
    //     0x42d9b0: ldur            w0, [x1, #0x23]
    // 0x42d9b4: DecompressPointer r0
    //     0x42d9b4: add             x0, x0, HEAP, lsl #32
    // 0x42d9b8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d9bc: cmp             w0, w16
    // 0x42d9c0: b.ne            #0x42d9d0
    // 0x42d9c4: r2 = tutorialPage
    //     0x42d9c4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42d9c8: ldr             x2, [x2, #0xbe0]
    // 0x42d9cc: r0 = InitLateFinalInstanceField()
    //     0x42d9cc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42d9d0: b               #0x42da58
    // 0x42d9d4: cmp             x1, #0x8df
    // 0x42d9d8: b.ne            #0x42da04
    // 0x42d9dc: mov             x1, x0
    // 0x42d9e0: LoadField: r0 = r1->field_47
    //     0x42d9e0: ldur            w0, [x1, #0x47]
    // 0x42d9e4: DecompressPointer r0
    //     0x42d9e4: add             x0, x0, HEAP, lsl #32
    // 0x42d9e8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42d9ec: cmp             w0, w16
    // 0x42d9f0: b.ne            #0x42da00
    // 0x42d9f4: r2 = tutorialPage
    //     0x42d9f4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42d9f8: ldr             x2, [x2, #0xbe8]
    // 0x42d9fc: r0 = InitLateFinalInstanceField()
    //     0x42d9fc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42da00: b               #0x42da58
    // 0x42da04: cmp             x1, #0x8e0
    // 0x42da08: b.ne            #0x42da34
    // 0x42da0c: mov             x1, x0
    // 0x42da10: LoadField: r0 = r1->field_47
    //     0x42da10: ldur            w0, [x1, #0x47]
    // 0x42da14: DecompressPointer r0
    //     0x42da14: add             x0, x0, HEAP, lsl #32
    // 0x42da18: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42da1c: cmp             w0, w16
    // 0x42da20: b.ne            #0x42da30
    // 0x42da24: r2 = tutorialPage
    //     0x42da24: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42da28: ldr             x2, [x2, #0xbf0]
    // 0x42da2c: r0 = InitLateFinalInstanceField()
    //     0x42da2c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42da30: b               #0x42da58
    // 0x42da34: mov             x1, x0
    // 0x42da38: LoadField: r0 = r1->field_47
    //     0x42da38: ldur            w0, [x1, #0x47]
    // 0x42da3c: DecompressPointer r0
    //     0x42da3c: add             x0, x0, HEAP, lsl #32
    // 0x42da40: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42da44: cmp             w0, w16
    // 0x42da48: b.ne            #0x42da58
    // 0x42da4c: r2 = tutorialPage
    //     0x42da4c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42da50: ldr             x2, [x2, #0xbf8]
    // 0x42da54: r0 = InitLateFinalInstanceField()
    //     0x42da54: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42da58: r1 = LoadClassIdInstr(r0)
    //     0x42da58: ldur            x1, [x0, #-1]
    //     0x42da5c: ubfx            x1, x1, #0xc, #0x14
    // 0x42da60: cmp             x1, #0xe8
    // 0x42da64: b.ne            #0x42da74
    // 0x42da68: r0 = "Bounce your shots off the walls to hit the most monsters."
    //     0x42da68: add             x0, PP, #0x11, lsl #12  ; [pp+0x11cb0] "Bounce your shots off the walls to hit the most monsters."
    //     0x42da6c: ldr             x0, [x0, #0xcb0]
    // 0x42da70: b               #0x42daa4
    // 0x42da74: cmp             x1, #0xe9
    // 0x42da78: b.ne            #0x42da88
    // 0x42da7c: r0 = "Bounce your shots off the walls to hit the most monsters."
    //     0x42da7c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11cb0] "Bounce your shots off the walls to hit the most monsters."
    //     0x42da80: ldr             x0, [x0, #0xcb0]
    // 0x42da84: b               #0x42daa4
    // 0x42da88: cmp             x1, #0xea
    // 0x42da8c: b.ne            #0x42da9c
    // 0x42da90: r0 = "Қабырғадан ыршыған оқ көбірек шырышқа тие алады."
    //     0x42da90: add             x0, PP, #0x11, lsl #12  ; [pp+0x11cb8] "Қабырғадан ыршыған оқ көбірек шырышқа тие алады."
    //     0x42da94: ldr             x0, [x0, #0xcb8]
    // 0x42da98: b               #0x42daa4
    // 0x42da9c: r0 = "Rebota tus tiros en las paredes para golpear a la mayor cantidad de monstruos."
    //     0x42da9c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11cc0] "Rebota tus tiros en las paredes para golpear a la mayor cantidad de monstruos."
    //     0x42daa0: ldr             x0, [x0, #0xcc0]
    // 0x42daa4: ldur            x1, [fp, #-0x10]
    // 0x42daa8: stur            x0, [fp, #-0x20]
    // 0x42daac: r0 = Text()
    //     0x42daac: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42dab0: mov             x2, x0
    // 0x42dab4: ldur            x0, [fp, #-0x20]
    // 0x42dab8: stur            x2, [fp, #-0x30]
    // 0x42dabc: StoreField: r2->field_b = r0
    //     0x42dabc: stur            w0, [x2, #0xb]
    // 0x42dac0: r1 = <FlexParentData>
    //     0x42dac0: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42dac4: ldr             x1, [x1, #0xc40]
    // 0x42dac8: r0 = Expanded()
    //     0x42dac8: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42dacc: mov             x3, x0
    // 0x42dad0: r0 = 1
    //     0x42dad0: mov             x0, #1
    // 0x42dad4: stur            x3, [fp, #-0x20]
    // 0x42dad8: StoreField: r3->field_13 = r0
    //     0x42dad8: stur            x0, [x3, #0x13]
    // 0x42dadc: r4 = Instance_FlexFit
    //     0x42dadc: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42dae0: ldr             x4, [x4, #0xc48]
    // 0x42dae4: StoreField: r3->field_1b = r4
    //     0x42dae4: stur            w4, [x3, #0x1b]
    // 0x42dae8: ldur            x1, [fp, #-0x30]
    // 0x42daec: StoreField: r3->field_b = r1
    //     0x42daec: stur            w1, [x3, #0xb]
    // 0x42daf0: r1 = Null
    //     0x42daf0: mov             x1, NULL
    // 0x42daf4: r2 = 6
    //     0x42daf4: mov             x2, #6
    // 0x42daf8: r0 = AllocateArray()
    //     0x42daf8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42dafc: mov             x2, x0
    // 0x42db00: ldur            x0, [fp, #-0x20]
    // 0x42db04: stur            x2, [fp, #-0x30]
    // 0x42db08: StoreField: r2->field_f = r0
    //     0x42db08: stur            w0, [x2, #0xf]
    // 0x42db0c: r16 = Instance_SizedBox
    //     0x42db0c: add             x16, PP, #0x11, lsl #12  ; [pp+0x11cc8] Obj!SizedBox@5d8441
    //     0x42db10: ldr             x16, [x16, #0xcc8]
    // 0x42db14: StoreField: r2->field_13 = r16
    //     0x42db14: stur            w16, [x2, #0x13]
    // 0x42db18: r16 = Instance__BounceOffWallsGraphic
    //     0x42db18: add             x16, PP, #0x11, lsl #12  ; [pp+0x11cd0] Obj!_BounceOffWallsGraphic@5d7fb1
    //     0x42db1c: ldr             x16, [x16, #0xcd0]
    // 0x42db20: ArrayStore: r2[0] = r16  ; List_4
    //     0x42db20: stur            w16, [x2, #0x17]
    // 0x42db24: r1 = <Widget>
    //     0x42db24: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42db28: r0 = AllocateGrowableArray()
    //     0x42db28: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42db2c: mov             x1, x0
    // 0x42db30: ldur            x0, [fp, #-0x30]
    // 0x42db34: stur            x1, [fp, #-0x20]
    // 0x42db38: StoreField: r1->field_f = r0
    //     0x42db38: stur            w0, [x1, #0xf]
    // 0x42db3c: r2 = 6
    //     0x42db3c: mov             x2, #6
    // 0x42db40: StoreField: r1->field_b = r2
    //     0x42db40: stur            w2, [x1, #0xb]
    // 0x42db44: r0 = Row()
    //     0x42db44: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42db48: r2 = Instance_Axis
    //     0x42db48: ldr             x2, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42db4c: StoreField: r0->field_f = r2
    //     0x42db4c: stur            w2, [x0, #0xf]
    // 0x42db50: r3 = Instance_MainAxisAlignment
    //     0x42db50: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42db54: ldr             x3, [x3, #0xfb0]
    // 0x42db58: StoreField: r0->field_13 = r3
    //     0x42db58: stur            w3, [x0, #0x13]
    // 0x42db5c: r4 = Instance_MainAxisSize
    //     0x42db5c: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42db60: ldr             x4, [x4, #0xfb8]
    // 0x42db64: ArrayStore: r0[0] = r4  ; List_4
    //     0x42db64: stur            w4, [x0, #0x17]
    // 0x42db68: r5 = Instance_CrossAxisAlignment
    //     0x42db68: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42db6c: ldr             x5, [x5, #0xfc0]
    // 0x42db70: StoreField: r0->field_1b = r5
    //     0x42db70: stur            w5, [x0, #0x1b]
    // 0x42db74: r6 = Instance_VerticalDirection
    //     0x42db74: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42db78: ldr             x6, [x6, #0xfc8]
    // 0x42db7c: StoreField: r0->field_23 = r6
    //     0x42db7c: stur            w6, [x0, #0x23]
    // 0x42db80: r7 = Instance_Clip
    //     0x42db80: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42db84: ldr             x7, [x7, #0xfd0]
    // 0x42db88: StoreField: r0->field_2b = r7
    //     0x42db88: stur            w7, [x0, #0x2b]
    // 0x42db8c: StoreField: r0->field_2f = rZR
    //     0x42db8c: stur            xzr, [x0, #0x2f]
    // 0x42db90: ldur            x1, [fp, #-0x20]
    // 0x42db94: StoreField: r0->field_b = r1
    //     0x42db94: stur            w1, [x0, #0xb]
    // 0x42db98: ldur            x1, [fp, #-0x10]
    // 0x42db9c: ArrayStore: r1[6] = r0  ; List_4
    //     0x42db9c: add             x25, x1, #0x27
    //     0x42dba0: str             w0, [x25]
    //     0x42dba4: tbz             w0, #0, #0x42dbc0
    //     0x42dba8: ldurb           w16, [x1, #-1]
    //     0x42dbac: ldurb           w17, [x0, #-1]
    //     0x42dbb0: and             x16, x17, x16, lsr #2
    //     0x42dbb4: tst             x16, HEAP, lsr #32
    //     0x42dbb8: b.eq            #0x42dbc0
    //     0x42dbbc: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42dbc0: ldur            x1, [fp, #-0x10]
    // 0x42dbc4: r16 = Instance_SizedBox
    //     0x42dbc4: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c58] Obj!SizedBox@5d8401
    //     0x42dbc8: ldr             x16, [x16, #0xc58]
    // 0x42dbcc: StoreField: r1->field_2b = r16
    //     0x42dbcc: stur            w16, [x1, #0x2b]
    // 0x42dbd0: r16 = <AppLocale, Translations>
    //     0x42dbd0: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42dbd4: ldur            lr, [fp, #-8]
    // 0x42dbd8: stp             lr, x16, [SP]
    // 0x42dbdc: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42dbdc: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42dbe0: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42dbe0: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42dbe4: r1 = LoadClassIdInstr(r0)
    //     0x42dbe4: ldur            x1, [x0, #-1]
    //     0x42dbe8: ubfx            x1, x1, #0xc, #0x14
    // 0x42dbec: cmp             x1, #0x8dd
    // 0x42dbf0: b.ne            #0x42dc1c
    // 0x42dbf4: mov             x1, x0
    // 0x42dbf8: LoadField: r0 = r1->field_23
    //     0x42dbf8: ldur            w0, [x1, #0x23]
    // 0x42dbfc: DecompressPointer r0
    //     0x42dbfc: add             x0, x0, HEAP, lsl #32
    // 0x42dc00: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42dc04: cmp             w0, w16
    // 0x42dc08: b.ne            #0x42dc18
    // 0x42dc0c: r2 = tutorialPage
    //     0x42dc0c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42dc10: ldr             x2, [x2, #0xbe0]
    // 0x42dc14: r0 = InitLateFinalInstanceField()
    //     0x42dc14: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42dc18: b               #0x42dca0
    // 0x42dc1c: cmp             x1, #0x8df
    // 0x42dc20: b.ne            #0x42dc4c
    // 0x42dc24: mov             x1, x0
    // 0x42dc28: LoadField: r0 = r1->field_47
    //     0x42dc28: ldur            w0, [x1, #0x47]
    // 0x42dc2c: DecompressPointer r0
    //     0x42dc2c: add             x0, x0, HEAP, lsl #32
    // 0x42dc30: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42dc34: cmp             w0, w16
    // 0x42dc38: b.ne            #0x42dc48
    // 0x42dc3c: r2 = tutorialPage
    //     0x42dc3c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42dc40: ldr             x2, [x2, #0xbe8]
    // 0x42dc44: r0 = InitLateFinalInstanceField()
    //     0x42dc44: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42dc48: b               #0x42dca0
    // 0x42dc4c: cmp             x1, #0x8e0
    // 0x42dc50: b.ne            #0x42dc7c
    // 0x42dc54: mov             x1, x0
    // 0x42dc58: LoadField: r0 = r1->field_47
    //     0x42dc58: ldur            w0, [x1, #0x47]
    // 0x42dc5c: DecompressPointer r0
    //     0x42dc5c: add             x0, x0, HEAP, lsl #32
    // 0x42dc60: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42dc64: cmp             w0, w16
    // 0x42dc68: b.ne            #0x42dc78
    // 0x42dc6c: r2 = tutorialPage
    //     0x42dc6c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42dc70: ldr             x2, [x2, #0xbf0]
    // 0x42dc74: r0 = InitLateFinalInstanceField()
    //     0x42dc74: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42dc78: b               #0x42dca0
    // 0x42dc7c: mov             x1, x0
    // 0x42dc80: LoadField: r0 = r1->field_47
    //     0x42dc80: ldur            w0, [x1, #0x47]
    // 0x42dc84: DecompressPointer r0
    //     0x42dc84: add             x0, x0, HEAP, lsl #32
    // 0x42dc88: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42dc8c: cmp             w0, w16
    // 0x42dc90: b.ne            #0x42dca0
    // 0x42dc94: r2 = tutorialPage
    //     0x42dc94: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42dc98: ldr             x2, [x2, #0xbf8]
    // 0x42dc9c: r0 = InitLateFinalInstanceField()
    //     0x42dc9c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42dca0: r1 = LoadClassIdInstr(r0)
    //     0x42dca0: ldur            x1, [x0, #-1]
    //     0x42dca4: ubfx            x1, x1, #0xc, #0x14
    // 0x42dca8: cmp             x1, #0xe8
    // 0x42dcac: b.ne            #0x42dcbc
    // 0x42dcb0: r0 = "Tap the screen to speed up your shots."
    //     0x42dcb0: add             x0, PP, #0x11, lsl #12  ; [pp+0x11cd8] "Tap the screen to speed up your shots."
    //     0x42dcb4: ldr             x0, [x0, #0xcd8]
    // 0x42dcb8: b               #0x42dcec
    // 0x42dcbc: cmp             x1, #0xe9
    // 0x42dcc0: b.ne            #0x42dcd0
    // 0x42dcc4: r0 = "Прикоснитесь к экрану чтобы ускорить ваш выстрел."
    //     0x42dcc4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ce0] "Прикоснитесь к экрану чтобы ускорить ваш выстрел."
    //     0x42dcc8: ldr             x0, [x0, #0xce0]
    // 0x42dccc: b               #0x42dcec
    // 0x42dcd0: cmp             x1, #0xea
    // 0x42dcd4: b.ne            #0x42dce4
    // 0x42dcd8: r0 = "Оқ қозғалысын тездету үшін экранды түртіңіз."
    //     0x42dcd8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ce8] "Оқ қозғалысын тездету үшін экранды түртіңіз."
    //     0x42dcdc: ldr             x0, [x0, #0xce8]
    // 0x42dce0: b               #0x42dcec
    // 0x42dce4: r0 = "Toca la pantalla para acelerar tus disparos."
    //     0x42dce4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11cf0] "Toca la pantalla para acelerar tus disparos."
    //     0x42dce8: ldr             x0, [x0, #0xcf0]
    // 0x42dcec: ldur            x1, [fp, #-0x10]
    // 0x42dcf0: stur            x0, [fp, #-0x20]
    // 0x42dcf4: r0 = Text()
    //     0x42dcf4: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42dcf8: mov             x2, x0
    // 0x42dcfc: ldur            x0, [fp, #-0x20]
    // 0x42dd00: stur            x2, [fp, #-0x30]
    // 0x42dd04: StoreField: r2->field_b = r0
    //     0x42dd04: stur            w0, [x2, #0xb]
    // 0x42dd08: r1 = <FlexParentData>
    //     0x42dd08: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42dd0c: ldr             x1, [x1, #0xc40]
    // 0x42dd10: r0 = Expanded()
    //     0x42dd10: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42dd14: mov             x3, x0
    // 0x42dd18: r0 = 1
    //     0x42dd18: mov             x0, #1
    // 0x42dd1c: stur            x3, [fp, #-0x20]
    // 0x42dd20: StoreField: r3->field_13 = r0
    //     0x42dd20: stur            x0, [x3, #0x13]
    // 0x42dd24: r4 = Instance_FlexFit
    //     0x42dd24: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42dd28: ldr             x4, [x4, #0xc48]
    // 0x42dd2c: StoreField: r3->field_1b = r4
    //     0x42dd2c: stur            w4, [x3, #0x1b]
    // 0x42dd30: ldur            x1, [fp, #-0x30]
    // 0x42dd34: StoreField: r3->field_b = r1
    //     0x42dd34: stur            w1, [x3, #0xb]
    // 0x42dd38: r1 = Null
    //     0x42dd38: mov             x1, NULL
    // 0x42dd3c: r2 = 6
    //     0x42dd3c: mov             x2, #6
    // 0x42dd40: r0 = AllocateArray()
    //     0x42dd40: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42dd44: mov             x2, x0
    // 0x42dd48: ldur            x0, [fp, #-0x20]
    // 0x42dd4c: stur            x2, [fp, #-0x30]
    // 0x42dd50: StoreField: r2->field_f = r0
    //     0x42dd50: stur            w0, [x2, #0xf]
    // 0x42dd54: r16 = Instance_SizedBox
    //     0x42dd54: add             x16, PP, #0x11, lsl #12  ; [pp+0x11cc8] Obj!SizedBox@5d8441
    //     0x42dd58: ldr             x16, [x16, #0xcc8]
    // 0x42dd5c: StoreField: r2->field_13 = r16
    //     0x42dd5c: stur            w16, [x2, #0x13]
    // 0x42dd60: r16 = Instance__TutorialGraphic
    //     0x42dd60: add             x16, PP, #0x11, lsl #12  ; [pp+0x11cf8] Obj!_TutorialGraphic@5d7fc1
    //     0x42dd64: ldr             x16, [x16, #0xcf8]
    // 0x42dd68: ArrayStore: r2[0] = r16  ; List_4
    //     0x42dd68: stur            w16, [x2, #0x17]
    // 0x42dd6c: r1 = <Widget>
    //     0x42dd6c: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42dd70: r0 = AllocateGrowableArray()
    //     0x42dd70: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42dd74: mov             x1, x0
    // 0x42dd78: ldur            x0, [fp, #-0x30]
    // 0x42dd7c: stur            x1, [fp, #-0x20]
    // 0x42dd80: StoreField: r1->field_f = r0
    //     0x42dd80: stur            w0, [x1, #0xf]
    // 0x42dd84: r2 = 6
    //     0x42dd84: mov             x2, #6
    // 0x42dd88: StoreField: r1->field_b = r2
    //     0x42dd88: stur            w2, [x1, #0xb]
    // 0x42dd8c: r0 = Row()
    //     0x42dd8c: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42dd90: r2 = Instance_Axis
    //     0x42dd90: ldr             x2, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42dd94: StoreField: r0->field_f = r2
    //     0x42dd94: stur            w2, [x0, #0xf]
    // 0x42dd98: r3 = Instance_MainAxisAlignment
    //     0x42dd98: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42dd9c: ldr             x3, [x3, #0xfb0]
    // 0x42dda0: StoreField: r0->field_13 = r3
    //     0x42dda0: stur            w3, [x0, #0x13]
    // 0x42dda4: r4 = Instance_MainAxisSize
    //     0x42dda4: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42dda8: ldr             x4, [x4, #0xfb8]
    // 0x42ddac: ArrayStore: r0[0] = r4  ; List_4
    //     0x42ddac: stur            w4, [x0, #0x17]
    // 0x42ddb0: r5 = Instance_CrossAxisAlignment
    //     0x42ddb0: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42ddb4: ldr             x5, [x5, #0xfc0]
    // 0x42ddb8: StoreField: r0->field_1b = r5
    //     0x42ddb8: stur            w5, [x0, #0x1b]
    // 0x42ddbc: r6 = Instance_VerticalDirection
    //     0x42ddbc: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42ddc0: ldr             x6, [x6, #0xfc8]
    // 0x42ddc4: StoreField: r0->field_23 = r6
    //     0x42ddc4: stur            w6, [x0, #0x23]
    // 0x42ddc8: r7 = Instance_Clip
    //     0x42ddc8: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42ddcc: ldr             x7, [x7, #0xfd0]
    // 0x42ddd0: StoreField: r0->field_2b = r7
    //     0x42ddd0: stur            w7, [x0, #0x2b]
    // 0x42ddd4: StoreField: r0->field_2f = rZR
    //     0x42ddd4: stur            xzr, [x0, #0x2f]
    // 0x42ddd8: ldur            x1, [fp, #-0x20]
    // 0x42dddc: StoreField: r0->field_b = r1
    //     0x42dddc: stur            w1, [x0, #0xb]
    // 0x42dde0: ldur            x1, [fp, #-0x10]
    // 0x42dde4: ArrayStore: r1[8] = r0  ; List_4
    //     0x42dde4: add             x25, x1, #0x2f
    //     0x42dde8: str             w0, [x25]
    //     0x42ddec: tbz             w0, #0, #0x42de08
    //     0x42ddf0: ldurb           w16, [x1, #-1]
    //     0x42ddf4: ldurb           w17, [x0, #-1]
    //     0x42ddf8: and             x16, x17, x16, lsr #2
    //     0x42ddfc: tst             x16, HEAP, lsr #32
    //     0x42de00: b.eq            #0x42de08
    //     0x42de04: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42de08: ldur            x1, [fp, #-0x10]
    // 0x42de0c: r16 = Instance_SizedBox
    //     0x42de0c: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x42de10: ldr             x16, [x16, #0xfd8]
    // 0x42de14: StoreField: r1->field_33 = r16
    //     0x42de14: stur            w16, [x1, #0x33]
    // 0x42de18: r16 = <AppLocale, Translations>
    //     0x42de18: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42de1c: ldur            lr, [fp, #-8]
    // 0x42de20: stp             lr, x16, [SP]
    // 0x42de24: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42de24: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42de28: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42de28: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42de2c: r1 = LoadClassIdInstr(r0)
    //     0x42de2c: ldur            x1, [x0, #-1]
    //     0x42de30: ubfx            x1, x1, #0xc, #0x14
    // 0x42de34: cmp             x1, #0x8dd
    // 0x42de38: b.ne            #0x42de64
    // 0x42de3c: mov             x1, x0
    // 0x42de40: LoadField: r0 = r1->field_23
    //     0x42de40: ldur            w0, [x1, #0x23]
    // 0x42de44: DecompressPointer r0
    //     0x42de44: add             x0, x0, HEAP, lsl #32
    // 0x42de48: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42de4c: cmp             w0, w16
    // 0x42de50: b.ne            #0x42de60
    // 0x42de54: r2 = tutorialPage
    //     0x42de54: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42de58: ldr             x2, [x2, #0xbe0]
    // 0x42de5c: r0 = InitLateFinalInstanceField()
    //     0x42de5c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42de60: b               #0x42dee8
    // 0x42de64: cmp             x1, #0x8df
    // 0x42de68: b.ne            #0x42de94
    // 0x42de6c: mov             x1, x0
    // 0x42de70: LoadField: r0 = r1->field_47
    //     0x42de70: ldur            w0, [x1, #0x47]
    // 0x42de74: DecompressPointer r0
    //     0x42de74: add             x0, x0, HEAP, lsl #32
    // 0x42de78: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42de7c: cmp             w0, w16
    // 0x42de80: b.ne            #0x42de90
    // 0x42de84: r2 = tutorialPage
    //     0x42de84: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42de88: ldr             x2, [x2, #0xbe8]
    // 0x42de8c: r0 = InitLateFinalInstanceField()
    //     0x42de8c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42de90: b               #0x42dee8
    // 0x42de94: cmp             x1, #0x8e0
    // 0x42de98: b.ne            #0x42dec4
    // 0x42de9c: mov             x1, x0
    // 0x42dea0: LoadField: r0 = r1->field_47
    //     0x42dea0: ldur            w0, [x1, #0x47]
    // 0x42dea4: DecompressPointer r0
    //     0x42dea4: add             x0, x0, HEAP, lsl #32
    // 0x42dea8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42deac: cmp             w0, w16
    // 0x42deb0: b.ne            #0x42dec0
    // 0x42deb4: r2 = tutorialPage
    //     0x42deb4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42deb8: ldr             x2, [x2, #0xbf0]
    // 0x42debc: r0 = InitLateFinalInstanceField()
    //     0x42debc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42dec0: b               #0x42dee8
    // 0x42dec4: mov             x1, x0
    // 0x42dec8: LoadField: r0 = r1->field_47
    //     0x42dec8: ldur            w0, [x1, #0x47]
    // 0x42decc: DecompressPointer r0
    //     0x42decc: add             x0, x0, HEAP, lsl #32
    // 0x42ded0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ded4: cmp             w0, w16
    // 0x42ded8: b.ne            #0x42dee8
    // 0x42dedc: r2 = tutorialPage
    //     0x42dedc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42dee0: ldr             x2, [x2, #0xbf8]
    // 0x42dee4: r0 = InitLateFinalInstanceField()
    //     0x42dee4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42dee8: r1 = LoadClassIdInstr(r0)
    //     0x42dee8: ldur            x1, [x0, #-1]
    //     0x42deec: ubfx            x1, x1, #0xc, #0x14
    // 0x42def0: cmp             x1, #0xe8
    // 0x42def4: b.ne            #0x42df04
    // 0x42def8: r0 = "A monster that reaches the skull line means game over if you don\'t defeat it in the next turn."
    //     0x42def8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d00] "A monster that reaches the skull line means game over if you don\'t defeat it in the next turn."
    //     0x42defc: ldr             x0, [x0, #0xd00]
    // 0x42df00: b               #0x42df34
    // 0x42df04: cmp             x1, #0xe9
    // 0x42df08: b.ne            #0x42df18
    // 0x42df0c: r0 = "A monster that reaches the skull line means game over if you don\'t defeat it in the next turn."
    //     0x42df0c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d00] "A monster that reaches the skull line means game over if you don\'t defeat it in the next turn."
    //     0x42df10: ldr             x0, [x0, #0xd00]
    // 0x42df14: b               #0x42df34
    // 0x42df18: cmp             x1, #0xea
    // 0x42df1c: b.ne            #0x42df2c
    // 0x42df20: r0 = "Бас сүйегінің сызығына жеткен құбыжық келесі кезекте оны жеңбесеңіз, ойын аяқталды дегенді білдіреді."
    //     0x42df20: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d08] "Бас сүйегінің сызығына жеткен құбыжық келесі кезекте оны жеңбесеңіз, ойын аяқталды дегенді білдіреді."
    //     0x42df24: ldr             x0, [x0, #0xd08]
    // 0x42df28: b               #0x42df34
    // 0x42df2c: r0 = "Un monstruo que llega a la línea del cráneo significa que el juego se acaba si no lo derrotas en el siguiente turno."
    //     0x42df2c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d10] "Un monstruo que llega a la línea del cráneo significa que el juego se acaba si no lo derrotas en el siguiente turno."
    //     0x42df30: ldr             x0, [x0, #0xd10]
    // 0x42df34: ldur            x1, [fp, #-0x10]
    // 0x42df38: stur            x0, [fp, #-0x20]
    // 0x42df3c: r0 = Text()
    //     0x42df3c: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42df40: mov             x2, x0
    // 0x42df44: ldur            x0, [fp, #-0x20]
    // 0x42df48: stur            x2, [fp, #-0x30]
    // 0x42df4c: StoreField: r2->field_b = r0
    //     0x42df4c: stur            w0, [x2, #0xb]
    // 0x42df50: r1 = <FlexParentData>
    //     0x42df50: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42df54: ldr             x1, [x1, #0xc40]
    // 0x42df58: r0 = Expanded()
    //     0x42df58: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42df5c: mov             x3, x0
    // 0x42df60: r0 = 1
    //     0x42df60: mov             x0, #1
    // 0x42df64: stur            x3, [fp, #-0x20]
    // 0x42df68: StoreField: r3->field_13 = r0
    //     0x42df68: stur            x0, [x3, #0x13]
    // 0x42df6c: r4 = Instance_FlexFit
    //     0x42df6c: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42df70: ldr             x4, [x4, #0xc48]
    // 0x42df74: StoreField: r3->field_1b = r4
    //     0x42df74: stur            w4, [x3, #0x1b]
    // 0x42df78: ldur            x1, [fp, #-0x30]
    // 0x42df7c: StoreField: r3->field_b = r1
    //     0x42df7c: stur            w1, [x3, #0xb]
    // 0x42df80: r1 = Null
    //     0x42df80: mov             x1, NULL
    // 0x42df84: r2 = 6
    //     0x42df84: mov             x2, #6
    // 0x42df88: r0 = AllocateArray()
    //     0x42df88: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42df8c: stur            x0, [fp, #-0x30]
    // 0x42df90: r16 = Instance__SkullsGraphic
    //     0x42df90: add             x16, PP, #0x11, lsl #12  ; [pp+0x11d18] Obj!_SkullsGraphic@5d7f91
    //     0x42df94: ldr             x16, [x16, #0xd18]
    // 0x42df98: StoreField: r0->field_f = r16
    //     0x42df98: stur            w16, [x0, #0xf]
    // 0x42df9c: r16 = Instance_SizedBox
    //     0x42df9c: add             x16, PP, #0x11, lsl #12  ; [pp+0x11cc8] Obj!SizedBox@5d8441
    //     0x42dfa0: ldr             x16, [x16, #0xcc8]
    // 0x42dfa4: StoreField: r0->field_13 = r16
    //     0x42dfa4: stur            w16, [x0, #0x13]
    // 0x42dfa8: ldur            x1, [fp, #-0x20]
    // 0x42dfac: ArrayStore: r0[0] = r1  ; List_4
    //     0x42dfac: stur            w1, [x0, #0x17]
    // 0x42dfb0: r1 = <Widget>
    //     0x42dfb0: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42dfb4: r0 = AllocateGrowableArray()
    //     0x42dfb4: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42dfb8: mov             x1, x0
    // 0x42dfbc: ldur            x0, [fp, #-0x30]
    // 0x42dfc0: stur            x1, [fp, #-0x20]
    // 0x42dfc4: StoreField: r1->field_f = r0
    //     0x42dfc4: stur            w0, [x1, #0xf]
    // 0x42dfc8: r2 = 6
    //     0x42dfc8: mov             x2, #6
    // 0x42dfcc: StoreField: r1->field_b = r2
    //     0x42dfcc: stur            w2, [x1, #0xb]
    // 0x42dfd0: r0 = Row()
    //     0x42dfd0: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42dfd4: r2 = Instance_Axis
    //     0x42dfd4: ldr             x2, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42dfd8: StoreField: r0->field_f = r2
    //     0x42dfd8: stur            w2, [x0, #0xf]
    // 0x42dfdc: r3 = Instance_MainAxisAlignment
    //     0x42dfdc: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42dfe0: ldr             x3, [x3, #0xfb0]
    // 0x42dfe4: StoreField: r0->field_13 = r3
    //     0x42dfe4: stur            w3, [x0, #0x13]
    // 0x42dfe8: r4 = Instance_MainAxisSize
    //     0x42dfe8: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42dfec: ldr             x4, [x4, #0xfb8]
    // 0x42dff0: ArrayStore: r0[0] = r4  ; List_4
    //     0x42dff0: stur            w4, [x0, #0x17]
    // 0x42dff4: r5 = Instance_CrossAxisAlignment
    //     0x42dff4: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42dff8: ldr             x5, [x5, #0xfc0]
    // 0x42dffc: StoreField: r0->field_1b = r5
    //     0x42dffc: stur            w5, [x0, #0x1b]
    // 0x42e000: r6 = Instance_VerticalDirection
    //     0x42e000: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42e004: ldr             x6, [x6, #0xfc8]
    // 0x42e008: StoreField: r0->field_23 = r6
    //     0x42e008: stur            w6, [x0, #0x23]
    // 0x42e00c: r7 = Instance_Clip
    //     0x42e00c: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42e010: ldr             x7, [x7, #0xfd0]
    // 0x42e014: StoreField: r0->field_2b = r7
    //     0x42e014: stur            w7, [x0, #0x2b]
    // 0x42e018: StoreField: r0->field_2f = rZR
    //     0x42e018: stur            xzr, [x0, #0x2f]
    // 0x42e01c: ldur            x1, [fp, #-0x20]
    // 0x42e020: StoreField: r0->field_b = r1
    //     0x42e020: stur            w1, [x0, #0xb]
    // 0x42e024: ldur            x1, [fp, #-0x10]
    // 0x42e028: ArrayStore: r1[10] = r0  ; List_4
    //     0x42e028: add             x25, x1, #0x37
    //     0x42e02c: str             w0, [x25]
    //     0x42e030: tbz             w0, #0, #0x42e04c
    //     0x42e034: ldurb           w16, [x1, #-1]
    //     0x42e038: ldurb           w17, [x0, #-1]
    //     0x42e03c: and             x16, x17, x16, lsr #2
    //     0x42e040: tst             x16, HEAP, lsr #32
    //     0x42e044: b.eq            #0x42e04c
    //     0x42e048: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42e04c: ldur            x1, [fp, #-0x10]
    // 0x42e050: r16 = Instance_SizedBox
    //     0x42e050: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c58] Obj!SizedBox@5d8401
    //     0x42e054: ldr             x16, [x16, #0xc58]
    // 0x42e058: StoreField: r1->field_3b = r16
    //     0x42e058: stur            w16, [x1, #0x3b]
    // 0x42e05c: r16 = <AppLocale, Translations>
    //     0x42e05c: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42e060: ldur            lr, [fp, #-8]
    // 0x42e064: stp             lr, x16, [SP]
    // 0x42e068: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42e068: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42e06c: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42e06c: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42e070: r1 = LoadClassIdInstr(r0)
    //     0x42e070: ldur            x1, [x0, #-1]
    //     0x42e074: ubfx            x1, x1, #0xc, #0x14
    // 0x42e078: cmp             x1, #0x8dd
    // 0x42e07c: b.ne            #0x42e0a8
    // 0x42e080: mov             x1, x0
    // 0x42e084: LoadField: r0 = r1->field_23
    //     0x42e084: ldur            w0, [x1, #0x23]
    // 0x42e088: DecompressPointer r0
    //     0x42e088: add             x0, x0, HEAP, lsl #32
    // 0x42e08c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e090: cmp             w0, w16
    // 0x42e094: b.ne            #0x42e0a4
    // 0x42e098: r2 = tutorialPage
    //     0x42e098: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42e09c: ldr             x2, [x2, #0xbe0]
    // 0x42e0a0: r0 = InitLateFinalInstanceField()
    //     0x42e0a0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e0a4: b               #0x42e12c
    // 0x42e0a8: cmp             x1, #0x8df
    // 0x42e0ac: b.ne            #0x42e0d8
    // 0x42e0b0: mov             x1, x0
    // 0x42e0b4: LoadField: r0 = r1->field_47
    //     0x42e0b4: ldur            w0, [x1, #0x47]
    // 0x42e0b8: DecompressPointer r0
    //     0x42e0b8: add             x0, x0, HEAP, lsl #32
    // 0x42e0bc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e0c0: cmp             w0, w16
    // 0x42e0c4: b.ne            #0x42e0d4
    // 0x42e0c8: r2 = tutorialPage
    //     0x42e0c8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42e0cc: ldr             x2, [x2, #0xbe8]
    // 0x42e0d0: r0 = InitLateFinalInstanceField()
    //     0x42e0d0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e0d4: b               #0x42e12c
    // 0x42e0d8: cmp             x1, #0x8e0
    // 0x42e0dc: b.ne            #0x42e108
    // 0x42e0e0: mov             x1, x0
    // 0x42e0e4: LoadField: r0 = r1->field_47
    //     0x42e0e4: ldur            w0, [x1, #0x47]
    // 0x42e0e8: DecompressPointer r0
    //     0x42e0e8: add             x0, x0, HEAP, lsl #32
    // 0x42e0ec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e0f0: cmp             w0, w16
    // 0x42e0f4: b.ne            #0x42e104
    // 0x42e0f8: r2 = tutorialPage
    //     0x42e0f8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42e0fc: ldr             x2, [x2, #0xbf0]
    // 0x42e100: r0 = InitLateFinalInstanceField()
    //     0x42e100: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e104: b               #0x42e12c
    // 0x42e108: mov             x1, x0
    // 0x42e10c: LoadField: r0 = r1->field_47
    //     0x42e10c: ldur            w0, [x1, #0x47]
    // 0x42e110: DecompressPointer r0
    //     0x42e110: add             x0, x0, HEAP, lsl #32
    // 0x42e114: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e118: cmp             w0, w16
    // 0x42e11c: b.ne            #0x42e12c
    // 0x42e120: r2 = tutorialPage
    //     0x42e120: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42e124: ldr             x2, [x2, #0xbf8]
    // 0x42e128: r0 = InitLateFinalInstanceField()
    //     0x42e128: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e12c: r1 = LoadClassIdInstr(r0)
    //     0x42e12c: ldur            x1, [x0, #-1]
    //     0x42e130: ubfx            x1, x1, #0xc, #0x14
    // 0x42e134: cmp             x1, #0xe8
    // 0x42e138: b.ne            #0x42e148
    // 0x42e13c: r0 = "More rows of monsters will spawn each turn as you progress, so the skull line will move up."
    //     0x42e13c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d20] "More rows of monsters will spawn each turn as you progress, so the skull line will move up."
    //     0x42e140: ldr             x0, [x0, #0xd20]
    // 0x42e144: b               #0x42e178
    // 0x42e148: cmp             x1, #0xe9
    // 0x42e14c: b.ne            #0x42e15c
    // 0x42e150: r0 = "More rows of monsters will spawn each turn as you progress, so the skull line will move up."
    //     0x42e150: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d20] "More rows of monsters will spawn each turn as you progress, so the skull line will move up."
    //     0x42e154: ldr             x0, [x0, #0xd20]
    // 0x42e158: b               #0x42e178
    // 0x42e15c: cmp             x1, #0xea
    // 0x42e160: b.ne            #0x42e170
    // 0x42e164: r0 = "Сіз ілгерілеген сайын құбыжықтардың көбірек қатарлары пайда болады, сондықтан қауіпті аймақ ұлғаяды."
    //     0x42e164: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d28] "Сіз ілгерілеген сайын құбыжықтардың көбірек қатарлары пайда болады, сондықтан қауіпті аймақ ұлғаяды."
    //     0x42e168: ldr             x0, [x0, #0xd28]
    // 0x42e16c: b               #0x42e178
    // 0x42e170: r0 = "Aparecerán más filas de monstruos en cada turno a medida que avances, por lo que la zona de peligro también se hará más grande."
    //     0x42e170: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d30] "Aparecerán más filas de monstruos en cada turno a medida que avances, por lo que la zona de peligro también se hará más grande."
    //     0x42e174: ldr             x0, [x0, #0xd30]
    // 0x42e178: ldur            x1, [fp, #-0x10]
    // 0x42e17c: stur            x0, [fp, #-0x20]
    // 0x42e180: r0 = Text()
    //     0x42e180: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42e184: mov             x2, x0
    // 0x42e188: ldur            x0, [fp, #-0x20]
    // 0x42e18c: stur            x2, [fp, #-0x30]
    // 0x42e190: StoreField: r2->field_b = r0
    //     0x42e190: stur            w0, [x2, #0xb]
    // 0x42e194: r1 = <FlexParentData>
    //     0x42e194: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42e198: ldr             x1, [x1, #0xc40]
    // 0x42e19c: r0 = Expanded()
    //     0x42e19c: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42e1a0: mov             x3, x0
    // 0x42e1a4: r0 = 1
    //     0x42e1a4: mov             x0, #1
    // 0x42e1a8: stur            x3, [fp, #-0x20]
    // 0x42e1ac: StoreField: r3->field_13 = r0
    //     0x42e1ac: stur            x0, [x3, #0x13]
    // 0x42e1b0: r4 = Instance_FlexFit
    //     0x42e1b0: add             x4, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42e1b4: ldr             x4, [x4, #0xc48]
    // 0x42e1b8: StoreField: r3->field_1b = r4
    //     0x42e1b8: stur            w4, [x3, #0x1b]
    // 0x42e1bc: ldur            x1, [fp, #-0x30]
    // 0x42e1c0: StoreField: r3->field_b = r1
    //     0x42e1c0: stur            w1, [x3, #0xb]
    // 0x42e1c4: r1 = Null
    //     0x42e1c4: mov             x1, NULL
    // 0x42e1c8: r2 = 6
    //     0x42e1c8: mov             x2, #6
    // 0x42e1cc: r0 = AllocateArray()
    //     0x42e1cc: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42e1d0: stur            x0, [fp, #-0x30]
    // 0x42e1d4: r16 = Instance__SkullsGraphic
    //     0x42e1d4: add             x16, PP, #0x11, lsl #12  ; [pp+0x11d38] Obj!_SkullsGraphic@5d7f71
    //     0x42e1d8: ldr             x16, [x16, #0xd38]
    // 0x42e1dc: StoreField: r0->field_f = r16
    //     0x42e1dc: stur            w16, [x0, #0xf]
    // 0x42e1e0: r16 = Instance_SizedBox
    //     0x42e1e0: add             x16, PP, #0x11, lsl #12  ; [pp+0x11cc8] Obj!SizedBox@5d8441
    //     0x42e1e4: ldr             x16, [x16, #0xcc8]
    // 0x42e1e8: StoreField: r0->field_13 = r16
    //     0x42e1e8: stur            w16, [x0, #0x13]
    // 0x42e1ec: ldur            x1, [fp, #-0x20]
    // 0x42e1f0: ArrayStore: r0[0] = r1  ; List_4
    //     0x42e1f0: stur            w1, [x0, #0x17]
    // 0x42e1f4: r1 = <Widget>
    //     0x42e1f4: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42e1f8: r0 = AllocateGrowableArray()
    //     0x42e1f8: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42e1fc: mov             x1, x0
    // 0x42e200: ldur            x0, [fp, #-0x30]
    // 0x42e204: stur            x1, [fp, #-0x20]
    // 0x42e208: StoreField: r1->field_f = r0
    //     0x42e208: stur            w0, [x1, #0xf]
    // 0x42e20c: r2 = 6
    //     0x42e20c: mov             x2, #6
    // 0x42e210: StoreField: r1->field_b = r2
    //     0x42e210: stur            w2, [x1, #0xb]
    // 0x42e214: r0 = Row()
    //     0x42e214: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42e218: r2 = Instance_Axis
    //     0x42e218: ldr             x2, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42e21c: StoreField: r0->field_f = r2
    //     0x42e21c: stur            w2, [x0, #0xf]
    // 0x42e220: r3 = Instance_MainAxisAlignment
    //     0x42e220: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42e224: ldr             x3, [x3, #0xfb0]
    // 0x42e228: StoreField: r0->field_13 = r3
    //     0x42e228: stur            w3, [x0, #0x13]
    // 0x42e22c: r4 = Instance_MainAxisSize
    //     0x42e22c: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42e230: ldr             x4, [x4, #0xfb8]
    // 0x42e234: ArrayStore: r0[0] = r4  ; List_4
    //     0x42e234: stur            w4, [x0, #0x17]
    // 0x42e238: r5 = Instance_CrossAxisAlignment
    //     0x42e238: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42e23c: ldr             x5, [x5, #0xfc0]
    // 0x42e240: StoreField: r0->field_1b = r5
    //     0x42e240: stur            w5, [x0, #0x1b]
    // 0x42e244: r6 = Instance_VerticalDirection
    //     0x42e244: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42e248: ldr             x6, [x6, #0xfc8]
    // 0x42e24c: StoreField: r0->field_23 = r6
    //     0x42e24c: stur            w6, [x0, #0x23]
    // 0x42e250: r7 = Instance_Clip
    //     0x42e250: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42e254: ldr             x7, [x7, #0xfd0]
    // 0x42e258: StoreField: r0->field_2b = r7
    //     0x42e258: stur            w7, [x0, #0x2b]
    // 0x42e25c: StoreField: r0->field_2f = rZR
    //     0x42e25c: stur            xzr, [x0, #0x2f]
    // 0x42e260: ldur            x1, [fp, #-0x20]
    // 0x42e264: StoreField: r0->field_b = r1
    //     0x42e264: stur            w1, [x0, #0xb]
    // 0x42e268: ldur            x1, [fp, #-0x10]
    // 0x42e26c: ArrayStore: r1[12] = r0  ; List_4
    //     0x42e26c: add             x25, x1, #0x3f
    //     0x42e270: str             w0, [x25]
    //     0x42e274: tbz             w0, #0, #0x42e290
    //     0x42e278: ldurb           w16, [x1, #-1]
    //     0x42e27c: ldurb           w17, [x0, #-1]
    //     0x42e280: and             x16, x17, x16, lsr #2
    //     0x42e284: tst             x16, HEAP, lsr #32
    //     0x42e288: b.eq            #0x42e290
    //     0x42e28c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42e290: ldur            x1, [fp, #-0x10]
    // 0x42e294: r16 = Instance_SizedBox
    //     0x42e294: add             x16, PP, #0x10, lsl #12  ; [pp+0x10fd8] Obj!SizedBox@5d83e1
    //     0x42e298: ldr             x16, [x16, #0xfd8]
    // 0x42e29c: StoreField: r1->field_43 = r16
    //     0x42e29c: stur            w16, [x1, #0x43]
    // 0x42e2a0: r16 = <AppLocale, Translations>
    //     0x42e2a0: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42e2a4: ldur            lr, [fp, #-8]
    // 0x42e2a8: stp             lr, x16, [SP]
    // 0x42e2ac: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42e2ac: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42e2b0: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42e2b0: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42e2b4: r1 = LoadClassIdInstr(r0)
    //     0x42e2b4: ldur            x1, [x0, #-1]
    //     0x42e2b8: ubfx            x1, x1, #0xc, #0x14
    // 0x42e2bc: cmp             x1, #0x8dd
    // 0x42e2c0: b.ne            #0x42e2ec
    // 0x42e2c4: mov             x1, x0
    // 0x42e2c8: LoadField: r0 = r1->field_23
    //     0x42e2c8: ldur            w0, [x1, #0x23]
    // 0x42e2cc: DecompressPointer r0
    //     0x42e2cc: add             x0, x0, HEAP, lsl #32
    // 0x42e2d0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e2d4: cmp             w0, w16
    // 0x42e2d8: b.ne            #0x42e2e8
    // 0x42e2dc: r2 = tutorialPage
    //     0x42e2dc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42e2e0: ldr             x2, [x2, #0xbe0]
    // 0x42e2e4: r0 = InitLateFinalInstanceField()
    //     0x42e2e4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e2e8: b               #0x42e370
    // 0x42e2ec: cmp             x1, #0x8df
    // 0x42e2f0: b.ne            #0x42e31c
    // 0x42e2f4: mov             x1, x0
    // 0x42e2f8: LoadField: r0 = r1->field_47
    //     0x42e2f8: ldur            w0, [x1, #0x47]
    // 0x42e2fc: DecompressPointer r0
    //     0x42e2fc: add             x0, x0, HEAP, lsl #32
    // 0x42e300: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e304: cmp             w0, w16
    // 0x42e308: b.ne            #0x42e318
    // 0x42e30c: r2 = tutorialPage
    //     0x42e30c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42e310: ldr             x2, [x2, #0xbe8]
    // 0x42e314: r0 = InitLateFinalInstanceField()
    //     0x42e314: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e318: b               #0x42e370
    // 0x42e31c: cmp             x1, #0x8e0
    // 0x42e320: b.ne            #0x42e34c
    // 0x42e324: mov             x1, x0
    // 0x42e328: LoadField: r0 = r1->field_47
    //     0x42e328: ldur            w0, [x1, #0x47]
    // 0x42e32c: DecompressPointer r0
    //     0x42e32c: add             x0, x0, HEAP, lsl #32
    // 0x42e330: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e334: cmp             w0, w16
    // 0x42e338: b.ne            #0x42e348
    // 0x42e33c: r2 = tutorialPage
    //     0x42e33c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42e340: ldr             x2, [x2, #0xbf0]
    // 0x42e344: r0 = InitLateFinalInstanceField()
    //     0x42e344: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e348: b               #0x42e370
    // 0x42e34c: mov             x1, x0
    // 0x42e350: LoadField: r0 = r1->field_47
    //     0x42e350: ldur            w0, [x1, #0x47]
    // 0x42e354: DecompressPointer r0
    //     0x42e354: add             x0, x0, HEAP, lsl #32
    // 0x42e358: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e35c: cmp             w0, w16
    // 0x42e360: b.ne            #0x42e370
    // 0x42e364: r2 = tutorialPage
    //     0x42e364: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42e368: ldr             x2, [x2, #0xbf8]
    // 0x42e36c: r0 = InitLateFinalInstanceField()
    //     0x42e36c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e370: r1 = LoadClassIdInstr(r0)
    //     0x42e370: ldur            x1, [x0, #-1]
    //     0x42e374: ubfx            x1, x1, #0xc, #0x14
    // 0x42e378: cmp             x1, #0xe8
    // 0x42e37c: b.ne            #0x42e38c
    // 0x42e380: r0 = "Save up coins to unlock new items in the shop..."
    //     0x42e380: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d40] "Save up coins to unlock new items in the shop..."
    //     0x42e384: ldr             x0, [x0, #0xd40]
    // 0x42e388: b               #0x42e3bc
    // 0x42e38c: cmp             x1, #0xe9
    // 0x42e390: b.ne            #0x42e3a0
    // 0x42e394: r0 = "Save up coins to unlock new items in the shop..."
    //     0x42e394: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d40] "Save up coins to unlock new items in the shop..."
    //     0x42e398: ldr             x0, [x0, #0xd40]
    // 0x42e39c: b               #0x42e3bc
    // 0x42e3a0: cmp             x1, #0xea
    // 0x42e3a4: b.ne            #0x42e3b4
    // 0x42e3a8: r0 = "Дүкенде жаңа заттардың құлпын ашу үшін тиындарды сақтаңыз..."
    //     0x42e3a8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d48] "Дүкенде жаңа заттардың құлпын ашу үшін тиындарды сақтаңыз..."
    //     0x42e3ac: ldr             x0, [x0, #0xd48]
    // 0x42e3b0: b               #0x42e3bc
    // 0x42e3b4: r0 = "Ahorra monedas para desbloquear nuevos artículos en la tienda..."
    //     0x42e3b4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d50] "Ahorra monedas para desbloquear nuevos artículos en la tienda..."
    //     0x42e3b8: ldr             x0, [x0, #0xd50]
    // 0x42e3bc: ldur            x1, [fp, #-0x10]
    // 0x42e3c0: stur            x0, [fp, #-0x20]
    // 0x42e3c4: r0 = Text()
    //     0x42e3c4: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42e3c8: mov             x2, x0
    // 0x42e3cc: ldur            x0, [fp, #-0x20]
    // 0x42e3d0: stur            x2, [fp, #-0x30]
    // 0x42e3d4: StoreField: r2->field_b = r0
    //     0x42e3d4: stur            w0, [x2, #0xb]
    // 0x42e3d8: r1 = <FlexParentData>
    //     0x42e3d8: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42e3dc: ldr             x1, [x1, #0xc40]
    // 0x42e3e0: r0 = Expanded()
    //     0x42e3e0: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42e3e4: mov             x2, x0
    // 0x42e3e8: r0 = 1
    //     0x42e3e8: mov             x0, #1
    // 0x42e3ec: stur            x2, [fp, #-0x20]
    // 0x42e3f0: StoreField: r2->field_13 = r0
    //     0x42e3f0: stur            x0, [x2, #0x13]
    // 0x42e3f4: r3 = Instance_FlexFit
    //     0x42e3f4: add             x3, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42e3f8: ldr             x3, [x3, #0xc48]
    // 0x42e3fc: StoreField: r2->field_1b = r3
    //     0x42e3fc: stur            w3, [x2, #0x1b]
    // 0x42e400: ldur            x1, [fp, #-0x30]
    // 0x42e404: StoreField: r2->field_b = r1
    //     0x42e404: stur            w1, [x2, #0xb]
    // 0x42e408: ldur            x1, [fp, #-0x18]
    // 0x42e40c: LoadField: r0 = r1->field_3b
    //     0x42e40c: ldur            w0, [x1, #0x3b]
    // 0x42e410: DecompressPointer r0
    //     0x42e410: add             x0, x0, HEAP, lsl #32
    // 0x42e414: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e418: cmp             w0, w16
    // 0x42e41c: b.ne            #0x42e42c
    // 0x42e420: r2 = market
    //     0x42e420: add             x2, PP, #0x11, lsl #12  ; [pp+0x11038] Field <NesIconCollection.market>: late final (offset: 0x3c)
    //     0x42e424: ldr             x2, [x2, #0x38]
    // 0x42e428: r0 = InitLateFinalInstanceField()
    //     0x42e428: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e42c: stur            x0, [fp, #-0x18]
    // 0x42e430: r0 = NesIcon()
    //     0x42e430: bl              #0x3803a0  ; AllocateNesIconStub -> NesIcon (size=0x24)
    // 0x42e434: mov             x1, x0
    // 0x42e438: ldur            x0, [fp, #-0x18]
    // 0x42e43c: stur            x1, [fp, #-0x30]
    // 0x42e440: StoreField: r1->field_b = r0
    //     0x42e440: stur            w0, [x1, #0xb]
    // 0x42e444: r0 = Instance_Size
    //     0x42e444: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d58] Obj!Size@5d01a1
    //     0x42e448: ldr             x0, [x0, #0xd58]
    // 0x42e44c: StoreField: r1->field_f = r0
    //     0x42e44c: stur            w0, [x1, #0xf]
    // 0x42e450: r0 = Padding()
    //     0x42e450: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x42e454: mov             x3, x0
    // 0x42e458: r0 = Instance_EdgeInsets
    //     0x42e458: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d60] Obj!EdgeInsets@5cbfb1
    //     0x42e45c: ldr             x0, [x0, #0xd60]
    // 0x42e460: stur            x3, [fp, #-0x18]
    // 0x42e464: StoreField: r3->field_f = r0
    //     0x42e464: stur            w0, [x3, #0xf]
    // 0x42e468: ldur            x0, [fp, #-0x30]
    // 0x42e46c: StoreField: r3->field_b = r0
    //     0x42e46c: stur            w0, [x3, #0xb]
    // 0x42e470: r1 = Null
    //     0x42e470: mov             x1, NULL
    // 0x42e474: r2 = 6
    //     0x42e474: mov             x2, #6
    // 0x42e478: r0 = AllocateArray()
    //     0x42e478: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42e47c: mov             x2, x0
    // 0x42e480: ldur            x0, [fp, #-0x20]
    // 0x42e484: stur            x2, [fp, #-0x30]
    // 0x42e488: StoreField: r2->field_f = r0
    //     0x42e488: stur            w0, [x2, #0xf]
    // 0x42e48c: r16 = Instance_SizedBox
    //     0x42e48c: add             x16, PP, #0x11, lsl #12  ; [pp+0x11cc8] Obj!SizedBox@5d8441
    //     0x42e490: ldr             x16, [x16, #0xcc8]
    // 0x42e494: StoreField: r2->field_13 = r16
    //     0x42e494: stur            w16, [x2, #0x13]
    // 0x42e498: ldur            x0, [fp, #-0x18]
    // 0x42e49c: ArrayStore: r2[0] = r0  ; List_4
    //     0x42e49c: stur            w0, [x2, #0x17]
    // 0x42e4a0: r1 = <Widget>
    //     0x42e4a0: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42e4a4: r0 = AllocateGrowableArray()
    //     0x42e4a4: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42e4a8: mov             x1, x0
    // 0x42e4ac: ldur            x0, [fp, #-0x30]
    // 0x42e4b0: stur            x1, [fp, #-0x18]
    // 0x42e4b4: StoreField: r1->field_f = r0
    //     0x42e4b4: stur            w0, [x1, #0xf]
    // 0x42e4b8: r2 = 6
    //     0x42e4b8: mov             x2, #6
    // 0x42e4bc: StoreField: r1->field_b = r2
    //     0x42e4bc: stur            w2, [x1, #0xb]
    // 0x42e4c0: r0 = Row()
    //     0x42e4c0: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42e4c4: r2 = Instance_Axis
    //     0x42e4c4: ldr             x2, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42e4c8: StoreField: r0->field_f = r2
    //     0x42e4c8: stur            w2, [x0, #0xf]
    // 0x42e4cc: r3 = Instance_MainAxisAlignment
    //     0x42e4cc: add             x3, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42e4d0: ldr             x3, [x3, #0xfb0]
    // 0x42e4d4: StoreField: r0->field_13 = r3
    //     0x42e4d4: stur            w3, [x0, #0x13]
    // 0x42e4d8: r4 = Instance_MainAxisSize
    //     0x42e4d8: add             x4, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42e4dc: ldr             x4, [x4, #0xfb8]
    // 0x42e4e0: ArrayStore: r0[0] = r4  ; List_4
    //     0x42e4e0: stur            w4, [x0, #0x17]
    // 0x42e4e4: r5 = Instance_CrossAxisAlignment
    //     0x42e4e4: add             x5, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42e4e8: ldr             x5, [x5, #0xfc0]
    // 0x42e4ec: StoreField: r0->field_1b = r5
    //     0x42e4ec: stur            w5, [x0, #0x1b]
    // 0x42e4f0: r6 = Instance_VerticalDirection
    //     0x42e4f0: add             x6, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42e4f4: ldr             x6, [x6, #0xfc8]
    // 0x42e4f8: StoreField: r0->field_23 = r6
    //     0x42e4f8: stur            w6, [x0, #0x23]
    // 0x42e4fc: r7 = Instance_Clip
    //     0x42e4fc: add             x7, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42e500: ldr             x7, [x7, #0xfd0]
    // 0x42e504: StoreField: r0->field_2b = r7
    //     0x42e504: stur            w7, [x0, #0x2b]
    // 0x42e508: StoreField: r0->field_2f = rZR
    //     0x42e508: stur            xzr, [x0, #0x2f]
    // 0x42e50c: ldur            x1, [fp, #-0x18]
    // 0x42e510: StoreField: r0->field_b = r1
    //     0x42e510: stur            w1, [x0, #0xb]
    // 0x42e514: ldur            x1, [fp, #-0x10]
    // 0x42e518: ArrayStore: r1[14] = r0  ; List_4
    //     0x42e518: add             x25, x1, #0x47
    //     0x42e51c: str             w0, [x25]
    //     0x42e520: tbz             w0, #0, #0x42e53c
    //     0x42e524: ldurb           w16, [x1, #-1]
    //     0x42e528: ldurb           w17, [x0, #-1]
    //     0x42e52c: and             x16, x17, x16, lsr #2
    //     0x42e530: tst             x16, HEAP, lsr #32
    //     0x42e534: b.eq            #0x42e53c
    //     0x42e538: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42e53c: ldur            x1, [fp, #-0x10]
    // 0x42e540: r16 = Instance_SizedBox
    //     0x42e540: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c58] Obj!SizedBox@5d8401
    //     0x42e544: ldr             x16, [x16, #0xc58]
    // 0x42e548: StoreField: r1->field_4b = r16
    //     0x42e548: stur            w16, [x1, #0x4b]
    // 0x42e54c: r16 = <AppLocale, Translations>
    //     0x42e54c: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42e550: ldur            lr, [fp, #-8]
    // 0x42e554: stp             lr, x16, [SP]
    // 0x42e558: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42e558: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42e55c: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42e55c: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42e560: r1 = LoadClassIdInstr(r0)
    //     0x42e560: ldur            x1, [x0, #-1]
    //     0x42e564: ubfx            x1, x1, #0xc, #0x14
    // 0x42e568: cmp             x1, #0x8dd
    // 0x42e56c: b.ne            #0x42e598
    // 0x42e570: mov             x1, x0
    // 0x42e574: LoadField: r0 = r1->field_23
    //     0x42e574: ldur            w0, [x1, #0x23]
    // 0x42e578: DecompressPointer r0
    //     0x42e578: add             x0, x0, HEAP, lsl #32
    // 0x42e57c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e580: cmp             w0, w16
    // 0x42e584: b.ne            #0x42e594
    // 0x42e588: r2 = tutorialPage
    //     0x42e588: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be0] Field <Translations.tutorialPage>: late final (offset: 0x24)
    //     0x42e58c: ldr             x2, [x2, #0xbe0]
    // 0x42e590: r0 = InitLateFinalInstanceField()
    //     0x42e590: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e594: b               #0x42e61c
    // 0x42e598: cmp             x1, #0x8df
    // 0x42e59c: b.ne            #0x42e5c8
    // 0x42e5a0: mov             x1, x0
    // 0x42e5a4: LoadField: r0 = r1->field_47
    //     0x42e5a4: ldur            w0, [x1, #0x47]
    // 0x42e5a8: DecompressPointer r0
    //     0x42e5a8: add             x0, x0, HEAP, lsl #32
    // 0x42e5ac: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e5b0: cmp             w0, w16
    // 0x42e5b4: b.ne            #0x42e5c4
    // 0x42e5b8: r2 = tutorialPage
    //     0x42e5b8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11be8] Field <TranslationsRu.tutorialPage>: late final (offset: 0x48)
    //     0x42e5bc: ldr             x2, [x2, #0xbe8]
    // 0x42e5c0: r0 = InitLateFinalInstanceField()
    //     0x42e5c0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e5c4: b               #0x42e61c
    // 0x42e5c8: cmp             x1, #0x8e0
    // 0x42e5cc: b.ne            #0x42e5f8
    // 0x42e5d0: mov             x1, x0
    // 0x42e5d4: LoadField: r0 = r1->field_47
    //     0x42e5d4: ldur            w0, [x1, #0x47]
    // 0x42e5d8: DecompressPointer r0
    //     0x42e5d8: add             x0, x0, HEAP, lsl #32
    // 0x42e5dc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e5e0: cmp             w0, w16
    // 0x42e5e4: b.ne            #0x42e5f4
    // 0x42e5e8: r2 = tutorialPage
    //     0x42e5e8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf0] Field <TranslationsKk.tutorialPage>: late final (offset: 0x48)
    //     0x42e5ec: ldr             x2, [x2, #0xbf0]
    // 0x42e5f0: r0 = InitLateFinalInstanceField()
    //     0x42e5f0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e5f4: b               #0x42e61c
    // 0x42e5f8: mov             x1, x0
    // 0x42e5fc: LoadField: r0 = r1->field_47
    //     0x42e5fc: ldur            w0, [x1, #0x47]
    // 0x42e600: DecompressPointer r0
    //     0x42e600: add             x0, x0, HEAP, lsl #32
    // 0x42e604: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42e608: cmp             w0, w16
    // 0x42e60c: b.ne            #0x42e61c
    // 0x42e610: r2 = tutorialPage
    //     0x42e610: add             x2, PP, #0x11, lsl #12  ; [pp+0x11bf8] Field <TranslationsEs.tutorialPage>: late final (offset: 0x48)
    //     0x42e614: ldr             x2, [x2, #0xbf8]
    // 0x42e618: r0 = InitLateFinalInstanceField()
    //     0x42e618: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42e61c: r1 = LoadClassIdInstr(r0)
    //     0x42e61c: ldur            x1, [x0, #-1]
    //     0x42e620: ubfx            x1, x1, #0xc, #0x14
    // 0x42e624: cmp             x1, #0xe8
    // 0x42e628: b.ne            #0x42e638
    // 0x42e62c: r2 = "...or use them to continue after a game over."
    //     0x42e62c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11d68] "...or use them to continue after a game over."
    //     0x42e630: ldr             x2, [x2, #0xd68]
    // 0x42e634: b               #0x42e668
    // 0x42e638: cmp             x1, #0xe9
    // 0x42e63c: b.ne            #0x42e64c
    // 0x42e640: r2 = "...or use them to continue after a game over."
    //     0x42e640: add             x2, PP, #0x11, lsl #12  ; [pp+0x11d68] "...or use them to continue after a game over."
    //     0x42e644: ldr             x2, [x2, #0xd68]
    // 0x42e648: b               #0x42e668
    // 0x42e64c: cmp             x1, #0xea
    // 0x42e650: b.ne            #0x42e660
    // 0x42e654: r2 = "...немесе оларды ойын аяқталғаннан кейін жалғастыру үшін пайдаланыңыз."
    //     0x42e654: add             x2, PP, #0x11, lsl #12  ; [pp+0x11d70] "...немесе оларды ойын аяқталғаннан кейін жалғастыру үшін пайдаланыңыз."
    //     0x42e658: ldr             x2, [x2, #0xd70]
    // 0x42e65c: b               #0x42e668
    // 0x42e660: r2 = "...o úsalos para continuar después de que termine el juego."
    //     0x42e660: add             x2, PP, #0x11, lsl #12  ; [pp+0x11d78] "...o úsalos para continuar después de que termine el juego."
    //     0x42e664: ldr             x2, [x2, #0xd78]
    // 0x42e668: ldur            x0, [fp, #-0x28]
    // 0x42e66c: ldur            x1, [fp, #-0x10]
    // 0x42e670: stur            x2, [fp, #-8]
    // 0x42e674: r0 = Text()
    //     0x42e674: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42e678: mov             x2, x0
    // 0x42e67c: ldur            x0, [fp, #-8]
    // 0x42e680: stur            x2, [fp, #-0x18]
    // 0x42e684: StoreField: r2->field_b = r0
    //     0x42e684: stur            w0, [x2, #0xb]
    // 0x42e688: r1 = <FlexParentData>
    //     0x42e688: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c40] TypeArguments: <FlexParentData>
    //     0x42e68c: ldr             x1, [x1, #0xc40]
    // 0x42e690: r0 = Expanded()
    //     0x42e690: bl              #0x370d90  ; AllocateExpandedStub -> Expanded (size=0x20)
    // 0x42e694: mov             x3, x0
    // 0x42e698: r0 = 1
    //     0x42e698: mov             x0, #1
    // 0x42e69c: stur            x3, [fp, #-8]
    // 0x42e6a0: StoreField: r3->field_13 = r0
    //     0x42e6a0: stur            x0, [x3, #0x13]
    // 0x42e6a4: r0 = Instance_FlexFit
    //     0x42e6a4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11c48] Obj!FlexFit@5dac71
    //     0x42e6a8: ldr             x0, [x0, #0xc48]
    // 0x42e6ac: StoreField: r3->field_1b = r0
    //     0x42e6ac: stur            w0, [x3, #0x1b]
    // 0x42e6b0: ldur            x0, [fp, #-0x18]
    // 0x42e6b4: StoreField: r3->field_b = r0
    //     0x42e6b4: stur            w0, [x3, #0xb]
    // 0x42e6b8: r1 = Null
    //     0x42e6b8: mov             x1, NULL
    // 0x42e6bc: r2 = 6
    //     0x42e6bc: mov             x2, #6
    // 0x42e6c0: r0 = AllocateArray()
    //     0x42e6c0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42e6c4: mov             x2, x0
    // 0x42e6c8: ldur            x0, [fp, #-8]
    // 0x42e6cc: stur            x2, [fp, #-0x18]
    // 0x42e6d0: StoreField: r2->field_f = r0
    //     0x42e6d0: stur            w0, [x2, #0xf]
    // 0x42e6d4: r16 = Instance_SizedBox
    //     0x42e6d4: add             x16, PP, #0x11, lsl #12  ; [pp+0x11cc8] Obj!SizedBox@5d8441
    //     0x42e6d8: ldr             x16, [x16, #0xcc8]
    // 0x42e6dc: StoreField: r2->field_13 = r16
    //     0x42e6dc: stur            w16, [x2, #0x13]
    // 0x42e6e0: r16 = Instance_PlayerWidget
    //     0x42e6e0: add             x16, PP, #0x11, lsl #12  ; [pp+0x11d80] Obj!PlayerWidget@5d7f31
    //     0x42e6e4: ldr             x16, [x16, #0xd80]
    // 0x42e6e8: ArrayStore: r2[0] = r16  ; List_4
    //     0x42e6e8: stur            w16, [x2, #0x17]
    // 0x42e6ec: r1 = <Widget>
    //     0x42e6ec: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42e6f0: r0 = AllocateGrowableArray()
    //     0x42e6f0: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42e6f4: mov             x1, x0
    // 0x42e6f8: ldur            x0, [fp, #-0x18]
    // 0x42e6fc: stur            x1, [fp, #-8]
    // 0x42e700: StoreField: r1->field_f = r0
    //     0x42e700: stur            w0, [x1, #0xf]
    // 0x42e704: r0 = 6
    //     0x42e704: mov             x0, #6
    // 0x42e708: StoreField: r1->field_b = r0
    //     0x42e708: stur            w0, [x1, #0xb]
    // 0x42e70c: r0 = Row()
    //     0x42e70c: bl              #0x371614  ; AllocateRowStub -> Row (size=0x38)
    // 0x42e710: mov             x1, x0
    // 0x42e714: r0 = Instance_Axis
    //     0x42e714: ldr             x0, [PP, #0x7698]  ; [pp+0x7698] Obj!Axis@5daf91
    // 0x42e718: StoreField: r1->field_f = r0
    //     0x42e718: stur            w0, [x1, #0xf]
    // 0x42e71c: r0 = Instance_MainAxisAlignment
    //     0x42e71c: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb0] Obj!MainAxisAlignment@5dac11
    //     0x42e720: ldr             x0, [x0, #0xfb0]
    // 0x42e724: StoreField: r1->field_13 = r0
    //     0x42e724: stur            w0, [x1, #0x13]
    // 0x42e728: r0 = Instance_MainAxisSize
    //     0x42e728: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42e72c: ldr             x0, [x0, #0xfb8]
    // 0x42e730: ArrayStore: r1[0] = r0  ; List_4
    //     0x42e730: stur            w0, [x1, #0x17]
    // 0x42e734: r0 = Instance_CrossAxisAlignment
    //     0x42e734: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42e738: ldr             x0, [x0, #0xfc0]
    // 0x42e73c: StoreField: r1->field_1b = r0
    //     0x42e73c: stur            w0, [x1, #0x1b]
    // 0x42e740: r0 = Instance_VerticalDirection
    //     0x42e740: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42e744: ldr             x0, [x0, #0xfc8]
    // 0x42e748: StoreField: r1->field_23 = r0
    //     0x42e748: stur            w0, [x1, #0x23]
    // 0x42e74c: r0 = Instance_Clip
    //     0x42e74c: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42e750: ldr             x0, [x0, #0xfd0]
    // 0x42e754: StoreField: r1->field_2b = r0
    //     0x42e754: stur            w0, [x1, #0x2b]
    // 0x42e758: StoreField: r1->field_2f = rZR
    //     0x42e758: stur            xzr, [x1, #0x2f]
    // 0x42e75c: ldur            x0, [fp, #-8]
    // 0x42e760: StoreField: r1->field_b = r0
    //     0x42e760: stur            w0, [x1, #0xb]
    // 0x42e764: mov             x0, x1
    // 0x42e768: ldur            x1, [fp, #-0x10]
    // 0x42e76c: ArrayStore: r1[16] = r0  ; List_4
    //     0x42e76c: add             x25, x1, #0x4f
    //     0x42e770: str             w0, [x25]
    //     0x42e774: tbz             w0, #0, #0x42e790
    //     0x42e778: ldurb           w16, [x1, #-1]
    //     0x42e77c: ldurb           w17, [x0, #-1]
    //     0x42e780: and             x16, x17, x16, lsr #2
    //     0x42e784: tst             x16, HEAP, lsr #32
    //     0x42e788: b.eq            #0x42e790
    //     0x42e78c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x42e790: ldur            x0, [fp, #-0x10]
    // 0x42e794: r16 = Instance_SizedBox
    //     0x42e794: add             x16, PP, #0x11, lsl #12  ; [pp+0x11d88] Obj!SizedBox@5d8421
    //     0x42e798: ldr             x16, [x16, #0xd88]
    // 0x42e79c: StoreField: r0->field_53 = r16
    //     0x42e79c: stur            w16, [x0, #0x53]
    // 0x42e7a0: r1 = <Widget>
    //     0x42e7a0: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42e7a4: r0 = AllocateGrowableArray()
    //     0x42e7a4: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42e7a8: mov             x1, x0
    // 0x42e7ac: ldur            x0, [fp, #-0x10]
    // 0x42e7b0: stur            x1, [fp, #-8]
    // 0x42e7b4: StoreField: r1->field_f = r0
    //     0x42e7b4: stur            w0, [x1, #0xf]
    // 0x42e7b8: r0 = 36
    //     0x42e7b8: mov             x0, #0x24
    // 0x42e7bc: StoreField: r1->field_b = r0
    //     0x42e7bc: stur            w0, [x1, #0xb]
    // 0x42e7c0: r0 = ListView()
    //     0x42e7c0: bl              #0x387858  ; AllocateListViewStub -> ListView (size=0x6c)
    // 0x42e7c4: mov             x1, x0
    // 0x42e7c8: ldur            x2, [fp, #-8]
    // 0x42e7cc: stur            x0, [fp, #-8]
    // 0x42e7d0: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x42e7d0: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x42e7d4: r0 = ListView()
    //     0x42e7d4: bl              #0x3883fc  ; [package:flutter/src/widgets/scroll_view.dart] ListView::ListView
    // 0x42e7d8: ldur            x1, [fp, #-8]
    // 0x42e7dc: r0 = merge()
    //     0x42e7dc: bl              #0x42e88c  ; [package:flutter/src/widgets/text.dart] DefaultTextStyle::merge
    // 0x42e7e0: stur            x0, [fp, #-8]
    // 0x42e7e4: r0 = Padding()
    //     0x42e7e4: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x42e7e8: mov             x1, x0
    // 0x42e7ec: r0 = Instance_EdgeInsets
    //     0x42e7ec: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d90] Obj!EdgeInsets@5cbd41
    //     0x42e7f0: ldr             x0, [x0, #0xd90]
    // 0x42e7f4: stur            x1, [fp, #-0x10]
    // 0x42e7f8: StoreField: r1->field_f = r0
    //     0x42e7f8: stur            w0, [x1, #0xf]
    // 0x42e7fc: ldur            x0, [fp, #-8]
    // 0x42e800: StoreField: r1->field_b = r0
    //     0x42e800: stur            w0, [x1, #0xb]
    // 0x42e804: r0 = ConstrainedBox()
    //     0x42e804: bl              #0x35642c  ; AllocateConstrainedBoxStub -> ConstrainedBox (size=0x14)
    // 0x42e808: mov             x1, x0
    // 0x42e80c: r0 = Instance_BoxConstraints
    //     0x42e80c: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d98] Obj!BoxConstraints@5cb9a1
    //     0x42e810: ldr             x0, [x0, #0xd98]
    // 0x42e814: stur            x1, [fp, #-8]
    // 0x42e818: StoreField: r1->field_f = r0
    //     0x42e818: stur            w0, [x1, #0xf]
    // 0x42e81c: ldur            x0, [fp, #-0x10]
    // 0x42e820: StoreField: r1->field_b = r0
    //     0x42e820: stur            w0, [x1, #0xb]
    // 0x42e824: r0 = Center()
    //     0x42e824: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x42e828: mov             x1, x0
    // 0x42e82c: r0 = Instance_Alignment
    //     0x42e82c: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x42e830: ldr             x0, [x0, #0xb18]
    // 0x42e834: stur            x1, [fp, #-0x10]
    // 0x42e838: StoreField: r1->field_f = r0
    //     0x42e838: stur            w0, [x1, #0xf]
    // 0x42e83c: ldur            x0, [fp, #-8]
    // 0x42e840: StoreField: r1->field_b = r0
    //     0x42e840: stur            w0, [x1, #0xb]
    // 0x42e844: r0 = Scaffold()
    //     0x42e844: bl              #0x370d84  ; AllocateScaffoldStub -> Scaffold (size=0x50)
    // 0x42e848: ldur            x1, [fp, #-0x28]
    // 0x42e84c: StoreField: r0->field_13 = r1
    //     0x42e84c: stur            w1, [x0, #0x13]
    // 0x42e850: ldur            x1, [fp, #-0x10]
    // 0x42e854: ArrayStore: r0[0] = r1  ; List_4
    //     0x42e854: stur            w1, [x0, #0x17]
    // 0x42e858: r1 = true
    //     0x42e858: add             x1, NULL, #0x20  ; true
    // 0x42e85c: StoreField: r0->field_47 = r1
    //     0x42e85c: stur            w1, [x0, #0x47]
    // 0x42e860: r1 = false
    //     0x42e860: add             x1, NULL, #0x30  ; false
    // 0x42e864: StoreField: r0->field_b = r1
    //     0x42e864: stur            w1, [x0, #0xb]
    // 0x42e868: StoreField: r0->field_f = r1
    //     0x42e868: stur            w1, [x0, #0xf]
    // 0x42e86c: r1 = Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static.
    //     0x42e86c: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd50] Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static. (0x7c033375e380)
    //     0x42e870: ldr             x1, [x1, #0xd50]
    // 0x42e874: StoreField: r0->field_33 = r1
    //     0x42e874: stur            w1, [x0, #0x33]
    // 0x42e878: LeaveFrame
    //     0x42e878: mov             SP, fp
    //     0x42e87c: ldp             fp, lr, [SP], #0x10
    // 0x42e880: ret
    //     0x42e880: ret             
    // 0x42e884: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42e884: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42e888: b               #0x42d06c
  }
}
