using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class ScrollingNoteStreamDisplayer : AbstractSingSceneNoteDisplayer
{
	private const float PitchIndicatorXPercent = 0.15f;

	private const float DisplayedNoteDurationInSeconds = 5f;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private Voice voice;

	[Inject(UxmlName = "lyricsContainer")]
	private VisualElement lyricsContainer;

	private List<Note> upcomingNotes = new List<Note>();

	private List<Sentence> upcomingSentences = new List<Sentence>();

	private int micDelayInMillis;

	private int displayedBeats;

	private int frameCount;

	private readonly Dictionary<Note, Label> noteToLyricsContainerLabel = new Dictionary<Note, Label>();

	private readonly Dictionary<Sentence, VisualElement> sentenceToSeparator = new Dictionary<Sentence, VisualElement>();

	public override void OnInjectionFinished()
	{
		base.OnInjectionFinished();
		if (micProfile != null)
		{
			micDelayInMillis = micProfile.DelayInMillis;
			effectsContainer.Add(CreateRecordingPositionIndicator());
		}
		upcomingNotes = voice.Sentences.SelectMany((Sentence sentence) => sentence.Notes).ToList();
		upcomingNotes.Sort(Note.comparerByStartBeat);
		upcomingSentences = voice.Sentences.ToList();
		avgMidiNote = CalculateAvgMidiNote(voice.Sentences.SelectMany((Sentence sentence) => sentence.Notes).ToList());
		maxNoteRowMidiNote = avgMidiNote + noteRowCount / 2;
		minNoteRowMidiNote = avgMidiNote - noteRowCount / 2;
		displayedBeats = (int)Math.Ceiling(BpmUtils.GetBeatsPerSecond(songMeta) * 5.0);
	}

	public override void Update()
	{
		base.Update();
		RemoveNotesOutsideOfDisplayArea();
		CreateNotesInDisplayArea();
		sentenceToSeparator.ForEach((KeyValuePair<Sentence, VisualElement> entry) =>
		{
			Sentence key = entry.Key;
			VisualElement value = entry.Value;
			UpdateSeparatorPosition(value, key);
		});
	}

	protected override void UpdateTargetNoteControl(TargetNoteControl targetNoteControl)
	{
		base.UpdateTargetNoteControl(targetNoteControl);
		UpdateNotePosition(targetNoteControl.VisualElement, targetNoteControl.Note.MidiNote, targetNoteControl.Note.StartBeat, targetNoteControl.Note.EndBeat);
		UpdateNoteLyricsPosition(targetNoteControl);
	}

	protected override void UpdateRecordedNoteControl(RecordedNoteControl recordedNoteControl)
	{
		base.UpdateRecordedNoteControl(recordedNoteControl);
		if (recordedNoteControl.EndBeat >= (double)recordedNoteControl.TargetEndBeat)
		{
			UpdateNotePosition(recordedNoteControl.VisualElement, recordedNoteControl.MidiNote, recordedNoteControl.StartBeat, recordedNoteControl.EndBeat);
		}
	}

	protected override void UpdateNotePosition(VisualElement visualElement, int midiNote, double noteStartBeat, double noteEndBeat)
	{
		double millisInSong = songAudioPlayer.PositionInSongInMillis - (double)micDelayInMillis;
		double num = BpmUtils.MillisecondInSongToBeat(songMeta, millisInSong);
		Vector2 yStartAndEndInPercentForMidiNote = GetYStartAndEndInPercentForMidiNote(midiNote);
		float x = yStartAndEndInPercentForMidiNote.x;
		float y = yStartAndEndInPercentForMidiNote.y;
		float num2 = (float)((noteStartBeat - num) / (double)displayedBeats) + 0.15f;
		float num3 = (float)((noteEndBeat - num) / (double)displayedBeats) + 0.15f;
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

	protected override TargetNoteControl CreateTargetNoteControl(Note note)
	{
		TargetNoteControl targetNoteControl = base.CreateTargetNoteControl(note);
		if (targetNoteControl == null)
		{
			return null;
		}
		lyricsContainer.HideByDisplay();
		return targetNoteControl;
	}

	private void UpdateNoteLyricsPosition(TargetNoteControl targetNoteControl)
	{
		if (noteToLyricsContainerLabel.TryGetValue(targetNoteControl.Note, out var value))
		{
			UpdateNotePosition(value, 60, targetNoteControl.Note.StartBeat, GetNoteStartBeatOfFollowingNote(targetNoteControl.Note));
			value.style.position = new StyleEnum<Position>(Position.Absolute);
			value.style.top = 5f;
			value.style.bottom = new StyleLength(StyleKeyword.Auto);
		}
	}

	private static double GetNoteStartBeatOfFollowingNote(Note note)
	{
		Sentence sentence = note.Sentence;
		if (sentence == null)
		{
			return note.EndBeat;
		}
		Note note2 = (from otherNote in sentence.Notes
			where otherNote.StartBeat >= note.EndBeat
			orderby otherNote.StartBeat
			select otherNote).FirstOrDefault();
		if (note2 != null)
		{
			if (note.EndBeat == note2.StartBeat)
			{
				return note.EndBeat;
			}
			return note2.StartBeat - 1;
		}
		return sentence.ExtendedMaxBeat;
	}

	private void CreateNotesInDisplayArea()
	{
		int num = CalculateDisplayAreaMinBeat();
		int num2 = CalculateDisplayAreaMaxBeat();
		List<Note> list = new List<Note>();
		foreach (Note upcomingNote in upcomingNotes)
		{
			if (num <= upcomingNote.StartBeat && upcomingNote.StartBeat <= num2)
			{
				list.Add(upcomingNote);
			}
			else if (upcomingNote.StartBeat > num2)
			{
				break;
			}
		}
		foreach (Note item in list)
		{
			upcomingNotes.Remove(item);
			CreateTargetNoteControl(item);
		}
		List<Sentence> list2 = new List<Sentence>();
		foreach (Sentence upcomingSentence in upcomingSentences)
		{
			if (!sentenceToSeparator.ContainsKey(upcomingSentence))
			{
				if (num <= upcomingSentence.MinBeat && upcomingSentence.ExtendedMaxBeat <= num2)
				{
					VisualElement visualElement = CreateSentenceSeparator(upcomingSentence);
					UpdateSeparatorPosition(visualElement, upcomingSentence);
					targetNoteEntryContainer.Add(visualElement);
					list2.Add(upcomingSentence);
				}
				else if (upcomingSentence.ExtendedMaxBeat > num2)
				{
					break;
				}
			}
		}
		list2.ForEach((Sentence sentence) =>
		{
			upcomingSentences.Remove(sentence);
		});
	}

	private void UpdateSeparatorPosition(VisualElement separator, Sentence sentence)
	{
		UpdateNotePosition(separator, 0, sentence.LinebreakBeat, sentence.LinebreakBeat);
		float num = 5f;
		separator.style.top = new StyleLength(new Length(num, LengthUnit.Percent));
		separator.style.width = 1f;
		separator.style.height = new StyleLength(new Length(90f - num * 2f, LengthUnit.Percent));
	}

	private VisualElement CreateSentenceSeparator(Sentence sentence)
	{
		VisualElement visualElement = new VisualElement();
		visualElement.AddToClassList("scrollingNoteStreamSentenceSeparator");
		sentenceToSeparator[sentence] = visualElement;
		return visualElement;
	}

	private void RemoveNotesOutsideOfDisplayArea()
	{
		int displayAreaMinBeat = CalculateDisplayAreaMinBeat();
		foreach (TargetNoteControl item in noteToTargetNoteControl.Values.ToList())
		{
			if (item.Note.EndBeat < displayAreaMinBeat)
			{
				RemoveTargetNote(item);
			}
		}
		foreach (RecordedNoteControl item2 in recordedNoteToRecordedNoteControlsMap.SelectMany((KeyValuePair<RecordedNote, List<RecordedNoteControl>> entry) => entry.Value).ToList())
		{
			if (item2.EndBeat < (double)displayAreaMinBeat)
			{
				RemoveRecordedNote(item2);
			}
		}
		List<Sentence> sentencesToBeRemoved = new List<Sentence>();
		sentenceToSeparator.Keys.ForEach((Sentence sentence) =>
		{
			if (sentence.ExtendedMaxBeat < displayAreaMinBeat)
			{
				sentencesToBeRemoved.Add(sentence);
			}
		});
		sentencesToBeRemoved.ForEach((Sentence sentence) =>
		{
			RemoveSentenceSeparator(sentence);
		});
	}

	private void RemoveSentenceSeparator(Sentence sentence)
	{
		if (sentenceToSeparator.TryGetValue(sentence, out var value))
		{
			sentenceToSeparator.Remove(sentence);
			value.RemoveFromHierarchy();
		}
	}

	private static int CalculateAvgMidiNote(IReadOnlyCollection<Note> notes)
	{
		if (notes.Count <= 0)
		{
			return 0;
		}
		return (int)notes.Select((Note it) => it.MidiNote).Average();
	}

	private int CalculateDisplayAreaMinBeat()
	{
		return (int)songAudioPlayer.GetCurrentBeat(allowNegativeResult: false) - displayedBeats / 2;
	}

	private int CalculateDisplayAreaMaxBeat()
	{
		return (int)songAudioPlayer.GetCurrentBeat(allowNegativeResult: false) + displayedBeats;
	}

	private VisualElement CreateRecordingPositionIndicator()
	{
		VisualElement visualElement = new VisualElement();
		visualElement.style.backgroundColor = new Color(0.5f, 0.5f, 0.5f, 0.5f);
		visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
		visualElement.style.width = new StyleLength(new Length(1f, LengthUnit.Pixel));
		visualElement.style.height = new StyleLength(new Length(100f, LengthUnit.Percent));
		visualElement.style.left = new StyleLength(new Length(15.000001f, LengthUnit.Percent));
		return visualElement;
	}

	protected override void RemoveTargetNote(TargetNoteControl targetNoteControl)
	{
		base.RemoveTargetNote(targetNoteControl);
		if (noteToLyricsContainerLabel.TryGetValue(targetNoteControl.Note, out var value))
		{
			value.RemoveFromHierarchy();
			noteToLyricsContainerLabel.Remove(targetNoteControl.Note);
		}
	}
}
