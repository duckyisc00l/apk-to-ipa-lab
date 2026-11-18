using System.CodeDom.Compiler;
using MiScaleExporter.MAUI.Resources.Localization;
using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Internals;
using Microsoft.Maui.Controls.Xaml;

namespace MiScaleExporter.Controls;

[XamlFilePath("Controls\\FlyoutFooter.xaml")]
public class FlyoutFooter : ContentView
{
	public FlyoutFooter()
	{
		InitializeComponent();
	}

	[GeneratedCode("Microsoft.Maui.Controls.SourceGen", "1.0.0.0")]
	private void InitializeComponent()
	{
		string createdBy = AppSnippets.CreatedBy;
		Label label = new Label();
		VerticalStackLayout verticalStackLayout = new VerticalStackLayout();
		FlyoutFooter flyoutFooter;
		NameScope value = (NameScope)(NameScope.GetNameScope(flyoutFooter = this) ?? new NameScope());
		NameScope.SetNameScope(flyoutFooter, value);
		label.SetValue(View.MarginProperty, new Thickness(10.0));
		label.SetValue(Label.FontSizeProperty, Device.GetNamedSize(NamedSize.Small, label.GetType()));
		label.SetValue(View.HorizontalOptionsProperty, LayoutOptions.Center);
		label.SetValue(Label.TextProperty, createdBy);
		verticalStackLayout.Children.Add(label);
		flyoutFooter.SetValue(ContentView.ContentProperty, verticalStackLayout);
	}
}
