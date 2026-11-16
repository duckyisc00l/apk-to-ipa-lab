using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using ICSharpCode.SharpZipLib.Core;
using ICSharpCode.SharpZipLib.Tar;
using ICSharpCode.SharpZipLib.Zip;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Networking;
using UnityEngine.UIElements;

public class ContentDownloadSceneControl : MonoBehaviour, INeedInjection, ITranslator
{
	[InjectedInInspector]
	public TextAsset songArchiveEntryTextAsset;

	[InjectedInInspector]
	public VisualTreeAsset dialogUi;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "statusLabel")]
	private Label statusLabel;

	[Inject(UxmlName = "outputTextField")]
	private TextField logText;

	[Inject(UxmlName = "urlLabel")]
	private Label urlLabel;

	[Inject(UxmlName = "urlTextField")]
	private TextField downloadPath;

	[Inject(UxmlName = "sizeLabel")]
	private Label fileSize;

	[Inject(UxmlName = "startButton")]
	private Button startDownloadButton;

	[Inject(UxmlName = "cancelButton")]
	private Button cancelDownloadButton;

	[Inject(UxmlName = "urlChooserButton")]
	private Button urlChooserButton;

	[Inject(UxmlName = "helpButton")]
	private Button helpButton;

	[Inject]
	private SettingsManager settingsManager;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMetaManager songMetaManager;

	[Inject]
	private Injector injector;

	[Inject]
	private UiManager uiManager;

	private MessageDialogControl urlChooserDialogControl;

	private UnityWebRequest downloadRequest;

	private List<SongArchiveEntry> songArchiveEntries = new List<SongArchiveEntry>();

	private string newLogText;

	private MessageDialogControl helpDialogControl;

	private int extractedEntryCount;

	private string DownloadUrl => downloadPath.value.Trim();

	private void Start()
	{
		songArchiveEntries = JsonConverter.FromJson<List<SongArchiveEntry>>(songArchiveEntryTextAsset.text);
		statusLabel.text = "";
		SelectSongArchiveUrl(songArchiveEntries[0].Url);
		startDownloadButton.RegisterCallbackButtonTriggered(() =>
		{
			StartDownload();
		});
		cancelDownloadButton.RegisterCallbackButtonTriggered(() =>
		{
			CancelDownload();
		});
		downloadPath.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			FetchFileSize();
		});
		if (!DownloadUrl.IsNullOrEmpty())
		{
			FetchFileSize();
		}
		helpButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowHelp();
		});
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.SongLibraryOptionsScene);
		});
		backButton.Focus();
		urlChooserButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowUrlChooserDialog();
		});
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			OnBack();
		});
	}

	private void OnBack()
	{
		if (helpDialogControl != null)
		{
			CloseHelp();
		}
		else
		{
			sceneNavigator.LoadScene(EScene.SongLibraryOptionsScene);
		}
	}

	private void ShowUrlChooserDialog()
	{
		if (urlChooserDialogControl != null)
		{
			return;
		}
		VisualElement visualElement = dialogUi.CloneTree().Children().FirstOrDefault();
		uiDocument.rootVisualElement.Add(visualElement);
		urlChooserDialogControl = injector.WithRootVisualElement(visualElement).CreateAndInject<MessageDialogControl>();
		urlChooserDialogControl.Title = TranslationManager.GetTranslation(R.Messages.contentDownloadScene_archiveUrlLabel);
		urlChooserDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.close), () =>
		{
			CloseUrlChooserDialog();
		}).Focus();
		songArchiveEntries.ForEach((SongArchiveEntry songArchiveEntry) =>
		{
			Button button = new Button
			{
				text = songArchiveEntry.Url
			};
			button.RegisterCallbackButtonTriggered(() =>
			{
				SelectSongArchiveUrl(songArchiveEntry.Url);
				CloseUrlChooserDialog();
			});
			button.style.width = new StyleLength(new Length(100f, LengthUnit.Percent));
			urlChooserDialogControl.AddVisualElement(button);
			Label label = new Label(songArchiveEntry.Description);
			label.AddToClassList("songArchiveInfoLabel");
			urlChooserDialogControl.AddVisualElement(label);
		});
	}

	private void CloseUrlChooserDialog()
	{
		if (urlChooserDialogControl != null)
		{
			urlChooserDialogControl.CloseDialog();
			urlChooserDialogControl = null;
			backButton.Focus();
		}
	}

	private void SelectSongArchiveUrl(string url)
	{
		downloadPath.value = url;
	}

	public void UpdateTranslation()
	{
		urlLabel.text = TranslationManager.GetTranslation(R.Messages.contentDownloadScene_archiveUrlLabel);
		startDownloadButton.text = TranslationManager.GetTranslation(R.Messages.contentDownloadScene_startDownloadButton);
		cancelDownloadButton.text = TranslationManager.GetTranslation(R.Messages.contentDownloadScene_cancelDownloadButton);
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.contentDownloadScene_title);
	}

	private void Update()
	{
		if (downloadRequest != null && (downloadRequest.isDone || !downloadRequest.error.IsNullOrEmpty()))
		{
			Debug.Log("Disposing downloadRequest");
			downloadRequest.Dispose();
			downloadRequest = null;
		}
		if (!newLogText.IsNullOrEmpty())
		{
			logText.value = newLogText + logText.value;
			newLogText = "";
		}
	}

	private string GetDownloadTargetPath(string url)
	{
		string fileName = Path.GetFileName(new Uri(url).LocalPath);
		return ApplicationManager.PersistentTempPath() + "/" + fileName;
	}

	private DownloadHandler CreateDownloadHandler(string targetPath)
	{
		return new DownloadHandlerFile(targetPath)
		{
			removeFileOnAbort = true
		};
	}

	private void StartDownload()
	{
		StartCoroutine(DownloadFileAsync(DownloadUrl));
	}

	private void CancelDownload()
	{
		if (downloadRequest != null && !downloadRequest.isDone)
		{
			Debug.Log("Aborting download");
			downloadRequest.Abort();
			AddToUiLog("Canceled download");
			SetCanceledStatus();
		}
	}

	private void FetchFileSize()
	{
		StartCoroutine(FileSizeUpdateAsync(DownloadUrl));
	}

	private IEnumerator DownloadFileAsync(string url)
	{
		if (downloadRequest != null && !downloadRequest.isDone)
		{
			AddToUiLog("Download in progress. Cancel the other download first.");
			yield break;
		}
		if (url.IsNullOrEmpty())
		{
			yield break;
		}
		Debug.Log("Started download: " + url);
		AddToUiLog("Started download");
		string targetPath = GetDownloadTargetPath(url);
		DownloadHandler downloadHandler = CreateDownloadHandler(targetPath);
		downloadRequest = UnityWebRequest.Get(url);
		downloadRequest.downloadHandler = downloadHandler;
		StartCoroutine(TrackProgressAsync());
		yield return downloadRequest?.SendWebRequest();
		UnityWebRequest unityWebRequest = downloadRequest;
		bool flag;
		if (unityWebRequest != null)
		{
			UnityWebRequest.Result result = unityWebRequest.result;
			if ((uint)(result - 2) <= 1u)
			{
				flag = true;
				goto IL_0104;
			}
		}
		flag = false;
		goto IL_0104;
		IL_0104:
		if (flag)
		{
			Debug.LogError("Error downloading " + url + ": " + downloadRequest.error);
			AddToUiLog("Error downloading the requested file");
		}
		else if (downloadRequest != null)
		{
			statusLabel.text = "100%";
			AddToUiLog("Download saved to " + targetPath + ". " + downloadRequest.error);
			UnpackArchive(targetPath);
		}
	}

	private IEnumerator TrackProgressAsync()
	{
		while (downloadRequest != null && downloadRequest.downloadHandler != null && !downloadRequest.downloadHandler.isDone)
		{
			float downloadProgress;
			try
			{
				downloadProgress = downloadRequest.downloadProgress;
			}
			catch (Exception ex)
			{
				Debug.LogException(ex);
				AddToUiLog(ex.Message);
				statusLabel.text = "?";
				break;
			}
			string text = Math.Round(downloadProgress * 100f) + "%";
			statusLabel.text = text;
			yield return new WaitForSeconds(0.1f);
		}
	}

	private void AddToDebugAndUiLog(string message, bool isError = false)
	{
		if (isError)
		{
			Debug.LogError(message);
		}
		else
		{
			Debug.Log(message);
		}
		AddToUiLog(message);
	}

	private void AddToUiLog(string message)
	{
		newLogText = newLogText + message + "\n";
	}

	public void UpdateFileSize()
	{
		StartCoroutine(FileSizeUpdateAsync(DownloadUrl));
	}

	private IEnumerator FileSizeUpdateAsync(string url)
	{
		if (url.IsNullOrEmpty())
		{
			ResetFileSizeText();
			yield break;
		}
		using UnityWebRequest request = UnityWebRequest.Head(url);
		yield return request.SendWebRequest();
		UnityWebRequest.Result result = request.result;
		if (result == UnityWebRequest.Result.ConnectionError || result == UnityWebRequest.Result.ProtocolError)
		{
			Debug.LogError("Error fetching size: " + request.error);
			AddToUiLog("Error fetching size: " + request.error);
			ResetFileSizeText();
			yield break;
		}
		string responseHeader = request.GetResponseHeader("Content-Length");
		if (responseHeader.IsNullOrEmpty())
		{
			ResetFileSizeText();
			yield break;
		}
		long num = Convert.ToInt64(responseHeader) / 1024;
		if (num > 1024)
		{
			fileSize.text = Math.Round((double)num / 1024.0) + " MB";
		}
		else
		{
			fileSize.text = Math.Round((double)num) + " KB";
		}
	}

	private void UnpackArchive(string archivePath)
	{
		if (downloadRequest == null)
		{
			return;
		}
		if (!File.Exists(archivePath))
		{
			AddToDebugAndUiLog("Can not unpack file because it does not exist on the storage! Did the download fail?", isError: true);
			return;
		}
		AddToDebugAndUiLog("Preparing to unpack the downloaded song package.");
		string songsPath = ApplicationManager.PersistentSongsPath();
		ThreadPool.PoolHandle handle = ThreadPool.QueueUserWorkItem((ThreadPool.PoolHandle poolHandle) =>
		{
			if (archivePath.ToLowerInvariant().EndsWith("tar"))
			{
				ExtractTarArchive(archivePath, songsPath, poolHandle);
			}
			else if (archivePath.ToLowerInvariant().EndsWith("zip"))
			{
				ExtractZipArchive(archivePath, songsPath, poolHandle);
			}
		});
		StartCoroutine(TrackUnpackAsync(handle, archivePath, songsPath));
	}

	private void ExtractZipArchive(string archivePath, string targetFolder, ThreadPool.PoolHandle poolHandle)
	{
		using Stream stream = File.OpenRead(archivePath);
		using ZipFile zipFile = new ZipFile(stream);
		extractedEntryCount = 0;
		try
		{
			foreach (ZipEntry item in zipFile)
			{
				ExtractZipEntry(zipFile, item, targetFolder);
			}
			poolHandle.done = true;
		}
		catch (Exception ex)
		{
			AddToDebugAndUiLog("Unpacking failed: " + ex.Message);
			SetErrorStatus();
		}
	}

	private void ExtractZipEntry(ZipFile zipFile, ZipEntry zipEntry, string targetFolder)
	{
		string text = zipEntry.Name;
		if (!zipEntry.IsFile)
		{
			Directory.CreateDirectory(targetFolder + "/" + zipEntry.Name);
			return;
		}
		Debug.Log("Extracting " + text);
		string path = targetFolder + "/" + text;
		byte[] buffer = new byte[4096];
		using Stream source = zipFile.GetInputStream(zipEntry);
		using FileStream destination = File.Create(path);
		StreamUtils.Copy(source, destination, buffer);
		extractedEntryCount++;
	}

	private void ExtractTarArchive(string archivePath, string targetFolder, ThreadPool.PoolHandle poolHandle)
	{
		using Stream inputStream = File.OpenRead(archivePath);
		using TarArchive tarArchive = TarArchive.CreateInputTarArchive(inputStream, Encoding.UTF8);
		try
		{
			tarArchive.ExtractContents(targetFolder);
			poolHandle.done = true;
		}
		catch (Exception ex)
		{
			AddToDebugAndUiLog("Unpacking failed: " + ex.Message);
			SetErrorStatus();
		}
	}

	private IEnumerator TrackUnpackAsync(ThreadPool.PoolHandle handle, string archivePath, string songsPath)
	{
		if (downloadRequest == null)
		{
			yield break;
		}
		string progress1 = "Unpacking file.  ";
		string progress2 = "Unpacking file.. ";
		string progress3 = "Unpacking file...";
		while (handle != null && !handle.done)
		{
			statusLabel.text = GetStatusLabelProgress(progress1);
			yield return new WaitForSeconds(0.5f);
			if (handle == null || handle.done)
			{
				break;
			}
			statusLabel.text = GetStatusLabelProgress(progress2);
			yield return new WaitForSeconds(0.5f);
			if (handle == null || handle.done)
			{
				break;
			}
			statusLabel.text = GetStatusLabelProgress(progress3);
			yield return new WaitForSeconds(0.5f);
		}
		if (handle == null)
		{
			AddToDebugAndUiLog("Unpacking the song package failed. Handle was null for " + archivePath + ".", isError: true);
			statusLabel.text = "Failed. Handle was null";
		}
		else if (handle.done)
		{
			AddToDebugAndUiLog("Finished unpacking the song package to " + songsPath);
			SetFinishedStatus();
			downloadPath.value = "";
			List<string> songDirs = settings.GameSettings.songDirs;
			if (!songDirs.Contains(songsPath))
			{
				songDirs.Add(songsPath);
				settingsManager.Save();
			}
			if (SongMetaManager.IsSongScanFinished)
			{
				Debug.Log("Rescan songs after successful download.");
				SongMetaManager.ResetSongMetas();
				songMetaManager.ScanFilesIfNotDoneYet();
			}
		}
		else
		{
			AddToDebugAndUiLog("Unpacking the song package failed with an unknown error. Please check the log. File: " + archivePath, isError: true);
			statusLabel.text = "Failed";
		}
		if (File.Exists(archivePath))
		{
			File.Delete(archivePath);
		}
		string GetStatusLabelProgress(string prefix)
		{
			return prefix + ((extractedEntryCount > 0) ? $" {extractedEntryCount}" : "");
		}
	}

	private void SetFinishedStatus()
	{
		statusLabel.text = TranslationManager.GetTranslation(R.Messages.contentDownloadScene_status_finished);
	}

	private void SetErrorStatus()
	{
		statusLabel.text = TranslationManager.GetTranslation(R.Messages.contentDownloadScene_status_failed);
	}

	private void SetCanceledStatus()
	{
		statusLabel.text = TranslationManager.GetTranslation(R.Messages.contentDownloadScene_status_canceled);
	}

	private void ResetFileSizeText()
	{
		fileSize.text = "??? KB";
	}

	private void OnDestroy()
	{
		if (downloadRequest != null)
		{
			downloadRequest.Dispose();
		}
	}

	private void ShowHelp()
	{
		if (helpDialogControl == null)
		{
			Dictionary<string, string> titleToContentMap = new Dictionary<string, string>
			{
				{
					TranslationManager.GetTranslation(R.Messages.contentDownloadScene_helpDialog_demoSongPackage_title),
					TranslationManager.GetTranslation(R.Messages.contentDownloadScene_helpDialog_demoSongPackage)
				},
				{
					TranslationManager.GetTranslation(R.Messages.contentDownloadScene_helpDialog_archiveDownload_title),
					TranslationManager.GetTranslation(R.Messages.contentDownloadScene_helpDialog_archiveDownload)
				},
				{
					TranslationManager.GetTranslation(R.Messages.contentDownloadScene_helpDialog_thirdPartyDownloads_title),
					TranslationManager.GetTranslation(R.Messages.contentDownloadScene_helpDialog_thirdPartyDownloads)
				}
			};
			helpDialogControl = uiManager.CreateHelpDialogControl(TranslationManager.GetTranslation(R.Messages.contentDownloadScene_helpDialog_title), titleToContentMap, CloseHelp);
			helpDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.viewMore), () =>
			{
				Application.OpenURL(TranslationManager.GetTranslation(R.Messages.uri_howToDownloadSongs));
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
}
