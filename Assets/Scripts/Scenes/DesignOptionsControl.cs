using System.Collections.Generic;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class DesignOptionsControl : MonoBehaviour, INeedInjection, ITranslator
{
	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject]
	private ThemeManager themeManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "themeContainer")]
	private VisualElement themeContainer;

	[Inject(UxmlName = "noteDisplayModeContainer")]
	private VisualElement noteDisplayModeContainer;

	[Inject(UxmlName = "lyricsOnNotesContainer")]
	private VisualElement lyricsOnNotesContainer;

	[Inject(UxmlName = "staticLyricsContainer")]
	private VisualElement staticLyricsContainer;

	[Inject(UxmlName = "pitchIndicatorContainer")]
	private VisualElement pitchIndicatorContainer;

	[Inject(UxmlName = "imageAsCursorContainer")]
	private VisualElement imageAsCursorContainer;

	[Inject(UxmlName = "animateSceneChangeContainer")]
	private VisualElement animateSceneChangeContainer;

	[Inject(UxmlName = "helpButton")]
	private Button helpButton;

	[Inject]
	private Settings settings;

	[Inject]
	private UiManager uiManager;

	private MessageDialogControl helpDialogControl;

	private void Start()
	{
		new NoteDisplayModeItemPickerControl(noteDisplayModeContainer.Q<ItemPicker>()).Bind(() => settings.GraphicSettings.noteDisplayMode, (ENoteDisplayMode newValue) =>
		{
			settings.GraphicSettings.noteDisplayMode = newValue;
		});
		new BoolPickerControl(lyricsOnNotesContainer.Q<ItemPicker>()).Bind(() => settings.GraphicSettings.showLyricsOnNotes, (bool newValue) =>
		{
			settings.GraphicSettings.showLyricsOnNotes = newValue;
		});
		new BoolPickerControl(staticLyricsContainer.Q<ItemPicker>()).Bind(() => settings.GraphicSettings.showStaticLyrics, (bool newValue) =>
		{
			settings.GraphicSettings.showStaticLyrics = newValue;
		});
		new BoolPickerControl(pitchIndicatorContainer.Q<ItemPicker>()).Bind(() => settings.GraphicSettings.showPitchIndicator, (bool newValue) =>
		{
			settings.GraphicSettings.showPitchIndicator = newValue;
		});
		new BoolPickerControl(imageAsCursorContainer.Q<ItemPicker>()).Bind(() => settings.GraphicSettings.useImageAsCursor, (bool newValue) =>
		{
			settings.GraphicSettings.useImageAsCursor = newValue;
		});
		new BoolPickerControl(animateSceneChangeContainer.Q<ItemPicker>()).Bind(() => settings.GraphicSettings.AnimateSceneChange, (bool newValue) =>
		{
			settings.GraphicSettings.AnimateSceneChange = newValue;
		});
		List<ThemeMeta> themeMetas = themeManager.GetThemeMetas();
		LabeledItemPickerControl<ThemeMeta> labeledItemPickerControl = new LabeledItemPickerControl<ThemeMeta>(themeContainer.Q<ItemPicker>(), themeMetas);
		labeledItemPickerControl.GetLabelTextFunction = (ThemeMeta themeMeta) => ThemeMetaUtils.GetDisplayName(themeMeta);
		labeledItemPickerControl.Bind(() => themeManager.GetCurrentTheme(), (ThemeMeta newValue) =>
		{
			themeManager.SetCurrentTheme(newValue);
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
		themeContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_design_theme);
		noteDisplayModeContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_noteDisplayMode);
		staticLyricsContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_showStaticLyrics);
		lyricsOnNotesContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_showLyricsOnNotes);
		pitchIndicatorContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_showPitchIndicator);
		imageAsCursorContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_useImageAsCursor);
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_design_title);
	}

	private void ShowHelp()
	{
		if (helpDialogControl == null)
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			dictionary.Add(TranslationManager.GetTranslation(R.Messages.options_design_helpDialog_customThemes_title), TranslationManager.GetTranslation(R.Messages.options_design_helpDialog_customThemes, "path", ApplicationUtils.ReplacePathsWithDisplayString(ThemeManager.GetAbsoluteUserDefinedThemesFolder())));
			Dictionary<string, string> titleToContentMap = dictionary;
			helpDialogControl = uiManager.CreateHelpDialogControl(TranslationManager.GetTranslation(R.Messages.options_design_helpDialog_title), titleToContentMap, CloseHelp);
			helpDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.viewMore), () =>
			{
				Application.OpenURL(TranslationManager.GetTranslation(R.Messages.uri_howToAddCustomThemes));
			});
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
