using System.Collections.Generic;
using System.IO;
using System.Linq;
using ProTrans;
using UniInject;
using UnityEngine.UIElements;

public class SettingsProblemHintControl
{
	public SettingsProblemHintControl(VisualElement visualElement, List<string> settingsProblems, Injector injector)
	{
		visualElement.SetVisibleByDisplay(!settingsProblems.IsNullOrEmpty());
		injector.WithRootVisualElement(visualElement).CreateAndInject<TooltipControl>().TooltipText = settingsProblems.JoinWith("\n\n");
	}

	public static List<string> GetAllSettingsProblems(Settings settings, SongMetaManager songMetaManager)
	{
		return GetSongLibrarySettingsProblems(settings, songMetaManager).Concat(GetRecordingSettingsProblems(settings)).Concat(GetPlayerSettingsProblems(settings)).ToList();
	}

	public static List<string> GetSongLibrarySettingsProblems(Settings settings, SongMetaManager songMetaManager)
	{
		List<string> list = new List<string>();
		if (settings.GameSettings.songDirs.IsNullOrEmpty())
		{
			list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_noSongFolders));
		}
		else if (settings.GameSettings.songDirs.AnyMatch((string songDir) => !Directory.Exists(songDir)))
		{
			list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_songFolderDoesNotExist));
		}
		if (songMetaManager.GetSongIssues().Count > 0)
		{
			list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_thereAreSongIssues));
		}
		bool flag = false;
		bool flag2 = false;
		foreach (string songDir in settings.GameSettings.songDirs)
		{
			if (!flag && IsDuplicateFolder(songDir, settings.GameSettings.songDirs))
			{
				flag = true;
				list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_duplicateSongFolders));
			}
			if (!flag2 && IsSubfolderOfAnyOtherFolder(songDir, settings.GameSettings.songDirs, out var _))
			{
				flag2 = true;
				list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_songFolderIsSubfolderOfOtherSongFolder));
			}
		}
		return list;
	}

	public static List<string> GetRecordingSettingsProblems(Settings settings)
	{
		List<string> list = new List<string>();
		if (settings.MicProfiles.IsNullOrEmpty() || !settings.MicProfiles.AnyMatch((MicProfile micProfile) => micProfile.IsEnabled))
		{
			list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_noMicProfiles));
		}
		else if (settings.MicProfiles.AllMatch((MicProfile micProfile) => !micProfile.IsEnabled || !micProfile.IsConnected(ServerSideConnectRequestManager.Instance)))
		{
			list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_noConnectedAndEnabledMicProfile));
		}
		return list;
	}

	public static List<string> GetPlayerSettingsProblems(Settings settings)
	{
		List<string> list = new List<string>();
		if (settings.PlayerProfiles.IsNullOrEmpty())
		{
			list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_noPlayerProfile));
		}
		else if (!settings.PlayerProfiles.AnyMatch((PlayerProfile playerProfile) => playerProfile.IsEnabled))
		{
			list.Add(TranslationManager.GetTranslation(R.Messages.settingsProblem_noEnabledPlayerProfile));
		}
		return list;
	}

	public static bool IsDuplicateFolder(string path, List<string> folders)
	{
		if (path.IsNullOrEmpty() || !Directory.Exists(path))
		{
			return false;
		}
		return folders.Where((string folder) => !folder.IsNullOrEmpty() && Directory.Exists(folder)).Count((string folder) => new DirectoryInfo(folder).FullName == new DirectoryInfo(path).FullName) >= 2;
	}

	public static bool IsSubfolderOfAnyOtherFolder(string potentialSubfolder, List<string> potentialParentFolders, out string parentFolder)
	{
		foreach (string potentialParentFolder in potentialParentFolders)
		{
			if (potentialSubfolder != potentialParentFolder && IsSubfolder(potentialSubfolder, potentialParentFolder))
			{
				parentFolder = potentialParentFolder;
				return true;
			}
		}
		parentFolder = "";
		return false;
	}

	private static bool IsSubfolder(string potentialSubfolder, string potentialParentFolder)
	{
		if (potentialSubfolder.IsNullOrEmpty() || potentialParentFolder.IsNullOrEmpty())
		{
			return false;
		}
		DirectoryInfo directoryInfo = new DirectoryInfo(potentialSubfolder);
		DirectoryInfo directoryInfo2 = new DirectoryInfo(potentialParentFolder);
		if (directoryInfo.FullName == directoryInfo2.FullName)
		{
			return false;
		}
		string text = directoryInfo2.FullName;
		if (!text.EndsWith(Path.DirectorySeparatorChar))
		{
			string text2 = text;
			char directorySeparatorChar = Path.DirectorySeparatorChar;
			text = text2 + directorySeparatorChar;
		}
		return directoryInfo.FullName.StartsWith(text);
	}
}
