using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using ProTrans;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class UiManager : AbstractSingletonBehaviour, INeedInjection
{
	private static Dictionary<string, string> relativePlayerProfileImagePathToAbsolutePath = new Dictionary<string, string>();

	[InjectedInInspector]
	public VisualTreeAsset notificationOverlayVisualTreeAsset;

	[InjectedInInspector]
	public VisualTreeAsset notificationVisualTreeAsset;

	[InjectedInInspector]
	public VisualTreeAsset dialogUi;

	[InjectedInInspector]
	public VisualTreeAsset accordionUi;

	[InjectedInInspector]
	public Sprite fallbackPlayerProfileImage;

	[Inject]
	private Injector injector;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private Settings settings;

	public static UiManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<UiManager>();

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		relativePlayerProfileImagePathToAbsolutePath = new Dictionary<string, string>();
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void AwakeSingleton()
	{
		LeanTween.init(10000);
		UpdatePlayerProfileImagePaths();
	}

	private void Update()
	{
		ContextMenuPopupControl.OpenContextMenuPopups.ForEach((ContextMenuPopupControl contextMenuPopupControl) =>
		{
			contextMenuPopupControl.Update();
		});
	}

	private Label DoCreateNotification(string text, params string[] additionalTextClasses)
	{
		VisualElement visualElement = uiDocument.rootVisualElement.Q<VisualElement>("notificationOverlay");
		if (visualElement == null)
		{
			visualElement = notificationOverlayVisualTreeAsset.CloneTree().Children().First();
			uiDocument.rootVisualElement.Children().First().Add(visualElement);
		}
		VisualElement visualElement2 = notificationVisualTreeAsset.CloneTree().Children().First();
		Label notificationLabel = visualElement2.Q<Label>("notificationLabel");
		notificationLabel.text = text;
		additionalTextClasses?.ForEach((string className) =>
		{
			notificationLabel.AddToClassList(className);
		});
		visualElement.Add(visualElement2);
		StartCoroutine(FadeOutVisualElement(visualElement2, 2f, 1f));
		return notificationLabel;
	}

	public void UpdatePlayerProfileImagePaths()
	{
		relativePlayerProfileImagePathToAbsolutePath = PlayerProfileUtils.FindPlayerProfileImages();
	}

	public static Label CreateNotification(string text, params string[] additionalTextClasses)
	{
		return Instance.DoCreateNotification(text, additionalTextClasses);
	}

	public static IEnumerator FadeOutVisualElement(VisualElement visualElement, float solidTimeInSeconds, float fadeOutTimeInSeconds)
	{
		yield return new WaitForSeconds(solidTimeInSeconds);
		float startOpacity = visualElement.resolvedStyle.opacity;
		float startTime = Time.time;
		while (visualElement.resolvedStyle.opacity > 0f)
		{
			float num = Mathf.Lerp(startOpacity, 0f, (Time.time - startTime) / fadeOutTimeInSeconds);
			if (num < 0f)
			{
				num = 0f;
			}
			visualElement.style.opacity = num;
			yield return null;
		}
		if (visualElement.parent != null)
		{
			visualElement.parent.Remove(visualElement);
		}
	}

	public MessageDialogControl CreateHelpDialogControl(string dialogTitle, Dictionary<string, string> titleToContentMap, Action onCloseHelp)
	{
		VisualElement visualElement = dialogUi.CloneTree().Children().FirstOrDefault();
		uiDocument.rootVisualElement.Add(visualElement);
		visualElement.AddToClassList("wordWrap");
		MessageDialogControl helpDialogControl = injector.WithRootVisualElement(visualElement).CreateAndInject<MessageDialogControl>();
		helpDialogControl.Title = dialogTitle;
		titleToContentMap.ForEach((KeyValuePair<string, string> entry) =>
		{
			AddChapter(entry.Key, entry.Value);
		});
		helpDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.close), onCloseHelp).Focus();
		return helpDialogControl;
		void AddChapter(string title, string content)
		{
			AccordionItemControl accordionItemControl = CreateAccordionItemControl();
			accordionItemControl.Title = title;
			accordionItemControl.AddVisualElement(new Label(content));
			helpDialogControl.AddVisualElement(accordionItemControl.VisualElement);
		}
	}

	public AccordionItemControl CreateAccordionItemControl()
	{
		VisualElement visualElement = accordionUi.CloneTree().Children().FirstOrDefault();
		return injector.WithRootVisualElement(visualElement).CreateAndInject<AccordionItemControl>();
	}

	public void LoadPlayerProfileImage(string imagePath, Action<Sprite> onSuccess)
	{
		if (imagePath.IsNullOrEmpty())
		{
			onSuccess(fallbackPlayerProfileImage);
			return;
		}
		string relativePathNormalized = PathUtils.NormalizePath(imagePath);
		string text = GetAbsolutePlayerProfileImagePaths().FirstOrDefault((string absolutePath) => PathUtils.NormalizePath(absolutePath).EndsWith(relativePathNormalized));
		if (text.IsNullOrEmpty())
		{
			Debug.LogWarning("Cannot load player profile image with path '" + imagePath + "' (normalized: '" + relativePathNormalized + "'), no corresponding image file found.");
			onSuccess(fallbackPlayerProfileImage);
		}
		else
		{
			ImageManager.LoadSpriteFromUri(text, onSuccess);
		}
	}

	public List<string> GetAbsolutePlayerProfileImagePaths()
	{
		return relativePlayerProfileImagePathToAbsolutePath.Values.ToList();
	}

	public List<string> GetRelativePlayerProfileImagePaths(bool includeWebCamImages)
	{
		if (includeWebCamImages)
		{
			return relativePlayerProfileImagePathToAbsolutePath.Keys.ToList();
		}
		return relativePlayerProfileImagePathToAbsolutePath.Keys.Where((string relativePath) => !relativePath.Contains("WebcamImages")).ToList();
	}
}
