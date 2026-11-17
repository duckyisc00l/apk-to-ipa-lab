using System;
using System.Collections.Generic;

[Serializable]
public class PlayerScoreControlData
{
	public Dictionary<Sentence, SentenceScore> SentenceToSentenceScoreMap { get; set; } = new Dictionary<Sentence, SentenceScore>();

	public Dictionary<Note, NoteScore> NoteToNoteScoreMap { get; set; } = new Dictionary<Note, NoteScore>();

	public PlayerScoreControllerBeatData NormalBeatData { get; private set; } = new PlayerScoreControllerBeatData(EPlayerScoreControllerBeatDataNoteType.Normal);

	public PlayerScoreControllerBeatData GoldenBeatData { get; private set; } = new PlayerScoreControllerBeatData(EPlayerScoreControllerBeatDataNoteType.Golden);

	public int NormalNoteLengthTotal { get; set; }

	public int GoldenNoteLengthTotal { get; set; }

	public int PerfectSentenceCount { get; set; }

	public int TotalSentenceCount { get; set; }

	public int TotalScore { get; set; }

	public int NormalNotesTotalScore { get; set; }

	public int GoldenNotesTotalScore { get; set; }

	public int PerfectSentenceBonusTotalScore { get; set; }

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
