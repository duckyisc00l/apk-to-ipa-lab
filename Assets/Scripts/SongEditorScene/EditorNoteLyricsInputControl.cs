using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using UniInject;

public class EditorNoteLyricsInputControl : EditorLyricsInputPopupControl
{
	[Inject]
	private EditorNoteControl editorNoteControl;

	[Inject]
	private SongEditorLayerManager layerManager;

	protected override string GetInitialText()
	{
		return ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters(editorNoteControl.Note.Text);
	}

	protected override void PreviewNewText(string newText)
	{
		string text = ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters(newText);
		editorNoteControl.Note.SetText(text);
		editorNoteControl.SetLyrics(text);
		songMetaChangeEventStream.OnNext(new LyricsChangedEvent
		{
			Undoable = false
		});
	}

	protected override void ApplyNewText(string newText)
	{
		ApplyEditModeText(newText, undoable: true);
	}

	private void ApplyEditModeText(string newText, bool undoable)
	{
		string input = ShowWhiteSpaceText.ReplaceVisibleCharactersWithWhiteSpace(newText);
		if (!LyricsUtils.IsOnlyWhitespace(newText))
		{
			input = Regex.Replace(input, "\\s+", " ");
			input = Regex.Replace(input, ";+", ";");
			if (SplitNoteForNewText(editorNoteControl.Note, input).Count > 1)
			{
				songMetaChangeEventStream.OnNext(new NotesSplitEvent
				{
					Undoable = undoable
				});
				return;
			}
			input = input.Replace(";", "");
			editorNoteControl.Note.SetText(input);
			editorNoteControl.SyncWithNote();
			songMetaChangeEventStream.OnNext(new LyricsChangedEvent
			{
				Undoable = undoable
			});
		}
	}

	public List<Note> SplitNoteForNewText(Note note, string newText)
	{
		List<Note> list = new List<Note> { note };
		if (note.Length <= 1 || LyricsUtils.IsOnlyWhitespace(newText))
		{
			return list;
		}
		List<int> list2 = AllIndexesOfCharacterBeforeTextEnd(newText, ' ').ToList().Union(AllIndexesOfCharacterBeforeTextEnd(newText, ';').ToList()).Distinct()
			.ToList();
		list2.Sort();
		if (list2.IsNullOrEmpty())
		{
			return list;
		}
		list2 = list2.Select((int index) => index + 1).ToList();
		if (!list2.Contains(newText.Length))
		{
			list2.Add(newText.Length);
		}
		List<int> list3 = list2.Select((int index) => (int)Math.Floor((double)note.StartBeat + (double)note.Length * ((double)index / (double)newText.Length))).ToList();
		note.SetEndBeat(list3[0]);
		note.SetText(newText.Substring(0, list2[0]));
		int num = list2[0];
		int num2 = note.EndBeat;
		for (int num3 = 1; num3 < list2.Count; num3++)
		{
			int num4 = list2[num3];
			int num5 = list3[num3];
			int num6 = num2;
			int num7 = num5;
			int length = num4 - num;
			Note note2 = new Note(text: newText.Substring(num, length), type: note.Type, startBeat: num6, length: num7 - num6, txtPitch: note.TxtPitch);
			list.Add(note2);
			note2.SetSentence(note.Sentence);
			if (layerManager.TryGetEnumLayer(note, out var enumLayer))
			{
				layerManager.AddNoteToEnumLayer(enumLayer.LayerEnum, note2);
			}
			num = num4;
			num2 = num5;
		}
		list.ForEach((Note currentNote) =>
		{
			currentNote.SetText(currentNote.Text.Replace(";", ""));
		});
		return list;
	}

	private static List<int> AllIndexesOfCharacterBeforeTextEnd(string text, char searchChar)
	{
		List<int> list = new List<int>();
		for (int i = 0; i < text.Length - 1; i++)
		{
			if (text[i] == searchChar)
			{
				list.Add(i);
			}
		}
		return list;
	}
}
