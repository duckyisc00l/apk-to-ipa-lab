using System;

[Serializable]
public class SongRatingIconsJson
{
	public string toneDeaf;

	public string amateur;

	public string wannabe;

	public string hopeful;

	public string risingStar;

	public string leadSinger;

	public string superstar;

	public string ultrastar;

	public string GetValueForSongRating(SongRating.ESongRating songRating)
	{
		return songRating switch
		{
			SongRating.ESongRating.ToneDeaf => toneDeaf, 
			SongRating.ESongRating.Amateur => amateur, 
			SongRating.ESongRating.Wannabe => wannabe, 
			SongRating.ESongRating.Hopeful => hopeful, 
			SongRating.ESongRating.RisingStar => risingStar, 
			SongRating.ESongRating.LeadSinger => leadSinger, 
			SongRating.ESongRating.Superstar => superstar, 
			SongRating.ESongRating.Ultrastar => ultrastar, 
			_ => throw new ArgumentOutOfRangeException("songRating", songRating, null), 
		};
	}
}
