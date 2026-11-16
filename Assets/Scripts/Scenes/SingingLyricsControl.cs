using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class SingingLyricsControl : INeedInjection, IInjectionFinishedListener
{
	private const float SpaceWidthInPx = 8f;

	[Inject(UxmlName = "currentSentenceContainer")]
	private VisualElement currentSentenceContainer;

	[Inject(UxmlName = "nextSentenceContainer")]
	private VisualElement nextSentenceContainer;

	[Inject(UxmlName = "positionBeforeLyricsIndicator")]
	private VisualElement positionBeforeLyricsIndicator;

	[Inject]
	private Settings settings;

	[Inject]
	private PlayerControl playerControl;

	[Inject]
	private SongMeta songMeta;

	private Sentence previousSentence;

	private readonly Dictionary<Note, Label> currentSentenceNoteToLabelMap = new Dictionary<Note, Label>();

	public Sentence CurrentSentence { get; private set; }

	public List<Note> SortedNotes { get; private set; } = new List<Note>();

	public void OnInjectionFinished()
	{
		playerControl.EnterSentenceEventStream.Subscribe((PlayerControl.EnterSentenceEvent enterSentenceEvent) =>
		{
			Sentence sentence = playerControl.GetSentence(enterSentenceEvent.SentenceIndex + 1);
			SetCurrentSentence(enterSentenceEvent.Sentence);
			SetNextSentence(sentence);
		});
		SetCurrentSentence(playerControl.GetSentence(0));
		SetNextSentence(playerControl.GetSentence(1));
	}

	public void Update(double positionInSongInMillis)
	{
		UpdateNoteHighlighting(positionInSongInMillis);
		UpdatePositionBeforeLyricsIndicator(positionInSongInMillis);
	}

	private void UpdatePositionBeforeLyricsIndicator(double positionInSongInMillis)
	{
		if (CurrentSentence == null || CurrentSentence.Notes.IsNullOrEmpty() || SortedNotes.IsNullOrEmpty())
		{
			positionBeforeLyricsIndicator.HideByDisplay();
			return;
		}
		double num = ((previousSentence != null) ? BpmUtils.BeatToMillisecondsInSong(songMeta, previousSentence.ExtendedMaxBeat) : 0.0);
		double num2 = BpmUtils.BeatToMillisecondsInSong(songMeta, CurrentSentence.MinBeat);
		if (Math.Abs(num2 - num) < 500.0)
		{
			positionBeforeLyricsIndicator.HideByDisplay();
			return;
		}
		double num3 = (positionInSongInMillis - num) / (num2 - num);
		Note key = SortedNotes[0];
		if (num3 < 0.0 || num3 > 1.0 || !currentSentenceNoteToLabelMap.TryGetValue(key, out var value))
		{
			positionBeforeLyricsIndicator.HideByDisplay();
			return;
		}
		float xMin = value.worldBound.xMin;
		float xMin2 = currentSentenceContainer.worldBound.xMin;
		float num4 = (float)((double)(xMin - xMin2) * num3);
		positionBeforeLyricsIndicator.ShowByDisplay();
		positionBeforeLyricsIndicator.style.left = num4;
	}

	private void UpdateNoteHighlighting(double positionInSongInMillis)
	{
		Note currentNote = SortedNotes.FirstOrDefault((Note note) => BpmUtils.BeatToMillisecondsInSong(songMeta, note.StartBeat) <= positionInSongInMillis && positionInSongInMillis <= BpmUtils.BeatToMillisecondsInSong(songMeta, note.EndBeat));
		HighlightNoteLyrics(currentNote);
	}

	private void HighlightNoteLyrics(Note currentNote)
	{
		if (CurrentSentence == null)
		{
			return;
		}
		List<Note> list = CurrentSentence.Notes.ToList();
		list.Sort(Note.comparerByStartBeat);
		int num = list.IndexOf(currentNote);
		if (num < 0)
		{
			return;
		}
		for (int i = 0; i < list.Count && i <= num; i++)
		{
			Note key = list[i];
			if (currentSentenceNoteToLabelMap.TryGetValue(key, out var value))
			{
				if (i < num)
				{
					value.AddToClassList("previousNoteLyrics");
					value.RemoveFromClassList("currentNoteLyrics");
				}
				else if (i == num)
				{
					value.RemoveFromClassList("previousNoteLyrics");
					value.AddToClassList("currentNoteLyrics");
				}
				else
				{
					value.RemoveFromClassList("previousNoteLyrics");
					value.RemoveFromClassList("currentNoteLyrics");
				}
			}
		}
	}

	private void SetCurrentSentence(Sentence sentence)
	{
		previousSentence = CurrentSentence;
		CurrentSentence = sentence;
		if (CurrentSentence != null)
		{
			SortedNotes = new List<Note>(sentence.Notes);
			SortedNotes.Sort(Note.comparerByStartBeat);
		}
		else
		{
			SortedNotes = new List<Note>();
		}
		FillContainerWithSentenceText(currentSentenceContainer, CurrentSentence);
	}

	private void FillContainerWithSentenceText(VisualElement visualElement, Sentence sentence)
	{
		visualElement.Query<Label>().ToList().ForEach((Label label) =>
		{
			if (label != positionBeforeLyricsIndicator)
			{
				label.RemoveFromHierarchy();
			}
		});
		if (visualElement == currentSentenceContainer)
		{
			currentSentenceNoteToLabelMap.Clear();
		}
		if (sentence == null || sentence.Notes.IsNullOrEmpty())
		{
			visualElement.Add(new Label(" "));
			return;
		}
		List<Note> list = sentence.Notes.ToList();
		list.Sort(Note.comparerByStartBeat);
		list.ForEach((Note note) =>
		{
			Label label = new Label(IsItalicDisplayText(note.Type) ? ("<i>" + note.Text.Trim() + "</i>") : note.Text.Trim())
			{
				enableRichText = true
			};
			if (note.Text.StartsWith(" "))
			{
				label.style.marginLeft = 8f;
			}
			if (note.Text.EndsWith(" "))
			{
				label.style.marginRight = 8f;
			}
			label.AddToClassList("singingLyrics");
			if (visualElement == currentSentenceContainer)
			{
				label.AddToClassList("currentLyrics");
				currentSentenceNoteToLabelMap.Add(note, label);
			}
			else if (visualElement == nextSentenceContainer)
			{
				label.AddToClassList("nextLyrics");
			}
			visualElement.Add(label);
		});
	}

	private void SetNextSentence(Sentence sentence)
	{
		FillContainerWithSentenceText(nextSentenceContainer, sentence);
	}

	private static bool IsItalicDisplayText(ENoteType type)
	{
		if ((uint)(type - 2) <= 2u)
		{
			return true;
		}
		return false;
	}
}
