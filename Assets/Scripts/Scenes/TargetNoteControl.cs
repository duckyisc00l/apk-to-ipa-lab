using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class TargetNoteControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(Key = "goldenNoteStarUi")]
	protected VisualTreeAsset goldenNoteStarUi;

	[Inject(Key = "perfectEffectStarUi")]
	protected VisualTreeAsset perfectEffectStarUi;

	[Inject(UxmlName = "targetNote")]
	private VisualElement targetNote;

	[Inject(UxmlName = "recordedNote")]
	private VisualElement recordedNote;

	[Inject(UxmlName = "targetNoteImage")]
	private VisualElement image;

	[Inject(Optional = true)]
	private MicProfile micProfile;

	[Inject]
	private SingSceneControl singSceneControl;

	[Inject]
	private Injector injector;

	[Inject(UxmlName = "effectsContainer")]
	private VisualElement effectsContainer;

	private readonly List<StarParticleControl> starControls = new List<StarParticleControl>();

	[Inject]
	public Note Note { get; private set; }

	[Inject(UxmlName = "targetNoteLabel")]
	public Label Label { get; private set; }

	[Inject(Key = "rootVisualElement")]
	public VisualElement VisualElement { get; private set; }

	public void OnInjectionFinished()
	{
		targetNote.ShowByDisplay();
		recordedNote.HideByDisplay();
		if (Note.IsGolden)
		{
			image.AddToClassList("goldenNote");
		}
		SetStyleByMicProfile();
	}

	public void Update()
	{
		if (Note.IsGolden)
		{
			CreateGoldenNoteEffect();
		}
		starControls.ForEach((StarParticleControl starControl) =>
		{
			starControl.Update();
		});
	}

	private void SetStyleByMicProfile()
	{
		if (micProfile != null)
		{
			Color color = micProfile.Color;
			ENoteType type = Note.Type;
			Color color2 = ((type == ENoteType.Freestyle || type == ENoteType.Rap || type == ENoteType.RapGolden) ? color.WithAlpha(0.3f) : color);
			image.style.unityBackgroundImageTintColor = color2;
			image.style.borderTopColor = color2;
			image.style.borderBottomColor = color2;
			image.style.borderLeftColor = color2;
			image.style.borderRightColor = color2;
		}
	}

	private void CreateGoldenNoteEffect()
	{
		int num = Mathf.Max(6, (int)VisualElement.contentRect.width / 5);
		if (starControls.Count < num)
		{
			CreateGoldenStar();
		}
	}

	private void CreateGoldenStar()
	{
		VisualElement visualElement = goldenNoteStarUi.CloneTree().Children().First();
		visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
		effectsContainer.Add(visualElement);
		StarParticleControl starControl = injector.WithRootVisualElement(visualElement).CreateAndInject<StarParticleControl>();
		starControl.VisualElementToFollow = VisualElement;
		float value = VisualElement.style.width.value.value;
		float value2 = VisualElement.style.height.value.value;
		float x = VisualElement.style.left.value.value + Random.Range(0f, value);
		float y = VisualElement.style.top.value.value + Random.Range(value2 * 0.9f, 0f);
		Vector2 pos = new Vector2(x, y);
		starControl.SetPosition(pos);
		starControl.Rotation = Random.Range(0, 360);
		Vector2 zero = Vector2.zero;
		starControl.SetScale(zero);
		starControl.RotationVelocityInDegreesPerSecond = 60f;
		LeanTween.value(singSceneControl.gameObject, zero, Vector2.one * Random.Range(0.25f, 0.5f), Random.Range(0.5f, 1f)).setOnUpdate((Vector2 s) =>
		{
			starControl.SetScale(s);
		}).setOnComplete(() =>
		{
			LeanTween.value(singSceneControl.gameObject, 0f, 0f, Random.Range(1f, 4f)).setOnComplete(() =>
			{
				RemoveStarControl(starControl);
			});
		});
		starControls.Add(starControl);
	}

	public void CreatePerfectNoteEffect()
	{
		CreatePerfectStar();
	}

	private void CreatePerfectStar()
	{
		VisualElement visualElement = perfectEffectStarUi.CloneTree().Children().First();
		visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
		effectsContainer.Add(visualElement);
		StarParticleControl starControl = injector.WithRootVisualElement(visualElement).CreateAndInject<StarParticleControl>();
		starControl.VisualElementToFollow = VisualElement;
		visualElement.style.marginLeft = -25f;
		float x = VisualElement.style.left.value.value + VisualElement.style.width.value.value;
		float y = VisualElement.style.top.value.value - VisualElement.style.height.value.value / 4f;
		Vector2 pos = new Vector2(x, y);
		starControl.SetPosition(pos);
		starControl.Rotation = Random.Range(0, 360);
		Vector2 startScale = Vector2.zero;
		Vector2 endScale = Vector2.one * 0.8f;
		starControl.SetScale(startScale);
		starControl.RotationVelocityInDegreesPerSecond = 60f;
		float animationTime = 1.5f;
		LeanTween.value(singSceneControl.gameObject, startScale, endScale, animationTime / 2f).setEaseOutSine().setOnUpdate((Vector2 s) =>
		{
			starControl.SetScale(s);
		})
			.setOnComplete(() =>
			{
				LeanTween.value(singSceneControl.gameObject, endScale, startScale, animationTime / 2f).setEaseOutSine().setOnUpdate((Vector2 s) =>
				{
					starControl.SetScale(s);
				})
					.setOnComplete(() =>
					{
						RemoveStarControl(starControl);
					});
			});
		starControls.Add(starControl);
	}

	private void RemoveStarControl(StarParticleControl starControl)
	{
		starControl.VisualElement.RemoveFromHierarchy();
		starControls.Remove(starControl);
	}

	public void Dispose()
	{
		VisualElement.RemoveFromHierarchy();
		starControls.ToList().ForEach((StarParticleControl starControl) =>
		{
			RemoveStarControl(starControl);
		});
	}
}
