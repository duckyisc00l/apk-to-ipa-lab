using System;
using UnityEngine;

public static class AndroidUtils
{
	public static string GetAppSpecificStorageAbsolutePath(bool sdCard)
	{
		if (Application.isEditor)
		{
			if (!sdCard)
			{
				return "/storage/emulated/0/Android/data/UltraStarPlay/files";
			}
			return "/storage/sdcard/0/Android/data/UltraStarPlay/files";
		}
		using AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
		using AndroidJavaObject androidJavaObject = androidJavaClass.GetStatic<AndroidJavaObject>("currentActivity");
		using AndroidJavaClass androidJavaClass2 = new AndroidJavaClass("android.os.Environment");
		AndroidJavaObject[] array = androidJavaObject.Call<AndroidJavaObject[]>("getExternalFilesDirs", new object[1]);
		foreach (AndroidJavaObject androidJavaObject2 in array)
		{
			string result = androidJavaObject2.Call<string>("getAbsolutePath", Array.Empty<object>());
			bool flag = androidJavaClass2.CallStatic<bool>("isExternalStorageRemovable", new object[1] { androidJavaObject2 });
			bool flag2 = androidJavaClass2.CallStatic<bool>("isExternalStorageEmulated", new object[1] { androidJavaObject2 });
			if (flag2 && !sdCard)
			{
				return result;
			}
			if ((flag && !flag2) & sdCard)
			{
				return result;
			}
		}
		return "";
	}

	public static string GetAppSpecificStorageRelativePath(bool sdCard)
	{
		string appSpecificStorageAbsolutePath = GetAppSpecificStorageAbsolutePath(sdCard);
		if (appSpecificStorageAbsolutePath.IsNullOrEmpty())
		{
			return "";
		}
		string storageRootPath = GetStorageRootPath(sdCard);
		if (storageRootPath.IsNullOrEmpty() || appSpecificStorageAbsolutePath.Length <= storageRootPath.Length + 1)
		{
			return "";
		}
		return appSpecificStorageAbsolutePath.Substring(storageRootPath.Length + 1);
	}

	public static string GetStorageRootPath(bool sdCard)
	{
		string appSpecificStorageAbsolutePath = GetAppSpecificStorageAbsolutePath(sdCard);
		if (appSpecificStorageAbsolutePath.IsNullOrEmpty())
		{
			return "";
		}
		int num = appSpecificStorageAbsolutePath.IndexOf("/Android/", StringComparison.InvariantCulture);
		if (num >= 0)
		{
			return appSpecificStorageAbsolutePath.Substring(0, num);
		}
		return "";
	}
}
