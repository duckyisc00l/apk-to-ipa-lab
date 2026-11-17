// lib: , url: package:ricochlime/main.dart

// class id: 1049316, size: 0x8
class :: {

  static Future<void> main() async {
    // ** addr: 0x587060, size: 0x110
    // 0x587060: EnterFrame
    //     0x587060: stp             fp, lr, [SP, #-0x10]!
    //     0x587064: mov             fp, SP
    // 0x587068: AllocStack(0x10)
    //     0x587068: sub             SP, SP, #0x10
    // 0x58706c: SetupParameters()
    //     0x58706c: stur            NULL, [fp, #-8]
    // 0x587070: CheckStackOverflow
    //     0x587070: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x587074: cmp             SP, x16
    //     0x587078: b.ls            #0x587168
    // 0x58707c: InitAsync() -> Future<void?>
    //     0x58707c: ldr             x0, [PP, #0x7e8]  ; [pp+0x7e8] TypeArguments: <void?>
    //     0x587080: bl              #0x2556b4  ; InitAsyncStub
    // 0x587084: r0 = ensureInitialized()
    //     0x587084: bl              #0x40598c  ; [package:flutter/src/widgets/binding.dart] WidgetsFlutterBinding::ensureInitialized
    // 0x587088: r0 = LoadStaticField(0xbd0)
    //     0x587088: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x58708c: ldr             x0, [x0, #0x17a0]
    // 0x587090: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x587094: cmp             w0, w16
    // 0x587098: b.ne            #0x5870a4
    // 0x58709c: r2 = root
    //     0x58709c: ldr             x2, [PP, #0x2508]  ; [pp+0x2508] Field <Logger.root>: static late final (offset: 0xbd0)
    // 0x5870a0: r0 = InitLateFinalStaticField()
    //     0x5870a0: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x5870a4: mov             x1, x0
    // 0x5870a8: r2 = Instance_Level
    //     0x5870a8: ldr             x2, [PP, #0x2510]  ; [pp+0x2510] Obj!Level@5ca881
    // 0x5870ac: stur            x0, [fp, #-0x10]
    // 0x5870b0: r0 = level=()
    //     0x5870b0: bl              #0x5888a0  ; [package:logging/src/logger.dart] Logger::level=
    // 0x5870b4: ldur            x1, [fp, #-0x10]
    // 0x5870b8: r0 = _getStream()
    //     0x5870b8: bl              #0x5887e4  ; [package:logging/src/logger.dart] Logger::_getStream
    // 0x5870bc: r1 = Function '<anonymous closure>': static.
    //     0x5870bc: ldr             x1, [PP, #0x2518]  ; [pp+0x2518] AnonymousClosure: static (0x588934), in [package:ricochlime/main.dart] ::main (0x587060)
    // 0x5870c0: r2 = Null
    //     0x5870c0: mov             x2, NULL
    // 0x5870c4: stur            x0, [fp, #-0x10]
    // 0x5870c8: r0 = AllocateClosure()
    //     0x5870c8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x5870cc: ldur            x1, [fp, #-0x10]
    // 0x5870d0: r2 = LoadClassIdInstr(r1)
    //     0x5870d0: ldur            x2, [x1, #-1]
    //     0x5870d4: ubfx            x2, x2, #0xc, #0x14
    // 0x5870d8: mov             x16, x0
    // 0x5870dc: mov             x0, x2
    // 0x5870e0: mov             x2, x16
    // 0x5870e4: r4 = const [0, 0x2, 0, 0x2, null]
    //     0x5870e4: ldr             x4, [PP, #0x308]  ; [pp+0x308] List(5) [0, 0x2, 0, 0x2, Null]
    // 0x5870e8: r0 = GDT[cid_x0 + -0xf0c]()
    //     0x5870e8: sub             lr, x0, #0xf0c
    //     0x5870ec: ldr             lr, [x21, lr, lsl #3]
    //     0x5870f0: blr             lr
    // 0x5870f4: r0 = _addLicenses()
    //     0x5870f4: bl              #0x587ec8  ; [package:ricochlime/main.dart] ::_addLicenses
    // 0x5870f8: r0 = LoadStaticField(0xbe8)
    //     0x5870f8: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x5870fc: ldr             x0, [x0, #0x17d0]
    // 0x587100: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x587104: cmp             w0, w16
    // 0x587108: b.ne            #0x587114
    // 0x58710c: r2 = config
    //     0x58710c: ldr             x2, [PP, #0x2520]  ; [pp+0x2520] Field <GoogleFonts.config>: static late final (offset: 0xbe8)
    // 0x587110: r0 = InitLateFinalStaticField()
    //     0x587110: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x587114: mov             x1, x0
    // 0x587118: r0 = false
    //     0x587118: add             x0, NULL, #0x30  ; false
    // 0x58711c: StoreField: r1->field_7 = r0
    //     0x58711c: stur            w0, [x1, #7]
    // 0x587120: r0 = LoadStaticField(0x468)
    //     0x587120: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x587124: ldr             x0, [x0, #0x8d0]
    // 0x587128: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x58712c: cmp             w0, w16
    // 0x587130: b.ne            #0x58713c
    // 0x587134: r2 = instance
    //     0x587134: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x587138: r0 = InitLateFinalStaticField()
    //     0x587138: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x58713c: r1 = <AppLocale, Translations>
    //     0x58713c: ldr             x1, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x587140: stur            x0, [fp, #-0x10]
    // 0x587144: r0 = TranslationProvider()
    //     0x587144: bl              #0x587ebc  ; AllocateTranslationProviderStub -> TranslationProvider (size=0x18)
    // 0x587148: mov             x1, x0
    // 0x58714c: ldur            x2, [fp, #-0x10]
    // 0x587150: stur            x0, [fp, #-0x10]
    // 0x587154: r0 = BaseTranslationProvider()
    //     0x587154: bl              #0x587ccc  ; [package:slang_flutter/slang_flutter.dart] BaseTranslationProvider::BaseTranslationProvider
    // 0x587158: ldur            x1, [fp, #-0x10]
    // 0x58715c: r0 = runApp()
    //     0x58715c: bl              #0x587170  ; [package:flutter/src/widgets/binding.dart] ::runApp
    // 0x587160: r0 = Null
    //     0x587160: mov             x0, NULL
    // 0x587164: r0 = ReturnAsyncNotFuture()
    //     0x587164: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x587168: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x587168: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x58716c: b               #0x58707c
  }
  static void _addLicenses() {
    // ** addr: 0x587ec8, size: 0x40
    // 0x587ec8: EnterFrame
    //     0x587ec8: stp             fp, lr, [SP, #-0x10]!
    //     0x587ecc: mov             fp, SP
    // 0x587ed0: CheckStackOverflow
    //     0x587ed0: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x587ed4: cmp             SP, x16
    //     0x587ed8: b.ls            #0x587f00
    // 0x587edc: r1 = Function '<anonymous closure>': static.
    //     0x587edc: ldr             x1, [PP, #0x33d0]  ; [pp+0x33d0] AnonymousClosure: static (0x587f08), in [package:ricochlime/main.dart] ::_addLicenses (0x587ec8)
    // 0x587ee0: r2 = Null
    //     0x587ee0: mov             x2, NULL
    // 0x587ee4: r0 = AllocateClosure()
    //     0x587ee4: bl              #0x5838bc  ; AllocateClosureStub
    // 0x587ee8: mov             x1, x0
    // 0x587eec: r0 = addLicense()
    //     0x587eec: bl              #0x40abbc  ; [package:flutter/src/foundation/licenses.dart] LicenseRegistry::addLicense
    // 0x587ef0: r0 = Null
    //     0x587ef0: mov             x0, NULL
    // 0x587ef4: LeaveFrame
    //     0x587ef4: mov             SP, fp
    //     0x587ef8: ldp             fp, lr, [SP], #0x10
    // 0x587efc: ret
    //     0x587efc: ret             
    // 0x587f00: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x587f00: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x587f04: b               #0x587edc
  }
  [closure] static Stream<LicenseEntry> <anonymous closure>(dynamic) {
    // ** addr: 0x587f08, size: 0x4e8
    // 0x587f08: EnterFrame
    //     0x587f08: stp             fp, lr, [SP, #-0x10]!
    //     0x587f0c: mov             fp, SP
    // 0x587f10: AllocStack(0x48)
    //     0x587f10: sub             SP, SP, #0x48
    // 0x587f14: SetupParameters(dynamic _ /* r0 */)
    //     0x587f14: stur            NULL, [fp, #-8]
    //     0x587f18: mov             x1, #0
    //     0x587f1c: add             x0, fp, w1, sxtw #2
    //     0x587f20: ldr             x0, [x0, #0x10]
    //     0x587f24: ldur            w2, [x0, #0x17]
    //     0x587f28: add             x2, x2, HEAP, lsl #32
    //     0x587f2c: stur            x2, [fp, #-0x10]
    // 0x587f30: CheckStackOverflow
    //     0x587f30: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x587f34: cmp             SP, x16
    //     0x587f38: b.ls            #0x5883e8
    // 0x587f3c: r0 = <LicenseEntry>
    //     0x587f3c: ldr             x0, [PP, #0x33d8]  ; [pp+0x33d8] TypeArguments: <LicenseEntry>
    // 0x587f40: r0 = InitAsyncStar()
    //     0x587f40: bl              #0x5887bc  ; InitAsyncStarStub
    // 0x587f44: r0 = Null
    //     0x587f44: mov             x0, NULL
    // 0x587f48: r0 = YieldAsyncStar()
    //     0x587f48: bl              #0x588630  ; YieldAsyncStarStub
    // 0x587f4c: r0 = 0
    //     0x587f4c: mov             x0, #0
    // 0x587f50: add             x1, fp, w0, sxtw #2
    // 0x587f54: LoadField: r1 = r1->field_fffffff8
    //     0x587f54: ldur            x1, [x1, #-8]
    // 0x587f58: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x587f58: ldur            w2, [x1, #0x17]
    // 0x587f5c: DecompressPointer r2
    //     0x587f5c: add             x2, x2, HEAP, lsl #32
    // 0x587f60: stur            x2, [fp, #-0x18]
    // 0x587f64: r0 = LicenseEntryWithLineBreaks()
    //     0x587f64: bl              #0x40b378  ; AllocateLicenseEntryWithLineBreaksStub -> LicenseEntryWithLineBreaks (size=0x10)
    // 0x587f68: r1 = Null
    //     0x587f68: mov             x1, NULL
    // 0x587f6c: r2 = 2
    //     0x587f6c: mov             x2, #2
    // 0x587f70: stur            x0, [fp, #-0x20]
    // 0x587f74: r0 = AllocateArray()
    //     0x587f74: bl              #0x5845d8  ; AllocateArrayStub
    // 0x587f78: stur            x0, [fp, #-0x28]
    // 0x587f7c: r16 = "_gfx"
    //     0x587f7c: ldr             x16, [PP, #0x33e0]  ; [pp+0x33e0] "_gfx"
    // 0x587f80: StoreField: r0->field_f = r16
    //     0x587f80: stur            w16, [x0, #0xf]
    // 0x587f84: r1 = <String>
    //     0x587f84: ldr             x1, [PP, #0xc48]  ; [pp+0xc48] TypeArguments: <String>
    // 0x587f88: r0 = AllocateGrowableArray()
    //     0x587f88: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x587f8c: mov             x1, x0
    // 0x587f90: ldur            x0, [fp, #-0x28]
    // 0x587f94: stur            x1, [fp, #-0x30]
    // 0x587f98: StoreField: r1->field_f = r0
    //     0x587f98: stur            w0, [x1, #0xf]
    // 0x587f9c: r2 = 2
    //     0x587f9c: mov             x2, #2
    // 0x587fa0: StoreField: r1->field_b = r2
    //     0x587fa0: stur            w2, [x1, #0xb]
    // 0x587fa4: r0 = LoadStaticField(0x798)
    //     0x587fa4: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x587fa8: ldr             x0, [x0, #0xf30]
    // 0x587fac: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x587fb0: cmp             w0, w16
    // 0x587fb4: b.ne            #0x587fc0
    // 0x587fb8: r2 = rootBundle
    //     0x587fb8: ldr             x2, [PP, #0x33e8]  ; [pp+0x33e8] Field <::.rootBundle>: static late final (offset: 0x798)
    // 0x587fbc: r0 = InitLateFinalStaticField()
    //     0x587fbc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x587fc0: mov             x1, x0
    // 0x587fc4: r2 = "assets/images/LICENSE.md"
    //     0x587fc4: ldr             x2, [PP, #0x33f0]  ; [pp+0x33f0] "assets/images/LICENSE.md"
    // 0x587fc8: stur            x0, [fp, #-0x28]
    // 0x587fcc: r0 = loadString()
    //     0x587fcc: bl              #0x58841c  ; [package:flutter/src/services/asset_bundle.dart] CachingAssetBundle::loadString
    // 0x587fd0: mov             x1, x0
    // 0x587fd4: stur            x1, [fp, #-0x38]
    // 0x587fd8: r0 = Await()
    //     0x587fd8: bl              #0x255470  ; AwaitStub
    // 0x587fdc: mov             x2, x0
    // 0x587fe0: ldur            x0, [fp, #-0x30]
    // 0x587fe4: ldur            x1, [fp, #-0x20]
    // 0x587fe8: StoreField: r1->field_7 = r0
    //     0x587fe8: stur            w0, [x1, #7]
    //     0x587fec: ldurb           w16, [x1, #-1]
    //     0x587ff0: ldurb           w17, [x0, #-1]
    //     0x587ff4: and             x16, x17, x16, lsr #2
    //     0x587ff8: tst             x16, HEAP, lsr #32
    //     0x587ffc: b.eq            #0x588004
    //     0x588000: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x588004: mov             x0, x2
    // 0x588008: StoreField: r1->field_b = r0
    //     0x588008: stur            w0, [x1, #0xb]
    //     0x58800c: ldurb           w16, [x1, #-1]
    //     0x588010: ldurb           w17, [x0, #-1]
    //     0x588014: and             x16, x17, x16, lsr #2
    //     0x588018: tst             x16, HEAP, lsr #32
    //     0x58801c: b.eq            #0x588024
    //     0x588020: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x588024: ldur            x16, [fp, #-0x18]
    // 0x588028: stp             x1, x16, [SP]
    // 0x58802c: r0 = add()
    //     0x58802c: bl              #0x586a0c  ; [dart:async] _AsyncStarStreamController::add
    // 0x588030: tbz             w0, #4, #0x588048
    // 0x588034: r0 = Null
    //     0x588034: mov             x0, NULL
    // 0x588038: r0 = YieldAsyncStar()
    //     0x588038: bl              #0x588630  ; YieldAsyncStarStub
    // 0x58803c: r16 = true
    //     0x58803c: add             x16, NULL, #0x20  ; true
    // 0x588040: cmp             w0, w16
    // 0x588044: b.ne            #0x588050
    // 0x588048: r0 = Null
    //     0x588048: mov             x0, NULL
    // 0x58804c: r0 = ReturnAsyncStar()
    //     0x58804c: b               #0x5883f0  ; ReturnAsyncStarStub
    // 0x588050: r0 = 0
    //     0x588050: mov             x0, #0
    // 0x588054: add             x1, fp, w0, sxtw #2
    // 0x588058: LoadField: r1 = r1->field_fffffff8
    //     0x588058: ldur            x1, [x1, #-8]
    // 0x58805c: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x58805c: ldur            w2, [x1, #0x17]
    // 0x588060: DecompressPointer r2
    //     0x588060: add             x2, x2, HEAP, lsl #32
    // 0x588064: stur            x2, [fp, #-0x18]
    // 0x588068: r0 = LicenseEntryWithLineBreaks()
    //     0x588068: bl              #0x40b378  ; AllocateLicenseEntryWithLineBreaksStub -> LicenseEntryWithLineBreaks (size=0x10)
    // 0x58806c: r1 = Null
    //     0x58806c: mov             x1, NULL
    // 0x588070: r2 = 2
    //     0x588070: mov             x2, #2
    // 0x588074: stur            x0, [fp, #-0x20]
    // 0x588078: r0 = AllocateArray()
    //     0x588078: bl              #0x5845d8  ; AllocateArrayStub
    // 0x58807c: stur            x0, [fp, #-0x30]
    // 0x588080: r16 = "_ludum_dare_32_track_4"
    //     0x588080: ldr             x16, [PP, #0x33f8]  ; [pp+0x33f8] "_ludum_dare_32_track_4"
    // 0x588084: StoreField: r0->field_f = r16
    //     0x588084: stur            w16, [x0, #0xf]
    // 0x588088: r1 = <String>
    //     0x588088: ldr             x1, [PP, #0xc48]  ; [pp+0xc48] TypeArguments: <String>
    // 0x58808c: r0 = AllocateGrowableArray()
    //     0x58808c: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x588090: mov             x3, x0
    // 0x588094: ldur            x0, [fp, #-0x30]
    // 0x588098: stur            x3, [fp, #-0x38]
    // 0x58809c: StoreField: r3->field_f = r0
    //     0x58809c: stur            w0, [x3, #0xf]
    // 0x5880a0: r0 = 2
    //     0x5880a0: mov             x0, #2
    // 0x5880a4: StoreField: r3->field_b = r0
    //     0x5880a4: stur            w0, [x3, #0xb]
    // 0x5880a8: ldur            x1, [fp, #-0x28]
    // 0x5880ac: r2 = "assets/audio/bgm/LICENSE.txt"
    //     0x5880ac: ldr             x2, [PP, #0x3400]  ; [pp+0x3400] "assets/audio/bgm/LICENSE.txt"
    // 0x5880b0: r0 = loadString()
    //     0x5880b0: bl              #0x58841c  ; [package:flutter/src/services/asset_bundle.dart] CachingAssetBundle::loadString
    // 0x5880b4: mov             x1, x0
    // 0x5880b8: stur            x1, [fp, #-0x30]
    // 0x5880bc: r0 = Await()
    //     0x5880bc: bl              #0x255470  ; AwaitStub
    // 0x5880c0: mov             x2, x0
    // 0x5880c4: ldur            x0, [fp, #-0x38]
    // 0x5880c8: ldur            x1, [fp, #-0x20]
    // 0x5880cc: StoreField: r1->field_7 = r0
    //     0x5880cc: stur            w0, [x1, #7]
    //     0x5880d0: ldurb           w16, [x1, #-1]
    //     0x5880d4: ldurb           w17, [x0, #-1]
    //     0x5880d8: and             x16, x17, x16, lsr #2
    //     0x5880dc: tst             x16, HEAP, lsr #32
    //     0x5880e0: b.eq            #0x5880e8
    //     0x5880e4: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x5880e8: mov             x0, x2
    // 0x5880ec: StoreField: r1->field_b = r0
    //     0x5880ec: stur            w0, [x1, #0xb]
    //     0x5880f0: ldurb           w16, [x1, #-1]
    //     0x5880f4: ldurb           w17, [x0, #-1]
    //     0x5880f8: and             x16, x17, x16, lsr #2
    //     0x5880fc: tst             x16, HEAP, lsr #32
    //     0x588100: b.eq            #0x588108
    //     0x588104: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x588108: ldur            x16, [fp, #-0x18]
    // 0x58810c: stp             x1, x16, [SP]
    // 0x588110: r0 = add()
    //     0x588110: bl              #0x586a0c  ; [dart:async] _AsyncStarStreamController::add
    // 0x588114: tbz             w0, #4, #0x58812c
    // 0x588118: r0 = Null
    //     0x588118: mov             x0, NULL
    // 0x58811c: r0 = YieldAsyncStar()
    //     0x58811c: bl              #0x588630  ; YieldAsyncStarStub
    // 0x588120: r16 = true
    //     0x588120: add             x16, NULL, #0x20  ; true
    // 0x588124: cmp             w0, w16
    // 0x588128: b.ne            #0x588134
    // 0x58812c: r0 = Null
    //     0x58812c: mov             x0, NULL
    // 0x588130: r0 = ReturnAsyncStar()
    //     0x588130: b               #0x5883f0  ; ReturnAsyncStarStub
    // 0x588134: r0 = 0
    //     0x588134: mov             x0, #0
    // 0x588138: add             x1, fp, w0, sxtw #2
    // 0x58813c: LoadField: r1 = r1->field_fffffff8
    //     0x58813c: ldur            x1, [x1, #-8]
    // 0x588140: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x588140: ldur            w2, [x1, #0x17]
    // 0x588144: DecompressPointer r2
    //     0x588144: add             x2, x2, HEAP, lsl #32
    // 0x588148: stur            x2, [fp, #-0x18]
    // 0x58814c: r0 = LicenseEntryWithLineBreaks()
    //     0x58814c: bl              #0x40b378  ; AllocateLicenseEntryWithLineBreaksStub -> LicenseEntryWithLineBreaks (size=0x10)
    // 0x588150: r1 = Null
    //     0x588150: mov             x1, NULL
    // 0x588154: r2 = 2
    //     0x588154: mov             x2, #2
    // 0x588158: stur            x0, [fp, #-0x20]
    // 0x58815c: r0 = AllocateArray()
    //     0x58815c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x588160: stur            x0, [fp, #-0x30]
    // 0x588164: r16 = "_noisyredfox__hitwood.wav"
    //     0x588164: ldr             x16, [PP, #0x3408]  ; [pp+0x3408] "_noisyredfox__hitwood.wav"
    // 0x588168: StoreField: r0->field_f = r16
    //     0x588168: stur            w16, [x0, #0xf]
    // 0x58816c: r1 = <String>
    //     0x58816c: ldr             x1, [PP, #0xc48]  ; [pp+0xc48] TypeArguments: <String>
    // 0x588170: r0 = AllocateGrowableArray()
    //     0x588170: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x588174: mov             x3, x0
    // 0x588178: ldur            x0, [fp, #-0x30]
    // 0x58817c: stur            x3, [fp, #-0x38]
    // 0x588180: StoreField: r3->field_f = r0
    //     0x588180: stur            w0, [x3, #0xf]
    // 0x588184: r0 = 2
    //     0x588184: mov             x0, #2
    // 0x588188: StoreField: r3->field_b = r0
    //     0x588188: stur            w0, [x3, #0xb]
    // 0x58818c: ldur            x1, [fp, #-0x28]
    // 0x588190: r2 = "assets/audio/sfx/LICENSE"
    //     0x588190: ldr             x2, [PP, #0x3410]  ; [pp+0x3410] "assets/audio/sfx/LICENSE"
    // 0x588194: r0 = loadString()
    //     0x588194: bl              #0x58841c  ; [package:flutter/src/services/asset_bundle.dart] CachingAssetBundle::loadString
    // 0x588198: mov             x1, x0
    // 0x58819c: stur            x1, [fp, #-0x30]
    // 0x5881a0: r0 = Await()
    //     0x5881a0: bl              #0x255470  ; AwaitStub
    // 0x5881a4: mov             x2, x0
    // 0x5881a8: ldur            x0, [fp, #-0x38]
    // 0x5881ac: ldur            x1, [fp, #-0x20]
    // 0x5881b0: StoreField: r1->field_7 = r0
    //     0x5881b0: stur            w0, [x1, #7]
    //     0x5881b4: ldurb           w16, [x1, #-1]
    //     0x5881b8: ldurb           w17, [x0, #-1]
    //     0x5881bc: and             x16, x17, x16, lsr #2
    //     0x5881c0: tst             x16, HEAP, lsr #32
    //     0x5881c4: b.eq            #0x5881cc
    //     0x5881c8: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x5881cc: mov             x0, x2
    // 0x5881d0: StoreField: r1->field_b = r0
    //     0x5881d0: stur            w0, [x1, #0xb]
    //     0x5881d4: ldurb           w16, [x1, #-1]
    //     0x5881d8: ldurb           w17, [x0, #-1]
    //     0x5881dc: and             x16, x17, x16, lsr #2
    //     0x5881e0: tst             x16, HEAP, lsr #32
    //     0x5881e4: b.eq            #0x5881ec
    //     0x5881e8: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x5881ec: ldur            x16, [fp, #-0x18]
    // 0x5881f0: stp             x1, x16, [SP]
    // 0x5881f4: r0 = add()
    //     0x5881f4: bl              #0x586a0c  ; [dart:async] _AsyncStarStreamController::add
    // 0x5881f8: tbz             w0, #4, #0x588210
    // 0x5881fc: r0 = Null
    //     0x5881fc: mov             x0, NULL
    // 0x588200: r0 = YieldAsyncStar()
    //     0x588200: bl              #0x588630  ; YieldAsyncStarStub
    // 0x588204: r16 = true
    //     0x588204: add             x16, NULL, #0x20  ; true
    // 0x588208: cmp             w0, w16
    // 0x58820c: b.ne            #0x588218
    // 0x588210: r0 = Null
    //     0x588210: mov             x0, NULL
    // 0x588214: r0 = ReturnAsyncStar()
    //     0x588214: b               #0x5883f0  ; ReturnAsyncStarStub
    // 0x588218: r0 = 0
    //     0x588218: mov             x0, #0
    // 0x58821c: add             x1, fp, w0, sxtw #2
    // 0x588220: LoadField: r1 = r1->field_fffffff8
    //     0x588220: ldur            x1, [x1, #-8]
    // 0x588224: ArrayLoad: r2 = r1[0]  ; List_4
    //     0x588224: ldur            w2, [x1, #0x17]
    // 0x588228: DecompressPointer r2
    //     0x588228: add             x2, x2, HEAP, lsl #32
    // 0x58822c: stur            x2, [fp, #-0x18]
    // 0x588230: r0 = LicenseEntryWithLineBreaks()
    //     0x588230: bl              #0x40b378  ; AllocateLicenseEntryWithLineBreaksStub -> LicenseEntryWithLineBreaks (size=0x10)
    // 0x588234: r1 = Null
    //     0x588234: mov             x1, NULL
    // 0x588238: r2 = 2
    //     0x588238: mov             x2, #2
    // 0x58823c: stur            x0, [fp, #-0x20]
    // 0x588240: r0 = AllocateArray()
    //     0x588240: bl              #0x5845d8  ; AllocateArrayStub
    // 0x588244: stur            x0, [fp, #-0x30]
    // 0x588248: r16 = "google_fonts"
    //     0x588248: ldr             x16, [PP, #0x3418]  ; [pp+0x3418] "google_fonts"
    // 0x58824c: StoreField: r0->field_f = r16
    //     0x58824c: stur            w16, [x0, #0xf]
    // 0x588250: r1 = <String>
    //     0x588250: ldr             x1, [PP, #0xc48]  ; [pp+0xc48] TypeArguments: <String>
    // 0x588254: r0 = AllocateGrowableArray()
    //     0x588254: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x588258: mov             x3, x0
    // 0x58825c: ldur            x0, [fp, #-0x30]
    // 0x588260: stur            x3, [fp, #-0x38]
    // 0x588264: StoreField: r3->field_f = r0
    //     0x588264: stur            w0, [x3, #0xf]
    // 0x588268: r0 = 2
    //     0x588268: mov             x0, #2
    // 0x58826c: StoreField: r3->field_b = r0
    //     0x58826c: stur            w0, [x3, #0xb]
    // 0x588270: ldur            x1, [fp, #-0x28]
    // 0x588274: r2 = "assets/google_fonts/Atkinson_Hyperlegible/OFL.txt"
    //     0x588274: ldr             x2, [PP, #0x3420]  ; [pp+0x3420] "assets/google_fonts/Atkinson_Hyperlegible/OFL.txt"
    // 0x588278: r0 = loadString()
    //     0x588278: bl              #0x58841c  ; [package:flutter/src/services/asset_bundle.dart] CachingAssetBundle::loadString
    // 0x58827c: mov             x1, x0
    // 0x588280: stur            x1, [fp, #-0x30]
    // 0x588284: r0 = Await()
    //     0x588284: bl              #0x255470  ; AwaitStub
    // 0x588288: mov             x2, x0
    // 0x58828c: ldur            x0, [fp, #-0x38]
    // 0x588290: ldur            x1, [fp, #-0x20]
    // 0x588294: StoreField: r1->field_7 = r0
    //     0x588294: stur            w0, [x1, #7]
    //     0x588298: ldurb           w16, [x1, #-1]
    //     0x58829c: ldurb           w17, [x0, #-1]
    //     0x5882a0: and             x16, x17, x16, lsr #2
    //     0x5882a4: tst             x16, HEAP, lsr #32
    //     0x5882a8: b.eq            #0x5882b0
    //     0x5882ac: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x5882b0: mov             x0, x2
    // 0x5882b4: StoreField: r1->field_b = r0
    //     0x5882b4: stur            w0, [x1, #0xb]
    //     0x5882b8: ldurb           w16, [x1, #-1]
    //     0x5882bc: ldurb           w17, [x0, #-1]
    //     0x5882c0: and             x16, x17, x16, lsr #2
    //     0x5882c4: tst             x16, HEAP, lsr #32
    //     0x5882c8: b.eq            #0x5882d0
    //     0x5882cc: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x5882d0: ldur            x16, [fp, #-0x18]
    // 0x5882d4: stp             x1, x16, [SP]
    // 0x5882d8: r0 = add()
    //     0x5882d8: bl              #0x586a0c  ; [dart:async] _AsyncStarStreamController::add
    // 0x5882dc: tbz             w0, #4, #0x5882f4
    // 0x5882e0: r0 = Null
    //     0x5882e0: mov             x0, NULL
    // 0x5882e4: r0 = YieldAsyncStar()
    //     0x5882e4: bl              #0x588630  ; YieldAsyncStarStub
    // 0x5882e8: r16 = true
    //     0x5882e8: add             x16, NULL, #0x20  ; true
    // 0x5882ec: cmp             w0, w16
    // 0x5882f0: b.ne            #0x5882fc
    // 0x5882f4: r0 = Null
    //     0x5882f4: mov             x0, NULL
    // 0x5882f8: r0 = ReturnAsyncStar()
    //     0x5882f8: b               #0x5883f0  ; ReturnAsyncStarStub
    // 0x5882fc: r0 = 0
    //     0x5882fc: mov             x0, #0
    // 0x588300: add             x1, fp, w0, sxtw #2
    // 0x588304: LoadField: r1 = r1->field_fffffff8
    //     0x588304: ldur            x1, [x1, #-8]
    // 0x588308: ArrayLoad: r0 = r1[0]  ; List_4
    //     0x588308: ldur            w0, [x1, #0x17]
    // 0x58830c: DecompressPointer r0
    //     0x58830c: add             x0, x0, HEAP, lsl #32
    // 0x588310: stur            x0, [fp, #-0x18]
    // 0x588314: r0 = LicenseEntryWithLineBreaks()
    //     0x588314: bl              #0x40b378  ; AllocateLicenseEntryWithLineBreaksStub -> LicenseEntryWithLineBreaks (size=0x10)
    // 0x588318: r1 = Null
    //     0x588318: mov             x1, NULL
    // 0x58831c: r2 = 2
    //     0x58831c: mov             x2, #2
    // 0x588320: stur            x0, [fp, #-0x20]
    // 0x588324: r0 = AllocateArray()
    //     0x588324: bl              #0x5845d8  ; AllocateArrayStub
    // 0x588328: stur            x0, [fp, #-0x30]
    // 0x58832c: r16 = "google_fonts"
    //     0x58832c: ldr             x16, [PP, #0x3418]  ; [pp+0x3418] "google_fonts"
    // 0x588330: StoreField: r0->field_f = r16
    //     0x588330: stur            w16, [x0, #0xf]
    // 0x588334: r1 = <String>
    //     0x588334: ldr             x1, [PP, #0xc48]  ; [pp+0xc48] TypeArguments: <String>
    // 0x588338: r0 = AllocateGrowableArray()
    //     0x588338: bl              #0x5834a8  ; AllocateGrowableArrayStub
    // 0x58833c: mov             x3, x0
    // 0x588340: ldur            x0, [fp, #-0x30]
    // 0x588344: stur            x3, [fp, #-0x38]
    // 0x588348: StoreField: r3->field_f = r0
    //     0x588348: stur            w0, [x3, #0xf]
    // 0x58834c: r0 = 2
    //     0x58834c: mov             x0, #2
    // 0x588350: StoreField: r3->field_b = r0
    //     0x588350: stur            w0, [x3, #0xb]
    // 0x588354: ldur            x1, [fp, #-0x28]
    // 0x588358: r2 = "assets/google_fonts/Silkscreen/OFL.txt"
    //     0x588358: ldr             x2, [PP, #0x3428]  ; [pp+0x3428] "assets/google_fonts/Silkscreen/OFL.txt"
    // 0x58835c: r0 = loadString()
    //     0x58835c: bl              #0x58841c  ; [package:flutter/src/services/asset_bundle.dart] CachingAssetBundle::loadString
    // 0x588360: mov             x1, x0
    // 0x588364: stur            x1, [fp, #-0x28]
    // 0x588368: r0 = Await()
    //     0x588368: bl              #0x255470  ; AwaitStub
    // 0x58836c: mov             x2, x0
    // 0x588370: ldur            x0, [fp, #-0x38]
    // 0x588374: ldur            x1, [fp, #-0x20]
    // 0x588378: StoreField: r1->field_7 = r0
    //     0x588378: stur            w0, [x1, #7]
    //     0x58837c: ldurb           w16, [x1, #-1]
    //     0x588380: ldurb           w17, [x0, #-1]
    //     0x588384: and             x16, x17, x16, lsr #2
    //     0x588388: tst             x16, HEAP, lsr #32
    //     0x58838c: b.eq            #0x588394
    //     0x588390: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x588394: mov             x0, x2
    // 0x588398: StoreField: r1->field_b = r0
    //     0x588398: stur            w0, [x1, #0xb]
    //     0x58839c: ldurb           w16, [x1, #-1]
    //     0x5883a0: ldurb           w17, [x0, #-1]
    //     0x5883a4: and             x16, x17, x16, lsr #2
    //     0x5883a8: tst             x16, HEAP, lsr #32
    //     0x5883ac: b.eq            #0x5883b4
    //     0x5883b0: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x5883b4: ldur            x16, [fp, #-0x18]
    // 0x5883b8: stp             x1, x16, [SP]
    // 0x5883bc: r0 = add()
    //     0x5883bc: bl              #0x586a0c  ; [dart:async] _AsyncStarStreamController::add
    // 0x5883c0: tbz             w0, #4, #0x5883d8
    // 0x5883c4: r0 = Null
    //     0x5883c4: mov             x0, NULL
    // 0x5883c8: r0 = YieldAsyncStar()
    //     0x5883c8: bl              #0x588630  ; YieldAsyncStarStub
    // 0x5883cc: r16 = true
    //     0x5883cc: add             x16, NULL, #0x20  ; true
    // 0x5883d0: cmp             w0, w16
    // 0x5883d4: b.ne            #0x5883e0
    // 0x5883d8: r0 = Null
    //     0x5883d8: mov             x0, NULL
    // 0x5883dc: r0 = ReturnAsyncStar()
    //     0x5883dc: b               #0x5883f0  ; ReturnAsyncStarStub
    // 0x5883e0: r0 = Null
    //     0x5883e0: mov             x0, NULL
    // 0x5883e4: r0 = ReturnAsyncStar()
    //     0x5883e4: b               #0x5883f0  ; ReturnAsyncStarStub
    // 0x5883e8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5883e8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5883ec: b               #0x587f3c
  }
  [closure] static void <anonymous closure>(dynamic, LogRecord) {
    // ** addr: 0x588934, size: 0x9c
    // 0x588934: EnterFrame
    //     0x588934: stp             fp, lr, [SP, #-0x10]!
    //     0x588938: mov             fp, SP
    // 0x58893c: AllocStack(0x10)
    //     0x58893c: sub             SP, SP, #0x10
    // 0x588940: CheckStackOverflow
    //     0x588940: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x588944: cmp             SP, x16
    //     0x588948: b.ls            #0x5889c8
    // 0x58894c: ldr             x0, [fp, #0x10]
    // 0x588950: LoadField: r1 = r0->field_7
    //     0x588950: ldur            w1, [x0, #7]
    // 0x588954: DecompressPointer r1
    //     0x588954: add             x1, x1, HEAP, lsl #32
    // 0x588958: LoadField: r3 = r1->field_7
    //     0x588958: ldur            w3, [x1, #7]
    // 0x58895c: DecompressPointer r3
    //     0x58895c: add             x3, x3, HEAP, lsl #32
    // 0x588960: stur            x3, [fp, #-8]
    // 0x588964: r1 = Null
    //     0x588964: mov             x1, NULL
    // 0x588968: r2 = 10
    //     0x588968: mov             x2, #0xa
    // 0x58896c: r0 = AllocateArray()
    //     0x58896c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x588970: mov             x1, x0
    // 0x588974: ldur            x0, [fp, #-8]
    // 0x588978: StoreField: r1->field_f = r0
    //     0x588978: stur            w0, [x1, #0xf]
    // 0x58897c: r16 = ": "
    //     0x58897c: ldr             x16, [PP, #0x2538]  ; [pp+0x2538] ": "
    // 0x588980: StoreField: r1->field_13 = r16
    //     0x588980: stur            w16, [x1, #0x13]
    // 0x588984: ldr             x0, [fp, #0x10]
    // 0x588988: LoadField: r2 = r0->field_f
    //     0x588988: ldur            w2, [x0, #0xf]
    // 0x58898c: DecompressPointer r2
    //     0x58898c: add             x2, x2, HEAP, lsl #32
    // 0x588990: ArrayStore: r1[0] = r2  ; List_4
    //     0x588990: stur            w2, [x1, #0x17]
    // 0x588994: r16 = ": "
    //     0x588994: ldr             x16, [PP, #0x2538]  ; [pp+0x2538] ": "
    // 0x588998: StoreField: r1->field_1b = r16
    //     0x588998: stur            w16, [x1, #0x1b]
    // 0x58899c: LoadField: r2 = r0->field_b
    //     0x58899c: ldur            w2, [x0, #0xb]
    // 0x5889a0: DecompressPointer r2
    //     0x5889a0: add             x2, x2, HEAP, lsl #32
    // 0x5889a4: StoreField: r1->field_1f = r2
    //     0x5889a4: stur            w2, [x1, #0x1f]
    // 0x5889a8: str             x1, [SP]
    // 0x5889ac: r0 = _interpolate()
    //     0x5889ac: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x5889b0: mov             x1, x0
    // 0x5889b4: r0 = print()
    //     0x5889b4: bl              #0x266e1c  ; [dart:core] ::print
    // 0x5889b8: r0 = Null
    //     0x5889b8: mov             x0, NULL
    // 0x5889bc: LeaveFrame
    //     0x5889bc: mov             SP, fp
    //     0x5889c0: ldp             fp, lr, [SP], #0x10
    // 0x5889c4: ret
    //     0x5889c4: ret             
    // 0x5889c8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5889c8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5889cc: b               #0x58894c
  }
  [closure] static Future<void> main(dynamic) {
    // ** addr: 0x5889d0, size: 0x2c
    // 0x5889d0: EnterFrame
    //     0x5889d0: stp             fp, lr, [SP, #-0x10]!
    //     0x5889d4: mov             fp, SP
    // 0x5889d8: CheckStackOverflow
    //     0x5889d8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x5889dc: cmp             SP, x16
    //     0x5889e0: b.ls            #0x5889f4
    // 0x5889e4: r0 = main()
    //     0x5889e4: bl              #0x587060  ; [package:ricochlime/main.dart] ::main
    // 0x5889e8: LeaveFrame
    //     0x5889e8: mov             SP, fp
    //     0x5889ec: ldp             fp, lr, [SP], #0x10
    // 0x5889f0: ret
    //     0x5889f0: ret             
    // 0x5889f4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x5889f4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x5889f8: b               #0x5889e4
  }
}

// class id: 2555, size: 0x14, field offset: 0x14
class _MyAppState extends State<dynamic> {

  _ build(/* No info */) {
    // ** addr: 0x395a9c, size: 0x2dc
    // 0x395a9c: EnterFrame
    //     0x395a9c: stp             fp, lr, [SP, #-0x10]!
    //     0x395aa0: mov             fp, SP
    // 0x395aa4: AllocStack(0x58)
    //     0x395aa4: sub             SP, SP, #0x58
    // 0x395aa8: SetupParameters(_MyAppState this /* r1 => r0 */, dynamic _ /* r2 => r1, fp-0x8 */)
    //     0x395aa8: mov             x0, x1
    //     0x395aac: mov             x1, x2
    //     0x395ab0: stur            x2, [fp, #-8]
    // 0x395ab4: CheckStackOverflow
    //     0x395ab4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x395ab8: cmp             SP, x16
    //     0x395abc: b.ls            #0x395d70
    // 0x395ac0: r0 = t()
    //     0x395ac0: bl              #0x370d20  ; [package:ricochlime/i18n/strings.g.dart] ::t
    // 0x395ac4: r1 = LoadClassIdInstr(r0)
    //     0x395ac4: ldur            x1, [x0, #-1]
    //     0x395ac8: ubfx            x1, x1, #0xc, #0x14
    // 0x395acc: cmp             x1, #0x8dd
    // 0x395ad0: b.ne            #0x395ae0
    // 0x395ad4: r0 = "Ricochlime"
    //     0x395ad4: add             x0, PP, #9, lsl #12  ; [pp+0x9110] "Ricochlime"
    //     0x395ad8: ldr             x0, [x0, #0x110]
    // 0x395adc: b               #0x395b10
    // 0x395ae0: cmp             x1, #0x8df
    // 0x395ae4: b.ne            #0x395af4
    // 0x395ae8: r0 = "Рикошлим"
    //     0x395ae8: add             x0, PP, #9, lsl #12  ; [pp+0x9118] "Рикошлим"
    //     0x395aec: ldr             x0, [x0, #0x118]
    // 0x395af0: b               #0x395b10
    // 0x395af4: cmp             x1, #0x8e0
    // 0x395af8: b.ne            #0x395b08
    // 0x395afc: r0 = "Рикошырыш"
    //     0x395afc: add             x0, PP, #9, lsl #12  ; [pp+0x9120] "Рикошырыш"
    //     0x395b00: ldr             x0, [x0, #0x120]
    // 0x395b04: b               #0x395b10
    // 0x395b08: r0 = "Ricochlime"
    //     0x395b08: add             x0, PP, #9, lsl #12  ; [pp+0x9110] "Ricochlime"
    //     0x395b0c: ldr             x0, [x0, #0x110]
    // 0x395b10: ldur            x1, [fp, #-8]
    // 0x395b14: stur            x0, [fp, #-0x10]
    // 0x395b18: r0 = of()
    //     0x395b18: bl              #0x3b99ac  ; [package:ricochlime/i18n/strings.g.dart] TranslationProvider::of
    // 0x395b1c: mov             x1, x0
    // 0x395b20: r0 = flutterLocale()
    //     0x395b20: bl              #0x3b991c  ; [package:slang_flutter/slang_flutter.dart] InheritedLocaleData::flutterLocale
    // 0x395b24: stur            x0, [fp, #-8]
    // 0x395b28: r0 = supportedLocales()
    //     0x395b28: bl              #0x3b975c  ; [package:ricochlime/i18n/strings.g.dart] AppLocaleUtils::supportedLocales
    // 0x395b2c: stur            x0, [fp, #-0x18]
    // 0x395b30: r16 = Instance_Color
    //     0x395b30: add             x16, PP, #9, lsl #12  ; [pp+0x9128] Obj!Color@5cfb51
    //     0x395b34: ldr             x16, [x16, #0x128]
    // 0x395b38: r30 = Instance_Color
    //     0x395b38: add             lr, PP, #9, lsl #12  ; [pp+0x9130] Obj!Color@5cf7f1
    //     0x395b3c: ldr             lr, [lr, #0x130]
    // 0x395b40: stp             lr, x16, [SP]
    // 0x395b44: r1 = Null
    //     0x395b44: mov             x1, NULL
    // 0x395b48: r2 = Instance_Color
    //     0x395b48: add             x2, PP, #9, lsl #12  ; [pp+0x9128] Obj!Color@5cfb51
    //     0x395b4c: ldr             x2, [x2, #0x128]
    // 0x395b50: r4 = const [0, 0x4, 0x2, 0x2, primary, 0x2, secondary, 0x3, null]
    //     0x395b50: add             x4, PP, #9, lsl #12  ; [pp+0x9138] List(9) [0, 0x4, 0x2, 0x2, "primary", 0x2, "secondary", 0x3, Null]
    //     0x395b54: ldr             x4, [x4, #0x138]
    // 0x395b58: r0 = ColorScheme.fromSeed()
    //     0x395b58: bl              #0x320dc4  ; [package:flutter/src/material/color_scheme.dart] ColorScheme::ColorScheme.fromSeed
    // 0x395b5c: mov             x2, x0
    // 0x395b60: r1 = Instance_Brightness
    //     0x395b60: ldr             x1, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x395b64: r0 = nesThemeFrom()
    //     0x395b64: bl              #0x396af4  ; [package:ricochlime/nes/nes_theme.dart] ::nesThemeFrom
    // 0x395b68: r1 = Instance_Color
    //     0x395b68: add             x1, PP, #9, lsl #12  ; [pp+0x9128] Obj!Color@5cfb51
    //     0x395b6c: ldr             x1, [x1, #0x128]
    // 0x395b70: stur            x0, [fp, #-0x20]
    // 0x395b74: r0 = ColorExtension.brighten()
    //     0x395b74: bl              #0x396a5c  ; [package:flame/src/extensions/color.dart] ::ColorExtension.brighten
    // 0x395b78: r1 = Instance_Color
    //     0x395b78: add             x1, PP, #9, lsl #12  ; [pp+0x9130] Obj!Color@5cf7f1
    //     0x395b7c: ldr             x1, [x1, #0x130]
    // 0x395b80: stur            x0, [fp, #-0x28]
    // 0x395b84: r0 = ColorExtension.brighten()
    //     0x395b84: bl              #0x396a5c  ; [package:flame/src/extensions/color.dart] ::ColorExtension.brighten
    // 0x395b88: ldur            x16, [fp, #-0x28]
    // 0x395b8c: stp             x0, x16, [SP, #8]
    // 0x395b90: r16 = Instance_Brightness
    //     0x395b90: ldr             x16, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x395b94: str             x16, [SP]
    // 0x395b98: r1 = Null
    //     0x395b98: mov             x1, NULL
    // 0x395b9c: r2 = Instance_Color
    //     0x395b9c: add             x2, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x395ba0: ldr             x2, [x2, #0x140]
    // 0x395ba4: r4 = const [0, 0x5, 0x3, 0x2, brightness, 0x4, primary, 0x2, secondary, 0x3, null]
    //     0x395ba4: add             x4, PP, #9, lsl #12  ; [pp+0x9148] List(11) [0, 0x5, 0x3, 0x2, "brightness", 0x4, "primary", 0x2, "secondary", 0x3, Null]
    //     0x395ba8: ldr             x4, [x4, #0x148]
    // 0x395bac: r0 = ColorScheme.fromSeed()
    //     0x395bac: bl              #0x320dc4  ; [package:flutter/src/material/color_scheme.dart] ColorScheme::ColorScheme.fromSeed
    // 0x395bb0: mov             x2, x0
    // 0x395bb4: r1 = Instance_Brightness
    //     0x395bb4: ldr             x1, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x395bb8: r0 = nesThemeFrom()
    //     0x395bb8: bl              #0x396af4  ; [package:ricochlime/nes/nes_theme.dart] ::nesThemeFrom
    // 0x395bbc: r1 = Instance_Color
    //     0x395bbc: add             x1, PP, #9, lsl #12  ; [pp+0x9128] Obj!Color@5cfb51
    //     0x395bc0: ldr             x1, [x1, #0x128]
    // 0x395bc4: stur            x0, [fp, #-0x28]
    // 0x395bc8: r0 = ColorExtension.darken()
    //     0x395bc8: bl              #0x395d84  ; [package:flame/src/extensions/color.dart] ::ColorExtension.darken
    // 0x395bcc: r1 = Instance_Color
    //     0x395bcc: add             x1, PP, #9, lsl #12  ; [pp+0x9130] Obj!Color@5cf7f1
    //     0x395bd0: ldr             x1, [x1, #0x130]
    // 0x395bd4: stur            x0, [fp, #-0x30]
    // 0x395bd8: r0 = ColorExtension.darken()
    //     0x395bd8: bl              #0x395d84  ; [package:flame/src/extensions/color.dart] ::ColorExtension.darken
    // 0x395bdc: stur            x0, [fp, #-0x38]
    // 0x395be0: r0 = ColorScheme()
    //     0x395be0: bl              #0x31d438  ; AllocateColorSchemeStub -> ColorScheme (size=0xd0)
    // 0x395be4: r1 = Instance_Brightness
    //     0x395be4: ldr             x1, [PP, #0xea0]  ; [pp+0xea0] Obj!Brightness@5dbe11
    // 0x395be8: StoreField: r0->field_7 = r1
    //     0x395be8: stur            w1, [x0, #7]
    // 0x395bec: ldur            x2, [fp, #-0x30]
    // 0x395bf0: StoreField: r0->field_b = r2
    //     0x395bf0: stur            w2, [x0, #0xb]
    // 0x395bf4: r3 = Instance_Color
    //     0x395bf4: add             x3, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x395bf8: ldr             x3, [x3, #0x710]
    // 0x395bfc: StoreField: r0->field_f = r3
    //     0x395bfc: stur            w3, [x0, #0xf]
    // 0x395c00: ldur            x2, [fp, #-0x38]
    // 0x395c04: StoreField: r0->field_2b = r2
    //     0x395c04: stur            w2, [x0, #0x2b]
    // 0x395c08: r4 = Instance_Color
    //     0x395c08: add             x4, PP, #8, lsl #12  ; [pp+0x8d00] Obj!Color@5ce6e1
    //     0x395c0c: ldr             x4, [x4, #0xd00]
    // 0x395c10: StoreField: r0->field_2f = r4
    //     0x395c10: stur            w4, [x0, #0x2f]
    // 0x395c14: r2 = Instance_Color
    //     0x395c14: add             x2, PP, #9, lsl #12  ; [pp+0x9150] Obj!Color@5cfb21
    //     0x395c18: ldr             x2, [x2, #0x150]
    // 0x395c1c: StoreField: r0->field_6b = r2
    //     0x395c1c: stur            w2, [x0, #0x6b]
    // 0x395c20: StoreField: r0->field_6f = r3
    //     0x395c20: stur            w3, [x0, #0x6f]
    // 0x395c24: StoreField: r0->field_7b = r3
    //     0x395c24: stur            w3, [x0, #0x7b]
    // 0x395c28: StoreField: r0->field_7f = r4
    //     0x395c28: stur            w4, [x0, #0x7f]
    // 0x395c2c: StoreField: r0->field_c7 = r3
    //     0x395c2c: stur            w3, [x0, #0xc7]
    // 0x395c30: StoreField: r0->field_cb = r4
    //     0x395c30: stur            w4, [x0, #0xcb]
    // 0x395c34: mov             x2, x0
    // 0x395c38: r0 = nesThemeFrom()
    //     0x395c38: bl              #0x396af4  ; [package:ricochlime/nes/nes_theme.dart] ::nesThemeFrom
    // 0x395c3c: r1 = Instance_Color
    //     0x395c3c: add             x1, PP, #9, lsl #12  ; [pp+0x9140] Obj!Color@5cf7c1
    //     0x395c40: ldr             x1, [x1, #0x140]
    // 0x395c44: stur            x0, [fp, #-0x30]
    // 0x395c48: r0 = ColorExtension.darken()
    //     0x395c48: bl              #0x395d84  ; [package:flame/src/extensions/color.dart] ::ColorExtension.darken
    // 0x395c4c: r1 = Instance_Color
    //     0x395c4c: add             x1, PP, #9, lsl #12  ; [pp+0x9130] Obj!Color@5cf7f1
    //     0x395c50: ldr             x1, [x1, #0x130]
    // 0x395c54: stur            x0, [fp, #-0x38]
    // 0x395c58: r0 = ColorExtension.darken()
    //     0x395c58: bl              #0x395d84  ; [package:flame/src/extensions/color.dart] ::ColorExtension.darken
    // 0x395c5c: stur            x0, [fp, #-0x40]
    // 0x395c60: r0 = ColorScheme()
    //     0x395c60: bl              #0x31d438  ; AllocateColorSchemeStub -> ColorScheme (size=0xd0)
    // 0x395c64: r1 = Instance_Brightness
    //     0x395c64: ldr             x1, [PP, #0xe90]  ; [pp+0xe90] Obj!Brightness@5dbe31
    // 0x395c68: StoreField: r0->field_7 = r1
    //     0x395c68: stur            w1, [x0, #7]
    // 0x395c6c: ldur            x2, [fp, #-0x38]
    // 0x395c70: StoreField: r0->field_b = r2
    //     0x395c70: stur            w2, [x0, #0xb]
    // 0x395c74: r2 = Instance_Color
    //     0x395c74: add             x2, PP, #8, lsl #12  ; [pp+0x8d00] Obj!Color@5ce6e1
    //     0x395c78: ldr             x2, [x2, #0xd00]
    // 0x395c7c: StoreField: r0->field_f = r2
    //     0x395c7c: stur            w2, [x0, #0xf]
    // 0x395c80: ldur            x3, [fp, #-0x40]
    // 0x395c84: StoreField: r0->field_2b = r3
    //     0x395c84: stur            w3, [x0, #0x2b]
    // 0x395c88: StoreField: r0->field_2f = r2
    //     0x395c88: stur            w2, [x0, #0x2f]
    // 0x395c8c: r3 = Instance_Color
    //     0x395c8c: add             x3, PP, #9, lsl #12  ; [pp+0x9158] Obj!Color@5cfaf1
    //     0x395c90: ldr             x3, [x3, #0x158]
    // 0x395c94: StoreField: r0->field_6b = r3
    //     0x395c94: stur            w3, [x0, #0x6b]
    // 0x395c98: StoreField: r0->field_6f = r2
    //     0x395c98: stur            w2, [x0, #0x6f]
    // 0x395c9c: r2 = Instance_Color
    //     0x395c9c: add             x2, PP, #9, lsl #12  ; [pp+0x9160] Obj!Color@5cfac1
    //     0x395ca0: ldr             x2, [x2, #0x160]
    // 0x395ca4: StoreField: r0->field_7b = r2
    //     0x395ca4: stur            w2, [x0, #0x7b]
    // 0x395ca8: r3 = Instance_Color
    //     0x395ca8: add             x3, PP, #8, lsl #12  ; [pp+0x8710] Obj!Color@5cd5a1
    //     0x395cac: ldr             x3, [x3, #0x710]
    // 0x395cb0: StoreField: r0->field_7f = r3
    //     0x395cb0: stur            w3, [x0, #0x7f]
    // 0x395cb4: StoreField: r0->field_c7 = r2
    //     0x395cb4: stur            w2, [x0, #0xc7]
    // 0x395cb8: StoreField: r0->field_cb = r3
    //     0x395cb8: stur            w3, [x0, #0xcb]
    // 0x395cbc: mov             x2, x0
    // 0x395cc0: r0 = nesThemeFrom()
    //     0x395cc0: bl              #0x396af4  ; [package:ricochlime/nes/nes_theme.dart] ::nesThemeFrom
    // 0x395cc4: stur            x0, [fp, #-0x38]
    // 0x395cc8: r0 = MaterialApp()
    //     0x395cc8: bl              #0x395d78  ; AllocateMaterialAppStub -> MaterialApp (size=0x9c)
    // 0x395ccc: r1 = Instance_LoadingPage
    //     0x395ccc: add             x1, PP, #9, lsl #12  ; [pp+0x9168] Obj!LoadingPage@5d8271
    //     0x395cd0: ldr             x1, [x1, #0x168]
    // 0x395cd4: StoreField: r0->field_13 = r1
    //     0x395cd4: stur            w1, [x0, #0x13]
    // 0x395cd8: r1 = _ConstMap len:0
    //     0x395cd8: add             x1, PP, #9, lsl #12  ; [pp+0x9170] Map<String, (dynamic this, BuildContext) => Widget>(0)
    //     0x395cdc: ldr             x1, [x1, #0x170]
    // 0x395ce0: ArrayStore: r0[0] = r1  ; List_4
    //     0x395ce0: stur            w1, [x0, #0x17]
    // 0x395ce4: r1 = const []
    //     0x395ce4: add             x1, PP, #9, lsl #12  ; [pp+0x9178] List<NavigatorObserver>(0)
    //     0x395ce8: ldr             x1, [x1, #0x178]
    // 0x395cec: StoreField: r0->field_2f = r1
    //     0x395cec: stur            w1, [x0, #0x2f]
    // 0x395cf0: ldur            x1, [fp, #-0x10]
    // 0x395cf4: StoreField: r0->field_3f = r1
    //     0x395cf4: stur            w1, [x0, #0x3f]
    // 0x395cf8: ldur            x1, [fp, #-0x20]
    // 0x395cfc: StoreField: r0->field_47 = r1
    //     0x395cfc: stur            w1, [x0, #0x47]
    // 0x395d00: ldur            x1, [fp, #-0x28]
    // 0x395d04: StoreField: r0->field_4b = r1
    //     0x395d04: stur            w1, [x0, #0x4b]
    // 0x395d08: ldur            x1, [fp, #-0x30]
    // 0x395d0c: StoreField: r0->field_4f = r1
    //     0x395d0c: stur            w1, [x0, #0x4f]
    // 0x395d10: ldur            x1, [fp, #-0x38]
    // 0x395d14: StoreField: r0->field_53 = r1
    //     0x395d14: stur            w1, [x0, #0x53]
    // 0x395d18: r1 = Instance_ThemeMode
    //     0x395d18: add             x1, PP, #9, lsl #12  ; [pp+0x9180] Obj!ThemeMode@5db751
    //     0x395d1c: ldr             x1, [x1, #0x180]
    // 0x395d20: StoreField: r0->field_57 = r1
    //     0x395d20: stur            w1, [x0, #0x57]
    // 0x395d24: r1 = Instance_Duration
    //     0x395d24: add             x1, PP, #9, lsl #12  ; [pp+0x9188] Obj!Duration@5dcd01
    //     0x395d28: ldr             x1, [x1, #0x188]
    // 0x395d2c: StoreField: r0->field_5b = r1
    //     0x395d2c: stur            w1, [x0, #0x5b]
    // 0x395d30: r1 = Instance__Linear
    //     0x395d30: ldr             x1, [PP, #0x7870]  ; [pp+0x7870] Obj!_Linear@5cce21
    // 0x395d34: StoreField: r0->field_5f = r1
    //     0x395d34: stur            w1, [x0, #0x5f]
    // 0x395d38: ldur            x1, [fp, #-8]
    // 0x395d3c: StoreField: r0->field_67 = r1
    //     0x395d3c: stur            w1, [x0, #0x67]
    // 0x395d40: r1 = const [Instance of '_GlobalCupertinoLocalizationsDelegate', Instance of '_MaterialLocalizationsDelegate', Instance of '_WidgetsLocalizationsDelegate']
    //     0x395d40: add             x1, PP, #9, lsl #12  ; [pp+0x9190] List<LocalizationsDelegate>(3)
    //     0x395d44: ldr             x1, [x1, #0x190]
    // 0x395d48: StoreField: r0->field_6b = r1
    //     0x395d48: stur            w1, [x0, #0x6b]
    // 0x395d4c: ldur            x1, [fp, #-0x18]
    // 0x395d50: StoreField: r0->field_77 = r1
    //     0x395d50: stur            w1, [x0, #0x77]
    // 0x395d54: r1 = false
    //     0x395d54: add             x1, NULL, #0x30  ; false
    // 0x395d58: StoreField: r0->field_7b = r1
    //     0x395d58: stur            w1, [x0, #0x7b]
    // 0x395d5c: StoreField: r0->field_7f = r1
    //     0x395d5c: stur            w1, [x0, #0x7f]
    // 0x395d60: StoreField: r0->field_83 = r1
    //     0x395d60: stur            w1, [x0, #0x83]
    // 0x395d64: LeaveFrame
    //     0x395d64: mov             SP, fp
    //     0x395d68: ldp             fp, lr, [SP], #0x10
    // 0x395d6c: ret
    //     0x395d6c: ret             
    // 0x395d70: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x395d70: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x395d74: b               #0x395ac0
  }
  _ initState(/* No info */) {
    // ** addr: 0x3c3690, size: 0x80
    // 0x3c3690: EnterFrame
    //     0x3c3690: stp             fp, lr, [SP, #-0x10]!
    //     0x3c3694: mov             fp, SP
    // 0x3c3698: AllocStack(0x10)
    //     0x3c3698: sub             SP, SP, #0x10
    // 0x3c369c: SetupParameters(_MyAppState this /* r1 => r2, fp-0x8 */)
    //     0x3c369c: mov             x2, x1
    //     0x3c36a0: stur            x1, [fp, #-8]
    // 0x3c36a4: CheckStackOverflow
    //     0x3c36a4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c36a8: cmp             SP, x16
    //     0x3c36ac: b.ls            #0x3c3708
    // 0x3c36b0: r0 = LoadStaticField(0xccc)
    //     0x3c36b0: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c36b4: ldr             x0, [x0, #0x1998]
    // 0x3c36b8: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c36bc: cmp             w0, w16
    // 0x3c36c0: b.ne            #0x3c36d0
    // 0x3c36c4: r2 = stows
    //     0x3c36c4: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x3c36c8: ldr             x2, [x2, #0x310]
    // 0x3c36cc: r0 = InitLateFinalStaticField()
    //     0x3c36cc: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c36d0: LoadField: r3 = r0->field_f
    //     0x3c36d0: ldur            w3, [x0, #0xf]
    // 0x3c36d4: DecompressPointer r3
    //     0x3c36d4: add             x3, x3, HEAP, lsl #32
    // 0x3c36d8: ldur            x2, [fp, #-8]
    // 0x3c36dc: stur            x3, [fp, #-0x10]
    // 0x3c36e0: r1 = Function '_prefListener@774405894':.
    //     0x3c36e0: add             x1, PP, #8, lsl #12  ; [pp+0x8318] AnonymousClosure: (0x3c3710), in [package:ricochlime/main.dart] _MyAppState::_prefListener (0x3c3748)
    //     0x3c36e4: ldr             x1, [x1, #0x318]
    // 0x3c36e8: r0 = AllocateClosure()
    //     0x3c36e8: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c36ec: ldur            x1, [fp, #-0x10]
    // 0x3c36f0: mov             x2, x0
    // 0x3c36f4: r0 = addListener()
    //     0x3c36f4: bl              #0x4d539c  ; [package:flutter/src/foundation/change_notifier.dart] ChangeNotifier::addListener
    // 0x3c36f8: r0 = Null
    //     0x3c36f8: mov             x0, NULL
    // 0x3c36fc: LeaveFrame
    //     0x3c36fc: mov             SP, fp
    //     0x3c3700: ldp             fp, lr, [SP], #0x10
    // 0x3c3704: ret
    //     0x3c3704: ret             
    // 0x3c3708: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3708: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c370c: b               #0x3c36b0
  }
  [closure] void _prefListener(dynamic) {
    // ** addr: 0x3c3710, size: 0x38
    // 0x3c3710: EnterFrame
    //     0x3c3710: stp             fp, lr, [SP, #-0x10]!
    //     0x3c3714: mov             fp, SP
    // 0x3c3718: ldr             x0, [fp, #0x10]
    // 0x3c371c: ArrayLoad: r1 = r0[0]  ; List_4
    //     0x3c371c: ldur            w1, [x0, #0x17]
    // 0x3c3720: DecompressPointer r1
    //     0x3c3720: add             x1, x1, HEAP, lsl #32
    // 0x3c3724: CheckStackOverflow
    //     0x3c3724: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3728: cmp             SP, x16
    //     0x3c372c: b.ls            #0x3c3740
    // 0x3c3730: r0 = _prefListener()
    //     0x3c3730: bl              #0x3c3748  ; [package:ricochlime/main.dart] _MyAppState::_prefListener
    // 0x3c3734: LeaveFrame
    //     0x3c3734: mov             SP, fp
    //     0x3c3738: ldp             fp, lr, [SP], #0x10
    // 0x3c373c: ret
    //     0x3c373c: ret             
    // 0x3c3740: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3740: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3744: b               #0x3c3730
  }
  _ _prefListener(/* No info */) {
    // ** addr: 0x3c3748, size: 0x54
    // 0x3c3748: EnterFrame
    //     0x3c3748: stp             fp, lr, [SP, #-0x10]!
    //     0x3c374c: mov             fp, SP
    // 0x3c3750: AllocStack(0x8)
    //     0x3c3750: sub             SP, SP, #8
    // 0x3c3754: SetupParameters(_MyAppState this /* r1 => r0, fp-0x8 */)
    //     0x3c3754: mov             x0, x1
    //     0x3c3758: stur            x1, [fp, #-8]
    // 0x3c375c: CheckStackOverflow
    //     0x3c375c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c3760: cmp             SP, x16
    //     0x3c3764: b.ls            #0x3c3794
    // 0x3c3768: r1 = Function '<anonymous closure>':.
    //     0x3c3768: add             x1, PP, #8, lsl #12  ; [pp+0x8320] Function: [dart:ui] Shader::Shader._ (0x56ea68)
    //     0x3c376c: ldr             x1, [x1, #0x320]
    // 0x3c3770: r2 = Null
    //     0x3c3770: mov             x2, NULL
    // 0x3c3774: r0 = AllocateClosure()
    //     0x3c3774: bl              #0x5838bc  ; AllocateClosureStub
    // 0x3c3778: ldur            x1, [fp, #-8]
    // 0x3c377c: mov             x2, x0
    // 0x3c3780: r0 = setState()
    //     0x3c3780: bl              #0x2398d8  ; [package:flutter/src/widgets/framework.dart] State::setState
    // 0x3c3784: r0 = Null
    //     0x3c3784: mov             x0, NULL
    // 0x3c3788: LeaveFrame
    //     0x3c3788: mov             SP, fp
    //     0x3c378c: ldp             fp, lr, [SP], #0x10
    // 0x3c3790: ret
    //     0x3c3790: ret             
    // 0x3c3794: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c3794: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c3798: b               #0x3c3768
  }
  _ dispose(/* No info */) {
    // ** addr: 0x445408, size: 0x80
    // 0x445408: EnterFrame
    //     0x445408: stp             fp, lr, [SP, #-0x10]!
    //     0x44540c: mov             fp, SP
    // 0x445410: AllocStack(0x10)
    //     0x445410: sub             SP, SP, #0x10
    // 0x445414: SetupParameters(_MyAppState this /* r1 => r2, fp-0x8 */)
    //     0x445414: mov             x2, x1
    //     0x445418: stur            x1, [fp, #-8]
    // 0x44541c: CheckStackOverflow
    //     0x44541c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x445420: cmp             SP, x16
    //     0x445424: b.ls            #0x445480
    // 0x445428: r0 = LoadStaticField(0xccc)
    //     0x445428: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x44542c: ldr             x0, [x0, #0x1998]
    // 0x445430: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x445434: cmp             w0, w16
    // 0x445438: b.ne            #0x445448
    // 0x44543c: r2 = stows
    //     0x44543c: add             x2, PP, #8, lsl #12  ; [pp+0x8310] Field <::.stows>: static late final (offset: 0xccc)
    //     0x445440: ldr             x2, [x2, #0x310]
    // 0x445444: r0 = InitLateFinalStaticField()
    //     0x445444: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x445448: LoadField: r3 = r0->field_f
    //     0x445448: ldur            w3, [x0, #0xf]
    // 0x44544c: DecompressPointer r3
    //     0x44544c: add             x3, x3, HEAP, lsl #32
    // 0x445450: ldur            x2, [fp, #-8]
    // 0x445454: stur            x3, [fp, #-0x10]
    // 0x445458: r1 = Function '_prefListener@774405894':.
    //     0x445458: add             x1, PP, #8, lsl #12  ; [pp+0x8318] AnonymousClosure: (0x3c3710), in [package:ricochlime/main.dart] _MyAppState::_prefListener (0x3c3748)
    //     0x44545c: ldr             x1, [x1, #0x318]
    // 0x445460: r0 = AllocateClosure()
    //     0x445460: bl              #0x5838bc  ; AllocateClosureStub
    // 0x445464: ldur            x1, [fp, #-0x10]
    // 0x445468: mov             x2, x0
    // 0x44546c: r0 = removeListener()
    //     0x44546c: bl              #0x530aec  ; [package:flutter/src/foundation/change_notifier.dart] ChangeNotifier::removeListener
    // 0x445470: r0 = Null
    //     0x445470: mov             x0, NULL
    // 0x445474: LeaveFrame
    //     0x445474: mov             SP, fp
    //     0x445478: ldp             fp, lr, [SP], #0x10
    // 0x44547c: ret
    //     0x44547c: ret             
    // 0x445480: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x445480: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x445484: b               #0x445428
  }
}

// class id: 2869, size: 0xc, field offset: 0xc
//   const constructor, 
class MyApp extends StatefulWidget {

  _ createState(/* No info */) {
    // ** addr: 0x43dd14, size: 0x20
    // 0x43dd14: EnterFrame
    //     0x43dd14: stp             fp, lr, [SP, #-0x10]!
    //     0x43dd18: mov             fp, SP
    // 0x43dd1c: mov             x0, x1
    // 0x43dd20: r1 = <MyApp>
    //     0x43dd20: ldr             x1, [PP, #0x7550]  ; [pp+0x7550] TypeArguments: <MyApp>
    // 0x43dd24: r0 = _MyAppState()
    //     0x43dd24: bl              #0x43dd34  ; Allocate_MyAppStateStub -> _MyAppState (size=0x14)
    // 0x43dd28: LeaveFrame
    //     0x43dd28: mov             SP, fp
    //     0x43dd2c: ldp             fp, lr, [SP], #0x10
    // 0x43dd30: ret
    //     0x43dd30: ret             
  }
}
