using System;
using System.IO;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class SongFolderListEntryControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private Settings settings;

	[Inject(Key = "initialPath")]
	private string initialPath;

	[Inject(UxmlName = "warningContainer")]
	private VisualElement warningContainer;

	[Inject(UxmlName = "warningLabel")]
	private Label warningLabel;

	[Inject(UxmlName = "pathTextField")]
	private TextField textField;

	[Inject(UxmlName = "deleteButton")]
	private Button deleteButton;

	[Inject(UxmlName = "openFolderButton")]
	private Button openSongFolderButton;

	[Inject(UxmlName = "driveButton")]
	private Button driveButton;

	private readonly string androidSdCardPath;

	private readonly string androidInternalStoragePath;

	private readonly ReactiveProperty<string> androidDrivePath = new ReactiveProperty<string>("");

	private readonly Subject<string> valueChangedEventStream = new Subject<string>();

	private readonly Subject<bool> deleteEventStream = new Subject<bool>();

	private string FullPath
	{
		get
		{
			if (!androidDrivePath.Value.IsNullOrEmpty())
			{
				return PathUtils.CombinePaths(androidDrivePath.Value, textField.value);
			}
			return textField.value;
		}
	}

	public IObservable<string> ValueChangedEventStream => valueChangedEventStream;

	public IObservable<bool> DeleteEventStream => deleteEventStream;

	public SongFolderListEntryControl()
	{
		if (PlatformUtils.IsAndroid)
		{
			androidInternalStoragePath = AndroidUtils.GetStorageRootPath(sdCard: false);
			androidSdCardPath = AndroidUtils.GetStorageRootPath(sdCard: true);
		}
		else
		{
			androidInternalStoragePath = "";
			androidSdCardPath = "";
		}
	}

	public void OnInjectionFinished()
	{
		if (PlatformUtils.IsAndroid)
		{
			if (!androidSdCardPath.IsNullOrEmpty() && initialPath.StartsWith(androidSdCardPath))
			{
				androidDrivePath.Value = androidSdCardPath;
			}
			else if (!androidInternalStoragePath.IsNullOrEmpty() && initialPath.StartsWith(androidInternalStoragePath))
			{
				androidDrivePath.Value = androidInternalStoragePath;
			}
			else
			{
				androidDrivePath.Value = "";
			}
			textField.value = initialPath.Substring(androidDrivePath.Value.Length);
			UpdateDriveButton();
			driveButton.RegisterCallbackButtonTriggered(() =>
			{
				ToggleAndroidDrivePath();
			});
		}
		else
		{
			textField.value = initialPath;
			androidDrivePath.Value = "";
			driveButton.HideByDisplay();
		}
		if (PlatformUtils.IsStandalone)
		{
			openSongFolderButton.RegisterCallbackButtonTriggered(() =>
			{
				ApplicationUtils.OpenDirectory(FullPath);
			});
		}
		else
		{
			openSongFolderButton.HideByDisplay();
		}
		deleteButton.RegisterCallbackButtonTriggered(() =>
		{
			deleteEventStream.OnNext(value: true);
		});
		textField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			CheckPathIsValid();
			valueChangedEventStream.OnNext(FullPath);
		});
		androidDrivePath.Subscribe((string _) =>
		{
			valueChangedEventStream.OnNext(FullPath);
		});
		CheckPathIsValid();
	}

	private void UpdateDriveButton()
	{
		if (!PlatformUtils.IsAndroid)
		{
			driveButton.HideByDisplay();
			return;
		}
		driveButton.ShowByDisplay();
		if (!androidInternalStoragePath.IsNullOrEmpty() && androidDrivePath.Value == androidInternalStoragePath)
		{
			driveButton.text = TranslationManager.GetTranslation(R.Messages.options_songLibrary_androidInternalStorage);
		}
		else if (!androidSdCardPath.IsNullOrEmpty() && androidDrivePath.Value == androidSdCardPath)
		{
			driveButton.text = TranslationManager.GetTranslation(R.Messages.options_songLibrary_androidSdCardStorage);
		}
		else
		{
			driveButton.text = TranslationManager.GetTranslation(R.Messages.options_songLibrary_androidOtherStorage);
		}
	}

	private void ToggleAndroidDrivePath()
	{
		if (!androidInternalStoragePath.IsNullOrEmpty() && !androidSdCardPath.IsNullOrEmpty())
		{
			if (!androidInternalStoragePath.IsNullOrEmpty() && androidDrivePath.Value == androidInternalStoragePath)
			{
				androidDrivePath.Value = androidSdCardPath;
			}
			else if (!androidSdCardPath.IsNullOrEmpty() && androidDrivePath.Value == androidSdCardPath)
			{
				textField.value = androidDrivePath?.ToString() + textField.value;
				androidDrivePath.Value = "";
			}
			else if (!androidInternalStoragePath.IsNullOrEmpty() && FullPath.StartsWith(androidInternalStoragePath))
			{
				textField.value = textField.value.Substring(androidInternalStoragePath.Length);
				androidDrivePath.Value = androidInternalStoragePath;
			}
			else if (!androidSdCardPath.IsNullOrEmpty() && FullPath.StartsWith(androidSdCardPath))
			{
				textField.value = textField.value.Substring(androidSdCardPath.Length);
				androidDrivePath.Value = androidInternalStoragePath;
			}
			UpdateDriveButton();
		}
	}

	private void HideWarning()
	{
		warningContainer.HideByDisplay();
		warningLabel.text = "";
	}

	private void ShowWarning(string message)
	{
		warningContainer.ShowByDisplay();
		warningLabel.text = message;
	}

	public void CheckPathIsValid()
	{
		if (Directory.Exists(FullPath))
		{
			string parentFolder;
			if (SettingsProblemHintControl.IsDuplicateFolder(FullPath, settings.GameSettings.songDirs))
			{
				ShowWarning(TranslationManager.GetTranslation(R.Messages.options_songLibrary_songFolder_duplicate));
			}
			else if (SettingsProblemHintControl.IsSubfolderOfAnyOtherFolder(FullPath, settings.GameSettings.songDirs, out parentFolder))
			{
				ShowWarning(TranslationManager.GetTranslation(R.Messages.options_songLibrary_songFolder_subfolderOfOtherFolder, "parentFolder", parentFolder));
			}
			else
			{
				HideWarning();
			}
		}
		else if (FullPath.IsNullOrEmpty())
		{
			ShowWarning(TranslationManager.GetTranslation(R.Messages.options_songLibrary_songFolder_missingValue));
		}
		else if (File.Exists(FullPath))
		{
			ShowWarning(TranslationManager.GetTranslation(R.Messages.options_songLibrary_songFolder_noFolder));
		}
		else
		{
			ShowWarning(TranslationManager.GetTranslation(R.Messages.options_songLibrary_songFolder_doesNotExist));
		}
	}
}
