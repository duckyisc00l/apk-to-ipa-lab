using System.Collections.Generic;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class AboutSceneControl : MonoBehaviour, INeedInjection, ITranslator
{
	[InjectedInInspector]
	public List<TextAsset> textAssets;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "aboutText")]
	private TextField aboutText;

	[Inject(UxmlName = "nextItemButton")]
	private Button nextItemButton;

	[Inject(UxmlName = "previousItemButton")]
	private Button previousItemButton;

	[Inject(UxmlName = "itemIndexLabel")]
	private Label itemIndexLabel;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	private int selectedTextIndex;

	private void Start()
	{
		ShowAboutText(selectedTextIndex);
		nextItemButton.RegisterCallbackButtonTriggered(() =>
		{
			selectedTextIndex++;
			if (selectedTextIndex >= textAssets.Count)
			{
				selectedTextIndex = 0;
			}
			ShowAboutText(selectedTextIndex);
		});
		previousItemButton.RegisterCallbackButtonTriggered(() =>
		{
			selectedTextIndex--;
			if (selectedTextIndex < 0)
			{
				selectedTextIndex = textAssets.Count - 1;
			}
			ShowAboutText(selectedTextIndex);
		});
		nextItemButton.Focus();
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.MainScene);
		});
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			sceneNavigator.LoadScene(EScene.MainScene);
		});
	}

	private void ShowAboutText(int index)
	{
		aboutText.value = textAssets[index].text;
		itemIndexLabel.text = $"{index + 1} / {textAssets.Count}";
	}

	public void UpdateTranslation()
	{
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.aboutScene_title);
	}
}
