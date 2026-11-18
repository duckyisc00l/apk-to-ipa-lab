using System.ComponentModel;

namespace MiScaleExporter.Models;

public class ScaleMeasurement : INotifyPropertyChanged
{
	private string _weight;

	private string _foundScale;

	private string _debugData;

	private string _rawData;

	public static ScaleMeasurement Instance { get; } = new ScaleMeasurement();

	public string Weight
	{
		get
		{
			return _weight;
		}
		set
		{
			if (_weight != value)
			{
				_weight = value;
				PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("Weight"));
			}
		}
	}

	public string FoundScale
	{
		get
		{
			return _foundScale;
		}
		set
		{
			if (_foundScale != value)
			{
				_foundScale = value;
				PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("FoundScale"));
			}
		}
	}

	public string DebugData
	{
		get
		{
			return _debugData;
		}
		set
		{
			if (_debugData != value)
			{
				_debugData = value;
				PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("DebugData"));
			}
		}
	}

	public string RawData
	{
		get
		{
			return _rawData;
		}
		set
		{
			if (_rawData != value)
			{
				_rawData = value;
				PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("RawData"));
			}
		}
	}

	public event PropertyChangedEventHandler PropertyChanged;

	private ScaleMeasurement()
	{
	}
}
