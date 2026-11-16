using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class CompanionAppOptionsControl : MonoBehaviour, INeedInjection, ITranslator
{
	[InjectedInInspector]
	public VisualTreeAsset connectedClientListEntryAsset;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "connectedClientCountLabel")]
	private Label connectedClientCountLabel;

	[Inject(UxmlName = "connectedClientList")]
	private ScrollView connectedClientList;

	[Inject]
	private Settings settings;

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	private void Start()
	{
		UpdateConnectedClients();
		serverSideConnectRequestManager.ClientConnectedEventStream.Subscribe((ClientConnectionEvent _) =>
		{
			UpdateConnectedClients();
		}).AddTo(base.gameObject);
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
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_companionApp_title);
	}

	private void UpdateConnectedClients()
	{
		connectedClientList.Clear();
		serverSideConnectRequestManager.GetAllConnectedClientHandlers().ForEach((IConnectedClientHandler clientHandler) =>
		{
			connectedClientList.Add(CreateClientEntry(clientHandler));
		});
		connectedClientCountLabel.text = TranslationManager.GetTranslation(R.Messages.options_connectedClientCount, "count", ServerSideConnectRequestManager.ConnectedClientCount);
	}

	private VisualElement CreateClientEntry(IConnectedClientHandler clientHandler)
	{
		TemplateContainer templateContainer = connectedClientListEntryAsset.CloneTree();
		templateContainer.Q<Label>("nameLabel").text = clientHandler.ClientName;
		return templateContainer;
	}
}
