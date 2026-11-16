using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class OverviewAreaPositionInSongIndicatorControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject(UxmlName = "overviewAreaPositionInSongIndicator")]
	private VisualElement overviewAreaPositionInSongIndicator;

	public void OnInjectionFinished()
	{
		songAudioPlayer.PositionInSongEventStream.Subscribe(SetPositionInSongInMillis);
	}

	private void SetPositionInSongInMillis(double positionInSongInMillis)
	{
		double positionInSongInPercent = positionInSongInMillis / songAudioPlayer.DurationOfSongInMillis;
		UpdatePosition(positionInSongInPercent);
	}

	private void UpdatePosition(double positionInSongInPercent)
	{
		float num = (float)positionInSongInPercent;
		overviewAreaPositionInSongIndicator.style.left = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
	}
}
