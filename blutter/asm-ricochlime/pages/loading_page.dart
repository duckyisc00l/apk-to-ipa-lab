// lib: , url: package:ricochlime/pages/loading_page.dart

// class id: 1049325, size: 0x8
class :: {
}

// class id: 1967, size: 0x28, field offset: 0x24
class Task extends ChangeNotifier {

  _ Task(/* No info */) {
    // ** addr: 0x3c429c, size: 0xac
    // 0x3c429c: EnterFrame
    //     0x3c429c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c42a0: mov             fp, SP
    // 0x3c42a4: AllocStack(0x28)
    //     0x3c42a4: sub             SP, SP, #0x28
    // 0x3c42a8: r0 = false
    //     0x3c42a8: add             x0, NULL, #0x30  ; false
    // 0x3c42ac: stur            x1, [fp, #-8]
    // 0x3c42b0: stur            x2, [fp, #-0x10]
    // 0x3c42b4: CheckStackOverflow
    //     0x3c42b4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c42b8: cmp             SP, x16
    //     0x3c42bc: b.ls            #0x3c4340
    // 0x3c42c0: StoreField: r1->field_23 = r0
    //     0x3c42c0: stur            w0, [x1, #0x23]
    // 0x3c42c4: StoreField: r1->field_7 = rZR
    //     0x3c42c4: stur            xzr, [x1, #7]
    // 0x3c42c8: StoreField: r1->field_13 = rZR
    //     0x3c42c8: stur            xzr, [x1, #0x13]
    // 0x3c42cc: StoreField: r1->field_1b = rZR
    //     0x3c42cc: stur            xzr, [x1, #0x1b]
    // 0x3c42d0: r0 = LoadStaticField(0x448)
    //     0x3c42d0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c42d4: ldr             x0, [x0, #0x890]
    // 0x3c42d8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c42dc: cmp             w0, w16
    // 0x3c42e0: b.ne            #0x3c42ec
    // 0x3c42e4: r2 = _emptyListeners
    //     0x3c42e4: ldr             x2, [PP, #0x36b8]  ; [pp+0x36b8] Field <ChangeNotifier._emptyListeners@27329750>: static late final (offset: 0x448)
    // 0x3c42e8: r0 = InitLateFinalStaticField()
    //     0x3c42e8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c42ec: ldur            x2, [fp, #-8]
    // 0x3c42f0: StoreField: r2->field_f = r0
    //     0x3c42f0: stur            w0, [x2, #0xf]
    //     0x3c42f4: ldurb           w16, [x2, #-1]
    //     0x3c42f8: ldurb           w17, [x0, #-1]
    //     0x3c42fc: and             x16, x17, x16, lsr #2
    //     0x3c4300: tst             x16, HEAP, lsr #32
    //     0x3c4304: b.eq            #0x3c430c
    //     0x3c4308: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3c430c: r1 = Function '_markComplete@776409466':.
    //     0x3c430c: add             x1, PP, #0xf, lsl #12  ; [pp+0xff30] AnonymousClosure: (0x3c4348), in [package:ricochlime/pages/loading_page.dart] Task::_markComplete (0x3c4384)
    //     0x3c4310: ldr             x1, [x1, #0xf30]
    // 0x3c4314: r0 = AllocateClosure()
    //     0x3c4314: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c4318: r16 = <void?>
    //     0x3c4318: ldr             x16, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x3c431c: ldur            lr, [fp, #-0x10]
    // 0x3c4320: stp             lr, x16, [SP, #8]
    // 0x3c4324: str             x0, [SP]
    // 0x3c4328: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x3c4328: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x3c432c: r0 = then()
    //     0x3c432c: bl              #0x52a270  ; [dart:async] _Future::then
    // 0x3c4330: r0 = Null
    //     0x3c4330: mov             x0, NULL
    // 0x3c4334: LeaveFrame
    //     0x3c4334: mov             SP, fp
    //     0x3c4338: ldp             fp, lr, [SP], #0x10
    // 0x3c433c: ret
    //     0x3c433c: ret             
    // 0x3c4340: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c4340: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c4344: b               #0x3c42c0
  }
  [closure] void _markComplete(dynamic, dynamic) {
    // ** addr: 0x3c4348, size: 0x3c
    // 0x3c4348: EnterFrame
    //     0x3c4348: stp             fp, lr, [SP, #-0x10]!
    //     0x3c434c: mov             fp, SP
    // 0x3c4350: ldr             x0, [fp, #0x18]
    // 0x3c4354: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x3c4354: ldur            w1, [x0, #0x17]
    // 0x3c4358: DecompressPointer r1
    //     0x3c4358: add             x1, x1, HEAP, lsl #32
    // 0x3c435c: CheckStackOverflow
    //     0x3c435c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c4360: cmp             SP, x16
    //     0x3c4364: b.ls            #0x3c437c
    // 0x3c4368: ldr             x2, [fp, #0x10]
    // 0x3c436c: r0 = _markComplete()
    //     0x3c436c: bl              #0x3c4384  ; [package:ricochlime/pages/loading_page.dart] Task::_markComplete
    // 0x3c4370: LeaveFrame
    //     0x3c4370: mov             SP, fp
    //     0x3c4374: ldp             fp, lr, [SP], #0x10
    // 0x3c4378: ret
    //     0x3c4378: ret             
    // 0x3c437c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c437c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c4380: b               #0x3c4368
  }
  _ _markComplete(/* No info */) {
    // ** addr: 0x3c4384, size: 0x38
    // 0x3c4384: EnterFrame
    //     0x3c4384: stp             fp, lr, [SP, #-0x10]!
    //     0x3c4388: mov             fp, SP
    // 0x3c438c: r0 = true
    //     0x3c438c: add             x0, NULL, #0x20  ; true
    // 0x3c4390: CheckStackOverflow
    //     0x3c4390: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c4394: cmp             SP, x16
    //     0x3c4398: b.ls            #0x3c43b4
    // 0x3c439c: StoreField: r1->field_23 = r0
    //     0x3c439c: stur            w0, [x1, #0x23]
    // 0x3c43a0: r0 = notifyListeners()
    //     0x3c43a0: bl              #0x26f8b4  ; [package:flutter/src/foundation/change_notifier.dart] ChangeNotifier::notifyListeners
    // 0x3c43a4: r0 = Null
    //     0x3c43a4: mov             x0, NULL
    // 0x3c43a8: LeaveFrame
    //     0x3c43a8: mov             SP, fp
    //     0x3c43ac: ldp             fp, lr, [SP], #0x10
    // 0x3c43b0: ret
    //     0x3c43b0: ret             
    // 0x3c43b4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c43b4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c43b8: b               #0x3c439c
  }
}

// class id: 2553, size: 0x24, field offset: 0x14
class _LoadingPageState extends State<dynamic> {

  _ build(/* No info */) {
    // ** addr: 0x3ba2d0, size: 0xec
    // 0x3ba2d0: EnterFrame
    //     0x3ba2d0: stp             fp, lr, [SP, #-0x10]!
    //     0x3ba2d4: mov             fp, SP
    // 0x3ba2d8: AllocStack(0x18)
    //     0x3ba2d8: sub             SP, SP, #0x18
    // 0x3ba2dc: LoadField: r0 = r1->field_13
    //     0x3ba2dc: ldur            x0, [x1, #0x13]
    // 0x3ba2e0: LoadField: r2 = r1->field_1b
    //     0x3ba2e0: ldur            x2, [x1, #0x1b]
    // 0x3ba2e4: cmp             x0, x2
    // 0x3ba2e8: b.lt            #0x3ba2f4
    // 0x3ba2ec: d0 = 1.000000
    //     0x3ba2ec: fmov            d0, #1.00000000
    // 0x3ba2f0: b               #0x3ba304
    // 0x3ba2f4: scvtf           d0, x0
    // 0x3ba2f8: scvtf           d1, x2
    // 0x3ba2fc: fdiv            d2, d0, d1
    // 0x3ba300: mov             v0.16b, v2.16b
    // 0x3ba304: stur            d0, [fp, #-0x18]
    // 0x3ba308: r0 = NesProgressBar()
    //     0x3ba308: bl              #0x3ba3bc  ; AllocateNesProgressBarStub -> NesProgressBar (size=0x20)
    // 0x3ba30c: ldur            d0, [fp, #-0x18]
    // 0x3ba310: stur            x0, [fp, #-8]
    // 0x3ba314: StoreField: r0->field_b = d0
    //     0x3ba314: stur            d0, [x0, #0xb]
    // 0x3ba318: r1 = Instance_NesProgressBarStyle
    //     0x3ba318: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd40] Obj!NesProgressBarStyle@5d8dd1
    //     0x3ba31c: ldr             x1, [x1, #0xd40]
    // 0x3ba320: StoreField: r0->field_13 = r1
    //     0x3ba320: stur            w1, [x0, #0x13]
    // 0x3ba324: r0 = Padding()
    //     0x3ba324: bl              #0x356624  ; AllocatePaddingStub -> Padding (size=0x14)
    // 0x3ba328: mov             x1, x0
    // 0x3ba32c: r0 = Instance_EdgeInsets
    //     0x3ba32c: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd48] Obj!EdgeInsets@5cbce1
    //     0x3ba330: ldr             x0, [x0, #0xd48]
    // 0x3ba334: stur            x1, [fp, #-0x10]
    // 0x3ba338: StoreField: r1->field_f = r0
    //     0x3ba338: stur            w0, [x1, #0xf]
    // 0x3ba33c: ldur            x0, [fp, #-8]
    // 0x3ba340: StoreField: r1->field_b = r0
    //     0x3ba340: stur            w0, [x1, #0xb]
    // 0x3ba344: r0 = SizedBox()
    //     0x3ba344: bl              #0x363c60  ; AllocateSizedBoxStub -> SizedBox (size=0x18)
    // 0x3ba348: mov             x1, x0
    // 0x3ba34c: r0 = 400.000000
    //     0x3ba34c: add             x0, PP, #0xb, lsl #12  ; [pp+0xb9e0] 400
    //     0x3ba350: ldr             x0, [x0, #0x9e0]
    // 0x3ba354: stur            x1, [fp, #-8]
    // 0x3ba358: StoreField: r1->field_f = r0
    //     0x3ba358: stur            w0, [x1, #0xf]
    // 0x3ba35c: ldur            x0, [fp, #-0x10]
    // 0x3ba360: StoreField: r1->field_b = r0
    //     0x3ba360: stur            w0, [x1, #0xb]
    // 0x3ba364: r0 = Center()
    //     0x3ba364: bl              #0x3803b8  ; AllocateCenterStub -> Center (size=0x1c)
    // 0x3ba368: mov             x1, x0
    // 0x3ba36c: r0 = Instance_Alignment
    //     0x3ba36c: add             x0, PP, #0xc, lsl #12  ; [pp+0xcb18] Obj!Alignment@5cc271
    //     0x3ba370: ldr             x0, [x0, #0xb18]
    // 0x3ba374: stur            x1, [fp, #-0x10]
    // 0x3ba378: StoreField: r1->field_f = r0
    //     0x3ba378: stur            w0, [x1, #0xf]
    // 0x3ba37c: ldur            x0, [fp, #-8]
    // 0x3ba380: StoreField: r1->field_b = r0
    //     0x3ba380: stur            w0, [x1, #0xb]
    // 0x3ba384: r0 = Scaffold()
    //     0x3ba384: bl              #0x370d84  ; AllocateScaffoldStub -> Scaffold (size=0x50)
    // 0x3ba388: ldur            x1, [fp, #-0x10]
    // 0x3ba38c: ArrayStore: r0[0] = r1  ; List_4
    //     0x3ba38c: stur            w1, [x0, #0x17]
    // 0x3ba390: r1 = true
    //     0x3ba390: add             x1, NULL, #0x20  ; true
    // 0x3ba394: StoreField: r0->field_47 = r1
    //     0x3ba394: stur            w1, [x0, #0x47]
    // 0x3ba398: r1 = false
    //     0x3ba398: add             x1, NULL, #0x30  ; false
    // 0x3ba39c: StoreField: r0->field_b = r1
    //     0x3ba39c: stur            w1, [x0, #0xb]
    // 0x3ba3a0: StoreField: r0->field_f = r1
    //     0x3ba3a0: stur            w1, [x0, #0xf]
    // 0x3ba3a4: r1 = Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static.
    //     0x3ba3a4: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd50] Closure: (BuildContext, Animation<double>) => Widget from Function '_defaultBottomSheetScrimBuilder@77420462': static. (0x7c033375e380)
    //     0x3ba3a8: ldr             x1, [x1, #0xd50]
    // 0x3ba3ac: StoreField: r0->field_33 = r1
    //     0x3ba3ac: stur            w1, [x0, #0x33]
    // 0x3ba3b0: LeaveFrame
    //     0x3ba3b0: mov             SP, fp
    //     0x3ba3b4: ldp             fp, lr, [SP], #0x10
    // 0x3ba3b8: ret
    //     0x3ba3b8: ret             
  }
  _ initState(/* No info */) {
    // ** addr: 0x3c379c, size: 0xd0
    // 0x3c379c: EnterFrame
    //     0x3c379c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c37a0: mov             fp, SP
    // 0x3c37a4: AllocStack(0x20)
    //     0x3c37a4: sub             SP, SP, #0x20
    // 0x3c37a8: SetupParameters(_LoadingPageState this /* r1 => r2, fp-0x8 */)
    //     0x3c37a8: mov             x2, x1
    //     0x3c37ac: stur            x1, [fp, #-8]
    // 0x3c37b0: CheckStackOverflow
    //     0x3c37b0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c37b4: cmp             SP, x16
    //     0x3c37b8: b.ls            #0x3c385c
    // 0x3c37bc: r0 = LoadStaticField(0xd00)
    //     0x3c37bc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c37c0: ldr             x0, [x0, #0x1a00]
    // 0x3c37c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c37c8: cmp             w0, w16
    // 0x3c37cc: b.ne            #0x3c37dc
    // 0x3c37d0: r2 = tasks
    //     0x3c37d0: add             x2, PP, #0xf, lsl #12  ; [pp+0xfd60] Field <LoadingPage.tasks>: static late final (offset: 0xd00)
    //     0x3c37d4: ldr             x2, [x2, #0xd60]
    // 0x3c37d8: r0 = InitLateFinalStaticField()
    //     0x3c37d8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c37dc: stur            x0, [fp, #-0x18]
    // 0x3c37e0: LoadField: r1 = r0->field_b
    //     0x3c37e0: ldur            w1, [x0, #0xb]
    // 0x3c37e4: r3 = LoadInt32Instr(r1)
    //     0x3c37e4: sbfx            x3, x1, #1, #0x1f
    // 0x3c37e8: ldur            x2, [fp, #-8]
    // 0x3c37ec: stur            x3, [fp, #-0x10]
    // 0x3c37f0: r1 = Function '_checkOnTasks@776409466':.
    //     0x3c37f0: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd68] AnonymousClosure: (0x3c386c), in [package:ricochlime/pages/loading_page.dart] _LoadingPageState::_checkOnTasks (0x3c38a4)
    //     0x3c37f4: ldr             x1, [x1, #0xd68]
    // 0x3c37f8: r0 = AllocateClosure()
    //     0x3c37f8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c37fc: stur            x0, [fp, #-8]
    // 0x3c3800: r1 = 0
    //     0x3c3800: mov             x1, #0
    // 0x3c3804: ldur            x3, [fp, #-0x18]
    // 0x3c3808: ldur            x4, [fp, #-0x10]
    // 0x3c380c: CheckStackOverflow
    //     0x3c380c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3810: cmp             SP, x16
    //     0x3c3814: b.ls            #0x3c3864
    // 0x3c3818: cmp             x1, x4
    // 0x3c381c: b.ge            #0x3c384c
    // 0x3c3820: ArrayLoad: r2 = r3[r1]  ; Unknown_4
    //     0x3c3820: add             x16, x3, x1, lsl #2
    //     0x3c3824: ldur            w2, [x16, #0xf]
    // 0x3c3828: DecompressPointer r2
    //     0x3c3828: add             x2, x2, HEAP, lsl #32
    // 0x3c382c: add             x5, x1, #1
    // 0x3c3830: mov             x1, x2
    // 0x3c3834: mov             x2, x0
    // 0x3c3838: stur            x5, [fp, #-0x20]
    // 0x3c383c: r0 = addListener()
    //     0x3c383c: bl              #0x4d539c  ; [package:flutter/src/foundation/change_notifier.dart] ChangeNotifier::addListener
    // 0x3c3840: ldur            x1, [fp, #-0x20]
    // 0x3c3844: ldur            x0, [fp, #-8]
    // 0x3c3848: b               #0x3c3804
    // 0x3c384c: r0 = Null
    //     0x3c384c: mov             x0, NULL
    // 0x3c3850: LeaveFrame
    //     0x3c3850: mov             SP, fp
    //     0x3c3854: ldp             fp, lr, [SP], #0x10
    // 0x3c3858: ret
    //     0x3c3858: ret             
    // 0x3c385c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c385c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3860: b               #0x3c37bc
    // 0x3c3864: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3864: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3868: b               #0x3c3818
  }
  [closure] void _checkOnTasks(dynamic) {
    // ** addr: 0x3c386c, size: 0x38
    // 0x3c386c: EnterFrame
    //     0x3c386c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c3870: mov             fp, SP
    // 0x3c3874: ldr             x0, [fp, #0x10]
    // 0x3c3878: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x3c3878: ldur            w1, [x0, #0x17]
    // 0x3c387c: DecompressPointer r1
    //     0x3c387c: add             x1, x1, HEAP, lsl #32
    // 0x3c3880: CheckStackOverflow
    //     0x3c3880: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3884: cmp             SP, x16
    //     0x3c3888: b.ls            #0x3c389c
    // 0x3c388c: r0 = _checkOnTasks()
    //     0x3c388c: bl              #0x3c38a4  ; [package:ricochlime/pages/loading_page.dart] _LoadingPageState::_checkOnTasks
    // 0x3c3890: LeaveFrame
    //     0x3c3890: mov             SP, fp
    //     0x3c3894: ldp             fp, lr, [SP], #0x10
    // 0x3c3898: ret
    //     0x3c3898: ret             
    // 0x3c389c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c389c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c38a0: b               #0x3c388c
  }
  _ _checkOnTasks(/* No info */) {
    // ** addr: 0x3c38a4, size: 0x134
    // 0x3c38a4: EnterFrame
    //     0x3c38a4: stp             fp, lr, [SP, #-0x10]!
    //     0x3c38a8: mov             fp, SP
    // 0x3c38ac: AllocStack(0x40)
    //     0x3c38ac: sub             SP, SP, #0x40
    // 0x3c38b0: SetupParameters(_LoadingPageState this /* r1 => r0, fp-0x8 */)
    //     0x3c38b0: mov             x0, x1
    //     0x3c38b4: stur            x1, [fp, #-8]
    // 0x3c38b8: CheckStackOverflow
    //     0x3c38b8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c38bc: cmp             SP, x16
    //     0x3c38c0: b.ls            #0x3c39cc
    // 0x3c38c4: LoadField: r1 = r0->field_f
    //     0x3c38c4: ldur            w1, [x0, #0xf]
    // 0x3c38c8: DecompressPointer r1
    //     0x3c38c8: add             x1, x1, HEAP, lsl #32
    // 0x3c38cc: cmp             w1, NULL
    // 0x3c38d0: b.ne            #0x3c38e4
    // 0x3c38d4: r0 = Null
    //     0x3c38d4: mov             x0, NULL
    // 0x3c38d8: LeaveFrame
    //     0x3c38d8: mov             SP, fp
    //     0x3c38dc: ldp             fp, lr, [SP], #0x10
    // 0x3c38e0: ret
    //     0x3c38e0: ret             
    // 0x3c38e4: mov             x1, x0
    // 0x3c38e8: r0 = _tallyTasks()
    //     0x3c38e8: bl              #0x3c3b98  ; [package:ricochlime/pages/loading_page.dart] _LoadingPageState::_tallyTasks
    // 0x3c38ec: ldur            x0, [fp, #-8]
    // 0x3c38f0: LoadField: r1 = r0->field_13
    //     0x3c38f0: ldur            x1, [x0, #0x13]
    // 0x3c38f4: LoadField: r2 = r0->field_1b
    //     0x3c38f4: ldur            x2, [x0, #0x1b]
    // 0x3c38f8: cmp             x1, x2
    // 0x3c38fc: b.lt            #0x3c39a0
    // 0x3c3900: LoadField: r1 = r0->field_f
    //     0x3c3900: ldur            w1, [x0, #0xf]
    // 0x3c3904: DecompressPointer r1
    //     0x3c3904: add             x1, x1, HEAP, lsl #32
    // 0x3c3908: cmp             w1, NULL
    // 0x3c390c: b.eq            #0x3c39d4
    // 0x3c3910: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x3c3910: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x3c3914: r0 = of()
    //     0x3c3914: bl              #0x378724  ; [package:flutter/src/widgets/navigator.dart] Navigator::of
    // 0x3c3918: r1 = Function '<anonymous closure>':.
    //     0x3c3918: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd70] AnonymousClosure: (0x3c3cb4), in [package:ricochlime/pages/loading_page.dart] _LoadingPageState::_checkOnTasks (0x3c38a4)
    //     0x3c391c: ldr             x1, [x1, #0xd70]
    // 0x3c3920: r2 = Null
    //     0x3c3920: mov             x2, NULL
    // 0x3c3924: stur            x0, [fp, #-0x10]
    // 0x3c3928: r0 = AllocateClosure()
    //     0x3c3928: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c392c: r1 = Function '<anonymous closure>':.
    //     0x3c392c: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd78] AnonymousClosure: (0x3c3c84), in [package:ricochlime/pages/loading_page.dart] _LoadingPageState::_checkOnTasks (0x3c38a4)
    //     0x3c3930: ldr             x1, [x1, #0xd78]
    // 0x3c3934: r2 = Null
    //     0x3c3934: mov             x2, NULL
    // 0x3c3938: stur            x0, [fp, #-0x18]
    // 0x3c393c: r0 = AllocateClosure()
    //     0x3c393c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c3940: r1 = Null
    //     0x3c3940: mov             x1, NULL
    // 0x3c3944: stur            x0, [fp, #-0x20]
    // 0x3c3948: r0 = PageRouteBuilder()
    //     0x3c3948: bl              #0x33c978  ; AllocatePageRouteBuilderStub -> PageRouteBuilder<X0> (size=0xc8)
    // 0x3c394c: stur            x0, [fp, #-0x28]
    // 0x3c3950: ldur            x16, [fp, #-0x20]
    // 0x3c3954: str             x16, [SP]
    // 0x3c3958: mov             x1, x0
    // 0x3c395c: ldur            x2, [fp, #-0x18]
    // 0x3c3960: r3 = Instance_Duration
    //     0x3c3960: add             x3, PP, #9, lsl #12  ; [pp+0x9188] Obj!Duration@5dcd01
    //     0x3c3964: ldr             x3, [x3, #0x188]
    // 0x3c3968: r4 = const [0, 0x4, 0x1, 0x3, transitionsBuilder, 0x3, null]
    //     0x3c3968: add             x4, PP, #0xf, lsl #12  ; [pp+0xfd80] List(7) [0, 0x4, 0x1, 0x3, "transitionsBuilder", 0x3, Null]
    //     0x3c396c: ldr             x4, [x4, #0xd80]
    // 0x3c3970: r0 = PageRouteBuilder()
    //     0x3c3970: bl              #0x33c0f0  ; [package:flutter/src/widgets/pages.dart] PageRouteBuilder::PageRouteBuilder
    // 0x3c3974: r16 = <dynamic, Object?>
    //     0x3c3974: ldr             x16, [PP, #0x1f10]  ; [pp+0x1f10] TypeArguments: <dynamic, Object?>
    // 0x3c3978: ldur            lr, [fp, #-0x10]
    // 0x3c397c: stp             lr, x16, [SP, #8]
    // 0x3c3980: ldur            x16, [fp, #-0x28]
    // 0x3c3984: str             x16, [SP]
    // 0x3c3988: r4 = const [0x2, 0x2, 0x2, 0x2, null]
    //     0x3c3988: ldr             x4, [PP, #0x54a8]  ; [pp+0x54a8] List(5) [0x2, 0x2, 0x2, 0x2, Null]
    // 0x3c398c: r0 = pushReplacement()
    //     0x3c398c: bl              #0x3c39d8  ; [package:flutter/src/widgets/navigator.dart] NavigatorState::pushReplacement
    // 0x3c3990: r0 = Null
    //     0x3c3990: mov             x0, NULL
    // 0x3c3994: LeaveFrame
    //     0x3c3994: mov             SP, fp
    //     0x3c3998: ldp             fp, lr, [SP], #0x10
    // 0x3c399c: ret
    //     0x3c399c: ret             
    // 0x3c39a0: r1 = Function '<anonymous closure>':.
    //     0x3c39a0: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd88] Function: [dart:ui] Shader::Shader._ (0x56ea68)
    //     0x3c39a4: ldr             x1, [x1, #0xd88]
    // 0x3c39a8: r2 = Null
    //     0x3c39a8: mov             x2, NULL
    // 0x3c39ac: r0 = AllocateClosure()
    //     0x3c39ac: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c39b0: ldur            x1, [fp, #-8]
    // 0x3c39b4: mov             x2, x0
    // 0x3c39b8: r0 = setState()
    //     0x3c39b8: bl              #0x2398d8  ; [package:flutter/src/widgets/framework.dart] State::setState
    // 0x3c39bc: r0 = Null
    //     0x3c39bc: mov             x0, NULL
    // 0x3c39c0: LeaveFrame
    //     0x3c39c0: mov             SP, fp
    //     0x3c39c4: ldp             fp, lr, [SP], #0x10
    // 0x3c39c8: ret
    //     0x3c39c8: ret             
    // 0x3c39cc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c39cc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c39d0: b               #0x3c38c4
    // 0x3c39d4: r0 = NullCastErrorSharedWithoutFPURegs()
    //     0x3c39d4: bl              #0x584d74  ; NullCastErrorSharedWithoutFPURegsStub
  }
  _ _tallyTasks(/* No info */) {
    // ** addr: 0x3c3b98, size: 0xec
    // 0x3c3b98: EnterFrame
    //     0x3c3b98: stp             fp, lr, [SP, #-0x10]!
    //     0x3c3b9c: mov             fp, SP
    // 0x3c3ba0: AllocStack(0x18)
    //     0x3c3ba0: sub             SP, SP, #0x18
    // 0x3c3ba4: SetupParameters(_LoadingPageState this /* r1 => r1, fp-0x18 */)
    //     0x3c3ba4: stur            x1, [fp, #-0x18]
    // 0x3c3ba8: CheckStackOverflow
    //     0x3c3ba8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3bac: cmp             SP, x16
    //     0x3c3bb0: b.ls            #0x3c3c70
    // 0x3c3bb4: r2 = 0
    //     0x3c3bb4: mov             x2, #0
    // 0x3c3bb8: r0 = 0
    //     0x3c3bb8: mov             x0, #0
    // 0x3c3bbc: stur            x2, [fp, #-8]
    // 0x3c3bc0: stur            x0, [fp, #-0x10]
    // 0x3c3bc4: CheckStackOverflow
    //     0x3c3bc4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3bc8: cmp             SP, x16
    //     0x3c3bcc: b.ls            #0x3c3c78
    // 0x3c3bd0: r0 = LoadStaticField(0xd00)
    //     0x3c3bd0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c3bd4: ldr             x0, [x0, #0x1a00]
    // 0x3c3bd8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c3bdc: cmp             w0, w16
    // 0x3c3be0: b.ne            #0x3c3bf0
    // 0x3c3be4: r2 = tasks
    //     0x3c3be4: add             x2, PP, #0xf, lsl #12  ; [pp+0xfd60] Field <LoadingPage.tasks>: static late final (offset: 0xd00)
    //     0x3c3be8: ldr             x2, [x2, #0xd60]
    // 0x3c3bec: r0 = InitLateFinalStaticField()
    //     0x3c3bec: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c3bf0: mov             x2, x0
    // 0x3c3bf4: LoadField: r3 = r2->field_b
    //     0x3c3bf4: ldur            w3, [x2, #0xb]
    // 0x3c3bf8: r0 = LoadInt32Instr(r3)
    //     0x3c3bf8: sbfx            x0, x3, #1, #0x1f
    // 0x3c3bfc: sub             x3, x0, #1
    // 0x3c3c00: ldur            x4, [fp, #-0x10]
    // 0x3c3c04: cmp             x4, x3
    // 0x3c3c08: b.ge            #0x3c3c50
    // 0x3c3c0c: mov             x1, x4
    // 0x3c3c10: cmp             x1, x0
    // 0x3c3c14: b.hs            #0x3c3c80
    // 0x3c3c18: ArrayLoad: r1 = r2[r4]  ; Unknown_4
    //     0x3c3c18: add             x16, x2, x4, lsl #2
    //     0x3c3c1c: ldur            w1, [x16, #0xf]
    // 0x3c3c20: DecompressPointer r1
    //     0x3c3c20: add             x1, x1, HEAP, lsl #32
    // 0x3c3c24: LoadField: r2 = r1->field_23
    //     0x3c3c24: ldur            w2, [x1, #0x23]
    // 0x3c3c28: DecompressPointer r2
    //     0x3c3c28: add             x2, x2, HEAP, lsl #32
    // 0x3c3c2c: tbnz            w2, #4, #0x3c3c3c
    // 0x3c3c30: ldur            x1, [fp, #-8]
    // 0x3c3c34: add             x2, x1, #1
    // 0x3c3c38: b               #0x3c3c44
    // 0x3c3c3c: ldur            x1, [fp, #-8]
    // 0x3c3c40: mov             x2, x1
    // 0x3c3c44: add             x0, x4, #1
    // 0x3c3c48: ldur            x1, [fp, #-0x18]
    // 0x3c3c4c: b               #0x3c3bbc
    // 0x3c3c50: ldur            x2, [fp, #-0x18]
    // 0x3c3c54: ldur            x1, [fp, #-8]
    // 0x3c3c58: StoreField: r2->field_13 = r1
    //     0x3c3c58: stur            x1, [x2, #0x13]
    // 0x3c3c5c: StoreField: r2->field_1b = r3
    //     0x3c3c5c: stur            x3, [x2, #0x1b]
    // 0x3c3c60: r0 = Null
    //     0x3c3c60: mov             x0, NULL
    // 0x3c3c64: LeaveFrame
    //     0x3c3c64: mov             SP, fp
    //     0x3c3c68: ldp             fp, lr, [SP], #0x10
    // 0x3c3c6c: ret
    //     0x3c3c6c: ret             
    // 0x3c3c70: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3c70: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3c74: b               #0x3c3bb4
    // 0x3c3c78: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3c78: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3c7c: b               #0x3c3bd0
    // 0x3c3c80: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3c3c80: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] FadeTransition <anonymous closure>(dynamic, BuildContext, Animation<double>, Animation<double>, Widget) {
    // ** addr: 0x3c3c84, size: 0x30
    // 0x3c3c84: EnterFrame
    //     0x3c3c84: stp             fp, lr, [SP, #-0x10]!
    //     0x3c3c88: mov             fp, SP
    // 0x3c3c8c: r0 = FadeTransition()
    //     0x3c3c8c: bl              #0x35bc70  ; AllocateFadeTransitionStub -> FadeTransition (size=0x18)
    // 0x3c3c90: ldr             x1, [fp, #0x20]
    // 0x3c3c94: StoreField: r0->field_f = r1
    //     0x3c3c94: stur            w1, [x0, #0xf]
    // 0x3c3c98: r1 = false
    //     0x3c3c98: add             x1, NULL, #0x30  ; false
    // 0x3c3c9c: StoreField: r0->field_13 = r1
    //     0x3c3c9c: stur            w1, [x0, #0x13]
    // 0x3c3ca0: ldr             x1, [fp, #0x10]
    // 0x3c3ca4: StoreField: r0->field_b = r1
    //     0x3c3ca4: stur            w1, [x0, #0xb]
    // 0x3c3ca8: LeaveFrame
    //     0x3c3ca8: mov             SP, fp
    //     0x3c3cac: ldp             fp, lr, [SP], #0x10
    // 0x3c3cb0: ret
    //     0x3c3cb0: ret             
  }
  [closure] HomePage <anonymous closure>(dynamic, BuildContext, Animation<double>, Animation<double>) {
    // ** addr: 0x3c3cb4, size: 0xc
    // 0x3c3cb4: r0 = Instance_HomePage
    //     0x3c3cb4: add             x0, PP, #0xf, lsl #12  ; [pp+0xfd90] Obj!HomePage@5d8011
    //     0x3c3cb8: ldr             x0, [x0, #0xd90]
    // 0x3c3cbc: ret
    //     0x3c3cbc: ret             
  }
  _ didChangeDependencies(/* No info */) {
    // ** addr: 0x3ed878, size: 0x30
    // 0x3ed878: EnterFrame
    //     0x3ed878: stp             fp, lr, [SP, #-0x10]!
    //     0x3ed87c: mov             fp, SP
    // 0x3ed880: CheckStackOverflow
    //     0x3ed880: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3ed884: cmp             SP, x16
    //     0x3ed888: b.ls            #0x3ed8a0
    // 0x3ed88c: r0 = _checkOnTasks()
    //     0x3ed88c: bl              #0x3c38a4  ; [package:ricochlime/pages/loading_page.dart] _LoadingPageState::_checkOnTasks
    // 0x3ed890: r0 = Null
    //     0x3ed890: mov             x0, NULL
    // 0x3ed894: LeaveFrame
    //     0x3ed894: mov             SP, fp
    //     0x3ed898: ldp             fp, lr, [SP], #0x10
    // 0x3ed89c: ret
    //     0x3ed89c: ret             
    // 0x3ed8a0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3ed8a0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3ed8a4: b               #0x3ed88c
  }
  _ dispose(/* No info */) {
    // ** addr: 0x445488, size: 0xd0
    // 0x445488: EnterFrame
    //     0x445488: stp             fp, lr, [SP, #-0x10]!
    //     0x44548c: mov             fp, SP
    // 0x445490: AllocStack(0x20)
    //     0x445490: sub             SP, SP, #0x20
    // 0x445494: SetupParameters(_LoadingPageState this /* r1 => r2, fp-0x8 */)
    //     0x445494: mov             x2, x1
    //     0x445498: stur            x1, [fp, #-8]
    // 0x44549c: CheckStackOverflow
    //     0x44549c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4454a0: cmp             SP, x16
    //     0x4454a4: b.ls            #0x445548
    // 0x4454a8: r0 = LoadStaticField(0xd00)
    //     0x4454a8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x4454ac: ldr             x0, [x0, #0x1a00]
    // 0x4454b0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x4454b4: cmp             w0, w16
    // 0x4454b8: b.ne            #0x4454c8
    // 0x4454bc: r2 = tasks
    //     0x4454bc: add             x2, PP, #0xf, lsl #12  ; [pp+0xfd60] Field <LoadingPage.tasks>: static late final (offset: 0xd00)
    //     0x4454c0: ldr             x2, [x2, #0xd60]
    // 0x4454c4: r0 = InitLateFinalStaticField()
    //     0x4454c4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x4454c8: stur            x0, [fp, #-0x18]
    // 0x4454cc: LoadField: r1 = r0->field_b
    //     0x4454cc: ldur            w1, [x0, #0xb]
    // 0x4454d0: r3 = LoadInt32Instr(r1)
    //     0x4454d0: sbfx            x3, x1, #1, #0x1f
    // 0x4454d4: ldur            x2, [fp, #-8]
    // 0x4454d8: stur            x3, [fp, #-0x10]
    // 0x4454dc: r1 = Function '_checkOnTasks@776409466':.
    //     0x4454dc: add             x1, PP, #0xf, lsl #12  ; [pp+0xfd68] AnonymousClosure: (0x3c386c), in [package:ricochlime/pages/loading_page.dart] _LoadingPageState::_checkOnTasks (0x3c38a4)
    //     0x4454e0: ldr             x1, [x1, #0xd68]
    // 0x4454e4: r0 = AllocateClosure()
    //     0x4454e4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x4454e8: stur            x0, [fp, #-8]
    // 0x4454ec: r1 = 0
    //     0x4454ec: mov             x1, #0
    // 0x4454f0: ldur            x3, [fp, #-0x18]
    // 0x4454f4: ldur            x4, [fp, #-0x10]
    // 0x4454f8: CheckStackOverflow
    //     0x4454f8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4454fc: cmp             SP, x16
    //     0x445500: b.ls            #0x445550
    // 0x445504: cmp             x1, x4
    // 0x445508: b.ge            #0x445538
    // 0x44550c: ArrayLoad: r2 = r3[r1]  ; Unknown_4
    //     0x44550c: add             x16, x3, x1, lsl #2
    //     0x445510: ldur            w2, [x16, #0xf]
    // 0x445514: DecompressPointer r2
    //     0x445514: add             x2, x2, HEAP, lsl #32
    // 0x445518: add             x5, x1, #1
    // 0x44551c: mov             x1, x2
    // 0x445520: mov             x2, x0
    // 0x445524: stur            x5, [fp, #-0x20]
    // 0x445528: r0 = removeListener()
    //     0x445528: bl              #0x530aec  ; [package:flutter/src/foundation/change_notifier.dart] ChangeNotifier::removeListener
    // 0x44552c: ldur            x1, [fp, #-0x20]
    // 0x445530: ldur            x0, [fp, #-8]
    // 0x445534: b               #0x4454f0
    // 0x445538: r0 = Null
    //     0x445538: mov             x0, NULL
    // 0x44553c: LeaveFrame
    //     0x44553c: mov             SP, fp
    //     0x445540: ldp             fp, lr, [SP], #0x10
    // 0x445544: ret
    //     0x445544: ret             
    // 0x445548: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x445548: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x44554c: b               #0x4454a8
    // 0x445550: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x445550: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x445554: b               #0x445504
  }
}

// class id: 2866, size: 0xc, field offset: 0xc
//   const constructor, 
class LoadingPage extends StatefulWidget {

  static late final List<Task> tasks; // offset: 0xd00

  static List<Task> tasks() {
    // ** addr: 0x3c3cc0, size: 0x164
    // 0x3c3cc0: EnterFrame
    //     0x3c3cc0: stp             fp, lr, [SP, #-0x10]!
    //     0x3c3cc4: mov             fp, SP
    // 0x3c3cc8: AllocStack(0x48)
    //     0x3c3cc8: sub             SP, SP, #0x48
    // 0x3c3ccc: CheckStackOverflow
    //     0x3c3ccc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3cd0: cmp             SP, x16
    //     0x3c3cd4: b.ls            #0x3c3e1c
    // 0x3c3cd8: r0 = useDeviceLocale()
    //     0x3c3cd8: bl              #0x3c48ec  ; [package:ricochlime/i18n/strings.g.dart] LocaleSettings::useDeviceLocale
    // 0x3c3cdc: stur            x0, [fp, #-8]
    // 0x3c3ce0: r0 = LoadStaticField(0xccc)
    //     0x3c3ce0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c3ce4: ldr             x0, [x0, #0x1998]
    // 0x3c3ce8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c3cec: cmp             w0, w16
    // 0x3c3cf0: b.ne            #0x3c3d00
    // 0x3c3cf4: r2 = stows
    //     0x3c3cf4: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3c3cf8: ldr             x2, [x2, #0x310]
    // 0x3c3cfc: r0 = InitLateFinalStaticField()
    //     0x3c3cfc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c3d00: stur            x0, [fp, #-0x10]
    // 0x3c3d04: LoadField: r1 = r0->field_b
    //     0x3c3d04: ldur            w1, [x0, #0xb]
    // 0x3c3d08: DecompressPointer r1
    //     0x3c3d08: add             x1, x1, HEAP, lsl #32
    // 0x3c3d0c: r0 = waitUntilRead()
    //     0x3c3d0c: bl              #0x3c488c  ; [package:stow/src/abstract_stow.dart] Stow::waitUntilRead
    // 0x3c3d10: mov             x2, x0
    // 0x3c3d14: ldur            x0, [fp, #-0x10]
    // 0x3c3d18: stur            x2, [fp, #-0x18]
    // 0x3c3d1c: LoadField: r1 = r0->field_13
    //     0x3c3d1c: ldur            w1, [x0, #0x13]
    // 0x3c3d20: DecompressPointer r1
    //     0x3c3d20: add             x1, x1, HEAP, lsl #32
    // 0x3c3d24: r0 = waitUntilRead()
    //     0x3c3d24: bl              #0x3c488c  ; [package:stow/src/abstract_stow.dart] Stow::waitUntilRead
    // 0x3c3d28: stur            x0, [fp, #-0x10]
    // 0x3c3d2c: str             NULL, [SP]
    // 0x3c3d30: r4 = const [0, 0x1, 0x1, 0x1, null]
    //     0x3c3d30: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    // 0x3c3d34: r0 = silkscreenTextTheme()
    //     0x3c3d34: bl              #0x3b8fe4  ; [package:google_fonts/src/google_fonts_parts/part_s.g.dart] PartS::silkscreenTextTheme
    // 0x3c3d38: r0 = pendingFonts()
    //     0x3c3d38: bl              #0x3c4830  ; [package:google_fonts/src/google_fonts_all_parts.g.dart] GoogleFonts::pendingFonts
    // 0x3c3d3c: stur            x0, [fp, #-0x20]
    // 0x3c3d40: r0 = LoadStaticField(0x860)
    //     0x3c3d40: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c3d44: ldr             x0, [x0, #0x10c0]
    // 0x3c3d48: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c3d4c: cmp             w0, w16
    // 0x3c3d50: b.ne            #0x3c3d60
    // 0x3c3d54: r2 = instance
    //     0x3c3d54: add             x2, PP, #8, lsl #12  ; [pp+0x86f0] Field <RicochlimeGame.instance>: static late final (offset: 0x860)
    //     0x3c3d58: ldr             x2, [x2, #0x6f0]
    // 0x3c3d5c: r0 = InitLateFinalStaticField()
    //     0x3c3d5c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c3d60: mov             x1, x0
    // 0x3c3d64: LoadField: r0 = r1->field_c3
    //     0x3c3d64: ldur            w0, [x1, #0xc3]
    // 0x3c3d68: DecompressPointer r0
    //     0x3c3d68: add             x0, x0, HEAP, lsl #32
    // 0x3c3d6c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c3d70: cmp             w0, w16
    // 0x3c3d74: b.ne            #0x3c3d84
    // 0x3c3d78: r2 = preloadSprites
    //     0x3c3d78: add             x2, PP, #0xf, lsl #12  ; [pp+0xfdd0] Field <RicochlimeGame.preloadSprites>: late final (offset: 0xc4)
    //     0x3c3d7c: ldr             x2, [x2, #0xdd0]
    // 0x3c3d80: r0 = InitLateFinalInstanceField()
    //     0x3c3d80: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3c3d84: LoadField: r1 = r0->field_b
    //     0x3c3d84: ldur            w1, [x0, #0xb]
    // 0x3c3d88: DecompressPointer r1
    //     0x3c3d88: add             x1, x1, HEAP, lsl #32
    // 0x3c3d8c: stur            x1, [fp, #-0x28]
    // 0x3c3d90: r0 = init()
    //     0x3c3d90: bl              #0x3c45b4  ; [package:ricochlime/ads/iap.dart] RicochlimeIAP::init
    // 0x3c3d94: stur            x0, [fp, #-0x30]
    // 0x3c3d98: r0 = load()
    //     0x3c3d98: bl              #0x3c43c8  ; [package:ricochlime/utils/ricochlime_audio.dart] RicochlimeAudio::load
    // 0x3c3d9c: r1 = Null
    //     0x3c3d9c: mov             x1, NULL
    // 0x3c3da0: r2 = 14
    //     0x3c3da0: mov             x2, #0xe
    // 0x3c3da4: stur            x0, [fp, #-0x38]
    // 0x3c3da8: r0 = AllocateArray()
    //     0x3c3da8: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3c3dac: mov             x2, x0
    // 0x3c3db0: ldur            x0, [fp, #-8]
    // 0x3c3db4: stur            x2, [fp, #-0x40]
    // 0x3c3db8: StoreField: r2->field_f = r0
    //     0x3c3db8: stur            w0, [x2, #0xf]
    // 0x3c3dbc: ldur            x0, [fp, #-0x18]
    // 0x3c3dc0: StoreField: r2->field_13 = r0
    //     0x3c3dc0: stur            w0, [x2, #0x13]
    // 0x3c3dc4: ldur            x0, [fp, #-0x10]
    // 0x3c3dc8: ArrayStore: r2[0] = r0  ; List_4
    //     0x3c3dc8: stur            w0, [x2, #0x17]
    // 0x3c3dcc: ldur            x0, [fp, #-0x20]
    // 0x3c3dd0: StoreField: r2->field_1b = r0
    //     0x3c3dd0: stur            w0, [x2, #0x1b]
    // 0x3c3dd4: ldur            x0, [fp, #-0x28]
    // 0x3c3dd8: StoreField: r2->field_1f = r0
    //     0x3c3dd8: stur            w0, [x2, #0x1f]
    // 0x3c3ddc: ldur            x0, [fp, #-0x30]
    // 0x3c3de0: StoreField: r2->field_23 = r0
    //     0x3c3de0: stur            w0, [x2, #0x23]
    // 0x3c3de4: ldur            x0, [fp, #-0x38]
    // 0x3c3de8: StoreField: r2->field_27 = r0
    //     0x3c3de8: stur            w0, [x2, #0x27]
    // 0x3c3dec: r1 = <Future>
    //     0x3c3dec: add             x1, PP, #9, lsl #12  ; [pp+0x9a80] TypeArguments: <Future>
    //     0x3c3df0: ldr             x1, [x1, #0xa80]
    // 0x3c3df4: r0 = AllocateGrowableArray()
    //     0x3c3df4: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3c3df8: mov             x1, x0
    // 0x3c3dfc: ldur            x0, [fp, #-0x40]
    // 0x3c3e00: StoreField: r1->field_f = r0
    //     0x3c3e00: stur            w0, [x1, #0xf]
    // 0x3c3e04: r0 = 14
    //     0x3c3e04: mov             x0, #0xe
    // 0x3c3e08: StoreField: r1->field_b = r0
    //     0x3c3e08: stur            w0, [x1, #0xb]
    // 0x3c3e0c: r0 = _sequentialize()
    //     0x3c3e0c: bl              #0x3c3e24  ; [package:ricochlime/pages/loading_page.dart] LoadingPage::_sequentialize
    // 0x3c3e10: LeaveFrame
    //     0x3c3e10: mov             SP, fp
    //     0x3c3e14: ldp             fp, lr, [SP], #0x10
    // 0x3c3e18: ret
    //     0x3c3e18: ret             
    // 0x3c3e1c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3e1c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3e20: b               #0x3c3cd8
  }
  static _ _sequentialize(/* No info */) {
    // ** addr: 0x3c3e24, size: 0x190
    // 0x3c3e24: EnterFrame
    //     0x3c3e24: stp             fp, lr, [SP, #-0x10]!
    //     0x3c3e28: mov             fp, SP
    // 0x3c3e2c: AllocStack(0x38)
    //     0x3c3e2c: sub             SP, SP, #0x38
    // 0x3c3e30: SetupParameters(dynamic _ /* r1 => r1, fp-0x8 */)
    //     0x3c3e30: stur            x1, [fp, #-8]
    // 0x3c3e34: CheckStackOverflow
    //     0x3c3e34: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3e38: cmp             SP, x16
    //     0x3c3e3c: b.ls            #0x3c3fa4
    // 0x3c3e40: r1 = 4
    //     0x3c3e40: mov             x1, #4
    // 0x3c3e44: r0 = AllocateContext()
    //     0x3c3e44: bl              #0x5834e8  ; AllocateContextStub
    // 0x3c3e48: mov             x2, x0
    // 0x3c3e4c: ldur            x0, [fp, #-8]
    // 0x3c3e50: stur            x2, [fp, #-0x18]
    // 0x3c3e54: StoreField: r2->field_f = r0
    //     0x3c3e54: stur            w0, [x2, #0xf]
    // 0x3c3e58: LoadField: r3 = r0->field_b
    //     0x3c3e58: ldur            w3, [x0, #0xb]
    // 0x3c3e5c: stur            x3, [fp, #-0x10]
    // 0x3c3e60: StoreField: r2->field_13 = r3
    //     0x3c3e60: stur            w3, [x2, #0x13]
    // 0x3c3e64: r1 = Null
    //     0x3c3e64: mov             x1, NULL
    // 0x3c3e68: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x3c3e68: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x3c3e6c: r0 = Random()
    //     0x3c3e6c: bl              #0x37e1a8  ; [dart:math] Random::Random
    // 0x3c3e70: ldur            x2, [fp, #-0x18]
    // 0x3c3e74: ArrayStore: r2[0] = r0  ; List_4
    //     0x3c3e74: stur            w0, [x2, #0x17]
    //     0x3c3e78: ldurb           w16, [x2, #-1]
    //     0x3c3e7c: ldurb           w17, [x0, #-1]
    //     0x3c3e80: and             x16, x17, x16, lsr #2
    //     0x3c3e84: tst             x16, HEAP, lsr #32
    //     0x3c3e88: b.eq            #0x3c3e90
    //     0x3c3e8c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3c3e90: r0 = Instance_Duration
    //     0x3c3e90: add             x0, PP, #0xf, lsl #12  ; [pp+0xfef0] Obj!Duration@5dcde1
    //     0x3c3e94: ldr             x0, [x0, #0xef0]
    // 0x3c3e98: StoreField: r2->field_1b = r0
    //     0x3c3e98: stur            w0, [x2, #0x1b]
    // 0x3c3e9c: ldur            x0, [fp, #-0x10]
    // 0x3c3ea0: r1 = LoadInt32Instr(r0)
    //     0x3c3ea0: sbfx            x1, x0, #1, #0x1f
    // 0x3c3ea4: add             x0, x1, #1
    // 0x3c3ea8: stur            x0, [fp, #-0x20]
    // 0x3c3eac: r1 = Function '<anonymous closure>': static.
    //     0x3c3eac: add             x1, PP, #0xf, lsl #12  ; [pp+0xfef8] AnonymousClosure: static (0x3c3fd4), in [package:ricochlime/pages/loading_page.dart] LoadingPage::_sequentialize (0x3c3e24)
    //     0x3c3eb0: ldr             x1, [x1, #0xef8]
    // 0x3c3eb4: r0 = AllocateClosure()
    //     0x3c3eb4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c3eb8: mov             x3, x0
    // 0x3c3ebc: ldur            x0, [fp, #-0x20]
    // 0x3c3ec0: stur            x3, [fp, #-8]
    // 0x3c3ec4: lsl             x2, x0, #1
    // 0x3c3ec8: r1 = <Task>
    //     0x3c3ec8: add             x1, PP, #0xf, lsl #12  ; [pp+0xff00] TypeArguments: <Task>
    //     0x3c3ecc: ldr             x1, [x1, #0xf00]
    // 0x3c3ed0: r0 = AllocateArray()
    //     0x3c3ed0: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3c3ed4: mov             x1, x0
    // 0x3c3ed8: stur            x1, [fp, #-0x10]
    // 0x3c3edc: r3 = 0
    //     0x3c3edc: mov             x3, #0
    // 0x3c3ee0: ldur            x2, [fp, #-0x20]
    // 0x3c3ee4: stur            x3, [fp, #-0x28]
    // 0x3c3ee8: CheckStackOverflow
    //     0x3c3ee8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3eec: cmp             SP, x16
    //     0x3c3ef0: b.ls            #0x3c3fac
    // 0x3c3ef4: cmp             x3, x2
    // 0x3c3ef8: b.ge            #0x3c3f94
    // 0x3c3efc: lsl             x0, x3, #1
    // 0x3c3f00: ldur            x16, [fp, #-8]
    // 0x3c3f04: stp             x0, x16, [SP]
    // 0x3c3f08: ldur            x0, [fp, #-8]
    // 0x3c3f0c: ClosureCall
    //     0x3c3f0c: ldr             x4, [PP, #0x530]  ; [pp+0x530] List(5) [0, 0x2, 0x2, 0x2, Null]
    //     0x3c3f10: ldur            x2, [x0, #0x1f]
    //     0x3c3f14: blr             x2
    // 0x3c3f18: mov             x3, x0
    // 0x3c3f1c: r2 = Null
    //     0x3c3f1c: mov             x2, NULL
    // 0x3c3f20: r1 = Null
    //     0x3c3f20: mov             x1, NULL
    // 0x3c3f24: stur            x3, [fp, #-0x18]
    // 0x3c3f28: r4 = 60
    //     0x3c3f28: mov             x4, #0x3c
    // 0x3c3f2c: branchIfSmi(r0, 0x3c3f38)
    //     0x3c3f2c: tbz             w0, #0, #0x3c3f38
    // 0x3c3f30: r4 = LoadClassIdInstr(r0)
    //     0x3c3f30: ldur            x4, [x0, #-1]
    //     0x3c3f34: ubfx            x4, x4, #0xc, #0x14
    // 0x3c3f38: cmp             x4, #0x7af
    // 0x3c3f3c: b.eq            #0x3c3f54
    // 0x3c3f40: r8 = Task
    //     0x3c3f40: add             x8, PP, #0xf, lsl #12  ; [pp+0xff08] Type: Task
    //     0x3c3f44: ldr             x8, [x8, #0xf08]
    // 0x3c3f48: r3 = Null
    //     0x3c3f48: add             x3, PP, #0xf, lsl #12  ; [pp+0xff10] Null
    //     0x3c3f4c: ldr             x3, [x3, #0xf10]
    // 0x3c3f50: r0 = Task()
    //     0x3c3f50: bl              #0x3c3fb4  ; IsType_Task_Stub
    // 0x3c3f54: ldur            x1, [fp, #-0x10]
    // 0x3c3f58: ldur            x0, [fp, #-0x18]
    // 0x3c3f5c: ldur            x2, [fp, #-0x28]
    // 0x3c3f60: ArrayStore: r1[r2] = r0  ; List_4
    //     0x3c3f60: add             x25, x1, x2, lsl #2
    //     0x3c3f64: add             x25, x25, #0xf
    //     0x3c3f68: str             w0, [x25]
    //     0x3c3f6c: tbz             w0, #0, #0x3c3f88
    //     0x3c3f70: ldurb           w16, [x1, #-1]
    //     0x3c3f74: ldurb           w17, [x0, #-1]
    //     0x3c3f78: and             x16, x17, x16, lsr #2
    //     0x3c3f7c: tst             x16, HEAP, lsr #32
    //     0x3c3f80: b.eq            #0x3c3f88
    //     0x3c3f84: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3c3f88: add             x3, x2, #1
    // 0x3c3f8c: ldur            x1, [fp, #-0x10]
    // 0x3c3f90: b               #0x3c3ee0
    // 0x3c3f94: ldur            x0, [fp, #-0x10]
    // 0x3c3f98: LeaveFrame
    //     0x3c3f98: mov             SP, fp
    //     0x3c3f9c: ldp             fp, lr, [SP], #0x10
    // 0x3c3fa0: ret
    //     0x3c3fa0: ret             
    // 0x3c3fa4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3fa4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3fa8: b               #0x3c3e40
    // 0x3c3fac: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3fac: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3fb0: b               #0x3c3ef4
  }
  [closure] static Task <anonymous closure>(dynamic, int) {
    // ** addr: 0x3c3fd4, size: 0x234
    // 0x3c3fd4: EnterFrame
    //     0x3c3fd4: stp             fp, lr, [SP, #-0x10]!
    //     0x3c3fd8: mov             fp, SP
    // 0x3c3fdc: AllocStack(0x30)
    //     0x3c3fdc: sub             SP, SP, #0x30
    // 0x3c3fe0: SetupParameters([dynamic _ /* r0 */])
    //     0x3c3fe0: ldr             x0, [fp, #0x18]
    //     0x3c3fe4: ldur            w3, [x0, #0x17]
    //     0x3c3fe8: add             x3, x3, HEAP, lsl #32
    //     0x3c3fec: stur            x3, [fp, #-0x18]
    // 0x3c3ff0: CheckStackOverflow
    //     0x3c3ff0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3ff4: cmp             SP, x16
    //     0x3c3ff8: b.ls            #0x3c41c4
    // 0x3c3ffc: LoadField: r0 = r3->field_13
    //     0x3c3ffc: ldur            w0, [x3, #0x13]
    // 0x3c4000: ldr             x1, [fp, #0x10]
    // 0x3c4004: r4 = LoadInt32Instr(r1)
    //     0x3c4004: sbfx            x4, x1, #1, #0x1f
    //     0x3c4008: tbz             w1, #0, #0x3c4010
    //     0x3c400c: ldur            x4, [x1, #7]
    // 0x3c4010: stur            x4, [fp, #-0x10]
    // 0x3c4014: r1 = LoadInt32Instr(r0)
    //     0x3c4014: sbfx            x1, x0, #1, #0x1f
    // 0x3c4018: cmp             x4, x1
    // 0x3c401c: b.ne            #0x3c405c
    // 0x3c4020: LoadField: r2 = r3->field_1b
    //     0x3c4020: ldur            w2, [x3, #0x1b]
    // 0x3c4024: DecompressPointer r2
    //     0x3c4024: add             x2, x2, HEAP, lsl #32
    // 0x3c4028: r1 = Null
    //     0x3c4028: mov             x1, NULL
    // 0x3c402c: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x3c402c: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x3c4030: r0 = Future.delayed()
    //     0x3c4030: bl              #0x282d8c  ; [dart:async] Future::Future.delayed
    // 0x3c4034: stur            x0, [fp, #-8]
    // 0x3c4038: r0 = Task()
    //     0x3c4038: bl              #0x3c43bc  ; AllocateTaskStub -> Task (size=0x28)
    // 0x3c403c: mov             x1, x0
    // 0x3c4040: ldur            x2, [fp, #-8]
    // 0x3c4044: stur            x0, [fp, #-8]
    // 0x3c4048: r0 = Task()
    //     0x3c4048: bl              #0x3c429c  ; [package:ricochlime/pages/loading_page.dart] Task::Task
    // 0x3c404c: ldur            x0, [fp, #-8]
    // 0x3c4050: LeaveFrame
    //     0x3c4050: mov             SP, fp
    //     0x3c4054: ldp             fp, lr, [SP], #0x10
    // 0x3c4058: ret
    //     0x3c4058: ret             
    // 0x3c405c: LoadField: r0 = r3->field_1b
    //     0x3c405c: ldur            w0, [x3, #0x1b]
    // 0x3c4060: DecompressPointer r0
    //     0x3c4060: add             x0, x0, HEAP, lsl #32
    // 0x3c4064: add             x2, x4, #1
    // 0x3c4068: add             x5, x1, #2
    // 0x3c406c: scvtf           d0, x2
    // 0x3c4070: scvtf           d1, x5
    // 0x3c4074: fdiv            d2, d0, d1
    // 0x3c4078: r2 = inline_Allocate_Double()
    //     0x3c4078: ldp             x2, x1, [THR, #0x60]  ; THR::top
    //     0x3c407c: add             x2, x2, #0x10
    //     0x3c4080: cmp             x1, x2
    //     0x3c4084: b.ls            #0x3c41cc
    //     0x3c4088: str             x2, [THR, #0x60]  ; THR::top
    //     0x3c408c: sub             x2, x2, #0xf
    //     0x3c4090: mov             x1, #0xe19c
    //     0x3c4094: movk            x1, #3, lsl #16
    //     0x3c4098: stur            x1, [x2, #-1]
    // 0x3c409c: dmb             ishst
    // 0x3c40a0: StoreField: r2->field_7 = d2
    //     0x3c40a0: stur            d2, [x2, #7]
    // 0x3c40a4: mov             x1, x0
    // 0x3c40a8: r0 = *()
    //     0x3c40a8: bl              #0x236db8  ; [dart:core] Duration::*
    // 0x3c40ac: mov             x2, x0
    // 0x3c40b0: ldur            x0, [fp, #-0x18]
    // 0x3c40b4: stur            x2, [fp, #-8]
    // 0x3c40b8: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x3c40b8: ldur            w1, [x0, #0x17]
    // 0x3c40bc: DecompressPointer r1
    //     0x3c40bc: add             x1, x1, HEAP, lsl #32
    // 0x3c40c0: r0 = RandomExtension.nextDoubleBetween()
    //     0x3c40c0: bl              #0x3c4208  ; [package:flame/src/extensions/random.dart] ::RandomExtension.nextDoubleBetween
    // 0x3c40c4: r2 = inline_Allocate_Double()
    //     0x3c40c4: ldp             x2, x0, [THR, #0x60]  ; THR::top
    //     0x3c40c8: add             x2, x2, #0x10
    //     0x3c40cc: cmp             x0, x2
    //     0x3c40d0: b.ls            #0x3c41f0
    //     0x3c40d4: str             x2, [THR, #0x60]  ; THR::top
    //     0x3c40d8: sub             x2, x2, #0xf
    //     0x3c40dc: mov             x0, #0xe19c
    //     0x3c40e0: movk            x0, #3, lsl #16
    //     0x3c40e4: stur            x0, [x2, #-1]
    // 0x3c40e8: dmb             ishst
    // 0x3c40ec: StoreField: r2->field_7 = d0
    //     0x3c40ec: stur            d0, [x2, #7]
    // 0x3c40f0: ldur            x1, [fp, #-8]
    // 0x3c40f4: r0 = *()
    //     0x3c40f4: bl              #0x236db8  ; [dart:core] Duration::*
    // 0x3c40f8: mov             x2, x0
    // 0x3c40fc: ldur            x0, [fp, #-0x18]
    // 0x3c4100: LoadField: r3 = r0->field_f
    //     0x3c4100: ldur            w3, [x0, #0xf]
    // 0x3c4104: DecompressPointer r3
    //     0x3c4104: add             x3, x3, HEAP, lsl #32
    // 0x3c4108: LoadField: r0 = r3->field_b
    //     0x3c4108: ldur            w0, [x3, #0xb]
    // 0x3c410c: r1 = LoadInt32Instr(r0)
    //     0x3c410c: sbfx            x1, x0, #1, #0x1f
    // 0x3c4110: mov             x0, x1
    // 0x3c4114: ldur            x1, [fp, #-0x10]
    // 0x3c4118: cmp             x1, x0
    // 0x3c411c: b.hs            #0x3c4204
    // 0x3c4120: LoadField: r0 = r3->field_f
    //     0x3c4120: ldur            w0, [x3, #0xf]
    // 0x3c4124: DecompressPointer r0
    //     0x3c4124: add             x0, x0, HEAP, lsl #32
    // 0x3c4128: ldur            x1, [fp, #-0x10]
    // 0x3c412c: ArrayLoad: r3 = r0[r1]  ; Unknown_4
    //     0x3c412c: add             x16, x0, x1, lsl #2
    //     0x3c4130: ldur            w3, [x16, #0xf]
    // 0x3c4134: DecompressPointer r3
    //     0x3c4134: add             x3, x3, HEAP, lsl #32
    // 0x3c4138: stur            x3, [fp, #-8]
    // 0x3c413c: r1 = Null
    //     0x3c413c: mov             x1, NULL
    // 0x3c4140: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x3c4140: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x3c4144: r0 = Future.delayed()
    //     0x3c4144: bl              #0x282d8c  ; [dart:async] Future::Future.delayed
    // 0x3c4148: r1 = Null
    //     0x3c4148: mov             x1, NULL
    // 0x3c414c: r2 = 4
    //     0x3c414c: mov             x2, #4
    // 0x3c4150: stur            x0, [fp, #-0x18]
    // 0x3c4154: r0 = AllocateArray()
    //     0x3c4154: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3c4158: mov             x2, x0
    // 0x3c415c: ldur            x0, [fp, #-8]
    // 0x3c4160: stur            x2, [fp, #-0x20]
    // 0x3c4164: StoreField: r2->field_f = r0
    //     0x3c4164: stur            w0, [x2, #0xf]
    // 0x3c4168: ldur            x0, [fp, #-0x18]
    // 0x3c416c: StoreField: r2->field_13 = r0
    //     0x3c416c: stur            w0, [x2, #0x13]
    // 0x3c4170: r1 = <Future>
    //     0x3c4170: add             x1, PP, #9, lsl #12  ; [pp+0x9a80] TypeArguments: <Future>
    //     0x3c4174: ldr             x1, [x1, #0xa80]
    // 0x3c4178: r0 = AllocateGrowableArray()
    //     0x3c4178: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3c417c: mov             x1, x0
    // 0x3c4180: ldur            x0, [fp, #-0x20]
    // 0x3c4184: StoreField: r1->field_f = r0
    //     0x3c4184: stur            w0, [x1, #0xf]
    // 0x3c4188: r0 = 4
    //     0x3c4188: mov             x0, #4
    // 0x3c418c: StoreField: r1->field_b = r0
    //     0x3c418c: stur            w0, [x1, #0xb]
    // 0x3c4190: stp             x1, NULL, [SP]
    // 0x3c4194: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x3c4194: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x3c4198: r0 = wait()
    //     0x3c4198: bl              #0x263a08  ; [dart:async] Future::wait
    // 0x3c419c: stur            x0, [fp, #-8]
    // 0x3c41a0: r0 = Task()
    //     0x3c41a0: bl              #0x3c43bc  ; AllocateTaskStub -> Task (size=0x28)
    // 0x3c41a4: mov             x1, x0
    // 0x3c41a8: ldur            x2, [fp, #-8]
    // 0x3c41ac: stur            x0, [fp, #-8]
    // 0x3c41b0: r0 = Task()
    //     0x3c41b0: bl              #0x3c429c  ; [package:ricochlime/pages/loading_page.dart] Task::Task
    // 0x3c41b4: ldur            x0, [fp, #-8]
    // 0x3c41b8: LeaveFrame
    //     0x3c41b8: mov             SP, fp
    //     0x3c41bc: ldp             fp, lr, [SP], #0x10
    // 0x3c41c0: ret
    //     0x3c41c0: ret             
    // 0x3c41c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c41c4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c41c8: b               #0x3c3ffc
    // 0x3c41cc: SaveReg d2
    //     0x3c41cc: str             q2, [SP, #-0x10]!
    // 0x3c41d0: stp             x3, x4, [SP, #-0x10]!
    // 0x3c41d4: SaveReg r0
    //     0x3c41d4: str             x0, [SP, #-8]!
    // 0x3c41d8: r0 = AllocateDouble()
    //     0x3c41d8: bl              #0x584528  ; AllocateDoubleStub
    // 0x3c41dc: mov             x2, x0
    // 0x3c41e0: RestoreReg r0
    //     0x3c41e0: ldr             x0, [SP], #8
    // 0x3c41e4: ldp             x3, x4, [SP], #0x10
    // 0x3c41e8: RestoreReg d2
    //     0x3c41e8: ldr             q2, [SP], #0x10
    // 0x3c41ec: b               #0x3c40a0
    // 0x3c41f0: SaveReg d0
    //     0x3c41f0: str             q0, [SP, #-0x10]!
    // 0x3c41f4: r0 = AllocateDouble()
    //     0x3c41f4: bl              #0x584528  ; AllocateDoubleStub
    // 0x3c41f8: mov             x2, x0
    // 0x3c41fc: RestoreReg d0
    //     0x3c41fc: ldr             q0, [SP], #0x10
    // 0x3c4200: b               #0x3c40ec
    // 0x3c4204: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3c4204: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ createState(/* No info */) {
    // ** addr: 0x43ddc4, size: 0x2c
    // 0x43ddc4: EnterFrame
    //     0x43ddc4: stp             fp, lr, [SP, #-0x10]!
    //     0x43ddc8: mov             fp, SP
    // 0x43ddcc: mov             x0, x1
    // 0x43ddd0: r1 = <LoadingPage>
    //     0x43ddd0: add             x1, PP, #0xd, lsl #12  ; [pp+0xdca8] TypeArguments: <LoadingPage>
    //     0x43ddd4: ldr             x1, [x1, #0xca8]
    // 0x43ddd8: r0 = _LoadingPageState()
    //     0x43ddd8: bl              #0x43ddf0  ; Allocate_LoadingPageStateStub -> _LoadingPageState (size=0x24)
    // 0x43dddc: StoreField: r0->field_13 = rZR
    //     0x43dddc: stur            xzr, [x0, #0x13]
    // 0x43dde0: StoreField: r0->field_1b = rZR
    //     0x43dde0: stur            xzr, [x0, #0x1b]
    // 0x43dde4: LeaveFrame
    //     0x43dde4: mov             SP, fp
    //     0x43dde8: ldp             fp, lr, [SP], #0x10
    // 0x43ddec: ret
    //     0x43ddec: ret             
  }
}
