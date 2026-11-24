dex2jar:        5 dex files -> 18385 classes
libGDX version: 1.14.2; MobiVM 2.3.24
Android libraries: libgdx.so 
core: kept 16898 of 18385 classes; main listener com/unciv/app/AndroidGame; constructors ['(Landroid/app/Activity;)V']
Java services from the APK: 9 classes
orientation from manifest: 'none' -> landscape=true portrait=true
version: 5.0.2 (1287)
listener: com/unciv/UncivGame constructor ()V (candidates ['com/unciv/app/AndroidGame', 'com/unciv/UncivGame'])
launcher: new com.unciv.UncivGame()
hook: hook.java compiled in
launcher compiled
compat: 2 missing methods rewritten, 20 without helper, 67 classes absent from the rt
## Java calls MobiVM's runtime lacks (rewritten where lab.Compat has a helper)
rewritten to helpers: 5 calls, 2 methods
- fixed  java/util/Locale.forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;  x2
- fixed  java/util/Locale.toLanguageTag()Ljava/lang/String;  x3
- NO HELPER  java/io/File.toPath()Ljava/nio/file/Path;  x2
- NO HELPER  java/nio/channels/DatagramChannel.bind(Ljava/net/SocketAddress;)Ljava/nio/channels/DatagramChannel;  x1
- NO HELPER  java/nio/channels/DatagramChannel.getLocalAddress()Ljava/net/SocketAddress;  x1
- NO HELPER  java/nio/channels/DatagramChannel.getRemoteAddress()Ljava/net/SocketAddress;  x1
- NO HELPER  java/nio/channels/DatagramChannel.setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/DatagramChannel;  x1
- NO HELPER  java/nio/channels/ServerSocketChannel.bind(Ljava/net/SocketAddress;I)Ljava/nio/channels/ServerSocketChannel;  x1
- NO HELPER  java/nio/channels/ServerSocketChannel.getLocalAddress()Ljava/net/SocketAddress;  x1
- NO HELPER  java/nio/channels/ServerSocketChannel.setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/ServerSocketChannel;  x1
- NO HELPER  java/nio/channels/SocketChannel.getLocalAddress()Ljava/net/SocketAddress;  x1
- NO HELPER  java/nio/channels/SocketChannel.getRemoteAddress()Ljava/net/SocketAddress;  x1
- NO HELPER  java/nio/channels/SocketChannel.setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/SocketChannel;  x1
- NO HELPER  java/nio/channels/SocketChannel.shutdownInput()Ljava/nio/channels/SocketChannel;  x1
- NO HELPER  java/nio/channels/SocketChannel.shutdownOutput()Ljava/nio/channels/SocketChannel;  x1
- NO HELPER  java/security/SecureRandom.getInstanceStrong()Ljava/security/SecureRandom;  x1
- NO HELPER  java/util/Locale.getDefault(Ljava/util/Locale$Category;)Ljava/util/Locale;  x1
- NO HELPER  java/util/Locale.getScript()Ljava/lang/String;  x3
- NO HELPER  java/util/Locale.getUnicodeLocaleType(Ljava/lang/String;)Ljava/lang/String;  x1
- NO HELPER  java/util/regex/Matcher.end(Ljava/lang/String;)I  x1
- NO HELPER  java/util/regex/Matcher.group(Ljava/lang/String;)Ljava/lang/String;  x1
- NO HELPER  java/util/regex/Matcher.start(Ljava/lang/String;)I  x1
- class not in rt  java/lang/ClassValue  x3
- class not in rt  java/lang/instrument/Instrumentation  x1
- class not in rt  java/lang/management/GarbageCollectorMXBean  x1
- class not in rt  java/lang/management/ManagementFactory  x2
- class not in rt  java/lang/management/RuntimeMXBean  x1
- class not in rt  java/net/StandardProtocolFamily  x1
- class not in rt  java/nio/channels/SeekableByteChannel  x2
- class not in rt  java/nio/file/DirectoryStream  x1
- class not in rt  java/nio/file/FileSystem  x2
- class not in rt  java/nio/file/FileSystemException  x4
- class not in rt  java/nio/file/FileSystemLoopException  x1
- class not in rt  java/nio/file/Files  x52
- class not in rt  java/nio/file/InvalidPathException  x1
- class not in rt  java/nio/file/NoSuchFileException  x1
- class not in rt  java/nio/file/Path  x17
- class not in rt  java/nio/file/Paths  x3
force-linked game packages: <pattern>com.unciv.**</pattern><pattern>kotlin.reflect.**</pattern><pattern>io.ktor.**</pattern><pattern>kotlinx.coroutines.**</pattern><pattern>j$.util.**</pattern><pattern>kotlinx.serialization.**</pattern>
simulator build exit 0 in 557 s
Compiling com.android.org.conscrypt.AlertException (ios x86_64-simulator release)
Compiling com.android.org.conscrypt.EndOfBufferException (ios x86_64-simulator release)
Compiling com.android.org.conscrypt.EndOfSourceException (ios x86_64-simulator release)
Compiling com.android.org.conscrypt.OpenSSLX509CertificateFactory$ParsingException (ios x86_64-simulator release)
Compiling com.android.org.conscrypt.PinEntryException (ios x86_64-simulator release)
Compiling com.android.org.conscrypt.PinManagerException (ios x86_64-simulator release)
Warning: android.os.flagging.AconfigStorageReadException is a phantom class!
Warning: android.os.RemoteException is a phantom class!
Compiling com.unciv.logic.MissingModsException (ios x86_64-simulator release)
Compiling com.unciv.logic.MissingModsException$Companion (ios x86_64-simulator release)
Compiling com.unciv.logic.MissingModsException$Companion$$ExternalSyntheticLambda0 (ios x86_64-simulator release)
Compiling com.unciv.logic.MissingNationException (ios x86_64-simulator release)
Compiling com.unciv.logic.UncivShowableException (ios x86_64-simulator release)
Compiling com.unciv.logic.city.CityConstructions$getConstruction$NotBuildingOrUnitException (ios x86_64-simulator release)
Compiling com.unciv.logic.city.managers.CityExpansionManager$buyTile$NotEnoughGoldToBuyTileException (ios x86_64-simulator release)
Compiling com.unciv.logic.city.managers.CityExpansionManager$buyTile$TriedToBuyNonContiguousTileException (ios x86_64-simulator release)
Compiling com.unciv.logic.files.IncompatibleGameInfoVersionException (ios x86_64-simulator release)
Compiling com.unciv.logic.map.mapunit.movement.UnitMovement$UnreachableDestinationException (ios x86_64-simulator release)
Compiling com.unciv.logic.multiplayer.apiv2.ApiException (ios x86_64-simulator release)
Compiling com.unciv.logic.multiplayer.apiv2.UncivNetworkException (ios x86_64-simulator release)
Compiling com.unciv.logic.multiplayer.chat.ChatRestartException (ios x86_64-simulator release)
Compiling com.unciv.logic.multiplayer.chat.ChatStopException (ios x86_64-simulator release)
Compiling com.unciv.logic.multiplayer.storage.FileStorageConflictException (ios x86_64-simulator release)
Compiling com.unciv.logic.multiplayer.storage.MultiplayerAuthException (ios x86_64-simulator release)
Compiling com.unciv.logic.multiplayer.storage.MultiplayerFileNotFoundException (ios x86_64-simulator release)
Compiling com.unciv.logic.multiplayer.storage.SimpleHttp$HttpStatusException (ios x86_64-simulator release)
Compiling com.unciv.ui.screens.devconsole.ConsoleErrorException (ios x86_64-simulator release)
Compiling com.unciv.ui.screens.devconsole.ConsoleHintException (ios x86_64-simulator release)
Compiling com.unciv.ui.screens.devconsole.ConsoleUniqueErrorException (ios x86_64-simulator release)
Compiling io.ktor.client.call.DoubleReceiveException (ios x86_64-simulator release)
iPhone build exit 0 in 380 s
Warning: android.os.flagging.AconfigStorageReadException is a phantom class!
Warning: android.os.RemoteException is a phantom class!
Warning: java.nio.file.FileSystemException is a phantom class!
Warning: java.nio.file.FileSystemLoopException is a phantom class!
Warning: java.nio.file.InvalidPathException is a phantom class!
Warning: java.util.concurrent.CompletionException is a phantom class!
Warning: java.nio.file.NoSuchFileException is a phantom class!
Warning: android.content.pm.PackageManager$NameNotFoundException is a phantom class!
Warning: android.content.res.Resources$NotFoundException is a phantom class!
Warning: java.nio.file.FileAlreadyExistsException is a phantom class!
Warning: android.database.sqlite.SQLiteDatabaseCorruptException is a phantom class!
Warning: android.database.sqlite.SQLiteCantOpenDatabaseException is a phantom class!
Warning: android.database.sqlite.SQLiteException is a phantom class!
Warning: android.database.sqlite.SQLiteDatabaseLockedException is a phantom class!
Warning: android.database.sqlite.SQLiteAccessPermException is a phantom class!
Warning: android.database.sqlite.SQLiteTableLockedException is a phantom class!
Warning: android.database.sqlite.SQLiteConstraintException is a phantom class!
Warning: android.database.sqlite.SQLiteFullException is a phantom class!
Warning: android.database.sqlite.SQLiteDiskIOException is a phantom class!
Warning: android.database.SQLException is a phantom class!
Warning: android.system.ErrnoException is a phantom class!
total 105056
drwxr-xr-x   5 runner  staff       160 Nov 24 00:48 .
drwxr-xr-x  13 runner  staff       416 Nov 24 00:42 ..
drwxrwxrwx  41 runner  staff      1312 Nov 24 00:48 Unciv.app
drwxrwxrwx   3 runner  staff        96 Nov 24 00:48 Unciv.app.dSYM
-rw-rw-rw-   1 runner  staff  52998667 Nov 24 00:48 Unciv.ipa
206M	/Users/runner/work/apk-to-ipa-lab/apk-to-ipa-lab/out/sim-app/Unciv.app
-rw-rw-rw-  1 runner  staff  52998667 Nov 24 00:48 out/ipa/Unciv.ipa
206458908                     240 files
