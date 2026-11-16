using System;

[Serializable]
public class LocalStatistic
{
	public int TimesStarted { get; private set; }

	public int TimesFinished { get; private set; }

	public int TimesCanceled => TimesStarted - TimesFinished;

	public DateTime LastPlayed { get; private set; } = DateTime.MinValue;

	public StatisticEntries StatsEntries { get; private set; } = new StatisticEntries();

	public void IncrementSongStarted()
	{
		TimesStarted++;
		LastPlayed = DateTime.Now;
	}

	public void IncrementSongFinished()
	{
		TimesFinished++;
		LastPlayed = DateTime.Now;
	}

	public void AddSongStatistics(SongStatistic songStatistic)
	{
		StatsEntries.AddRecord(songStatistic);
	}
}
