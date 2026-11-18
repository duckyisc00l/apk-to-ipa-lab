"""Turn the ILSpy output of a .NET MAUI Android app into a .NET iOS (MAUI) project.

Usage: python3 ci/dotnet/rebuild.py <ilspy project dir> <dll dir> <app.apk> <out dir> [dotnet major, default from the DLLs]
Writes <out>/<App>.csproj plus the recovered C#, the APK's fonts, raw assets and images, an iOS entry point
(Platforms/iOS) and <out>/rebuild.md (what was dropped, stubbed or changed, and why).

What it does (each rule came from a real app):
- keeps every shared page and view model; compiled XAML comes back from ILSpy as plain C# InitializeComponent()
  code (MAUI 9 XAML source generator / XamlC), so no .xaml files are needed
- drops Android-only files: MainActivity / MainApplication, the Resource designer, files in *.Droid / *.Android /
  *.Platforms.Android namespaces or using Android.* / Java.* APIs, Windows/Tizen/MacCatalyst entry points
- drops files that a source generator in the new build will write again (CommunityToolkit TextColorTo
  extensions, the binding interceptors), or the build fails with "already contains a definition"
- libraries the APK ships as plain .NET (no Mono.Android / MAUI reference) are referenced as the APK's own DLLs;
  libraries built for Android (MAUI, CommunityToolkit.Maui, Plugin.BLE, ...) come back from NuGet at the
  version found in the DLL; ad libraries are replaced by empty stand-ins (ci/dotnet/stubs)
"""
import os, re, shutil, sys, zipfile, glob

rec, asm, apk, out = sys.argv[1:5]
HERE = os.path.dirname(os.path.abspath(__file__))
log = []
os.makedirs(out, exist_ok=True)

try:
    import dnfile
except ImportError:
    dnfile = None


def refs_and_version(path):
    b = open(path, "rb").read()
    refs = set()
    if dnfile:
        try:
            pe = dnfile.dnPE(path)
            refs = {str(r.Name) for r in (pe.net.mdtables.AssemblyRef.rows if pe.net.mdtables.AssemblyRef else [])}
        except Exception:
            pass
    vs = [m.group(1).decode() for m in re.finditer(rb"\x01\x00.(\d+\.\d+\.\d+(?:[-.][0-9A-Za-z.\-]+)?(?:\+[0-9a-f]{7,40})?)\x00\x00", b)]
    iv = next((v for v in vs if "+" in v), None) or next((v for v in vs if "-" in v), None) or (vs[0] if vs else None)
    return refs, (iv.split("+")[0] if iv else None)


def asm_version(path):
    try:
        r = dnfile.dnPE(path).net.mdtables.Assembly.rows[0]
        return f"{r.MajorVersion}.{r.MinorVersion}.{r.BuildNumber}.{r.RevisionNumber}"
    except Exception:
        return None


def nuget_versions(pid):
    import json, urllib.request
    try:
        return json.load(urllib.request.urlopen(f"https://api.nuget.org/v3-flatcontainer/{pid.lower()}/index.json", timeout=20))["versions"]
    except Exception:
        return None


def pick_version(vs, *wanted):
    # the informational and the assembly version can differ (1.0.0 vs 1.0.12.0): take the higher one NuGet has
    hits = [c for w in wanted if w for c in (w, ".".join(w.split(".")[:3]), w[:-2] if w.endswith(".0") else None) if c and c in vs]
    if hits:
        return max(hits, key=lambda v: [int(x) if x.isdigit() else 0 for x in re.split(r"[.-]", v)])
    major = next((w.split(".")[0] for w in wanted if w), None)
    same = [v for v in vs if v.split(".")[0] == major and "-" not in v]
    return same[-1] if same else None


app = os.path.basename(os.path.normpath(rec))
# ---------- 1. code
ANDROID = re.compile(r"^\s*using (Android|AndroidX|Java|Xamarin\.Android|_Microsoft\.Android)\b|\[(Activity|Application|Service|BroadcastReceiver|IntentFilter)\(|"
                     r":\s*(MauiAppCompatActivity|MauiApplication)\b|androidPermission|^namespace [\w.]*\.(Droid|Android|Platforms\.Android|Platforms\.Windows|Platforms\.Tizen|WinUI)\s*;", re.M)
REGEN = re.compile(r'\[GeneratedCode\("(CommunityToolkit\.Maui\.SourceGenerators|Microsoft\.Maui\.Controls\.BindingSourceGen|CommunityToolkit\.Mvvm)')
dropped, kept = [], 0
for src in glob.glob(os.path.join(rec, "**", "*.cs"), recursive=True):
    rel = os.path.relpath(src, rec)
    t0 = open(src, encoding="utf-8-sig").read()
    # Android's HTTP handler has a plain .NET equivalent: swap it before judging the file Android-only
    t = re.sub(r"^using Xamarin\.Android\.Net;\n", "", t0, flags=re.M).replace("new AndroidMessageHandler()", "new HttpClientHandler()")
    if ANDROID.search(t):
        dropped.append(f"{rel} (Android-only)"); continue
    if REGEN.search(t) and not re.search(r"\bpartial\b", t):
        dropped.append(f"{rel} (source generator writes it again)"); continue
    # small fixes, each logged
    t2 = re.sub(r"^\[assembly: (TargetPlatform|SupportedOSPlatform)\(.*\n", "", t, flags=re.M)
    # compiled XAML sets internal members directly (fine in IL, not in C#); they only help debugging tools
    t2 = re.sub(r"^\s*\w+\.transientNamescope = \w+;\n", "", t2, flags=re.M)
    if t2 != t0:
        log.append(f"edited {rel}")
    dst = os.path.join(out, "src", rel)
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    open(dst, "w").write(t2); kept += 1
log.insert(0, f"kept {kept} C# files, dropped {len(dropped)}:\n  " + "\n  ".join(dropped))
resx = []
for src in glob.glob(os.path.join(rec, "*.resx")):
    n = os.path.basename(src)
    if re.match(r"(Autofac|System|Microsoft)\.", n):
        continue
    shutil.copy(src, os.path.join(out, "src", n)); resx.append(n)
used = set()
for f in glob.glob(os.path.join(out, "src", "**", "*.cs"), recursive=True):
    used |= set(re.findall(r"^using ([\w.]+);", open(f).read(), re.M))

# ---------- 2. libraries
pkgs, dlls = {}, []
STUBS = {"Plugin.AdMob": "Plugin.AdMob.cs", "Plugin.MauiMTAdmob": None}
FW = re.compile(r"^(System(\.|$)|Microsoft\.(Extensions|CSharp|VisualBasic|Win32|Bcl)|mscorlib|netstandard|Mono\.|Java\.|Xamarin\.|_Microsoft|"
                r"Microsoft\.Maui|GoogleGson|Jsr305|Square\.|Kotlin)")
NUGET_NAME = {"CommunityToolkit.Maui.Core": "CommunityToolkit.Maui", "Microsoft.Maui.Controls": None,
              "BouncyCastle.Crypto": "Portable.BouncyCastle"}
maui_ver = None
plain, librefs = {}, set()
for p in sorted(glob.glob(os.path.join(asm, "*.dll"))):
    n = os.path.basename(p)[:-4]
    refs, ver = refs_and_version(p)
    if n == "Microsoft.Maui.Controls":
        maui_ver = ver
    if n == app or FW.match(n) or n.endswith(".resources"):
        continue
    if n in STUBS:
        if STUBS[n]:
            shutil.copy(os.path.join(HERE, "stubs", STUBS[n]), os.path.join(out, "src", "_stub_" + STUBS[n]))
        log.append(f"stubbed {n} (ads are removed; empty stand-in keeps the pages compiling)"); continue
    if refs & {"Mono.Android", "Java.Interop", "Microsoft.Maui", "Microsoft.Maui.Controls", "Microsoft.Maui.Essentials"}:
        pid = NUGET_NAME.get(n, n)
        # CommunityToolkit stamps its DLLs "1.0.0-pre1": pick the release made for this MAUI instead
        if pid == "CommunityToolkit.Maui" and (not ver or ver.startswith("1.0.0")):
            ver = {"8": "9.1.1", "9": "12.1.0", "10": "12.3.0"}.get((maui_ver or "9").split(".")[0], "12.1.0")
        if pid and pid not in pkgs:
            pkgs[pid] = ver
        log.append(f"NuGet {pid} {ver} (built for Android: {n})")
    else:
        plain[n] = (ver, asm_version(p))
    librefs |= refs
# the APK's plain .NET DLLs were trimmed for that one build (members cut, references moved to System.Private.CoreLib):
# compiling against them fails with CS0012. Take the top-level ones from NuGet; their dependencies come with them.
for n, (ver, av) in sorted(plain.items()):
    if n in librefs:
        continue
    pid = NUGET_NAME.get(n, n)
    vs = nuget_versions(pid)
    v = pick_version(vs, ver, av) if vs else None
    if v:
        pkgs[pid] = v; log.append(f"NuGet {pid} {v} (APK DLL {n} {ver}/{av})")
    else:
        dlls.append(n); log.append(f"DLL from the APK: {n} {ver or ''} (not on NuGet)")
for n in sorted(plain):
    if n in librefs and any(n in refs_and_version(os.path.join(asm, d + ".dll"))[0] for d in dlls):
        dlls.append(n); log.append(f"DLL from the APK: {n} (needed by an APK DLL)")
os.makedirs(os.path.join(out, "lib"), exist_ok=True)
for n in dlls:
    shutil.copy(os.path.join(asm, n + ".dll"), os.path.join(out, "lib"))

# ---------- 3. APK resources: fonts, raw assets, images, icon
z = zipfile.ZipFile(apk)
names = z.namelist()
fonts, raws, images = [], [], []
for n in names:
    if n.startswith("assets/") and not n.startswith(("assets/dexopt/", "assets/AboutAssets.txt")):
        rel = n[len("assets/"):]
        sub = "Fonts" if rel.lower().endswith((".ttf", ".otf")) else "Raw"
        dst = os.path.join(out, "Resources", sub, rel)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        open(dst, "wb").write(z.read(n))
        (fonts if sub == "Fonts" else raws).append(rel)
# images named in the code: Android keeps them in res/drawable-<dpi>/<name>.png; iOS wants name@3x.png
code = "".join(open(f).read() for f in glob.glob(os.path.join(out, "src", "**", "*.cs"), recursive=True))
DPI = [("xxhdpi", 3), ("xxxhdpi", 3), ("xhdpi", 2), ("hdpi", 2), ("mdpi", 1), ("", 1)]
for lit in sorted(set(re.findall(r'"([\w./-]+\.(?:png|jpg|jpeg|gif|svg))"', code))):
    base = os.path.splitext(os.path.basename(lit))[0].lower()
    for dpi, scale in DPI:
        hit = [n for n in names if re.fullmatch(rf"res/drawable{'-' + dpi if dpi else ''}(-v\d+)?/{re.escape(base)}\.(png|jpg|webp)", n)]
        if hit:
            ext = os.path.splitext(hit[0])[1]
            data = z.read(hit[0])
            if dpi == "xxxhdpi":
                try:
                    from PIL import Image
                    import io
                    im = Image.open(io.BytesIO(data)); im = im.resize((im.width * 3 // 4, im.height * 3 // 4), Image.LANCZOS)
                    bio = io.BytesIO(); im.save(bio, "PNG"); data = bio.getvalue(); ext = ".png"
                except Exception:
                    pass
            ext = os.path.splitext(lit)[1]   # keep the name the code asks for; iOS reads the picture by its content
            fn = f"{base}@{scale}x{ext}"
            os.makedirs(os.path.join(out, "Resources", "Bundle"), exist_ok=True)
            open(os.path.join(out, "Resources", "Bundle", fn), "wb").write(data)
            # the code may ask for "Images/x.png" or "x.png": serve both names
            d = os.path.dirname(lit)
            images.append((fn, fn))
            if d:
                images.append((fn, f"{d}/{os.path.splitext(os.path.basename(lit))[0]}@{scale}x{ext}"))
            break
    else:
        log.append(f"image {lit}: not found in res/drawable*")
icon = None
for dpi in ("xxxhdpi", "xxhdpi", "xhdpi", "hdpi", "mdpi"):
    hit = [n for n in names if re.fullmatch(rf"res/mipmap-{dpi}(-v\d+)?/(appicon|ic_launcher|launcher_foreground)\.png", n)]
    if hit:
        icon = "Resources/AppIcon/appicon.png"
        os.makedirs(os.path.join(out, "Resources", "AppIcon"), exist_ok=True)
        open(os.path.join(out, icon), "wb").write(z.read(hit[0])); break

# ---------- 4. app identity from the manifest
try:
    from androguard.core.apk import APK
    a = APK(apk)
    title, appid, ver, code_ = a.get_app_name(), a.get_package(), a.get_androidversion_name(), a.get_androidversion_code()
except Exception:
    title, appid, ver, code_ = app, "com.example." + re.sub(r"\W", "", app).lower(), "1.0", "1"
ver = re.sub(r"[^\d.]", "", ver or "1.0") or "1.0"
tfm_major = sys.argv[5] if len(sys.argv) > 5 else (maui_ver or "9").split(".")[0]
tfm = f"net{tfm_major}.0-ios"

# ---------- 5. iOS entry point (the MAUI template's), Info.plist
prog = re.search(r"public static class (\w+)\s*\{[^}]*CreateMauiApp", code, re.S)
ns = re.search(r"namespace ([\w.]+);[^}]*public static class \w+\s*\{[^}]*CreateMauiApp", code, re.S)
mp = f"{ns.group(1)}.{prog.group(1)}" if prog and ns else "MauiProgram"
ios = os.path.join(out, "Platforms", "iOS"); os.makedirs(ios, exist_ok=True)
open(os.path.join(ios, "AppDelegate.cs"), "w").write(f"""using Foundation;
using Microsoft.Maui;
using Microsoft.Maui.Hosting;
namespace RecoveredIos;
[Register("AppDelegate")]
public class AppDelegate : MauiUIApplicationDelegate
{{
    protected override MauiApp CreateMauiApp() => global::{mp}.CreateMauiApp();
}}
""")
open(os.path.join(ios, "Program.cs"), "w").write("""using UIKit;
namespace RecoveredIos;
public class Program
{
    static void Main(string[] args) => UIApplication.Main(args, null, typeof(AppDelegate));
}
""")
perms = ""
# an icon key with no icon makes the build fail; MauiIcon writes Assets.xcassets/appicon.appiconset
icon_key = "<key>XSAppIconAssets</key><string>Assets.xcassets/appicon.appiconset</string>\n" if icon else ""
if re.search(r"Plugin\.BLE|Bluetooth", code):
    perms += "<key>NSBluetoothAlwaysUsageDescription</key><string>Used to read your scale.</string>\n"
if re.search(r"Geolocation|Location", code):
    perms += "<key>NSLocationWhenInUseUsageDescription</key><string>Needed by the app.</string>\n"
open(os.path.join(ios, "Info.plist"), "w").write(f"""<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>LSRequiresIPhoneOS</key><true/>
<key>UIDeviceFamily</key><array><integer>1</integer><integer>2</integer></array>
<key>UILaunchScreen</key><dict/>
<key>UISupportedInterfaceOrientations</key><array><string>UIInterfaceOrientationPortrait</string><string>UIInterfaceOrientationLandscapeLeft</string><string>UIInterfaceOrientationLandscapeRight</string></array>
<key>UISupportedInterfaceOrientations~ipad</key><array><string>UIInterfaceOrientationPortrait</string><string>UIInterfaceOrientationPortraitUpsideDown</string><string>UIInterfaceOrientationLandscapeLeft</string><string>UIInterfaceOrientationLandscapeRight</string></array>
{icon_key}<key>ITSAppUsesNonExemptEncryption</key><false/>
{perms}</dict></plist>
""")

# ---------- 6. csproj
items = []
for n in dlls:
    items.append(f'    <Reference Include="{n}"><HintPath>lib/{n}.dll</HintPath></Reference>')
for pid, v in sorted(pkgs.items()):
    items.append(f'    <PackageReference Include="{pid}" Version="{v}" />')
for n in resx:
    items.append(f'    <EmbeddedResource Include="src/{n}" LogicalName="{n[:-5]}.resources" />')
for f in fonts:
    items.append(f'    <MauiFont Include="Resources/Fonts/{f}" />')
for r in raws:
    items.append(f'    <MauiAsset Include="Resources/Raw/{r}" LogicalName="{r}" />')
for fn, logical in images:
    items.append(f'    <BundleResource Include="Resources/Bundle/{fn}" LogicalName="{logical}" />')
if icon:
    items.append(f'    <MauiIcon Include="{icon}" />')
open(os.path.join(out, "App.csproj"), "w").write(f"""<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>{tfm}</TargetFramework>
    <OutputType>Exe</OutputType>
    <UseMaui>true</UseMaui>
    <SingleProject>true</SingleProject>
    <AssemblyName>{app}</AssemblyName>
    <RootNamespace></RootNamespace>
    <ApplicationTitle>{title}</ApplicationTitle>
    <ApplicationId>{appid}</ApplicationId>
    <ApplicationDisplayVersion>{ver}</ApplicationDisplayVersion>
    <ApplicationVersion>{code_}</ApplicationVersion>
    <SupportedOSPlatformVersion>15.0</SupportedOSPlatformVersion>
    <GenerateAssemblyInfo>false</GenerateAssemblyInfo>
    <ImplicitUsings>disable</ImplicitUsings>
    <Nullable>disable</Nullable>
    <LangVersion>latest</LangVersion>
    <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
    <NoWarn>$(NoWarn);CS0108;CS0114;CS0162;CS0168;CS0219;CS0414;CS0649;CS1998;CS4014;CS8632;XC0022;XC0023;MA0001</NoWarn>
    <MauiVersion>{maui_ver or ''}</MauiVersion>
    <EnableDefaultMauiItems>false</EnableDefaultMauiItems>
    <EnableDefaultEmbeddedResourceItems>false</EnableDefaultEmbeddedResourceItems>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Microsoft.Maui.Controls" Version="$(MauiVersion)" />
{chr(10).join(items)}
  </ItemGroup>
</Project>
""")
log.append(f"target {tfm}, MAUI {maui_ver}, app {title} ({appid}) {ver}/{code_}, entry {mp}")
log.append(f"fonts {fonts}, raw {raws}, images {[i[1] for i in images]}, icon {icon}")
open(os.path.join(out, "rebuild.md"), "w").write("# rebuild\n\n" + "\n".join(log) + "\n")
print("\n".join(log))
