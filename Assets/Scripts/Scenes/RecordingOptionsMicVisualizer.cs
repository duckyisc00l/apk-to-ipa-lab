using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class RecordingOptionsMicVisualizer : MonoBehaviour, INeedInjection
{
	[Inject(SearchMethod = SearchMethods.FindObjectOfType)]
	private MicSampleRecorder micSampleRecorder;

	[Inject(SearchMethod = SearchMethods.FindObjectOfType)]
	private MicPitchTracker micPitchTracker;

	[Inject(UxmlName = "noteLabel")]
	private Label currentNoteLabel;

	[Inject(UxmlName = "audioWaveForm")]
	private VisualElement audioWaveForm;

	[Inject]
	private RecordingOptionsSceneControl recordingOptionsSceneControl;

	private AudioWaveFormVisualization audioWaveFormVisualization;

	private void Start()
	{
		micPitchTracker.PitchEventStream.Subscribe(OnPitchDetected).AddTo(base.gameObject);
		recordingOptionsSceneControl.ConnectedClientBeatPitchEventStream.Subscribe(OnPitchDetected).AddTo(base.gameObject);
		audioWaveForm.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			audioWaveFormVisualization = new AudioWaveFormVisualization(base.gameObject, audioWaveForm);
		});
	}

	private void Update()
	{
		UpdateWaveForm();
		micPitchTracker.AudioSamplesAnalyzer.ModifySamplesInPlace = false;
	}

	private void UpdateWaveForm()
	{
		if (audioWaveFormVisualization != null)
		{
			MicProfile micProfile = micPitchTracker.MicProfile;
			if (micProfile != null)
			{
				float[] micSamples = micPitchTracker.MicSampleRecorder.MicSamples;
				AbstractAudioSamplesAnalyzer.ApplyAmplification(micSamples, 0, micSamples.Length, micProfile.AmplificationMultiplier);
				float[] samples = (AbstractAudioSamplesAnalyzer.IsAboveNoiseSuppressionThreshold(micSamples, 0, micSamples.Length, micProfile.NoiseSuppression) ? micSamples : new float[micSamples.Length]);
				audioWaveFormVisualization.DrawWaveFormMinAndMaxValues(samples);
			}
		}
	}

	public void SetMicProfile(MicProfile micProfile)
	{
		micPitchTracker.MicProfile = micProfile;
		if (!micProfile.Name.IsNullOrEmpty() && !micProfile.IsInputFromConnectedClient)
		{
			micPitchTracker.MicSampleRecorder.StartRecording();
		}
	}

	private void OnPitchDetected(PitchEvent pitchEvent)
	{
		if (pitchEvent != null && pitchEvent.MidiNote > 0)
		{
			currentNoteLabel.text = TranslationManager.GetTranslation(R.Messages.options_note, "value", MidiUtils.GetAbsoluteName(pitchEvent.MidiNote));
		}
		else
		{
			currentNoteLabel.text = TranslationManager.GetTranslation(R.Messages.options_note, "value", "?");
		}
	}
}
