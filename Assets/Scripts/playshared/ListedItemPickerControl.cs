using System.Collections.Generic;

public abstract class ListedItemPickerControl<T> : AbstractItemPickerControl<T>
{
	private List<T> items = new List<T>();

	public bool WrapAround
	{
		get
		{
			if (!base.ItemPicker.WrapAround && !base.ItemPicker.NoPreviousButton)
			{
				return base.ItemPicker.NoNextButton;
			}
			return true;
		}
	}

	public List<T> Items
	{
		get
		{
			return new List<T>(items);
		}
		set
		{
			if (value == null)
			{
				items = new List<T>();
			}
			else
			{
				items = new List<T>(value);
			}
			if (HasSelectedItem && !items.Contains(base.SelectedItem))
			{
				base.Selection.Value = default;
			}
		}
	}

	public virtual bool HasSelectedItem
	{
		get
		{
			if (!typeof(T).IsValueType)
			{
				return !object.Equals(base.SelectedItem, default(T));
			}
			return true;
		}
	}

	public int SelectedItemIndex => Items.IndexOf(base.SelectedItem);

	protected ListedItemPickerControl(ItemPicker itemPicker)
		: base(itemPicker)
	{
	}

	public override void SelectPreviousItem()
	{
		if (Items.IsNullOrEmpty())
		{
			return;
		}
		if (HasSelectedItem)
		{
			if (WrapAround || SelectedItemIndex > 0)
			{
				base.Selection.Value = Items.GetElementBefore(base.SelectedItem, WrapAround);
			}
		}
		else
		{
			base.Selection.Value = Items[0];
		}
	}

	public override void SelectNextItem()
	{
		if (Items.IsNullOrEmpty())
		{
			return;
		}
		if (HasSelectedItem)
		{
			if (WrapAround || SelectedItemIndex < Items.Count - 1)
			{
				base.Selection.Value = Items.GetElementAfter(base.SelectedItem, WrapAround);
			}
		}
		else
		{
			base.Selection.Value = Items[0];
		}
	}

	public bool TrySelectItem(T item, bool selectFirstItemAsFallback = true)
	{
		if (Items.IsNullOrEmpty())
		{
			return false;
		}
		int num = Items.IndexOf(item);
		if (num >= 0)
		{
			base.Selection.Value = Items[num];
			return true;
		}
		if (selectFirstItemAsFallback)
		{
			base.Selection.Value = Items[0];
		}
		return false;
	}
}
