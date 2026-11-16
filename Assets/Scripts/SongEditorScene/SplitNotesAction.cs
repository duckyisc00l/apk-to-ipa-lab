using System.Collections.Generic;
using UniInject;

public class SplitNotesAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongEditorLayerManager layerManager;

	public bool CanExecute(IReadOnlyCollection<Note> selectedNotes)
	{
		return selectedNotes.AnyMatch((Note it) => it.Length > 1);
	}

	public void Execute(IReadOnlyCollection<Note> selectedNotes)
	{
		foreach (Note selectedNote in selectedNotes)
		{
			if (selectedNote.Length > 1)
			{
				string text;
				if (selectedNote.Text.EndsWith(" "))
				{
					selectedNote.SetText(selectedNote.Text.Substring(0, selectedNote.Text.Length - 1));
					text = "~ ";
				}
				else
				{
					text = "~";
				}
				int num = selectedNote.StartBeat + selectedNote.Length / 2;
				Note note = new Note(selectedNote.Type, num, selectedNote.EndBeat - num, selectedNote.TxtPitch, text);
				note.SetSentence(selectedNote.Sentence);
				if (layerManager.TryGetEnumLayer(selectedNote, out var enumLayer))
				{
					layerManager.AddNoteToEnumLayer(enumLayer.LayerEnum, note);
				}
				selectedNote.SetEndBeat(num);
			}
		}
	}

	public void ExecuteAndNotify(IReadOnlyCollection<Note> selectedNotes)
	{
		Execute(selectedNotes);
		songMetaChangeEventStream.OnNext(new NotesSplitEvent());
	}
}
