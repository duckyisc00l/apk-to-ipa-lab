using System.Collections.Generic;
using System.Linq;
using UniInject;

public class MoveNotesToOtherVoiceAction : INeedInjection
{
	private class SentenceWithRange
	{
		public Sentence Sentence { get; private set; }

		public int FromBeat { get; private set; }

		public int UntilBeat { get; private set; }

		public SentenceWithRange(Sentence sentence, int fromBeat, int untilBeat)
		{
			Sentence = sentence;
			FromBeat = fromBeat;
			UntilBeat = untilBeat;
		}

		public bool ContainsBeatRange(int fromBeat, int untilBeat)
		{
			if (FromBeat <= fromBeat)
			{
				return untilBeat <= UntilBeat;
			}
			return false;
		}
	}

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public bool CanMoveNotesToVoice(List<Note> selectedNotes, params string[] voiceNames)
	{
		return selectedNotes.AnyMatch((Note note) => !HasVoice(note, voiceNames));
	}

	public MovedNotesToVoiceEvent MoveNotesToVoice(SongMeta songMeta, List<Note> selectedNotes, string voiceName)
	{
		Voice targetVoice = SongMetaUtils.GetOrCreateVoice(songMeta, voiceName);
		List<Sentence> changedSentences = new List<Sentence>();
		List<Sentence> removedSentences = new List<Sentence>();
		List<Sentence> createdSentences = new List<Sentence>();
		List<SentenceWithRange> createdSentencesWithRange = new List<SentenceWithRange>();
		List<Sentence> sortedTargetSentences = targetVoice.Sentences.ToList();
		sortedTargetSentences.Sort(Sentence.comparerByStartBeat);
		selectedNotes.Sort(Note.comparerByStartBeat);
		selectedNotes.ForEach((Note note) =>
		{
			Sentence sentence = note.Sentence;
			Sentence sentence2 = SongMetaUtils.FindExistingSentenceForNote(sortedTargetSentences, note);
			if (sentence2 == null)
			{
				SentenceWithRange sentenceWithRange = createdSentencesWithRange.FirstOrDefault((SentenceWithRange sentenceWithRange2) => sentenceWithRange2.ContainsBeatRange(note.StartBeat, note.EndBeat));
				if (sentenceWithRange != null)
				{
					sentence2 = sentenceWithRange.Sentence;
				}
			}
			Sentence sentence3;
			if (sentence2 != null)
			{
				sentence3 = sentence2;
			}
			else
			{
				Sentence sentence4 = sortedTargetSentences.LastOrDefault((Sentence sentence7) => sentence7.MaxBeat < note.StartBeat);
				Sentence sentence5 = sortedTargetSentences.LastOrDefault((Sentence sentence7) => sentence7.MinBeat > note.EndBeat);
				int num = sentence4?.ExtendedMaxBeat ?? int.MinValue;
				int num2 = sentence5?.MinBeat ?? int.MaxValue;
				Sentence sentence6 = new Sentence(num, num2);
				sentence6.SetVoice(targetVoice);
				createdSentences.Add(sentence6);
				sortedTargetSentences.Add(sentence6);
				sortedTargetSentences.Sort(Sentence.comparerByStartBeat);
				createdSentencesWithRange.Add(new SentenceWithRange(sentence6, num, num2));
				sentence3 = sentence6;
			}
			sentence3.AddNote(note);
			if (note.Text.IsNullOrEmpty())
			{
				note.SetText(" ");
			}
			changedSentences.Add(sentence3);
			if (sentence != null)
			{
				if (sentence.Notes.Count == 0 && sentence.Voice != null)
				{
					removedSentences.Add(sentence);
					sentence.SetVoice(null);
				}
				else
				{
					changedSentences.Add(sentence);
				}
			}
		});
		changedSentences.Union(createdSentences).ForEach((Sentence sentence) =>
		{
			sentence.FitToNotes();
		});
		return new MovedNotesToVoiceEvent(selectedNotes, changedSentences, removedSentences);
	}

	public void MoveNotesToVoiceAndNotify(SongMeta songMeta, List<Note> selectedNotes, string voiceName)
	{
		MovedNotesToVoiceEvent value = MoveNotesToVoice(songMeta, selectedNotes, voiceName);
		songMetaChangeEventStream.OnNext(value);
	}

	private static bool HasVoice(Note note, string[] voiceNames)
	{
		if (voiceNames.IsNullOrEmpty() || note == null)
		{
			return false;
		}
		if (note.Sentence != null && note.Sentence.Voice != null)
		{
			return voiceNames.AnyMatch((string voiceName) => note.Sentence.Voice.VoiceNameEquals(voiceName));
		}
		return false;
	}
}
