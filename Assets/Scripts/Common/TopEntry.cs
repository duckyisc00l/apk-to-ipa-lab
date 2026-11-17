using System;

[Serializable]
public class TopEntry
{
	public string SongName { get; private set; }

	public string SongArtist { get; private set; }

	public SongStatistic SongStatistic { get; private set; }

	public TopEntry(string songName, string songArtist, SongStatistic songStatistic)
	{
		SongName = songName;
		SongArtist = songArtist;
		SongStatistic = songStatistic;
	}
}
