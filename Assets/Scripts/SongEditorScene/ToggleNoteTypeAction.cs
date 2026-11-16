using System.Collections.Generic;
using UniInject;

public class ToggleNoteTypeAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public void Execute(IEnumerable<Note> selectedNotes, ENoteType noteType)
	{
		ENoteType type = ((!selectedNotes.AllMatch((Note it) => it.Type == noteType)) ? noteType : ENoteType.Normal);
		foreach (Note selectedNote in selectedNotes)
		{
			selectedNote.SetType(type);
		}
	}

	public void ExecuteAndNotify(IEnumerable<Note> selectedNotes, ENoteType noteType)
	{
		Execute(selectedNotes, noteType);
		songMetaChangeEventStream.OnNext(new NoteTypeChangeEvent());
	}
}
