using System.Collections.Generic;
using System.Linq;
using UniInject;

public class MoveNoteToOwnSentenceAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private DeleteSentencesAction deleteSentencesAction;

	public bool CanMoveToOwnSentence(List<Note> notes)
	{
		if (notes.IsNullOrEmpty())
		{
			return false;
		}
		return notes.AnyMatch((Note note) => note.Sentence?.Voice != null);
	}

	public void MoveToOwnSentence(List<Note> notes)
	{
		List<Sentence> source = notes.Select((Note note) => note.Sentence).ToList();
		Sentence newSentence = new Sentence();
		Voice voice = notes.Select((Note note) => note.Sentence?.Voice).FirstOrDefault();
		newSentence.SetVoice(voice);
		notes.ForEach((Note note) =>
		{
			note.SetSentence(newSentence);
		});
		newSentence.FitToNotes();
		List<Sentence> selectedSentences = source.Where((Sentence it) => it.Notes.IsNullOrEmpty()).ToList();
		deleteSentencesAction.Execute(selectedSentences);
		source.Where((Sentence it) => !it.Notes.IsNullOrEmpty()).ToList().ForEach((Sentence it) =>
		{
			it.FitToNotes();
		});
	}

	public void MoveToOwnSentenceAndNotify(List<Note> notes)
	{
		MoveToOwnSentence(notes);
		songMetaChangeEventStream.OnNext(new SentencesChangedEvent());
	}
}
