using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

[Serializable]
public class Sentence : ISerializationCallbackReceiver
{
	private class SentenceComparerByStartBeat : IComparer<Sentence>
	{
		public int Compare(Sentence x, Sentence y)
		{
			if (x == null && y == null)
			{
				return 0;
			}
			if (x == null)
			{
				return -1;
			}
			if (y == null)
			{
				return 1;
			}
			return x.MinBeat.CompareTo(y.MinBeat);
		}
	}

	public static readonly IComparer<Sentence> comparerByStartBeat = new SentenceComparerByStartBeat();

	[NonSerialized]
	private Voice voice;

	private readonly HashSet<Note> notes = new HashSet<Note>();

	public Voice Voice => voice;

	public int LinebreakBeat { get; private set; }

	public IReadOnlyCollection<Note> Notes => notes;

	public int MinBeat { get; private set; }

	public int MaxBeat { get; private set; }

	public int ExtendedMaxBeat { get; private set; }

	public Sentence()
	{
	}

	public Sentence(int minBeat, int maxBeat)
	{
		MinBeat = minBeat;
		MaxBeat = maxBeat;
		LinebreakBeat = maxBeat;
		ExtendedMaxBeat = maxBeat;
	}

	public Sentence(List<Note> notes, int linebreakBeat = 0)
	{
		LinebreakBeat = linebreakBeat;
		ExtendedMaxBeat = linebreakBeat;
		SetNotes(notes);
	}

	public void SetVoice(Voice voice)
	{
		if (this.voice != voice)
		{
			if (this.voice != null)
			{
				this.voice.RemoveSentence(this);
			}
			this.voice = voice;
			if (this.voice != null)
			{
				this.voice.AddSentence(this);
			}
		}
	}

	public void UpdateMinAndMaxBeat(bool keepLinebreakBeatOverhang = true)
	{
		UpdateMinBeat();
		UpdateMaxBeat(keepLinebreakBeatOverhang);
	}

	public void SetNotes(List<Note> newNotes)
	{
		if (newNotes == null)
		{
			throw new ArgumentNullException("Notes cannot be null!");
		}
		foreach (Note item in new List<Note>(notes))
		{
			RemoveNote(item);
		}
		foreach (Note newNote in newNotes)
		{
			notes.Add(newNote);
			newNote.SetSentence(this);
		}
		UpdateMinAndMaxBeat(keepLinebreakBeatOverhang: false);
	}

	public void AddNote(Note note, bool keepLineBreakBeatOverhang = true)
	{
		if (note == null)
		{
			throw new ArgumentNullException("Note cannot be null");
		}
		if (!notes.Contains(note))
		{
			notes.Add(note);
			note.SetSentence(this);
			UpdateMinAndMaxBeat(keepLineBreakBeatOverhang);
		}
	}

	public void RemoveNote(Note note)
	{
		if (note == null)
		{
			throw new UnityException("Note cannot be null");
		}
		if (notes.Contains(note))
		{
			notes.Remove(note);
			note.SetSentence(null);
			if (MinBeat == note.StartBeat)
			{
				UpdateMinBeat();
			}
			if (MaxBeat == note.EndBeat)
			{
				UpdateMaxBeat();
			}
		}
	}

	public void FitToNotes()
	{
		UpdateMinAndMaxBeat();
		SetLinebreakBeat(MaxBeat);
	}

	public void SetLinebreakBeat(int newBeat)
	{
		LinebreakBeat = Math.Max(MaxBeat, newBeat);
		ExtendedMaxBeat = Math.Max(MaxBeat, LinebreakBeat);
	}

	public bool ContainsBeatRange(int fromBeat, int untilBeat)
	{
		if (MinBeat <= fromBeat)
		{
			return untilBeat <= ExtendedMaxBeat;
		}
		return false;
	}

	public void UpdateMinBeat()
	{
		if (notes.Count > 0)
		{
			MinBeat = notes.Select((Note it) => it.StartBeat).Min();
		}
	}

	public void UpdateMaxBeat(bool keepLinebreakBeatOverhang = true)
	{
		if (notes.Count > 0)
		{
			int maxBeat = MaxBeat;
			int num = LinebreakBeat - maxBeat;
			MaxBeat = notes.Select((Note it) => it.EndBeat).Max();
			if (keepLinebreakBeatOverhang && maxBeat != MaxBeat && LinebreakBeat < int.MaxValue - num)
			{
				LinebreakBeat = MaxBeat + num;
				ExtendedMaxBeat = LinebreakBeat;
			}
			if (LinebreakBeat < MaxBeat)
			{
				LinebreakBeat = MaxBeat;
				ExtendedMaxBeat = MaxBeat;
			}
		}
	}

	public void OnBeforeSerialize()
	{
	}

	public void OnAfterDeserialize()
	{
		foreach (Note note in notes)
		{
			note.SetSentence(this);
		}
	}

	public Sentence CloneDeep()
	{
		List<Note> list = new List<Note>();
		foreach (Note note in notes)
		{
			Note item = note.Clone();
			list.Add(item);
		}
		return new Sentence(list, LinebreakBeat);
	}
}
