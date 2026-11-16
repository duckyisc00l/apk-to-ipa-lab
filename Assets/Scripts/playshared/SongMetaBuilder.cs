using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using UnityEngine;

public static class SongMetaBuilder
{
	public static SongMeta ParseFile(string path, out List<SongIssue> songIssues, Encoding enc, bool useUniversalCharsetDetector)
	{
		using StreamReader streamReader = TxtReader.GetFileStreamReader(path, enc, useUniversalCharsetDetector);
		songIssues = new List<SongIssue>();
		string fullName = new FileInfo(path).Directory.FullName;
		string name = new FileInfo(path).Name;
		Dictionary<string, string> dictionary = new Dictionary<string, string>
		{
			{ "artist", null },
			{ "bpm", null },
			{ "mp3", null },
			{ "title", null }
		};
		Dictionary<string, string> dictionary2 = new Dictionary<string, string>();
		Dictionary<string, string> dictionary3 = new Dictionary<string, string>();
		uint num = 0u;
		while (!streamReader.EndOfStream)
		{
			num++;
			string text = streamReader.ReadLine();
			if (!text.StartsWith("#", StringComparison.Ordinal))
			{
				if (num != 1)
				{
					break;
				}
				throw new SongMetaBuilderException("Does not look like a song file; ignoring");
			}
			char[] separator = new char[1] { ':' };
			string[] array = text.Substring(1).Split(separator, 2);
			if (array.Length < 2)
			{
				songIssues.Add(SongIssue.CreateWarning(null, "Invalid formatting on line " + text));
				continue;
			}
			string text2 = array[0].TrimEnd();
			string text3 = text2.ToLowerInvariant();
			if (text3.Length < 1)
			{
				songIssues.Add(SongIssue.CreateWarning(null, "Missing tag name on line " + text));
				continue;
			}
			string text4 = array[1].TrimStart();
			if (text3.Equals("encoding", StringComparison.Ordinal))
			{
				if (text4.Equals("UTF8", StringComparison.Ordinal))
				{
					text4 = "UTF-8";
				}
				Encoding encoding = Encoding.GetEncoding(text4);
				if (!encoding.Equals(streamReader.CurrentEncoding))
				{
					streamReader.Dispose();
					return ParseFile(path, out songIssues, encoding, useUniversalCharsetDetector);
				}
			}
			else if (dictionary.ContainsKey(text3))
			{
				dictionary[text3] = text4;
			}
			else if (text3.Equals("previewstart"))
			{
				dictionary3[text3] = text4;
			}
			else if (text3.StartsWith("previewend"))
			{
				dictionary3[text3] = text4;
			}
			else if (text3.StartsWith("p", StringComparison.Ordinal) && text3.Length == 2 && char.IsDigit(text3, 1))
			{
				if (!dictionary2.ContainsKey(text3.ToUpperInvariant()))
				{
					dictionary2.Add(text3.ToUpperInvariant(), text4);
				}
			}
			else if (text3.StartsWith("duetsingerp", StringComparison.Ordinal) && text3.Length == 12 && char.IsDigit(text3, 11))
			{
				string key = text3.Substring(10).ToUpperInvariant();
				if (!dictionary2.ContainsKey(key))
				{
					dictionary2.Add(key, text4);
				}
			}
			else if (dictionary3.ContainsKey(text3))
			{
				songIssues.Add(SongIssue.CreateWarning(null, "Cannot set '" + text2 + "' multiple times"));
			}
			else
			{
				dictionary3[text3] = text4;
			}
		}
		foreach (KeyValuePair<string, string> item in dictionary)
		{
			if (item.Value == null)
			{
				throw new SongMetaBuilderException("Required tag '" + item.Key + "' was not set");
			}
		}
		StringBuilder stringBuilder = new StringBuilder();
		string value;
		while ((value = streamReader.ReadLine()) != null)
		{
			stringBuilder.Append(value);
		}
		string songHash = Hashing.Md5(Encoding.UTF8.GetBytes(stringBuilder.ToString()));
		try
		{
			SongMeta songMeta = new SongMeta(fullName, name, songHash, dictionary["artist"], ConvertToFloat(dictionary["bpm"]), dictionary["mp3"], dictionary["title"], dictionary2, streamReader.CurrentEncoding);
			foreach (KeyValuePair<string, string> item2 in dictionary3)
			{
				switch (item2.Key)
				{
				case "background":
					songMeta.Background = item2.Value;
					break;
				case "cover":
					songMeta.Cover = item2.Value;
					break;
				case "edition":
					songMeta.Edition = item2.Value;
					break;
				case "end":
					songMeta.End = ConvertToFloat(item2.Value);
					break;
				case "gap":
					songMeta.Gap = ConvertToFloat(item2.Value);
					break;
				case "genre":
					songMeta.Genre = item2.Value;
					break;
				case "language":
					songMeta.Language = item2.Value;
					break;
				case "previewstart":
					songMeta.PreviewStart = ConvertToFloat(item2.Value);
					break;
				case "previewend":
					songMeta.PreviewEnd = ConvertToFloat(item2.Value);
					break;
				case "start":
					songMeta.Start = ConvertToFloat(item2.Value);
					break;
				case "video":
					songMeta.Video = item2.Value;
					break;
				case "videogap":
					songMeta.VideoGap = ConvertToFloat(item2.Value);
					break;
				case "year":
					songMeta.Year = ConvertToUInt32(item2.Value);
					break;
				default:
					songMeta.SetUnknownHeaderEntry(item2.Key, item2.Value);
					break;
				}
			}
			songIssues = songIssues.Select((SongIssue songIssue) => new SongIssue(songIssue.Severity, songMeta, songIssue.Message, songIssue.StartBeat, songIssue.EndBeat)).ToList();
			songIssues.ForEach((SongIssue songIssue) =>
			{
				Debug.LogWarning(songIssue.Message + " in file " + path);
			});
			return songMeta;
		}
		catch (ArgumentNullException ex)
		{
			throw new SongMetaBuilderException("Required tag '" + ex.ParamName + "' was not set");
		}
	}

	private static float ConvertToFloat(string s)
	{
		if (float.TryParse(s.Replace(",", "."), NumberStyles.Any, CultureInfo.InvariantCulture, out var result))
		{
			return result;
		}
		throw new SongMetaBuilderException("Could not convert " + s + " to a float.");
	}

	private static uint ConvertToUInt32(string s)
	{
		if (s.IsNullOrEmpty())
		{
			return 0u;
		}
		try
		{
			return Convert.ToUInt32(s, 10);
		}
		catch (FormatException ex)
		{
			throw new SongMetaBuilderException("Could not convert " + s + " to an uint. Reason: " + ex.Message);
		}
	}
}
