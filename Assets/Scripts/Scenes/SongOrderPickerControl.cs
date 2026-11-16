using ProTrans;

public class SongOrderPickerControl : LabeledItemPickerControl<ESongOrder>
{
	public SongOrderPickerControl(ItemPicker itemPicker)
		: base(itemPicker, EnumUtils.GetValuesAsList<ESongOrder>())
	{
		base.GetLabelTextFunction = (ESongOrder songOrder) =>
		{
			string translation = TranslationManager.GetTranslation(R.Messages.order);
			string translatedName = songOrder.GetTranslatedName();
			return translation + ":\n" + translatedName;
		};
	}
}
