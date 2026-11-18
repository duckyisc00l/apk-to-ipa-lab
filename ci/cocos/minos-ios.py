# Turn LC_VERSION_MIN_MACOSX (0x24) into LC_VERSION_MIN_IPHONEOS (0x25, iOS 12.0) in 64-bit Mach-O object files, in place.
# Same size, so it works where vtool says "not enough space to hold load commands". On x86_64 the linker reads it as the iOS simulator.
import struct, sys
n = 0
for p in sys.argv[1:]:
    b = bytearray(open(p, 'rb').read())
    if struct.unpack_from('<I', b, 0)[0] != 0xfeedfacf: continue
    ncmds = struct.unpack_from('<I', b, 16)[0]; off = 32; hit = False
    for _ in range(ncmds):
        cmd, size = struct.unpack_from('<II', b, off)
        if cmd == 0x24:
            struct.pack_into('<IIII', b, off, 0x25, 16, 0x000C0000, 0x000C0000); hit = True
        off += size
    if hit: open(p, 'wb').write(b); n += 1
print(n)
