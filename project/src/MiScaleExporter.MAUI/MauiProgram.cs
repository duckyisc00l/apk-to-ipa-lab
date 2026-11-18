using CommunityToolkit.Maui;
using Microsoft.Maui.Controls.Hosting;
using Microsoft.Maui.Hosting;
using Plugin.AdMob;
using Plugin.AdMob.Configuration;

namespace MiScaleExporter.MAUI;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		MauiAppBuilder mauiAppBuilder = MauiApp.CreateBuilder();
		mauiAppBuilder.UseMauiApp<App>().ConfigureFonts((IFontCollection fonts) =>
		{
			fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
			fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
			fonts.AddFont("FontAwesome6Regular.otf", "FontAwesome6Regular");
			fonts.AddFont("FontAwesome6Solid.otf", "FontAwesome6Solid");
		}).UseMauiCommunityToolkit()
			.UseAdMob();
		AdConfig.DefaultBannerAdUnitId = "ca-app-pub-1938975042085430/4160336701";
		return mauiAppBuilder.Build();
	}
}
