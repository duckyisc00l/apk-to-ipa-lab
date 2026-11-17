using System;

[Serializable]
public class SentenceScore
{
	public Sentence Sentence { get; private set; }

	public PlayerScoreControllerBeatData NormalBeatData { get; private set; } = new PlayerScoreControllerBeatData(EPlayerScoreControllerBeatDataNoteType.Normal);

	public PlayerScoreControllerBeatData GoldenBeatData { get; private set; } = new PlayerScoreControllerBeatData(EPlayerScoreControllerBeatDataNoteType.Golden);

	public int TotalScoreSoFar { get; set; }

	public SentenceScore(Sentence sentence)
	{
		Sentence = sentence;
	}

	public PlayerScoreControllerBeatData GetBeatData(Note note)
	{
		if (note.IsNormal)
		{
			return NormalBeatData;
		}
		if (note.IsGolden)
		{
			return GoldenBeatData;
		}
		return null;
	}
}
