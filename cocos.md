# Detect
- engine library: apk/lib/armeabi-v7a/libcocos2dlua.so ( 17M)
- version: cocos2d-x-3.17.2
- scripts:       92 .lua,        0 .luac,        0 .js,        0 .jsc
- first bytes of main.lua: 726571756972652022636f6e66696722
- XXTEA key/sign near the setXXTEAKeyAndSign strings (default is 2dxLua/XXTEA):
68864-cocos_android_app_init
68865-2dxLua
68866:XXTEA
68867-main.lua
68868--workdir
- assets/: res src 
- third-party libs: v3-deps-158
Architectures in the fat file: engine/external/lua/luajit/prebuilt/ios/libluajit.a are: armv7 i386 x86_64 arm64 
- arm64 simulator retag: libfreetype.a: 44 objects (archive members 44, extracted 44)
- arm64 simulator retag: libwebsockets.a: 28 objects (archive members 28, extracted 28)
- arm64 simulator retag: libwebp.a: 96 objects (archive members 96, extracted 96)
- arm64 simulator retag: libluajit.a: 66 objects (archive members 66, extracted 66)
- arm64 simulator retag: libuv_a.a: 30 objects (archive members 30, extracted 30)
- arm64 simulator retag: libuv_a.a: 30 objects (archive members 30, extracted 30)
- arm64 simulator retag: libcurl.a: 125 objects (archive members 125, extracted 125)
- arm64 simulator retag: libchipmunk.a: 32 objects (archive members 32, extracted 32)
- arm64 simulator retag: libBulletMultiThreaded.a: 18 objects (archive members 18, extracted 18)
- arm64 simulator retag: libMiniCL.a: 3 objects (archive members 3, extracted 3)
- arm64 simulator retag: libLinearMath.a: 8 objects (archive members 8, extracted 8)
- arm64 simulator retag: libBulletCollision.a: 94 objects (archive members 94, extracted 94)
- arm64 simulator retag: libBulletDynamics.a: 30 objects (archive members 30, extracted 30)
- arm64 simulator retag: libbox2d.a: 46 objects (archive members 46, extracted 46)
- arm64 simulator retag: libjpeg.a: 46 objects (archive members 46, extracted 46)
- arm64 simulator retag: libcrypto.a: 613 objects (archive members 613, extracted 613)
- arm64 simulator retag: libssl.a: 39 objects (archive members 39, extracted 39)
- arm64 simulator retag: libtiff.a: 40 objects (archive members 40, extracted 40)
# Native bindings

- tolua classes in the APK's engine: 495; in stock engine: 495
- only in the APK's engine (the game's own C++): []
- of those, used by the game's scripts: []
- binding functions only in the APK's engine (4742 of 6847): ['lua_cocos2dx_3d_AABB_constructorP9lua_State', 'lua_cocos2dx_3d_AABB_containPointP9lua_State', 'lua_cocos2dx_3d_AABB_finalizeP9lua_State', 'lua_cocos2dx_3d_AABB_getCenterP9lua_State', 'lua_cocos2dx_3d_AABB_getCornersP9lua_State', 'lua_cocos2dx_3d_AABB_isEmptyP9lua_State', 'lua_cocos2dx_3d_AABB_resetP9lua_State', 'lua_cocos2dx_3d_AABB_setP9lua_State', 'lua_cocos2dx_3d_AABB_transformP9lua_State', 'lua_cocos2dx_3d_AABB_updateMinMaxP9lua_State', 'lua_cocos2dx_3d_Animate3D_constructorP9lua_State', 'lua_cocos2dx_3d_Animate3D_createP9lua_State', 'lua_cocos2dx_3d_Animate3D_createWithFramesP9lua_State', 'lua_cocos2dx_3d_Animate3D_getOriginIntervalP9lua_State', 'lua_cocos2dx_3d_Animate3D_getQualityP9lua_State', 'lua_cocos2dx_3d_Animate3D_getSpeedP9lua_State', 'lua_cocos2dx_3d_Animate3D_getTransitionTimeP9lua_State', 'lua_cocos2dx_3d_Animate3D_getWeightP9lua_State', 'lua_cocos2dx_3d_Animate3D_initP9lua_State', 'lua_cocos2dx_3d_Animate3D_initWithFramesP9lua_State', 'lua_cocos2dx_3d_Animate3D_removeFromMapP9lua_State', 'lua_cocos2dx_3d_Animate3D_setKeyFrameUserInfoP9lua_State', 'lua_cocos2dx_3d_Animate3D_setOriginIntervalP9lua_State', 'lua_cocos2dx_3d_Animate3D_setQualityP9lua_State', 'lua_cocos2dx_3d_Animate3D_setSpeedP9lua_State', 'lua_cocos2dx_3d_Animate3D_setTransitionTimeP9lua_State', 'lua_cocos2dx_3d_Animate3D_setWeightP9lua_State', 'lua_cocos2dx_3d_Animation3D_constructorP9lua_State', 'lua_cocos2dx_3d_Animation3D_createP9lua_State', 'lua_cocos2dx_3d_Animation3D_getDurationP9lua_State', 'lua_cocos2dx_3d_Animation3D_initP9lua_State', 'lua_cocos2dx_3d_Animation3D_initWithFileP9lua_State', 'lua_cocos2dx_3d_AttachNode_constructorP9lua_State', 'lua_cocos2dx_3d_AttachNode_createP9lua_State', 'lua_cocos2dx_3d_BillBoard_constructorP9lua_State', 'lua_cocos2dx_3d_BillBoard_createP9lua_State', 'lua_cocos2dx_3d_BillBoard_createWithTextureP9lua_State', 'lua_cocos2dx_3d_BillBoard_getModeP9lua_State', 'lua_cocos2dx_3d_BillBoard_setModeP9lua_State', 'lua_cocos2dx_3d_Bundle3D_clearP9lua_State', 'lua_cocos2dx_3d_Bundle3D_constructorP9lua_State', 'lua_cocos2dx_3d_Bundle3D_createBundleP9lua_State', 'lua_cocos2dx_3d_Bundle3D_destroyBundleP9lua_State', 'lua_cocos2dx_3d_Bundle3D_getTrianglesListP9lua_State', 'lua_cocos2dx_3d_Bundle3D_loadAnimationDataP9lua_State', 'lua_cocos2dx_3d_Bundle3D_loadMaterialsP9lua_State', 'lua_cocos2dx_3d_Bundle3D_loadNodesP9lua_State', 'lua_cocos2dx_3d_Bundle3D_loadP9lua_State', 'lua_cocos2dx_3d_Bundle3D_loadSkinDataP9lua_State', 'lua_cocos2dx_3d_Mesh_calculateAABBP9lua_State', 'lua_cocos2dx_3d_Mesh_constructorP9lua_State', 'lua_cocos2dx_3d_Mesh_drawP9lua_State', 'lua_cocos2dx_3d_Mesh_getBlendFuncP9lua_State', 'lua_cocos2dx_3d_Mesh_getMaterialP9lua_State', 'lua_cocos2dx_3d_Mesh_getMeshVertexAttribCountP9lua_State', 'lua_cocos2dx_3d_Mesh_getMeshVertexAttributeP9lua_State', 'lua_cocos2dx_3d_Mesh_getNameP9lua_State', 'lua_cocos2dx_3d_Mesh_getVertexSizeInBytesP9lua_State', 'lua_cocos2dx_3d_Mesh_isVisibleP9lua_State', 'lua_cocos2dx_3d_Mesh_setBlendFuncP9lua_State']
- native: the game's own C++ added (ActionShake.cpp ActionShake.h AppDelegate.cpp AppDelegate.h lua_cocos2dx_extend_manual.cpp lua_cocos2dx_extend_manual.hpp lua_extension.cpp lua_extension.h lua_module_register.h ); Live2D left out
#define BT_SHUFFLE(x,y,z,w) (((w)<<6 | (z)<<4 | (y)<<2 | (x)) & 0xff)
133:        iconv_close((iconv_t)_iconv);
243:            iconv((iconv_t)_iconv, (char**)&pin, &inLen, &pout, &outLen);
- main.lua log line added: 1
- probe CCDirector.cpp 1
- probe CCDirectorCaller-ios.mm 1
- probe CCDirectorCaller-ios.mm 1
- probe CCDirectorCaller-ios.mm 1
- probe CCES2Renderer-ios.m 1
- probe AppDelegate.cpp 1
Command line invocation:
    /Applications/Xcode-26.6.app/Contents/Developer/usr/bin/xcodebuild -list -project proj/frameworks/runtime-src/proj.ios_mac/HelloLua.xcodeproj

Information about project "HelloLua":
    Targets:
        HelloLua-mobile
        HelloLua-desktop

    Build Configurations:
        Debug
        Release

    If no build configuration is specified and -scheme is not passed then "Release" is used.

    Schemes:
        HelloLua-desktop
        HelloLua-mobile
        libcocos2d iOS
        libcocos2d Mac
        libcocos2d tvOS
        libluacocos2d iOS
        libluacocos2d Mac
        libluacocos2d tvOS
        libsimulator iOS
        libsimulator Mac

