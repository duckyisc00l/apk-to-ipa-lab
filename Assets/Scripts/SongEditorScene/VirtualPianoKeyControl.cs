using UniInject;
using UnityEngine.UIElements;

public class VirtualPianoKeyControl : INeedInjection, IInjectionFinishedListener
{
	private int midiNote = -1;

	[Inject]
	private MidiManager midiManager;

	public int MidiNote
	{
		get
		{
			return midiNote;
		}
		set
		{
			if (midiNote != -1)
			{
				midiManager.StopMidiNote(midiNote);
			}
			midiNote = value;
			if (MidiUtils.IsBlackPianoKey(midiNote))
			{
				VisualElement.RemoveFromClassList("whiteKey");
				VisualElement.AddToClassList("blackKey");
			}
			else
			{
				VisualElement.AddToClassList("whiteKey");
				VisualElement.RemoveFromClassList("blackKey");
			}
		}
	}

	[Inject(Key = "rootVisualElement")]
	public VisualElement VisualElement { get; private set; }

	public void OnInjectionFinished()
	{
		VisualElement.RegisterCallback((PointerDownEvent evt) =>
		{
			PlayMidiNote();
		});
		VisualElement.RegisterCallback((PointerUpEvent evt) =>
		{
			StopMidiNote();
		});
		VisualElement.RegisterCallback((PointerLeaveEvent evt) =>
		{
			StopMidiNote();
		});
	}

	private void PlayMidiNote()
	{
		StopMidiNote();
		if (midiNote > -1)
		{
			midiManager.PlayMidiNote(midiNote);
		}
	}

	private void StopMidiNote()
	{
		if (midiNote > -1)
		{
			midiManager.StopMidiNote(midiNote);
		}
	}

	public void Show()
	{
		VisualElement.ShowByDisplay();
	}

	public void Hide()
	{
		VisualElement.HideByDisplay();
	}
}
