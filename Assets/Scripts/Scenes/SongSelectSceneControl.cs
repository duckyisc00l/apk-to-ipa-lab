using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UIElements;

public class SongSelectSceneControl : MonoBehaviour, INeedInjection, IBinder, ITranslator, IInjectionFinishedListener
{
	[InjectedInInspector]
	public VectorImage favoriteImageAsset;

	[InjectedInInspector]
	public VectorImage noFavoriteImageAsset;

	[InjectedInInspector]
	public SongSelectSceneInputControl songSelectSceneInputControl;

	[InjectedInInspector]
	public SongAudioPlayer songAudioPlayer;

	[InjectedInInspector]
	public SongVideoPlayer songVideoPlayer;

	[InjectedInInspector]
	public SongRouletteControl songRouletteControl;

	[InjectedInInspector]
	public CharacterQuickJumpListControl characterQuickJumpListControl;

	[InjectedInInspector]
	public SongSelectFocusableNavigator focusableNavigator;

	[InjectedInInspector]
	public SongSelectSongPreviewControl songPreviewControl;

	[InjectedInInspector]
	public SongSelectPlayerListControl playerListControl;

	[InjectedInInspector]
	public SongSelectMicListControl micListControl;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private UltraStarPlayInputManager inputManager;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "inputLegend")]
	private VisualElement inputLegend;

	[Inject(UxmlName = "menuOverlayInputLegend")]
	private VisualElement menuOverlayInputLegend;

	[Inject(UxmlName = "songIndexLabel")]
	private Label songIndexLabel;

	[Inject(UxmlName = "songIndexButton")]
	private Button songIndexButton;

	[Inject(UxmlName = "durationLabel")]
	private Label durationLabel;

	[Inject(UxmlName = "yearLabel")]
	private Label yearLabel;

	[Inject(UxmlName = "genreLabel")]
	private Label genreLabel;

	[Inject(UxmlName = "timesClearedLabel")]
	private Label timesClearedLabel;

	[Inject(UxmlName = "timesCanceledLabel")]
	private Label timesCanceledLabel;

	[Inject(UxmlName = "videoIcon")]
	private VisualElement videoIndicator;

	[Inject(UxmlName = "duetIcon")]
	private VisualElement duetIcon;

	[Inject(UxmlName = "noFavoriteIcon")]
	private MaterialIcon noFavoriteIcon;

	[Inject(UxmlName = "favoriteIcon")]
	private MaterialIcon favoriteIcon;

	[Inject(UxmlName = "localHighScoreContainer")]
	private VisualElement localHighScoreContainer;

	[Inject(UxmlName = "onlineHighScoreContainer")]
	private VisualElement onlineHighScoreContainer;

	[Inject(UxmlName = "toggleFavoriteButton")]
	private Button toggleFavoriteButton;

	[Inject(UxmlName = "fuzzySearchTextLabel")]
	private Label fuzzySearchTextLabel;

	[Inject(UxmlName = "playerSelectOverlayContainer")]
	private VisualElement playerSelectOverlayContainer;

	[Inject(UxmlName = "closePlayerSelectOverlayButton")]
	private Button closePlayerSelectOverlayButton;

	[Inject(UxmlName = "leftLyricsOverlay")]
	private VisualElement leftLyricsOverlay;

	[Inject(UxmlName = "rightLyricsOverlay")]
	private VisualElement rightLyricsOverlay;

	[Inject(UxmlName = "startButton")]
	private Button startButton;

	[Inject(UxmlName = "menuButton")]
	private Button menuButton;

	[Inject(UxmlName = "menuOverlay")]
	private VisualElement menuOverlay;

	[Inject(UxmlName = "closeMenuOverlayButton")]
	private Button closeMenuOverlayButton;

	[Inject(UxmlName = "songDetailOverlay")]
	private VisualElement songDetailOverlay;

	[Inject(UxmlName = "toggleSongDetailOverlayButton")]
	private Button toggleSongDetailOverlayButton;

	[Inject(UxmlName = "songDetailOverlayScrollView")]
	private VisualElement songDetailOverlayScrollView;

	[Inject(UxmlName = "backToMainMenuButton")]
	private Button backToMainMenuButton;

	[Inject(UxmlName = "nextSongButton")]
	private Button nextSongButton;

	[Inject(UxmlName = "previousSongButton")]
	private Button previousSongButton;

	[Inject(UxmlName = "duetLegendLabel")]
	private Label duetLegendLabel;

	[Inject(UxmlName = "videoLegendLabel")]
	private Label videoLegendLabel;

	[Inject(UxmlName = "songOrderPicker")]
	private ItemPicker songOrderItemPicker;

	[Inject(UxmlName = "scoreModeLabel")]
	private Label scoreModeLabel;

	[Inject(UxmlName = "scoreModePicker")]
	private ItemPicker scoreModePicker;

	[Inject(UxmlName = "noteDisplayModeLabel")]
	private Label noteDisplayModeLabel;

	[Inject(UxmlName = "noteDisplayModePicker")]
	private ItemPicker noteDisplayModePicker;

	[Inject(UxmlName = "micListOverlay")]
	private VisualElement micListOverlay;

	[Inject(UxmlName = "singingOptionsScrollView")]
	private VisualElement singingOptionsScrollView;

	[Inject(UxmlName = "toggleSingingOptionsButton")]
	private Button toggleSingingOptionsButton;

	[Inject(UxmlName = "playerScrollView")]
	private VisualElement playerScrollView;

	[Inject]
	private SongSelectSceneData sceneData;

	private List<SongMeta> songMetas;

	private int lastSongMetasReloadFrame = -1;

	private string lastRawSearchText;

	private SongMeta selectedSongBeforeSearch;

	[Inject]
	private Statistics statistics;

	[Inject(Optional = true)]
	private EventSystem eventSystem;

	[Inject]
	private PlaylistManager playlistManager;

	[Inject]
	private Injector injector;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMetaManager songMetaManager;

	[Inject(UxmlName = "noSongsFoundLabel")]
	private Label noSongsFoundLabel;

	[Inject(UxmlName = "noSongsFoundContainer")]
	private VisualElement noSongsFoundContainer;

	[Inject(UxmlName = "downloadSongsButton")]
	private Button downloadSongsButton;

	[Inject(UxmlName = "addSongFolderButton")]
	private Button addSongFolderButton;

	[Inject(UxmlName = "showSearchExpressionInfoButton")]
	private Button showSearchExpressionInfoButton;

	[Inject(UxmlName = "closeSearchExpressionInfoButton")]
	private Button closeSearchExpressionInfoButton;

	[Inject(UxmlName = "searchExpressionInfoOverlay")]
	private VisualElement searchExpressionInfoOverlay;

	[Inject(UxmlName = "searchExpressionInfoLabel")]
	private Label searchExpressionInfoLabel;

	[Inject(UxmlName = "searchExpressionInfoSyntaxTipsLabel")]
	private Label searchExpressionInfoSyntaxTipsLabel;

	private SongSearchControl songSearchControl;

	public SongOrderPickerControl SongOrderPickerControl { get; private set; }

	public PlaylistChooserControl PlaylistChooserControl { get; private set; }

	public bool IsPlayerSelectOverlayVisible => playerSelectOverlayContainer.IsVisibleByDisplay();

	public bool IsMenuOverlayVisible => menuOverlay.IsVisibleByDisplay();

	public bool IsSongDetailOverlayVisible => songDetailOverlay.IsVisibleByDisplay();

	public bool IsSearchExpressionInfoOverlayVisible => searchExpressionInfoOverlay.IsVisibleByDisplay();

	public SongSearchControl SongSearchControl
	{
		get
		{
			if (songSearchControl == null)
			{
				songSearchControl = new SongSearchControl();
				injector.Inject(songSearchControl);
			}
			return songSearchControl;
		}
	}

	public SongMeta SelectedSong => songRouletteControl.Selection.Value.SongMeta;

	public int SelectedSongIndex => songRouletteControl.Songs.IndexOf(SelectedSong);

	private void Start()
	{
		songMetaManager.ScanFilesIfNotDoneYet();
		if (!SongMetaManager.IsSongScanFinished)
		{
			Thread.Sleep(100);
		}
		InitSongMetas();
		HidePlayerSelectOverlay();
		HideMenuOverlay();
		HideSongDetailOverlay();
		HideSearchExpressionInfoOverlay();
		SongOrderPickerControl = new SongOrderPickerControl(songOrderItemPicker);
		toggleFavoriteButton.RegisterCallbackButtonTriggered(() =>
		{
			ToggleSelectedSongIsFavorite();
		});
		closePlayerSelectOverlayButton.RegisterCallbackButtonTriggered(() =>
		{
			HidePlayerSelectOverlay();
		});
		fuzzySearchTextLabel.ShowByDisplay();
		songSelectSceneInputControl.FuzzySearchText.Subscribe((string newValue) =>
		{
			fuzzySearchTextLabel.text = newValue;
		});
		startButton.RegisterCallbackButtonTriggered(() =>
		{
			CheckAudioAndStartSingScene();
		});
		menuButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowMenuOverlay();
		});
		closeMenuOverlayButton.RegisterCallbackButtonTriggered(() =>
		{
			HideMenuOverlay();
		});
		backToMainMenuButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.MainScene);
		});
		toggleSongDetailOverlayButton.RegisterCallbackButtonTriggered(() =>
		{
			if (IsSongDetailOverlayVisible)
			{
				HideSongDetailOverlay();
			}
			else
			{
				ShowSongDetailOverlay();
			}
		});
		InitSearchExpressionInfo();
		nextSongButton.RegisterCallbackButtonTriggered(() =>
		{
			songRouletteControl.SelectNextSong();
		});
		previousSongButton.RegisterCallbackButtonTriggered(() =>
		{
			songRouletteControl.SelectPreviousSong();
		});
		UpdateNextAndPreviousSongButtonLabels();
		inputManager.InputDeviceChangeEventStream.Subscribe((InputDeviceChangeEvent evt) =>
		{
			UpdateNextAndPreviousSongButtonLabels();
		});
		songIndexButton.RegisterCallbackButtonTriggered(() =>
		{
			songSearchControl.SetSearchText($"#{SelectedSongIndex + 1}");
		});
		SongSearchControl.SearchChangedEventStream.Throttle(new TimeSpan(0, 0, 0, 0, 500)).Subscribe((SongSearchControl.SearchChangedEvent _) =>
		{
			OnSearchTextChanged();
		});
		PlaylistChooserControl.Selection.Subscribe((UltraStarPlaylist _) =>
		{
			UpdateFilteredSongs();
		});
		SongOrderPickerControl.Selection.Subscribe((ESongOrder newValue) =>
		{
			settings.SongSelectSettings.songOrder = newValue;
			characterQuickJumpListControl.UpdateCharacters();
			UpdateFilteredSongs();
		});
		playlistManager.PlaylistChangeEventStream.Subscribe((PlaylistManager.PlaylistChangeEvent playlistChangeEvent) =>
		{
			if (playlistChangeEvent.Playlist == PlaylistChooserControl.Selection.Value)
			{
				UpdateFilteredSongs();
			}
			UpdateFavoriteIcon();
		});
		InitSongRouletteSongMetas();
		songRouletteControl.SelectionClickedEventStream.Subscribe((SongSelection _) =>
		{
			CheckAudioAndStartSingScene();
		});
		UpdateInputLegend();
		inputManager.InputDeviceChangeEventStream.Subscribe((InputDeviceChangeEvent _) =>
		{
			UpdateInputLegend();
		});
		focusableNavigator.FocusSongRoulette();
		songAudioPlayer.AudioClipLoadedEventStream.Subscribe((AudioClip _) =>
		{
			UpdateSongDurationLabel(songAudioPlayer.DurationOfSongInMillis);
		});
		downloadSongsButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.ContentDownloadScene);
		});
		addSongFolderButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.SongLibraryOptionsScene);
		});
		ShowPlayerSelectContainer();
		toggleSingingOptionsButton.RegisterCallbackButtonTriggered(() =>
		{
			TogglePlayerSelectAndSingingOptions();
		});
		new ScoreModeItemPickerControl(scoreModePicker).Bind(() => settings.GameSettings.ScoreMode, (EScoreMode newValue) =>
		{
			settings.GameSettings.ScoreMode = newValue;
		});
		new NoteDisplayModeItemPickerControl(noteDisplayModePicker).Bind(() => settings.GraphicSettings.noteDisplayMode, (ENoteDisplayMode newValue) =>
		{
			settings.GraphicSettings.noteDisplayMode = newValue;
		});
	}

	public void HideSearchExpressionInfoOverlay()
	{
		searchExpressionInfoOverlay.HideByDisplay();
	}

	private void InitSearchExpressionInfo()
	{
		showSearchExpressionInfoButton.RegisterCallbackButtonTriggered(() =>
		{
			searchExpressionInfoOverlay.ShowByDisplay();
		});
		closeSearchExpressionInfoButton.RegisterCallbackButtonTriggered(() =>
		{
			HideSearchExpressionInfoOverlay();
		});
	}

	private void ShowPlayerSelectContainer()
	{
		playerScrollView.ShowByDisplay();
		micListOverlay.ShowByDisplay();
		singingOptionsScrollView.HideByDisplay();
		toggleSingingOptionsButton.Q<VisualElement>("settingsIcon").ShowByDisplay();
		toggleSingingOptionsButton.Q<VisualElement>("playersIcon").HideByDisplay();
	}

	private void ShowSingingOptionsContainer()
	{
		playerScrollView.HideByDisplay();
		micListOverlay.HideByDisplay();
		singingOptionsScrollView.ShowByDisplay();
		toggleSingingOptionsButton.Q<VisualElement>("settingsIcon").HideByDisplay();
		toggleSingingOptionsButton.Q<VisualElement>("playersIcon").ShowByDisplay();
	}

	private void TogglePlayerSelectAndSingingOptions()
	{
		if (playerScrollView.IsVisibleByDisplay())
		{
			ShowSingingOptionsContainer();
		}
		else
		{
			ShowPlayerSelectContainer();
		}
	}

	private void UpdateNextAndPreviousSongButtonLabels()
	{
		if (inputManager.InputDeviceEnum == EInputDevice.Gamepad)
		{
			nextSongButton.text = "R1 >";
			previousSongButton.text = "< L1";
		}
		else
		{
			nextSongButton.text = ">";
			previousSongButton.text = "<";
		}
	}

	public void ShowMenuOverlay()
	{
		menuOverlay.ShowByDisplay();
		closeMenuOverlayButton.Focus();
	}

	public void HideMenuOverlay()
	{
		menuOverlay.HideByDisplay();
		menuButton.Focus();
	}

	public void ShowSongDetailOverlay()
	{
		songDetailOverlay.ShowByDisplay();
		UpdateSongDetailsInOverlay();
	}

	public void HideSongDetailOverlay()
	{
		songDetailOverlay.HideByDisplay();
	}

	private void UpdateFavoriteIcon()
	{
		bool flag = IsFavorite(SelectedSong);
		favoriteIcon.SetVisibleByDisplay(flag);
		noFavoriteIcon.SetVisibleByDisplay(!flag);
	}

	public void InitSongMetas()
	{
		songMetas = new List<SongMeta>(songMetaManager.GetSongMetas());
		songMetas.Sort((SongMeta songMeta1, SongMeta songMeta2) => string.Compare(songMeta1.Artist, songMeta2.Artist, ignoreCase: true, CultureInfo.InvariantCulture));
		noSongsFoundLabel.SetVisibleByDisplay(songMetas.IsNullOrEmpty());
		noSongsFoundContainer.SetVisibleByDisplay(songMetas.IsNullOrEmpty());
	}

	private void Update()
	{
		if (songMetas.Count != songMetaManager.GetSongMetas().Count && lastSongMetasReloadFrame + 10 < Time.frameCount)
		{
			InitSongMetas();
			SongMeta songMeta = songRouletteControl.Selection.Value.SongMeta;
			InitSongRouletteSongMetas();
			songRouletteControl.SelectSong(songMeta);
		}
	}

	private void InitSongRouletteSongMetas()
	{
		lastSongMetasReloadFrame = Time.frameCount;
		UpdateFilteredSongs();
		if (sceneData.SongMeta != null)
		{
			songRouletteControl.SelectSong(sceneData.SongMeta);
		}
		songRouletteControl.Selection.Subscribe((SongSelection newValue) =>
		{
			OnSongSelectionChanged(newValue);
		});
	}

	private void OnSongSelectionChanged(SongSelection selection)
	{
		songRouletteControl.HideSongMenuOverlay();
		SongMeta songMeta = selection.SongMeta;
		if (songMeta == null)
		{
			SetEmptySongDetails();
			songIndexLabel.text = "-";
			return;
		}
		genreLabel.text = songMeta.Genre;
		yearLabel.text = ((songMeta.Year != 0) ? songMeta.Year.ToString() : "");
		songIndexLabel.text = selection.SongIndex + 1 + "\nof " + selection.SongsCount;
		durationLabel.text = "";
		bool isVisible = !songMeta.Video.IsNullOrEmpty();
		videoIndicator.SetVisibleByVisibility(isVisible);
		bool isVisible2 = songMeta.VoiceNames.Count > 1;
		duetIcon.SetVisibleByVisibility(isVisible2);
		UpdateFavoriteIcon();
		UpdateSongStatistics(songMeta);
		if (IsSongDetailOverlayVisible)
		{
			UpdateSongDetailsInOverlay();
		}
	}

	private void UpdateSongDurationLabel(double durationInMillis)
	{
		int num = (int)Math.Floor(durationInMillis / 1000.0 / 60.0);
		int num2 = (int)Math.Floor(durationInMillis / 1000.0 % 60.0);
		durationLabel.text = $"{num}:{num2.ToString().PadLeft(2, '0')}";
	}

	private void UpdateSongStatistics(SongMeta songMeta)
	{
		LocalStatistic localStats = statistics.GetLocalStats(songMeta);
		if (localStats != null)
		{
			timesClearedLabel.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_timesClearedInfo, "value", localStats.TimesFinished);
			timesCanceledLabel.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_timesCanceledInfo, "value", localStats.TimesCanceled);
			List<int> topScores = (from it in localStats.StatsEntries.GetTopScores(3)
				select it.Score).ToList();
			UpdateTopScoreLabels(topScores, localHighScoreContainer);
			UpdateTopScoreLabels(new List<int>(), onlineHighScoreContainer);
		}
		else
		{
			timesClearedLabel.text = "";
			timesCanceledLabel.text = "";
			UpdateTopScoreLabels(new List<int>(), localHighScoreContainer);
			UpdateTopScoreLabels(new List<int>(), onlineHighScoreContainer);
		}
	}

	private void UpdateTopScoreLabels(List<int> topScores, VisualElement labelContainer)
	{
		string text = ((topScores.Count >= 1) ? topScores[0].ToString() : "-");
		string text2 = ((topScores.Count >= 2) ? topScores[1].ToString() : "-");
		string text3 = ((topScores.Count >= 3) ? topScores[2].ToString() : "-");
		labelContainer.Q<Label>("first").text = text;
		labelContainer.Q<Label>("second").text = text2;
		labelContainer.Q<Label>("third").text = text3;
	}

	public void DoFuzzySearch(string text)
	{
		string searchTextToLowerNoWhitespace = text.ToLowerInvariant().Replace(" ", "");
		if (searchTextToLowerNoWhitespace.IsNullOrEmpty() || TryExecuteSpecialSearchSyntax(text))
		{
			return;
		}
		SongMeta songMeta = songRouletteControl.Find((SongMeta it) => it.Title.ToLowerInvariant().Replace(" ", "").StartsWith(searchTextToLowerNoWhitespace));
		if (songMeta != null)
		{
			songRouletteControl.SelectSong(songMeta);
			return;
		}
		SongMeta songMeta2 = songRouletteControl.Find((SongMeta it) => it.Artist.ToLowerInvariant().Replace(" ", "").StartsWith(searchTextToLowerNoWhitespace));
		if (songMeta2 != null)
		{
			songRouletteControl.SelectSong(songMeta2);
			return;
		}
		SongMeta songMeta3 = songRouletteControl.Find((SongMeta it) =>
		{
			string text2 = it.Artist.ToLowerInvariant().Replace(" ", "");
			string text3 = it.Title.ToLowerInvariant().Replace(" ", "");
			return text2.Contains(searchTextToLowerNoWhitespace) || text3.Contains(searchTextToLowerNoWhitespace);
		});
		if (songMeta3 != null)
		{
			songRouletteControl.SelectSong(songMeta3);
		}
	}

	private SingSceneData CreateSingSceneData(SongMeta songMeta)
	{
		SingSceneData singSceneData = new SingSceneData();
		singSceneData.SelectedSongMeta = songMeta;
		List<PlayerProfile> selectedPlayerProfiles = playerListControl.GetSelectedPlayerProfiles();
		if (selectedPlayerProfiles.IsNullOrEmpty())
		{
			UiManager.CreateNotification(TranslationManager.GetTranslation(R.Messages.songSelectScene_noPlayerSelected_title));
			return null;
		}
		singSceneData.SelectedPlayerProfiles = selectedPlayerProfiles;
		singSceneData.PlayerProfileToMicProfileMap = playerListControl.GetSelectedPlayerProfileToMicProfileMap();
		singSceneData.PlayerProfileToVoiceNameMap = playerListControl.GetSelectedPlayerProfileToVoiceNameMap();
		return singSceneData;
	}

	private void StartSingScene(SongMeta songMeta)
	{
		if (songMeta.FailedToLoadVoices)
		{
			UiManager.CreateNotification("Failed to load song. Check log for details.");
			return;
		}
		SingSceneData singSceneData = CreateSingSceneData(songMeta);
		if (singSceneData != null)
		{
			sceneNavigator.LoadScene(EScene.SingScene, singSceneData);
		}
	}

	private void StartSongEditorScene(SongMeta songMeta)
	{
		if (songMeta.FailedToLoadVoices)
		{
			UiManager.CreateNotification("Failed to load song. Check log for details.");
			return;
		}
		SongEditorSceneData songEditorSceneData = new SongEditorSceneData();
		songEditorSceneData.SelectedSongMeta = songMeta;
		SingSceneData singSceneData = CreateSingSceneData(songMeta);
		if (singSceneData != null)
		{
			songEditorSceneData.PlayerProfileToMicProfileMap = singSceneData.PlayerProfileToMicProfileMap;
			songEditorSceneData.SelectedPlayerProfiles = singSceneData.SelectedPlayerProfiles;
		}
		songEditorSceneData.PreviousSceneData = sceneData;
		songEditorSceneData.PreviousScene = EScene.SongSelectScene;
		sceneNavigator.LoadScene(EScene.SongEditorScene, songEditorSceneData);
	}

	private SongSelectSceneData CreateDefaultSceneData()
	{
		return new SongSelectSceneData();
	}

	private void SetEmptySongDetails()
	{
		genreLabel.text = "";
		yearLabel.text = "";
		timesClearedLabel.text = "";
		timesCanceledLabel.text = "";
		videoIndicator.HideByVisibility();
		duetIcon.HideByVisibility();
		UpdateFavoriteIcon();
	}

	public void OnRandomSong()
	{
		songRouletteControl.SelectRandomSong();
	}

	public void CheckAudioAndStartSingScene()
	{
		if (playerSelectOverlayContainer.IsVisibleByDisplay())
		{
			StartSingScene(SelectedSong);
		}
		else if (SelectedSong.VoiceNames.Count <= 1 && playerListControl.PlayerEntryControlControls.Count == 1 && micListControl.MicEntryControls.Count == 1)
		{
			playerListControl.PlayerEntryControlControls[0].MicProfile = micListControl.MicEntryControls[0].MicProfile;
			playerListControl.PlayerEntryControlControls[0].SetSelected(newIsSelected: true);
			StartSingScene(SelectedSong);
		}
		else
		{
			if (SelectedSong == null)
			{
				return;
			}
			if (!WebRequestUtils.IsHttpOrHttpsUri(SelectedSong.Mp3))
			{
				string audioUri = SongMetaUtils.GetAudioUri(SelectedSong);
				if (!SongMetaUtils.AudioResourceExists(SelectedSong))
				{
					string text = "Audio file resource does not exist: " + audioUri;
					Debug.Log(text);
					UiManager.CreateNotification(text);
					return;
				}
			}
			songAudioPlayer.Init(SelectedSong);
			if (!songAudioPlayer.HasAudioClip)
			{
				string text2 = "Audio file '" + SelectedSong.Mp3 + "' could not be loaded.\nPlease use a supported format.";
				Debug.Log(text2);
				UiManager.CreateNotification(text2);
			}
			else
			{
				ShowPlayerSelectOverlay();
			}
		}
	}

	private void ShowPlayerSelectOverlay()
	{
		playerSelectOverlayContainer.ShowByDisplay();
		UpdateInputLegend();
		bool flag = SelectedSong.VoiceNames.Count > 1;
		leftLyricsOverlay.SetVisibleByDisplay(flag);
		rightLyricsOverlay.SetVisibleByDisplay(flag);
		if (flag)
		{
			List<string> list = SelectedSong.VoiceNames.Values.ToList();
			leftLyricsOverlay.Q<Label>("voiceNameLabel").text = list[0];
			leftLyricsOverlay.Q<Label>("lyricsLabel").text = SongMetaUtils.GetLyrics(SelectedSong, Voice.firstVoiceName);
			rightLyricsOverlay.Q<Label>("voiceNameLabel").text = list[1];
			rightLyricsOverlay.Q<Label>("lyricsLabel").text = SongMetaUtils.GetLyrics(SelectedSong, Voice.secondVoiceName);
			playerListControl.ShowVoiceSelection(SelectedSong);
		}
		else
		{
			playerListControl.HideVoiceSelection();
		}
		StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(1, () =>
		{
			playerSelectOverlayContainer.Q<Button>("startButton").Focus();
		}));
	}

	public void HidePlayerSelectOverlay()
	{
		playerSelectOverlayContainer.HideByDisplay();
		UpdateInputLegend();
	}

	public void StartSongEditorScene()
	{
		if (SelectedSong != null)
		{
			StartSongEditorScene(SelectedSong);
		}
	}

	public void OnSearchTextChanged()
	{
		SongMeta selectedSong = SelectedSong;
		string rawSearchText = songSearchControl.GetRawSearchText();
		if (lastRawSearchText.IsNullOrEmpty() && !rawSearchText.IsNullOrEmpty())
		{
			selectedSongBeforeSearch = SelectedSong;
		}
		lastRawSearchText = rawSearchText;
		if (TryExecuteSpecialSearchSyntax(rawSearchText))
		{
			return;
		}
		UpdateFilteredSongs();
		if (songSearchControl.GetSearchText().IsNullOrEmpty())
		{
			if (selectedSong != null)
			{
				songRouletteControl.SelectSong(selectedSong);
			}
			else if (selectedSongBeforeSearch != null)
			{
				songRouletteControl.SelectSong(selectedSongBeforeSearch);
			}
		}
	}

	public List<SongMeta> GetFilteredSongMetas()
	{
		UltraStarPlaylist playlist = PlaylistChooserControl.Selection.Value;
		return (from songMeta in songSearchControl.GetFilteredSongMetas(songMetas)
			where playlist == null || playlist.HasSongEntry(songMeta.Artist, songMeta.Title)
			orderby GetSongMetaOrderByProperty(songMeta)
			select songMeta).ToList();
	}

	private object GetSongMetaOrderByProperty(SongMeta songMeta)
	{
		switch (SongOrderPickerControl.SelectedItem)
		{
		case ESongOrder.Artist:
			return songMeta.Artist;
		case ESongOrder.Title:
			return songMeta.Title;
		case ESongOrder.Genre:
			return songMeta.Genre;
		case ESongOrder.Language:
			return songMeta.Language;
		case ESongOrder.Folder:
			return songMeta.Directory + "/" + songMeta.Filename;
		case ESongOrder.Year:
			return songMeta.Year;
		case ESongOrder.CountCanceled:
			return statistics.GetLocalStats(songMeta)?.TimesCanceled;
		case ESongOrder.CountFinished:
			return statistics.GetLocalStats(songMeta)?.TimesFinished;
		default:
			Debug.LogWarning("Unknown order for songs: " + SongOrderPickerControl.SelectedItem);
			return songMeta.Artist;
		}
	}

	public void ToggleSelectedPlayers()
	{
		playerListControl.ToggleSelectedPlayers();
	}

	public List<UniInject.IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(this);
		bindingBuilder.BindExistingInstance(base.gameObject);
		bindingBuilder.BindExistingInstance(SceneNavigator.GetSceneData(CreateDefaultSceneData()));
		bindingBuilder.BindExistingInstance(songRouletteControl);
		bindingBuilder.BindExistingInstance(songSelectSceneInputControl);
		bindingBuilder.BindExistingInstance(songAudioPlayer);
		bindingBuilder.BindExistingInstance(songVideoPlayer);
		bindingBuilder.BindExistingInstance(SongOrderPickerControl);
		bindingBuilder.BindExistingInstance(characterQuickJumpListControl);
		bindingBuilder.BindExistingInstance(playerListControl);
		bindingBuilder.BindExistingInstance(focusableNavigator);
		bindingBuilder.Bind(typeof(FocusableNavigator)).ToExistingInstance(focusableNavigator);
		bindingBuilder.BindExistingInstance(songPreviewControl);
		return bindingBuilder.GetBindings();
	}

	public void ToggleFavoritePlaylist()
	{
		PlaylistChooserControl.ToggleFavoritePlaylist();
	}

	public void ToggleSelectedSongIsFavorite()
	{
		if (SelectedSong != null)
		{
			if (playlistManager.FavoritesPlaylist.HasSongEntry(SelectedSong.Artist, SelectedSong.Title))
			{
				playlistManager.RemoveSongFromPlaylist(playlistManager.FavoritesPlaylist, SelectedSong);
			}
			else
			{
				playlistManager.AddSongToPlaylist(playlistManager.FavoritesPlaylist, SelectedSong);
			}
		}
	}

	public void UpdateFilteredSongs()
	{
		songRouletteControl.SetSongs(GetFilteredSongMetas());
	}

	public bool IsPlaylistActive()
	{
		if (PlaylistChooserControl.Selection.Value != null)
		{
			return !(PlaylistChooserControl.Selection.Value is UltraStarAllSongsPlaylist);
		}
		return false;
	}

	public void ResetPlaylistSelection()
	{
		PlaylistChooserControl.Reset();
	}

	private bool TryExecuteSpecialSearchSyntax(string searchText)
	{
		if (searchText != null && searchText.StartsWith("#") && int.TryParse(searchText.Substring(1), out var result))
		{
			songRouletteControl.SelectSongByIndex(result - 1, wrapAround: false);
			return true;
		}
		return false;
	}

	public void UpdateTranslation()
	{
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_title);
		menuButton.text = TranslationManager.GetTranslation(R.Messages.menu);
		closeMenuOverlayButton.text = TranslationManager.GetTranslation(R.Messages.back);
		backToMainMenuButton.text = TranslationManager.GetTranslation(R.Messages.mainScene_title);
		toggleSongDetailOverlayButton.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_toggleSongDetailsButton);
		duetLegendLabel.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_duetLegendLabel);
		videoLegendLabel.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_videoLegendLabel);
		closePlayerSelectOverlayButton.text = TranslationManager.GetTranslation(R.Messages.back);
		startButton.text = TranslationManager.GetTranslation(R.Messages.mainScene_button_sing_label);
		scoreModeLabel.text = TranslationManager.GetTranslation(R.Messages.options_scoreMode);
		noteDisplayModeLabel.text = TranslationManager.GetTranslation(R.Messages.options_noteDisplayMode);
		noSongsFoundLabel.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_noSongsFound);
		searchExpressionInfoLabel.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_searchExpressionInfo);
		searchExpressionInfoSyntaxTipsLabel.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_searchExpressionInfo_syntaxTips);
		downloadSongsButton.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_noSongsFound_downloadSongsButton);
		addSongFolderButton.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_noSongsFound_addSongFolderButton);
		localHighScoreContainer.Q<Label>("title").text = TranslationManager.GetTranslation(R.Messages.songSelectScene_localTopScoresTitle);
		onlineHighScoreContainer.Q<Label>("title").text = TranslationManager.GetTranslation(R.Messages.songSelectScene_onlineTopScoresTitle);
		PlaylistChooserControl.UpdateTranslation();
		SongSearchControl.UpdateTranslation();
		songRouletteControl.UpdateTranslation();
		UpdateInputLegend();
	}

	private bool IsFavorite(SongMeta songMeta)
	{
		if (songMeta != null)
		{
			return playlistManager.FavoritesPlaylist.HasSongEntry(songMeta.Artist, songMeta.Title);
		}
		return false;
	}

	public void SubmitSearch()
	{
		selectedSongBeforeSearch = SelectedSong;
		songSearchControl.ResetSearchText();
	}

	public void OnInjectionFinished()
	{
		PlaylistChooserControl = new PlaylistChooserControl();
		injector.Inject(PlaylistChooserControl);
	}

	private void UpdateInputLegend()
	{
		(from label in inputLegend.Query<Label>()
			where !(label is FontIcon)
			select label).ForEach((Label label) =>
		{
			label.RemoveFromHierarchy();
		});
		if (IsPlayerSelectOverlayVisible)
		{
			InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_back, TranslationManager.GetTranslation(R.Messages.back), inputLegend);
			InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_togglePlayers, TranslationManager.GetTranslation(R.Messages.action_togglePlayers), inputLegend);
		}
		else
		{
			InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_back, TranslationManager.GetTranslation(R.Messages.back), inputLegend);
			InputLegendControl.TryAddInputActionInfo(R.InputActions.ui_submit, TranslationManager.GetTranslation(R.Messages.submit), inputLegend);
			InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_toggleSongMenu, TranslationManager.GetTranslation(R.Messages.action_openSongMenu), inputLegend);
		}
		if (inputManager.InputDeviceEnum == EInputDevice.Touch)
		{
			inputLegend.Add(InputLegendControl.CreateInputActionInfoUi(new InputActionInfo(TranslationManager.GetTranslation(R.Messages.action_openSongMenu), TranslationManager.GetTranslation(R.Messages.action_longPress))));
		}
		menuOverlayInputLegend.Clear();
		InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_randomSong, TranslationManager.GetTranslation(R.Messages.action_randomSong), menuOverlayInputLegend);
		InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_openSongEditor, TranslationManager.GetTranslation(R.Messages.action_openSongEditor), menuOverlayInputLegend);
		InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_toggleFavorite, TranslationManager.GetTranslation(R.Messages.action_toggleFavorites), menuOverlayInputLegend);
	}

	private void UpdateSongDetailsInOverlay()
	{
		songDetailOverlayScrollView.Clear();
		SongMeta songMeta = SelectedSong;
		if (songMeta == null)
		{
			return;
		}
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Artist", songMeta.Artist));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Title", songMeta.Title));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Genre", songMeta.Genre));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Year", (songMeta.Year != 0) ? ((object)songMeta.Year) : null));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Audio", songMeta.Mp3));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Gap", songMeta.Gap));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Bpm", songMeta.Bpm));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Video", songMeta.Video));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Video Gap", songMeta.VideoGap));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Cover", songMeta.Cover));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Language", songMeta.Language));
		songDetailOverlayScrollView.Add(CreateSongDetailLabel("Edition", songMeta.Edition));
		songDetailOverlayScrollView.Add(new Label("\n"));
		songMeta.VoiceNames.Keys.ForEach((string voiceNameKey) =>
		{
			string lyrics = SongMetaUtils.GetLyrics(songMeta, voiceNameKey);
			if (!lyrics.IsNullOrEmpty())
			{
				if (voiceNameKey != Voice.soloVoiceName)
				{
					Label label = new Label();
					label.enableRichText = true;
					label.AddToClassList("songDetailOverlayLabel");
					string text = songMeta.VoiceNames[voiceNameKey];
					string text2 = ((text != voiceNameKey) ? (" (" + text + ")") : "");
					label.text = "<b>" + voiceNameKey + text2 + "</b>";
					songDetailOverlayScrollView.Add(label);
				}
				Label label2 = new Label();
				label2.AddToClassList("songDetailOverlayLabel");
				label2.text = lyrics;
				songDetailOverlayScrollView.Add(label2);
				songDetailOverlayScrollView.Add(new Label("\n"));
			}
		});
		static Label CreateSongDetailLabel(string fieldName, object fieldValue)
		{
			Label label = new Label();
			label.enableRichText = true;
			label.AddToClassList("songDetailOverlayLabel");
			string text = fieldValue?.ToString();
			text = (text.IsNullOrEmpty() ? "-" : text);
			label.text = "<b><u>" + fieldName + "</u></b>: " + text;
			return label;
		}
	}
}
