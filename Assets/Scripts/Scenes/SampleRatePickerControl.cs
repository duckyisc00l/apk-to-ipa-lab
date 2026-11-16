using System.Collections.Generic;
using ProTrans;

public class SampleRatePickerControl : LabeledItemPickerControl<int>
{
	public SampleRatePickerControl(ItemPicker itemPicker)
		: base(itemPicker, new List<int> { 0, 48000, 44100, 22050, 16000 })
	{
		base.GetLabelTextFunction = (int item) => (item > 0) ? item.ToString() : TranslationManager.GetTranslation(R.Messages.options_sampleRate_auto);
	}
}
