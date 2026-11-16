using UnityEngine;

public interface ISettings
{
	SystemLanguage Language { get; set; }

	EPitchDetectionAlgorithm PitchDetectionAlgorithm { get; set; }

	bool ShowFps { get; }

	int UdpPortOnServer { get; set; }

	int UdpPortOnClient { get; set; }

	string OwnHost { get; set; }
}
