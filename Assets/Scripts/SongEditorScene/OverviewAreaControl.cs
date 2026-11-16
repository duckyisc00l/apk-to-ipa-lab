using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class OverviewAreaControl : IInjectionFinishedListener
{
	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private UIDocument uiDocument;

	[Inject(UxmlName = "overviewArea")]
	private VisualElement overviewArea;

	[Inject(UxmlName = "overviewAreaWaveform")]
	private VisualElement overviewAreaWaveform;

	[Inject(UxmlName = "overviewAreaLabel")]
	private Label overviewAreaLabel;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private Injector injector;

	[Inject]
	private AudioManager audioManager;

	private OverviewAreaPositionInSongIndicatorControl positionInSongIndicatorControl;

	private OverviewAreaViewportIndicatorControl viewportIndicatorControl;

	private OverviewAreaNoteVisualizer noteVisualizer;

	private OverviewAreaIssueVisualizer issueVisualizer;

	private AudioWaveFormVisualization audioWaveFormVisualization;

	public void OnInjectionFinished()
	{
		RegisterPointerEvents();
		positionInSongIndicatorControl = injector.WithRootVisualElement(overviewArea).CreateAndInject<OverviewAreaPositionInSongIndicatorControl>();
		viewportIndicatorControl = injector.WithRootVisualElement(overviewArea).CreateAndInject<OverviewAreaViewportIndicatorControl>();
		noteVisualizer = injector.WithRootVisualElement(overviewArea).CreateAndInject<OverviewAreaNoteVisualizer>();
		issueVisualizer = injector.WithRootVisualElement(overviewArea).CreateAndInject<OverviewAreaIssueVisualizer>();
		overviewArea.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			UpdateAudioWaveForm();
		});
	}

	public void UpdateAudioWaveForm()
	{
		if (!songAudioPlayer.HasAudioClip || songAudioPlayer.AudioClip.samples <= 0)
		{
			return;
		}
		if (audioWaveFormVisualization == null)
		{
			audioWaveFormVisualization = new AudioWaveFormVisualization(songEditorSceneControl.gameObject, overviewAreaWaveform)
			{
				WaveformColor = overviewAreaLabel.resolvedStyle.color
			};
		}
		using (new DisposableStopwatch("Created audio waveform in <millis> ms"))
		{
			string audioUri = SongMetaUtils.GetAudioUri(songMeta);
			if (!SongMetaUtils.AudioResourceExists(songMeta))
			{
				Debug.Log("Audio file resource does not exist " + audioUri);
				return;
			}
			AudioClip audioClip = audioManager.LoadAudioClipFromUri(audioUri, streamAudio: false);
			audioWaveFormVisualization.DrawWaveFormMinAndMaxValues(audioClip);
		}
	}

	private void RegisterPointerEvents()
	{
		bool isPointerDown = false;
		overviewArea.RegisterCallback((PointerDownEvent evt) =>
		{
			isPointerDown = true;
			ScrollToPointer(evt);
		}, TrickleDown.TrickleDown);
		overviewArea.RegisterCallback((PointerMoveEvent evt) =>
		{
			if (isPointerDown)
			{
				ScrollToPointer(evt);
			}
		}, TrickleDown.TrickleDown);
		overviewArea.RegisterCallback((PointerUpEvent evt) =>
		{
			isPointerDown = false;
		}, TrickleDown.TrickleDown);
	}

	private void ScrollToPointer(IPointerEvent evt)
	{
		double num = evt.localPosition.x / overviewArea.contentRect.width;
		double positionInSongInMillis = songAudioPlayer.DurationOfSongInMillis * num;
		songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
	}
}
