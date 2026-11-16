using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class NetworkOptionsControl : MonoBehaviour, INeedInjection, ITranslator
{
	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	private void Start()
	{
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
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_internet_title);
	}
}
