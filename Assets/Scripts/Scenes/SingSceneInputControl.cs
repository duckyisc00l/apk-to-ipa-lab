using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;

public class SingSceneInputControl : MonoBehaviour, INeedInjection
{
	[Inject]
	private SingSceneControl singSceneControl;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	private void Start()
	{
		InputManager.GetInputAction(R.InputActions.usplay_skipToNextLyrics).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			singSceneControl.SkipToNextSingableNote();
		});
		(from context in InputManager.GetInputAction(R.InputActions.ui_navigate).PerformedAsObservable()
			where context.ReadValue<Vector2>().x > 0f
			select context).Subscribe((InputAction.CallbackContext _) =>
		{
			singSceneControl.SkipToNextSingableNote();
		});
		InputManager.GetInputAction(R.InputActions.usplay_openSongEditor).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			singSceneControl.OpenSongInEditor();
		});
		InputManager.GetInputAction(R.InputActions.usplay_restartSong).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			singSceneControl.Restart();
		});
		InputManager.GetInputAction(R.InputActions.usplay_togglePause).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			singSceneControl.TogglePlayPause();
		});
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			OnBack();
		});
	}

	private void OnBack()
	{
		if (singSceneControl.IsDialogOpen)
		{
			singSceneControl.CloseDialog();
		}
		else if (!songAudioPlayer.IsPlaying)
		{
			singSceneControl.TogglePlayPause();
		}
		else
		{
			singSceneControl.FinishScene(isAfterEndOfSong: false);
		}
	}
}
