using System.Collections.Generic;
using System.Linq;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongEditorSideBarControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(Key = "issueSideBarEntryUi")]
	private VisualTreeAsset issueSideBarEntryUi;

	[Inject(UxmlName = "leftSideBarMainColumn")]
	private VisualElement leftSideBarMainColumn;

	[Inject(UxmlName = "togglePlaybackButton")]
	private Button togglePlaybackButton;

	[Inject(UxmlName = "toggleRecordingButton")]
	private Button toggleRecordingButton;

	[Inject(UxmlName = "undoButton")]
	private Button undoButton;

	[Inject(UxmlName = "redoButton")]
	private Button redoButton;

	[Inject(UxmlName = "exitSceneButton")]
	private Button exitSceneButton;

	[Inject(UxmlName = "saveButton")]
	private Button saveButton;

	[Inject(UxmlName = "helpTitle")]
	private VisualElement helpTitle;

	[Inject(UxmlName = "helpSideBarContainer")]
	private VisualElement helpSideBarContainer;

	[Inject(UxmlName = "toggleHelpButton")]
	private Button toggleHelpButton;

	[Inject(UxmlName = "issuesSideBarContainer")]
	private VisualElement issuesSideBarContainer;

	[Inject(UxmlName = "toggleIssuesButton")]
	private Button toggleIssuesButton;

	[Inject(UxmlName = "songPropertiesSideBarContainer")]
	private VisualElement songPropertiesSideBarContainer;

	[Inject(UxmlName = "toggleSongPropertiesButton")]
	private Button toggleSongPropertiesButton;

	[Inject(UxmlName = "layersSideBarContainer")]
	private VisualElement layersSideBarContainer;

	[Inject(UxmlName = "toggleLayersButton")]
	private Button toggleLayersButton;

	[Inject(UxmlName = "settingsSideBarContainer")]
	private VisualElement settingsSideBarContainer;

	[Inject(UxmlName = "toggleSettingsButton")]
	private Button toggleSettingsButton;

	[Inject(UxmlName = "toggleSideBarSizeButton")]
	private Button toggleSideBarSizeButton;

	[Inject(UxmlName = "openSongFolderButton")]
	private Button openSongFolderButton;

	[Inject(UxmlName = "playIcon")]
	private VisualElement playIcon;

	[Inject(UxmlName = "pauseIcon")]
	private VisualElement pauseIcon;

	[Inject]
	private Injector injector;

	[Inject]
	private Settings settings;

	[Inject]
	private UltraStarPlayInputManager inputManager;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private SongEditorHistoryManager historyManager;

	[Inject]
	private SongEditorNoteRecorder songEditorNoteRecorder;

	[Inject]
	private SongEditorIssueAnalyzerControl issueAnalyzerControl;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private GameObject gameObject;

	private readonly TabGroupControl sideBarTabGroupControl = new TabGroupControl();

	private readonly SongEditorSideBarPropertiesControl propertiesControl = new SongEditorSideBarPropertiesControl();

	private readonly SongEditorSideBarLayersControl sideBarLayersControl = new SongEditorSideBarLayersControl();

	private readonly SongEditorSideBarSettingsControl sideBarSettingsControl = new SongEditorSideBarSettingsControl();

	private IReadOnlyCollection<SongIssue> lastIssues;

	public bool IsAnySideBarContainerVisible => sideBarTabGroupControl.IsAnyContainerVisible;

	public void OnInjectionFinished()
	{
		injector.Inject(propertiesControl);
		injector.Inject(sideBarLayersControl);
		injector.Inject(sideBarSettingsControl);
		if (PlatformUtils.IsStandalone)
		{
			openSongFolderButton.RegisterCallbackButtonTriggered(() =>
			{
				SongMetaUtils.OpenDirectory(songMeta);
			});
		}
		else
		{
			openSongFolderButton.HideByDisplay();
		}
		togglePlaybackButton.RegisterCallbackButtonTriggered(() =>
		{
			songEditorSceneControl.ToggleAudioPlayPause();
		});
		toggleRecordingButton.RegisterCallbackButtonTriggered(() =>
		{
			songEditorNoteRecorder.IsRecordingEnabled = !songEditorNoteRecorder.IsRecordingEnabled;
			if (songEditorNoteRecorder.IsRecordingEnabled)
			{
				toggleRecordingButton.AddToClassList("recording");
			}
			else
			{
				toggleRecordingButton.RemoveFromClassList("recording");
			}
		});
		undoButton.RegisterCallbackButtonTriggered(() =>
		{
			historyManager.Undo();
		});
		redoButton.RegisterCallbackButtonTriggered(() =>
		{
			historyManager.Redo();
		});
		exitSceneButton.RegisterCallbackButtonTriggered(() =>
		{
			songEditorSceneControl.ReturnToLastScene();
		});
		saveButton.RegisterCallbackButtonTriggered(() =>
		{
			songEditorSceneControl.SaveSong();
		});
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.AutoSave).Subscribe((bool autoSave) =>
		{
			saveButton.SetVisibleByDisplay(!autoSave);
		}).AddTo(gameObject);
		UpdateInputLegend();
		inputManager.InputDeviceChangeEventStream.Subscribe((InputDeviceChangeEvent _) =>
		{
			UpdateInputLegend();
		});
		issuesSideBarContainer.RegisterCallback((GeometryChangedEvent evt) =>
		{
			if (issuesSideBarContainer.style.display == new StyleEnum<DisplayStyle>(DisplayStyle.Flex))
			{
				UpdateIssueSideBar(lastIssues);
			}
		});
		issueAnalyzerControl.IssuesEventStream.Subscribe((IReadOnlyCollection<SongIssue> issues) =>
		{
			UpdateIssueSideBar(issues);
		});
		toggleSideBarSizeButton.RegisterCallbackButtonTriggered(() =>
		{
			settings.SongEditorSettings.SmallLeftSideBar = !settings.SongEditorSettings.SmallLeftSideBar;
		});
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.SmallLeftSideBar).Subscribe((bool newValue) =>
		{
			UpdatePlayPauseIcon();
			UpdateLeftSideBarClasses();
		}).AddTo(gameObject);
		UpdateLeftSideBarClasses();
		UpdatePlayPauseIcon();
		songAudioPlayer.PlaybackStartedEventStream.Subscribe((double _) =>
		{
			UpdatePlayPauseIcon();
		});
		songAudioPlayer.PlaybackStoppedEventStream.Subscribe((double _) =>
		{
			UpdatePlayPauseIcon();
		});
		InitTabGroup();
	}

	private void UpdatePlayPauseIcon()
	{
		bool isVisible = settings.SongEditorSettings.SmallLeftSideBar && !songAudioPlayer.IsPlaying;
		bool isVisible2 = settings.SongEditorSettings.SmallLeftSideBar && songAudioPlayer.IsPlaying;
		playIcon.SetVisibleByDisplay(isVisible);
		pauseIcon.SetVisibleByDisplay(isVisible2);
	}

	private void UpdateLeftSideBarClasses()
	{
		if (settings.SongEditorSettings.SmallLeftSideBar)
		{
			leftSideBarMainColumn.AddToClassList("small");
			leftSideBarMainColumn.RemoveFromClassList("wide");
		}
		else
		{
			leftSideBarMainColumn.RemoveFromClassList("small");
			leftSideBarMainColumn.AddToClassList("wide");
		}
	}

	private void UpdateIssueSideBar(IReadOnlyCollection<SongIssue> issues)
	{
		lastIssues = issues;
		ClearSideBar(issuesSideBarContainer);
		if (!issues.IsNullOrEmpty() && issuesSideBarContainer.IsVisibleByDisplay())
		{
			issues.ForEach((SongIssue issue) =>
			{
				CreateSideBarIssueUi(issue);
			});
		}
	}

	private void CreateSideBarIssueUi(SongIssue issue)
	{
		VisualElement visualElement = issueSideBarEntryUi.CloneTree().Children().First();
		issuesSideBarContainer.Add(visualElement);
		int num = (int)(BpmUtils.BeatToMillisecondsInSong(songMeta, issue.StartBeat) / 1000.0);
		visualElement.Q<Button>("goToIssueButton").RegisterCallbackButtonTriggered(() =>
		{
			GoToIssue(issue);
		});
		visualElement.Q<Label>("issueMessageLabel").text = issue.Message;
		visualElement.Q<Label>("issuePositionLabel").text = $"({num}s)";
		visualElement.Q<VisualElement>("issueImage").style.unityBackgroundImageTintColor = SongIssueUtils.GetColorForIssue(issue);
	}

	private void GoToIssue(SongIssue issue)
	{
		double positionInSongInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, issue.StartBeat);
		songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
	}

	private void InitTabGroup()
	{
		sideBarTabGroupControl.AllowNoContainerVisible = true;
		sideBarTabGroupControl.AddTabGroupButton(toggleIssuesButton, issuesSideBarContainer);
		sideBarTabGroupControl.AddTabGroupButton(toggleHelpButton, helpSideBarContainer);
		sideBarTabGroupControl.AddTabGroupButton(toggleSongPropertiesButton, songPropertiesSideBarContainer);
		sideBarTabGroupControl.AddTabGroupButton(toggleLayersButton, layersSideBarContainer);
		sideBarTabGroupControl.AddTabGroupButton(toggleSettingsButton, settingsSideBarContainer);
		sideBarTabGroupControl.HideAllContainers();
	}

	public void HideSideBarContainers()
	{
		sideBarTabGroupControl.HideAllContainers();
	}

	private void UpdateInputLegend()
	{
		ClearSideBar(helpSideBarContainer);
		InputLegendControl.TryAddInputActionInfo(R.InputActions.usplay_back, TranslationManager.GetTranslation(R.Messages.back), helpSideBarContainer);
		List<InputActionInfo> list = new List<InputActionInfo>();
		if (inputManager.InputDeviceEnum == EInputDevice.KeyboardAndMouse)
		{
			list.Add(new InputActionInfo("Zoom Horizontal", "Ctrl+Mouse Wheel"));
			list.Add(new InputActionInfo("Zoom Vertical", "Ctrl+Shift+Mouse Wheel"));
			list.Add(new InputActionInfo("Scroll Horizontal", "Mouse Wheel | Arrow Keys | Middle Mouse Button+Drag"));
			list.Add(new InputActionInfo("Scroll Vertical", "Shift+Mouse Wheel | Shift+Arrow Keys | Middle Mouse Button+Drag"));
			list.Add(new InputActionInfo("Move Note Horizontal", "Shift+Arrow Keys | 1 (Numpad) | 3 (Numpad)"));
			list.Add(new InputActionInfo("Move Note Vertical", "Shift+Arrow Keys | Minus (Numpad) | Plus (Numpad)"));
			list.Add(new InputActionInfo("Move Note Vertical One Octave", "Ctrl+Shift+Arrow Keys"));
			list.Add(new InputActionInfo("Move Left Side Of Note", "Ctrl+Arrow Keys | Divide (Numpad) | Multiply (Numpad)"));
			list.Add(new InputActionInfo("Move Right side Of Note", "Alt+Arrow Keys | 7 (Numpad) | 8 (Numpad) | 9 (Numpad)"));
			list.Add(new InputActionInfo("Select Next Note", "Tab | 6 (Numpad)"));
			list.Add(new InputActionInfo("Select Previous Note", "Shift+Tab | 4 (Numpad)"));
			list.Add(new InputActionInfo("Play Selected Notes", "Ctrl+Space | 5 (Numpad)"));
			list.Add(new InputActionInfo("Toggle Play / Pause", "Space | Double Click"));
			list.Add(new InputActionInfo("Play MIDI Sound Of Note", "Ctrl+Click Note"));
		}
		else if (inputManager.InputDeviceEnum == EInputDevice.Touch)
		{
			list.Add(new InputActionInfo("Zoom", "2 Finger Pinch Gesture"));
			list.Add(new InputActionInfo("Scroll", "2 Finger Drag"));
			list.Add(new InputActionInfo("Toggle Play Pause", "Double Tap"));
			list.Add(new InputActionInfo(TranslationManager.GetTranslation(R.Messages.action_openContextMenu), TranslationManager.GetTranslation(R.Messages.action_longPress)));
		}
		list.ForEach((InputActionInfo inputActionInfo) =>
		{
			helpSideBarContainer.Add(InputLegendControl.CreateInputActionInfoUi(inputActionInfo));
		});
	}

	private void ClearSideBar(VisualElement visualElement)
	{
		(from it in visualElement.Children()
			where !it.ClassListContains("secondarySideBarTitle")
			select it).ToList().ForEach((VisualElement it) =>
		{
			it.RemoveFromHierarchy();
		});
	}
}
