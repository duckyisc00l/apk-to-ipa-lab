public static class BpmUtils
{
	public static double BeatToMillisecondsInSong(SongMeta songMeta, double beat)
	{
		return BeatToMillisecondsInSongWithoutGap(songMeta, beat) + (double)songMeta.Gap;
	}

	public static double BeatToMillisecondsInSongWithoutGap(SongMeta songMeta, double beat)
	{
		double beatsPerMinute = GetBeatsPerMinute(songMeta);
		double num = 60000.0 / beatsPerMinute;
		return beat * num;
	}

	public static double GetBeatsPerMinute(SongMeta songMeta)
	{
		return (double)songMeta.Bpm * 4.0;
	}

	public static double GetBeatsPerSecond(SongMeta songMeta)
	{
		return GetBeatsPerMinute(songMeta) / 60.0;
	}

	public static double MillisecondInSongToBeat(SongMeta songMeta, double millisInSong)
	{
		return MillisecondInSongToBeatWithoutGap(songMeta, millisInSong - (double)songMeta.Gap);
	}

	public static double MillisecondInSongToBeatWithoutGap(SongMeta songMeta, double millisInSong)
	{
		return GetBeatsPerMinute(songMeta) * millisInSong / 1000.0 / 60.0;
	}

	public static double MillisecondsPerBeat(SongMeta songMeta)
	{
		double num = BeatToMillisecondsInSong(songMeta, 0.0);
		return BeatToMillisecondsInSong(songMeta, 1.0) - num;
	}
}
