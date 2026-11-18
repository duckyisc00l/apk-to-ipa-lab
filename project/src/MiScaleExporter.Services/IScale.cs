using System.Threading.Tasks;
using MiScaleExporter.Models;

namespace MiScaleExporter.Services;

public interface IScale
{
	BodyComposition BodyComposition { get; set; }

	Task<BodyComposition> GetBodyCompositonAsync(string scaleAddress, User user);

	Task CancelSearchAsync();

	void StopSearch();
}
