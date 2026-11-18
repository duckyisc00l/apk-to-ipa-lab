using System;
using System.ComponentModel;
using System.IO;
using System.Threading.Tasks;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Storage;
using MiScaleExporter.MAUI.Resources.Localization;
using MiScaleExporter.MAUI.Utils;
using MiScaleExporter.Models;
using MiScaleExporter.Services;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using YetAnotherGarminConnectClient.Dto.Garmin.Fit;

namespace MiScaleExporter.MAUI.ViewModels;

public class FormViewModel : BaseViewModel, IFormViewModel
{
	private readonly IGarminService _garminService;

	private readonly IFileSaver _fileSaver;

	private string _weight;

	private string _bmi;

	private string _idealWeight;

	private string _metabolicAge;

	private string _proteinPercentage;

	private string _bmr;

	private string _fat;

	private string _muscleMass;

	private string _boneMass;

	private string _visceralFat;

	private int? _bodyType;

	private string _waterPercentage;

	private string _email;

	private string _password;

	private string _accessToken;

	private string _tokenSecret;

	private bool _saveTokens;

	private DateTime _date;

	private TimeSpan _time;

	private bool _isAutomaticCalculation;

	private bool _isBusyForm;

	private bool _showMFACode;

	private string _externalApiClientId;

	private string _mfaCode;

	private bool _muscleMassAsPercentage;

	private bool _muscleMassAsKg;

	private bool _showEmail;

	private bool _showPassword;

	public Command UploadCommand { get; }

	public Command CancelMFACommand { get; }

	public Command GenerateFitFileCommand { get; }

	public string Weight
	{
		get
		{
			return _weight;
		}
		set
		{
			SetProperty(ref _weight, DoubleValueParser.CheckValue(value), "Weight");
		}
	}

	public string BMI
	{
		get
		{
			return _bmi;
		}
		set
		{
			SetProperty(ref _bmi, DoubleValueParser.CheckValue(value), "BMI");
		}
	}

	public string IdealWeight
	{
		get
		{
			return _idealWeight;
		}
		set
		{
			SetProperty(ref _idealWeight, DoubleValueParser.CheckValue(value), "IdealWeight");
		}
	}

	public string MetabolicAge
	{
		get
		{
			return _metabolicAge;
		}
		set
		{
			SetProperty(ref _metabolicAge, DoubleValueParser.CheckValue(value), "MetabolicAge");
		}
	}

	public string ProteinPercentage
	{
		get
		{
			return _proteinPercentage;
		}
		set
		{
			SetProperty(ref _proteinPercentage, DoubleValueParser.CheckValue(value), "ProteinPercentage");
		}
	}

	public string BMR
	{
		get
		{
			return _bmr;
		}
		set
		{
			SetProperty(ref _bmr, DoubleValueParser.CheckValue(value), "BMR");
		}
	}

	public string Fat
	{
		get
		{
			return _fat;
		}
		set
		{
			SetProperty(ref _fat, DoubleValueParser.CheckValue(value), "Fat");
		}
	}

	public string MuscleMass
	{
		get
		{
			return _muscleMass;
		}
		set
		{
			SetProperty(ref _muscleMass, DoubleValueParser.CheckValue(value), "MuscleMass");
		}
	}

	public string BoneMass
	{
		get
		{
			return _boneMass;
		}
		set
		{
			SetProperty(ref _boneMass, DoubleValueParser.CheckValue(value), "BoneMass");
		}
	}

	public string VisceralFat
	{
		get
		{
			return _visceralFat;
		}
		set
		{
			SetProperty(ref _visceralFat, DoubleValueParser.CheckValue(value), "VisceralFat");
		}
	}

	public int? BodyType
	{
		get
		{
			return _bodyType;
		}
		set
		{
			SetProperty(ref _bodyType, value, "BodyType");
		}
	}

	public string WaterPercentage
	{
		get
		{
			return _waterPercentage;
		}
		set
		{
			SetProperty(ref _waterPercentage, DoubleValueParser.CheckValue(value), "WaterPercentage");
		}
	}

	public DateTime Date
	{
		get
		{
			return _date;
		}
		set
		{
			SetProperty(ref _date, value, "Date");
		}
	}

	public TimeSpan Time
	{
		get
		{
			return _time;
		}
		set
		{
			SetProperty(ref _time, value, "Time");
		}
	}

	public bool IsAutomaticCalculation
	{
		get
		{
			return _isAutomaticCalculation;
		}
		set
		{
			SetProperty(ref _isAutomaticCalculation, value, "IsAutomaticCalculation");
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

	public bool ShowMFACode
	{
		get
		{
			return _showMFACode;
		}
		set
		{
			SetProperty(ref _showMFACode, value, "ShowMFACode");
		}
	}

	public string ExternalApiClientId
	{
		get
		{
			return _externalApiClientId;
		}
		set
		{
			SetProperty(ref _externalApiClientId, value, "ExternalApiClientId");
		}
	}

	public string MFACode
	{
		get
		{
			return _mfaCode;
		}
		set
		{
			SetProperty(ref _mfaCode, value, "MFACode");
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
			SetProperty(ref _muscleMassAsPercentage, value, "MuscleMassAsPercentage");
		}
	}

	public bool MuscleMassAsKg
	{
		get
		{
			return _muscleMassAsKg;
		}
		set
		{
			SetProperty(ref _muscleMassAsKg, value, "MuscleMassAsKg");
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
			SetProperty(ref _email, value, "Email");
			UploadCommand?.ChangeCanExecute();
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
			SetProperty(ref _password, value, "Password");
			UploadCommand?.ChangeCanExecute();
		}
	}

	public bool ShowEmail
	{
		get
		{
			return _showEmail;
		}
		set
		{
			SetProperty(ref _showEmail, value, "ShowEmail");
		}
	}

	public bool ShowPassword
	{
		get
		{
			return _showPassword;
		}
		set
		{
			SetProperty(ref _showPassword, value, "ShowPassword");
		}
	}

	public FormViewModel(IGarminService garminService, IFileSaver fileSaver)
	{
		_garminService = garminService;
		Title = AppSnippets.GarminBodyCompositionForm;
		Date = DateTime.Now;
		Time = DateTime.Now.TimeOfDay;
		_muscleMassAsKg = true;
		UploadCommand = new Command(OnUpload, ValidateSave);
		GenerateFitFileCommand = new Command(OnGenerateFitFileAsync);
		CancelMFACommand = new Command(OnCancelMFA);
		PropertyChanged += (object? _, PropertyChangedEventArgs __) =>
		{
			UploadCommand.ChangeCanExecute();
		};
		_fileSaver = fileSaver;
	}

	public async Task LoadPreferencesAsync()
	{
		_email = Preferences.Get(PreferencesKeys.GarminUserEmail, string.Empty);
		_password = await SecureStorage.GetAsync(PreferencesKeys.GarminUserPassword);
		_accessToken = await SecureStorage.GetAsync(PreferencesKeys.GarminUserAccessToken);
		_tokenSecret = await SecureStorage.GetAsync(PreferencesKeys.GarminUserTokenSecret);
		_saveTokens = !string.IsNullOrWhiteSpace(_email) && !string.IsNullOrWhiteSpace(_password);
		ShowEmail = string.IsNullOrWhiteSpace(_email);
		ShowPassword = string.IsNullOrWhiteSpace(_password);
		MuscleMassAsPercentage = Preferences.Get(PreferencesKeys.MuscleMassAsPercentage, false);
		MuscleMassAsKg = !Preferences.Get(PreferencesKeys.MuscleMassAsPercentage, false);
	}

	private bool ValidateSave()
	{
		if (!string.IsNullOrWhiteSpace(_email))
		{
			return !string.IsNullOrWhiteSpace(_password);
		}
		return false;
	}

	public void AutoUpload()
	{
		if (!string.IsNullOrWhiteSpace(_email) && !string.IsNullOrWhiteSpace(_password))
		{
			OnUpload();
		}
	}

	private async void OnUpload()
	{
		IsBusyForm = true;
		CredentialsData credencials = new CredentialsData
		{
			Email = _email,
			Password = _password,
			AccessToken = _accessToken,
			TokenSecret = _tokenSecret
		};
		GarminApiResponse response = await _garminService.UploadAsync(PrepareRequest(), Date.Date.Add(Time), credencials);
		string message = ((response?.IsSuccess ?? false) ? AppSnippets.Uploaded : response?.Message);
		await Application.Current.MainPage.DisplayAlert(AppSnippets.Response, message, AppSnippets.OK);
		IsBusyForm = false;
		if (_saveTokens)
		{
			_accessToken = response?.AccessToken ?? string.Empty;
			_tokenSecret = response?.TokenSecret ?? string.Empty;
		}
		else
		{
			_accessToken = string.Empty;
			_tokenSecret = string.Empty;
		}
		await SecureStorage.SetAsync(PreferencesKeys.GarminUserAccessToken, _accessToken);
		await SecureStorage.SetAsync(PreferencesKeys.GarminUserTokenSecret, _tokenSecret);
		if (response?.MFARequested ?? false)
		{
			ShowMFACode = true;
			ShowEmail = false;
			ShowPassword = false;
			ExternalApiClientId = response?.ExternalApiClientId;
		}
		else
		{
			ShowMFACode = false;
			MFACode = null;
			ExternalApiClientId = null;
			ShowEmail = string.IsNullOrWhiteSpace(Preferences.Get(PreferencesKeys.GarminUserEmail, string.Empty));
			ShowPassword = string.IsNullOrWhiteSpace(await SecureStorage.GetAsync(PreferencesKeys.GarminUserPassword));
		}
		await Shell.Current.GoToAsync("..?autoUpload=false");
	}

	private async void OnGenerateFitFileAsync()
	{
		IsBusyForm = true;
		GarminFitFileCreationResult garminFitFileCreationResult = await _garminService.GenerateFitFileAsync(PrepareRequest(), Date.Date.Add(Time));
		if (!garminFitFileCreationResult.IsSuccess && garminFitFileCreationResult.file != null)
		{
			await Application.Current.MainPage.DisplayAlert(AppSnippets.Response, garminFitFileCreationResult?.Message, AppSnippets.OK);
		}
		else
		{
			using MemoryStream stream = new MemoryStream(garminFitFileCreationResult.file);
			FileSaverResult fileSaverResult = await _fileSaver.SaveAsync("activity_" + Date.Date.Add(Time).ToShortDateString() + ".fit", stream);
			if (!fileSaverResult.IsSuccessful)
			{
				await Toast.Make("The file was not saved successfully with error: " + fileSaverResult.Exception.Message).Show();
			}
			else
			{
				await Toast.Make("The file was saved successfully to location: " + fileSaverResult.FilePath).Show();
			}
		}
		IsBusyForm = false;
		await Shell.Current.GoToAsync("..?autoUpload=false");
	}

	private async void OnCancelMFA()
	{
		ShowMFACode = false;
		MFACode = null;
		ExternalApiClientId = null;
		ShowEmail = string.IsNullOrWhiteSpace(Preferences.Get(PreferencesKeys.GarminUserEmail, string.Empty));
		ShowPassword = string.IsNullOrWhiteSpace(await SecureStorage.GetAsync(PreferencesKeys.GarminUserPassword));
	}

	private BodyComposition PrepareRequest()
	{
		BodyComposition bodyComposition = new BodyComposition
		{
			Fat = DoubleValueParser.ParseValueFromUsersCulture(_fat).GetValueOrDefault(),
			BodyType = _bodyType.GetValueOrDefault(),
			Weight = DoubleValueParser.ParseValueFromUsersCulture(_weight).GetValueOrDefault(),
			BoneMass = DoubleValueParser.ParseValueFromUsersCulture(_boneMass).GetValueOrDefault(),
			MuscleMass = DoubleValueParser.ParseValueFromUsersCulture(_muscleMass).GetValueOrDefault(),
			MetabolicAge = DoubleValueParser.ParseValueFromUsersCulture(_metabolicAge).GetValueOrDefault(),
			ProteinPercentage = DoubleValueParser.ParseValueFromUsersCulture(_proteinPercentage).GetValueOrDefault(),
			VisceralFat = DoubleValueParser.ParseValueFromUsersCulture(_visceralFat).GetValueOrDefault(),
			BMI = DoubleValueParser.ParseValueFromUsersCulture(_bmi).GetValueOrDefault(),
			BMR = DoubleValueParser.ParseValueFromUsersCulture(_bmr).GetValueOrDefault(),
			WaterPercentage = DoubleValueParser.ParseValueFromUsersCulture(_waterPercentage).GetValueOrDefault(),
			MFACode = _mfaCode,
			ExternalApiClientId = _externalApiClientId
		};
		if (Preferences.Get(PreferencesKeys.MuscleMassAsPercentage, false) && bodyComposition.MuscleMass != 0.0 && bodyComposition.Weight != 0.0)
		{
			bodyComposition.MuscleMass = bodyComposition.MuscleMass / 100.0 * bodyComposition.Weight;
		}
		return bodyComposition;
	}

	public void LoadBodyComposition()
	{
		if (App.BodyComposition != null)
		{
			Weight = Math.Round(App.BodyComposition.Weight, 2).ToString();
			BMI = App.BodyComposition.BMI.ToString();
			BoneMass = App.BodyComposition.BoneMass.ToString();
			MuscleMass = App.BodyComposition.MuscleMass.ToString();
			IdealWeight = App.BodyComposition.IdealWeight.ToString();
			BMR = App.BodyComposition.BMR.ToString();
			MetabolicAge = App.BodyComposition.MetabolicAge.ToString();
			ProteinPercentage = App.BodyComposition.ProteinPercentage.ToString();
			VisceralFat = App.BodyComposition.VisceralFat.ToString();
			Fat = App.BodyComposition.Fat.ToString();
			WaterPercentage = App.BodyComposition.WaterPercentage.ToString();
			BodyType = App.BodyComposition.BodyType;
			IsAutomaticCalculation = true;
		}
	}
}
