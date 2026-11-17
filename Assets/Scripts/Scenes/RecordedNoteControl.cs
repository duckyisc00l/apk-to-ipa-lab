using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class RecordedNoteControl : INeedInjection, IInjectionFinishedListener
{
	private static int goldenNoteHitParticlesPerSecond = 150;

	[Inject(Key = "goldenNoteHitStarUi")]
	protected VisualTreeAsset goldenNoteHitStarUi;

	[Inject(UxmlName = "targetNote")]
	private VisualElement targetNoteVisualElement;

	[Inject(UxmlName = "recordedNote")]
	private VisualElement recordedNoteVisualElement;

	[Inject(UxmlName = "recordedNoteImage")]
	private VisualElement image;

	[Inject(Optional = true)]
	private MicProfile micProfile;

	[Inject(UxmlName = "effectsContainer")]
	private VisualElement effectsContainer;

	[Inject]
	private Injector injector;

	[Inject]
	private GameObject gameObject;

	private readonly List<StarParticleControl> starParticleControls = new List<StarParticleControl>();

	private float lastNoteWidth;

	[Inject(Key = "rootVisualElement")]
	public VisualElement VisualElement { get; private set; }

	[Inject(UxmlName = "recordedNoteLabel")]
	public Label Label { get; private set; }

	[Inject]
	public RecordedNote RecordedNote { get; private set; }

	public int MidiNote { get; set; }

	public int StartBeat { get; set; }

	public double EndBeat { get; set; }

	public int TargetEndBeat { get; set; }

	public float LifeTimeInSeconds { get; set; }

	public void OnInjectionFinished()
	{
		targetNoteVisualElement.HideByDisplay();
		recordedNoteVisualElement.ShowByDisplay();
		if (micProfile != null)
		{
			SetStyleByMicProfile(micProfile);
		}
	}

	public void Update()
	{
		LifeTimeInSeconds += Time.deltaTime;
		starParticleControls.ForEach((StarParticleControl starParticleControl) =>
		{
			starParticleControl.Update();
		});
		if (EndBeat < (double)TargetEndBeat && RecordedNote != null && RecordedNote.TargetNote != null && MidiNote == RecordedNote.TargetNote.MidiNote && RecordedNote.TargetNote.IsGolden)
		{
			CreateGoldenNoteHitEffect();
		}
		lastNoteWidth = VisualElement.style.width.value.value;
	}

	private void CreateGoldenNoteHitEffect()
	{
		for (int i = 0; (float)i < (float)goldenNoteHitParticlesPerSecond * Time.deltaTime; i++)
		{
			CreateGoldenNoteHitStar();
		}
	}

	private void CreateGoldenNoteHitStar()
	{
		VisualElement visualElement = goldenNoteHitStarUi.CloneTree().Children().First();
		visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
		effectsContainer.Add(visualElement);
		StarParticleControl starControl = injector.WithRootVisualElement(visualElement).CreateAndInject<StarParticleControl>();
		starControl.VisualElementToFollow = VisualElement;
		float value = VisualElement.style.width.value.value;
		float value2 = VisualElement.style.height.value.value;
		float x = VisualElement.style.left.value.value + Random.Range(lastNoteWidth, value);
		float y = VisualElement.style.top.value.value + Random.Range(value2 * 0.9f, 0f);
		Vector2 pos = new Vector2(x, y);
		starControl.SetPosition(pos);
		starControl.Rotation = Random.Range(0, 360);
		float num = Random.Range(0.4f, 0.5f);
		Vector2 startScale = new Vector2(num, num);
		starControl.SetScale(startScale);
		starControl.RotationVelocityInDegreesPerSecond = 60f;
		starControl.VelocityInPercentPerSecond = new Vector2(Random.Range(-3, 0), Random.Range(-10, 10));
		LeanTween.value(gameObject, 1f, 0f, Random.Range(0.3f, 0.7f)).setOnUpdate((float factor) =>
		{
			starControl.SetScale(startScale * factor);
			starControl.SetOpacity(factor);
		}).setOnComplete(() =>
		{
			RemoveStarControl(starControl);
		});
		starParticleControls.Add(starControl);
	}

	private void RemoveStarControl(StarParticleControl starParticleControl)
	{
		starParticleControl.VisualElement.RemoveFromHierarchy();
		starParticleControls.Remove(starParticleControl);
	}

	private void SetStyleByMicProfile(MicProfile micProfile)
	{
		Color color = micProfile.Color;
		Color color2 = ((RecordedNote != null && RecordedNote.TargetNote == null) ? color.RgbToHsv().WithGreen(0f).HsvToRgb()
			.WithAlpha(0.25f) : color);
		image.style.unityBackgroundImageTintColor = color2;
		image.style.backgroundColor = color2;
	}

	public void Dispose()
	{
		VisualElement.RemoveFromHierarchy();
		starParticleControls.ToList().ForEach((StarParticleControl starParticleControl) =>
		{
			RemoveStarControl(starParticleControl);
		});
	}
}
