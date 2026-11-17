// lib: , url: package:ricochlime/flame/ricochlime_game.dart

// class id: 1049310, size: 0x8
class :: {
}

// class id: 1921, size: 0xd4, field offset: 0x90
class RicochlimeGame extends _MixinApplication140&Forge2DGame&PanDetector&TapCallbacks&MouseMovementDetector&SingleGameInstance {

  static late final RicochlimeGame instance; // offset: 0x860
  late final Background background; // offset: 0x9c
  late final Player player; // offset: 0x94
  late final AimGuide aimGuide; // offset: 0x98
  static late final ValueNotifier<int> score; // offset: 0x868
  late final ValueNotifier<GameState> state; // offset: 0x90
  static late final ValueNotifier<double> timeDilation; // offset: 0x870
  static late final Logger log; // offset: 0x864
  late Random random; // offset: 0xa8
  late final Completer<bool> preloadSprites; // offset: 0xc4
  late final bool pointAndClickEnabled; // offset: 0xd0
  static late final ValueNotifier<bool> isDarkMode; // offset: 0x86c
  late final RicochlimeAudio audio; // offset: 0xa0
  static late final Stream<int> fpsStream; // offset: 0x87c
  static late final StreamController<int> _fpsStreamController; // offset: 0x878

  static StreamController<int> _fpsStreamController() {
    // ** addr: 0x29ff50, size: 0x34
    // 0x29ff50: EnterFrame
    //     0x29ff50: stp             fp, lr, [SP, #-0x10]!
    //     0x29ff54: mov             fp, SP
    // 0x29ff58: CheckStackOverflow
    //     0x29ff58: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x29ff5c: cmp             SP, x16
    //     0x29ff60: b.ls            #0x29ff7c
    // 0x29ff64: r1 = <int>
    //     0x29ff64: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x29ff68: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x29ff68: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x29ff6c: r0 = StreamController.broadcast()
    //     0x29ff6c: bl              #0x29dc0c  ; [dart:async] StreamController::StreamController.broadcast
    // 0x29ff70: LeaveFrame
    //     0x29ff70: mov             SP, fp
    //     0x29ff74: ldp             fp, lr, [SP], #0x10
    // 0x29ff78: ret
    //     0x29ff78: ret             
    // 0x29ff7c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x29ff7c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x29ff80: b               #0x29ff64
  }
  RicochlimeAudio audio(RicochlimeGame) {
    // ** addr: 0x2a10cc, size: 0x60
    // 0x2a10cc: EnterFrame
    //     0x2a10cc: stp             fp, lr, [SP, #-0x10]!
    //     0x2a10d0: mov             fp, SP
    // 0x2a10d4: AllocStack(0x10)
    //     0x2a10d4: sub             SP, SP, #0x10
    // 0x2a10d8: CheckStackOverflow
    //     0x2a10d8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x2a10dc: cmp             SP, x16
    //     0x2a10e0: b.ls            #0x2a1124
    // 0x2a10e4: r1 = Null
    //     0x2a10e4: mov             x1, NULL
    // 0x2a10e8: r2 = "RicochlimeAudio"
    //     0x2a10e8: add             x2, PP, #0x14, lsl #12  ; [pp+0x14550] "RicochlimeAudio"
    //     0x2a10ec: ldr             x2, [x2, #0x550]
    // 0x2a10f0: r0 = Logger()
    //     0x2a10f0: bl              #0x286f68  ; [package:logging/src/logger.dart] Logger::Logger
    // 0x2a10f4: stur            x0, [fp, #-8]
    // 0x2a10f8: r0 = RicochlimeAudio()
    //     0x2a10f8: bl              #0x2a112c  ; AllocateRicochlimeAudioStub -> RicochlimeAudio (size=0x14)
    // 0x2a10fc: mov             x2, x0
    // 0x2a1100: ldur            x0, [fp, #-8]
    // 0x2a1104: stur            x2, [fp, #-0x10]
    // 0x2a1108: StoreField: r2->field_7 = r0
    //     0x2a1108: stur            w0, [x2, #7]
    // 0x2a110c: mov             x1, x2
    // 0x2a1110: r0 = init()
    //     0x2a1110: bl              #0x28d458  ; [package:ricochlime/utils/ricochlime_audio.dart] RicochlimeAudio::init
    // 0x2a1114: ldur            x0, [fp, #-0x10]
    // 0x2a1118: LeaveFrame
    //     0x2a1118: mov             SP, fp
    //     0x2a111c: ldp             fp, lr, [SP], #0x10
    // 0x2a1120: ret
    //     0x2a1120: ret             
    // 0x2a1124: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x2a1124: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x2a1128: b               #0x2a10e4
  }
  static RicochlimeGame instance() {
    // ** addr: 0x2a1158, size: 0x48
    // 0x2a1158: EnterFrame
    //     0x2a1158: stp             fp, lr, [SP, #-0x10]!
    //     0x2a115c: mov             fp, SP
    // 0x2a1160: AllocStack(0x8)
    //     0x2a1160: sub             SP, SP, #8
    // 0x2a1164: CheckStackOverflow
    //     0x2a1164: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x2a1168: cmp             SP, x16
    //     0x2a116c: b.ls            #0x2a1198
    // 0x2a1170: r1 = <Forge2DWorld>
    //     0x2a1170: add             x1, PP, #8, lsl #12  ; [pp+0x8718] TypeArguments: <Forge2DWorld>
    //     0x2a1174: ldr             x1, [x1, #0x718]
    // 0x2a1178: r0 = RicochlimeGame()
    //     0x2a1178: bl              #0x2a9db4  ; AllocateRicochlimeGameStub -> RicochlimeGame (size=0xd4)
    // 0x2a117c: mov             x1, x0
    // 0x2a1180: stur            x0, [fp, #-8]
    // 0x2a1184: r0 = RicochlimeGame._()
    //     0x2a1184: bl              #0x2a11a0  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::RicochlimeGame._
    // 0x2a1188: ldur            x0, [fp, #-8]
    // 0x2a118c: LeaveFrame
    //     0x2a118c: mov             SP, fp
    //     0x2a1190: ldp             fp, lr, [SP], #0x10
    // 0x2a1194: ret
    //     0x2a1194: ret             
    // 0x2a1198: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x2a1198: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x2a119c: b               #0x2a1170
  }
  _ RicochlimeGame._(/* No info */) {
    // ** addr: 0x2a11a0, size: 0xe8
    // 0x2a11a0: EnterFrame
    //     0x2a11a0: stp             fp, lr, [SP, #-0x10]!
    //     0x2a11a4: mov             fp, SP
    // 0x2a11a8: AllocStack(0x10)
    //     0x2a11a8: sub             SP, SP, #0x10
    // 0x2a11ac: ldr             x3, [THR, #0x90]  ; THR::object_sentinel
    // 0x2a11b0: r2 = false
    //     0x2a11b0: add             x2, NULL, #0x30  ; false
    // 0x2a11b4: r0 = 1
    //     0x2a11b4: mov             x0, #1
    // 0x2a11b8: mov             x4, x1
    // 0x2a11bc: stur            x1, [fp, #-8]
    // 0x2a11c0: CheckStackOverflow
    //     0x2a11c0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x2a11c4: cmp             SP, x16
    //     0x2a11c8: b.ls            #0x2a1280
    // 0x2a11cc: StoreField: r4->field_8f = r3
    //     0x2a11cc: stur            w3, [x4, #0x8f]
    // 0x2a11d0: StoreField: r4->field_93 = r3
    //     0x2a11d0: stur            w3, [x4, #0x93]
    // 0x2a11d4: StoreField: r4->field_97 = r3
    //     0x2a11d4: stur            w3, [x4, #0x97]
    // 0x2a11d8: StoreField: r4->field_9b = r3
    //     0x2a11d8: stur            w3, [x4, #0x9b]
    // 0x2a11dc: StoreField: r4->field_9f = r3
    //     0x2a11dc: stur            w3, [x4, #0x9f]
    // 0x2a11e0: StoreField: r4->field_a3 = r2
    //     0x2a11e0: stur            w2, [x4, #0xa3]
    // 0x2a11e4: StoreField: r4->field_a7 = r3
    //     0x2a11e4: stur            w3, [x4, #0xa7]
    // 0x2a11e8: StoreField: r4->field_ab = r0
    //     0x2a11e8: stur            x0, [x4, #0xab]
    // 0x2a11ec: StoreField: r4->field_b3 = r0
    //     0x2a11ec: stur            x0, [x4, #0xb3]
    // 0x2a11f0: StoreField: r4->field_c3 = r3
    //     0x2a11f0: stur            w3, [x4, #0xc3]
    // 0x2a11f4: StoreField: r4->field_c7 = rZR
    //     0x2a11f4: stur            xzr, [x4, #0xc7]
    // 0x2a11f8: StoreField: r4->field_cf = r3
    //     0x2a11f8: stur            w3, [x4, #0xcf]
    // 0x2a11fc: r1 = <double>
    //     0x2a11fc: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x2a1200: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x2a1200: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x2a1204: r0 = StreamController.broadcast()
    //     0x2a1204: bl              #0x29dc0c  ; [dart:async] StreamController::StreamController.broadcast
    // 0x2a1208: stur            x0, [fp, #-0x10]
    // 0x2a120c: r0 = Ticker()
    //     0x2a120c: bl              #0x2a9da8  ; AllocateTickerStub -> Ticker (size=0xc)
    // 0x2a1210: mov             x1, x0
    // 0x2a1214: ldur            x0, [fp, #-0x10]
    // 0x2a1218: StoreField: r1->field_7 = r0
    //     0x2a1218: stur            w0, [x1, #7]
    // 0x2a121c: mov             x0, x1
    // 0x2a1220: ldur            x1, [fp, #-8]
    // 0x2a1224: StoreField: r1->field_bb = r0
    //     0x2a1224: stur            w0, [x1, #0xbb]
    //     0x2a1228: ldurb           w16, [x1, #-1]
    //     0x2a122c: ldurb           w17, [x0, #-1]
    //     0x2a1230: and             x16, x17, x16, lsr #2
    //     0x2a1234: tst             x16, HEAP, lsr #32
    //     0x2a1238: b.eq            #0x2a1240
    //     0x2a123c: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x2a1240: r0 = Vector2()
    //     0x2a1240: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x2a1244: r4 = 4
    //     0x2a1244: mov             x4, #4
    // 0x2a1248: stur            x0, [fp, #-0x10]
    // 0x2a124c: r0 = AllocateFloat32Array()
    //     0x2a124c: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x2a1250: ldur            x2, [fp, #-0x10]
    // 0x2a1254: StoreField: r2->field_7 = r0
    //     0x2a1254: stur            w0, [x2, #7]
    // 0x2a1258: ldur            x1, [fp, #-8]
    // 0x2a125c: r0 = Forge2DGame()
    //     0x2a125c: bl              #0x2a1288  ; [package:flame_forge2d/forge2d_game.dart] Forge2DGame::Forge2DGame
    // 0x2a1260: r2 = 200.000000
    //     0x2a1260: add             x2, PP, #8, lsl #12  ; [pp+0x8720] 200
    //     0x2a1264: ldr             x2, [x2, #0x720]
    // 0x2a1268: StoreStaticField(0xa6c, r2)
    //     0x2a1268: ldr             x1, [THR, #0x78]  ; THR::field_table_values
    //     0x2a126c: str             x2, [x1, #0x14d8]
    // 0x2a1270: r0 = Null
    //     0x2a1270: mov             x0, NULL
    // 0x2a1274: LeaveFrame
    //     0x2a1274: mov             SP, fp
    //     0x2a1278: ldp             fp, lr, [SP], #0x10
    // 0x2a127c: ret
    //     0x2a127c: ret             
    // 0x2a1280: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x2a1280: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x2a1284: b               #0x2a11cc
  }
  _ cancelCurrentTurn(/* No info */) async {
    // ** addr: 0x3717e8, size: 0x154
    // 0x3717e8: EnterFrame
    //     0x3717e8: stp             fp, lr, [SP, #-0x10]!
    //     0x3717ec: mov             fp, SP
    // 0x3717f0: AllocStack(0x20)
    //     0x3717f0: sub             SP, SP, #0x20
    // 0x3717f4: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0x10 */)
    //     0x3717f4: stur            NULL, [fp, #-8]
    //     0x3717f8: stur            x1, [fp, #-0x10]
    // 0x3717fc: CheckStackOverflow
    //     0x3717fc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371800: cmp             SP, x16
    //     0x371804: b.ls            #0x37192c
    // 0x371808: InitAsync() -> Future<void?>
    //     0x371808: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x37180c: bl              #0x2556b4  ; InitAsyncStub
    // 0x371810: ldur            x1, [fp, #-0x10]
    // 0x371814: LoadField: r0 = r1->field_8f
    //     0x371814: ldur            w0, [x1, #0x8f]
    // 0x371818: DecompressPointer r0
    //     0x371818: add             x0, x0, HEAP, lsl #32
    // 0x37181c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x371820: cmp             w0, w16
    // 0x371824: b.ne            #0x371834
    // 0x371828: r2 = state
    //     0x371828: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x37182c: ldr             x2, [x2, #0x790]
    // 0x371830: r0 = InitLateFinalInstanceField()
    //     0x371830: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x371834: LoadField: r1 = r0->field_27
    //     0x371834: ldur            w1, [x0, #0x27]
    // 0x371838: DecompressPointer r1
    //     0x371838: add             x1, x1, HEAP, lsl #32
    // 0x37183c: r16 = Instance_GameState
    //     0x37183c: add             x16, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x371840: ldr             x16, [x16, #0x798]
    // 0x371844: cmp             w1, w16
    // 0x371848: b.ne            #0x371854
    // 0x37184c: r0 = Null
    //     0x37184c: mov             x0, NULL
    // 0x371850: r0 = ReturnAsyncNotFuture()
    //     0x371850: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x371854: ldur            x0, [fp, #-0x10]
    // 0x371858: r1 = true
    //     0x371858: add             x1, NULL, #0x20  ; true
    // 0x37185c: StoreField: r0->field_a3 = r1
    //     0x37185c: stur            w1, [x0, #0xa3]
    // 0x371860: LoadField: r3 = r0->field_bb
    //     0x371860: ldur            w3, [x0, #0xbb]
    // 0x371864: DecompressPointer r3
    //     0x371864: add             x3, x3, HEAP, lsl #32
    // 0x371868: stur            x3, [fp, #-0x18]
    // 0x37186c: CheckStackOverflow
    //     0x37186c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371870: cmp             SP, x16
    //     0x371874: b.ls            #0x371934
    // 0x371878: LoadField: r1 = r0->field_8f
    //     0x371878: ldur            w1, [x0, #0x8f]
    // 0x37187c: DecompressPointer r1
    //     0x37187c: add             x1, x1, HEAP, lsl #32
    // 0x371880: LoadField: r2 = r1->field_27
    //     0x371880: ldur            w2, [x1, #0x27]
    // 0x371884: DecompressPointer r2
    //     0x371884: add             x2, x2, HEAP, lsl #32
    // 0x371888: r16 = Instance_GameState
    //     0x371888: add             x16, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x37188c: ldr             x16, [x16, #0x798]
    // 0x371890: cmp             w2, w16
    // 0x371894: b.eq            #0x3718c4
    // 0x371898: mov             x1, x3
    // 0x37189c: r2 = Instance_Duration
    //     0x37189c: add             x2, PP, #0x14, lsl #12  ; [pp+0x14490] Obj!Duration@5dccf1
    //     0x3718a0: ldr             x2, [x2, #0x490]
    // 0x3718a4: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x3718a4: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x3718a8: r0 = delayed()
    //     0x3718a8: bl              #0x37e964  ; [package:ricochlime/flame/ticker.dart] Ticker::delayed
    // 0x3718ac: mov             x1, x0
    // 0x3718b0: stur            x1, [fp, #-0x20]
    // 0x3718b4: r0 = Await()
    //     0x3718b4: bl              #0x255470  ; AwaitStub
    // 0x3718b8: ldur            x0, [fp, #-0x10]
    // 0x3718bc: ldur            x3, [fp, #-0x18]
    // 0x3718c0: b               #0x37186c
    // 0x3718c4: ldur            x1, [fp, #-0x10]
    // 0x3718c8: r0 = resetChildren()
    //     0x3718c8: bl              #0x37e784  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::resetChildren
    // 0x3718cc: r0 = LoadStaticField(0xccc)
    //     0x3718cc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3718d0: ldr             x0, [x0, #0x1998]
    // 0x3718d4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3718d8: cmp             w0, w16
    // 0x3718dc: b.ne            #0x3718ec
    // 0x3718e0: r2 = stows
    //     0x3718e0: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3718e4: ldr             x2, [x2, #0x310]
    // 0x3718e8: r0 = InitLateFinalStaticField()
    //     0x3718e8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3718ec: LoadField: r1 = r0->field_7
    //     0x3718ec: ldur            w1, [x0, #7]
    // 0x3718f0: DecompressPointer r1
    //     0x3718f0: add             x1, x1, HEAP, lsl #32
    // 0x3718f4: LoadField: r0 = r1->field_43
    //     0x3718f4: ldur            w0, [x1, #0x43]
    // 0x3718f8: DecompressPointer r0
    //     0x3718f8: add             x0, x0, HEAP, lsl #32
    // 0x3718fc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x371900: cmp             w0, w16
    // 0x371904: b.ne            #0x371914
    // 0x371908: r2 = _value
    //     0x371908: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x37190c: ldr             x2, [x2, #0x4b0]
    // 0x371910: r0 = InitLateInstanceField()
    //     0x371910: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x371914: ldur            x1, [fp, #-0x10]
    // 0x371918: mov             x2, x0
    // 0x37191c: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x37191c: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x371920: r0 = importFromGame()
    //     0x371920: bl              #0x37193c  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::importFromGame
    // 0x371924: r0 = Null
    //     0x371924: mov             x0, NULL
    // 0x371928: r0 = ReturnAsyncNotFuture()
    //     0x371928: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37192c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37192c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x371930: b               #0x371808
    // 0x371934: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x371934: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x371938: b               #0x371878
  }
  _ importFromGame(/* No info */) {
    // ** addr: 0x37193c, size: 0x5b0
    // 0x37193c: EnterFrame
    //     0x37193c: stp             fp, lr, [SP, #-0x10]!
    //     0x371940: mov             fp, SP
    // 0x371944: AllocStack(0x60)
    //     0x371944: sub             SP, SP, #0x60
    // 0x371948: SetupParameters(RicochlimeGame this /* r1 => r3, fp-0x10 */, dynamic _ /* r2 => r2, fp-0x18 */, {dynamic showGameOverDialog = true /* r4, fp-0x8 */})
    //     0x371948: mov             x3, x1
    //     0x37194c: stur            x1, [fp, #-0x10]
    //     0x371950: stur            x2, [fp, #-0x18]
    //     0x371954: ldur            w0, [x4, #0x13]
    //     0x371958: ldur            w1, [x4, #0x1f]
    //     0x37195c: add             x1, x1, HEAP, lsl #32
    //     0x371960: add             x16, PP, #0xc, lsl #12  ; [pp+0xc750] "showGameOverDialog"
    //     0x371964: ldr             x16, [x16, #0x750]
    //     0x371968: cmp             w1, w16
    //     0x37196c: b.ne            #0x37198c
    //     0x371970: ldur            w1, [x4, #0x23]
    //     0x371974: add             x1, x1, HEAP, lsl #32
    //     0x371978: sub             w4, w0, w1
    //     0x37197c: add             x0, fp, w4, sxtw #2
    //     0x371980: ldr             x0, [x0, #8]
    //     0x371984: mov             x4, x0
    //     0x371988: b               #0x371990
    //     0x37198c: add             x4, NULL, #0x20  ; true
    //     0x371990: stur            x4, [fp, #-8]
    // 0x371994: CheckStackOverflow
    //     0x371994: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371998: cmp             SP, x16
    //     0x37199c: b.ls            #0x371eac
    // 0x3719a0: cmp             w2, NULL
    // 0x3719a4: b.ne            #0x3719c0
    // 0x3719a8: mov             x1, x3
    // 0x3719ac: r0 = _reset()
    //     0x3719ac: bl              #0x375fd8  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::_reset
    // 0x3719b0: r0 = Null
    //     0x3719b0: mov             x0, NULL
    // 0x3719b4: LeaveFrame
    //     0x3719b4: mov             SP, fp
    //     0x3719b8: ldp             fp, lr, [SP], #0x10
    // 0x3719bc: ret
    //     0x3719bc: ret             
    // 0x3719c0: LoadField: r1 = r2->field_f
    //     0x3719c0: ldur            w1, [x2, #0xf]
    // 0x3719c4: DecompressPointer r1
    //     0x3719c4: add             x1, x1, HEAP, lsl #32
    // 0x3719c8: r0 = LoadClassIdInstr(r1)
    //     0x3719c8: ldur            x0, [x1, #-1]
    //     0x3719cc: ubfx            x0, x0, #0xc, #0x14
    // 0x3719d0: r0 = GDT[cid_x0 + 0xfc4]()
    //     0x3719d0: add             lr, x0, #0xfc4
    //     0x3719d4: ldr             lr, [x21, lr, lsl #3]
    //     0x3719d8: blr             lr
    // 0x3719dc: mov             x1, x0
    // 0x3719e0: stur            x1, [fp, #-0x48]
    // 0x3719e4: LoadField: r2 = r1->field_b
    //     0x3719e4: ldur            w2, [x1, #0xb]
    // 0x3719e8: DecompressPointer r2
    //     0x3719e8: add             x2, x2, HEAP, lsl #32
    // 0x3719ec: stur            x2, [fp, #-0x40]
    // 0x3719f0: LoadField: r3 = r1->field_f
    //     0x3719f0: ldur            x3, [x1, #0xf]
    // 0x3719f4: stur            x3, [fp, #-0x38]
    // 0x3719f8: LoadField: r4 = r1->field_7
    //     0x3719f8: ldur            w4, [x1, #7]
    // 0x3719fc: DecompressPointer r4
    //     0x3719fc: add             x4, x4, HEAP, lsl #32
    // 0x371a00: stur            x4, [fp, #-0x30]
    // 0x371a04: r6 = 0
    //     0x371a04: mov             x6, #0
    // 0x371a08: r5 = false
    //     0x371a08: add             x5, NULL, #0x30  ; false
    // 0x371a0c: stur            x6, [fp, #-0x20]
    // 0x371a10: stur            x5, [fp, #-0x28]
    // 0x371a14: CheckStackOverflow
    //     0x371a14: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371a18: cmp             SP, x16
    //     0x371a1c: b.ls            #0x371eb4
    // 0x371a20: r0 = LoadClassIdInstr(r2)
    //     0x371a20: ldur            x0, [x2, #-1]
    //     0x371a24: ubfx            x0, x0, #0xc, #0x14
    // 0x371a28: str             x2, [SP]
    // 0x371a2c: r0 = GDT[cid_x0 + -0xf07]()
    //     0x371a2c: sub             lr, x0, #0xf07
    //     0x371a30: ldr             lr, [x21, lr, lsl #3]
    //     0x371a34: blr             lr
    // 0x371a38: r1 = LoadInt32Instr(r0)
    //     0x371a38: sbfx            x1, x0, #1, #0x1f
    //     0x371a3c: tbz             w0, #0, #0x371a44
    //     0x371a40: ldur            x1, [x0, #7]
    // 0x371a44: ldur            x3, [fp, #-0x38]
    // 0x371a48: cmp             x3, x1
    // 0x371a4c: b.ne            #0x371e8c
    // 0x371a50: ldur            x4, [fp, #-0x48]
    // 0x371a54: ArrayLoad: r2 = r4[0]  ; List_8
    //     0x371a54: ldur            x2, [x4, #0x17]
    // 0x371a58: cmp             x2, x1
    // 0x371a5c: b.ge            #0x371bdc
    // 0x371a60: ldur            x5, [fp, #-0x40]
    // 0x371a64: r0 = LoadClassIdInstr(r5)
    //     0x371a64: ldur            x0, [x5, #-1]
    //     0x371a68: ubfx            x0, x0, #0xc, #0x14
    // 0x371a6c: mov             x1, x5
    // 0x371a70: r0 = GDT[cid_x0 + 0x7a7e]()
    //     0x371a70: mov             x17, #0x7a7e
    //     0x371a74: add             lr, x0, x17
    //     0x371a78: ldr             lr, [x21, lr, lsl #3]
    //     0x371a7c: blr             lr
    // 0x371a80: mov             x4, x0
    // 0x371a84: ldur            x3, [fp, #-0x48]
    // 0x371a88: stur            x4, [fp, #-0x50]
    // 0x371a8c: StoreField: r3->field_1f = r0
    //     0x371a8c: stur            w0, [x3, #0x1f]
    //     0x371a90: tbz             w0, #0, #0x371aac
    //     0x371a94: ldurb           w16, [x3, #-1]
    //     0x371a98: ldurb           w17, [x0, #-1]
    //     0x371a9c: and             x16, x17, x16, lsr #2
    //     0x371aa0: tst             x16, HEAP, lsr #32
    //     0x371aa4: b.eq            #0x371aac
    //     0x371aa8: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x371aac: ArrayLoad: r0 = r3[0]  ; List_8
    //     0x371aac: ldur            x0, [x3, #0x17]
    // 0x371ab0: add             x1, x0, #1
    // 0x371ab4: ArrayStore: r3[0] = r1  ; List_8
    //     0x371ab4: stur            x1, [x3, #0x17]
    // 0x371ab8: cmp             w4, NULL
    // 0x371abc: b.ne            #0x371af0
    // 0x371ac0: mov             x0, x4
    // 0x371ac4: ldur            x2, [fp, #-0x30]
    // 0x371ac8: r1 = Null
    //     0x371ac8: mov             x1, NULL
    // 0x371acc: cmp             w2, NULL
    // 0x371ad0: b.eq            #0x371af0
    // 0x371ad4: ArrayLoad: r4 = r2[0]  ; List_4
    //     0x371ad4: ldur            w4, [x2, #0x17]
    // 0x371ad8: DecompressPointer r4
    //     0x371ad8: add             x4, x4, HEAP, lsl #32
    // 0x371adc: r8 = X0
    //     0x371adc: ldr             x8, [PP, #0x5c8]  ; [pp+0x5c8] TypeParameter: X0
    // 0x371ae0: LoadField: r9 = r4->field_7
    //     0x371ae0: ldur            x9, [x4, #7]
    // 0x371ae4: r3 = Null
    //     0x371ae4: add             x3, PP, #0xc, lsl #12  ; [pp+0xc758] Null
    //     0x371ae8: ldr             x3, [x3, #0x758]
    // 0x371aec: blr             x9
    // 0x371af0: ldur            x2, [fp, #-0x50]
    // 0x371af4: r1 = <Forge2DGame<Forge2DWorld>>
    //     0x371af4: add             x1, PP, #0xc, lsl #12  ; [pp+0xc768] TypeArguments: <Forge2DGame<Forge2DWorld>>
    //     0x371af8: ldr             x1, [x1, #0x768]
    // 0x371afc: r0 = Monster.fromJson()
    //     0x371afc: bl              #0x3730b8  ; [package:ricochlime/flame/components/monster.dart] Monster::Monster.fromJson
    // 0x371b00: ldur            x1, [fp, #-0x10]
    // 0x371b04: mov             x2, x0
    // 0x371b08: stur            x0, [fp, #-0x50]
    // 0x371b0c: r0 = _addChild()
    //     0x371b0c: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x371b10: ldur            x0, [fp, #-0x50]
    // 0x371b14: LoadField: r1 = r0->field_9b
    //     0x371b14: ldur            w1, [x0, #0x9b]
    // 0x371b18: DecompressPointer r1
    //     0x371b18: add             x1, x1, HEAP, lsl #32
    // 0x371b1c: r16 = Instance_KillReward
    //     0x371b1c: add             x16, PP, #0xc, lsl #12  ; [pp+0xc770] Obj!KillReward@5d8b01
    //     0x371b20: ldr             x16, [x16, #0x770]
    // 0x371b24: cmp             w1, w16
    // 0x371b28: b.ne            #0x371b3c
    // 0x371b2c: ldur            x2, [fp, #-0x20]
    // 0x371b30: add             x1, x2, #1
    // 0x371b34: mov             x6, x1
    // 0x371b38: b               #0x371b44
    // 0x371b3c: ldur            x2, [fp, #-0x20]
    // 0x371b40: mov             x6, x2
    // 0x371b44: LoadField: r1 = r0->field_9f
    //     0x371b44: ldur            w1, [x0, #0x9f]
    // 0x371b48: DecompressPointer r1
    //     0x371b48: add             x1, x1, HEAP, lsl #32
    // 0x371b4c: tbnz            w1, #4, #0x371b7c
    // 0x371b50: LoadField: r1 = r0->field_43
    //     0x371b50: ldur            w1, [x0, #0x43]
    // 0x371b54: DecompressPointer r1
    //     0x371b54: add             x1, x1, HEAP, lsl #32
    // 0x371b58: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x371b5c: cmp             w1, w16
    // 0x371b60: b.eq            #0x371ebc
    // 0x371b64: LoadField: r0 = r1->field_1b
    //     0x371b64: ldur            w0, [x1, #0x1b]
    // 0x371b68: DecompressPointer r0
    //     0x371b68: add             x0, x0, HEAP, lsl #32
    // 0x371b6c: LoadField: r1 = r0->field_7
    //     0x371b6c: ldur            w1, [x0, #7]
    // 0x371b70: DecompressPointer r1
    //     0x371b70: add             x1, x1, HEAP, lsl #32
    // 0x371b74: mov             x0, x1
    // 0x371b78: b               #0x371b88
    // 0x371b7c: LoadField: r1 = r0->field_77
    //     0x371b7c: ldur            w1, [x0, #0x77]
    // 0x371b80: DecompressPointer r1
    //     0x371b80: add             x1, x1, HEAP, lsl #32
    // 0x371b84: mov             x0, x1
    // 0x371b88: d0 = 0.000000
    //     0x371b88: eor             v0.16b, v0.16b, v0.16b
    // 0x371b8c: LoadField: r2 = r0->field_7
    //     0x371b8c: ldur            w2, [x0, #7]
    // 0x371b90: DecompressPointer r2
    //     0x371b90: add             x2, x2, HEAP, lsl #32
    // 0x371b94: LoadField: r0 = r2->field_13
    //     0x371b94: ldur            w0, [x2, #0x13]
    // 0x371b98: r1 = LoadInt32Instr(r0)
    //     0x371b98: sbfx            x1, x0, #1, #0x1f
    // 0x371b9c: mov             x0, x1
    // 0x371ba0: r1 = 1
    //     0x371ba0: mov             x1, #1
    // 0x371ba4: cmp             x1, x0
    // 0x371ba8: b.hs            #0x371ec8
    // 0x371bac: LoadField: d1 = r2->field_1b
    //     0x371bac: ldur            s1, [x2, #0x1b]
    // 0x371bb0: fcvt            d2, s1
    // 0x371bb4: fcmp            d0, d2
    // 0x371bb8: b.lt            #0x371bc4
    // 0x371bbc: r5 = true
    //     0x371bbc: add             x5, NULL, #0x20  ; true
    // 0x371bc0: b               #0x371bc8
    // 0x371bc4: ldur            x5, [fp, #-0x28]
    // 0x371bc8: ldur            x1, [fp, #-0x48]
    // 0x371bcc: ldur            x4, [fp, #-0x30]
    // 0x371bd0: ldur            x2, [fp, #-0x40]
    // 0x371bd4: ldur            x3, [fp, #-0x38]
    // 0x371bd8: b               #0x371a0c
    // 0x371bdc: mov             x0, x4
    // 0x371be0: ldur            x2, [fp, #-0x20]
    // 0x371be4: ldur            x1, [fp, #-0x28]
    // 0x371be8: StoreField: r0->field_1f = rNULL
    //     0x371be8: stur            NULL, [x0, #0x1f]
    // 0x371bec: tbnz            w1, #4, #0x371d44
    // 0x371bf0: ldur            x0, [fp, #-0x10]
    // 0x371bf4: LoadField: r1 = r0->field_1f
    //     0x371bf4: ldur            w1, [x0, #0x1f]
    // 0x371bf8: DecompressPointer r1
    //     0x371bf8: add             x1, x1, HEAP, lsl #32
    // 0x371bfc: cmp             w1, NULL
    // 0x371c00: b.ne            #0x371c38
    // 0x371c04: mov             x1, x0
    // 0x371c08: r0 = createComponentSet()
    //     0x371c08: bl              #0x2a2ac4  ; [package:flame/src/components/core/component.dart] Component::createComponentSet
    // 0x371c0c: mov             x1, x0
    // 0x371c10: ldur            x2, [fp, #-0x10]
    // 0x371c14: StoreField: r2->field_1f = r0
    //     0x371c14: stur            w0, [x2, #0x1f]
    //     0x371c18: ldurb           w16, [x2, #-1]
    //     0x371c1c: ldurb           w17, [x0, #-1]
    //     0x371c20: and             x16, x17, x16, lsr #2
    //     0x371c24: tst             x16, HEAP, lsr #32
    //     0x371c28: b.eq            #0x371c30
    //     0x371c2c: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x371c30: mov             x0, x1
    // 0x371c34: b               #0x371c40
    // 0x371c38: mov             x2, x0
    // 0x371c3c: mov             x0, x1
    // 0x371c40: r16 = <Monster>
    //     0x371c40: add             x16, PP, #0xc, lsl #12  ; [pp+0xc778] TypeArguments: <Monster>
    //     0x371c44: ldr             x16, [x16, #0x778]
    // 0x371c48: stp             x0, x16, [SP]
    // 0x371c4c: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x371c4c: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x371c50: r0 = whereType()
    //     0x371c50: bl              #0x30f5cc  ; [dart:mixin_deduplication] _MixinApplication503&OrderedSet&QueryableOrderedSetImpl::whereType
    // 0x371c54: r1 = LoadClassIdInstr(r0)
    //     0x371c54: ldur            x1, [x0, #-1]
    //     0x371c58: ubfx            x1, x1, #0xc, #0x14
    // 0x371c5c: mov             x16, x0
    // 0x371c60: mov             x0, x1
    // 0x371c64: mov             x1, x16
    // 0x371c68: r0 = GDT[cid_x0 + 0xfc4]()
    //     0x371c68: add             lr, x0, #0xfc4
    //     0x371c6c: ldr             lr, [x21, lr, lsl #3]
    //     0x371c70: blr             lr
    // 0x371c74: mov             x2, x0
    // 0x371c78: stur            x2, [fp, #-0x28]
    // 0x371c7c: CheckStackOverflow
    //     0x371c7c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371c80: cmp             SP, x16
    //     0x371c84: b.ls            #0x371ecc
    // 0x371c88: r0 = LoadClassIdInstr(r2)
    //     0x371c88: ldur            x0, [x2, #-1]
    //     0x371c8c: ubfx            x0, x0, #0xc, #0x14
    // 0x371c90: mov             x1, x2
    // 0x371c94: r0 = GDT[cid_x0 + -0x1000]()
    //     0x371c94: sub             lr, x0, #1, lsl #12
    //     0x371c98: ldr             lr, [x21, lr, lsl #3]
    //     0x371c9c: blr             lr
    // 0x371ca0: tbnz            w0, #4, #0x371d44
    // 0x371ca4: ldur            x2, [fp, #-0x28]
    // 0x371ca8: r0 = LoadClassIdInstr(r2)
    //     0x371ca8: ldur            x0, [x2, #-1]
    //     0x371cac: ubfx            x0, x0, #0xc, #0x14
    // 0x371cb0: mov             x1, x2
    // 0x371cb4: r0 = GDT[cid_x0 + -0xfe0]()
    //     0x371cb4: sub             lr, x0, #0xfe0
    //     0x371cb8: ldr             lr, [x21, lr, lsl #3]
    //     0x371cbc: blr             lr
    // 0x371cc0: LoadField: r1 = r0->field_9f
    //     0x371cc0: ldur            w1, [x0, #0x9f]
    // 0x371cc4: DecompressPointer r1
    //     0x371cc4: add             x1, x1, HEAP, lsl #32
    // 0x371cc8: tbnz            w1, #4, #0x371cf8
    // 0x371ccc: LoadField: r1 = r0->field_43
    //     0x371ccc: ldur            w1, [x0, #0x43]
    // 0x371cd0: DecompressPointer r1
    //     0x371cd0: add             x1, x1, HEAP, lsl #32
    // 0x371cd4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x371cd8: cmp             w1, w16
    // 0x371cdc: b.eq            #0x371ed4
    // 0x371ce0: LoadField: r0 = r1->field_1b
    //     0x371ce0: ldur            w0, [x1, #0x1b]
    // 0x371ce4: DecompressPointer r0
    //     0x371ce4: add             x0, x0, HEAP, lsl #32
    // 0x371ce8: LoadField: r1 = r0->field_7
    //     0x371ce8: ldur            w1, [x0, #7]
    // 0x371cec: DecompressPointer r1
    //     0x371cec: add             x1, x1, HEAP, lsl #32
    // 0x371cf0: mov             x0, x1
    // 0x371cf4: b               #0x371d04
    // 0x371cf8: LoadField: r1 = r0->field_77
    //     0x371cf8: ldur            w1, [x0, #0x77]
    // 0x371cfc: DecompressPointer r1
    //     0x371cfc: add             x1, x1, HEAP, lsl #32
    // 0x371d00: mov             x0, x1
    // 0x371d04: d0 = 16.000000
    //     0x371d04: fmov            d0, #16.00000000
    // 0x371d08: LoadField: r2 = r0->field_7
    //     0x371d08: ldur            w2, [x0, #7]
    // 0x371d0c: DecompressPointer r2
    //     0x371d0c: add             x2, x2, HEAP, lsl #32
    // 0x371d10: LoadField: r0 = r2->field_13
    //     0x371d10: ldur            w0, [x2, #0x13]
    // 0x371d14: r1 = LoadInt32Instr(r0)
    //     0x371d14: sbfx            x1, x0, #1, #0x1f
    // 0x371d18: mov             x0, x1
    // 0x371d1c: r1 = 1
    //     0x371d1c: mov             x1, #1
    // 0x371d20: cmp             x1, x0
    // 0x371d24: b.hs            #0x371ee0
    // 0x371d28: LoadField: d1 = r2->field_1b
    //     0x371d28: ldur            s1, [x2, #0x1b]
    // 0x371d2c: fcvt            d2, s1
    // 0x371d30: fadd            d1, d2, d0
    // 0x371d34: fcvt            s2, d1
    // 0x371d38: StoreField: r2->field_1b = d2
    //     0x371d38: stur            s2, [x2, #0x1b]
    // 0x371d3c: ldur            x2, [fp, #-0x28]
    // 0x371d40: b               #0x371c7c
    // 0x371d44: ldur            x1, [fp, #-0x10]
    // 0x371d48: ldur            x2, [fp, #-0x18]
    // 0x371d4c: ldur            x0, [fp, #-0x20]
    // 0x371d50: r0 = LoadStaticField(0x868)
    //     0x371d50: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x371d54: ldr             x0, [x0, #0x10d0]
    // 0x371d58: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x371d5c: cmp             w0, w16
    // 0x371d60: b.ne            #0x371d70
    // 0x371d64: r2 = score
    //     0x371d64: add             x2, PP, #0xc, lsl #12  ; [pp+0xc780] Field <RicochlimeGame.score>: static late final (offset: 0x868)
    //     0x371d68: ldr             x2, [x2, #0x780]
    // 0x371d6c: r0 = InitLateFinalStaticField()
    //     0x371d6c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x371d70: mov             x3, x0
    // 0x371d74: ldur            x0, [fp, #-0x18]
    // 0x371d78: stur            x3, [fp, #-0x28]
    // 0x371d7c: LoadField: r2 = r0->field_7
    //     0x371d7c: ldur            x2, [x0, #7]
    // 0x371d80: r0 = BoxInt64Instr(r2)
    //     0x371d80: sbfiz           x0, x2, #1, #0x1f
    //     0x371d84: cmp             x2, x0, asr #1
    //     0x371d88: b.eq            #0x371d94
    //     0x371d8c: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x371d90: stur            x2, [x0, #7]
    // 0x371d94: mov             x1, x3
    // 0x371d98: mov             x2, x0
    // 0x371d9c: r0 = value=()
    //     0x371d9c: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x371da0: ldur            x0, [fp, #-0x28]
    // 0x371da4: LoadField: r1 = r0->field_27
    //     0x371da4: ldur            w1, [x0, #0x27]
    // 0x371da8: DecompressPointer r1
    //     0x371da8: add             x1, x1, HEAP, lsl #32
    // 0x371dac: r0 = LoadInt32Instr(r1)
    //     0x371dac: sbfx            x0, x1, #1, #0x1f
    //     0x371db0: tbz             w1, #0, #0x371db8
    //     0x371db4: ldur            x0, [x1, #7]
    // 0x371db8: add             x1, x0, #1
    // 0x371dbc: ldur            x2, [fp, #-0x20]
    // 0x371dc0: sub             x3, x1, x2
    // 0x371dc4: ldur            x2, [fp, #-0x10]
    // 0x371dc8: StoreField: r2->field_ab = r3
    //     0x371dc8: stur            x3, [x2, #0xab]
    // 0x371dcc: r3 = 1
    //     0x371dcc: mov             x3, #1
    // 0x371dd0: r1 = 50
    //     0x371dd0: mov             x1, #0x32
    // 0x371dd4: CheckStackOverflow
    //     0x371dd4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371dd8: cmp             SP, x16
    //     0x371ddc: b.ls            #0x371ee4
    // 0x371de0: cmp             x0, x1
    // 0x371de4: b.lt            #0x371e04
    // 0x371de8: add             x4, x3, #1
    // 0x371dec: r16 = 50
    //     0x371dec: mov             x16, #0x32
    // 0x371df0: mul             x3, x4, x16
    // 0x371df4: add             x5, x1, x3
    // 0x371df8: mov             x3, x4
    // 0x371dfc: mov             x1, x5
    // 0x371e00: b               #0x371dd4
    // 0x371e04: ldur            x0, [fp, #-8]
    // 0x371e08: StoreField: r2->field_b3 = r3
    //     0x371e08: stur            x3, [x2, #0xb3]
    // 0x371e0c: tbnz            w0, #4, #0x371e48
    // 0x371e10: mov             x1, x2
    // 0x371e14: r0 = isGameOver()
    //     0x371e14: bl              #0x371f40  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::isGameOver
    // 0x371e18: tbnz            w0, #4, #0x371e48
    // 0x371e1c: ldur            x2, [fp, #-0x10]
    // 0x371e20: r1 = Function 'gameOver':.
    //     0x371e20: add             x1, PP, #0xc, lsl #12  ; [pp+0xc788] AnonymousClosure: (0x37e74c), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::gameOver (0x376b2c)
    //     0x371e24: ldr             x1, [x1, #0x788]
    // 0x371e28: r0 = AllocateClosure()
    //     0x371e28: bl              #0x5838bc  ; AllocateClosureStub
    // 0x371e2c: str             x0, [SP]
    // 0x371e30: r1 = <void?>
    //     0x371e30: ldr             x1, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x371e34: r2 = Instance_Duration
    //     0x371e34: add             x2, PP, #9, lsl #12  ; [pp+0x9188] Obj!Duration@5dcd01
    //     0x371e38: ldr             x2, [x2, #0x188]
    // 0x371e3c: r4 = const [0, 0x3, 0x1, 0x3, null]
    //     0x371e3c: ldr             x4, [PP, #0x350]  ; [pp+0x350] List(5) [0, 0x3, 0x1, 0x3, Null]
    // 0x371e40: r0 = Future.delayed()
    //     0x371e40: bl              #0x282d8c  ; [dart:async] Future::Future.delayed
    // 0x371e44: b               #0x371e7c
    // 0x371e48: ldur            x1, [fp, #-0x10]
    // 0x371e4c: LoadField: r0 = r1->field_8f
    //     0x371e4c: ldur            w0, [x1, #0x8f]
    // 0x371e50: DecompressPointer r0
    //     0x371e50: add             x0, x0, HEAP, lsl #32
    // 0x371e54: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x371e58: cmp             w0, w16
    // 0x371e5c: b.ne            #0x371e6c
    // 0x371e60: r2 = state
    //     0x371e60: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x371e64: ldr             x2, [x2, #0x790]
    // 0x371e68: r0 = InitLateFinalInstanceField()
    //     0x371e68: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x371e6c: mov             x1, x0
    // 0x371e70: r2 = Instance_GameState
    //     0x371e70: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x371e74: ldr             x2, [x2, #0x798]
    // 0x371e78: r0 = value=()
    //     0x371e78: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x371e7c: r0 = Null
    //     0x371e7c: mov             x0, NULL
    // 0x371e80: LeaveFrame
    //     0x371e80: mov             SP, fp
    //     0x371e84: ldp             fp, lr, [SP], #0x10
    // 0x371e88: ret
    //     0x371e88: ret             
    // 0x371e8c: ldur            x0, [fp, #-0x40]
    // 0x371e90: r0 = ConcurrentModificationError()
    //     0x371e90: bl              #0x2379bc  ; AllocateConcurrentModificationErrorStub -> ConcurrentModificationError (size=0x10)
    // 0x371e94: mov             x1, x0
    // 0x371e98: ldur            x0, [fp, #-0x40]
    // 0x371e9c: StoreField: r1->field_b = r0
    //     0x371e9c: stur            w0, [x1, #0xb]
    // 0x371ea0: mov             x0, x1
    // 0x371ea4: r0 = Throw()
    //     0x371ea4: bl              #0x5827dc  ; ThrowStub
    // 0x371ea8: brk             #0
    // 0x371eac: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x371eac: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x371eb0: b               #0x3719a0
    // 0x371eb4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x371eb4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x371eb8: b               #0x371a20
    // 0x371ebc: r9 = body
    //     0x371ebc: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x371ec0: ldr             x9, [x9, #0x7a0]
    // 0x371ec4: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x371ec4: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x371ec8: r0 = RangeErrorSharedWithFPURegs()
    //     0x371ec8: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x371ecc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x371ecc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x371ed0: b               #0x371c88
    // 0x371ed4: r9 = body
    //     0x371ed4: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x371ed8: ldr             x9, [x9, #0x7a0]
    // 0x371edc: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x371edc: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x371ee0: r0 = RangeErrorSharedWithFPURegs()
    //     0x371ee0: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
    // 0x371ee4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x371ee4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x371ee8: b               #0x371de0
  }
  static int getNumNewRowsEachRound(int) {
    // ** addr: 0x371eec, size: 0x54
    // 0x371eec: r0 = 1
    //     0x371eec: mov             x0, #1
    // 0x371ef0: r2 = 50
    //     0x371ef0: mov             x2, #0x32
    // 0x371ef4: CheckStackOverflow
    //     0x371ef4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371ef8: cmp             SP, x16
    //     0x371efc: b.ls            #0x371f28
    // 0x371f00: cmp             x1, x2
    // 0x371f04: b.lt            #0x371f24
    // 0x371f08: add             x3, x0, #1
    // 0x371f0c: r16 = 50
    //     0x371f0c: mov             x16, #0x32
    // 0x371f10: mul             x4, x3, x16
    // 0x371f14: add             x5, x2, x4
    // 0x371f18: mov             x0, x3
    // 0x371f1c: mov             x2, x5
    // 0x371f20: b               #0x371ef4
    // 0x371f24: ret
    //     0x371f24: ret             
    // 0x371f28: EnterFrame
    //     0x371f28: stp             fp, lr, [SP, #-0x10]!
    //     0x371f2c: mov             fp, SP
    // 0x371f30: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x371f30: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x371f34: LeaveFrame
    //     0x371f34: mov             SP, fp
    //     0x371f38: ldp             fp, lr, [SP], #0x10
    // 0x371f3c: b               #0x371f00
  }
  bool isGameOver(RicochlimeGame) {
    // ** addr: 0x371f40, size: 0x1a0
    // 0x371f40: EnterFrame
    //     0x371f40: stp             fp, lr, [SP, #-0x10]!
    //     0x371f44: mov             fp, SP
    // 0x371f48: AllocStack(0x28)
    //     0x371f48: sub             SP, SP, #0x28
    // 0x371f4c: SetupParameters(RicochlimeGame this /* r1 => r0, fp-0x8 */)
    //     0x371f4c: mov             x0, x1
    //     0x371f50: stur            x1, [fp, #-8]
    // 0x371f54: CheckStackOverflow
    //     0x371f54: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x371f58: cmp             SP, x16
    //     0x371f5c: b.ls            #0x3720c4
    // 0x371f60: mov             x1, x0
    // 0x371f64: LoadField: r0 = r1->field_93
    //     0x371f64: ldur            w0, [x1, #0x93]
    // 0x371f68: DecompressPointer r0
    //     0x371f68: add             x0, x0, HEAP, lsl #32
    // 0x371f6c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x371f70: cmp             w0, w16
    // 0x371f74: b.ne            #0x371f84
    // 0x371f78: r2 = player
    //     0x371f78: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x371f7c: ldr             x2, [x2, #0x700]
    // 0x371f80: r0 = InitLateFinalInstanceField()
    //     0x371f80: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x371f84: LoadField: r1 = r0->field_37
    //     0x371f84: ldur            w1, [x0, #0x37]
    // 0x371f88: DecompressPointer r1
    //     0x371f88: add             x1, x1, HEAP, lsl #32
    // 0x371f8c: LoadField: r0 = r1->field_37
    //     0x371f8c: ldur            w0, [x1, #0x37]
    // 0x371f90: DecompressPointer r0
    //     0x371f90: add             x0, x0, HEAP, lsl #32
    // 0x371f94: LoadField: r2 = r0->field_7
    //     0x371f94: ldur            w2, [x0, #7]
    // 0x371f98: DecompressPointer r2
    //     0x371f98: add             x2, x2, HEAP, lsl #32
    // 0x371f9c: LoadField: r0 = r2->field_13
    //     0x371f9c: ldur            w0, [x2, #0x13]
    // 0x371fa0: r1 = LoadInt32Instr(r0)
    //     0x371fa0: sbfx            x1, x0, #1, #0x1f
    // 0x371fa4: mov             x0, x1
    // 0x371fa8: r1 = 1
    //     0x371fa8: mov             x1, #1
    // 0x371fac: cmp             x1, x0
    // 0x371fb0: b.hs            #0x3720cc
    // 0x371fb4: LoadField: d0 = r2->field_1b
    //     0x371fb4: ldur            s0, [x2, #0x1b]
    // 0x371fb8: fcvt            d1, s0
    // 0x371fbc: d0 = 18.400000
    //     0x371fbc: add             x17, PP, #0xc, lsl #12  ; [pp+0xc810] IMM: double(18.400000000000002) from 0x4032666666666667
    //     0x371fc0: ldr             d0, [x17, #0x810]
    // 0x371fc4: fadd            d2, d1, d0
    // 0x371fc8: d0 = 32.000000
    //     0x371fc8: add             x17, PP, #8, lsl #12  ; [pp+0x8700] IMM: double(32) from 0x4040000000000000
    //     0x371fcc: ldr             d0, [x17, #0x700]
    // 0x371fd0: fsub            d1, d2, d0
    // 0x371fd4: r0 = inline_Allocate_Double()
    //     0x371fd4: ldp             x0, x1, [THR, #0x60]  ; THR::top
    //     0x371fd8: add             x0, x0, #0x10
    //     0x371fdc: cmp             x1, x0
    //     0x371fe0: b.ls            #0x3720d0
    //     0x371fe4: str             x0, [THR, #0x60]  ; THR::top
    //     0x371fe8: sub             x0, x0, #0xf
    //     0x371fec: mov             x1, #0xe19c
    //     0x371ff0: movk            x1, #3, lsl #16
    //     0x371ff4: stur            x1, [x0, #-1]
    // 0x371ff8: dmb             ishst
    // 0x371ffc: StoreField: r0->field_7 = d1
    //     0x371ffc: stur            d1, [x0, #7]
    // 0x372000: stur            x0, [fp, #-0x10]
    // 0x372004: r1 = 1
    //     0x372004: mov             x1, #1
    // 0x372008: r0 = AllocateContext()
    //     0x372008: bl              #0x5834e8  ; AllocateContextStub
    // 0x37200c: mov             x2, x0
    // 0x372010: ldur            x0, [fp, #-0x10]
    // 0x372014: stur            x2, [fp, #-0x18]
    // 0x372018: StoreField: r2->field_f = r0
    //     0x372018: stur            w0, [x2, #0xf]
    // 0x37201c: ldur            x0, [fp, #-8]
    // 0x372020: LoadField: r1 = r0->field_1f
    //     0x372020: ldur            w1, [x0, #0x1f]
    // 0x372024: DecompressPointer r1
    //     0x372024: add             x1, x1, HEAP, lsl #32
    // 0x372028: cmp             w1, NULL
    // 0x37202c: b.ne            #0x372064
    // 0x372030: mov             x1, x0
    // 0x372034: r0 = createComponentSet()
    //     0x372034: bl              #0x2a2ac4  ; [package:flame/src/components/core/component.dart] Component::createComponentSet
    // 0x372038: mov             x2, x0
    // 0x37203c: ldur            x1, [fp, #-8]
    // 0x372040: StoreField: r1->field_1f = r0
    //     0x372040: stur            w0, [x1, #0x1f]
    //     0x372044: ldurb           w16, [x1, #-1]
    //     0x372048: ldurb           w17, [x0, #-1]
    //     0x37204c: and             x16, x17, x16, lsr #2
    //     0x372050: tst             x16, HEAP, lsr #32
    //     0x372054: b.eq            #0x37205c
    //     0x372058: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x37205c: mov             x0, x2
    // 0x372060: b               #0x372068
    // 0x372064: mov             x0, x1
    // 0x372068: r16 = <Monster>
    //     0x372068: add             x16, PP, #0xc, lsl #12  ; [pp+0xc778] TypeArguments: <Monster>
    //     0x37206c: ldr             x16, [x16, #0x778]
    // 0x372070: stp             x0, x16, [SP]
    // 0x372074: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x372074: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x372078: r0 = whereType()
    //     0x372078: bl              #0x30f5cc  ; [dart:mixin_deduplication] _MixinApplication503&OrderedSet&QueryableOrderedSetImpl::whereType
    // 0x37207c: ldur            x2, [fp, #-0x18]
    // 0x372080: r1 = Function '<anonymous closure>':.
    //     0x372080: add             x1, PP, #0xd, lsl #12  ; [pp+0xd1f0] AnonymousClosure: (0x3720e0), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::isGameOver (0x371f40)
    //     0x372084: ldr             x1, [x1, #0x1f0]
    // 0x372088: stur            x0, [fp, #-8]
    // 0x37208c: r0 = AllocateClosure()
    //     0x37208c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x372090: ldur            x1, [fp, #-8]
    // 0x372094: r2 = LoadClassIdInstr(r1)
    //     0x372094: ldur            x2, [x1, #-1]
    //     0x372098: ubfx            x2, x2, #0xc, #0x14
    // 0x37209c: mov             x16, x0
    // 0x3720a0: mov             x0, x2
    // 0x3720a4: mov             x2, x16
    // 0x3720a8: r0 = GDT[cid_x0 + 0x707c]()
    //     0x3720a8: mov             x17, #0x707c
    //     0x3720ac: add             lr, x0, x17
    //     0x3720b0: ldr             lr, [x21, lr, lsl #3]
    //     0x3720b4: blr             lr
    // 0x3720b8: LeaveFrame
    //     0x3720b8: mov             SP, fp
    //     0x3720bc: ldp             fp, lr, [SP], #0x10
    // 0x3720c0: ret
    //     0x3720c0: ret             
    // 0x3720c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3720c4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3720c8: b               #0x371f60
    // 0x3720cc: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3720cc: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3720d0: SaveReg d1
    //     0x3720d0: str             q1, [SP, #-0x10]!
    // 0x3720d4: r0 = AllocateDouble()
    //     0x3720d4: bl              #0x584528  ; AllocateDoubleStub
    // 0x3720d8: RestoreReg d1
    //     0x3720d8: ldr             q1, [SP], #0x10
    // 0x3720dc: b               #0x371ffc
  }
  [closure] bool <anonymous closure>(dynamic, Monster) {
    // ** addr: 0x3720e0, size: 0xb8
    // 0x3720e0: EnterFrame
    //     0x3720e0: stp             fp, lr, [SP, #-0x10]!
    //     0x3720e4: mov             fp, SP
    // 0x3720e8: ldr             x2, [fp, #0x18]
    // 0x3720ec: ArrayLoad: r3 = r2[0]  ; List_4
    //     0x3720ec: ldur            w3, [x2, #0x17]
    // 0x3720f0: DecompressPointer r3
    //     0x3720f0: add             x3, x3, HEAP, lsl #32
    // 0x3720f4: ldr             x2, [fp, #0x10]
    // 0x3720f8: LoadField: r4 = r2->field_9f
    //     0x3720f8: ldur            w4, [x2, #0x9f]
    // 0x3720fc: DecompressPointer r4
    //     0x3720fc: add             x4, x4, HEAP, lsl #32
    // 0x372100: tbnz            w4, #4, #0x372130
    // 0x372104: LoadField: r4 = r2->field_43
    //     0x372104: ldur            w4, [x2, #0x43]
    // 0x372108: DecompressPointer r4
    //     0x372108: add             x4, x4, HEAP, lsl #32
    // 0x37210c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x372110: cmp             w4, w16
    // 0x372114: b.eq            #0x372188
    // 0x372118: LoadField: r5 = r4->field_1b
    //     0x372118: ldur            w5, [x4, #0x1b]
    // 0x37211c: DecompressPointer r5
    //     0x37211c: add             x5, x5, HEAP, lsl #32
    // 0x372120: LoadField: r4 = r5->field_7
    //     0x372120: ldur            w4, [x5, #7]
    // 0x372124: DecompressPointer r4
    //     0x372124: add             x4, x4, HEAP, lsl #32
    // 0x372128: mov             x2, x4
    // 0x37212c: b               #0x37213c
    // 0x372130: LoadField: r4 = r2->field_77
    //     0x372130: ldur            w4, [x2, #0x77]
    // 0x372134: DecompressPointer r4
    //     0x372134: add             x4, x4, HEAP, lsl #32
    // 0x372138: mov             x2, x4
    // 0x37213c: LoadField: r4 = r2->field_7
    //     0x37213c: ldur            w4, [x2, #7]
    // 0x372140: DecompressPointer r4
    //     0x372140: add             x4, x4, HEAP, lsl #32
    // 0x372144: LoadField: r2 = r4->field_13
    //     0x372144: ldur            w2, [x4, #0x13]
    // 0x372148: r0 = LoadInt32Instr(r2)
    //     0x372148: sbfx            x0, x2, #1, #0x1f
    // 0x37214c: r1 = 1
    //     0x37214c: mov             x1, #1
    // 0x372150: cmp             x1, x0
    // 0x372154: b.hs            #0x372194
    // 0x372158: LoadField: d0 = r4->field_1b
    //     0x372158: ldur            s0, [x4, #0x1b]
    // 0x37215c: fcvt            d1, s0
    // 0x372160: LoadField: r1 = r3->field_f
    //     0x372160: ldur            w1, [x3, #0xf]
    // 0x372164: DecompressPointer r1
    //     0x372164: add             x1, x1, HEAP, lsl #32
    // 0x372168: LoadField: d0 = r1->field_7
    //     0x372168: ldur            d0, [x1, #7]
    // 0x37216c: fcmp            d1, d0
    // 0x372170: r16 = true
    //     0x372170: add             x16, NULL, #0x20  ; true
    // 0x372174: r17 = false
    //     0x372174: add             x17, NULL, #0x30  ; false
    // 0x372178: csel            x0, x16, x17, ge
    // 0x37217c: LeaveFrame
    //     0x37217c: mov             SP, fp
    //     0x372180: ldp             fp, lr, [SP], #0x10
    // 0x372184: ret
    //     0x372184: ret             
    // 0x372188: r9 = body
    //     0x372188: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x37218c: ldr             x9, [x9, #0x7a0]
    // 0x372190: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x372190: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x372194: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x372194: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  Player player(RicochlimeGame) {
    // ** addr: 0x372680, size: 0x48
    // 0x372680: EnterFrame
    //     0x372680: stp             fp, lr, [SP, #-0x10]!
    //     0x372684: mov             fp, SP
    // 0x372688: AllocStack(0x8)
    //     0x372688: sub             SP, SP, #8
    // 0x37268c: CheckStackOverflow
    //     0x37268c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x372690: cmp             SP, x16
    //     0x372694: b.ls            #0x3726c0
    // 0x372698: r1 = <PlayerState>
    //     0x372698: add             x1, PP, #0xc, lsl #12  ; [pp+0xc718] TypeArguments: <PlayerState>
    //     0x37269c: ldr             x1, [x1, #0x718]
    // 0x3726a0: r0 = Player()
    //     0x3726a0: bl              #0x37308c  ; AllocatePlayerStub -> Player (size=0x78)
    // 0x3726a4: mov             x1, x0
    // 0x3726a8: stur            x0, [fp, #-8]
    // 0x3726ac: r0 = Player()
    //     0x3726ac: bl              #0x3726c8  ; [package:ricochlime/flame/components/player.dart] Player::Player
    // 0x3726b0: ldur            x0, [fp, #-8]
    // 0x3726b4: LeaveFrame
    //     0x3726b4: mov             SP, fp
    //     0x3726b8: ldp             fp, lr, [SP], #0x10
    // 0x3726bc: ret
    //     0x3726bc: ret             
    // 0x3726c0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3726c0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3726c4: b               #0x372698
  }
  _ _reset(/* No info */) async {
    // ** addr: 0x375fd8, size: 0x134
    // 0x375fd8: EnterFrame
    //     0x375fd8: stp             fp, lr, [SP, #-0x10]!
    //     0x375fdc: mov             fp, SP
    // 0x375fe0: AllocStack(0x60)
    //     0x375fe0: sub             SP, SP, #0x60
    // 0x375fe4: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0x50 */)
    //     0x375fe4: stur            NULL, [fp, #-8]
    //     0x375fe8: stur            x1, [fp, #-0x50]
    // 0x375fec: CheckStackOverflow
    //     0x375fec: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x375ff0: cmp             SP, x16
    //     0x375ff4: b.ls            #0x376104
    // 0x375ff8: InitAsync() -> Future<void?>
    //     0x375ff8: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x375ffc: bl              #0x2556b4  ; InitAsyncStub
    // 0x376000: ldur            x1, [fp, #-0x50]
    // 0x376004: LoadField: r0 = r1->field_8f
    //     0x376004: ldur            w0, [x1, #0x8f]
    // 0x376008: DecompressPointer r0
    //     0x376008: add             x0, x0, HEAP, lsl #32
    // 0x37600c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376010: cmp             w0, w16
    // 0x376014: b.ne            #0x376024
    // 0x376018: r2 = state
    //     0x376018: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x37601c: ldr             x2, [x2, #0x790]
    // 0x376020: r0 = InitLateFinalInstanceField()
    //     0x376020: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x376024: mov             x1, x0
    // 0x376028: r2 = Instance_GameState
    //     0x376028: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x37602c: ldr             x2, [x2, #0x798]
    // 0x376030: r0 = value=()
    //     0x376030: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x376034: ldur            x1, [fp, #-0x50]
    // 0x376038: r0 = false
    //     0x376038: add             x0, NULL, #0x30  ; false
    // 0x37603c: StoreField: r1->field_a3 = r0
    //     0x37603c: stur            w0, [x1, #0xa3]
    // 0x376040: r0 = LoadStaticField(0x868)
    //     0x376040: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x376044: ldr             x0, [x0, #0x10d0]
    // 0x376048: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37604c: cmp             w0, w16
    // 0x376050: b.ne            #0x376060
    // 0x376054: r2 = score
    //     0x376054: add             x2, PP, #0xc, lsl #12  ; [pp+0xc780] Field <RicochlimeGame.score>: static late final (offset: 0x868)
    //     0x376058: ldr             x2, [x2, #0x780]
    // 0x37605c: r0 = InitLateFinalStaticField()
    //     0x37605c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x376060: mov             x1, x0
    // 0x376064: r2 = 0
    //     0x376064: mov             x2, #0
    // 0x376068: r0 = value=()
    //     0x376068: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x37606c: ldur            x0, [fp, #-0x50]
    // 0x376070: r1 = 1
    //     0x376070: mov             x1, #1
    // 0x376074: StoreField: r0->field_ab = r1
    //     0x376074: stur            x1, [x0, #0xab]
    // 0x376078: StoreField: r0->field_b3 = r1
    //     0x376078: stur            x1, [x0, #0xb3]
    // 0x37607c: mov             x1, x0
    // 0x376080: r0 = resetChildren()
    //     0x376080: bl              #0x37e784  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::resetChildren
    // 0x376084: ldur            x1, [fp, #-0x50]
    // 0x376088: r0 = spawnNewMonsters()
    //     0x376088: bl              #0x37610c  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::spawnNewMonsters
    // 0x37608c: mov             x1, x0
    // 0x376090: stur            x1, [fp, #-0x58]
    // 0x376094: r0 = Await()
    //     0x376094: bl              #0x255470  ; AwaitStub
    // 0x376098: ldur            x2, [fp, #-0x50]
    // 0x37609c: r3 = false
    //     0x37609c: add             x3, NULL, #0x30  ; false
    // 0x3760a0: StoreField: r2->field_a3 = r3
    //     0x3760a0: stur            w3, [x2, #0xa3]
    // 0x3760a4: LoadField: r1 = r2->field_8f
    //     0x3760a4: ldur            w1, [x2, #0x8f]
    // 0x3760a8: DecompressPointer r1
    //     0x3760a8: add             x1, x1, HEAP, lsl #32
    // 0x3760ac: r2 = Instance_GameState
    //     0x3760ac: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x3760b0: ldr             x2, [x2, #0x798]
    // 0x3760b4: r0 = value=()
    //     0x3760b4: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x3760b8: r0 = Null
    //     0x3760b8: mov             x0, NULL
    // 0x3760bc: r0 = ReturnAsyncNotFuture()
    //     0x3760bc: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x3760c0: sub             SP, fp, #0x60
    // 0x3760c4: ldur            x2, [fp, #-0x50]
    // 0x3760c8: r3 = false
    //     0x3760c8: add             x3, NULL, #0x30  ; false
    // 0x3760cc: mov             x4, x0
    // 0x3760d0: stur            x0, [fp, #-0x58]
    // 0x3760d4: mov             x0, x1
    // 0x3760d8: stur            x1, [fp, #-0x60]
    // 0x3760dc: StoreField: r2->field_a3 = r3
    //     0x3760dc: stur            w3, [x2, #0xa3]
    // 0x3760e0: LoadField: r1 = r2->field_8f
    //     0x3760e0: ldur            w1, [x2, #0x8f]
    // 0x3760e4: DecompressPointer r1
    //     0x3760e4: add             x1, x1, HEAP, lsl #32
    // 0x3760e8: r2 = Instance_GameState
    //     0x3760e8: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x3760ec: ldr             x2, [x2, #0x798]
    // 0x3760f0: r0 = value=()
    //     0x3760f0: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x3760f4: ldur            x0, [fp, #-0x58]
    // 0x3760f8: ldur            x1, [fp, #-0x60]
    // 0x3760fc: r0 = ReThrow()
    //     0x3760fc: bl              #0x5827b0  ; ReThrowStub
    // 0x376100: brk             #0
    // 0x376104: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x376104: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x376108: b               #0x375ff8
  }
  _ spawnNewMonsters(/* No info */) async {
    // ** addr: 0x37610c, size: 0x6b8
    // 0x37610c: EnterFrame
    //     0x37610c: stp             fp, lr, [SP, #-0x10]!
    //     0x376110: mov             fp, SP
    // 0x376114: AllocStack(0x58)
    //     0x376114: sub             SP, SP, #0x58
    // 0x376118: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0x10 */)
    //     0x376118: stur            NULL, [fp, #-8]
    //     0x37611c: stur            x1, [fp, #-0x10]
    // 0x376120: CheckStackOverflow
    //     0x376120: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x376124: cmp             SP, x16
    //     0x376128: b.ls            #0x376794
    // 0x37612c: r1 = 1
    //     0x37612c: mov             x1, #1
    // 0x376130: r0 = AllocateContext()
    //     0x376130: bl              #0x5834e8  ; AllocateContextStub
    // 0x376134: mov             x2, x0
    // 0x376138: ldur            x1, [fp, #-0x10]
    // 0x37613c: stur            x2, [fp, #-0x18]
    // 0x376140: StoreField: r2->field_f = r1
    //     0x376140: stur            w1, [x2, #0xf]
    // 0x376144: InitAsync() -> Future<void?>
    //     0x376144: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x376148: bl              #0x2556b4  ; InitAsyncStub
    // 0x37614c: ldur            x1, [fp, #-0x10]
    // 0x376150: LoadField: r0 = r1->field_8f
    //     0x376150: ldur            w0, [x1, #0x8f]
    // 0x376154: DecompressPointer r0
    //     0x376154: add             x0, x0, HEAP, lsl #32
    // 0x376158: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37615c: cmp             w0, w16
    // 0x376160: b.ne            #0x376170
    // 0x376164: r2 = state
    //     0x376164: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x376168: ldr             x2, [x2, #0x790]
    // 0x37616c: r0 = InitLateFinalInstanceField()
    //     0x37616c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x376170: mov             x1, x0
    // 0x376174: r2 = Instance_GameState
    //     0x376174: add             x2, PP, #0xc, lsl #12  ; [pp+0xc800] Obj!GameState@5d8a41
    //     0x376178: ldr             x2, [x2, #0x800]
    // 0x37617c: r0 = value=()
    //     0x37617c: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x376180: ldur            x0, [fp, #-0x10]
    // 0x376184: LoadField: r2 = r0->field_bb
    //     0x376184: ldur            w2, [x0, #0xbb]
    // 0x376188: DecompressPointer r2
    //     0x376188: add             x2, x2, HEAP, lsl #32
    // 0x37618c: stur            x2, [fp, #-0x28]
    // 0x376190: r3 = 0
    //     0x376190: mov             x3, #0
    // 0x376194: stur            x3, [fp, #-0x20]
    // 0x376198: CheckStackOverflow
    //     0x376198: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37619c: cmp             SP, x16
    //     0x3761a0: b.ls            #0x37679c
    // 0x3761a4: LoadField: r1 = r0->field_b3
    //     0x3761a4: ldur            x1, [x0, #0xb3]
    // 0x3761a8: cmp             x3, x1
    // 0x3761ac: b.ge            #0x37669c
    // 0x3761b0: LoadField: r1 = r0->field_1f
    //     0x3761b0: ldur            w1, [x0, #0x1f]
    // 0x3761b4: DecompressPointer r1
    //     0x3761b4: add             x1, x1, HEAP, lsl #32
    // 0x3761b8: cmp             w1, NULL
    // 0x3761bc: b.ne            #0x3761f4
    // 0x3761c0: mov             x1, x0
    // 0x3761c4: r0 = createComponentSet()
    //     0x3761c4: bl              #0x2a2ac4  ; [package:flame/src/components/core/component.dart] Component::createComponentSet
    // 0x3761c8: mov             x1, x0
    // 0x3761cc: ldur            x3, [fp, #-0x10]
    // 0x3761d0: StoreField: r3->field_1f = r0
    //     0x3761d0: stur            w0, [x3, #0x1f]
    //     0x3761d4: ldurb           w16, [x3, #-1]
    //     0x3761d8: ldurb           w17, [x0, #-1]
    //     0x3761dc: and             x16, x17, x16, lsr #2
    //     0x3761e0: tst             x16, HEAP, lsr #32
    //     0x3761e4: b.eq            #0x3761ec
    //     0x3761e8: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x3761ec: mov             x0, x1
    // 0x3761f0: b               #0x3761fc
    // 0x3761f4: mov             x3, x0
    // 0x3761f8: mov             x0, x1
    // 0x3761fc: stur            x0, [fp, #-0x38]
    // 0x376200: LoadField: r4 = r0->field_b
    //     0x376200: ldur            w4, [x0, #0xb]
    // 0x376204: DecompressPointer r4
    //     0x376204: add             x4, x4, HEAP, lsl #32
    // 0x376208: mov             x1, x4
    // 0x37620c: stur            x4, [fp, #-0x30]
    // 0x376210: r2 = Monster
    //     0x376210: add             x2, PP, #0xc, lsl #12  ; [pp+0xc830] Type: Monster
    //     0x376214: ldr             x2, [x2, #0x830]
    // 0x376218: r0 = _getValueOrData()
    //     0x376218: bl              #0x23b838  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::_getValueOrData
    // 0x37621c: mov             x1, x0
    // 0x376220: ldur            x0, [fp, #-0x30]
    // 0x376224: LoadField: r2 = r0->field_f
    //     0x376224: ldur            w2, [x0, #0xf]
    // 0x376228: DecompressPointer r2
    //     0x376228: add             x2, x2, HEAP, lsl #32
    // 0x37622c: cmp             w2, w1
    // 0x376230: b.ne            #0x37623c
    // 0x376234: r0 = Null
    //     0x376234: mov             x0, NULL
    // 0x376238: b               #0x376240
    // 0x37623c: mov             x0, x1
    // 0x376240: cmp             w0, NULL
    // 0x376244: b.eq            #0x37627c
    // 0x376248: LoadField: r3 = r0->field_b
    //     0x376248: ldur            w3, [x0, #0xb]
    // 0x37624c: DecompressPointer r3
    //     0x37624c: add             x3, x3, HEAP, lsl #32
    // 0x376250: mov             x0, x3
    // 0x376254: stur            x3, [fp, #-0x30]
    // 0x376258: r2 = Null
    //     0x376258: mov             x2, NULL
    // 0x37625c: r1 = Null
    //     0x37625c: mov             x1, NULL
    // 0x376260: r8 = Iterable<Monster>
    //     0x376260: add             x8, PP, #0xc, lsl #12  ; [pp+0xc838] Type: Iterable<Monster>
    //     0x376264: ldr             x8, [x8, #0x838]
    // 0x376268: r3 = Null
    //     0x376268: add             x3, PP, #0xd, lsl #12  ; [pp+0xd338] Null
    //     0x37626c: ldr             x3, [x3, #0x338]
    // 0x376270: r0 = Iterable<Monster>()
    //     0x376270: bl              #0x37e6b8  ; IsType_Iterable<Monster>_Stub
    // 0x376274: ldur            x1, [fp, #-0x30]
    // 0x376278: b               #0x376298
    // 0x37627c: r16 = <Monster>
    //     0x37627c: add             x16, PP, #0xc, lsl #12  ; [pp+0xc778] TypeArguments: <Monster>
    //     0x376280: ldr             x16, [x16, #0x778]
    // 0x376284: ldur            lr, [fp, #-0x38]
    // 0x376288: stp             lr, x16, [SP]
    // 0x37628c: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x37628c: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x376290: r0 = whereType()
    //     0x376290: bl              #0x430d58  ; [dart:_compact_hash] __Set&_HashVMBase&SetMixin::whereType
    // 0x376294: mov             x1, x0
    // 0x376298: r0 = LoadClassIdInstr(r1)
    //     0x376298: ldur            x0, [x1, #-1]
    //     0x37629c: ubfx            x0, x0, #0xc, #0x14
    // 0x3762a0: r0 = GDT[cid_x0 + 0xfc4]()
    //     0x3762a0: add             lr, x0, #0xfc4
    //     0x3762a4: ldr             lr, [x21, lr, lsl #3]
    //     0x3762a8: blr             lr
    // 0x3762ac: mov             x2, x0
    // 0x3762b0: stur            x2, [fp, #-0x30]
    // 0x3762b4: CheckStackOverflow
    //     0x3762b4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3762b8: cmp             SP, x16
    //     0x3762bc: b.ls            #0x3767a4
    // 0x3762c0: r0 = LoadClassIdInstr(r2)
    //     0x3762c0: ldur            x0, [x2, #-1]
    //     0x3762c4: ubfx            x0, x0, #0xc, #0x14
    // 0x3762c8: mov             x1, x2
    // 0x3762cc: r0 = GDT[cid_x0 + -0x1000]()
    //     0x3762cc: sub             lr, x0, #1, lsl #12
    //     0x3762d0: ldr             lr, [x21, lr, lsl #3]
    //     0x3762d4: blr             lr
    // 0x3762d8: tbnz            w0, #4, #0x376308
    // 0x3762dc: ldur            x2, [fp, #-0x30]
    // 0x3762e0: r0 = LoadClassIdInstr(r2)
    //     0x3762e0: ldur            x0, [x2, #-1]
    //     0x3762e4: ubfx            x0, x0, #0xc, #0x14
    // 0x3762e8: mov             x1, x2
    // 0x3762ec: r0 = GDT[cid_x0 + -0xfe0]()
    //     0x3762ec: sub             lr, x0, #0xfe0
    //     0x3762f0: ldr             lr, [x21, lr, lsl #3]
    //     0x3762f4: blr             lr
    // 0x3762f8: mov             x1, x0
    // 0x3762fc: r0 = moveDown()
    //     0x3762fc: bl              #0x37dea4  ; [package:ricochlime/flame/components/monster.dart] Monster::moveDown
    // 0x376300: ldur            x2, [fp, #-0x30]
    // 0x376304: b               #0x3762b4
    // 0x376308: r0 = LoadStaticField(0x868)
    //     0x376308: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37630c: ldr             x0, [x0, #0x10d0]
    // 0x376310: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376314: cmp             w0, w16
    // 0x376318: b.ne            #0x376328
    // 0x37631c: r2 = score
    //     0x37631c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc780] Field <RicochlimeGame.score>: static late final (offset: 0x868)
    //     0x376320: ldr             x2, [x2, #0x780]
    // 0x376324: r0 = InitLateFinalStaticField()
    //     0x376324: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x376328: mov             x2, x0
    // 0x37632c: stur            x2, [fp, #-0x38]
    // 0x376330: LoadField: r3 = r2->field_27
    //     0x376330: ldur            w3, [x2, #0x27]
    // 0x376334: DecompressPointer r3
    //     0x376334: add             x3, x3, HEAP, lsl #32
    // 0x376338: r0 = LoadInt32Instr(r3)
    //     0x376338: sbfx            x0, x3, #1, #0x1f
    //     0x37633c: tbz             w3, #0, #0x376344
    //     0x376340: ldur            x0, [x3, #7]
    // 0x376344: add             x4, x0, #1
    // 0x376348: r0 = BoxInt64Instr(r4)
    //     0x376348: sbfiz           x0, x4, #1, #0x1f
    //     0x37634c: cmp             x4, x0, asr #1
    //     0x376350: b.eq            #0x37635c
    //     0x376354: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x376358: stur            x4, [x0, #7]
    // 0x37635c: mov             x1, x0
    // 0x376360: stur            x1, [fp, #-0x30]
    // 0x376364: r0 = 60
    //     0x376364: mov             x0, #0x3c
    // 0x376368: branchIfSmi(r3, 0x376374)
    //     0x376368: tbz             w3, #0, #0x376374
    // 0x37636c: r0 = LoadClassIdInstr(r3)
    //     0x37636c: ldur            x0, [x3, #-1]
    //     0x376370: ubfx            x0, x0, #0xc, #0x14
    // 0x376374: stp             x1, x3, [SP]
    // 0x376378: mov             lr, x0
    // 0x37637c: ldr             lr, [x21, lr, lsl #3]
    // 0x376380: blr             lr
    // 0x376384: tbz             w0, #4, #0x3763b8
    // 0x376388: ldur            x2, [fp, #-0x38]
    // 0x37638c: ldur            x0, [fp, #-0x30]
    // 0x376390: StoreField: r2->field_27 = r0
    //     0x376390: stur            w0, [x2, #0x27]
    //     0x376394: tbz             w0, #0, #0x3763b0
    //     0x376398: ldurb           w16, [x2, #-1]
    //     0x37639c: ldurb           w17, [x0, #-1]
    //     0x3763a0: and             x16, x17, x16, lsr #2
    //     0x3763a4: tst             x16, HEAP, lsr #32
    //     0x3763a8: b.eq            #0x3763b0
    //     0x3763ac: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x3763b0: mov             x1, x2
    // 0x3763b4: r0 = notifyListeners()
    //     0x3763b4: bl              #0x26f8b4  ; [package:flutter/src/foundation/change_notifier.dart] ChangeNotifier::notifyListeners
    // 0x3763b8: ldur            x0, [fp, #-0x38]
    // 0x3763bc: ldur            x1, [fp, #-0x10]
    // 0x3763c0: LoadField: r0 = r1->field_a7
    //     0x3763c0: ldur            w0, [x1, #0xa7]
    // 0x3763c4: DecompressPointer r0
    //     0x3763c4: add             x0, x0, HEAP, lsl #32
    // 0x3763c8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3763cc: cmp             w0, w16
    // 0x3763d0: b.ne            #0x3763e0
    // 0x3763d4: r2 = random
    //     0x3763d4: add             x2, PP, #0xd, lsl #12  ; [pp+0xd090] Field <RicochlimeGame.random>: late (offset: 0xa8)
    //     0x3763d8: ldr             x2, [x2, #0x90]
    // 0x3763dc: r0 = InitLateInstanceField()
    //     0x3763dc: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3763e0: mov             x1, x0
    // 0x3763e4: ldur            x0, [fp, #-0x38]
    // 0x3763e8: LoadField: r2 = r0->field_27
    //     0x3763e8: ldur            w2, [x0, #0x27]
    // 0x3763ec: DecompressPointer r2
    //     0x3763ec: add             x2, x2, HEAP, lsl #32
    // 0x3763f0: r0 = LoadInt32Instr(r2)
    //     0x3763f0: sbfx            x0, x2, #1, #0x1f
    //     0x3763f4: tbz             w2, #0, #0x3763fc
    //     0x3763f8: ldur            x0, [x2, #7]
    // 0x3763fc: mov             x2, x1
    // 0x376400: mov             x1, x0
    // 0x376404: r0 = createNewRow()
    //     0x376404: bl              #0x37d918  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::createNewRow
    // 0x376408: r1 = <Monster>
    //     0x376408: add             x1, PP, #0xc, lsl #12  ; [pp+0xc778] TypeArguments: <Monster>
    //     0x37640c: ldr             x1, [x1, #0x778]
    // 0x376410: stur            x0, [fp, #-0x30]
    // 0x376414: r0 = NonNullsIterable()
    //     0x376414: bl              #0x37d90c  ; AllocateNonNullsIterableStub -> NonNullsIterable<X0> (size=0x10)
    // 0x376418: mov             x1, x0
    // 0x37641c: ldur            x0, [fp, #-0x30]
    // 0x376420: StoreField: r1->field_b = r0
    //     0x376420: stur            w0, [x1, #0xb]
    // 0x376424: r0 = iterator()
    //     0x376424: bl              #0x4a1450  ; [dart:_internal] NonNullsIterable::iterator
    // 0x376428: mov             x2, x0
    // 0x37642c: stur            x2, [fp, #-0x38]
    // 0x376430: CheckStackOverflow
    //     0x376430: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x376434: cmp             SP, x16
    //     0x376438: b.ls            #0x3767ac
    // 0x37643c: r0 = LoadClassIdInstr(r2)
    //     0x37643c: ldur            x0, [x2, #-1]
    //     0x376440: ubfx            x0, x0, #0xc, #0x14
    // 0x376444: mov             x1, x2
    // 0x376448: r0 = GDT[cid_x0 + -0x1000]()
    //     0x376448: sub             lr, x0, #1, lsl #12
    //     0x37644c: ldr             lr, [x21, lr, lsl #3]
    //     0x376450: blr             lr
    // 0x376454: tbnz            w0, #4, #0x376488
    // 0x376458: ldur            x2, [fp, #-0x38]
    // 0x37645c: r0 = LoadClassIdInstr(r2)
    //     0x37645c: ldur            x0, [x2, #-1]
    //     0x376460: ubfx            x0, x0, #0xc, #0x14
    // 0x376464: mov             x1, x2
    // 0x376468: r0 = GDT[cid_x0 + -0xfe0]()
    //     0x376468: sub             lr, x0, #0xfe0
    //     0x37646c: ldr             lr, [x21, lr, lsl #3]
    //     0x376470: blr             lr
    // 0x376474: ldur            x1, [fp, #-0x10]
    // 0x376478: mov             x2, x0
    // 0x37647c: r0 = _addChild()
    //     0x37647c: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x376480: ldur            x2, [fp, #-0x38]
    // 0x376484: b               #0x376430
    // 0x376488: ldur            x2, [fp, #-0x10]
    // 0x37648c: ldur            x0, [fp, #-0x30]
    // 0x376490: r1 = <Monster>
    //     0x376490: add             x1, PP, #0xc, lsl #12  ; [pp+0xc778] TypeArguments: <Monster>
    //     0x376494: ldr             x1, [x1, #0x778]
    // 0x376498: r0 = NonNullsIterable()
    //     0x376498: bl              #0x37d90c  ; AllocateNonNullsIterableStub -> NonNullsIterable<X0> (size=0x10)
    // 0x37649c: mov             x3, x0
    // 0x3764a0: ldur            x0, [fp, #-0x30]
    // 0x3764a4: stur            x3, [fp, #-0x38]
    // 0x3764a8: StoreField: r3->field_b = r0
    //     0x3764a8: stur            w0, [x3, #0xb]
    // 0x3764ac: r1 = Function '<anonymous closure>':.
    //     0x3764ac: add             x1, PP, #0xd, lsl #12  ; [pp+0xd348] AnonymousClosure: (0x37dfd0), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::spawnNewMonsters (0x37610c)
    //     0x3764b0: ldr             x1, [x1, #0x348]
    // 0x3764b4: r2 = Null
    //     0x3764b4: mov             x2, NULL
    // 0x3764b8: r0 = AllocateClosure()
    //     0x3764b8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3764bc: ldur            x2, [fp, #-0x38]
    // 0x3764c0: mov             x3, x0
    // 0x3764c4: r1 = <Future<void?>, Monster, Future<void?>>
    //     0x3764c4: add             x1, PP, #0xd, lsl #12  ; [pp+0xd350] TypeArguments: <Future<void?>, Monster, Future<void?>>
    //     0x3764c8: ldr             x1, [x1, #0x350]
    // 0x3764cc: r0 = MappedIterable()
    //     0x3764cc: bl              #0x313c84  ; [dart:_internal] MappedIterable::MappedIterable
    // 0x3764d0: r16 = <void?>
    //     0x3764d0: ldr             x16, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x3764d4: stp             x0, x16, [SP]
    // 0x3764d8: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x3764d8: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x3764dc: r0 = wait()
    //     0x3764dc: bl              #0x263a08  ; [dart:async] Future::wait
    // 0x3764e0: mov             x1, x0
    // 0x3764e4: stur            x1, [fp, #-0x38]
    // 0x3764e8: r0 = Await()
    //     0x3764e8: bl              #0x255470  ; AwaitStub
    // 0x3764ec: ldur            x0, [fp, #-0x10]
    // 0x3764f0: LoadField: r1 = r0->field_a3
    //     0x3764f0: ldur            w1, [x0, #0xa3]
    // 0x3764f4: DecompressPointer r1
    //     0x3764f4: add             x1, x1, HEAP, lsl #32
    // 0x3764f8: tbz             w1, #4, #0x376694
    // 0x3764fc: ldur            x2, [fp, #-0x30]
    // 0x376500: LoadField: r1 = r2->field_b
    //     0x376500: ldur            w1, [x2, #0xb]
    // 0x376504: r3 = LoadInt32Instr(r1)
    //     0x376504: sbfx            x3, x1, #1, #0x1f
    // 0x376508: stur            x3, [fp, #-0x48]
    // 0x37650c: r1 = 0
    //     0x37650c: mov             x1, #0
    // 0x376510: CheckStackOverflow
    //     0x376510: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x376514: cmp             SP, x16
    //     0x376518: b.ls            #0x3767b4
    // 0x37651c: LoadField: r4 = r2->field_b
    //     0x37651c: ldur            w4, [x2, #0xb]
    // 0x376520: r5 = LoadInt32Instr(r4)
    //     0x376520: sbfx            x5, x4, #1, #0x1f
    // 0x376524: LoadField: r4 = r2->field_f
    //     0x376524: ldur            w4, [x2, #0xf]
    // 0x376528: DecompressPointer r4
    //     0x376528: add             x4, x4, HEAP, lsl #32
    // 0x37652c: CheckStackOverflow
    //     0x37652c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x376530: cmp             SP, x16
    //     0x376534: b.ls            #0x3767bc
    // 0x376538: cmp             x3, x5
    // 0x37653c: b.ne            #0x376774
    // 0x376540: cmp             x1, x5
    // 0x376544: b.ge            #0x376588
    // 0x376548: ArrayLoad: r6 = r4[r1]  ; Unknown_4
    //     0x376548: add             x16, x4, x1, lsl #2
    //     0x37654c: ldur            w6, [x16, #0xf]
    // 0x376550: DecompressPointer r6
    //     0x376550: add             x6, x6, HEAP, lsl #32
    // 0x376554: add             x7, x1, #1
    // 0x376558: stur            x7, [fp, #-0x40]
    // 0x37655c: cmp             w6, NULL
    // 0x376560: b.ne            #0x37656c
    // 0x376564: mov             x1, x7
    // 0x376568: b               #0x37652c
    // 0x37656c: mov             x1, x6
    // 0x376570: r0 = moveInFromTop()
    //     0x376570: bl              #0x37d414  ; [package:ricochlime/flame/components/monster.dart] Monster::moveInFromTop
    // 0x376574: ldur            x1, [fp, #-0x40]
    // 0x376578: ldur            x0, [fp, #-0x10]
    // 0x37657c: ldur            x2, [fp, #-0x30]
    // 0x376580: ldur            x3, [fp, #-0x48]
    // 0x376584: b               #0x376510
    // 0x376588: ldur            x2, [fp, #-0x18]
    // 0x37658c: r1 = Function '<anonymous closure>':.
    //     0x37658c: add             x1, PP, #0xd, lsl #12  ; [pp+0xd358] AnonymousClosure: (0x37df9c), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::spawnNewMonsters (0x37610c)
    //     0x376590: ldr             x1, [x1, #0x358]
    // 0x376594: r0 = AllocateClosure()
    //     0x376594: bl              #0x5838bc  ; AllocateClosureStub
    // 0x376598: str             x0, [SP]
    // 0x37659c: ldur            x1, [fp, #-0x28]
    // 0x3765a0: r2 = Instance_Duration
    //     0x3765a0: ldr             x2, [PP, #0x2700]  ; [pp+0x2700] Obj!Duration@5dcca1
    // 0x3765a4: r4 = const [0, 0x3, 0x1, 0x2, onTick, 0x2, null]
    //     0x3765a4: add             x4, PP, #0xd, lsl #12  ; [pp+0xd360] List(7) [0, 0x3, 0x1, 0x2, "onTick", 0x2, Null]
    //     0x3765a8: ldr             x4, [x4, #0x360]
    // 0x3765ac: r0 = delayed()
    //     0x3765ac: bl              #0x37e964  ; [package:ricochlime/flame/ticker.dart] Ticker::delayed
    // 0x3765b0: mov             x1, x0
    // 0x3765b4: stur            x1, [fp, #-0x38]
    // 0x3765b8: r0 = Await()
    //     0x3765b8: bl              #0x255470  ; AwaitStub
    // 0x3765bc: ldur            x0, [fp, #-0x10]
    // 0x3765c0: LoadField: r1 = r0->field_a3
    //     0x3765c0: ldur            w1, [x0, #0xa3]
    // 0x3765c4: DecompressPointer r1
    //     0x3765c4: add             x1, x1, HEAP, lsl #32
    // 0x3765c8: tbz             w1, #4, #0x37668c
    // 0x3765cc: mov             x1, x0
    // 0x3765d0: r0 = isGameOver()
    //     0x3765d0: bl              #0x371f40  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::isGameOver
    // 0x3765d4: tbz             w0, #4, #0x3765ec
    // 0x3765d8: ldur            x0, [fp, #-0x20]
    // 0x3765dc: add             x3, x0, #1
    // 0x3765e0: ldur            x0, [fp, #-0x10]
    // 0x3765e4: ldur            x2, [fp, #-0x28]
    // 0x3765e8: b               #0x376194
    // 0x3765ec: r0 = LoadStaticField(0xccc)
    //     0x3765ec: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3765f0: ldr             x0, [x0, #0x1998]
    // 0x3765f4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3765f8: cmp             w0, w16
    // 0x3765fc: b.ne            #0x37660c
    // 0x376600: r2 = stows
    //     0x376600: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x376604: ldr             x2, [x2, #0x310]
    // 0x376608: r0 = InitLateFinalStaticField()
    //     0x376608: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37660c: LoadField: r2 = r0->field_4b
    //     0x37660c: ldur            w2, [x0, #0x4b]
    // 0x376610: DecompressPointer r2
    //     0x376610: add             x2, x2, HEAP, lsl #32
    // 0x376614: mov             x1, x2
    // 0x376618: stur            x2, [fp, #-0x28]
    // 0x37661c: LoadField: r0 = r1->field_43
    //     0x37661c: ldur            w0, [x1, #0x43]
    // 0x376620: DecompressPointer r0
    //     0x376620: add             x0, x0, HEAP, lsl #32
    // 0x376624: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376628: cmp             w0, w16
    // 0x37662c: b.ne            #0x37663c
    // 0x376630: r2 = _value
    //     0x376630: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x376634: ldr             x2, [x2, #0x4b0]
    // 0x376638: r0 = InitLateInstanceField()
    //     0x376638: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x37663c: r1 = LoadInt32Instr(r0)
    //     0x37663c: sbfx            x1, x0, #1, #0x1f
    //     0x376640: tbz             w0, #0, #0x376648
    //     0x376644: ldur            x1, [x0, #7]
    // 0x376648: add             x2, x1, #1
    // 0x37664c: r0 = BoxInt64Instr(r2)
    //     0x37664c: sbfiz           x0, x2, #1, #0x1f
    //     0x376650: cmp             x2, x0, asr #1
    //     0x376654: b.eq            #0x376660
    //     0x376658: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x37665c: stur            x2, [x0, #7]
    // 0x376660: ldur            x1, [fp, #-0x28]
    // 0x376664: mov             x2, x0
    // 0x376668: r0 = value=()
    //     0x376668: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x37666c: ldur            x1, [fp, #-0x10]
    // 0x376670: r0 = saveGame()
    //     0x376670: bl              #0x37d014  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::saveGame
    // 0x376674: r0 = Shader._()
    //     0x376674: bl              #0x56ea68  ; [dart:ui] Shader::Shader._
    // 0x376678: ldur            x1, [fp, #-0x10]
    // 0x37667c: r0 = gameOver()
    //     0x37667c: bl              #0x376b2c  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::gameOver
    // 0x376680: r0 = Shader._()
    //     0x376680: bl              #0x56ea68  ; [dart:ui] Shader::Shader._
    // 0x376684: r0 = Null
    //     0x376684: mov             x0, NULL
    // 0x376688: r0 = ReturnAsyncNotFuture()
    //     0x376688: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37668c: r0 = Null
    //     0x37668c: mov             x0, NULL
    // 0x376690: r0 = ReturnAsyncNotFuture()
    //     0x376690: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x376694: r0 = Null
    //     0x376694: mov             x0, NULL
    // 0x376698: r0 = ReturnAsyncNotFuture()
    //     0x376698: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37669c: mov             x1, x0
    // 0x3766a0: r0 = LoadStaticField(0x868)
    //     0x3766a0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3766a4: ldr             x0, [x0, #0x10d0]
    // 0x3766a8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3766ac: cmp             w0, w16
    // 0x3766b0: b.ne            #0x3766c0
    // 0x3766b4: r2 = score
    //     0x3766b4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc780] Field <RicochlimeGame.score>: static late final (offset: 0x868)
    //     0x3766b8: ldr             x2, [x2, #0x780]
    // 0x3766bc: r0 = InitLateFinalStaticField()
    //     0x3766bc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3766c0: LoadField: r1 = r0->field_27
    //     0x3766c0: ldur            w1, [x0, #0x27]
    // 0x3766c4: DecompressPointer r1
    //     0x3766c4: add             x1, x1, HEAP, lsl #32
    // 0x3766c8: r0 = LoadInt32Instr(r1)
    //     0x3766c8: sbfx            x0, x1, #1, #0x1f
    //     0x3766cc: tbz             w1, #0, #0x3766d4
    //     0x3766d0: ldur            x0, [x1, #7]
    // 0x3766d4: mov             x1, x0
    // 0x3766d8: r0 = getNumNewRowsEachRound()
    //     0x3766d8: bl              #0x371eec  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::getNumNewRowsEachRound
    // 0x3766dc: mov             x1, x0
    // 0x3766e0: ldur            x0, [fp, #-0x10]
    // 0x3766e4: StoreField: r0->field_b3 = r1
    //     0x3766e4: stur            x1, [x0, #0xb3]
    // 0x3766e8: mov             x1, x0
    // 0x3766ec: LoadField: r0 = r1->field_8f
    //     0x3766ec: ldur            w0, [x1, #0x8f]
    // 0x3766f0: DecompressPointer r0
    //     0x3766f0: add             x0, x0, HEAP, lsl #32
    // 0x3766f4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3766f8: cmp             w0, w16
    // 0x3766fc: b.ne            #0x37670c
    // 0x376700: r2 = state
    //     0x376700: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x376704: ldr             x2, [x2, #0x790]
    // 0x376708: r0 = InitLateFinalInstanceField()
    //     0x376708: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37670c: mov             x1, x0
    // 0x376710: r2 = Instance_GameState
    //     0x376710: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x376714: ldr             x2, [x2, #0x798]
    // 0x376718: r0 = value=()
    //     0x376718: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x37671c: ldur            x1, [fp, #-0x10]
    // 0x376720: LoadField: r0 = r1->field_97
    //     0x376720: ldur            w0, [x1, #0x97]
    // 0x376724: DecompressPointer r0
    //     0x376724: add             x0, x0, HEAP, lsl #32
    // 0x376728: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37672c: cmp             w0, w16
    // 0x376730: b.ne            #0x376740
    // 0x376734: r2 = aimGuide
    //     0x376734: add             x2, PP, #0xc, lsl #12  ; [pp+0xc708] Field <RicochlimeGame.aimGuide>: late final (offset: 0x98)
    //     0x376738: ldr             x2, [x2, #0x708]
    // 0x37673c: r0 = InitLateFinalInstanceField()
    //     0x37673c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x376740: LoadField: r2 = r0->field_4f
    //     0x376740: ldur            w2, [x0, #0x4f]
    // 0x376744: DecompressPointer r2
    //     0x376744: add             x2, x2, HEAP, lsl #32
    // 0x376748: cmp             w2, NULL
    // 0x37674c: b.eq            #0x376758
    // 0x376750: mov             x1, x0
    // 0x376754: r0 = aim()
    //     0x376754: bl              #0x3767c4  ; [package:ricochlime/flame/components/aim_guide.dart] AimGuide::aim
    // 0x376758: ldur            x1, [fp, #-0x10]
    // 0x37675c: r0 = saveGame()
    //     0x37675c: bl              #0x37d014  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::saveGame
    // 0x376760: mov             x1, x0
    // 0x376764: stur            x1, [fp, #-0x10]
    // 0x376768: r0 = Await()
    //     0x376768: bl              #0x255470  ; AwaitStub
    // 0x37676c: r0 = Null
    //     0x37676c: mov             x0, NULL
    // 0x376770: r0 = ReturnAsyncNotFuture()
    //     0x376770: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x376774: mov             x0, x2
    // 0x376778: r0 = ConcurrentModificationError()
    //     0x376778: bl              #0x2379bc  ; AllocateConcurrentModificationErrorStub -> ConcurrentModificationError (size=0x10)
    // 0x37677c: mov             x1, x0
    // 0x376780: ldur            x0, [fp, #-0x30]
    // 0x376784: StoreField: r1->field_b = r0
    //     0x376784: stur            w0, [x1, #0xb]
    // 0x376788: mov             x0, x1
    // 0x37678c: r0 = Throw()
    //     0x37678c: bl              #0x5827dc  ; ThrowStub
    // 0x376790: brk             #0
    // 0x376794: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x376794: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x376798: b               #0x37612c
    // 0x37679c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37679c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3767a0: b               #0x3761a4
    // 0x3767a4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3767a4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3767a8: b               #0x3762c0
    // 0x3767ac: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3767ac: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3767b0: b               #0x37643c
    // 0x3767b4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3767b4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3767b8: b               #0x37651c
    // 0x3767bc: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3767bc: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3767c0: b               #0x376538
  }
  _ gameOver(/* No info */) async {
    // ** addr: 0x376b2c, size: 0x7e4
    // 0x376b2c: EnterFrame
    //     0x376b2c: stp             fp, lr, [SP, #-0x10]!
    //     0x376b30: mov             fp, SP
    // 0x376b34: AllocStack(0x100)
    //     0x376b34: sub             SP, SP, #0x100
    // 0x376b38: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0xa0 */)
    //     0x376b38: stur            NULL, [fp, #-8]
    //     0x376b3c: stur            x1, [fp, #-0xa0]
    // 0x376b40: CheckStackOverflow
    //     0x376b40: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x376b44: cmp             SP, x16
    //     0x376b48: b.ls            #0x3772b8
    // 0x376b4c: InitAsync() -> Future<void?>
    //     0x376b4c: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x376b50: bl              #0x2556b4  ; InitAsyncStub
    // 0x376b54: ldur            x1, [fp, #-0xa0]
    // 0x376b58: LoadField: r0 = r1->field_8f
    //     0x376b58: ldur            w0, [x1, #0x8f]
    // 0x376b5c: DecompressPointer r0
    //     0x376b5c: add             x0, x0, HEAP, lsl #32
    // 0x376b60: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376b64: cmp             w0, w16
    // 0x376b68: b.ne            #0x376b78
    // 0x376b6c: r2 = state
    //     0x376b6c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x376b70: ldr             x2, [x2, #0x790]
    // 0x376b74: r0 = InitLateFinalInstanceField()
    //     0x376b74: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x376b78: mov             x1, x0
    // 0x376b7c: r2 = Instance_GameState
    //     0x376b7c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x376b80: ldr             x2, [x2, #0x7c8]
    // 0x376b84: r0 = value=()
    //     0x376b84: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x376b88: ldur            x0, [fp, #-0xa0]
    // 0x376b8c: LoadField: r1 = r0->field_1f
    //     0x376b8c: ldur            w1, [x0, #0x1f]
    // 0x376b90: DecompressPointer r1
    //     0x376b90: add             x1, x1, HEAP, lsl #32
    // 0x376b94: cmp             w1, NULL
    // 0x376b98: b.ne            #0x376bd0
    // 0x376b9c: mov             x1, x0
    // 0x376ba0: r0 = createComponentSet()
    //     0x376ba0: bl              #0x2a2ac4  ; [package:flame/src/components/core/component.dart] Component::createComponentSet
    // 0x376ba4: mov             x1, x0
    // 0x376ba8: ldur            x2, [fp, #-0xa0]
    // 0x376bac: StoreField: r2->field_1f = r0
    //     0x376bac: stur            w0, [x2, #0x1f]
    //     0x376bb0: ldurb           w16, [x2, #-1]
    //     0x376bb4: ldurb           w17, [x0, #-1]
    //     0x376bb8: and             x16, x17, x16, lsr #2
    //     0x376bbc: tst             x16, HEAP, lsr #32
    //     0x376bc0: b.eq            #0x376bc8
    //     0x376bc4: bl              #0x582c64  ; WriteBarrierWrappersStub
    // 0x376bc8: mov             x0, x1
    // 0x376bcc: b               #0x376bd8
    // 0x376bd0: mov             x2, x0
    // 0x376bd4: mov             x0, x1
    // 0x376bd8: r16 = <Monster>
    //     0x376bd8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc778] TypeArguments: <Monster>
    //     0x376bdc: ldr             x16, [x16, #0x778]
    // 0x376be0: stp             x0, x16, [SP]
    // 0x376be4: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x376be4: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x376be8: r0 = whereType()
    //     0x376be8: bl              #0x30f5cc  ; [dart:mixin_deduplication] _MixinApplication503&OrderedSet&QueryableOrderedSetImpl::whereType
    // 0x376bec: r1 = LoadClassIdInstr(r0)
    //     0x376bec: ldur            x1, [x0, #-1]
    //     0x376bf0: ubfx            x1, x1, #0xc, #0x14
    // 0x376bf4: mov             x16, x0
    // 0x376bf8: mov             x0, x1
    // 0x376bfc: mov             x1, x16
    // 0x376c00: r0 = GDT[cid_x0 + 0xfc4]()
    //     0x376c00: add             lr, x0, #0xfc4
    //     0x376c04: ldr             lr, [x21, lr, lsl #3]
    //     0x376c08: blr             lr
    // 0x376c0c: mov             x2, x0
    // 0x376c10: stur            x2, [fp, #-0xb0]
    // 0x376c14: r3 = false
    //     0x376c14: add             x3, NULL, #0x30  ; false
    // 0x376c18: stur            x3, [fp, #-0xa8]
    // 0x376c1c: CheckStackOverflow
    //     0x376c1c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x376c20: cmp             SP, x16
    //     0x376c24: b.ls            #0x3772c0
    // 0x376c28: r0 = LoadClassIdInstr(r2)
    //     0x376c28: ldur            x0, [x2, #-1]
    //     0x376c2c: ubfx            x0, x0, #0xc, #0x14
    // 0x376c30: mov             x1, x2
    // 0x376c34: r0 = GDT[cid_x0 + -0x1000]()
    //     0x376c34: sub             lr, x0, #1, lsl #12
    //     0x376c38: ldr             lr, [x21, lr, lsl #3]
    //     0x376c3c: blr             lr
    // 0x376c40: tbnz            w0, #4, #0x376cbc
    // 0x376c44: ldur            x2, [fp, #-0xb0]
    // 0x376c48: r0 = LoadClassIdInstr(r2)
    //     0x376c48: ldur            x0, [x2, #-1]
    //     0x376c4c: ubfx            x0, x0, #0xc, #0x14
    // 0x376c50: mov             x1, x2
    // 0x376c54: r0 = GDT[cid_x0 + -0xfe0]()
    //     0x376c54: sub             lr, x0, #0xfe0
    //     0x376c58: ldr             lr, [x21, lr, lsl #3]
    //     0x376c5c: blr             lr
    // 0x376c60: mov             x1, x0
    // 0x376c64: stur            x0, [fp, #-0xb8]
    // 0x376c68: LoadField: r0 = r1->field_93
    //     0x376c68: ldur            w0, [x1, #0x93]
    // 0x376c6c: DecompressPointer r0
    //     0x376c6c: add             x0, x0, HEAP, lsl #32
    // 0x376c70: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376c74: cmp             w0, w16
    // 0x376c78: b.ne            #0x376c88
    // 0x376c7c: r2 = _animation
    //     0x376c7c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x376c80: ldr             x2, [x2, #0x7d0]
    // 0x376c84: r0 = InitLateFinalInstanceField()
    //     0x376c84: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x376c88: LoadField: r1 = r0->field_4f
    //     0x376c88: ldur            w1, [x0, #0x4f]
    // 0x376c8c: DecompressPointer r1
    //     0x376c8c: add             x1, x1, HEAP, lsl #32
    // 0x376c90: r16 = Instance_MonsterState
    //     0x376c90: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7d8] Obj!MonsterState@5d8b61
    //     0x376c94: ldr             x16, [x16, #0x7d8]
    // 0x376c98: cmp             w1, w16
    // 0x376c9c: b.ne            #0x376ca8
    // 0x376ca0: ldur            x3, [fp, #-0xa8]
    // 0x376ca4: b               #0x376cb4
    // 0x376ca8: ldur            x1, [fp, #-0xb8]
    // 0x376cac: r0 = startRagdoll()
    //     0x376cac: bl              #0x379068  ; [package:ricochlime/flame/components/monster.dart] Monster::startRagdoll
    // 0x376cb0: r3 = true
    //     0x376cb0: add             x3, NULL, #0x20  ; true
    // 0x376cb4: ldur            x2, [fp, #-0xb0]
    // 0x376cb8: b               #0x376c18
    // 0x376cbc: ldur            x0, [fp, #-0xa8]
    // 0x376cc0: tbnz            w0, #4, #0x376cec
    // 0x376cc4: ldur            x0, [fp, #-0xa0]
    // 0x376cc8: LoadField: r1 = r0->field_bb
    //     0x376cc8: ldur            w1, [x0, #0xbb]
    // 0x376ccc: DecompressPointer r1
    //     0x376ccc: add             x1, x1, HEAP, lsl #32
    // 0x376cd0: r2 = Instance_Duration
    //     0x376cd0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7e0] Obj!Duration@5dcd61
    //     0x376cd4: ldr             x2, [x2, #0x7e0]
    // 0x376cd8: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x376cd8: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x376cdc: r0 = delayed()
    //     0x376cdc: bl              #0x37e964  ; [package:ricochlime/flame/ticker.dart] Ticker::delayed
    // 0x376ce0: mov             x1, x0
    // 0x376ce4: stur            x1, [fp, #-0xa8]
    // 0x376ce8: r0 = Await()
    //     0x376ce8: bl              #0x255470  ; AwaitStub
    // 0x376cec: ldur            x0, [fp, #-0xa0]
    // 0x376cf0: LoadField: r1 = r0->field_bf
    //     0x376cf0: ldur            w1, [x0, #0xbf]
    // 0x376cf4: DecompressPointer r1
    //     0x376cf4: add             x1, x1, HEAP, lsl #32
    // 0x376cf8: cmp             w1, NULL
    // 0x376cfc: b.ne            #0x376d0c
    // 0x376d00: r0 = Instance_GameOverAction
    //     0x376d00: add             x0, PP, #0xc, lsl #12  ; [pp+0xc7e8] Obj!GameOverAction@5d8981
    //     0x376d04: ldr             x0, [x0, #0x7e8]
    // 0x376d08: b               #0x376d28
    // 0x376d0c: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x376d0c: ldur            w2, [x1, #0x17]
    // 0x376d10: DecompressPointer r2
    //     0x376d10: add             x2, x2, HEAP, lsl #32
    // 0x376d14: mov             x1, x2
    // 0x376d18: r0 = showGameOverDialog()
    //     0x376d18: bl              #0x37822c  ; [package:ricochlime/pages/play.dart] _PlayPageState::showGameOverDialog
    // 0x376d1c: mov             x1, x0
    // 0x376d20: stur            x1, [fp, #-0xa8]
    // 0x376d24: r0 = Await()
    //     0x376d24: bl              #0x255470  ; AwaitStub
    // 0x376d28: stur            x0, [fp, #-0xa8]
    // 0x376d2c: r0 = LoadStaticField(0x864)
    //     0x376d2c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x376d30: ldr             x0, [x0, #0x10c8]
    // 0x376d34: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376d38: cmp             w0, w16
    // 0x376d3c: b.ne            #0x376d4c
    // 0x376d40: r2 = log
    //     0x376d40: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7f0] Field <RicochlimeGame.log>: static late final (offset: 0x864)
    //     0x376d44: ldr             x2, [x2, #0x7f0]
    // 0x376d48: r0 = InitLateFinalStaticField()
    //     0x376d48: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x376d4c: r1 = Null
    //     0x376d4c: mov             x1, NULL
    // 0x376d50: r2 = 4
    //     0x376d50: mov             x2, #4
    // 0x376d54: stur            x0, [fp, #-0xb0]
    // 0x376d58: r0 = AllocateArray()
    //     0x376d58: bl              #0x5845d8  ; AllocateArrayStub
    // 0x376d5c: r16 = "gameOverAction: "
    //     0x376d5c: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7f8] "gameOverAction: "
    //     0x376d60: ldr             x16, [x16, #0x7f8]
    // 0x376d64: StoreField: r0->field_f = r16
    //     0x376d64: stur            w16, [x0, #0xf]
    // 0x376d68: ldur            x1, [fp, #-0xa8]
    // 0x376d6c: StoreField: r0->field_13 = r1
    //     0x376d6c: stur            w1, [x0, #0x13]
    // 0x376d70: str             x0, [SP]
    // 0x376d74: r0 = _interpolate()
    //     0x376d74: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x376d78: ldur            x1, [fp, #-0xb0]
    // 0x376d7c: mov             x2, x0
    // 0x376d80: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x376d80: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x376d84: r0 = info()
    //     0x376d84: bl              #0x287f24  ; [package:logging/src/logger.dart] Logger::info
    // 0x376d88: ldur            x0, [fp, #-0xa8]
    // 0x376d8c: LoadField: r1 = r0->field_7
    //     0x376d8c: ldur            x1, [x0, #7]
    // 0x376d90: cmp             x1, #1
    // 0x376d94: b.gt            #0x377274
    // 0x376d98: cmp             x1, #0
    // 0x376d9c: b.gt            #0x37726c
    // 0x376da0: ldur            x0, [fp, #-0xa0]
    // 0x376da4: mov             x1, x0
    // 0x376da8: LoadField: r0 = r1->field_8f
    //     0x376da8: ldur            w0, [x1, #0x8f]
    // 0x376dac: DecompressPointer r0
    //     0x376dac: add             x0, x0, HEAP, lsl #32
    // 0x376db0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376db4: cmp             w0, w16
    // 0x376db8: b.ne            #0x376dc8
    // 0x376dbc: r2 = state
    //     0x376dbc: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x376dc0: ldr             x2, [x2, #0x790]
    // 0x376dc4: r0 = InitLateFinalInstanceField()
    //     0x376dc4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x376dc8: mov             x1, x0
    // 0x376dcc: r2 = Instance_GameState
    //     0x376dcc: add             x2, PP, #0xc, lsl #12  ; [pp+0xc800] Obj!GameState@5d8a41
    //     0x376dd0: ldr             x2, [x2, #0x800]
    // 0x376dd4: r0 = value=()
    //     0x376dd4: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x376dd8: r0 = LoadStaticField(0xccc)
    //     0x376dd8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x376ddc: ldr             x0, [x0, #0x1998]
    // 0x376de0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376de4: cmp             w0, w16
    // 0x376de8: b.ne            #0x376df8
    // 0x376dec: r2 = stows
    //     0x376dec: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x376df0: ldr             x2, [x2, #0x310]
    // 0x376df4: r0 = InitLateFinalStaticField()
    //     0x376df4: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x376df8: LoadField: r1 = r0->field_7
    //     0x376df8: ldur            w1, [x0, #7]
    // 0x376dfc: DecompressPointer r1
    //     0x376dfc: add             x1, x1, HEAP, lsl #32
    // 0x376e00: LoadField: r0 = r1->field_43
    //     0x376e00: ldur            w0, [x1, #0x43]
    // 0x376e04: DecompressPointer r0
    //     0x376e04: add             x0, x0, HEAP, lsl #32
    // 0x376e08: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376e0c: cmp             w0, w16
    // 0x376e10: b.ne            #0x376e20
    // 0x376e14: r2 = _value
    //     0x376e14: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x376e18: ldr             x2, [x2, #0x4b0]
    // 0x376e1c: r0 = InitLateInstanceField()
    //     0x376e1c: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x376e20: r16 = false
    //     0x376e20: add             x16, NULL, #0x30  ; false
    // 0x376e24: str             x16, [SP]
    // 0x376e28: ldur            x1, [fp, #-0xa0]
    // 0x376e2c: mov             x2, x0
    // 0x376e30: r4 = const [0, 0x3, 0x1, 0x2, showGameOverDialog, 0x2, null]
    //     0x376e30: add             x4, PP, #0xc, lsl #12  ; [pp+0xc808] List(7) [0, 0x3, 0x1, 0x2, "showGameOverDialog", 0x2, Null]
    //     0x376e34: ldr             x4, [x4, #0x808]
    // 0x376e38: r0 = importFromGame()
    //     0x376e38: bl              #0x37193c  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::importFromGame
    // 0x376e3c: ldur            x2, [fp, #-0xa0]
    // 0x376e40: LoadField: r0 = r2->field_b3
    //     0x376e40: ldur            x0, [x2, #0xb3]
    // 0x376e44: r16 = 3
    //     0x376e44: mov             x16, #3
    // 0x376e48: mul             x1, x0, x16
    // 0x376e4c: add             x0, x1, #1
    // 0x376e50: r1 = 5
    //     0x376e50: mov             x1, #5
    // 0x376e54: cmp             x0, x1
    // 0x376e58: csel            x3, x1, x0, lt
    // 0x376e5c: stur            x3, [fp, #-0xd0]
    // 0x376e60: r0 = BoxInt64Instr(r3)
    //     0x376e60: sbfiz           x0, x3, #1, #0x1f
    //     0x376e64: cmp             x3, x0, asr #1
    //     0x376e68: b.eq            #0x376e74
    //     0x376e6c: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x376e70: stur            x3, [x0, #7]
    // 0x376e74: stur            x0, [fp, #-0xb8]
    // 0x376e78: sub             x4, x3, #1
    // 0x376e7c: stur            x4, [fp, #-0xc8]
    // 0x376e80: LoadField: r5 = r2->field_bb
    //     0x376e80: ldur            w5, [x2, #0xbb]
    // 0x376e84: DecompressPointer r5
    //     0x376e84: add             x5, x5, HEAP, lsl #32
    // 0x376e88: stur            x5, [fp, #-0xa8]
    // 0x376e8c: r6 = 0
    //     0x376e8c: mov             x6, #0
    // 0x376e90: stur            x6, [fp, #-0xc0]
    // 0x376e94: CheckStackOverflow
    //     0x376e94: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x376e98: cmp             SP, x16
    //     0x376e9c: b.ls            #0x3772c8
    // 0x376ea0: cmp             x6, x3
    // 0x376ea4: b.ge            #0x377220
    // 0x376ea8: mov             x1, x2
    // 0x376eac: LoadField: r0 = r1->field_93
    //     0x376eac: ldur            w0, [x1, #0x93]
    // 0x376eb0: DecompressPointer r0
    //     0x376eb0: add             x0, x0, HEAP, lsl #32
    // 0x376eb4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x376eb8: cmp             w0, w16
    // 0x376ebc: b.ne            #0x376ecc
    // 0x376ec0: r2 = player
    //     0x376ec0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x376ec4: ldr             x2, [x2, #0x700]
    // 0x376ec8: r0 = InitLateFinalInstanceField()
    //     0x376ec8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x376ecc: mov             x1, x0
    // 0x376ed0: r0 = position()
    //     0x376ed0: bl              #0x378218  ; [package:flame/src/components/position_component.dart] PositionComponent::position
    // 0x376ed4: LoadField: r2 = r0->field_7
    //     0x376ed4: ldur            w2, [x0, #7]
    // 0x376ed8: DecompressPointer r2
    //     0x376ed8: add             x2, x2, HEAP, lsl #32
    // 0x376edc: LoadField: r0 = r2->field_13
    //     0x376edc: ldur            w0, [x2, #0x13]
    // 0x376ee0: r1 = LoadInt32Instr(r0)
    //     0x376ee0: sbfx            x1, x0, #1, #0x1f
    // 0x376ee4: mov             x0, x1
    // 0x376ee8: r1 = 1
    //     0x376ee8: mov             x1, #1
    // 0x376eec: cmp             x1, x0
    // 0x376ef0: b.hs            #0x3772d0
    // 0x376ef4: LoadField: d0 = r2->field_1b
    //     0x376ef4: ldur            s0, [x2, #0x1b]
    // 0x376ef8: fcvt            d1, s0
    // 0x376efc: d0 = 18.400000
    //     0x376efc: add             x17, PP, #0xc, lsl #12  ; [pp+0xc810] IMM: double(18.400000000000002) from 0x4032666666666667
    //     0x376f00: ldr             d0, [x17, #0x810]
    // 0x376f04: fadd            d2, d1, d0
    // 0x376f08: ldur            x0, [fp, #-0xc0]
    // 0x376f0c: scvtf           d1, x0
    // 0x376f10: d3 = 16.000000
    //     0x376f10: fmov            d3, #16.00000000
    // 0x376f14: fmul            d4, d1, d3
    // 0x376f18: fsub            d1, d2, d4
    // 0x376f1c: stur            d1, [fp, #-0xf0]
    // 0x376f20: r1 = Null
    //     0x376f20: mov             x1, NULL
    // 0x376f24: r2 = 14
    //     0x376f24: mov             x2, #0xe
    // 0x376f28: r0 = AllocateArray()
    //     0x376f28: bl              #0x5845d8  ; AllocateArrayStub
    // 0x376f2c: mov             x2, x0
    // 0x376f30: r16 = "Removing row "
    //     0x376f30: add             x16, PP, #0xc, lsl #12  ; [pp+0xc818] "Removing row "
    //     0x376f34: ldr             x16, [x16, #0x818]
    // 0x376f38: StoreField: r2->field_f = r16
    //     0x376f38: stur            w16, [x2, #0xf]
    // 0x376f3c: ldur            x3, [fp, #-0xc0]
    // 0x376f40: r0 = BoxInt64Instr(r3)
    //     0x376f40: sbfiz           x0, x3, #1, #0x1f
    //     0x376f44: cmp             x3, x0, asr #1
    //     0x376f48: b.eq            #0x376f54
    //     0x376f4c: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x376f50: stur            x3, [x0, #7]
    // 0x376f54: StoreField: r2->field_13 = r0
    //     0x376f54: stur            w0, [x2, #0x13]
    // 0x376f58: r16 = " out of "
    //     0x376f58: add             x16, PP, #0xc, lsl #12  ; [pp+0xc820] " out of "
    //     0x376f5c: ldr             x16, [x16, #0x820]
    // 0x376f60: ArrayStore: r2[0] = r16  ; List_4
    //     0x376f60: stur            w16, [x2, #0x17]
    // 0x376f64: ldur            x0, [fp, #-0xb8]
    // 0x376f68: StoreField: r2->field_1b = r0
    //     0x376f68: stur            w0, [x2, #0x1b]
    // 0x376f6c: r16 = " (monsters with y > "
    //     0x376f6c: add             x16, PP, #0xc, lsl #12  ; [pp+0xc828] " (monsters with y > "
    //     0x376f70: ldr             x16, [x16, #0x828]
    // 0x376f74: StoreField: r2->field_1f = r16
    //     0x376f74: stur            w16, [x2, #0x1f]
    // 0x376f78: ldur            d0, [fp, #-0xf0]
    // 0x376f7c: r1 = inline_Allocate_Double()
    //     0x376f7c: ldp             x1, x4, [THR, #0x60]  ; THR::top
    //     0x376f80: add             x1, x1, #0x10
    //     0x376f84: cmp             x4, x1
    //     0x376f88: b.ls            #0x3772d4
    //     0x376f8c: str             x1, [THR, #0x60]  ; THR::top
    //     0x376f90: sub             x1, x1, #0xf
    //     0x376f94: mov             x4, #0xe19c
    //     0x376f98: movk            x4, #3, lsl #16
    //     0x376f9c: stur            x4, [x1, #-1]
    // 0x376fa0: dmb             ishst
    // 0x376fa4: StoreField: r1->field_7 = d0
    //     0x376fa4: stur            d0, [x1, #7]
    // 0x376fa8: StoreField: r2->field_23 = r1
    //     0x376fa8: stur            w1, [x2, #0x23]
    // 0x376fac: r16 = ")"
    //     0x376fac: ldr             x16, [PP, #0x28c8]  ; [pp+0x28c8] ")"
    // 0x376fb0: StoreField: r2->field_27 = r16
    //     0x376fb0: stur            w16, [x2, #0x27]
    // 0x376fb4: str             x2, [SP]
    // 0x376fb8: r0 = _interpolate()
    //     0x376fb8: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x376fbc: stur            x0, [fp, #-0xd8]
    // 0x376fc0: stp             NULL, NULL, [SP]
    // 0x376fc4: ldur            x1, [fp, #-0xb0]
    // 0x376fc8: mov             x3, x0
    // 0x376fcc: r2 = Instance_Level
    //     0x376fcc: ldr             x2, [PP, #0x2510]  ; [pp+0x2510] Obj!Level@5ca881
    // 0x376fd0: r4 = const [0, 0x5, 0x2, 0x5, null]
    //     0x376fd0: ldr             x4, [PP, #0x62a0]  ; [pp+0x62a0] List(5) [0, 0x5, 0x2, 0x5, Null]
    // 0x376fd4: r0 = log()
    //     0x376fd4: bl              #0x28692c  ; [package:logging/src/logger.dart] Logger::log
    // 0x376fd8: ldur            x0, [fp, #-0xa0]
    // 0x376fdc: LoadField: r1 = r0->field_1f
    //     0x376fdc: ldur            w1, [x0, #0x1f]
    // 0x376fe0: DecompressPointer r1
    //     0x376fe0: add             x1, x1, HEAP, lsl #32
    // 0x376fe4: cmp             w1, NULL
    // 0x376fe8: b.ne            #0x377020
    // 0x376fec: mov             x1, x0
    // 0x376ff0: r0 = createComponentSet()
    //     0x376ff0: bl              #0x2a2ac4  ; [package:flame/src/components/core/component.dart] Component::createComponentSet
    // 0x376ff4: mov             x1, x0
    // 0x376ff8: ldur            x3, [fp, #-0xa0]
    // 0x376ffc: StoreField: r3->field_1f = r0
    //     0x376ffc: stur            w0, [x3, #0x1f]
    //     0x377000: ldurb           w16, [x3, #-1]
    //     0x377004: ldurb           w17, [x0, #-1]
    //     0x377008: and             x16, x17, x16, lsr #2
    //     0x37700c: tst             x16, HEAP, lsr #32
    //     0x377010: b.eq            #0x377018
    //     0x377014: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x377018: mov             x0, x1
    // 0x37701c: b               #0x377028
    // 0x377020: mov             x3, x0
    // 0x377024: mov             x0, x1
    // 0x377028: stur            x0, [fp, #-0xe0]
    // 0x37702c: LoadField: r4 = r0->field_b
    //     0x37702c: ldur            w4, [x0, #0xb]
    // 0x377030: DecompressPointer r4
    //     0x377030: add             x4, x4, HEAP, lsl #32
    // 0x377034: mov             x1, x4
    // 0x377038: stur            x4, [fp, #-0xd8]
    // 0x37703c: r2 = Monster
    //     0x37703c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc830] Type: Monster
    //     0x377040: ldr             x2, [x2, #0x830]
    // 0x377044: r0 = _getValueOrData()
    //     0x377044: bl              #0x23b838  ; [dart:_compact_hash] __Map&_HashVMBase&MapMixin&_HashBase&_OperatorEqualsAndHashCode&_LinkedHashMapMixin::_getValueOrData
    // 0x377048: mov             x1, x0
    // 0x37704c: ldur            x0, [fp, #-0xd8]
    // 0x377050: LoadField: r2 = r0->field_f
    //     0x377050: ldur            w2, [x0, #0xf]
    // 0x377054: DecompressPointer r2
    //     0x377054: add             x2, x2, HEAP, lsl #32
    // 0x377058: cmp             w2, w1
    // 0x37705c: b.ne            #0x377068
    // 0x377060: r0 = Null
    //     0x377060: mov             x0, NULL
    // 0x377064: b               #0x37706c
    // 0x377068: mov             x0, x1
    // 0x37706c: cmp             w0, NULL
    // 0x377070: b.eq            #0x3770a8
    // 0x377074: LoadField: r3 = r0->field_b
    //     0x377074: ldur            w3, [x0, #0xb]
    // 0x377078: DecompressPointer r3
    //     0x377078: add             x3, x3, HEAP, lsl #32
    // 0x37707c: mov             x0, x3
    // 0x377080: stur            x3, [fp, #-0xd8]
    // 0x377084: r2 = Null
    //     0x377084: mov             x2, NULL
    // 0x377088: r1 = Null
    //     0x377088: mov             x1, NULL
    // 0x37708c: r8 = Iterable<Monster>
    //     0x37708c: add             x8, PP, #0xc, lsl #12  ; [pp+0xc838] Type: Iterable<Monster>
    //     0x377090: ldr             x8, [x8, #0x838]
    // 0x377094: r3 = Null
    //     0x377094: add             x3, PP, #0xc, lsl #12  ; [pp+0xc840] Null
    //     0x377098: ldr             x3, [x3, #0x840]
    // 0x37709c: r0 = Iterable<Monster>()
    //     0x37709c: bl              #0x37e6b8  ; IsType_Iterable<Monster>_Stub
    // 0x3770a0: ldur            x1, [fp, #-0xd8]
    // 0x3770a4: b               #0x3770c4
    // 0x3770a8: r16 = <Monster>
    //     0x3770a8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc778] TypeArguments: <Monster>
    //     0x3770ac: ldr             x16, [x16, #0x778]
    // 0x3770b0: ldur            lr, [fp, #-0xe0]
    // 0x3770b4: stp             lr, x16, [SP]
    // 0x3770b8: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x3770b8: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x3770bc: r0 = whereType()
    //     0x3770bc: bl              #0x430d58  ; [dart:_compact_hash] __Set&_HashVMBase&SetMixin::whereType
    // 0x3770c0: mov             x1, x0
    // 0x3770c4: r0 = LoadClassIdInstr(r1)
    //     0x3770c4: ldur            x0, [x1, #-1]
    //     0x3770c8: ubfx            x0, x0, #0xc, #0x14
    // 0x3770cc: r0 = GDT[cid_x0 + 0xfc4]()
    //     0x3770cc: add             lr, x0, #0xfc4
    //     0x3770d0: ldr             lr, [x21, lr, lsl #3]
    //     0x3770d4: blr             lr
    // 0x3770d8: mov             x2, x0
    // 0x3770dc: stur            x2, [fp, #-0xe0]
    // 0x3770e0: r3 = false
    //     0x3770e0: add             x3, NULL, #0x30  ; false
    // 0x3770e4: ldur            d0, [fp, #-0xf0]
    // 0x3770e8: stur            x3, [fp, #-0xd8]
    // 0x3770ec: CheckStackOverflow
    //     0x3770ec: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3770f0: cmp             SP, x16
    //     0x3770f4: b.ls            #0x3772f8
    // 0x3770f8: r0 = LoadClassIdInstr(r2)
    //     0x3770f8: ldur            x0, [x2, #-1]
    //     0x3770fc: ubfx            x0, x0, #0xc, #0x14
    // 0x377100: mov             x1, x2
    // 0x377104: r0 = GDT[cid_x0 + -0x1000]()
    //     0x377104: sub             lr, x0, #1, lsl #12
    //     0x377108: ldr             lr, [x21, lr, lsl #3]
    //     0x37710c: blr             lr
    // 0x377110: tbnz            w0, #4, #0x3771c8
    // 0x377114: ldur            x2, [fp, #-0xe0]
    // 0x377118: r0 = LoadClassIdInstr(r2)
    //     0x377118: ldur            x0, [x2, #-1]
    //     0x37711c: ubfx            x0, x0, #0xc, #0x14
    // 0x377120: mov             x1, x2
    // 0x377124: r0 = GDT[cid_x0 + -0xfe0]()
    //     0x377124: sub             lr, x0, #0xfe0
    //     0x377128: ldr             lr, [x21, lr, lsl #3]
    //     0x37712c: blr             lr
    // 0x377130: mov             x3, x0
    // 0x377134: stur            x3, [fp, #-0xe8]
    // 0x377138: LoadField: r0 = r3->field_9f
    //     0x377138: ldur            w0, [x3, #0x9f]
    // 0x37713c: DecompressPointer r0
    //     0x37713c: add             x0, x0, HEAP, lsl #32
    // 0x377140: tbnz            w0, #4, #0x37716c
    // 0x377144: LoadField: r0 = r3->field_43
    //     0x377144: ldur            w0, [x3, #0x43]
    // 0x377148: DecompressPointer r0
    //     0x377148: add             x0, x0, HEAP, lsl #32
    // 0x37714c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x377150: cmp             w0, w16
    // 0x377154: b.eq            #0x377300
    // 0x377158: LoadField: r1 = r0->field_1b
    //     0x377158: ldur            w1, [x0, #0x1b]
    // 0x37715c: DecompressPointer r1
    //     0x37715c: add             x1, x1, HEAP, lsl #32
    // 0x377160: LoadField: r0 = r1->field_7
    //     0x377160: ldur            w0, [x1, #7]
    // 0x377164: DecompressPointer r0
    //     0x377164: add             x0, x0, HEAP, lsl #32
    // 0x377168: b               #0x377174
    // 0x37716c: LoadField: r0 = r3->field_77
    //     0x37716c: ldur            w0, [x3, #0x77]
    // 0x377170: DecompressPointer r0
    //     0x377170: add             x0, x0, HEAP, lsl #32
    // 0x377174: ldur            d0, [fp, #-0xf0]
    // 0x377178: LoadField: r2 = r0->field_7
    //     0x377178: ldur            w2, [x0, #7]
    // 0x37717c: DecompressPointer r2
    //     0x37717c: add             x2, x2, HEAP, lsl #32
    // 0x377180: LoadField: r0 = r2->field_13
    //     0x377180: ldur            w0, [x2, #0x13]
    // 0x377184: r1 = LoadInt32Instr(r0)
    //     0x377184: sbfx            x1, x0, #1, #0x1f
    // 0x377188: mov             x0, x1
    // 0x37718c: r1 = 1
    //     0x37718c: mov             x1, #1
    // 0x377190: cmp             x1, x0
    // 0x377194: b.hs            #0x37730c
    // 0x377198: LoadField: d1 = r2->field_1b
    //     0x377198: ldur            s1, [x2, #0x1b]
    // 0x37719c: fcvt            d2, s1
    // 0x3771a0: fcmp            d2, d0
    // 0x3771a4: b.le            #0x3771bc
    // 0x3771a8: mov             x1, x3
    // 0x3771ac: r2 = 0
    //     0x3771ac: mov             x2, #0
    // 0x3771b0: r0 = hp=()
    //     0x3771b0: bl              #0x377494  ; [package:ricochlime/flame/components/monster.dart] Monster::hp=
    // 0x3771b4: r3 = true
    //     0x3771b4: add             x3, NULL, #0x20  ; true
    // 0x3771b8: b               #0x3771c0
    // 0x3771bc: ldur            x3, [fp, #-0xd8]
    // 0x3771c0: ldur            x2, [fp, #-0xe0]
    // 0x3771c4: b               #0x3770e4
    // 0x3771c8: ldur            x0, [fp, #-0xd8]
    // 0x3771cc: tbnz            w0, #4, #0x377200
    // 0x3771d0: ldur            x0, [fp, #-0xc0]
    // 0x3771d4: ldur            x3, [fp, #-0xc8]
    // 0x3771d8: cmp             x0, x3
    // 0x3771dc: b.ge            #0x377200
    // 0x3771e0: ldur            x1, [fp, #-0xa8]
    // 0x3771e4: r2 = Instance_Duration
    //     0x3771e4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc850] Obj!Duration@5dcd11
    //     0x3771e8: ldr             x2, [x2, #0x850]
    // 0x3771ec: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x3771ec: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x3771f0: r0 = delayed()
    //     0x3771f0: bl              #0x37e964  ; [package:ricochlime/flame/ticker.dart] Ticker::delayed
    // 0x3771f4: mov             x1, x0
    // 0x3771f8: stur            x1, [fp, #-0xd8]
    // 0x3771fc: r0 = Await()
    //     0x3771fc: bl              #0x255470  ; AwaitStub
    // 0x377200: ldur            x0, [fp, #-0xc0]
    // 0x377204: add             x6, x0, #1
    // 0x377208: ldur            x2, [fp, #-0xa0]
    // 0x37720c: ldur            x4, [fp, #-0xc8]
    // 0x377210: ldur            x5, [fp, #-0xa8]
    // 0x377214: ldur            x3, [fp, #-0xd0]
    // 0x377218: ldur            x0, [fp, #-0xb8]
    // 0x37721c: b               #0x376e90
    // 0x377220: ldur            x1, [fp, #-0xa0]
    // 0x377224: r0 = saveGame()
    //     0x377224: bl              #0x37d014  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::saveGame
    // 0x377228: mov             x1, x0
    // 0x37722c: stur            x1, [fp, #-0xa8]
    // 0x377230: r0 = Await()
    //     0x377230: bl              #0x255470  ; AwaitStub
    // 0x377234: ldur            x1, [fp, #-0xa0]
    // 0x377238: LoadField: r0 = r1->field_8f
    //     0x377238: ldur            w0, [x1, #0x8f]
    // 0x37723c: DecompressPointer r0
    //     0x37723c: add             x0, x0, HEAP, lsl #32
    // 0x377240: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x377244: cmp             w0, w16
    // 0x377248: b.ne            #0x377258
    // 0x37724c: r2 = state
    //     0x37724c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x377250: ldr             x2, [x2, #0x790]
    // 0x377254: r0 = InitLateFinalInstanceField()
    //     0x377254: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x377258: mov             x1, x0
    // 0x37725c: r2 = Instance_GameState
    //     0x37725c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x377260: ldr             x2, [x2, #0x798]
    // 0x377264: r0 = value=()
    //     0x377264: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x377268: b               #0x377274
    // 0x37726c: ldur            x1, [fp, #-0xa0]
    // 0x377270: r0 = restartGame()
    //     0x377270: bl              #0x377348  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::restartGame
    // 0x377274: r0 = Null
    //     0x377274: mov             x0, NULL
    // 0x377278: r0 = ReturnAsyncNotFuture()
    //     0x377278: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37727c: sub             SP, fp, #0x100
    // 0x377280: ldur            x2, [fp, #-0xa0]
    // 0x377284: mov             x3, x0
    // 0x377288: stur            x0, [fp, #-0xa8]
    // 0x37728c: mov             x0, x1
    // 0x377290: stur            x1, [fp, #-0xb0]
    // 0x377294: LoadField: r1 = r2->field_8f
    //     0x377294: ldur            w1, [x2, #0x8f]
    // 0x377298: DecompressPointer r1
    //     0x377298: add             x1, x1, HEAP, lsl #32
    // 0x37729c: r2 = Instance_GameState
    //     0x37729c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x3772a0: ldr             x2, [x2, #0x798]
    // 0x3772a4: r0 = value=()
    //     0x3772a4: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x3772a8: ldur            x0, [fp, #-0xa8]
    // 0x3772ac: ldur            x1, [fp, #-0xb0]
    // 0x3772b0: r0 = ReThrow()
    //     0x3772b0: bl              #0x5827b0  ; ReThrowStub
    // 0x3772b4: brk             #0
    // 0x3772b8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3772b8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3772bc: b               #0x376b4c
    // 0x3772c0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3772c0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3772c4: b               #0x376c28
    // 0x3772c8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3772c8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3772cc: b               #0x376ea0
    // 0x3772d0: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x3772d0: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x3772d4: SaveReg d0
    //     0x3772d4: str             q0, [SP, #-0x10]!
    // 0x3772d8: stp             x2, x3, [SP, #-0x10]!
    // 0x3772dc: SaveReg r0
    //     0x3772dc: str             x0, [SP, #-8]!
    // 0x3772e0: r0 = AllocateDouble()
    //     0x3772e0: bl              #0x584528  ; AllocateDoubleStub
    // 0x3772e4: mov             x1, x0
    // 0x3772e8: RestoreReg r0
    //     0x3772e8: ldr             x0, [SP], #8
    // 0x3772ec: ldp             x2, x3, [SP], #0x10
    // 0x3772f0: RestoreReg d0
    //     0x3772f0: ldr             q0, [SP], #0x10
    // 0x3772f4: b               #0x376fa4
    // 0x3772f8: r0 = StackOverflowSharedWithFPURegs()
    //     0x3772f8: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3772fc: b               #0x3770f8
    // 0x377300: r9 = body
    //     0x377300: add             x9, PP, #0xc, lsl #12  ; [pp+0xc7a0] Field <BodyComponent.body>: late (offset: 0x44)
    //     0x377304: ldr             x9, [x9, #0x7a0]
    // 0x377308: r0 = LateInitializationErrorSharedWithoutFPURegs()
    //     0x377308: bl              #0x584ffc  ; LateInitializationErrorSharedWithoutFPURegsStub
    // 0x37730c: r0 = RangeErrorSharedWithFPURegs()
    //     0x37730c: bl              #0x584ca4  ; RangeErrorSharedWithFPURegsStub
  }
  _ restartGame(/* No info */) {
    // ** addr: 0x377348, size: 0x114
    // 0x377348: EnterFrame
    //     0x377348: stp             fp, lr, [SP, #-0x10]!
    //     0x37734c: mov             fp, SP
    // 0x377350: AllocStack(0x20)
    //     0x377350: sub             SP, SP, #0x20
    // 0x377354: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0x8 */)
    //     0x377354: stur            x1, [fp, #-8]
    // 0x377358: CheckStackOverflow
    //     0x377358: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37735c: cmp             SP, x16
    //     0x377360: b.ls            #0x377454
    // 0x377364: r0 = LoadStaticField(0xccc)
    //     0x377364: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x377368: ldr             x0, [x0, #0x1998]
    // 0x37736c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x377370: cmp             w0, w16
    // 0x377374: b.ne            #0x377384
    // 0x377378: r2 = stows
    //     0x377378: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x37737c: ldr             x2, [x2, #0x310]
    // 0x377380: r0 = InitLateFinalStaticField()
    //     0x377380: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x377384: stur            x0, [fp, #-0x18]
    // 0x377388: LoadField: r2 = r0->field_b
    //     0x377388: ldur            w2, [x0, #0xb]
    // 0x37738c: DecompressPointer r2
    //     0x37738c: add             x2, x2, HEAP, lsl #32
    // 0x377390: mov             x1, x2
    // 0x377394: stur            x2, [fp, #-0x10]
    // 0x377398: LoadField: r0 = r1->field_43
    //     0x377398: ldur            w0, [x1, #0x43]
    // 0x37739c: DecompressPointer r0
    //     0x37739c: add             x0, x0, HEAP, lsl #32
    // 0x3773a0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3773a4: cmp             w0, w16
    // 0x3773a8: b.ne            #0x3773b8
    // 0x3773ac: r2 = _value
    //     0x3773ac: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3773b0: ldr             x2, [x2, #0x4b0]
    // 0x3773b4: r0 = InitLateInstanceField()
    //     0x3773b4: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3773b8: stur            x0, [fp, #-0x20]
    // 0x3773bc: r0 = LoadStaticField(0x868)
    //     0x3773bc: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3773c0: ldr             x0, [x0, #0x10d0]
    // 0x3773c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3773c8: cmp             w0, w16
    // 0x3773cc: b.ne            #0x3773dc
    // 0x3773d0: r2 = score
    //     0x3773d0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc780] Field <RicochlimeGame.score>: static late final (offset: 0x868)
    //     0x3773d4: ldr             x2, [x2, #0x780]
    // 0x3773d8: r0 = InitLateFinalStaticField()
    //     0x3773d8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3773dc: LoadField: r1 = r0->field_27
    //     0x3773dc: ldur            w1, [x0, #0x27]
    // 0x3773e0: DecompressPointer r1
    //     0x3773e0: add             x1, x1, HEAP, lsl #32
    // 0x3773e4: ldur            x0, [fp, #-0x20]
    // 0x3773e8: r2 = LoadInt32Instr(r0)
    //     0x3773e8: sbfx            x2, x0, #1, #0x1f
    //     0x3773ec: tbz             w0, #0, #0x3773f4
    //     0x3773f0: ldur            x2, [x0, #7]
    // 0x3773f4: r0 = LoadInt32Instr(r1)
    //     0x3773f4: sbfx            x0, x1, #1, #0x1f
    //     0x3773f8: tbz             w1, #0, #0x377400
    //     0x3773fc: ldur            x0, [x1, #7]
    // 0x377400: cmp             x2, x0
    // 0x377404: csel            x3, x0, x2, lt
    // 0x377408: r0 = BoxInt64Instr(r3)
    //     0x377408: sbfiz           x0, x3, #1, #0x1f
    //     0x37740c: cmp             x3, x0, asr #1
    //     0x377410: b.eq            #0x37741c
    //     0x377414: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x377418: stur            x3, [x0, #7]
    // 0x37741c: ldur            x1, [fp, #-0x10]
    // 0x377420: mov             x2, x0
    // 0x377424: r0 = value=()
    //     0x377424: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x377428: ldur            x0, [fp, #-0x18]
    // 0x37742c: LoadField: r1 = r0->field_7
    //     0x37742c: ldur            w1, [x0, #7]
    // 0x377430: DecompressPointer r1
    //     0x377430: add             x1, x1, HEAP, lsl #32
    // 0x377434: r2 = Null
    //     0x377434: mov             x2, NULL
    // 0x377438: r0 = value=()
    //     0x377438: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x37743c: ldur            x1, [fp, #-8]
    // 0x377440: r0 = _reset()
    //     0x377440: bl              #0x375fd8  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::_reset
    // 0x377444: r0 = Null
    //     0x377444: mov             x0, NULL
    // 0x377448: LeaveFrame
    //     0x377448: mov             SP, fp
    //     0x37744c: ldp             fp, lr, [SP], #0x10
    // 0x377450: ret
    //     0x377450: ret             
    // 0x377454: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x377454: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x377458: b               #0x377364
  }
  [closure] void restartGame(dynamic) {
    // ** addr: 0x37745c, size: 0x38
    // 0x37745c: EnterFrame
    //     0x37745c: stp             fp, lr, [SP, #-0x10]!
    //     0x377460: mov             fp, SP
    // 0x377464: ldr             x0, [fp, #0x10]
    // 0x377468: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x377468: ldur            w1, [x0, #0x17]
    // 0x37746c: DecompressPointer r1
    //     0x37746c: add             x1, x1, HEAP, lsl #32
    // 0x377470: CheckStackOverflow
    //     0x377470: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x377474: cmp             SP, x16
    //     0x377478: b.ls            #0x37748c
    // 0x37747c: r0 = restartGame()
    //     0x37747c: bl              #0x377348  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::restartGame
    // 0x377480: LeaveFrame
    //     0x377480: mov             SP, fp
    //     0x377484: ldp             fp, lr, [SP], #0x10
    // 0x377488: ret
    //     0x377488: ret             
    // 0x37748c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37748c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x377490: b               #0x37747c
  }
  static Logger log() {
    // ** addr: 0x37cfdc, size: 0x38
    // 0x37cfdc: EnterFrame
    //     0x37cfdc: stp             fp, lr, [SP, #-0x10]!
    //     0x37cfe0: mov             fp, SP
    // 0x37cfe4: CheckStackOverflow
    //     0x37cfe4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37cfe8: cmp             SP, x16
    //     0x37cfec: b.ls            #0x37d00c
    // 0x37cff0: r1 = Null
    //     0x37cff0: mov             x1, NULL
    // 0x37cff4: r2 = "RicochlimeGame"
    //     0x37cff4: add             x2, PP, #0xd, lsl #12  ; [pp+0xd1a8] "RicochlimeGame"
    //     0x37cff8: ldr             x2, [x2, #0x1a8]
    // 0x37cffc: r0 = Logger()
    //     0x37cffc: bl              #0x286f68  ; [package:logging/src/logger.dart] Logger::Logger
    // 0x37d000: LeaveFrame
    //     0x37d000: mov             SP, fp
    //     0x37d004: ldp             fp, lr, [SP], #0x10
    // 0x37d008: ret
    //     0x37d008: ret             
    // 0x37d00c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d00c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d010: b               #0x37cff0
  }
  _ saveGame(/* No info */) async {
    // ** addr: 0x37d014, size: 0x1e4
    // 0x37d014: EnterFrame
    //     0x37d014: stp             fp, lr, [SP, #-0x10]!
    //     0x37d018: mov             fp, SP
    // 0x37d01c: AllocStack(0x38)
    //     0x37d01c: sub             SP, SP, #0x38
    // 0x37d020: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0x10 */)
    //     0x37d020: stur            NULL, [fp, #-8]
    //     0x37d024: stur            x1, [fp, #-0x10]
    // 0x37d028: CheckStackOverflow
    //     0x37d028: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d02c: cmp             SP, x16
    //     0x37d030: b.ls            #0x37d1f0
    // 0x37d034: InitAsync() -> Future
    //     0x37d034: mov             x0, NULL
    //     0x37d038: bl              #0x2556b4  ; InitAsyncStub
    // 0x37d03c: ldur            x0, [fp, #-0x10]
    // 0x37d040: LoadField: r1 = r0->field_1f
    //     0x37d040: ldur            w1, [x0, #0x1f]
    // 0x37d044: DecompressPointer r1
    //     0x37d044: add             x1, x1, HEAP, lsl #32
    // 0x37d048: cmp             w1, NULL
    // 0x37d04c: b.ne            #0x37d084
    // 0x37d050: mov             x1, x0
    // 0x37d054: r0 = createComponentSet()
    //     0x37d054: bl              #0x2a2ac4  ; [package:flame/src/components/core/component.dart] Component::createComponentSet
    // 0x37d058: mov             x2, x0
    // 0x37d05c: ldur            x1, [fp, #-0x10]
    // 0x37d060: StoreField: r1->field_1f = r0
    //     0x37d060: stur            w0, [x1, #0x1f]
    //     0x37d064: ldurb           w16, [x1, #-1]
    //     0x37d068: ldurb           w17, [x0, #-1]
    //     0x37d06c: and             x16, x17, x16, lsr #2
    //     0x37d070: tst             x16, HEAP, lsr #32
    //     0x37d074: b.eq            #0x37d07c
    //     0x37d078: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x37d07c: mov             x0, x2
    // 0x37d080: b               #0x37d088
    // 0x37d084: mov             x0, x1
    // 0x37d088: r16 = <Monster>
    //     0x37d088: add             x16, PP, #0xc, lsl #12  ; [pp+0xc778] TypeArguments: <Monster>
    //     0x37d08c: ldr             x16, [x16, #0x778]
    // 0x37d090: stp             x0, x16, [SP]
    // 0x37d094: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x37d094: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x37d098: r0 = whereType()
    //     0x37d098: bl              #0x30f5cc  ; [dart:mixin_deduplication] _MixinApplication503&OrderedSet&QueryableOrderedSetImpl::whereType
    // 0x37d09c: r1 = LoadClassIdInstr(r0)
    //     0x37d09c: ldur            x1, [x0, #-1]
    //     0x37d0a0: ubfx            x1, x1, #0xc, #0x14
    // 0x37d0a4: mov             x16, x0
    // 0x37d0a8: mov             x0, x1
    // 0x37d0ac: mov             x1, x16
    // 0x37d0b0: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x37d0b0: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x37d0b4: r0 = GDT[cid_x0 + 0x73e2]()
    //     0x37d0b4: mov             x17, #0x73e2
    //     0x37d0b8: add             lr, x0, x17
    //     0x37d0bc: ldr             lr, [x21, lr, lsl #3]
    //     0x37d0c0: blr             lr
    // 0x37d0c4: r1 = Function '<anonymous closure>':.
    //     0x37d0c4: add             x1, PP, #0xc, lsl #12  ; [pp+0xc940] AnonymousClosure: (0x37d3a8), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::saveGame (0x37d014)
    //     0x37d0c8: ldr             x1, [x1, #0x940]
    // 0x37d0cc: r2 = Null
    //     0x37d0cc: mov             x2, NULL
    // 0x37d0d0: stur            x0, [fp, #-0x10]
    // 0x37d0d4: r0 = AllocateClosure()
    //     0x37d0d4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37d0d8: ldur            x1, [fp, #-0x10]
    // 0x37d0dc: mov             x2, x0
    // 0x37d0e0: r0 = any()
    //     0x37d0e0: bl              #0x4510e8  ; [dart:collection] ListBase::any
    // 0x37d0e4: tbnz            w0, #4, #0x37d120
    // 0x37d0e8: r0 = LoadStaticField(0x864)
    //     0x37d0e8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37d0ec: ldr             x0, [x0, #0x10c8]
    // 0x37d0f0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d0f4: cmp             w0, w16
    // 0x37d0f8: b.ne            #0x37d108
    // 0x37d0fc: r2 = log
    //     0x37d0fc: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7f0] Field <RicochlimeGame.log>: static late final (offset: 0x864)
    //     0x37d100: ldr             x2, [x2, #0x7f0]
    // 0x37d104: r0 = InitLateFinalStaticField()
    //     0x37d104: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37d108: mov             x1, x0
    // 0x37d10c: r2 = "Not saving game because the monsters are ragdolling"
    //     0x37d10c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc948] "Not saving game because the monsters are ragdolling"
    //     0x37d110: ldr             x2, [x2, #0x948]
    // 0x37d114: r0 = warning()
    //     0x37d114: bl              #0x2a1084  ; [package:logging/src/logger.dart] Logger::warning
    // 0x37d118: r0 = Null
    //     0x37d118: mov             x0, NULL
    // 0x37d11c: r0 = ReturnAsyncNotFuture()
    //     0x37d11c: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37d120: r0 = LoadStaticField(0xccc)
    //     0x37d120: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37d124: ldr             x0, [x0, #0x1998]
    // 0x37d128: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d12c: cmp             w0, w16
    // 0x37d130: b.ne            #0x37d140
    // 0x37d134: r2 = stows
    //     0x37d134: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x37d138: ldr             x2, [x2, #0x310]
    // 0x37d13c: r0 = InitLateFinalStaticField()
    //     0x37d13c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37d140: LoadField: r1 = r0->field_7
    //     0x37d140: ldur            w1, [x0, #7]
    // 0x37d144: DecompressPointer r1
    //     0x37d144: add             x1, x1, HEAP, lsl #32
    // 0x37d148: stur            x1, [fp, #-0x18]
    // 0x37d14c: r0 = LoadStaticField(0x868)
    //     0x37d14c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x37d150: ldr             x0, [x0, #0x10d0]
    // 0x37d154: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d158: cmp             w0, w16
    // 0x37d15c: b.ne            #0x37d16c
    // 0x37d160: r2 = score
    //     0x37d160: add             x2, PP, #0xc, lsl #12  ; [pp+0xc780] Field <RicochlimeGame.score>: static late final (offset: 0x868)
    //     0x37d164: ldr             x2, [x2, #0x780]
    // 0x37d168: r0 = InitLateFinalStaticField()
    //     0x37d168: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x37d16c: LoadField: r3 = r0->field_27
    //     0x37d16c: ldur            w3, [x0, #0x27]
    // 0x37d170: DecompressPointer r3
    //     0x37d170: add             x3, x3, HEAP, lsl #32
    // 0x37d174: stur            x3, [fp, #-0x20]
    // 0x37d178: r1 = Function '<anonymous closure>':.
    //     0x37d178: add             x1, PP, #0xc, lsl #12  ; [pp+0xc950] AnonymousClosure: (0x37d370), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::saveGame (0x37d014)
    //     0x37d17c: ldr             x1, [x1, #0x950]
    // 0x37d180: r2 = Null
    //     0x37d180: mov             x2, NULL
    // 0x37d184: r0 = AllocateClosure()
    //     0x37d184: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37d188: ldur            x1, [fp, #-0x10]
    // 0x37d18c: mov             x2, x0
    // 0x37d190: r0 = where()
    //     0x37d190: bl              #0x4367bc  ; [dart:_compact_hash] __Set&_HashVMBase&SetMixin::where
    // 0x37d194: mov             x1, x0
    // 0x37d198: ldur            x0, [fp, #-0x20]
    // 0x37d19c: stur            x1, [fp, #-0x10]
    // 0x37d1a0: r3 = LoadInt32Instr(r0)
    //     0x37d1a0: sbfx            x3, x0, #1, #0x1f
    //     0x37d1a4: tbz             w0, #0, #0x37d1ac
    //     0x37d1a8: ldur            x3, [x0, #7]
    // 0x37d1ac: stur            x3, [fp, #-0x28]
    // 0x37d1b0: r0 = GameData()
    //     0x37d1b0: bl              #0x28ce4c  ; AllocateGameDataStub -> GameData (size=0x14)
    // 0x37d1b4: mov             x1, x0
    // 0x37d1b8: ldur            x2, [fp, #-0x10]
    // 0x37d1bc: ldur            x3, [fp, #-0x28]
    // 0x37d1c0: stur            x0, [fp, #-0x10]
    // 0x37d1c4: r0 = GameData()
    //     0x37d1c4: bl              #0x37d2a4  ; [package:ricochlime/flame/game_data.dart] GameData::GameData
    // 0x37d1c8: ldur            x1, [fp, #-0x18]
    // 0x37d1cc: ldur            x2, [fp, #-0x10]
    // 0x37d1d0: r0 = value=()
    //     0x37d1d0: bl              #0x2893fc  ; [package:stow/src/abstract_stow.dart] Stow::value=
    // 0x37d1d4: ldur            x1, [fp, #-0x18]
    // 0x37d1d8: r0 = waitUntilWritten()
    //     0x37d1d8: bl              #0x37d1f8  ; [package:stow/src/abstract_stow.dart] Stow::waitUntilWritten
    // 0x37d1dc: mov             x1, x0
    // 0x37d1e0: stur            x1, [fp, #-0x10]
    // 0x37d1e4: r0 = Await()
    //     0x37d1e4: bl              #0x255470  ; AwaitStub
    // 0x37d1e8: r0 = Null
    //     0x37d1e8: mov             x0, NULL
    // 0x37d1ec: r0 = ReturnAsyncNotFuture()
    //     0x37d1ec: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x37d1f0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d1f0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d1f4: b               #0x37d034
  }
  [closure] bool <anonymous closure>(dynamic, Monster) {
    // ** addr: 0x37d370, size: 0x38
    // 0x37d370: EnterFrame
    //     0x37d370: stp             fp, lr, [SP, #-0x10]!
    //     0x37d374: mov             fp, SP
    // 0x37d378: CheckStackOverflow
    //     0x37d378: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d37c: cmp             SP, x16
    //     0x37d380: b.ls            #0x37d3a0
    // 0x37d384: ldr             x1, [fp, #0x10]
    // 0x37d388: r0 = isDead()
    //     0x37d388: bl              #0x3776ac  ; [package:ricochlime/flame/components/monster.dart] Monster::isDead
    // 0x37d38c: eor             x1, x0, #0x10
    // 0x37d390: mov             x0, x1
    // 0x37d394: LeaveFrame
    //     0x37d394: mov             SP, fp
    //     0x37d398: ldp             fp, lr, [SP], #0x10
    // 0x37d39c: ret
    //     0x37d39c: ret             
    // 0x37d3a0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d3a0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d3a4: b               #0x37d384
  }
  [closure] bool <anonymous closure>(dynamic, Monster) {
    // ** addr: 0x37d3a8, size: 0x6c
    // 0x37d3a8: EnterFrame
    //     0x37d3a8: stp             fp, lr, [SP, #-0x10]!
    //     0x37d3ac: mov             fp, SP
    // 0x37d3b0: CheckStackOverflow
    //     0x37d3b0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d3b4: cmp             SP, x16
    //     0x37d3b8: b.ls            #0x37d40c
    // 0x37d3bc: ldr             x1, [fp, #0x10]
    // 0x37d3c0: LoadField: r0 = r1->field_93
    //     0x37d3c0: ldur            w0, [x1, #0x93]
    // 0x37d3c4: DecompressPointer r0
    //     0x37d3c4: add             x0, x0, HEAP, lsl #32
    // 0x37d3c8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37d3cc: cmp             w0, w16
    // 0x37d3d0: b.ne            #0x37d3e0
    // 0x37d3d4: r2 = _animation
    //     0x37d3d4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x37d3d8: ldr             x2, [x2, #0x7d0]
    // 0x37d3dc: r0 = InitLateFinalInstanceField()
    //     0x37d3dc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37d3e0: LoadField: r1 = r0->field_4f
    //     0x37d3e0: ldur            w1, [x0, #0x4f]
    // 0x37d3e4: DecompressPointer r1
    //     0x37d3e4: add             x1, x1, HEAP, lsl #32
    // 0x37d3e8: r16 = Instance_MonsterState
    //     0x37d3e8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7d8] Obj!MonsterState@5d8b61
    //     0x37d3ec: ldr             x16, [x16, #0x7d8]
    // 0x37d3f0: cmp             w1, w16
    // 0x37d3f4: r16 = true
    //     0x37d3f4: add             x16, NULL, #0x20  ; true
    // 0x37d3f8: r17 = false
    //     0x37d3f8: add             x17, NULL, #0x30  ; false
    // 0x37d3fc: csel            x0, x16, x17, eq
    // 0x37d400: LeaveFrame
    //     0x37d400: mov             SP, fp
    //     0x37d404: ldp             fp, lr, [SP], #0x10
    // 0x37d408: ret
    //     0x37d408: ret             
    // 0x37d40c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37d40c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37d410: b               #0x37d3bc
  }
  static _ createNewRow(/* No info */) {
    // ** addr: 0x37d918, size: 0x554
    // 0x37d918: EnterFrame
    //     0x37d918: stp             fp, lr, [SP, #-0x10]!
    //     0x37d91c: mov             fp, SP
    // 0x37d920: AllocStack(0x40)
    //     0x37d920: sub             SP, SP, #0x40
    // 0x37d924: SetupParameters(dynamic _ /* r1 => r3, fp-0x8 */, dynamic _ /* r2 => r0, fp-0x10 */)
    //     0x37d924: mov             x3, x1
    //     0x37d928: mov             x0, x2
    //     0x37d92c: stur            x1, [fp, #-8]
    //     0x37d930: stur            x2, [fp, #-0x10]
    // 0x37d934: CheckStackOverflow
    //     0x37d934: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d938: cmp             SP, x16
    //     0x37d93c: b.ls            #0x37de20
    // 0x37d940: r1 = <bool>
    //     0x37d940: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x37d944: r2 = 16
    //     0x37d944: mov             x2, #0x10
    // 0x37d948: r0 = AllocateArray()
    //     0x37d948: bl              #0x5845d8  ; AllocateArrayStub
    // 0x37d94c: stur            x0, [fp, #-0x20]
    // 0x37d950: r1 = 0
    //     0x37d950: mov             x1, #0
    // 0x37d954: CheckStackOverflow
    //     0x37d954: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d958: cmp             SP, x16
    //     0x37d95c: b.ls            #0x37de28
    // 0x37d960: cmp             x1, #8
    // 0x37d964: b.ge            #0x37d980
    // 0x37d968: add             x2, x0, x1, lsl #2
    // 0x37d96c: r16 = false
    //     0x37d96c: add             x16, NULL, #0x30  ; false
    // 0x37d970: StoreField: r2->field_f = r16
    //     0x37d970: stur            w16, [x2, #0xf]
    // 0x37d974: add             x2, x1, #1
    // 0x37d978: mov             x1, x2
    // 0x37d97c: b               #0x37d954
    // 0x37d980: r3 = 0
    //     0x37d980: mov             x3, #0
    // 0x37d984: stur            x3, [fp, #-0x18]
    // 0x37d988: CheckStackOverflow
    //     0x37d988: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37d98c: cmp             SP, x16
    //     0x37d990: b.ls            #0x37de30
    // 0x37d994: cmp             x3, #8
    // 0x37d998: b.ge            #0x37da10
    // 0x37d99c: ldur            x1, [fp, #-0x10]
    // 0x37d9a0: r2 = 67108864
    //     0x37d9a0: mov             x2, #0x4000000
    // 0x37d9a4: r0 = nextInt()
    //     0x37d9a4: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x37d9a8: scvtf           d0, x0
    // 0x37d9ac: d1 = 134217728.000000
    //     0x37d9ac: add             x17, PP, #0xd, lsl #12  ; [pp+0xd110] IMM: double(134217728) from 0x41a0000000000000
    //     0x37d9b0: ldr             d1, [x17, #0x110]
    // 0x37d9b4: fmul            d2, d0, d1
    // 0x37d9b8: ldur            x1, [fp, #-0x10]
    // 0x37d9bc: stur            d2, [fp, #-0x40]
    // 0x37d9c0: r2 = 134217728
    //     0x37d9c0: mov             x2, #0x8000000
    // 0x37d9c4: r0 = nextInt()
    //     0x37d9c4: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x37d9c8: scvtf           d0, x0
    // 0x37d9cc: ldur            d1, [fp, #-0x40]
    // 0x37d9d0: fadd            d2, d1, d0
    // 0x37d9d4: d0 = 9007199254740992.000000
    //     0x37d9d4: ldr             d0, [PP, #0xf70]  ; [pp+0xf70] IMM: double(9007199254740992) from 0x4340000000000000
    // 0x37d9d8: fdiv            d1, d2, d0
    // 0x37d9dc: d2 = 0.300000
    //     0x37d9dc: add             x17, PP, #0xd, lsl #12  ; [pp+0xd3c8] IMM: double(0.3) from 0x3fd3333333333333
    //     0x37d9e0: ldr             d2, [x17, #0x3c8]
    // 0x37d9e4: fcmp            d2, d1
    // 0x37d9e8: r16 = true
    //     0x37d9e8: add             x16, NULL, #0x20  ; true
    // 0x37d9ec: r17 = false
    //     0x37d9ec: add             x17, NULL, #0x30  ; false
    // 0x37d9f0: csel            x0, x16, x17, gt
    // 0x37d9f4: ldur            x1, [fp, #-0x18]
    // 0x37d9f8: ldur            x2, [fp, #-0x20]
    // 0x37d9fc: ArrayStore: r2[r1] = r0  ; Unknown_4
    //     0x37d9fc: add             x3, x2, x1, lsl #2
    //     0x37da00: stur            w0, [x3, #0xf]
    // 0x37da04: add             x3, x1, #1
    // 0x37da08: mov             x0, x2
    // 0x37da0c: b               #0x37d984
    // 0x37da10: mov             x2, x0
    // 0x37da14: CheckStackOverflow
    //     0x37da14: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37da18: cmp             SP, x16
    //     0x37da1c: b.ls            #0x37de38
    // 0x37da20: r1 = <bool>
    //     0x37da20: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x37da24: r0 = WhereIterable()
    //     0x37da24: bl              #0x37de6c  ; AllocateWhereIterableStub -> WhereIterable<X0> (size=0x14)
    // 0x37da28: mov             x3, x0
    // 0x37da2c: ldur            x0, [fp, #-0x20]
    // 0x37da30: stur            x3, [fp, #-0x28]
    // 0x37da34: StoreField: r3->field_b = r0
    //     0x37da34: stur            w0, [x3, #0xb]
    // 0x37da38: r1 = Function '<anonymous closure>': static.
    //     0x37da38: add             x1, PP, #0xd, lsl #12  ; [pp+0xd3d0] Function: [dart:core] _Closure::call (0x57f43c)
    //     0x37da3c: ldr             x1, [x1, #0x3d0]
    // 0x37da40: r2 = Null
    //     0x37da40: mov             x2, NULL
    // 0x37da44: r0 = AllocateClosure()
    //     0x37da44: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37da48: ldur            x1, [fp, #-0x28]
    // 0x37da4c: StoreField: r1->field_f = r0
    //     0x37da4c: stur            w0, [x1, #0xf]
    // 0x37da50: r0 = iterator()
    //     0x37da50: bl              #0x4a1140  ; [dart:_internal] WhereIterable::iterator
    // 0x37da54: mov             x2, x0
    // 0x37da58: stur            x2, [fp, #-0x28]
    // 0x37da5c: r3 = 0
    //     0x37da5c: mov             x3, #0
    // 0x37da60: stur            x3, [fp, #-0x18]
    // 0x37da64: CheckStackOverflow
    //     0x37da64: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37da68: cmp             SP, x16
    //     0x37da6c: b.ls            #0x37de40
    // 0x37da70: r0 = LoadClassIdInstr(r2)
    //     0x37da70: ldur            x0, [x2, #-1]
    //     0x37da74: ubfx            x0, x0, #0xc, #0x14
    // 0x37da78: mov             x1, x2
    // 0x37da7c: r0 = GDT[cid_x0 + -0x1000]()
    //     0x37da7c: sub             lr, x0, #1, lsl #12
    //     0x37da80: ldr             lr, [x21, lr, lsl #3]
    //     0x37da84: blr             lr
    // 0x37da88: tbnz            w0, #4, #0x37da9c
    // 0x37da8c: ldur            x0, [fp, #-0x18]
    // 0x37da90: add             x3, x0, #1
    // 0x37da94: ldur            x2, [fp, #-0x28]
    // 0x37da98: b               #0x37da60
    // 0x37da9c: ldur            x0, [fp, #-0x18]
    // 0x37daa0: cmp             x0, #2
    // 0x37daa4: b.ge            #0x37dae4
    // 0x37daa8: ldur            x0, [fp, #-0x20]
    // 0x37daac: ldur            x1, [fp, #-0x10]
    // 0x37dab0: r2 = 8
    //     0x37dab0: mov             x2, #8
    // 0x37dab4: r0 = nextInt()
    //     0x37dab4: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x37dab8: mov             x1, x0
    // 0x37dabc: mov             x2, x0
    // 0x37dac0: r0 = 8
    //     0x37dac0: mov             x0, #8
    // 0x37dac4: cmp             x1, x0
    // 0x37dac8: b.hs            #0x37de48
    // 0x37dacc: ldur            x0, [fp, #-0x20]
    // 0x37dad0: add             x1, x0, x2, lsl #2
    // 0x37dad4: r16 = true
    //     0x37dad4: add             x16, NULL, #0x20  ; true
    // 0x37dad8: StoreField: r1->field_f = r16
    //     0x37dad8: stur            w16, [x1, #0xf]
    // 0x37dadc: mov             x2, x0
    // 0x37dae0: b               #0x37da14
    // 0x37dae4: ldur            x0, [fp, #-0x20]
    // 0x37dae8: r1 = <Monster?>
    //     0x37dae8: add             x1, PP, #0xd, lsl #12  ; [pp+0xd3c0] TypeArguments: <Monster?>
    //     0x37daec: ldr             x1, [x1, #0x3c0]
    // 0x37daf0: r2 = 0
    //     0x37daf0: mov             x2, #0
    // 0x37daf4: r0 = _GrowableList()
    //     0x37daf4: bl              #0x237730  ; [dart:core] _GrowableList::_GrowableList
    // 0x37daf8: stur            x0, [fp, #-0x28]
    // 0x37dafc: r3 = 0
    //     0x37dafc: mov             x3, #0
    // 0x37db00: ldur            x2, [fp, #-0x20]
    // 0x37db04: stur            x3, [fp, #-0x30]
    // 0x37db08: CheckStackOverflow
    //     0x37db08: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37db0c: cmp             SP, x16
    //     0x37db10: b.ls            #0x37de4c
    // 0x37db14: cmp             x3, #8
    // 0x37db18: b.ge            #0x37dc84
    // 0x37db1c: ArrayLoad: r1 = r2[r3]  ; Unknown_4
    //     0x37db1c: add             x16, x2, x3, lsl #2
    //     0x37db20: ldur            w1, [x16, #0xf]
    // 0x37db24: DecompressPointer r1
    //     0x37db24: add             x1, x1, HEAP, lsl #32
    // 0x37db28: tbz             w1, #4, #0x37db84
    // 0x37db2c: LoadField: r1 = r0->field_b
    //     0x37db2c: ldur            w1, [x0, #0xb]
    // 0x37db30: LoadField: r4 = r0->field_f
    //     0x37db30: ldur            w4, [x0, #0xf]
    // 0x37db34: DecompressPointer r4
    //     0x37db34: add             x4, x4, HEAP, lsl #32
    // 0x37db38: LoadField: r5 = r4->field_b
    //     0x37db38: ldur            w5, [x4, #0xb]
    // 0x37db3c: r4 = LoadInt32Instr(r1)
    //     0x37db3c: sbfx            x4, x1, #1, #0x1f
    // 0x37db40: stur            x4, [fp, #-0x18]
    // 0x37db44: r1 = LoadInt32Instr(r5)
    //     0x37db44: sbfx            x1, x5, #1, #0x1f
    // 0x37db48: cmp             x4, x1
    // 0x37db4c: b.ne            #0x37db58
    // 0x37db50: mov             x1, x0
    // 0x37db54: r0 = _growToNextCapacity()
    //     0x37db54: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x37db58: ldur            x1, [fp, #-0x28]
    // 0x37db5c: ldur            x0, [fp, #-0x18]
    // 0x37db60: add             x2, x0, #1
    // 0x37db64: lsl             x3, x2, #1
    // 0x37db68: StoreField: r1->field_b = r3
    //     0x37db68: stur            w3, [x1, #0xb]
    // 0x37db6c: LoadField: r2 = r1->field_f
    //     0x37db6c: ldur            w2, [x1, #0xf]
    // 0x37db70: DecompressPointer r2
    //     0x37db70: add             x2, x2, HEAP, lsl #32
    // 0x37db74: ArrayStore: r2[r0] = rNULL  ; Unknown_4
    //     0x37db74: add             x3, x2, x0, lsl #2
    //     0x37db78: stur            NULL, [x3, #0xf]
    // 0x37db7c: mov             x4, x1
    // 0x37db80: b               #0x37dc74
    // 0x37db84: mov             x1, x0
    // 0x37db88: mov             x0, x3
    // 0x37db8c: d1 = 8.000000
    //     0x37db8c: fmov            d1, #8.00000000
    // 0x37db90: d0 = 128.000000
    //     0x37db90: add             x17, PP, #0xd, lsl #12  ; [pp+0xd3d8] IMM: double(128) from 0x4060000000000000
    //     0x37db94: ldr             d0, [x17, #0x3d8]
    // 0x37db98: scvtf           d2, x0
    // 0x37db9c: fmul            d3, d2, d0
    // 0x37dba0: fdiv            d2, d3, d1
    // 0x37dba4: stur            d2, [fp, #-0x40]
    // 0x37dba8: r0 = Vector2()
    //     0x37dba8: bl              #0x28c0e8  ; AllocateVector2Stub -> Vector2 (size=0xc)
    // 0x37dbac: r4 = 4
    //     0x37dbac: mov             x4, #4
    // 0x37dbb0: stur            x0, [fp, #-0x38]
    // 0x37dbb4: r0 = AllocateFloat32Array()
    //     0x37dbb4: bl              #0x583c98  ; AllocateFloat32ArrayStub
    // 0x37dbb8: ldur            x2, [fp, #-0x38]
    // 0x37dbbc: StoreField: r2->field_7 = r0
    //     0x37dbbc: stur            w0, [x2, #7]
    // 0x37dbc0: d0 = 0.000000
    //     0x37dbc0: add             x17, PP, #8, lsl #12  ; [pp+0x8ca8] IMM: 0x41800000
    //     0x37dbc4: ldr             s0, [x17, #0xca8]
    // 0x37dbc8: StoreField: r0->field_1b = d0
    //     0x37dbc8: stur            s0, [x0, #0x1b]
    // 0x37dbcc: ldur            d1, [fp, #-0x40]
    // 0x37dbd0: fcvt            s2, d1
    // 0x37dbd4: ArrayStore: r0[0] = d2  ; List_8
    //     0x37dbd4: stur            s2, [x0, #0x17]
    // 0x37dbd8: r1 = <Forge2DGame<Forge2DWorld>>
    //     0x37dbd8: add             x1, PP, #0xc, lsl #12  ; [pp+0xc768] TypeArguments: <Forge2DGame<Forge2DWorld>>
    //     0x37dbdc: ldr             x1, [x1, #0x768]
    // 0x37dbe0: r0 = Monster()
    //     0x37dbe0: bl              #0x375fcc  ; AllocateMonsterStub -> Monster (size=0xa4)
    // 0x37dbe4: mov             x1, x0
    // 0x37dbe8: ldur            x2, [fp, #-0x38]
    // 0x37dbec: ldur            x3, [fp, #-8]
    // 0x37dbf0: stur            x0, [fp, #-0x38]
    // 0x37dbf4: r4 = const [0, 0x3, 0, 0x3, null]
    //     0x37dbf4: ldr             x4, [PP, #0x310]  ; [pp+0x310] List(5) [0, 0x3, 0, 0x3, Null]
    // 0x37dbf8: r0 = Monster()
    //     0x37dbf8: bl              #0x37347c  ; [package:ricochlime/flame/components/monster.dart] Monster::Monster
    // 0x37dbfc: ldur            x0, [fp, #-0x28]
    // 0x37dc00: LoadField: r1 = r0->field_b
    //     0x37dc00: ldur            w1, [x0, #0xb]
    // 0x37dc04: LoadField: r2 = r0->field_f
    //     0x37dc04: ldur            w2, [x0, #0xf]
    // 0x37dc08: DecompressPointer r2
    //     0x37dc08: add             x2, x2, HEAP, lsl #32
    // 0x37dc0c: LoadField: r3 = r2->field_b
    //     0x37dc0c: ldur            w3, [x2, #0xb]
    // 0x37dc10: r2 = LoadInt32Instr(r1)
    //     0x37dc10: sbfx            x2, x1, #1, #0x1f
    // 0x37dc14: stur            x2, [fp, #-0x18]
    // 0x37dc18: r1 = LoadInt32Instr(r3)
    //     0x37dc18: sbfx            x1, x3, #1, #0x1f
    // 0x37dc1c: cmp             x2, x1
    // 0x37dc20: b.ne            #0x37dc2c
    // 0x37dc24: mov             x1, x0
    // 0x37dc28: r0 = _growToNextCapacity()
    //     0x37dc28: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x37dc2c: ldur            x4, [fp, #-0x28]
    // 0x37dc30: ldur            x2, [fp, #-0x18]
    // 0x37dc34: add             x0, x2, #1
    // 0x37dc38: lsl             x1, x0, #1
    // 0x37dc3c: StoreField: r4->field_b = r1
    //     0x37dc3c: stur            w1, [x4, #0xb]
    // 0x37dc40: LoadField: r1 = r4->field_f
    //     0x37dc40: ldur            w1, [x4, #0xf]
    // 0x37dc44: DecompressPointer r1
    //     0x37dc44: add             x1, x1, HEAP, lsl #32
    // 0x37dc48: ldur            x0, [fp, #-0x38]
    // 0x37dc4c: ArrayStore: r1[r2] = r0  ; List_4
    //     0x37dc4c: add             x25, x1, x2, lsl #2
    //     0x37dc50: add             x25, x25, #0xf
    //     0x37dc54: str             w0, [x25]
    //     0x37dc58: tbz             w0, #0, #0x37dc74
    //     0x37dc5c: ldurb           w16, [x1, #-1]
    //     0x37dc60: ldurb           w17, [x0, #-1]
    //     0x37dc64: and             x16, x17, x16, lsr #2
    //     0x37dc68: tst             x16, HEAP, lsr #32
    //     0x37dc6c: b.eq            #0x37dc74
    //     0x37dc70: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x37dc74: ldur            x0, [fp, #-0x30]
    // 0x37dc78: add             x3, x0, #1
    // 0x37dc7c: mov             x0, x4
    // 0x37dc80: b               #0x37db00
    // 0x37dc84: mov             x4, x0
    // 0x37dc88: LoadField: r0 = r4->field_b
    //     0x37dc88: ldur            w0, [x4, #0xb]
    // 0x37dc8c: r2 = LoadInt32Instr(r0)
    //     0x37dc8c: sbfx            x2, x0, #1, #0x1f
    // 0x37dc90: ldur            x1, [fp, #-0x10]
    // 0x37dc94: r0 = nextInt()
    //     0x37dc94: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x37dc98: mov             x2, x0
    // 0x37dc9c: ldur            x3, [fp, #-0x28]
    // 0x37dca0: CheckStackOverflow
    //     0x37dca0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37dca4: cmp             SP, x16
    //     0x37dca8: b.ls            #0x37de54
    // 0x37dcac: LoadField: r0 = r3->field_b
    //     0x37dcac: ldur            w0, [x3, #0xb]
    // 0x37dcb0: r4 = LoadInt32Instr(r0)
    //     0x37dcb0: sbfx            x4, x0, #1, #0x1f
    // 0x37dcb4: mov             x0, x4
    // 0x37dcb8: mov             x1, x2
    // 0x37dcbc: cmp             x1, x0
    // 0x37dcc0: b.hs            #0x37de5c
    // 0x37dcc4: LoadField: r0 = r3->field_f
    //     0x37dcc4: ldur            w0, [x3, #0xf]
    // 0x37dcc8: DecompressPointer r0
    //     0x37dcc8: add             x0, x0, HEAP, lsl #32
    // 0x37dccc: ArrayLoad: r1 = r0[r2]  ; Unknown_4
    //     0x37dccc: add             x16, x0, x2, lsl #2
    //     0x37dcd0: ldur            w1, [x16, #0xf]
    // 0x37dcd4: DecompressPointer r1
    //     0x37dcd4: add             x1, x1, HEAP, lsl #32
    // 0x37dcd8: cmp             w1, NULL
    // 0x37dcdc: b.eq            #0x37dcf8
    // 0x37dce0: LoadField: r0 = r1->field_9b
    //     0x37dce0: ldur            w0, [x1, #0x9b]
    // 0x37dce4: DecompressPointer r0
    //     0x37dce4: add             x0, x0, HEAP, lsl #32
    // 0x37dce8: r16 = Instance_KillReward
    //     0x37dce8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc988] Obj!KillReward@5d8ac1
    //     0x37dcec: ldr             x16, [x16, #0x988]
    // 0x37dcf0: cmp             w0, w16
    // 0x37dcf4: b.eq            #0x37dd0c
    // 0x37dcf8: ldur            x1, [fp, #-0x10]
    // 0x37dcfc: mov             x2, x4
    // 0x37dd00: r0 = nextInt()
    //     0x37dd00: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x37dd04: mov             x2, x0
    // 0x37dd08: b               #0x37dc9c
    // 0x37dd0c: mov             x0, x3
    // 0x37dd10: r2 = Instance_KillReward
    //     0x37dd10: add             x2, PP, #0xc, lsl #12  ; [pp+0xc770] Obj!KillReward@5d8b01
    //     0x37dd14: ldr             x2, [x2, #0x770]
    // 0x37dd18: StoreField: r1->field_9b = r2
    //     0x37dd18: stur            w2, [x1, #0x9b]
    // 0x37dd1c: LoadField: r0 = r1->field_93
    //     0x37dd1c: ldur            w0, [x1, #0x93]
    // 0x37dd20: DecompressPointer r0
    //     0x37dd20: add             x0, x0, HEAP, lsl #32
    // 0x37dd24: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37dd28: cmp             w0, w16
    // 0x37dd2c: b.ne            #0x37dd3c
    // 0x37dd30: r2 = _animation
    //     0x37dd30: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x37dd34: ldr             x2, [x2, #0x7d0]
    // 0x37dd38: r0 = InitLateFinalInstanceField()
    //     0x37dd38: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37dd3c: mov             x1, x0
    // 0x37dd40: r2 = Instance_KillReward
    //     0x37dd40: add             x2, PP, #0xc, lsl #12  ; [pp+0xc770] Obj!KillReward@5d8b01
    //     0x37dd44: ldr             x2, [x2, #0x770]
    // 0x37dd48: r0 = setSpriteFromKillReward()
    //     0x37dd48: bl              #0x3743e4  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::setSpriteFromKillReward
    // 0x37dd4c: ldur            x0, [fp, #-0x28]
    // 0x37dd50: LoadField: r1 = r0->field_b
    //     0x37dd50: ldur            w1, [x0, #0xb]
    // 0x37dd54: r2 = LoadInt32Instr(r1)
    //     0x37dd54: sbfx            x2, x1, #1, #0x1f
    // 0x37dd58: ldur            x1, [fp, #-0x10]
    // 0x37dd5c: r0 = nextInt()
    //     0x37dd5c: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x37dd60: mov             x2, x0
    // 0x37dd64: ldur            x3, [fp, #-0x28]
    // 0x37dd68: CheckStackOverflow
    //     0x37dd68: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37dd6c: cmp             SP, x16
    //     0x37dd70: b.ls            #0x37de60
    // 0x37dd74: LoadField: r0 = r3->field_b
    //     0x37dd74: ldur            w0, [x3, #0xb]
    // 0x37dd78: r4 = LoadInt32Instr(r0)
    //     0x37dd78: sbfx            x4, x0, #1, #0x1f
    // 0x37dd7c: mov             x0, x4
    // 0x37dd80: mov             x1, x2
    // 0x37dd84: cmp             x1, x0
    // 0x37dd88: b.hs            #0x37de68
    // 0x37dd8c: LoadField: r0 = r3->field_f
    //     0x37dd8c: ldur            w0, [x3, #0xf]
    // 0x37dd90: DecompressPointer r0
    //     0x37dd90: add             x0, x0, HEAP, lsl #32
    // 0x37dd94: ArrayLoad: r1 = r0[r2]  ; Unknown_4
    //     0x37dd94: add             x16, x0, x2, lsl #2
    //     0x37dd98: ldur            w1, [x16, #0xf]
    // 0x37dd9c: DecompressPointer r1
    //     0x37dd9c: add             x1, x1, HEAP, lsl #32
    // 0x37dda0: cmp             w1, NULL
    // 0x37dda4: b.eq            #0x37ddc0
    // 0x37dda8: LoadField: r0 = r1->field_9b
    //     0x37dda8: ldur            w0, [x1, #0x9b]
    // 0x37ddac: DecompressPointer r0
    //     0x37ddac: add             x0, x0, HEAP, lsl #32
    // 0x37ddb0: r16 = Instance_KillReward
    //     0x37ddb0: add             x16, PP, #0xc, lsl #12  ; [pp+0xc988] Obj!KillReward@5d8ac1
    //     0x37ddb4: ldr             x16, [x16, #0x988]
    // 0x37ddb8: cmp             w0, w16
    // 0x37ddbc: b.eq            #0x37ddd4
    // 0x37ddc0: ldur            x1, [fp, #-0x10]
    // 0x37ddc4: mov             x2, x4
    // 0x37ddc8: r0 = nextInt()
    //     0x37ddc8: bl              #0x379df0  ; [dart:math] _Random::nextInt
    // 0x37ddcc: mov             x2, x0
    // 0x37ddd0: b               #0x37dd64
    // 0x37ddd4: r2 = Instance_KillReward
    //     0x37ddd4: add             x2, PP, #0xd, lsl #12  ; [pp+0xd3e0] Obj!KillReward@5d8ae1
    //     0x37ddd8: ldr             x2, [x2, #0x3e0]
    // 0x37dddc: StoreField: r1->field_9b = r2
    //     0x37dddc: stur            w2, [x1, #0x9b]
    // 0x37dde0: LoadField: r0 = r1->field_93
    //     0x37dde0: ldur            w0, [x1, #0x93]
    // 0x37dde4: DecompressPointer r0
    //     0x37dde4: add             x0, x0, HEAP, lsl #32
    // 0x37dde8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x37ddec: cmp             w0, w16
    // 0x37ddf0: b.ne            #0x37de00
    // 0x37ddf4: r2 = _animation
    //     0x37ddf4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7d0] Field <Monster._animation@228109025>: late final (offset: 0x94)
    //     0x37ddf8: ldr             x2, [x2, #0x7d0]
    // 0x37ddfc: r0 = InitLateFinalInstanceField()
    //     0x37ddfc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x37de00: mov             x1, x0
    // 0x37de04: r2 = Instance_KillReward
    //     0x37de04: add             x2, PP, #0xd, lsl #12  ; [pp+0xd3e0] Obj!KillReward@5d8ae1
    //     0x37de08: ldr             x2, [x2, #0x3e0]
    // 0x37de0c: r0 = setSpriteFromKillReward()
    //     0x37de0c: bl              #0x3743e4  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::setSpriteFromKillReward
    // 0x37de10: ldur            x0, [fp, #-0x28]
    // 0x37de14: LeaveFrame
    //     0x37de14: mov             SP, fp
    //     0x37de18: ldp             fp, lr, [SP], #0x10
    // 0x37de1c: ret
    //     0x37de1c: ret             
    // 0x37de20: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37de20: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37de24: b               #0x37d940
    // 0x37de28: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37de28: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37de2c: b               #0x37d960
    // 0x37de30: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37de30: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37de34: b               #0x37d994
    // 0x37de38: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37de38: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37de3c: b               #0x37da20
    // 0x37de40: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37de40: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37de44: b               #0x37da70
    // 0x37de48: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x37de48: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x37de4c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37de4c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37de50: b               #0x37db14
    // 0x37de54: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37de54: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37de58: b               #0x37dcac
    // 0x37de5c: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x37de5c: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
    // 0x37de60: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37de60: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37de64: b               #0x37dd74
    // 0x37de68: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x37de68: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  [closure] TickerDelayedInstruction? <anonymous closure>(dynamic) {
    // ** addr: 0x37df9c, size: 0x34
    // 0x37df9c: ldr             x1, [SP]
    // 0x37dfa0: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x37dfa0: ldur            w2, [x1, #0x17]
    // 0x37dfa4: DecompressPointer r2
    //     0x37dfa4: add             x2, x2, HEAP, lsl #32
    // 0x37dfa8: LoadField: r1 = r2->field_f
    //     0x37dfa8: ldur            w1, [x2, #0xf]
    // 0x37dfac: DecompressPointer r1
    //     0x37dfac: add             x1, x1, HEAP, lsl #32
    // 0x37dfb0: LoadField: r2 = r1->field_a3
    //     0x37dfb0: ldur            w2, [x1, #0xa3]
    // 0x37dfb4: DecompressPointer r2
    //     0x37dfb4: add             x2, x2, HEAP, lsl #32
    // 0x37dfb8: tbnz            w2, #4, #0x37dfc8
    // 0x37dfbc: r0 = Instance_TickerDelayedInstruction
    //     0x37dfbc: add             x0, PP, #0xc, lsl #12  ; [pp+0xcfe8] Obj!TickerDelayedInstruction@5d89e1
    //     0x37dfc0: ldr             x0, [x0, #0xfe8]
    // 0x37dfc4: b               #0x37dfcc
    // 0x37dfc8: r0 = Null
    //     0x37dfc8: mov             x0, NULL
    // 0x37dfcc: ret
    //     0x37dfcc: ret             
  }
  [closure] Future<void> <anonymous closure>(dynamic, Monster) {
    // ** addr: 0x37dfd0, size: 0x30
    // 0x37dfd0: EnterFrame
    //     0x37dfd0: stp             fp, lr, [SP, #-0x10]!
    //     0x37dfd4: mov             fp, SP
    // 0x37dfd8: CheckStackOverflow
    //     0x37dfd8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37dfdc: cmp             SP, x16
    //     0x37dfe0: b.ls            #0x37dff8
    // 0x37dfe4: ldr             x1, [fp, #0x10]
    // 0x37dfe8: r0 = loaded()
    //     0x37dfe8: bl              #0x37e000  ; [package:flame/src/components/core/component.dart] Component::loaded
    // 0x37dfec: LeaveFrame
    //     0x37dfec: mov             SP, fp
    //     0x37dff0: ldp             fp, lr, [SP], #0x10
    // 0x37dff4: ret
    //     0x37dff4: ret             
    // 0x37dff8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37dff8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37dffc: b               #0x37dfe4
  }
  AimGuide aimGuide(RicochlimeGame) {
    // ** addr: 0x37e114, size: 0x54
    // 0x37e114: EnterFrame
    //     0x37e114: stp             fp, lr, [SP, #-0x10]!
    //     0x37e118: mov             fp, SP
    // 0x37e11c: AllocStack(0x8)
    //     0x37e11c: sub             SP, SP, #8
    // 0x37e120: CheckStackOverflow
    //     0x37e120: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37e124: cmp             SP, x16
    //     0x37e128: b.ls            #0x37e160
    // 0x37e12c: r0 = AimGuide()
    //     0x37e12c: bl              #0x37e168  ; AllocateAimGuideStub -> AimGuide (size=0x5c)
    // 0x37e130: stur            x0, [fp, #-8]
    // 0x37e134: StoreField: r0->field_53 = rZR
    //     0x37e134: stur            xzr, [x0, #0x53]
    // 0x37e138: mov             x1, x0
    // 0x37e13c: r2 = Null
    //     0x37e13c: mov             x2, NULL
    // 0x37e140: r3 = Null
    //     0x37e140: mov             x3, NULL
    // 0x37e144: r5 = Null
    //     0x37e144: mov             x5, NULL
    // 0x37e148: r6 = Null
    //     0x37e148: mov             x6, NULL
    // 0x37e14c: r0 = PositionComponent()
    //     0x37e14c: bl              #0x372c44  ; [package:flame/src/components/position_component.dart] PositionComponent::PositionComponent
    // 0x37e150: ldur            x0, [fp, #-8]
    // 0x37e154: LeaveFrame
    //     0x37e154: mov             SP, fp
    //     0x37e158: ldp             fp, lr, [SP], #0x10
    // 0x37e15c: ret
    //     0x37e15c: ret             
    // 0x37e160: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37e160: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37e164: b               #0x37e12c
  }
  Random random(RicochlimeGame) {
    // ** addr: 0x37e174, size: 0x34
    // 0x37e174: EnterFrame
    //     0x37e174: stp             fp, lr, [SP, #-0x10]!
    //     0x37e178: mov             fp, SP
    // 0x37e17c: CheckStackOverflow
    //     0x37e17c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37e180: cmp             SP, x16
    //     0x37e184: b.ls            #0x37e1a0
    // 0x37e188: r1 = Null
    //     0x37e188: mov             x1, NULL
    // 0x37e18c: r4 = const [0, 0x1, 0, 0x1, null]
    //     0x37e18c: ldr             x4, [PP, #0x2b8]  ; [pp+0x2b8] List(5) [0, 0x1, 0, 0x1, Null]
    // 0x37e190: r0 = Random()
    //     0x37e190: bl              #0x37e1a8  ; [dart:math] Random::Random
    // 0x37e194: LeaveFrame
    //     0x37e194: mov             SP, fp
    //     0x37e198: ldp             fp, lr, [SP], #0x10
    // 0x37e19c: ret
    //     0x37e19c: ret             
    // 0x37e1a0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37e1a0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37e1a4: b               #0x37e188
  }
  [closure] Future<void> gameOver(dynamic) {
    // ** addr: 0x37e74c, size: 0x38
    // 0x37e74c: EnterFrame
    //     0x37e74c: stp             fp, lr, [SP, #-0x10]!
    //     0x37e750: mov             fp, SP
    // 0x37e754: ldr             x0, [fp, #0x10]
    // 0x37e758: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x37e758: ldur            w1, [x0, #0x17]
    // 0x37e75c: DecompressPointer r1
    //     0x37e75c: add             x1, x1, HEAP, lsl #32
    // 0x37e760: CheckStackOverflow
    //     0x37e760: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37e764: cmp             SP, x16
    //     0x37e768: b.ls            #0x37e77c
    // 0x37e76c: r0 = gameOver()
    //     0x37e76c: bl              #0x376b2c  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::gameOver
    // 0x37e770: LeaveFrame
    //     0x37e770: mov             SP, fp
    //     0x37e774: ldp             fp, lr, [SP], #0x10
    // 0x37e778: ret
    //     0x37e778: ret             
    // 0x37e77c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37e77c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37e780: b               #0x37e76c
  }
  _ resetChildren(/* No info */) {
    // ** addr: 0x37e784, size: 0x8c
    // 0x37e784: EnterFrame
    //     0x37e784: stp             fp, lr, [SP, #-0x10]!
    //     0x37e788: mov             fp, SP
    // 0x37e78c: AllocStack(0x8)
    //     0x37e78c: sub             SP, SP, #8
    // 0x37e790: SetupParameters(RicochlimeGame this /* r1 => r0, fp-0x8 */)
    //     0x37e790: mov             x0, x1
    //     0x37e794: stur            x1, [fp, #-8]
    // 0x37e798: CheckStackOverflow
    //     0x37e798: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x37e79c: cmp             SP, x16
    //     0x37e7a0: b.ls            #0x37e808
    // 0x37e7a4: r1 = Function '<anonymous closure>':.
    //     0x37e7a4: add             x1, PP, #0xd, lsl #12  ; [pp+0xd3e8] AnonymousClosure: (0x37e944), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::resetChildren (0x37e784)
    //     0x37e7a8: ldr             x1, [x1, #0x3e8]
    // 0x37e7ac: r2 = Null
    //     0x37e7ac: mov             x2, NULL
    // 0x37e7b0: r0 = AllocateClosure()
    //     0x37e7b0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37e7b4: ldur            x1, [fp, #-8]
    // 0x37e7b8: mov             x2, x0
    // 0x37e7bc: r0 = removeWhere()
    //     0x37e7bc: bl              #0x37e810  ; [package:flame/src/components/core/component.dart] Component::removeWhere
    // 0x37e7c0: r1 = Function '<anonymous closure>':.
    //     0x37e7c0: add             x1, PP, #0xd, lsl #12  ; [pp+0xd3f0] AnonymousClosure: (0x37e924), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::resetChildren (0x37e784)
    //     0x37e7c4: ldr             x1, [x1, #0x3f0]
    // 0x37e7c8: r2 = Null
    //     0x37e7c8: mov             x2, NULL
    // 0x37e7cc: r0 = AllocateClosure()
    //     0x37e7cc: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37e7d0: ldur            x1, [fp, #-8]
    // 0x37e7d4: mov             x2, x0
    // 0x37e7d8: r0 = removeWhere()
    //     0x37e7d8: bl              #0x37e810  ; [package:flame/src/components/core/component.dart] Component::removeWhere
    // 0x37e7dc: r1 = Function '<anonymous closure>':.
    //     0x37e7dc: add             x1, PP, #0xd, lsl #12  ; [pp+0xd3f8] AnonymousClosure: (0x37e904), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::resetChildren (0x37e784)
    //     0x37e7e0: ldr             x1, [x1, #0x3f8]
    // 0x37e7e4: r2 = Null
    //     0x37e7e4: mov             x2, NULL
    // 0x37e7e8: r0 = AllocateClosure()
    //     0x37e7e8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x37e7ec: ldur            x1, [fp, #-8]
    // 0x37e7f0: mov             x2, x0
    // 0x37e7f4: r0 = removeWhere()
    //     0x37e7f4: bl              #0x37e810  ; [package:flame/src/components/core/component.dart] Component::removeWhere
    // 0x37e7f8: r0 = Null
    //     0x37e7f8: mov             x0, NULL
    // 0x37e7fc: LeaveFrame
    //     0x37e7fc: mov             SP, fp
    //     0x37e800: ldp             fp, lr, [SP], #0x10
    // 0x37e804: ret
    //     0x37e804: ret             
    // 0x37e808: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x37e808: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x37e80c: b               #0x37e7a4
  }
  [closure] bool <anonymous closure>(dynamic, Component) {
    // ** addr: 0x37e904, size: 0x20
    // 0x37e904: ldr             x1, [SP]
    // 0x37e908: r2 = LoadClassIdInstr(r1)
    //     0x37e908: ldur            x2, [x1, #-1]
    //     0x37e90c: ubfx            x2, x2, #0xc, #0x14
    // 0x37e910: cmp             x2, #0x774
    // 0x37e914: r16 = true
    //     0x37e914: add             x16, NULL, #0x20  ; true
    // 0x37e918: r17 = false
    //     0x37e918: add             x17, NULL, #0x30  ; false
    // 0x37e91c: csel            x0, x16, x17, eq
    // 0x37e920: ret
    //     0x37e920: ret             
  }
  [closure] bool <anonymous closure>(dynamic, Component) {
    // ** addr: 0x37e924, size: 0x20
    // 0x37e924: ldr             x1, [SP]
    // 0x37e928: r2 = LoadClassIdInstr(r1)
    //     0x37e928: ldur            x2, [x1, #-1]
    //     0x37e92c: ubfx            x2, x2, #0xc, #0x14
    // 0x37e930: cmp             x2, #0x762
    // 0x37e934: r16 = true
    //     0x37e934: add             x16, NULL, #0x20  ; true
    // 0x37e938: r17 = false
    //     0x37e938: add             x17, NULL, #0x30  ; false
    // 0x37e93c: csel            x0, x16, x17, eq
    // 0x37e940: ret
    //     0x37e940: ret             
  }
  [closure] bool <anonymous closure>(dynamic, Component) {
    // ** addr: 0x37e944, size: 0x20
    // 0x37e944: ldr             x1, [SP]
    // 0x37e948: r2 = LoadClassIdInstr(r1)
    //     0x37e948: ldur            x2, [x1, #-1]
    //     0x37e94c: ubfx            x2, x2, #0xc, #0x14
    // 0x37e950: cmp             x2, #0x763
    // 0x37e954: r16 = true
    //     0x37e954: add             x16, NULL, #0x20  ; true
    // 0x37e958: r17 = false
    //     0x37e958: add             x17, NULL, #0x30  ; false
    // 0x37e95c: csel            x0, x16, x17, eq
    // 0x37e960: ret
    //     0x37e960: ret             
  }
  static ValueNotifier<bool> isDarkMode() {
    // ** addr: 0x380a2c, size: 0x78
    // 0x380a2c: EnterFrame
    //     0x380a2c: stp             fp, lr, [SP, #-0x10]!
    //     0x380a30: mov             fp, SP
    // 0x380a34: AllocStack(0x8)
    //     0x380a34: sub             SP, SP, #8
    // 0x380a38: CheckStackOverflow
    //     0x380a38: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x380a3c: cmp             SP, x16
    //     0x380a40: b.ls            #0x380a9c
    // 0x380a44: r1 = <bool>
    //     0x380a44: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x380a48: r0 = ValueNotifier()
    //     0x380a48: bl              #0x28b614  ; AllocateValueNotifierStub -> ValueNotifier<X0> (size=0x2c)
    // 0x380a4c: mov             x1, x0
    // 0x380a50: r0 = false
    //     0x380a50: add             x0, NULL, #0x30  ; false
    // 0x380a54: stur            x1, [fp, #-8]
    // 0x380a58: StoreField: r1->field_27 = r0
    //     0x380a58: stur            w0, [x1, #0x27]
    // 0x380a5c: StoreField: r1->field_7 = rZR
    //     0x380a5c: stur            xzr, [x1, #7]
    // 0x380a60: StoreField: r1->field_13 = rZR
    //     0x380a60: stur            xzr, [x1, #0x13]
    // 0x380a64: StoreField: r1->field_1b = rZR
    //     0x380a64: stur            xzr, [x1, #0x1b]
    // 0x380a68: r0 = LoadStaticField(0x448)
    //     0x380a68: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x380a6c: ldr             x0, [x0, #0x890]
    // 0x380a70: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x380a74: cmp             w0, w16
    // 0x380a78: b.ne            #0x380a84
    // 0x380a7c: r2 = _emptyListeners
    //     0x380a7c: ldr             x2, [PP, #0x36b8]  ; [pp+0x36b8] Field <ChangeNotifier._emptyListeners@27329750>: static late final (offset: 0x448)
    // 0x380a80: r0 = InitLateFinalStaticField()
    //     0x380a80: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x380a84: mov             x1, x0
    // 0x380a88: ldur            x0, [fp, #-8]
    // 0x380a8c: StoreField: r0->field_f = r1
    //     0x380a8c: stur            w1, [x0, #0xf]
    // 0x380a90: LeaveFrame
    //     0x380a90: mov             SP, fp
    //     0x380a94: ldp             fp, lr, [SP], #0x10
    // 0x380a98: ret
    //     0x380a98: ret             
    // 0x380a9c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x380a9c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x380aa0: b               #0x380a44
  }
  ValueNotifier<GameState> state(RicochlimeGame) {
    // ** addr: 0x380cb4, size: 0xb8
    // 0x380cb4: EnterFrame
    //     0x380cb4: stp             fp, lr, [SP, #-0x10]!
    //     0x380cb8: mov             fp, SP
    // 0x380cbc: AllocStack(0x10)
    //     0x380cbc: sub             SP, SP, #0x10
    // 0x380cc0: CheckStackOverflow
    //     0x380cc0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x380cc4: cmp             SP, x16
    //     0x380cc8: b.ls            #0x380d64
    // 0x380ccc: r1 = 1
    //     0x380ccc: mov             x1, #1
    // 0x380cd0: r0 = AllocateContext()
    //     0x380cd0: bl              #0x5834e8  ; AllocateContextStub
    // 0x380cd4: mov             x2, x0
    // 0x380cd8: ldr             x0, [fp, #0x10]
    // 0x380cdc: stur            x2, [fp, #-8]
    // 0x380ce0: StoreField: r2->field_f = r0
    //     0x380ce0: stur            w0, [x2, #0xf]
    // 0x380ce4: r1 = <GameState>
    //     0x380ce4: add             x1, PP, #0xc, lsl #12  ; [pp+0xc7a8] TypeArguments: <GameState>
    //     0x380ce8: ldr             x1, [x1, #0x7a8]
    // 0x380cec: r0 = ValueNotifier()
    //     0x380cec: bl              #0x28b614  ; AllocateValueNotifierStub -> ValueNotifier<X0> (size=0x2c)
    // 0x380cf0: mov             x1, x0
    // 0x380cf4: r0 = Instance_GameState
    //     0x380cf4: add             x0, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x380cf8: ldr             x0, [x0, #0x798]
    // 0x380cfc: stur            x1, [fp, #-0x10]
    // 0x380d00: StoreField: r1->field_27 = r0
    //     0x380d00: stur            w0, [x1, #0x27]
    // 0x380d04: StoreField: r1->field_7 = rZR
    //     0x380d04: stur            xzr, [x1, #7]
    // 0x380d08: StoreField: r1->field_13 = rZR
    //     0x380d08: stur            xzr, [x1, #0x13]
    // 0x380d0c: StoreField: r1->field_1b = rZR
    //     0x380d0c: stur            xzr, [x1, #0x1b]
    // 0x380d10: r0 = LoadStaticField(0x448)
    //     0x380d10: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x380d14: ldr             x0, [x0, #0x890]
    // 0x380d18: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x380d1c: cmp             w0, w16
    // 0x380d20: b.ne            #0x380d2c
    // 0x380d24: r2 = _emptyListeners
    //     0x380d24: ldr             x2, [PP, #0x36b8]  ; [pp+0x36b8] Field <ChangeNotifier._emptyListeners@27329750>: static late final (offset: 0x448)
    // 0x380d28: r0 = InitLateFinalStaticField()
    //     0x380d28: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x380d2c: mov             x1, x0
    // 0x380d30: ldur            x0, [fp, #-0x10]
    // 0x380d34: StoreField: r0->field_f = r1
    //     0x380d34: stur            w1, [x0, #0xf]
    // 0x380d38: ldur            x2, [fp, #-8]
    // 0x380d3c: r1 = Function '<anonymous closure>':.
    //     0x380d3c: add             x1, PP, #0xc, lsl #12  ; [pp+0xc7b0] AnonymousClosure: (0x380d6c), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::state (0x380cb4)
    //     0x380d40: ldr             x1, [x1, #0x7b0]
    // 0x380d44: r0 = AllocateClosure()
    //     0x380d44: bl              #0x5838bc  ; AllocateClosureStub
    // 0x380d48: ldur            x1, [fp, #-0x10]
    // 0x380d4c: mov             x2, x0
    // 0x380d50: r0 = addListener()
    //     0x380d50: bl              #0x4d539c  ; [package:flutter/src/foundation/change_notifier.dart] ChangeNotifier::addListener
    // 0x380d54: ldur            x0, [fp, #-0x10]
    // 0x380d58: LeaveFrame
    //     0x380d58: mov             SP, fp
    //     0x380d5c: ldp             fp, lr, [SP], #0x10
    // 0x380d60: ret
    //     0x380d60: ret             
    // 0x380d64: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x380d64: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x380d68: b               #0x380ccc
  }
  [closure] void <anonymous closure>(dynamic) {
    // ** addr: 0x380d6c, size: 0xa8
    // 0x380d6c: EnterFrame
    //     0x380d6c: stp             fp, lr, [SP, #-0x10]!
    //     0x380d70: mov             fp, SP
    // 0x380d74: ldr             x0, [fp, #0x10]
    // 0x380d78: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x380d78: ldur            w1, [x0, #0x17]
    // 0x380d7c: DecompressPointer r1
    //     0x380d7c: add             x1, x1, HEAP, lsl #32
    // 0x380d80: CheckStackOverflow
    //     0x380d80: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x380d84: cmp             SP, x16
    //     0x380d88: b.ls            #0x380e0c
    // 0x380d8c: LoadField: r0 = r1->field_f
    //     0x380d8c: ldur            w0, [x1, #0xf]
    // 0x380d90: DecompressPointer r0
    //     0x380d90: add             x0, x0, HEAP, lsl #32
    // 0x380d94: mov             x1, x0
    // 0x380d98: LoadField: r0 = r1->field_8f
    //     0x380d98: ldur            w0, [x1, #0x8f]
    // 0x380d9c: DecompressPointer r0
    //     0x380d9c: add             x0, x0, HEAP, lsl #32
    // 0x380da0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x380da4: cmp             w0, w16
    // 0x380da8: b.ne            #0x380db8
    // 0x380dac: r2 = state
    //     0x380dac: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x380db0: ldr             x2, [x2, #0x790]
    // 0x380db4: r0 = InitLateFinalInstanceField()
    //     0x380db4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x380db8: LoadField: r1 = r0->field_27
    //     0x380db8: ldur            w1, [x0, #0x27]
    // 0x380dbc: DecompressPointer r1
    //     0x380dbc: add             x1, x1, HEAP, lsl #32
    // 0x380dc0: r16 = Instance_GameState
    //     0x380dc0: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7b8] Obj!GameState@5d8a01
    //     0x380dc4: ldr             x16, [x16, #0x7b8]
    // 0x380dc8: cmp             w1, w16
    // 0x380dcc: b.eq            #0x380dfc
    // 0x380dd0: r0 = LoadStaticField(0x870)
    //     0x380dd0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x380dd4: ldr             x0, [x0, #0x10e0]
    // 0x380dd8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x380ddc: cmp             w0, w16
    // 0x380de0: b.ne            #0x380df0
    // 0x380de4: r2 = timeDilation
    //     0x380de4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7c0] Field <RicochlimeGame.timeDilation>: static late final (offset: 0x870)
    //     0x380de8: ldr             x2, [x2, #0x7c0]
    // 0x380dec: r0 = InitLateFinalStaticField()
    //     0x380dec: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x380df0: mov             x1, x0
    // 0x380df4: r2 = 1.000000
    //     0x380df4: ldr             x2, [PP, #0x78a0]  ; [pp+0x78a0] 1
    // 0x380df8: r0 = value=()
    //     0x380df8: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x380dfc: r0 = Null
    //     0x380dfc: mov             x0, NULL
    // 0x380e00: LeaveFrame
    //     0x380e00: mov             SP, fp
    //     0x380e04: ldp             fp, lr, [SP], #0x10
    // 0x380e08: ret
    //     0x380e08: ret             
    // 0x380e0c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x380e0c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x380e10: b               #0x380d8c
  }
  static ValueNotifier<double> timeDilation() {
    // ** addr: 0x380e14, size: 0x78
    // 0x380e14: EnterFrame
    //     0x380e14: stp             fp, lr, [SP, #-0x10]!
    //     0x380e18: mov             fp, SP
    // 0x380e1c: AllocStack(0x8)
    //     0x380e1c: sub             SP, SP, #8
    // 0x380e20: CheckStackOverflow
    //     0x380e20: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x380e24: cmp             SP, x16
    //     0x380e28: b.ls            #0x380e84
    // 0x380e2c: r1 = <double>
    //     0x380e2c: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x380e30: r0 = ValueNotifier()
    //     0x380e30: bl              #0x28b614  ; AllocateValueNotifierStub -> ValueNotifier<X0> (size=0x2c)
    // 0x380e34: mov             x1, x0
    // 0x380e38: r0 = 1.000000
    //     0x380e38: ldr             x0, [PP, #0x78a0]  ; [pp+0x78a0] 1
    // 0x380e3c: stur            x1, [fp, #-8]
    // 0x380e40: StoreField: r1->field_27 = r0
    //     0x380e40: stur            w0, [x1, #0x27]
    // 0x380e44: StoreField: r1->field_7 = rZR
    //     0x380e44: stur            xzr, [x1, #7]
    // 0x380e48: StoreField: r1->field_13 = rZR
    //     0x380e48: stur            xzr, [x1, #0x13]
    // 0x380e4c: StoreField: r1->field_1b = rZR
    //     0x380e4c: stur            xzr, [x1, #0x1b]
    // 0x380e50: r0 = LoadStaticField(0x448)
    //     0x380e50: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x380e54: ldr             x0, [x0, #0x890]
    // 0x380e58: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x380e5c: cmp             w0, w16
    // 0x380e60: b.ne            #0x380e6c
    // 0x380e64: r2 = _emptyListeners
    //     0x380e64: ldr             x2, [PP, #0x36b8]  ; [pp+0x36b8] Field <ChangeNotifier._emptyListeners@27329750>: static late final (offset: 0x448)
    // 0x380e68: r0 = InitLateFinalStaticField()
    //     0x380e68: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x380e6c: mov             x1, x0
    // 0x380e70: ldur            x0, [fp, #-8]
    // 0x380e74: StoreField: r0->field_f = r1
    //     0x380e74: stur            w1, [x0, #0xf]
    // 0x380e78: LeaveFrame
    //     0x380e78: mov             SP, fp
    //     0x380e7c: ldp             fp, lr, [SP], #0x10
    // 0x380e80: ret
    //     0x380e80: ret             
    // 0x380e84: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x380e84: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x380e88: b               #0x380e2c
  }
  static ValueNotifier<int> score() {
    // ** addr: 0x380e8c, size: 0x70
    // 0x380e8c: EnterFrame
    //     0x380e8c: stp             fp, lr, [SP, #-0x10]!
    //     0x380e90: mov             fp, SP
    // 0x380e94: AllocStack(0x8)
    //     0x380e94: sub             SP, SP, #8
    // 0x380e98: CheckStackOverflow
    //     0x380e98: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x380e9c: cmp             SP, x16
    //     0x380ea0: b.ls            #0x380ef4
    // 0x380ea4: r1 = <int>
    //     0x380ea4: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x380ea8: r0 = ValueNotifier()
    //     0x380ea8: bl              #0x28b614  ; AllocateValueNotifierStub -> ValueNotifier<X0> (size=0x2c)
    // 0x380eac: stur            x0, [fp, #-8]
    // 0x380eb0: StoreField: r0->field_27 = rZR
    //     0x380eb0: stur            wzr, [x0, #0x27]
    // 0x380eb4: StoreField: r0->field_7 = rZR
    //     0x380eb4: stur            xzr, [x0, #7]
    // 0x380eb8: StoreField: r0->field_13 = rZR
    //     0x380eb8: stur            xzr, [x0, #0x13]
    // 0x380ebc: StoreField: r0->field_1b = rZR
    //     0x380ebc: stur            xzr, [x0, #0x1b]
    // 0x380ec0: r0 = LoadStaticField(0x448)
    //     0x380ec0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x380ec4: ldr             x0, [x0, #0x890]
    // 0x380ec8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x380ecc: cmp             w0, w16
    // 0x380ed0: b.ne            #0x380edc
    // 0x380ed4: r2 = _emptyListeners
    //     0x380ed4: ldr             x2, [PP, #0x36b8]  ; [pp+0x36b8] Field <ChangeNotifier._emptyListeners@27329750>: static late final (offset: 0x448)
    // 0x380ed8: r0 = InitLateFinalStaticField()
    //     0x380ed8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x380edc: mov             x1, x0
    // 0x380ee0: ldur            x0, [fp, #-8]
    // 0x380ee4: StoreField: r0->field_f = r1
    //     0x380ee4: stur            w1, [x0, #0xf]
    // 0x380ee8: LeaveFrame
    //     0x380ee8: mov             SP, fp
    //     0x380eec: ldp             fp, lr, [SP], #0x10
    // 0x380ef0: ret
    //     0x380ef0: ret             
    // 0x380ef4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x380ef4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x380ef8: b               #0x380ea4
  }
  _ backgroundColor(/* No info */) {
    // ** addr: 0x383364, size: 0x68
    // 0x383364: EnterFrame
    //     0x383364: stp             fp, lr, [SP, #-0x10]!
    //     0x383368: mov             fp, SP
    // 0x38336c: CheckStackOverflow
    //     0x38336c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x383370: cmp             SP, x16
    //     0x383374: b.ls            #0x3833c4
    // 0x383378: r0 = LoadStaticField(0x86c)
    //     0x383378: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x38337c: ldr             x0, [x0, #0x10d8]
    // 0x383380: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x383384: cmp             w0, w16
    // 0x383388: b.ne            #0x383398
    // 0x38338c: r2 = isDarkMode
    //     0x38338c: add             x2, PP, #0x14, lsl #12  ; [pp+0x14380] Field <RicochlimeGame.isDarkMode>: static late final (offset: 0x86c)
    //     0x383390: ldr             x2, [x2, #0x380]
    // 0x383394: r0 = InitLateFinalStaticField()
    //     0x383394: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x383398: LoadField: r1 = r0->field_27
    //     0x383398: ldur            w1, [x0, #0x27]
    // 0x38339c: DecompressPointer r1
    //     0x38339c: add             x1, x1, HEAP, lsl #32
    // 0x3833a0: tbnz            w1, #4, #0x3833b0
    // 0x3833a4: r0 = Instance_Color
    //     0x3833a4: add             x0, PP, #9, lsl #12  ; [pp+0x9130] Obj!Color@5cf7f1
    //     0x3833a8: ldr             x0, [x0, #0x130]
    // 0x3833ac: b               #0x3833b8
    // 0x3833b0: r0 = Instance_Color
    //     0x3833b0: add             x0, PP, #8, lsl #12  ; [pp+0x8d18] Obj!Color@5ce4d1
    //     0x3833b4: ldr             x0, [x0, #0xd18]
    // 0x3833b8: LeaveFrame
    //     0x3833b8: mov             SP, fp
    //     0x3833bc: ldp             fp, lr, [SP], #0x10
    // 0x3833c0: ret
    //     0x3833c0: ret             
    // 0x3833c4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3833c4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3833c8: b               #0x383378
  }
  [closure] void onMouseMove(dynamic, PointerHoverInfo) {
    // ** addr: 0x3837bc, size: 0x58
    // 0x3837bc: EnterFrame
    //     0x3837bc: stp             fp, lr, [SP, #-0x10]!
    //     0x3837c0: mov             fp, SP
    // 0x3837c4: ldr             x0, [fp, #0x18]
    // 0x3837c8: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x3837c8: ldur            w1, [x0, #0x17]
    // 0x3837cc: DecompressPointer r1
    //     0x3837cc: add             x1, x1, HEAP, lsl #32
    // 0x3837d0: CheckStackOverflow
    //     0x3837d0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3837d4: cmp             SP, x16
    //     0x3837d8: b.ls            #0x38380c
    // 0x3837dc: LoadField: r0 = r1->field_cf
    //     0x3837dc: ldur            w0, [x1, #0xcf]
    // 0x3837e0: DecompressPointer r0
    //     0x3837e0: add             x0, x0, HEAP, lsl #32
    // 0x3837e4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3837e8: cmp             w0, w16
    // 0x3837ec: b.ne            #0x3837fc
    // 0x3837f0: r2 = pointAndClickEnabled
    //     0x3837f0: add             x2, PP, #0x11, lsl #12  ; [pp+0x11c20] Field <RicochlimeGame.pointAndClickEnabled>: late final (offset: 0xd0)
    //     0x3837f4: ldr             x2, [x2, #0xc20]
    // 0x3837f8: r0 = InitLateFinalInstanceField()
    //     0x3837f8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3837fc: r0 = Null
    //     0x3837fc: mov             x0, NULL
    // 0x383800: LeaveFrame
    //     0x383800: mov             SP, fp
    //     0x383804: ldp             fp, lr, [SP], #0x10
    // 0x383808: ret
    //     0x383808: ret             
    // 0x38380c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x38380c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x383810: b               #0x3837dc
  }
  _ onPanEnd(/* No info */) {
    // ** addr: 0x38553c, size: 0xb4
    // 0x38553c: EnterFrame
    //     0x38553c: stp             fp, lr, [SP, #-0x10]!
    //     0x385540: mov             fp, SP
    // 0x385544: AllocStack(0x8)
    //     0x385544: sub             SP, SP, #8
    // 0x385548: SetupParameters(RicochlimeGame this /* r1 => r0, fp-0x8 */)
    //     0x385548: mov             x0, x1
    //     0x38554c: stur            x1, [fp, #-8]
    // 0x385550: CheckStackOverflow
    //     0x385550: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x385554: cmp             SP, x16
    //     0x385558: b.ls            #0x3855e8
    // 0x38555c: mov             x1, x0
    // 0x385560: LoadField: r0 = r1->field_97
    //     0x385560: ldur            w0, [x1, #0x97]
    // 0x385564: DecompressPointer r0
    //     0x385564: add             x0, x0, HEAP, lsl #32
    // 0x385568: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x38556c: cmp             w0, w16
    // 0x385570: b.ne            #0x385580
    // 0x385574: r2 = aimGuide
    //     0x385574: add             x2, PP, #0xc, lsl #12  ; [pp+0xc708] Field <RicochlimeGame.aimGuide>: late final (offset: 0x98)
    //     0x385578: ldr             x2, [x2, #0x708]
    // 0x38557c: r0 = InitLateFinalInstanceField()
    //     0x38557c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x385580: StoreField: r0->field_4f = rNULL
    //     0x385580: stur            NULL, [x0, #0x4f]
    // 0x385584: ldur            x1, [fp, #-8]
    // 0x385588: LoadField: r0 = r1->field_8f
    //     0x385588: ldur            w0, [x1, #0x8f]
    // 0x38558c: DecompressPointer r0
    //     0x38558c: add             x0, x0, HEAP, lsl #32
    // 0x385590: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x385594: cmp             w0, w16
    // 0x385598: b.ne            #0x3855a8
    // 0x38559c: r2 = state
    //     0x38559c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x3855a0: ldr             x2, [x2, #0x790]
    // 0x3855a4: r0 = InitLateFinalInstanceField()
    //     0x3855a4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3855a8: LoadField: r1 = r0->field_27
    //     0x3855a8: ldur            w1, [x0, #0x27]
    // 0x3855ac: DecompressPointer r1
    //     0x3855ac: add             x1, x1, HEAP, lsl #32
    // 0x3855b0: r16 = Instance_GameState
    //     0x3855b0: add             x16, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x3855b4: ldr             x16, [x16, #0x798]
    // 0x3855b8: cmp             w1, w16
    // 0x3855bc: b.eq            #0x3855d0
    // 0x3855c0: r0 = Null
    //     0x3855c0: mov             x0, NULL
    // 0x3855c4: LeaveFrame
    //     0x3855c4: mov             SP, fp
    //     0x3855c8: ldp             fp, lr, [SP], #0x10
    // 0x3855cc: ret
    //     0x3855cc: ret             
    // 0x3855d0: ldur            x1, [fp, #-8]
    // 0x3855d4: r0 = _spawnBullets()
    //     0x3855d4: bl              #0x3855f0  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::_spawnBullets
    // 0x3855d8: r0 = Null
    //     0x3855d8: mov             x0, NULL
    // 0x3855dc: LeaveFrame
    //     0x3855dc: mov             SP, fp
    //     0x3855e0: ldp             fp, lr, [SP], #0x10
    // 0x3855e4: ret
    //     0x3855e4: ret             
    // 0x3855e8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3855e8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3855ec: b               #0x38555c
  }
  _ _spawnBullets(/* No info */) async {
    // ** addr: 0x3855f0, size: 0xa54
    // 0x3855f0: EnterFrame
    //     0x3855f0: stp             fp, lr, [SP, #-0x10]!
    //     0x3855f4: mov             fp, SP
    // 0x3855f8: AllocStack(0x100)
    //     0x3855f8: sub             SP, SP, #0x100
    // 0x3855fc: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0x90 */)
    //     0x3855fc: stur            NULL, [fp, #-8]
    //     0x385600: stur            x1, [fp, #-0x90]
    // 0x385604: CheckStackOverflow
    //     0x385604: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x385608: cmp             SP, x16
    //     0x38560c: b.ls            #0x386018
    // 0x385610: InitAsync() -> Future<void?>
    //     0x385610: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x385614: bl              #0x2556b4  ; InitAsyncStub
    // 0x385618: ldur            x1, [fp, #-0x90]
    // 0x38561c: LoadField: r0 = r1->field_97
    //     0x38561c: ldur            w0, [x1, #0x97]
    // 0x385620: DecompressPointer r0
    //     0x385620: add             x0, x0, HEAP, lsl #32
    // 0x385624: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x385628: cmp             w0, w16
    // 0x38562c: b.ne            #0x38563c
    // 0x385630: r2 = aimGuide
    //     0x385630: add             x2, PP, #0xc, lsl #12  ; [pp+0xc708] Field <RicochlimeGame.aimGuide>: late final (offset: 0x98)
    //     0x385634: ldr             x2, [x2, #0x708]
    // 0x385638: r0 = InitLateFinalInstanceField()
    //     0x385638: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x38563c: mov             x1, x0
    // 0x385640: r0 = finishAim()
    //     0x385640: bl              #0x386110  ; [package:ricochlime/flame/components/aim_guide.dart] AimGuide::finishAim
    // 0x385644: stur            x0, [fp, #-0x98]
    // 0x385648: cmp             w0, NULL
    // 0x38564c: b.ne            #0x385658
    // 0x385650: r0 = Null
    //     0x385650: mov             x0, NULL
    // 0x385654: r0 = ReturnAsyncNotFuture()
    //     0x385654: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x385658: ldur            x2, [fp, #-0x90]
    // 0x38565c: mov             x1, x2
    // 0x385660: LoadField: r0 = r1->field_8f
    //     0x385660: ldur            w0, [x1, #0x8f]
    // 0x385664: DecompressPointer r0
    //     0x385664: add             x0, x0, HEAP, lsl #32
    // 0x385668: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x38566c: cmp             w0, w16
    // 0x385670: b.ne            #0x385680
    // 0x385674: r2 = state
    //     0x385674: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x385678: ldr             x2, [x2, #0x790]
    // 0x38567c: r0 = InitLateFinalInstanceField()
    //     0x38567c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x385680: mov             x1, x0
    // 0x385684: r2 = Instance_GameState
    //     0x385684: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7b8] Obj!GameState@5d8a01
    //     0x385688: ldr             x2, [x2, #0x7b8]
    // 0x38568c: r0 = value=()
    //     0x38568c: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x385690: ldur            x0, [fp, #-0x90]
    // 0x385694: r2 = false
    //     0x385694: add             x2, NULL, #0x30  ; false
    // 0x385698: StoreField: r0->field_a3 = r2
    //     0x385698: stur            w2, [x0, #0xa3]
    // 0x38569c: mov             x1, x0
    // 0x3856a0: LoadField: r0 = r1->field_93
    //     0x3856a0: ldur            w0, [x1, #0x93]
    // 0x3856a4: DecompressPointer r0
    //     0x3856a4: add             x0, x0, HEAP, lsl #32
    // 0x3856a8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3856ac: cmp             w0, w16
    // 0x3856b0: b.ne            #0x3856c0
    // 0x3856b4: r2 = player
    //     0x3856b4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x3856b8: ldr             x2, [x2, #0x700]
    // 0x3856bc: r0 = InitLateFinalInstanceField()
    //     0x3856bc: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3856c0: mov             x1, x0
    // 0x3856c4: r0 = attack()
    //     0x3856c4: bl              #0x386070  ; [package:ricochlime/flame/components/player.dart] Player::attack
    // 0x3856c8: ldur            x0, [fp, #-0x90]
    // 0x3856cc: r1 = <Bullet>
    //     0x3856cc: add             x1, PP, #0x19, lsl #12  ; [pp+0x19dd8] TypeArguments: <Bullet>
    //     0x3856d0: ldr             x1, [x1, #0xdd8]
    // 0x3856d4: r2 = 0
    //     0x3856d4: mov             x2, #0
    // 0x3856d8: r0 = _GrowableList()
    //     0x3856d8: bl              #0x237730  ; [dart:core] _GrowableList::_GrowableList
    // 0x3856dc: mov             x2, x0
    // 0x3856e0: ldur            x0, [fp, #-0x90]
    // 0x3856e4: stur            x2, [fp, #-0xb8]
    // 0x3856e8: LoadField: r3 = r0->field_bb
    //     0x3856e8: ldur            w3, [x0, #0xbb]
    // 0x3856ec: DecompressPointer r3
    //     0x3856ec: add             x3, x3, HEAP, lsl #32
    // 0x3856f0: stur            x3, [fp, #-0xb0]
    // 0x3856f4: r5 = 0
    //     0x3856f4: mov             x5, #0
    // 0x3856f8: ldur            x4, [fp, #-0x98]
    // 0x3856fc: stur            x5, [fp, #-0xa8]
    // 0x385700: CheckStackOverflow
    //     0x385700: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x385704: cmp             SP, x16
    //     0x385708: b.ls            #0x386020
    // 0x38570c: LoadField: r1 = r0->field_ab
    //     0x38570c: ldur            x1, [x0, #0xab]
    // 0x385710: cmp             x5, x1
    // 0x385714: b.ge            #0x385918
    // 0x385718: LoadField: r1 = r0->field_97
    //     0x385718: ldur            w1, [x0, #0x97]
    // 0x38571c: DecompressPointer r1
    //     0x38571c: add             x1, x1, HEAP, lsl #32
    // 0x385720: LoadField: r6 = r1->field_37
    //     0x385720: ldur            w6, [x1, #0x37]
    // 0x385724: DecompressPointer r6
    //     0x385724: add             x6, x6, HEAP, lsl #32
    // 0x385728: LoadField: r7 = r6->field_37
    //     0x385728: ldur            w7, [x6, #0x37]
    // 0x38572c: DecompressPointer r7
    //     0x38572c: add             x7, x7, HEAP, lsl #32
    // 0x385730: stur            x7, [fp, #-0xa0]
    // 0x385734: r1 = <Forge2DGame<Forge2DWorld>>
    //     0x385734: add             x1, PP, #0xc, lsl #12  ; [pp+0xc768] TypeArguments: <Forge2DGame<Forge2DWorld>>
    //     0x385738: ldr             x1, [x1, #0x768]
    // 0x38573c: r0 = Bullet()
    //     0x38573c: bl              #0x386044  ; AllocateBulletStub -> Bullet (size=0x88)
    // 0x385740: stur            x0, [fp, #-0xc0]
    // 0x385744: StoreField: r0->field_7f = rZR
    //     0x385744: stur            xzr, [x0, #0x7f]
    // 0x385748: ldur            x2, [fp, #-0xa0]
    // 0x38574c: StoreField: r0->field_77 = r2
    //     0x38574c: stur            w2, [x0, #0x77]
    // 0x385750: ldur            x3, [fp, #-0x98]
    // 0x385754: StoreField: r0->field_7b = r3
    //     0x385754: stur            w3, [x0, #0x7b]
    // 0x385758: stp             NULL, NULL, [SP, #0x10]
    // 0x38575c: r16 = false
    //     0x38575c: add             x16, NULL, #0x30  ; false
    // 0x385760: stp             NULL, x16, [SP]
    // 0x385764: mov             x1, x0
    // 0x385768: r4 = const [0, 0x5, 0x4, 0x1, bodyDef, 0x4, paint, 0x1, priority, 0x2, renderBody, 0x3, null]
    //     0x385768: add             x4, PP, #0xd, lsl #12  ; [pp+0xd280] List(13) [0, 0x5, 0x4, 0x1, "bodyDef", 0x4, "paint", 0x1, "priority", 0x2, "renderBody", 0x3, Null]
    //     0x38576c: ldr             x4, [x4, #0x280]
    // 0x385770: r0 = BodyComponent()
    //     0x385770: bl              #0x374698  ; [package:flame_forge2d/body_component.dart] BodyComponent::BodyComponent
    // 0x385774: ldur            x0, [fp, #-0xb8]
    // 0x385778: LoadField: r2 = r0->field_b
    //     0x385778: ldur            w2, [x0, #0xb]
    // 0x38577c: stur            x2, [fp, #-0xd0]
    // 0x385780: LoadField: r1 = r0->field_f
    //     0x385780: ldur            w1, [x0, #0xf]
    // 0x385784: DecompressPointer r1
    //     0x385784: add             x1, x1, HEAP, lsl #32
    // 0x385788: LoadField: r3 = r1->field_b
    //     0x385788: ldur            w3, [x1, #0xb]
    // 0x38578c: r4 = LoadInt32Instr(r2)
    //     0x38578c: sbfx            x4, x2, #1, #0x1f
    // 0x385790: stur            x4, [fp, #-0xc8]
    // 0x385794: r1 = LoadInt32Instr(r3)
    //     0x385794: sbfx            x1, x3, #1, #0x1f
    // 0x385798: cmp             x4, x1
    // 0x38579c: b.ne            #0x3857a8
    // 0x3857a0: mov             x1, x0
    // 0x3857a4: r0 = _growToNextCapacity()
    //     0x3857a4: bl              #0x237528  ; [dart:core] _GrowableList::_growToNextCapacity
    // 0x3857a8: ldur            x4, [fp, #-0x90]
    // 0x3857ac: ldur            x3, [fp, #-0xb8]
    // 0x3857b0: ldur            x2, [fp, #-0xc8]
    // 0x3857b4: add             x0, x2, #1
    // 0x3857b8: lsl             x1, x0, #1
    // 0x3857bc: StoreField: r3->field_b = r1
    //     0x3857bc: stur            w1, [x3, #0xb]
    // 0x3857c0: LoadField: r1 = r3->field_f
    //     0x3857c0: ldur            w1, [x3, #0xf]
    // 0x3857c4: DecompressPointer r1
    //     0x3857c4: add             x1, x1, HEAP, lsl #32
    // 0x3857c8: ldur            x0, [fp, #-0xc0]
    // 0x3857cc: ArrayStore: r1[r2] = r0  ; List_4
    //     0x3857cc: add             x25, x1, x2, lsl #2
    //     0x3857d0: add             x25, x25, #0xf
    //     0x3857d4: str             w0, [x25]
    //     0x3857d8: tbz             w0, #0, #0x3857f4
    //     0x3857dc: ldurb           w16, [x1, #-1]
    //     0x3857e0: ldurb           w17, [x0, #-1]
    //     0x3857e4: and             x16, x17, x16, lsr #2
    //     0x3857e8: tst             x16, HEAP, lsr #32
    //     0x3857ec: b.eq            #0x3857f4
    //     0x3857f0: bl              #0x582800  ; ArrayWriteBarrierStub
    // 0x3857f4: mov             x1, x4
    // 0x3857f8: ldur            x2, [fp, #-0xc0]
    // 0x3857fc: r0 = _addChild()
    //     0x3857fc: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x385800: ldur            x0, [fp, #-0x90]
    // 0x385804: LoadField: r1 = r0->field_a3
    //     0x385804: ldur            w1, [x0, #0xa3]
    // 0x385808: DecompressPointer r1
    //     0x385808: add             x1, x1, HEAP, lsl #32
    // 0x38580c: tbz             w1, #4, #0x3858b4
    // 0x385810: ldur            x1, [fp, #-0xb0]
    // 0x385814: r2 = Instance_Duration
    //     0x385814: add             x2, PP, #0x14, lsl #12  ; [pp+0x14490] Obj!Duration@5dccf1
    //     0x385818: ldr             x2, [x2, #0x490]
    // 0x38581c: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x38581c: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x385820: r0 = delayed()
    //     0x385820: bl              #0x37e964  ; [package:ricochlime/flame/ticker.dart] Ticker::delayed
    // 0x385824: mov             x1, x0
    // 0x385828: stur            x1, [fp, #-0xa0]
    // 0x38582c: r0 = Await()
    //     0x38582c: bl              #0x255470  ; AwaitStub
    // 0x385830: ldur            x0, [fp, #-0x90]
    // 0x385834: LoadField: r1 = r0->field_a3
    //     0x385834: ldur            w1, [x0, #0xa3]
    // 0x385838: DecompressPointer r1
    //     0x385838: add             x1, x1, HEAP, lsl #32
    // 0x38583c: tbz             w1, #4, #0x385854
    // 0x385840: ldur            x1, [fp, #-0xa8]
    // 0x385844: add             x5, x1, #1
    // 0x385848: ldur            x2, [fp, #-0xb8]
    // 0x38584c: ldur            x3, [fp, #-0xb0]
    // 0x385850: b               #0x3856f8
    // 0x385854: mov             x1, x0
    // 0x385858: LoadField: r0 = r1->field_8f
    //     0x385858: ldur            w0, [x1, #0x8f]
    // 0x38585c: DecompressPointer r0
    //     0x38585c: add             x0, x0, HEAP, lsl #32
    // 0x385860: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x385864: cmp             w0, w16
    // 0x385868: b.ne            #0x385878
    // 0x38586c: r2 = state
    //     0x38586c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x385870: ldr             x2, [x2, #0x790]
    // 0x385874: r0 = InitLateFinalInstanceField()
    //     0x385874: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x385878: LoadField: r1 = r0->field_27
    //     0x385878: ldur            w1, [x0, #0x27]
    // 0x38587c: DecompressPointer r1
    //     0x38587c: add             x1, x1, HEAP, lsl #32
    // 0x385880: r16 = Instance_GameState
    //     0x385880: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x385884: ldr             x16, [x16, #0x7c8]
    // 0x385888: cmp             w1, w16
    // 0x38588c: b.eq            #0x3858a0
    // 0x385890: mov             x1, x0
    // 0x385894: r2 = Instance_GameState
    //     0x385894: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x385898: ldr             x2, [x2, #0x798]
    // 0x38589c: r0 = value=()
    //     0x38589c: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x3858a0: ldur            x0, [fp, #-0x90]
    // 0x3858a4: r2 = false
    //     0x3858a4: add             x2, NULL, #0x30  ; false
    // 0x3858a8: StoreField: r0->field_a3 = r2
    //     0x3858a8: stur            w2, [x0, #0xa3]
    // 0x3858ac: r0 = Null
    //     0x3858ac: mov             x0, NULL
    // 0x3858b0: r0 = ReturnAsyncNotFuture()
    //     0x3858b0: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x3858b4: r2 = false
    //     0x3858b4: add             x2, NULL, #0x30  ; false
    // 0x3858b8: mov             x1, x0
    // 0x3858bc: LoadField: r0 = r1->field_8f
    //     0x3858bc: ldur            w0, [x1, #0x8f]
    // 0x3858c0: DecompressPointer r0
    //     0x3858c0: add             x0, x0, HEAP, lsl #32
    // 0x3858c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3858c8: cmp             w0, w16
    // 0x3858cc: b.ne            #0x3858dc
    // 0x3858d0: r2 = state
    //     0x3858d0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x3858d4: ldr             x2, [x2, #0x790]
    // 0x3858d8: r0 = InitLateFinalInstanceField()
    //     0x3858d8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3858dc: LoadField: r1 = r0->field_27
    //     0x3858dc: ldur            w1, [x0, #0x27]
    // 0x3858e0: DecompressPointer r1
    //     0x3858e0: add             x1, x1, HEAP, lsl #32
    // 0x3858e4: r16 = Instance_GameState
    //     0x3858e4: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x3858e8: ldr             x16, [x16, #0x7c8]
    // 0x3858ec: cmp             w1, w16
    // 0x3858f0: b.eq            #0x385904
    // 0x3858f4: mov             x1, x0
    // 0x3858f8: r2 = Instance_GameState
    //     0x3858f8: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x3858fc: ldr             x2, [x2, #0x798]
    // 0x385900: r0 = value=()
    //     0x385900: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x385904: ldur            x0, [fp, #-0x90]
    // 0x385908: r2 = false
    //     0x385908: add             x2, NULL, #0x30  ; false
    // 0x38590c: StoreField: r0->field_a3 = r2
    //     0x38590c: stur            w2, [x0, #0xa3]
    // 0x385910: r0 = Null
    //     0x385910: mov             x0, NULL
    // 0x385914: r0 = ReturnAsyncNotFuture()
    //     0x385914: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x385918: r2 = false
    //     0x385918: add             x2, NULL, #0x30  ; false
    // 0x38591c: LoadField: r1 = r0->field_bb
    //     0x38591c: ldur            w1, [x0, #0xbb]
    // 0x385920: DecompressPointer r1
    //     0x385920: add             x1, x1, HEAP, lsl #32
    // 0x385924: LoadField: r3 = r1->field_7
    //     0x385924: ldur            w3, [x1, #7]
    // 0x385928: DecompressPointer r3
    //     0x385928: add             x3, x3, HEAP, lsl #32
    // 0x38592c: stur            x3, [fp, #-0x98]
    // 0x385930: r1 = <double>
    //     0x385930: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x385934: r0 = _BroadcastStream()
    //     0x385934: bl              #0x29c328  ; Allocate_BroadcastStreamStub -> _BroadcastStream<X0> (size=0x10)
    // 0x385938: mov             x2, x0
    // 0x38593c: ldur            x0, [fp, #-0x98]
    // 0x385940: stur            x2, [fp, #-0xa0]
    // 0x385944: StoreField: r2->field_b = r0
    //     0x385944: stur            w0, [x2, #0xb]
    // 0x385948: r1 = <double>
    //     0x385948: ldr             x1, [PP, #0x5738]  ; [pp+0x5738] TypeArguments: <double>
    // 0x38594c: r0 = _StreamIterator()
    //     0x38594c: bl              #0x37f574  ; Allocate_StreamIteratorStub -> _StreamIterator<X0> (size=0x18)
    // 0x385950: mov             x2, x0
    // 0x385954: r0 = false
    //     0x385954: add             x0, NULL, #0x30  ; false
    // 0x385958: stur            x2, [fp, #-0xb0]
    // 0x38595c: StoreField: r2->field_13 = r0
    //     0x38595c: stur            w0, [x2, #0x13]
    // 0x385960: ldur            x1, [fp, #-0xa0]
    // 0x385964: StoreField: r2->field_f = r1
    //     0x385964: stur            w1, [x2, #0xf]
    // 0x385968: ldur            x3, [fp, #-0x90]
    // 0x38596c: ldur            x4, [fp, #-0xb8]
    // 0x385970: d0 = 0.000000
    //     0x385970: eor             v0.16b, v0.16b, v0.16b
    // 0x385974: r1 = false
    //     0x385974: add             x1, NULL, #0x30  ; false
    // 0x385978: stur            d0, [fp, #-0xd8]
    // 0x38597c: CheckStackOverflow
    //     0x38597c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x385980: cmp             SP, x16
    //     0x385984: b.ls            #0x386028
    // 0x385988: LoadField: r5 = r2->field_b
    //     0x385988: ldur            w5, [x2, #0xb]
    // 0x38598c: DecompressPointer r5
    //     0x38598c: add             x5, x5, HEAP, lsl #32
    // 0x385990: stur            x5, [fp, #-0x98]
    // 0x385994: cmp             w5, NULL
    // 0x385998: b.eq            #0x385a20
    // 0x38599c: tbnz            w1, #4, #0x385f18
    // 0x3859a0: r1 = <bool>
    //     0x3859a0: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x3859a4: r0 = _Future()
    //     0x3859a4: bl              #0x255644  ; Allocate_FutureStub -> _Future<X0> (size=0x1c)
    // 0x3859a8: stur            x0, [fp, #-0xa0]
    // 0x3859ac: StoreField: r0->field_b = rZR
    //     0x3859ac: stur            xzr, [x0, #0xb]
    // 0x3859b0: r0 = LoadStaticField(0x358)
    //     0x3859b0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3859b4: ldr             x0, [x0, #0x6b0]
    // 0x3859b8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3859bc: cmp             w0, w16
    // 0x3859c0: b.ne            #0x3859cc
    // 0x3859c4: r2 = _current
    //     0x3859c4: ldr             x2, [PP, #0x650]  ; [pp+0x650] Field <Zone._current@5048458>: static late (offset: 0x358)
    // 0x3859c8: r0 = InitLateStaticField()
    //     0x3859c8: bl              #0x582704  ; InitLateStaticFieldStub
    // 0x3859cc: ldur            x2, [fp, #-0xa0]
    // 0x3859d0: StoreField: r2->field_13 = r0
    //     0x3859d0: stur            w0, [x2, #0x13]
    // 0x3859d4: mov             x0, x2
    // 0x3859d8: ldur            x3, [fp, #-0xb0]
    // 0x3859dc: StoreField: r3->field_f = r0
    //     0x3859dc: stur            w0, [x3, #0xf]
    //     0x3859e0: ldurb           w16, [x3, #-1]
    //     0x3859e4: ldurb           w17, [x0, #-1]
    //     0x3859e8: and             x16, x17, x16, lsr #2
    //     0x3859ec: tst             x16, HEAP, lsr #32
    //     0x3859f0: b.eq            #0x3859f8
    //     0x3859f4: bl              #0x582c84  ; WriteBarrierWrappersStub
    // 0x3859f8: r4 = false
    //     0x3859f8: add             x4, NULL, #0x30  ; false
    // 0x3859fc: StoreField: r3->field_13 = r4
    //     0x3859fc: stur            w4, [x3, #0x13]
    // 0x385a00: ldur            x1, [fp, #-0x98]
    // 0x385a04: r0 = LoadClassIdInstr(r1)
    //     0x385a04: ldur            x0, [x1, #-1]
    //     0x385a08: ubfx            x0, x0, #0xc, #0x14
    // 0x385a0c: r0 = GDT[cid_x0 + -0xff8]()
    //     0x385a0c: sub             lr, x0, #0xff8
    //     0x385a10: ldr             lr, [x21, lr, lsl #3]
    //     0x385a14: blr             lr
    // 0x385a18: ldur            x1, [fp, #-0xa0]
    // 0x385a1c: b               #0x385a2c
    // 0x385a20: ldur            x1, [fp, #-0xb0]
    // 0x385a24: r0 = _initializeOrDone()
    //     0x385a24: bl              #0x37f04c  ; [dart:async] _StreamIterator::_initializeOrDone
    // 0x385a28: mov             x1, x0
    // 0x385a2c: mov             x0, x1
    // 0x385a30: stur            x1, [fp, #-0x98]
    // 0x385a34: r0 = Await()
    //     0x385a34: bl              #0x255470  ; AwaitStub
    // 0x385a38: r16 = true
    //     0x385a38: add             x16, NULL, #0x20  ; true
    // 0x385a3c: cmp             w0, w16
    // 0x385a40: b.ne            #0x385c64
    // 0x385a44: ldur            x3, [fp, #-0xb0]
    // 0x385a48: LoadField: r4 = r3->field_13
    //     0x385a48: ldur            w4, [x3, #0x13]
    // 0x385a4c: DecompressPointer r4
    //     0x385a4c: add             x4, x4, HEAP, lsl #32
    // 0x385a50: stur            x4, [fp, #-0xa0]
    // 0x385a54: tbnz            w4, #4, #0x385aa8
    // 0x385a58: LoadField: r5 = r3->field_f
    //     0x385a58: ldur            w5, [x3, #0xf]
    // 0x385a5c: DecompressPointer r5
    //     0x385a5c: add             x5, x5, HEAP, lsl #32
    // 0x385a60: mov             x0, x5
    // 0x385a64: stur            x5, [fp, #-0x98]
    // 0x385a68: r2 = Null
    //     0x385a68: mov             x2, NULL
    // 0x385a6c: r1 = Null
    //     0x385a6c: mov             x1, NULL
    // 0x385a70: r4 = 60
    //     0x385a70: mov             x4, #0x3c
    // 0x385a74: branchIfSmi(r0, 0x385a80)
    //     0x385a74: tbz             w0, #0, #0x385a80
    // 0x385a78: r4 = LoadClassIdInstr(r0)
    //     0x385a78: ldur            x4, [x0, #-1]
    //     0x385a7c: ubfx            x4, x4, #0xc, #0x14
    // 0x385a80: cmp             x4, #0x3e
    // 0x385a84: b.eq            #0x385a98
    // 0x385a88: r8 = double
    //     0x385a88: ldr             x8, [PP, #0x98]  ; [pp+0x98] Type: double
    // 0x385a8c: r3 = Null
    //     0x385a8c: add             x3, PP, #0x19, lsl #12  ; [pp+0x19de0] Null
    //     0x385a90: ldr             x3, [x3, #0xde0]
    // 0x385a94: r0 = double()
    //     0x385a94: bl              #0x5893ec  ; IsType_double_Stub
    // 0x385a98: ldur            x0, [fp, #-0x98]
    // 0x385a9c: LoadField: d0 = r0->field_7
    //     0x385a9c: ldur            d0, [x0, #7]
    // 0x385aa0: r0 = Null
    //     0x385aa0: mov             x0, NULL
    // 0x385aa4: b               #0x385ae0
    // 0x385aa8: r3 = Null
    //     0x385aa8: mov             x3, NULL
    // 0x385aac: mov             x0, x3
    // 0x385ab0: mov             x2, x3
    // 0x385ab4: mov             x1, x3
    // 0x385ab8: r4 = LoadClassIdInstr(r0)
    //     0x385ab8: ldur            x4, [x0, #-1]
    //     0x385abc: ubfx            x4, x4, #0xc, #0x14
    // 0x385ac0: cmp             x4, #0x3e
    // 0x385ac4: b.eq            #0x385ad8
    // 0x385ac8: r8 = double
    //     0x385ac8: ldr             x8, [PP, #0x98]  ; [pp+0x98] Type: double
    // 0x385acc: r3 = Null
    //     0x385acc: add             x3, PP, #0x19, lsl #12  ; [pp+0x19df0] Null
    //     0x385ad0: ldr             x3, [x3, #0xdf0]
    // 0x385ad4: r0 = double()
    //     0x385ad4: bl              #0x5893ec  ; IsType_double_Stub
    // 0x385ad8: r0 = Null
    //     0x385ad8: mov             x0, NULL
    // 0x385adc: LoadField: d0 = r0->field_7
    //     0x385adc: ldur            d0, [x0, #7]
    // 0x385ae0: ldur            x2, [fp, #-0x90]
    // 0x385ae4: LoadField: r1 = r2->field_a3
    //     0x385ae4: ldur            w1, [x2, #0xa3]
    // 0x385ae8: DecompressPointer r1
    //     0x385ae8: add             x1, x1, HEAP, lsl #32
    // 0x385aec: tbz             w1, #4, #0x385bdc
    // 0x385af0: ldur            x3, [fp, #-0xb8]
    // 0x385af4: ldur            d1, [fp, #-0xd8]
    // 0x385af8: fadd            d2, d1, d0
    // 0x385afc: stur            d2, [fp, #-0xe0]
    // 0x385b00: LoadField: r1 = r3->field_b
    //     0x385b00: ldur            w1, [x3, #0xb]
    // 0x385b04: r4 = LoadInt32Instr(r1)
    //     0x385b04: sbfx            x4, x1, #1, #0x1f
    // 0x385b08: LoadField: r1 = r3->field_f
    //     0x385b08: ldur            w1, [x3, #0xf]
    // 0x385b0c: DecompressPointer r1
    //     0x385b0c: add             x1, x1, HEAP, lsl #32
    // 0x385b10: r5 = 0
    //     0x385b10: mov             x5, #0
    // 0x385b14: CheckStackOverflow
    //     0x385b14: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x385b18: cmp             SP, x16
    //     0x385b1c: b.ls            #0x386030
    // 0x385b20: cmp             x5, x4
    // 0x385b24: b.ge            #0x385bac
    // 0x385b28: ArrayLoad: r6 = r1[r5]  ; Unknown_4
    //     0x385b28: add             x16, x1, x5, lsl #2
    //     0x385b2c: ldur            w6, [x16, #0xf]
    // 0x385b30: DecompressPointer r6
    //     0x385b30: add             x6, x6, HEAP, lsl #32
    // 0x385b34: LoadField: r7 = r6->field_1b
    //     0x385b34: ldur            w7, [x6, #0x1b]
    // 0x385b38: DecompressPointer r7
    //     0x385b38: add             x7, x7, HEAP, lsl #32
    // 0x385b3c: cmp             w7, NULL
    // 0x385b40: b.ne            #0x385b50
    // 0x385b44: add             x6, x5, #1
    // 0x385b48: mov             x5, x6
    // 0x385b4c: b               #0x385b14
    // 0x385b50: d1 = 60.000000
    //     0x385b50: add             x17, PP, #9, lsl #12  ; [pp+0x9198] IMM: double(60) from 0x404e000000000000
    //     0x385b54: ldr             d1, [x17, #0x198]
    // 0x385b58: fcmp            d2, d1
    // 0x385b5c: b.ge            #0x385b7c
    // 0x385b60: mov             v0.16b, v2.16b
    // 0x385b64: ldur            x1, [fp, #-0xa0]
    // 0x385b68: mov             x4, x3
    // 0x385b6c: mov             x3, x2
    // 0x385b70: ldur            x2, [fp, #-0xb0]
    // 0x385b74: r0 = false
    //     0x385b74: add             x0, NULL, #0x30  ; false
    // 0x385b78: b               #0x385978
    // 0x385b7c: ldur            x4, [fp, #-0xb0]
    // 0x385b80: LoadField: r1 = r4->field_b
    //     0x385b80: ldur            w1, [x4, #0xb]
    // 0x385b84: DecompressPointer r1
    //     0x385b84: add             x1, x1, HEAP, lsl #32
    // 0x385b88: cmp             w1, NULL
    // 0x385b8c: b.eq            #0x385ba4
    // 0x385b90: mov             x1, x4
    // 0x385b94: r0 = cancel()
    //     0x385b94: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x385b98: mov             x1, x0
    // 0x385b9c: stur            x1, [fp, #-0x98]
    // 0x385ba0: r0 = Await()
    //     0x385ba0: bl              #0x255470  ; AwaitStub
    // 0x385ba4: ldur            d1, [fp, #-0xe0]
    // 0x385ba8: b               #0x385c9c
    // 0x385bac: ldur            x0, [fp, #-0xb0]
    // 0x385bb0: LoadField: r1 = r0->field_b
    //     0x385bb0: ldur            w1, [x0, #0xb]
    // 0x385bb4: DecompressPointer r1
    //     0x385bb4: add             x1, x1, HEAP, lsl #32
    // 0x385bb8: cmp             w1, NULL
    // 0x385bbc: b.eq            #0x385bd4
    // 0x385bc0: mov             x1, x0
    // 0x385bc4: r0 = cancel()
    //     0x385bc4: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x385bc8: mov             x1, x0
    // 0x385bcc: stur            x1, [fp, #-0x98]
    // 0x385bd0: r0 = Await()
    //     0x385bd0: bl              #0x255470  ; AwaitStub
    // 0x385bd4: ldur            d1, [fp, #-0xe0]
    // 0x385bd8: b               #0x385c9c
    // 0x385bdc: ldur            x0, [fp, #-0xb0]
    // 0x385be0: LoadField: r1 = r0->field_b
    //     0x385be0: ldur            w1, [x0, #0xb]
    // 0x385be4: DecompressPointer r1
    //     0x385be4: add             x1, x1, HEAP, lsl #32
    // 0x385be8: cmp             w1, NULL
    // 0x385bec: b.eq            #0x385c04
    // 0x385bf0: mov             x1, x0
    // 0x385bf4: r0 = cancel()
    //     0x385bf4: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x385bf8: mov             x1, x0
    // 0x385bfc: stur            x1, [fp, #-0x98]
    // 0x385c00: r0 = Await()
    //     0x385c00: bl              #0x255470  ; AwaitStub
    // 0x385c04: ldur            x1, [fp, #-0x90]
    // 0x385c08: LoadField: r0 = r1->field_8f
    //     0x385c08: ldur            w0, [x1, #0x8f]
    // 0x385c0c: DecompressPointer r0
    //     0x385c0c: add             x0, x0, HEAP, lsl #32
    // 0x385c10: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x385c14: cmp             w0, w16
    // 0x385c18: b.ne            #0x385c28
    // 0x385c1c: r2 = state
    //     0x385c1c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x385c20: ldr             x2, [x2, #0x790]
    // 0x385c24: r0 = InitLateFinalInstanceField()
    //     0x385c24: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x385c28: LoadField: r1 = r0->field_27
    //     0x385c28: ldur            w1, [x0, #0x27]
    // 0x385c2c: DecompressPointer r1
    //     0x385c2c: add             x1, x1, HEAP, lsl #32
    // 0x385c30: r16 = Instance_GameState
    //     0x385c30: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x385c34: ldr             x16, [x16, #0x7c8]
    // 0x385c38: cmp             w1, w16
    // 0x385c3c: b.eq            #0x385c50
    // 0x385c40: mov             x1, x0
    // 0x385c44: r2 = Instance_GameState
    //     0x385c44: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x385c48: ldr             x2, [x2, #0x798]
    // 0x385c4c: r0 = value=()
    //     0x385c4c: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x385c50: ldur            x0, [fp, #-0x90]
    // 0x385c54: r2 = false
    //     0x385c54: add             x2, NULL, #0x30  ; false
    // 0x385c58: StoreField: r0->field_a3 = r2
    //     0x385c58: stur            w2, [x0, #0xa3]
    // 0x385c5c: r0 = Null
    //     0x385c5c: mov             x0, NULL
    // 0x385c60: r0 = ReturnAsyncNotFuture()
    //     0x385c60: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x385c64: ldur            x0, [fp, #-0x90]
    // 0x385c68: ldur            d1, [fp, #-0xd8]
    // 0x385c6c: r2 = false
    //     0x385c6c: add             x2, NULL, #0x30  ; false
    // 0x385c70: ldur            x3, [fp, #-0xb0]
    // 0x385c74: LoadField: r1 = r3->field_b
    //     0x385c74: ldur            w1, [x3, #0xb]
    // 0x385c78: DecompressPointer r1
    //     0x385c78: add             x1, x1, HEAP, lsl #32
    // 0x385c7c: cmp             w1, NULL
    // 0x385c80: b.eq            #0x385c98
    // 0x385c84: mov             x1, x3
    // 0x385c88: r0 = cancel()
    //     0x385c88: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x385c8c: mov             x1, x0
    // 0x385c90: stur            x1, [fp, #-0x98]
    // 0x385c94: r0 = Await()
    //     0x385c94: bl              #0x255470  ; AwaitStub
    // 0x385c98: ldur            d1, [fp, #-0xd8]
    // 0x385c9c: d0 = 60.000000
    //     0x385c9c: add             x17, PP, #9, lsl #12  ; [pp+0x9198] IMM: double(60) from 0x404e000000000000
    //     0x385ca0: ldr             d0, [x17, #0x198]
    // 0x385ca4: fcmp            d1, d0
    // 0x385ca8: b.lt            #0x385dbc
    // 0x385cac: ldur            x0, [fp, #-0xb8]
    // 0x385cb0: r0 = LoadStaticField(0x864)
    //     0x385cb0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x385cb4: ldr             x0, [x0, #0x10c8]
    // 0x385cb8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x385cbc: cmp             w0, w16
    // 0x385cc0: b.ne            #0x385cd0
    // 0x385cc4: r2 = log
    //     0x385cc4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7f0] Field <RicochlimeGame.log>: static late final (offset: 0x864)
    //     0x385cc8: ldr             x2, [x2, #0x7f0]
    // 0x385ccc: r0 = InitLateFinalStaticField()
    //     0x385ccc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x385cd0: mov             x1, x0
    // 0x385cd4: r2 = "Bullet timeout reached"
    //     0x385cd4: add             x2, PP, #0x19, lsl #12  ; [pp+0x19e00] "Bullet timeout reached"
    //     0x385cd8: ldr             x2, [x2, #0xe00]
    // 0x385cdc: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x385cdc: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x385ce0: r0 = info()
    //     0x385ce0: bl              #0x287f24  ; [package:logging/src/logger.dart] Logger::info
    // 0x385ce4: r1 = <Bullet>
    //     0x385ce4: add             x1, PP, #0x19, lsl #12  ; [pp+0x19dd8] TypeArguments: <Bullet>
    //     0x385ce8: ldr             x1, [x1, #0xdd8]
    // 0x385cec: r0 = ListIterator()
    //     0x385cec: bl              #0x26d664  ; AllocateListIteratorStub -> ListIterator<X0> (size=0x24)
    // 0x385cf0: mov             x4, x0
    // 0x385cf4: ldur            x3, [fp, #-0xb8]
    // 0x385cf8: stur            x4, [fp, #-0xa0]
    // 0x385cfc: StoreField: r4->field_b = r3
    //     0x385cfc: stur            w3, [x4, #0xb]
    // 0x385d00: LoadField: r0 = r3->field_b
    //     0x385d00: ldur            w0, [x3, #0xb]
    // 0x385d04: r5 = LoadInt32Instr(r0)
    //     0x385d04: sbfx            x5, x0, #1, #0x1f
    // 0x385d08: stur            x5, [fp, #-0xa8]
    // 0x385d0c: StoreField: r4->field_f = r5
    //     0x385d0c: stur            x5, [x4, #0xf]
    // 0x385d10: ArrayStore: r4[0] = rZR  ; List_8
    //     0x385d10: stur            xzr, [x4, #0x17]
    // 0x385d14: CheckStackOverflow
    //     0x385d14: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x385d18: cmp             SP, x16
    //     0x385d1c: b.ls            #0x386038
    // 0x385d20: LoadField: r0 = r3->field_b
    //     0x385d20: ldur            w0, [x3, #0xb]
    // 0x385d24: r1 = LoadInt32Instr(r0)
    //     0x385d24: sbfx            x1, x0, #1, #0x1f
    // 0x385d28: cmp             x5, x1
    // 0x385d2c: b.ne            #0x385f44
    // 0x385d30: ArrayLoad: r2 = r4[0]  ; List_8
    //     0x385d30: ldur            x2, [x4, #0x17]
    // 0x385d34: cmp             x2, x1
    // 0x385d38: b.ge            #0x385db4
    // 0x385d3c: mov             x0, x1
    // 0x385d40: mov             x1, x2
    // 0x385d44: cmp             x1, x0
    // 0x385d48: b.hs            #0x386040
    // 0x385d4c: LoadField: r0 = r3->field_f
    //     0x385d4c: ldur            w0, [x3, #0xf]
    // 0x385d50: DecompressPointer r0
    //     0x385d50: add             x0, x0, HEAP, lsl #32
    // 0x385d54: ArrayLoad: r6 = r0[r2]  ; Unknown_4
    //     0x385d54: add             x16, x0, x2, lsl #2
    //     0x385d58: ldur            w6, [x16, #0xf]
    // 0x385d5c: DecompressPointer r6
    //     0x385d5c: add             x6, x6, HEAP, lsl #32
    // 0x385d60: mov             x0, x6
    // 0x385d64: stur            x6, [fp, #-0x98]
    // 0x385d68: StoreField: r4->field_1f = r0
    //     0x385d68: stur            w0, [x4, #0x1f]
    //     0x385d6c: ldurb           w16, [x4, #-1]
    //     0x385d70: ldurb           w17, [x0, #-1]
    //     0x385d74: and             x16, x17, x16, lsr #2
    //     0x385d78: tst             x16, HEAP, lsr #32
    //     0x385d7c: b.eq            #0x385d84
    //     0x385d80: bl              #0x582ca4  ; WriteBarrierWrappersStub
    // 0x385d84: add             x0, x2, #1
    // 0x385d88: ArrayStore: r4[0] = r0  ; List_8
    //     0x385d88: stur            x0, [x4, #0x17]
    // 0x385d8c: LoadField: r1 = r6->field_1b
    //     0x385d8c: ldur            w1, [x6, #0x1b]
    // 0x385d90: DecompressPointer r1
    //     0x385d90: add             x1, x1, HEAP, lsl #32
    // 0x385d94: cmp             w1, NULL
    // 0x385d98: b.eq            #0x385da4
    // 0x385d9c: mov             x2, x6
    // 0x385da0: r0 = _removeChild()
    //     0x385da0: bl              #0x3779e4  ; [package:flame/src/components/core/component.dart] Component::_removeChild
    // 0x385da4: ldur            x3, [fp, #-0xb8]
    // 0x385da8: ldur            x4, [fp, #-0xa0]
    // 0x385dac: ldur            x5, [fp, #-0xa8]
    // 0x385db0: b               #0x385d14
    // 0x385db4: mov             x0, x4
    // 0x385db8: StoreField: r0->field_1f = rNULL
    //     0x385db8: stur            NULL, [x0, #0x1f]
    // 0x385dbc: ldur            x0, [fp, #-0x90]
    // 0x385dc0: LoadField: r1 = r0->field_a3
    //     0x385dc0: ldur            w1, [x0, #0xa3]
    // 0x385dc4: DecompressPointer r1
    //     0x385dc4: add             x1, x1, HEAP, lsl #32
    // 0x385dc8: tbnz            w1, #4, #0x385e2c
    // 0x385dcc: mov             x1, x0
    // 0x385dd0: LoadField: r0 = r1->field_8f
    //     0x385dd0: ldur            w0, [x1, #0x8f]
    // 0x385dd4: DecompressPointer r0
    //     0x385dd4: add             x0, x0, HEAP, lsl #32
    // 0x385dd8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x385ddc: cmp             w0, w16
    // 0x385de0: b.ne            #0x385df0
    // 0x385de4: r2 = state
    //     0x385de4: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x385de8: ldr             x2, [x2, #0x790]
    // 0x385dec: r0 = InitLateFinalInstanceField()
    //     0x385dec: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x385df0: LoadField: r1 = r0->field_27
    //     0x385df0: ldur            w1, [x0, #0x27]
    // 0x385df4: DecompressPointer r1
    //     0x385df4: add             x1, x1, HEAP, lsl #32
    // 0x385df8: r16 = Instance_GameState
    //     0x385df8: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x385dfc: ldr             x16, [x16, #0x7c8]
    // 0x385e00: cmp             w1, w16
    // 0x385e04: b.eq            #0x385e18
    // 0x385e08: mov             x1, x0
    // 0x385e0c: r2 = Instance_GameState
    //     0x385e0c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x385e10: ldr             x2, [x2, #0x798]
    // 0x385e14: r0 = value=()
    //     0x385e14: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x385e18: ldur            x0, [fp, #-0x90]
    // 0x385e1c: r2 = false
    //     0x385e1c: add             x2, NULL, #0x30  ; false
    // 0x385e20: StoreField: r0->field_a3 = r2
    //     0x385e20: stur            w2, [x0, #0xa3]
    // 0x385e24: r0 = Null
    //     0x385e24: mov             x0, NULL
    // 0x385e28: r0 = ReturnAsyncNotFuture()
    //     0x385e28: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x385e2c: r2 = false
    //     0x385e2c: add             x2, NULL, #0x30  ; false
    // 0x385e30: mov             x1, x0
    // 0x385e34: r0 = spawnNewMonsters()
    //     0x385e34: bl              #0x37610c  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::spawnNewMonsters
    // 0x385e38: mov             x1, x0
    // 0x385e3c: stur            x1, [fp, #-0x98]
    // 0x385e40: r0 = Await()
    //     0x385e40: bl              #0x255470  ; AwaitStub
    // 0x385e44: ldur            x0, [fp, #-0x90]
    // 0x385e48: LoadField: r1 = r0->field_a3
    //     0x385e48: ldur            w1, [x0, #0xa3]
    // 0x385e4c: DecompressPointer r1
    //     0x385e4c: add             x1, x1, HEAP, lsl #32
    // 0x385e50: tbnz            w1, #4, #0x385eb4
    // 0x385e54: mov             x1, x0
    // 0x385e58: LoadField: r0 = r1->field_8f
    //     0x385e58: ldur            w0, [x1, #0x8f]
    // 0x385e5c: DecompressPointer r0
    //     0x385e5c: add             x0, x0, HEAP, lsl #32
    // 0x385e60: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x385e64: cmp             w0, w16
    // 0x385e68: b.ne            #0x385e78
    // 0x385e6c: r2 = state
    //     0x385e6c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x385e70: ldr             x2, [x2, #0x790]
    // 0x385e74: r0 = InitLateFinalInstanceField()
    //     0x385e74: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x385e78: LoadField: r1 = r0->field_27
    //     0x385e78: ldur            w1, [x0, #0x27]
    // 0x385e7c: DecompressPointer r1
    //     0x385e7c: add             x1, x1, HEAP, lsl #32
    // 0x385e80: r16 = Instance_GameState
    //     0x385e80: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x385e84: ldr             x16, [x16, #0x7c8]
    // 0x385e88: cmp             w1, w16
    // 0x385e8c: b.eq            #0x385ea0
    // 0x385e90: mov             x1, x0
    // 0x385e94: r2 = Instance_GameState
    //     0x385e94: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x385e98: ldr             x2, [x2, #0x798]
    // 0x385e9c: r0 = value=()
    //     0x385e9c: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x385ea0: ldur            x0, [fp, #-0x90]
    // 0x385ea4: r2 = false
    //     0x385ea4: add             x2, NULL, #0x30  ; false
    // 0x385ea8: StoreField: r0->field_a3 = r2
    //     0x385ea8: stur            w2, [x0, #0xa3]
    // 0x385eac: r0 = Null
    //     0x385eac: mov             x0, NULL
    // 0x385eb0: r0 = ReturnAsyncNotFuture()
    //     0x385eb0: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x385eb4: r2 = false
    //     0x385eb4: add             x2, NULL, #0x30  ; false
    // 0x385eb8: mov             x1, x0
    // 0x385ebc: LoadField: r0 = r1->field_8f
    //     0x385ebc: ldur            w0, [x1, #0x8f]
    // 0x385ec0: DecompressPointer r0
    //     0x385ec0: add             x0, x0, HEAP, lsl #32
    // 0x385ec4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x385ec8: cmp             w0, w16
    // 0x385ecc: b.ne            #0x385edc
    // 0x385ed0: r2 = state
    //     0x385ed0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x385ed4: ldr             x2, [x2, #0x790]
    // 0x385ed8: r0 = InitLateFinalInstanceField()
    //     0x385ed8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x385edc: LoadField: r1 = r0->field_27
    //     0x385edc: ldur            w1, [x0, #0x27]
    // 0x385ee0: DecompressPointer r1
    //     0x385ee0: add             x1, x1, HEAP, lsl #32
    // 0x385ee4: r16 = Instance_GameState
    //     0x385ee4: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x385ee8: ldr             x16, [x16, #0x7c8]
    // 0x385eec: cmp             w1, w16
    // 0x385ef0: b.eq            #0x385f04
    // 0x385ef4: mov             x1, x0
    // 0x385ef8: r2 = Instance_GameState
    //     0x385ef8: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x385efc: ldr             x2, [x2, #0x798]
    // 0x385f00: r0 = value=()
    //     0x385f00: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x385f04: ldur            x0, [fp, #-0x90]
    // 0x385f08: r1 = false
    //     0x385f08: add             x1, NULL, #0x30  ; false
    // 0x385f0c: StoreField: r0->field_a3 = r1
    //     0x385f0c: stur            w1, [x0, #0xa3]
    // 0x385f10: r0 = Null
    //     0x385f10: mov             x0, NULL
    // 0x385f14: r0 = ReturnAsyncNotFuture()
    //     0x385f14: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x385f18: mov             x1, x0
    // 0x385f1c: mov             x0, x3
    // 0x385f20: r0 = StateError()
    //     0x385f20: bl              #0x2390c8  ; AllocateStateErrorStub -> StateError (size=0x10)
    // 0x385f24: mov             x1, x0
    // 0x385f28: r0 = "Already waiting for next."
    //     0x385f28: add             x0, PP, #0xc, lsl #12  ; [pp+0xcff0] "Already waiting for next."
    //     0x385f2c: ldr             x0, [x0, #0xff0]
    // 0x385f30: stur            x1, [fp, #-0x98]
    // 0x385f34: StoreField: r1->field_b = r0
    //     0x385f34: stur            w0, [x1, #0xb]
    // 0x385f38: mov             x0, x1
    // 0x385f3c: r0 = Throw()
    //     0x385f3c: bl              #0x5827dc  ; ThrowStub
    // 0x385f40: brk             #0
    // 0x385f44: mov             x1, x3
    // 0x385f48: mov             x0, x4
    // 0x385f4c: r0 = ConcurrentModificationError()
    //     0x385f4c: bl              #0x2379bc  ; AllocateConcurrentModificationErrorStub -> ConcurrentModificationError (size=0x10)
    // 0x385f50: mov             x1, x0
    // 0x385f54: ldur            x0, [fp, #-0xb8]
    // 0x385f58: stur            x1, [fp, #-0x98]
    // 0x385f5c: StoreField: r1->field_b = r0
    //     0x385f5c: stur            w0, [x1, #0xb]
    // 0x385f60: mov             x0, x1
    // 0x385f64: r0 = Throw()
    //     0x385f64: bl              #0x5827dc  ; ThrowStub
    // 0x385f68: brk             #0
    // 0x385f6c: sub             SP, fp, #0x100
    // 0x385f70: ldur            x2, [fp, #-0xb0]
    // 0x385f74: mov             x3, x0
    // 0x385f78: stur            x0, [fp, #-0x98]
    // 0x385f7c: mov             x0, x1
    // 0x385f80: stur            x1, [fp, #-0xa0]
    // 0x385f84: LoadField: r1 = r2->field_b
    //     0x385f84: ldur            w1, [x2, #0xb]
    // 0x385f88: DecompressPointer r1
    //     0x385f88: add             x1, x1, HEAP, lsl #32
    // 0x385f8c: cmp             w1, NULL
    // 0x385f90: b.eq            #0x385fa8
    // 0x385f94: mov             x1, x2
    // 0x385f98: r0 = cancel()
    //     0x385f98: bl              #0x37edf8  ; [dart:async] _StreamIterator::cancel
    // 0x385f9c: mov             x1, x0
    // 0x385fa0: stur            x1, [fp, #-0xb8]
    // 0x385fa4: r0 = Await()
    //     0x385fa4: bl              #0x255470  ; AwaitStub
    // 0x385fa8: ldur            x0, [fp, #-0x98]
    // 0x385fac: ldur            x1, [fp, #-0xa0]
    // 0x385fb0: r0 = ReThrow()
    //     0x385fb0: bl              #0x5827b0  ; ReThrowStub
    // 0x385fb4: brk             #0
    // 0x385fb8: sub             SP, fp, #0x100
    // 0x385fbc: ldur            x3, [fp, #-0x90]
    // 0x385fc0: mov             x4, x0
    // 0x385fc4: stur            x0, [fp, #-0x98]
    // 0x385fc8: mov             x0, x1
    // 0x385fcc: stur            x1, [fp, #-0xa0]
    // 0x385fd0: LoadField: r1 = r3->field_8f
    //     0x385fd0: ldur            w1, [x3, #0x8f]
    // 0x385fd4: DecompressPointer r1
    //     0x385fd4: add             x1, x1, HEAP, lsl #32
    // 0x385fd8: LoadField: r2 = r1->field_27
    //     0x385fd8: ldur            w2, [x1, #0x27]
    // 0x385fdc: DecompressPointer r2
    //     0x385fdc: add             x2, x2, HEAP, lsl #32
    // 0x385fe0: r16 = Instance_GameState
    //     0x385fe0: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7c8] Obj!GameState@5d8a21
    //     0x385fe4: ldr             x16, [x16, #0x7c8]
    // 0x385fe8: cmp             w2, w16
    // 0x385fec: b.eq            #0x385ffc
    // 0x385ff0: r2 = Instance_GameState
    //     0x385ff0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x385ff4: ldr             x2, [x2, #0x798]
    // 0x385ff8: r0 = value=()
    //     0x385ff8: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x385ffc: ldur            x0, [fp, #-0x90]
    // 0x386000: r1 = false
    //     0x386000: add             x1, NULL, #0x30  ; false
    // 0x386004: StoreField: r0->field_a3 = r1
    //     0x386004: stur            w1, [x0, #0xa3]
    // 0x386008: ldur            x0, [fp, #-0x98]
    // 0x38600c: ldur            x1, [fp, #-0xa0]
    // 0x386010: r0 = ReThrow()
    //     0x386010: bl              #0x5827b0  ; ReThrowStub
    // 0x386014: brk             #0
    // 0x386018: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x386018: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x38601c: b               #0x385610
    // 0x386020: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x386020: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x386024: b               #0x38570c
    // 0x386028: r0 = StackOverflowSharedWithFPURegs()
    //     0x386028: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x38602c: b               #0x385988
    // 0x386030: r0 = StackOverflowSharedWithFPURegs()
    //     0x386030: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x386034: b               #0x385b20
    // 0x386038: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x386038: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x38603c: b               #0x385d20
    // 0x386040: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x386040: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
  _ onPanUpdate(/* No info */) {
    // ** addr: 0x386244, size: 0x164
    // 0x386244: EnterFrame
    //     0x386244: stp             fp, lr, [SP, #-0x10]!
    //     0x386248: mov             fp, SP
    // 0x38624c: AllocStack(0x18)
    //     0x38624c: sub             SP, SP, #0x18
    // 0x386250: SetupParameters(RicochlimeGame this /* r1 => r2, fp-0x8 */, dynamic _ /* r2 => r0, fp-0x10 */)
    //     0x386250: mov             x0, x2
    //     0x386254: stur            x2, [fp, #-0x10]
    //     0x386258: mov             x2, x1
    //     0x38625c: stur            x1, [fp, #-8]
    // 0x386260: CheckStackOverflow
    //     0x386260: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x386264: cmp             SP, x16
    //     0x386268: b.ls            #0x3863a0
    // 0x38626c: mov             x1, x2
    // 0x386270: LoadField: r0 = r1->field_97
    //     0x386270: ldur            w0, [x1, #0x97]
    // 0x386274: DecompressPointer r0
    //     0x386274: add             x0, x0, HEAP, lsl #32
    // 0x386278: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x38627c: cmp             w0, w16
    // 0x386280: b.ne            #0x386290
    // 0x386284: r2 = aimGuide
    //     0x386284: add             x2, PP, #0xc, lsl #12  ; [pp+0xc708] Field <RicochlimeGame.aimGuide>: late final (offset: 0x98)
    //     0x386288: ldr             x2, [x2, #0x708]
    // 0x38628c: r0 = InitLateFinalInstanceField()
    //     0x38628c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x386290: ldur            x1, [fp, #-0x10]
    // 0x386294: stur            x0, [fp, #-0x18]
    // 0x386298: LoadField: r0 = r1->field_13
    //     0x386298: ldur            w0, [x1, #0x13]
    // 0x38629c: DecompressPointer r0
    //     0x38629c: add             x0, x0, HEAP, lsl #32
    // 0x3862a0: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3862a4: cmp             w0, w16
    // 0x3862a8: b.ne            #0x3862b8
    // 0x3862ac: r2 = eventPosition
    //     0x3862ac: add             x2, PP, #0x19, lsl #12  ; [pp+0x19e10] Field <PositionInfo.eventPosition>: late final (offset: 0x14)
    //     0x3862b0: ldr             x2, [x2, #0xe10]
    // 0x3862b4: r0 = InitLateFinalInstanceField()
    //     0x3862b4: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3862b8: mov             x1, x0
    // 0x3862bc: LoadField: r0 = r1->field_13
    //     0x3862bc: ldur            w0, [x1, #0x13]
    // 0x3862c0: DecompressPointer r0
    //     0x3862c0: add             x0, x0, HEAP, lsl #32
    // 0x3862c4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3862c8: cmp             w0, w16
    // 0x3862cc: b.ne            #0x3862dc
    // 0x3862d0: r2 = widget
    //     0x3862d0: add             x2, PP, #0x19, lsl #12  ; [pp+0x19e18] Field <EventPosition.widget>: late final (offset: 0x14)
    //     0x3862d4: ldr             x2, [x2, #0xe18]
    // 0x3862d8: r0 = InitLateFinalInstanceField()
    //     0x3862d8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3862dc: ldur            x1, [fp, #-0x18]
    // 0x3862e0: StoreField: r1->field_4f = r0
    //     0x3862e0: stur            w0, [x1, #0x4f]
    //     0x3862e4: ldurb           w16, [x1, #-1]
    //     0x3862e8: ldurb           w17, [x0, #-1]
    //     0x3862ec: and             x16, x17, x16, lsr #2
    //     0x3862f0: tst             x16, HEAP, lsr #32
    //     0x3862f4: b.eq            #0x3862fc
    //     0x3862f8: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3862fc: ldur            x1, [fp, #-8]
    // 0x386300: LoadField: r0 = r1->field_8f
    //     0x386300: ldur            w0, [x1, #0x8f]
    // 0x386304: DecompressPointer r0
    //     0x386304: add             x0, x0, HEAP, lsl #32
    // 0x386308: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x38630c: cmp             w0, w16
    // 0x386310: b.ne            #0x386320
    // 0x386314: r2 = state
    //     0x386314: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x386318: ldr             x2, [x2, #0x790]
    // 0x38631c: r0 = InitLateFinalInstanceField()
    //     0x38631c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x386320: LoadField: r1 = r0->field_27
    //     0x386320: ldur            w1, [x0, #0x27]
    // 0x386324: DecompressPointer r1
    //     0x386324: add             x1, x1, HEAP, lsl #32
    // 0x386328: r16 = Instance_GameState
    //     0x386328: add             x16, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x38632c: ldr             x16, [x16, #0x798]
    // 0x386330: cmp             w1, w16
    // 0x386334: b.eq            #0x386348
    // 0x386338: r0 = Null
    //     0x386338: mov             x0, NULL
    // 0x38633c: LeaveFrame
    //     0x38633c: mov             SP, fp
    //     0x386340: ldp             fp, lr, [SP], #0x10
    // 0x386344: ret
    //     0x386344: ret             
    // 0x386348: ldur            x1, [fp, #-8]
    // 0x38634c: ldur            x0, [fp, #-0x10]
    // 0x386350: LoadField: r2 = r1->field_97
    //     0x386350: ldur            w2, [x1, #0x97]
    // 0x386354: DecompressPointer r2
    //     0x386354: add             x2, x2, HEAP, lsl #32
    // 0x386358: stur            x2, [fp, #-0x18]
    // 0x38635c: LoadField: r1 = r0->field_13
    //     0x38635c: ldur            w1, [x0, #0x13]
    // 0x386360: DecompressPointer r1
    //     0x386360: add             x1, x1, HEAP, lsl #32
    // 0x386364: LoadField: r0 = r1->field_13
    //     0x386364: ldur            w0, [x1, #0x13]
    // 0x386368: DecompressPointer r0
    //     0x386368: add             x0, x0, HEAP, lsl #32
    // 0x38636c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x386370: cmp             w0, w16
    // 0x386374: b.ne            #0x386384
    // 0x386378: r2 = widget
    //     0x386378: add             x2, PP, #0x19, lsl #12  ; [pp+0x19e18] Field <EventPosition.widget>: late final (offset: 0x14)
    //     0x38637c: ldr             x2, [x2, #0xe18]
    // 0x386380: r0 = InitLateFinalInstanceField()
    //     0x386380: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x386384: ldur            x1, [fp, #-0x18]
    // 0x386388: mov             x2, x0
    // 0x38638c: r0 = aim()
    //     0x38638c: bl              #0x3767c4  ; [package:ricochlime/flame/components/aim_guide.dart] AimGuide::aim
    // 0x386390: r0 = Null
    //     0x386390: mov             x0, NULL
    // 0x386394: LeaveFrame
    //     0x386394: mov             SP, fp
    //     0x386398: ldp             fp, lr, [SP], #0x10
    // 0x38639c: ret
    //     0x38639c: ret             
    // 0x3863a0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3863a0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3863a4: b               #0x38626c
  }
  Completer<bool> preloadSprites(RicochlimeGame) {
    // ** addr: 0x3c4aa8, size: 0x60
    // 0x3c4aa8: EnterFrame
    //     0x3c4aa8: stp             fp, lr, [SP, #-0x10]!
    //     0x3c4aac: mov             fp, SP
    // 0x3c4ab0: AllocStack(0x8)
    //     0x3c4ab0: sub             SP, SP, #8
    // 0x3c4ab4: CheckStackOverflow
    //     0x3c4ab4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c4ab8: cmp             SP, x16
    //     0x3c4abc: b.ls            #0x3c4b00
    // 0x3c4ac0: r1 = 1
    //     0x3c4ac0: mov             x1, #1
    // 0x3c4ac4: r0 = AllocateContext()
    //     0x3c4ac4: bl              #0x5834e8  ; AllocateContextStub
    // 0x3c4ac8: mov             x1, x0
    // 0x3c4acc: ldr             x0, [fp, #0x10]
    // 0x3c4ad0: StoreField: r1->field_f = r0
    //     0x3c4ad0: stur            w0, [x1, #0xf]
    // 0x3c4ad4: mov             x2, x1
    // 0x3c4ad8: r1 = Function '<anonymous closure>':.
    //     0x3c4ad8: add             x1, PP, #0xf, lsl #12  ; [pp+0xfdd8] AnonymousClosure: (0x3c4b08), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::preloadSprites (0x3c4aa8)
    //     0x3c4adc: ldr             x1, [x1, #0xdd8]
    // 0x3c4ae0: r0 = AllocateClosure()
    //     0x3c4ae0: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c4ae4: str             x0, [SP]
    // 0x3c4ae8: ClosureCall
    //     0x3c4ae8: ldr             x4, [PP, #0x7a0]  ; [pp+0x7a0] List(5) [0, 0x1, 0x1, 0x1, Null]
    //     0x3c4aec: ldur            x2, [x0, #0x1f]
    //     0x3c4af0: blr             x2
    // 0x3c4af4: LeaveFrame
    //     0x3c4af4: mov             SP, fp
    //     0x3c4af8: ldp             fp, lr, [SP], #0x10
    // 0x3c4afc: ret
    //     0x3c4afc: ret             
    // 0x3c4b00: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c4b00: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c4b04: b               #0x3c4ac0
  }
  [closure] Completer<bool> <anonymous closure>(dynamic) {
    // ** addr: 0x3c4b08, size: 0x198
    // 0x3c4b08: EnterFrame
    //     0x3c4b08: stp             fp, lr, [SP, #-0x10]!
    //     0x3c4b0c: mov             fp, SP
    // 0x3c4b10: AllocStack(0x50)
    //     0x3c4b10: sub             SP, SP, #0x50
    // 0x3c4b14: SetupParameters([dynamic _ /* r0 */])
    //     0x3c4b14: ldr             x0, [fp, #0x10]
    //     0x3c4b18: ldur            w1, [x0, #0x17]
    //     0x3c4b1c: add             x1, x1, HEAP, lsl #32
    //     0x3c4b20: stur            x1, [fp, #-8]
    // 0x3c4b24: CheckStackOverflow
    //     0x3c4b24: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c4b28: cmp             SP, x16
    //     0x3c4b2c: b.ls            #0x3c4c98
    // 0x3c4b30: r1 = 1
    //     0x3c4b30: mov             x1, #1
    // 0x3c4b34: r0 = AllocateContext()
    //     0x3c4b34: bl              #0x5834e8  ; AllocateContextStub
    // 0x3c4b38: mov             x2, x0
    // 0x3c4b3c: ldur            x0, [fp, #-8]
    // 0x3c4b40: stur            x2, [fp, #-0x10]
    // 0x3c4b44: StoreField: r2->field_b = r0
    //     0x3c4b44: stur            w0, [x2, #0xb]
    // 0x3c4b48: r1 = <bool>
    //     0x3c4b48: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x3c4b4c: r0 = _Future()
    //     0x3c4b4c: bl              #0x255644  ; Allocate_FutureStub -> _Future<X0> (size=0x1c)
    // 0x3c4b50: stur            x0, [fp, #-0x18]
    // 0x3c4b54: StoreField: r0->field_b = rZR
    //     0x3c4b54: stur            xzr, [x0, #0xb]
    // 0x3c4b58: r0 = LoadStaticField(0x358)
    //     0x3c4b58: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c4b5c: ldr             x0, [x0, #0x6b0]
    // 0x3c4b60: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c4b64: cmp             w0, w16
    // 0x3c4b68: b.ne            #0x3c4b74
    // 0x3c4b6c: r2 = _current
    //     0x3c4b6c: ldr             x2, [PP, #0x650]  ; [pp+0x650] Field <Zone._current@5048458>: static late (offset: 0x358)
    // 0x3c4b70: r0 = InitLateStaticField()
    //     0x3c4b70: bl              #0x582704  ; InitLateStaticFieldStub
    // 0x3c4b74: mov             x1, x0
    // 0x3c4b78: ldur            x0, [fp, #-0x18]
    // 0x3c4b7c: StoreField: r0->field_13 = r1
    //     0x3c4b7c: stur            w1, [x0, #0x13]
    // 0x3c4b80: r1 = <bool>
    //     0x3c4b80: ldr             x1, [PP, #0x37a8]  ; [pp+0x37a8] TypeArguments: <bool>
    // 0x3c4b84: r0 = _AsyncCompleter()
    //     0x3c4b84: bl              #0x255638  ; Allocate_AsyncCompleterStub -> _AsyncCompleter<X0> (size=0x10)
    // 0x3c4b88: mov             x2, x0
    // 0x3c4b8c: ldur            x0, [fp, #-0x18]
    // 0x3c4b90: stur            x2, [fp, #-0x20]
    // 0x3c4b94: StoreField: r2->field_b = r0
    //     0x3c4b94: stur            w0, [x2, #0xb]
    // 0x3c4b98: ldur            x0, [fp, #-0x10]
    // 0x3c4b9c: StoreField: r0->field_f = r2
    //     0x3c4b9c: stur            w2, [x0, #0xf]
    // 0x3c4ba0: ldur            x3, [fp, #-8]
    // 0x3c4ba4: LoadField: r1 = r3->field_f
    //     0x3c4ba4: ldur            w1, [x3, #0xf]
    // 0x3c4ba8: DecompressPointer r1
    //     0x3c4ba8: add             x1, x1, HEAP, lsl #32
    // 0x3c4bac: r0 = preloadSprites()
    //     0x3c4bac: bl              #0x3c621c  ; [package:ricochlime/flame/components/background/background.dart] Background::preloadSprites
    // 0x3c4bb0: mov             x2, x0
    // 0x3c4bb4: ldur            x0, [fp, #-8]
    // 0x3c4bb8: stur            x2, [fp, #-0x18]
    // 0x3c4bbc: LoadField: r1 = r0->field_f
    //     0x3c4bbc: ldur            w1, [x0, #0xf]
    // 0x3c4bc0: DecompressPointer r1
    //     0x3c4bc0: add             x1, x1, HEAP, lsl #32
    // 0x3c4bc4: r0 = preloadSprites()
    //     0x3c4bc4: bl              #0x3c60bc  ; [package:ricochlime/flame/components/monster.dart] MonsterAnimation::preloadSprites
    // 0x3c4bc8: mov             x2, x0
    // 0x3c4bcc: ldur            x0, [fp, #-8]
    // 0x3c4bd0: stur            x2, [fp, #-0x28]
    // 0x3c4bd4: LoadField: r1 = r0->field_f
    //     0x3c4bd4: ldur            w1, [x0, #0xf]
    // 0x3c4bd8: DecompressPointer r1
    //     0x3c4bd8: add             x1, x1, HEAP, lsl #32
    // 0x3c4bdc: r0 = preloadSprites()
    //     0x3c4bdc: bl              #0x3c607c  ; [package:ricochlime/flame/components/player.dart] Player::preloadSprites
    // 0x3c4be0: mov             x2, x0
    // 0x3c4be4: ldur            x0, [fp, #-8]
    // 0x3c4be8: stur            x2, [fp, #-0x30]
    // 0x3c4bec: LoadField: r1 = r0->field_f
    //     0x3c4bec: ldur            w1, [x0, #0xf]
    // 0x3c4bf0: DecompressPointer r1
    //     0x3c4bf0: add             x1, x1, HEAP, lsl #32
    // 0x3c4bf4: r0 = preloadSprites()
    //     0x3c4bf4: bl              #0x3c4ca0  ; [package:ricochlime/utils/shop_items.dart] ShopItems::preloadSprites
    // 0x3c4bf8: r1 = Null
    //     0x3c4bf8: mov             x1, NULL
    // 0x3c4bfc: r2 = 8
    //     0x3c4bfc: mov             x2, #8
    // 0x3c4c00: stur            x0, [fp, #-8]
    // 0x3c4c04: r0 = AllocateArray()
    //     0x3c4c04: bl              #0x5845d8  ; AllocateArrayStub
    // 0x3c4c08: mov             x2, x0
    // 0x3c4c0c: ldur            x0, [fp, #-0x18]
    // 0x3c4c10: stur            x2, [fp, #-0x38]
    // 0x3c4c14: StoreField: r2->field_f = r0
    //     0x3c4c14: stur            w0, [x2, #0xf]
    // 0x3c4c18: ldur            x0, [fp, #-0x28]
    // 0x3c4c1c: StoreField: r2->field_13 = r0
    //     0x3c4c1c: stur            w0, [x2, #0x13]
    // 0x3c4c20: ldur            x0, [fp, #-0x30]
    // 0x3c4c24: ArrayStore: r2[0] = r0  ; List_4
    //     0x3c4c24: stur            w0, [x2, #0x17]
    // 0x3c4c28: ldur            x0, [fp, #-8]
    // 0x3c4c2c: StoreField: r2->field_1b = r0
    //     0x3c4c2c: stur            w0, [x2, #0x1b]
    // 0x3c4c30: r1 = <Future<void?>>
    //     0x3c4c30: ldr             x1, [PP, #0x4da0]  ; [pp+0x4da0] TypeArguments: <Future<void?>>
    // 0x3c4c34: r0 = AllocateGrowableArray()
    //     0x3c4c34: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x3c4c38: mov             x1, x0
    // 0x3c4c3c: ldur            x0, [fp, #-0x38]
    // 0x3c4c40: StoreField: r1->field_f = r0
    //     0x3c4c40: stur            w0, [x1, #0xf]
    // 0x3c4c44: r0 = 8
    //     0x3c4c44: mov             x0, #8
    // 0x3c4c48: StoreField: r1->field_b = r0
    //     0x3c4c48: stur            w0, [x1, #0xb]
    // 0x3c4c4c: r16 = <void?>
    //     0x3c4c4c: ldr             x16, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x3c4c50: stp             x1, x16, [SP]
    // 0x3c4c54: r4 = const [0x1, 0x1, 0x1, 0x1, null]
    //     0x3c4c54: ldr             x4, [PP, #0x1b0]  ; [pp+0x1b0] List(5) [0x1, 0x1, 0x1, 0x1, Null]
    // 0x3c4c58: r0 = wait()
    //     0x3c4c58: bl              #0x263a08  ; [dart:async] Future::wait
    // 0x3c4c5c: ldur            x2, [fp, #-0x10]
    // 0x3c4c60: r1 = Function '<anonymous closure>':.
    //     0x3c4c60: add             x1, PP, #0xf, lsl #12  ; [pp+0xfde0] AnonymousClosure: (0x3c625c), in [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::preloadSprites (0x3c4aa8)
    //     0x3c4c64: ldr             x1, [x1, #0xde0]
    // 0x3c4c68: stur            x0, [fp, #-8]
    // 0x3c4c6c: r0 = AllocateClosure()
    //     0x3c4c6c: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c4c70: r16 = <void?>
    //     0x3c4c70: ldr             x16, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    // 0x3c4c74: ldur            lr, [fp, #-8]
    // 0x3c4c78: stp             lr, x16, [SP, #8]
    // 0x3c4c7c: str             x0, [SP]
    // 0x3c4c80: r4 = const [0x1, 0x2, 0x2, 0x2, null]
    //     0x3c4c80: ldr             x4, [PP, #0x40]  ; [pp+0x40] List(5) [0x1, 0x2, 0x2, 0x2, Null]
    // 0x3c4c84: r0 = then()
    //     0x3c4c84: bl              #0x52a270  ; [dart:async] _Future::then
    // 0x3c4c88: ldur            x0, [fp, #-0x20]
    // 0x3c4c8c: LeaveFrame
    //     0x3c4c8c: mov             SP, fp
    //     0x3c4c90: ldp             fp, lr, [SP], #0x10
    // 0x3c4c94: ret
    //     0x3c4c94: ret             
    // 0x3c4c98: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c4c98: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c4c9c: b               #0x3c4b30
  }
  [closure] void <anonymous closure>(dynamic, List<void>) {
    // ** addr: 0x3c625c, size: 0x58
    // 0x3c625c: EnterFrame
    //     0x3c625c: stp             fp, lr, [SP, #-0x10]!
    //     0x3c6260: mov             fp, SP
    // 0x3c6264: AllocStack(0x8)
    //     0x3c6264: sub             SP, SP, #8
    // 0x3c6268: SetupParameters([dynamic _ /* r0 */])
    //     0x3c6268: ldr             x0, [fp, #0x18]
    //     0x3c626c: ldur            w1, [x0, #0x17]
    //     0x3c6270: add             x1, x1, HEAP, lsl #32
    // 0x3c6274: CheckStackOverflow
    //     0x3c6274: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c6278: cmp             SP, x16
    //     0x3c627c: b.ls            #0x3c62ac
    // 0x3c6280: LoadField: r0 = r1->field_f
    //     0x3c6280: ldur            w0, [x1, #0xf]
    // 0x3c6284: DecompressPointer r0
    //     0x3c6284: add             x0, x0, HEAP, lsl #32
    // 0x3c6288: r16 = true
    //     0x3c6288: add             x16, NULL, #0x20  ; true
    // 0x3c628c: str             x16, [SP]
    // 0x3c6290: mov             x1, x0
    // 0x3c6294: r4 = const [0, 0x2, 0x1, 0x2, null]
    //     0x3c6294: ldr             x4, [PP, #0x928]  ; [pp+0x928] List(5) [0, 0x2, 0x1, 0x2, Null]
    // 0x3c6298: r0 = complete()
    //     0x3c6298: bl              #0x529fcc  ; [dart:async] _AsyncCompleter::complete
    // 0x3c629c: r0 = Null
    //     0x3c629c: mov             x0, NULL
    // 0x3c62a0: LeaveFrame
    //     0x3c62a0: mov             SP, fp
    //     0x3c62a4: ldp             fp, lr, [SP], #0x10
    // 0x3c62a8: ret
    //     0x3c62a8: ret             
    // 0x3c62ac: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c62ac: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c62b0: b               #0x3c6280
  }
  _ onTapUp(/* No info */) {
    // ** addr: 0x3c7de8, size: 0x130
    // 0x3c7de8: EnterFrame
    //     0x3c7de8: stp             fp, lr, [SP, #-0x10]!
    //     0x3c7dec: mov             fp, SP
    // 0x3c7df0: AllocStack(0x8)
    //     0x3c7df0: sub             SP, SP, #8
    // 0x3c7df4: SetupParameters(RicochlimeGame this /* r1 => r0, fp-0x8 */)
    //     0x3c7df4: mov             x0, x1
    //     0x3c7df8: stur            x1, [fp, #-8]
    // 0x3c7dfc: CheckStackOverflow
    //     0x3c7dfc: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c7e00: cmp             SP, x16
    //     0x3c7e04: b.ls            #0x3c7ef4
    // 0x3c7e08: mov             x1, x0
    // 0x3c7e0c: LoadField: r0 = r1->field_8f
    //     0x3c7e0c: ldur            w0, [x1, #0x8f]
    // 0x3c7e10: DecompressPointer r0
    //     0x3c7e10: add             x0, x0, HEAP, lsl #32
    // 0x3c7e14: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c7e18: cmp             w0, w16
    // 0x3c7e1c: b.ne            #0x3c7e2c
    // 0x3c7e20: r2 = state
    //     0x3c7e20: add             x2, PP, #0xc, lsl #12  ; [pp+0xc790] Field <RicochlimeGame.state>: late final (offset: 0x90)
    //     0x3c7e24: ldr             x2, [x2, #0x790]
    // 0x3c7e28: r0 = InitLateFinalInstanceField()
    //     0x3c7e28: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3c7e2c: LoadField: r1 = r0->field_27
    //     0x3c7e2c: ldur            w1, [x0, #0x27]
    // 0x3c7e30: DecompressPointer r1
    //     0x3c7e30: add             x1, x1, HEAP, lsl #32
    // 0x3c7e34: r16 = Instance_GameState
    //     0x3c7e34: add             x16, PP, #0xc, lsl #12  ; [pp+0xc7b8] Obj!GameState@5d8a01
    //     0x3c7e38: ldr             x16, [x16, #0x7b8]
    // 0x3c7e3c: cmp             w1, w16
    // 0x3c7e40: b.ne            #0x3c7eb0
    // 0x3c7e44: r0 = LoadStaticField(0x870)
    //     0x3c7e44: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c7e48: ldr             x0, [x0, #0x10e0]
    // 0x3c7e4c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c7e50: cmp             w0, w16
    // 0x3c7e54: b.ne            #0x3c7e64
    // 0x3c7e58: r2 = timeDilation
    //     0x3c7e58: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7c0] Field <RicochlimeGame.timeDilation>: static late final (offset: 0x870)
    //     0x3c7e5c: ldr             x2, [x2, #0x7c0]
    // 0x3c7e60: r0 = InitLateFinalStaticField()
    //     0x3c7e60: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c7e64: LoadField: r1 = r0->field_27
    //     0x3c7e64: ldur            w1, [x0, #0x27]
    // 0x3c7e68: DecompressPointer r1
    //     0x3c7e68: add             x1, x1, HEAP, lsl #32
    // 0x3c7e6c: LoadField: d0 = r1->field_7
    //     0x3c7e6c: ldur            d0, [x1, #7]
    // 0x3c7e70: d1 = 0.500000
    //     0x3c7e70: fmov            d1, #0.50000000
    // 0x3c7e74: fadd            d2, d0, d1
    // 0x3c7e78: r2 = inline_Allocate_Double()
    //     0x3c7e78: ldp             x2, x1, [THR, #0x60]  ; THR::top
    //     0x3c7e7c: add             x2, x2, #0x10
    //     0x3c7e80: cmp             x1, x2
    //     0x3c7e84: b.ls            #0x3c7efc
    //     0x3c7e88: str             x2, [THR, #0x60]  ; THR::top
    //     0x3c7e8c: sub             x2, x2, #0xf
    //     0x3c7e90: mov             x1, #0xe19c
    //     0x3c7e94: movk            x1, #3, lsl #16
    //     0x3c7e98: stur            x1, [x2, #-1]
    // 0x3c7e9c: dmb             ishst
    // 0x3c7ea0: StoreField: r2->field_7 = d2
    //     0x3c7ea0: stur            d2, [x2, #7]
    // 0x3c7ea4: mov             x1, x0
    // 0x3c7ea8: r0 = value=()
    //     0x3c7ea8: bl              #0x27d504  ; [package:flutter/src/foundation/change_notifier.dart] ValueNotifier::value=
    // 0x3c7eac: b               #0x3c7ee4
    // 0x3c7eb0: r16 = Instance_GameState
    //     0x3c7eb0: add             x16, PP, #0xc, lsl #12  ; [pp+0xc798] Obj!GameState@5d8a61
    //     0x3c7eb4: ldr             x16, [x16, #0x798]
    // 0x3c7eb8: cmp             w1, w16
    // 0x3c7ebc: b.ne            #0x3c7ee4
    // 0x3c7ec0: ldur            x1, [fp, #-8]
    // 0x3c7ec4: LoadField: r0 = r1->field_cf
    //     0x3c7ec4: ldur            w0, [x1, #0xcf]
    // 0x3c7ec8: DecompressPointer r0
    //     0x3c7ec8: add             x0, x0, HEAP, lsl #32
    // 0x3c7ecc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c7ed0: cmp             w0, w16
    // 0x3c7ed4: b.ne            #0x3c7ee4
    // 0x3c7ed8: r2 = pointAndClickEnabled
    //     0x3c7ed8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11c20] Field <RicochlimeGame.pointAndClickEnabled>: late final (offset: 0xd0)
    //     0x3c7edc: ldr             x2, [x2, #0xc20]
    // 0x3c7ee0: r0 = InitLateFinalInstanceField()
    //     0x3c7ee0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3c7ee4: r0 = Null
    //     0x3c7ee4: mov             x0, NULL
    // 0x3c7ee8: LeaveFrame
    //     0x3c7ee8: mov             SP, fp
    //     0x3c7eec: ldp             fp, lr, [SP], #0x10
    // 0x3c7ef0: ret
    //     0x3c7ef0: ret             
    // 0x3c7ef4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c7ef4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c7ef8: b               #0x3c7e08
    // 0x3c7efc: SaveReg d2
    //     0x3c7efc: str             q2, [SP, #-0x10]!
    // 0x3c7f00: SaveReg r0
    //     0x3c7f00: str             x0, [SP, #-8]!
    // 0x3c7f04: r0 = AllocateDouble()
    //     0x3c7f04: bl              #0x584528  ; AllocateDoubleStub
    // 0x3c7f08: mov             x2, x0
    // 0x3c7f0c: RestoreReg r0
    //     0x3c7f0c: ldr             x0, [SP], #8
    // 0x3c7f10: RestoreReg d2
    //     0x3c7f10: ldr             q2, [SP], #0x10
    // 0x3c7f14: b               #0x3c7ea0
  }
  _ update(/* No info */) {
    // ** addr: 0x3d1264, size: 0x1a4
    // 0x3d1264: EnterFrame
    //     0x3d1264: stp             fp, lr, [SP, #-0x10]!
    //     0x3d1268: mov             fp, SP
    // 0x3d126c: AllocStack(0x20)
    //     0x3d126c: sub             SP, SP, #0x20
    // 0x3d1270: d1 = 0.500000
    //     0x3d1270: fmov            d1, #0.50000000
    // 0x3d1274: stur            x1, [fp, #-8]
    // 0x3d1278: stur            d0, [fp, #-0x10]
    // 0x3d127c: CheckStackOverflow
    //     0x3d127c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d1280: cmp             SP, x16
    //     0x3d1284: b.ls            #0x3d1400
    // 0x3d1288: fcmp            d0, d1
    // 0x3d128c: b.le            #0x3d12ac
    // 0x3d1290: StoreField: r1->field_c7 = rZR
    //     0x3d1290: stur            xzr, [x1, #0xc7]
    // 0x3d1294: r1 = 0
    //     0x3d1294: mov             x1, #0
    // 0x3d1298: r0 = fps=()
    //     0x3d1298: bl              #0x3d1620  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::fps=
    // 0x3d129c: r0 = Null
    //     0x3d129c: mov             x0, NULL
    // 0x3d12a0: LeaveFrame
    //     0x3d12a0: mov             SP, fp
    //     0x3d12a4: ldp             fp, lr, [SP], #0x10
    // 0x3d12a8: ret
    //     0x3d12a8: ret             
    // 0x3d12ac: r0 = LoadStaticField(0xccc)
    //     0x3d12ac: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3d12b0: ldr             x0, [x0, #0x1998]
    // 0x3d12b4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d12b8: cmp             w0, w16
    // 0x3d12bc: b.ne            #0x3d12cc
    // 0x3d12c0: r2 = stows
    //     0x3d12c0: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3d12c4: ldr             x2, [x2, #0x310]
    // 0x3d12c8: r0 = InitLateFinalStaticField()
    //     0x3d12c8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3d12cc: LoadField: r1 = r0->field_37
    //     0x3d12cc: ldur            w1, [x0, #0x37]
    // 0x3d12d0: DecompressPointer r1
    //     0x3d12d0: add             x1, x1, HEAP, lsl #32
    // 0x3d12d4: LoadField: r0 = r1->field_43
    //     0x3d12d4: ldur            w0, [x1, #0x43]
    // 0x3d12d8: DecompressPointer r0
    //     0x3d12d8: add             x0, x0, HEAP, lsl #32
    // 0x3d12dc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d12e0: cmp             w0, w16
    // 0x3d12e4: b.ne            #0x3d12f4
    // 0x3d12e8: r2 = _value
    //     0x3d12e8: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3d12ec: ldr             x2, [x2, #0x4b0]
    // 0x3d12f0: r0 = InitLateInstanceField()
    //     0x3d12f0: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3d12f4: r1 = LoadInt32Instr(r0)
    //     0x3d12f4: sbfx            x1, x0, #1, #0x1f
    //     0x3d12f8: tbz             w0, #0, #0x3d1300
    //     0x3d12fc: ldur            x1, [x0, #7]
    // 0x3d1300: cmp             x1, #0
    // 0x3d1304: b.gt            #0x3d1350
    // 0x3d1308: r0 = LoadStaticField(0x870)
    //     0x3d1308: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3d130c: ldr             x0, [x0, #0x10e0]
    // 0x3d1310: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d1314: cmp             w0, w16
    // 0x3d1318: b.ne            #0x3d1328
    // 0x3d131c: r2 = timeDilation
    //     0x3d131c: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7c0] Field <RicochlimeGame.timeDilation>: static late final (offset: 0x870)
    //     0x3d1320: ldr             x2, [x2, #0x7c0]
    // 0x3d1324: r0 = InitLateFinalStaticField()
    //     0x3d1324: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3d1328: LoadField: r1 = r0->field_27
    //     0x3d1328: ldur            w1, [x0, #0x27]
    // 0x3d132c: DecompressPointer r1
    //     0x3d132c: add             x1, x1, HEAP, lsl #32
    // 0x3d1330: LoadField: d1 = r1->field_7
    //     0x3d1330: ldur            d1, [x1, #7]
    // 0x3d1334: ldur            x1, [fp, #-8]
    // 0x3d1338: ldur            d0, [fp, #-0x10]
    // 0x3d133c: r0 = updateNow()
    //     0x3d133c: bl              #0x3d1408  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::updateNow
    // 0x3d1340: r0 = Null
    //     0x3d1340: mov             x0, NULL
    // 0x3d1344: LeaveFrame
    //     0x3d1344: mov             SP, fp
    //     0x3d1348: ldp             fp, lr, [SP], #0x10
    // 0x3d134c: ret
    //     0x3d134c: ret             
    // 0x3d1350: ldur            x0, [fp, #-8]
    // 0x3d1354: ldur            d0, [fp, #-0x10]
    // 0x3d1358: d2 = 1.000000
    //     0x3d1358: fmov            d2, #1.00000000
    // 0x3d135c: d1 = 0.900000
    //     0x3d135c: add             x17, PP, #0xb, lsl #12  ; [pp+0xb938] IMM: double(0.9) from 0x3feccccccccccccd
    //     0x3d1360: ldr             d1, [x17, #0x938]
    // 0x3d1364: scvtf           d3, x1
    // 0x3d1368: fdiv            d4, d2, d3
    // 0x3d136c: stur            d4, [fp, #-0x20]
    // 0x3d1370: LoadField: d2 = r0->field_c7
    //     0x3d1370: ldur            d2, [x0, #0xc7]
    // 0x3d1374: fadd            d3, d2, d0
    // 0x3d1378: stur            d3, [fp, #-0x18]
    // 0x3d137c: StoreField: r0->field_c7 = d3
    //     0x3d137c: stur            d3, [x0, #0xc7]
    // 0x3d1380: fmul            d0, d4, d1
    // 0x3d1384: fcmp            d0, d3
    // 0x3d1388: b.le            #0x3d139c
    // 0x3d138c: r0 = Null
    //     0x3d138c: mov             x0, NULL
    // 0x3d1390: LeaveFrame
    //     0x3d1390: mov             SP, fp
    //     0x3d1394: ldp             fp, lr, [SP], #0x10
    // 0x3d1398: ret
    //     0x3d1398: ret             
    // 0x3d139c: r0 = LoadStaticField(0x870)
    //     0x3d139c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3d13a0: ldr             x0, [x0, #0x10e0]
    // 0x3d13a4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d13a8: cmp             w0, w16
    // 0x3d13ac: b.ne            #0x3d13bc
    // 0x3d13b0: r2 = timeDilation
    //     0x3d13b0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc7c0] Field <RicochlimeGame.timeDilation>: static late final (offset: 0x870)
    //     0x3d13b4: ldr             x2, [x2, #0x7c0]
    // 0x3d13b8: r0 = InitLateFinalStaticField()
    //     0x3d13b8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3d13bc: LoadField: r1 = r0->field_27
    //     0x3d13bc: ldur            w1, [x0, #0x27]
    // 0x3d13c0: DecompressPointer r1
    //     0x3d13c0: add             x1, x1, HEAP, lsl #32
    // 0x3d13c4: LoadField: d1 = r1->field_7
    //     0x3d13c4: ldur            d1, [x1, #7]
    // 0x3d13c8: ldur            x1, [fp, #-8]
    // 0x3d13cc: ldur            d0, [fp, #-0x18]
    // 0x3d13d0: r0 = updateNow()
    //     0x3d13d0: bl              #0x3d1408  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::updateNow
    // 0x3d13d4: ldur            x1, [fp, #-8]
    // 0x3d13d8: LoadField: d0 = r1->field_c7
    //     0x3d13d8: ldur            d0, [x1, #0xc7]
    // 0x3d13dc: ldur            d1, [fp, #-0x20]
    // 0x3d13e0: fsub            d2, d0, d1
    // 0x3d13e4: d0 = 0.000000
    //     0x3d13e4: eor             v0.16b, v0.16b, v0.16b
    // 0x3d13e8: fmin            v1.2d, v2.2d, v0.2d
    // 0x3d13ec: StoreField: r1->field_c7 = d1
    //     0x3d13ec: stur            d1, [x1, #0xc7]
    // 0x3d13f0: r0 = Null
    //     0x3d13f0: mov             x0, NULL
    // 0x3d13f4: LeaveFrame
    //     0x3d13f4: mov             SP, fp
    //     0x3d13f8: ldp             fp, lr, [SP], #0x10
    // 0x3d13fc: ret
    //     0x3d13fc: ret             
    // 0x3d1400: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d1400: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d1404: b               #0x3d1288
  }
  _ updateNow(/* No info */) {
    // ** addr: 0x3d1408, size: 0x154
    // 0x3d1408: EnterFrame
    //     0x3d1408: stp             fp, lr, [SP, #-0x10]!
    //     0x3d140c: mov             fp, SP
    // 0x3d1410: AllocStack(0x18)
    //     0x3d1410: sub             SP, SP, #0x18
    // 0x3d1414: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0x8 */, dynamic _ /* d0 => d0, fp-0x10 */, dynamic _ /* d1 => d1, fp-0x18 */)
    //     0x3d1414: stur            x1, [fp, #-8]
    //     0x3d1418: stur            d0, [fp, #-0x10]
    //     0x3d141c: stur            d1, [fp, #-0x18]
    // 0x3d1420: CheckStackOverflow
    //     0x3d1420: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d1424: cmp             SP, x16
    //     0x3d1428: b.ls            #0x3d1538
    // 0x3d142c: r0 = LoadStaticField(0xccc)
    //     0x3d142c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3d1430: ldr             x0, [x0, #0x1998]
    // 0x3d1434: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d1438: cmp             w0, w16
    // 0x3d143c: b.ne            #0x3d144c
    // 0x3d1440: r2 = stows
    //     0x3d1440: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3d1444: ldr             x2, [x2, #0x310]
    // 0x3d1448: r0 = InitLateFinalStaticField()
    //     0x3d1448: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3d144c: LoadField: r1 = r0->field_3b
    //     0x3d144c: ldur            w1, [x0, #0x3b]
    // 0x3d1450: DecompressPointer r1
    //     0x3d1450: add             x1, x1, HEAP, lsl #32
    // 0x3d1454: LoadField: r0 = r1->field_43
    //     0x3d1454: ldur            w0, [x1, #0x43]
    // 0x3d1458: DecompressPointer r0
    //     0x3d1458: add             x0, x0, HEAP, lsl #32
    // 0x3d145c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d1460: cmp             w0, w16
    // 0x3d1464: b.ne            #0x3d1474
    // 0x3d1468: r2 = _value
    //     0x3d1468: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x3d146c: ldr             x2, [x2, #0x4b0]
    // 0x3d1470: r0 = InitLateInstanceField()
    //     0x3d1470: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x3d1474: tbnz            w0, #4, #0x3d14f0
    // 0x3d1478: ldur            d1, [fp, #-0x10]
    // 0x3d147c: d2 = 1.000000
    //     0x3d147c: fmov            d2, #1.00000000
    // 0x3d1480: d0 = 0.001001
    //     0x3d1480: add             x17, PP, #0x19, lsl #12  ; [pp+0x19ce0] IMM: double(0.001001001001001001) from 0x3f506680a4010668
    //     0x3d1484: ldr             d0, [x17, #0xce0]
    // 0x3d1488: fmax            v3.2d, v1.2d, v0.2d
    // 0x3d148c: fdiv            d0, d2, d3
    // 0x3d1490: stp             fp, lr, [SP, #-0x10]!
    // 0x3d1494: mov             fp, SP
    // 0x3d1498: CallRuntime_LibcRound(double) -> double
    //     0x3d1498: and             SP, SP, #0xfffffffffffffff0
    //     0x3d149c: mov             sp, SP
    //     0x3d14a0: ldr             x16, [THR, #0x770]  ; THR::LibcRound
    //     0x3d14a4: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x3d14a8: blr             x16
    //     0x3d14ac: mov             x16, #8
    //     0x3d14b0: str             x16, [THR, #0x6c8]  ; THR::vm_tag
    //     0x3d14b4: ldr             x16, [THR, #0x690]  ; THR::saved_stack_limit
    //     0x3d14b8: sub             sp, x16, #1, lsl #12
    //     0x3d14bc: mov             SP, fp
    //     0x3d14c0: ldp             fp, lr, [SP], #0x10
    // 0x3d14c4: fcmp            d0, d0
    // 0x3d14c8: b.vs            #0x3d1540
    // 0x3d14cc: fcvtzs          x0, d0
    // 0x3d14d0: asr             x16, x0, #0x1e
    // 0x3d14d4: cmp             x16, x0, asr #63
    // 0x3d14d8: b.ne            #0x3d1540
    // 0x3d14dc: lsl             x0, x0, #1
    // 0x3d14e0: r1 = LoadInt32Instr(r0)
    //     0x3d14e0: sbfx            x1, x0, #1, #0x1f
    //     0x3d14e4: tbz             w0, #0, #0x3d14ec
    //     0x3d14e8: ldur            x1, [x0, #7]
    // 0x3d14ec: r0 = fps=()
    //     0x3d14ec: bl              #0x3d1620  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::fps=
    // 0x3d14f0: ldur            x0, [fp, #-8]
    // 0x3d14f4: ldur            d0, [fp, #-0x10]
    // 0x3d14f8: ldur            d1, [fp, #-0x18]
    // 0x3d14fc: d2 = 0.500000
    //     0x3d14fc: fmov            d2, #0.50000000
    // 0x3d1500: fmul            d3, d0, d1
    // 0x3d1504: fmin            v1.2d, v3.2d, v2.2d
    // 0x3d1508: stur            d1, [fp, #-0x10]
    // 0x3d150c: LoadField: r1 = r0->field_bb
    //     0x3d150c: ldur            w1, [x0, #0xbb]
    // 0x3d1510: DecompressPointer r1
    //     0x3d1510: add             x1, x1, HEAP, lsl #32
    // 0x3d1514: mov             v0.16b, v1.16b
    // 0x3d1518: r0 = tick()
    //     0x3d1518: bl              #0x3d159c  ; [package:ricochlime/flame/ticker.dart] Ticker::tick
    // 0x3d151c: ldur            x1, [fp, #-8]
    // 0x3d1520: ldur            d0, [fp, #-0x10]
    // 0x3d1524: r0 = update()
    //     0x3d1524: bl              #0x3d155c  ; [package:flame/src/game/flame_game.dart] FlameGame::update
    // 0x3d1528: r0 = Null
    //     0x3d1528: mov             x0, NULL
    // 0x3d152c: LeaveFrame
    //     0x3d152c: mov             SP, fp
    //     0x3d1530: ldp             fp, lr, [SP], #0x10
    // 0x3d1534: ret
    //     0x3d1534: ret             
    // 0x3d1538: r0 = StackOverflowSharedWithFPURegs()
    //     0x3d1538: bl              #0x584764  ; StackOverflowSharedWithFPURegsStub
    // 0x3d153c: b               #0x3d142c
    // 0x3d1540: SaveReg d0
    //     0x3d1540: str             q0, [SP, #-0x10]!
    // 0x3d1544: r0 = 76
    //     0x3d1544: mov             x0, #0x4c
    // 0x3d1548: r30 = DoubleToIntegerStub
    //     0x3d1548: ldr             lr, [PP, #0x2cc0]  ; [pp+0x2cc0] Stub: DoubleToInteger (0x2318e4)
    // 0x3d154c: LoadField: r30 = r30->field_7
    //     0x3d154c: ldur            lr, [lr, #7]
    // 0x3d1550: blr             lr
    // 0x3d1554: RestoreReg d0
    //     0x3d1554: ldr             q0, [SP], #0x10
    // 0x3d1558: b               #0x3d14e0
  }
  set void fps=(int) {
    // ** addr: 0x3d1620, size: 0xc0
    // 0x3d1620: EnterFrame
    //     0x3d1620: stp             fp, lr, [SP, #-0x10]!
    //     0x3d1624: mov             fp, SP
    // 0x3d1628: AllocStack(0x8)
    //     0x3d1628: sub             SP, SP, #8
    // 0x3d162c: SetupParameters(dynamic _ /* r1 => r2 */)
    //     0x3d162c: mov             x2, x1
    // 0x3d1630: CheckStackOverflow
    //     0x3d1630: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d1634: cmp             SP, x16
    //     0x3d1638: b.ls            #0x3d16d8
    // 0x3d163c: r0 = LoadStaticField(0x880)
    //     0x3d163c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3d1640: ldr             x0, [x0, #0x1100]
    // 0x3d1644: r1 = LoadInt32Instr(r0)
    //     0x3d1644: sbfx            x1, x0, #1, #0x1f
    //     0x3d1648: tbz             w0, #0, #0x3d1650
    //     0x3d164c: ldur            x1, [x0, #7]
    // 0x3d1650: cmp             x2, x1
    // 0x3d1654: b.ne            #0x3d1668
    // 0x3d1658: r0 = Null
    //     0x3d1658: mov             x0, NULL
    // 0x3d165c: LeaveFrame
    //     0x3d165c: mov             SP, fp
    //     0x3d1660: ldp             fp, lr, [SP], #0x10
    // 0x3d1664: ret
    //     0x3d1664: ret             
    // 0x3d1668: r0 = BoxInt64Instr(r2)
    //     0x3d1668: sbfiz           x0, x2, #1, #0x1f
    //     0x3d166c: cmp             x2, x0, asr #1
    //     0x3d1670: b.eq            #0x3d167c
    //     0x3d1674: bl              #0x584864  ; AllocateMintSharedWithoutFPURegsStub
    //     0x3d1678: stur            x2, [x0, #7]
    // 0x3d167c: mov             x2, x0
    // 0x3d1680: stur            x0, [fp, #-8]
    // 0x3d1684: StoreStaticField(0x880, r2)
    //     0x3d1684: ldr             x1, [THR, #0x78]  ; THR::field_table_values
    //     0x3d1688: str             x2, [x1, #0x1100]
    // 0x3d168c: r0 = LoadStaticField(0x878)
    //     0x3d168c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3d1690: ldr             x0, [x0, #0x10f0]
    // 0x3d1694: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3d1698: cmp             w0, w16
    // 0x3d169c: b.ne            #0x3d16ac
    // 0x3d16a0: r2 = _fpsStreamController
    //     0x3d16a0: add             x2, PP, #0x16, lsl #12  ; [pp+0x16910] Field <RicochlimeGame._fpsStreamController@213386006>: static late final (offset: 0x878)
    //     0x3d16a4: ldr             x2, [x2, #0x910]
    // 0x3d16a8: r0 = InitLateFinalStaticField()
    //     0x3d16a8: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3d16ac: LoadField: r1 = r0->field_1b
    //     0x3d16ac: ldur            w1, [x0, #0x1b]
    // 0x3d16b0: DecompressPointer r1
    //     0x3d16b0: add             x1, x1, HEAP, lsl #32
    // 0x3d16b4: cmp             w1, NULL
    // 0x3d16b8: b.eq            #0x3d16c8
    // 0x3d16bc: mov             x1, x0
    // 0x3d16c0: ldur            x2, [fp, #-8]
    // 0x3d16c4: r0 = add()
    //     0x3d16c4: bl              #0x4c50a0  ; [dart:async] _BroadcastStreamController::add
    // 0x3d16c8: r0 = Null
    //     0x3d16c8: mov             x0, NULL
    // 0x3d16cc: LeaveFrame
    //     0x3d16cc: mov             SP, fp
    //     0x3d16d0: ldp             fp, lr, [SP], #0x10
    // 0x3d16d4: ret
    //     0x3d16d4: ret             
    // 0x3d16d8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d16d8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d16dc: b               #0x3d163c
  }
  Background background(RicochlimeGame) {
    // ** addr: 0x3d34a0, size: 0x40
    // 0x3d34a0: EnterFrame
    //     0x3d34a0: stp             fp, lr, [SP, #-0x10]!
    //     0x3d34a4: mov             fp, SP
    // 0x3d34a8: AllocStack(0x8)
    //     0x3d34a8: sub             SP, SP, #8
    // 0x3d34ac: CheckStackOverflow
    //     0x3d34ac: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3d34b0: cmp             SP, x16
    //     0x3d34b4: b.ls            #0x3d34d8
    // 0x3d34b8: r0 = Background()
    //     0x3d34b8: bl              #0x3d3530  ; AllocateBackgroundStub -> Background (size=0x58)
    // 0x3d34bc: mov             x1, x0
    // 0x3d34c0: stur            x0, [fp, #-8]
    // 0x3d34c4: r0 = Background()
    //     0x3d34c4: bl              #0x3d34e0  ; [package:ricochlime/flame/components/background/background.dart] Background::Background
    // 0x3d34c8: ldur            x0, [fp, #-8]
    // 0x3d34cc: LeaveFrame
    //     0x3d34cc: mov             SP, fp
    //     0x3d34d0: ldp             fp, lr, [SP], #0x10
    // 0x3d34d4: ret
    //     0x3d34d4: ret             
    // 0x3d34d8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3d34d8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3d34dc: b               #0x3d34b8
  }
  static Stream<int> fpsStream() {
    // ** addr: 0x402b3c, size: 0x60
    // 0x402b3c: EnterFrame
    //     0x402b3c: stp             fp, lr, [SP, #-0x10]!
    //     0x402b40: mov             fp, SP
    // 0x402b44: AllocStack(0x8)
    //     0x402b44: sub             SP, SP, #8
    // 0x402b48: CheckStackOverflow
    //     0x402b48: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x402b4c: cmp             SP, x16
    //     0x402b50: b.ls            #0x402b94
    // 0x402b54: r0 = LoadStaticField(0x878)
    //     0x402b54: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x402b58: ldr             x0, [x0, #0x10f0]
    // 0x402b5c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402b60: cmp             w0, w16
    // 0x402b64: b.ne            #0x402b74
    // 0x402b68: r2 = _fpsStreamController
    //     0x402b68: add             x2, PP, #0x16, lsl #12  ; [pp+0x16910] Field <RicochlimeGame._fpsStreamController@213386006>: static late final (offset: 0x878)
    //     0x402b6c: ldr             x2, [x2, #0x910]
    // 0x402b70: r0 = InitLateFinalStaticField()
    //     0x402b70: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x402b74: r1 = <int>
    //     0x402b74: ldr             x1, [PP, #0xcf0]  ; [pp+0xcf0] TypeArguments: <int>
    // 0x402b78: stur            x0, [fp, #-8]
    // 0x402b7c: r0 = _BroadcastStream()
    //     0x402b7c: bl              #0x29c328  ; Allocate_BroadcastStreamStub -> _BroadcastStream<X0> (size=0x10)
    // 0x402b80: ldur            x1, [fp, #-8]
    // 0x402b84: StoreField: r0->field_b = r1
    //     0x402b84: stur            w1, [x0, #0xb]
    // 0x402b88: LeaveFrame
    //     0x402b88: mov             SP, fp
    //     0x402b8c: ldp             fp, lr, [SP], #0x10
    // 0x402b90: ret
    //     0x402b90: ret             
    // 0x402b94: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x402b94: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x402b98: b               #0x402b54
  }
  _ onLoad(/* No info */) async {
    // ** addr: 0x4339dc, size: 0x1f8
    // 0x4339dc: EnterFrame
    //     0x4339dc: stp             fp, lr, [SP, #-0x10]!
    //     0x4339e0: mov             fp, SP
    // 0x4339e4: AllocStack(0x30)
    //     0x4339e4: sub             SP, SP, #0x30
    // 0x4339e8: SetupParameters(RicochlimeGame this /* r1 => r1, fp-0x10 */)
    //     0x4339e8: stur            NULL, [fp, #-8]
    //     0x4339ec: stur            x1, [fp, #-0x10]
    // 0x4339f0: CheckStackOverflow
    //     0x4339f0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4339f4: cmp             SP, x16
    //     0x4339f8: b.ls            #0x433bc0
    // 0x4339fc: InitAsync() -> Future<void?>
    //     0x4339fc: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x433a00: bl              #0x2556b4  ; InitAsyncStub
    // 0x433a04: r0 = Null
    //     0x433a04: mov             x0, NULL
    // 0x433a08: r0 = Await()
    //     0x433a08: bl              #0x255470  ; AwaitStub
    // 0x433a0c: ldur            x1, [fp, #-0x10]
    // 0x433a10: LoadField: r0 = r1->field_9b
    //     0x433a10: ldur            w0, [x1, #0x9b]
    // 0x433a14: DecompressPointer r0
    //     0x433a14: add             x0, x0, HEAP, lsl #32
    // 0x433a18: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x433a1c: cmp             w0, w16
    // 0x433a20: b.ne            #0x433a30
    // 0x433a24: r2 = background
    //     0x433a24: add             x2, PP, #0xc, lsl #12  ; [pp+0xc6f8] Field <RicochlimeGame.background>: late final (offset: 0x9c)
    //     0x433a28: ldr             x2, [x2, #0x6f8]
    // 0x433a2c: r0 = InitLateFinalInstanceField()
    //     0x433a2c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x433a30: ldur            x1, [fp, #-0x10]
    // 0x433a34: mov             x2, x0
    // 0x433a38: r0 = _addChild()
    //     0x433a38: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x433a3c: r0 = createBoundaries()
    //     0x433a3c: bl              #0x433bd4  ; [package:ricochlime/flame/components/walls.dart] ::createBoundaries
    // 0x433a40: mov             x3, x0
    // 0x433a44: stur            x3, [fp, #-0x28]
    // 0x433a48: LoadField: r4 = r3->field_b
    //     0x433a48: ldur            w4, [x3, #0xb]
    // 0x433a4c: stur            x4, [fp, #-0x20]
    // 0x433a50: r0 = LoadInt32Instr(r4)
    //     0x433a50: sbfx            x0, x4, #1, #0x1f
    // 0x433a54: r5 = 0
    //     0x433a54: mov             x5, #0
    // 0x433a58: stur            x5, [fp, #-0x18]
    // 0x433a5c: CheckStackOverflow
    //     0x433a5c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x433a60: cmp             SP, x16
    //     0x433a64: b.ls            #0x433bc8
    // 0x433a68: cmp             x5, x0
    // 0x433a6c: b.ge            #0x433ac8
    // 0x433a70: mov             x1, x5
    // 0x433a74: cmp             x1, x0
    // 0x433a78: b.hs            #0x433bd0
    // 0x433a7c: LoadField: r0 = r3->field_f
    //     0x433a7c: ldur            w0, [x3, #0xf]
    // 0x433a80: DecompressPointer r0
    //     0x433a80: add             x0, x0, HEAP, lsl #32
    // 0x433a84: ArrayLoad: r2 = r0[r5]  ; Unknown_4
    //     0x433a84: add             x16, x0, x5, lsl #2
    //     0x433a88: ldur            w2, [x16, #0xf]
    // 0x433a8c: DecompressPointer r2
    //     0x433a8c: add             x2, x2, HEAP, lsl #32
    // 0x433a90: ldur            x1, [fp, #-0x10]
    // 0x433a94: r0 = _addChild()
    //     0x433a94: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x433a98: ldur            x1, [fp, #-0x28]
    // 0x433a9c: LoadField: r0 = r1->field_b
    //     0x433a9c: ldur            w0, [x1, #0xb]
    // 0x433aa0: ldur            x2, [fp, #-0x20]
    // 0x433aa4: cmp             w0, w2
    // 0x433aa8: b.ne            #0x433ba4
    // 0x433aac: ldur            x3, [fp, #-0x18]
    // 0x433ab0: add             x5, x3, #1
    // 0x433ab4: r3 = LoadInt32Instr(r0)
    //     0x433ab4: sbfx            x3, x0, #1, #0x1f
    // 0x433ab8: mov             x0, x3
    // 0x433abc: mov             x3, x1
    // 0x433ac0: mov             x4, x2
    // 0x433ac4: b               #0x433a58
    // 0x433ac8: ldur            x1, [fp, #-0x10]
    // 0x433acc: LoadField: r0 = r1->field_93
    //     0x433acc: ldur            w0, [x1, #0x93]
    // 0x433ad0: DecompressPointer r0
    //     0x433ad0: add             x0, x0, HEAP, lsl #32
    // 0x433ad4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x433ad8: cmp             w0, w16
    // 0x433adc: b.ne            #0x433aec
    // 0x433ae0: r2 = player
    //     0x433ae0: add             x2, PP, #0xc, lsl #12  ; [pp+0xc700] Field <RicochlimeGame.player>: late final (offset: 0x94)
    //     0x433ae4: ldr             x2, [x2, #0x700]
    // 0x433ae8: r0 = InitLateFinalInstanceField()
    //     0x433ae8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x433aec: ldur            x1, [fp, #-0x10]
    // 0x433af0: mov             x2, x0
    // 0x433af4: r0 = _addChild()
    //     0x433af4: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x433af8: ldur            x1, [fp, #-0x10]
    // 0x433afc: LoadField: r0 = r1->field_97
    //     0x433afc: ldur            w0, [x1, #0x97]
    // 0x433b00: DecompressPointer r0
    //     0x433b00: add             x0, x0, HEAP, lsl #32
    // 0x433b04: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x433b08: cmp             w0, w16
    // 0x433b0c: b.ne            #0x433b1c
    // 0x433b10: r2 = aimGuide
    //     0x433b10: add             x2, PP, #0xc, lsl #12  ; [pp+0xc708] Field <RicochlimeGame.aimGuide>: late final (offset: 0x98)
    //     0x433b14: ldr             x2, [x2, #0x708]
    // 0x433b18: r0 = InitLateFinalInstanceField()
    //     0x433b18: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x433b1c: ldur            x1, [fp, #-0x10]
    // 0x433b20: mov             x2, x0
    // 0x433b24: r0 = _addChild()
    //     0x433b24: bl              #0x2a1424  ; [package:flame/src/components/core/component.dart] Component::_addChild
    // 0x433b28: r0 = LoadStaticField(0xccc)
    //     0x433b28: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x433b2c: ldr             x0, [x0, #0x1998]
    // 0x433b30: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x433b34: cmp             w0, w16
    // 0x433b38: b.ne            #0x433b48
    // 0x433b3c: r2 = stows
    //     0x433b3c: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x433b40: ldr             x2, [x2, #0x310]
    // 0x433b44: r0 = InitLateFinalStaticField()
    //     0x433b44: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x433b48: LoadField: r2 = r0->field_7
    //     0x433b48: ldur            w2, [x0, #7]
    // 0x433b4c: DecompressPointer r2
    //     0x433b4c: add             x2, x2, HEAP, lsl #32
    // 0x433b50: mov             x1, x2
    // 0x433b54: stur            x2, [fp, #-0x20]
    // 0x433b58: r0 = waitUntilRead()
    //     0x433b58: bl              #0x3c488c  ; [package:stow/src/abstract_stow.dart] Stow::waitUntilRead
    // 0x433b5c: mov             x1, x0
    // 0x433b60: stur            x1, [fp, #-0x30]
    // 0x433b64: r0 = Await()
    //     0x433b64: bl              #0x255470  ; AwaitStub
    // 0x433b68: ldur            x1, [fp, #-0x20]
    // 0x433b6c: LoadField: r0 = r1->field_43
    //     0x433b6c: ldur            w0, [x1, #0x43]
    // 0x433b70: DecompressPointer r0
    //     0x433b70: add             x0, x0, HEAP, lsl #32
    // 0x433b74: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x433b78: cmp             w0, w16
    // 0x433b7c: b.ne            #0x433b8c
    // 0x433b80: r2 = _value
    //     0x433b80: add             x2, PP, #8, lsl #12  ; [pp+0x84b0] Field <Stow._value@798462037>: late (offset: 0x44)
    //     0x433b84: ldr             x2, [x2, #0x4b0]
    // 0x433b88: r0 = InitLateInstanceField()
    //     0x433b88: bl              #0x5825f8  ; InitLateInstanceFieldStub
    // 0x433b8c: ldur            x1, [fp, #-0x10]
    // 0x433b90: mov             x2, x0
    // 0x433b94: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x433b94: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x433b98: r0 = importFromGame()
    //     0x433b98: bl              #0x37193c  ; [package:ricochlime/flame/ricochlime_game.dart] RicochlimeGame::importFromGame
    // 0x433b9c: r0 = Null
    //     0x433b9c: mov             x0, NULL
    // 0x433ba0: r0 = ReturnAsyncNotFuture()
    //     0x433ba0: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x433ba4: r0 = ConcurrentModificationError()
    //     0x433ba4: bl              #0x2379bc  ; AllocateConcurrentModificationErrorStub -> ConcurrentModificationError (size=0x10)
    // 0x433ba8: mov             x1, x0
    // 0x433bac: ldur            x0, [fp, #-0x28]
    // 0x433bb0: StoreField: r1->field_b = r0
    //     0x433bb0: stur            w0, [x1, #0xb]
    // 0x433bb4: mov             x0, x1
    // 0x433bb8: r0 = Throw()
    //     0x433bb8: bl              #0x5827dc  ; ThrowStub
    // 0x433bbc: brk             #0
    // 0x433bc0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x433bc0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x433bc4: b               #0x4339fc
    // 0x433bc8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x433bc8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x433bcc: b               #0x433a68
    // 0x433bd0: r0 = RangeErrorSharedWithoutFPURegs()
    //     0x433bd0: bl              #0x584c14  ; RangeErrorSharedWithoutFPURegsStub
  }
}

// class id: 3840, size: 0x14, field offset: 0x14
enum GameState extends _Enum {

  _Mint field_8;
  _OneByteString field_10;

  _ _enumToString(/* No info */) {
    // ** addr: 0x4a02e0, size: 0x64
    // 0x4a02e0: EnterFrame
    //     0x4a02e0: stp             fp, lr, [SP, #-0x10]!
    //     0x4a02e4: mov             fp, SP
    // 0x4a02e8: AllocStack(0x10)
    //     0x4a02e8: sub             SP, SP, #0x10
    // 0x4a02ec: SetupParameters(GameState this /* r1 => r0, fp-0x8 */)
    //     0x4a02ec: mov             x0, x1
    //     0x4a02f0: stur            x1, [fp, #-8]
    // 0x4a02f4: CheckStackOverflow
    //     0x4a02f4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x4a02f8: cmp             SP, x16
    //     0x4a02fc: b.ls            #0x4a033c
    // 0x4a0300: r1 = Null
    //     0x4a0300: mov             x1, NULL
    // 0x4a0304: r2 = 4
    //     0x4a0304: mov             x2, #4
    // 0x4a0308: r0 = AllocateArray()
    //     0x4a0308: bl              #0x5845d8  ; AllocateArrayStub
    // 0x4a030c: r16 = "GameState."
    //     0x4a030c: add             x16, PP, #0xe, lsl #12  ; [pp+0xe778] "GameState."
    //     0x4a0310: ldr             x16, [x16, #0x778]
    // 0x4a0314: StoreField: r0->field_f = r16
    //     0x4a0314: stur            w16, [x0, #0xf]
    // 0x4a0318: ldur            x1, [fp, #-8]
    // 0x4a031c: LoadField: r2 = r1->field_f
    //     0x4a031c: ldur            w2, [x1, #0xf]
    // 0x4a0320: DecompressPointer r2
    //     0x4a0320: add             x2, x2, HEAP, lsl #32
    // 0x4a0324: StoreField: r0->field_13 = r2
    //     0x4a0324: stur            w2, [x0, #0x13]
    // 0x4a0328: str             x0, [SP]
    // 0x4a032c: r0 = _interpolate()
    //     0x4a032c: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x4a0330: LeaveFrame
    //     0x4a0330: mov             SP, fp
    //     0x4a0334: ldp             fp, lr, [SP], #0x10
    // 0x4a0338: ret
    //     0x4a0338: ret             
    // 0x4a033c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x4a033c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x4a0340: b               #0x4a0300
  }
}
