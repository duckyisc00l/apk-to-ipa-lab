public class DifficultyPicker : LabeledItemPickerControl<EDifficulty>
{
	public DifficultyPicker(ItemPicker itemPicker)
		: base(itemPicker, EnumUtils.GetValuesAsList<EDifficulty>())
	{
		base.GetLabelTextFunction = (EDifficulty item) => item.GetTranslatedName();
	}
}
