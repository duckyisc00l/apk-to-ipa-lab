// lib: , url: package:ricochlime/nes/bouncing_icon.dart

// class id: 1049317, size: 0x8
class :: {
}

// class id: 2617, size: 0x24, field offset: 0x1c
class _BouncingIconState extends _MixinApplication271&State&SingleTickerProviderStateMixin {

  late final AnimationController _controller; // offset: 0x1c
  late final Animation<Offset> _offsetAnimation; // offset: 0x20

  _ build(/* No info */) {
    // ** addr: 0x36f9e8, size: 0xa0
    // 0x36f9e8: EnterFrame
    //     0x36f9e8: stp             fp, lr, [SP, #-0x10]!
    //     0x36f9ec: mov             fp, SP
    // 0x36f9f0: AllocStack(0x10)
    //     0x36f9f0: sub             SP, SP, #0x10
    // 0x36f9f4: SetupParameters(_BouncingIconState this /* r1 => r0, fp-0x8 */)
    //     0x36f9f4: mov             x0, x1
    //     0x36f9f8: stur            x1, [fp, #-8]
    // 0x36f9fc: CheckStackOverflow
    //     0x36f9fc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x36fa00: cmp             SP, x16
    //     0x36fa04: b.ls            #0x36fa7c
    // 0x36fa08: mov             x1, x0
    // 0x36fa0c: LoadField: r0 = r1->field_1f
    //     0x36fa0c: ldur            w0, [x1, #0x1f]
    // 0x36fa10: DecompressPointer r0
    //     0x36fa10: add             x0, x0, HEAP, lsl #32
    // 0x36fa14: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36fa18: cmp             w0, w16
    // 0x36fa1c: b.ne            #0x36fa2c
    // 0x36fa20: r2 = _offsetAnimation
    //     0x36fa20: add             x2, PP, #0x1a, lsl #12  ; [pp+0x1a7d0] Field <_BouncingIconState@230413921._offsetAnimation@230413921>: late final (offset: 0x20)
    //     0x36fa24: ldr             x2, [x2, #0x7d0]
    // 0x36fa28: r0 = InitLateFinalInstanceField()
    //     0x36fa28: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x36fa2c: mov             x1, x0
    // 0x36fa30: ldur            x0, [fp, #-8]
    // 0x36fa34: stur            x1, [fp, #-0x10]
    // 0x36fa38: LoadField: r2 = r0->field_b
    //     0x36fa38: ldur            w2, [x0, #0xb]
    // 0x36fa3c: DecompressPointer r2
    //     0x36fa3c: add             x2, x2, HEAP, lsl #32
    // 0x36fa40: cmp             w2, NULL
    // 0x36fa44: b.eq            #0x36fa84
    // 0x36fa48: LoadField: r0 = r2->field_b
    //     0x36fa48: ldur            w0, [x2, #0xb]
    // 0x36fa4c: DecompressPointer r0
    //     0x36fa4c: add             x0, x0, HEAP, lsl #32
    // 0x36fa50: stur            x0, [fp, #-8]
    // 0x36fa54: r0 = SlideTransition()
    //     0x36fa54: bl              #0x36fa88  ; AllocateSlideTransitionStub -> SlideTransition (size=0x1c)
    // 0x36fa58: r1 = false
    //     0x36fa58: add             x1, NULL, #0x30  ; false
    // 0x36fa5c: StoreField: r0->field_13 = r1
    //     0x36fa5c: stur            w1, [x0, #0x13]
    // 0x36fa60: ldur            x1, [fp, #-8]
    // 0x36fa64: ArrayStore: r0[0] = r1  ; List_4
    //     0x36fa64: stur            w1, [x0, #0x17]
    // 0x36fa68: ldur            x1, [fp, #-0x10]
    // 0x36fa6c: StoreField: r0->field_b = r1
    //     0x36fa6c: stur            w1, [x0, #0xb]
    // 0x36fa70: LeaveFrame
    //     0x36fa70: mov             SP, fp
    //     0x36fa74: ldp             fp, lr, [SP], #0x10
    // 0x36fa78: ret
    //     0x36fa78: ret             
    // 0x36fa7c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x36fa7c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x36fa80: b               #0x36fa08
    // 0x36fa84: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x36fa84: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  Animation<Offset> _offsetAnimation(_BouncingIconState) {
    // ** addr: 0x36fa94, size: 0xac
    // 0x36fa94: EnterFrame
    //     0x36fa94: stp             fp, lr, [SP, #-0x10]!
    //     0x36fa98: mov             fp, SP
    // 0x36fa9c: AllocStack(0x10)
    //     0x36fa9c: sub             SP, SP, #0x10
    // 0x36faa0: CheckStackOverflow
    //     0x36faa0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x36faa4: cmp             SP, x16
    //     0x36faa8: b.ls            #0x36fb38
    // 0x36faac: r1 = <Offset>
    //     0x36faac: add             x1, PP, #0x10, lsl #12  ; [pp+0x10b80] TypeArguments: <Offset>
    //     0x36fab0: ldr             x1, [x1, #0xb80]
    // 0x36fab4: r0 = Tween()
    //     0x36fab4: bl              #0x330df4  ; AllocateTweenStub -> Tween<X0> (size=0x14)
    // 0x36fab8: mov             x2, x0
    // 0x36fabc: r0 = Instance_Offset
    //     0x36fabc: ldr             x0, [PP, #0x45a0]  ; [pp+0x45a0] Obj!Offset@5d02e1
    // 0x36fac0: stur            x2, [fp, #-8]
    // 0x36fac4: StoreField: r2->field_b = r0
    //     0x36fac4: stur            w0, [x2, #0xb]
    // 0x36fac8: r0 = Instance_Offset
    //     0x36fac8: add             x0, PP, #0x1a, lsl #12  ; [pp+0x1a7d8] Obj!Offset@5d0541
    //     0x36facc: ldr             x0, [x0, #0x7d8]
    // 0x36fad0: StoreField: r2->field_f = r0
    //     0x36fad0: stur            w0, [x2, #0xf]
    // 0x36fad4: ldr             x1, [fp, #0x10]
    // 0x36fad8: LoadField: r0 = r1->field_1b
    //     0x36fad8: ldur            w0, [x1, #0x1b]
    // 0x36fadc: DecompressPointer r0
    //     0x36fadc: add             x0, x0, HEAP, lsl #32
    // 0x36fae0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36fae4: cmp             w0, w16
    // 0x36fae8: b.ne            #0x36faf8
    // 0x36faec: r2 = _controller
    //     0x36faec: add             x2, PP, #0x1a, lsl #12  ; [pp+0x1a7b8] Field <_BouncingIconState@230413921._controller@230413921>: late final (offset: 0x1c)
    //     0x36faf0: ldr             x2, [x2, #0x7b8]
    // 0x36faf4: r0 = InitLateFinalInstanceField()
    //     0x36faf4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x36faf8: r1 = <double>
    //     0x36faf8: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x36fafc: stur            x0, [fp, #-0x10]
    // 0x36fb00: r0 = CurvedAnimation()
    //     0x36fb00: bl              #0x330468  ; AllocateCurvedAnimationStub -> CurvedAnimation (size=0x1c)
    // 0x36fb04: mov             x1, x0
    // 0x36fb08: ldur            x3, [fp, #-0x10]
    // 0x36fb0c: r2 = Instance_Cubic
    //     0x36fb0c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11a58] Obj!Cubic@5ccaf1
    //     0x36fb10: ldr             x2, [x2, #0xa58]
    // 0x36fb14: stur            x0, [fp, #-0x10]
    // 0x36fb18: r4 = const [0, 0x3, 0, 0x3, null]
    //     0x36fb18: ldr             x4, [PP, #0x310]  ; [pp+0x310] List(5) [0, 0x3, 0, 0x3, Null]
    // 0x36fb1c: r0 = CurvedAnimation()
    //     0x36fb1c: bl              #0x330324  ; [package:flutter/src/animation/animations.dart] CurvedAnimation::CurvedAnimation
    // 0x36fb20: ldur            x1, [fp, #-8]
    // 0x36fb24: ldur            x2, [fp, #-0x10]
    // 0x36fb28: r0 = animate()
    //     0x36fb28: bl              #0x31b694  ; [package:flutter/src/animation/tween.dart] Animatable::animate
    // 0x36fb2c: LeaveFrame
    //     0x36fb2c: mov             SP, fp
    //     0x36fb30: ldp             fp, lr, [SP], #0x10
    // 0x36fb34: ret
    //     0x36fb34: ret             
    // 0x36fb38: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x36fb38: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x36fb3c: b               #0x36faac
  }
  AnimationController _controller(_BouncingIconState) {
    // ** addr: 0x36fb40, size: 0x98
    // 0x36fb40: EnterFrame
    //     0x36fb40: stp             fp, lr, [SP, #-0x10]!
    //     0x36fb44: mov             fp, SP
    // 0x36fb48: AllocStack(0x18)
    //     0x36fb48: sub             SP, SP, #0x18
    // 0x36fb4c: CheckStackOverflow
    //     0x36fb4c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x36fb50: cmp             SP, x16
    //     0x36fb54: b.ls            #0x36fbd0
    // 0x36fb58: r1 = 1
    //     0x36fb58: mov             x1, #1
    // 0x36fb5c: r0 = AllocateContext()
    //     0x36fb5c: bl              #0x5834e8  ; AllocateContextStub
    // 0x36fb60: ldr             x2, [fp, #0x10]
    // 0x36fb64: stur            x0, [fp, #-8]
    // 0x36fb68: StoreField: r0->field_f = r2
    //     0x36fb68: stur            w2, [x0, #0xf]
    // 0x36fb6c: r1 = <double>
    //     0x36fb6c: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x36fb70: r0 = AnimationController()
    //     0x36fb70: bl              #0x26ea54  ; AllocateAnimationControllerStub -> AnimationController (size=0x4c)
    // 0x36fb74: stur            x0, [fp, #-0x10]
    // 0x36fb78: r16 = Instance_Duration
    //     0x36fb78: add             x16, PP, #0xa, lsl #12  ; [pp+0xaa80] Obj!Duration@5dcd81
    //     0x36fb7c: ldr             x16, [x16, #0xa80]
    // 0x36fb80: str             x16, [SP]
    // 0x36fb84: mov             x1, x0
    // 0x36fb88: ldr             x2, [fp, #0x10]
    // 0x36fb8c: r4 = const [0, 0x3, 0x1, 0x2, duration, 0x2, null]
    //     0x36fb8c: add             x4, PP, #0x13, lsl #12  ; [pp+0x130f8] List(7) [0, 0x3, 0x1, 0x2, "duration", 0x2, Null]
    //     0x36fb90: ldr             x4, [x4, #0xf8]
    // 0x36fb94: r0 = AnimationController()
    //     0x36fb94: bl              #0x2f8a38  ; [package:flutter/src/animation/animation_controller.dart] AnimationController::AnimationController
    // 0x36fb98: ldur            x1, [fp, #-0x10]
    // 0x36fb9c: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x36fb9c: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x36fba0: r0 = forward()
    //     0x36fba0: bl              #0x30e728  ; [package:flutter/src/animation/animation_controller.dart] AnimationController::forward
    // 0x36fba4: ldur            x2, [fp, #-8]
    // 0x36fba8: r1 = Function '<anonymous closure>':.
    //     0x36fba8: add             x1, PP, #0x1a, lsl #12  ; [pp+0x1a7c0] AnonymousClosure: (0x36fbd8), in [package:ricochlime/nes/bouncing_icon.dart] _BouncingIconState::_controller (0x36fb40)
    //     0x36fbac: ldr             x1, [x1, #0x7c0]
    // 0x36fbb0: r0 = AllocateClosure()
    //     0x36fbb0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x36fbb4: ldur            x1, [fp, #-0x10]
    // 0x36fbb8: mov             x2, x0
    // 0x36fbbc: r0 = addStatusListener()
    //     0x36fbbc: bl              #0x550050  ; [dart:mixin_deduplication] _MixinApplication278&Animation&AnimationEagerListenerMixin&AnimationLocalListenersMixin&AnimationLocalStatusListenersMixin::addStatusListener
    // 0x36fbc0: ldur            x0, [fp, #-0x10]
    // 0x36fbc4: LeaveFrame
    //     0x36fbc4: mov             SP, fp
    //     0x36fbc8: ldp             fp, lr, [SP], #0x10
    // 0x36fbcc: ret
    //     0x36fbcc: ret             
    // 0x36fbd0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x36fbd0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x36fbd4: b               #0x36fb58
  }
  [closure] void <anonymous closure>(dynamic, AnimationStatus) {
    // ** addr: 0x36fbd8, size: 0xf8
    // 0x36fbd8: EnterFrame
    //     0x36fbd8: stp             fp, lr, [SP, #-0x10]!
    //     0x36fbdc: mov             fp, SP
    // 0x36fbe0: AllocStack(0x8)
    //     0x36fbe0: sub             SP, SP, #8
    // 0x36fbe4: SetupParameters([dynamic _ /* r0 */])
    //     0x36fbe4: ldr             x0, [fp, #0x18]
    //     0x36fbe8: ldur            w2, [x0, #0x17]
    //     0x36fbec: add             x2, x2, HEAP, lsl #32
    // 0x36fbf0: CheckStackOverflow
    //     0x36fbf0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x36fbf4: cmp             SP, x16
    //     0x36fbf8: b.ls            #0x36fcc8
    // 0x36fbfc: ldr             x0, [fp, #0x10]
    // 0x36fc00: LoadField: r3 = r0->field_7
    //     0x36fc00: ldur            x3, [x0, #7]
    // 0x36fc04: cmp             x3, #0
    // 0x36fc08: b.gt            #0x36fc60
    // 0x36fc0c: LoadField: r1 = r2->field_f
    //     0x36fc0c: ldur            w1, [x2, #0xf]
    // 0x36fc10: DecompressPointer r1
    //     0x36fc10: add             x1, x1, HEAP, lsl #32
    // 0x36fc14: LoadField: r0 = r1->field_1b
    //     0x36fc14: ldur            w0, [x1, #0x1b]
    // 0x36fc18: DecompressPointer r0
    //     0x36fc18: add             x0, x0, HEAP, lsl #32
    // 0x36fc1c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36fc20: cmp             w0, w16
    // 0x36fc24: b.ne            #0x36fc34
    // 0x36fc28: r2 = _controller
    //     0x36fc28: add             x2, PP, #0x1a, lsl #12  ; [pp+0x1a7b8] Field <_BouncingIconState@230413921._controller@230413921>: late final (offset: 0x1c)
    //     0x36fc2c: ldr             x2, [x2, #0x7b8]
    // 0x36fc30: r0 = InitLateFinalInstanceField()
    //     0x36fc30: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x36fc34: mov             x2, x0
    // 0x36fc38: r1 = Function 'forward':.
    //     0x36fc38: add             x1, PP, #0x1a, lsl #12  ; [pp+0x1a7c8] AnonymousClosure: (0x30e7c4), in [package:flutter/src/animation/animation_controller.dart] AnimationController::forward (0x30e728)
    //     0x36fc3c: ldr             x1, [x1, #0x7c8]
    // 0x36fc40: r0 = AllocateClosure()
    //     0x36fc40: bl              #0x5838bc  ; AllocateClosureStub
    // 0x36fc44: str             x0, [SP]
    // 0x36fc48: r1 = <void?>
    //     0x36fc48: ldr             x1, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x36fc4c: r2 = Instance_Duration
    //     0x36fc4c: add             x2, PP, #0xc, lsl #12  ; [pp+0xcea8] Obj!Duration@5dccb1
    //     0x36fc50: ldr             x2, [x2, #0xea8]
    // 0x36fc54: r4 = const [0, 0x3, 0x1, 0x3, null]
    //     0x36fc54: ldr             x4, [PP, #0x350]  ; [pp+0x350] List(5) [0, 0x3, 0x1, 0x3, Null]
    // 0x36fc58: r0 = Future.delayed()
    //     0x36fc58: bl              #0x282d8c  ; [dart:async] Future::Future.delayed
    // 0x36fc5c: b               #0x36fcb8
    // 0x36fc60: cmp             x3, #3
    // 0x36fc64: b.lt            #0x36fcb8
    // 0x36fc68: r0 = BoxInt64Instr(r3)
    //     0x36fc68: sbfiz           x0, x3, #1, #0x1f
    //     0x36fc6c: cmp             x3, x0, asr #1
    //     0x36fc70: b.eq            #0x36fc7c
    //     0x36fc74: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x36fc78: stur            x3, [x0, #7]
    // 0x36fc7c: cmp             w0, #6
    // 0x36fc80: b.ne            #0x36fcb8
    // 0x36fc84: LoadField: r1 = r2->field_f
    //     0x36fc84: ldur            w1, [x2, #0xf]
    // 0x36fc88: DecompressPointer r1
    //     0x36fc88: add             x1, x1, HEAP, lsl #32
    // 0x36fc8c: LoadField: r0 = r1->field_1b
    //     0x36fc8c: ldur            w0, [x1, #0x1b]
    // 0x36fc90: DecompressPointer r0
    //     0x36fc90: add             x0, x0, HEAP, lsl #32
    // 0x36fc94: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x36fc98: cmp             w0, w16
    // 0x36fc9c: b.ne            #0x36fcac
    // 0x36fca0: r2 = _controller
    //     0x36fca0: add             x2, PP, #0x1a, lsl #12  ; [pp+0x1a7b8] Field <_BouncingIconState@230413921._controller@230413921>: late final (offset: 0x1c)
    //     0x36fca4: ldr             x2, [x2, #0x7b8]
    // 0x36fca8: r0 = InitLateFinalInstanceField()
    //     0x36fca8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x36fcac: mov             x1, x0
    // 0x36fcb0: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x36fcb0: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x36fcb4: r0 = reverse()
    //     0x36fcb4: bl              #0x2f8868  ; [package:flutter/src/animation/animation_controller.dart] AnimationController::reverse
    // 0x36fcb8: r0 = Null
    //     0x36fcb8: mov             x0, NULL
    // 0x36fcbc: LeaveFrame
    //     0x36fcbc: mov             SP, fp
    //     0x36fcc0: ldp             fp, lr, [SP], #0x10
    // 0x36fcc4: ret
    //     0x36fcc4: ret             
    // 0x36fcc8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x36fcc8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x36fccc: b               #0x36fbfc
  }
  _ dispose(/* No info */) {
    // ** addr: 0x443ee0, size: 0x6c
    // 0x443ee0: EnterFrame
    //     0x443ee0: stp             fp, lr, [SP, #-0x10]!
    //     0x443ee4: mov             fp, SP
    // 0x443ee8: AllocStack(0x8)
    //     0x443ee8: sub             SP, SP, #8
    // 0x443eec: SetupParameters(_BouncingIconState this /* r1 => r0, fp-0x8 */)
    //     0x443eec: mov             x0, x1
    //     0x443ef0: stur            x1, [fp, #-8]
    // 0x443ef4: CheckStackOverflow
    //     0x443ef4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x443ef8: cmp             SP, x16
    //     0x443efc: b.ls            #0x443f44
    // 0x443f00: mov             x1, x0
    // 0x443f04: LoadField: r0 = r1->field_1b
    //     0x443f04: ldur            w0, [x1, #0x1b]
    // 0x443f08: DecompressPointer r0
    //     0x443f08: add             x0, x0, HEAP, lsl #32
    // 0x443f0c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x443f10: cmp             w0, w16
    // 0x443f14: b.ne            #0x443f24
    // 0x443f18: r2 = _controller
    //     0x443f18: add             x2, PP, #0x1a, lsl #12  ; [pp+0x1a7b8] Field <_BouncingIconState@230413921._controller@230413921>: late final (offset: 0x1c)
    //     0x443f1c: ldr             x2, [x2, #0x7b8]
    // 0x443f20: r0 = InitLateFinalInstanceField()
    //     0x443f20: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x443f24: mov             x1, x0
    // 0x443f28: r0 = dispose()
    //     0x443f28: bl              #0x2de68c  ; [package:flutter/src/animation/animation_controller.dart] AnimationController::dispose
    // 0x443f2c: ldur            x1, [fp, #-8]
    // 0x443f30: r0 = dispose()
    //     0x443f30: bl              #0x443f4c  ; [dart:mixin_deduplication] _MixinApplication271&State&SingleTickerProviderStateMixin::dispose
    // 0x443f34: r0 = Null
    //     0x443f34: mov             x0, NULL
    // 0x443f38: LeaveFrame
    //     0x443f38: mov             SP, fp
    //     0x443f3c: ldp             fp, lr, [SP], #0x10
    // 0x443f40: ret
    //     0x443f40: ret             
    // 0x443f44: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x443f44: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x443f48: b               #0x443f00
  }
}

// class id: 2868, size: 0x10, field offset: 0xc
//   const constructor, 
class BouncingIcon extends StatefulWidget {

  _ createState(/* No info */) {
    // ** addr: 0x43dd40, size: 0x30
    // 0x43dd40: EnterFrame
    //     0x43dd40: stp             fp, lr, [SP, #-0x10]!
    //     0x43dd44: mov             fp, SP
    // 0x43dd48: mov             x0, x1
    // 0x43dd4c: r1 = <BouncingIcon>
    //     0x43dd4c: add             x1, PP, #0x16, lsl #12  ; [pp+0x16918] TypeArguments: <BouncingIcon>
    //     0x43dd50: ldr             x1, [x1, #0x918]
    // 0x43dd54: r0 = _BouncingIconState()
    //     0x43dd54: bl              #0x43dd70  ; Allocate_BouncingIconStateStub -> _BouncingIconState (size=0x24)
    // 0x43dd58: ldr             x1, [THR, #0x90]  ; THR::object_sentinel
    // 0x43dd5c: StoreField: r0->field_1b = r1
    //     0x43dd5c: stur            w1, [x0, #0x1b]
    // 0x43dd60: StoreField: r0->field_1f = r1
    //     0x43dd60: stur            w1, [x0, #0x1f]
    // 0x43dd64: LeaveFrame
    //     0x43dd64: mov             SP, fp
    //     0x43dd68: ldp             fp, lr, [SP], #0x10
    // 0x43dd6c: ret
    //     0x43dd6c: ret             
  }
}
