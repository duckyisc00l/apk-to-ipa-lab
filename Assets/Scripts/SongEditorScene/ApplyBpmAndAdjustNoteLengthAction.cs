using UniInject;

public class ApplyBpmAndAdjustNoteLengthAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private SongMeta songMeta;

	public void Execute(float newBpm)
	{
		if (newBpm == songMeta.Bpm)
		{
			return;
		}
		if (newBpm <= 60f)
		{
			UiManager.CreateNotification("New BPM is set much too low.");
			return;
		}
		songMeta.GetVoices().ForEach((Voice voice) =>
		{
			AdjustNoteLength(voice, newBpm, songMeta.Bpm);
		});
		songMeta.Bpm = newBpm;
	}

	private void AdjustNoteLength(Voice voice, float newBpm, float oldBpm)
	{
		voice.Sentences.ForEach((Sentence sentence) =>
		{
			AdjustNoteLength(sentence, newBpm, oldBpm);
		});
	}

	private void AdjustNoteLength(Sentence sentence, float newBpm, float oldBpm)
	{
		int linebreakBeat = (int)((float)sentence.LinebreakBeat * (newBpm / oldBpm));
		sentence.Notes.ForEach((Note note) =>
		{
			AdjustNoteLength(note, newBpm, oldBpm);
		});
		sentence.UpdateMinAndMaxBeat();
		sentence.SetLinebreakBeat(linebreakBeat);
	}

	private void AdjustNoteLength(Note note, float newBpm, float oldBpm)
	{
		int num = (int)((float)note.StartBeat * (newBpm / oldBpm));
		int num2 = (int)((float)note.EndBeat * (newBpm / oldBpm));
		if (num2 < num)
		{
			num2 = num + 1;
		}
		note.SetStartAndEndBeat(num, num2);
	}

	public void ExecuteAndNotify(float newBpm)
	{
		Execute(newBpm);
		songMetaChangeEventStream.OnNext(new SongPropertyChangedEvent(ESongProperty.Bpm));
	}
}
