using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SentenceDisplayer : AbstractSingSceneNoteDisplayer
{
	[Inject]
	private PlayerControl playerControl;

	[Inject(UxmlName = "lyricsContainer")]
	private VisualElement lyricsContainer;

	private Sentence currentSentence;

	public override void OnInjectionFinished()
	{
		base.OnInjectionFinished();
		lyricsContainer.HideByDisplay();
		playerControl.EnterSentenceEventStream.Subscribe((PlayerControl.EnterSentenceEvent enterSentenceEvent) =>
		{
			DisplaySentence(enterSentenceEvent.Sentence);
		});
	}

	private void DisplaySentence(Sentence sentence)
	{
		currentSentence = sentence;
		RemoveAllDisplayedNotes();
		if (sentence == null)
		{
			return;
		}
		avgMidiNote = ((currentSentence.Notes.Count > 0) ? ((int)currentSentence.Notes.Select((Note it) => it.MidiNote).Average()) : 0);
		maxNoteRowMidiNote = avgMidiNote + noteRowCount / 2;
		minNoteRowMidiNote = avgMidiNote - noteRowCount / 2;
		foreach (Note item in sentence.Notes.Where((Note note) => !note.IsFreestyle))
		{
			CreateTargetNoteControl(item);
		}
	}

	protected override void DisplayRecordedNote(RecordedNote recordedNote)
	{
		if (currentSentence != null && recordedNote.TargetSentence == currentSentence && (recordedNote.TargetNote == null || recordedNote.TargetNote.Sentence == currentSentence))
		{
			base.DisplayRecordedNote(recordedNote);
		}
	}

	protected override void UpdateNotePosition(VisualElement visualElement, int midiNote, double noteStartBeat, double noteEndBeat)
	{
		int minBeat = currentSentence.MinBeat;
		int num = currentSentence.MaxBeat - minBeat;
		Vector2 yStartAndEndInPercentForMidiNote = GetYStartAndEndInPercentForMidiNote(midiNote);
		float x = yStartAndEndInPercentForMidiNote.x;
		float y = yStartAndEndInPercentForMidiNote.y;
		float num2 = (float)(noteStartBeat - (double)minBeat) / (float)num;
		float num3 = (float)(noteEndBeat - (double)minBeat) / (float)num;
		x *= 100f;
		y *= 100f;
		num2 *= 100f;
		num3 *= 100f;
		visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
		visualElement.style.left = new StyleLength(new Length(num2, LengthUnit.Percent));
		visualElement.style.width = new StyleLength(new Length(num3 - num2, LengthUnit.Percent));
		visualElement.style.top = new StyleLength(new Length(x, LengthUnit.Percent));
		visualElement.style.height = new StyleLength(new Length(y - x, LengthUnit.Percent));
	}
}
