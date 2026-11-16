using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class SongSelectMicEntryControl : IInjectionFinishedListener
{
	private static readonly int displayedSampleCount = 1024;

	private MicProfile micProfile;

	[Inject(UxmlName = "micIcon")]
	private VisualElement micImage;

	[Inject(UxmlName = "audioWaveForm")]
	private VisualElement audioWaveForm;

	private readonly GameObject gameObject;

	private readonly VisualElement visualElement;

	private readonly MicPitchTracker micPitchTracker;

	private AudioWaveFormVisualization audioWaveFormVisualizer;

	public MicProfile MicProfile
	{
		get
		{
			return micProfile;
		}
		set
		{
			micProfile = value;
			micImage.style.unityBackgroundImageTintColor = new StyleColor(micProfile.Color);
		}
	}

	public SongSelectMicEntryControl(GameObject gameObject, VisualElement visualElement, MicPitchTracker micPitchTracker)
	{
		this.gameObject = gameObject;
		this.visualElement = visualElement;
		this.micPitchTracker = micPitchTracker;
	}

	public void UpdateWaveForm()
	{
		if (audioWaveFormVisualizer != null)
		{
			float[] micSamples = micPitchTracker.MicSampleRecorder.MicSamples;
			audioWaveFormVisualizer.DrawWaveFormValues(micSamples, micSamples.Length - displayedSampleCount, displayedSampleCount);
		}
	}

	public void OnInjectionFinished()
	{
		audioWaveForm.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			if (audioWaveForm is Label label)
			{
				label.text = "";
			}
			audioWaveFormVisualizer = new AudioWaveFormVisualization(gameObject, audioWaveForm);
		});
	}

	public void Destroy()
	{
		visualElement.RemoveFromHierarchy();
		audioWaveFormVisualizer.Destroy();
	}
}
