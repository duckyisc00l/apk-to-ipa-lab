"""List .NET assemblies pulled out of an APK: name, size, assembly version, informational (package) version,
and which are the app's own (not .NET, MAUI, AndroidX or other well-known libraries).
Usage: python3 -I ci/dotnet/inspect.py <dll dir>   -> prints a table; writes <dir>/own.txt (app's own assemblies)
"""
import os, re, sys
d = sys.argv[1]
FW = re.compile(r"^(System|Microsoft|Mono|Java\.Interop|mscorlib|netstandard|Xamarin|_Microsoft|GoogleGson|Square|Jsr305|"
                r"Kotlin|CommunityToolkit|SkiaSharp|HarfBuzzSharp|Newtonsoft|SQLite|SQLitePCL|Syncfusion|Plugin|Polly|"
                r"LiveChartsCore|Mopups|Sentry|Serilog|ExCSS|Svg|Fizzler|ZXing|Camera|Shiny|Refit|Humanizer|CsvHelper|"
                r"Telerik|DevExpress|Esri|Realm|MongoDB|Google|Firebase|Octokit|AutoMapper|Prism|ReactiveUI|Splat|"
                r"DynamicData|Akavache|FFImageLoading|Lottie|SkiaSharp|Rg\.|Acr|Fody|PropertyChanged|Dapper|"
                r"Markdig|HtmlAgilityPack|MediaManager|ExoPlayer|Material|Mapsui|NetTopologySuite|BruTile|"
                r"OpenTK|Uno|Avalonia|HarfBuzz|Sharpnado|Syncfusion|UraniumUI|InputKit|DotNet|Nerdbank|Grpc|Protobuf)")
own = []
for f in sorted(os.listdir(d)):
    if not f.endswith(".dll"):
        continue
    b = open(os.path.join(d, f), "rb").read()
    iv = re.search(rb"\x01\x00.(\d+\.\d+\.\d+(?:[-.][0-9A-Za-z.\-]+)?(?:\+[0-9a-f]{7,40})?)\x00\x00", b)
    tfm = re.search(rb"\.NETCoreApp,Version=v(\d+\.\d+)|MonoAndroid,Version=v[\d.]+|\.NETStandard,Version=v[\d.]+", b)
    name = f[:-4]
    mine = not FW.match(name)
    if mine:
        own.append(name)
    print(f"{'*' if mine else ' '} {name:60s} {len(b):>9d}  {iv.group(1).decode() if iv else '?':30s} {tfm.group(0).decode() if tfm else ''}")
open(os.path.join(d, "own.txt"), "w").write("\n".join(own) + "\n")
print("app's own (*):", " ".join(own))
