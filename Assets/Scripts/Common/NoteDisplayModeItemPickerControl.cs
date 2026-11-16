using System;

public class NoteDisplayModeItemPickerControl : TranslatedLabeledItemPickerControl<ENoteDisplayMode>
{
	public NoteDisplayModeItemPickerControl(ItemPicker itemPicker)
		: base(itemPicker, EnumUtils.GetValuesAsList<ENoteDisplayMode>(), (Func<ENoteDisplayMode, string>)((ENoteDisplayMode noteDisplayMode) => noteDisplayMode.GetTranslation()))
	{
	}
}
