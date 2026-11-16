using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class OverviewAreaViewportIndicatorControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject(UxmlName = "overviewAreaViewportIndicator")]
	private VisualElement overviewAreaViewportIndicator;

	public void OnInjectionFinished()
	{
		noteAreaControl.ViewportEventStream.Subscribe(OnViewportChanged);
	}

	private void OnViewportChanged(ViewportEvent viewportEvent)
	{
		double num = viewportEvent.X;
		double num2 = viewportEvent.X + viewportEvent.Width;
		double startPercent = num / songAudioPlayer.DurationOfSongInMillis;
		double endPercent = num2 / songAudioPlayer.DurationOfSongInMillis;
		UpdatePositionAndWidth(startPercent, endPercent);
	}

	private void UpdatePositionAndWidth(double startPercent, double endPercent)
	{
		float num = (float)startPercent;
		float num2 = (float)(endPercent - startPercent);
		overviewAreaViewportIndicator.style.left = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
		overviewAreaViewportIndicator.style.width = new StyleLength(new Length(num2 * 100f, LengthUnit.Percent));
	}
}
