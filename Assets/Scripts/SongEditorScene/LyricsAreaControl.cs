using System.Collections.Generic;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class LyricsAreaControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(UxmlName = "lyricsAreaTextField")]
	private TextField textField;

	[Inject(UxmlName = "lyricsArea")]
	private VisualElement lyricsArea;

	[Inject(UxmlName = "lyricsAreaVoice1Button")]
	private Button lyricsAreaVoice1Button;

	[Inject(UxmlName = "lyricsAreaVoice2Button")]
	private Button lyricsAreaVoice2Button;

	[Inject(UxmlName = "syncLyricsAreaToggle")]
	private Toggle syncLyricsAreaToggle;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private Injector injector;

	private Voice voice;

	private int lastCaretPosition;

	private LyricsAreaMode lyricsAreaMode;

	private string lastEditModeText;

	public Voice Voice
	{
		get
		{
			return voice;
		}
		set
		{
			voice = value;
			UpdateVoiceButtons();
			UpdateLyrics();
		}
	}

	public void OnInjectionFinished()
	{
		voice = songMeta.GetVoices()[0];
		UpdateLyrics();
		textField.RegisterCallback((FocusEvent evt) =>
		{
			OnBeginEdit();
		});
		textField.RegisterCallback((BlurEvent evt) =>
		{
			if (lyricsAreaMode == LyricsAreaMode.EditMode)
			{
				OnEndEdit(textField.text);
			}
		});
		songMetaChangeEventStream.Subscribe(OnSongMetaChanged);
		textField.doubleClickSelectsWord = true;
		textField.tripleClickSelectsLine = true;
		bool addedNewline = false;
		bool removeCharacter = false;
		textField.RegisterCallback((KeyDownEvent evt) =>
		{
			if (evt.keyCode == KeyCode.Return)
			{
				addedNewline = true;
			}
			else if (evt.keyCode == KeyCode.Delete || evt.keyCode == KeyCode.Backspace)
			{
				removeCharacter = true;
			}
		});
		textField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			if (lyricsAreaMode == LyricsAreaMode.EditMode)
			{
				string text = evt.newValue;
				if (addedNewline)
				{
					addedNewline = false;
					text = text.Replace(ShowWhiteSpaceText.newlineReplacement, "⌇").Replace("\n", "⌇").Replace("⌇", ShowWhiteSpaceText.newlineReplacement);
				}
				else if (removeCharacter)
				{
					removeCharacter = false;
					text = text.Replace(ShowWhiteSpaceText.newlineReplacement, "⌇").Replace("\n", "").Replace(ShowWhiteSpaceText.newlineVisibleWhiteSpaceCharacter, "")
						.Replace("⌇", ShowWhiteSpaceText.newlineReplacement);
				}
				string valueWithoutNotify = ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters(ShowWhiteSpaceText.ReplaceVisibleCharactersWithWhiteSpace(text));
				textField.SetValueWithoutNotify(valueWithoutNotify);
			}
		});
		lyricsAreaVoice1Button.RegisterCallbackButtonTriggered(() =>
		{
			Voice = songMeta.GetVoice(Voice.firstVoiceName);
		});
		lyricsAreaVoice2Button.RegisterCallbackButtonTriggered(() =>
		{
			Voice = songMeta.GetVoice(Voice.secondVoiceName);
		});
		UpdateVoiceButtons();
	}

	public void Update()
	{
		if (lyricsAreaMode == LyricsAreaMode.EditMode && lastEditModeText != textField.text)
		{
			if (lastEditModeText != null)
			{
				ApplyEditModeText(textField.text, undoable: false);
			}
			lastEditModeText = textField.text;
		}
		if (textField.focusController.focusedElement == textField && lastCaretPosition != textField.cursorIndex)
		{
			lastCaretPosition = textField.cursorIndex;
			if (syncLyricsAreaToggle.value)
			{
				SyncPositionInSongWithSelectedText();
			}
		}
	}

	private void OnSongMetaChanged(SongMetaChangeEvent changeEvent)
	{
		if (lyricsAreaMode == LyricsAreaMode.ViewMode && (changeEvent is LyricsChangedEvent || changeEvent is LoadedMementoEvent || changeEvent is MovedNotesToVoiceEvent || changeEvent is NotesSplitEvent || changeEvent is NotesDeletedEvent || changeEvent is SentencesDeletedEvent || changeEvent is NotesPastedEvent))
		{
			UpdateLyrics();
		}
		if (changeEvent is MovedNotesToVoiceEvent)
		{
			UpdateVoiceButtons();
		}
	}

	private void UpdateVoiceButtons()
	{
		if (voice == null || songMeta.GetVoices().Count <= 1)
		{
			lyricsAreaVoice1Button.HideByDisplay();
			lyricsAreaVoice2Button.HideByDisplay();
			return;
		}
		lyricsAreaVoice1Button.ShowByDisplay();
		lyricsAreaVoice2Button.ShowByDisplay();
		if (voice.Name == Voice.soloVoiceName || voice.Name == Voice.firstVoiceName)
		{
			lyricsAreaVoice1Button.AddToClassList("selected");
			lyricsAreaVoice2Button.RemoveFromClassList("selected");
		}
		else if (voice.Name == Voice.secondVoiceName)
		{
			lyricsAreaVoice1Button.RemoveFromClassList("selected");
			lyricsAreaVoice2Button.AddToClassList("selected");
		}
	}

	public void UpdateLyrics()
	{
		string inputFieldText = ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters((lyricsAreaMode == LyricsAreaMode.ViewMode) ? LyricsUtils.GetViewModeText(Voice) : LyricsUtils.GetEditModeText(Voice));
		SetInputFieldText(inputFieldText);
	}

	private void OnBeginEdit()
	{
		lastEditModeText = null;
		string inputFieldText = ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters(LyricsUtils.GetEditModeText(Voice));
		SetInputFieldText(inputFieldText);
		lyricsAreaMode = LyricsAreaMode.EditMode;
	}

	private void OnEndEdit(string newText)
	{
		ApplyEditModeText(newText, undoable: true);
		string inputFieldText = ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters(LyricsUtils.GetViewModeText(Voice));
		SetInputFieldText(inputFieldText);
		lyricsAreaMode = LyricsAreaMode.ViewMode;
	}

	private void ApplyEditModeText(string editModeText, bool undoable)
	{
		LyricsUtils.MapEditModeTextToNotes(ShowWhiteSpaceText.ReplaceVisibleCharactersWithWhiteSpace(editModeText), Voice.Sentences);
		songMetaChangeEventStream.OnNext(new LyricsChangedEvent
		{
			Undoable = undoable
		});
	}

	private void SetInputFieldText(string text)
	{
		textField.value = text;
	}

	private void SyncPositionInSongWithSelectedText()
	{
		Note noteForCaretPosition = GetNoteForCaretPosition(textField.text, textField.cursorIndex);
		if (noteForCaretPosition != null)
		{
			double positionInSongInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, noteForCaretPosition.StartBeat);
			songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
		}
	}

	private Note GetNoteForCaretPosition(string text, int caretPosition)
	{
		int num = 0;
		int num2 = 0;
		for (int i = 0; i < text.Length && i < caretPosition; i++)
		{
			if (text[i] == LyricsUtils.sentenceSeparator)
			{
				num++;
				num2 = i + 1;
			}
		}
		List<Sentence> sortedSentences = SongMetaUtils.GetSortedSentences(Voice);
		if (num >= sortedSentences.Count || sortedSentences[num].Notes.IsNullOrEmpty())
		{
			return null;
		}
		Sentence sentence = sortedSentences[num];
		int num3 = 0;
		for (int j = num2; j < text.Length && j < caretPosition; j++)
		{
			char c = text[j];
			if (c == LyricsUtils.spaceCharacter || c == ShowWhiteSpaceText.spaceReplacement[0] || c == LyricsUtils.syllableSeparator)
			{
				num3++;
			}
		}
		List<Note> sortedNotes = SongMetaUtils.GetSortedNotes(sentence);
		if (num3 >= sortedNotes.Count)
		{
			return null;
		}
		return sortedNotes[num3];
	}

	public bool InputFieldHasFocus()
	{
		return textField.focusController.focusedElement == textField;
	}
}
