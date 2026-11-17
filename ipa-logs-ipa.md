Godot 3.6.1-stable
Godot.app
opaque 1024 icon made from media/image/icon/icon256.png
iOS preset added as preset.0 (Godot 3), bundle com.duckyisc00l.rota
export exit 0
note: Target dependency graph (1 target)
    Target 'ROTA' in project 'ROTA' (no dependencies)

GatherProvisioningInputs

CreateBuildDescription

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -E -dM -arch arm64 -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -x c++ -c /dev/null

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/ibtool --version --output-format xml1

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -E -dM -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -x c -c /dev/null

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -v -E -dM -arch arm64 -isysroot /Applications/Xcode_26.6.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS26.5.sdk -x c -c /dev/null

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool --print-asset-tag-combinations --output-format xml1 /Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/export/ROTA/Images.xcassets

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/usr/bin/actool --version --output-format xml1

ExecuteExternalTool /Applications/Xcode_26.6.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld -version_details

Build description signature: bb32da168ed1c190aee856ee413287a2
Build description path: /Users/runner/Library/Developer/Xcode/DerivedData/ROTA-daexmoyhkjotwbdmlajikrvfqwfq/Build/Intermediates.noindex/ArchiveIntermediates/ROTA/IntermediateBuildFilesPath/XCBuildData/bb32da168ed1c190aee856ee413287a2.xcbuilddata
/Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/export/ROTA.xcodeproj: error: ROTA has conflicting provisioning settings. ROTA is automatically signed for development, but a conflicting code signing identity iPhone Distribution has been manually specified. Set the code signing identity value to "Apple Development" in the build settings editor, or switch to manual signing in the Signing & Capabilities editor. (in target 'ROTA' from project 'ROTA')
** ARCHIVE FAILED **


The following build commands failed:
	Archiving project ROTA with scheme ROTA
(1 failure)

	export: step 4: Making .ipa
xcodebuild (.ipa):
error: error: archive not found at path '/Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/export/ROTA.xcarchive'

** EXPORT FAILED **


export: end
reimport: end
total 99064
drwxr-xr-x   7 runner  staff       224 Nov 17 15:28 .
drwxr-xr-x  13 runner  staff       416 Nov 17 15:25 ..
-rw-r--r--   1 runner  staff       990 Nov 17 15:28 PrivacyInfo.xcprivacy
drwxr-xr-x  12 runner  staff       384 Nov 17 15:28 ROTA
-rw-r--r--   1 runner  staff  50715984 Nov 17 15:28 ROTA.pck
drwxr-xr-x   5 runner  staff       160 Nov 17 15:28 ROTA.xcframework
drwxr-xr-x   5 runner  staff       160 Nov 17 15:28 ROTA.xcodeproj
xcodeproj: export/ROTA.xcodeproj
xcodebuild exit 0
** BUILD SUCCEEDED **
