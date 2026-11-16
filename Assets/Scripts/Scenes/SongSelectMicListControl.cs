using System.Collections.Generic;
using System.Linq;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongSelectMicListControl : MonoBehaviour, INeedInjection, ITranslator
{
	[InjectedInInspector]
	public VisualTreeAsset listEntryUi;

	[InjectedInInspector]
	public MicPitchTracker micPitchTrackerPrefab;

	[Inject(UxmlName = "micScrollView")]
	private VisualElement micScrollView;

	[Inject(UxmlName = "noMicsFoundLabel")]
	private Label noMicsFoundLabel;

	[Inject]
	private Injector injector;

	[Inject]
	private Settings settings;

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	private readonly List<SongSelectMicEntryControl> listEntryControls = new List<SongSelectMicEntryControl>();

	public IReadOnlyList<SongSelectMicEntryControl> MicEntryControls => listEntryControls;

	private void Start()
	{
		micScrollView.Clear();
		UpdateListEntries();
		serverSideConnectRequestManager.ClientConnectedEventStream.Subscribe(HandleClientConnectedEvent).AddTo(base.gameObject);
	}

	private void Update()
	{
		listEntryControls.ForEach((SongSelectMicEntryControl entry) =>
		{
			entry.UpdateWaveForm();
		});
	}

	private void HandleClientConnectedEvent(ClientConnectionEvent connectionEvent)
	{
		MicProfile micProfile = settings.MicProfiles.FirstOrDefault((MicProfile it) => it.ConnectedClientId == connectionEvent.ConnectedClientHandler.ClientId);
		if (micProfile == null)
		{
			micProfile = new MicProfile(connectionEvent.ConnectedClientHandler.ClientName, connectionEvent.ConnectedClientHandler.ClientId);
			settings.MicProfiles.Add(micProfile);
		}
		SongSelectMicEntryControl songSelectMicEntryControl = listEntryControls.FirstOrDefault((SongSelectMicEntryControl listEntry) => listEntry.MicProfile != null && listEntry.MicProfile.ConnectedClientId == connectionEvent.ConnectedClientHandler.ClientId && listEntry.MicProfile.IsEnabled);
		if (connectionEvent.IsConnected && songSelectMicEntryControl == null && micProfile.IsEnabled)
		{
			CreateListEntry(micProfile);
			noMicsFoundLabel.HideByDisplay();
		}
		else if (!connectionEvent.IsConnected && songSelectMicEntryControl != null)
		{
			RemoveListEntry(songSelectMicEntryControl);
		}
	}

	private void UpdateListEntries()
	{
		new List<SongSelectMicEntryControl>(listEntryControls).ForEach((SongSelectMicEntryControl entry) =>
		{
			RemoveListEntry(entry);
		});
		List<MicProfile> list = settings.MicProfiles.Where((MicProfile it) => it.IsEnabled && it.IsConnected(serverSideConnectRequestManager)).ToList();
		if (list.IsNullOrEmpty())
		{
			noMicsFoundLabel.ShowByDisplay();
			return;
		}
		noMicsFoundLabel.HideByDisplay();
		foreach (MicProfile item in list)
		{
			CreateListEntry(item);
		}
	}

	private void CreateListEntry(MicProfile micProfile)
	{
		VisualElement visualElement = listEntryUi.CloneTree().Children().FirstOrDefault();
		micScrollView.Add(visualElement);
		MicPitchTracker micPitchTracker = Object.Instantiate(micPitchTrackerPrefab, base.gameObject.transform);
		injector.InjectAllComponentsInChildren(micPitchTracker);
		micPitchTracker.MicProfile = micProfile;
		if (!micProfile.IsInputFromConnectedClient)
		{
			micPitchTracker.MicSampleRecorder.StartRecording();
		}
		SongSelectMicEntryControl songSelectMicEntryControl = new SongSelectMicEntryControl(base.gameObject, visualElement, micPitchTracker);
		injector.WithRootVisualElement(visualElement).Inject(songSelectMicEntryControl);
		songSelectMicEntryControl.MicProfile = micProfile;
		listEntryControls.Add(songSelectMicEntryControl);
	}

	private void RemoveListEntry(SongSelectMicEntryControl entryControl)
	{
		entryControl.Destroy();
		listEntryControls.Remove(entryControl);
		if (listEntryControls.IsNullOrEmpty())
		{
			noMicsFoundLabel.ShowByDisplay();
		}
	}

	public void UpdateTranslation()
	{
		noMicsFoundLabel.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_noMicsFound);
	}
}
