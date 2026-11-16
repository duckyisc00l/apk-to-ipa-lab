using System;

[Serializable]
public class SongStatistic
{
	public string PlayerName { get; private set; }

	public EDifficulty Difficulty { get; private set; }

	public EScoreMode ScoreMode { get; private set; }

	public int Score { get; private set; }

	public DateTime DateTime { get; private set; }

	public SongStatistic(string playerName, EDifficulty difficulty, int score, EScoreMode scoreMode)
	{
		PlayerName = playerName;
		Difficulty = difficulty;
		Score = score;
		DateTime = DateTime.Now;
		ScoreMode = scoreMode;
	}
}
