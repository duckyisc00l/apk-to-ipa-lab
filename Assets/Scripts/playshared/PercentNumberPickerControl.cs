public class PercentNumberPickerControl : NumberPickerControl
{
	public PercentNumberPickerControl(ItemPicker itemPicker, double initialValue = 0.0)
		: base(itemPicker, initialValue)
	{
		base.GetLabelTextFunction = (double item) => item + " %";
	}
}
