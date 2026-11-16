using System.Collections.Generic;

public class CompareByTopEntryScore : IComparer<TopEntry>
{
	public int Compare(TopEntry x, TopEntry y)
	{
		if (x.SongStatistic == null || y.SongStatistic == null)
		{
			return 0;
		}
		return x.SongStatistic.Score.CompareTo(y.SongStatistic.Score);
	}
}
