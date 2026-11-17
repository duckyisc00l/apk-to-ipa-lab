// Unreal level -> files Godot can use (skill step X4).
// Usage: ue2godot <paks dir> <EGame, e.g. GAME_UE4_16> <out dir> [content prefix, e.g. MyProject2/Content]
// Writes <out>/meshes/<path>.glb (static meshes with their textures), <out>/levels/<map>.json (every mesh
// placed in the level with its world position/rotation/scale, already in glTF/Godot axes and metres),
// and <out>/summary.txt. Coordinates go through the same Gltf.SwapYZ the mesh writer uses, so they match.
using System.Text.Json;
using Serilog;
using CUE4Parse.Compression;
using CUE4Parse.FileProvider;
using CUE4Parse.UE4.Assets.Exports;
using CUE4Parse.UE4.Assets.Exports.StaticMesh;
using CUE4Parse.UE4.Objects.Core.Math;
using CUE4Parse.UE4.Objects.Engine;
using CUE4Parse.UE4.Versions;
using CUE4Parse_Conversion;
using CUE4Parse_Conversion.Dto;
using CUE4Parse_Conversion.Options;
using CUE4Parse_Conversion.Writers.Gltf;

var (paks, gameName, outDir) = (args[0], args[1], Path.GetFullPath(args[2]));
var prefix = args.Length > 3 ? args[3] : null;
Serilog.Log.Logger = new Serilog.LoggerConfiguration().MinimumLevel.Warning().WriteTo.Console().CreateLogger();
CUE4Parse.CUE4ParseLog.UseLogger(Serilog.Log.Logger);
await ZlibHelper.InitializeAsync();
try { await OodleHelper.InitializeAsync(); } catch (Exception e) { Console.WriteLine("oodle: " + e.Message); }   // UE5 IoStore is usually Oodle-compressed
var provider = new DefaultFileProvider(paks, SearchOption.AllDirectories,
    new VersionContainer(Enum.Parse<EGame>(gameName)), StringComparer.OrdinalIgnoreCase);
// UE5 cooks properties "unversioned": reading them needs the game's type mappings (.usmap or .jmap) in MAPPINGS
if (Environment.GetEnvironmentVariable("MAPPINGS") is { Length: > 0 } mp)
    provider.MappingsContainer = mp.EndsWith(".jmap") ? new CUE4Parse.MappingsProvider.Jmap.JmapTypeMappingsProvider(mp)
        : new CUE4Parse.MappingsProvider.Usmap.FileUsmapTypeMappingsProvider(mp);
provider.Initialize();
provider.Mount();
provider.PostMount();
provider.LoadVirtualPaths();
var summary = new List<string> { $"files: {provider.Files.Count}" };
// what got mounted (IoStore .utoc needs its matching .ucas and global.utoc; an encrypted one stays unloaded)
foreach (var v in provider.MountedVfs) summary.Add($"mounted {v.Name}: {v.FileCount} files, encrypted index {v.IsEncrypted}");
foreach (var v in provider.UnloadedVfs) summary.Add($"NOT mounted {v.Name}: encrypted index {v.IsEncrypted}");
summary.Add("by type: " + string.Join(" ", provider.Files.Keys.GroupBy(k => Path.GetExtension(k).ToLowerInvariant()).OrderByDescending(g => g.Count()).Take(12).Select(g => $"{g.Key}={g.Count()}")));
summary.Add("top folders: " + string.Join(" ", provider.Files.Keys.GroupBy(k => string.Join('/', k.Split('/').Take(3))).OrderByDescending(g => g.Count()).Take(10).Select(g => $"{g.Key}={g.Count()}")));

bool IsGame(string p) => prefix is null
    ? !p.StartsWith("Engine/", StringComparison.OrdinalIgnoreCase)
    : p.StartsWith(prefix, StringComparison.OrdinalIgnoreCase);
var maps = provider.Files.Keys.Where(k => k.EndsWith(".umap", StringComparison.OrdinalIgnoreCase) && IsGame(k)).OrderBy(k => k).ToList();
summary.Add($"maps: {maps.Count}: {string.Join(", ", maps.Take(40))}");
// UE5 World Partition: a cooked map's content sits in cells <Map>/_Generated_/<cell>.umap; put them into <Map>.json
static string Owner(string m) { var i = m.IndexOf("/_Generated_/", StringComparison.OrdinalIgnoreCase); return i < 0 ? m : m[..i] + ".umap"; }
var levelOut = new Dictionary<string, (List<object> placed, List<object> lights, int actors, int cells)>();

var meshes = new Dictionary<string, UStaticMesh>(StringComparer.OrdinalIgnoreCase);
Directory.CreateDirectory(Path.Combine(outDir, "levels"));
foreach (var map in maps)
{
    var objPath = map[..^5] + "." + Path.GetFileNameWithoutExtension(map);
    UWorld world;
    try { world = provider.LoadPackageObject<UWorld>(objPath); }
    catch (Exception e)
    {
        summary.Add($"{map}: can't load ({e.Message})");
        if (e is CUE4Parse.UE4.Exceptions.MappingException && summary.Count(x => x.StartsWith("  classes")) < 3)
            try
            {
                var pkg = (CUE4Parse.UE4.Assets.IoPackage)provider.LoadPackage(map);
                summary.Add("  classes in it: " + string.Join(" ", pkg.ExportMap.Select(x => pkg.ResolveObjectIndex(x.ClassIndex)?.Name.Text ?? "?").GroupBy(n => n).OrderByDescending(g => g.Count()).Take(25).Select(g => $"{g.Key}={g.Count()}")));
            }
            catch (Exception e2) { summary.Add("  classes: " + e2.Message); }
        continue;
    }
    WorldDto dto;
    try { dto = new WorldDto(world); }
    catch (Exception e) { summary.Add($"{map}: can't read level ({e.Message})"); continue; }
    var key = Owner(map);
    if (!levelOut.TryGetValue(key, out var lo)) lo = levelOut[key] = (new List<object>(), new List<object>(), 0, 0);
    var placed = lo.placed;
    var lights = lo.lights;
    levelOut[key] = (placed, lights, lo.actors + dto.Actors.Count, lo.cells + (key == map ? 0 : 1));
    void Walk(SceneComponentDto c, FTransform parent)
    {
        var w = c.Transform * parent;   // UE: child relative * parent world
        object Xf() => new
        {
            pos = V(Gltf.SwapYZ(w.Translation * 0.01f)),
            rot = Q(Gltf.SwapYZ(w.Rotation)),
            scale = V(Gltf.SwapYZ(w.Scale3D)),
        };
        switch (c)
        {
            case InstancedStaticMeshComponentDto ism when ism.MeshPtr.TryLoad<UStaticMesh>(out var im):
                meshes[im.GetPathName()] = im;
                foreach (var t in ism.Transforms)
                {
                    var iw = t * w;
                    placed.Add(new { name = c.Name, mesh = MeshFile(im), pos = V(Gltf.SwapYZ(iw.Translation * 0.01f)), rot = Q(Gltf.SwapYZ(iw.Rotation)), scale = V(Gltf.SwapYZ(iw.Scale3D)) });
                }
                break;
            case StaticMeshComponentDto smc when smc.MeshPtr.TryLoad<UStaticMesh>(out var sm):
                meshes[sm.GetPathName()] = sm;
                placed.Add(new { name = c.Name, mesh = MeshFile(sm), xf = Xf() });
                break;
            case LightComponentBaseDto:
                lights.Add(new { name = c.Name, kind = c.GetType().Name.Replace("ComponentDto", ""), xf = Xf() });
                break;
        }
        foreach (var child in c.Children) Walk(child, w);
        foreach (var a in c.AttachedActors) if (a.RootComponent is { } r) Walk(r, w);
    }
    var kinds = new Dictionary<string, int>();
    void Count(SceneComponentDto c) { var k = c.GetType().Name; kinds[k] = kinds.GetValueOrDefault(k) + 1; foreach (var ch in c.Children) Count(ch); }
    foreach (var actor in dto.Actors)
        if (actor.RootComponent is { } root) { Walk(root, FTransform.Identity); Count(root); }
    // sub-levels streamed in by this map (UE4-style level streaming)
    foreach (var sl in dto.StreamingLevels)
    {
        try { foreach (var a in new WorldDto(sl.World).Actors) if (a.RootComponent is { } r) Walk(r, FTransform.Identity); }
        catch (Exception e) { summary.Add($"  streaming level {sl.World.Name}: {e.Message}"); }
    }
    summary.Add($"{map}: {dto.Actors.Count} actors, {dto.StreamingLevels.Count} streaming levels, placed so far for {Path.GetFileName(key)}: {placed.Count} meshes, {lights.Count} lights; components {string.Join(" ", kinds.OrderByDescending(k => k.Value).Take(8).Select(k => $"{k.Key.Replace("ComponentDto", "")}={k.Value}"))}");
}

// file flags of a working mesh vs. a failing one (cooked / editor data stripped / version)
foreach (var m in meshes.Values.OrderBy(m => m.RenderData?.LODs is null).Take(1).Concat(meshes.Values.Where(m => m.RenderData?.LODs is null).Take(1)))
{
    try
    {
        var pkg = provider.LoadPackage(m.GetPathName().Split('.')[0]) as CUE4Parse.UE4.Assets.Package;
        summary.Add($"{(m.RenderData?.LODs is null ? "FAIL" : "OK  ")} {m.GetPathName()}: flags={pkg?.Summary.PackageFlags} ue4ver={pkg?.Summary.FileVersionUE.FileVersionUE4} licensee={pkg?.Summary.FileVersionLicenseeUE} bCooked={m.bCooked} engine={pkg?.Summary.SavedByEngineVersion}");
    }
    catch (Exception e) { summary.Add("flags read failed: " + e.Message); }
}

// why a mesh has no render data: dump the first one that doesn't
foreach (var m in meshes.Values.Where(m => m.RenderData?.LODs is null).Take(1))
{
    summary.Add($"no LODs in {m.GetPathName()}: RenderData={(m.RenderData is null ? "null" : "set")}");
    try { summary.Add(Newtonsoft.Json.JsonConvert.SerializeObject(m, Newtonsoft.Json.Formatting.None)[..Math.Min(1500, Newtonsoft.Json.JsonConvert.SerializeObject(m).Length)]); }
    catch (Exception e) { summary.Add("dump failed: " + e.Message); }
}

// export every used mesh as glTF (textures decoded, ETC1 included)
var session = new ExportSession { MaxDegreeOfParallelism = Environment.ProcessorCount };
foreach (var m in meshes.Values) session.Add(m);
var results = await session.RunAsync(Path.Combine(outDir, "meshes"), new ExportOptions(meshFormat: EMeshFormat.Gltf2, textureFormat: ETextureFormat.Png));
summary.Add($"meshes exported: {results.Count(r => r.Success)} of {meshes.Count}");
foreach (var r in results.Where(r => !r.Success).Take(15)) summary.Add($"  failed {r.ObjectPath}: {r.Error?.Message}");
foreach (var r in results.Where(r => r.Success).Take(5)) summary.Add($"  ok {r.ObjectPath} -> {string.Join(", ", r.DiskFilePaths ?? [])}");
var meshDir = Path.Combine(outDir, "meshes");
var written = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
foreach (var r in results.Where(r => r.Success))
    if (r.DiskFilePaths?.FirstOrDefault(f => f.EndsWith(".glb") || f.EndsWith(".gltf")) is { } f)
        written[MeshFileOf(r.ObjectPath)] = "/" + Path.GetRelativePath(meshDir, f).Replace('\\', '/');
foreach (var (map, lo) in levelOut)
{
    var fixedMeshes = lo.placed.Select(o => { var d = JsonSerializer.SerializeToNode(o)!.AsObject(); var m = (string)d["mesh"]!; if (written.TryGetValue(m, out var w)) d["mesh"] = w; return d; }).ToList();
    await File.WriteAllTextAsync(Path.Combine(outDir, "levels", Path.GetFileNameWithoutExtension(map) + ".json"),
        JsonSerializer.Serialize(new { map, actors = lo.actors, cells = lo.cells, meshes = fixedMeshes, lights = lo.lights }, new JsonSerializerOptions { WriteIndented = true }));
    summary.Add($"level {map}: {lo.actors} actors in {lo.cells} World Partition cells + main, {lo.placed.Count} placed meshes, {lo.lights.Count} lights");
}
// every texture of the game as PNG (CUE4Parse decodes Android's ETC1/ETC2; UE Viewer writes those as empty .tga)
var texSession = new ExportSession { MaxDegreeOfParallelism = Environment.ProcessorCount };
int texCount = 0;
foreach (var file in provider.Files.Keys.Where(k => k.EndsWith(".uasset", StringComparison.OrdinalIgnoreCase) && IsGame(k)))
{
    try
    {
        foreach (var e in provider.LoadPackage(file).GetExports())
            if (e is CUE4Parse.UE4.Assets.Exports.Texture.UTexture2D t) { texSession.Add(t); texCount++; }
    }
    catch { }
}
var texResults = await texSession.RunAsync(Path.Combine(outDir, "tex"), new ExportOptions(textureFormat: ETextureFormat.Png));
summary.Add($"textures exported: {texResults.Count(r => r.Success)} of {texCount}");
foreach (var r in texResults.Where(r => !r.Success).Take(5)) summary.Add($"  failed {r.ObjectPath}: {r.Error?.Message}");

// blueprint logic (step X3) as pseudo-C++ with CUE4Parse's own decompiler: reads cooked IoStore packages,
// which KismetKompiler (UAssetAPI, legacy .uasset only) can't
Directory.CreateDirectory(Path.Combine(outDir, "bp"));
int bpCount = 0, bpFail = 0;
foreach (var file in provider.Files.Keys.Where(k => k.EndsWith(".uasset", StringComparison.OrdinalIgnoreCase) && IsGame(k)))
{
    try
    {
        foreach (var e in provider.LoadPackage(file).GetExports())
            if (e is CUE4Parse.UE4.Objects.Engine.UBlueprintGeneratedClass bpc)
            {
                try { await File.WriteAllTextAsync(Path.Combine(outDir, "bp", bpc.Name + ".cpp"), bpc.DecompileBlueprintToPseudo()); bpCount++; }
                catch (Exception ex) { bpFail++; if (bpFail <= 5) summary.Add($"  bp {bpc.Name} failed: {ex.Message}"); }
            }
    }
    catch { }
}
summary.Add($"blueprints decompiled: {bpCount}, failed {bpFail}");
await File.WriteAllLinesAsync(Path.Combine(outDir, "summary.txt"), summary);
Console.WriteLine(string.Join("\n", summary));

// the exporter writes <out>/meshes/<package path without .uasset>.glb
static string MeshFile(UStaticMesh m) => MeshFileOf(m.GetPathName());
static string MeshFileOf(string objectPath) => objectPath.Split('.')[0] + ".glb";
static float[] V(FVector v) => [v.X, v.Y, v.Z];
static float[] Q(FQuat q) => [q.X, q.Y, q.Z, q.W];
