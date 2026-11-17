using System.Collections;
using System.Collections.Generic;
using PrimeInputActions;
using ProTrans;
using Serilog.Events;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class LoadingSceneControl : MonoBehaviour, INeedInjection
{
	[Inject(UxmlName = "unexpectedErrorLabel")]
	private Label unexpectedErrorLabel;

	[Inject(UxmlName = "unexpectedErrorContainer")]
	private VisualElement unexpectedErrorContainer;

	[Inject(UxmlName = "viewMoreButton")]
	private Button viewMoreButton;

	[Inject(UxmlName = "copyLogButton")]
	private Button copyLogButton;

	[Inject(UxmlName = "hiddenContinueButton")]
	private Button hiddenContinueButton;

	private void Start()
	{
		unexpectedErrorContainer.HideByDisplay();
		StartCoroutine(CoroutineUtils.ExecuteAfterDelayInSeconds(8f, () =>
		{
			ShowGeneralErrorMessage();
		}));
		Settings settings = SettingsManager.Instance.Settings;
		string text = JsonConverter.ToJson(settings);
		Log.Logger.Information("loaded settings:" + text);
		if (settings.GameSettings.songDirs.IsNullOrEmpty())
		{
			settings.GameSettings.songDirs = CreateInitialSongFolders();
		}
		InputManager.GetInputAction(R.InputActions.ui_submit).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			StartCoroutine(FinishAfterDelay());
		});
		InputManager.GetInputAction(R.InputActions.usplay_start).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			StartCoroutine(FinishAfterDelay());
		});
		InputManager.GetInputAction(R.InputActions.ui_click).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			StartCoroutine(FinishAfterDelay());
		});
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			StartCoroutine(FinishAfterDelay());
		});
		InputManager.GetInputAction(R.InputActions.usplay_enter).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			StartCoroutine(FinishAfterDelay());
		});
		hiddenContinueButton.RegisterCallbackButtonTriggered(() =>
		{
			StartCoroutine(FinishAfterDelay());
		});
		Screen.sleepTimeout = 0;
		Screen.sleepTimeout = -1;
		SongMetaManager.Instance.ScanFilesIfNotDoneYet();
		Log.Logger.Information("started loading songs.");
		AndroidStreamingAssets.Extract();
		TranslationManager.Instance.ReloadTranslationsAndUpdateScene();
		if (PlatformUtils.IsAndroid)
		{
			if (AndroidRuntimePermissions.CheckPermission("android.permission.RECORD_AUDIO") == AndroidRuntimePermissions.Permission.ShouldAsk)
			{
				AndroidRuntimePermissions.RequestPermission("android.permission.RECORD_AUDIO");
			}
			if (AndroidRuntimePermissions.CheckPermission("android.permission.CAMERA") == AndroidRuntimePermissions.Permission.ShouldAsk)
			{
				AndroidRuntimePermissions.RequestPermission("android.permission.CAMERA");
			}
		}
		FinishScene();
	}

	private void ShowGeneralErrorMessage()
	{
		Debug.LogWarning("Showing general error message in loading scene. Probably something went wrong.");
		unexpectedErrorContainer.ShowByDisplay();
		unexpectedErrorLabel.text = TranslationManager.GetTranslation(R.Messages.loadingScene_unexpectedErrorMessage, "path", ApplicationUtils.ReplacePathsWithDisplayString(Log.logFilePath));
		viewMoreButton.text = TranslationManager.GetTranslation(R.Messages.viewMore);
		viewMoreButton.RegisterCallbackButtonTriggered(() =>
		{
			Application.OpenURL(TranslationManager.GetTranslation(R.Messages.uri_logFiles));
		});
		copyLogButton.RegisterCallbackButtonTriggered(() =>
		{
			ClipboardUtils.CopyToClipboard(Log.GetLogText(LogEventLevel.Verbose));
			UiManager.CreateNotification("Copied log to clipboard");
		});
	}

	private void FinishScene()
	{
		SceneNavigator.Instance.LoadScene(EScene.MainScene);
	}

	private IEnumerator FinishAfterDelay()
	{
		yield return new WaitForSeconds(1f);
		FinishScene();
	}

	private List<string> CreateInitialSongFolders()
	{
		List<string> list = new List<string>();
		string appSpecificStorageAbsolutePath = AndroidUtils.GetAppSpecificStorageAbsolutePath(sdCard: false);
		list.Add(appSpecificStorageAbsolutePath + "/Songs");
		string appSpecificStorageAbsolutePath2 = AndroidUtils.GetAppSpecificStorageAbsolutePath(sdCard: true);
		list.Add(appSpecificStorageAbsolutePath2 + "/Songs");
		return list;
	}
}
