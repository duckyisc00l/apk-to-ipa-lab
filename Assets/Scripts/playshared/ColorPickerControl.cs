using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class ColorPickerControl : PicturedItemPickerControl<Color32>
{
	public ColorPickerControl(ItemPicker itemPicker, List<Color32> items)
		: base(itemPicker, items)
	{
	}

	public override void UpdateImageElement(Color32 item)
	{
		base.ItemPicker.ItemLabel.text = "";
		base.ItemPicker.ItemLabel.style.backgroundColor = new StyleColor(item);
	}

	protected override StyleBackground GetBackgroundImageValue(Color32 item)
	{
		return default;
	}
}
