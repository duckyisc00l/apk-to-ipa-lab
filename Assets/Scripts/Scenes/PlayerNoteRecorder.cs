using System;
using UniInject;
using UniRx;
using UnityEngine;

[RequireComponent(typeof(PlayerMicPitchTracker))]
public class PlayerNoteRecorder : MonoBehaviour, INeedInjection, IInjectionFinishedListener
{
	public class RecordedNoteStartedEvent
	{
		public RecordedNote RecordedNote { get; private set; }

		public RecordedNoteStartedEvent(RecordedNote recordedNote)
		{
			RecordedNote = recordedNote;
		}
	}

	public class RecordedNoteContinuedEvent
	{
		public RecordedNote RecordedNote { get; private set; }

		public RecordedNoteContinuedEvent(RecordedNote recordedNote)
		{
			RecordedNote = recordedNote;
		}
	}

	private RecordedNote lastRecordedNote;

	private BeatAnalyzedEvent lastBeatAnalyzedEvent;

	private readonly Subject<RecordedNoteStartedEvent> recordedNoteStartedEventStream = new Subject<RecordedNoteStartedEvent>();

	private readonly Subject<RecordedNoteContinuedEvent> recordedNoteContinuedEventStream = new Subject<RecordedNoteContinuedEvent>();

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	public PlayerMicPitchTracker PlayerMicPitchTracker { get; private set; }

	public IObservable<RecordedNoteStartedEvent> RecordedNoteStartedEventStream => recordedNoteStartedEventStream;

	public IObservable<RecordedNoteContinuedEvent> RecordedNoteContinuedEventStream => recordedNoteContinuedEventStream;

	public void OnInjectionFinished()
	{
		PlayerMicPitchTracker.BeatAnalyzedEventStream.Subscribe(OnBeatAnalyzed);
	}

	private void OnBeatAnalyzed(BeatAnalyzedEvent beatAnalyzedEvent)
	{
		Note noteAtBeat = beatAnalyzedEvent.NoteAtBeat;
		if (lastRecordedNote != null && lastBeatAnalyzedEvent != null && lastBeatAnalyzedEvent.NoteAtBeat == noteAtBeat && lastBeatAnalyzedEvent.RoundedRecordedMidiNote == beatAnalyzedEvent.RoundedRecordedMidiNote)
		{
			int targetNoteEndBeat = noteAtBeat?.EndBeat ?? (-1);
			ContinueLastRecordedNote(beatAnalyzedEvent.Beat, targetNoteEndBeat);
		}
		else if (beatAnalyzedEvent.PitchEvent != null)
		{
			StartNewRecordedNote(beatAnalyzedEvent.Beat, beatAnalyzedEvent.NoteAtBeat, beatAnalyzedEvent.SentenceAtBeat, beatAnalyzedEvent.PitchEvent.MidiNote, beatAnalyzedEvent.RoundedRecordedMidiNote);
		}
		else
		{
			lastRecordedNote = null;
		}
		lastBeatAnalyzedEvent = beatAnalyzedEvent;
	}

	private void ContinueLastRecordedNote(int analyzedBeat, int targetNoteEndBeat)
	{
		lastRecordedNote.EndBeat = analyzedBeat + 1;
		if (targetNoteEndBeat >= 0 && lastRecordedNote.EndBeat > targetNoteEndBeat)
		{
			lastRecordedNote.EndBeat = targetNoteEndBeat;
		}
		recordedNoteContinuedEventStream.OnNext(new RecordedNoteContinuedEvent(lastRecordedNote));
	}

	private void StartNewRecordedNote(int analyzedBeat, Note noteAtBeat, Sentence sentenceAtBeat, int recordedMidiNote, int roundedMidiNote)
	{
		RecordedNote recordedNote = new RecordedNote(recordedMidiNote, roundedMidiNote, analyzedBeat, analyzedBeat + 1, noteAtBeat, sentenceAtBeat);
		recordedNoteStartedEventStream.OnNext(new RecordedNoteStartedEvent(recordedNote));
		lastRecordedNote = recordedNote;
	}
}
