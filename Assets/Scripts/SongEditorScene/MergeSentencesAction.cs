using System.Collections.Generic;
using System.Linq;
using UniInject;

public class MergeSentencesAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public bool CanExecute(IReadOnlyCollection<Note> selectedNotes)
	{
		if (selectedNotes.Count > 1)
		{
			return selectedNotes.Select((Note it) => it.Sentence).Distinct().Count() > 1;
		}
		return false;
	}

	public void Execute(IReadOnlyCollection<Note> selectedNotes, Note targetNote)
	{
		List<Sentence> list = selectedNotes.Select((Note note) => note.Sentence).Distinct().ToList();
		Sentence sentence = targetNote.Sentence;
		if (sentence == null)
		{
			sentence = list.FirstOrDefault();
		}
		foreach (Note selectedNote in selectedNotes)
		{
			selectedNote.SetSentence(sentence);
		}
		foreach (Sentence item in list)
		{
			if (item.Notes.Count == 0)
			{
				item.SetVoice(null);
			}
		}
	}

	public void ExecuteAndNotify(IReadOnlyCollection<Note> selectedNotes, Note targetNote)
	{
		Execute(selectedNotes, targetNote);
		songMetaChangeEventStream.OnNext(new SentencesMergedEvent());
	}
}
