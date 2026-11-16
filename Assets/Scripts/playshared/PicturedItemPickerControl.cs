using System.Collections.Generic;
using UniRx;
using UnityEngine.UIElements;

public abstract class PicturedItemPickerControl<T> : ListedItemPickerControl<T>
{
	protected PicturedItemPickerControl(ItemPicker itemPicker, List<T> items)
		: base(itemPicker)
	{
		base.Selection.Subscribe(UpdateImageElement);
		base.Items = items;
	}

	public virtual void UpdateImageElement(T item)
	{
		base.ItemPicker.ItemLabel.text = "";
		base.ItemPicker.ItemLabel.style.backgroundImage = GetBackgroundImageValue(item);
	}

	protected abstract StyleBackground GetBackgroundImageValue(T item);
}
