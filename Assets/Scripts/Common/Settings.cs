using System;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class Settings : ISettings
{
	public GameSettings GameSettings { get; set; } = new GameSettings();

	public GraphicSettings GraphicSettings { get; set; } = new GraphicSettings();

	public AudioSettings AudioSettings { get; set; } = new AudioSettings();

	public List<PlayerProfile> PlayerProfiles { get; set; } = CreateDefaultPlayerProfiles();

	public List<MicProfile> MicProfiles { get; set; } = new List<MicProfile>();

	public string LastMicProfileNameInRecordingOptionsScene { get; set; }

	public WebcamSettings WebcamSettings { get; set; } = new WebcamSettings();

	public SongEditorSettings SongEditorSettings { get; set; } = new SongEditorSettings();

	public SongSelectSettings SongSelectSettings { get; set; } = new SongSelectSettings();

	public DeveloperSettings DeveloperSettings { get; set; } = new DeveloperSettings();

	public List<string> IgnoredReleases { get; set; } = new List<string>();

	public int UdpPortOnServer { get; set; } = 34567;

	public int UdpPortOnClient { get; set; } = 34568;

	public string OwnHost { get; set; }

	public SystemLanguage Language
	{
		get
		{
			return GameSettings.language;
		}
		set
		{
			GameSettings.language = value;
		}
	}

	public EPitchDetectionAlgorithm PitchDetectionAlgorithm
	{
		get
		{
			return AudioSettings.pitchDetectionAlgorithm;
		}
		set
		{
			AudioSettings.pitchDetectionAlgorithm = value;
		}
	}

	public bool ShowFps
	{
		get
		{
			return DeveloperSettings.showFps;
		}
		set
		{
			DeveloperSettings.showFps = value;
		}
	}

	private static List<PlayerProfile> CreateDefaultPlayerProfiles()
	{
		return new List<PlayerProfile>
		{
			new PlayerProfile("Player01", EDifficulty.Medium),
			new PlayerProfile("Player02", EDifficulty.Easy, "Silhouette02.png")
		};
	}
}
