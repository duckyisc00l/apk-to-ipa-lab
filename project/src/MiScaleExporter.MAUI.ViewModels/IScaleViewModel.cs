using System.Threading.Tasks;

namespace MiScaleExporter.MAUI.ViewModels;

public interface IScaleViewModel
{
	Task CheckPreferencesAsync();

	Task LoadPreferencesAsync();
}
