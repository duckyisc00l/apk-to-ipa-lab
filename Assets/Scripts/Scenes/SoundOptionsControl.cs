using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class SoundOptionsControl : MonoBehaviour, INeedInjection, ITranslator
{
	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject]
	private UIDocument uiDoc;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "backgroundMusicVolumeLabel")]
	private Label backgroundMusicVolumeLabel;

	[Inject(UxmlName = "backgroundMusicVolumeChooser")]
	private ItemPicker backgroundMusicVolumeChooser;

	[Inject(UxmlName = "previewVolumeLabel")]
	private Label previewVolumeLabel;

	[Inject(UxmlName = "previewVolumeChooser")]
	private ItemPicker previewVolumeChooser;

	[Inject(UxmlName = "volumeLabel")]
	private Label volumeLabel;

	[Inject(UxmlName = "volumeChooser")]
	private ItemPicker volumeChooser;

	[Inject(UxmlName = "animateSceneChangeVolumePicker")]
	private ItemPicker animateSceneChangeVolumePicker;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject]
	private Settings settings;

	private void Start()
	{
		new PercentNumberPickerControl(backgroundMusicVolumeChooser).Bind(() => settings.AudioSettings.BackgroundMusicVolumePercent, (double newValue) =>
		{
			settings.AudioSettings.BackgroundMusicVolumePercent = (int)newValue;
		});
		new PercentNumberPickerControl(previewVolumeChooser).Bind(() => settings.AudioSettings.PreviewVolumePercent, (double newValue) =>
		{
			settings.AudioSettings.PreviewVolumePercent = (int)newValue;
		});
		new PercentNumberPickerControl(volumeChooser).Bind(() => settings.AudioSettings.VolumePercent, (double newValue) =>
		{
			settings.AudioSettings.VolumePercent = (int)newValue;
		});
		new PercentNumberPickerControl(animateSceneChangeVolumePicker).Bind(() => settings.AudioSettings.SceneChangeSoundVolumePercent, (double newValue) =>
		{
			settings.AudioSettings.SceneChangeSoundVolumePercent = (int)newValue;
		});
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.OptionsScene);
		});
		backButton.Focus();
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			sceneNavigator.LoadScene(EScene.OptionsScene);
		});
	}

	public void UpdateTranslation()
	{
		backgroundMusicVolumeLabel.text = TranslationManager.GetTranslation(R.Messages.options_backgroundMusicEnabled);
		previewVolumeLabel.text = TranslationManager.GetTranslation(R.Messages.options_previewVolume);
		volumeLabel.text = TranslationManager.GetTranslation(R.Messages.options_volume);
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_sound_title);
	}
}
