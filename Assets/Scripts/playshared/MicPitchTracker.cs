using UniRx;

public class MicPitchTracker : AbstractMicPitchTracker
{
	private const int MinSampleCountToUse = 1024;

	private int bufferedNotAnalyzedSampleCount;

	[ReadOnly]
	public string lastMidiNoteName;

	[ReadOnly]
	public int lastMidiNote;

	public override void OnInjectionFinished()
	{
		base.OnInjectionFinished();
		pitchEventStream.Subscribe(UpdateLastMidiNoteFields);
	}

	protected override void OnRecordingEvent(RecordingEvent recordingEvent)
	{
		int newSampleCount = recordingEvent.NewSampleCount;
		bufferedNotAnalyzedSampleCount += newSampleCount;
		if (bufferedNotAnalyzedSampleCount >= 1024)
		{
			if (bufferedNotAnalyzedSampleCount > 2048)
			{
				bufferedNotAnalyzedSampleCount = 2048;
			}
			int startIndexInclusive = recordingEvent.MicSamples.Length - bufferedNotAnalyzedSampleCount;
			int endIndexExclusive = recordingEvent.MicSamples.Length;
			PitchEvent value = base.AudioSamplesAnalyzer.ProcessAudioSamples(recordingEvent.MicSamples, startIndexInclusive, endIndexExclusive, base.MicProfile.AmplificationMultiplier, base.MicProfile.NoiseSuppression);
			bufferedNotAnalyzedSampleCount = 0;
			pitchEventStream.OnNext(value);
		}
	}

	private void UpdateLastMidiNoteFields(PitchEvent pitchEvent)
	{
		if (pitchEvent == null)
		{
			lastMidiNoteName = "";
			lastMidiNote = 0;
		}
		else
		{
			lastMidiNoteName = MidiUtils.GetAbsoluteName(pitchEvent.MidiNote);
			lastMidiNote = pitchEvent.MidiNote;
		}
	}
}
