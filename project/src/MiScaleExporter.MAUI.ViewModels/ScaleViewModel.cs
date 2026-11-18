using System.Threading.Tasks;
using MiScaleExporter.MAUI.Resources.Localization;
using MiScaleExporter.Models;
using MiScaleExporter.Permission;
using MiScaleExporter.Services;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Devices;
using Microsoft.Maui.Storage;

namespace MiScaleExporter.MAUI.ViewModels;

public class ScaleViewModel : BaseViewModel, IScaleViewModel
{
	private readonly IScale _scale;

	private readonly ILogService _logService;

	private string _address;

	private int _age;

	private int _height;

	private Sex _sex;

	private ScaleType _scaleType;

	private string _bindkey;

	private string _scanningLabel;

	private bool _isBusyForm;

	public Command CancelCommand { get; }

	public Command StopCommand { get; }

	public string ScanningLabel
	{
		get
		{
			return _scanningLabel;
		}
		set
		{
			SetProperty(ref _scanningLabel, value, "ScanningLabel");
		}
	}

	public bool IsBusyForm
	{
		get
		{
			return _isBusyForm;
		}
		set
		{
			SetProperty(ref _isBusyForm, value, "IsBusyForm");
		}
	}

	public ScaleViewModel(IScale scale, ILogService logService)
	{
		_scale = scale;
		_logService = logService;
		Title = AppSnippets.MiScaleData;
		CancelCommand = new Command(OnCancel);
		StopCommand = new Command(OnStop);
	}

	public async Task CheckPreferencesAsync()
	{
		ScaleMeasurement.Instance.Weight = "";
		App.BodyComposition = null;
		if (await CheckPermissions())
		{
			await LoadPreferencesAsync();
			if (!string.IsNullOrWhiteSpace(_address))
			{
				OnScan();
			}
			else
			{
				await Shell.Current.GoToAsync("//Settings");
			}
		}
	}

	public async Task LoadPreferencesAsync()
	{
		_age = Preferences.Get(PreferencesKeys.UserAge, 25);
		_height = Preferences.Get(PreferencesKeys.UserHeight, 170);
		_sex = (Sex)Preferences.Get(PreferencesKeys.UserSex, 0);
		_address = Preferences.Get(PreferencesKeys.MiScaleBluetoothAddress, string.Empty);
		_scaleType = (ScaleType)Preferences.Get(PreferencesKeys.ScaleType, 0);
		_bindkey = Preferences.Get(PreferencesKeys.S400Bindkey, string.Empty);
	}

	private async void OnScan()
	{
		await StartScan();
	}

	private async Task<bool> CheckPermissions()
	{
		if (DeviceInfo.Platform == DevicePlatform.Android)
		{
			if (DeviceInfo.Version.Major >= 12)
			{
				if (await GetBluetoothPermissionStatusAsync() != PermissionStatus.Granted)
				{
					await Application.Current.MainPage.DisplayAlert(AppSnippets.Problem, AppSnippets.PermissionBluetoothRequired, AppSnippets.OK);
					return false;
				}
				if (await GetLocationWhenInUsePermissionStatusAsync() != PermissionStatus.Granted)
				{
					await Application.Current.MainPage.DisplayAlert(AppSnippets.Problem, AppSnippets.PermissionLocationRequired, AppSnippets.OK);
					return false;
				}
			}
			else if (await GetLocationWhenInUsePermissionStatusAsync() != PermissionStatus.Granted && await GetLocationAlwaysPermissionStatusAsync() != PermissionStatus.Granted)
			{
				await Application.Current.MainPage.DisplayAlert(AppSnippets.Problem, AppSnippets.PermissionLocationRequired, AppSnippets.OK);
				return false;
			}
		}
		return true;
	}

	private async Task StartScan()
	{
		ScanningLabel = string.Empty;
		ScaleMeasurement.Instance.Weight = "0";
		IsBusyForm = true;
		await _scale.GetBodyCompositonAsync(_address, new User
		{
			Sex = _sex,
			Age = _age,
			Height = _height,
			ScaleType = _scaleType,
			BindKey = _bindkey
		});
		OnStop();
	}

	private async void OnStop()
	{
		_scale.StopSearch();
		IsBusyForm = false;
		if (_scale.BodyComposition == null || !_scale.BodyComposition.IsValid)
		{
			string msg = AppSnippets.DataCouldNotBeObtained;
			await Application.Current.MainPage.DisplayAlert(AppSnippets.Problem, msg, AppSnippets.OK);
			_logService.LogError(msg);
			ScanningLabel = AppSnippets.NotFound;
		}
		else
		{
			App.BodyComposition = _scale.BodyComposition;
			await Shell.Current.GoToAsync($"//FormPage?autoUpload={Preferences.Get(PreferencesKeys.OneClickScanAndUpload, false)}");
		}
	}

	private async void OnCancel()
	{
		await _scale.CancelSearchAsync();
		IsBusyForm = false;
	}

	private async Task<PermissionStatus> GetLocationWhenInUsePermissionStatusAsync()
	{
		PermissionStatus permissionStatus = await Permissions.CheckStatusAsync<Permissions.LocationWhenInUse>();
		if (permissionStatus != PermissionStatus.Granted)
		{
			permissionStatus = await Permissions.RequestAsync<Permissions.LocationWhenInUse>();
		}
		return permissionStatus;
	}

	private async Task<PermissionStatus> GetLocationAlwaysPermissionStatusAsync()
	{
		PermissionStatus permissionStatus = await Permissions.CheckStatusAsync<Permissions.LocationAlways>();
		if (permissionStatus != PermissionStatus.Granted)
		{
			permissionStatus = await Permissions.RequestAsync<Permissions.LocationAlways>();
		}
		return permissionStatus;
	}

	private async Task<PermissionStatus> GetBluetoothPermissionStatusAsync()
	{
		IBluetoothConnectPermission bluetoothPermission = DependencyService.Get<IBluetoothConnectPermission>();
		PermissionStatus permissionStatus = await bluetoothPermission.CheckStatusAsync();
		if (permissionStatus != PermissionStatus.Granted)
		{
			permissionStatus = await bluetoothPermission.RequestAsync();
		}
		return permissionStatus;
	}
}
