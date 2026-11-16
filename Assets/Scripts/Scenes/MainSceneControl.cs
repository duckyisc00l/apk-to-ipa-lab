using System.Collections.Generic;
using System.Linq;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class MainSceneControl : MonoBehaviour, INeedInjection, ITranslator, IBinder
{
	[InjectedInInspector]
	public TextAsset versionPropertiesTextAsset;

	[InjectedInInspector]
	public VisualTreeAsset quitGameDialogUi;

	[InjectedInInspector]
	public VisualTreeAsset newSongDialogUi;

	[InjectedInInspector]
	public CreateSongFromTemplateControl createSongFromTemplateControl;

	[InjectedInInspector]
	public NewVersionChecker newVersionChecker;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private Injector injector;

	[Inject]
	private SongMetaManager songMetaManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "sceneSubtitle")]
	private Label sceneSubtitle;

	[Inject(UxmlName = "startButton")]
	private Button startButton;

	[Inject(UxmlName = "settingsButton")]
	private Button settingsButton;

	[Inject(UxmlName = "settingsProblemHintIcon")]
	private VisualElement settingsProblemHintIcon;

	[Inject(UxmlName = "aboutButton")]
	private Button aboutButton;

	[Inject(UxmlName = "creditsButton")]
	private Button creditsButton;

	[Inject(UxmlName = "quitButton")]
	private Button quitButton;

	[Inject(UxmlName = "partyButton")]
	private Button partyButton;

	[Inject(UxmlName = "createSongButton")]
	private Button createSongButton;

	[Inject(UxmlName = "semanticVersionText")]
	private Label semanticVersionText;

	[Inject(UxmlName = "commitHashText")]
	private Label commitHashText;

	[Inject(UxmlName = "buildTimeStampText")]
	private Label buildTimeStampText;

	[Inject]
	private Settings settings;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private ThemeManager themeManager;

	private MessageDialogControl quitGameDialogControl;

	private NewSongDialogControl newSongDialogControl;

	private bool IsNewSongDialogOpen => newSongDialogControl != null;

	private bool IsQuitGameDialogOpen => quitGameDialogControl != null;

	private bool IsAnyDialogOpen
	{
		get
		{
			if (!IsNewSongDialogOpen && !IsQuitGameDialogOpen)
			{
				return newVersionChecker.IsNewVersionAvailableDialogOpen;
			}
			return true;
		}
	}

	private void Start()
	{
		startButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.SongSelectScene);
		});
		startButton.Focus();
		settingsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.OptionsScene);
		});
		aboutButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.AboutScene);
		});
		creditsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.CreditsScene);
		});
		quitButton.RegisterCallbackButtonTriggered(() =>
		{
			OpenQuitGameDialog();
		});
		createSongButton.RegisterCallbackButtonTriggered(() =>
		{
			OpenNewSongDialog();
		});
		InitButtonDescription(startButton, TranslationManager.GetTranslation(R.Messages.mainScene_button_sing_description));
		InitButtonDescription(settingsButton, TranslationManager.GetTranslation(R.Messages.mainScene_button_settings_description));
		InitButtonDescription(aboutButton, TranslationManager.GetTranslation(R.Messages.mainScene_button_about_description));
		InitButtonDescription(creditsButton, TranslationManager.GetTranslation(R.Messages.mainScene_button_credits_description));
		InitButtonDescription(quitButton, TranslationManager.GetTranslation(R.Messages.mainScene_button_quit_description));
		InitButtonDescription(createSongButton, TranslationManager.GetTranslation(R.Messages.mainScene_button_newSong_description));
		InitButtonDescription(partyButton, TranslationManager.GetTranslation(R.Messages.mainScene_button_description_noImplementation));
		UpdateVersionInfoText();
		sceneSubtitle.text = TranslationManager.GetTranslation(R.Messages.mainScene_button_sing_description);
		InitInputActions();
		songMetaManager.ScanFilesIfNotDoneYet();
		new SettingsProblemHintControl(settingsProblemHintIcon, SettingsProblemHintControl.GetAllSettingsProblems(settings, songMetaManager), injector);
	}

	private void InitInputActions()
	{
		InputManager.GetInputAction(R.InputActions.usplay_start).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			sceneNavigator.LoadScene(EScene.SongSelectScene);
		});
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			OnBack();
		});
	}

	private void InitButtonDescription(Button button, string description)
	{
		button.RegisterCallback((PointerEnterEvent _) =>
		{
			sceneSubtitle.text = description;
		});
		button.RegisterCallback((FocusEvent _) =>
		{
			sceneSubtitle.text = description;
		});
	}

	public void UpdateTranslation()
	{
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.mainScene_title);
		startButton.text = TranslationManager.GetTranslation(R.Messages.mainScene_button_sing_label);
		partyButton.text = TranslationManager.GetTranslation(R.Messages.mainScene_button_party_label);
		createSongButton.text = TranslationManager.GetTranslation(R.Messages.mainScene_button_newSong_label);
		settingsButton.text = TranslationManager.GetTranslation(R.Messages.mainScene_button_settings_label);
		quitButton.text = TranslationManager.GetTranslation(R.Messages.mainScene_button_quit_label);
	}

	private void UpdateVersionInfoText()
	{
		Dictionary<string, string> dictionary = PropertiesFileParser.ParseText(versionPropertiesTextAsset.text);
		dictionary.TryGetValue("release", out var value);
		dictionary.TryGetValue("name", out var value2);
		string text = (value2.IsNullOrEmpty() ? value : value2);
		semanticVersionText.text = "Version: " + text;
		dictionary.TryGetValue("commit_hash", out var value3);
		commitHashText.text = "Commit: " + value3;
		if (Debug.isDebugBuild)
		{
			dictionary.TryGetValue("build_timestamp", out var value4);
			buildTimeStampText.text = "Build timestamp: " + value4;
		}
		else
		{
			buildTimeStampText.text = "";
			buildTimeStampText.HideByDisplay();
		}
	}

	public void CloseQuitGameDialog()
	{
		if (quitGameDialogControl != null)
		{
			quitGameDialogControl.CloseDialog();
			quitGameDialogControl = null;
			StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(1, () =>
			{
				quitButton.Focus();
			}));
		}
	}

	public void OpenQuitGameDialog()
	{
		if (quitGameDialogControl == null)
		{
			VisualElement visualElement = quitGameDialogUi.CloneTree().Children().FirstOrDefault();
			uiDocument.rootVisualElement.Add(visualElement);
			quitGameDialogControl = injector.WithRootVisualElement(visualElement).CreateAndInject<MessageDialogControl>();
			quitGameDialogControl.Title = TranslationManager.GetTranslation(R.Messages.mainScene_quitDialog_title);
			quitGameDialogControl.Message = "\n" + TranslationManager.GetTranslation(R.Messages.mainScene_quitDialog_message) + "\n";
			quitGameDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.no), () =>
			{
				CloseQuitGameDialog();
			});
			quitGameDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.yes), () =>
			{
				ApplicationUtils.QuitOrStopPlayMode();
			}).Focus();
			themeManager.ApplyThemeSpecificStylesToVisualElementsInScene();
		}
	}

	public void OpenNewSongDialog()
	{
		if (newSongDialogControl == null)
		{
			VisualElement visualElement = newSongDialogUi.CloneTree().Children().FirstOrDefault();
			uiDocument.rootVisualElement.Add(visualElement);
			themeManager.ApplyThemeSpecificStylesToVisualElementsInScene();
			newSongDialogControl = injector.WithRootVisualElement(visualElement).CreateAndInject<NewSongDialogControl>();
			newSongDialogControl.DialogClosedEventStream.Subscribe((bool _) =>
			{
				newSongDialogControl = null;
				createSongButton.Focus();
			});
			themeManager.ApplyThemeSpecificStylesToVisualElementsInScene();
		}
	}

	public void CloseNewSongDialog()
	{
		if (newSongDialogControl != null)
		{
			newSongDialogControl.CloseDialog();
			newSongDialogControl = null;
		}
	}

	public List<UniInject.IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(createSongFromTemplateControl);
		bindingBuilder.BindExistingInstance(base.gameObject);
		bindingBuilder.BindExistingInstance(this);
		return bindingBuilder.GetBindings();
	}

	private void OnBack()
	{
		if (IsNewSongDialogOpen)
		{
			CloseNewSongDialog();
		}
		else if (IsQuitGameDialogOpen)
		{
			CloseQuitGameDialog();
		}
		else if (newVersionChecker.IsNewVersionAvailableDialogOpen)
		{
			newVersionChecker.CloseNewVersionAvailableDialog();
		}
		else
		{
			OpenQuitGameDialog();
		}
	}
}
