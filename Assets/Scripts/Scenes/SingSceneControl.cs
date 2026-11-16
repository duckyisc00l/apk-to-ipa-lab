using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using ProTrans;
using UniInject;
using UniInject.Extensions;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SingSceneControl : MonoBehaviour, INeedInjection, IBinder
{
	private static SingSceneControl instance;

	[InjectedInInspector]
	public PlayerControl playerControlPrefab;

	[InjectedInInspector]
	public VisualTreeAsset playerUi;

	[InjectedInInspector]
	public VisualTreeAsset sentenceRatingUi;

	[InjectedInInspector]
	public VisualTreeAsset noteUi;

	[InjectedInInspector]
	public VisualTreeAsset dialogUi;

	[InjectedInInspector]
	public VisualTreeAsset perfectEffectStarUi;

	[InjectedInInspector]
	public VisualTreeAsset goldenNoteStarUi;

	[InjectedInInspector]
	public VisualTreeAsset goldenNoteHitStarUi;

	[Inject(UxmlName = "background")]
	public VisualElement background;

	[InjectedInInspector]
	public SongAudioPlayer songAudioPlayer;

	[InjectedInInspector]
	public SongVideoPlayer songVideoPlayer;

	[InjectedInInspector]
	public SingSceneWebcamControl webcamControl;

	[Inject]
	private Injector injector;

	[Inject]
	private Settings settings;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	[Inject]
	private Statistics statistics;

	[Inject]
	private UltraStarPlayInputManager inputManager;

	[Inject(UxmlName = "topLyricsContainer")]
	private VisualElement topLyricsContainer;

	[Inject(UxmlName = "bottomLyricsContainer")]
	private VisualElement bottomLyricsContainer;

	[Inject(UxmlName = "playerUiContainer")]
	private VisualElement playerUiContainer;

	[Inject(UxmlName = "pauseOverlay")]
	private VisualElement pauseOverlay;

	[Inject(UxmlName = "doubleClickToTogglePauseElement")]
	private VisualElement doubleClickToTogglePauseElement;

	[Inject(UxmlName = "inputLegend")]
	private VisualElement inputLegend;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private ThemeManager themeManager;

	private PlayerControl lastLeadingPlayerControl;

	private VisualElement[] playerUiColumns;

	[Inject]
	private SingSceneData sceneData;

	private SingingLyricsControl topSingingLyricsControl;

	private SingingLyricsControl bottomSingingLyricsControl;

	private TimeBarControl timeBarControl;

	private MessageDialogControl dialogControl;

	private ContextMenuControl contextMenuControl;

	private CommonScoreControl commonScoreControl;

	private float startTimeInSeconds;

	private bool hasRecordedSongStartedStatistics;

	public static SingSceneControl Instance
	{
		get
		{
			if (instance == null)
			{
				instance = UnityEngine.Object.FindObjectOfType<SingSceneControl>();
			}
			return instance;
		}
	}

	public List<PlayerControl> PlayerControls { get; private set; } = new List<PlayerControl>();

	private SongMeta SongMeta => sceneData.SelectedSongMeta;

	public double DurationOfSongInMillis => songAudioPlayer.DurationOfSongInMillis;

	public double PositionInSongInMillis => songAudioPlayer.PositionInSongInMillis;

	public double CurrentBeat => songAudioPlayer.GetCurrentBeat(allowNegativeResult: false);

	public bool IsDialogOpen => dialogControl != null;

	public bool IsCommonScore
	{
		get
		{
			if (settings.GameSettings.ScoreMode == EScoreMode.CommonAverage)
			{
				return sceneData.SelectedPlayerProfiles.Count >= 2;
			}
			return false;
		}
	}

	public bool IsIndividualScore
	{
		get
		{
			if (settings.GameSettings.ScoreMode != EScoreMode.Individual)
			{
				if (settings.GameSettings.ScoreMode == EScoreMode.CommonAverage)
				{
					return sceneData.SelectedPlayerProfiles.Count <= 1;
				}
				return false;
			}
			return true;
		}
	}

	private void Start()
	{
		string arg = sceneData.SelectedPlayerProfiles.Select((PlayerProfile it) => it.Name).ToCsv();
		Debug.Log($"{arg} start (or continue) singing of {SongMeta.Title} at {sceneData.PositionInSongInMillis} ms.");
		startTimeInSeconds = Time.time;
		pauseOverlay.HideByDisplay();
		new DoubleClickControl(doubleClickToTogglePauseElement).DoublePointerDownEventStream.Subscribe((bool _) =>
		{
			TogglePlayPause();
		});
		PreparePlayerUiLayout();
		List<PlayerProfile> list = new List<PlayerProfile>();
		for (int num = 0; num < sceneData.SelectedPlayerProfiles.Count; num++)
		{
			PlayerProfile playerProfile = sceneData.SelectedPlayerProfiles[num];
			sceneData.PlayerProfileToMicProfileMap.TryGetValue(playerProfile, out var value);
			if (value == null)
			{
				list.Add(playerProfile);
			}
			PlayerControl playerControl = CreatePlayerControl(playerProfile, value, num);
			if (sceneData.PlayerProfileToScoreDataMap.TryGetValue(playerProfile, out var value2))
			{
				playerControl.PlayerScoreControl.ScoreData = value2;
			}
			if (sceneData.SelectedPlayerProfiles.Count > 1)
			{
				playerControl.PlayerScoreControl.SentenceScoreEventStream.Subscribe((PlayerScoreControl.SentenceScoreEvent _) =>
				{
					UpdateLeadingPlayerIcon();
				});
			}
		}
		if (Application.isEditor)
		{
			InitDummySingers();
		}
		string text = string.Join(", ", list.Select((PlayerProfile it) => it.Name).ToList());
		if (!list.IsNullOrEmpty())
		{
			string translation = TranslationManager.GetTranslation(R.Messages.singScene_missingMicrophones_title);
			string translation2 = TranslationManager.GetTranslation(R.Messages.singScene_missingMicrophones_message, "playerNameCsv", text);
			VisualElement visualElement = dialogUi.CloneTree();
			visualElement.AddToClassList("overlay");
			background.Add(visualElement);
			dialogControl = injector.WithRootVisualElement(visualElement).CreateAndInject<MessageDialogControl>();
			dialogControl.Title = translation;
			dialogControl.Message = translation2;
			dialogControl.DialogTitleImage.ShowByDisplay();
			dialogControl.DialogTitleImage.AddToClassList("warning");
			dialogControl.AddButton("OK", CloseDialog).Focus();
			themeManager.ApplyThemeSpecificStylesToVisualElementsInScene();
		}
		webcamControl.InitWebcam();
		InitSingingLyricsControls();
		StartCoroutine(StartMusicAndVideo());
		UpdateInputLegend();
		inputManager.InputDeviceChangeEventStream.Subscribe((InputDeviceChangeEvent _) =>
		{
			UpdateInputLegend();
		});
		contextMenuControl = injector.WithRootVisualElement(doubleClickToTogglePauseElement).CreateAndInject<ContextMenuControl>();
		contextMenuControl.FillContextMenuAction = FillContextMenu;
		PlayerControls.ForEach((PlayerControl playerControl2) =>
		{
			playerControl2.PlayerMicPitchTracker.SendMicProfileToConnectedClient();
			playerControl2.PlayerMicPitchTracker.SendStartRecordingMessageToConnectedClient();
		});
		commonScoreControl = injector.CreateAndInject<CommonScoreControl>();
		if (sceneData.PositionInSongInMillis <= 0.0 && SongMeta.Start > 0f)
		{
			SkipToPositionInSong(SongMeta.Start * 1000f);
		}
		StartCoroutine(CoroutineUtils.ExecuteRepeatedlyInSeconds(1f, () =>
		{
			timeBarControl?.UpdateTimeValueLabel(songAudioPlayer.PositionInSongInMillis, songAudioPlayer.DurationOfSongInMillis);
		}));
	}

	public void OnDestroy()
	{
		webcamControl.Stop();
	}

	private void InitDummySingers()
	{
		AbstractDummySinger[] array = UnityEngine.Object.FindObjectsOfType<AbstractDummySinger>(includeInactive: false);
		foreach (AbstractDummySinger abstractDummySinger in array)
		{
			if (abstractDummySinger.playerIndexToSimulate < PlayerControls.Count)
			{
				abstractDummySinger.SetPlayerControl(PlayerControls[abstractDummySinger.playerIndexToSimulate]);
				injector.Inject(abstractDummySinger);
			}
			else
			{
				Debug.LogWarning("DummySinger cannot simulate player with index " + abstractDummySinger.playerIndexToSimulate);
				abstractDummySinger.gameObject.SetActive(value: false);
			}
		}
	}

	private void PreparePlayerUiLayout()
	{
		int count = sceneData.SelectedPlayerProfiles.Count;
		(from it in playerUiContainer.Children()
			where it.name != "commonScoreSentenceRatingContainer"
			select it).ToList().ForEach((VisualElement it) =>
		{
			it.RemoveFromHierarchy();
		});
		if (count <= 1)
		{
			VisualElement visualElement = new VisualElement();
			visualElement.style.flexGrow = 1f;
			playerUiContainer.Add(visualElement);
		}
		else if (count > 3)
		{
			playerUiContainer.style.flexDirection = new StyleEnum<FlexDirection>(FlexDirection.Row);
			int num = (int)Math.Sqrt(count);
			playerUiColumns = new VisualElement[num];
			for (int num2 = 0; num2 < num; num2++)
			{
				VisualElement visualElement2 = new VisualElement();
				visualElement2.style.flexDirection = new StyleEnum<FlexDirection>(FlexDirection.Column);
				visualElement2.style.flexGrow = 1f;
				visualElement2.style.height = new StyleLength(new Length(100f, LengthUnit.Percent));
				playerUiContainer.Add(visualElement2);
				playerUiColumns[num2] = visualElement2;
			}
		}
	}

	private void InitSingingLyricsControls()
	{
		if (PlayerControls.IsNullOrEmpty() || !settings.GraphicSettings.showStaticLyrics)
		{
			topLyricsContainer.HideByDisplay();
			bottomLyricsContainer.HideByDisplay();
			return;
		}
		Dictionary<Voice, List<PlayerControl>> voiceToPlayerControlsMap = new Dictionary<Voice, List<PlayerControl>>();
		PlayerControls.ForEach((PlayerControl it) =>
		{
			voiceToPlayerControlsMap.AddInsideList(it.Voice, it);
		});
		if (voiceToPlayerControlsMap.Keys.Count >= 2)
		{
			List<PlayerControl> source = voiceToPlayerControlsMap[voiceToPlayerControlsMap.Keys.FirstOrDefault()];
			List<PlayerControl> source2 = voiceToPlayerControlsMap[voiceToPlayerControlsMap.Keys.LastOrDefault()];
			topSingingLyricsControl = CreateSingingLyricsControl(topLyricsContainer, source.FirstOrDefault());
			bottomSingingLyricsControl = CreateSingingLyricsControl(bottomLyricsContainer, source2.FirstOrDefault());
		}
		else
		{
			topLyricsContainer.HideByDisplay();
			bottomSingingLyricsControl = CreateSingingLyricsControl(bottomLyricsContainer, PlayerControls[0]);
		}
		SingingLyricsControl CreateSingingLyricsControl(VisualElement visualElement, PlayerControl playerController)
		{
			Injector obj = UniInjectUtils.CreateInjector(injector);
			obj.AddBindingForInstance(playerController);
			return obj.WithRootVisualElement(visualElement).CreateAndInject<SingingLyricsControl>();
		}
	}

	private void UpdateLeadingPlayerIcon()
	{
		PlayerControl playerControl = null;
		foreach (PlayerControl playerControl2 in PlayerControls)
		{
			if ((playerControl == null && playerControl2.PlayerScoreControl.TotalScore > 0) || (playerControl != null && playerControl2.PlayerScoreControl.TotalScore > playerControl.PlayerScoreControl.TotalScore))
			{
				playerControl = playerControl2;
			}
		}
		if (playerControl != null && lastLeadingPlayerControl != playerControl)
		{
			playerControl.PlayerUiControl.ShowLeadingPlayerIcon();
		}
		foreach (PlayerControl playerControl3 in PlayerControls)
		{
			if (playerControl3 != playerControl)
			{
				playerControl3.PlayerUiControl.HideLeadingPlayerIcon();
			}
		}
		lastLeadingPlayerControl = playerControl;
	}

	private void InitTimeBar()
	{
		timeBarControl = new TimeBarControl();
		injector.Inject(timeBarControl);
		timeBarControl.UpdateTimeBarRectangles(SongMeta, PlayerControls, DurationOfSongInMillis);
	}

	private IEnumerator StartMusicAndVideo()
	{
		yield return StartAudioPlayback();
		songVideoPlayer.SongMeta = SongMeta;
		if (SongMeta.Video.IsNullOrEmpty())
		{
			songVideoPlayer.ShowBackgroundImage();
		}
		else
		{
			songVideoPlayer.StartVideoOrShowBackgroundImage();
		}
	}

	private void OnDisable()
	{
		if (sceneData.IsRestart)
		{
			sceneData.IsRestart = false;
			sceneData.PositionInSongInMillis = 0.0;
		}
		else
		{
			sceneData.PositionInSongInMillis = PositionInSongInMillis;
		}
	}

	private void Update()
	{
		PlayerControls.ForEach((PlayerControl playerControl) =>
		{
			if (songAudioPlayer.IsPlaying)
			{
				playerControl.SetCurrentBeat(CurrentBeat);
				playerControl.UpdateUi();
			}
		});
		timeBarControl.UpdatePositionIndicator(songAudioPlayer.PositionInSongInMillis, songAudioPlayer.DurationOfSongInMillis);
		topSingingLyricsControl?.Update(songAudioPlayer.PositionInSongInMillis);
		bottomSingingLyricsControl?.Update(songAudioPlayer.PositionInSongInMillis);
		if (!hasRecordedSongStartedStatistics)
		{
			float num = Time.time - startTimeInSeconds;
			float num2 = (float)songAudioPlayer.DurationOfSongInMillis / 1000f;
			if (num >= 30f || (num2 > 0f && num >= num2 / 2f))
			{
				hasRecordedSongStartedStatistics = true;
				statistics.RecordSongStarted(SongMeta);
			}
		}
	}

	public void SkipToNextSingableNote()
	{
		IEnumerable<int> source = from it in PlayerControls
			select it.GetNextSingableNote(CurrentBeat) into nextSingableNote
			where nextSingableNote != null
			select nextSingableNote.StartBeat;
		if (source.Count() > 0)
		{
			int num = source.Min();
			double num2 = (Application.isEditor ? 500 : 1500);
			double num3 = BpmUtils.BeatToMillisecondsInSong(SongMeta, num) - num2;
			if (num3 > 0.0 && num3 > PositionInSongInMillis)
			{
				SkipToPositionInSong(num3);
			}
		}
	}

	public void SkipToPositionInSong(double positionInSongInMillis)
	{
		int num = (int)Math.Max(CurrentBeat, sceneData.NextBeatToScore);
		Debug.Log($"Skipping forward to {positionInSongInMillis} milliseconds, next beat to score is {num}");
		songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
		foreach (PlayerControl playerControl in PlayerControls)
		{
			playerControl.PlayerScoreControl.NextBeatToScore = num;
			playerControl.PlayerMicPitchTracker.SkipToBeat(CurrentBeat);
		}
	}

	public void Restart()
	{
		sceneData.IsRestart = true;
		sceneNavigator.LoadScene(EScene.SingScene, sceneData);
	}

	public void OpenSongInEditor()
	{
		int val = PlayerControls.Select((PlayerControl playerController) => playerController.PlayerScoreControl.NextBeatToScore).Max();
		sceneData.NextBeatToScore = Math.Max((int)CurrentBeat, val);
		sceneData.PlayerProfileToScoreDataMap = new Dictionary<PlayerProfile, PlayerScoreControlData>();
		foreach (PlayerControl playerControl in PlayerControls)
		{
			sceneData.PlayerProfileToScoreDataMap.Add(playerControl.PlayerProfile, playerControl.PlayerScoreControl.ScoreData);
		}
		SongEditorSceneData songEditorSceneData = new SongEditorSceneData
		{
			PreviousSceneData = sceneData,
			PreviousScene = EScene.SingScene,
			PositionInSongInMillis = PositionInSongInMillis,
			SelectedSongMeta = SongMeta,
			PlayerProfileToMicProfileMap = sceneData.PlayerProfileToMicProfileMap,
			SelectedPlayerProfiles = sceneData.SelectedPlayerProfiles
		};
		PlayerControls.ForEach((PlayerControl playerControl) =>
		{
			playerControl.PlayerMicPitchTracker.SendStopRecordingMessageToConnectedClient();
		});
		sceneNavigator.LoadScene(EScene.SongEditorScene, songEditorSceneData);
	}

	public void FinishScene(bool isAfterEndOfSong)
	{
		if (settings.GameSettings.ScoreMode == EScoreMode.None)
		{
			FinishSceneToSongSelect();
		}
		else
		{
			FinishSceneToSingingResults(isAfterEndOfSong);
		}
	}

	private void FinishSceneToSongSelect()
	{
		SongSelectSceneData songSelectSceneData = new SongSelectSceneData();
		songSelectSceneData.SongMeta = SongMeta;
		PlayerControls.ForEach((PlayerControl playerControl) =>
		{
			playerControl.PlayerMicPitchTracker.SendStopRecordingMessageToConnectedClient();
		});
		sceneNavigator.LoadScene(EScene.SongSelectScene, songSelectSceneData);
	}

	public void FinishSceneToSingingResults(bool isAfterEndOfSong)
	{
		SingingResultsSceneData singingResultsSceneData = new SingingResultsSceneData();
		singingResultsSceneData.SongMeta = SongMeta;
		singingResultsSceneData.SongDurationInMillis = (int)songAudioPlayer.DurationOfSongInMillis;
		List<SongStatistic> list = new List<SongStatistic>();
		if (IsIndividualScore)
		{
			singingResultsSceneData.PlayerProfileToMicProfileMap = sceneData.PlayerProfileToMicProfileMap;
			PlayerControls.ForEach((PlayerControl playerControl) =>
			{
				singingResultsSceneData.AddPlayerScores(playerControl.PlayerProfile, playerControl.PlayerScoreControl.ScoreData);
			});
			list = PlayerControls.Select((PlayerControl playerControl) => new SongStatistic(playerControl.PlayerProfile.Name, playerControl.PlayerProfile.Difficulty, playerControl.PlayerScoreControl.TotalScore, EScoreMode.Individual)).ToList();
		}
		else if (IsCommonScore)
		{
			List<PlayerScoreControl> source = PlayerControls.Select((PlayerControl playerControl) => playerControl.PlayerScoreControl).ToList();
			string playerName = PlayerControls.Select((PlayerControl playerControl) => playerControl.PlayerProfile.Name).JoinWith(settings.GameSettings.CommonScoreNameSeparator);
			EDifficulty difficulty = PlayerControls.FindMinElement((PlayerControl playerControl) => (float)playerControl.PlayerProfile.Difficulty).PlayerProfile.Difficulty;
			string imagePath = PlayerControls.FirstOrDefault().PlayerProfile.ImagePath;
			PlayerProfile profile = new PlayerProfile(playerName, difficulty, imagePath);
			PlayerScoreControlData playerScoreControlData = new PlayerScoreControlData
			{
				TotalScore = (int)source.Select((PlayerScoreControl scoreControl) => scoreControl.TotalScore).Average(),
				GoldenNotesTotalScore = (int)source.Select((PlayerScoreControl scoreControl) => scoreControl.GoldenNotesTotalScore).Average(),
				NormalNotesTotalScore = (int)source.Select((PlayerScoreControl scoreControl) => scoreControl.NormalNotesTotalScore).Average(),
				PerfectSentenceBonusTotalScore = (int)source.Select((PlayerScoreControl scoreControl) => scoreControl.PerfectSentenceBonusTotalScore).Average(),
				PerfectSentenceCount = (int)source.Select((PlayerScoreControl scoreControl) => scoreControl.ScoreData.PerfectSentenceCount).Average(),
				TotalSentenceCount = (int)source.Select((PlayerScoreControl scoreControl) => scoreControl.ScoreData.TotalSentenceCount).Average(),
				NormalNoteLengthTotal = (int)source.Select((PlayerScoreControl scoreControl) => scoreControl.ScoreData.NormalNoteLengthTotal).Average(),
				GoldenNoteLengthTotal = (int)source.Select((PlayerScoreControl scoreControl) => scoreControl.ScoreData.GoldenNoteLengthTotal).Average()
			};
			singingResultsSceneData.AddPlayerScores(profile, playerScoreControlData);
			SongStatistic item = new SongStatistic(playerName, difficulty, playerScoreControlData.TotalScore, EScoreMode.CommonAverage);
			list = new List<SongStatistic> { item };
		}
		bool isAfterLastNote = true;
		PlayerControls.ForEach((PlayerControl playerControl) =>
		{
			Note lastNoteInSong = playerControl.GetLastNoteInSong();
			if (lastNoteInSong != null && !isAfterEndOfSong && CurrentBeat < (double)lastNoteInSong.EndBeat)
			{
				isAfterLastNote = false;
			}
		});
		if (isAfterLastNote && !list.IsNullOrEmpty())
		{
			UpdateSongFinishedStats(list);
		}
		PlayerControls.ForEach((PlayerControl playerControl) =>
		{
			playerControl.PlayerMicPitchTracker.SendStopRecordingMessageToConnectedClient();
		});
		sceneNavigator.LoadScene(EScene.SingingResultsScene, singingResultsSceneData);
	}

	private List<ConnectedClientHandlerAndMicProfile> GetConnectedClientHandlers()
	{
		IEnumerable<MicProfile> micProfiles = PlayerControls.Select((PlayerControl playerProfile) => playerProfile.MicProfile);
		return serverSideConnectRequestManager.GetConnectedClientHandlers(micProfiles);
	}

	private void UpdateSongFinishedStats(List<SongStatistic> songStatistics)
	{
		statistics.RecordSongFinished(SongMeta, songStatistics);
	}

	private PlayerControl CreatePlayerControl(PlayerProfile playerProfile, MicProfile micProfile, int playerIndex)
	{
		Voice voice = GetVoice(playerProfile);
		PlayerControl playerControl = UnityEngine.Object.Instantiate(playerControlPrefab);
		Injector obj = UniInjectUtils.CreateInjector(injector);
		obj.AddBindingForInstance(playerProfile);
		obj.AddBindingForInstance(voice);
		obj.AddBindingForInstance(micProfile);
		obj.AddBindingForInstance(obj, RebindingBehavior.Ignore);
		obj.Inject(playerControl);
		PlayerControls.Add(playerControl);
		AddPlayerUi(playerControl.PlayerUiControl.RootVisualElement, playerIndex);
		return playerControl;
	}

	private void AddPlayerUi(VisualElement visualElement, int playerIndex)
	{
		int count = sceneData.SelectedPlayerProfiles.Count;
		if (count <= 3)
		{
			playerUiContainer.Add(visualElement);
			return;
		}
		int num = (int)((float)playerUiColumns.Length * (float)playerIndex / (float)count);
		playerUiColumns[num].Add(visualElement);
	}

	private string GetVoiceName(PlayerProfile playerProfile)
	{
		List<string> list = new List<string>(SongMeta.VoiceNames.Keys);
		if (list.Count <= 1)
		{
			return Voice.soloVoiceName;
		}
		if (sceneData.PlayerProfileToVoiceNameMap.TryGetValue(playerProfile, out var value))
		{
			return value;
		}
		if (sceneData.SelectedPlayerProfiles.Count == 1)
		{
			return Voice.soloVoiceName;
		}
		int index = sceneData.SelectedPlayerProfiles.IndexOf(playerProfile) % list.Count;
		return list[index];
	}

	public void TogglePlayPause()
	{
		if (songAudioPlayer.IsPlaying)
		{
			pauseOverlay.ShowByDisplay();
			songAudioPlayer.PauseAudio();
			PlayerControls.ForEach((PlayerControl playerControl) =>
			{
				playerControl.PlayerMicPitchTracker.SendStopRecordingMessageToConnectedClient();
			});
			return;
		}
		pauseOverlay.HideByDisplay();
		songAudioPlayer.PlayAudio();
		PlayerControls.ForEach((PlayerControl playerControl) =>
		{
			playerControl.PlayerMicPitchTracker.SendPositionInSongToClientRapidly();
			playerControl.PlayerMicPitchTracker.SendStartRecordingMessageToConnectedClient();
		});
	}

	private IEnumerator StartAudioPlayback()
	{
		if (songAudioPlayer.IsPlaying)
		{
			Debug.LogWarning("Song already playing");
			yield break;
		}
		songAudioPlayer.Init(SongMeta);
		if (!songAudioPlayer.HasAudioClip)
		{
			PlayerControls.ForEach((PlayerControl playerControl) =>
			{
				playerControl.PlayerMicPitchTracker.SendStopRecordingMessageToConnectedClient();
			});
			sceneNavigator.LoadScene(EScene.SongSelectScene);
			yield break;
		}
		InitTimeBar();
		songAudioPlayer.PlayAudio();
		if (sceneData.PositionInSongInMillis > 0.0)
		{
			SkipToPositionInSong(sceneData.PositionInSongInMillis);
		}
	}

	public List<UniInject.IBinding> GetBindings()
	{
		SingSceneData sceneDataOrThrow = SceneNavigator.GetSceneDataOrThrow<SingSceneData>();
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(this);
		bindingBuilder.BindExistingInstance(base.gameObject);
		bindingBuilder.BindExistingInstance(sceneDataOrThrow);
		bindingBuilder.BindExistingInstance(sceneDataOrThrow.SelectedSongMeta);
		bindingBuilder.BindExistingInstance(songAudioPlayer);
		bindingBuilder.BindExistingInstance(songVideoPlayer);
		bindingBuilder.Bind("playerUi").ToExistingInstance(playerUi);
		bindingBuilder.Bind("sentenceRatingUi").ToExistingInstance(sentenceRatingUi);
		bindingBuilder.Bind("noteUi").ToExistingInstance(noteUi);
		bindingBuilder.Bind("perfectEffectStarUi").ToExistingInstance(perfectEffectStarUi);
		bindingBuilder.Bind("goldenNoteStarUi").ToExistingInstance(goldenNoteStarUi);
		bindingBuilder.Bind("goldenNoteHitStarUi").ToExistingInstance(goldenNoteHitStarUi);
		return bindingBuilder.GetBindings();
	}

	private Voice GetVoice(PlayerProfile playerProfile)
	{
		string voiceName = GetVoiceName(playerProfile);
		IReadOnlyCollection<Voice> voices = sceneData.SelectedSongMeta.GetVoices();
		Voice voice = voices.FirstOrDefault((Voice it) => it.VoiceNameEquals(voiceName));
		if (voice != null)
		{
			return voice;
		}
		string text = voices.Select((Voice it) => it.Name).ToCsv();
		Debug.LogError("The song data does not contain a voice with name " + voiceName + ". Available voice names: " + text);
		return voices.FirstOrDefault();
	}

	private void UpdateInputLegend()
	{
		(from label in inputLegend.Query<Label>()
			where !(label is FontIcon)
			select label).ForEach((Label label) =>
		{
			label.RemoveFromHierarchy();
		});
		InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_back, TranslationManager.GetTranslation(R.Messages.back), inputLegend);
		InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_openSongEditor, TranslationManager.GetTranslation(R.Messages.action_openSongEditor), inputLegend);
		InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_restartSong, TranslationManager.GetTranslation(R.Messages.action_restart), inputLegend);
		if (inputManager.InputDeviceEnum == EInputDevice.Touch)
		{
			inputLegend.Add(InputLegendControl.CreateInputActionInfoUi(new InputActionInfo(TranslationManager.GetTranslation(R.Messages.continue_), TranslationManager.GetTranslation(R.Messages.action_doubleTap))));
			inputLegend.Add(InputLegendControl.CreateInputActionInfoUi(new InputActionInfo(TranslationManager.GetTranslation(R.Messages.action_openContextMenu), TranslationManager.GetTranslation(R.Messages.action_longPress))));
		}
		else
		{
			inputLegend.Add(InputLegendControl.CreateInputActionInfoUi(new InputActionInfo(TranslationManager.GetTranslation(R.Messages.action_skipToNextLyrics), TranslationManager.GetTranslation(R.Messages.action_navigateRight))));
		}
	}

	public void CloseDialog()
	{
		if (dialogControl != null)
		{
			dialogControl.CloseDialog();
			dialogControl = null;
		}
	}

	protected void FillContextMenu(ContextMenuPopupControl contextMenuPopup)
	{
		contextMenuPopup.AddItem(TranslationManager.GetTranslation(R.Messages.action_togglePause), () =>
		{
			TogglePlayPause();
		});
		webcamControl.AddToContextMenu(contextMenuPopup);
		contextMenuPopup.AddItem(TranslationManager.GetTranslation(R.Messages.action_restart), () =>
		{
			Restart();
		});
		contextMenuPopup.AddItem(TranslationManager.GetTranslation(R.Messages.action_skipToNextLyrics), () =>
		{
			SkipToNextSingableNote();
		});
		contextMenuPopup.AddItem(TranslationManager.GetTranslation(R.Messages.action_exitSong), () =>
		{
			FinishScene(isAfterEndOfSong: false);
		});
		contextMenuPopup.AddItem(TranslationManager.GetTranslation(R.Messages.action_openSongEditor), () =>
		{
			OpenSongInEditor();
		});
	}
}
