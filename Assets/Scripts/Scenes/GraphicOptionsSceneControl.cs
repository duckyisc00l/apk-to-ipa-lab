using System.Collections.Generic;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class GraphicOptionsSceneControl : MonoBehaviour, INeedInjection, ITranslator
{
	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "resolutionContainer")]
	private VisualElement resolutionContainer;

	[Inject(UxmlName = "fpsContainer")]
	private VisualElement fpsContainer;

	[Inject(UxmlName = "fullscreenContainer")]
	private VisualElement fullscreenContainer;

	[Inject]
	private Settings settings;

	private void Start()
	{
		if (PlatformUtils.IsStandalone)
		{
			new ScreenResolutionPickerControl(resolutionContainer.Q<ItemPicker>(), settings);
			new FullscreenModePickerControl(fullscreenContainer.Q<ItemPicker>(), settings, base.gameObject);
		}
		else
		{
			resolutionContainer.HideByDisplay();
			fullscreenContainer.HideByDisplay();
		}
		List<int> items = new List<int> { 30, 60 };
		new LabeledItemPickerControl<int>(fpsContainer.Q<ItemPicker>(), items).Bind(() => settings.GraphicSettings.targetFps, (int newValue) =>
		{
			settings.GraphicSettings.targetFps = newValue;
		});
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			ApplyGraphicSettingsAndExitScene();
		});
		backButton.Focus();
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			ApplyGraphicSettingsAndExitScene();
		});
	}

	public void UpdateTranslation()
	{
		resolutionContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_resolution);
		fpsContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_targetFps);
		fullscreenContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_fullscreenMode);
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_graphics_title);
	}

	private void ApplyGraphicSettingsAndExitScene()
	{
		ApplyGraphicSettings();
		sceneNavigator.LoadScene(EScene.OptionsScene);
	}

	private void ApplyGraphicSettings()
	{
		if (PlatformUtils.IsStandalone)
		{
			ScreenResolution resolution = settings.GraphicSettings.resolution;
			FullScreenMode fullScreenMode = settings.GraphicSettings.fullScreenMode;
			if (resolution.Width > 0 && resolution.Height > 0 && resolution.RefreshRate > 0)
			{
				Screen.SetResolution(resolution.Width, resolution.Height, fullScreenMode, resolution.RefreshRate);
			}
			else
			{
				Debug.LogWarning($"Attempt to apply invalid screen resolution: {resolution}");
			}
		}
	}
}
