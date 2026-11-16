using System.Collections.Generic;
using UniInject;

public class SentenceFitToNoteAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public void Execute(IReadOnlyCollection<Sentence> selectedSentences)
	{
		foreach (Sentence selectedSentence in selectedSentences)
		{
			selectedSentence.UpdateMinAndMaxBeat();
			selectedSentence.SetLinebreakBeat(selectedSentence.MaxBeat);
		}
	}

	public void ExecuteAndNotify(IReadOnlyCollection<Sentence> selectedSentences)
	{
		Execute(selectedSentences);
		songMetaChangeEventStream.OnNext(new SentencesChangedEvent());
	}
}
