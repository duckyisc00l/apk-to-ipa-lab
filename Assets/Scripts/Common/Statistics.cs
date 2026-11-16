using System;
using System.Collections.Generic;
using System.Linq;
using FullSerializer;
using UnityEngine;

[Serializable]
public class Statistics
{
	public float TotalPlayTimeSeconds { get; private set; }

	public Dictionary<string, LocalStatistic> LocalStatistics { get; private set; } = new Dictionary<string, LocalStatistic>();

	public Dictionary<string, WebStatistic> WebStatistics { get; private set; } = new Dictionary<string, WebStatistic>();

	public List<TopEntry> TopTenList { get; private set; } = new List<TopEntry>();

	public TopEntry TopScore { get; private set; }

	[fsIgnore]
	public bool IsDirty { get; set; }

	public LocalStatistic GetLocalStats(SongMeta songMeta)
	{
		LocalStatistics.TryGetValue(songMeta.SongHash, out var value);
		return value;
	}

	public WebStatistic GetWebStats(SongMeta songMeta)
	{
		WebStatistics.TryGetValue(songMeta.SongHash, out var value);
		return value;
	}

	public void UpdateTotalPlayTime()
	{
		TotalPlayTimeSeconds += Time.realtimeSinceStartup;
	}

	public void RecordSongStarted(SongMeta songMeta)
	{
		LocalStatistics.GetOrInitialize(songMeta.SongHash).IncrementSongStarted();
		IsDirty = true;
	}

	public void RecordSongFinished(SongMeta songMeta, List<SongStatistic> songStatistics)
	{
		Debug.Log("Recording song finished stats for: " + songMeta.Title);
		LocalStatistic orInitialize = LocalStatistics.GetOrInitialize(songMeta.SongHash);
		orInitialize.IncrementSongFinished();
		foreach (SongStatistic songStatistic in songStatistics)
		{
			orInitialize.AddSongStatistics(songStatistic);
			UpdateTopScores(songMeta, songStatistic);
		}
		IsDirty = true;
	}

	private void UpdateTopScores(SongMeta songMeta, SongStatistic songStatistic)
	{
		Debug.Log("Updating top scores");
		TopEntry topEntry = new TopEntry(songMeta.Title, songMeta.Artist, songStatistic);
		if (TopScore == null || songStatistic.Score > TopScore.SongStatistic.Score)
		{
			TopScore = topEntry;
		}
		int num = -1;
		for (int i = 0; i < TopTenList.Count; i++)
		{
			if (songStatistic.Score > TopTenList[i].SongStatistic.Score)
			{
				num = i + 1;
				break;
			}
		}
		if (num == -1 || TopTenList.Count < 10)
		{
			TopTenList.Add(topEntry);
		}
		else
		{
			TopTenList.Insert(num, topEntry);
		}
		if (TopTenList.Count > 10)
		{
			TopTenList = TopTenList.Take(10).ToList();
		}
	}

	public bool HasHighscore(SongMeta songMeta)
	{
		if (GetLocalStats(songMeta) != null)
		{
			return !GetLocalStats(songMeta).StatsEntries.SongStatistics.IsNullOrEmpty();
		}
		return false;
	}
}
