using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class DefaultSongEditorSceneDataProvider : MonoBehaviour, IDefaultSceneDataProvider
{
	public string defaultSongName;

	[TextArea(3, 8)]
	[Tooltip("Convenience text field to paste and copy song names when debugging.")]
	public string defaultSongNamePasteBin;

	public SceneData GetDefaultSceneData()
	{
		SongEditorSceneData songEditorSceneData = new SongEditorSceneData();
		songEditorSceneData.PositionInSongInMillis = 0.0;
		songEditorSceneData.SelectedSongMeta = GetDefaultSongMeta();
		songEditorSceneData.PreviousScene = EScene.SingScene;
		SingSceneData singSceneData = new SingSceneData();
		singSceneData.SelectedSongMeta = songEditorSceneData.SelectedSongMeta;
		PlayerProfile item = SettingsManager.Instance.Settings.PlayerProfiles[0];
		List<PlayerProfile> list = new List<PlayerProfile>();
		list.Add(item);
		singSceneData.SelectedPlayerProfiles = list;
		songEditorSceneData.PlayerProfileToMicProfileMap = singSceneData.PlayerProfileToMicProfileMap;
		songEditorSceneData.SelectedPlayerProfiles = singSceneData.SelectedPlayerProfiles;
		songEditorSceneData.PreviousSceneData = singSceneData;
		return songEditorSceneData;
	}

	private SongMeta GetDefaultSongMeta()
	{
		SongMetaManager.Instance.WaitUntilSongScanFinished();
		SongMeta songMeta = SongMetaManager.Instance.GetSongMetas().FirstOrDefault((SongMeta it) => it.Title == GetDefaultSongName());
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
