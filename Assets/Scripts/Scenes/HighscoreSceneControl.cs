using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using ProTrans;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class HighscoreSceneControl : MonoBehaviour, INeedInjection, IBinder, ITranslator
{
	[Inject(UxmlName = "continueButton")]
	private Button continueButton;

	[Inject(UxmlName = "hiddenContinueButton")]
	private Button hiddenContinueButton;

	[Inject(UxmlName = "nextDifficultyButton")]
	private Button nextDifficultyButton;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "sceneSubtitle")]
	private Label titleAndArtistText;

	[Inject(UxmlName = "difficultyLabel")]
	private Label difficultyText;

	[Inject(UxmlName = "highscoreEntry")]
	private List<VisualElement> highscoreEntries;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private Statistics statistics;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private HighscoreSceneData sceneData;

	private EDifficulty currentDifficulty;

	private void Start()
	{
		continueButton.RegisterCallbackButtonTriggered(() =>
		{
			FinishScene();
		});
		hiddenContinueButton.RegisterCallbackButtonTriggered(() =>
		{
			FinishScene();
		});
		nextDifficultyButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowNextDifficulty(1);
		});
		ShowHighscores(sceneData.SongMeta, sceneData.Difficulty);
		uiDocument.rootVisualElement.Query<VisualElement>().ToList().ForEach((VisualElement visualElement) =>
		{
			visualElement.pickingMode = ((!(visualElement is Button)) ? PickingMode.Ignore : PickingMode.Position);
		});
		continueButton.Focus();
	}

	public void FinishScene()
	{
		SongSelectSceneData songSelectSceneData = new SongSelectSceneData();
		songSelectSceneData.SongMeta = sceneData.SongMeta;
		sceneNavigator.LoadScene(EScene.SongSelectScene, songSelectSceneData);
	}

	public void ShowNextDifficulty(int direction)
	{
		EDifficulty nextDifficulty = GetNextDifficulty(currentDifficulty, direction);
		ShowHighscores(sceneData.SongMeta, nextDifficulty);
	}

	private void ShowHighscores(SongMeta songMeta, EDifficulty difficulty)
	{
		currentDifficulty = difficulty;
		difficultyText.text = TranslationManager.GetTranslation(R.Messages.difficulty) + ": " + difficulty.GetTranslatedName();
		titleAndArtistText.text = songMeta.Title + " - " + songMeta.Artist;
		List<SongStatistic> list = statistics.GetLocalStats(songMeta)?.StatsEntries?.SongStatistics?.Where((SongStatistic it) => it.Difficulty == difficulty).ToList();
		if (list.IsNullOrEmpty())
		{
			list = new List<SongStatistic>();
		}
		list.Sort(new CompareBySongScoreDescending());
		List<SongStatistic> list2 = list.Take(highscoreEntries.Count).ToList();
		for (int num = 0; num < highscoreEntries.Count; num++)
		{
			if (num < list2.Count)
			{
				highscoreEntries[num].ShowByDisplay();
				FillHighscoreEntry(highscoreEntries[num], list2[num], num);
			}
			else
			{
				highscoreEntries[num].HideByDisplay();
			}
		}
		UpdateTranslation();
	}

	private void FillHighscoreEntry(VisualElement highscoreEntry, SongStatistic songStatistic, int index)
	{
		highscoreEntry.Q<Label>("posLabel").text = (index + 1).ToString();
		highscoreEntry.Q<Label>("playerNameLabel").text = songStatistic.PlayerName;
		highscoreEntry.Q<Label>("scoreLabel").text = songStatistic.Score.ToString();
		highscoreEntry.Q<Label>("dateLabel").text = songStatistic.DateTime.ToString("d", CultureInfo.CurrentUICulture);
		highscoreEntry.Q<VisualElement>("commonScoreIcon").SetVisibleByDisplay(songStatistic.ScoreMode == EScoreMode.CommonAverage);
	}

	public List<UniInject.IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(this);
		bindingBuilder.BindExistingInstance(base.gameObject);
		bindingBuilder.BindExistingInstance(SceneNavigator.GetSceneDataOrThrow<HighscoreSceneData>());
		return bindingBuilder.GetBindings();
	}

	public void UpdateTranslation()
	{
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.highscoreScene_title);
		continueButton.text = TranslationManager.GetTranslation(R.Messages.continue_);
		nextDifficultyButton.Q<Label>().text = currentDifficulty.GetTranslatedName();
	}

	private EDifficulty GetNextDifficulty(EDifficulty difficulty, int direction)
	{
		int index = difficulty.GetIndex();
		int nextDifficultyIndex = NumberUtils.Mod(index + direction, EnumUtils.GetValuesAsList<EDifficulty>().Count);
		return EnumUtils.GetValuesAsList<EDifficulty>().FirstOrDefault((EDifficulty it) => it.GetIndex() == nextDifficultyIndex);
	}
}
