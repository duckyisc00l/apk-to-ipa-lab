using MiScaleExporter.MAUI.Utils;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Graphics;

namespace MiScaleExporter.MAUI.Behaviors;

public class NumericDoubleValidationBehavior : Behavior<Entry>
{
	protected override void OnAttachedTo(Entry entry)
	{
		entry.TextChanged += OnEntryTextChanged;
		base.OnAttachedTo(entry);
	}

	protected override void OnDetachingFrom(Entry entry)
	{
		entry.TextChanged -= OnEntryTextChanged;
		base.OnDetachingFrom(entry);
	}

	private void OnEntryTextChanged(object sender, TextChangedEventArgs args)
	{
		bool flag = DoubleValueParser.IsValid(args.NewTextValue);
		Color color = ((Application.Current.RequestedTheme == AppTheme.Dark) ? Color.FromRgb(255, 255, 255) : Color.FromRgb(0, 0, 0));
		((Entry)sender).TextColor = (flag ? color : Color.FromRgb(255, 0, 0));
	}
}
