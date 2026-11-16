using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongSelectPlayerListControl : MonoBehaviour, INeedInjection
{
	private static Dictionary<PlayerProfile, MicProfile> lastPlayerProfileToMicProfileMap;

	[InjectedInInspector]
	public VisualTreeAsset playerEntryUi;

	[Inject(UxmlName = "playerScrollView")]
	public VisualElement playerScrollView;

	private readonly List<SongSelectPlayerEntryControl> playerEntryControls = new List<SongSelectPlayerEntryControl>();

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	[Inject]
	private Settings settings;

	[Inject]
	private Injector injector;

	[Inject]
	private SongRouletteControl songRouletteControl;

	public List<SongSelectPlayerEntryControl> PlayerEntryControlControls => playerEntryControls;

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		lastPlayerProfileToMicProfileMap = null;
	}

	private void Start()
	{
		UpdateListEntries();
		LoadLastPlayerProfileToMicProfileMap();
		serverSideConnectRequestManager.ClientConnectedEventStream.Subscribe(HandleClientConnectedEvent).AddTo(base.gameObject);
	}

	private void HandleClientConnectedEvent(ClientConnectionEvent connectionEvent)
	{
		MicProfile micProfile = settings.MicProfiles.FirstOrDefault((MicProfile it) => it.ConnectedClientId == connectionEvent.ConnectedClientHandler.ClientId);
		if (micProfile == null)
		{
			micProfile = new MicProfile(connectionEvent.ConnectedClientHandler.ClientName, connectionEvent.ConnectedClientHandler.ClientId);
			settings.MicProfiles.Add(micProfile);
		}
		if (connectionEvent.IsConnected)
		{
			UseMicProfileWhereNeeded(micProfile);
		}
		else if (!connectionEvent.IsConnected)
		{
			RemoveMicProfileFromListEntries(micProfile);
		}
	}

	private void UpdateListEntries()
	{
		playerScrollView.Clear();
		playerEntryControls.Clear();
		foreach (PlayerProfile item in settings.PlayerProfiles.Where((PlayerProfile it) => it.IsEnabled).ToList())
		{
			CreateListEntry(item);
		}
	}

	private void CreateListEntry(PlayerProfile playerProfile)
	{
		VisualElement visualElement = playerEntryUi.CloneTree().Children().FirstOrDefault();
		playerScrollView.Add(visualElement);
		SongSelectPlayerEntryControl listEntryControl = injector.WithRootVisualElement(visualElement).CreateAndInject<SongSelectPlayerEntryControl>();
		listEntryControl.Init(playerProfile);
		listEntryControl.EnabledToggle.RegisterValueChangedCallback((ChangeEvent<bool> evt) =>
		{
			OnSelectionStatusChanged(listEntryControl, evt.newValue);
		});
		listEntryControl.SetSelected(playerProfile.IsSelected);
		playerEntryControls.Add(listEntryControl);
	}

	private void UseMicProfileWhereNeeded(MicProfile micProfile)
	{
		if (micProfile != null && micProfile.IsEnabled && playerEntryControls.FirstOrDefault((SongSelectPlayerEntryControl it) => it.MicProfile != null && it.MicProfile.ConnectedClientId == micProfile.ConnectedClientId) == null)
		{
			SongSelectPlayerEntryControl songSelectPlayerEntryControl = playerEntryControls.FirstOrDefault((SongSelectPlayerEntryControl it) => it.PlayerProfile.IsSelected && it.MicProfile == null);
			if (songSelectPlayerEntryControl != null)
			{
				songSelectPlayerEntryControl.MicProfile = micProfile;
			}
		}
	}

	private void RemoveMicProfileFromListEntries(MicProfile micProfile)
	{
		foreach (SongSelectPlayerEntryControl playerEntryControl in playerEntryControls)
		{
			if (playerEntryControl.MicProfile != null && playerEntryControl.MicProfile.ConnectedClientId == micProfile.ConnectedClientId)
			{
				playerEntryControl.MicProfile = null;
			}
		}
	}

	private void OnSelectionStatusChanged(SongSelectPlayerEntryControl listEntryControl, bool newValue)
	{
		listEntryControl.PlayerProfile.IsSelected = newValue;
		if (!newValue)
		{
			listEntryControl.MicProfile = null;
			return;
		}
		List<MicProfile> list = FindUnusedMicProfiles();
		if (!list.IsNullOrEmpty())
		{
			listEntryControl.MicProfile = list[0];
		}
	}

	private List<MicProfile> FindUnusedMicProfiles()
	{
		List<MicProfile> usedMicProfiles = (from it in playerEntryControls
			where it.MicProfile != null
			select it.MicProfile).ToList();
		return (from it in settings.MicProfiles.Where((MicProfile it) => it.IsEnabled && it.IsConnected(serverSideConnectRequestManager)).ToList()
			where !usedMicProfiles.Contains(it)
			select it).ToList();
	}

	public List<PlayerProfile> GetSelectedPlayerProfiles()
	{
		return (from it in playerEntryControls
			where it.IsSelected
			select it.PlayerProfile).ToList();
	}

	public Dictionary<PlayerProfile, MicProfile> GetSelectedPlayerProfileToMicProfileMap()
	{
		Dictionary<PlayerProfile, MicProfile> result = new Dictionary<PlayerProfile, MicProfile>();
		playerEntryControls.ForEach((SongSelectPlayerEntryControl entry) =>
		{
			if (entry.IsSelected && entry.MicProfile != null)
			{
				result.Add(entry.PlayerProfile, entry.MicProfile);
			}
		});
		return result;
	}

	public Dictionary<PlayerProfile, string> GetSelectedPlayerProfileToVoiceNameMap()
	{
		Dictionary<PlayerProfile, string> selectedPlayerProfileToVoiceNameMap = new Dictionary<PlayerProfile, string>();
		playerEntryControls.ForEach((SongSelectPlayerEntryControl entry) =>
		{
			if (entry.IsSelected)
			{
				string value = ((entry.Voice != null) ? entry.Voice.Name : Voice.soloVoiceName);
				selectedPlayerProfileToVoiceNameMap.Add(entry.PlayerProfile, value);
			}
		});
		return selectedPlayerProfileToVoiceNameMap;
	}

	public void ToggleSelectedPlayers()
	{
		List<SongSelectPlayerEntryControl> deselectedEntries = new List<SongSelectPlayerEntryControl>();
		playerEntryControls.ForEach((SongSelectPlayerEntryControl entry) =>
		{
			if (entry.IsSelected)
			{
				entry.SetSelected(newIsSelected: false);
			}
			else
			{
				deselectedEntries.Add(entry);
			}
		});
		foreach (SongSelectPlayerEntryControl item in deselectedEntries)
		{
			item.SetSelected(newIsSelected: true);
		}
	}

	private void LoadLastPlayerProfileToMicProfileMap()
	{
		if (lastPlayerProfileToMicProfileMap.IsNullOrEmpty())
		{
			return;
		}
		foreach (KeyValuePair<PlayerProfile, MicProfile> item in lastPlayerProfileToMicProfileMap)
		{
			PlayerProfile playerProfile = item.Key;
			MicProfile lastUsedMicProfile = item.Value;
			if (!lastUsedMicProfile.IsConnected(serverSideConnectRequestManager) || !lastUsedMicProfile.IsEnabled)
			{
				continue;
			}
			playerEntryControls.ForEach((SongSelectPlayerEntryControl entry) =>
			{
				if (entry.PlayerProfile == playerProfile)
				{
					entry.MicProfile = lastUsedMicProfile;
				}
				else if (entry.IsSelected && entry.MicProfile == lastUsedMicProfile)
				{
					entry.MicProfile = null;
				}
			});
		}
	}

	private void OnDestroy()
	{
		lastPlayerProfileToMicProfileMap = GetSelectedPlayerProfileToMicProfileMap();
	}

	public void HideVoiceSelection()
	{
		playerEntryControls.ForEach((SongSelectPlayerEntryControl entry) =>
		{
			entry.HideVoiceSelection();
		});
	}

	public void ShowVoiceSelection(SongMeta selectedSong)
	{
		int voiceIndex = 0;
		playerEntryControls.ForEach((SongSelectPlayerEntryControl entry) =>
		{
			entry.ShowVoiceSelection(selectedSong, voiceIndex);
			voiceIndex = (voiceIndex + 1) % selectedSong.VoiceNames.Count;
		});
	}
}
