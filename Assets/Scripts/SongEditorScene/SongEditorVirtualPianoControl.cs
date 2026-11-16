using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class SongEditorVirtualPianoControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private Injector injector;

	[Inject(UxmlName = "virtualPiano")]
	private VisualElement virtualPiano;

	[Inject]
	private Settings settings;

	private ViewportEvent lastViewportEvent;

	private readonly VirtualPianoKeyControl[] virtualPianoKeyControls = new VirtualPianoKeyControl[128];

	public void OnInjectionFinished()
	{
		virtualPiano.Clear();
		for (int i = 0; i <= 127; i++)
		{
			virtualPianoKeyControls[i] = CreatePianoKeyForMidiNote(i);
			virtualPianoKeyControls[i].Hide();
		}
		noteAreaControl.ViewportEventStream.Subscribe(OnViewportChanged);
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.ShowVirtualPianoArea).Subscribe((bool newValue) =>
		{
			UpdatePianoKeys(newValue);
		});
	}

	private void OnViewportChanged(ViewportEvent viewportEvent)
	{
		if (lastViewportEvent == null || lastViewportEvent.Y != viewportEvent.Y || lastViewportEvent.Height != viewportEvent.Height)
		{
			UpdatePianoKeys();
		}
		lastViewportEvent = viewportEvent;
	}

	private void UpdatePianoKeys(bool force = false)
	{
		if (virtualPiano.IsVisibleByDisplay() || force)
		{
			int minMidiNoteInCurrentViewport = noteAreaControl.MinMidiNoteInCurrentViewport;
			int maxMidiNoteInCurrentViewport = noteAreaControl.MaxMidiNoteInCurrentViewport;
			for (int i = 0; i < minMidiNoteInCurrentViewport && i <= 127; i++)
			{
				virtualPianoKeyControls[i].Hide();
			}
			for (int j = minMidiNoteInCurrentViewport; j <= maxMidiNoteInCurrentViewport && j <= 127; j++)
			{
				virtualPianoKeyControls[j].Show();
				UpdatePosition(virtualPianoKeyControls[j]);
			}
			for (int k = maxMidiNoteInCurrentViewport + 1; k <= 127; k++)
			{
				virtualPianoKeyControls[k].Hide();
			}
		}
	}

	private VirtualPianoKeyControl CreatePianoKeyForMidiNote(int midiNote)
	{
		VisualElement visualElement = new VisualElement();
		visualElement.AddToClassList("virtualPianoKey");
		VirtualPianoKeyControl virtualPianoKeyControl = injector.WithRootVisualElement(visualElement).CreateAndInject<VirtualPianoKeyControl>();
		virtualPianoKeyControl.MidiNote = midiNote;
		virtualPiano.Add(visualElement);
		return virtualPianoKeyControl;
	}

	private void UpdatePosition(VirtualPianoKeyControl keyControl)
	{
		float num = noteAreaControl.HeightForSingleNote * 0.8f;
		float num2 = (float)noteAreaControl.GetVerticalPositionForMidiNote(keyControl.MidiNote) - num / 2f;
		float num3 = (MidiUtils.IsWhitePianoKey(keyControl.MidiNote) ? 0.9f : 0.7f);
		VisualElement visualElement = keyControl.VisualElement;
		visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
		visualElement.style.top = new StyleLength(new Length(num2 * 100f, LengthUnit.Percent));
		visualElement.style.height = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
		visualElement.style.left = 0f;
		visualElement.style.width = new StyleLength(new Length(num3 * 100f, LengthUnit.Percent));
	}
}
