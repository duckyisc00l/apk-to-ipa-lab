using System;
using System.CodeDom.Compiler;
using System.Globalization;
using System.Threading;
using Autofac;
using Autofac.Extras.CommonServiceLocator;
using CommonServiceLocator;
using CommunityToolkit.Maui.Storage;
using MiScaleExporter.MAUI.ViewModels;
using MiScaleExporter.Models;
using MiScaleExporter.Services;
using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Internals;
using Microsoft.Maui.Controls.Xaml;
using __XamlGeneratedCode__;

namespace MiScaleExporter.MAUI;

[XamlFilePath("App.xaml")]
public class App : Application
{
	public static Autofac.IContainer Container;

	public static BodyComposition BodyComposition;

	public App()
	{
		CultureInfo.DefaultThreadCurrentCulture = Thread.CurrentThread.CurrentCulture;
		InitializeComponent();
	}

	protected override Window CreateWindow(IActivationState activationState)
	{
		if (MainPage == null)
		{
			AutofacInit();
			MainPage = new AppShell();
		}
		return base.CreateWindow(activationState);
	}

	protected override void OnStart()
	{
		base.OnStart();
		AutofacInit();
		MainPage = new AppShell();
	}

	protected void AutofacInit()
	{
		ContainerBuilder containerBuilder = new ContainerBuilder();
		containerBuilder.RegisterType<Scale>().As<IScale>().InstancePerLifetimeScope();
		containerBuilder.RegisterType<DataInterpreter>().As<IDataInterpreter>().InstancePerLifetimeScope();
		containerBuilder.RegisterType<GarminService>().As<IGarminService>().InstancePerLifetimeScope();
		containerBuilder.RegisterType<ScaleViewModel>().As<IScaleViewModel>().InstancePerLifetimeScope();
		containerBuilder.RegisterType<FormViewModel>().As<IFormViewModel>().InstancePerLifetimeScope();
		containerBuilder.RegisterType<LogService>().As<ILogService>().SingleInstance();
		containerBuilder.RegisterType<SettingsViewModel>().As<ISettingsViewModel>().InstancePerLifetimeScope();
		containerBuilder.RegisterType<AboutViewModel>().AsSelf();
		containerBuilder.RegisterInstance(FileSaver.Default).SingleInstance();
		Container = containerBuilder.Build();
		ServiceLocator.SetLocatorProvider(() => new AutofacServiceLocator(Container));
	}

	[GeneratedCode("Microsoft.Maui.Controls.SourceGen", "1.0.0.0")]
	private void InitializeComponent()
	{
		ResourceDictionary resourceDictionary = new ResourceDictionary();
		ResourceDictionary resourceDictionary2 = new ResourceDictionary();
		ResourceDictionary resourceDictionary3 = new ResourceDictionary();
		App app;
		NameScope value = (NameScope)(NameScope.GetNameScope(app = this) ?? new NameScope());
		NameScope.SetNameScope(app, value);
		app.Resources = resourceDictionary3;
		Uri uri = new Uri("Resources/Styles/Colors.xaml;assembly=MiScaleExporter.MAUI", UriKind.RelativeOrAbsolute);
		resourceDictionary.SetAndCreateSource<__Type2CC9CB2307706B01>(uri);
		resourceDictionary.Source = uri;
		resourceDictionary3.MergedDictionaries.Add(resourceDictionary);
		Uri uri2 = new Uri("Resources/Styles/Styles.xaml;assembly=MiScaleExporter.MAUI", UriKind.RelativeOrAbsolute);
		resourceDictionary2.SetAndCreateSource<__Type1B7061DB11EEDF9F>(uri2);
		resourceDictionary2.Source = uri2;
		resourceDictionary3.MergedDictionaries.Add(resourceDictionary2);
		app.Resources = resourceDictionary3;
	}
}
