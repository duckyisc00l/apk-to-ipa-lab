using IngameDebugConsole;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem.UI;
using UnityEngine.UI;

public class InGameDebugConsoleManager : AbstractSingletonBehaviour, INeedInjection
{
	public bool hideDebugLogPopup;

	[Inject]
	private SceneNavigator sceneNavigator;

	private DebugLogManager debugLogManager;

	private DebugLogPopup debugLogPopup;

	private EventSystem debugLogEventSystem;

	private bool oldIsLogWindowVisible;

	public static InGameDebugConsoleManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<InGameDebugConsoleManager>();

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void AwakeSingleton()
	{
		debugLogManager = Object.FindObjectOfType<DebugLogManager>(includeInactive: true);
		debugLogPopup = debugLogManager.GetComponentInChildren<DebugLogPopup>(includeInactive: true);
		debugLogEventSystem = debugLogManager.GetComponentInChildren<EventSystem>(includeInactive: true);
		UpdateDebugLogPopupVisible();
	}

	protected override void StartSingleton()
	{
		AddDebugLogConsoleCommands();
		sceneNavigator.SceneChangedEventStream.Subscribe((SceneChangedEvent _) =>
		{
			StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(1, () =>
			{
				if (debugLogManager.IsLogWindowVisible)
				{
					EnableInGameDebugConsoleEventSystemIfNeeded();
				}
			}));
			UpdateDebugLogPopupVisible();
		});
	}

	private void AddDebugLogConsoleCommands()
	{
		DebugLogConsole.AddCommand("logs.path", "Show path to log file", () =>
		{
			Debug.Log("Log file path: " + ApplicationUtils.ReplacePathsWithDisplayString(Log.logFilePath));
		});
	}

	private void Update()
	{
		if (debugLogManager.IsLogWindowVisible && !oldIsLogWindowVisible)
		{
			EnableInGameDebugConsoleEventSystemIfNeeded();
			UpdateDebugLogPopupVisible();
		}
		else if (!debugLogManager.IsLogWindowVisible && oldIsLogWindowVisible)
		{
			DisableInGameDebugConsoleEventSystem();
			UpdateDebugLogPopupVisible();
		}
		oldIsLogWindowVisible = debugLogManager.IsLogWindowVisible;
	}

	private void UpdateDebugLogPopupVisible()
	{
		if (hideDebugLogPopup || !Application.isEditor)
		{
			debugLogPopup.GetComponentsInChildren<Image>().ForEach((Image image) =>
			{
				image.enabled = false;
			});
			debugLogPopup.GetComponentsInChildren<Text>().ForEach((Text text) =>
			{
				text.enabled = false;
			});
		}
	}

	private void EnableInGameDebugConsoleEventSystemIfNeeded()
	{
		if (!Object.FindObjectOfType<InputSystemUIInputModule>(includeInactive: true).GetComponentInChildren<EventSystem>(includeInactive: true).gameObject.activeInHierarchy)
		{
			debugLogEventSystem.gameObject.SetActive(value: true);
		}
	}

	private void DisableInGameDebugConsoleEventSystem()
	{
		debugLogEventSystem.gameObject.SetActive(value: false);
	}

	public void ShowConsole()
	{
		debugLogManager.ShowLogWindow();
	}
}
