using UniInject;
using UnityEngine.UIElements;

public class NoNoteSingSceneDisplayer : AbstractSingSceneNoteDisplayer
{
	[Inject(UxmlName = "lyricsContainer")]
	private VisualElement lyricsContainer;

	public override void OnInjectionFinished()
	{
		targetNoteEntryContainer.Clear();
		recordedNoteEntryContainer.Clear();
		effectsContainer.Clear();
		lyricsContainer.HideByDisplay();
	}

	protected override void UpdateNotePosition(VisualElement visualElement, int midiNote, double noteStartBeat, double noteEndBeat)
	{
	}
}
