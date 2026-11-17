// lib: , url: package:ricochlime/pages/shop.dart

// class id: 1049329, size: 0x8
class :: {
}

// class id: 2764, size: 0x18, field offset: 0xc
//   const constructor, 
class _ShopItemTile extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x42c964, size: 0x80
    // 0x42c964: EnterFrame
    //     0x42c964: stp             fp, lr, [SP, #-0x10]!
    //     0x42c968: mov             fp, SP
    // 0x42c96c: AllocStack(0x18)
    //     0x42c96c: sub             SP, SP, #0x18
    // 0x42c970: SetupParameters(_ShopItemTile this /* r1 => r1, fp-0x8 */)
    //     0x42c970: stur            x1, [fp, #-8]
    // 0x42c974: r1 = 1
    //     0x42c974: mov             x1, #1
    // 0x42c978: r0 = AllocateContext()
    //     0x42c978: bl              #0x5834e8  ; AllocateContextStub
    // 0x42c97c: mov             x2, x0
    // 0x42c980: ldur            x0, [fp, #-8]
    // 0x42c984: stur            x2, [fp, #-0x10]
    // 0x42c988: StoreField: r2->field_f = r0
    //     0x42c988: stur            w0, [x2, #0xf]
    // 0x42c98c: LoadField: r1 = r0->field_13
    //     0x42c98c: ldur            w1, [x0, #0x13]
    // 0x42c990: DecompressPointer r1
    //     0x42c990: add             x1, x1, HEAP, lsl #32
    // 0x42c994: LoadField: r0 = r1->field_13
    //     0x42c994: ldur            w0, [x1, #0x13]
    // 0x42c998: DecompressPointer r0
    //     0x42c998: add             x0, x0, HEAP, lsl #32
    // 0x42c99c: stur            x0, [fp, #-8]
    // 0x42c9a0: r1 = <ShopItemState>
    //     0x42c9a0: add             x1, PP, #8, lsl #12  ; [pp+0x8cc0] TypeArguments: <ShopItemState>
    //     0x42c9a4: ldr             x1, [x1, #0xcc0]
    // 0x42c9a8: r0 = ValueListenableBuilder()
    //     0x42c9a8: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x42c9ac: mov             x3, x0
    // 0x42c9b0: ldur            x0, [fp, #-8]
    // 0x42c9b4: stur            x3, [fp, #-0x18]
    // 0x42c9b8: StoreField: r3->field_f = r0
    //     0x42c9b8: stur            w0, [x3, #0xf]
    // 0x42c9bc: ldur            x2, [fp, #-0x10]
    // 0x42c9c0: r1 = Function '<anonymous closure>':.
    //     0x42c9c0: add             x1, PP, #0x13, lsl #12  ; [pp+0x13740] AnonymousClosure: (0x42c9e4), in [package:ricochlime/pages/shop.dart] _ShopItemTile::build (0x42c964)
    //     0x42c9c4: ldr             x1, [x1, #0x740]
    // 0x42c9c8: r0 = AllocateClosure()
    //     0x42c9c8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42c9cc: mov             x1, x0
    // 0x42c9d0: ldur            x0, [fp, #-0x18]
    // 0x42c9d4: StoreField: r0->field_13 = r1
    //     0x42c9d4: stur            w1, [x0, #0x13]
    // 0x42c9d8: LeaveFrame
    //     0x42c9d8: mov             SP, fp
    //     0x42c9dc: ldp             fp, lr, [SP], #0x10
    // 0x42c9e0: ret
    //     0x42c9e0: ret             
  }
  [closure] NesButton <anonymous closure>(dynamic, BuildContext, ShopItemState, Widget?) {
    // ** addr: 0x42c9e4, size: 0x408
    // 0x42c9e4: EnterFrame
    //     0x42c9e4: stp             fp, lr, [SP, #-0x10]!
    //     0x42c9e8: mov             fp, SP
    // 0x42c9ec: AllocStack(0x40)
    //     0x42c9ec: sub             SP, SP, #0x40
    // 0x42c9f0: SetupParameters([dynamic _ /* r0 */])
    //     0x42c9f0: ldr             x0, [fp, #0x28]
    //     0x42c9f4: ldur            w3, [x0, #0x17]
    //     0x42c9f8: add             x3, x3, HEAP, lsl #32
    //     0x42c9fc: stur            x3, [fp, #-0x10]
    // 0x42ca00: CheckStackOverflow
    //     0x42ca00: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ca04: cmp             SP, x16
    //     0x42ca08: b.ls            #0x42cde4
    // 0x42ca0c: ldr             x0, [fp, #0x18]
    // 0x42ca10: LoadField: r4 = r0->field_7
    //     0x42ca10: ldur            x4, [x0, #7]
    // 0x42ca14: stur            x4, [fp, #-8]
    // 0x42ca18: cmp             x4, #1
    // 0x42ca1c: b.gt            #0x42ca4c
    // 0x42ca20: cmp             x4, #0
    // 0x42ca24: b.gt            #0x42ca34
    // 0x42ca28: mov             x0, x4
    // 0x42ca2c: r2 = Null
    //     0x42ca2c: mov             x2, NULL
    // 0x42ca30: b               #0x42ca64
    // 0x42ca34: LoadField: r1 = r3->field_f
    //     0x42ca34: ldur            w1, [x3, #0xf]
    // 0x42ca38: DecompressPointer r1
    //     0x42ca38: add             x1, x1, HEAP, lsl #32
    // 0x42ca3c: LoadField: r2 = r1->field_f
    //     0x42ca3c: ldur            w2, [x1, #0xf]
    // 0x42ca40: DecompressPointer r2
    //     0x42ca40: add             x2, x2, HEAP, lsl #32
    // 0x42ca44: mov             x0, x4
    // 0x42ca48: b               #0x42ca64
    // 0x42ca4c: mov             x2, x3
    // 0x42ca50: r1 = Function '<anonymous closure>':.
    //     0x42ca50: add             x1, PP, #0x13, lsl #12  ; [pp+0x13748] AnonymousClosure: (0x42cdf8), in [package:ricochlime/pages/shop.dart] _ShopItemTile::build (0x42c964)
    //     0x42ca54: ldr             x1, [x1, #0x748]
    // 0x42ca58: r0 = AllocateClosure()
    //     0x42ca58: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42ca5c: mov             x2, x0
    // 0x42ca60: ldur            x0, [fp, #-8]
    // 0x42ca64: stur            x2, [fp, #-0x20]
    // 0x42ca68: cmp             x0, #1
    // 0x42ca6c: b.gt            #0x42cabc
    // 0x42ca70: cmp             x0, #0
    // 0x42ca74: b.gt            #0x42ca88
    // 0x42ca78: ldur            x0, [fp, #-0x10]
    // 0x42ca7c: r3 = Instance_NesButtonType
    //     0x42ca7c: add             x3, PP, #0x11, lsl #12  ; [pp+0x11060] Obj!NesButtonType@5d8e11
    //     0x42ca80: ldr             x3, [x3, #0x60]
    // 0x42ca84: b               #0x42cac8
    // 0x42ca88: ldur            x0, [fp, #-0x10]
    // 0x42ca8c: LoadField: r1 = r0->field_f
    //     0x42ca8c: ldur            w1, [x0, #0xf]
    // 0x42ca90: DecompressPointer r1
    //     0x42ca90: add             x1, x1, HEAP, lsl #32
    // 0x42ca94: LoadField: r3 = r1->field_b
    //     0x42ca94: ldur            w3, [x1, #0xb]
    // 0x42ca98: DecompressPointer r3
    //     0x42ca98: add             x3, x3, HEAP, lsl #32
    // 0x42ca9c: tbnz            w3, #4, #0x42caac
    // 0x42caa0: r1 = Instance_NesButtonType
    //     0x42caa0: add             x1, PP, #0x11, lsl #12  ; [pp+0x11028] Obj!NesButtonType@5d8e31
    //     0x42caa4: ldr             x1, [x1, #0x28]
    // 0x42caa8: b               #0x42cab4
    // 0x42caac: r1 = Instance_NesButtonType
    //     0x42caac: add             x1, PP, #0x11, lsl #12  ; [pp+0x11060] Obj!NesButtonType@5d8e11
    //     0x42cab0: ldr             x1, [x1, #0x60]
    // 0x42cab4: mov             x3, x1
    // 0x42cab8: b               #0x42cac8
    // 0x42cabc: ldur            x0, [fp, #-0x10]
    // 0x42cac0: r3 = Instance_NesButtonType
    //     0x42cac0: add             x3, PP, #0x13, lsl #12  ; [pp+0x13750] Obj!NesButtonType@5d8e51
    //     0x42cac4: ldr             x3, [x3, #0x750]
    // 0x42cac8: ldr             x1, [fp, #0x18]
    // 0x42cacc: stur            x3, [fp, #-0x18]
    // 0x42cad0: r16 = Instance_ShopItemState
    //     0x42cad0: add             x16, PP, #8, lsl #12  ; [pp+0x8cd0] Obj!ShopItemState@5d8941
    //     0x42cad4: ldr             x16, [x16, #0xcd0]
    // 0x42cad8: cmp             w1, w16
    // 0x42cadc: b.ne            #0x42cc40
    // 0x42cae0: LoadField: r1 = r0->field_f
    //     0x42cae0: ldur            w1, [x0, #0xf]
    // 0x42cae4: DecompressPointer r1
    //     0x42cae4: add             x1, x1, HEAP, lsl #32
    // 0x42cae8: LoadField: r0 = r1->field_13
    //     0x42cae8: ldur            w0, [x1, #0x13]
    // 0x42caec: DecompressPointer r0
    //     0x42caec: add             x0, x0, HEAP, lsl #32
    // 0x42caf0: r1 = LoadClassIdInstr(r0)
    //     0x42caf0: ldur            x1, [x0, #-1]
    //     0x42caf4: ubfx            x1, x1, #0xc, #0x14
    // 0x42caf8: cmp             x1, #0xde
    // 0x42cafc: b.ne            #0x42cb74
    // 0x42cb00: mov             x1, x0
    // 0x42cb04: LoadField: r0 = r1->field_1b
    //     0x42cb04: ldur            w0, [x1, #0x1b]
    // 0x42cb08: DecompressPointer r0
    //     0x42cb08: add             x0, x0, HEAP, lsl #32
    // 0x42cb0c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42cb10: cmp             w0, w16
    // 0x42cb14: b.ne            #0x42cb24
    // 0x42cb18: r2 = sprite
    //     0x42cb18: add             x2, PP, #0x13, lsl #12  ; [pp+0x13758] Field <BulletShapeShopItem.sprite>: late final (offset: 0x1c)
    //     0x42cb1c: ldr             x2, [x2, #0x758]
    // 0x42cb20: r0 = InitLateFinalInstanceField()
    //     0x42cb20: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42cb24: stur            x0, [fp, #-0x28]
    // 0x42cb28: r0 = BulletPainter()
    //     0x42cb28: bl              #0x42cdec  ; AllocateBulletPainterStub -> BulletPainter (size=0x14)
    // 0x42cb2c: mov             x1, x0
    // 0x42cb30: r0 = Instance_Color
    //     0x42cb30: add             x0, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x42cb34: ldr             x0, [x0, #0x710]
    // 0x42cb38: stur            x1, [fp, #-0x30]
    // 0x42cb3c: StoreField: r1->field_b = r0
    //     0x42cb3c: stur            w0, [x1, #0xb]
    // 0x42cb40: ldur            x0, [fp, #-0x28]
    // 0x42cb44: StoreField: r1->field_f = r0
    //     0x42cb44: stur            w0, [x1, #0xf]
    // 0x42cb48: r0 = CustomPaint()
    //     0x42cb48: bl              #0x35cd60  ; AllocateCustomPaintStub -> CustomPaint (size=0x24)
    // 0x42cb4c: mov             x1, x0
    // 0x42cb50: ldur            x0, [fp, #-0x30]
    // 0x42cb54: StoreField: r1->field_f = r0
    //     0x42cb54: stur            w0, [x1, #0xf]
    // 0x42cb58: r2 = Instance_Size
    //     0x42cb58: ldr             x2, [PP, #0x31e0]  ; [pp+0x31e0] Obj!Size@5d00a1
    // 0x42cb5c: ArrayStore: r1[0] = r2  ; List_4
    //     0x42cb5c: stur            w2, [x1, #0x17]
    // 0x42cb60: r3 = false
    //     0x42cb60: add             x3, NULL, #0x30  ; false
    // 0x42cb64: StoreField: r1->field_1b = r3
    //     0x42cb64: stur            w3, [x1, #0x1b]
    // 0x42cb68: StoreField: r1->field_1f = r3
    //     0x42cb68: stur            w3, [x1, #0x1f]
    // 0x42cb6c: mov             x0, x1
    // 0x42cb70: b               #0x42cbf8
    // 0x42cb74: r3 = false
    //     0x42cb74: add             x3, NULL, #0x30  ; false
    // 0x42cb78: r2 = Instance_Size
    //     0x42cb78: ldr             x2, [PP, #0x31e0]  ; [pp+0x31e0] Obj!Size@5d00a1
    // 0x42cb7c: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x42cb7c: ldur            w1, [x0, #0x17]
    // 0x42cb80: DecompressPointer r1
    //     0x42cb80: add             x1, x1, HEAP, lsl #32
    // 0x42cb84: stur            x1, [fp, #-0x28]
    // 0x42cb88: r0 = defaultBulletShape()
    //     0x42cb88: bl              #0x3c950c  ; [package:ricochlime/utils/shop_items.dart] ShopItems::defaultBulletShape
    // 0x42cb8c: mov             x1, x0
    // 0x42cb90: LoadField: r0 = r1->field_1b
    //     0x42cb90: ldur            w0, [x1, #0x1b]
    // 0x42cb94: DecompressPointer r0
    //     0x42cb94: add             x0, x0, HEAP, lsl #32
    // 0x42cb98: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42cb9c: cmp             w0, w16
    // 0x42cba0: b.ne            #0x42cbb0
    // 0x42cba4: r2 = sprite
    //     0x42cba4: add             x2, PP, #0x13, lsl #12  ; [pp+0x13758] Field <BulletShapeShopItem.sprite>: late final (offset: 0x1c)
    //     0x42cba8: ldr             x2, [x2, #0x758]
    // 0x42cbac: r0 = InitLateFinalInstanceField()
    //     0x42cbac: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42cbb0: stur            x0, [fp, #-0x30]
    // 0x42cbb4: r0 = BulletPainter()
    //     0x42cbb4: bl              #0x42cdec  ; AllocateBulletPainterStub -> BulletPainter (size=0x14)
    // 0x42cbb8: mov             x1, x0
    // 0x42cbbc: ldur            x0, [fp, #-0x28]
    // 0x42cbc0: stur            x1, [fp, #-0x38]
    // 0x42cbc4: StoreField: r1->field_b = r0
    //     0x42cbc4: stur            w0, [x1, #0xb]
    // 0x42cbc8: ldur            x0, [fp, #-0x30]
    // 0x42cbcc: StoreField: r1->field_f = r0
    //     0x42cbcc: stur            w0, [x1, #0xf]
    // 0x42cbd0: r0 = CustomPaint()
    //     0x42cbd0: bl              #0x35cd60  ; AllocateCustomPaintStub -> CustomPaint (size=0x24)
    // 0x42cbd4: mov             x1, x0
    // 0x42cbd8: ldur            x0, [fp, #-0x38]
    // 0x42cbdc: StoreField: r1->field_f = r0
    //     0x42cbdc: stur            w0, [x1, #0xf]
    // 0x42cbe0: r0 = Instance_Size
    //     0x42cbe0: ldr             x0, [PP, #0x31e0]  ; [pp+0x31e0] Obj!Size@5d00a1
    // 0x42cbe4: ArrayStore: r1[0] = r0  ; List_4
    //     0x42cbe4: stur            w0, [x1, #0x17]
    // 0x42cbe8: r0 = false
    //     0x42cbe8: add             x0, NULL, #0x30  ; false
    // 0x42cbec: StoreField: r1->field_1b = r0
    //     0x42cbec: stur            w0, [x1, #0x1b]
    // 0x42cbf0: StoreField: r1->field_1f = r0
    //     0x42cbf0: stur            w0, [x1, #0x1f]
    // 0x42cbf4: mov             x0, x1
    // 0x42cbf8: stur            x0, [fp, #-0x28]
    // 0x42cbfc: r0 = SizedBox()
    //     0x42cbfc: bl              #0x363c60  ; AllocateSizedBoxStub -> SizedBox (size=0x18)
    // 0x42cc00: mov             x1, x0
    // 0x42cc04: r0 = 20.000000
    //     0x42cc04: add             x0, PP, #0x13, lsl #12  ; [pp+0x13760] 20
    //     0x42cc08: ldr             x0, [x0, #0x760]
    // 0x42cc0c: stur            x1, [fp, #-0x30]
    // 0x42cc10: StoreField: r1->field_f = r0
    //     0x42cc10: stur            w0, [x1, #0xf]
    // 0x42cc14: StoreField: r1->field_13 = r0
    //     0x42cc14: stur            w0, [x1, #0x13]
    // 0x42cc18: ldur            x0, [fp, #-0x28]
    // 0x42cc1c: StoreField: r1->field_b = r0
    //     0x42cc1c: stur            w0, [x1, #0xb]
    // 0x42cc20: r0 = Center()
    //     0x42cc20: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x42cc24: r2 = Instance_Alignment
    //     0x42cc24: add             x2, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x42cc28: ldr             x2, [x2, #0xb18]
    // 0x42cc2c: StoreField: r0->field_f = r2
    //     0x42cc2c: stur            w2, [x0, #0xf]
    // 0x42cc30: ldur            x1, [fp, #-0x30]
    // 0x42cc34: StoreField: r0->field_b = r1
    //     0x42cc34: stur            w1, [x0, #0xb]
    // 0x42cc38: mov             x2, x0
    // 0x42cc3c: b               #0x42cd98
    // 0x42cc40: r2 = Instance_Alignment
    //     0x42cc40: add             x2, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x42cc44: ldr             x2, [x2, #0xb18]
    // 0x42cc48: LoadField: r1 = r0->field_f
    //     0x42cc48: ldur            w1, [x0, #0xf]
    // 0x42cc4c: DecompressPointer r1
    //     0x42cc4c: add             x1, x1, HEAP, lsl #32
    // 0x42cc50: LoadField: r0 = r1->field_13
    //     0x42cc50: ldur            w0, [x1, #0x13]
    // 0x42cc54: DecompressPointer r0
    //     0x42cc54: add             x0, x0, HEAP, lsl #32
    // 0x42cc58: LoadField: r3 = r0->field_b
    //     0x42cc58: ldur            x3, [x0, #0xb]
    // 0x42cc5c: r0 = BoxInt64Instr(r3)
    //     0x42cc5c: sbfiz           x0, x3, #1, #0x1f
    //     0x42cc60: cmp             x3, x0, asr #1
    //     0x42cc64: b.eq            #0x42cc70
    //     0x42cc68: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x42cc6c: stur            x3, [x0, #7]
    // 0x42cc70: r1 = 60
    //     0x42cc70: mov             x1, #0x3c
    // 0x42cc74: branchIfSmi(r0, 0x42cc80)
    //     0x42cc74: tbz             w0, #0, #0x42cc80
    // 0x42cc78: r1 = LoadClassIdInstr(r0)
    //     0x42cc78: ldur            x1, [x0, #-1]
    //     0x42cc7c: ubfx            x1, x1, #0xc, #0x14
    // 0x42cc80: str             x0, [SP]
    // 0x42cc84: mov             x0, x1
    // 0x42cc88: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x42cc88: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x42cc8c: r0 = GDT[cid_x0 + 0x2f3d]()
    //     0x42cc8c: mov             x17, #0x2f3d
    //     0x42cc90: add             lr, x0, x17
    //     0x42cc94: ldr             lr, [x21, lr, lsl #3]
    //     0x42cc98: blr             lr
    // 0x42cc9c: stur            x0, [fp, #-0x10]
    // 0x42cca0: r0 = Text()
    //     0x42cca0: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42cca4: mov             x3, x0
    // 0x42cca8: ldur            x0, [fp, #-0x10]
    // 0x42ccac: stur            x3, [fp, #-0x28]
    // 0x42ccb0: StoreField: r3->field_b = r0
    //     0x42ccb0: stur            w0, [x3, #0xb]
    // 0x42ccb4: r0 = Instance_TextStyle
    //     0x42ccb4: add             x0, PP, #0x13, lsl #12  ; [pp+0x13768] Obj!TextStyle@5d5911
    //     0x42ccb8: ldr             x0, [x0, #0x768]
    // 0x42ccbc: StoreField: r3->field_13 = r0
    //     0x42ccbc: stur            w0, [x3, #0x13]
    // 0x42ccc0: r1 = Null
    //     0x42ccc0: mov             x1, NULL
    // 0x42ccc4: r2 = 4
    //     0x42ccc4: mov             x2, #4
    // 0x42ccc8: r0 = AllocateArray()
    //     0x42ccc8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42cccc: stur            x0, [fp, #-0x10]
    // 0x42ccd0: r16 = Instance_CoinIcon
    //     0x42ccd0: add             x16, PP, #0x13, lsl #12  ; [pp+0x13770] Obj!CoinIcon@5d8061
    //     0x42ccd4: ldr             x16, [x16, #0x770]
    // 0x42ccd8: StoreField: r0->field_f = r16
    //     0x42ccd8: stur            w16, [x0, #0xf]
    // 0x42ccdc: ldur            x1, [fp, #-0x28]
    // 0x42cce0: StoreField: r0->field_13 = r1
    //     0x42cce0: stur            w1, [x0, #0x13]
    // 0x42cce4: r1 = <Widget>
    //     0x42cce4: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42cce8: r0 = AllocateGrowableArray()
    //     0x42cce8: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42ccec: mov             x1, x0
    // 0x42ccf0: ldur            x0, [fp, #-0x10]
    // 0x42ccf4: stur            x1, [fp, #-0x28]
    // 0x42ccf8: StoreField: r1->field_f = r0
    //     0x42ccf8: stur            w0, [x1, #0xf]
    // 0x42ccfc: r0 = 4
    //     0x42ccfc: mov             x0, #4
    // 0x42cd00: StoreField: r1->field_b = r0
    //     0x42cd00: stur            w0, [x1, #0xb]
    // 0x42cd04: r0 = Column()
    //     0x42cd04: bl              #0x3715fc  ; AllocateColumnStub -> Column (size=0x38)
    // 0x42cd08: mov             x1, x0
    // 0x42cd0c: r0 = Instance_Axis
    //     0x42cd0c: ldr             x0, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x42cd10: stur            x1, [fp, #-0x10]
    // 0x42cd14: StoreField: r1->field_f = r0
    //     0x42cd14: stur            w0, [x1, #0xf]
    // 0x42cd18: r0 = Instance_MainAxisAlignment
    //     0x42cd18: add             x0, PP, #0x13, lsl #12  ; [pp+0x13778] Obj!MainAxisAlignment@5dabd1
    //     0x42cd1c: ldr             x0, [x0, #0x778]
    // 0x42cd20: StoreField: r1->field_13 = r0
    //     0x42cd20: stur            w0, [x1, #0x13]
    // 0x42cd24: r0 = Instance_MainAxisSize
    //     0x42cd24: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fb8] Obj!MainAxisSize@5dac51
    //     0x42cd28: ldr             x0, [x0, #0xfb8]
    // 0x42cd2c: ArrayStore: r1[0] = r0  ; List_4
    //     0x42cd2c: stur            w0, [x1, #0x17]
    // 0x42cd30: r0 = Instance_CrossAxisAlignment
    //     0x42cd30: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc0] Obj!CrossAxisAlignment@5dab11
    //     0x42cd34: ldr             x0, [x0, #0xfc0]
    // 0x42cd38: StoreField: r1->field_1b = r0
    //     0x42cd38: stur            w0, [x1, #0x1b]
    // 0x42cd3c: r0 = Instance_VerticalDirection
    //     0x42cd3c: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fc8] Obj!VerticalDirection@5daf71
    //     0x42cd40: ldr             x0, [x0, #0xfc8]
    // 0x42cd44: StoreField: r1->field_23 = r0
    //     0x42cd44: stur            w0, [x1, #0x23]
    // 0x42cd48: r0 = Instance_Clip
    //     0x42cd48: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42cd4c: ldr             x0, [x0, #0xfd0]
    // 0x42cd50: StoreField: r1->field_2b = r0
    //     0x42cd50: stur            w0, [x1, #0x2b]
    // 0x42cd54: StoreField: r1->field_2f = rZR
    //     0x42cd54: stur            xzr, [x1, #0x2f]
    // 0x42cd58: ldur            x2, [fp, #-0x28]
    // 0x42cd5c: StoreField: r1->field_b = r2
    //     0x42cd5c: stur            w2, [x1, #0xb]
    // 0x42cd60: r0 = FittedBox()
    //     0x42cd60: bl              #0x370e1c  ; AllocateFittedBoxStub -> FittedBox (size=0x1c)
    // 0x42cd64: mov             x1, x0
    // 0x42cd68: r0 = Instance_BoxFit
    //     0x42cd68: add             x0, PP, #0x11, lsl #12  ; [pp+0x110d8] Obj!BoxFit@5dae31
    //     0x42cd6c: ldr             x0, [x0, #0xd8]
    // 0x42cd70: StoreField: r1->field_f = r0
    //     0x42cd70: stur            w0, [x1, #0xf]
    // 0x42cd74: r0 = Instance_Alignment
    //     0x42cd74: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x42cd78: ldr             x0, [x0, #0xb18]
    // 0x42cd7c: StoreField: r1->field_13 = r0
    //     0x42cd7c: stur            w0, [x1, #0x13]
    // 0x42cd80: r0 = Instance_Clip
    //     0x42cd80: add             x0, PP, #0x10, lsl #12  ; [pp+0x10fd0] Obj!Clip@5dc851
    //     0x42cd84: ldr             x0, [x0, #0xfd0]
    // 0x42cd88: ArrayStore: r1[0] = r0  ; List_4
    //     0x42cd88: stur            w0, [x1, #0x17]
    // 0x42cd8c: ldur            x0, [fp, #-0x10]
    // 0x42cd90: StoreField: r1->field_b = r0
    //     0x42cd90: stur            w0, [x1, #0xb]
    // 0x42cd94: mov             x2, x1
    // 0x42cd98: ldur            x0, [fp, #-0x20]
    // 0x42cd9c: ldur            x1, [fp, #-0x18]
    // 0x42cda0: stur            x2, [fp, #-0x10]
    // 0x42cda4: r0 = NesButton()
    //     0x42cda4: bl              #0x380374  ; AllocateNesButtonStub -> NesButton (size=0x28)
    // 0x42cda8: ldur            x1, [fp, #-0x18]
    // 0x42cdac: StoreField: r0->field_b = r1
    //     0x42cdac: stur            w1, [x0, #0xb]
    // 0x42cdb0: ldur            x1, [fp, #-0x10]
    // 0x42cdb4: StoreField: r0->field_f = r1
    //     0x42cdb4: stur            w1, [x0, #0xf]
    // 0x42cdb8: ldur            x1, [fp, #-0x20]
    // 0x42cdbc: ArrayStore: r0[0] = r1  ; List_4
    //     0x42cdbc: stur            w1, [x0, #0x17]
    // 0x42cdc0: cmp             w1, NULL
    // 0x42cdc4: b.ne            #0x42cdd0
    // 0x42cdc8: r1 = true
    //     0x42cdc8: add             x1, NULL, #0x20  ; true
    // 0x42cdcc: b               #0x42cdd4
    // 0x42cdd0: r1 = false
    //     0x42cdd0: add             x1, NULL, #0x30  ; false
    // 0x42cdd4: StoreField: r0->field_23 = r1
    //     0x42cdd4: stur            w1, [x0, #0x23]
    // 0x42cdd8: LeaveFrame
    //     0x42cdd8: mov             SP, fp
    //     0x42cddc: ldp             fp, lr, [SP], #0x10
    // 0x42cde0: ret
    //     0x42cde0: ret             
    // 0x42cde4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42cde4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42cde8: b               #0x42ca0c
  }
  [closure] Future<void> <anonymous closure>(dynamic) async {
    // ** addr: 0x42cdf8, size: 0xa4
    // 0x42cdf8: EnterFrame
    //     0x42cdf8: stp             fp, lr, [SP, #-0x10]!
    //     0x42cdfc: mov             fp, SP
    // 0x42ce00: AllocStack(0x20)
    //     0x42ce00: sub             SP, SP, #0x20
    // 0x42ce04: SetupParameters(_ShopItemTile this /* r1 */)
    //     0x42ce04: stur            NULL, [fp, #-8]
    //     0x42ce08: mov             x0, #0
    //     0x42ce0c: add             x1, fp, w0, sxtw #2
    //     0x42ce10: ldr             x1, [x1, #0x10]
    //     0x42ce14: ldur            w2, [x1, #0x17]
    //     0x42ce18: add             x2, x2, HEAP, lsl #32
    //     0x42ce1c: stur            x2, [fp, #-0x10]
    // 0x42ce20: CheckStackOverflow
    //     0x42ce20: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ce24: cmp             SP, x16
    //     0x42ce28: b.ls            #0x42ce94
    // 0x42ce2c: InitAsync() -> Future<void?>
    //     0x42ce2c: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x42ce30: bl              #0x2556b4  ; InitAsyncStub
    // 0x42ce34: ldur            x0, [fp, #-0x10]
    // 0x42ce38: LoadField: r1 = r0->field_f
    //     0x42ce38: ldur            w1, [x0, #0xf]
    // 0x42ce3c: DecompressPointer r1
    //     0x42ce3c: add             x1, x1, HEAP, lsl #32
    // 0x42ce40: LoadField: r2 = r1->field_13
    //     0x42ce40: ldur            w2, [x1, #0x13]
    // 0x42ce44: DecompressPointer r2
    //     0x42ce44: add             x2, x2, HEAP, lsl #32
    // 0x42ce48: mov             x1, x2
    // 0x42ce4c: r0 = purchase()
    //     0x42ce4c: bl              #0x42ce9c  ; [package:ricochlime/utils/shop_items.dart] ShopItem::purchase
    // 0x42ce50: mov             x1, x0
    // 0x42ce54: stur            x1, [fp, #-0x18]
    // 0x42ce58: r0 = Await()
    //     0x42ce58: bl              #0x255470  ; AwaitStub
    // 0x42ce5c: r16 = true
    //     0x42ce5c: add             x16, NULL, #0x20  ; true
    // 0x42ce60: cmp             w0, w16
    // 0x42ce64: b.ne            #0x42ce8c
    // 0x42ce68: ldur            x0, [fp, #-0x10]
    // 0x42ce6c: LoadField: r1 = r0->field_f
    //     0x42ce6c: ldur            w1, [x0, #0xf]
    // 0x42ce70: DecompressPointer r1
    //     0x42ce70: add             x1, x1, HEAP, lsl #32
    // 0x42ce74: LoadField: r0 = r1->field_f
    //     0x42ce74: ldur            w0, [x1, #0xf]
    // 0x42ce78: DecompressPointer r0
    //     0x42ce78: add             x0, x0, HEAP, lsl #32
    // 0x42ce7c: str             x0, [SP]
    // 0x42ce80: ClosureCall
    //     0x42ce80: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    //     0x42ce84: ldur            x2, [x0, #0x1f]
    //     0x42ce88: blr             x2
    // 0x42ce8c: r0 = Null
    //     0x42ce8c: mov             x0, NULL
    // 0x42ce90: r0 = ReturnAsyncNotFuture()
    //     0x42ce90: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x42ce94: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42ce94: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42ce98: b               #0x42ce2c
  }
}

// class id: 2765, size: 0xc, field offset: 0xc
//   const constructor, 
class ShopPage extends StatelessWidget {

  _ build(/* No info */) {
    // ** addr: 0x42b9f4, size: 0x7a4
    // 0x42b9f4: EnterFrame
    //     0x42b9f4: stp             fp, lr, [SP, #-0x10]!
    //     0x42b9f8: mov             fp, SP
    // 0x42b9fc: AllocStack(0x60)
    //     0x42b9fc: sub             SP, SP, #0x60
    // 0x42ba00: SetupParameters(ShopPage this /* r1 => r0 */, dynamic _ /* r2 => r1, fp-0x8 */)
    //     0x42ba00: mov             x0, x1
    //     0x42ba04: mov             x1, x2
    //     0x42ba08: stur            x2, [fp, #-8]
    // 0x42ba0c: CheckStackOverflow
    //     0x42ba0c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42ba10: cmp             SP, x16
    //     0x42ba14: b.ls            #0x42c190
    // 0x42ba18: r1 = 1
    //     0x42ba18: mov             x1, #1
    // 0x42ba1c: r0 = AllocateContext()
    //     0x42ba1c: bl              #0x5834e8  ; AllocateContextStub
    // 0x42ba20: ldur            x1, [fp, #-8]
    // 0x42ba24: stur            x0, [fp, #-0x10]
    // 0x42ba28: StoreField: r0->field_f = r1
    //     0x42ba28: stur            w1, [x0, #0xf]
    // 0x42ba2c: r0 = sizeOf()
    //     0x42ba2c: bl              #0x332910  ; [package:flutter/src/widgets/media_query.dart] MediaQuery::sizeOf
    // 0x42ba30: stur            x0, [fp, #-8]
    // 0x42ba34: r0 = LoadStaticField(0x468)
    //     0x42ba34: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42ba38: ldr             x0, [x0, #0x8d0]
    // 0x42ba3c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ba40: cmp             w0, w16
    // 0x42ba44: b.ne            #0x42ba50
    // 0x42ba48: r2 = instance
    //     0x42ba48: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x42ba4c: r0 = InitLateFinalStaticField()
    //     0x42ba4c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42ba50: stur            x0, [fp, #-0x18]
    // 0x42ba54: r16 = <AppLocale, Translations>
    //     0x42ba54: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42ba58: stp             x0, x16, [SP]
    // 0x42ba5c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42ba5c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42ba60: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42ba60: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42ba64: r1 = LoadClassIdInstr(r0)
    //     0x42ba64: ldur            x1, [x0, #-1]
    //     0x42ba68: ubfx            x1, x1, #0xc, #0x14
    // 0x42ba6c: cmp             x1, #0x8dd
    // 0x42ba70: b.ne            #0x42ba9c
    // 0x42ba74: mov             x1, x0
    // 0x42ba78: LoadField: r0 = r1->field_27
    //     0x42ba78: ldur            w0, [x1, #0x27]
    // 0x42ba7c: DecompressPointer r0
    //     0x42ba7c: add             x0, x0, HEAP, lsl #32
    // 0x42ba80: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42ba84: cmp             w0, w16
    // 0x42ba88: b.ne            #0x42ba98
    // 0x42ba8c: r2 = shopPage
    //     0x42ba8c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11e90] Field <Translations.shopPage>: late final (offset: 0x28)
    //     0x42ba90: ldr             x2, [x2, #0xe90]
    // 0x42ba94: r0 = InitLateFinalInstanceField()
    //     0x42ba94: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42ba98: b               #0x42bb20
    // 0x42ba9c: cmp             x1, #0x8df
    // 0x42baa0: b.ne            #0x42bacc
    // 0x42baa4: mov             x1, x0
    // 0x42baa8: LoadField: r0 = r1->field_4b
    //     0x42baa8: ldur            w0, [x1, #0x4b]
    // 0x42baac: DecompressPointer r0
    //     0x42baac: add             x0, x0, HEAP, lsl #32
    // 0x42bab0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bab4: cmp             w0, w16
    // 0x42bab8: b.ne            #0x42bac8
    // 0x42babc: r2 = shopPage
    //     0x42babc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11e98] Field <TranslationsRu.shopPage>: late final (offset: 0x4c)
    //     0x42bac0: ldr             x2, [x2, #0xe98]
    // 0x42bac4: r0 = InitLateFinalInstanceField()
    //     0x42bac4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bac8: b               #0x42bb20
    // 0x42bacc: cmp             x1, #0x8e0
    // 0x42bad0: b.ne            #0x42bafc
    // 0x42bad4: mov             x1, x0
    // 0x42bad8: LoadField: r0 = r1->field_4b
    //     0x42bad8: ldur            w0, [x1, #0x4b]
    // 0x42badc: DecompressPointer r0
    //     0x42badc: add             x0, x0, HEAP, lsl #32
    // 0x42bae0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bae4: cmp             w0, w16
    // 0x42bae8: b.ne            #0x42baf8
    // 0x42baec: r2 = shopPage
    //     0x42baec: add             x2, PP, #0x11, lsl #12  ; [pp+0x11ea0] Field <TranslationsKk.shopPage>: late final (offset: 0x4c)
    //     0x42baf0: ldr             x2, [x2, #0xea0]
    // 0x42baf4: r0 = InitLateFinalInstanceField()
    //     0x42baf4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42baf8: b               #0x42bb20
    // 0x42bafc: mov             x1, x0
    // 0x42bb00: LoadField: r0 = r1->field_4b
    //     0x42bb00: ldur            w0, [x1, #0x4b]
    // 0x42bb04: DecompressPointer r0
    //     0x42bb04: add             x0, x0, HEAP, lsl #32
    // 0x42bb08: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bb0c: cmp             w0, w16
    // 0x42bb10: b.ne            #0x42bb20
    // 0x42bb14: r2 = shopPage
    //     0x42bb14: add             x2, PP, #0x11, lsl #12  ; [pp+0x11ea8] Field <TranslationsEs.shopPage>: late final (offset: 0x4c)
    //     0x42bb18: ldr             x2, [x2, #0xea8]
    // 0x42bb1c: r0 = InitLateFinalInstanceField()
    //     0x42bb1c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bb20: r1 = LoadClassIdInstr(r0)
    //     0x42bb20: ldur            x1, [x0, #-1]
    //     0x42bb24: ubfx            x1, x1, #0xc, #0x14
    // 0x42bb28: cmp             x1, #0xe4
    // 0x42bb2c: b.ne            #0x42bb3c
    // 0x42bb30: r1 = "Shop"
    //     0x42bb30: add             x1, PP, #0x11, lsl #12  ; [pp+0x11040] "Shop"
    //     0x42bb34: ldr             x1, [x1, #0x40]
    // 0x42bb38: b               #0x42bb6c
    // 0x42bb3c: cmp             x1, #0xe5
    // 0x42bb40: b.ne            #0x42bb50
    // 0x42bb44: r1 = "Магазин"
    //     0x42bb44: add             x1, PP, #0x11, lsl #12  ; [pp+0x11eb0] "Магазин"
    //     0x42bb48: ldr             x1, [x1, #0xeb0]
    // 0x42bb4c: b               #0x42bb6c
    // 0x42bb50: cmp             x1, #0xe6
    // 0x42bb54: b.ne            #0x42bb64
    // 0x42bb58: r1 = "дүкен"
    //     0x42bb58: add             x1, PP, #0x11, lsl #12  ; [pp+0x11050] "дүкен"
    //     0x42bb5c: ldr             x1, [x1, #0x50]
    // 0x42bb60: b               #0x42bb6c
    // 0x42bb64: r1 = "Comercio"
    //     0x42bb64: add             x1, PP, #0x11, lsl #12  ; [pp+0x11058] "Comercio"
    //     0x42bb68: ldr             x1, [x1, #0x58]
    // 0x42bb6c: ldur            x0, [fp, #-8]
    // 0x42bb70: stur            x1, [fp, #-0x20]
    // 0x42bb74: r0 = Text()
    //     0x42bb74: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42bb78: mov             x1, x0
    // 0x42bb7c: ldur            x0, [fp, #-0x20]
    // 0x42bb80: stur            x1, [fp, #-0x28]
    // 0x42bb84: StoreField: r1->field_b = r0
    //     0x42bb84: stur            w0, [x1, #0xb]
    // 0x42bb88: r0 = LoadStaticField(0xc74)
    //     0x42bb88: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42bb8c: ldr             x0, [x0, #0x18e8]
    // 0x42bb90: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bb94: cmp             w0, w16
    // 0x42bb98: b.ne            #0x42bba8
    // 0x42bb9c: r2 = NesIcons
    //     0x42bb9c: add             x2, PP, #0x10, lsl #12  ; [pp+0x10f70] Field <::.NesIcons>: static late final (offset: 0xc74)
    //     0x42bba0: ldr             x2, [x2, #0xf70]
    // 0x42bba4: r0 = InitLateFinalStaticField()
    //     0x42bba4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42bba8: mov             x1, x0
    // 0x42bbac: LoadField: r0 = r1->field_f
    //     0x42bbac: ldur            w0, [x1, #0xf]
    // 0x42bbb0: DecompressPointer r0
    //     0x42bbb0: add             x0, x0, HEAP, lsl #32
    // 0x42bbb4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bbb8: cmp             w0, w16
    // 0x42bbbc: b.ne            #0x42bbcc
    // 0x42bbc0: r2 = leftArrowIndicator
    //     0x42bbc0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11368] Field <NesIconCollection.leftArrowIndicator>: late final (offset: 0x10)
    //     0x42bbc4: ldr             x2, [x2, #0x368]
    // 0x42bbc8: r0 = InitLateFinalInstanceField()
    //     0x42bbc8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bbcc: stur            x0, [fp, #-0x20]
    // 0x42bbd0: r0 = NesIconButton()
    //     0x42bbd0: bl              #0x37162c  ; AllocateNesIconButtonStub -> NesIconButton (size=0x3c)
    // 0x42bbd4: mov             x3, x0
    // 0x42bbd8: ldur            x0, [fp, #-0x20]
    // 0x42bbdc: stur            x3, [fp, #-0x30]
    // 0x42bbe0: StoreField: r3->field_b = r0
    //     0x42bbe0: stur            w0, [x3, #0xb]
    // 0x42bbe4: ldur            x2, [fp, #-0x10]
    // 0x42bbe8: r1 = Function '<anonymous closure>':.
    //     0x42bbe8: add             x1, PP, #0x11, lsl #12  ; [pp+0x11eb8] AnonymousClosure: (0x380094), in [package:nes_ui/src/widgets/dialogs/nes_dialog.dart] NesDialog::build (0x3fdcd8)
    //     0x42bbec: ldr             x1, [x1, #0xeb8]
    // 0x42bbf0: r0 = AllocateClosure()
    //     0x42bbf0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42bbf4: mov             x1, x0
    // 0x42bbf8: ldur            x0, [fp, #-0x30]
    // 0x42bbfc: StoreField: r0->field_f = r1
    //     0x42bbfc: stur            w1, [x0, #0xf]
    // 0x42bc00: r1 = Instance_Size
    //     0x42bc00: add             x1, PP, #0x11, lsl #12  ; [pp+0x11c08] Obj!Size@5d0181
    //     0x42bc04: ldr             x1, [x1, #0xc08]
    // 0x42bc08: StoreField: r0->field_2f = r1
    //     0x42bc08: stur            w1, [x0, #0x2f]
    // 0x42bc0c: r0 = Center()
    //     0x42bc0c: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x42bc10: mov             x1, x0
    // 0x42bc14: r0 = Instance_Alignment
    //     0x42bc14: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x42bc18: ldr             x0, [x0, #0xb18]
    // 0x42bc1c: stur            x1, [fp, #-0x10]
    // 0x42bc20: StoreField: r1->field_f = r0
    //     0x42bc20: stur            w0, [x1, #0xf]
    // 0x42bc24: ldur            x2, [fp, #-0x30]
    // 0x42bc28: StoreField: r1->field_b = r2
    //     0x42bc28: stur            w2, [x1, #0xb]
    // 0x42bc2c: r0 = AppBar()
    //     0x42bc2c: bl              #0x3715e4  ; AllocateAppBarStub -> AppBar (size=0x98)
    // 0x42bc30: stur            x0, [fp, #-0x20]
    // 0x42bc34: r16 = 56.000000
    //     0x42bc34: add             x16, PP, #0x11, lsl #12  ; [pp+0x11c10] 56
    //     0x42bc38: ldr             x16, [x16, #0xc10]
    // 0x42bc3c: ldur            lr, [fp, #-0x10]
    // 0x42bc40: stp             lr, x16, [SP, #8]
    // 0x42bc44: r16 = const [Instance of 'Padding']
    //     0x42bc44: add             x16, PP, #0x11, lsl #12  ; [pp+0x11ec0] List<Widget>(1)
    //     0x42bc48: ldr             x16, [x16, #0xec0]
    // 0x42bc4c: str             x16, [SP]
    // 0x42bc50: mov             x1, x0
    // 0x42bc54: ldur            x2, [fp, #-0x28]
    // 0x42bc58: r4 = const [0, 0x5, 0x3, 0x2, actions, 0x4, leading, 0x3, toolbarHeight, 0x2, null]
    //     0x42bc58: add             x4, PP, #0x11, lsl #12  ; [pp+0x11ec8] List(11) [0, 0x5, 0x3, 0x2, "actions", 0x4, "leading", 0x3, "toolbarHeight", 0x2, Null]
    //     0x42bc5c: ldr             x4, [x4, #0xec8]
    // 0x42bc60: r0 = AppBar()
    //     0x42bc60: bl              #0x370e34  ; [package:flutter/src/material/app_bar.dart] AppBar::AppBar
    // 0x42bc64: ldur            x0, [fp, #-8]
    // 0x42bc68: LoadField: d0 = r0->field_f
    //     0x42bc68: ldur            d0, [x0, #0xf]
    // 0x42bc6c: stur            d0, [fp, #-0x48]
    // 0x42bc70: r0 = BoxConstraints()
    //     0x42bc70: bl              #0x2c921c  ; AllocateBoxConstraintsStub -> BoxConstraints (size=0x28)
    // 0x42bc74: stur            x0, [fp, #-8]
    // 0x42bc78: StoreField: r0->field_7 = rZR
    //     0x42bc78: stur            xzr, [x0, #7]
    // 0x42bc7c: ldur            d0, [fp, #-0x48]
    // 0x42bc80: StoreField: r0->field_f = d0
    //     0x42bc80: stur            d0, [x0, #0xf]
    // 0x42bc84: ArrayStore: r0[0] = rZR  ; List_8
    //     0x42bc84: stur            xzr, [x0, #0x17]
    // 0x42bc88: d0 = inf
    //     0x42bc88: ldr             d0, [PP, #0xf60]  ; [pp+0xf60] IMM: double(inf) from 0x7ff0000000000000
    // 0x42bc8c: StoreField: r0->field_1f = d0
    //     0x42bc8c: stur            d0, [x0, #0x1f]
    // 0x42bc90: r16 = <AppLocale, Translations>
    //     0x42bc90: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42bc94: ldur            lr, [fp, #-0x18]
    // 0x42bc98: stp             lr, x16, [SP]
    // 0x42bc9c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42bc9c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42bca0: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42bca0: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42bca4: r1 = LoadClassIdInstr(r0)
    //     0x42bca4: ldur            x1, [x0, #-1]
    //     0x42bca8: ubfx            x1, x1, #0xc, #0x14
    // 0x42bcac: cmp             x1, #0x8dd
    // 0x42bcb0: b.ne            #0x42bcdc
    // 0x42bcb4: mov             x1, x0
    // 0x42bcb8: LoadField: r0 = r1->field_27
    //     0x42bcb8: ldur            w0, [x1, #0x27]
    // 0x42bcbc: DecompressPointer r0
    //     0x42bcbc: add             x0, x0, HEAP, lsl #32
    // 0x42bcc0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bcc4: cmp             w0, w16
    // 0x42bcc8: b.ne            #0x42bcd8
    // 0x42bccc: r2 = shopPage
    //     0x42bccc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11e90] Field <Translations.shopPage>: late final (offset: 0x28)
    //     0x42bcd0: ldr             x2, [x2, #0xe90]
    // 0x42bcd4: r0 = InitLateFinalInstanceField()
    //     0x42bcd4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bcd8: b               #0x42bd60
    // 0x42bcdc: cmp             x1, #0x8df
    // 0x42bce0: b.ne            #0x42bd0c
    // 0x42bce4: mov             x1, x0
    // 0x42bce8: LoadField: r0 = r1->field_4b
    //     0x42bce8: ldur            w0, [x1, #0x4b]
    // 0x42bcec: DecompressPointer r0
    //     0x42bcec: add             x0, x0, HEAP, lsl #32
    // 0x42bcf0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bcf4: cmp             w0, w16
    // 0x42bcf8: b.ne            #0x42bd08
    // 0x42bcfc: r2 = shopPage
    //     0x42bcfc: add             x2, PP, #0x11, lsl #12  ; [pp+0x11e98] Field <TranslationsRu.shopPage>: late final (offset: 0x4c)
    //     0x42bd00: ldr             x2, [x2, #0xe98]
    // 0x42bd04: r0 = InitLateFinalInstanceField()
    //     0x42bd04: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bd08: b               #0x42bd60
    // 0x42bd0c: cmp             x1, #0x8e0
    // 0x42bd10: b.ne            #0x42bd3c
    // 0x42bd14: mov             x1, x0
    // 0x42bd18: LoadField: r0 = r1->field_4b
    //     0x42bd18: ldur            w0, [x1, #0x4b]
    // 0x42bd1c: DecompressPointer r0
    //     0x42bd1c: add             x0, x0, HEAP, lsl #32
    // 0x42bd20: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bd24: cmp             w0, w16
    // 0x42bd28: b.ne            #0x42bd38
    // 0x42bd2c: r2 = shopPage
    //     0x42bd2c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11ea0] Field <TranslationsKk.shopPage>: late final (offset: 0x4c)
    //     0x42bd30: ldr             x2, [x2, #0xea0]
    // 0x42bd34: r0 = InitLateFinalInstanceField()
    //     0x42bd34: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bd38: b               #0x42bd60
    // 0x42bd3c: mov             x1, x0
    // 0x42bd40: LoadField: r0 = r1->field_4b
    //     0x42bd40: ldur            w0, [x1, #0x4b]
    // 0x42bd44: DecompressPointer r0
    //     0x42bd44: add             x0, x0, HEAP, lsl #32
    // 0x42bd48: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bd4c: cmp             w0, w16
    // 0x42bd50: b.ne            #0x42bd60
    // 0x42bd54: r2 = shopPage
    //     0x42bd54: add             x2, PP, #0x11, lsl #12  ; [pp+0x11ea8] Field <TranslationsEs.shopPage>: late final (offset: 0x4c)
    //     0x42bd58: ldr             x2, [x2, #0xea8]
    // 0x42bd5c: r0 = InitLateFinalInstanceField()
    //     0x42bd5c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bd60: r1 = LoadClassIdInstr(r0)
    //     0x42bd60: ldur            x1, [x0, #-1]
    //     0x42bd64: ubfx            x1, x1, #0xc, #0x14
    // 0x42bd68: cmp             x1, #0xe4
    // 0x42bd6c: b.ne            #0x42bd7c
    // 0x42bd70: r0 = "Bullet colors"
    //     0x42bd70: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ed0] "Bullet colors"
    //     0x42bd74: ldr             x0, [x0, #0xed0]
    // 0x42bd78: b               #0x42bdac
    // 0x42bd7c: cmp             x1, #0xe5
    // 0x42bd80: b.ne            #0x42bd90
    // 0x42bd84: r0 = "Цвета мячика"
    //     0x42bd84: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ed8] "Цвета мячика"
    //     0x42bd88: ldr             x0, [x0, #0xed8]
    // 0x42bd8c: b               #0x42bdac
    // 0x42bd90: cmp             x1, #0xe6
    // 0x42bd94: b.ne            #0x42bda4
    // 0x42bd98: r0 = "Оқ түсті"
    //     0x42bd98: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ee0] "Оқ түсті"
    //     0x42bd9c: ldr             x0, [x0, #0xee0]
    // 0x42bda0: b               #0x42bdac
    // 0x42bda4: r0 = "Colores de bala"
    //     0x42bda4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ee8] "Colores de bala"
    //     0x42bda8: ldr             x0, [x0, #0xee8]
    // 0x42bdac: stur            x0, [fp, #-0x10]
    // 0x42bdb0: r0 = Text()
    //     0x42bdb0: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42bdb4: mov             x1, x0
    // 0x42bdb8: ldur            x0, [fp, #-0x10]
    // 0x42bdbc: stur            x1, [fp, #-0x28]
    // 0x42bdc0: StoreField: r1->field_b = r0
    //     0x42bdc0: stur            w0, [x1, #0xb]
    // 0x42bdc4: r0 = Instance_TextStyle
    //     0x42bdc4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ef0] Obj!TextStyle@5d5831
    //     0x42bdc8: ldr             x0, [x0, #0xef0]
    // 0x42bdcc: StoreField: r1->field_13 = r0
    //     0x42bdcc: stur            w0, [x1, #0x13]
    // 0x42bdd0: r0 = Padding()
    //     0x42bdd0: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x42bdd4: mov             x1, x0
    // 0x42bdd8: r0 = Instance_EdgeInsets
    //     0x42bdd8: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ef8] Obj!EdgeInsets@5cbf81
    //     0x42bddc: ldr             x0, [x0, #0xef8]
    // 0x42bde0: stur            x1, [fp, #-0x10]
    // 0x42bde4: StoreField: r1->field_f = r0
    //     0x42bde4: stur            w0, [x1, #0xf]
    // 0x42bde8: ldur            x2, [fp, #-0x28]
    // 0x42bdec: StoreField: r1->field_b = r2
    //     0x42bdec: stur            w2, [x1, #0xb]
    // 0x42bdf0: r0 = SliverToBoxAdapter()
    //     0x42bdf0: bl              #0x42c22c  ; AllocateSliverToBoxAdapterStub -> SliverToBoxAdapter (size=0x10)
    // 0x42bdf4: mov             x1, x0
    // 0x42bdf8: ldur            x0, [fp, #-0x10]
    // 0x42bdfc: stur            x1, [fp, #-0x28]
    // 0x42be00: StoreField: r1->field_b = r0
    //     0x42be00: stur            w0, [x1, #0xb]
    // 0x42be04: r0 = LoadStaticField(0xcd4)
    //     0x42be04: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42be08: ldr             x0, [x0, #0x19a8]
    // 0x42be0c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42be10: cmp             w0, w16
    // 0x42be14: b.ne            #0x42be24
    // 0x42be18: r2 = bulletColors
    //     0x42be18: add             x2, PP, #8, lsl #12  ; [pp+0x83c8] Field <ShopItems.bulletColors>: static late final (offset: 0xcd4)
    //     0x42be1c: ldr             x2, [x2, #0x3c8]
    // 0x42be20: r0 = InitLateFinalStaticField()
    //     0x42be20: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42be24: LoadField: r1 = r0->field_b
    //     0x42be24: ldur            w1, [x0, #0xb]
    // 0x42be28: r3 = LoadInt32Instr(r1)
    //     0x42be28: sbfx            x3, x1, #1, #0x1f
    // 0x42be2c: stur            x3, [fp, #-0x38]
    // 0x42be30: r1 = Function '<anonymous closure>':.
    //     0x42be30: add             x1, PP, #0x11, lsl #12  ; [pp+0x11f00] AnonymousClosure: (0x42c4f0), in [package:ricochlime/pages/shop.dart] ShopPage::build (0x42b9f4)
    //     0x42be34: ldr             x1, [x1, #0xf00]
    // 0x42be38: r2 = Null
    //     0x42be38: mov             x2, NULL
    // 0x42be3c: r0 = AllocateClosure()
    //     0x42be3c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42be40: stur            x0, [fp, #-0x10]
    // 0x42be44: r0 = SliverGrid()
    //     0x42be44: bl              #0x42c220  ; AllocateSliverGridStub -> SliverGrid (size=0x14)
    // 0x42be48: mov             x1, x0
    // 0x42be4c: ldur            x2, [fp, #-0x10]
    // 0x42be50: ldur            x3, [fp, #-0x38]
    // 0x42be54: stur            x0, [fp, #-0x10]
    // 0x42be58: r0 = SliverGrid.builder()
    //     0x42be58: bl              #0x42c198  ; [package:flutter/src/widgets/sliver.dart] SliverGrid::SliverGrid.builder
    // 0x42be5c: r16 = <AppLocale, Translations>
    //     0x42be5c: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x42be60: ldur            lr, [fp, #-0x18]
    // 0x42be64: stp             lr, x16, [SP]
    // 0x42be68: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x42be68: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x42be6c: r0 = LocaleSettingsExt.currentTranslations()
    //     0x42be6c: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x42be70: r1 = LoadClassIdInstr(r0)
    //     0x42be70: ldur            x1, [x0, #-1]
    //     0x42be74: ubfx            x1, x1, #0xc, #0x14
    // 0x42be78: cmp             x1, #0x8dd
    // 0x42be7c: b.ne            #0x42bea8
    // 0x42be80: mov             x1, x0
    // 0x42be84: LoadField: r0 = r1->field_27
    //     0x42be84: ldur            w0, [x1, #0x27]
    // 0x42be88: DecompressPointer r0
    //     0x42be88: add             x0, x0, HEAP, lsl #32
    // 0x42be8c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42be90: cmp             w0, w16
    // 0x42be94: b.ne            #0x42bea4
    // 0x42be98: r2 = shopPage
    //     0x42be98: add             x2, PP, #0x11, lsl #12  ; [pp+0x11e90] Field <Translations.shopPage>: late final (offset: 0x28)
    //     0x42be9c: ldr             x2, [x2, #0xe90]
    // 0x42bea0: r0 = InitLateFinalInstanceField()
    //     0x42bea0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bea4: b               #0x42bf2c
    // 0x42bea8: cmp             x1, #0x8df
    // 0x42beac: b.ne            #0x42bed8
    // 0x42beb0: mov             x1, x0
    // 0x42beb4: LoadField: r0 = r1->field_4b
    //     0x42beb4: ldur            w0, [x1, #0x4b]
    // 0x42beb8: DecompressPointer r0
    //     0x42beb8: add             x0, x0, HEAP, lsl #32
    // 0x42bebc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bec0: cmp             w0, w16
    // 0x42bec4: b.ne            #0x42bed4
    // 0x42bec8: r2 = shopPage
    //     0x42bec8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11e98] Field <TranslationsRu.shopPage>: late final (offset: 0x4c)
    //     0x42becc: ldr             x2, [x2, #0xe98]
    // 0x42bed0: r0 = InitLateFinalInstanceField()
    //     0x42bed0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bed4: b               #0x42bf2c
    // 0x42bed8: cmp             x1, #0x8e0
    // 0x42bedc: b.ne            #0x42bf08
    // 0x42bee0: mov             x1, x0
    // 0x42bee4: LoadField: r0 = r1->field_4b
    //     0x42bee4: ldur            w0, [x1, #0x4b]
    // 0x42bee8: DecompressPointer r0
    //     0x42bee8: add             x0, x0, HEAP, lsl #32
    // 0x42beec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bef0: cmp             w0, w16
    // 0x42bef4: b.ne            #0x42bf04
    // 0x42bef8: r2 = shopPage
    //     0x42bef8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11ea0] Field <TranslationsKk.shopPage>: late final (offset: 0x4c)
    //     0x42befc: ldr             x2, [x2, #0xea0]
    // 0x42bf00: r0 = InitLateFinalInstanceField()
    //     0x42bf00: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bf04: b               #0x42bf2c
    // 0x42bf08: mov             x1, x0
    // 0x42bf0c: LoadField: r0 = r1->field_4b
    //     0x42bf0c: ldur            w0, [x1, #0x4b]
    // 0x42bf10: DecompressPointer r0
    //     0x42bf10: add             x0, x0, HEAP, lsl #32
    // 0x42bf14: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bf18: cmp             w0, w16
    // 0x42bf1c: b.ne            #0x42bf2c
    // 0x42bf20: r2 = shopPage
    //     0x42bf20: add             x2, PP, #0x11, lsl #12  ; [pp+0x11ea8] Field <TranslationsEs.shopPage>: late final (offset: 0x4c)
    //     0x42bf24: ldr             x2, [x2, #0xea8]
    // 0x42bf28: r0 = InitLateFinalInstanceField()
    //     0x42bf28: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42bf2c: r1 = LoadClassIdInstr(r0)
    //     0x42bf2c: ldur            x1, [x0, #-1]
    //     0x42bf30: ubfx            x1, x1, #0xc, #0x14
    // 0x42bf34: cmp             x1, #0xe4
    // 0x42bf38: b.ne            #0x42bf48
    // 0x42bf3c: r4 = "Bullet shapes"
    //     0x42bf3c: add             x4, PP, #0x11, lsl #12  ; [pp+0x11f08] "Bullet shapes"
    //     0x42bf40: ldr             x4, [x4, #0xf08]
    // 0x42bf44: b               #0x42bf78
    // 0x42bf48: cmp             x1, #0xe5
    // 0x42bf4c: b.ne            #0x42bf5c
    // 0x42bf50: r4 = "Формы мячика"
    //     0x42bf50: add             x4, PP, #0x11, lsl #12  ; [pp+0x11f10] "Формы мячика"
    //     0x42bf54: ldr             x4, [x4, #0xf10]
    // 0x42bf58: b               #0x42bf78
    // 0x42bf5c: cmp             x1, #0xe6
    // 0x42bf60: b.ne            #0x42bf70
    // 0x42bf64: r4 = "Оқ пішіндері"
    //     0x42bf64: add             x4, PP, #0x11, lsl #12  ; [pp+0x11f18] "Оқ пішіндері"
    //     0x42bf68: ldr             x4, [x4, #0xf18]
    // 0x42bf6c: b               #0x42bf78
    // 0x42bf70: r4 = "Formas de bala"
    //     0x42bf70: add             x4, PP, #0x11, lsl #12  ; [pp+0x11f20] "Formas de bala"
    //     0x42bf74: ldr             x4, [x4, #0xf20]
    // 0x42bf78: ldur            x3, [fp, #-0x20]
    // 0x42bf7c: ldur            x2, [fp, #-8]
    // 0x42bf80: ldur            x1, [fp, #-0x28]
    // 0x42bf84: ldur            x0, [fp, #-0x10]
    // 0x42bf88: stur            x4, [fp, #-0x18]
    // 0x42bf8c: r0 = Text()
    //     0x42bf8c: bl              #0x37f6d8  ; AllocateTextStub -> Text (size=0x50)
    // 0x42bf90: mov             x1, x0
    // 0x42bf94: ldur            x0, [fp, #-0x18]
    // 0x42bf98: stur            x1, [fp, #-0x30]
    // 0x42bf9c: StoreField: r1->field_b = r0
    //     0x42bf9c: stur            w0, [x1, #0xb]
    // 0x42bfa0: r0 = Instance_TextStyle
    //     0x42bfa0: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ef0] Obj!TextStyle@5d5831
    //     0x42bfa4: ldr             x0, [x0, #0xef0]
    // 0x42bfa8: StoreField: r1->field_13 = r0
    //     0x42bfa8: stur            w0, [x1, #0x13]
    // 0x42bfac: r0 = Padding()
    //     0x42bfac: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x42bfb0: mov             x1, x0
    // 0x42bfb4: r0 = Instance_EdgeInsets
    //     0x42bfb4: add             x0, PP, #0x11, lsl #12  ; [pp+0x11ef8] Obj!EdgeInsets@5cbf81
    //     0x42bfb8: ldr             x0, [x0, #0xef8]
    // 0x42bfbc: stur            x1, [fp, #-0x18]
    // 0x42bfc0: StoreField: r1->field_f = r0
    //     0x42bfc0: stur            w0, [x1, #0xf]
    // 0x42bfc4: ldur            x0, [fp, #-0x30]
    // 0x42bfc8: StoreField: r1->field_b = r0
    //     0x42bfc8: stur            w0, [x1, #0xb]
    // 0x42bfcc: r0 = SliverToBoxAdapter()
    //     0x42bfcc: bl              #0x42c22c  ; AllocateSliverToBoxAdapterStub -> SliverToBoxAdapter (size=0x10)
    // 0x42bfd0: mov             x1, x0
    // 0x42bfd4: ldur            x0, [fp, #-0x18]
    // 0x42bfd8: stur            x1, [fp, #-0x30]
    // 0x42bfdc: StoreField: r1->field_b = r0
    //     0x42bfdc: stur            w0, [x1, #0xb]
    // 0x42bfe0: r0 = LoadStaticField(0xcd8)
    //     0x42bfe0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42bfe4: ldr             x0, [x0, #0x19b0]
    // 0x42bfe8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42bfec: cmp             w0, w16
    // 0x42bff0: b.ne            #0x42c000
    // 0x42bff4: r2 = bulletShapes
    //     0x42bff4: add             x2, PP, #8, lsl #12  ; [pp+0x83e8] Field <ShopItems.bulletShapes>: static late final (offset: 0xcd8)
    //     0x42bff8: ldr             x2, [x2, #0x3e8]
    // 0x42bffc: r0 = InitLateFinalStaticField()
    //     0x42bffc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c000: LoadField: r1 = r0->field_b
    //     0x42c000: ldur            w1, [x0, #0xb]
    // 0x42c004: r3 = LoadInt32Instr(r1)
    //     0x42c004: sbfx            x3, x1, #1, #0x1f
    // 0x42c008: stur            x3, [fp, #-0x38]
    // 0x42c00c: r1 = Function '<anonymous closure>':.
    //     0x42c00c: add             x1, PP, #0x11, lsl #12  ; [pp+0x11f28] AnonymousClosure: (0x42c238), in [package:ricochlime/pages/shop.dart] ShopPage::build (0x42b9f4)
    //     0x42c010: ldr             x1, [x1, #0xf28]
    // 0x42c014: r2 = Null
    //     0x42c014: mov             x2, NULL
    // 0x42c018: r0 = AllocateClosure()
    //     0x42c018: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42c01c: stur            x0, [fp, #-0x18]
    // 0x42c020: r0 = SliverGrid()
    //     0x42c020: bl              #0x42c220  ; AllocateSliverGridStub -> SliverGrid (size=0x14)
    // 0x42c024: mov             x1, x0
    // 0x42c028: ldur            x2, [fp, #-0x18]
    // 0x42c02c: ldur            x3, [fp, #-0x38]
    // 0x42c030: stur            x0, [fp, #-0x18]
    // 0x42c034: r0 = SliverGrid.builder()
    //     0x42c034: bl              #0x42c198  ; [package:flutter/src/widgets/sliver.dart] SliverGrid::SliverGrid.builder
    // 0x42c038: r1 = Null
    //     0x42c038: mov             x1, NULL
    // 0x42c03c: r2 = 8
    //     0x42c03c: mov             x2, #8
    // 0x42c040: r0 = AllocateArray()
    //     0x42c040: bl              #0x5845d8  ; AllocateArrayStub
    // 0x42c044: mov             x2, x0
    // 0x42c048: ldur            x0, [fp, #-0x28]
    // 0x42c04c: stur            x2, [fp, #-0x40]
    // 0x42c050: StoreField: r2->field_f = r0
    //     0x42c050: stur            w0, [x2, #0xf]
    // 0x42c054: ldur            x0, [fp, #-0x10]
    // 0x42c058: StoreField: r2->field_13 = r0
    //     0x42c058: stur            w0, [x2, #0x13]
    // 0x42c05c: ldur            x0, [fp, #-0x30]
    // 0x42c060: ArrayStore: r2[0] = r0  ; List_4
    //     0x42c060: stur            w0, [x2, #0x17]
    // 0x42c064: ldur            x0, [fp, #-0x18]
    // 0x42c068: StoreField: r2->field_1b = r0
    //     0x42c068: stur            w0, [x2, #0x1b]
    // 0x42c06c: r1 = <Widget>
    //     0x42c06c: ldr             x1, [PP, #0x7728]  ; [pp+0x7728] TypeArguments: <Widget>
    // 0x42c070: r0 = AllocateGrowableArray()
    //     0x42c070: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x42c074: mov             x1, x0
    // 0x42c078: ldur            x0, [fp, #-0x40]
    // 0x42c07c: stur            x1, [fp, #-0x10]
    // 0x42c080: StoreField: r1->field_f = r0
    //     0x42c080: stur            w0, [x1, #0xf]
    // 0x42c084: r0 = 8
    //     0x42c084: mov             x0, #8
    // 0x42c088: StoreField: r1->field_b = r0
    //     0x42c088: stur            w0, [x1, #0xb]
    // 0x42c08c: r0 = CustomScrollView()
    //     0x42c08c: bl              #0x388254  ; AllocateCustomScrollViewStub -> CustomScrollView (size=0x5c)
    // 0x42c090: mov             x1, x0
    // 0x42c094: ldur            x0, [fp, #-0x10]
    // 0x42c098: stur            x1, [fp, #-0x18]
    // 0x42c09c: StoreField: r1->field_57 = r0
    //     0x42c09c: stur            w0, [x1, #0x57]
    // 0x42c0a0: r0 = Instance_Axis
    //     0x42c0a0: ldr             x0, [PP, #0x7680]  ; [pp+0x7680] Obj!Axis@5dafb1
    // 0x42c0a4: StoreField: r1->field_b = r0
    //     0x42c0a4: stur            w0, [x1, #0xb]
    // 0x42c0a8: r0 = false
    //     0x42c0a8: add             x0, NULL, #0x30  ; false
    // 0x42c0ac: StoreField: r1->field_f = r0
    //     0x42c0ac: stur            w0, [x1, #0xf]
    // 0x42c0b0: StoreField: r1->field_23 = r0
    //     0x42c0b0: stur            w0, [x1, #0x23]
    // 0x42c0b4: StoreField: r1->field_2b = rZR
    //     0x42c0b4: stur            xzr, [x1, #0x2b]
    // 0x42c0b8: r2 = Instance_SliverPaintOrder
    //     0x42c0b8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11de8] Obj!SliverPaintOrder@5da9b1
    //     0x42c0bc: ldr             x2, [x2, #0xde8]
    // 0x42c0c0: StoreField: r1->field_3f = r2
    //     0x42c0c0: stur            w2, [x1, #0x3f]
    // 0x42c0c4: r2 = Instance_DragStartBehavior
    //     0x42c0c4: add             x2, PP, #0x11, lsl #12  ; [pp+0x11df0] Obj!DragStartBehavior@5db8d1
    //     0x42c0c8: ldr             x2, [x2, #0xdf0]
    // 0x42c0cc: StoreField: r1->field_43 = r2
    //     0x42c0cc: stur            w2, [x1, #0x43]
    // 0x42c0d0: r2 = Instance_Clip
    //     0x42c0d0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11df8] Obj!Clip@5dc831
    //     0x42c0d4: ldr             x2, [x2, #0xdf8]
    // 0x42c0d8: StoreField: r1->field_4f = r2
    //     0x42c0d8: stur            w2, [x1, #0x4f]
    // 0x42c0dc: r2 = Instance_HitTestBehavior
    //     0x42c0dc: add             x2, PP, #0xe, lsl #12  ; [pp+0xe980] Obj!HitTestBehavior@5daa71
    //     0x42c0e0: ldr             x2, [x2, #0x980]
    // 0x42c0e4: StoreField: r1->field_53 = r2
    //     0x42c0e4: stur            w2, [x1, #0x53]
    // 0x42c0e8: r2 = Instance_AlwaysScrollableScrollPhysics
    //     0x42c0e8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11e00] Obj!AlwaysScrollableScrollPhysics@5cb401
    //     0x42c0ec: ldr             x2, [x2, #0xe00]
    // 0x42c0f0: StoreField: r1->field_1b = r2
    //     0x42c0f0: stur            w2, [x1, #0x1b]
    // 0x42c0f4: r0 = Padding()
    //     0x42c0f4: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x42c0f8: mov             x1, x0
    // 0x42c0fc: r0 = Instance_EdgeInsets
    //     0x42c0fc: add             x0, PP, #0x11, lsl #12  ; [pp+0x11d90] Obj!EdgeInsets@5cbd41
    //     0x42c100: ldr             x0, [x0, #0xd90]
    // 0x42c104: stur            x1, [fp, #-0x10]
    // 0x42c108: StoreField: r1->field_f = r0
    //     0x42c108: stur            w0, [x1, #0xf]
    // 0x42c10c: ldur            x0, [fp, #-0x18]
    // 0x42c110: StoreField: r1->field_b = r0
    //     0x42c110: stur            w0, [x1, #0xb]
    // 0x42c114: r0 = ConstrainedBox()
    //     0x42c114: bl              #0x35642c  ; AllocateConstrainedBoxStub -> ConstrainedBox (size=0x14)
    // 0x42c118: mov             x1, x0
    // 0x42c11c: ldur            x0, [fp, #-8]
    // 0x42c120: stur            x1, [fp, #-0x18]
    // 0x42c124: StoreField: r1->field_f = r0
    //     0x42c124: stur            w0, [x1, #0xf]
    // 0x42c128: ldur            x0, [fp, #-0x10]
    // 0x42c12c: StoreField: r1->field_b = r0
    //     0x42c12c: stur            w0, [x1, #0xb]
    // 0x42c130: r0 = Center()
    //     0x42c130: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x42c134: mov             x1, x0
    // 0x42c138: r0 = Instance_Alignment
    //     0x42c138: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x42c13c: ldr             x0, [x0, #0xb18]
    // 0x42c140: stur            x1, [fp, #-8]
    // 0x42c144: StoreField: r1->field_f = r0
    //     0x42c144: stur            w0, [x1, #0xf]
    // 0x42c148: ldur            x0, [fp, #-0x18]
    // 0x42c14c: StoreField: r1->field_b = r0
    //     0x42c14c: stur            w0, [x1, #0xb]
    // 0x42c150: r0 = Scaffold()
    //     0x42c150: bl              #0x370d84  ; AllocateScaffoldStub -> Scaffold (size=0x50)
    // 0x42c154: ldur            x1, [fp, #-0x20]
    // 0x42c158: StoreField: r0->field_13 = r1
    //     0x42c158: stur            w1, [x0, #0x13]
    // 0x42c15c: ldur            x1, [fp, #-8]
    // 0x42c160: ArrayStore: r0[0] = r1  ; List_4
    //     0x42c160: stur            w1, [x0, #0x17]
    // 0x42c164: r1 = true
    //     0x42c164: add             x1, NULL, #0x20  ; true
    // 0x42c168: StoreField: r0->field_47 = r1
    //     0x42c168: stur            w1, [x0, #0x47]
    // 0x42c16c: r1 = false
    //     0x42c16c: add             x1, NULL, #0x30  ; false
    // 0x42c170: StoreField: r0->field_b = r1
    //     0x42c170: stur            w1, [x0, #0xb]
    // 0x42c174: StoreField: r0->field_f = r1
    //     0x42c174: stur            w1, [x0, #0xf]
    // 0x42c178: r1 = Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static.
    //     0x42c178: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd50] Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static. (0x7c033375e380)
    //     0x42c17c: ldr             x1, [x1, #0xd50]
    // 0x42c180: StoreField: r0->field_33 = r1
    //     0x42c180: stur            w1, [x0, #0x33]
    // 0x42c184: LeaveFrame
    //     0x42c184: mov             SP, fp
    //     0x42c188: ldp             fp, lr, [SP], #0x10
    // 0x42c18c: ret
    //     0x42c18c: ret             
    // 0x42c190: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42c190: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42c194: b               #0x42ba18
  }
  [closure] ValueListenableBuilder<String>? <anonymous closure>(dynamic, BuildContext, int) {
    // ** addr: 0x42c238, size: 0x130
    // 0x42c238: EnterFrame
    //     0x42c238: stp             fp, lr, [SP, #-0x10]!
    //     0x42c23c: mov             fp, SP
    // 0x42c240: AllocStack(0x18)
    //     0x42c240: sub             SP, SP, #0x18
    // 0x42c244: SetupParameters([dynamic _ /* r0 */])
    //     0x42c244: ldr             x0, [fp, #0x20]
    //     0x42c248: ldur            w1, [x0, #0x17]
    //     0x42c24c: add             x1, x1, HEAP, lsl #32
    //     0x42c250: stur            x1, [fp, #-8]
    // 0x42c254: CheckStackOverflow
    //     0x42c254: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42c258: cmp             SP, x16
    //     0x42c25c: b.ls            #0x42c35c
    // 0x42c260: r1 = 1
    //     0x42c260: mov             x1, #1
    // 0x42c264: r0 = AllocateContext()
    //     0x42c264: bl              #0x5834e8  ; AllocateContextStub
    // 0x42c268: mov             x1, x0
    // 0x42c26c: ldur            x0, [fp, #-8]
    // 0x42c270: stur            x1, [fp, #-0x10]
    // 0x42c274: StoreField: r1->field_b = r0
    //     0x42c274: stur            w0, [x1, #0xb]
    // 0x42c278: r0 = LoadStaticField(0xcd8)
    //     0x42c278: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42c27c: ldr             x0, [x0, #0x19b0]
    // 0x42c280: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c284: cmp             w0, w16
    // 0x42c288: b.ne            #0x42c298
    // 0x42c28c: r2 = bulletShapes
    //     0x42c28c: add             x2, PP, #8, lsl #12  ; [pp+0x83e8] Field <ShopItems.bulletShapes>: static late final (offset: 0xcd8)
    //     0x42c290: ldr             x2, [x2, #0x3e8]
    // 0x42c294: r0 = InitLateFinalStaticField()
    //     0x42c294: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c298: mov             x2, x0
    // 0x42c29c: LoadField: r0 = r2->field_b
    //     0x42c29c: ldur            w0, [x2, #0xb]
    // 0x42c2a0: ldr             x1, [fp, #0x10]
    // 0x42c2a4: r3 = LoadInt32Instr(r1)
    //     0x42c2a4: sbfx            x3, x1, #1, #0x1f
    //     0x42c2a8: tbz             w1, #0, #0x42c2b0
    //     0x42c2ac: ldur            x3, [x1, #7]
    // 0x42c2b0: r1 = LoadInt32Instr(r0)
    //     0x42c2b0: sbfx            x1, x0, #1, #0x1f
    // 0x42c2b4: cmp             x3, x1
    // 0x42c2b8: b.lt            #0x42c2cc
    // 0x42c2bc: r0 = Null
    //     0x42c2bc: mov             x0, NULL
    // 0x42c2c0: LeaveFrame
    //     0x42c2c0: mov             SP, fp
    //     0x42c2c4: ldp             fp, lr, [SP], #0x10
    // 0x42c2c8: ret
    //     0x42c2c8: ret             
    // 0x42c2cc: ldur            x4, [fp, #-0x10]
    // 0x42c2d0: mov             x0, x1
    // 0x42c2d4: mov             x1, x3
    // 0x42c2d8: cmp             x1, x0
    // 0x42c2dc: b.hs            #0x42c364
    // 0x42c2e0: ArrayLoad: r0 = r2[r3]  ; Unknown_4
    //     0x42c2e0: add             x16, x2, x3, lsl #2
    //     0x42c2e4: ldur            w0, [x16, #0xf]
    // 0x42c2e8: DecompressPointer r0
    //     0x42c2e8: add             x0, x0, HEAP, lsl #32
    // 0x42c2ec: StoreField: r4->field_f = r0
    //     0x42c2ec: stur            w0, [x4, #0xf]
    // 0x42c2f0: r0 = LoadStaticField(0xccc)
    //     0x42c2f0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42c2f4: ldr             x0, [x0, #0x1998]
    // 0x42c2f8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c2fc: cmp             w0, w16
    // 0x42c300: b.ne            #0x42c310
    // 0x42c304: r2 = stows
    //     0x42c304: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42c308: ldr             x2, [x2, #0x310]
    // 0x42c30c: r0 = InitLateFinalStaticField()
    //     0x42c30c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c310: LoadField: r2 = r0->field_33
    //     0x42c310: ldur            w2, [x0, #0x33]
    // 0x42c314: DecompressPointer r2
    //     0x42c314: add             x2, x2, HEAP, lsl #32
    // 0x42c318: stur            x2, [fp, #-8]
    // 0x42c31c: r1 = <String>
    //     0x42c31c: ldr             x1, [PP, #0xc48]  ; [pp+0xc48] TypeArguments: <String>
    // 0x42c320: r0 = ValueListenableBuilder()
    //     0x42c320: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x42c324: mov             x3, x0
    // 0x42c328: ldur            x0, [fp, #-8]
    // 0x42c32c: stur            x3, [fp, #-0x18]
    // 0x42c330: StoreField: r3->field_f = r0
    //     0x42c330: stur            w0, [x3, #0xf]
    // 0x42c334: ldur            x2, [fp, #-0x10]
    // 0x42c338: r1 = Function '<anonymous closure>':.
    //     0x42c338: add             x1, PP, #0x11, lsl #12  ; [pp+0x11f30] AnonymousClosure: (0x42c368), in [package:ricochlime/pages/shop.dart] ShopPage::build (0x42b9f4)
    //     0x42c33c: ldr             x1, [x1, #0xf30]
    // 0x42c340: r0 = AllocateClosure()
    //     0x42c340: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42c344: mov             x1, x0
    // 0x42c348: ldur            x0, [fp, #-0x18]
    // 0x42c34c: StoreField: r0->field_13 = r1
    //     0x42c34c: stur            w1, [x0, #0x13]
    // 0x42c350: LeaveFrame
    //     0x42c350: mov             SP, fp
    //     0x42c354: ldp             fp, lr, [SP], #0x10
    // 0x42c358: ret
    //     0x42c358: ret             
    // 0x42c35c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42c35c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42c360: b               #0x42c260
    // 0x42c364: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x42c364: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] _ShopItemTile <anonymous closure>(dynamic, BuildContext, String, Widget?) {
    // ** addr: 0x42c368, size: 0xf4
    // 0x42c368: EnterFrame
    //     0x42c368: stp             fp, lr, [SP, #-0x10]!
    //     0x42c36c: mov             fp, SP
    // 0x42c370: AllocStack(0x30)
    //     0x42c370: sub             SP, SP, #0x30
    // 0x42c374: SetupParameters([dynamic _ /* r0 */])
    //     0x42c374: ldr             x0, [fp, #0x28]
    //     0x42c378: ldur            w2, [x0, #0x17]
    //     0x42c37c: add             x2, x2, HEAP, lsl #32
    //     0x42c380: stur            x2, [fp, #-8]
    // 0x42c384: CheckStackOverflow
    //     0x42c384: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42c388: cmp             SP, x16
    //     0x42c38c: b.ls            #0x42c454
    // 0x42c390: r0 = LoadStaticField(0xccc)
    //     0x42c390: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42c394: ldr             x0, [x0, #0x1998]
    // 0x42c398: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c39c: cmp             w0, w16
    // 0x42c3a0: b.ne            #0x42c3b0
    // 0x42c3a4: r2 = stows
    //     0x42c3a4: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42c3a8: ldr             x2, [x2, #0x310]
    // 0x42c3ac: r0 = InitLateFinalStaticField()
    //     0x42c3ac: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c3b0: LoadField: r1 = r0->field_33
    //     0x42c3b0: ldur            w1, [x0, #0x33]
    // 0x42c3b4: DecompressPointer r1
    //     0x42c3b4: add             x1, x1, HEAP, lsl #32
    // 0x42c3b8: LoadField: r0 = r1->field_43
    //     0x42c3b8: ldur            w0, [x1, #0x43]
    // 0x42c3bc: DecompressPointer r0
    //     0x42c3bc: add             x0, x0, HEAP, lsl #32
    // 0x42c3c0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c3c4: cmp             w0, w16
    // 0x42c3c8: b.ne            #0x42c3d8
    // 0x42c3cc: r2 = _value
    //     0x42c3cc: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42c3d0: ldr             x2, [x2, #0x4b0]
    // 0x42c3d4: r0 = InitLateInstanceField()
    //     0x42c3d4: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42c3d8: ldur            x2, [fp, #-8]
    // 0x42c3dc: LoadField: r1 = r2->field_f
    //     0x42c3dc: ldur            w1, [x2, #0xf]
    // 0x42c3e0: DecompressPointer r1
    //     0x42c3e0: add             x1, x1, HEAP, lsl #32
    // 0x42c3e4: stur            x1, [fp, #-0x10]
    // 0x42c3e8: LoadField: r3 = r1->field_7
    //     0x42c3e8: ldur            w3, [x1, #7]
    // 0x42c3ec: DecompressPointer r3
    //     0x42c3ec: add             x3, x3, HEAP, lsl #32
    // 0x42c3f0: r4 = LoadClassIdInstr(r0)
    //     0x42c3f0: ldur            x4, [x0, #-1]
    //     0x42c3f4: ubfx            x4, x4, #0xc, #0x14
    // 0x42c3f8: stp             x3, x0, [SP]
    // 0x42c3fc: mov             x0, x4
    // 0x42c400: mov             lr, x0
    // 0x42c404: ldr             lr, [x21, lr, lsl #3]
    // 0x42c408: blr             lr
    // 0x42c40c: stur            x0, [fp, #-0x18]
    // 0x42c410: r0 = _ShopItemTile()
    //     0x42c410: bl              #0x42c45c  ; Allocate_ShopItemTileStub -> _ShopItemTile (size=0x18)
    // 0x42c414: mov             x3, x0
    // 0x42c418: ldur            x0, [fp, #-0x18]
    // 0x42c41c: stur            x3, [fp, #-0x20]
    // 0x42c420: StoreField: r3->field_b = r0
    //     0x42c420: stur            w0, [x3, #0xb]
    // 0x42c424: ldur            x2, [fp, #-8]
    // 0x42c428: r1 = Function '<anonymous closure>':.
    //     0x42c428: add             x1, PP, #0x11, lsl #12  ; [pp+0x11f38] AnonymousClosure: (0x42c468), in [package:ricochlime/pages/shop.dart] ShopPage::build (0x42b9f4)
    //     0x42c42c: ldr             x1, [x1, #0xf38]
    // 0x42c430: r0 = AllocateClosure()
    //     0x42c430: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42c434: mov             x1, x0
    // 0x42c438: ldur            x0, [fp, #-0x20]
    // 0x42c43c: StoreField: r0->field_f = r1
    //     0x42c43c: stur            w1, [x0, #0xf]
    // 0x42c440: ldur            x1, [fp, #-0x10]
    // 0x42c444: StoreField: r0->field_13 = r1
    //     0x42c444: stur            w1, [x0, #0x13]
    // 0x42c448: LeaveFrame
    //     0x42c448: mov             SP, fp
    //     0x42c44c: ldp             fp, lr, [SP], #0x10
    // 0x42c450: ret
    //     0x42c450: ret             
    // 0x42c454: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42c454: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42c458: b               #0x42c390
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42c468, size: 0x88
    // 0x42c468: EnterFrame
    //     0x42c468: stp             fp, lr, [SP, #-0x10]!
    //     0x42c46c: mov             fp, SP
    // 0x42c470: AllocStack(0x8)
    //     0x42c470: sub             SP, SP, #8
    // 0x42c474: SetupParameters([dynamic _ /* r0 */])
    //     0x42c474: ldr             x0, [fp, #0x10]
    //     0x42c478: ldur            w1, [x0, #0x17]
    //     0x42c47c: add             x1, x1, HEAP, lsl #32
    //     0x42c480: stur            x1, [fp, #-8]
    // 0x42c484: CheckStackOverflow
    //     0x42c484: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42c488: cmp             SP, x16
    //     0x42c48c: b.ls            #0x42c4e8
    // 0x42c490: r0 = LoadStaticField(0xccc)
    //     0x42c490: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42c494: ldr             x0, [x0, #0x1998]
    // 0x42c498: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c49c: cmp             w0, w16
    // 0x42c4a0: b.ne            #0x42c4b0
    // 0x42c4a4: r2 = stows
    //     0x42c4a4: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42c4a8: ldr             x2, [x2, #0x310]
    // 0x42c4ac: r0 = InitLateFinalStaticField()
    //     0x42c4ac: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c4b0: LoadField: r1 = r0->field_33
    //     0x42c4b0: ldur            w1, [x0, #0x33]
    // 0x42c4b4: DecompressPointer r1
    //     0x42c4b4: add             x1, x1, HEAP, lsl #32
    // 0x42c4b8: ldur            x0, [fp, #-8]
    // 0x42c4bc: LoadField: r2 = r0->field_f
    //     0x42c4bc: ldur            w2, [x0, #0xf]
    // 0x42c4c0: DecompressPointer r2
    //     0x42c4c0: add             x2, x2, HEAP, lsl #32
    // 0x42c4c4: LoadField: r0 = r2->field_7
    //     0x42c4c4: ldur            w0, [x2, #7]
    // 0x42c4c8: DecompressPointer r0
    //     0x42c4c8: add             x0, x0, HEAP, lsl #32
    // 0x42c4cc: mov             x2, x0
    // 0x42c4d0: stur            x0, [fp, #-8]
    // 0x42c4d4: r0 = value=()
    //     0x42c4d4: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42c4d8: ldur            x0, [fp, #-8]
    // 0x42c4dc: LeaveFrame
    //     0x42c4dc: mov             SP, fp
    //     0x42c4e0: ldp             fp, lr, [SP], #0x10
    // 0x42c4e4: ret
    //     0x42c4e4: ret             
    // 0x42c4e8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42c4e8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42c4ec: b               #0x42c490
  }
  [closure] ValueListenableBuilder<Color>? <anonymous closure>(dynamic, BuildContext, int) {
    // ** addr: 0x42c4f0, size: 0x134
    // 0x42c4f0: EnterFrame
    //     0x42c4f0: stp             fp, lr, [SP, #-0x10]!
    //     0x42c4f4: mov             fp, SP
    // 0x42c4f8: AllocStack(0x18)
    //     0x42c4f8: sub             SP, SP, #0x18
    // 0x42c4fc: SetupParameters([dynamic _ /* r0 */])
    //     0x42c4fc: ldr             x0, [fp, #0x20]
    //     0x42c500: ldur            w1, [x0, #0x17]
    //     0x42c504: add             x1, x1, HEAP, lsl #32
    //     0x42c508: stur            x1, [fp, #-8]
    // 0x42c50c: CheckStackOverflow
    //     0x42c50c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42c510: cmp             SP, x16
    //     0x42c514: b.ls            #0x42c618
    // 0x42c518: r1 = 1
    //     0x42c518: mov             x1, #1
    // 0x42c51c: r0 = AllocateContext()
    //     0x42c51c: bl              #0x5834e8  ; AllocateContextStub
    // 0x42c520: mov             x1, x0
    // 0x42c524: ldur            x0, [fp, #-8]
    // 0x42c528: stur            x1, [fp, #-0x10]
    // 0x42c52c: StoreField: r1->field_b = r0
    //     0x42c52c: stur            w0, [x1, #0xb]
    // 0x42c530: r0 = LoadStaticField(0xcd4)
    //     0x42c530: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42c534: ldr             x0, [x0, #0x19a8]
    // 0x42c538: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c53c: cmp             w0, w16
    // 0x42c540: b.ne            #0x42c550
    // 0x42c544: r2 = bulletColors
    //     0x42c544: add             x2, PP, #8, lsl #12  ; [pp+0x83c8] Field <ShopItems.bulletColors>: static late final (offset: 0xcd4)
    //     0x42c548: ldr             x2, [x2, #0x3c8]
    // 0x42c54c: r0 = InitLateFinalStaticField()
    //     0x42c54c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c550: mov             x2, x0
    // 0x42c554: LoadField: r0 = r2->field_b
    //     0x42c554: ldur            w0, [x2, #0xb]
    // 0x42c558: ldr             x1, [fp, #0x10]
    // 0x42c55c: r3 = LoadInt32Instr(r1)
    //     0x42c55c: sbfx            x3, x1, #1, #0x1f
    //     0x42c560: tbz             w1, #0, #0x42c568
    //     0x42c564: ldur            x3, [x1, #7]
    // 0x42c568: r1 = LoadInt32Instr(r0)
    //     0x42c568: sbfx            x1, x0, #1, #0x1f
    // 0x42c56c: cmp             x3, x1
    // 0x42c570: b.lt            #0x42c584
    // 0x42c574: r0 = Null
    //     0x42c574: mov             x0, NULL
    // 0x42c578: LeaveFrame
    //     0x42c578: mov             SP, fp
    //     0x42c57c: ldp             fp, lr, [SP], #0x10
    // 0x42c580: ret
    //     0x42c580: ret             
    // 0x42c584: ldur            x4, [fp, #-0x10]
    // 0x42c588: mov             x0, x1
    // 0x42c58c: mov             x1, x3
    // 0x42c590: cmp             x1, x0
    // 0x42c594: b.hs            #0x42c620
    // 0x42c598: ArrayLoad: r0 = r2[r3]  ; Unknown_4
    //     0x42c598: add             x16, x2, x3, lsl #2
    //     0x42c59c: ldur            w0, [x16, #0xf]
    // 0x42c5a0: DecompressPointer r0
    //     0x42c5a0: add             x0, x0, HEAP, lsl #32
    // 0x42c5a4: StoreField: r4->field_f = r0
    //     0x42c5a4: stur            w0, [x4, #0xf]
    // 0x42c5a8: r0 = LoadStaticField(0xccc)
    //     0x42c5a8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42c5ac: ldr             x0, [x0, #0x1998]
    // 0x42c5b0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c5b4: cmp             w0, w16
    // 0x42c5b8: b.ne            #0x42c5c8
    // 0x42c5bc: r2 = stows
    //     0x42c5bc: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42c5c0: ldr             x2, [x2, #0x310]
    // 0x42c5c4: r0 = InitLateFinalStaticField()
    //     0x42c5c4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c5c8: LoadField: r2 = r0->field_2f
    //     0x42c5c8: ldur            w2, [x0, #0x2f]
    // 0x42c5cc: DecompressPointer r2
    //     0x42c5cc: add             x2, x2, HEAP, lsl #32
    // 0x42c5d0: stur            x2, [fp, #-8]
    // 0x42c5d4: r1 = <Color>
    //     0x42c5d4: add             x1, PP, #8, lsl #12  ; [pp+0x8d08] TypeArguments: <Color>
    //     0x42c5d8: ldr             x1, [x1, #0xd08]
    // 0x42c5dc: r0 = ValueListenableBuilder()
    //     0x42c5dc: bl              #0x371608  ; AllocateValueListenableBuilderStub -> ValueListenableBuilder<X0> (size=0x1c)
    // 0x42c5e0: mov             x3, x0
    // 0x42c5e4: ldur            x0, [fp, #-8]
    // 0x42c5e8: stur            x3, [fp, #-0x18]
    // 0x42c5ec: StoreField: r3->field_f = r0
    //     0x42c5ec: stur            w0, [x3, #0xf]
    // 0x42c5f0: ldur            x2, [fp, #-0x10]
    // 0x42c5f4: r1 = Function '<anonymous closure>':.
    //     0x42c5f4: add             x1, PP, #0x11, lsl #12  ; [pp+0x11f40] AnonymousClosure: (0x42c624), in [package:ricochlime/pages/shop.dart] ShopPage::build (0x42b9f4)
    //     0x42c5f8: ldr             x1, [x1, #0xf40]
    // 0x42c5fc: r0 = AllocateClosure()
    //     0x42c5fc: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42c600: mov             x1, x0
    // 0x42c604: ldur            x0, [fp, #-0x18]
    // 0x42c608: StoreField: r0->field_13 = r1
    //     0x42c608: stur            w1, [x0, #0x13]
    // 0x42c60c: LeaveFrame
    //     0x42c60c: mov             SP, fp
    //     0x42c610: ldp             fp, lr, [SP], #0x10
    // 0x42c614: ret
    //     0x42c614: ret             
    // 0x42c618: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42c618: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42c61c: b               #0x42c518
    // 0x42c620: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x42c620: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] _ShopItemTile <anonymous closure>(dynamic, BuildContext, Color, Widget?) {
    // ** addr: 0x42c624, size: 0xf4
    // 0x42c624: EnterFrame
    //     0x42c624: stp             fp, lr, [SP, #-0x10]!
    //     0x42c628: mov             fp, SP
    // 0x42c62c: AllocStack(0x30)
    //     0x42c62c: sub             SP, SP, #0x30
    // 0x42c630: SetupParameters([dynamic _ /* r0 */])
    //     0x42c630: ldr             x0, [fp, #0x28]
    //     0x42c634: ldur            w2, [x0, #0x17]
    //     0x42c638: add             x2, x2, HEAP, lsl #32
    //     0x42c63c: stur            x2, [fp, #-8]
    // 0x42c640: CheckStackOverflow
    //     0x42c640: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42c644: cmp             SP, x16
    //     0x42c648: b.ls            #0x42c710
    // 0x42c64c: r0 = LoadStaticField(0xccc)
    //     0x42c64c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42c650: ldr             x0, [x0, #0x1998]
    // 0x42c654: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c658: cmp             w0, w16
    // 0x42c65c: b.ne            #0x42c66c
    // 0x42c660: r2 = stows
    //     0x42c660: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42c664: ldr             x2, [x2, #0x310]
    // 0x42c668: r0 = InitLateFinalStaticField()
    //     0x42c668: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c66c: LoadField: r1 = r0->field_2f
    //     0x42c66c: ldur            w1, [x0, #0x2f]
    // 0x42c670: DecompressPointer r1
    //     0x42c670: add             x1, x1, HEAP, lsl #32
    // 0x42c674: LoadField: r0 = r1->field_43
    //     0x42c674: ldur            w0, [x1, #0x43]
    // 0x42c678: DecompressPointer r0
    //     0x42c678: add             x0, x0, HEAP, lsl #32
    // 0x42c67c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c680: cmp             w0, w16
    // 0x42c684: b.ne            #0x42c694
    // 0x42c688: r2 = _value
    //     0x42c688: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x42c68c: ldr             x2, [x2, #0x4b0]
    // 0x42c690: r0 = InitLateInstanceField()
    //     0x42c690: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x42c694: ldur            x2, [fp, #-8]
    // 0x42c698: LoadField: r1 = r2->field_f
    //     0x42c698: ldur            w1, [x2, #0xf]
    // 0x42c69c: DecompressPointer r1
    //     0x42c69c: add             x1, x1, HEAP, lsl #32
    // 0x42c6a0: stur            x1, [fp, #-0x10]
    // 0x42c6a4: ArrayLoad: r3 = r1[0]  ; List_4
    //     0x42c6a4: ldur            w3, [x1, #0x17]
    // 0x42c6a8: DecompressPointer r3
    //     0x42c6a8: add             x3, x3, HEAP, lsl #32
    // 0x42c6ac: r4 = LoadClassIdInstr(r0)
    //     0x42c6ac: ldur            x4, [x0, #-1]
    //     0x42c6b0: ubfx            x4, x4, #0xc, #0x14
    // 0x42c6b4: stp             x3, x0, [SP]
    // 0x42c6b8: mov             x0, x4
    // 0x42c6bc: mov             lr, x0
    // 0x42c6c0: ldr             lr, [x21, lr, lsl #3]
    // 0x42c6c4: blr             lr
    // 0x42c6c8: stur            x0, [fp, #-0x18]
    // 0x42c6cc: r0 = _ShopItemTile()
    //     0x42c6cc: bl              #0x42c45c  ; Allocate_ShopItemTileStub -> _ShopItemTile (size=0x18)
    // 0x42c6d0: mov             x3, x0
    // 0x42c6d4: ldur            x0, [fp, #-0x18]
    // 0x42c6d8: stur            x3, [fp, #-0x20]
    // 0x42c6dc: StoreField: r3->field_b = r0
    //     0x42c6dc: stur            w0, [x3, #0xb]
    // 0x42c6e0: ldur            x2, [fp, #-8]
    // 0x42c6e4: r1 = Function '<anonymous closure>':.
    //     0x42c6e4: add             x1, PP, #0x11, lsl #12  ; [pp+0x11f48] AnonymousClosure: (0x42c718), in [package:ricochlime/pages/shop.dart] ShopPage::build (0x42b9f4)
    //     0x42c6e8: ldr             x1, [x1, #0xf48]
    // 0x42c6ec: r0 = AllocateClosure()
    //     0x42c6ec: bl              #0x5838bc  ; AllocateClosureStub
    // 0x42c6f0: mov             x1, x0
    // 0x42c6f4: ldur            x0, [fp, #-0x20]
    // 0x42c6f8: StoreField: r0->field_f = r1
    //     0x42c6f8: stur            w1, [x0, #0xf]
    // 0x42c6fc: ldur            x1, [fp, #-0x10]
    // 0x42c700: StoreField: r0->field_13 = r1
    //     0x42c700: stur            w1, [x0, #0x13]
    // 0x42c704: LeaveFrame
    //     0x42c704: mov             SP, fp
    //     0x42c708: ldp             fp, lr, [SP], #0x10
    // 0x42c70c: ret
    //     0x42c70c: ret             
    // 0x42c710: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42c710: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42c714: b               #0x42c64c
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x42c718, size: 0x88
    // 0x42c718: EnterFrame
    //     0x42c718: stp             fp, lr, [SP, #-0x10]!
    //     0x42c71c: mov             fp, SP
    // 0x42c720: AllocStack(0x8)
    //     0x42c720: sub             SP, SP, #8
    // 0x42c724: SetupParameters([dynamic _ /* r0 */])
    //     0x42c724: ldr             x0, [fp, #0x10]
    //     0x42c728: ldur            w1, [x0, #0x17]
    //     0x42c72c: add             x1, x1, HEAP, lsl #32
    //     0x42c730: stur            x1, [fp, #-8]
    // 0x42c734: CheckStackOverflow
    //     0x42c734: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42c738: cmp             SP, x16
    //     0x42c73c: b.ls            #0x42c798
    // 0x42c740: r0 = LoadStaticField(0xccc)
    //     0x42c740: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x42c744: ldr             x0, [x0, #0x1998]
    // 0x42c748: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c74c: cmp             w0, w16
    // 0x42c750: b.ne            #0x42c760
    // 0x42c754: r2 = stows
    //     0x42c754: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x42c758: ldr             x2, [x2, #0x310]
    // 0x42c75c: r0 = InitLateFinalStaticField()
    //     0x42c75c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x42c760: LoadField: r1 = r0->field_2f
    //     0x42c760: ldur            w1, [x0, #0x2f]
    // 0x42c764: DecompressPointer r1
    //     0x42c764: add             x1, x1, HEAP, lsl #32
    // 0x42c768: ldur            x0, [fp, #-8]
    // 0x42c76c: LoadField: r2 = r0->field_f
    //     0x42c76c: ldur            w2, [x0, #0xf]
    // 0x42c770: DecompressPointer r2
    //     0x42c770: add             x2, x2, HEAP, lsl #32
    // 0x42c774: ArrayLoad: r0 = r2[0]  ; List_4
    //     0x42c774: ldur            w0, [x2, #0x17]
    // 0x42c778: DecompressPointer r0
    //     0x42c778: add             x0, x0, HEAP, lsl #32
    // 0x42c77c: mov             x2, x0
    // 0x42c780: stur            x0, [fp, #-8]
    // 0x42c784: r0 = value=()
    //     0x42c784: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x42c788: ldur            x0, [fp, #-8]
    // 0x42c78c: LeaveFrame
    //     0x42c78c: mov             SP, fp
    //     0x42c790: ldp             fp, lr, [SP], #0x10
    // 0x42c794: ret
    //     0x42c794: ret             
    // 0x42c798: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42c798: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42c79c: b               #0x42c740
  }
}
