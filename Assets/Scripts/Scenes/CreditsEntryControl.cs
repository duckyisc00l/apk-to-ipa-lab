using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class CreditsEntryControl : INeedInjection, IDisposable, IInjectionFinishedListener
{
	[Inject]
	private PanelHelper panelHelper;

	[Inject]
	private Injector injector;

	[Inject]
	private GameObject gameObject;

	private bool isFadingOut;

	[Inject(Key = "rootVisualElement")]
	public VisualElement VisualElement { get; private set; }

	[Inject(UxmlName = "nameCharacterContainer")]
	public VisualElement NameCharacterContainer { get; private set; }

	[Inject(UxmlName = "nicknameCharacterContainer")]
	public VisualElement NicknameCharacterContainer { get; private set; }

	[Inject(UxmlName = "commentLabel")]
	public Label CommentLabel { get; private set; }

	[Inject(UxmlName = "banner")]
	public VisualElement Banner { get; private set; }

	public List<CreditsCharacterControl> CharacterControls { get; private set; } = new List<CreditsCharacterControl>();

	public void OnInjectionFinished()
	{
		CommentLabel.text = "";
		NameCharacterContainer.Clear();
		NicknameCharacterContainer.Clear();
		float time = UnityEngine.Random.Range(0.5f, 1.5f);
		VisualElement.style.opacity = 0f;
		LeanTween.value(gameObject, 0f, 1f, time).setOnUpdate((float value) =>
		{
			VisualElement.style.opacity = value;
		}).setOnComplete(() =>
		{
			CharacterControls.ForEach((CreditsCharacterControl it) =>
			{
				it.InitMovement();
			});
		});
	}

	public void Update()
	{
		CharacterControls.ForEach((CreditsCharacterControl it) =>
		{
			it.Update();
		});
		CommentLabel.style.maxWidth = Banner.worldBound.width;
		if (!isFadingOut && CharacterControls.Count((CreditsCharacterControl it) => !it.IsCollected && it.Character != " " && it.Label.worldBound.yMax < (float)Screen.height) == 0)
		{
			isFadingOut = true;
			float time = UnityEngine.Random.Range(0.2f, 0.75f);
			LeanTween.value(gameObject, 1f, 0f, time).setOnUpdate((float value) =>
			{
				VisualElement.style.opacity = value;
			}).setOnComplete(() =>
			{
				Dispose();
			});
		}
	}

	public void CreateCharacterControls(string text, VisualElement parent)
	{
		text.ForEach((char c) =>
		{
			CreateCharacterControl(c, parent);
		});
	}

	private void CreateCharacterControl(char c, VisualElement parent)
	{
		Label label = new Label();
		label.AddToClassList("creditsEntryCharacter");
		if (c == ' ')
		{
			label.style.marginLeft = 3f;
			label.style.marginRight = 3f;
		}
		CreditsCharacterControl creditsCharacterControl = injector.WithRootVisualElement(label).CreateAndInject<CreditsCharacterControl>();
		creditsCharacterControl.Character = c.ToString();
		parent.Add(label);
		CharacterControls.Add(creditsCharacterControl);
	}

	private void RemoveCharacterControls()
	{
		CharacterControls.ForEach((CreditsCharacterControl it) =>
		{
			it.Dispose();
		});
		CharacterControls.Clear();
	}

	public void Dispose()
	{
		CharacterControls.ForEach((CreditsCharacterControl it) =>
		{
			it.Dispose();
		});
		VisualElement.RemoveFromHierarchy();
	}
}
