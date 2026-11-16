using UniInject;
using UnityEngine;

public class SongEditorMidiSoundPlayAlong : MonoBehaviour, INeedInjection
{
	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private MidiManager midiManager;

	[Inject]
	private Settings settings;

	[Inject]
	private Injector injector;

	private SongEditorMidiSoundPlayAlongThread thread;

	private double positionInSongInMillisOld;

	private void Update()
	{
		if (!settings.SongEditorSettings.MidiSoundPlayAlongEnabled)
		{
			if (thread != null)
			{
				StopThread();
			}
			return;
		}
		if (songAudioPlayer.IsPlaying && thread == null)
		{
			StartThread();
		}
		else if (!songAudioPlayer.IsPlaying && thread != null)
		{
			StopThread();
		}
		if (thread != null)
		{
			if (songAudioPlayer.PositionInSongInMillis < positionInSongInMillisOld)
			{
				thread.CalculateUpcomingSortedNotes((int)songAudioPlayer.PositionInSongInMillis);
				midiManager.StopAllMidiNotes();
			}
			thread.SynchronizeWithPlaybackPosition((int)songAudioPlayer.PositionInSongInMillis);
		}
		positionInSongInMillisOld = songAudioPlayer.PositionInSongInMillis;
	}

	private void StopThread()
	{
		thread.Stop();
		thread = null;
		midiManager.StopAllMidiNotes();
	}

	private void StartThread()
	{
		midiManager.InitIfNotDoneYet();
		thread = injector.CreateAndInject<SongEditorMidiSoundPlayAlongThread>();
		thread.Start((int)songAudioPlayer.PositionInSongInMillis);
	}
}
