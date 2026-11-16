using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongEditorSceneControl : MonoBehaviour, IBinder, INeedInjection, IInjectionFinishedListener
{
	[InjectedInInspector]
	public VisualTreeAsset issueSideBarEntryUi;

	[InjectedInInspector]
	public VisualTreeAsset songPropertySideBarEntryUi;

	[InjectedInInspector]
	public VisualTreeAsset songEditorLayerSideBarEntryUi;

	[InjectedInInspector]
	public VisualTreeAsset valueInputDialogUi;

	[InjectedInInspector]
	public SongAudioPlayer songAudioPlayer;

	[InjectedInInspector]
	public SongVideoPlayer songVideoPlayer;

	[InjectedInInspector]
	public SongEditorNoteRecorder songEditorNoteRecorder;

	[InjectedInInspector]
	public SongEditorSelectionControl selectionControl;

	[InjectedInInspector]
	public EditorNoteDisplayer editorNoteDisplayer;

	[InjectedInInspector]
	public SongEditorMicPitchTracker songEditorMicPitchTracker;

	[InjectedInInspector]
	public SongEditorHistoryManager historyManager;

	[InjectedInInspector]
	public SongEditorLayerManager songEditorLayerManager;

	[InjectedInInspector]
	public SongEditorCopyPasteManager songEditorCopyPasteManager;

	[InjectedInInspector]
	public SongEditorSceneInputControl songEditorSceneInputControl;

	[Inject]
	private Injector injector;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private Settings settings;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject(UxmlName = "editLyricsPopup")]
	private VisualElement editLyricsPopup;

	[Inject]
	private ApplicationManager applicationManager;

	private IDisposable autoSaveDisposable;

	private readonly SongMetaChangeEventStream songMetaChangeEventStream = new SongMetaChangeEventStream();

	private double positionInSongInMillisWhenPlaybackStarted;

	private readonly Dictionary<string, Color> voiceNameToColorMap = new Dictionary<string, Color>();

	private bool audioWaveFormInitialized;

	private readonly OverviewAreaControl overviewAreaControl = new OverviewAreaControl();

	private readonly VideoAreaControl videoAreaControl = new VideoAreaControl();

	private readonly SongEditorVirtualPianoControl songEditorVirtualPianoControl = new SongEditorVirtualPianoControl();

	private readonly LyricsAreaControl lyricsAreaControl = new LyricsAreaControl();

	private readonly NoteAreaControl noteAreaControl = new NoteAreaControl();

	private readonly SongEditorSideBarControl sideBarControl = new SongEditorSideBarControl();

	private readonly SongEditorIssueAnalyzerControl issueAnalyzerControl = new SongEditorIssueAnalyzerControl();

	private readonly SongEditorStatusBarControl statusBarControl = new SongEditorStatusBarControl();

	[Inject]
	private SongEditorSceneData sceneData;

	private readonly List<IDialogControl> openDialogControls = new List<IDialogControl>();

	public double StopPlaybackAfterPositionInSongInMillis { get; set; }

	private SongMeta SongMeta => sceneData.SelectedSongMeta;

	public bool IsAnyDialogOpen => openDialogControls.Count > 0;

	public void OnInjectionFinished()
	{
		injector.Inject(overviewAreaControl);
		injector.Inject(videoAreaControl);
		injector.Inject(songEditorVirtualPianoControl);
		injector.Inject(lyricsAreaControl);
		injector.Inject(noteAreaControl);
		injector.Inject(sideBarControl);
		injector.Inject(issueAnalyzerControl);
		injector.Inject(statusBarControl);
	}

	private void Start()
	{
		Debug.Log($"Start editing of '{sceneData.SelectedSongMeta.Title}' at {sceneData.PositionInSongInMillis} ms.");
		songAudioPlayer.Init(SongMeta);
		songVideoPlayer.SongMeta = SongMeta;
		songAudioPlayer.PositionInSongInMillis = sceneData.PositionInSongInMillis;
		songAudioPlayer.PlaybackStartedEventStream.Subscribe((double positionInSongInMillis) =>
		{
			OnAudioPlaybackStarted(positionInSongInMillis);
		});
		songAudioPlayer.PlaybackStoppedEventStream.Subscribe((double _) =>
		{
			OnAudioPlaybackStopped();
		});
		HideEditLyricsPopup();
		if (uiDocument.rootVisualElement.focusController.focusedElement != null)
		{
			uiDocument.rootVisualElement.focusController.focusedElement.Blur();
		}
		InitAutoSave();
	}

	private void OnDestroy()
	{
		videoAreaControl.Dispose();
	}

	private void InitAutoSave()
	{
		if (settings.SongEditorSettings.AutoSave)
		{
			RegisterAutoSaveEvent();
		}
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.AutoSave).Subscribe((bool autoSave) =>
		{
			if (autoSave)
			{
				RegisterAutoSaveEvent();
			}
			else
			{
				UnregisterAutoSaveEvent();
			}
		}).AddTo(base.gameObject);
		sceneNavigator.BeforeSceneChangeEventStream.Subscribe((BeforeSceneChangeEvent _) =>
		{
			DoAutoSaveIfEnabled();
		});
	}

	private void RegisterAutoSaveEvent()
	{
		UnregisterAutoSaveEvent();
		autoSaveDisposable = songMetaChangeEventStream.Throttle(new TimeSpan(0, 0, 0, 0, 500)).Subscribe((SongMetaChangeEvent evt) =>
		{
			DoAutoSaveIfEnabled();
		}).AddTo(base.gameObject);
	}

	private void UnregisterAutoSaveEvent()
	{
		if (autoSaveDisposable != null)
		{
			autoSaveDisposable.Dispose();
			autoSaveDisposable = null;
		}
	}

	public void HideEditLyricsPopup()
	{
		editLyricsPopup.style.top = -1000f;
	}

	private void Update()
	{
		if (songAudioPlayer.IsPlaying && StopPlaybackAfterPositionInSongInMillis > 0.0 && songAudioPlayer.PositionInSongInMillis > StopPlaybackAfterPositionInSongInMillis)
		{
			songAudioPlayer.PauseAudio();
			StopPlaybackAfterPositionInSongInMillis = 0.0;
		}
		lyricsAreaControl.Update();
		noteAreaControl.Update();
	}

	private void OnAudioPlaybackStopped()
	{
		bool flag = InputUtils.IsKeyboardControlPressed();
		if ((settings.SongEditorSettings.GoToLastPlaybackPosition && !flag) || (!settings.SongEditorSettings.GoToLastPlaybackPosition & flag))
		{
			songAudioPlayer.PositionInSongInMillis = positionInSongInMillisWhenPlaybackStarted;
		}
	}

	private void OnAudioPlaybackStarted(double positionInSongInMillis)
	{
		positionInSongInMillisWhenPlaybackStarted = positionInSongInMillis;
	}

	public List<Note> GetAllVisibleNotes()
	{
		List<Note> list = new List<Note>();
		List<Note> collection = (from note in SongMeta.GetVoices().Reverse().SelectMany((Voice voice) => voice.Sentences)
				.SelectMany((Sentence sentence) => sentence.Notes)
			where songEditorLayerManager.IsNoteVisible(note)
			select note).ToList();
		List<Note> allEnumLayerNotes = songEditorLayerManager.GetAllEnumLayerNotes();
		list.AddRange(allEnumLayerNotes);
		list.AddRange(collection);
		return list;
	}

	private void CreateVoiceToColorMap()
	{
		List<Color> list = new List<Color>
		{
			Colors.CreateColor("#"),
			Colors.CreateColor("#")
		};
		int num = 0;
		foreach (Color item in list)
		{
			_ = item;
			string key = "P" + (num + 1);
			voiceNameToColorMap[key] = list[num];
			num++;
		}
	}

	private void DoAutoSaveIfEnabled()
	{
		if (settings.SongEditorSettings.AutoSave)
		{
			SaveSong(isAutoSave: true);
		}
	}

	public void SaveSong(bool isAutoSave = false)
	{
		string directory = SongMeta.Directory;
		char directorySeparatorChar = Path.DirectorySeparatorChar;
		string absolutePath = directory + directorySeparatorChar + SongMeta.Filename;
		try
		{
			UltraStarSongFileWriter.WriteFile(absolutePath, SongMeta);
		}
		catch (Exception ex)
		{
			Debug.LogException(ex);
			UiManager.CreateNotification("Saving the file failed:\n" + ex.Message);
			return;
		}
		if (!isAutoSave)
		{
			UiManager.CreateNotification("Saved file");
		}
	}

	public void ContinueToSingScene()
	{
		SingSceneData singSceneData;
		if (sceneData.PreviousSceneData is SingSceneData)
		{
			singSceneData = sceneData.PreviousSceneData as SingSceneData;
		}
		else
		{
			singSceneData = new SingSceneData();
			singSceneData.SelectedSongMeta = sceneData.SelectedSongMeta;
			singSceneData.SelectedPlayerProfiles = sceneData.SelectedPlayerProfiles;
			singSceneData.PlayerProfileToMicProfileMap = sceneData.PlayerProfileToMicProfileMap;
		}
		singSceneData.PositionInSongInMillis = songAudioPlayer.PositionInSongInMillis;
		sceneNavigator.LoadScene(EScene.SingScene, sceneData.PreviousSceneData);
	}

	public void ContinueToSongSelectScene()
	{
		SongSelectSceneData songSelectSceneData = ((!(sceneData.PreviousSceneData is SongSelectSceneData)) ? new SongSelectSceneData() : (sceneData.PreviousSceneData as SongSelectSceneData));
		songSelectSceneData.SongMeta = sceneData.SelectedSongMeta;
		sceneNavigator.LoadScene(EScene.SongSelectScene, songSelectSceneData);
	}

	public void ReturnToLastScene()
	{
		if (sceneData.PreviousSceneData is SingSceneData)
		{
			ContinueToSingScene();
		}
		else
		{
			ContinueToSongSelectScene();
		}
	}

	public void ToggleAudioPlayPause()
	{
		if (songAudioPlayer.IsPlaying)
		{
			songAudioPlayer.PauseAudio();
		}
		else
		{
			songAudioPlayer.PlayAudio();
		}
	}

	public void StartEditingSelectedNoteText()
	{
		List<Note> selectedNotes = selectionControl.GetSelectedNotes();
		if (selectedNotes.Count == 1)
		{
			Note note = selectedNotes.FirstOrDefault();
			editorNoteDisplayer.GetNoteControl(note)?.StartEditingLyrics();
		}
	}

	public void CreateNumberInputDialog(string title, string message, Action<float> useNumberCallback)
	{
		VisualElement visualElement = valueInputDialogUi.CloneTree();
		visualElement.AddToClassList("overlay");
		uiDocument.rootVisualElement.Add(visualElement);
		TextInputDialogControl dialogControl = injector.WithRootVisualElement(visualElement).CreateAndInject<TextInputDialogControl>();
		dialogControl.Title = title;
		dialogControl.Message = message;
		dialogControl.SubmitValueEventStream.Subscribe((string newValue) =>
		{
			UseValueCallback(newValue);
		});
		openDialogControls.Add(dialogControl);
		dialogControl.DialogClosedEventStream.Subscribe((bool _) =>
		{
			openDialogControls.Remove(dialogControl);
		});
		void UseValueCallback(string text)
		{
			text = text.Trim();
			if (float.TryParse(text, NumberStyles.Any, CultureInfo.InvariantCulture, out var result))
			{
				useNumberCallback(result);
			}
		}
	}

	public void CreatePathInputDialog(string title, string message, string initialValue, Action<string> usePathCallback)
	{
		VisualElement visualElement = valueInputDialogUi.CloneTree();
		visualElement.AddToClassList("overlay");
		uiDocument.rootVisualElement.Add(visualElement);
		PathInputDialogControl dialogControl = injector.WithRootVisualElement(visualElement).CreateAndInject<PathInputDialogControl>();
		dialogControl.Title = title;
		dialogControl.Message = message;
		dialogControl.InitialValue = initialValue;
		dialogControl.SubmitValueEventStream.Subscribe((string newValue) =>
		{
			UseValueCallback(newValue);
		});
		openDialogControls.Add(dialogControl);
		dialogControl.DialogClosedEventStream.Subscribe((bool _) =>
		{
			openDialogControls.Remove(dialogControl);
		});
		void UseValueCallback(string path)
		{
			path = path.Trim();
			if (!File.Exists(path))
			{
				Debug.Log("File does not exist: " + path);
				UiManager.CreateNotification("File does not exist");
			}
			usePathCallback(path);
		}
	}

	public void CloseAllOpenDialogs()
	{
		openDialogControls.ToList().ForEach((IDialogControl it) =>
		{
			it.CloseDialog();
		});
	}

	public List<UniInject.IBinding> GetBindings()
	{
		SongEditorSceneData sceneDataOrThrow = SceneNavigator.GetSceneDataOrThrow<SongEditorSceneData>();
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(this);
		bindingBuilder.BindExistingInstance(base.gameObject);
		bindingBuilder.BindExistingInstance(sceneDataOrThrow);
		bindingBuilder.BindExistingInstance(sceneDataOrThrow.SelectedSongMeta);
		bindingBuilder.BindExistingInstance(songAudioPlayer);
		bindingBuilder.BindExistingInstance(songVideoPlayer);
		bindingBuilder.BindExistingInstance(noteAreaControl);
		bindingBuilder.BindExistingInstance(songEditorLayerManager);
		bindingBuilder.BindExistingInstance(songEditorMicPitchTracker);
		bindingBuilder.BindExistingInstance(songEditorNoteRecorder);
		bindingBuilder.BindExistingInstance(selectionControl);
		bindingBuilder.BindExistingInstance(lyricsAreaControl);
		bindingBuilder.BindExistingInstance(editorNoteDisplayer);
		bindingBuilder.BindExistingInstance(sideBarControl);
		bindingBuilder.BindExistingInstance(historyManager);
		bindingBuilder.BindExistingInstance(overviewAreaControl);
		bindingBuilder.BindExistingInstance(songMetaChangeEventStream);
		bindingBuilder.BindExistingInstance(songEditorCopyPasteManager);
		bindingBuilder.BindExistingInstance(songEditorSceneInputControl);
		bindingBuilder.BindExistingInstance(issueAnalyzerControl);
		bindingBuilder.BindExistingInstance(statusBarControl);
		bindingBuilder.BindExistingInstance(this);
		bindingBuilder.Bind("issueSideBarEntryUi").ToExistingInstance(issueSideBarEntryUi);
		bindingBuilder.Bind("songPropertySideBarEntryUi").ToExistingInstance(songPropertySideBarEntryUi);
		bindingBuilder.Bind("songEditorLayerSideBarEntryUi").ToExistingInstance(songEditorLayerSideBarEntryUi);
		return bindingBuilder.GetBindings();
	}
}
