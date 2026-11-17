// lib: , url: package:ricochlime/i18n/strings.g.dart

// class id: 1049312, size: 0x8
class :: {

  get _ t(/* No info */) {
    // ** addr: 0x370d20, size: 0x58
    // 0x370d20: EnterFrame
    //     0x370d20: stp             fp, lr, [SP, #-0x10]!
    //     0x370d24: mov             fp, SP
    // 0x370d28: AllocStack(0x10)
    //     0x370d28: sub             SP, SP, #0x10
    // 0x370d2c: CheckStackOverflow
    //     0x370d2c: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x370d30: cmp             SP, x16
    //     0x370d34: b.ls            #0x370d70
    // 0x370d38: r0 = LoadStaticField(0x468)
    //     0x370d38: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x370d3c: ldr             x0, [x0, #0x8d0]
    // 0x370d40: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x370d44: cmp             w0, w16
    // 0x370d48: b.ne            #0x370d54
    // 0x370d4c: r2 = instance
    //     0x370d4c: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x370d50: r0 = InitLateFinalStaticField()
    //     0x370d50: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x370d54: r16 = <AppLocale, Translations>
    //     0x370d54: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x370d58: stp             x0, x16, [SP]
    // 0x370d5c: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x370d5c: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x370d60: r0 = LocaleSettingsExt.currentTranslations()
    //     0x370d60: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x370d64: LeaveFrame
    //     0x370d64: mov             SP, fp
    //     0x370d68: ldp             fp, lr, [SP], #0x10
    // 0x370d6c: ret
    //     0x370d6c: ret             
    // 0x370d70: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x370d70: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x370d74: b               #0x370d38
  }
}

// class id: 210, size: 0x20, field offset: 0x20
class LocaleSettings extends BaseFlutterLocaleSettings<dynamic, dynamic> {

  static late final LocaleSettings instance; // offset: 0x468

  static LocaleSettings instance() {
    // ** addr: 0x380f48, size: 0x68
    // 0x380f48: EnterFrame
    //     0x380f48: stp             fp, lr, [SP, #-0x10]!
    //     0x380f4c: mov             fp, SP
    // 0x380f50: AllocStack(0x8)
    //     0x380f50: sub             SP, SP, #8
    // 0x380f54: CheckStackOverflow
    //     0x380f54: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x380f58: cmp             SP, x16
    //     0x380f5c: b.ls            #0x380fa8
    // 0x380f60: r0 = LoadStaticField(0x460)
    //     0x380f60: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x380f64: ldr             x0, [x0, #0x8c0]
    // 0x380f68: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x380f6c: cmp             w0, w16
    // 0x380f70: b.ne            #0x380f7c
    // 0x380f74: r2 = instance
    //     0x380f74: ldr             x2, [PP, #0x5798]  ; [pp+0x5798] Field <AppLocaleUtils.instance>: static late final (offset: 0x460)
    // 0x380f78: r0 = InitLateFinalStaticField()
    //     0x380f78: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x380f7c: r1 = <AppLocale, Translations>
    //     0x380f7c: ldr             x1, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x380f80: stur            x0, [fp, #-8]
    // 0x380f84: r0 = LocaleSettings()
    //     0x380f84: bl              #0x381538  ; AllocateLocaleSettingsStub -> LocaleSettings (size=0x20)
    // 0x380f88: mov             x1, x0
    // 0x380f8c: ldur            x2, [fp, #-8]
    // 0x380f90: stur            x0, [fp, #-8]
    // 0x380f94: r0 = BaseLocaleSettings()
    //     0x380f94: bl              #0x380fb0  ; [package:slang/src/api/singleton.dart] BaseLocaleSettings::BaseLocaleSettings
    // 0x380f98: ldur            x0, [fp, #-8]
    // 0x380f9c: LeaveFrame
    //     0x380f9c: mov             SP, fp
    //     0x380fa0: ldp             fp, lr, [SP], #0x10
    // 0x380fa4: ret
    //     0x380fa4: ret             
    // 0x380fa8: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x380fa8: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x380fac: b               #0x380f60
  }
  static _ useDeviceLocale(/* No info */) {
    // ** addr: 0x3c48ec, size: 0x58
    // 0x3c48ec: EnterFrame
    //     0x3c48ec: stp             fp, lr, [SP, #-0x10]!
    //     0x3c48f0: mov             fp, SP
    // 0x3c48f4: AllocStack(0x10)
    //     0x3c48f4: sub             SP, SP, #0x10
    // 0x3c48f8: CheckStackOverflow
    //     0x3c48f8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3c48fc: cmp             SP, x16
    //     0x3c4900: b.ls            #0x3c493c
    // 0x3c4904: r0 = LoadStaticField(0x468)
    //     0x3c4904: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3c4908: ldr             x0, [x0, #0x8d0]
    // 0x3c490c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3c4910: cmp             w0, w16
    // 0x3c4914: b.ne            #0x3c4920
    // 0x3c4918: r2 = instance
    //     0x3c4918: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x3c491c: r0 = InitLateFinalStaticField()
    //     0x3c491c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3c4920: r16 = <AppLocale, Translations>
    //     0x3c4920: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x3c4924: stp             x0, x16, [SP]
    // 0x3c4928: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x3c4928: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x3c492c: r0 = ExtBaseLocaleSettings.useDeviceLocale()
    //     0x3c492c: bl              #0x3c4944  ; [package:slang_flutter/slang_flutter.dart] ::ExtBaseLocaleSettings.useDeviceLocale
    // 0x3c4930: LeaveFrame
    //     0x3c4930: mov             SP, fp
    //     0x3c4934: ldp             fp, lr, [SP], #0x10
    // 0x3c4938: ret
    //     0x3c4938: ret             
    // 0x3c493c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3c493c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3c4940: b               #0x3c4904
  }
}

// class id: 228, size: 0x8, field offset: 0x8
class TranslationsShopPageEn extends Object {
}

// class id: 232, size: 0x8, field offset: 0x8
class TranslationsTutorialPageEn extends Object {
}

// class id: 236, size: 0x8, field offset: 0x8
class TranslationsRestartGameDialogEn extends Object {
}

// class id: 240, size: 0x8, field offset: 0x8
class TranslationsGameOverPageEn extends Object {
}

// class id: 244, size: 0x8, field offset: 0x8
class TranslationsSettingsPageEn extends Object {
}

// class id: 248, size: 0x8, field offset: 0x8
class TranslationsPlayPageEn extends Object {
}

// class id: 252, size: 0x8, field offset: 0x8
class TranslationsHomePageEn extends Object {
}

// class id: 257, size: 0x14, field offset: 0x14
class AppLocaleUtils extends BaseAppLocaleUtils<dynamic, dynamic> {

  static late final AppLocaleUtils instance; // offset: 0x460

  static AppLocaleUtils instance() {
    // ** addr: 0x381544, size: 0x2c
    // 0x381544: EnterFrame
    //     0x381544: stp             fp, lr, [SP, #-0x10]!
    //     0x381548: mov             fp, SP
    // 0x38154c: r1 = <AppLocale, Translations>
    //     0x38154c: ldr             x1, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x381550: r0 = AppLocaleUtils()
    //     0x381550: bl              #0x381570  ; AllocateAppLocaleUtilsStub -> AppLocaleUtils (size=0x14)
    // 0x381554: r1 = Instance_AppLocale
    //     0x381554: ldr             x1, [PP, #0x3398]  ; [pp+0x3398] Obj!AppLocale@5dcb11
    // 0x381558: StoreField: r0->field_b = r1
    //     0x381558: stur            w1, [x0, #0xb]
    // 0x38155c: r1 = const [Instance of 'AppLocale', Instance of 'AppLocale', Instance of 'AppLocale', Instance of 'AppLocale']
    //     0x38155c: ldr             x1, [PP, #0x5808]  ; [pp+0x5808] List<AppLocale>(4)
    // 0x381560: StoreField: r0->field_f = r1
    //     0x381560: stur            w1, [x0, #0xf]
    // 0x381564: LeaveFrame
    //     0x381564: mov             SP, fp
    //     0x381568: ldp             fp, lr, [SP], #0x10
    // 0x38156c: ret
    //     0x38156c: ret             
  }
  get _ supportedLocales(/* No info */) {
    // ** addr: 0x3b975c, size: 0x58
    // 0x3b975c: EnterFrame
    //     0x3b975c: stp             fp, lr, [SP, #-0x10]!
    //     0x3b9760: mov             fp, SP
    // 0x3b9764: AllocStack(0x10)
    //     0x3b9764: sub             SP, SP, #0x10
    // 0x3b9768: CheckStackOverflow
    //     0x3b9768: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3b976c: cmp             SP, x16
    //     0x3b9770: b.ls            #0x3b97ac
    // 0x3b9774: r0 = LoadStaticField(0x460)
    //     0x3b9774: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3b9778: ldr             x0, [x0, #0x8c0]
    // 0x3b977c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3b9780: cmp             w0, w16
    // 0x3b9784: b.ne            #0x3b9790
    // 0x3b9788: r2 = instance
    //     0x3b9788: ldr             x2, [PP, #0x5798]  ; [pp+0x5798] Field <AppLocaleUtils.instance>: static late final (offset: 0x460)
    // 0x3b978c: r0 = InitLateFinalStaticField()
    //     0x3b978c: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3b9790: r16 = <AppLocale, Translations>
    //     0x3b9790: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x3b9794: stp             x0, x16, [SP]
    // 0x3b9798: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x3b9798: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x3b979c: r0 = ExtAppLocaleUtils.supportedLocales()
    //     0x3b979c: bl              #0x3b97b4  ; [package:slang_flutter/slang_flutter.dart] ::ExtAppLocaleUtils.supportedLocales
    // 0x3b97a0: LeaveFrame
    //     0x3b97a0: mov             SP, fp
    //     0x3b97a4: ldp             fp, lr, [SP], #0x10
    // 0x3b97a8: ret
    //     0x3b97a8: ret             
    // 0x3b97ac: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3b97ac: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3b97b0: b               #0x3b9774
  }
}

// class id: 2269, size: 0x2c, field offset: 0x8
class Translations extends _MixinApplication2&Object&BaseTranslations {

  late final TranslationsHomePageEn homePage; // offset: 0x10
  late final Translations _root; // offset: 0xc
  late final TranslationsSettingsPageEn settingsPage; // offset: 0x18
  late final TranslationsGameOverPageEn gameOverPage; // offset: 0x1c
  late final TranslationsTutorialPageEn tutorialPage; // offset: 0x24
  late final TranslationsShopPageEn shopPage; // offset: 0x28
  late final TranslationsPlayPageEn playPage; // offset: 0x14
  late final TranslationsRestartGameDialogEn restartGameDialog; // offset: 0x20

  TranslationsRestartGameDialogEn restartGameDialog(Translations) {
    // ** addr: 0x380038, size: 0x50
    // 0x380038: EnterFrame
    //     0x380038: stp             fp, lr, [SP, #-0x10]!
    //     0x38003c: mov             fp, SP
    // 0x380040: CheckStackOverflow
    //     0x380040: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x380044: cmp             SP, x16
    //     0x380048: b.ls            #0x380080
    // 0x38004c: ldr             x1, [fp, #0x10]
    // 0x380050: LoadField: r0 = r1->field_b
    //     0x380050: ldur            w0, [x1, #0xb]
    // 0x380054: DecompressPointer r0
    //     0x380054: add             x0, x0, HEAP, lsl #32
    // 0x380058: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x38005c: cmp             w0, w16
    // 0x380060: b.ne            #0x380070
    // 0x380064: r2 = _root
    //     0x380064: add             x2, PP, #0x11, lsl #12  ; [pp+0x11178] Field <Translations._root@21346895>: late final (offset: 0xc)
    //     0x380068: ldr             x2, [x2, #0x178]
    // 0x38006c: r0 = InitLateFinalInstanceField()
    //     0x38006c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x380070: r0 = TranslationsRestartGameDialogEn()
    //     0x380070: bl              #0x380088  ; AllocateTranslationsRestartGameDialogEnStub -> TranslationsRestartGameDialogEn (size=0x8)
    // 0x380074: LeaveFrame
    //     0x380074: mov             SP, fp
    //     0x380078: ldp             fp, lr, [SP], #0x10
    // 0x38007c: ret
    //     0x38007c: ret             
    // 0x380080: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x380080: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x380084: b               #0x38004c
  }
  TranslationsPlayPageEn playPage(Translations) {
    // ** addr: 0x380c58, size: 0x50
    // 0x380c58: EnterFrame
    //     0x380c58: stp             fp, lr, [SP, #-0x10]!
    //     0x380c5c: mov             fp, SP
    // 0x380c60: CheckStackOverflow
    //     0x380c60: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x380c64: cmp             SP, x16
    //     0x380c68: b.ls            #0x380ca0
    // 0x380c6c: ldr             x1, [fp, #0x10]
    // 0x380c70: LoadField: r0 = r1->field_b
    //     0x380c70: ldur            w0, [x1, #0xb]
    // 0x380c74: DecompressPointer r0
    //     0x380c74: add             x0, x0, HEAP, lsl #32
    // 0x380c78: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x380c7c: cmp             w0, w16
    // 0x380c80: b.ne            #0x380c90
    // 0x380c84: r2 = _root
    //     0x380c84: add             x2, PP, #0x11, lsl #12  ; [pp+0x11178] Field <Translations._root@21346895>: late final (offset: 0xc)
    //     0x380c88: ldr             x2, [x2, #0x178]
    // 0x380c8c: r0 = InitLateFinalInstanceField()
    //     0x380c8c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x380c90: r0 = TranslationsPlayPageEn()
    //     0x380c90: bl              #0x380ca8  ; AllocateTranslationsPlayPageEnStub -> TranslationsPlayPageEn (size=0x8)
    // 0x380c94: LeaveFrame
    //     0x380c94: mov             SP, fp
    //     0x380c98: ldp             fp, lr, [SP], #0x10
    // 0x380c9c: ret
    //     0x380c9c: ret             
    // 0x380ca0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x380ca0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x380ca4: b               #0x380c6c
  }
  Translations Translations(Translations) {
    // ** addr: 0x381220, size: 0x98
    // 0x381220: EnterFrame
    //     0x381220: stp             fp, lr, [SP, #-0x10]!
    //     0x381224: mov             fp, SP
    // 0x381228: AllocStack(0x18)
    //     0x381228: sub             SP, SP, #0x18
    // 0x38122c: ldr             x0, [THR, #0x90]  ; THR::object_sentinel
    // 0x381230: stur            x1, [fp, #-8]
    // 0x381234: CheckStackOverflow
    //     0x381234: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x381238: cmp             SP, x16
    //     0x38123c: b.ls            #0x3812b0
    // 0x381240: StoreField: r1->field_b = r0
    //     0x381240: stur            w0, [x1, #0xb]
    // 0x381244: StoreField: r1->field_f = r0
    //     0x381244: stur            w0, [x1, #0xf]
    // 0x381248: StoreField: r1->field_13 = r0
    //     0x381248: stur            w0, [x1, #0x13]
    // 0x38124c: ArrayStore: r1[0] = r0  ; List_4
    //     0x38124c: stur            w0, [x1, #0x17]
    // 0x381250: StoreField: r1->field_1b = r0
    //     0x381250: stur            w0, [x1, #0x1b]
    // 0x381254: StoreField: r1->field_1f = r0
    //     0x381254: stur            w0, [x1, #0x1f]
    // 0x381258: StoreField: r1->field_23 = r0
    //     0x381258: stur            w0, [x1, #0x23]
    // 0x38125c: StoreField: r1->field_27 = r0
    //     0x38125c: stur            w0, [x1, #0x27]
    // 0x381260: r16 = <String, Node>
    //     0x381260: ldr             x16, [PP, #0x57d0]  ; [pp+0x57d0] TypeArguments: <String, Node>
    // 0x381264: ldr             lr, [THR, #0xa8]  ; THR::empty_array
    // 0x381268: stp             lr, x16, [SP]
    // 0x38126c: r0 = Map._fromLiteral()
    //     0x38126c: bl              #0x23b588  ; [dart:core] Map::Map._fromLiteral
    // 0x381270: r1 = <AppLocale, Translations>
    //     0x381270: ldr             x1, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x381274: r0 = TranslationMetadata()
    //     0x381274: bl              #0x3812b8  ; AllocateTranslationMetadataStub -> TranslationMetadata<X0 bound BaseAppLocale, X1 bound BaseTranslations> (size=0x10)
    // 0x381278: r1 = Instance_AppLocale
    //     0x381278: ldr             x1, [PP, #0x3398]  ; [pp+0x3398] Obj!AppLocale@5dcb11
    // 0x38127c: StoreField: r0->field_b = r1
    //     0x38127c: stur            w1, [x0, #0xb]
    // 0x381280: ldur            x1, [fp, #-8]
    // 0x381284: StoreField: r1->field_7 = r0
    //     0x381284: stur            w0, [x1, #7]
    //     0x381288: ldurb           w16, [x1, #-1]
    //     0x38128c: ldurb           w17, [x0, #-1]
    //     0x381290: and             x16, x17, x16, lsr #2
    //     0x381294: tst             x16, HEAP, lsr #32
    //     0x381298: b.eq            #0x3812a0
    //     0x38129c: bl              #0x582c44  ; WriteBarrierWrappersStub
    // 0x3812a0: r0 = Null
    //     0x3812a0: mov             x0, NULL
    // 0x3812a4: LeaveFrame
    //     0x3812a4: mov             SP, fp
    //     0x3812a8: ldp             fp, lr, [SP], #0x10
    // 0x3812ac: ret
    //     0x3812ac: ret             
    // 0x3812b0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3812b0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3812b4: b               #0x381240
  }
  TranslationsGameOverPageEn gameOverPage(Translations) {
    // ** addr: 0x400ccc, size: 0x50
    // 0x400ccc: EnterFrame
    //     0x400ccc: stp             fp, lr, [SP, #-0x10]!
    //     0x400cd0: mov             fp, SP
    // 0x400cd4: CheckStackOverflow
    //     0x400cd4: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x400cd8: cmp             SP, x16
    //     0x400cdc: b.ls            #0x400d14
    // 0x400ce0: ldr             x1, [fp, #0x10]
    // 0x400ce4: LoadField: r0 = r1->field_b
    //     0x400ce4: ldur            w0, [x1, #0xb]
    // 0x400ce8: DecompressPointer r0
    //     0x400ce8: add             x0, x0, HEAP, lsl #32
    // 0x400cec: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x400cf0: cmp             w0, w16
    // 0x400cf4: b.ne            #0x400d04
    // 0x400cf8: r2 = _root
    //     0x400cf8: add             x2, PP, #0x11, lsl #12  ; [pp+0x11178] Field <Translations._root@21346895>: late final (offset: 0xc)
    //     0x400cfc: ldr             x2, [x2, #0x178]
    // 0x400d00: r0 = InitLateFinalInstanceField()
    //     0x400d00: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x400d04: r0 = TranslationsGameOverPageEn()
    //     0x400d04: bl              #0x400d1c  ; AllocateTranslationsGameOverPageEnStub -> TranslationsGameOverPageEn (size=0x8)
    // 0x400d08: LeaveFrame
    //     0x400d08: mov             SP, fp
    //     0x400d0c: ldp             fp, lr, [SP], #0x10
    // 0x400d10: ret
    //     0x400d10: ret             
    // 0x400d14: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x400d14: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x400d18: b               #0x400ce0
  }
  TranslationsHomePageEn homePage(Translations) {
    // ** addr: 0x401e0c, size: 0x50
    // 0x401e0c: EnterFrame
    //     0x401e0c: stp             fp, lr, [SP, #-0x10]!
    //     0x401e10: mov             fp, SP
    // 0x401e14: CheckStackOverflow
    //     0x401e14: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x401e18: cmp             SP, x16
    //     0x401e1c: b.ls            #0x401e54
    // 0x401e20: ldr             x1, [fp, #0x10]
    // 0x401e24: LoadField: r0 = r1->field_b
    //     0x401e24: ldur            w0, [x1, #0xb]
    // 0x401e28: DecompressPointer r0
    //     0x401e28: add             x0, x0, HEAP, lsl #32
    // 0x401e2c: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x401e30: cmp             w0, w16
    // 0x401e34: b.ne            #0x401e44
    // 0x401e38: r2 = _root
    //     0x401e38: add             x2, PP, #0x11, lsl #12  ; [pp+0x11178] Field <Translations._root@21346895>: late final (offset: 0xc)
    //     0x401e3c: ldr             x2, [x2, #0x178]
    // 0x401e40: r0 = InitLateFinalInstanceField()
    //     0x401e40: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x401e44: r0 = TranslationsHomePageEn()
    //     0x401e44: bl              #0x401e5c  ; AllocateTranslationsHomePageEnStub -> TranslationsHomePageEn (size=0x8)
    // 0x401e48: LeaveFrame
    //     0x401e48: mov             SP, fp
    //     0x401e4c: ldp             fp, lr, [SP], #0x10
    // 0x401e50: ret
    //     0x401e50: ret             
    // 0x401e54: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x401e54: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x401e58: b               #0x401e20
  }
  TranslationsSettingsPageEn settingsPage(Translations) {
    // ** addr: 0x402350, size: 0x50
    // 0x402350: EnterFrame
    //     0x402350: stp             fp, lr, [SP, #-0x10]!
    //     0x402354: mov             fp, SP
    // 0x402358: CheckStackOverflow
    //     0x402358: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x40235c: cmp             SP, x16
    //     0x402360: b.ls            #0x402398
    // 0x402364: ldr             x1, [fp, #0x10]
    // 0x402368: LoadField: r0 = r1->field_b
    //     0x402368: ldur            w0, [x1, #0xb]
    // 0x40236c: DecompressPointer r0
    //     0x40236c: add             x0, x0, HEAP, lsl #32
    // 0x402370: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x402374: cmp             w0, w16
    // 0x402378: b.ne            #0x402388
    // 0x40237c: r2 = _root
    //     0x40237c: add             x2, PP, #0x11, lsl #12  ; [pp+0x11178] Field <Translations._root@21346895>: late final (offset: 0xc)
    //     0x402380: ldr             x2, [x2, #0x178]
    // 0x402384: r0 = InitLateFinalInstanceField()
    //     0x402384: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x402388: r0 = TranslationsSettingsPageEn()
    //     0x402388: bl              #0x4023a0  ; AllocateTranslationsSettingsPageEnStub -> TranslationsSettingsPageEn (size=0x8)
    // 0x40238c: LeaveFrame
    //     0x40238c: mov             SP, fp
    //     0x402390: ldp             fp, lr, [SP], #0x10
    // 0x402394: ret
    //     0x402394: ret             
    // 0x402398: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x402398: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x40239c: b               #0x402364
  }
  TranslationsShopPageEn shopPage(Translations) {
    // ** addr: 0x42c908, size: 0x50
    // 0x42c908: EnterFrame
    //     0x42c908: stp             fp, lr, [SP, #-0x10]!
    //     0x42c90c: mov             fp, SP
    // 0x42c910: CheckStackOverflow
    //     0x42c910: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42c914: cmp             SP, x16
    //     0x42c918: b.ls            #0x42c950
    // 0x42c91c: ldr             x1, [fp, #0x10]
    // 0x42c920: LoadField: r0 = r1->field_b
    //     0x42c920: ldur            w0, [x1, #0xb]
    // 0x42c924: DecompressPointer r0
    //     0x42c924: add             x0, x0, HEAP, lsl #32
    // 0x42c928: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42c92c: cmp             w0, w16
    // 0x42c930: b.ne            #0x42c940
    // 0x42c934: r2 = _root
    //     0x42c934: add             x2, PP, #0x11, lsl #12  ; [pp+0x11178] Field <Translations._root@21346895>: late final (offset: 0xc)
    //     0x42c938: ldr             x2, [x2, #0x178]
    // 0x42c93c: r0 = InitLateFinalInstanceField()
    //     0x42c93c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42c940: r0 = TranslationsShopPageEn()
    //     0x42c940: bl              #0x42c958  ; AllocateTranslationsShopPageEnStub -> TranslationsShopPageEn (size=0x8)
    // 0x42c944: LeaveFrame
    //     0x42c944: mov             SP, fp
    //     0x42c948: ldp             fp, lr, [SP], #0x10
    // 0x42c94c: ret
    //     0x42c94c: ret             
    // 0x42c950: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42c950: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42c954: b               #0x42c91c
  }
  TranslationsTutorialPageEn tutorialPage(Translations) {
    // ** addr: 0x42eb18, size: 0x50
    // 0x42eb18: EnterFrame
    //     0x42eb18: stp             fp, lr, [SP, #-0x10]!
    //     0x42eb1c: mov             fp, SP
    // 0x42eb20: CheckStackOverflow
    //     0x42eb20: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x42eb24: cmp             SP, x16
    //     0x42eb28: b.ls            #0x42eb60
    // 0x42eb2c: ldr             x1, [fp, #0x10]
    // 0x42eb30: LoadField: r0 = r1->field_b
    //     0x42eb30: ldur            w0, [x1, #0xb]
    // 0x42eb34: DecompressPointer r0
    //     0x42eb34: add             x0, x0, HEAP, lsl #32
    // 0x42eb38: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x42eb3c: cmp             w0, w16
    // 0x42eb40: b.ne            #0x42eb50
    // 0x42eb44: r2 = _root
    //     0x42eb44: add             x2, PP, #0x11, lsl #12  ; [pp+0x11178] Field <Translations._root@21346895>: late final (offset: 0xc)
    //     0x42eb48: ldr             x2, [x2, #0x178]
    // 0x42eb4c: r0 = InitLateFinalInstanceField()
    //     0x42eb4c: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x42eb50: r0 = TranslationsTutorialPageEn()
    //     0x42eb50: bl              #0x42eb68  ; AllocateTranslationsTutorialPageEnStub -> TranslationsTutorialPageEn (size=0x8)
    // 0x42eb54: LeaveFrame
    //     0x42eb54: mov             SP, fp
    //     0x42eb58: ldp             fp, lr, [SP], #0x10
    // 0x42eb5c: ret
    //     0x42eb5c: ret             
    // 0x42eb60: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x42eb60: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x42eb64: b               #0x42eb2c
  }
}

// class id: 2871, size: 0x18, field offset: 0x18
class TranslationProvider extends BaseTranslationProvider<dynamic, dynamic> {

  static _ of(/* No info */) {
    // ** addr: 0x3b99ac, size: 0x3c
    // 0x3b99ac: EnterFrame
    //     0x3b99ac: stp             fp, lr, [SP, #-0x10]!
    //     0x3b99b0: mov             fp, SP
    // 0x3b99b4: AllocStack(0x10)
    //     0x3b99b4: sub             SP, SP, #0x10
    // 0x3b99b8: CheckStackOverflow
    //     0x3b99b8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3b99bc: cmp             SP, x16
    //     0x3b99c0: b.ls            #0x3b99e0
    // 0x3b99c4: r16 = <AppLocale, Translations>
    //     0x3b99c4: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x3b99c8: stp             x1, x16, [SP]
    // 0x3b99cc: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x3b99cc: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x3b99d0: r0 = of()
    //     0x3b99d0: bl              #0x3b99e8  ; [package:slang_flutter/slang_flutter.dart] InheritedLocaleData::of
    // 0x3b99d4: LeaveFrame
    //     0x3b99d4: mov             SP, fp
    //     0x3b99d8: ldp             fp, lr, [SP], #0x10
    // 0x3b99dc: ret
    //     0x3b99dc: ret             
    // 0x3b99e0: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3b99e0: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3b99e4: b               #0x3b99c4
  }
}

// class id: 4059, size: 0x20, field offset: 0x14
enum AppLocale extends _MixinApplication1&_Enum&BaseAppLocale {

  _Mint field_8;
  _OneByteString field_10;
  _OneByteString field_14;

  _ buildSync(/* No info */) {
    // ** addr: 0x381104, size: 0xf8
    // 0x381104: EnterFrame
    //     0x381104: stp             fp, lr, [SP, #-0x10]!
    //     0x381108: mov             fp, SP
    // 0x38110c: AllocStack(0x10)
    //     0x38110c: sub             SP, SP, #0x10
    // 0x381110: CheckStackOverflow
    //     0x381110: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x381114: cmp             SP, x16
    //     0x381118: b.ls            #0x3811f4
    // 0x38111c: LoadField: r0 = r1->field_7
    //     0x38111c: ldur            x0, [x1, #7]
    // 0x381120: cmp             x0, #1
    // 0x381124: b.gt            #0x381184
    // 0x381128: cmp             x0, #0
    // 0x38112c: b.gt            #0x381150
    // 0x381130: r0 = Translations()
    //     0x381130: bl              #0x3812e0  ; AllocateTranslationsStub -> Translations (size=0x2c)
    // 0x381134: mov             x1, x0
    // 0x381138: stur            x0, [fp, #-8]
    // 0x38113c: r0 = Translations()
    //     0x38113c: bl              #0x381220  ; [package:ricochlime/i18n/strings.g.dart] Translations::Translations
    // 0x381140: ldur            x0, [fp, #-8]
    // 0x381144: LeaveFrame
    //     0x381144: mov             SP, fp
    //     0x381148: ldp             fp, lr, [SP], #0x10
    // 0x38114c: ret
    //     0x38114c: ret             
    // 0x381150: r16 = Instance_Object
    //     0x381150: ldr             x16, [PP, #0x57a0]  ; [pp+0x57a0] LibraryPrefix: l_es, target lib: package:ricochlime/i18n/strings_es.g.dart (1049313)
    // 0x381154: str             x16, [SP]
    // 0x381158: r0 = _checkLoaded()
    //     0x381158: bl              #0x24e300  ; [dart:core] ::_checkLoaded
    // 0x38115c: r0 = TranslationsEs()
    //     0x38115c: bl              #0x381214  ; AllocateTranslationsEsStub -> TranslationsEs (size=0x50)
    // 0x381160: mov             x1, x0
    // 0x381164: stur            x0, [fp, #-8]
    // 0x381168: r30 = [package:ricochlime/i18n/strings_es.g.dart] TranslationsEs::TranslationsEs
    //     0x381168: ldr             lr, [PP, #0x57a8]  ; [pp+0x57a8] Code: Code([Optimized] new TranslationsEs) (0x381474)
    // 0x38116c: LoadField: r30 = r30->field_7
    //     0x38116c: ldur            lr, [lr, #7]
    // 0x381170: blr             lr
    // 0x381174: ldur            x0, [fp, #-8]
    // 0x381178: LeaveFrame
    //     0x381178: mov             SP, fp
    //     0x38117c: ldp             fp, lr, [SP], #0x10
    // 0x381180: ret
    //     0x381180: ret             
    // 0x381184: cmp             x0, #2
    // 0x381188: b.gt            #0x3811c0
    // 0x38118c: r16 = Instance_Object
    //     0x38118c: ldr             x16, [PP, #0x57b0]  ; [pp+0x57b0] LibraryPrefix: l_kk, target lib: package:ricochlime/i18n/strings_kk.g.dart (1049314)
    // 0x381190: str             x16, [SP]
    // 0x381194: r0 = _checkLoaded()
    //     0x381194: bl              #0x24e300  ; [dart:core] ::_checkLoaded
    // 0x381198: r0 = TranslationsKk()
    //     0x381198: bl              #0x381208  ; AllocateTranslationsKkStub -> TranslationsKk (size=0x50)
    // 0x38119c: mov             x1, x0
    // 0x3811a0: stur            x0, [fp, #-8]
    // 0x3811a4: r30 = [package:ricochlime/i18n/strings_kk.g.dart] TranslationsKk::TranslationsKk
    //     0x3811a4: ldr             lr, [PP, #0x57b8]  ; [pp+0x57b8] Code: Code([Optimized] new TranslationsKk) (0x3813b0)
    // 0x3811a8: LoadField: r30 = r30->field_7
    //     0x3811a8: ldur            lr, [lr, #7]
    // 0x3811ac: blr             lr
    // 0x3811b0: ldur            x0, [fp, #-8]
    // 0x3811b4: LeaveFrame
    //     0x3811b4: mov             SP, fp
    //     0x3811b8: ldp             fp, lr, [SP], #0x10
    // 0x3811bc: ret
    //     0x3811bc: ret             
    // 0x3811c0: r16 = Instance_Object
    //     0x3811c0: ldr             x16, [PP, #0x57c0]  ; [pp+0x57c0] LibraryPrefix: l_ru, target lib: package:ricochlime/i18n/strings_ru.g.dart (1049315)
    // 0x3811c4: str             x16, [SP]
    // 0x3811c8: r0 = _checkLoaded()
    //     0x3811c8: bl              #0x24e300  ; [dart:core] ::_checkLoaded
    // 0x3811cc: r0 = TranslationsRu()
    //     0x3811cc: bl              #0x3811fc  ; AllocateTranslationsRuStub -> TranslationsRu (size=0x50)
    // 0x3811d0: mov             x1, x0
    // 0x3811d4: stur            x0, [fp, #-8]
    // 0x3811d8: r30 = [package:ricochlime/i18n/strings_ru.g.dart] TranslationsRu::TranslationsRu
    //     0x3811d8: ldr             lr, [PP, #0x57c8]  ; [pp+0x57c8] Code: Code([Optimized] new TranslationsRu) (0x3812ec)
    // 0x3811dc: LoadField: r30 = r30->field_7
    //     0x3811dc: ldur            lr, [lr, #7]
    // 0x3811e0: blr             lr
    // 0x3811e4: ldur            x0, [fp, #-8]
    // 0x3811e8: LeaveFrame
    //     0x3811e8: mov             SP, fp
    //     0x3811ec: ldp             fp, lr, [SP], #0x10
    // 0x3811f0: ret
    //     0x3811f0: ret             
    // 0x3811f4: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3811f4: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3811f8: b               #0x38111c
  }
  _ _enumToString(/* No info */) {
    // ** addr: 0x49c4f4, size: 0x60
    // 0x49c4f4: EnterFrame
    //     0x49c4f4: stp             fp, lr, [SP, #-0x10]!
    //     0x49c4f8: mov             fp, SP
    // 0x49c4fc: AllocStack(0x10)
    //     0x49c4fc: sub             SP, SP, #0x10
    // 0x49c500: SetupParameters(AppLocale this /* r1 => r0, fp-0x8 */)
    //     0x49c500: mov             x0, x1
    //     0x49c504: stur            x1, [fp, #-8]
    // 0x49c508: CheckStackOverflow
    //     0x49c508: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x49c50c: cmp             SP, x16
    //     0x49c510: b.ls            #0x49c54c
    // 0x49c514: r1 = Null
    //     0x49c514: mov             x1, NULL
    // 0x49c518: r2 = 4
    //     0x49c518: mov             x2, #4
    // 0x49c51c: r0 = AllocateArray()
    //     0x49c51c: bl              #0x5845d8  ; AllocateArrayStub
    // 0x49c520: r16 = "AppLocale."
    //     0x49c520: ldr             x16, [PP, #0x7b18]  ; [pp+0x7b18] "AppLocale."
    // 0x49c524: StoreField: r0->field_f = r16
    //     0x49c524: stur            w16, [x0, #0xf]
    // 0x49c528: ldur            x1, [fp, #-8]
    // 0x49c52c: LoadField: r2 = r1->field_f
    //     0x49c52c: ldur            w2, [x1, #0xf]
    // 0x49c530: DecompressPointer r2
    //     0x49c530: add             x2, x2, HEAP, lsl #32
    // 0x49c534: StoreField: r0->field_13 = r2
    //     0x49c534: stur            w2, [x0, #0x13]
    // 0x49c538: str             x0, [SP]
    // 0x49c53c: r0 = _interpolate()
    //     0x49c53c: bl              #0x240f4c  ; [dart:core] _StringBase::_interpolate
    // 0x49c540: LeaveFrame
    //     0x49c540: mov             SP, fp
    //     0x49c544: ldp             fp, lr, [SP], #0x10
    // 0x49c548: ret
    //     0x49c548: ret             
    // 0x49c54c: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x49c54c: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x49c550: b               #0x49c514
  }
  _ build(/* No info */) async {
    // ** addr: 0x51de50, size: 0x138
    // 0x51de50: EnterFrame
    //     0x51de50: stp             fp, lr, [SP, #-0x10]!
    //     0x51de54: mov             fp, SP
    // 0x51de58: AllocStack(0x18)
    //     0x51de58: sub             SP, SP, #0x18
    // 0x51de5c: SetupParameters(AppLocale this /* r1 => r1, fp-0x10 */)
    //     0x51de5c: stur            NULL, [fp, #-8]
    //     0x51de60: stur            x1, [fp, #-0x10]
    // 0x51de64: CheckStackOverflow
    //     0x51de64: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x51de68: cmp             SP, x16
    //     0x51de6c: b.ls            #0x51df80
    // 0x51de70: InitAsync() -> Future<Translations>
    //     0x51de70: add             x0, PP, #0xd, lsl #12  ; [pp+0xd500] TypeArguments: <Translations>
    //     0x51de74: ldr             x0, [x0, #0x500]
    //     0x51de78: bl              #0x2556b4  ; InitAsyncStub
    // 0x51de7c: ldur            x0, [fp, #-0x10]
    // 0x51de80: LoadField: r1 = r0->field_7
    //     0x51de80: ldur            x1, [x0, #7]
    // 0x51de84: cmp             x1, #1
    // 0x51de88: b.gt            #0x51def0
    // 0x51de8c: cmp             x1, #0
    // 0x51de90: b.gt            #0x51deac
    // 0x51de94: r0 = Translations()
    //     0x51de94: bl              #0x3812e0  ; AllocateTranslationsStub -> Translations (size=0x2c)
    // 0x51de98: mov             x1, x0
    // 0x51de9c: stur            x0, [fp, #-0x10]
    // 0x51dea0: r0 = Translations()
    //     0x51dea0: bl              #0x381220  ; [package:ricochlime/i18n/strings.g.dart] Translations::Translations
    // 0x51dea4: ldur            x0, [fp, #-0x10]
    // 0x51dea8: r0 = ReturnAsyncNotFuture()
    //     0x51dea8: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x51deac: r16 = Instance_Object
    //     0x51deac: ldr             x16, [PP, #0x57a0]  ; [pp+0x57a0] LibraryPrefix: l_es, target lib: package:ricochlime/i18n/strings_es.g.dart (1049313)
    // 0x51deb0: str             x16, [SP]
    // 0x51deb4: r0 = _loadLibrary()
    //     0x51deb4: bl              #0x24ec74  ; [dart:core] ::_loadLibrary
    // 0x51deb8: mov             x1, x0
    // 0x51debc: stur            x1, [fp, #-0x10]
    // 0x51dec0: r0 = Await()
    //     0x51dec0: bl              #0x255470  ; AwaitStub
    // 0x51dec4: r16 = Instance_Object
    //     0x51dec4: ldr             x16, [PP, #0x57a0]  ; [pp+0x57a0] LibraryPrefix: l_es, target lib: package:ricochlime/i18n/strings_es.g.dart (1049313)
    // 0x51dec8: str             x16, [SP]
    // 0x51decc: r0 = _checkLoaded()
    //     0x51decc: bl              #0x24e300  ; [dart:core] ::_checkLoaded
    // 0x51ded0: r0 = TranslationsEs()
    //     0x51ded0: bl              #0x381214  ; AllocateTranslationsEsStub -> TranslationsEs (size=0x50)
    // 0x51ded4: mov             x1, x0
    // 0x51ded8: stur            x0, [fp, #-0x10]
    // 0x51dedc: r30 = [package:ricochlime/i18n/strings_es.g.dart] TranslationsEs::TranslationsEs
    //     0x51dedc: ldr             lr, [PP, #0x57a8]  ; [pp+0x57a8] Code: Code([Optimized] new TranslationsEs) (0x381474)
    // 0x51dee0: LoadField: r30 = r30->field_7
    //     0x51dee0: ldur            lr, [lr, #7]
    // 0x51dee4: blr             lr
    // 0x51dee8: ldur            x0, [fp, #-0x10]
    // 0x51deec: r0 = ReturnAsyncNotFuture()
    //     0x51deec: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x51def0: cmp             x1, #2
    // 0x51def4: b.gt            #0x51df3c
    // 0x51def8: r16 = Instance_Object
    //     0x51def8: ldr             x16, [PP, #0x57b0]  ; [pp+0x57b0] LibraryPrefix: l_kk, target lib: package:ricochlime/i18n/strings_kk.g.dart (1049314)
    // 0x51defc: str             x16, [SP]
    // 0x51df00: r0 = _loadLibrary()
    //     0x51df00: bl              #0x24ec74  ; [dart:core] ::_loadLibrary
    // 0x51df04: mov             x1, x0
    // 0x51df08: stur            x1, [fp, #-0x10]
    // 0x51df0c: r0 = Await()
    //     0x51df0c: bl              #0x255470  ; AwaitStub
    // 0x51df10: r16 = Instance_Object
    //     0x51df10: ldr             x16, [PP, #0x57b0]  ; [pp+0x57b0] LibraryPrefix: l_kk, target lib: package:ricochlime/i18n/strings_kk.g.dart (1049314)
    // 0x51df14: str             x16, [SP]
    // 0x51df18: r0 = _checkLoaded()
    //     0x51df18: bl              #0x24e300  ; [dart:core] ::_checkLoaded
    // 0x51df1c: r0 = TranslationsKk()
    //     0x51df1c: bl              #0x381208  ; AllocateTranslationsKkStub -> TranslationsKk (size=0x50)
    // 0x51df20: mov             x1, x0
    // 0x51df24: stur            x0, [fp, #-0x10]
    // 0x51df28: r30 = [package:ricochlime/i18n/strings_kk.g.dart] TranslationsKk::TranslationsKk
    //     0x51df28: ldr             lr, [PP, #0x57b8]  ; [pp+0x57b8] Code: Code([Optimized] new TranslationsKk) (0x3813b0)
    // 0x51df2c: LoadField: r30 = r30->field_7
    //     0x51df2c: ldur            lr, [lr, #7]
    // 0x51df30: blr             lr
    // 0x51df34: ldur            x0, [fp, #-0x10]
    // 0x51df38: r0 = ReturnAsyncNotFuture()
    //     0x51df38: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x51df3c: r16 = Instance_Object
    //     0x51df3c: ldr             x16, [PP, #0x57c0]  ; [pp+0x57c0] LibraryPrefix: l_ru, target lib: package:ricochlime/i18n/strings_ru.g.dart (1049315)
    // 0x51df40: str             x16, [SP]
    // 0x51df44: r0 = _loadLibrary()
    //     0x51df44: bl              #0x24ec74  ; [dart:core] ::_loadLibrary
    // 0x51df48: mov             x1, x0
    // 0x51df4c: stur            x1, [fp, #-0x10]
    // 0x51df50: r0 = Await()
    //     0x51df50: bl              #0x255470  ; AwaitStub
    // 0x51df54: r16 = Instance_Object
    //     0x51df54: ldr             x16, [PP, #0x57c0]  ; [pp+0x57c0] LibraryPrefix: l_ru, target lib: package:ricochlime/i18n/strings_ru.g.dart (1049315)
    // 0x51df58: str             x16, [SP]
    // 0x51df5c: r0 = _checkLoaded()
    //     0x51df5c: bl              #0x24e300  ; [dart:core] ::_checkLoaded
    // 0x51df60: r0 = TranslationsRu()
    //     0x51df60: bl              #0x3811fc  ; AllocateTranslationsRuStub -> TranslationsRu (size=0x50)
    // 0x51df64: mov             x1, x0
    // 0x51df68: stur            x0, [fp, #-0x10]
    // 0x51df6c: r30 = [package:ricochlime/i18n/strings_ru.g.dart] TranslationsRu::TranslationsRu
    //     0x51df6c: ldr             lr, [PP, #0x57c8]  ; [pp+0x57c8] Code: Code([Optimized] new TranslationsRu) (0x3812ec)
    // 0x51df70: LoadField: r30 = r30->field_7
    //     0x51df70: ldur            lr, [lr, #7]
    // 0x51df74: blr             lr
    // 0x51df78: ldur            x0, [fp, #-0x10]
    // 0x51df7c: r0 = ReturnAsyncNotFuture()
    //     0x51df7c: b               #0x2551bc  ; ReturnAsyncNotFutureStub
    // 0x51df80: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x51df80: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x51df84: b               #0x51de70
  }
}
