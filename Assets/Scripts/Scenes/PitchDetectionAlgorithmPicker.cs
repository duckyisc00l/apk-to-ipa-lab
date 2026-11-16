public class PitchDetectionAlgorithmPicker : LabeledItemPickerControl<EPitchDetectionAlgorithm>
{
	public PitchDetectionAlgorithmPicker(ItemPicker itemPicker)
		: base(itemPicker, EnumUtils.GetValuesAsList<EPitchDetectionAlgorithm>())
	{
		base.GetLabelTextFunction = (EPitchDetectionAlgorithm item) => item switch
		{
			EPitchDetectionAlgorithm.Dywa => "Dynamic Wavelet\n(default)", 
			EPitchDetectionAlgorithm.Camd => "Circular Average\nMagnitude Difference", 
			_ => item.ToString(), 
		};
	}
}
