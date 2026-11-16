using System;
using System.Collections.Generic;
using UniRx;

public class LabeledItemPickerControl<T> : ListedItemPickerControl<T>
{
	private readonly string smallFontUssClass = "smallFont";

	private Func<T, string> getLabelTextFunction = (T item) => (item == null) ? "" : item.ToString();

	public Func<T, string> GetLabelTextFunction
	{
		get
		{
			return getLabelTextFunction;
		}
		set
		{
			getLabelTextFunction = value;
			UpdateLabelText(base.SelectedItem);
		}
	}

	public LabeledItemPickerControl(ItemPicker itemPicker, List<T> items)
		: base(itemPicker)
	{
		base.Selection.Subscribe(UpdateLabelText);
		base.Items = items;
	}

	public void UpdateLabelText()
	{
		UpdateLabelText(base.SelectedItem);
	}

	private void UpdateLabelText(T item)
	{
		base.ItemPicker.ItemLabel.text = GetLabelTextFunction(item);
		if (base.ItemPicker.ItemLabel.text.Length > 28 || base.ItemPicker.ItemLabel.text.Contains("\n"))
		{
			base.ItemPicker.AddToClassListIfNew(smallFontUssClass);
		}
		else
		{
			base.ItemPicker.RemoveFromClassList(smallFontUssClass);
		}
	}
}
