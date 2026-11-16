using System;
using UniInject;
using UniRx;
using UnityEngine;

[RequireComponent(typeof(MicSampleRecorder))]
public abstract class AbstractMicPitchTracker : MonoBehaviour, INeedInjection, IInjectionFinishedListener
{
	protected const int MaxSampleCountToUse = 2048;

	[Range(0f, 1f)]
	public float halftoneContinuationBias = 0.1f;

	[Inject]
	protected ISettings settings;

	protected readonly Subject<PitchEvent> pitchEventStream = new Subject<PitchEvent>();

	public MicProfile MicProfile
	{
		get
		{
			return MicSampleRecorder.MicProfile;
		}
		set
		{
			MicSampleRecorder.MicProfile = value;
			AudioSamplesAnalyzer = CreateAudioSamplesAnalyzer(settings.PitchDetectionAlgorithm, MicSampleRecorder.FinalSampleRate.Value);
		}
	}

	[Inject(SearchMethod = SearchMethods.GetComponent)]
	public MicSampleRecorder MicSampleRecorder { get; protected set; }

	public IObservable<PitchEvent> PitchEventStream => pitchEventStream;

	public IAudioSamplesAnalyzer AudioSamplesAnalyzer { get; private set; }

	public virtual void OnInjectionFinished()
	{
		MicSampleRecorder.RecordingEventStream.Subscribe((RecordingEvent recordingEvent) =>
		{
			OnRecordingEvent(recordingEvent);
		});
		AudioSamplesAnalyzer = CreateAudioSamplesAnalyzer(settings.PitchDetectionAlgorithm, MicSampleRecorder.FinalSampleRate.Value);
		settings.ObserveEveryValueChanged((ISettings it) => it.PitchDetectionAlgorithm).Subscribe(OnPitchDetectionAlgorithmChanged).AddTo(base.gameObject);
	}

	protected virtual void Update()
	{
		if (AudioSamplesAnalyzer is CamdAudioSamplesAnalyzer)
		{
			(AudioSamplesAnalyzer as CamdAudioSamplesAnalyzer).HalftoneContinuationBias = halftoneContinuationBias;
		}
	}

	private void OnPitchDetectionAlgorithmChanged(EPitchDetectionAlgorithm newValue)
	{
		if (MicProfile != null)
		{
			AudioSamplesAnalyzer = CreateAudioSamplesAnalyzer(newValue, MicSampleRecorder.FinalSampleRate.Value);
		}
	}

	protected abstract void OnRecordingEvent(RecordingEvent recordingEvent);

	public static PitchEvent AnalyzeBeat(SongMeta songMeta, int beat, double positionInSongInMillis, int micSampleRate, int micDelayInMillis, int micAmplificationFactor, int micNoiseSuppression, float[] micSampleBuffer, IAudioSamplesAnalyzer audioSamplesAnalyzer)
	{
		if (micSampleRate <= 0)
		{
			Debug.LogWarning("Sample rate should be a positive value");
			return null;
		}
		float num = (float)BpmUtils.BeatToMillisecondsInSong(songMeta, beat);
		float num2 = (float)BpmUtils.BeatToMillisecondsInSong(songMeta, beat + 1);
		int num3 = (int)((num2 - num) * (float)micSampleRate / 1000f);
		int value = (int)(((float)(positionInSongInMillis - (double)micDelayInMillis) - num2) * (float)micDelayInMillis / 1000f);
		value = NumberUtils.Limit(value, 0, micSampleBuffer.Length - 1);
		int num4 = micSampleBuffer.Length - value;
		int value2 = num4 - num3;
		num4 = NumberUtils.Limit(num4, 0, micSampleBuffer.Length - 1);
		value2 = NumberUtils.Limit(value2, 0, micSampleBuffer.Length - 1);
		if (num4 < value2)
		{
			Debug.LogWarning($"Cannot analyze from sample {value2} to {num4}. Start index must be smaller than end index.");
			return null;
		}
		return audioSamplesAnalyzer.ProcessAudioSamples(micSampleBuffer, value2, num4, micAmplificationFactor, micNoiseSuppression);
	}

	public static IAudioSamplesAnalyzer CreateAudioSamplesAnalyzer(EPitchDetectionAlgorithm pitchDetectionAlgorithm, int sampleRateHz)
	{
		return pitchDetectionAlgorithm switch
		{
			EPitchDetectionAlgorithm.Camd => new CamdAudioSamplesAnalyzer(sampleRateHz, 2048), 
			EPitchDetectionAlgorithm.Dywa => new DywaAudioSamplesAnalyzer(sampleRateHz, 2048), 
			_ => throw new UnityException("Unknown pitch detection algorithm:" + pitchDetectionAlgorithm), 
		};
	}
}
