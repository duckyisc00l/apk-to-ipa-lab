using System.CodeDom.Compiler;
using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Internals;
using Microsoft.Maui.Controls.Xaml;

namespace MiScaleExporter.Controls;

[XamlFilePath("Controls\\FlyoutHeader.xaml")]
public class FlyoutHeader : ContentView
{
	public FlyoutHeader()
	{
		InitializeComponent();
	}

	[GeneratedCode("Microsoft.Maui.Controls.SourceGen", "1.0.0.0")]
	private void InitializeComponent()
	{
		Label label = new Label();
		VerticalStackLayout verticalStackLayout = new VerticalStackLayout();
		FlyoutHeader flyoutHeader;
		NameScope value = (NameScope)(NameScope.GetNameScope(flyoutHeader = this) ?? new NameScope());
		NameScope.SetNameScope(flyoutHeader, value);
		label.SetValue(Label.TextProperty, "Mi Scale Exporter");
		label.SetValue(View.VerticalOptionsProperty, LayoutOptions.Center);
		label.SetValue(View.HorizontalOptionsProperty, LayoutOptions.Center);
		label.SetValue(View.MarginProperty, new Thickness(40.0));
		verticalStackLayout.Children.Add(label);
		flyoutHeader.SetValue(ContentView.ContentProperty, verticalStackLayout);
	}
}
