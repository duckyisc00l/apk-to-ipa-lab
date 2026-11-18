using System.Windows.Input;
using MiScaleExporter.MAUI.Resources.Localization;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;

namespace MiScaleExporter.MAUI.ViewModels;

public class AboutViewModel : BaseViewModel
{
	public ICommand GoToScanCommand { get; }

	public ICommand OpenGithubCommand { get; }

	public ICommand OpenCoffeeCommand { get; }

	public ICommand OpenHelpCommand { get; }

	public AboutViewModel()
	{
		Title = AppSnippets.MiScaleExporter;
		GoToScanCommand = new Command(async () =>
		{
			await Shell.Current.GoToAsync("///ScalePage");
		});
		OpenGithubCommand = new Command(async () =>
		{
			await Browser.OpenAsync("https://github.com/lswiderski/mi-scale-exporter");
		});
		OpenCoffeeCommand = new Command(async () =>
		{
			await Browser.OpenAsync("https://www.buymeacoffee.com/lukaszswiderski");
		});
		OpenHelpCommand = new Command(async () =>
		{
			await Shell.Current.GoToAsync("///HelpPage");
		});
	}
}
