using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;

public class GlobalInputControl : MonoBehaviour, INeedInjection
{
	private static int volumeBeforeMute = -1;

	[Inject]
	private Settings settings;

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		volumeBeforeMute = -1;
	}

	protected void Start()
	{
		InputManager.GetInputAction(R.InputActions.usplay_toggleFullscreen).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			ToggleFullscreen();
		});
		InputManager.GetInputAction(R.InputActions.usplay_toggleMute).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			ToggleMuteAudio();
		});
	}

	private void ToggleFullscreen()
	{
		Debug.Log("Toggle full-screen mode");
		Screen.fullScreen = !Screen.fullScreen;
		StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(2, () =>
		{
			settings.GraphicSettings.fullScreenMode = Screen.fullScreenMode;
			Debug.Log("New full-screen mode " + settings.GraphicSettings.fullScreenMode);
		}));
	}

	public void ToggleMuteAudio()
	{
		if (volumeBeforeMute >= 0)
		{
			settings.AudioSettings.VolumePercent = volumeBeforeMute;
			volumeBeforeMute = -1;
			UiManager.CreateNotification("Unmute");
		}
		else
		{
			volumeBeforeMute = settings.AudioSettings.VolumePercent;
			settings.AudioSettings.VolumePercent = 0;
			UiManager.CreateNotification("Mute");
		}
	}
}
