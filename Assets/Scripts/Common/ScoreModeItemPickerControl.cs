using System;

public class ScoreModeItemPickerControl : TranslatedLabeledItemPickerControl<EScoreMode>
{
	public ScoreModeItemPickerControl(ItemPicker itemPicker)
		: base(itemPicker, EnumUtils.GetValuesAsList<EScoreMode>(), (Func<EScoreMode, string>)((EScoreMode scoreMode) => scoreMode.GetTranslation()))
	{
	}
}
