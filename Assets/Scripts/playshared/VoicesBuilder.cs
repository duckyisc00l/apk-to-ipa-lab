using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

public class VoicesBuilder
{
	private readonly string path;

	private readonly Encoding encoding;

	private Voice currentVoice;

	private Sentence currentSentence;

	private bool endFound;

	private readonly Dictionary<string, Voice> voiceNameToVoiceMap = new Dictionary<string, Voice>();

	private readonly bool isRelativeSongFile;

	private int lastBeat;

	public VoicesBuilder(string path, Encoding encoding, bool isRelativeSongFile, bool useUniversalCharsetDetector)
	{
		this.path = path;
		this.encoding = encoding;
		this.isRelativeSongFile = isRelativeSongFile;
		currentVoice = new Voice(Voice.soloVoiceName);
		voiceNameToVoiceMap.Add(Voice.soloVoiceName, currentVoice);
		using StreamReader reader = TxtReader.GetFileStreamReader(path, encoding, useUniversalCharsetDetector);
		ParseStreamReader(reader);
	}

	public IReadOnlyList<Voice> GetVoices()
	{
		return new List<Voice>(voiceNameToVoiceMap.Values);
	}

	private void ParseStreamReader(StreamReader reader)
	{
		uint num = 0u;
		while (!endFound && !reader.EndOfStream)
		{
			num++;
			string line = reader.ReadLine();
			ParseLine(line, num);
		}
	}

	private void ParseLine(string line, uint lineNumber)
	{
		switch (line[0])
		{
		case 'E':
			endFound = true;
			break;
		case 'P':
			ParseVoiceStart(line, lineNumber);
			break;
		case '-':
			ParseSentenceEnd(line, lineNumber);
			break;
		case '*':
		case ':':
		case 'F':
		case 'G':
		case 'R':
			ParseNote(line, lineNumber);
			break;
		default:
			ThrowLineError(lineNumber, "Invalid instruction: " + line);
			break;
		case '#':
			break;
		}
	}

	private void ParseNote(string line, uint lineNumber)
	{
		if (currentVoice == null)
		{
			ThrowLineError(lineNumber, "Note encountered but no voice is active");
		}
		else if (currentSentence == null)
		{
			currentSentence = new Sentence();
			currentSentence.SetVoice(currentVoice);
		}
		try
		{
			Note note = CreateNote(line);
			currentSentence.AddNote(note);
		}
		catch (VoicesBuilderException ex)
		{
			ThrowLineError(lineNumber, ex.Message);
		}
	}

	private void ParseSentenceEnd(string line, uint lineNumber)
	{
		if (currentSentence == null)
		{
			LogLineWarning(lineNumber, "Linebreak encountered without preceding notes");
			return;
		}
		try
		{
			ParseSentenceStartBeatAndEndBeat(line, out var startBeat, out var _);
			currentSentence.SetLinebreakBeat(startBeat);
			currentSentence = null;
		}
		catch (VoicesBuilderException ex)
		{
			ThrowLineError(lineNumber, ex.Message);
		}
	}

	private void ParseSentenceStartBeatAndEndBeat(string line, out int startBeat, out int endBeat)
	{
		char[] separator = new char[1] { ' ' };
		string[] array = line.Trim().Split(separator, StringSplitOptions.RemoveEmptyEntries);
		startBeat = 0;
		endBeat = 0;
		if (array.Length == 3)
		{
			string s = array[1];
			startBeat = ConvertToBeat(s);
			string s2 = array[2];
			endBeat = ConvertToBeat(s2);
			lastBeat = endBeat;
			return;
		}
		if (array.Length == 2)
		{
			string s3 = array[1];
			startBeat = ConvertToBeat(s3);
			lastBeat = startBeat;
			return;
		}
		throw new VoicesBuilderException("Invalid instruction: " + line);
	}

	private void ParseVoiceStart(string voiceName, uint lineNumber)
	{
		if (voiceName.IsNullOrEmpty())
		{
			ThrowLineError(lineNumber, "Voice name is empty");
		}
		voiceNameToVoiceMap.Remove(Voice.soloVoiceName);
		if (!voiceNameToVoiceMap.TryGetValue(voiceName, out var value))
		{
			value = new Voice(voiceName);
			voiceNameToVoiceMap.Add(voiceName, value);
		}
		currentVoice = value;
		currentSentence = null;
	}

	private Note CreateNote(string line)
	{
		char[] separator = new char[1] { ' ' };
		string[] array = line.Split(separator, 5);
		if (array.Length < 5)
		{
			throw new VoicesBuilderException("Incomplete note");
		}
		ENoteType noteType = GetNoteType(array[0]);
		int startBeat = (lastBeat = ConvertToBeat(array[1]));
		int length = ConvertToInt32(array[2]);
		int txtPitch = ConvertToInt32(array[3]);
		string text = array[4];
		return new Note(noteType, startBeat, length, txtPitch, text);
	}

	private int ConvertToBeat(string s)
	{
		int num = ConvertToInt32(s);
		if (isRelativeSongFile)
		{
			num += lastBeat;
		}
		return num;
	}

	private static ENoteType GetNoteType(string s)
	{
		return s switch
		{
			":" => ENoteType.Normal, 
			"*" => ENoteType.Golden, 
			"F" => ENoteType.Freestyle, 
			"R" => ENoteType.Rap, 
			"G" => ENoteType.RapGolden, 
			_ => throw new VoicesBuilderException("Cannot convert '" + s + "' to a ENoteType"), 
		};
	}

	private void ThrowLineError(uint lineNumber, string message)
	{
		throw new VoicesBuilderException(message + " (path: '" + path + "', line: " + lineNumber + ", encoding: " + encoding?.ToString() + ")");
	}

	private void LogLineWarning(uint lineNumber, string message)
	{
		Debug.LogWarning(message + " (path: '" + path + "', line: " + lineNumber + ", encoding: " + encoding?.ToString() + ")");
	}

	private static int ConvertToInt32(string s)
	{
		try
		{
			return Convert.ToInt32(s.Trim(), 10);
		}
		catch (Exception ex)
		{
			throw new VoicesBuilderException("Could not convert '" + s + "' to an int. Reason: " + ex.Message, ex);
		}
	}
}
