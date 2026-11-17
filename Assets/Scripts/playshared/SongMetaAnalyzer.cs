using System.Collections.Generic;
using System.Linq;

public static class SongMetaAnalyzer
{
	public static IReadOnlyCollection<SongIssue> AnalyzeIssues(SongMeta songMeta, int maxSongIssueCountPerMessage)
	{
		Dictionary<string, List<SongIssue>> dictionary = new Dictionary<string, List<SongIssue>>();
		foreach (Voice voice in songMeta.GetVoices())
		{
			AnalyzeSentencesInVoice(songMeta, voice, dictionary, maxSongIssueCountPerMessage);
		}
		return dictionary.Values.SelectMany((List<SongIssue> songIssues) => songIssues).ToList();
	}

	private static void AnalyzeSentencesInVoice(SongMeta songMeta, Voice voice, Dictionary<string, List<SongIssue>> messageToIssues, int maxSongIssueCountPerMessage)
	{
		List<Sentence> sortedSentences = SongMetaUtils.GetSortedSentences(voice);
		Sentence sentence = null;
		foreach (Sentence item in sortedSentences)
		{
			if (sentence != null && item.MinBeat < sentence.ExtendedMaxBeat)
			{
				SongIssue songIssue = SongIssue.CreateError(songMeta, "Sentences overlap", item.MinBeat, sentence.ExtendedMaxBeat);
				AddSongIssue(messageToIssues, songIssue, maxSongIssueCountPerMessage);
			}
			sentence = item;
			AnalyzeNotesInSentence(songMeta, item, messageToIssues, maxSongIssueCountPerMessage);
		}
	}

	private static void AnalyzeNotesInSentence(SongMeta songMeta, Sentence sentence, Dictionary<string, List<SongIssue>> messageToIssues, int maxSongIssueCountPerMessage)
	{
		List<Note> sortedNotes = SongMetaUtils.GetSortedNotes(sentence);
		Note note = null;
		foreach (Note item in sortedNotes)
		{
			if (note != null && item.StartBeat < note.EndBeat)
			{
				SongIssue songIssue = SongIssue.CreateError(songMeta, "Notes overlap", item.StartBeat, note.EndBeat);
				AddSongIssue(messageToIssues, songIssue, maxSongIssueCountPerMessage);
			}
			if (item.MidiNote < 36 || item.MidiNote > 84)
			{
				SongIssue songIssue2 = SongIssue.CreateWarning(songMeta, "Unusual pitch (human range is roughly from C2 to C6).", item.StartBeat, item.EndBeat);
				AddSongIssue(messageToIssues, songIssue2, maxSongIssueCountPerMessage);
			}
			if (item.Text.IsNullOrEmpty())
			{
				SongIssue songIssue3 = SongIssue.CreateWarning(songMeta, "Missing lyrics on note", item.StartBeat, item.EndBeat);
				AddSongIssue(messageToIssues, songIssue3, maxSongIssueCountPerMessage);
			}
			note = item;
		}
	}

	private static void AddSongIssue(Dictionary<string, List<SongIssue>> messageToIssues, SongIssue songIssue, int maxSongIssueCountPerMessage)
	{
		string message = songIssue.Message;
		int songIssueCount = GetSongIssueCount(messageToIssues, message);
		if (songIssueCount < maxSongIssueCountPerMessage)
		{
			if (songIssueCount <= 0)
			{
				messageToIssues[message] = new List<SongIssue>();
			}
			messageToIssues[message].Add(songIssue);
		}
	}

	private static int GetSongIssueCount(Dictionary<string, List<SongIssue>> messageToIssues, string message)
	{
		if (messageToIssues.TryGetValue(message, out var value))
		{
			return value.Count;
		}
		return 0;
	}
}
