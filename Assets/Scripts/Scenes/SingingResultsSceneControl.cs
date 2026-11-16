using System;
using System.Collections.Generic;
using System.Linq;
using ProTrans;
using UniInject;
using UniInject.Extensions;
using UnityEngine;
using UnityEngine.UIElements;

public class SingingResultsSceneControl : MonoBehaviour, INeedInjection, IBinder, ITranslator
{
	[InjectedInInspector]
	public VisualTreeAsset nPlayerUi;

	[InjectedInInspector]
	public List<SongRatingImageReference> songRatingImageReferences;

	[InjectedInInspector]
	public SongAudioPlayer songAudioPlayer;

	[InjectedInInspector]
	public SongPreviewControl songPreviewControl;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "sceneSubtitle")]
	private Label songLabel;

	[Inject(UxmlName = "onePlayerLayout")]
	public VisualElement onePlayerLayout;

	[Inject(UxmlName = "twoPlayerLayout")]
	public VisualElement twoPlayerLayout;

	[Inject(UxmlName = "nPlayerLayout")]
	public VisualElement nPlayerLayout;

	[Inject(UxmlName = "continueButton")]
	public Button continueButton;

	[Inject(UxmlName = "hiddenContinueButton")]
	public Button hiddenContinueButton;

	[Inject]
	private Statistics statistics;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private Injector injector;

	[Inject]
	private Settings settings;

	[Inject]
	private ThemeManager themeManager;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private SingingResultsSceneData sceneData;

	private List<SingingResultsPlayerControl> singingResultsPlayerUiControls = new List<SingingResultsPlayerControl>();

	public static SingingResultsSceneControl Instance => UnityEngine.Object.FindObjectOfType<SingingResultsSceneControl>();

	private void Start()
	{
		hiddenContinueButton.RegisterCallbackButtonTriggered(() =>
		{
			FinishScene();
		});
		continueButton.RegisterCallbackButtonTriggered(() =>
		{
			FinishScene();
		});
		continueButton.Focus();
		uiDocument.rootVisualElement.Query<VisualElement>().ToList().ForEach((VisualElement visualElement) =>
		{
			visualElement.pickingMode = ((!(visualElement is Button)) ? PickingMode.Ignore : PickingMode.Position);
		});
		songAudioPlayer.Init(sceneData.SongMeta);
		songPreviewControl.PreviewDelayInSeconds = 0f;
		songPreviewControl.AudioFadeInDurationInSeconds = 2f;
		songPreviewControl.VideoFadeInDurationInSeconds = 2f;
		songPreviewControl.StartSongPreview(sceneData.SongMeta);
		ActivateLayout();
		FillLayout();
	}

	private void FillLayout()
	{
		SongMeta songMeta = sceneData.SongMeta;
		string text = (songMeta.Title.IsNullOrEmpty() ? "" : songMeta.Title);
		string text2 = (songMeta.Artist.IsNullOrEmpty() ? "" : (" - " + songMeta.Artist));
		songLabel.text = text + text2;
		VisualElement selectedLayout = GetSelectedLayout();
		if (selectedLayout == nPlayerLayout)
		{
			PrepareNPlayerLayout();
		}
		List<VisualElement> list = selectedLayout.Query<VisualElement>("singingResultsPlayerUi").ToList();
		singingResultsPlayerUiControls = new List<SingingResultsPlayerControl>();
		int num = 0;
		foreach (PlayerProfile playerProfile in sceneData.PlayerProfiles)
		{
			sceneData.PlayerProfileToMicProfileMap.TryGetValue(playerProfile, out var value);
			PlayerScoreControlData playerScores = sceneData.GetPlayerScores(playerProfile);
			SongRating songRating = GetSongRating(playerScores.TotalScore);
			Injector injector = UniInjectUtils.CreateInjector(this.injector);
			injector.AddBindingForInstance(injector);
			injector.AddBindingForInstance(playerProfile);
			injector.AddBindingForInstance(value);
			injector.AddBindingForInstance(playerScores);
			injector.AddBindingForInstance(songRating);
			injector.AddBinding(new Binding("playerProfileIndex", new ExistingInstanceProvider<int>(num)));
			if (num < list.Count)
			{
				VisualElement instance = list[num];
				SingingResultsPlayerControl singingResultsPlayerControl = new SingingResultsPlayerControl();
				injector.AddBindingForInstance("rootVisualElement", instance, RebindingBehavior.Ignore);
				injector.Inject(singingResultsPlayerControl);
				singingResultsPlayerUiControls.Add(singingResultsPlayerControl);
			}
			num++;
		}
	}

	private void PrepareNPlayerLayout()
	{
		int count = sceneData.PlayerProfiles.Count;
		int num = (int)Math.Sqrt(sceneData.PlayerProfiles.Count);
		int num2 = (int)Math.Ceiling((float)count / (float)num);
		if (sceneData.PlayerProfiles.Count == 3)
		{
			num = 3;
			num2 = 1;
		}
		int num3 = 0;
		for (int i = 0; i < num; i++)
		{
			VisualElement visualElement = new VisualElement();
			visualElement.style.flexDirection = new StyleEnum<FlexDirection>(FlexDirection.Column);
			visualElement.style.height = new StyleLength(Length.Percent(100f));
			visualElement.style.width = new StyleLength(Length.Percent(100f / (float)num));
			nPlayerLayout.Add(visualElement);
			for (int j = 0; j < num2; j++)
			{
				VisualElement visualElement2 = nPlayerUi.CloneTree().Children().FirstOrDefault();
				visualElement2.name = "singingResultsPlayerUi";
				visualElement2.style.marginBottom = new StyleLength(20f);
				visualElement2.AddToClassList("singingResultUiSmall");
				if (num2 > 2)
				{
					visualElement2.AddToClassList("singingResultUiSmaller");
				}
				if (num2 > 3)
				{
					visualElement2.AddToClassList("singingResultUiSmallest");
				}
				visualElement.Add(visualElement2);
				num3++;
				if (num3 >= sceneData.PlayerProfiles.Count)
				{
					return;
				}
			}
		}
	}

	private void ActivateLayout()
	{
		List<VisualElement> obj = new List<VisualElement> { onePlayerLayout, twoPlayerLayout, nPlayerLayout };
		VisualElement selectedLayout = GetSelectedLayout();
		foreach (VisualElement item in obj)
		{
			item.SetVisibleByDisplay(item == selectedLayout);
		}
	}

	private VisualElement GetSelectedLayout()
	{
		return sceneData.PlayerProfiles.Count switch
		{
			1 => onePlayerLayout, 
			2 => twoPlayerLayout, 
			_ => nPlayerLayout, 
		};
	}

	public void FinishScene()
	{
		if (statistics.HasHighscore(sceneData.SongMeta))
		{
			HighscoreSceneData highscoreSceneData = new HighscoreSceneData();
			highscoreSceneData.SongMeta = sceneData.SongMeta;
			highscoreSceneData.Difficulty = sceneData.PlayerProfiles.FirstOrDefault().Difficulty;
			sceneNavigator.LoadScene(EScene.HighscoreScene, highscoreSceneData);
		}
		else
		{
			SongSelectSceneData songSelectSceneData = new SongSelectSceneData();
			songSelectSceneData.SongMeta = sceneData.SongMeta;
			sceneNavigator.LoadScene(EScene.SongSelectScene, songSelectSceneData);
		}
	}

	public List<UniInject.IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(this);
		bindingBuilder.BindExistingInstance(base.gameObject);
		bindingBuilder.BindExistingInstance(SceneNavigator.GetSceneDataOrThrow<SingingResultsSceneData>());
		bindingBuilder.BindExistingInstance(songAudioPlayer);
		bindingBuilder.BindExistingInstance(songPreviewControl);
		return bindingBuilder.GetBindings();
	}

	private SongRating GetSongRating(double totalScore)
	{
		foreach (SongRating value in SongRating.Values)
		{
			if (totalScore > value.ScoreThreshold)
			{
				return value;
			}
		}
		return SongRating.ToneDeaf;
	}

	public void UpdateTranslation()
	{
		continueButton.text = TranslationManager.GetTranslation(R.Messages.continue_);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.singingResultsScene_title);
		singingResultsPlayerUiControls.ForEach((SingingResultsPlayerControl singingResultsPlayerUiControl) =>
		{
			singingResultsPlayerUiControl.UpdateTranslation();
		});
	}
}
