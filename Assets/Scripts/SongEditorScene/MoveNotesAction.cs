using System.Collections.Generic;
using System.Linq;
using UniInject;

public class MoveNotesAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public void MoveNotesHorizontal(int distanceInBeats, IEnumerable<Note> selectedNotes, IEnumerable<Note> followingNotes)
	{
		foreach (Note item in selectedNotes.Union(followingNotes))
		{
			item.MoveHorizontal(distanceInBeats);
		}
	}

	public void MoveNotesVertical(int distanceInMidiNotes, IEnumerable<Note> selectedNotes, IEnumerable<Note> followingNotes)
	{
		foreach (Note item in selectedNotes.Union(followingNotes))
		{
			item.MoveVertical(distanceInMidiNotes);
		}
	}

	public void MoveNotesVerticalAndNotify(int distanceInMidiNotes, IEnumerable<Note> selectedNotes, IEnumerable<Note> followingNotes)
	{
		MoveNotesVertical(distanceInMidiNotes, selectedNotes, followingNotes);
		songMetaChangeEventStream.OnNext(new NotesChangedEvent());
	}

	public void MoveNotesHorizontalAndNotify(int distanceInBeats, IEnumerable<Note> selectedNotes, IEnumerable<Note> followingNotes)
	{
		MoveNotesHorizontal(distanceInBeats, selectedNotes, followingNotes);
		songMetaChangeEventStream.OnNext(new NotesChangedEvent());
	}
}
