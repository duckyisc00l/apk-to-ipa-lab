using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Reflection;
using MiScaleExporter.Controls;
using MiScaleExporter.MAUI.Resources.Localization;
using MiScaleExporter.MAUI.Views;
using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Internals;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls.Xaml.Internals;
using Microsoft.Maui.Graphics;

namespace MiScaleExporter.MAUI;

[XamlFilePath("AppShell.xaml")]
public class AppShell : Shell
{
	public AppShell()
	{
		InitializeComponent();
	}

	private async void OnMenuItemClicked(object sender, EventArgs e)
	{
		await Shell.Current.GoToAsync("..");
	}

	[GeneratedCode("Microsoft.Maui.Controls.SourceGen", "1.0.0.0")]
	private void InitializeComponent()
	{
		StaticResourceExtension staticResourceExtension = new StaticResourceExtension();
		Setter setter = new Setter();
		Setter setter2 = new Setter();
		Setter setter3 = new Setter();
		Setter setter4 = new Setter();
		Setter setter5 = new Setter();
		StaticResourceExtension staticResourceExtension2 = new StaticResourceExtension();
		Setter setter6 = new Setter();
		Setter setter7 = new Setter();
		Setter setter8 = new Setter();
		Setter setter9 = new Setter();
		Style style = new Style(typeof(Element));
		StaticResourceExtension staticResourceExtension3 = new StaticResourceExtension();
		Style style2 = new Style(typeof(TabBar));
		StaticResourceExtension staticResourceExtension4 = new StaticResourceExtension();
		Style style3 = new Style(typeof(FlyoutItem));
		Setter setter10 = new Setter();
		Style style4 = new Style(typeof(Label));
		OnPlatformExtension onPlatformExtension = new OnPlatformExtension();
		Setter setter11 = new Setter();
		StaticResourceExtension staticResourceExtension5 = new StaticResourceExtension();
		StaticResourceExtension staticResourceExtension6 = new StaticResourceExtension();
		AppThemeBindingExtension appThemeBindingExtension = new AppThemeBindingExtension();
		Setter setter12 = new Setter();
		VisualState visualState = new VisualState();
		StaticResourceExtension staticResourceExtension7 = new StaticResourceExtension();
		Setter setter13 = new Setter();
		StaticResourceExtension staticResourceExtension8 = new StaticResourceExtension();
		StaticResourceExtension staticResourceExtension9 = new StaticResourceExtension();
		AppThemeBindingExtension appThemeBindingExtension2 = new AppThemeBindingExtension();
		Setter setter14 = new Setter();
		VisualState visualState2 = new VisualState();
		VisualStateGroup visualStateGroup = new VisualStateGroup();
		VisualStateGroupList visualStateGroupList = new VisualStateGroupList();
		Setter setter15 = new Setter();
		Style style5 = new Style(typeof(Layout));
		StaticResourceExtension staticResourceExtension10 = new StaticResourceExtension();
		StaticResourceExtension staticResourceExtension11 = new StaticResourceExtension();
		AppThemeBindingExtension appThemeBindingExtension3 = new AppThemeBindingExtension();
		Setter setter16 = new Setter();
		VisualState visualState3 = new VisualState();
		VisualStateGroup visualStateGroup2 = new VisualStateGroup();
		VisualStateGroupList visualStateGroupList2 = new VisualStateGroupList();
		Setter setter17 = new Setter();
		Style style6 = new Style(typeof(Layout));
		ResourceDictionary resourceDictionary = new ResourceDictionary();
		FlyoutHeader flyoutHeader = new FlyoutHeader();
		FlyoutFooter flyoutFooter = new FlyoutFooter();
		string start = AppSnippets.Start;
		StaticResourceExtension staticResourceExtension12 = new StaticResourceExtension();
		StaticResourceExtension staticResourceExtension13 = new StaticResourceExtension();
		AppThemeBindingExtension appThemeBindingExtension4 = new AppThemeBindingExtension();
		FontImageSource fontImageSource = new FontImageSource();
		DataTemplate value = new DataTemplate(typeof(AboutPage));
		ShellContent shellContent = new ShellContent();
		FlyoutItem flyoutItem = new FlyoutItem();
		string miScale = AppSnippets.MiScale;
		StaticResourceExtension staticResourceExtension14 = new StaticResourceExtension();
		StaticResourceExtension staticResourceExtension15 = new StaticResourceExtension();
		AppThemeBindingExtension appThemeBindingExtension5 = new AppThemeBindingExtension();
		FontImageSource fontImageSource2 = new FontImageSource();
		DataTemplate value2 = new DataTemplate(typeof(ScalePage));
		ShellContent shellContent2 = new ShellContent();
		FlyoutItem flyoutItem2 = new FlyoutItem();
		string garminForm = AppSnippets.GarminForm;
		StaticResourceExtension staticResourceExtension16 = new StaticResourceExtension();
		StaticResourceExtension staticResourceExtension17 = new StaticResourceExtension();
		AppThemeBindingExtension appThemeBindingExtension6 = new AppThemeBindingExtension();
		FontImageSource fontImageSource3 = new FontImageSource();
		DataTemplate value3 = new DataTemplate(typeof(FormPage));
		ShellContent shellContent3 = new ShellContent();
		FlyoutItem flyoutItem3 = new FlyoutItem();
		string settings = AppSnippets.Settings;
		StaticResourceExtension staticResourceExtension18 = new StaticResourceExtension();
		StaticResourceExtension staticResourceExtension19 = new StaticResourceExtension();
		AppThemeBindingExtension appThemeBindingExtension7 = new AppThemeBindingExtension();
		FontImageSource fontImageSource4 = new FontImageSource();
		DataTemplate value4 = new DataTemplate(typeof(SettingPage));
		ShellContent shellContent4 = new ShellContent();
		FlyoutItem flyoutItem4 = new FlyoutItem();
		string help = AppSnippets.Help;
		StaticResourceExtension staticResourceExtension20 = new StaticResourceExtension();
		StaticResourceExtension staticResourceExtension21 = new StaticResourceExtension();
		AppThemeBindingExtension appThemeBindingExtension8 = new AppThemeBindingExtension();
		FontImageSource fontImageSource5 = new FontImageSource();
		DataTemplate value5 = new DataTemplate(typeof(HelpPage));
		ShellContent shellContent5 = new ShellContent();
		FlyoutItem flyoutItem5 = new FlyoutItem();
		AppShell appShell;
		NameScope nameScope = (NameScope)(NameScope.GetNameScope(appShell = this) ?? new NameScope());
		NameScope.SetNameScope(appShell, nameScope);
		NameScope nameScope2 = new NameScope();
		NameScope nameScope3 = new NameScope();
		NameScope nameScope4 = new NameScope();
		NameScope nameScope5 = new NameScope();
		NameScope nameScope6 = new NameScope();
		NameScope nameScope7 = new NameScope();
		NameScope nameScope8 = new NameScope();
		NameScope nameScope9 = new NameScope();
		NameScope nameScope10 = new NameScope();
		NameScope nameScope11 = new NameScope();
		NameScope nameScope12 = new NameScope();
		NameScope nameScope13 = new NameScope();
		NameScope nameScope14 = new NameScope();
		NameScope nameScope15;
		((INameScope)(nameScope15 = new NameScope())).RegisterName("CommonStates", (object)visualStateGroup);
		((INameScope)nameScope15).RegisterName("Normal", (object)visualState);
		((INameScope)nameScope15).RegisterName("Selected", (object)visualState2);
		NameScope nameScope16 = new NameScope();
		NameScope nameScope17;
		((INameScope)(nameScope17 = new NameScope())).RegisterName("CommonStates", (object)visualStateGroup2);
		((INameScope)nameScope17).RegisterName("Normal", (object)visualState3);
		appShell.Resources = resourceDictionary;
		setter.Property = Shell.BackgroundColorProperty;
		staticResourceExtension.Key = "Primary";
		StaticResourceExtension staticResourceExtension22 = new StaticResourceExtension
		{
			Key = "Primary"
		};
		XamlServiceProvider xamlServiceProvider = new XamlServiceProvider();
		Type? typeFromHandle = typeof(IProvideValueTarget);
		object[] array2;
		int num;
		object[] array = (array2 = new object[(num = 0) + 4]);
		array[0] = setter;
		array[1] = style;
		array[2] = resourceDictionary;
		array[3] = appShell;
		object service;
		xamlServiceProvider.Add(typeFromHandle, service = new SimpleValueTargetProvider(array, typeof(Setter).GetRuntimeProperty("Value"), new NameScope[5] { nameScope2, nameScope2, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider.Add(typeof(IReferenceProvider), service);
		xamlServiceProvider.Add(typeof(IRootObjectProvider), service);
		xamlServiceProvider.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(16, 58)));
		object value6 = staticResourceExtension22.ProvideValue(xamlServiceProvider);
		setter.Value = value6;
		style.Setters.Add(setter);
		setter2.Property = Shell.ForegroundColorProperty;
		setter2.Value = "White";
		setter2.Value = Colors.White;
		style.Setters.Add(setter2);
		setter3.Property = Shell.TitleColorProperty;
		setter3.Value = "White";
		setter3.Value = Colors.White;
		style.Setters.Add(setter3);
		setter4.Property = Shell.DisabledColorProperty;
		setter4.Value = "#B4FFFFFF";
		setter4.Value = new Color(1f, 1f, 1f, 180f / 255f);
		style.Setters.Add(setter4);
		setter5.Property = Shell.UnselectedColorProperty;
		setter5.Value = "#95FFFFFF";
		setter5.Value = new Color(1f, 1f, 1f, 149f / 255f);
		style.Setters.Add(setter5);
		setter6.Property = Shell.TabBarBackgroundColorProperty;
		staticResourceExtension2.Key = "Primary";
		StaticResourceExtension staticResourceExtension23 = new StaticResourceExtension
		{
			Key = "Primary"
		};
		XamlServiceProvider xamlServiceProvider2 = new XamlServiceProvider();
		Type? typeFromHandle2 = typeof(IProvideValueTarget);
		object[] array4;
		int num2;
		object[] array3 = (array4 = new object[(num2 = 0) + 4]);
		array3[0] = setter6;
		array3[1] = style;
		array3[2] = resourceDictionary;
		array3[3] = appShell;
		object service2;
		xamlServiceProvider2.Add(typeFromHandle2, service2 = new SimpleValueTargetProvider(array3, typeof(Setter).GetRuntimeProperty("Value"), new NameScope[5] { nameScope7, nameScope7, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider2.Add(typeof(IReferenceProvider), service2);
		xamlServiceProvider2.Add(typeof(IRootObjectProvider), service2);
		xamlServiceProvider2.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(21, 64)));
		object value7 = staticResourceExtension23.ProvideValue(xamlServiceProvider2);
		setter6.Value = value7;
		style.Setters.Add(setter6);
		setter7.Property = Shell.TabBarForegroundColorProperty;
		setter7.Value = "White";
		setter7.Value = Colors.White;
		style.Setters.Add(setter7);
		setter8.Property = Shell.TabBarUnselectedColorProperty;
		setter8.Value = "#95FFFFFF";
		setter8.Value = new Color(1f, 1f, 1f, 149f / 255f);
		style.Setters.Add(setter8);
		setter9.Property = Shell.TabBarTitleColorProperty;
		setter9.Value = "White";
		setter9.Value = Colors.White;
		style.Setters.Add(setter9);
		resourceDictionary.Add("BaseStyle", style);
		staticResourceExtension3.Key = "BaseStyle";
		style2.BasedOn = style;
		resourceDictionary.Add(style2);
		staticResourceExtension4.Key = "BaseStyle";
		style3.BasedOn = style;
		resourceDictionary.Add(style3);
		style4.Class = "FlyoutItemLabelStyle";
		setter10.Property = Label.TextColorProperty;
		setter10.Value = "White";
		setter10.Value = Colors.White;
		style4.Setters.Add(setter10);
		resourceDictionary.Add(style4);
		style5.ApplyToDerivedTypes = true;
		style5.Class = "FlyoutItemLayoutStyle";
		setter15.Property = VisualStateManager.VisualStateGroupsProperty;
		visualStateGroup.Name = "CommonStates";
		visualState.Name = "Normal";
		setter11.Property = VisualElement.BackgroundColorProperty;
		onPlatformExtension.UWP = "Transparent";
		onPlatformExtension.iOS = "White";
		XamlServiceProvider xamlServiceProvider3 = new XamlServiceProvider();
		xamlServiceProvider3.Add(typeof(IProvideValueTarget), new ValueTargetProvider(setter11, typeof(Setter).GetRuntimeProperty("Value")));
		xamlServiceProvider3.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(45, 72)));
		object value8 = ((IMarkupExtension)onPlatformExtension).ProvideValue((IServiceProvider)xamlServiceProvider3);
		setter11.Value = value8;
		visualState.Setters.Add(setter11);
		setter12.TargetName = "FlyoutItemLabel";
		setter12.Property = Label.TextColorProperty;
		staticResourceExtension5.Key = "Black";
		StaticResourceExtension staticResourceExtension24 = new StaticResourceExtension
		{
			Key = "Black"
		};
		XamlServiceProvider xamlServiceProvider4 = new XamlServiceProvider();
		Type? typeFromHandle3 = typeof(IProvideValueTarget);
		object[] array6;
		int num3;
		object[] array5 = (array6 = new object[(num3 = 0) + 9]);
		array5[0] = appThemeBindingExtension;
		array5[1] = setter12;
		array5[2] = visualState;
		array5[3] = visualStateGroup;
		array5[4] = visualStateGroupList;
		array5[5] = setter15;
		array5[6] = style5;
		array5[7] = resourceDictionary;
		array5[8] = appShell;
		object service3;
		xamlServiceProvider4.Add(typeFromHandle3, service3 = new SimpleValueTargetProvider(array5, typeof(AppThemeBindingExtension).GetRuntimeProperty("Light"), new NameScope[11]
		{
			nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope14, nameScope14, nameScope, nameScope,
			nameScope
		}, appShell));
		xamlServiceProvider4.Add(typeof(IReferenceProvider), service3);
		xamlServiceProvider4.Add(typeof(IRootObjectProvider), service3);
		xamlServiceProvider4.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(46, 101)));
		object light = staticResourceExtension24.ProvideValue(xamlServiceProvider4);
		appThemeBindingExtension.Light = light;
		staticResourceExtension6.Key = "White";
		StaticResourceExtension staticResourceExtension25 = new StaticResourceExtension
		{
			Key = "White"
		};
		XamlServiceProvider xamlServiceProvider5 = new XamlServiceProvider();
		Type? typeFromHandle4 = typeof(IProvideValueTarget);
		object[] array8;
		int num4;
		object[] array7 = (array8 = new object[(num4 = 0) + 9]);
		array7[0] = appThemeBindingExtension;
		array7[1] = setter12;
		array7[2] = visualState;
		array7[3] = visualStateGroup;
		array7[4] = visualStateGroupList;
		array7[5] = setter15;
		array7[6] = style5;
		array7[7] = resourceDictionary;
		array7[8] = appShell;
		object service4;
		xamlServiceProvider5.Add(typeFromHandle4, service4 = new SimpleValueTargetProvider(array7, typeof(AppThemeBindingExtension).GetRuntimeProperty("Dark"), new NameScope[11]
		{
			nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope14, nameScope14, nameScope, nameScope,
			nameScope
		}, appShell));
		xamlServiceProvider5.Add(typeof(IReferenceProvider), service4);
		xamlServiceProvider5.Add(typeof(IRootObjectProvider), service4);
		xamlServiceProvider5.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(46, 101)));
		object dark = staticResourceExtension25.ProvideValue(xamlServiceProvider5);
		appThemeBindingExtension.Dark = dark;
		XamlServiceProvider xamlServiceProvider6 = new XamlServiceProvider();
		xamlServiceProvider6.Add(typeof(IProvideValueTarget), new ValueTargetProvider(setter12, typeof(Setter).GetRuntimeProperty("Value")));
		xamlServiceProvider6.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(46, 101)));
		BindingBase value9 = ((IMarkupExtension<BindingBase>)appThemeBindingExtension).ProvideValue((IServiceProvider)xamlServiceProvider6);
		setter12.Value = value9;
		visualState.Setters.Add(setter12);
		visualStateGroup.States.Add(visualState);
		visualState2.Name = "Selected";
		setter13.Property = VisualElement.BackgroundColorProperty;
		staticResourceExtension7.Key = "Primary";
		StaticResourceExtension staticResourceExtension26 = new StaticResourceExtension
		{
			Key = "Primary"
		};
		XamlServiceProvider xamlServiceProvider7 = new XamlServiceProvider();
		Type? typeFromHandle5 = typeof(IProvideValueTarget);
		object[] array10;
		int num5;
		object[] array9 = (array10 = new object[(num5 = 0) + 8]);
		array9[0] = setter13;
		array9[1] = visualState2;
		array9[2] = visualStateGroup;
		array9[3] = visualStateGroupList;
		array9[4] = setter15;
		array9[5] = style5;
		array9[6] = resourceDictionary;
		array9[7] = appShell;
		object service5;
		xamlServiceProvider7.Add(typeFromHandle5, service5 = new SimpleValueTargetProvider(array9, typeof(Setter).GetRuntimeProperty("Value"), new NameScope[10] { nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope14, nameScope14, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider7.Add(typeof(IReferenceProvider), service5);
		xamlServiceProvider7.Add(typeof(IRootObjectProvider), service5);
		xamlServiceProvider7.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(51, 72)));
		object value10 = staticResourceExtension26.ProvideValue(xamlServiceProvider7);
		setter13.Value = value10;
		visualState2.Setters.Add(setter13);
		setter14.TargetName = "FlyoutItemLabel";
		setter14.Property = Label.TextColorProperty;
		staticResourceExtension8.Key = "Black";
		StaticResourceExtension staticResourceExtension27 = new StaticResourceExtension
		{
			Key = "Black"
		};
		XamlServiceProvider xamlServiceProvider8 = new XamlServiceProvider();
		Type? typeFromHandle6 = typeof(IProvideValueTarget);
		object[] array12;
		int num6;
		object[] array11 = (array12 = new object[(num6 = 0) + 9]);
		array11[0] = appThemeBindingExtension2;
		array11[1] = setter14;
		array11[2] = visualState2;
		array11[3] = visualStateGroup;
		array11[4] = visualStateGroupList;
		array11[5] = setter15;
		array11[6] = style5;
		array11[7] = resourceDictionary;
		array11[8] = appShell;
		object service6;
		xamlServiceProvider8.Add(typeFromHandle6, service6 = new SimpleValueTargetProvider(array11, typeof(AppThemeBindingExtension).GetRuntimeProperty("Light"), new NameScope[11]
		{
			nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope14, nameScope14, nameScope, nameScope,
			nameScope
		}, appShell));
		xamlServiceProvider8.Add(typeof(IReferenceProvider), service6);
		xamlServiceProvider8.Add(typeof(IRootObjectProvider), service6);
		xamlServiceProvider8.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(52, 101)));
		object light2 = staticResourceExtension27.ProvideValue(xamlServiceProvider8);
		appThemeBindingExtension2.Light = light2;
		staticResourceExtension9.Key = "White";
		StaticResourceExtension staticResourceExtension28 = new StaticResourceExtension
		{
			Key = "White"
		};
		XamlServiceProvider xamlServiceProvider9 = new XamlServiceProvider();
		Type? typeFromHandle7 = typeof(IProvideValueTarget);
		object[] array14;
		int num7;
		object[] array13 = (array14 = new object[(num7 = 0) + 9]);
		array13[0] = appThemeBindingExtension2;
		array13[1] = setter14;
		array13[2] = visualState2;
		array13[3] = visualStateGroup;
		array13[4] = visualStateGroupList;
		array13[5] = setter15;
		array13[6] = style5;
		array13[7] = resourceDictionary;
		array13[8] = appShell;
		object service7;
		xamlServiceProvider9.Add(typeFromHandle7, service7 = new SimpleValueTargetProvider(array13, typeof(AppThemeBindingExtension).GetRuntimeProperty("Dark"), new NameScope[11]
		{
			nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope15, nameScope14, nameScope14, nameScope, nameScope,
			nameScope
		}, appShell));
		xamlServiceProvider9.Add(typeof(IReferenceProvider), service7);
		xamlServiceProvider9.Add(typeof(IRootObjectProvider), service7);
		xamlServiceProvider9.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(52, 101)));
		object dark2 = staticResourceExtension28.ProvideValue(xamlServiceProvider9);
		appThemeBindingExtension2.Dark = dark2;
		XamlServiceProvider xamlServiceProvider10 = new XamlServiceProvider();
		xamlServiceProvider10.Add(typeof(IProvideValueTarget), new ValueTargetProvider(setter14, typeof(Setter).GetRuntimeProperty("Value")));
		xamlServiceProvider10.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(52, 101)));
		BindingBase value11 = ((IMarkupExtension<BindingBase>)appThemeBindingExtension2).ProvideValue((IServiceProvider)xamlServiceProvider10);
		setter14.Value = value11;
		visualState2.Setters.Add(setter14);
		visualStateGroup.States.Add(visualState2);
		visualStateGroupList.Add(visualStateGroup);
		setter15.Value = visualStateGroupList;
		style5.Setters.Add(setter15);
		resourceDictionary.Add(style5);
		style6.ApplyToDerivedTypes = true;
		style6.Class = "MenuItemLayoutStyle";
		setter17.Property = VisualStateManager.VisualStateGroupsProperty;
		visualStateGroup2.Name = "CommonStates";
		visualState3.Name = "Normal";
		setter16.TargetName = "FlyoutItemLabel";
		setter16.Property = Label.TextColorProperty;
		staticResourceExtension10.Key = "Black";
		StaticResourceExtension staticResourceExtension29 = new StaticResourceExtension
		{
			Key = "Black"
		};
		XamlServiceProvider xamlServiceProvider11 = new XamlServiceProvider();
		Type? typeFromHandle8 = typeof(IProvideValueTarget);
		object[] array16;
		int num8;
		object[] array15 = (array16 = new object[(num8 = 0) + 9]);
		array15[0] = appThemeBindingExtension3;
		array15[1] = setter16;
		array15[2] = visualState3;
		array15[3] = visualStateGroup2;
		array15[4] = visualStateGroupList2;
		array15[5] = setter17;
		array15[6] = style6;
		array15[7] = resourceDictionary;
		array15[8] = appShell;
		object service8;
		xamlServiceProvider11.Add(typeFromHandle8, service8 = new SimpleValueTargetProvider(array15, typeof(AppThemeBindingExtension).GetRuntimeProperty("Light"), new NameScope[10] { nameScope17, nameScope17, nameScope17, nameScope17, nameScope17, nameScope16, nameScope16, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider11.Add(typeof(IReferenceProvider), service8);
		xamlServiceProvider11.Add(typeof(IRootObjectProvider), service8);
		xamlServiceProvider11.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(72, 101)));
		object light3 = staticResourceExtension29.ProvideValue(xamlServiceProvider11);
		appThemeBindingExtension3.Light = light3;
		staticResourceExtension11.Key = "White";
		StaticResourceExtension staticResourceExtension30 = new StaticResourceExtension
		{
			Key = "White"
		};
		XamlServiceProvider xamlServiceProvider12 = new XamlServiceProvider();
		Type? typeFromHandle9 = typeof(IProvideValueTarget);
		object[] array18;
		int num9;
		object[] array17 = (array18 = new object[(num9 = 0) + 9]);
		array17[0] = appThemeBindingExtension3;
		array17[1] = setter16;
		array17[2] = visualState3;
		array17[3] = visualStateGroup2;
		array17[4] = visualStateGroupList2;
		array17[5] = setter17;
		array17[6] = style6;
		array17[7] = resourceDictionary;
		array17[8] = appShell;
		object service9;
		xamlServiceProvider12.Add(typeFromHandle9, service9 = new SimpleValueTargetProvider(array17, typeof(AppThemeBindingExtension).GetRuntimeProperty("Dark"), new NameScope[10] { nameScope17, nameScope17, nameScope17, nameScope17, nameScope17, nameScope16, nameScope16, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider12.Add(typeof(IReferenceProvider), service9);
		xamlServiceProvider12.Add(typeof(IRootObjectProvider), service9);
		xamlServiceProvider12.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(72, 101)));
		object dark3 = staticResourceExtension30.ProvideValue(xamlServiceProvider12);
		appThemeBindingExtension3.Dark = dark3;
		XamlServiceProvider xamlServiceProvider13 = new XamlServiceProvider();
		xamlServiceProvider13.Add(typeof(IProvideValueTarget), new ValueTargetProvider(setter16, typeof(Setter).GetRuntimeProperty("Value")));
		xamlServiceProvider13.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(72, 101)));
		BindingBase value12 = ((IMarkupExtension<BindingBase>)appThemeBindingExtension3).ProvideValue((IServiceProvider)xamlServiceProvider13);
		setter16.Value = value12;
		visualState3.Setters.Add(setter16);
		visualStateGroup2.States.Add(visualState3);
		visualStateGroupList2.Add(visualStateGroup2);
		setter17.Value = visualStateGroupList2;
		style6.Setters.Add(setter17);
		resourceDictionary.Add(style6);
		appShell.SetValue(Shell.FlyoutBackgroundImageAspectProperty, Aspect.AspectFill);
		appShell.SetValue(Shell.FlyoutHeaderBehaviorProperty, FlyoutHeaderBehavior.CollapseOnScroll);
		appShell.Resources = resourceDictionary;
		appShell.SetValue(Shell.FlyoutHeaderProperty, flyoutHeader);
		appShell.SetValue(Shell.FlyoutFooterProperty, flyoutFooter);
		flyoutItem.SetValue(BaseShellItem.TitleProperty, start);
		fontImageSource.SetValue(FontImageSource.FontFamilyProperty, "FontAwesome6Solid");
		fontImageSource.SetValue(FontImageSource.GlyphProperty, "\uf05a");
		fontImageSource.SetValue(FontImageSource.SizeProperty, 16.0);
		staticResourceExtension12.Key = "Black";
		StaticResourceExtension staticResourceExtension31 = new StaticResourceExtension
		{
			Key = "Black"
		};
		XamlServiceProvider xamlServiceProvider14 = new XamlServiceProvider();
		Type? typeFromHandle10 = typeof(IProvideValueTarget);
		object[] array20;
		int num10;
		object[] array19 = (array20 = new object[(num10 = 0) + 4]);
		array19[0] = appThemeBindingExtension4;
		array19[1] = fontImageSource;
		array19[2] = flyoutItem;
		array19[3] = appShell;
		object service10;
		xamlServiceProvider14.Add(typeFromHandle10, service10 = new SimpleValueTargetProvider(array19, typeof(AppThemeBindingExtension).GetRuntimeProperty("Light"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider14.Add(typeof(IReferenceProvider), service10);
		xamlServiceProvider14.Add(typeof(IRootObjectProvider), service10);
		xamlServiceProvider14.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(97, 17)));
		object light4 = staticResourceExtension31.ProvideValue(xamlServiceProvider14);
		appThemeBindingExtension4.Light = light4;
		staticResourceExtension13.Key = "White";
		StaticResourceExtension staticResourceExtension32 = new StaticResourceExtension
		{
			Key = "White"
		};
		XamlServiceProvider xamlServiceProvider15 = new XamlServiceProvider();
		Type? typeFromHandle11 = typeof(IProvideValueTarget);
		object[] array22;
		int num11;
		object[] array21 = (array22 = new object[(num11 = 0) + 4]);
		array21[0] = appThemeBindingExtension4;
		array21[1] = fontImageSource;
		array21[2] = flyoutItem;
		array21[3] = appShell;
		object service11;
		xamlServiceProvider15.Add(typeFromHandle11, service11 = new SimpleValueTargetProvider(array21, typeof(AppThemeBindingExtension).GetRuntimeProperty("Dark"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider15.Add(typeof(IReferenceProvider), service11);
		xamlServiceProvider15.Add(typeof(IRootObjectProvider), service11);
		xamlServiceProvider15.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(97, 17)));
		object dark4 = staticResourceExtension32.ProvideValue(xamlServiceProvider15);
		appThemeBindingExtension4.Dark = dark4;
		XamlServiceProvider xamlServiceProvider16 = new XamlServiceProvider();
		xamlServiceProvider16.Add(typeof(IProvideValueTarget), new ValueTargetProvider(fontImageSource, FontImageSource.ColorProperty));
		xamlServiceProvider16.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(97, 17)));
		BindingBase binding = ((IMarkupExtension<BindingBase>)appThemeBindingExtension4).ProvideValue((IServiceProvider)xamlServiceProvider16);
		fontImageSource.SetBinding(FontImageSource.ColorProperty, binding);
		flyoutItem.SetValue(BaseShellItem.IconProperty, fontImageSource);
		shellContent.SetValue(ShellContent.ContentTemplateProperty, value);
		shellContent.Route = "AboutPage";
		((ICollection<ShellSection>)flyoutItem.GetValue(ShellItem.ItemsProperty)).Add((ShellSection)shellContent);
		((ICollection<ShellItem>)appShell.GetValue(Shell.ItemsProperty)).Add((ShellItem)flyoutItem);
		flyoutItem2.SetValue(BaseShellItem.TitleProperty, miScale);
		fontImageSource2.SetValue(FontImageSource.FontFamilyProperty, "FontAwesome6Solid");
		fontImageSource2.SetValue(FontImageSource.GlyphProperty, "\uf496");
		fontImageSource2.SetValue(FontImageSource.SizeProperty, 16.0);
		staticResourceExtension14.Key = "Black";
		StaticResourceExtension staticResourceExtension33 = new StaticResourceExtension
		{
			Key = "Black"
		};
		XamlServiceProvider xamlServiceProvider17 = new XamlServiceProvider();
		Type? typeFromHandle12 = typeof(IProvideValueTarget);
		object[] array24;
		int num12;
		object[] array23 = (array24 = new object[(num12 = 0) + 4]);
		array23[0] = appThemeBindingExtension5;
		array23[1] = fontImageSource2;
		array23[2] = flyoutItem2;
		array23[3] = appShell;
		object service12;
		xamlServiceProvider17.Add(typeFromHandle12, service12 = new SimpleValueTargetProvider(array23, typeof(AppThemeBindingExtension).GetRuntimeProperty("Light"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider17.Add(typeof(IReferenceProvider), service12);
		xamlServiceProvider17.Add(typeof(IRootObjectProvider), service12);
		xamlServiceProvider17.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(109, 17)));
		object light5 = staticResourceExtension33.ProvideValue(xamlServiceProvider17);
		appThemeBindingExtension5.Light = light5;
		staticResourceExtension15.Key = "White";
		StaticResourceExtension staticResourceExtension34 = new StaticResourceExtension
		{
			Key = "White"
		};
		XamlServiceProvider xamlServiceProvider18 = new XamlServiceProvider();
		Type? typeFromHandle13 = typeof(IProvideValueTarget);
		object[] array26;
		int num13;
		object[] array25 = (array26 = new object[(num13 = 0) + 4]);
		array25[0] = appThemeBindingExtension5;
		array25[1] = fontImageSource2;
		array25[2] = flyoutItem2;
		array25[3] = appShell;
		object service13;
		xamlServiceProvider18.Add(typeFromHandle13, service13 = new SimpleValueTargetProvider(array25, typeof(AppThemeBindingExtension).GetRuntimeProperty("Dark"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider18.Add(typeof(IReferenceProvider), service13);
		xamlServiceProvider18.Add(typeof(IRootObjectProvider), service13);
		xamlServiceProvider18.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(109, 17)));
		object dark5 = staticResourceExtension34.ProvideValue(xamlServiceProvider18);
		appThemeBindingExtension5.Dark = dark5;
		XamlServiceProvider xamlServiceProvider19 = new XamlServiceProvider();
		xamlServiceProvider19.Add(typeof(IProvideValueTarget), new ValueTargetProvider(fontImageSource2, FontImageSource.ColorProperty));
		xamlServiceProvider19.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(109, 17)));
		BindingBase binding2 = ((IMarkupExtension<BindingBase>)appThemeBindingExtension5).ProvideValue((IServiceProvider)xamlServiceProvider19);
		fontImageSource2.SetBinding(FontImageSource.ColorProperty, binding2);
		flyoutItem2.SetValue(BaseShellItem.IconProperty, fontImageSource2);
		shellContent2.SetValue(ShellContent.ContentTemplateProperty, value2);
		shellContent2.Route = "ScalePage";
		((ICollection<ShellSection>)flyoutItem2.GetValue(ShellItem.ItemsProperty)).Add((ShellSection)shellContent2);
		((ICollection<ShellItem>)appShell.GetValue(Shell.ItemsProperty)).Add((ShellItem)flyoutItem2);
		flyoutItem3.SetValue(BaseShellItem.TitleProperty, garminForm);
		fontImageSource3.SetValue(FontImageSource.FontFamilyProperty, "FontAwesome6Solid");
		fontImageSource3.SetValue(FontImageSource.GlyphProperty, "\uf0ee");
		fontImageSource3.SetValue(FontImageSource.SizeProperty, 16.0);
		staticResourceExtension16.Key = "Black";
		StaticResourceExtension staticResourceExtension35 = new StaticResourceExtension
		{
			Key = "Black"
		};
		XamlServiceProvider xamlServiceProvider20 = new XamlServiceProvider();
		Type? typeFromHandle14 = typeof(IProvideValueTarget);
		object[] array28;
		int num14;
		object[] array27 = (array28 = new object[(num14 = 0) + 4]);
		array27[0] = appThemeBindingExtension6;
		array27[1] = fontImageSource3;
		array27[2] = flyoutItem3;
		array27[3] = appShell;
		object service14;
		xamlServiceProvider20.Add(typeFromHandle14, service14 = new SimpleValueTargetProvider(array27, typeof(AppThemeBindingExtension).GetRuntimeProperty("Light"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider20.Add(typeof(IReferenceProvider), service14);
		xamlServiceProvider20.Add(typeof(IRootObjectProvider), service14);
		xamlServiceProvider20.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(121, 17)));
		object light6 = staticResourceExtension35.ProvideValue(xamlServiceProvider20);
		appThemeBindingExtension6.Light = light6;
		staticResourceExtension17.Key = "White";
		StaticResourceExtension staticResourceExtension36 = new StaticResourceExtension
		{
			Key = "White"
		};
		XamlServiceProvider xamlServiceProvider21 = new XamlServiceProvider();
		Type? typeFromHandle15 = typeof(IProvideValueTarget);
		object[] array30;
		int num15;
		object[] array29 = (array30 = new object[(num15 = 0) + 4]);
		array29[0] = appThemeBindingExtension6;
		array29[1] = fontImageSource3;
		array29[2] = flyoutItem3;
		array29[3] = appShell;
		object service15;
		xamlServiceProvider21.Add(typeFromHandle15, service15 = new SimpleValueTargetProvider(array29, typeof(AppThemeBindingExtension).GetRuntimeProperty("Dark"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider21.Add(typeof(IReferenceProvider), service15);
		xamlServiceProvider21.Add(typeof(IRootObjectProvider), service15);
		xamlServiceProvider21.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(121, 17)));
		object dark6 = staticResourceExtension36.ProvideValue(xamlServiceProvider21);
		appThemeBindingExtension6.Dark = dark6;
		XamlServiceProvider xamlServiceProvider22 = new XamlServiceProvider();
		xamlServiceProvider22.Add(typeof(IProvideValueTarget), new ValueTargetProvider(fontImageSource3, FontImageSource.ColorProperty));
		xamlServiceProvider22.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(121, 17)));
		BindingBase binding3 = ((IMarkupExtension<BindingBase>)appThemeBindingExtension6).ProvideValue((IServiceProvider)xamlServiceProvider22);
		fontImageSource3.SetBinding(FontImageSource.ColorProperty, binding3);
		flyoutItem3.SetValue(BaseShellItem.IconProperty, fontImageSource3);
		shellContent3.SetValue(ShellContent.ContentTemplateProperty, value3);
		shellContent3.Route = "FormPage";
		((ICollection<ShellSection>)flyoutItem3.GetValue(ShellItem.ItemsProperty)).Add((ShellSection)shellContent3);
		((ICollection<ShellItem>)appShell.GetValue(Shell.ItemsProperty)).Add((ShellItem)flyoutItem3);
		flyoutItem4.SetValue(BaseShellItem.TitleProperty, settings);
		fontImageSource4.SetValue(FontImageSource.FontFamilyProperty, "FontAwesome6Solid");
		fontImageSource4.SetValue(FontImageSource.GlyphProperty, "\uf013");
		fontImageSource4.SetValue(FontImageSource.SizeProperty, 16.0);
		staticResourceExtension18.Key = "Black";
		StaticResourceExtension staticResourceExtension37 = new StaticResourceExtension
		{
			Key = "Black"
		};
		XamlServiceProvider xamlServiceProvider23 = new XamlServiceProvider();
		Type? typeFromHandle16 = typeof(IProvideValueTarget);
		object[] array32;
		int num16;
		object[] array31 = (array32 = new object[(num16 = 0) + 4]);
		array31[0] = appThemeBindingExtension7;
		array31[1] = fontImageSource4;
		array31[2] = flyoutItem4;
		array31[3] = appShell;
		object service16;
		xamlServiceProvider23.Add(typeFromHandle16, service16 = new SimpleValueTargetProvider(array31, typeof(AppThemeBindingExtension).GetRuntimeProperty("Light"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider23.Add(typeof(IReferenceProvider), service16);
		xamlServiceProvider23.Add(typeof(IRootObjectProvider), service16);
		xamlServiceProvider23.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(133, 17)));
		object light7 = staticResourceExtension37.ProvideValue(xamlServiceProvider23);
		appThemeBindingExtension7.Light = light7;
		staticResourceExtension19.Key = "White";
		StaticResourceExtension staticResourceExtension38 = new StaticResourceExtension
		{
			Key = "White"
		};
		XamlServiceProvider xamlServiceProvider24 = new XamlServiceProvider();
		Type? typeFromHandle17 = typeof(IProvideValueTarget);
		object[] array34;
		int num17;
		object[] array33 = (array34 = new object[(num17 = 0) + 4]);
		array33[0] = appThemeBindingExtension7;
		array33[1] = fontImageSource4;
		array33[2] = flyoutItem4;
		array33[3] = appShell;
		object service17;
		xamlServiceProvider24.Add(typeFromHandle17, service17 = new SimpleValueTargetProvider(array33, typeof(AppThemeBindingExtension).GetRuntimeProperty("Dark"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider24.Add(typeof(IReferenceProvider), service17);
		xamlServiceProvider24.Add(typeof(IRootObjectProvider), service17);
		xamlServiceProvider24.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(133, 17)));
		object dark7 = staticResourceExtension38.ProvideValue(xamlServiceProvider24);
		appThemeBindingExtension7.Dark = dark7;
		XamlServiceProvider xamlServiceProvider25 = new XamlServiceProvider();
		xamlServiceProvider25.Add(typeof(IProvideValueTarget), new ValueTargetProvider(fontImageSource4, FontImageSource.ColorProperty));
		xamlServiceProvider25.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(133, 17)));
		BindingBase binding4 = ((IMarkupExtension<BindingBase>)appThemeBindingExtension7).ProvideValue((IServiceProvider)xamlServiceProvider25);
		fontImageSource4.SetBinding(FontImageSource.ColorProperty, binding4);
		flyoutItem4.SetValue(BaseShellItem.IconProperty, fontImageSource4);
		shellContent4.SetValue(ShellContent.ContentTemplateProperty, value4);
		shellContent4.Route = "Settings";
		((ICollection<ShellSection>)flyoutItem4.GetValue(ShellItem.ItemsProperty)).Add((ShellSection)shellContent4);
		((ICollection<ShellItem>)appShell.GetValue(Shell.ItemsProperty)).Add((ShellItem)flyoutItem4);
		flyoutItem5.SetValue(BaseShellItem.TitleProperty, help);
		fontImageSource5.SetValue(FontImageSource.FontFamilyProperty, "FontAwesome6Solid");
		fontImageSource5.SetValue(FontImageSource.GlyphProperty, "\uf059");
		fontImageSource5.SetValue(FontImageSource.SizeProperty, 16.0);
		staticResourceExtension20.Key = "Black";
		StaticResourceExtension staticResourceExtension39 = new StaticResourceExtension
		{
			Key = "Black"
		};
		XamlServiceProvider xamlServiceProvider26 = new XamlServiceProvider();
		Type? typeFromHandle18 = typeof(IProvideValueTarget);
		object[] array36;
		int num18;
		object[] array35 = (array36 = new object[(num18 = 0) + 4]);
		array35[0] = appThemeBindingExtension8;
		array35[1] = fontImageSource5;
		array35[2] = flyoutItem5;
		array35[3] = appShell;
		object service18;
		xamlServiceProvider26.Add(typeFromHandle18, service18 = new SimpleValueTargetProvider(array35, typeof(AppThemeBindingExtension).GetRuntimeProperty("Light"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider26.Add(typeof(IReferenceProvider), service18);
		xamlServiceProvider26.Add(typeof(IRootObjectProvider), service18);
		xamlServiceProvider26.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(144, 17)));
		object light8 = staticResourceExtension39.ProvideValue(xamlServiceProvider26);
		appThemeBindingExtension8.Light = light8;
		staticResourceExtension21.Key = "White";
		StaticResourceExtension staticResourceExtension40 = new StaticResourceExtension
		{
			Key = "White"
		};
		XamlServiceProvider xamlServiceProvider27 = new XamlServiceProvider();
		Type? typeFromHandle19 = typeof(IProvideValueTarget);
		object[] array38;
		int num19;
		object[] array37 = (array38 = new object[(num19 = 0) + 4]);
		array37[0] = appThemeBindingExtension8;
		array37[1] = fontImageSource5;
		array37[2] = flyoutItem5;
		array37[3] = appShell;
		object service19;
		xamlServiceProvider27.Add(typeFromHandle19, service19 = new SimpleValueTargetProvider(array37, typeof(AppThemeBindingExtension).GetRuntimeProperty("Dark"), new NameScope[5] { nameScope, nameScope, nameScope, nameScope, nameScope }, appShell));
		xamlServiceProvider27.Add(typeof(IReferenceProvider), service19);
		xamlServiceProvider27.Add(typeof(IRootObjectProvider), service19);
		xamlServiceProvider27.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(144, 17)));
		object dark8 = staticResourceExtension40.ProvideValue(xamlServiceProvider27);
		appThemeBindingExtension8.Dark = dark8;
		XamlServiceProvider xamlServiceProvider28 = new XamlServiceProvider();
		xamlServiceProvider28.Add(typeof(IProvideValueTarget), new ValueTargetProvider(fontImageSource5, FontImageSource.ColorProperty));
		xamlServiceProvider28.Add(typeof(IXmlLineInfoProvider), new XmlLineInfoProvider(new XmlLineInfo(144, 17)));
		BindingBase binding5 = ((IMarkupExtension<BindingBase>)appThemeBindingExtension8).ProvideValue((IServiceProvider)xamlServiceProvider28);
		fontImageSource5.SetBinding(FontImageSource.ColorProperty, binding5);
		flyoutItem5.SetValue(BaseShellItem.IconProperty, fontImageSource5);
		shellContent5.SetValue(ShellContent.ContentTemplateProperty, value5);
		shellContent5.Route = "HelpPage";
		((ICollection<ShellSection>)flyoutItem5.GetValue(ShellItem.ItemsProperty)).Add((ShellSection)shellContent5);
		((ICollection<ShellItem>)appShell.GetValue(Shell.ItemsProperty)).Add((ShellItem)flyoutItem5);
	}
}
