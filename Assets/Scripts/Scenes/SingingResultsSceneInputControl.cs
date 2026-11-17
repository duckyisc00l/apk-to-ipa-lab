using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

public class SingingResultsSceneInputControl : MonoBehaviour, INeedInjection
{
	[Inject]
	private SingingResultsSceneControl singingResultsSceneControl;

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
			singingResultsSceneControl.FinishScene();
		});
		InputManager.GetInputAction(R.InputActions.usplay_start).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			singingResultsSceneControl.FinishScene();
		});
		InputManager.GetInputAction(R.InputActions.usplay_space).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			singingResultsSceneControl.FinishScene();
		});
		InputManager.GetInputAction(R.InputActions.ui_submit).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			singingResultsSceneControl.FinishScene();
		});
	}
}
