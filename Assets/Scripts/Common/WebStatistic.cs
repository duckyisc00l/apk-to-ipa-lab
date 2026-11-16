using System;

[Serializable]
public class WebStatistic
{
	public string WebSite { get; private set; }

	public StatisticEntries StatsEntries { get; private set; } = new StatisticEntries();

	public void SetWebSite(string webSite)
	{
		WebSite = webSite;
	}

	public void UpdateSongFinished(SongStatistic songStatistic)
	{
		StatsEntries.AddRecord(songStatistic);
	}
}
