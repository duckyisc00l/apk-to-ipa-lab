using System.Collections.Generic;
using System.Linq;
using UniInject;

public class MoveNoteToAjacentSentenceAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public bool CanMoveToNextSentence(List<Note> selectedNotes, Note targetNote)
	{
		if (selectedNotes.Count != 1)
		{
			return false;
		}
		Note note = selectedNotes[0];
		if (note != targetNote || note.Sentence == null)
		{
			return false;
		}
		List<Note> list = new List<Note>(note.Sentence.Notes);
		list.Sort(Note.comparerByStartBeat);
		if (list.Last() != note)
		{
			return false;
		}
		return SongMetaUtils.GetNextSentence(note.Sentence) != null;
	}

	public bool CanMoveToPreviousSentence(List<Note> selectedNotes, Note targetNote)
	{
		if (selectedNotes.Count != 1)
		{
			return false;
		}
		Note note = selectedNotes[0];
		if (note != targetNote || note.Sentence == null)
		{
			return false;
		}
		List<Note> list = new List<Note>(note.Sentence.Notes);
		list.Sort(Note.comparerByStartBeat);
		if (list.First() != note)
		{
			return false;
		}
		return SongMetaUtils.GetPreviousSentence(note.Sentence) != null;
	}

	public void MoveToPreviousSentence(Note targetNote)
	{
		Sentence sentence = targetNote.Sentence;
		Sentence previousSentence = SongMetaUtils.GetPreviousSentence(targetNote.Sentence);
		targetNote.SetSentence(previousSentence);
		if (sentence.Notes.Count == 0)
		{
			sentence.SetVoice(null);
		}
		else
		{
			sentence.FitToNotes();
		}
	}

	public void MoveToPreviousSentenceAndNotify(Note targetNote)
	{
		MoveToPreviousSentence(targetNote);
		songMetaChangeEventStream.OnNext(new SentencesChangedEvent());
	}

	public void MoveToNextSentence(Note targetNote)
	{
		Sentence sentence = targetNote.Sentence;
		Sentence nextSentence = SongMetaUtils.GetNextSentence(targetNote.Sentence);
		targetNote.SetSentence(nextSentence);
		if (sentence.Notes.Count == 0)
		{
			sentence.SetVoice(null);
		}
		else
		{
			sentence.FitToNotes();
		}
	}

	public void MoveToNextSentenceAndNotify(Note targetNote)
	{
		MoveToNextSentence(targetNote);
		songMetaChangeEventStream.OnNext(new SentencesChangedEvent());
	}
}
