"""Pull the .NET assemblies (DLLs) out of a Xamarin / .NET MAUI APK.

Usage: python3 ci/dotnet/unpack.py <app.apk or unpacked folder> <out dir> [abi, default arm64-v8a]

Handles every layout .NET for Android has used (pick by what the APK has):
- assemblies/*.dll                       Xamarin / .NET 6-8 with the store turned off (may be XALZ-compressed)
- assemblies/assemblies[.<abi>].blob     .NET 6-8 assembly store, format v1 ("XABA" version 1),
  + assemblies/assemblies.manifest       names come from this text file
- lib/<abi>/libassemblies.<abi>.blob.so  .NET 9+ assembly store, format v2, wrapped in an ELF library;
                                          names are inside the store
- lib/<abi>/lib_<Name>.dll.so            .NET 9+ with the store off: one ELF-wrapped DLL per library
Compressed entries start with "XALZ" + descriptor index (u32) + real size (u32), then one LZ4 block.
Writes <out>/<Name>.dll (+ .pdb if shipped) and <out>/assemblies.txt (name, size, version, kind).
Run with python3 -I; needs the lz4 package (pip install lz4).
"""
import os, re, struct, sys, zipfile

try:
    import lz4.block
except ImportError:  # pragma: no cover
    sys.exit("pip install lz4 first")


def unxalz(b):
    if b[:4] == b"XALZ":
        size = struct.unpack_from("<I", b, 8)[0]
        return lz4.block.decompress(b[12:], uncompressed_size=size)
    return b


def pe_name(b):
    """Assembly name from the PE's own metadata (Assembly table), so files get their real names."""
    try:
        import dnfile  # optional, better
        pe = dnfile.dnPE(data=b)
        return str(pe.net.mdtables.Assembly.rows[0].Name)
    except Exception:
        return None


def payload(b):
    """ELF-wrapped data (.NET 9 .so files): the payload is the first XABA / XALZ / MZ in the file."""
    if b[:4] != b"\x7fELF":
        return b
    # section "payload": parse ELF64 section headers
    try:
        shoff, = struct.unpack_from("<Q", b, 0x28)
        shentsize, shnum, shstrndx = struct.unpack_from("<HHH", b, 0x3A)
        secs = [struct.unpack_from("<IIQQQQIIQQ", b, shoff + i * shentsize) for i in range(shnum)]
        stro = secs[shstrndx][4]
        for s in secs:
            name = b[stro + s[0]:b.index(b"\0", stro + s[0])]
            if name == b"payload":
                return b[s[4]:s[4] + s[5]]
    except Exception:
        pass
    m = re.search(rb"XABA|XALZ|MZ\x90\x00", b)
    return b[m.start():] if m else b


def store_v1(blob, manifest_lines, store_id_names):
    magic, ver, local_n, global_n, store_id = struct.unpack_from("<5I", blob, 0)
    out = []
    for i in range(local_n):
        do, ds, dbo, dbs, co, cs = struct.unpack_from("<6I", blob, 20 + i * 24)
        name = store_id_names.get((store_id, i))
        out.append((name, blob[do:do + ds], blob[dbo:dbo + dbs] if dbs else b""))
    return out


def store_v2(blob):
    magic, ver, n, index_n, index_size = struct.unpack_from("<5I", blob, 0)
    # the index is index_n entries of (hash, descriptor index, ignore flag); the size field and the entry
    # width have changed between releases, so try each layout and keep the one whose descriptors make sense
    for idx_bytes in (index_size, index_n * 13, index_n * 12, index_n * 16, index_n * 9, index_n * 8, index_size * index_n):
        p = 20 + idx_bytes
        try:
            descs = [struct.unpack_from("<7I", blob, p + i * 28) for i in range(n)]
            p2 = p + n * 28
            names = []
            for i in range(n):
                ln, = struct.unpack_from("<I", blob, p2)
                if ln > 512:
                    raise ValueError
                names.append(blob[p2 + 4:p2 + 4 + ln].decode("utf-8"))
                p2 += 4 + ln
            if all(d[1] + d[2] <= len(blob) and blob[d[1]:d[1] + 2] in (b"MZ", b"XA") for d in descs):
                break
        except Exception:
            continue
    else:
        sys.exit(f"store v2: could not read the index (n={n}, index_n={index_n}, index_size={index_size})")
    out = []
    for (mi, do, ds, dbo, dbs, co, cs), name in zip(descs, names):
        out.append((name, blob[do:do + ds], blob[dbo:dbo + dbs] if dbs else b""))
    return out


def main():
    src, outd = sys.argv[1], sys.argv[2]
    abi = sys.argv[3] if len(sys.argv) > 3 else "arm64-v8a"
    abi_u = abi.replace("-", "_")
    os.makedirs(outd, exist_ok=True)
    if os.path.isdir(src):
        files = {os.path.relpath(os.path.join(r, f), src).replace(os.sep, "/"): os.path.join(r, f)
                 for r, _, fs in os.walk(src) for f in fs}
        read = lambda k: open(files[k], "rb").read()
        names = list(files)
    else:
        z = zipfile.ZipFile(src)
        names = z.namelist()
        read = z.read
    entries, kind = [], ""
    # v1 store
    v1 = [n for n in names if re.fullmatch(r"assemblies/assemblies(\.[a-z0-9_-]+)?\.blob", n)]
    if v1:
        kind = "store v1"
        manifest = read("assemblies/assemblies.manifest").decode() if "assemblies/assemblies.manifest" in names else ""
        ids = {}
        for line in manifest.splitlines()[1:]:
            parts = line.split()
            if len(parts) >= 5:  # Hash32 Hash64 BlobID BlobIdx Name
                ids[(int(parts[2]), int(parts[3]))] = parts[4]
        for n in v1:
            if "." in n[len("assemblies/assemblies"):-5] and abi_u not in n and abi not in n:
                continue  # another ABI's store
            entries += store_v1(read(n), manifest, ids)
    # v2 store (.NET 9+)
    v2 = [n for n in names if re.fullmatch(rf"lib/{abi}/libassemblies\.[a-z0-9_-]+\.blob\.so", n)]
    for n in v2:
        kind = "store v2"
        entries += store_v2(payload(read(n)))
    # loose
    if not entries:
        for n in names:
            m = re.fullmatch(r"assemblies/(?:[a-z0-9_-]+/)?([^/]+\.dll)", n) or re.fullmatch(rf"lib/{abi}/lib_([^/]+\.dll)\.so", n)
            if m and (abi in n or abi_u in n or "/" not in n[len("assemblies/"):] or n.startswith("lib/")):
                kind = kind or "loose"
                entries.append((m.group(1)[:-4], payload(read(n)), b""))
            elif re.fullmatch(r"assemblies/(?:[a-z0-9_-]+/)?[^/]+\.pdb", n):
                pass
    rows = []
    for name, data, dbg in entries:
        data = unxalz(data)
        if data[:2] != b"MZ":
            rows.append(f"{name}\t{len(data)}\tNOT A PE ({data[:4]!r})")
            continue
        real = pe_name(data) or name or f"unknown_{len(rows)}"
        real = re.sub(r"\.dll$", "", real)
        # satellite resource assemblies share a name; keep them in culture folders when the store gave a path
        path = os.path.join(outd, (name if name and "/" in name else real) + ".dll")
        os.makedirs(os.path.dirname(path), exist_ok=True)
        open(path, "wb").write(data)
        if dbg:
            open(path[:-4] + ".pdb", "wb").write(unxalz(dbg))
        rows.append(f"{real}\t{len(data)}")
    open(os.path.join(outd, "assemblies.txt"), "w").write(f"# {kind}, {len(entries)} entries\n" + "\n".join(rows) + "\n")
    print(f"{kind}: {len(entries)} assemblies -> {outd}")


if __name__ == "__main__":
    main()
