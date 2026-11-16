using System.Collections.Generic;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class CreditsSceneControl : MonoBehaviour, INeedInjection, ITranslator, IBinder
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
			sceneNavigator.LoadScene(EScene.MainScene);
		});
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			sceneNavigator.LoadScene(EScene.MainScene);
		});
		backButton.Focus();
	}

	public void UpdateTranslation()
	{
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.aboutScene_title);
	}

	public List<UniInject.IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(this);
		bindingBuilder.BindExistingInstance(base.gameObject);
		return bindingBuilder.GetBindings();
	}
}
