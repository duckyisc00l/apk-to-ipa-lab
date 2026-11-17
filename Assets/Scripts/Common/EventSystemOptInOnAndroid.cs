using UniInject;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem.UI;

public class EventSystemOptInOnAndroid : MonoBehaviour, INeedInjection
{
	private static bool loggedMessage;

	[Inject]
	private Settings settings;

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren, Optional = true)]
	private EventSystem eventSystem;

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren, Optional = true)]
	private InputSystemUIInputModule inputSystemUiInputModule;

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		loggedMessage = false;
	}

	private void Start()
	{
		if (PlatformUtils.IsAndroid && !settings.DeveloperSettings.enableEventSystemOnAndroid)
		{
			if (!loggedMessage)
			{
				loggedMessage = true;
				Debug.Log("Disable custom event system on Android.");
			}
			if (eventSystem != null)
			{
				eventSystem.enabled = false;
				eventSystem.gameObject.SetActive(value: false);
			}
			if (inputSystemUiInputModule != null)
			{
				inputSystemUiInputModule.enabled = false;
				inputSystemUiInputModule.gameObject.SetActive(value: false);
			}
		}
	}
}
