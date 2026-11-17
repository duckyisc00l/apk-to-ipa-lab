using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class OptionsOverviewSceneControl : MonoBehaviour, INeedInjection, ITranslator
{
	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "gameOptionsButton")]
	private Button gameOptionsButton;

	[Inject(UxmlName = "songsOptionsButton")]
	private Button songsOptionsButton;

	[Inject(UxmlName = "graphicsOptionsButton")]
	private Button graphicsOptionsButton;

	[Inject(UxmlName = "soundOptionsButton")]
	private Button soundOptionsButton;

	[Inject(UxmlName = "recordingOptionsButton")]
	private Button recordingOptionsButton;

	[Inject(UxmlName = "profileOptionsButton")]
	private Button profileOptionsButton;

	[Inject(UxmlName = "designOptionsButton")]
	private Button designOptionsButton;

	[Inject(UxmlName = "internetOptionsButton")]
	private Button internetOptionsButton;

	[Inject(UxmlName = "appOptionsButton")]
	private Button appOptionsButton;

	[Inject(UxmlName = "developerOptionsButton")]
	private Button developerOptionsButton;

	[Inject(UxmlName = "webcamOptionsButton")]
	private Button webcamOptionsButton;

	[Inject(UxmlName = "languageChooser")]
	private ItemPicker languageChooser;

	[Inject(UxmlName = "songSettingsProblemHintIcon")]
	private VisualElement songSettingsProblemHintIcon;

	[Inject(UxmlName = "recordingSettingsProblemHintIcon")]
	private VisualElement recordingSettingsProblemHintIcon;

	[Inject(UxmlName = "playerProfileSettingsProblemHintIcon")]
	private VisualElement playerProfileSettingsProblemHintIcon;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMetaManager songMetaManager;

	[Inject]
	private UIDocument uiDoc;

	[Inject]
	private Injector injector;

	private void Start()
	{
		gameOptionsButton.Focus();
		gameOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.OptionsGameScene);
		});
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.MainScene);
		});
		songsOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.SongLibraryOptionsScene);
		});
		graphicsOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.OptionsGraphicsScene);
		});
		soundOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.OptionsSoundScene);
		});
		recordingOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.RecordingOptionsScene);
		});
		profileOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.PlayerProfileSetupScene);
		});
		designOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.ThemeOptionsScene);
		});
		internetOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.NetworkOptionsScene);
		});
		appOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.CompanionAppOptionsScene);
		});
		developerOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.DevelopmentOptionsScene);
		});
		webcamOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.WebcamOptionsSecene);
		});
		InitSettingsProblemHints();
		InitLanguageChooser();
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			sceneNavigator.LoadScene(EScene.MainScene);
		});
	}

	private void InitSettingsProblemHints()
	{
		new SettingsProblemHintControl(songSettingsProblemHintIcon, SettingsProblemHintControl.GetSongLibrarySettingsProblems(settings, songMetaManager), injector);
		new SettingsProblemHintControl(recordingSettingsProblemHintIcon, SettingsProblemHintControl.GetRecordingSettingsProblems(settings), injector);
		new SettingsProblemHintControl(playerProfileSettingsProblemHintIcon, SettingsProblemHintControl.GetPlayerSettingsProblems(settings), injector);
	}

	private void InitLanguageChooser()
	{
		new LabeledItemPickerControl<SystemLanguage>(languageChooser, translationManager.GetTranslatedLanguages()).Bind(() => translationManager.currentLanguage, (SystemLanguage newValue) =>
		{
			SetLanguage(newValue);
		});
	}

	public void UpdateTranslation()
	{
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options);
		backButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.back);
		gameOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_game_button);
		songsOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_songLibrary_button);
		soundOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_sound_button);
		graphicsOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_graphics_button);
		recordingOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_recording_button);
		profileOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_playerProfiles_button);
		designOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_design_button);
		internetOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_internet_button);
		appOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_companionApp_button);
		developerOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_development_button);
		webcamOptionsButton.Q<Label>("label").text = TranslationManager.GetTranslation(R.Messages.options_webcam_button);
	}

	private void SetLanguage(SystemLanguage newValue)
	{
		if (settings.GameSettings.language != newValue || translationManager.currentLanguage != newValue)
		{
			settings.GameSettings.language = newValue;
			translationManager.currentLanguage = settings.GameSettings.language;
			translationManager.ReloadTranslationsAndUpdateScene();
		}
	}
}
