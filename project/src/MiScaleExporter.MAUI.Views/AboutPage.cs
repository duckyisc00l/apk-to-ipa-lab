using System;
using System.CodeDom.Compiler;
using System.Diagnostics.CodeAnalysis;
using Autofac;
using MiScaleExporter.MAUI.Resources.Localization;
using MiScaleExporter.MAUI.ViewModels;
using MiScaleExporter.Models;
using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Internals;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls.Xaml.Internals;
using Microsoft.Maui.Graphics;
using Microsoft.Maui.Storage;
using Plugin.AdMob;

namespace MiScaleExporter.MAUI.Views;

[XamlCompilation(XamlCompilationOptions.Compile)]
[XamlFilePath("Views\\AboutPage.xaml")]
public class AboutPage : ContentPage
{
	[GeneratedCode("Microsoft.Maui.Controls.SourceGen", "1.0.0.0")]
	private BannerAd adMobBanner;

	public AboutPage()
	{
		InitializeComponent();
		using ILifetimeScope context = App.Container.BeginLifetimeScope();
		BindingContext = context.Resolve<AboutViewModel>();
	}

	protected override void OnAppearing()
	{
		adMobBanner.IsVisible = !Preferences.Get(PreferencesKeys.HideAds, false);
	}

	[GeneratedCode("Microsoft.Maui.Controls.SourceGen", "1.0.0.0")]
	[MemberNotNull("adMobBanner")]
	private void InitializeComponent()
	{
		BindingExtension bindingExtension = new BindingExtension();
		RowDefinition rowDefinition = new RowDefinition();
		RowDefinition rowDefinition2 = new RowDefinition();
		RowDefinition rowDefinition3 = new RowDefinition();
		BannerAd bannerAd = new BannerAd();
		string aboutGarmin = AppSnippets.AboutGarmin;
		Label label = new Label();
		string aboutMeasureInstruction = AppSnippets.AboutMeasureInstruction;
		Label label2 = new Label();
		string aboutUpload = AppSnippets.AboutUpload;
		Label label3 = new Label();
		string aboutMFAAndStoringData = AppSnippets.AboutMFAAndStoringData;
		Label label4 = new Label();
		StackLayout stackLayout = new StackLayout();
		ScrollView scrollView = new ScrollView();
		StaticResourceExtension staticResourceExtension = new StaticResourceExtension();
		BindingExtension bindingExtension2 = new BindingExtension();
		string goToScan = AppSnippets.GoToScan;
		Button button = new Button();
		StaticResourceExtension staticResourceExtension2 = new StaticResourceExtension();
		BindingExtension bindingExtension3 = new BindingExtension();
		string openHelp = AppSnippets.OpenHelp;
		Button button2 = new Button();
		string doYouLikeAndWouldYouLikeToSupport = AppSnippets.DoYouLikeAndWouldYouLikeToSupport;
		Label label5 = new Label();
		BindingExtension bindingExtension4 = new BindingExtension();
		ImageButton imageButton = new ImageButton();
		StaticResourceExtension staticResourceExtension3 = new StaticResourceExtension();
		BindingExtension bindingExtension5 = new BindingExtension();
		string visitProjectRepository = AppSnippets.VisitProjectRepository;
		Button button3 = new Button();
		StackLayout stackLayout2 = new StackLayout();
		ScrollView scrollView2 = new ScrollView();
		Grid grid = new Grid();
		AboutPage aboutPage;
		NameScope nameScope = (NameScope)(NameScope.GetNameScope(aboutPage = this) ?? new NameScope());
		NameScope.SetNameScope(aboutPage, nameScope);
		((INameScope)nameScope).RegisterName("adMobBanner", (object)bannerAd);
		if (bannerAd.StyleId == null)
		{
			bannerAd.StyleId = "adMobBanner";
		}
		adMobBanner = bannerAd;
		bindingExtension.Path = "Title";
		XamlServiceProvider xamlServiceProvider = new XamlServiceProvider();
		Type? typeFromHandle = typeof(IXamlTypeResolver);
		XmlNamespaceResolver xmlNamespaceResolver = new XmlNamespaceResolver();
		xmlNamespaceResolver.Add("", "http://schemas.microsoft.com/dotnet/2021/maui");
		xmlNamespaceResolver.Add("x", "http://schemas.microsoft.com/winfx/2009/xaml");
		xmlNamespaceResolver.Add("admob", "clr-namespace:Plugin.AdMob;assembly=Plugin.AdMob");
		xmlNamespaceResolver.Add("localization", "clr-namespace:MiScaleExporter.MAUI.Resources.Localization");
		xmlNamespaceResolver.Add("vm", "clr-namespace:MiScaleExporter.MAUI.ViewModels");
		xamlServiceProvider.Add(typeFromHandle, new XamlTypeResolver(xmlNamespaceResolver, typeof(AboutPage).Assembly));
		BindingBase binding = ((IMarkupExtension<BindingBase>)bindingExtension).ProvideValue((IServiceProvider)xamlServiceProvider);
		aboutPage.SetBinding(Page.TitleProperty, binding);
		rowDefinition.SetValue(RowDefinition.HeightProperty, GridLength.Auto);
		((DefinitionCollection<RowDefinition>)grid.GetValue(Grid.RowDefinitionsProperty)).Add(rowDefinition);
		rowDefinition2.SetValue(RowDefinition.HeightProperty, GridLength.Star);
		((DefinitionCollection<RowDefinition>)grid.GetValue(Grid.RowDefinitionsProperty)).Add(rowDefinition2);
		rowDefinition3.SetValue(RowDefinition.HeightProperty, GridLength.Auto);
		((DefinitionCollection<RowDefinition>)grid.GetValue(Grid.RowDefinitionsProperty)).Add(rowDefinition3);
		bannerAd.SetValue(Grid.RowProperty, 0);
		bannerAd.SetValue(BannerAd.AdUnitIdProperty, "ca-app-pub-1938975042085430/4160336701");
		bannerAd.SetValue(BannerAd.AdSizeProperty, AdSize.Banner);
		grid.Children.Add(bannerAd);
		scrollView.SetValue(Grid.RowProperty, 1);
		stackLayout.SetValue(Microsoft.Maui.Controls.Layout.PaddingProperty, new Thickness(15.0, 24.0, 15.0, 24.0));
		stackLayout.SetValue(StackLayout.OrientationProperty, StackOrientation.Vertical);
		stackLayout.SetValue(StackBase.SpacingProperty, 10.0);
		label.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label.GetType()));
		label.SetValue(Label.TextProperty, aboutGarmin);
		stackLayout.Children.Add(label);
		label2.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label2.GetType()));
		label2.SetValue(Label.TextProperty, aboutMeasureInstruction);
		stackLayout.Children.Add(label2);
		label3.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label3.GetType()));
		label3.SetValue(Label.TextProperty, aboutUpload);
		stackLayout.Children.Add(label3);
		label4.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label4.GetType()));
		label4.SetValue(Label.TextProperty, aboutMFAAndStoringData);
		stackLayout.Children.Add(label4);
		scrollView.Content = stackLayout;
		grid.Children.Add(scrollView);
		scrollView2.SetValue(Grid.RowProperty, 2);
		stackLayout2.SetValue(Microsoft.Maui.Controls.Layout.PaddingProperty, new Thickness(15.0, 24.0, 15.0, 24.0));
		stackLayout2.SetValue(StackLayout.OrientationProperty, StackOrientation.Vertical);
		stackLayout2.SetValue(StackBase.SpacingProperty, 10.0);
		button.SetValue(View.MarginProperty, new Thickness(0.0, 10.0, 0.0, 0.0));
		staticResourceExtension.Key = "Primary";
		StaticResourceExtension staticResourceExtension4 = new StaticResourceExtension
		{
			Key = "Primary"
		};
		XamlServiceProvider xamlServiceProvider2 = new XamlServiceProvider();
		Type? typeFromHandle2 = typeof(IProvideValueTarget);
		object[] array = new object[0 + 5];
		array[0] = button;
		array[1] = stackLayout2;
		array[2] = scrollView2;
		array[3] = grid;
		array[4] = aboutPage;
		object service;
		xamlServiceProvider2.Add(typeFromHandle2, service = new SimpleValueTargetProvider(array, VisualElement.BackgroundColorProperty, new NameScope[6] { nameScope, nameScope, nameScope, nameScope, nameScope, nameScope }, aboutPage));
		xamlServiceProvider2.Add(typeof(IReferenceProvider), service);
		xamlServiceProvider2.Add(typeof(IRootObjectProvider), service);
		xamlServiceProvider2.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(45, 21)));
		object obj = staticResourceExtension4.ProvideValue(xamlServiceProvider2);
		button.SetValue(VisualElement.BackgroundColorProperty, (obj == null || !typeof(BindingBase).IsAssignableFrom(obj.GetType())) ? obj : obj);
		bindingExtension2.Path = "GoToScanCommand";
		XamlServiceProvider xamlServiceProvider3 = new XamlServiceProvider();
		Type? typeFromHandle3 = typeof(IXamlTypeResolver);
		XmlNamespaceResolver xmlNamespaceResolver2 = new XmlNamespaceResolver();
		xmlNamespaceResolver2.Add("", "http://schemas.microsoft.com/dotnet/2021/maui");
		xmlNamespaceResolver2.Add("x", "http://schemas.microsoft.com/winfx/2009/xaml");
		xmlNamespaceResolver2.Add("admob", "clr-namespace:Plugin.AdMob;assembly=Plugin.AdMob");
		xmlNamespaceResolver2.Add("localization", "clr-namespace:MiScaleExporter.MAUI.Resources.Localization");
		xmlNamespaceResolver2.Add("vm", "clr-namespace:MiScaleExporter.MAUI.ViewModels");
		xamlServiceProvider3.Add(typeFromHandle3, new XamlTypeResolver(xmlNamespaceResolver2, typeof(AboutPage).Assembly));
		BindingBase binding2 = ((IMarkupExtension<BindingBase>)bindingExtension2).ProvideValue((IServiceProvider)xamlServiceProvider3);
		button.SetBinding(Button.CommandProperty, binding2);
		button.SetValue(Button.TextProperty, goToScan);
		button.SetValue(Button.TextColorProperty, Colors.White);
		stackLayout2.Children.Add(button);
		button2.SetValue(View.MarginProperty, new Thickness(0.0, 10.0, 0.0, 0.0));
		staticResourceExtension2.Key = "Primary";
		StaticResourceExtension staticResourceExtension5 = new StaticResourceExtension
		{
			Key = "Primary"
		};
		XamlServiceProvider xamlServiceProvider4 = new XamlServiceProvider();
		Type? typeFromHandle4 = typeof(IProvideValueTarget);
		object[] array2 = new object[0 + 5];
		array2[0] = button2;
		array2[1] = stackLayout2;
		array2[2] = scrollView2;
		array2[3] = grid;
		array2[4] = aboutPage;
		object service2;
		xamlServiceProvider4.Add(typeFromHandle4, service2 = new SimpleValueTargetProvider(array2, VisualElement.BackgroundColorProperty, new NameScope[6] { nameScope, nameScope, nameScope, nameScope, nameScope, nameScope }, aboutPage));
		xamlServiceProvider4.Add(typeof(IReferenceProvider), service2);
		xamlServiceProvider4.Add(typeof(IRootObjectProvider), service2);
		xamlServiceProvider4.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(51, 21)));
		object obj2 = staticResourceExtension5.ProvideValue(xamlServiceProvider4);
		button2.SetValue(VisualElement.BackgroundColorProperty, (obj2 == null || !typeof(BindingBase).IsAssignableFrom(obj2.GetType())) ? obj2 : obj2);
		bindingExtension3.Path = "OpenHelpCommand";
		XamlServiceProvider xamlServiceProvider5 = new XamlServiceProvider();
		Type? typeFromHandle5 = typeof(IXamlTypeResolver);
		XmlNamespaceResolver xmlNamespaceResolver3 = new XmlNamespaceResolver();
		xmlNamespaceResolver3.Add("", "http://schemas.microsoft.com/dotnet/2021/maui");
		xmlNamespaceResolver3.Add("x", "http://schemas.microsoft.com/winfx/2009/xaml");
		xmlNamespaceResolver3.Add("admob", "clr-namespace:Plugin.AdMob;assembly=Plugin.AdMob");
		xmlNamespaceResolver3.Add("localization", "clr-namespace:MiScaleExporter.MAUI.Resources.Localization");
		xmlNamespaceResolver3.Add("vm", "clr-namespace:MiScaleExporter.MAUI.ViewModels");
		xamlServiceProvider5.Add(typeFromHandle5, new XamlTypeResolver(xmlNamespaceResolver3, typeof(AboutPage).Assembly));
		BindingBase binding3 = ((IMarkupExtension<BindingBase>)bindingExtension3).ProvideValue((IServiceProvider)xamlServiceProvider5);
		button2.SetBinding(Button.CommandProperty, binding3);
		button2.SetValue(Button.TextProperty, openHelp);
		button2.SetValue(Button.TextColorProperty, Colors.White);
		stackLayout2.Children.Add(button2);
		label5.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label5.GetType()));
		label5.SetValue(Label.TextProperty, doYouLikeAndWouldYouLikeToSupport);
		stackLayout2.Children.Add(label5);
		imageButton.SetValue(View.MarginProperty, new Thickness(0.0, 10.0, 0.0, 0.0));
		bindingExtension4.Path = "OpenCoffeeCommand";
		XamlServiceProvider xamlServiceProvider6 = new XamlServiceProvider();
		Type? typeFromHandle6 = typeof(IXamlTypeResolver);
		XmlNamespaceResolver xmlNamespaceResolver4 = new XmlNamespaceResolver();
		xmlNamespaceResolver4.Add("", "http://schemas.microsoft.com/dotnet/2021/maui");
		xmlNamespaceResolver4.Add("x", "http://schemas.microsoft.com/winfx/2009/xaml");
		xmlNamespaceResolver4.Add("admob", "clr-namespace:Plugin.AdMob;assembly=Plugin.AdMob");
		xmlNamespaceResolver4.Add("localization", "clr-namespace:MiScaleExporter.MAUI.Resources.Localization");
		xmlNamespaceResolver4.Add("vm", "clr-namespace:MiScaleExporter.MAUI.ViewModels");
		xamlServiceProvider6.Add(typeFromHandle6, new XamlTypeResolver(xmlNamespaceResolver4, typeof(AboutPage).Assembly));
		BindingBase binding4 = ((IMarkupExtension<BindingBase>)bindingExtension4).ProvideValue((IServiceProvider)xamlServiceProvider6);
		imageButton.SetBinding(ImageButton.CommandProperty, binding4);
		imageButton.SetValue(ImageButton.SourceProperty, ImageSource.FromFile("Images/buymeacoffe.png"));
		imageButton.SetValue(VisualElement.HeightRequestProperty, 50.0);
		stackLayout2.Children.Add(imageButton);
		button3.SetValue(View.MarginProperty, new Thickness(0.0, 10.0, 0.0, 0.0));
		staticResourceExtension3.Key = "Primary";
		StaticResourceExtension staticResourceExtension6 = new StaticResourceExtension
		{
			Key = "Primary"
		};
		XamlServiceProvider xamlServiceProvider7 = new XamlServiceProvider();
		Type? typeFromHandle7 = typeof(IProvideValueTarget);
		object[] array3 = new object[0 + 5];
		array3[0] = button3;
		array3[1] = stackLayout2;
		array3[2] = scrollView2;
		array3[3] = grid;
		array3[4] = aboutPage;
		object service3;
		xamlServiceProvider7.Add(typeFromHandle7, service3 = new SimpleValueTargetProvider(array3, VisualElement.BackgroundColorProperty, new NameScope[6] { nameScope, nameScope, nameScope, nameScope, nameScope, nameScope }, aboutPage));
		xamlServiceProvider7.Add(typeof(IReferenceProvider), service3);
		xamlServiceProvider7.Add(typeof(IRootObjectProvider), service3);
		xamlServiceProvider7.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(64, 21)));
		object obj3 = staticResourceExtension6.ProvideValue(xamlServiceProvider7);
		button3.SetValue(VisualElement.BackgroundColorProperty, (obj3 == null || !typeof(BindingBase).IsAssignableFrom(obj3.GetType())) ? obj3 : obj3);
		bindingExtension5.Path = "OpenGithubCommand";
		XamlServiceProvider xamlServiceProvider8 = new XamlServiceProvider();
		Type? typeFromHandle8 = typeof(IXamlTypeResolver);
		XmlNamespaceResolver xmlNamespaceResolver5 = new XmlNamespaceResolver();
		xmlNamespaceResolver5.Add("", "http://schemas.microsoft.com/dotnet/2021/maui");
		xmlNamespaceResolver5.Add("x", "http://schemas.microsoft.com/winfx/2009/xaml");
		xmlNamespaceResolver5.Add("admob", "clr-namespace:Plugin.AdMob;assembly=Plugin.AdMob");
		xmlNamespaceResolver5.Add("localization", "clr-namespace:MiScaleExporter.MAUI.Resources.Localization");
		xmlNamespaceResolver5.Add("vm", "clr-namespace:MiScaleExporter.MAUI.ViewModels");
		xamlServiceProvider8.Add(typeFromHandle8, new XamlTypeResolver(xmlNamespaceResolver5, typeof(AboutPage).Assembly));
		BindingBase binding5 = ((IMarkupExtension<BindingBase>)bindingExtension5).ProvideValue((IServiceProvider)xamlServiceProvider8);
		button3.SetBinding(Button.CommandProperty, binding5);
		button3.SetValue(Button.TextProperty, visitProjectRepository);
		button3.SetValue(Button.TextColorProperty, Colors.White);
		stackLayout2.Children.Add(button3);
		scrollView2.Content = stackLayout2;
		grid.Children.Add(scrollView2);
		aboutPage.SetValue(ContentPage.ContentProperty, grid);
	}
}
