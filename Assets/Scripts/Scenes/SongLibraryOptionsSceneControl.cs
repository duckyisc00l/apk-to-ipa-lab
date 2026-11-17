using System.Collections.Generic;
using System.IO;
using System.Linq;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.Android;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class SongLibraryOptionsSceneControl : MonoBehaviour, INeedInjection, ITranslator
{
	[InjectedInInspector]
	public VisualTreeAsset songFolderListEntryAsset;

	[InjectedInInspector]
	public VisualTreeAsset dialogUi;

	[InjectedInInspector]
	public VisualTreeAsset songIssueSongEntryUi;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "downloadSceneButton")]
	private Button downloadSceneButton;

	[Inject(UxmlName = "songList")]
	private ScrollView songList;

	[Inject(UxmlName = "addButton")]
	private Button addButton;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "androidSongFolderHintContainer")]
	private VisualElement androidSongFolderHintContainer;

	[Inject(UxmlName = "helpButton")]
	private Button helpButton;

	[Inject(UxmlName = "androidSongFolderHintLabel")]
	private Label androidSongFolderHintLabel;

	[Inject(SearchMethod = SearchMethods.FindObjectOfType)]
	private FocusableNavigator focusableNavigator;

	[Inject(UxmlName = "songIssueButton")]
	private Button songIssueButton;

	[Inject(UxmlName = "songIssueIcon")]
	private VisualElement songIssueIcon;

	[Inject]
	private Settings settings;

	[Inject]
	private Injector injector;

	[Inject]
	private SongMetaManager songMetaManager;

	private MessageDialogControl helpDialogControl;

	private MessageDialogControl songIssueDialogControl;

	private readonly List<SongFolderListEntryControl> songFolderListEntryControls = new List<SongFolderListEntryControl>();

	private void Start()
	{
		if (SongMetaManager.IsSongScanFinished)
		{
			UpdateSongIssues();
		}
		songMetaManager.ScanFilesIfNotDoneYet();
		songMetaManager.SongScanFinishedEventStream.Subscribe((SongScanFinishedEvent _) =>
		{
			Scheduler.MainThread.Schedule(() =>
			{
				UpdateSongIssues();
			});
		});
		settings.GameSettings.ObserveEveryValueChanged((GameSettings gameSettings) => gameSettings.songDirs).Subscribe((List<string> onNext) =>
		{
			UpdateSongFolderList();
		}).AddTo(base.gameObject);
		addButton.RegisterCallbackButtonTriggered(() =>
		{
			AddNewSongFolder();
		});
		downloadSceneButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.ContentDownloadScene);
		});
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			OnBack();
		});
		backButton.Focus();
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			OnBack();
		});
		focusableNavigator.AddCustomNavigationTarget(backButton, Vector2.left, helpButton, alsoAddOppositeDirection: true);
		focusableNavigator.AddCustomNavigationTarget(helpButton, Vector2.left, songIssueButton, alsoAddOppositeDirection: true);
		focusableNavigator.AddCustomNavigationTarget(songIssueButton, Vector2.left, downloadSceneButton, alsoAddOppositeDirection: true);
		helpButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowHelp();
		});
		songIssueButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowSongIssues();
		});
		if (AndroidUtils.GetAppSpecificStorageAbsolutePath(sdCard: false).IsNullOrEmpty() && AndroidUtils.GetAppSpecificStorageAbsolutePath(sdCard: true).IsNullOrEmpty())
		{
			androidSongFolderHintContainer.HideByDisplay();
		}
		else
		{
			androidSongFolderHintContainer.ShowByDisplay();
		}
	}

	private void AddNewSongFolder()
	{
		string item = "";
		if (PlatformUtils.IsAndroid)
		{
			item = AndroidUtils.GetAppSpecificStorageAbsolutePath(sdCard: false) + "/Songs";
		}
		settings.GameSettings.songDirs.Add(item);
		UpdateSongFolderList();
		RequestExternalStoragePermissionIfNeeded();
	}

	private void UpdateSongIssues()
	{
		songIssueIcon.RemoveFromClassList("error");
		songIssueIcon.RemoveFromClassList("warning");
		if (songMetaManager.GetSongErrors().Count > 0)
		{
			songIssueIcon.AddToClassList("error");
		}
		else if (songMetaManager.GetSongWarnings().Count > 0)
		{
			songIssueIcon.AddToClassList("warning");
		}
	}

	private void OnBack()
	{
		if (helpDialogControl != null)
		{
			CloseHelp();
		}
		else if (songIssueDialogControl != null)
		{
			CloseSongIssues();
		}
		else
		{
			sceneNavigator.LoadScene(EScene.OptionsScene);
		}
	}

	private void ShowHelp()
	{
		if (helpDialogControl == null)
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>
			{
				{
					TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_songFormatInfo_title),
					TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_songFormatInfo)
				},
				{
					TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_addSongInfo_title),
					TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_addSongInfo)
				},
				{
					TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_createSongInfo_title),
					TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_createSongInfo)
				},
				{
					TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_downloadSongInfo_title),
					TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_downloadSongInfo)
				}
			};
			if (PlatformUtils.IsAndroid)
			{
				dictionary.Add(TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_androidSongFolders_title), TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_androidSongFolders, "androidAppSpecificStorageRelativePath", AndroidUtils.GetAppSpecificStorageRelativePath(sdCard: false)));
			}
			helpDialogControl = uiManager.CreateHelpDialogControl(TranslationManager.GetTranslation(R.Messages.options_songLibrary_helpDialog_title), dictionary, CloseHelp);
			helpDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.viewMore), () =>
			{
				Application.OpenURL(TranslationManager.GetTranslation(R.Messages.uri_howToAddAndCreateSongs));
			});
		}
	}

	private void CloseHelp()
	{
		if (helpDialogControl != null)
		{
			helpDialogControl.CloseDialog();
			helpDialogControl = null;
			helpButton.Focus();
		}
	}

	private void ShowSongIssues()
	{
		if (songIssueDialogControl == null)
		{
			VisualElement visualElement = dialogUi.CloneTree().Children().FirstOrDefault();
			uiDocument.rootVisualElement.Add(visualElement);
			songIssueDialogControl = injector.WithRootVisualElement(visualElement).CreateAndInject<MessageDialogControl>();
			songIssueDialogControl.Title = TranslationManager.GetTranslation(R.Messages.options_songLibrary_songIssueDialog_title);
			AccordionItemControl accordionItemControl = uiManager.CreateAccordionItemControl();
			accordionItemControl.Title = TranslationManager.GetTranslation(R.Messages.options_songLibrary_songIssueDialog_errors);
			songIssueDialogControl.AddVisualElement(accordionItemControl.VisualElement);
			FillWithSongIssues(accordionItemControl, songMetaManager.GetSongErrors());
			AccordionItemControl accordionItemControl2 = uiManager.CreateAccordionItemControl();
			accordionItemControl2.Title = TranslationManager.GetTranslation(R.Messages.options_songLibrary_songIssueDialog_warnings);
			songIssueDialogControl.AddVisualElement(accordionItemControl2.VisualElement);
			FillWithSongIssues(accordionItemControl2, songMetaManager.GetSongWarnings());
			if (songMetaManager.GetSongErrors().Count > 0)
			{
				accordionItemControl.ShowAccordionContent();
			}
			else if (songMetaManager.GetSongWarnings().Count > 0)
			{
				accordionItemControl2.ShowAccordionContent();
			}
			songIssueDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.refresh), () =>
			{
				songMetaManager.ReloadSongMetas();
				CloseSongIssues();
			});
			songIssueDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.close), () =>
			{
				CloseSongIssues();
			}).Focus();
		}
		void FillWithSongIssues(AccordionItemControl accordionItemControl3, IReadOnlyList<SongIssue> songIssues)
		{
			if (songIssues.IsNullOrEmpty())
			{
				accordionItemControl3.AddVisualElement(new Label(TranslationManager.GetTranslation(R.Messages.options_songLibrary_songIssueDialog_noIssues)));
			}
			else
			{
				List<SongIssue> list = songIssues.ToList();
				list.Sort(SongIssue.compareBySongMetaArtistAndTitle);
				string lastSongMetaPath = "";
				list.ForEach((SongIssue songIssue) =>
				{
					string text = ((songIssue.SongMeta != null) ? (songIssue.SongMeta.Artist + " - " + songIssue.SongMeta.Title) : "");
					string absoluteSongMetaPath = SongMetaUtils.GetAbsoluteSongMetaPath(songIssue.SongMeta);
					if (lastSongMetaPath != absoluteSongMetaPath)
					{
						if (!lastSongMetaPath.IsNullOrEmpty())
						{
							accordionItemControl3.AddVisualElement(new Label(""));
						}
						VisualElement visualElement2 = songIssueSongEntryUi.CloneTree().Children().First();
						visualElement2.Q<Label>("title").text = text;
						Button button = visualElement2.Q<Button>("openFolderButton");
						if (PlatformUtils.IsStandalone && !songIssue.SongMeta.Directory.IsNullOrEmpty() && Directory.Exists(songIssue.SongMeta.Directory))
						{
							button.RegisterCallbackButtonTriggered(() =>
							{
								ApplicationUtils.OpenDirectory(songIssue.SongMeta.Directory);
							});
						}
						else
						{
							button.HideByDisplay();
						}
						accordionItemControl3.AddVisualElement(visualElement2);
					}
					Label label = new Label("• " + songIssue.Message);
					label.AddToClassList("songIssueMessage");
					accordionItemControl3.AddVisualElement(label);
					lastSongMetaPath = absoluteSongMetaPath;
				});
			}
		}
	}

	private void CloseSongIssues()
	{
		songIssueDialogControl.CloseDialog();
		songIssueDialogControl = null;
		songIssueButton.Focus();
	}

	private static void RequestExternalStoragePermissionIfNeeded()
	{
		if (!Permission.HasUserAuthorizedPermission("android.permission.READ_EXTERNAL_STORAGE"))
		{
			Permission.RequestUserPermission("android.permission.READ_EXTERNAL_STORAGE");
		}
	}

	public void UpdateTranslation()
	{
		downloadSceneButton.text = TranslationManager.GetTranslation(R.Messages.options_downloadSongs_button);
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_songLibrary_title);
		androidSongFolderHintLabel.text = TranslationManager.GetTranslation(R.Messages.options_songLibrary_androidFolderHint, "androidAppSpecificStorageRelativePath", AndroidUtils.GetAppSpecificStorageRelativePath(sdCard: false));
	}

	private void UpdateSongFolderList()
	{
		songList.Clear();
		songFolderListEntryControls.Clear();
		if (settings.GameSettings.songDirs.IsNullOrEmpty())
		{
			Label label = new Label(TranslationManager.GetTranslation(R.Messages.options_songLibrary_noSongFoldersFoundInfo));
			label.AddToClassList("centerHorizontalByMargin");
			label.style.marginTop = 10f;
			label.style.marginBottom = 5f;
			songList.Add(label);
			Button button = new Button();
			button.AddToClassList("centerHorizontalByMargin");
			button.text = TranslationManager.GetTranslation(R.Messages.viewMore);
			button.RegisterCallbackButtonTriggered(() =>
			{
				Application.OpenURL(TranslationManager.GetTranslation(R.Messages.uri_howToAddAndCreateSongs));
			});
			songList.Add(button);
		}
		else
		{
			int index = 0;
			settings.GameSettings.songDirs.ForEach((string songDir) =>
			{
				CreateSongFolderEntryControl(songDir, index);
				index++;
			});
		}
	}

	private void CreateSongFolderEntryControl(string path, int indexInList)
	{
		VisualElement visualElement = songFolderListEntryAsset.CloneTree();
		SongFolderListEntryControl songFolderListEntryControl = injector.WithRootVisualElement(visualElement).WithBinding(new Binding("initialPath", new ExistingInstanceProvider<string>(path))).CreateAndInject<SongFolderListEntryControl>();
		songFolderListEntryControl.ValueChangedEventStream.Subscribe((string newValue) =>
		{
			settings.GameSettings.songDirs[indexInList] = newValue;
			songFolderListEntryControls.ForEach((SongFolderListEntryControl control) =>
			{
				control.CheckPathIsValid();
			});
		});
		songFolderListEntryControl.DeleteEventStream.Subscribe((bool _) =>
		{
			settings.GameSettings.songDirs.RemoveAt(indexInList);
			UpdateSongFolderList();
			backButton.Focus();
		});
		songFolderListEntryControls.Add(songFolderListEntryControl);
		songList.Add(visualElement);
	}

	private void OnDestroy()
	{
		settings.GameSettings.songDirs = settings.GameSettings.songDirs.Distinct().ToList();
	}
}
