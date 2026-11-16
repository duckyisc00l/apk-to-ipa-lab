using System;
using System.Collections.Generic;
using UniInject;
using UniRx;
using UnityEngine;

public class CalibrateMicDelayControl : MonoBehaviour, INeedInjection
{
	public class CalibrationResult
	{
		public bool IsSuccess { get; set; }

		public List<int> DelaysInMilliseconds { get; set; }
	}

	[InjectedInInspector]
	public List<AudioClip> audioClips;

	[InjectedInInspector]
	public List<string> midiNoteNames;

	private readonly Subject<CalibrationResult> calibrationResultEventStream = new Subject<CalibrationResult>();

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	private AudioSource audioSource;

	[Inject(SearchMethod = SearchMethods.FindObjectOfType)]
	private MicPitchTracker micPitchTracker;

	[Inject]
	private RecordingOptionsSceneControl recordingOptionsSceneControl;

	private bool isCalibrationInProgress;

	private float startTimeInSeconds;

	private readonly float timeoutInSeconds = 2f;

	private float pauseTime = float.MinValue;

	private List<int> delaysInMillis = new List<int>();

	private int currentIteration;

	public MicProfile MicProfile { get; set; }

	public IObservable<CalibrationResult> CalibrationResultEventStream => calibrationResultEventStream;

	private void Awake()
	{
		if (midiNoteNames.Count == 0)
		{
			throw new UnityException("midiNoteNames not set");
		}
		if (audioClips.Count == 0)
		{
			throw new UnityException("audioClips not set");
		}
		if (audioClips.Count != midiNoteNames.Count)
		{
			throw new UnityException("audioClips and midiNotes must have same length");
		}
	}

	private void Start()
	{
		micPitchTracker.PitchEventStream.Subscribe(OnPitchDetected).AddTo(base.gameObject);
		recordingOptionsSceneControl.ConnectedClientBeatPitchEventStream.Subscribe(OnPitchDetected).AddTo(base.gameObject);
	}

	private void Update()
	{
		if (isCalibrationInProgress)
		{
			if (pauseTime > 0f)
			{
				pauseTime -= Time.deltaTime;
			}
			else if (pauseTime > float.MinValue)
			{
				pauseTime = float.MinValue;
				StartIteration();
			}
			if (startTimeInSeconds + timeoutInSeconds < Time.time)
			{
				OnCalibrationTimedOut();
			}
		}
	}

	public void StartCalibration()
	{
		if (!isCalibrationInProgress)
		{
			isCalibrationInProgress = true;
			delaysInMillis = new List<int>();
			currentIteration = 0;
			StartIteration();
		}
	}

	private void OnCalibrationTimedOut()
	{
		Debug.Log("Mic delay calibration - timeout");
		audioSource.Stop();
		isCalibrationInProgress = false;
		calibrationResultEventStream.OnNext(new CalibrationResult
		{
			IsSuccess = false
		});
	}

	public void OnEndCalibration()
	{
		Debug.Log($"Mic delay calibration - median delay of {delaysInMillis.Count} values: {delaysInMillis[delaysInMillis.Count / 2]}");
		audioSource.Stop();
		isCalibrationInProgress = false;
		calibrationResultEventStream.OnNext(new CalibrationResult
		{
			IsSuccess = true,
			DelaysInMilliseconds = new List<int>(delaysInMillis)
		});
	}

	private void StartIteration()
	{
		startTimeInSeconds = Time.time;
		audioSource.clip = audioClips[currentIteration];
		audioSource.Play();
	}

	private void OnPitchDetected(PitchEvent pitchEvent)
	{
		if (pitchEvent == null || !isCalibrationInProgress || pauseTime > 0f)
		{
			return;
		}
		string text = midiNoteNames[currentIteration];
		if (MidiUtils.GetAbsoluteName(pitchEvent.MidiNote) == text)
		{
			audioSource.Stop();
			int num = (int)((Time.time - startTimeInSeconds) * 1000f);
			delaysInMillis.Add(num);
			Debug.Log($"Mic delay calibration - delay of iteration {currentIteration}: {num}");
			currentIteration++;
			if (currentIteration >= midiNoteNames.Count)
			{
				OnEndCalibration();
			}
			else
			{
				pauseTime = 0.5f;
			}
		}
		else
		{
			Debug.Log("Mic delay calibration - wrong pitch: " + MidiUtils.GetAbsoluteName(pitchEvent.MidiNote));
		}
	}
}
