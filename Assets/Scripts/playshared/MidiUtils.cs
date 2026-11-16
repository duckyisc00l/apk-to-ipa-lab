using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public static class MidiUtils
{
	public const int SingableNoteMin = 36;

	public const int SingableNoteMax = 84;

	public const int SingableNoteRange = 49;

	public const int MaxMidiNote = 127;

	public const int MidiNoteConcertPitch = 69;

	public const int MidiNoteConcertPitchFrequency = 440;

	private static readonly int[] whiteKeyRelativeMidiNotes = new int[7] { 0, 2, 4, 5, 7, 9, 11 };

	private static readonly int[] blackKeyRelativeMidiNotes = new int[5] { 1, 3, 6, 8, 10 };

	private static Dictionary<int, string> midiNoteToAbsoluteName = CreateMidiNoteToAbsoluteNameMap();

	private static readonly Dictionary<string, int> absoluteNameToMidiNote = CreateAbsoluteNameToMidiNoteMap();

	private static Dictionary<int, string> CreateMidiNoteToAbsoluteNameMap()
	{
		Dictionary<int, string> dictionary = new Dictionary<int, string>();
		for (int i = 21; i <= 127; i++)
		{
			dictionary.Add(i, GetAbsoluteName(i));
		}
		return dictionary;
	}

	private static Dictionary<string, int> CreateAbsoluteNameToMidiNoteMap()
	{
		return CreateMidiNoteToAbsoluteNameMap().ToInvertedDictionary();
	}

	public static int GetOctave(int midiNote)
	{
		return midiNote / 12 - 1;
	}

	public static string GetAbsoluteName(int midiNote)
	{
		int octave = GetOctave(midiNote);
		return GetRelativeName(midiNote) + octave;
	}

	public static string GetRelativeName(int midiNote)
	{
		midiNote = GetRelativePitch(midiNote);
		return midiNote switch
		{
			0 => "C", 
			1 => "C#", 
			2 => "D", 
			3 => "D#", 
			4 => "E", 
			5 => "F", 
			6 => "F#", 
			7 => "G", 
			8 => "G#", 
			9 => "A", 
			10 => "A#", 
			11 => "B", 
			_ => midiNote.ToString(), 
		};
	}

	public static int GetRelativePitch(int midiNote)
	{
		return midiNote % 12;
	}

	public static int GetRoundedMidiNote(int midiNote, int midiCents, int resolution)
	{
		return (midiNote * 100 + midiCents) % resolution / 100;
	}

	public static int GetRelativePitchDistance(int fromMidiNote, int toMidiNote)
	{
		int relativePitch = GetRelativePitch(fromMidiNote);
		int num = Math.Abs(GetRelativePitch(toMidiNote) - relativePitch);
		int val = 12 - num;
		return Math.Min(num, val);
	}

	public static int GetRelativePitchDistanceSigned(int fromMidiNote, int toMidiNote)
	{
		int relativePitch = GetRelativePitch(toMidiNote);
		int relativePitch2 = GetRelativePitch(fromMidiNote);
		int num = relativePitch - relativePitch2;
		int num2 = ((num >= 0) ? (num - 12) : (num + 12));
		if (Math.Abs(num) >= Math.Abs(num2))
		{
			return num2;
		}
		return num;
	}

	public static bool IsBlackPianoKey(int midiNote)
	{
		return blackKeyRelativeMidiNotes.Contains(GetRelativePitch(midiNote));
	}

	public static bool IsWhitePianoKey(int midiNote)
	{
		return whiteKeyRelativeMidiNotes.Contains(GetRelativePitch(midiNote));
	}

	public static float[] PrecalculateHalftoneFrequencies(int noteMin, int noteRange)
	{
		float[] array = new float[noteRange];
		for (int i = 0; i < array.Length; i++)
		{
			float num = (float)(noteMin + i - 69) / 12f;
			array[i] = (float)(440.0 * Math.Pow(2.0, num));
		}
		return array;
	}

	public static int[] PrecalculateHalftoneDelays(int sampleRateHz, float[] halftoneFrequencies)
	{
		int[] array = new int[halftoneFrequencies.Length];
		for (int i = 0; i < halftoneFrequencies.Length; i++)
		{
			array[i] = Convert.ToInt32((float)sampleRateHz / halftoneFrequencies[i]);
		}
		return array;
	}

	public static int GetMidiNoteOnOctaveOfTargetMidiNote(int midiNote, int targetMidiNote)
	{
		int relativePitchDistanceSigned = GetRelativePitchDistanceSigned(targetMidiNote, midiNote);
		int num = targetMidiNote + relativePitchDistanceSigned;
		if (GetRelativePitch(midiNote) != GetRelativePitch(num))
		{
			Debug.LogError("The midiNote rounded to the targetMidiNote differs not only in the octave but also in pitch. This should never happen:" + $"midiNote {midiNote}, targetMidiNote: {targetMidiNote}, displayed: {num}");
		}
		return num;
	}

	public static bool TryParseMidiNoteName(string midiNoteName, out int midiNote)
	{
		if (absoluteNameToMidiNote.TryGetValue(midiNoteName.ToUpperInvariant(), out var value))
		{
			midiNote = value;
			return true;
		}
		midiNote = 0;
		return false;
	}

	public static int GetUltraStarTxtPitch(int midiNote)
	{
		return midiNote - 60;
	}

	public static int GetMidiNotePitch(int ultraStarTxtPitch)
	{
		return ultraStarTxtPitch + 60;
	}
}
