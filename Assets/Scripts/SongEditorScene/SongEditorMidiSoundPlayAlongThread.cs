using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using UniInject;

public class SongEditorMidiSoundPlayAlongThread : INeedInjection
{
	public class SongEditorMidiSoundPlayAlongException : Exception
	{
		public SongEditorMidiSoundPlayAlongException(string message)
			: base(message)
		{
		}
	}

	[Inject]
	private Settings settings;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private MidiManager midiManager;

	[Inject]
	private SongEditorLayerManager layerManager;

	private ThreadPool.PoolHandle poolHandle;

	private bool isStopped;

	private List<Note> upcomingSortedNotes = new List<Note>();

	private DateTime playbackStartDateTime = DateTime.Now;

	private int lastPlayedMidiNote = -1;

	public void Start(int positionInSongInMillis)
	{
		if (poolHandle != null)
		{
			throw new SongEditorMidiSoundPlayAlongException("Attempt to start midi-play-along-thread again");
		}
		if (isStopped)
		{
			throw new SongEditorMidiSoundPlayAlongException("Attempt to restart midi-play-along-thread. Create a new instance instead.");
		}
		SynchronizeWithPlaybackPosition(positionInSongInMillis);
		CalculateUpcomingSortedNotes(positionInSongInMillis);
		poolHandle = ThreadPool.QueueUserWorkItem((ThreadPool.PoolHandle handle) =>
		{
			Run();
		});
	}

	public void Stop()
	{
		isStopped = true;
	}

	private void Run()
	{
		while (!isStopped && !upcomingSortedNotes.IsNullOrEmpty())
		{
			UpdateMidiNotePlayback();
		}
	}

	public void CalculateUpcomingSortedNotes(int positionInSongInMillis)
	{
		upcomingSortedNotes = GetUpcomingSortedNotes(positionInSongInMillis);
	}

	private void UpdateMidiNotePlayback()
	{
		Note note = upcomingSortedNotes[0];
		float num = 1f / settings.SongEditorSettings.MusicPlaybackSpeed;
		int num2 = (int)BpmUtils.BeatToMillisecondsInSong(songMeta, note.StartBeat);
		DateTime dateTime = playbackStartDateTime.AddMilliseconds((float)num2 * num);
		DateTime dateTime2 = DateTime.Now - new TimeSpan(0, 0, 0, 0, settings.SongEditorSettings.MidiPlaybackOffsetInMillis);
		if (dateTime < dateTime2)
		{
			int num3 = (int)BpmUtils.BeatToMillisecondsInSong(songMeta, note.EndBeat);
			DateTime dateTime3 = playbackStartDateTime.AddMilliseconds((float)num3 * num);
			if (dateTime2 < dateTime3)
			{
				PlayMidiNote(note);
				Thread.Sleep(dateTime3 - dateTime2);
				StopMidiNote(note);
			}
			else
			{
				midiManager.StopAllMidiNotes();
			}
			upcomingSortedNotes.RemoveAt(0);
		}
		else
		{
			Thread.Sleep(dateTime - dateTime2);
		}
	}

	private TimeSpan ScaleTimeSpan(TimeSpan timeSpan, float factor)
	{
		int days = (int)((float)timeSpan.Days * factor);
		int hours = (int)((float)timeSpan.Hours * factor);
		int minutes = (int)((float)timeSpan.Minutes * factor);
		int seconds = (int)((float)timeSpan.Seconds * factor);
		int milliseconds = (int)((float)timeSpan.Milliseconds * factor);
		return new TimeSpan(days, hours, minutes, seconds, milliseconds);
	}

	private void PlayMidiNote(Note awaitedNote)
	{
		if (lastPlayedMidiNote >= 0)
		{
			midiManager.StopMidiNote(lastPlayedMidiNote);
		}
		midiManager.PlayMidiNote(awaitedNote.MidiNote);
		lastPlayedMidiNote = awaitedNote.MidiNote;
	}

	private void StopMidiNote(Note awaitedNote)
	{
		midiManager.StopMidiNote(awaitedNote.MidiNote);
	}

	public void SynchronizeWithPlaybackPosition(int positionInSongInMillis)
	{
		float num = 1f / settings.SongEditorSettings.MusicPlaybackSpeed;
		playbackStartDateTime = DateTime.Now.Subtract(new TimeSpan(0, 0, 0, 0, (int)((float)positionInSongInMillis * num)));
	}

	private List<Note> GetUpcomingSortedNotes(double positionInSongInMillis)
	{
		List<Note> list = (from note in (from voice in songMeta.GetVoices()
				where layerManager.IsVoiceLayerVisible(voice.Name)
				select voice).SelectMany((Voice voice) => voice.Sentences).SelectMany((Sentence sentence) => sentence.Notes).ToList()
				.Union(layerManager.GetAllVisibleEnumLayerNotes())
				.ToList()
			where !note.IsFreestyle && !note.IsRap
			where BpmUtils.BeatToMillisecondsInSong(songMeta, note.EndBeat) > positionInSongInMillis
			select note).ToList();
		list.Sort(Note.comparerByStartBeat);
		return list;
	}
}
