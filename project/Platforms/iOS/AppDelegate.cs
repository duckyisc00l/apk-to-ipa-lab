using Foundation;
using Microsoft.Maui;
using Microsoft.Maui.Hosting;
namespace RecoveredIos;
[Register("AppDelegate")]
public class AppDelegate : MauiUIApplicationDelegate
{
    protected override MauiApp CreateMauiApp() => global::MiScaleExporter.MAUI.MauiProgram.CreateMauiApp();
}
