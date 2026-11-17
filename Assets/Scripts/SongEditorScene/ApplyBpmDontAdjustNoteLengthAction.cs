using UniInject;

public class ApplyBpmDontAdjustNoteLengthAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private SongMeta songMeta;

	public void Execute(float newBpm)
	{
		if (newBpm != songMeta.Bpm)
		{
			if (newBpm <= 60f)
			{
				UiManager.CreateNotification("New BPM is set much too low.");
			}
			else
			{
				songMeta.Bpm = newBpm;
			}
		}
	}

	public void ExecuteAndNotify(float newBpm)
	{
		Execute(newBpm);
		songMetaChangeEventStream.OnNext(new SongPropertyChangedEvent(ESongProperty.Bpm));
	}
}
