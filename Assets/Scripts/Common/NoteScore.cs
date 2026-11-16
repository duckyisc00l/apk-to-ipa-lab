using System;

[Serializable]
public class NoteScore
{
	public Note Note { get; private set; }

	public int CorrectlySungBeats { get; set; }

	public bool IsPerfect => CorrectlySungBeats >= Note.Length;

	public NoteScore(Note note)
	{
		Note = note;
	}
}
