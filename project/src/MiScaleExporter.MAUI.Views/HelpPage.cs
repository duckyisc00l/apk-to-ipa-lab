using System;
using System.CodeDom.Compiler;
using System.Windows.Input;
using MiScaleExporter.MAUI.Resources.Localization;
using Microsoft.Maui;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Internals;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls.Xaml.Internals;
using Microsoft.Maui.Graphics;

namespace MiScaleExporter.MAUI.Views;

[XamlFilePath("Views\\HelpPage.xaml")]
public class HelpPage : ContentPage
{
	public ICommand OpenGithubCommand { get; }

	public ICommand OpenCoffeeCommand { get; }

	public ICommand S400HelpCommand { get; } = new Command(async () =>
	{
		await Launcher.OpenAsync("https://lswiderski.github.io/mi-scale-exporter/#steps-to-connect-xiaomi-body-composition-scale-s400");
	});

	public HelpPage()
	{
		BindingContext = this;
		OpenGithubCommand = new Command(async () =>
		{
			await Browser.OpenAsync("https://github.com/lswiderski/mi-scale-exporter");
		});
		OpenCoffeeCommand = new Command(async () =>
		{
			await Browser.OpenAsync("https://www.buymeacoffee.com/lukaszswiderski");
		});
		InitializeComponent();
	}

	[GeneratedCode("Microsoft.Maui.Controls.SourceGen", "1.0.0.0")]
	private void InitializeComponent()
	{
		string help = AppSnippets.Help;
		string helpConnect = AppSnippets.HelpConnect;
		Label label = new Label();
		BindingExtension bindingExtension = new BindingExtension();
		TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();
		Label label2 = new Label();
		string helpConnectDescription = AppSnippets.HelpConnectDescription;
		Label label3 = new Label();
		string helpConnectDescription2 = AppSnippets.HelpConnectDescription2;
		Label label4 = new Label();
		Image image = new Image();
		string helpHowItWorks = AppSnippets.HelpHowItWorks;
		Label label5 = new Label();
		string helpHowItWorksDescription = AppSnippets.HelpHowItWorksDescription;
		Label label6 = new Label();
		string helpStrangeResults = AppSnippets.HelpStrangeResults;
		Label label7 = new Label();
		string helpStrangeResultsDescription = AppSnippets.HelpStrangeResultsDescription;
		Label label8 = new Label();
		string helpZeppLifeDriference = AppSnippets.HelpZeppLifeDriference;
		Label label9 = new Label();
		string helpZeppLifeDriferenceDescription = AppSnippets.HelpZeppLifeDriferenceDescription;
		Label label10 = new Label();
		string helpExternalApi = AppSnippets.HelpExternalApi;
		Label label11 = new Label();
		string helpExternalApiDescription = AppSnippets.HelpExternalApiDescription;
		Label label12 = new Label();
		string helpGarminAndXiaomi = AppSnippets.HelpGarminAndXiaomi;
		Label label13 = new Label();
		string helpGarminAndXiaomiDescription = AppSnippets.HelpGarminAndXiaomiDescription;
		Label label14 = new Label();
		string helpFeedback = AppSnippets.HelpFeedback;
		Label label15 = new Label();
		string helpFeedbackDescription = AppSnippets.HelpFeedbackDescription;
		Label label16 = new Label();
		StaticResourceExtension staticResourceExtension = new StaticResourceExtension();
		BindingExtension bindingExtension2 = new BindingExtension();
		string visitProjectRepository = AppSnippets.VisitProjectRepository;
		Button button = new Button();
		string helpCoffee = AppSnippets.HelpCoffee;
		Label label17 = new Label();
		string helpCoffeeDescription = AppSnippets.HelpCoffeeDescription;
		Label label18 = new Label();
		StaticResourceExtension staticResourceExtension2 = new StaticResourceExtension();
		BindingExtension bindingExtension3 = new BindingExtension();
		string buyMeACoffee = AppSnippets.BuyMeACoffee;
		Button button2 = new Button();
		string createdBy = AppSnippets.CreatedBy;
		Label label19 = new Label();
		StackLayout stackLayout = new StackLayout();
		ScrollView scrollView = new ScrollView();
		HelpPage helpPage;
		NameScope nameScope = (NameScope)(NameScope.GetNameScope(helpPage = this) ?? new NameScope());
		NameScope.SetNameScope(helpPage, nameScope);
		helpPage.SetValue(Page.TitleProperty, help);
		scrollView.SetValue(ScrollView.VerticalScrollBarVisibilityProperty, ScrollBarVisibility.Always);
		stackLayout.SetValue(Microsoft.Maui.Controls.Layout.PaddingProperty, new Thickness(15.0, 24.0, 15.0, 24.0));
		stackLayout.SetValue(StackLayout.OrientationProperty, StackOrientation.Vertical);
		stackLayout.SetValue(StackBase.SpacingProperty, 10.0);
		label.SetValue(Label.FontAttributesProperty, FontAttributes.Bold);
		label.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label.GetType()));
		label.SetValue(Label.TextProperty, helpConnect);
		stackLayout.Children.Add(label);
		label2.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label2.GetType()));
		label2.SetValue(Label.TextProperty, "Instruction for the S400 scale (click here)");
		label2.SetValue(Label.TextDecorationsProperty, TextDecorations.Underline);
		label2.SetValue(Label.TextColorProperty, new Color(0f, 124f / 255f, 195f / 255f, 1f));
		label2.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		bindingExtension.Path = "S400HelpCommand";
		XamlServiceProvider xamlServiceProvider = new XamlServiceProvider();
		Type? typeFromHandle = typeof(IXamlTypeResolver);
		XmlNamespaceResolver xmlNamespaceResolver = new XmlNamespaceResolver();
		xmlNamespaceResolver.Add("", "http://schemas.microsoft.com/dotnet/2021/maui");
		xmlNamespaceResolver.Add("x", "http://schemas.microsoft.com/winfx/2009/xaml");
		xmlNamespaceResolver.Add("localization", "clr-namespace:MiScaleExporter.MAUI.Resources.Localization");
		xamlServiceProvider.Add(typeFromHandle, new XamlTypeResolver(xmlNamespaceResolver, typeof(HelpPage).Assembly));
		BindingBase binding = ((IMarkupExtension<BindingBase>)bindingExtension).ProvideValue((IServiceProvider)xamlServiceProvider);
		tapGestureRecognizer.SetBinding(TapGestureRecognizer.CommandProperty, binding);
		label2.GestureRecognizers.Add(tapGestureRecognizer);
		stackLayout.Children.Add(label2);
		label3.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label3.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label3.GetType()));
		label3.SetValue(Label.TextProperty, helpConnectDescription);
		stackLayout.Children.Add(label3);
		label4.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label4.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label4.GetType()));
		label4.SetValue(Label.TextProperty, helpConnectDescription2);
		stackLayout.Children.Add(label4);
		image.SetValue(Image.SourceProperty, ImageSource.FromFile("Images/xiaomi.jpg"));
		stackLayout.Children.Add(image);
		label5.SetValue(Label.FontAttributesProperty, FontAttributes.Bold);
		label5.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label5.GetType()));
		label5.SetValue(Label.TextProperty, helpHowItWorks);
		stackLayout.Children.Add(label5);
		label6.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label6.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label6.GetType()));
		label6.SetValue(Label.TextProperty, helpHowItWorksDescription);
		stackLayout.Children.Add(label6);
		label7.SetValue(Label.FontAttributesProperty, FontAttributes.Bold);
		label7.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label7.GetType()));
		label7.SetValue(Label.TextProperty, helpStrangeResults);
		stackLayout.Children.Add(label7);
		label8.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label8.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label8.GetType()));
		label8.SetValue(Label.TextProperty, helpStrangeResultsDescription);
		stackLayout.Children.Add(label8);
		label9.SetValue(Label.FontAttributesProperty, FontAttributes.Bold);
		label9.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label9.GetType()));
		label9.SetValue(Label.TextProperty, helpZeppLifeDriference);
		stackLayout.Children.Add(label9);
		label10.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label10.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label10.GetType()));
		label10.SetValue(Label.TextProperty, helpZeppLifeDriferenceDescription);
		stackLayout.Children.Add(label10);
		label11.SetValue(Label.FontAttributesProperty, FontAttributes.Bold);
		label11.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label11.GetType()));
		label11.SetValue(Label.TextProperty, helpExternalApi);
		stackLayout.Children.Add(label11);
		label12.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label12.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label12.GetType()));
		label12.SetValue(Label.TextProperty, helpExternalApiDescription);
		stackLayout.Children.Add(label12);
		label13.SetValue(Label.FontAttributesProperty, FontAttributes.Bold);
		label13.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label13.GetType()));
		label13.SetValue(Label.TextProperty, helpGarminAndXiaomi);
		stackLayout.Children.Add(label13);
		label14.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label14.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label14.GetType()));
		label14.SetValue(Label.TextProperty, helpGarminAndXiaomiDescription);
		stackLayout.Children.Add(label14);
		label15.SetValue(Label.FontAttributesProperty, FontAttributes.Bold);
		label15.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label15.GetType()));
		label15.SetValue(Label.TextProperty, helpFeedback);
		stackLayout.Children.Add(label15);
		label16.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label16.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label16.GetType()));
		label16.SetValue(Label.TextProperty, helpFeedbackDescription);
		stackLayout.Children.Add(label16);
		button.SetValue(View.MarginProperty, new Thickness(0.0, 10.0, 0.0, 0.0));
		staticResourceExtension.Key = "Primary";
		StaticResourceExtension staticResourceExtension3 = new StaticResourceExtension
		{
			Key = "Primary"
		};
		XamlServiceProvider xamlServiceProvider2 = new XamlServiceProvider();
		Type? typeFromHandle2 = typeof(IProvideValueTarget);
		object[] array = new object[0 + 4];
		array[0] = button;
		array[1] = stackLayout;
		array[2] = scrollView;
		array[3] = helpPage;
		object service;
		xamlServiceProvider2.Add(typeFromHandle2, service = new SimpleValueTargetProvider(array, VisualElement.BackgroundColorProperty, new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, helpPage));
		xamlServiceProvider2.Add(typeof(IReferenceProvider), service);
		xamlServiceProvider2.Add(typeof(IRootObjectProvider), service);
		xamlServiceProvider2.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(87, 17)));
		object obj = staticResourceExtension3.ProvideValue(xamlServiceProvider2);
		button.SetValue(VisualElement.BackgroundColorProperty, (obj == null || !typeof(BindingBase).IsAssignableFrom(obj.GetType())) ? obj : obj);
		bindingExtension2.Path = "OpenGithubCommand";
		XamlServiceProvider xamlServiceProvider3 = new XamlServiceProvider();
		Type? typeFromHandle3 = typeof(IXamlTypeResolver);
		XmlNamespaceResolver xmlNamespaceResolver2 = new XmlNamespaceResolver();
		xmlNamespaceResolver2.Add("", "http://schemas.microsoft.com/dotnet/2021/maui");
		xmlNamespaceResolver2.Add("x", "http://schemas.microsoft.com/winfx/2009/xaml");
		xmlNamespaceResolver2.Add("localization", "clr-namespace:MiScaleExporter.MAUI.Resources.Localization");
		xamlServiceProvider3.Add(typeFromHandle3, new XamlTypeResolver(xmlNamespaceResolver2, typeof(HelpPage).Assembly));
		BindingBase binding2 = ((IMarkupExtension<BindingBase>)bindingExtension2).ProvideValue((IServiceProvider)xamlServiceProvider3);
		button.SetBinding(Button.CommandProperty, binding2);
		button.SetValue(Button.TextProperty, visitProjectRepository);
		button.SetValue(Button.TextColorProperty, Colors.White);
		stackLayout.Children.Add(button);
		label17.SetValue(Label.FontAttributesProperty, FontAttributes.Bold);
		label17.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label17.GetType()));
		label17.SetValue(Label.TextProperty, helpCoffee);
		stackLayout.Children.Add(label17);
		label18.SetValue(Label.PaddingProperty, new Thickness(15.0, 0.0, 0.0, 0.0));
		label18.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label18.GetType()));
		label18.SetValue(Label.TextProperty, helpCoffeeDescription);
		stackLayout.Children.Add(label18);
		button2.SetValue(View.MarginProperty, new Thickness(0.0, 10.0, 0.0, 0.0));
		staticResourceExtension2.Key = "Primary";
		StaticResourceExtension staticResourceExtension4 = new StaticResourceExtension
		{
			Key = "Primary"
		};
		XamlServiceProvider xamlServiceProvider4 = new XamlServiceProvider();
		Type? typeFromHandle4 = typeof(IProvideValueTarget);
		object[] array2 = new object[0 + 4];
		array2[0] = button2;
		array2[1] = stackLayout;
		array2[2] = scrollView;
		array2[3] = helpPage;
		object service2;
		xamlServiceProvider4.Add(typeFromHandle4, service2 = new SimpleValueTargetProvider(array2, VisualElement.BackgroundColorProperty, new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, helpPage));
		xamlServiceProvider4.Add(typeof(IReferenceProvider), service2);
		xamlServiceProvider4.Add(typeof(IRootObjectProvider), service2);
		xamlServiceProvider4.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(102, 17)));
		object obj2 = staticResourceExtension4.ProvideValue(xamlServiceProvider4);
		button2.SetValue(VisualElement.BackgroundColorProperty, (obj2 == null || !typeof(BindingBase).IsAssignableFrom(obj2.GetType())) ? obj2 : obj2);
		bindingExtension3.Path = "OpenCoffeeCommand";
		XamlServiceProvider xamlServiceProvider5 = new XamlServiceProvider();
		Type? typeFromHandle5 = typeof(IXamlTypeResolver);
		XmlNamespaceResolver xmlNamespaceResolver3 = new XmlNamespaceResolver();
		xmlNamespaceResolver3.Add("", "http://schemas.microsoft.com/dotnet/2021/maui");
		xmlNamespaceResolver3.Add("x", "http://schemas.microsoft.com/winfx/2009/xaml");
		xmlNamespaceResolver3.Add("localization", "clr-namespace:MiScaleExporter.MAUI.Resources.Localization");
		xamlServiceProvider5.Add(typeFromHandle5, new XamlTypeResolver(xmlNamespaceResolver3, typeof(HelpPage).Assembly));
		BindingBase binding3 = ((IMarkupExtension<BindingBase>)bindingExtension3).ProvideValue((IServiceProvider)xamlServiceProvider5);
		button2.SetBinding(Button.CommandProperty, binding3);
		button2.SetValue(Button.TextProperty, buyMeACoffee);
		button2.SetValue(Button.TextColorProperty, Colors.White);
		stackLayout.Children.Add(button2);
		label19.SetValue(View.MarginProperty, new Thickness(10.0));
		label19.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label19.GetType()));
		label19.SetValue(View.HorizontalOptionsProperty, LayoutOptions.Center);
		label19.SetValue(Label.TextProperty, createdBy);
		stackLayout.Children.Add(label19);
		scrollView.Content = stackLayout;
		helpPage.SetValue(ContentPage.ContentProperty, scrollView);
	}
}
