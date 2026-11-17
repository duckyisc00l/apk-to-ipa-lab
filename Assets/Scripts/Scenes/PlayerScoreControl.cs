using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;

public class PlayerScoreControl : MonoBehaviour, INeedInjection, IInjectionFinishedListener
{
	public class SentenceScoreEvent
	{
		public SentenceScore SentenceScore { get; private set; }

		public SentenceRating SentenceRating { get; private set; }

		public SentenceScoreEvent(SentenceScore sentenceScore, SentenceRating sentenceRating)
		{
			SentenceScore = sentenceScore;
			SentenceRating = sentenceRating;
		}
	}

	public class NoteScoreEvent
	{
		public NoteScore NoteScore { get; private set; }

		public NoteScoreEvent(NoteScore noteScore)
		{
			NoteScore = noteScore;
		}
	}

	public static readonly int maxScore = 10000;

	public static readonly int maxPerfectSentenceBonusScore = 1000;

	public static readonly int maxScoreForNotes = maxScore - maxPerfectSentenceBonusScore;

	[Inject]
	private PlayerMicPitchTracker playerMicPitchTracker;

	[Inject]
	private Voice voice;

	private readonly Subject<SentenceScoreEvent> sentenceScoreEventStream = new Subject<SentenceScoreEvent>();

	private readonly Subject<NoteScoreEvent> noteScoreEventStream = new Subject<NoteScoreEvent>();

	private double maxScoreForNormalNotes;

	private double maxScoreForGoldenNotes;

	public int TotalScore
	{
		get
		{
			int num = NormalNotesTotalScore + GoldenNotesTotalScore + PerfectSentenceBonusTotalScore;
			if (num > maxScore)
			{
				Debug.LogWarning($"Total score is {num}, returning max score of {maxScore} instead. " + $"(NormalNotesTotalScore: {NormalNotesTotalScore}, GoldenNotesTotalScore: {GoldenNotesTotalScore}, PerfectSentenceBonusTotalScore: {PerfectSentenceBonusTotalScore})");
				return maxScore;
			}
			return num;
		}
	}

	public int NormalNotesTotalScore
	{
		get
		{
			if (ScoreData.NormalBeatData.PerfectAndGoodBeats <= 0 || ScoreData.NormalNoteLengthTotal <= 0)
			{
				return 0;
			}
			return (int)(maxScoreForNormalNotes * (double)ScoreData.NormalBeatData.PerfectAndGoodBeats / (double)ScoreData.NormalNoteLengthTotal);
		}
	}

	public int GoldenNotesTotalScore
	{
		get
		{
			if (ScoreData.GoldenBeatData.PerfectAndGoodBeats <= 0 || ScoreData.GoldenNoteLengthTotal <= 0)
			{
				return 0;
			}
			return (int)(maxScoreForGoldenNotes * (double)ScoreData.GoldenBeatData.PerfectAndGoodBeats / (double)ScoreData.GoldenNoteLengthTotal);
		}
	}

	public int PerfectSentenceBonusTotalScore
	{
		get
		{
			int num = ((ScoreData.TotalSentenceCount > 20) ? 20 : ScoreData.TotalSentenceCount);
			if (num <= 0)
			{
				return 0;
			}
			double a = (double)maxPerfectSentenceBonusScore * (double)ScoreData.PerfectSentenceCount / (double)num;
			a = Math.Ceiling(a);
			if (a > (double)maxPerfectSentenceBonusScore)
			{
				a = maxPerfectSentenceBonusScore;
			}
			return (int)a;
		}
	}

	public int NextBeatToScore { get; set; }

	public IObservable<SentenceScoreEvent> SentenceScoreEventStream => sentenceScoreEventStream;

	public IObservable<NoteScoreEvent> NoteScoreEventStream => noteScoreEventStream;

	public PlayerScoreControlData ScoreData { get; set; } = new PlayerScoreControlData();

	public void OnInjectionFinished()
	{
		UpdateMaxScores(voice.Sentences);
		playerMicPitchTracker.BeatAnalyzedEventStream.Subscribe(OnBeatAnalyzed);
		playerMicPitchTracker.NoteAnalyzedEventStream.Subscribe(OnNoteAnalyzed);
		playerMicPitchTracker.SentenceAnalyzedEventStream.Subscribe(OnSentenceAnalyzed);
	}

	private void OnBeatAnalyzed(BeatAnalyzedEvent beatAnalyzedEvent)
	{
		if (beatAnalyzedEvent.PitchEvent == null || beatAnalyzedEvent.NoteAtBeat == null || beatAnalyzedEvent.Beat < NextBeatToScore)
		{
			return;
		}
		Note noteAtBeat = beatAnalyzedEvent.NoteAtBeat;
		if (MidiUtils.GetRelativePitch(beatAnalyzedEvent.RoundedRecordedMidiNote) != MidiUtils.GetRelativePitch(noteAtBeat.MidiNote))
		{
			return;
		}
		if (!ScoreData.NoteToNoteScoreMap.TryGetValue(noteAtBeat, out var value))
		{
			value = new NoteScore(noteAtBeat);
			ScoreData.NoteToNoteScoreMap.Add(noteAtBeat, value);
		}
		value.CorrectlySungBeats++;
		Sentence sentence = beatAnalyzedEvent.NoteAtBeat.Sentence;
		if (!ScoreData.SentenceToSentenceScoreMap.TryGetValue(sentence, out var value2))
		{
			value2 = CreateSentenceScore(sentence);
			ScoreData.SentenceToSentenceScoreMap.Add(sentence, value2);
		}
		if (IsPerfectHit(beatAnalyzedEvent))
		{
			ScoreData.GetBeatData(noteAtBeat).IfNotNull((PlayerScoreControllerBeatData it) =>
			{
				it.PerfectBeats++;
			});
			value2.GetBeatData(noteAtBeat).IfNotNull((PlayerScoreControllerBeatData it) =>
			{
				it.PerfectBeats++;
			});
		}
		else if (IsGoodHit(beatAnalyzedEvent))
		{
			ScoreData.GetBeatData(noteAtBeat).IfNotNull((PlayerScoreControllerBeatData it) =>
			{
				it.GoodBeats++;
			});
			value2.GetBeatData(noteAtBeat).IfNotNull((PlayerScoreControllerBeatData it) =>
			{
				it.GoodBeats++;
			});
		}
	}

	private bool IsPerfectHit(BeatAnalyzedEvent beatAnalyzedEvent)
	{
		return MidiUtils.GetRelativePitch(beatAnalyzedEvent.NoteAtBeat.MidiNote) == MidiUtils.GetRelativePitch(beatAnalyzedEvent.RecordedMidiNote);
	}

	private bool IsGoodHit(BeatAnalyzedEvent beatAnalyzedEvent)
	{
		return beatAnalyzedEvent.NoteAtBeat.MidiNote == beatAnalyzedEvent.RoundedRecordedMidiNote;
	}

	private void OnNoteAnalyzed(NoteAnalyzedEvent noteAnalyzedEvent)
	{
		if (noteAnalyzedEvent.Note.EndBeat >= NextBeatToScore)
		{
			Note note = noteAnalyzedEvent.Note;
			if (ScoreData.NoteToNoteScoreMap.TryGetValue(note, out var value) && value.CorrectlySungBeats >= note.Length)
			{
				noteScoreEventStream.OnNext(new NoteScoreEvent(value));
			}
		}
	}

	private void OnSentenceAnalyzed(SentenceAnalyzedEvent sentenceAnalyzedEvent)
	{
		if (sentenceAnalyzedEvent.Sentence.MaxBeat < NextBeatToScore)
		{
			return;
		}
		Sentence sentence = sentenceAnalyzedEvent.Sentence;
		int num = (from note in sentence.Notes
			where note.IsNormal || note.IsGolden
			select note.Length).Sum();
		if (num <= 0)
		{
			return;
		}
		SentenceRating sentenceRating;
		if (ScoreData.SentenceToSentenceScoreMap.TryGetValue(sentence, out var value))
		{
			double num2 = (double)(value.NormalBeatData.PerfectAndGoodBeats + value.GoldenBeatData.PerfectAndGoodBeats) / (double)num;
			if (num2 >= SentenceRating.perfect.PercentageThreshold)
			{
				ScoreData.PerfectSentenceCount++;
			}
			sentenceRating = SentenceRating.GetSentenceRating(num2);
		}
		else
		{
			value = CreateSentenceScore(sentence);
			sentenceRating = SentenceRating.GetSentenceRating(0.0);
		}
		value.TotalScoreSoFar = TotalScore;
		ScoreData.TotalScore = TotalScore;
		ScoreData.NormalNotesTotalScore = NormalNotesTotalScore;
		ScoreData.GoldenNotesTotalScore = GoldenNotesTotalScore;
		ScoreData.PerfectSentenceBonusTotalScore = PerfectSentenceBonusTotalScore;
		sentenceScoreEventStream.OnNext(new SentenceScoreEvent(value, sentenceRating));
	}

	private void UpdateMaxScores(IReadOnlyCollection<Sentence> sentences)
	{
		if (sentences.IsNullOrEmpty())
		{
			ScoreData = new PlayerScoreControlData();
			return;
		}
		ScoreData.NormalNoteLengthTotal = 0;
		ScoreData.GoldenNoteLengthTotal = 0;
		foreach (Sentence sentence in sentences)
		{
			ScoreData.NormalNoteLengthTotal += GetNormalNoteLength(sentence);
			ScoreData.GoldenNoteLengthTotal += GetGoldenNoteLength(sentence);
		}
		double num = (double)maxScoreForNotes / ((double)ScoreData.NormalNoteLengthTotal + (double)(2 * ScoreData.GoldenNoteLengthTotal));
		double num2 = 2.0 * num;
		maxScoreForNormalNotes = num * (double)ScoreData.NormalNoteLengthTotal;
		maxScoreForGoldenNotes = num2 * (double)ScoreData.GoldenNoteLengthTotal;
		double num3 = maxScoreForNormalNotes + maxScoreForGoldenNotes;
		if (!(Math.Abs((double)maxScoreForNotes - num3) <= 0.01))
		{
			Debug.LogWarning("The definition of scores for normal or golden notes is not sound: " + $"maxScoreForNormalNotes: {maxScoreForNormalNotes}, maxScoreForGoldenNotes: {maxScoreForGoldenNotes}, sum: {maxScoreForNormalNotes + maxScoreForGoldenNotes}");
		}
		maxScoreForNormalNotes = Math.Ceiling(maxScoreForNormalNotes);
		maxScoreForGoldenNotes = Math.Ceiling(maxScoreForGoldenNotes);
		int num4 = (int)(maxScoreForNormalNotes + maxScoreForGoldenNotes) - maxScoreForNotes;
		maxScoreForNormalNotes -= num4;
		ScoreData.TotalSentenceCount = sentences.Count;
	}

	private int GetNormalNoteLength(Sentence sentence)
	{
		return (from note in sentence.Notes
			where note.IsNormal
			select note.Length).Sum();
	}

	private int GetGoldenNoteLength(Sentence sentence)
	{
		return (from note in sentence.Notes
			where note.IsGolden
			select note.Length).Sum();
	}

	private SentenceScore CreateSentenceScore(Sentence sentence)
	{
		return new SentenceScore(sentence)
		{
			TotalScoreSoFar = TotalScore
		};
	}
}
