using System.Collections.Generic;

public class CompareBySongScoreAscending : IComparer<SongStatistic>
{
	public int Compare(SongStatistic x, SongStatistic y)
	{
		return x.Score.CompareTo(y.Score);
	}
}
