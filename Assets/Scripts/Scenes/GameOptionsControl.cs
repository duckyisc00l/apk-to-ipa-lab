using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class GameOptionsControl : MonoBehaviour, INeedInjection, ITranslator
{
	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "scoreModeContainer")]
	private VisualElement scoreModeContainer;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject]
	private Settings settings;

	private void Start()
	{
		new ScoreModeItemPickerControl(scoreModeContainer.Q<ItemPicker>()).Bind(() => settings.GameSettings.ScoreMode, (EScoreMode newValue) =>
		{
			settings.GameSettings.ScoreMode = newValue;
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
		scoreModeContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_scoreMode);
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_game_title);
	}
}
