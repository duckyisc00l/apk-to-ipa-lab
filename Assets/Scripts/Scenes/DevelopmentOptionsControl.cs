using System.Collections.Generic;
using PrimeInputActions;
using ProTrans;
using Serilog.Events;
using SimpleHttpServerForUnity;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class DevelopmentOptionsControl : MonoBehaviour, INeedInjection, ITranslator, IBinder
{
	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "showFpsContainer")]
	private VisualElement showFpsContainer;

	[Inject(UxmlName = "pitchDetectionAlgorithmContainer")]
	private VisualElement pitchDetectionAlgorithmContainer;

	[Inject(UxmlName = "analyzeBeatsWithoutTargetNoteContainer")]
	private VisualElement analyzeBeatsWithoutTargetNoteContainer;

	[Inject(UxmlName = "disableDynamicThemesContainer")]
	private VisualElement disableDynamicThemesContainer;

	[Inject(UxmlName = "customEventSystemOptInOnAndroidContainer")]
	private VisualElement customEventSystemOptInOnAndroidContainer;

	[Inject(UxmlName = "useUniversalCharsetDetectorContainer")]
	private VisualElement useUniversalCharsetDetectorContainer;

	[Inject(UxmlName = "ipAddressLabel")]
	private Label ipAddressLabel;

	[Inject(UxmlName = "httpServerPortLabel")]
	private Label httpServerPortLabel;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "showLogButton")]
	private Button showLogButton;

	[Inject(UxmlName = "copyLogButton")]
	private Button copyLogButton;

	[Inject]
	private Settings settings;

	[Inject]
	private ThemeManager themeManager;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private Injector injector;

	[Inject]
	private HttpServer httpServer;

	[Inject]
	private InGameDebugConsoleManager inGameDebugConsoleManager;

	private NetworkConfigControl networkConfigControl;

	private void Start()
	{
		new BoolPickerControl(showFpsContainer.Q<ItemPicker>()).Bind(() => settings.DeveloperSettings.showFps, (bool newValue) =>
		{
			settings.DeveloperSettings.showFps = newValue;
		});
		new PitchDetectionAlgorithmPicker(pitchDetectionAlgorithmContainer.Q<ItemPicker>()).Bind(() => settings.AudioSettings.pitchDetectionAlgorithm, (EPitchDetectionAlgorithm newValue) =>
		{
			settings.AudioSettings.pitchDetectionAlgorithm = newValue;
		});
		new BoolPickerControl(analyzeBeatsWithoutTargetNoteContainer.Q<ItemPicker>()).Bind(() => settings.GraphicSettings.analyzeBeatsWithoutTargetNote, (bool newValue) =>
		{
			settings.GraphicSettings.analyzeBeatsWithoutTargetNote = newValue;
		});
		new BoolPickerControl(disableDynamicThemesContainer.Q<ItemPicker>()).Bind(() => settings.DeveloperSettings.disableDynamicThemes, (bool disableDynamicThemes) =>
		{
			if (disableDynamicThemes)
			{
				themeManager.SetCurrentTheme(themeManager.GetDefaultTheme());
			}
			settings.DeveloperSettings.disableDynamicThemes = disableDynamicThemes;
		});
		new BoolPickerControl(useUniversalCharsetDetectorContainer.Q<ItemPicker>()).Bind(() => settings.DeveloperSettings.useUniversalCharsetDetector, (bool newValue) =>
		{
			settings.DeveloperSettings.useUniversalCharsetDetector = newValue;
		});
		new BoolPickerControl(customEventSystemOptInOnAndroidContainer.Q<ItemPicker>()).Bind(() => settings.DeveloperSettings.enableEventSystemOnAndroid, (bool newValue) =>
		{
			if (newValue != settings.DeveloperSettings.enableEventSystemOnAndroid)
			{
				settings.DeveloperSettings.enableEventSystemOnAndroid = newValue;
				RestartScene();
			}
		});
		ipAddressLabel.text = TranslationManager.GetTranslation(R.Messages.options_ipAddress, "value", httpServer.host);
		if (HttpServer.IsSupported)
		{
			httpServerPortLabel.text = TranslationManager.GetTranslation(R.Messages.options_httpServerPortWithExampleUri, "host", httpServer.host, "port", httpServer.port);
		}
		else
		{
			httpServerPortLabel.text = TranslationManager.GetTranslation(R.Messages.options_httpServerNotSupported);
		}
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			OnBack();
		});
		showLogButton.RegisterCallbackButtonTriggered(() =>
		{
			inGameDebugConsoleManager.ShowConsole();
		});
		copyLogButton.RegisterCallbackButtonTriggered(() =>
		{
			ClipboardUtils.CopyToClipboard(Log.GetLogText(LogEventLevel.Verbose));
			UiManager.CreateNotification("Copied log to clipboard");
		});
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			OnBack();
		});
		backButton.Focus();
		networkConfigControl = injector.CreateAndInject<NetworkConfigControl>();
	}

	private void RestartScene()
	{
		sceneNavigator.LoadScene(EScene.DevelopmentOptionsScene);
	}

	private void OnBack()
	{
		sceneNavigator.LoadScene(EScene.OptionsScene);
	}

	public void UpdateTranslation()
	{
		showFpsContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_showFps);
		pitchDetectionAlgorithmContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_pitchDetectionAlgorithm);
		analyzeBeatsWithoutTargetNoteContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_analyzeBeatsWithoutTargetNote);
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_development_title);
	}

	public List<UniInject.IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(base.gameObject);
		bindingBuilder.BindExistingInstance(this);
		return bindingBuilder.GetBindings();
	}
}
