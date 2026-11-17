using System;
using System.Diagnostics;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class MicSampleRecorder : MonoBehaviour, INeedInjection
{
	private const int DefaultSampleRate = 44100;

	public bool playRecordedAudio;

	private MicProfile micProfile;

	private readonly Subject<RecordingEvent> recordingEventStream = new Subject<RecordingEvent>();

	[Inject(SearchMethod = SearchMethods.GetComponent)]
	private AudioSource audioSource;

	private AudioClip micAudioClip;

	private int lastSamplePosition;

	public MicProfile MicProfile
	{
		get
		{
			return micProfile;
		}
		set
		{
			bool value2 = IsRecording.Value;
			if (IsRecording.Value)
			{
				StopRecording();
			}
			micProfile = value;
			if (micProfile != null && !micProfile.IsInputFromConnectedClient && !micProfile.Name.IsNullOrEmpty())
			{
				FinalSampleRate.Value = GetFinalSampleRate(micProfile.Name, micProfile.SampleRate);
				MicSamples = new float[FinalSampleRate.Value];
				if (value2)
				{
					StartRecording();
				}
			}
		}
	}

	public ReactiveProperty<bool> IsRecording { get; private set; } = new ReactiveProperty<bool>(initialValue: false);

	public ReactiveProperty<int> FinalSampleRate { get; private set; } = new ReactiveProperty<int>(0);

	public float[] MicSamples { get; private set; } = new float[44100];

	public IObservable<RecordingEvent> RecordingEventStream => recordingEventStream;

	private void OnDisable()
	{
		StopRecording();
	}

	private void Update()
	{
		UpdateMicrophoneAudioPlayback();
		UpdateRecording();
	}

	public void StartRecording()
	{
		if (IsRecording.Value)
		{
			return;
		}
		if (MicProfile == null)
		{
			UnityEngine.Debug.LogError("missing MicProfile");
			return;
		}
		if (MicProfile.IsInputFromConnectedClient)
		{
			UnityEngine.Debug.LogWarning("Cannot record mic samples using connected client");
			return;
		}
		IsRecording.Value = true;
		string[] devices = Microphone.devices;
		if (!devices.Contains(micProfile.Name))
		{
			IsRecording.Value = false;
			UnityEngine.Debug.LogWarning("Did not find mic '" + micProfile.Name + "'. Available mic devices: " + devices.ToCsv());
			return;
		}
		UnityEngine.Debug.Log($"Starting recording with '{MicProfile.Name}' at {FinalSampleRate} Hz");
		micAudioClip = Microphone.Start(MicProfile.Name, loop: true, 1, FinalSampleRate.Value);
		Stopwatch stopwatch = new Stopwatch();
		stopwatch.Start();
		while (Microphone.GetPosition(MicProfile.Name) <= 0)
		{
			if (stopwatch.ElapsedMilliseconds > 1000)
			{
				IsRecording.Value = false;
				UnityEngine.Debug.LogError("Microphone did not provide any samples. Took emergency exit out of busy waiting.");
				return;
			}
		}
		audioSource.clip = micAudioClip;
		audioSource.loop = true;
	}

	public void StopRecording()
	{
		if (IsRecording.Value)
		{
			UnityEngine.Debug.Log("Stopping recording with '" + MicProfile.Name + "'");
			if (!MicProfile.IsInputFromConnectedClient)
			{
				Microphone.End(MicProfile.Name);
			}
			for (int i = 0; i < MicSamples.Length; i++)
			{
				MicSamples[i] = 0f;
			}
			IsRecording.Value = false;
		}
	}

	private void UpdateRecording()
	{
		if (!IsRecording.Value)
		{
			return;
		}
		if (micAudioClip == null)
		{
			UnityEngine.Debug.LogError("AudioClip for microphone is null");
			StopRecording();
			return;
		}
		int position = Microphone.GetPosition(MicProfile.Name);
		micAudioClip.GetData(MicSamples, position);
		if (position != lastSamplePosition)
		{
			int newSampleCountInCircularBuffer = GetNewSampleCountInCircularBuffer(lastSamplePosition, position, MicSamples.Length);
			NotifyListeners(newSampleCountInCircularBuffer);
			lastSamplePosition = position;
		}
	}

	private void NotifyListeners(int newSamplesCount)
	{
		if (newSamplesCount > 0)
		{
			int newSamplesStartIndex = MicSamples.Length - newSamplesCount;
			int newSamplesEndIndex = MicSamples.Length - 1;
			RecordingEvent value = new RecordingEvent(MicSamples, newSamplesStartIndex, newSamplesEndIndex);
			recordingEventStream.OnNext(value);
		}
	}

	private void UpdateMicrophoneAudioPlayback()
	{
		if (playRecordedAudio && !audioSource.isPlaying)
		{
			audioSource.Play();
		}
		else if (!playRecordedAudio && audioSource.isPlaying)
		{
			audioSource.Stop();
		}
	}

	private static int GetNewSampleCountInCircularBuffer(int lastSamplePosition, int currentSamplePosition, int bufferLength)
	{
		if (currentSamplePosition <= lastSamplePosition)
		{
			return bufferLength - lastSamplePosition + currentSamplePosition;
		}
		return currentSamplePosition - lastSamplePosition;
	}

	public static int GetFinalSampleRate(string deviceName, int targetSampleRate)
	{
		if (targetSampleRate > 0)
		{
			return targetSampleRate;
		}
		Microphone.GetDeviceCaps(deviceName, out var _, out var maxFreq);
		return GetMaxSampleRate(maxFreq);
	}

	private static int GetMaxSampleRate(int maxSampleRate)
	{
		return maxSampleRate switch
		{
			0 => 44100, 
			16000 => 44100, 
			_ => maxSampleRate, 
		};
	}
}
