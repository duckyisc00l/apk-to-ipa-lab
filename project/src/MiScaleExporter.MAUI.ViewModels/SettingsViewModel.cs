using System;
using System.Threading.Tasks;
using System.Windows.Input;
using MiScaleExporter.MAUI.Resources.Localization;
using MiScaleExporter.Models;
using Microsoft.Maui.ApplicationModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;

namespace MiScaleExporter.MAUI.ViewModels;

public class SettingsViewModel : BaseViewModel, ISettingsViewModel
{
	private string _apiAddress;

	private bool _oneClickScanAndUpload;

	private bool _useExternalAPI;

	private bool _muscleMassAsPercentage;

	private bool _showDebugInfo;

	private bool _hideAds;

	private string _address;

	private string _bindkey;

	private int _age;

	private int _height;

	private Sex _sex;

	private ScaleType _scaleType;

	private string _email;

	private string _password;

	public ICommand ResetCommand { get; }

	public ICommand GetBLEKeyCommand { get; }

	public ICommand ResetTokensCommand { get; }

	public string ApiAddress
	{
		get
		{
			return _apiAddress;
		}
		set
		{
			Uri uri;
			if (string.IsNullOrEmpty(value))
			{
				Preferences.Remove(PreferencesKeys.ApiServerAddressOverride);
			}
			else if (Uri.TryCreate(value, UriKind.Absolute, out uri) && (uri.Scheme == Uri.UriSchemeHttp || uri.Scheme == Uri.UriSchemeHttps))
			{
				Preferences.Set(PreferencesKeys.ApiServerAddressOverride, value);
			}
			SetProperty(ref _apiAddress, value, "ApiAddress");
		}
	}

	public bool OneClickScanAndUpload
	{
		get
		{
			return _oneClickScanAndUpload;
		}
		set
		{
			Preferences.Set(PreferencesKeys.OneClickScanAndUpload, value);
			SetProperty(ref _oneClickScanAndUpload, value, "OneClickScanAndUpload");
		}
	}

	public bool UseExternalAPI
	{
		get
		{
			return _useExternalAPI;
		}
		set
		{
			Preferences.Set(PreferencesKeys.UseExternalAPI, value);
			SetProperty(ref _useExternalAPI, value, "UseExternalAPI");
		}
	}

	public bool MuscleMassAsPercentage
	{
		get
		{
			return _muscleMassAsPercentage;
		}
		set
		{
			Preferences.Set(PreferencesKeys.MuscleMassAsPercentage, value);
			SetProperty(ref _muscleMassAsPercentage, value, "MuscleMassAsPercentage");
		}
	}

	public bool ShowDebugInfo
	{
		get
		{
			return _showDebugInfo;
		}
		set
		{
			Preferences.Set(PreferencesKeys.ShowDebugInfo, value);
			SetProperty(ref _showDebugInfo, value, "ShowDebugInfo");
		}
	}

	public bool HideAds
	{
		get
		{
			return _hideAds;
		}
		set
		{
			Preferences.Set(PreferencesKeys.HideAds, value);
			SetProperty(ref _hideAds, value, "HideAds");
		}
	}

	public string Address
	{
		get
		{
			return _address;
		}
		set
		{
			SetProperty(ref _address, value, "Address");
			Preferences.Set(PreferencesKeys.MiScaleBluetoothAddress, value);
		}
	}

	public string Bindkey
	{
		get
		{
			return _bindkey;
		}
		set
		{
			SetProperty(ref _bindkey, value, "Bindkey");
			Preferences.Set(PreferencesKeys.S400Bindkey, value);
		}
	}

	public string Age
	{
		get
		{
			return _age.ToString();
		}
		set
		{
			if (value != null && int.TryParse(value, out var result))
			{
				SetProperty(ref _age, result, "Age");
				if (result != 0)
				{
					Preferences.Set(PreferencesKeys.UserAge, result);
				}
			}
		}
	}

	public string Height
	{
		get
		{
			return _height.ToString();
		}
		set
		{
			if (value != null && int.TryParse(value, out var result))
			{
				SetProperty(ref _height, result, "Height");
				if (result != 0)
				{
					Preferences.Set(PreferencesKeys.UserHeight, result);
				}
			}
		}
	}

	public bool IsMaleSelected => _sex == Sex.Male;

	public bool IsFemaleSelected => _sex == Sex.Female;

	public Sex Sex
	{
		get
		{
			return _sex;
		}
		set
		{
			if (_sex != value)
			{
				SetProperty(ref _sex, value, "Sex");
				Preferences.Set(PreferencesKeys.UserSex, (int)value);
			}
		}
	}

	public bool IsMiBodyCompositionScaleSelected => _scaleType == ScaleType.MiBodyCompositionScale;

	public bool IsMiSmartScaleSelected => _scaleType == ScaleType.MiSmartScale;

	public bool IsS400Selected => _scaleType == ScaleType.S400;

	public ScaleType ScaleType
	{
		get
		{
			return _scaleType;
		}
		set
		{
			if (_scaleType != value)
			{
				SetProperty(ref _scaleType, value, "ScaleType");
				Preferences.Set(PreferencesKeys.ScaleType, (int)value);
			}
		}
	}

	public string Email
	{
		get
		{
			return _email;
		}
		set
		{
			if (_email != value)
			{
				SetProperty(ref _email, value, "Email");
				Preferences.Set(PreferencesKeys.GarminUserEmail, value);
				_clearTokens();
			}
		}
	}

	public string Password
	{
		get
		{
			return _password;
		}
		set
		{
			if (_password != value)
			{
				SetProperty(ref _password, value, "Password");
				SecureStorage.SetAsync(PreferencesKeys.GarminUserPassword, value);
				_clearTokens();
			}
		}
	}

	public SettingsViewModel()
	{
		Title = AppSnippets.Settings;
		ResetCommand = new Command(() =>
		{
			Preferences.Remove(PreferencesKeys.ApiServerAddressOverride);
			ApiAddress = string.Empty;
			Preferences.Remove(PreferencesKeys.OneClickScanAndUpload);
			Preferences.Remove(PreferencesKeys.UseExternalAPI);
			Preferences.Remove(PreferencesKeys.ShowDebugInfo);
			Preferences.Remove(PreferencesKeys.HideAds);
			Preferences.Remove(PreferencesKeys.MuscleMassAsPercentage);
		});
		GetBLEKeyCommand = new Command(async () =>
		{
			await Launcher.OpenAsync("https://lswiderski.github.io/mi-scale-exporter/#steps-to-connect-xiaomi-body-composition-scale-s400");
		});
		ResetTokensCommand = new Command(_clearTokens);
	}

	public async Task LoadPreferencesAsync()
	{
		_apiAddress = Preferences.Get(PreferencesKeys.ApiServerAddressOverride, string.Empty);
		_oneClickScanAndUpload = Preferences.Get(PreferencesKeys.OneClickScanAndUpload, false);
		_useExternalAPI = Preferences.Get(PreferencesKeys.UseExternalAPI, false);
		_showDebugInfo = Preferences.Get(PreferencesKeys.ShowDebugInfo, false);
		_hideAds = Preferences.Get(PreferencesKeys.HideAds, false);
		_muscleMassAsPercentage = Preferences.Get(PreferencesKeys.MuscleMassAsPercentage, false);
		_age = Preferences.Get(PreferencesKeys.UserAge, 25);
		_height = Preferences.Get(PreferencesKeys.UserHeight, 170);
		_sex = (Sex)Preferences.Get(PreferencesKeys.UserSex, 0);
		_address = Preferences.Get(PreferencesKeys.MiScaleBluetoothAddress, string.Empty);
		_scaleType = (ScaleType)Preferences.Get(PreferencesKeys.ScaleType, 0);
		_email = Preferences.Get(PreferencesKeys.GarminUserEmail, string.Empty);
		_password = await SecureStorage.GetAsync(PreferencesKeys.GarminUserPassword);
		_bindkey = Preferences.Get(PreferencesKeys.S400Bindkey, string.Empty);
		NotifyAllPropertiesChanged();
	}

	private bool ValidateProfile()
	{
		if (!string.IsNullOrWhiteSpace(_address) && _height > 0 && _height < 220 && _age > 0)
		{
			return _age < 99;
		}
		return false;
	}

	public void SexRadioSetToMale()
	{
		Sex = Sex.Male;
	}

	public void SexRadioSetToFemale()
	{
		Sex = Sex.Female;
	}

	public void ScaleTypeSetToBodyCompositionScale()
	{
		ScaleType = ScaleType.MiBodyCompositionScale;
	}

	public void ScaleTypeSetToMiscale()
	{
		ScaleType = ScaleType.MiSmartScale;
	}

	public void ScaleTypeSetToS400()
	{
		ScaleType = ScaleType.S400;
	}

	public void CheckPreferences()
	{
	}

	private void _clearTokens()
	{
		SecureStorage.SetAsync(PreferencesKeys.GarminUserAccessToken, string.Empty);
		SecureStorage.SetAsync(PreferencesKeys.GarminUserTokenSecret, string.Empty);
	}
}
