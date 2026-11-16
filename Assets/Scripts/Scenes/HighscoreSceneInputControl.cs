using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

public class HighscoreSceneInputControl : MonoBehaviour, INeedInjection
{
	[Inject]
	private HighscoreSceneControl highscoreSceneControl;

	[Inject(Optional = true)]
	private EventSystem eventSystem;

	private void Start()
	{
		if (eventSystem != null)
		{
			eventSystem.sendNavigationEvents = false;
		}
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			highscoreSceneControl.FinishScene();
		});
		InputManager.GetInputAction(R.InputActions.usplay_start).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			highscoreSceneControl.FinishScene();
		});
		InputManager.GetInputAction(R.InputActions.usplay_space).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			highscoreSceneControl.FinishScene();
		});
		InputManager.GetInputAction(R.InputActions.ui_navigate).PerformedAsObservable().Subscribe((InputAction.CallbackContext context) =>
		{
			OnNavigate(context);
		});
		InputManager.GetInputAction(R.InputActions.ui_submit).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			highscoreSceneControl.FinishScene();
		});
	}

	private void OnNavigate(InputAction.CallbackContext context)
	{
		Vector2 vector = context.ReadValue<Vector2>();
		if (vector.x > 0f)
		{
			highscoreSceneControl.ShowNextDifficulty(1);
		}
		if (vector.x < 0f)
		{
			highscoreSceneControl.ShowNextDifficulty(-1);
		}
	}
}
