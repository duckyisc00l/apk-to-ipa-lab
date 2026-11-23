"""Mark arm64 Mach-O object files (from an old iPhone-only prebuilt library) as built for the iPhone Simulator, in place.
Old objects carry LC_VERSION_MIN_IPHONEOS (16 bytes), which on arm64 means "iPhone", and the simulator link refuses them.
The simulator needs LC_BUILD_VERSION platform 7 (24 bytes), and vtool says "not enough space". So:
  1. drop LC_LINKER_OPTIMIZATION_HINT (16 bytes, only a link-time speed hint) to make room; or
  2. if there is none, move the whole file body 16 bytes later and fix every file offset.
Prints how many objects were changed.   Usage: python3 -I sim-arm64.py file.o ...
"""
import struct, sys
SEG, SYMTAB, DYSYMTAB, VMIN_IOS, BUILD = 0x19, 0x2, 0xB, 0x25, 0x32
LINKEDIT = {0x1D, 0x1E, 0x26, 0x29, 0x2B, 0x2E, 0x80000033}
def fix(b):
    magic, cpu, sub, ft, ncmds, scmds = struct.unpack_from('<IIIIII', b, 0)
    if magic != 0xFEEDFACF or cpu != 0x0100000C or ft != 1: return None
    cmds = []; off = 32
    for _ in range(ncmds):
        cmd, size = struct.unpack_from('<II', b, off); cmds.append([cmd, bytes(b[off:off+size])]); off += size
    for c in cmds:   # already a build-version command: platform 2 (iPhone) -> 7 (simulator), same size
        if c[0] == BUILD:
            plat = struct.unpack_from('<I', c[1], 8)[0]
            if plat == 7: return None
            c[1] = c[1][:8] + struct.pack('<I', 7) + c[1][12:]; return rebuild(b, cmds, 0, 0)
    vi = next((i for i, c in enumerate(cmds) if c[0] == VMIN_IOS), None)
    if vi is None: return None
    ver, sdk = struct.unpack_from('<II', cmds[vi][1], 8)
    cmds[vi] = [BUILD, struct.pack('<IIIIIIII', BUILD, 24, 7, ver, sdk, 0, 0, 0)[:24]]
    li = next((i for i, c in enumerate(cmds) if c[0] == 0x2E), None)
    if li is not None:
        del cmds[li]; return rebuild(b, cmds, 0, 0)   # 16 bytes out, 8 in: 8 bytes of slack
    return rebuild(b, cmds, 16, 0)
def rebuild(b, cmds, shift, _):
    out = []
    for cmd, d in cmds:
        d = bytearray(d)
        if shift:
            def mv(o):
                v = struct.unpack_from('<I', d, o)[0]
                if v: struct.pack_into('<I', d, o, v + shift)
            if cmd == SEG:
                mv(40)  # fileoff is 8 bytes; low half is enough for a .o
                for s in range(nsect := struct.unpack_from('<I', d, 64)[0]):
                    so = 72 + 80 * s
                    if struct.unpack_from('<I', d, so + 48)[0]: mv(so + 48)
                    if struct.unpack_from('<I', d, so + 60)[0]: mv(so + 56)
            elif cmd == SYMTAB: mv(8); mv(16)
            elif cmd == DYSYMTAB:
                # tocoff 32+? layout: ilocalsym..: offsets at 32 (tocoff), 40 (modtaboff), 48 (extrefsymoff), 56 (indirectsymoff), 64 (extreloff), 72 (locreloff)
                for o in (32, 40, 48, 56, 64, 72): mv(o)
            elif cmd in LINKEDIT: mv(8)
        out.append(bytes(d))
    body_old = 32 + sum(len(d) for _, d in cmds)  # new size of the commands
    new = bytearray(b[:32]); struct.pack_into('<II', new, 16, len(cmds), body_old - 32)
    for d in out: new += d
    data_start = 32 + struct.unpack_from('<I', b, 20)[0]
    # keep every byte after the old commands at its old offset (or +shift), zero-filling the slack
    target = data_start + shift
    assert len(new) <= target, 'no room'
    new += b'\0' * (target - len(new)); new += b[data_start:]
    return bytes(new)
n = 0
for p in sys.argv[1:]:
    b = open(p, 'rb').read()
    try: r = fix(bytearray(b))
    except Exception as e: print('skip', p, e, file=sys.stderr); continue
    if r: open(p, 'wb').write(r); n += 1
print(n)
