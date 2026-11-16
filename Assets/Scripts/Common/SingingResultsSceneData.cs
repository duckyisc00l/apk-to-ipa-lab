using System;
using System.Collections.Generic;

[Serializable]
public class SingingResultsSceneData : SceneData
{
	private readonly Dictionary<PlayerProfile, PlayerScoreControlData> playerScoreMap = new Dictionary<PlayerProfile, PlayerScoreControlData>();

	public SongMeta SongMeta { get; set; }

	public int SongDurationInMillis { get; set; }

	public List<PlayerProfile> PlayerProfiles { get; set; } = new List<PlayerProfile>();

	public Dictionary<PlayerProfile, MicProfile> PlayerProfileToMicProfileMap { get; set; } = new Dictionary<PlayerProfile, MicProfile>();

	public void AddPlayerScores(PlayerProfile profile, PlayerScoreControlData scoreData)
	{
		if (!PlayerProfiles.Contains(profile))
		{
			PlayerProfiles.Add(profile);
		}
		playerScoreMap[profile] = scoreData;
	}

	public PlayerScoreControlData GetPlayerScores(PlayerProfile playerProfile)
	{
		return playerScoreMap[playerProfile];
	}
}
