using System.Collections.Generic;
using ProTrans;

public class BoolPickerControl : LabeledItemPickerControl<bool>
{
	public BoolPickerControl(ItemPicker itemPicker)
		: base(itemPicker, new List<bool> { false, true })
	{
		base.GetLabelTextFunction = (bool item) => item ? TranslationManager.GetTranslation("yes") : TranslationManager.GetTranslation("no");
	}
}
