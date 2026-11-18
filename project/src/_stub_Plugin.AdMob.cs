// Stand-in for Plugin.AdMob: ads are removed in the iPhone build, but the recovered pages still name these types.
using Microsoft.Maui.Controls;
using Microsoft.Maui.Hosting;

namespace Plugin.AdMob
{
    public enum AdSize { Banner, SmartBanner, LargeBanner, MediumRectangle, FullBanner, Leaderboard, Adaptive }

    public class BannerAd : ContentView
    {
        public static readonly BindableProperty AdUnitIdProperty = BindableProperty.Create(nameof(AdUnitId), typeof(string), typeof(BannerAd));
        public static readonly BindableProperty AdSizeProperty = BindableProperty.Create(nameof(AdSize), typeof(AdSize), typeof(BannerAd), AdSize.Banner);
        public string AdUnitId { get => (string)GetValue(AdUnitIdProperty); set => SetValue(AdUnitIdProperty, value); }
        public AdSize AdSize { get => (AdSize)GetValue(AdSizeProperty); set => SetValue(AdSizeProperty, value); }
        public BannerAd() { HeightRequest = 0; }
    }

    public static class AdMobStubExtensions
    {
        public static MauiAppBuilder UseAdMob(this MauiAppBuilder builder, bool automaticallyAskForConsent = true, string[] testDeviceIds = null) => builder;
    }
}

namespace Plugin.AdMob.Configuration
{
    public static class AdConfig
    {
        public static string DefaultBannerAdUnitId { get; set; }
        public static string DefaultInterstitialAdUnitId { get; set; }
        public static string DefaultRewardedAdUnitId { get; set; }
        public static string DefaultRewardedInterstitialAdUnitId { get; set; }
        public static string DefaultAppOpenAdUnitId { get; set; }
        public static bool UseTestAdUnitIds { get; set; }
    }
}
