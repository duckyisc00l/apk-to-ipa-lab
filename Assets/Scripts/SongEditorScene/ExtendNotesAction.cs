using System.Collections.Generic;
using UniInject;

public class ExtendNotesAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public void ExtendNotesLeft(int distanceInBeats, IEnumerable<Note> selectedNotes)
	{
		foreach (Note selectedNote in selectedNotes)
		{
			int num = selectedNote.StartBeat + distanceInBeats;
			if (num < selectedNote.EndBeat)
			{
				selectedNote.SetStartBeat(num);
			}
		}
	}

	public void ExtendNotesRight(int distanceInBeats, IEnumerable<Note> selectedNotes, IEnumerable<Note> followingNotes)
	{
		foreach (Note selectedNote in selectedNotes)
		{
			int num = selectedNote.EndBeat + distanceInBeats;
			if (num > selectedNote.StartBeat)
			{
				selectedNote.SetEndBeat(num);
			}
		}
		foreach (Note followingNote in followingNotes)
		{
			followingNote.MoveHorizontal(distanceInBeats);
		}
	}

	public void ExtendNotesLeftAndNotify(int distanceInBeats, IEnumerable<Note> selectedNotes)
	{
		ExtendNotesLeft(distanceInBeats, selectedNotes);
		songMetaChangeEventStream.OnNext(new NotesChangedEvent());
	}

	public void ExtendNotesRightAndNotify(int distanceInBeats, IEnumerable<Note> selectedNotes, IEnumerable<Note> followingNotes)
	{
		ExtendNotesRight(distanceInBeats, selectedNotes, followingNotes);
		songMetaChangeEventStream.OnNext(new NotesChangedEvent());
	}
}
