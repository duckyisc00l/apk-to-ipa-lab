using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

public static class SongMetaUtils
{
	public static bool CoverResourceExists(SongMeta songMeta)
	{
		return ResourceExists(songMeta, songMeta.Cover);
	}

	public static bool BackgroundResourceExists(SongMeta songMeta)
	{
		return ResourceExists(songMeta, songMeta.Background);
	}

	public static bool VideoResourceExists(SongMeta songMeta)
	{
		return ResourceExists(songMeta, songMeta.Video);
	}

	public static bool AudioResourceExists(SongMeta songMeta)
	{
		return ResourceExists(songMeta, songMeta.Mp3);
	}

	public static string GetCoverUri(SongMeta songMeta)
	{
		return GetUri(songMeta, songMeta.Cover);
	}

	public static string GetBackgroundUri(SongMeta songMeta)
	{
		return GetUri(songMeta, songMeta.Background);
	}

	public static string GetVideoUri(SongMeta songMeta)
	{
		return GetUri(songMeta, songMeta.Video);
	}

	public static string GetAudioUri(SongMeta songMeta)
	{
		return GetUri(songMeta, songMeta.Mp3);
	}

	private static bool ResourceExists(SongMeta songMeta, string pathOrUri)
	{
		if (WebRequestUtils.IsHttpOrHttpsUri(pathOrUri))
		{
			return true;
		}
		return File.Exists(GetAbsoluteFilePath(songMeta, pathOrUri));
	}

	private static string GetUri(SongMeta songMeta, string pathOrUri)
	{
		if (pathOrUri.IsNullOrEmpty())
		{
			return "";
		}
		if (WebRequestUtils.IsHttpOrHttpsUri(pathOrUri))
		{
			return pathOrUri;
		}
		return WebRequestUtils.AbsoluteFilePathToUri(GetAbsoluteFilePath(songMeta, pathOrUri));
	}

	private static string GetAbsoluteFilePath(SongMeta songMeta, string path)
	{
		if (PathUtils.IsAbsolutePath(path))
		{
			return path;
		}
		string directory = songMeta.Directory;
		char directorySeparatorChar = Path.DirectorySeparatorChar;
		return directory + directorySeparatorChar + path;
	}

	public static string GetAbsoluteSongMetaPath(SongMeta songMeta)
	{
		if (songMeta == null)
		{
			return "";
		}
		string directory = songMeta.Directory;
		char directorySeparatorChar = Path.DirectorySeparatorChar;
		return directory + directorySeparatorChar + songMeta.Filename;
	}

	public static List<Sentence> GetSentencesAtBeat(SongMeta songMeta, int beat)
	{
		return (from sentence in songMeta.GetVoices().SelectMany((Voice voice) => voice.Sentences)
			where IsBeatInSentence(sentence, beat)
			select sentence).ToList();
	}

	public static Sentence GetSentenceAtBeat(Voice voice, int beat)
	{
		return voice?.Sentences.FirstOrDefault((Sentence sentence) => sentence.MinBeat <= beat && beat <= sentence.MaxBeat);
	}

	public static Note GetNoteAtBeat(Sentence sentence, int beat, bool inclusiveStartBeat = true, bool inclusiveEndBeat = true)
	{
		return sentence?.Notes.FirstOrDefault((Note note) => (note.StartBeat < beat || (inclusiveStartBeat && note.StartBeat == beat)) && (beat < note.EndBeat || (inclusiveEndBeat && note.EndBeat == beat)));
	}

	public static bool IsBeatInSentence(Sentence sentence, int beat)
	{
		if (sentence.MinBeat <= beat)
		{
			return beat <= sentence.ExtendedMaxBeat;
		}
		return false;
	}

	public static Sentence FindExistingSentenceForNote(IEnumerable<Sentence> sentences, Note note)
	{
		return sentences.FirstOrDefault((Sentence sentence) => sentence.ContainsBeatRange(note.StartBeat, note.EndBeat));
	}

	public static Voice GetOrCreateVoice(SongMeta songMeta, string voiceName)
	{
		Voice voice = songMeta.GetVoices().FirstOrDefault((Voice voice3) => voice3.VoiceNameEquals(voiceName));
		if (voice != null)
		{
			return voice;
		}
		songMeta.GetVoices().FirstOrDefault((Voice it) => it.Name == Voice.soloVoiceName)?.SetName(Voice.firstVoiceName);
		Voice voice2 = new Voice(voiceName);
		songMeta.AddVoice(voice2);
		return voice2;
	}

	public static List<Note> GetFollowingNotes(SongMeta songMeta, List<Note> notes)
	{
		if (notes.IsNullOrEmpty())
		{
			return new List<Note>();
		}
		int maxBeat = notes.Select((Note it) => it.EndBeat).Max();
		return (from note in GetAllSentences(songMeta).SelectMany((Sentence sentence) => sentence.Notes)
			where note.StartBeat >= maxBeat
			select note).ToList();
	}

	public static List<Note> GetAllNotes(SongMeta songMeta)
	{
		return GetAllSentences(songMeta).SelectMany((Sentence sentence) => sentence.Notes).ToList();
	}

	public static List<Note> GetAllNotes(Voice voice)
	{
		if (voice == null)
		{
			return new List<Note>();
		}
		return voice.Sentences.SelectMany((Sentence sentence) => sentence.Notes).ToList();
	}

	public static List<Sentence> GetAllSentences(SongMeta songMeta)
	{
		List<Sentence> list = new List<Sentence>();
		List<Sentence> collection = songMeta.GetVoices().SelectMany((Voice voice) => voice.Sentences).ToList();
		list.AddRange(collection);
		return list;
	}

	public static Sentence GetNextSentence(Sentence sentence)
	{
		if (sentence.Voice == null)
		{
			return null;
		}
		List<Sentence> list = new List<Sentence>(sentence.Voice.Sentences);
		list.Sort(Sentence.comparerByStartBeat);
		Sentence sentence2 = null;
		foreach (Sentence item in list)
		{
			if (sentence2 == sentence)
			{
				return item;
			}
			sentence2 = item;
		}
		return null;
	}

	public static Sentence GetPreviousSentence(Sentence sentence)
	{
		if (sentence.Voice == null)
		{
			return null;
		}
		List<Sentence> list = new List<Sentence>(sentence.Voice.Sentences);
		list.Sort(Sentence.comparerByStartBeat);
		Sentence result = null;
		foreach (Sentence item in list)
		{
			if (item == sentence)
			{
				return result;
			}
			result = item;
		}
		return null;
	}

	public static List<Note> GetSortedNotes(Sentence sentence)
	{
		List<Note> list = new List<Note>(sentence.Notes);
		list.Sort(Note.comparerByStartBeat);
		return list;
	}

	public static List<Note> GetSortedNotes(SongMeta songMeta)
	{
		List<Note> allNotes = GetAllNotes(songMeta);
		allNotes.Sort(Note.comparerByStartBeat);
		return allNotes;
	}

	public static List<Sentence> GetSortedSentences(SongMeta songMeta)
	{
		List<Sentence> allSentences = GetAllSentences(songMeta);
		allSentences.Sort(Sentence.comparerByStartBeat);
		return allSentences;
	}

	public static List<Sentence> GetSortedSentences(Voice voice)
	{
		List<Sentence> list = new List<Sentence>(voice.Sentences);
		list.Sort(Sentence.comparerByStartBeat);
		return list;
	}

	public static void OpenDirectory(SongMeta songMeta)
	{
		if (songMeta != null && Directory.Exists(songMeta.Directory))
		{
			ApplicationUtils.OpenDirectory(songMeta.Directory);
		}
	}

	public static string GetLyrics(SongMeta songMeta, string voiceName)
	{
		Voice voice = songMeta.GetVoices().FirstOrDefault((Voice voice2) => voice2.VoiceNameEquals(voiceName));
		if (voice == null)
		{
			return "";
		}
		return GetLyrics(songMeta, voice);
	}

	public static string GetLyrics(SongMeta songMeta, Voice voice)
	{
		StringBuilder sb = new StringBuilder();
		voice.Sentences.ForEach((Sentence sentence) =>
		{
			sentence.Notes.ForEach((Note note) =>
			{
				sb.Append(note.Text);
			});
			sb.Append("\n");
		});
		return sb.ToString();
	}

	public static List<SongIssue> GetSupportedMediaFormatIssues(SongMeta songMeta)
	{
		List<SongIssue> list = new List<SongIssue>();
		if (!songMeta.Video.IsNullOrEmpty())
		{
			if (!ApplicationUtils.IsSupportedVideoFormat(Path.GetExtension(songMeta.Video)))
			{
				list.Add(SongIssue.CreateWarning(songMeta, "Unsupported video format " + Path.GetExtension(songMeta.Video)));
				songMeta.Video = "";
			}
			else if (!VideoResourceExists(songMeta))
			{
				list.Add(SongIssue.CreateWarning(songMeta, "Video file resource does not exist '" + ApplicationUtils.ReplacePathsWithDisplayString(GetVideoUri(songMeta)) + "'"));
				songMeta.Video = "";
			}
		}
		if (!ApplicationUtils.IsSupportedAudioFormat(Path.GetExtension(songMeta.Mp3)))
		{
			list.Add(SongIssue.CreateError(songMeta, "Unsupported audio format " + Path.GetExtension(songMeta.Mp3)));
		}
		else if (!AudioResourceExists(songMeta))
		{
			list.Add(SongIssue.CreateError(songMeta, "Audio file resource does not exist '" + ApplicationUtils.ReplacePathsWithDisplayString(GetAudioUri(songMeta)) + "'"));
		}
		list.ForEach((SongIssue songIssue) =>
		{
			songIssue.Log();
		});
		return list;
	}

	public static string GetArtistDashTitle(SongMeta songMeta)
	{
		return songMeta?.Artist + " - " + songMeta?.Title;
	}
}
