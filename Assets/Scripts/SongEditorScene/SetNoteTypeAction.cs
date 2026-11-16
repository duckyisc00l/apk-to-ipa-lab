using System.Collections.Generic;
using UniInject;

public class SetNoteTypeAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public bool CanExecute(IReadOnlyCollection<Note> selectedNotes, ENoteType type)
	{
		return selectedNotes.AnyMatch((Note note) => note.Type != type);
	}

	public void Execute(IReadOnlyCollection<Note> selectedNotes, ENoteType type)
	{
		foreach (Note selectedNote in selectedNotes)
		{
			selectedNote.SetType(type);
		}
	}

	public void ExecuteAndNotify(IReadOnlyCollection<Note> selectedNotes, ENoteType type)
	{
		Execute(selectedNotes, type);
		songMetaChangeEventStream.OnNext(new NoteTypeChangeEvent());
	}
}
