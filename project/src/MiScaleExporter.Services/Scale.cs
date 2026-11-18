using System;
using System.Linq;
using System.Threading.Tasks;
using MiScaleExporter.Models;
using Microsoft.Maui.Storage;
using Plugin.BLE;
using Plugin.BLE.Abstractions;
using Plugin.BLE.Abstractions.Contracts;
using Plugin.BLE.Abstractions.EventArgs;

namespace MiScaleExporter.Services;

public class Scale : IScale
{
	private ILogService _logService;

	private IDataInterpreter _dataInterpreter;

	private IAdapter _adapter;

	private TaskCompletionSource<BodyComposition> _completionSource;

	private BodyComposition _lastSuccessfulBodyComposition;

	private byte[] _scannedData;

	private string _scaleBlutetoothAddress;

	private DateTime? _lastSuccessfulMeasure;

	private static bool _impedanceWaitFinished;

	private bool _impedanceWaitStarted;

	private int _minWeight = 10;

	private User _user;

	private BodyComposition _receivedBodyComposition;

	public BodyComposition BodyComposition
	{
		get
		{
			return _receivedBodyComposition;
		}
		set
		{
			_receivedBodyComposition = value;
		}
	}

	public Scale(ILogService logService, IDataInterpreter dataInterpreter)
	{
		_logService = logService;
		_adapter = CrossBluetoothLE.Current.Adapter;
		_adapter.ScanTimeout = 50000;
		_adapter.ScanTimeoutElapsed += TimeOuted;
		_dataInterpreter = dataInterpreter;
	}

	public async Task<BodyComposition> GetBodyCompositonAsync(string scaleAddress, User user)
	{
		BodyComposition = null;
		_lastSuccessfulBodyComposition = null;
		_receivedBodyComposition = null;
		_impedanceWaitFinished = false;
		_impedanceWaitStarted = false;
		_user = user;
		_scaleBlutetoothAddress = scaleAddress;
		_completionSource = new TaskCompletionSource<BodyComposition>();
		_adapter.DeviceAdvertised += DeviceAdvertided;
		await _adapter.StartScanningForDevicesAsync();
		return await _completionSource.Task;
	}

	private void DeviceAdvertided(object s, DeviceEventArgs a)
	{
		object nativeDevice = a.Device.NativeDevice;
		if (!(((string)nativeDevice.GetType().GetProperty("Address").GetValue(nativeDevice, null)).ToLowerInvariant() == _scaleBlutetoothAddress?.ToLowerInvariant()))
		{
			return;
		}
		try
		{
			IDevice device = a.Device;
			BodyComposition scanData = GetScanData(device);
			if (scanData != null && scanData.Weight > (double)_minWeight)
			{
				BodyComposition = scanData;
			}
			ProcessReceivedData();
			SetPreviews(scanData);
		}
		catch (Exception ex)
		{
			_logService.LogError(ex.Message);
			if (_scannedData != null)
			{
				_logService.LogInfo(string.Join("; ", _scannedData));
			}
		}
		finally
		{
			if (BodyComposition != null && (BodyComposition.HasImpedance || _impedanceWaitFinished))
			{
				StopAsync().Wait();
				_lastSuccessfulMeasure = BodyComposition.Date;
				BodyComposition.IsValid = true;
				_completionSource.SetResult(BodyComposition);
			}
		}
	}

	private void ProcessReceivedData()
	{
		if (BodyComposition == null)
		{
			return;
		}
		_lastSuccessfulBodyComposition = BodyComposition;
		if (!BodyComposition.IsStabilized)
		{
			BodyComposition = null;
		}
		else if (_lastSuccessfulMeasure.HasValue && _lastSuccessfulMeasure >= BodyComposition.Date)
		{
			BodyComposition = null;
		}
		else if (!_impedanceWaitStarted)
		{
			_impedanceWaitStarted = true;
			Task.Factory.StartNew((Func<Task>)(async () =>
			{
				await Task.Delay(TimeSpan.FromSeconds(5L));
				_impedanceWaitStarted = false;
				_impedanceWaitFinished = true;
			}));
		}
	}

	public static string BytesToHex(byte[] bytes)
	{
		return BitConverter.ToString(bytes).Replace("-", "").ToLower();
	}

	private void SetPreviews(BodyComposition bodyCompositionCandidate)
	{
		if (Preferences.Get(PreferencesKeys.ShowDebugInfo, false))
		{
			ScaleMeasurement.Instance.FoundScale = ((bodyCompositionCandidate != null) ? "Connected to scale: Yes" : "Connected to scale: No");
			if (bodyCompositionCandidate != null)
			{
				ScaleMeasurement.Instance.DebugData = (bodyCompositionCandidate.IsStabilized ? "Stabilized: Yes" : "Stabilized: No") + " " + (bodyCompositionCandidate.HasImpedance ? "Impedance: Yes" : "Impedance: No");
				if (bodyCompositionCandidate.RawDataLog != null && bodyCompositionCandidate.RawDataLog.Count > 0)
				{
					ScaleMeasurement.Instance.RawData = string.Join("|", bodyCompositionCandidate.RawDataLog.Select(BytesToHex));
				}
				else if (bodyCompositionCandidate.ReceivedRawData != null && bodyCompositionCandidate.ReceivedRawData.Length != 0)
				{
					ScaleMeasurement.Instance.RawData = BytesToHex(bodyCompositionCandidate.ReceivedRawData);
				}
			}
		}
		if (BodyComposition != null)
		{
			ScaleMeasurement.Instance.Weight = BodyComposition.Weight.ToString("0.##") + "kg";
		}
	}

	private BodyComposition GetScanData(IDevice device)
	{
		if (device != null)
		{
			byte[] data = (_scannedData = (from x in device.AdvertisementRecords
				where x.Type == AdvertisementRecordType.ServiceData
				select x.Data).FirstOrDefault());
			BodyComposition bodyComposition = _dataInterpreter.ComputeData(data, _user, _scaleBlutetoothAddress);
			if (bodyComposition != null)
			{
				bodyComposition.ReceivedRawData = _scannedData;
				if (!bodyComposition.RawDataLog.Contains(_scannedData))
				{
					bodyComposition.RawDataLog.Add(_scannedData);
				}
			}
			return bodyComposition;
		}
		return null;
	}

	private void CalculateBMIIfEmpty()
	{
		if (BodyComposition != null && BodyComposition.BMI == 0.0 && _user.Height != 0)
		{
			double num = (double)_user.Height / 100.0;
			BodyComposition.BMI = Math.Round(BodyComposition.Weight / (num * num), 2);
		}
	}

	public async Task CancelSearchAsync()
	{
		try
		{
			if (BodyComposition != null)
			{
				BodyComposition.IsValid = false;
			}
			if (!_completionSource.Task.IsCompleted)
			{
				_completionSource.SetResult(BodyComposition);
			}
		}
		catch (Exception ex)
		{
			_logService.LogError(ex.Message);
		}
		await StopAsync();
	}

	public void StopSearch()
	{
		StopAsync().Wait();
		if (BodyComposition != null)
		{
			BodyComposition.IsValid = true;
		}
		else if (_lastSuccessfulBodyComposition != null)
		{
			BodyComposition = _lastSuccessfulBodyComposition;
			BodyComposition.IsValid = true;
		}
		CalculateBMIIfEmpty();
	}

	private void TimeOuted(object s, EventArgs e)
	{
		StopAsync().Wait();
		_completionSource.SetResult(BodyComposition);
	}

	private async Task StopAsync()
	{
		await _adapter.StopScanningForDevicesAsync();
		_adapter.DeviceAdvertised -= DeviceAdvertided;
	}
}
