using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;

public class DefaultSingSceneDataProvider : MonoBehaviour, IDefaultSceneDataProvider, INeedInjection
{
	public string defaultSongName;

	[TextArea(10, 20)]
	[Tooltip("Convenience text field to paste and copy song names when debugging.")]
	public string defaultSongNamePasteBin;

	public SceneData GetDefaultSceneData()
	{
		PlayerProfile defaultPlayerProfile = GetDefaultPlayerProfile();
		return new SingSceneData
		{
			SelectedSongMeta = GetDefaultSongMeta(),
			SelectedPlayerProfiles = { defaultPlayerProfile },
			PlayerProfileToMicProfileMap = { [GetDefaultPlayerProfile()] = GetDefaultMicProfile() }
		};
	}

	private PlayerProfile GetDefaultPlayerProfile()
	{
		List<PlayerProfile> playerProfiles = SettingsManager.Instance.Settings.PlayerProfiles;
		if (playerProfiles.IsNullOrEmpty())
		{
			throw new UnityException("No player profiles found.");
		}
		return playerProfiles[0];
	}

	private MicProfile GetDefaultMicProfile()
	{
		return SettingsManager.Instance.Settings.MicProfiles.FirstOrDefault((MicProfile it) => it.IsEnabled && it.IsConnected(ServerSideConnectRequestManager.Instance));
	}

	private SongMeta GetDefaultSongMeta()
	{
		SongMetaManager.Instance.WaitUntilSongScanFinished();
		SongMeta songMeta = SongMetaManager.Instance.GetSongMetas().FirstOrDefault((SongMeta it) => it.Title.Trim() == GetDefaultSongName());
		if (songMeta == null)
		{
			Debug.LogWarning("No song with title '" + GetDefaultSongName() + "' was found. Using the first found song instead.");
			return SongMetaManager.Instance.GetFirstSongMeta();
		}
		return songMeta;
	}

	private string GetDefaultSongName()
	{
		return defaultSongName.Trim();
	}
}
