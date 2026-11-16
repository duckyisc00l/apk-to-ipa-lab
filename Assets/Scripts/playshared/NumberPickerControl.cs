using System;
using System.Globalization;
using UniRx;
using UnityEngine.InputSystem;

public class NumberPickerControl : ComputedItemPickerControl<double>
{
	private Func<double, string> getLabelTextFunction = (double item) => item.ToString(CultureInfo.InvariantCulture);

	public Func<double, string> GetLabelTextFunction
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

	public double MinValue => base.ItemPicker.MinValue;

	public double MaxValue => base.ItemPicker.MaxValue;

	public double StepValue => base.ItemPicker.StepValue;

	public NumberPickerControl(ItemPicker itemPicker, double initialValue = 0.0)
		: base(itemPicker, initialValue)
	{
		base.Selection.Subscribe((double newValue) =>
		{
			UpdateLabelText(newValue);
		});
	}

	public override void SelectNextItem()
	{
		double selectedItem = base.SelectedItem;
		if (selectedItem >= MaxValue)
		{
			if (WrapAround)
			{
				SelectItem(MinValue);
			}
			return;
		}
		double num = selectedItem + GetModifiedStepValue();
		if (num > MaxValue)
		{
			num = MaxValue;
		}
		if (num != selectedItem)
		{
			SelectItem(num);
		}
	}

	private double GetModifiedStepValue()
	{
		if (Keyboard.current == null || !Keyboard.current.shiftKey.isPressed)
		{
			return StepValue;
		}
		return StepValue * 10.0;
	}

	public override void SelectPreviousItem()
	{
		double selectedItem = base.SelectedItem;
		if (selectedItem <= MinValue)
		{
			if (WrapAround)
			{
				SelectItem(MaxValue);
			}
			return;
		}
		double num = selectedItem - GetModifiedStepValue();
		if (num < MinValue)
		{
			num = MinValue;
		}
		if (num != selectedItem)
		{
			SelectItem(num);
		}
	}

	public void UpdateLabelText()
	{
		UpdateLabelText(base.SelectedItem);
	}

	private void UpdateLabelText(double newValue)
	{
		base.ItemPicker.ItemLabel.text = GetLabelTextFunction(newValue);
	}
}
