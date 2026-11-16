// Unreal level -> files Godot can use (skill step X4).
// Usage: ue2godot <paks dir> <EGame, e.g. GAME_UE4_16> <out dir> [content prefix, e.g. MyProject2/Content]
// Writes <out>/meshes/<path>.glb (static meshes with their textures), <out>/levels/<map>.json (every mesh
// placed in the level with its world position/rotation/scale, already in glTF/Godot axes and metres),
// and <out>/summary.txt. Coordinates go through the same Gltf.SwapYZ the mesh writer uses, so they match.
using System.Text.Json;
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
await ZlibHelper.InitializeAsync();
var provider = new DefaultFileProvider(paks, SearchOption.AllDirectories,
    new VersionContainer(Enum.Parse<EGame>(gameName)), StringComparer.OrdinalIgnoreCase);
provider.Initialize();
provider.Mount();
provider.PostMount();
provider.LoadVirtualPaths();
var summary = new List<string> { $"files: {provider.Files.Count}" };

bool IsGame(string p) => prefix is null
    ? !p.StartsWith("Engine/", StringComparison.OrdinalIgnoreCase)
    : p.StartsWith(prefix, StringComparison.OrdinalIgnoreCase);
var maps = provider.Files.Keys.Where(k => k.EndsWith(".umap", StringComparison.OrdinalIgnoreCase) && IsGame(k)).OrderBy(k => k).ToList();
summary.Add($"maps: {string.Join(", ", maps)}");

var meshes = new Dictionary<string, UStaticMesh>(StringComparer.OrdinalIgnoreCase);
Directory.CreateDirectory(Path.Combine(outDir, "levels"));
foreach (var map in maps)
{
    var objPath = map[..^5] + "." + Path.GetFileNameWithoutExtension(map);
    UWorld world;
    try { world = provider.LoadPackageObject<UWorld>(objPath); }
    catch (Exception e) { summary.Add($"{map}: can't load ({e.Message})"); continue; }
    WorldDto dto;
    try { dto = new WorldDto(world); }
    catch (Exception e) { summary.Add($"{map}: can't read level ({e.Message})"); continue; }
    var placed = new List<object>();
    var lights = new List<object>();
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
    foreach (var actor in dto.Actors)
        if (actor.RootComponent is { } root) Walk(root, FTransform.Identity);
    var name = Path.GetFileNameWithoutExtension(map);
    await File.WriteAllTextAsync(Path.Combine(outDir, "levels", name + ".json"),
        JsonSerializer.Serialize(new { map, actors = dto.Actors.Count, meshes = placed, lights }, new JsonSerializerOptions { WriteIndented = true }));
    summary.Add($"{map}: {dto.Actors.Count} actors, {placed.Count} placed meshes, {lights.Count} lights");
}

// export every used mesh as glTF (textures decoded, ETC1 included)
var session = new ExportSession { MaxDegreeOfParallelism = Environment.ProcessorCount };
foreach (var m in meshes.Values) session.Add(m);
var results = await session.RunAsync(Path.Combine(outDir, "meshes"), new ExportOptions(meshFormat: EMeshFormat.Gltf2, textureFormat: ETextureFormat.Png));
summary.Add($"meshes exported: {results.Count(r => r.Success)} of {meshes.Count}");
foreach (var r in results.Where(r => !r.Success).Take(15)) summary.Add($"  failed {r.ObjectPath}: {r.Error?.Message}");
foreach (var r in results.Where(r => r.Success).Take(5)) summary.Add($"  ok {r.ObjectPath} -> {string.Join(", ", r.DiskFilePaths ?? [])}");
await File.WriteAllLinesAsync(Path.Combine(outDir, "summary.txt"), summary);
Console.WriteLine(string.Join("\n", summary));

// the exporter writes <out>/meshes/<package path without .uasset>.glb
static string MeshFile(UStaticMesh m) => m.GetPathName().Split('.')[0] + ".glb";
static float[] V(FVector v) => [v.X, v.Y, v.Z];
static float[] Q(FQuat q) => [q.X, q.Y, q.Z, q.W];
