public class ChangingOffsetSinger : AbstractDummySinger
{
	public int maxOffset = 5;

	private int noteOffset;

	private Note lastNote;

	protected override BeatPitchEvent GetDummyPitchEvent(int beat)
	{
		Note noteAtBeat = GetNoteAtBeat(beat);
		if (lastNote != null && noteAtBeat != lastNote)
		{
			noteOffset++;
			if (noteOffset > maxOffset)
			{
				noteOffset = 0;
			}
		}
		lastNote = noteAtBeat;
		if (noteAtBeat == null)
		{
			return null;
		}
		return new BeatPitchEvent((noteAtBeat.MidiNote + noteOffset) % 12 + 60, beat);
	}
}
