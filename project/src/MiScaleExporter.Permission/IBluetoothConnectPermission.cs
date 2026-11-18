using System.Threading.Tasks;
using Microsoft.Maui.ApplicationModel;

namespace MiScaleExporter.Permission;

public interface IBluetoothConnectPermission
{
	Task<PermissionStatus> CheckStatusAsync();

	Task<PermissionStatus> RequestAsync();
}
