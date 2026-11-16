using System.Collections.Generic;
using PrimeInputActions;
using ProTrans;
using SimpleHttpServerForUnity;
using UniInject;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UIElements;

public class CommonSceneObjectsBinder : MonoBehaviour, IBinder
{
	public List<UniInject.IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(ApplicationManager.Instance);
		bindingBuilder.BindExistingInstance(SceneNavigator.Instance);
		bindingBuilder.BindExistingInstance(SettingsManager.Instance);
		bindingBuilder.BindExistingInstance(SongMetaManager.Instance);
		bindingBuilder.BindExistingInstance(CursorManager.Instance);
		bindingBuilder.BindExistingInstance(UiManager.Instance);
		bindingBuilder.BindExistingInstance(MidiManager.Instance);
		bindingBuilder.BindExistingInstance(AudioManager.Instance);
		bindingBuilder.BindExistingInstance(TranslationManager.Instance);
		bindingBuilder.BindExistingInstance(ContextMenuPopupManager.Instance);
		bindingBuilder.BindExistingInstance(WebCamManager.Instance);
		bindingBuilder.BindExistingInstance(PlaylistManager.Instance);
		bindingBuilder.BindExistingInstance(StatsManager.Instance);
		bindingBuilder.BindExistingInstance(InputManager.Instance);
		bindingBuilder.BindExistingInstance(BackgroundMusicManager.Instance);
		bindingBuilder.BindExistingInstance(InGameDebugConsoleManager.Instance);
		bindingBuilder.BindExistingInstance(UltraStarPlaySceneChangeAnimationControl.Instance);
		bindingBuilder.BindExistingInstance(ThemeManager.Instance);
		bindingBuilder.Bind(typeof(UltraStarPlayInputManager)).ToExistingInstance(InputManager.Instance);
		bindingBuilder.BindExistingInstance(HttpServer.Instance);
		bindingBuilder.Bind(typeof(IServerSideConnectRequestManager)).ToExistingInstance(ServerSideConnectRequestManager.Instance);
		bindingBuilder.BindExistingInstance(ServerSideConnectRequestManager.Instance);
		EventSystem instance = GameObjectUtils.FindComponentWithTag<EventSystem>("EventSystem");
		bindingBuilder.BindExistingInstance(instance);
		bindingBuilder.BindExistingInstanceLazy(() => GetUiDocument());
		bindingBuilder.BindExistingInstanceLazy(() => new PanelHelper(GetUiDocument()));
		bindingBuilder.Bind(typeof(ISettings)).ToExistingInstance(() => SettingsManager.Instance.Settings);
		bindingBuilder.BindExistingInstanceLazy(() => SettingsManager.Instance.Settings);
		bindingBuilder.BindExistingInstanceLazy(() => StatsManager.Instance.Statistics);
		return bindingBuilder.GetBindings();
	}

	private static UIDocument GetUiDocument()
	{
		GameObject gameObject = GameObject.FindWithTag("UIDocument");
		if (gameObject != null)
		{
			return gameObject.GetComponent<UIDocument>();
		}
		return null;
	}
}
