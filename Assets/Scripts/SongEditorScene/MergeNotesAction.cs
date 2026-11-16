using System.Collections.Generic;
using System.Linq;
using System.Text;
using UniInject;

public class MergeNotesAction : INeedInjection
{
	[Inject]
	private DeleteNotesAction deleteNotesAction;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongEditorLayerManager layerManager;

	public bool CanExecute(IReadOnlyCollection<Note> selectedNotes)
	{
		return selectedNotes.Count > 1;
	}

	public void Execute(IReadOnlyCollection<Note> selectedNotes, Note targetNote)
	{
		List<Note> list = new List<Note>(selectedNotes);
		list.Sort(Note.comparerByStartBeat);
		int startBeat = list[0].StartBeat;
		int num = list.Select((Note it) => it.EndBeat).Max();
		StringBuilder stringBuilder = new StringBuilder();
		foreach (Note item in list)
		{
			if (stringBuilder.Length == 0 || item.Text != "~")
			{
				stringBuilder.Append(item.Text);
			}
		}
		Note note = new Note(targetNote.Type, startBeat, num - startBeat, targetNote.TxtPitch, stringBuilder.ToString());
		note.SetSentence(targetNote.Sentence);
		if (layerManager.TryGetEnumLayer(targetNote, out var enumLayer))
		{
			layerManager.AddNoteToEnumLayer(enumLayer.LayerEnum, note);
		}
		deleteNotesAction.Execute(list);
	}

	public void ExecuteAndNotify(IReadOnlyCollection<Note> selectedNotes, Note targetNote)
	{
		Execute(selectedNotes, targetNote);
		songMetaChangeEventStream.OnNext(new NotesMergedEvent());
	}
}
