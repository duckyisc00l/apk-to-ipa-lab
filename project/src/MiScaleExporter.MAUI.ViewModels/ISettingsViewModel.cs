using System.Threading.Tasks;

namespace MiScaleExporter.MAUI.ViewModels;

public interface ISettingsViewModel
{
	void SexRadioSetToMale();

	void SexRadioSetToFemale();

	void ScaleTypeSetToBodyCompositionScale();

	void ScaleTypeSetToMiscale();

	void ScaleTypeSetToS400();

	Task LoadPreferencesAsync();
}
