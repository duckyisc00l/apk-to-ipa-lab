using System;

[Serializable]
public class PlayerScoreControllerBeatData
{
	public EPlayerScoreControllerBeatDataNoteType NoteType { get; private set; }

	public int PerfectBeats { get; set; }

	public int GoodBeats { get; set; }

	public int PerfectAndGoodBeats => PerfectBeats + GoodBeats;

	public PlayerScoreControllerBeatData(EPlayerScoreControllerBeatDataNoteType noteType)
	{
		NoteType = noteType;
	}
}
