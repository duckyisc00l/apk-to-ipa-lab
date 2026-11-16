using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;

public static class UltraStarSongFileWriter
{
	public static void WriteFile(string absolutePath, SongMeta songMeta)
	{
		string txtFileContent = GetTxtFileContent(songMeta);
		File.WriteAllText(absolutePath, txtFileContent, Encoding.UTF8);
	}

	private static string GetTxtFileContent(SongMeta songMeta)
	{
		StringBuilder stringBuilder = new StringBuilder();
		AppendHeader(stringBuilder, songMeta);
		List<Voice> list = (from voice in songMeta.GetVoices()
			where IsNotEmpty(voice)
			select voice).ToList();
		if (list.Count == 0)
		{
			throw new UltraStarSongFileWriterException("The song does not contain any notes");
		}
		list.Sort(Voice.comparerByName);
		foreach (Voice item in list)
		{
			string text = item.Name;
			if (list.Count == 1)
			{
				text = Voice.soloVoiceName;
			}
			else if (text == Voice.soloVoiceName)
			{
				text = Voice.firstVoiceName;
			}
			AppendVoice(stringBuilder, item, text);
		}
		stringBuilder.Append("E");
		return stringBuilder.ToString();
	}

	private static void AppendVoice(StringBuilder sb, Voice voice, string voiceName)
	{
		if (!voiceName.IsNullOrEmpty())
		{
			sb.AppendLine(voiceName);
		}
		List<Sentence> list = new List<Sentence>(voice.Sentences);
		list.Sort(Sentence.comparerByStartBeat);
		foreach (Sentence item in list)
		{
			AppendSentence(sb, item);
		}
	}

	private static void AppendSentence(StringBuilder sb, Sentence sentence)
	{
		if (sentence.Notes.Count == 0)
		{
			return;
		}
		List<Note> list = new List<Note>(sentence.Notes);
		list.Sort(Note.comparerByStartBeat);
		foreach (Note item in list)
		{
			AppendNote(sb, item);
		}
		sb.AppendLine($"- {sentence.ExtendedMaxBeat}");
	}

	private static bool IsNotEmpty(Voice voice)
	{
		return voice.Sentences.SelectMany((Sentence sentence) => sentence.Notes).Any();
	}

	private static void AppendNote(StringBuilder sb, Note note)
	{
		if (note.Length != 0)
		{
			sb.AppendLine($"{GetNoteTypePrefix(note.Type)} {note.StartBeat} {note.Length} {note.TxtPitch} {note.Text}");
		}
	}

	private static string GetNoteTypePrefix(ENoteType noteType)
	{
		return noteType switch
		{
			ENoteType.Normal => ":", 
			ENoteType.Golden => "*", 
			ENoteType.Freestyle => "F", 
			ENoteType.Rap => "R", 
			ENoteType.RapGolden => "G", 
			_ => throw new UltraStarSongFileWriterException("Unkown note type '" + noteType.ToString() + "'."), 
		};
	}

	private static void AppendHeader(StringBuilder sb, SongMeta songMeta)
	{
		AppendHeaderField(sb, "encoding", "UTF8");
		AppendHeaderField(sb, "title", songMeta.Title);
		AppendHeaderField(sb, "artist", songMeta.Artist);
		AppendHeaderField(sb, "mp3", songMeta.Mp3);
		AppendHeaderField(sb, "bpm", songMeta.Bpm.ToString(CultureInfo.InvariantCulture));
		if (songMeta.Gap != 0f)
		{
			AppendHeaderField(sb, "gap", songMeta.Gap.ToString(CultureInfo.InvariantCulture));
		}
		AppendHeaderField(sb, "cover", songMeta.Cover);
		AppendHeaderField(sb, "background", songMeta.Background);
		AppendHeaderField(sb, "video", songMeta.Video);
		if (songMeta.VideoGap != 0f)
		{
			AppendHeaderField(sb, "videogap", songMeta.VideoGap.ToString(CultureInfo.InvariantCulture));
		}
		AppendHeaderField(sb, "genre", songMeta.Genre);
		if (songMeta.Year != 0)
		{
			AppendHeaderField(sb, "year", songMeta.Year.ToString());
		}
		AppendHeaderField(sb, "language", songMeta.Language);
		AppendHeaderField(sb, "edition", songMeta.Edition);
		if (songMeta.Start != 0f)
		{
			AppendHeaderField(sb, "start", songMeta.Start.ToString(CultureInfo.InvariantCulture));
		}
		if (songMeta.End != 0f)
		{
			AppendHeaderField(sb, "end", songMeta.End.ToString(CultureInfo.InvariantCulture));
		}
		if (songMeta.PreviewStart != 0f)
		{
			AppendHeaderField(sb, "previewstart", songMeta.PreviewStart.ToString(CultureInfo.InvariantCulture));
		}
		if (songMeta.PreviewEnd != 0f)
		{
			AppendHeaderField(sb, "previewend", songMeta.PreviewEnd.ToString(CultureInfo.InvariantCulture));
		}
		songMeta.UnknownHeaderEntries.ForEach((KeyValuePair<string, string> entry) =>
		{
			AppendHeaderField(sb, entry.Key, entry.Value);
		});
	}

	private static void AppendHeaderField(StringBuilder sb, string key, string value)
	{
		if (!value.IsNullOrEmpty())
		{
			sb.AppendLine("#" + key.ToUpper(CultureInfo.InvariantCulture) + ":" + value);
		}
	}
}
