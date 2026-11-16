using UniInject;

public class SetVideoGapAction : INeedInjection
{
	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongVideoPlayer songVideoPlayer;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public void Execute(float newVideoGap)
	{
		songMeta.VideoGap = newVideoGap;
		songVideoPlayer.SyncVideoWithMusic(songAudioPlayer.PositionInSongInMillis, forceImmediateSync: true);
	}

	public void ExecuteAndNotify(float newVideoGap)
	{
		Execute(newVideoGap);
		songMetaChangeEventStream.OnNext(new SongPropertyChangedEvent(ESongProperty.VideoGap));
	}
}
