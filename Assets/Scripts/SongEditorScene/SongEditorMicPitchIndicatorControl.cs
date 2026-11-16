using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class SongEditorMicPitchIndicatorControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(UxmlName = "micPitchOutOfRangeIndicatorTop")]
	private VisualElement micPitchOutOfRangeIndicatorTop;

	[Inject(UxmlName = "micPitchOutOfRangeIndicatorBottom")]
	private VisualElement micPitchOutOfRangeIndicatorBottom;

	[Inject]
	private SongEditorMicPitchTracker micPitchTracker;

	[Inject]
	private Settings settings;

	[Inject]
	private NoteAreaControl noteAreaControl;

	public void OnInjectionFinished()
	{
		micPitchOutOfRangeIndicatorTop.HideByDisplay();
		micPitchOutOfRangeIndicatorBottom.HideByDisplay();
		micPitchTracker.PitchEventStream.Subscribe((PitchEvent pitchEvent) =>
		{
			if (pitchEvent == null)
			{
				micPitchOutOfRangeIndicatorTop.HideByDisplay();
				micPitchOutOfRangeIndicatorBottom.HideByDisplay();
			}
			else
			{
				micPitchOutOfRangeIndicatorTop.SetVisibleByDisplay(pitchEvent.MidiNote > noteAreaControl.MaxMidiNoteInCurrentViewport);
				micPitchOutOfRangeIndicatorBottom.SetVisibleByDisplay(pitchEvent.MidiNote < noteAreaControl.MinMidiNoteInCurrentViewport);
			}
		});
	}
}
