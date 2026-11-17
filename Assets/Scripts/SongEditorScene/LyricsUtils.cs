using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

public static class LyricsUtils
{
	public static readonly char syllableSeparator = ';';

	public static readonly char sentenceSeparator = '\n';

	public static readonly char spaceCharacter = ' ';

	private static readonly Regex whitespaceRegex = new Regex("^\\s+$", RegexOptions.IgnoreCase | RegexOptions.Compiled);

	public static bool IsOnlyWhitespace(string newText)
	{
		if (!string.IsNullOrEmpty(newText))
		{
			return whitespaceRegex.IsMatch(newText);
		}
		return true;
	}

	public static string GetViewModeText(Voice voice)
	{
		StringBuilder stringBuilder = new StringBuilder();
		foreach (Sentence sortedSentence in SongMetaUtils.GetSortedSentences(voice))
		{
			foreach (Note sortedNote in SongMetaUtils.GetSortedNotes(sortedSentence))
			{
				stringBuilder.Append(sortedNote.Text);
			}
			stringBuilder.Append(sentenceSeparator);
		}
		return stringBuilder.ToString();
	}

	public static string GetEditModeText(Voice voice)
	{
		IEnumerable<string> enumerable = from sentence in SongMetaUtils.GetSortedSentences(voice)
			select GetEditModeText(sentence);
		char c = sentenceSeparator;
		return enumerable.JoinWith(c.ToString());
	}

	public static string GetEditModeText(Sentence sentence)
	{
		StringBuilder stringBuilder = new StringBuilder();
		Note lastNote = null;
		List<Note> list = sentence.Notes.ToList();
		list.Sort(Note.comparerByStartBeat);
		list.ForEach(ProcessNote);
		return stringBuilder.ToString();
		void ProcessNote(Note note)
		{
			if (lastNote != null && lastNote.Sentence == note.Sentence)
			{
				if (lastNote.Text.EndsWith(spaceCharacter) || note.Text.StartsWith(spaceCharacter))
				{
					stringBuilder.Append(spaceCharacter);
				}
				else
				{
					stringBuilder.Append(syllableSeparator);
				}
			}
			stringBuilder.Append(note.Text.Trim());
			lastNote = note;
		}
	}

	public static void MapEditModeTextToNotes(string editModeText, IEnumerable<Sentence> sentences)
	{
		int sentenceIndex = 0;
		int noteIndex = 0;
		List<Sentence> sortedSentences = sentences.ToList();
		sortedSentences.Sort(Sentence.comparerByStartBeat);
		List<Note> sortedNotes = ((sentenceIndex < sortedSentences.Count) ? SongMetaUtils.GetSortedNotes(sortedSentences[sentenceIndex]) : new List<Note>());
		StringBuilder stringBuilder = new StringBuilder();
		foreach (char c in editModeText)
		{
			if (c == sentenceSeparator)
			{
				SelectNextSentence();
			}
			else if (c == syllableSeparator)
			{
				SelectNextNote();
			}
			else if (c == ' ')
			{
				stringBuilder.Append(c);
				SelectNextNote();
			}
			else
			{
				stringBuilder.Append(c);
			}
		}
		if (stringBuilder.Length > 0)
		{
			SelectNextNote();
		}
		for (int j = sentenceIndex; j < sortedSentences.Count; j++)
		{
			sortedNotes = SongMetaUtils.GetSortedNotes(sortedSentences[j]);
			for (int k = noteIndex; k < sortedNotes.Count; k++)
			{
				sortedNotes[k].SetText("");
			}
		}
		void ApplyNoteText()
		{
			if (noteIndex < sortedNotes.Count)
			{
				sortedNotes[noteIndex].SetText(stringBuilder.ToString());
			}
			stringBuilder = new StringBuilder();
		}
		void SelectNextNote()
		{
			ApplyNoteText();
			noteIndex++;
		}
		void SelectNextSentence()
		{
			ApplyNoteText();
			for (int l = noteIndex + 1; l < sortedNotes.Count; l++)
			{
				sortedNotes[l].SetText("");
			}
			sentenceIndex++;
			noteIndex = 0;
			sortedNotes = ((sentenceIndex < sortedSentences.Count) ? SongMetaUtils.GetSortedNotes(sortedSentences[sentenceIndex]) : new List<Note>());
		}
	}
}
