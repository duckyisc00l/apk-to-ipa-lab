using System;
using System.Collections.Generic;

[Serializable]
public class SingSceneData : SceneData
{
	public SongMeta SelectedSongMeta { get; set; }

	public List<PlayerProfile> SelectedPlayerProfiles { get; set; } = new List<PlayerProfile>();

	public Dictionary<PlayerProfile, MicProfile> PlayerProfileToMicProfileMap { get; set; } = new Dictionary<PlayerProfile, MicProfile>();

	public Dictionary<PlayerProfile, string> PlayerProfileToVoiceNameMap { get; set; } = new Dictionary<PlayerProfile, string>();

	public double PositionInSongInMillis { get; set; }

	public bool IsRestart { get; set; }

	public int NextBeatToScore { get; set; }

	public Dictionary<PlayerProfile, PlayerScoreControlData> PlayerProfileToScoreDataMap { get; set; } = new Dictionary<PlayerProfile, PlayerScoreControlData>();
}
