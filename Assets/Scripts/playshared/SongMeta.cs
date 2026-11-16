using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using UnityEngine;

[Serializable]
public class SongMeta
{
	private Dictionary<string, string> voiceNames;

	private List<Voice> voices = new List<Voice>();

	private readonly Dictionary<string, string> unknownHeaderEntries = new Dictionary<string, string>();

	public string Directory { get; set; } = "";

	public string Filename { get; set; } = "";

	public string SongHash { get; private set; } = "";

	public string Artist { get; set; } = "";

	public float Bpm { get; set; }

	public string Mp3 { get; set; } = "";

	public string Title { get; set; } = "";

	public Dictionary<string, string> VoiceNames
	{
		get
		{
			if (voiceNames.IsNullOrEmpty())
			{
				voiceNames = new Dictionary<string, string>();
				foreach (Voice voice in GetVoices())
				{
					voiceNames.Add(voice.Name, voice.Name);
				}
			}
			return voiceNames;
		}
	}

	public Encoding Encoding { get; private set; }

	public string Background { get; set; } = "";

	public string Cover { get; set; } = "";

	public string Edition { get; set; } = "";

	public float Gap { get; set; }

	public string Genre { get; set; } = "";

	public string Language { get; set; } = "";

	public bool Relative { get; set; }

	public float PreviewStart { get; set; }

	public float PreviewEnd { get; set; }

	public string Video { get; set; } = "";

	public float VideoGap { get; set; }

	public uint Year { get; set; }

	public float Start { get; set; }

	public float End { get; set; }

	public bool FailedToLoadVoices { get; private set; }

	public IReadOnlyDictionary<string, string> UnknownHeaderEntries => unknownHeaderEntries;

	public SongMeta()
	{
	}

	public SongMeta(string directory, string filename, string songHash, string artist, float bpm, string mp3, string title, Dictionary<string, string> voiceNames, Encoding encoding)
	{
		Directory = directory ?? throw new ArgumentNullException("directory");
		Filename = filename ?? throw new ArgumentNullException("filename");
		SongHash = songHash ?? throw new ArgumentNullException("songHash");
		Artist = artist ?? throw new ArgumentNullException("artist");
		Bpm = bpm;
		Mp3 = mp3 ?? throw new ArgumentNullException("mp3");
		Title = title ?? throw new ArgumentNullException("title");
		this.voiceNames = voiceNames ?? throw new ArgumentNullException("voiceNames");
		Encoding = encoding ?? throw new ArgumentNullException("encoding");
		Gap = 0f;
		Relative = false;
		Start = 0f;
	}

	public Voice GetVoice(string voiceName)
	{
		return GetVoices().FirstOrDefault((Voice voice) => voice.VoiceNameEquals(voiceName));
	}

	public IReadOnlyList<Voice> GetVoices()
	{
		if (voices.IsNullOrEmpty() && !FailedToLoadVoices)
		{
			FailedToLoadVoices = true;
			string directory = Directory;
			char directorySeparatorChar = Path.DirectorySeparatorChar;
			string text = directory + directorySeparatorChar + Filename;
			using (new DisposableStopwatch("Loading voices of " + text + " took <millis> ms"))
			{
				VoicesBuilder voicesBuilder = new VoicesBuilder(text, Encoding, Relative, useUniversalCharsetDetector: false);
				voices = new List<Voice>(voicesBuilder.GetVoices());
			}
			FailedToLoadVoices = false;
		}
		return voices;
	}

	public void AddVoice(Voice newVoice)
	{
		if (!voices.Contains(newVoice))
		{
			voices.Add(newVoice);
			voiceNames.Add(newVoice.Name, newVoice.Name);
		}
	}

	public void RemoveVoice(Voice voice)
	{
		if (voices.Contains(voice))
		{
			voices.Remove(voice);
			voiceNames.Remove(voice.Name);
		}
	}

	public void SetUnknownHeaderEntry(string key, string value)
	{
		unknownHeaderEntries[key] = value;
	}

	public void Reload()
	{
		string absoluteSongMetaPath = SongMetaUtils.GetAbsoluteSongMetaPath(this);
		try
		{
			SongMeta songMeta = SongMetaBuilder.ParseFile(absoluteSongMetaPath, out var _, Encoding, useUniversalCharsetDetector: false);
			Encoding = songMeta.Encoding;
			SongHash = songMeta.SongHash;
			voiceNames = songMeta.voiceNames;
			voices = new List<Voice>();
			Artist = songMeta.Artist;
			Title = songMeta.Title;
			Bpm = songMeta.Bpm;
			Mp3 = songMeta.Mp3;
			Background = songMeta.Background;
			Cover = songMeta.Cover;
			Edition = songMeta.Edition;
			End = songMeta.End;
			Gap = songMeta.Gap;
			Genre = songMeta.Genre;
			Language = songMeta.Language;
			Relative = songMeta.Relative;
			Start = songMeta.Start;
			PreviewStart = songMeta.PreviewStart;
			PreviewEnd = songMeta.PreviewEnd;
			Video = songMeta.Video;
			VideoGap = songMeta.VideoGap;
			Year = songMeta.Year;
		}
		catch (Exception ex)
		{
			Debug.LogError("Failed to reload song " + absoluteSongMetaPath + ": " + ex.Message);
			Debug.LogException(ex);
		}
	}
}
