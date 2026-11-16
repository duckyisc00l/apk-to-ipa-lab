using System;
using UnityEngine;

[Serializable]
public class MicProfile
{
	public static readonly Comparison<MicProfile> compareByName = (MicProfile micProfile1, MicProfile micProfile2) => string.Compare(micProfile1.Name, micProfile2.Name, StringComparison.InvariantCulture);

	public string Name { get; set; }

	public Color32 Color { get; set; } = Colors.crimson;

	public int Amplification { get; set; }

	public int NoiseSuppression { get; set; } = 5;

	public bool IsEnabled { get; set; }

	public int DelayInMillis { get; set; } = 300;

	public int SampleRate { get; set; }

	public string ConnectedClientId { get; set; }

	public bool IsInputFromConnectedClient => !ConnectedClientId.IsNullOrEmpty();

	public int AmplificationMultiplier => Convert.ToInt32(Math.Pow(10.0, (double)Amplification / 20.0));

	public MicProfile()
	{
	}

	public MicProfile(string name, string connectedClientId = null)
	{
		Name = name;
		ConnectedClientId = connectedClientId;
	}

	public MicProfile(MicProfile other)
	{
		Name = other.Name;
		Color = other.Color;
		Amplification = other.Amplification;
		NoiseSuppression = other.NoiseSuppression;
		IsEnabled = other.IsEnabled;
		DelayInMillis = other.DelayInMillis;
		SampleRate = other.SampleRate;
		ConnectedClientId = other.ConnectedClientId;
	}
}
