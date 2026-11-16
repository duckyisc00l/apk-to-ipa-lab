using System.Collections.Generic;
using System.Linq;
using UniInject;

public class AddNoteAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	public void Execute(SongMeta songMeta, int beat, int midiNote)
	{
		List<Sentence> sentencesAtBeat = SongMetaUtils.GetSentencesAtBeat(songMeta, beat);
		if (sentencesAtBeat.Count == 0)
		{
			Note note = new Note(ENoteType.Normal, beat - 2, 4, 0, "~");
			note.SetMidiNote(midiNote);
			Sentence sentence = new Sentence(new List<Note> { note }, note.EndBeat);
			IReadOnlyCollection<Voice> voices = songMeta.GetVoices();
			sentence.SetVoice(voices.FirstOrDefault());
		}
		else
		{
			Note note2 = new Note(ENoteType.Normal, beat - 2, 4, 0, "~");
			note2.SetMidiNote(midiNote);
			note2.SetSentence(sentencesAtBeat[0]);
		}
	}

	public void ExecuteAndNotify(SongMeta songMeta, int beat, int midiNote)
	{
		Execute(songMeta, beat, midiNote);
		songMetaChangeEventStream.OnNext(new NotesAddedEvent());
	}
}
