using UniInject;
using UniRx;
using UnityEngine;

[RequireComponent(typeof(MicSampleRecorder))]
public class SongEditorMicPitchTracker : AbstractMicPitchTracker
{
	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongMeta songMeta;

	private int nextBeatToAnalyze;

	[Inject]
	private Settings songEditorSettings;

	private int MicDelayInMillis => songEditorSettings.SongEditorSettings.MicDelayInMillis;

	public override void OnInjectionFinished()
	{
		base.OnInjectionFinished();
		songAudioPlayer.PlaybackStartedEventStream.Subscribe((double positionInSongInMillis) =>
		{
			UpdateNextBeatToAnalyze(positionInSongInMillis);
		});
		songAudioPlayer.PlaybackStoppedEventStream.Subscribe((double positionInSongInMillis) =>
		{
			UpdateNextBeatToAnalyze(positionInSongInMillis);
		});
		songAudioPlayer.JumpBackInSongEventStream.Subscribe((Pair<double> previousAndCurrentPositionInSongInMillis) =>
		{
			UpdateNextBeatToAnalyze(previousAndCurrentPositionInSongInMillis.Current);
		});
		songAudioPlayer.JumpForwardInSongEventStream.Subscribe((Pair<double> previousAndCurrentPositionInSongInMillis) =>
		{
			UpdateNextBeatToAnalyze(previousAndCurrentPositionInSongInMillis.Current);
		});
	}

	private void UpdateNextBeatToAnalyze(double positionInSongInMillis)
	{
		nextBeatToAnalyze = (int)BpmUtils.MillisecondInSongToBeat(songMeta, positionInSongInMillis);
	}

	protected override void OnRecordingEvent(RecordingEvent recordingEvent)
	{
		int num = nextBeatToAnalyze;
		int num2 = (int)BpmUtils.MillisecondInSongToBeat(millisInSong: (float)songAudioPlayer.PositionInSongInMillis - (float)MicDelayInMillis, songMeta: songMeta);
		for (int i = num; i < num2; i++)
		{
			AnalyzeBeatAndNotify(i);
			nextBeatToAnalyze = i + 1;
		}
	}

	private void AnalyzeBeatAndNotify(int beat)
	{
		PitchEvent pitchEvent = AbstractMicPitchTracker.AnalyzeBeat(songMeta, beat, songAudioPlayer.PositionInSongInMillis, base.MicSampleRecorder.FinalSampleRate.Value, base.MicSampleRecorder.MicProfile.DelayInMillis, base.MicSampleRecorder.MicProfile.AmplificationMultiplier, base.MicSampleRecorder.MicProfile.NoiseSuppression, base.MicSampleRecorder.MicSamples, base.AudioSamplesAnalyzer);
		if (pitchEvent == null)
		{
			pitchEventStream.OnNext(null);
			return;
		}
		int midiNote = pitchEvent.MidiNote + songEditorSettings.SongEditorSettings.MicOctaveOffset * 12;
		pitchEventStream.OnNext(new BeatPitchEvent(midiNote, beat));
	}
}
