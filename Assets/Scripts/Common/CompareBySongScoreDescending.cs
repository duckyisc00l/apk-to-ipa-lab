using System.Collections.Generic;

public class CompareBySongScoreDescending : IComparer<SongStatistic>
{
	public int Compare(SongStatistic x, SongStatistic y)
	{
		return -x.Score.CompareTo(y.Score);
	}
}
