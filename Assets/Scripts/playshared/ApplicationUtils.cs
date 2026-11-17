using System;
using System.IO;
using ProTrans;
using UnityEngine;

public static class ApplicationUtils
{
	public static void OpenDirectory(string path)
	{
		Application.OpenURL("file://" + path);
	}

	public static void QuitOrStopPlayMode()
	{
		Application.Quit();
	}

	public static string GetStreamingAssetsPath(string pathInStreamingAssetsFolder)
	{
		return AndroidStreamingAssets.Path + "/" + pathInStreamingAssetsFolder;
	}

	public static ScreenResolution GetScreenResolution()
	{
		return new ScreenResolution(Screen.width, Screen.height, Screen.currentResolution.refreshRate);
	}

	public static Vector2 GetScreenSizeInPanelCoordinates(PanelHelper panelHelper)
	{
		return panelHelper.ScreenToPanel(new Vector2(Screen.width, Screen.height));
	}

	public static bool IsSupportedAudioFormat(string fileExtension)
	{
		fileExtension = NormalizeFileExtension(fileExtension);
		if (!(fileExtension == "mp3") && !(fileExtension == "ogg"))
		{
			return fileExtension == "wav";
		}
		return true;
	}

	public static bool IsSupportedVideoFormat(string fileExtension)
	{
		fileExtension = NormalizeFileExtension(fileExtension);
		switch (fileExtension)
		{
		default:
			return fileExtension == "wmf";
		case "avi":
		case "mp4":
		case "mpg":
		case "mpeg":
		case "vp8":
		case "webm":
		case "m4v":
		case "mov":
		case "dv":
		case "afs":
			return true;
		}
	}

	private static string NormalizeFileExtension(string fileExtension)
	{
		if (fileExtension == null)
		{
			return "";
		}
		if (fileExtension.StartsWith("."))
		{
			fileExtension = fileExtension.Substring(1);
		}
		return fileExtension.ToLowerInvariant();
	}

	public static int ComparePaths(string path1, string path2)
	{
		return string.Compare(Path.GetFullPath(path1).TrimEnd('\\'), Path.GetFullPath(path2).TrimEnd('\\'), StringComparison.InvariantCultureIgnoreCase);
	}

	public static bool IsLargeScreen()
	{
		return GetPhysicalDiagonalScreenSizeInInches() > 10f;
	}

	public static bool IsSmallScreen()
	{
		return !IsLargeScreen();
	}

	public static float GetPhysicalDiagonalScreenSizeInInches()
	{
		float num = Screen.width * Screen.width;
		float num2 = Screen.height * Screen.height;
		return Mathf.Sqrt(num + num2) / Screen.dpi;
	}

	public static string ReplacePathsWithDisplayString(string text)
	{
		if (PlatformUtils.IsAndroid)
		{
			string text2 = "Internal Storage";
			string text3 = "SD Card";
			if (ThreadUtils.IsMainThread())
			{
				text2 = TranslationManager.GetTranslation("androidInternalStorage");
				text3 = TranslationManager.GetTranslation("androidSdCardStorage");
			}
			string storageRootPath = AndroidUtils.GetStorageRootPath(sdCard: false);
			string storageRootPath2 = AndroidUtils.GetStorageRootPath(sdCard: true);
			return text.Replace(storageRootPath, text2 + "/").Replace(storageRootPath2, text3 + "/");
		}
		return text;
	}
}
