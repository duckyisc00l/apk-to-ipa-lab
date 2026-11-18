using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using MiScaleExporter.Models;
using Microsoft.Extensions.Logging;
using Microsoft.Maui.Devices;
using Microsoft.Maui.Storage;
using NLog.Config;
using NLog.Extensions.Logging;
using Newtonsoft.Json;
using YetAnotherGarminConnectClient;
using YetAnotherGarminConnectClient.Dto;
using YetAnotherGarminConnectClient.Dto.Garmin.Fit;

namespace MiScaleExporter.Services;

public class GarminService : IGarminService
{
	private HttpClient _httpClient;

	private ILogService _logService;

	private ILogger _logger;

	private IClient _garminClient;

	public GarminService(ILogService logService)
	{
		_logService = logService;
		LoggingConfiguration configuration = LogService.CreateLogger();
		using (ILoggerFactory loggerFactory = LoggerFactory.Create((ILoggingBuilder builder) =>
		{
			builder.AddNLog(configuration);
		}))
		{
			_logger = loggerFactory.CreateLogger<GarminService>();
		}
		ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
		if (DeviceInfo.Platform == DevicePlatform.Android)
		{
			_httpClient = new HttpClient(new HttpClientHandler())
			{
				Timeout = TimeSpan.FromMinutes(5L),
				DefaultVersionPolicy = HttpVersionPolicy.RequestVersionOrHigher,
				DefaultRequestVersion = HttpVersion.Version11
			};
		}
		else
		{
			_httpClient = new HttpClient
			{
				Timeout = TimeSpan.FromMinutes(5L)
			};
		}
	}

	public async Task<GarminApiResponse> UploadAsync(BodyComposition bodyComposition, DateTime time, CredentialsData credencials)
	{
		if (DeviceInfo.Platform == DevicePlatform.Android && DeviceInfo.Version.Major < 10)
		{
			Preferences.Set(PreferencesKeys.UseExternalAPI, true);
		}
		if (Preferences.Get(PreferencesKeys.UseExternalAPI, false))
		{
			return await UploadViaExternalAPIAsync(bodyComposition, time, credencials);
		}
		return await UploadViaDirectCallToGarminAsync(bodyComposition, time, credencials);
	}

	private async Task<GarminApiResponse> UploadViaDirectCallToGarminAsync(BodyComposition bodyComposition, DateTime time, CredentialsData credencials)
	{
		GarminApiResponse result = new GarminApiResponse();
		try
		{
			UserProfileSettings userProfileSettings = new UserProfileSettings
			{
				Age = Preferences.Get(PreferencesKeys.UserAge, 25),
				Height = Preferences.Get(PreferencesKeys.UserHeight, 170)
			};
			GarminWeightScaleDTO scaleDTO = new GarminWeightScaleDTO
			{
				TimeStamp = time,
				Weight = Convert.ToSingle(bodyComposition.Weight),
				PercentFat = Convert.ToSingle(bodyComposition.Fat),
				PercentHydration = Convert.ToSingle(bodyComposition.WaterPercentage),
				BoneMass = Convert.ToSingle(bodyComposition.BoneMass),
				MuscleMass = Convert.ToSingle(bodyComposition.MuscleMass),
				VisceralFatRating = Convert.ToByte(bodyComposition.VisceralFat),
				VisceralFatMass = Convert.ToSingle(bodyComposition.VisceralFat),
				PhysiqueRating = Convert.ToByte(bodyComposition.BodyType),
				MetabolicAge = Convert.ToByte(bodyComposition.MetabolicAge),
				BodyMassIndex = Convert.ToSingle(bodyComposition.BMI)
			};
			if (string.IsNullOrEmpty(bodyComposition.MFACode))
			{
				_garminClient = await ClientFactory.Create();
			}
			UploadResult uploadResult = await _garminClient.UploadWeight(scaleDTO, userProfileSettings, credencials, bodyComposition.MFACode);
			LogService.GetLogs();
			IList<string> errorLogs = LogService.GetErrorLogs();
			result.IsSuccess = uploadResult.IsSuccess;
			result.MFARequested = uploadResult.MFACodeRequested;
			result.AccessToken = uploadResult.AccessToken;
			result.TokenSecret = uploadResult.TokenSecret;
			if (result.MFARequested)
			{
				result.Message = "Please provide MFA/2FA Code";
			}
			if (!result.IsSuccess && !result.MFARequested)
			{
				throw new Exception(uploadResult?.ErrorLogs?.FirstOrDefault() ?? errorLogs?.FirstOrDefault() ?? "Error");
			}
			return result;
		}
		catch (Exception ex)
		{
			LogService.GetLogs();
			LogService.GetErrorLogs();
			_logService.LogError(ex?.Message);
			result.Message = ex.Message;
			return result;
		}
	}

	public async Task<GarminFitFileCreationResult> GenerateFitFileAsync(BodyComposition bodyComposition, DateTime time)
	{
		GarminFitFileCreationResult result = new GarminFitFileCreationResult();
		try
		{
			UserProfileSettings userProfileSettings = new UserProfileSettings
			{
				Age = Preferences.Get(PreferencesKeys.UserAge, 25),
				Height = Preferences.Get(PreferencesKeys.UserHeight, 170)
			};
			GarminWeightScaleDTO scaleDTO = new GarminWeightScaleDTO
			{
				TimeStamp = time,
				Weight = Convert.ToSingle(bodyComposition.Weight),
				PercentFat = Convert.ToSingle(bodyComposition.Fat),
				PercentHydration = Convert.ToSingle(bodyComposition.WaterPercentage),
				BoneMass = Convert.ToSingle(bodyComposition.BoneMass),
				MuscleMass = Convert.ToSingle(bodyComposition.MuscleMass),
				VisceralFatRating = Convert.ToByte(bodyComposition.VisceralFat),
				VisceralFatMass = Convert.ToSingle(bodyComposition.VisceralFat),
				PhysiqueRating = Convert.ToByte(bodyComposition.BodyType),
				MetabolicAge = Convert.ToByte(bodyComposition.MetabolicAge),
				BodyMassIndex = Convert.ToSingle(bodyComposition.BMI)
			};
			_garminClient = await ClientFactory.Create();
			byte[] array = _garminClient.GenerateWeightFitFile(scaleDTO, userProfileSettings);
			LogService.GetLogs();
			IList<string> errorLogs = LogService.GetErrorLogs();
			if (errorLogs.Count > 0)
			{
				result.Message = string.Join(Environment.NewLine, errorLogs);
			}
			result.IsSuccess = array != null;
			result.file = array;
			return result;
		}
		catch (Exception ex)
		{
			LogService.GetLogs();
			LogService.GetErrorLogs();
			_logService.LogError(ex?.Message);
			result.Message = ex.Message;
			return result;
		}
	}

	private async Task<GarminApiResponse> UploadViaExternalAPIAsync(BodyComposition bodyComposition, DateTime time, CredentialsData credencials)
	{
		long timeStamp = ((DateTimeOffset)time).ToUnixTimeSeconds();
		GarminBodyCompositionRequest garminBodyCompositionRequest = new GarminBodyCompositionRequest
		{
			Email = credencials.Email,
			Password = credencials.Password,
			AccessToken = credencials.AccessToken,
			TokenSecret = credencials.TokenSecret,
			Weight = bodyComposition.Weight,
			BoneMass = bodyComposition.BoneMass,
			MuscleMass = bodyComposition.MuscleMass,
			MetabolicAge = bodyComposition.MetabolicAge,
			PercentFat = bodyComposition.Fat,
			VisceralFatRating = bodyComposition.VisceralFat,
			BodyMassIndex = bodyComposition.BMI,
			PercentHydration = bodyComposition.WaterPercentage,
			PhysiqueRating = bodyComposition.BodyType,
			TimeStamp = timeStamp
		};
		if (!string.IsNullOrEmpty(bodyComposition.ExternalApiClientId))
		{
			garminBodyCompositionRequest.MFACode = bodyComposition.MFACode;
			garminBodyCompositionRequest.ClientID = bodyComposition.ExternalApiClientId;
		}
		return await UploadToGarminCloud(garminBodyCompositionRequest);
	}

	private async Task<GarminApiResponse> UploadToGarminCloud(GarminBodyCompositionRequest request)
	{
		GarminApiResponse result = new GarminApiResponse();
		try
		{
			StringContent content = new StringContent(JsonConvert.SerializeObject(request), Encoding.UTF8, "application/json");
			HttpResponseMessage response = await PostAsync("/upload", content);
			using Stream stream = await response.Content.ReadAsStreamAsync();
			using StreamReader reader = new StreamReader(stream);
			string text = await reader.ReadToEndAsync();
			if (response.IsSuccessStatusCode)
			{
				GarminExternalApiResponse garminExternalApiResponse = JsonConvert.DeserializeObject<GarminExternalApiResponse>(text);
				result.AccessToken = garminExternalApiResponse?.UploadResult?.AccessToken;
				result.TokenSecret = garminExternalApiResponse?.UploadResult?.TokenSecret;
				if ((object)garminExternalApiResponse != null && garminExternalApiResponse.UploadResult?.AuthStatus == AuthStatus.MFARedirected)
				{
					result.Message = "Please provide MFA/2FA Code";
					result.MFARequested = true;
					result.ExternalApiClientId = garminExternalApiResponse.ClientId;
					return result;
				}
			}
			result.ExternalApiClientId = null;
			result.IsSuccess = response.IsSuccessStatusCode;
			result.Message = text;
			return result;
		}
		catch (Exception ex)
		{
			_logService.LogError(ex.Message);
			result.Message = ex.Message;
			return result;
		}
	}

	private async Task<HttpResponseMessage> PostAsync(string requestUri, HttpContent content)
	{
		string text = Preferences.Get(PreferencesKeys.ApiServerAddressOverride, SettingKeys.ApiServerAddress);
		return await _httpClient.PostAsync(text + requestUri, content);
	}
}
