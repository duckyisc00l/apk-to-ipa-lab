using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Graphics;

namespace MiScaleExporter.MAUI.Behaviors;

public class NumericIntValidationBehavior : Behavior<Entry>
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
		bool flag = int.TryParse(args.NewTextValue, out var _);
		Color color = ((Application.Current.RequestedTheme == AppTheme.Dark) ? Color.FromRgb(255, 255, 255) : Color.FromRgb(0, 0, 0));
		((Entry)sender).TextColor = (flag ? color : Color.FromRgb(255, 0, 0));
	}
}
