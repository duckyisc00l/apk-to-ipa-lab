using System.Collections.Generic;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class PlayerProfileOptionsSceneControl : MonoBehaviour, INeedInjection, ITranslator
{
	[InjectedInInspector]
	public VisualTreeAsset playerProfileListEntryAsset;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "profileList")]
	private ScrollView profileList;

	[Inject(UxmlName = "addButton")]
	private Button addButton;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "helpButton")]
	private Button helpButton;

	private MessageDialogControl helpDialogControl;

	[Inject]
	private Settings settings;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private WebCamManager webCamManager;

	[Inject]
	private ThemeManager themeManager;

	private void Start()
	{
		UpdatePlayerProfileList();
		settings.ObserveEveryValueChanged((Settings s) => s.PlayerProfiles).Subscribe((List<PlayerProfile> onNext) =>
		{
			UpdatePlayerProfileList();
		}).AddTo(base.gameObject);
		addButton.RegisterCallbackButtonTriggered(() =>
		{
			settings.PlayerProfiles.Add(new PlayerProfile());
			UpdatePlayerProfileList();
			profileList[profileList.childCount - 1].Q<TextField>("nameTextField").Focus();
		});
		helpButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowHelp();
		});
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			OnBack();
		});
		backButton.Focus();
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			OnBack();
		});
	}

	private void OnBack()
	{
		if (helpDialogControl != null)
		{
			CloseHelp();
		}
		else
		{
			sceneNavigator.LoadScene(EScene.OptionsScene);
		}
	}

	public void UpdateTranslation()
	{
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_playerProfiles_title);
	}

	private void UpdatePlayerProfileList()
	{
		profileList.Clear();
		int index = 0;
		settings.PlayerProfiles.ForEach((PlayerProfile playerProfile) =>
		{
			profileList.Add(CreatePlayerProfileEntry(playerProfile, index));
			index++;
		});
		themeManager.ApplyThemeSpecificStylesToVisualElementsInScene();
	}

	private VisualElement CreatePlayerProfileEntry(PlayerProfile playerProfile, int indexInList)
	{
		TemplateContainer templateContainer = playerProfileListEntryAsset.CloneTree();
		templateContainer.Q<Button>("deleteButton").RegisterCallbackButtonTriggered(() =>
		{
			settings.PlayerProfiles.RemoveAt(indexInList);
			UpdatePlayerProfileList();
			backButton.Focus();
		});
		TextField textField = templateContainer.Q<TextField>("nameTextField");
		textField.value = playerProfile.Name;
		textField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			playerProfile.Name = evt.newValue;
		});
		Toggle toggle = templateContainer.Q<Toggle>("enabledToggle");
		toggle.value = playerProfile.IsEnabled;
		toggle.RegisterValueChangedCallback((ChangeEvent<bool> evt) =>
		{
			playerProfile.IsEnabled = evt.newValue;
		});
		templateContainer.Q<Label>("enabledLabel").text = TranslationManager.GetTranslation(R.Messages.active);
		new PlayerProfileImagePickerControl(templateContainer.Q<ItemPicker>("playerProfileImagePicker"), indexInList, uiManager, webCamManager).Bind(() => playerProfile.ImagePath, (string newValue) =>
		{
			playerProfile.ImagePath = newValue;
		});
		new DifficultyPicker(templateContainer.Q<ItemPicker>("difficultyPicker")).Bind(() => playerProfile.Difficulty, (EDifficulty newValue) =>
		{
			playerProfile.Difficulty = newValue;
		});
		return templateContainer;
	}

	private void ShowHelp()
	{
		if (helpDialogControl == null)
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			dictionary.Add(TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_activateProfile_title), TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_activateProfile));
			dictionary.Add(TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_difficulty_title), TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_difficulty));
			dictionary.Add(TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_webcamProfileImages_title), TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_webcamProfileImages));
			dictionary.Add(TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_customProfileImages_title), TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_customProfileImages, "path", ApplicationUtils.ReplacePathsWithDisplayString(PlayerProfileUtils.GetAbsolutePlayerProfileImagesFolder())));
			Dictionary<string, string> titleToContentMap = dictionary;
			helpDialogControl = uiManager.CreateHelpDialogControl(TranslationManager.GetTranslation(R.Messages.options_playerProfiles_helpDialog_title), titleToContentMap, CloseHelp);
		}
	}

	private void CloseHelp()
	{
		if (helpDialogControl != null)
		{
			helpDialogControl.CloseDialog();
			helpDialogControl = null;
			helpButton.Focus();
		}
	}
}
