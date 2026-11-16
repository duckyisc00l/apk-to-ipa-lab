using System.Collections.Generic;
using System.Linq;
using UniInject;

public class DeleteNotesAction : INeedInjection
{
	[Inject]
	private SongEditorLayerManager songEditorLayerManager;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private DeleteSentencesAction deleteSentencesAction;

	public List<Sentence> Execute(IReadOnlyCollection<Note> selectedNotes)
	{
		if (selectedNotes.IsNullOrEmpty())
		{
			return new List<Sentence>();
		}
		HashSet<Sentence> hashSet = new HashSet<Sentence>();
		foreach (Note selectedNote in selectedNotes)
		{
			if (selectedNote.Sentence != null)
			{
				hashSet.Add(selectedNote.Sentence);
			}
			selectedNote.SetSentence(null);
			songEditorLayerManager.RemoveNoteFromAllEnumLayers(selectedNote);
			editorNoteDisplayer.RemoveNoteControl(selectedNote);
		}
		List<Sentence> list = hashSet.Where((Sentence sentence) => sentence.Notes.IsNullOrEmpty()).ToList();
		deleteSentencesAction.Execute(list);
		return list;
	}

	public void ExecuteAndNotify(IReadOnlyCollection<Note> selectedNotes)
	{
		List<Sentence> list = Execute(selectedNotes);
		songMetaChangeEventStream.OnNext(new NotesDeletedEvent
		{
			Notes = selectedNotes
		});
		if (!list.IsNullOrEmpty())
		{
			songMetaChangeEventStream.OnNext(new SentencesDeletedEvent
			{
				Sentences = list
			});
		}
	}
}
