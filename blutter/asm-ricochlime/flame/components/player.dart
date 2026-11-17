// lib: , url: package:ricochlime/flame/components/player.dart

// class id: 1049307, size: 0x8
class :: {
}

// class id: 1906, size: 0x78, field offset: 0x78
class Player extends _MixinApplication270&SpriteAnimationGroupComponent&HasGameReference {

  _ Player(/* No info */) {
    // ** addr: 0x3726c8, size: 0xd0
    // 0x3726c8: EnterFrame
    //     0x3726c8: stp             fp, lr, [SP, #-0x10]!
    //     0x3726cc: mov             fp, SP
    // 0x3726d0: AllocStack(0x10)
    //     0x3726d0: sub             SP, SP, #0x10
    // 0x3726d4: SetupParameters(Player this /* r1 => r1, fp-0x8 */)
    //     0x3726d4: stur            x1, [fp, #-8]
    // 0x3726d8: CheckStackOverflow
    //     0x3726d8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3726dc: cmp             SP, x16
    //     0x3726e0: b.ls            #0x372790
    // 0x3726e4: r0 = Vector2()
    //     0x3726e4: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x3726e8: r4 = 4
    //     0x3726e8: mov             x4, #4
    // 0x3726ec: stur            x0, [fp, #-0x10]
    // 0x3726f0: r0 = AllocateFloat32Array()
    //     0x3726f0: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x3726f4: ldur            x7, [fp, #-0x10]
    // 0x3726f8: StoreField: r7->field_7 = r0
    //     0x3726f8: stur            w0, [x7, #7]
    // 0x3726fc: d0 = 0.000000
    //     0x3726fc: add             x17, PP, #0xc, lsl #12  ; [pp+0xc720] IMM: 0x41933333
    //     0x372700: ldr             s0, [x17, #0x720]
    // 0x372704: StoreField: r0->field_1b = d0
    //     0x372704: stur            s0, [x0, #0x1b]
    // 0x372708: d0 = 0.000000
    //     0x372708: add             x17, PP, #0xc, lsl #12  ; [pp+0xc728] IMM: 0x4159999a
    //     0x37270c: ldr             s0, [x17, #0x728]
    // 0x372710: ArrayStore: r0[0] = d0  ; List_8
    //     0x372710: stur            s0, [x0, #0x17]
    // 0x372714: ldur            x1, [fp, #-8]
    // 0x372718: r2 = Instance_Anchor
    //     0x372718: add             x2, PP, #8, lsl #12  ; [pp+0x8b30] Obj!Anchor@5cce91
    //     0x37271c: ldr             x2, [x2, #0xb30]
    // 0x372720: r3 = Null
    //     0x372720: mov             x3, NULL
    // 0x372724: r5 = 6
    //     0x372724: mov             x5, #6
    // 0x372728: r6 = _ConstMap len:0
    //     0x372728: add             x6, PP, #0xc, lsl #12  ; [pp+0xc730] Map<Never, bool>(0)
    //     0x37272c: ldr             x6, [x6, #0x730]
    // 0x372730: r0 = SpriteAnimationGroupComponent()
    //     0x372730: bl              #0x372798  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::SpriteAnimationGroupComponent
    // 0x372734: r0 = Vector2()
    //     0x372734: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x372738: r4 = 4
    //     0x372738: mov             x4, #4
    // 0x37273c: stur            x0, [fp, #-0x10]
    // 0x372740: r0 = AllocateFloat32Array()
    //     0x372740: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x372744: ldur            x2, [fp, #-0x10]
    // 0x372748: StoreField: r2->field_7 = r0
    //     0x372748: stur            w0, [x2, #7]
    // 0x37274c: d0 = 0.000000
    //     0x37274c: add             x17, PP, #0xc, lsl #12  ; [pp+0xc738] IMM: 0x4342eeef
    //     0x372750: ldr             s0, [x17, #0x738]
    // 0x372754: StoreField: r0->field_1b = d0
    //     0x372754: stur            s0, [x0, #0x1b]
    // 0x372758: d0 = 0.000000
    //     0x372758: add             x17, PP, #0xc, lsl #12  ; [pp+0xc740] IMM: 0x42800000
    //     0x37275c: ldr             s0, [x17, #0x740]
    // 0x372760: ArrayStore: r0[0] = d0  ; List_8
    //     0x372760: stur            s0, [x0, #0x17]
    // 0x372764: ldur            x0, [fp, #-8]
    // 0x372768: LoadField: r1 = r0->field_37
    //     0x372768: ldur            w1, [x0, #0x37]
    // 0x37276c: DecompressPointer r1
    //     0x37276c: add             x1, x1, HEAP, lsl #32
    // 0x372770: LoadField: r0 = r1->field_37
    //     0x372770: ldur            w0, [x1, #0x37]
    // 0x372774: DecompressPointer r0
    //     0x372774: add             x0, x0, HEAP, lsl #32
    // 0x372778: mov             x1, x0
    // 0x37277c: r0 = setFrom()
    //     0x37277c: bl              #0x549084  ; [package:flame/src/game/notifying_vector2.dart] NotifyingVector2::setFrom
    // 0x372780: r0 = Null
    //     0x372780: mov             x0, NULL
    // 0x372784: LeaveFrame
    //     0x372784: mov             SP, fp
    //     0x372788: ldp             fp, lr, [SP], #0x10
    // 0x37278c: ret
    //     0x37278c: ret             
    // 0x372790: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x372790: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x372794: b               #0x3726e4
  }
  _ attack(/* No info */) {
    // ** addr: 0x386070, size: 0xa0
    // 0x386070: EnterFrame
    //     0x386070: stp             fp, lr, [SP, #-0x10]!
    //     0x386074: mov             fp, SP
    // 0x386078: AllocStack(0x10)
    //     0x386078: sub             SP, SP, #0x10
    // 0x38607c: SetupParameters(Player this /* r1 => r0, fp-0x8 */)
    //     0x38607c: mov             x0, x1
    //     0x386080: stur            x1, [fp, #-8]
    // 0x386084: CheckStackOverflow
    //     0x386084: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x386088: cmp             SP, x16
    //     0x38608c: b.ls            #0x386100
    // 0x386090: mov             x1, x0
    // 0x386094: r2 = Instance_PlayerState
    //     0x386094: add             x2, PP, #0xe, lsl #12  ; [pp+0xe738] Obj!PlayerState@5d8a81
    //     0x386098: ldr             x2, [x2, #0x738]
    // 0x38609c: r0 = current=()
    //     0x38609c: bl              #0x3780ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::current=
    // 0x3860a0: ldur            x0, [fp, #-8]
    // 0x3860a4: LoadField: r3 = r0->field_5f
    //     0x3860a4: ldur            w3, [x0, #0x5f]
    // 0x3860a8: DecompressPointer r3
    //     0x3860a8: add             x3, x3, HEAP, lsl #32
    // 0x3860ac: stur            x3, [fp, #-0x10]
    // 0x3860b0: cmp             w3, NULL
    // 0x3860b4: b.eq            #0x386108
    // 0x3860b8: mov             x1, x3
    // 0x3860bc: r2 = Instance_PlayerState
    //     0x3860bc: add             x2, PP, #0xe, lsl #12  ; [pp+0xe738] Obj!PlayerState@5d8a81
    //     0x3860c0: ldr             x2, [x2, #0x738]
    // 0x3860c4: r0 = _getValueOrData()
    //     0x3860c4: bl              #0x23b838  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::_getValueOrData
    // 0x3860c8: mov             x1, x0
    // 0x3860cc: ldur            x0, [fp, #-0x10]
    // 0x3860d0: LoadField: r2 = r0->field_f
    //     0x3860d0: ldur            w2, [x0, #0xf]
    // 0x3860d4: DecompressPointer r2
    //     0x3860d4: add             x2, x2, HEAP, lsl #32
    // 0x3860d8: cmp             w2, w1
    // 0x3860dc: b.ne            #0x3860e4
    // 0x3860e0: r1 = Null
    //     0x3860e0: mov             x1, NULL
    // 0x3860e4: cmp             w1, NULL
    // 0x3860e8: b.eq            #0x38610c
    // 0x3860ec: r0 = reset()
    //     0x3860ec: bl              #0x3781f4  ; [package:flame/src/sprite_animation_ticker.dart] SpriteAnimationTicker::reset
    // 0x3860f0: r0 = Null
    //     0x3860f0: mov             x0, NULL
    // 0x3860f4: LeaveFrame
    //     0x3860f4: mov             SP, fp
    //     0x3860f8: ldp             fp, lr, [SP], #0x10
    // 0x3860fc: ret
    //     0x3860fc: ret             
    // 0x386100: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x386100: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x386104: b               #0x386090
    // 0x386108: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x386108: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x38610c: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x38610c: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  static _ preloadSprites(/* No info */) {
    // ** addr: 0x3c607c, size: 0x40
    // 0x3c607c: EnterFrame
    //     0x3c607c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c6080: mov             fp, SP
    // 0x3c6084: CheckStackOverflow
    //     0x3c6084: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c6088: cmp             SP, x16
    //     0x3c608c: b.ls            #0x3c60b4
    // 0x3c6090: LoadField: r0 = r1->field_47
    //     0x3c6090: ldur            w0, [x1, #0x47]
    // 0x3c6094: DecompressPointer r0
    //     0x3c6094: add             x0, x0, HEAP, lsl #32
    // 0x3c6098: mov             x1, x0
    // 0x3c609c: r2 = "character_subset.png"
    //     0x3c609c: add             x2, PP, #0xe, lsl #12  ; [pp+0xe748] "character_subset.png"
    //     0x3c60a0: ldr             x2, [x2, #0x748]
    // 0x3c60a4: r0 = load()
    //     0x3c60a4: bl              #0x3c4ce0  ; [package:flame/src/cache/images.dart] Images::load
    // 0x3c60a8: LeaveFrame
    //     0x3c60a8: mov             SP, fp
    //     0x3c60ac: ldp             fp, lr, [SP], #0x10
    // 0x3c60b0: ret
    //     0x3c60b0: ret             
    // 0x3c60b4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c60b4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c60b8: b               #0x3c6090
  }
  _ onLoad(/* No info */) async {
    // ** addr: 0x434960, size: 0x10c
    // 0x434960: EnterFrame
    //     0x434960: stp             fp, lr, [SP, #-0x10]!
    //     0x434964: mov             fp, SP
    // 0x434968: AllocStack(0x20)
    //     0x434968: sub             SP, SP, #0x20
    // 0x43496c: SetupParameters(Player this /* r1 => r1, fp-0x10 */)
    //     0x43496c: stur            NULL, [fp, #-8]
    //     0x434970: stur            x1, [fp, #-0x10]
    // 0x434974: CheckStackOverflow
    //     0x434974: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x434978: cmp             SP, x16
    //     0x43497c: b.ls            #0x434a5c
    // 0x434980: r1 = 1
    //     0x434980: mov             x1, #1
    // 0x434984: r0 = AllocateContext()
    //     0x434984: bl              #0x5834e8  ; AllocateContextStub
    // 0x434988: mov             x2, x0
    // 0x43498c: ldur            x1, [fp, #-0x10]
    // 0x434990: stur            x2, [fp, #-0x18]
    // 0x434994: StoreField: r2->field_f = r1
    //     0x434994: stur            w1, [x2, #0xf]
    // 0x434998: InitAsync() -> Future<void?>
    //     0x434998: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x43499c: bl              #0x2556b4  ; InitAsyncStub
    // 0x4349a0: ldur            x1, [fp, #-0x10]
    // 0x4349a4: r0 = getAnimations()
    //     0x4349a4: bl              #0x434a6c  ; [package:ricochlime/flame/components/player.dart] Player::getAnimations
    // 0x4349a8: ldur            x1, [fp, #-0x10]
    // 0x4349ac: mov             x2, x0
    // 0x4349b0: r0 = animations=()
    //     0x4349b0: bl              #0x374fac  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::animations=
    // 0x4349b4: ldur            x1, [fp, #-0x10]
    // 0x4349b8: r2 = Instance_PlayerState
    //     0x4349b8: add             x2, PP, #0xe, lsl #12  ; [pp+0xe730] Obj!PlayerState@5d8aa1
    //     0x4349bc: ldr             x2, [x2, #0x730]
    // 0x4349c0: r0 = current=()
    //     0x4349c0: bl              #0x3780ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::current=
    // 0x4349c4: r0 = Null
    //     0x4349c4: mov             x0, NULL
    // 0x4349c8: r0 = Await()
    //     0x4349c8: bl              #0x255470  ; AwaitStub
    // 0x4349cc: ldur            x0, [fp, #-0x10]
    // 0x4349d0: LoadField: r3 = r0->field_5f
    //     0x4349d0: ldur            w3, [x0, #0x5f]
    // 0x4349d4: DecompressPointer r3
    //     0x4349d4: add             x3, x3, HEAP, lsl #32
    // 0x4349d8: stur            x3, [fp, #-0x20]
    // 0x4349dc: cmp             w3, NULL
    // 0x4349e0: b.eq            #0x434a64
    // 0x4349e4: mov             x1, x3
    // 0x4349e8: r2 = Instance_PlayerState
    //     0x4349e8: add             x2, PP, #0xe, lsl #12  ; [pp+0xe738] Obj!PlayerState@5d8a81
    //     0x4349ec: ldr             x2, [x2, #0x738]
    // 0x4349f0: r0 = _getValueOrData()
    //     0x4349f0: bl              #0x23b838  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::_getValueOrData
    // 0x4349f4: mov             x1, x0
    // 0x4349f8: ldur            x0, [fp, #-0x20]
    // 0x4349fc: LoadField: r2 = r0->field_f
    //     0x4349fc: ldur            w2, [x0, #0xf]
    // 0x434a00: DecompressPointer r2
    //     0x434a00: add             x2, x2, HEAP, lsl #32
    // 0x434a04: cmp             w2, w1
    // 0x434a08: b.ne            #0x434a14
    // 0x434a0c: r0 = Null
    //     0x434a0c: mov             x0, NULL
    // 0x434a10: b               #0x434a18
    // 0x434a14: mov             x0, x1
    // 0x434a18: stur            x0, [fp, #-0x10]
    // 0x434a1c: cmp             w0, NULL
    // 0x434a20: b.eq            #0x434a68
    // 0x434a24: ldur            x2, [fp, #-0x18]
    // 0x434a28: r1 = Function '<anonymous closure>':.
    //     0x434a28: add             x1, PP, #0xe, lsl #12  ; [pp+0xe740] AnonymousClosure: (0x434cfc), in [package:ricochlime/flame/components/player.dart] Player::onLoad (0x434960)
    //     0x434a2c: ldr             x1, [x1, #0x740]
    // 0x434a30: r0 = AllocateClosure()
    //     0x434a30: bl              #0x5838bc  ; AllocateClosureStub
    // 0x434a34: ldur            x1, [fp, #-0x10]
    // 0x434a38: StoreField: r1->field_2b = r0
    //     0x434a38: stur            w0, [x1, #0x2b]
    //     0x434a3c: ldurb           w16, [x1, #-1]
    //     0x434a40: ldurb           w17, [x0, #-1]
    //     0x434a44: and             x16, x17, x16, lsr #2
    //     0x434a48: tst             x16, HEAP, lsr #32
    //     0x434a4c: b.eq            #0x434a54
    //     0x434a50: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x434a54: r0 = Null
    //     0x434a54: mov             x0, NULL
    // 0x434a58: r0 = ReturnAsyncNotFuture()
    //     0x434a58: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x434a5c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x434a5c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x434a60: b               #0x434980
    // 0x434a64: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x434a64: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
    // 0x434a68: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x434a68: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  _ getAnimations(/* No info */) {
    // ** addr: 0x434a6c, size: 0x1dc
    // 0x434a6c: EnterFrame
    //     0x434a6c: stp             fp, lr, [SP, #-0x10]!
    //     0x434a70: mov             fp, SP
    // 0x434a74: AllocStack(0x30)
    //     0x434a74: sub             SP, SP, #0x30
    // 0x434a78: CheckStackOverflow
    //     0x434a78: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x434a7c: cmp             SP, x16
    //     0x434a80: b.ls            #0x434c40
    // 0x434a84: r0 = game()
    //     0x434a84: bl              #0x434c48  ; [dart:mixin_deduplication] _MixinApplication270&SpriteAnimationGroupComponent&HasGameReference::game
    // 0x434a88: LoadField: r1 = r0->field_47
    //     0x434a88: ldur            w1, [x0, #0x47]
    // 0x434a8c: DecompressPointer r1
    //     0x434a8c: add             x1, x1, HEAP, lsl #32
    // 0x434a90: r2 = "character_subset.png"
    //     0x434a90: add             x2, PP, #0xe, lsl #12  ; [pp+0xe748] "character_subset.png"
    //     0x434a94: ldr             x2, [x2, #0x748]
    // 0x434a98: r0 = fromCache()
    //     0x434a98: bl              #0x28c0f4  ; [package:flame/src/cache/images.dart] Images::fromCache
    // 0x434a9c: r1 = Null
    //     0x434a9c: mov             x1, NULL
    // 0x434aa0: r2 = 8
    //     0x434aa0: mov             x2, #8
    // 0x434aa4: stur            x0, [fp, #-8]
    // 0x434aa8: r0 = AllocateArray()
    //     0x434aa8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x434aac: stur            x0, [fp, #-0x10]
    // 0x434ab0: r16 = Instance_PlayerState
    //     0x434ab0: add             x16, PP, #0xe, lsl #12  ; [pp+0xe730] Obj!PlayerState@5d8aa1
    //     0x434ab4: ldr             x16, [x16, #0x730]
    // 0x434ab8: StoreField: r0->field_f = r16
    //     0x434ab8: stur            w16, [x0, #0xf]
    // 0x434abc: r0 = Vector2()
    //     0x434abc: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434ac0: r4 = 4
    //     0x434ac0: mov             x4, #4
    // 0x434ac4: stur            x0, [fp, #-0x18]
    // 0x434ac8: r0 = AllocateFloat32Array()
    //     0x434ac8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434acc: ldur            x5, [fp, #-0x18]
    // 0x434ad0: StoreField: r5->field_7 = r0
    //     0x434ad0: stur            w0, [x5, #7]
    // 0x434ad4: d0 = 0.000000
    //     0x434ad4: add             x17, PP, #0xe, lsl #12  ; [pp+0xe750] IMM: 0x41b80000
    //     0x434ad8: ldr             s0, [x17, #0x750]
    // 0x434adc: StoreField: r0->field_1b = d0
    //     0x434adc: stur            s0, [x0, #0x1b]
    // 0x434ae0: d1 = 0.000000
    //     0x434ae0: add             x17, PP, #0xe, lsl #12  ; [pp+0xe758] IMM: 0x41880000
    //     0x434ae4: ldr             s1, [x17, #0x758]
    // 0x434ae8: ArrayStore: r0[0] = d1  ; List_8
    //     0x434ae8: stur            s1, [x0, #0x17]
    // 0x434aec: r0 = Vector2()
    //     0x434aec: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434af0: r4 = 4
    //     0x434af0: mov             x4, #4
    // 0x434af4: stur            x0, [fp, #-0x20]
    // 0x434af8: r0 = AllocateFloat32Array()
    //     0x434af8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434afc: ldur            x3, [fp, #-0x20]
    // 0x434b00: StoreField: r3->field_7 = r0
    //     0x434b00: stur            w0, [x3, #7]
    // 0x434b04: StoreField: r0->field_1b = rZR
    //     0x434b04: stur            wzr, [x0, #0x1b]
    // 0x434b08: ArrayStore: r0[0] = rZR  ; List_4
    //     0x434b08: stur            wzr, [x0, #0x17]
    // 0x434b0c: ldur            x5, [fp, #-0x18]
    // 0x434b10: r1 = Null
    //     0x434b10: mov             x1, NULL
    // 0x434b14: r2 = 2
    //     0x434b14: mov             x2, #2
    // 0x434b18: d0 = 0.500000
    //     0x434b18: fmov            d0, #0.50000000
    // 0x434b1c: r4 = const [0, 0x5, 0, 0x5, null]
    //     0x434b1c: ldr             x4, [PP, #0x16f0]  ; [pp+0x16f0] List(5) [0, 0x5, 0, 0x5, Null]
    // 0x434b20: r0 = SpriteAnimationData.sequenced()
    //     0x434b20: bl              #0x375a10  ; [package:flame/src/sprite_animation.dart] SpriteAnimationData::SpriteAnimationData.sequenced
    // 0x434b24: ldur            x2, [fp, #-8]
    // 0x434b28: mov             x3, x0
    // 0x434b2c: r1 = Null
    //     0x434b2c: mov             x1, NULL
    // 0x434b30: r0 = SpriteAnimation.fromFrameData()
    //     0x434b30: bl              #0x3756f0  ; [package:flame/src/sprite_animation.dart] SpriteAnimation::SpriteAnimation.fromFrameData
    // 0x434b34: ldur            x1, [fp, #-0x10]
    // 0x434b38: ArrayStore: r1[1] = r0  ; List_4
    //     0x434b38: add             x25, x1, #0x13
    //     0x434b3c: str             w0, [x25]
    //     0x434b40: tbz             w0, #0, #0x434b5c
    //     0x434b44: ldurb           w16, [x1, #-1]
    //     0x434b48: ldurb           w17, [x0, #-1]
    //     0x434b4c: and             x16, x17, x16, lsr #2
    //     0x434b50: tst             x16, HEAP, lsr #32
    //     0x434b54: b.eq            #0x434b5c
    //     0x434b58: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x434b5c: ldur            x1, [fp, #-0x10]
    // 0x434b60: r16 = Instance_PlayerState
    //     0x434b60: add             x16, PP, #0xe, lsl #12  ; [pp+0xe738] Obj!PlayerState@5d8a81
    //     0x434b64: ldr             x16, [x16, #0x738]
    // 0x434b68: ArrayStore: r1[0] = r16  ; List_4
    //     0x434b68: stur            w16, [x1, #0x17]
    // 0x434b6c: r0 = Vector2()
    //     0x434b6c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434b70: r4 = 4
    //     0x434b70: mov             x4, #4
    // 0x434b74: stur            x0, [fp, #-0x18]
    // 0x434b78: r0 = AllocateFloat32Array()
    //     0x434b78: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434b7c: ldur            x5, [fp, #-0x18]
    // 0x434b80: StoreField: r5->field_7 = r0
    //     0x434b80: stur            w0, [x5, #7]
    // 0x434b84: d0 = 0.000000
    //     0x434b84: add             x17, PP, #0xe, lsl #12  ; [pp+0xe750] IMM: 0x41b80000
    //     0x434b88: ldr             s0, [x17, #0x750]
    // 0x434b8c: StoreField: r0->field_1b = d0
    //     0x434b8c: stur            s0, [x0, #0x1b]
    // 0x434b90: d1 = 0.000000
    //     0x434b90: add             x17, PP, #0xe, lsl #12  ; [pp+0xe758] IMM: 0x41880000
    //     0x434b94: ldr             s1, [x17, #0x758]
    // 0x434b98: ArrayStore: r0[0] = d1  ; List_8
    //     0x434b98: stur            s1, [x0, #0x17]
    // 0x434b9c: r0 = Vector2()
    //     0x434b9c: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x434ba0: r4 = 4
    //     0x434ba0: mov             x4, #4
    // 0x434ba4: stur            x0, [fp, #-0x20]
    // 0x434ba8: r0 = AllocateFloat32Array()
    //     0x434ba8: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x434bac: ldur            x3, [fp, #-0x20]
    // 0x434bb0: StoreField: r3->field_7 = r0
    //     0x434bb0: stur            w0, [x3, #7]
    // 0x434bb4: d0 = 0.000000
    //     0x434bb4: add             x17, PP, #0xe, lsl #12  ; [pp+0xe750] IMM: 0x41b80000
    //     0x434bb8: ldr             s0, [x17, #0x750]
    // 0x434bbc: StoreField: r0->field_1b = d0
    //     0x434bbc: stur            s0, [x0, #0x1b]
    // 0x434bc0: ArrayStore: r0[0] = rZR  ; List_4
    //     0x434bc0: stur            wzr, [x0, #0x17]
    // 0x434bc4: r16 = false
    //     0x434bc4: add             x16, NULL, #0x30  ; false
    // 0x434bc8: str             x16, [SP]
    // 0x434bcc: ldur            x5, [fp, #-0x18]
    // 0x434bd0: r1 = Null
    //     0x434bd0: mov             x1, NULL
    // 0x434bd4: r2 = 4
    //     0x434bd4: mov             x2, #4
    // 0x434bd8: d0 = 0.125000
    //     0x434bd8: fmov            d0, #0.12500000
    // 0x434bdc: r4 = const [0, 0x6, 0x1, 0x5, loop, 0x5, null]
    //     0x434bdc: add             x4, PP, #0xc, lsl #12  ; [pp+0xc8d8] List(7) [0, 0x6, 0x1, 0x5, "loop", 0x5, Null]
    //     0x434be0: ldr             x4, [x4, #0x8d8]
    // 0x434be4: r0 = SpriteAnimationData.sequenced()
    //     0x434be4: bl              #0x375a10  ; [package:flame/src/sprite_animation.dart] SpriteAnimationData::SpriteAnimationData.sequenced
    // 0x434be8: ldur            x2, [fp, #-8]
    // 0x434bec: mov             x3, x0
    // 0x434bf0: r1 = Null
    //     0x434bf0: mov             x1, NULL
    // 0x434bf4: r0 = SpriteAnimation.fromFrameData()
    //     0x434bf4: bl              #0x3756f0  ; [package:flame/src/sprite_animation.dart] SpriteAnimation::SpriteAnimation.fromFrameData
    // 0x434bf8: ldur            x1, [fp, #-0x10]
    // 0x434bfc: ArrayStore: r1[3] = r0  ; List_4
    //     0x434bfc: add             x25, x1, #0x1b
    //     0x434c00: str             w0, [x25]
    //     0x434c04: tbz             w0, #0, #0x434c20
    //     0x434c08: ldurb           w16, [x1, #-1]
    //     0x434c0c: ldurb           w17, [x0, #-1]
    //     0x434c10: and             x16, x17, x16, lsr #2
    //     0x434c14: tst             x16, HEAP, lsr #32
    //     0x434c18: b.eq            #0x434c20
    //     0x434c1c: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x434c20: r16 = <PlayerState, SpriteAnimation>
    //     0x434c20: add             x16, PP, #0xe, lsl #12  ; [pp+0xe760] TypeArguments: <PlayerState, SpriteAnimation>
    //     0x434c24: ldr             x16, [x16, #0x760]
    // 0x434c28: ldur            lr, [fp, #-0x10]
    // 0x434c2c: stp             lr, x16, [SP]
    // 0x434c30: r0 = Map._fromLiteral()
    //     0x434c30: bl              #0x23b588  ; [dart:core] Map::Map._fromLiteral
    // 0x434c34: LeaveFrame
    //     0x434c34: mov             SP, fp
    //     0x434c38: ldp             fp, lr, [SP], #0x10
    // 0x434c3c: ret
    //     0x434c3c: ret             
    // 0x434c40: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x434c40: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x434c44: b               #0x434a84
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x434cfc, size: 0x50
    // 0x434cfc: EnterFrame
    //     0x434cfc: stp             fp, lr, [SP, #-0x10]!
    //     0x434d00: mov             fp, SP
    // 0x434d04: ldr             x0, [fp, #0x10]
    // 0x434d08: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x434d08: ldur            w1, [x0, #0x17]
    // 0x434d0c: DecompressPointer r1
    //     0x434d0c: add             x1, x1, HEAP, lsl #32
    // 0x434d10: CheckStackOverflow
    //     0x434d10: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x434d14: cmp             SP, x16
    //     0x434d18: b.ls            #0x434d44
    // 0x434d1c: LoadField: r0 = r1->field_f
    //     0x434d1c: ldur            w0, [x1, #0xf]
    // 0x434d20: DecompressPointer r0
    //     0x434d20: add             x0, x0, HEAP, lsl #32
    // 0x434d24: mov             x1, x0
    // 0x434d28: r2 = Instance_PlayerState
    //     0x434d28: add             x2, PP, #0xe, lsl #12  ; [pp+0xe730] Obj!PlayerState@5d8aa1
    //     0x434d2c: ldr             x2, [x2, #0x730]
    // 0x434d30: r0 = current=()
    //     0x434d30: bl              #0x3780ec  ; [package:flame/src/components/sprite_animation_group_component.dart] SpriteAnimationGroupComponent::current=
    // 0x434d34: r0 = Null
    //     0x434d34: mov             x0, NULL
    // 0x434d38: LeaveFrame
    //     0x434d38: mov             SP, fp
    //     0x434d3c: ldp             fp, lr, [SP], #0x10
    // 0x434d40: ret
    //     0x434d40: ret             
    // 0x434d44: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x434d44: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x434d48: b               #0x434d1c
  }
}

// class id: 3841, size: 0x14, field offset: 0x14
enum PlayerState extends _Enum {

  _Mint field_8;
  _OneByteString field_10;

  _ _enumToString(/* No info */) {
    // ** addr: 0x4a027c, size: 0x64
    // 0x4a027c: EnterFrame
    //     0x4a027c: stp             fp, lr, [SP, #-0x10]!
    //     0x4a0280: mov             fp, SP
    // 0x4a0284: AllocStack(0x10)
    //     0x4a0284: sub             SP, SP, #0x10
    // 0x4a0288: SetupParameters(PlayerState this /* r1 => r0, fp-0x8 */)
    //     0x4a0288: mov             x0, x1
    //     0x4a028c: stur            x1, [fp, #-8]
    // 0x4a0290: CheckStackOverflow
    //     0x4a0290: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a0294: cmp             SP, x16
    //     0x4a0298: b.ls            #0x4a02d8
    // 0x4a029c: r1 = Null
    //     0x4a029c: mov             x1, NULL
    // 0x4a02a0: r2 = 4
    //     0x4a02a0: mov             x2, #4
    // 0x4a02a4: r0 = AllocateArray()
    //     0x4a02a4: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a02a8: r16 = "PlayerState."
    //     0x4a02a8: add             x16, PP, #0x10, lsl #12  ; [pp+0x10ad0] "PlayerState."
    //     0x4a02ac: ldr             x16, [x16, #0xad0]
    // 0x4a02b0: StoreField: r0->field_f = r16
    //     0x4a02b0: stur            w16, [x0, #0xf]
    // 0x4a02b4: ldur            x1, [fp, #-8]
    // 0x4a02b8: LoadField: r2 = r1->field_f
    //     0x4a02b8: ldur            w2, [x1, #0xf]
    // 0x4a02bc: DecompressPointer r2
    //     0x4a02bc: add             x2, x2, HEAP, lsl #32
    // 0x4a02c0: StoreField: r0->field_13 = r2
    //     0x4a02c0: stur            w2, [x0, #0x13]
    // 0x4a02c4: str             x0, [SP]
    // 0x4a02c8: r0 = _interpolate()
    //     0x4a02c8: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a02cc: LeaveFrame
    //     0x4a02cc: mov             SP, fp
    //     0x4a02d0: ldp             fp, lr, [SP], #0x10
    // 0x4a02d4: ret
    //     0x4a02d4: ret             
    // 0x4a02d8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a02d8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a02dc: b               #0x4a029c
  }
}
