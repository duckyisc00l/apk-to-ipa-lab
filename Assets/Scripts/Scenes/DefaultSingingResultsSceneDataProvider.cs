using System.Linq;
using UnityEngine;

public class DefaultSingingResultsSceneDataProvider : MonoBehaviour, IDefaultSceneDataProvider
{
	[Range(1f, 16f)]
	public int playerCount = 1;

	public SceneData GetDefaultSceneData()
	{
		SingingResultsSceneData singingResultsSceneData = new SingingResultsSceneData();
		SongMetaManager.Instance.WaitUntilSongScanFinished();
		singingResultsSceneData.SongMeta = SongMetaManager.Instance.GetFirstSongMeta();
		singingResultsSceneData.SongDurationInMillis = 120000;
		PlayerScoreControlData playerScoreControlData = new PlayerScoreControlData();
		playerScoreControlData.TotalScore = 6500;
		playerScoreControlData.NormalNotesTotalScore = 4000;
		playerScoreControlData.GoldenNotesTotalScore = 2000;
		playerScoreControlData.PerfectSentenceBonusTotalScore = 500;
		playerScoreControlData.NormalNoteLengthTotal = 80;
		playerScoreControlData.GoldenNoteLengthTotal = 20;
		playerScoreControlData.PerfectSentenceCount = 10;
		playerScoreControlData.NormalBeatData.GoodBeats = 30;
		playerScoreControlData.NormalBeatData.PerfectBeats = 10;
		playerScoreControlData.GoldenBeatData.GoodBeats = 5;
		playerScoreControlData.GoldenBeatData.PerfectBeats = 5;
		Sentence sentence = CreateDummySentence(0, 200);
		Sentence sentence2 = CreateDummySentence(201, 500);
		Sentence sentence3 = CreateDummySentence(501, 1500);
		playerScoreControlData.SentenceToSentenceScoreMap.Add(sentence, CreateSentenceScore(sentence, 3000));
		playerScoreControlData.SentenceToSentenceScoreMap.Add(sentence2, CreateSentenceScore(sentence2, 5000));
		playerScoreControlData.SentenceToSentenceScoreMap.Add(sentence3, CreateSentenceScore(sentence3, 6500));
		PlayerProfile playerProfile = SettingsManager.Instance.Settings.PlayerProfiles[0];
		singingResultsSceneData.PlayerProfileToMicProfileMap[playerProfile] = SettingsManager.Instance.Settings.MicProfiles.FirstOrDefault();
		singingResultsSceneData.AddPlayerScores(playerProfile, playerScoreControlData);
		for (int i = 1; i < playerCount; i++)
		{
			singingResultsSceneData.AddPlayerScores(SettingsManager.Instance.Settings.PlayerProfiles[i], playerScoreControlData);
		}
		return singingResultsSceneData;
	}

	private Sentence CreateDummySentence(int startBeat, int endBeat)
	{
		int num = 3;
		int num2 = 10;
		Sentence sentence = new Sentence(startBeat, endBeat);
		for (int i = 0; i < num; i++)
		{
			Note note = new Note(ENoteType.Normal, startBeat + num2 * i, num2, 0, "b");
			sentence.AddNote(note);
		}
		return sentence;
	}

	private SentenceScore CreateSentenceScore(Sentence sentence, int totalScoreSoFar)
	{
		return new SentenceScore(sentence)
		{
			TotalScoreSoFar = totalScoreSoFar
		};
	}
}
