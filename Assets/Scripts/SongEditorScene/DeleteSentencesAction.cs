using System.Collections.Generic;
using UniInject;

public class DeleteSentencesAction : INeedInjection
{
	[Inject]
	private DeleteNotesAction deleteNotesAction;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public void Execute(List<Sentence> selectedSentences)
	{
		if (selectedSentences.IsNullOrEmpty())
		{
			return;
		}
		editorNoteDisplayer.RemoveSentences(selectedSentences);
		foreach (Sentence selectedSentence in selectedSentences)
		{
			deleteNotesAction.Execute(new List<Note>(selectedSentence.Notes));
			selectedSentence.SetVoice(null);
		}
	}

	public void ExecuteAndNotify(List<Sentence> selectedSentences)
	{
		Execute(selectedSentences);
		songMetaChangeEventStream.OnNext(new SentencesDeletedEvent
		{
			Sentences = selectedSentences
		});
	}
}
