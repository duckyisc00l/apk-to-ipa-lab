using UnityEngine;

public class DefaultHighscoreSceneDataProvider : MonoBehaviour, IDefaultSceneDataProvider
{
	public EDifficulty difficulty;

	public SceneData GetDefaultSceneData()
	{
		SongMetaManager.Instance.ScanFilesIfNotDoneYet();
		SongMetaManager.Instance.WaitUntilSongScanFinished();
		return new HighscoreSceneData
		{
			SongMeta = SongMetaManager.Instance.GetFirstSongMeta(),
			Difficulty = difficulty
		};
	}
}
