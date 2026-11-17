// lib: , url: package:ricochlime/nes/coin_icon.dart

// class id: 1049319, size: 0x8
class :: {
}

// class id: 2772, size: 0x14, field offset: 0xc
//   const constructor, 
class CoinIcon extends StatelessWidget {

  _Double field_c;

  _ build(/* No info */) {
    // ** addr: 0x3fefec, size: 0x1b4
    // 0x3fefec: EnterFrame
    //     0x3fefec: stp             fp, lr, [SP, #-0x10]!
    //     0x3feff0: mov             fp, SP
    // 0x3feff4: AllocStack(0x30)
    //     0x3feff4: sub             SP, SP, #0x30
    // 0x3feff8: CheckStackOverflow
    //     0x3feff8: ldr             x16, [THR, #0x48]  ; THR::stack_limit
    //     0x3feffc: cmp             SP, x16
    //     0x3ff000: b.ls            #0x3ff198
    // 0x3ff004: LoadField: d1 = r1->field_b
    //     0x3ff004: ldur            d1, [x1, #0xb]
    // 0x3ff008: stur            d1, [fp, #-0x18]
    // 0x3ff00c: r0 = LoadStaticField(0x468)
    //     0x3ff00c: ldr             x0, [THR, #0x78]  ; THR::field_table_values
    //     0x3ff010: ldr             x0, [x0, #0x8d0]
    // 0x3ff014: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff018: cmp             w0, w16
    // 0x3ff01c: b.ne            #0x3ff028
    // 0x3ff020: r2 = instance
    //     0x3ff020: ldr             x2, [PP, #0x2528]  ; [pp+0x2528] Field <LocaleSettings.instance>: static late final (offset: 0x468)
    // 0x3ff024: r0 = InitLateFinalStaticField()
    //     0x3ff024: bl              #0x58269c  ; InitLateFinalStaticFieldStub
    // 0x3ff028: r16 = <AppLocale, Translations>
    //     0x3ff028: ldr             x16, [PP, #0x2530]  ; [pp+0x2530] TypeArguments: <AppLocale, Translations>
    // 0x3ff02c: stp             x0, x16, [SP]
    // 0x3ff030: r4 = const [0x2, 0x1, 0x1, 0x1, null]
    //     0x3ff030: ldr             x4, [PP, #0x21b8]  ; [pp+0x21b8] List(5) [0x2, 0x1, 0x1, 0x1, Null]
    // 0x3ff034: r0 = LocaleSettingsExt.currentTranslations()
    //     0x3ff034: bl              #0x366ce4  ; [package:slang/src/api/singleton.dart] ::LocaleSettingsExt.currentTranslations
    // 0x3ff038: r1 = LoadClassIdInstr(r0)
    //     0x3ff038: ldur            x1, [x0, #-1]
    //     0x3ff03c: ubfx            x1, x1, #0xc, #0x14
    // 0x3ff040: cmp             x1, #0x8dd
    // 0x3ff044: b.ne            #0x3ff070
    // 0x3ff048: mov             x1, x0
    // 0x3ff04c: LoadField: r0 = r1->field_13
    //     0x3ff04c: ldur            w0, [x1, #0x13]
    // 0x3ff050: DecompressPointer r0
    //     0x3ff050: add             x0, x0, HEAP, lsl #32
    // 0x3ff054: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff058: cmp             w0, w16
    // 0x3ff05c: b.ne            #0x3ff06c
    // 0x3ff060: r2 = playPage
    //     0x3ff060: add             x2, PP, #0x12, lsl #12  ; [pp+0x12320] Field <Translations.playPage>: late final (offset: 0x14)
    //     0x3ff064: ldr             x2, [x2, #0x320]
    // 0x3ff068: r0 = InitLateFinalInstanceField()
    //     0x3ff068: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff06c: b               #0x3ff0f4
    // 0x3ff070: cmp             x1, #0x8df
    // 0x3ff074: b.ne            #0x3ff0a0
    // 0x3ff078: mov             x1, x0
    // 0x3ff07c: LoadField: r0 = r1->field_37
    //     0x3ff07c: ldur            w0, [x1, #0x37]
    // 0x3ff080: DecompressPointer r0
    //     0x3ff080: add             x0, x0, HEAP, lsl #32
    // 0x3ff084: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff088: cmp             w0, w16
    // 0x3ff08c: b.ne            #0x3ff09c
    // 0x3ff090: r2 = playPage
    //     0x3ff090: add             x2, PP, #0x12, lsl #12  ; [pp+0x12328] Field <TranslationsRu.playPage>: late final (offset: 0x38)
    //     0x3ff094: ldr             x2, [x2, #0x328]
    // 0x3ff098: r0 = InitLateFinalInstanceField()
    //     0x3ff098: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff09c: b               #0x3ff0f4
    // 0x3ff0a0: cmp             x1, #0x8e0
    // 0x3ff0a4: b.ne            #0x3ff0d0
    // 0x3ff0a8: mov             x1, x0
    // 0x3ff0ac: LoadField: r0 = r1->field_37
    //     0x3ff0ac: ldur            w0, [x1, #0x37]
    // 0x3ff0b0: DecompressPointer r0
    //     0x3ff0b0: add             x0, x0, HEAP, lsl #32
    // 0x3ff0b4: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff0b8: cmp             w0, w16
    // 0x3ff0bc: b.ne            #0x3ff0cc
    // 0x3ff0c0: r2 = playPage
    //     0x3ff0c0: add             x2, PP, #0x12, lsl #12  ; [pp+0x12330] Field <TranslationsKk.playPage>: late final (offset: 0x38)
    //     0x3ff0c4: ldr             x2, [x2, #0x330]
    // 0x3ff0c8: r0 = InitLateFinalInstanceField()
    //     0x3ff0c8: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff0cc: b               #0x3ff0f4
    // 0x3ff0d0: mov             x1, x0
    // 0x3ff0d4: LoadField: r0 = r1->field_37
    //     0x3ff0d4: ldur            w0, [x1, #0x37]
    // 0x3ff0d8: DecompressPointer r0
    //     0x3ff0d8: add             x0, x0, HEAP, lsl #32
    // 0x3ff0dc: ldr             x16, [THR, #0x90]  ; THR::object_sentinel
    // 0x3ff0e0: cmp             w0, w16
    // 0x3ff0e4: b.ne            #0x3ff0f4
    // 0x3ff0e8: r2 = playPage
    //     0x3ff0e8: add             x2, PP, #0x12, lsl #12  ; [pp+0x12338] Field <TranslationsEs.playPage>: late final (offset: 0x38)
    //     0x3ff0ec: ldr             x2, [x2, #0x338]
    // 0x3ff0f0: r0 = InitLateFinalInstanceField()
    //     0x3ff0f0: bl              #0x582558  ; InitLateFinalInstanceFieldStub
    // 0x3ff0f4: r1 = LoadClassIdInstr(r0)
    //     0x3ff0f4: ldur            x1, [x0, #-1]
    //     0x3ff0f8: ubfx            x1, x1, #0xc, #0x14
    // 0x3ff0fc: cmp             x1, #0xf8
    // 0x3ff100: b.ne            #0x3ff110
    // 0x3ff104: r0 = "Coins"
    //     0x3ff104: add             x0, PP, #0x12, lsl #12  ; [pp+0x12340] "Coins"
    //     0x3ff108: ldr             x0, [x0, #0x340]
    // 0x3ff10c: b               #0x3ff140
    // 0x3ff110: cmp             x1, #0xf9
    // 0x3ff114: b.ne            #0x3ff124
    // 0x3ff118: r0 = "Монетки"
    //     0x3ff118: add             x0, PP, #0x12, lsl #12  ; [pp+0x12348] "Монетки"
    //     0x3ff11c: ldr             x0, [x0, #0x348]
    // 0x3ff120: b               #0x3ff140
    // 0x3ff124: cmp             x1, #0xfa
    // 0x3ff128: b.ne            #0x3ff138
    // 0x3ff12c: r0 = "Монеталар"
    //     0x3ff12c: add             x0, PP, #0x12, lsl #12  ; [pp+0x12350] "Монеталар"
    //     0x3ff130: ldr             x0, [x0, #0x350]
    // 0x3ff134: b               #0x3ff140
    // 0x3ff138: r0 = "monedas"
    //     0x3ff138: add             x0, PP, #0x12, lsl #12  ; [pp+0x12358] "monedas"
    //     0x3ff13c: ldr             x0, [x0, #0x358]
    // 0x3ff140: stur            x0, [fp, #-8]
    // 0x3ff144: r0 = Image()
    //     0x3ff144: bl              #0x3ff384  ; AllocateImageStub -> Image (size=0x60)
    // 0x3ff148: stur            x0, [fp, #-0x10]
    // 0x3ff14c: r16 = Instance_FilterQuality
    //     0x3ff14c: add             x16, PP, #0x12, lsl #12  ; [pp+0x12360] Obj!FilterQuality@5dc931
    //     0x3ff150: ldr             x16, [x16, #0x360]
    // 0x3ff154: r30 = Instance_BoxFit
    //     0x3ff154: add             lr, PP, #0x12, lsl #12  ; [pp+0x12368] Obj!BoxFit@5dae51
    //     0x3ff158: ldr             lr, [lr, #0x368]
    // 0x3ff15c: stp             lr, x16, [SP, #8]
    // 0x3ff160: ldur            x16, [fp, #-8]
    // 0x3ff164: str             x16, [SP]
    // 0x3ff168: mov             x1, x0
    // 0x3ff16c: ldur            d0, [fp, #-0x18]
    // 0x3ff170: ldur            d1, [fp, #-0x18]
    // 0x3ff174: r2 = "assets/images/coin.png"
    //     0x3ff174: add             x2, PP, #0x12, lsl #12  ; [pp+0x12370] "assets/images/coin.png"
    //     0x3ff178: ldr             x2, [x2, #0x370]
    // 0x3ff17c: r4 = const [0, 0x7, 0x3, 0x4, filterQuality, 0x4, fit, 0x5, semanticLabel, 0x6, null]
    //     0x3ff17c: add             x4, PP, #0x12, lsl #12  ; [pp+0x12378] List(11) [0, 0x7, 0x3, 0x4, "filterQuality", 0x4, "fit", 0x5, "semanticLabel", 0x6, Null]
    //     0x3ff180: ldr             x4, [x4, #0x378]
    // 0x3ff184: r0 = Image.asset()
    //     0x3ff184: bl              #0x3ff1a0  ; [package:flutter/src/widgets/image.dart] Image::Image.asset
    // 0x3ff188: ldur            x0, [fp, #-0x10]
    // 0x3ff18c: LeaveFrame
    //     0x3ff18c: mov             SP, fp
    //     0x3ff190: ldp             fp, lr, [SP], #0x10
    // 0x3ff194: ret
    //     0x3ff194: ret             
    // 0x3ff198: r0 = StackOverflowSharedWithoutFPURegs()
    //     0x3ff198: bl              #0x5846e4  ; StackOverflowSharedWithoutFPURegsStub
    // 0x3ff19c: b               #0x3ff004
  }
}
