using System.Collections.Generic;
using System.Globalization;
using System.IO;
using ICSharpCode.SharpZipLib.Core;
using ICSharpCode.SharpZipLib.Zip;
using UnityEngine;

public static class AndroidStreamingAssets
{
	private const string StreamingAssetsDir = "assets/";

	private const string StreamingAssetsInternalDataDir = "assets/bin/";

	private const string MetaExtension = ".meta";

	private const string AssetsHashFileName = "AssetsHash.txt";

	private static string path;

	public static string Path
	{
		get
		{
			if (path == null)
			{
				Extract();
			}
			return path;
		}
	}

	public static void Extract()
	{
		string text = Application.persistentDataPath + "/ExtractedStreamingAssets";
		path = text + "/assets";
		string hashFilePath = Application.persistentDataPath + "/AssetsHash.txt";
		string assetsHash = GetAssetsHash(hashFilePath);
		string text2 = ComputeAssetsHash(Application.dataPath);
		if (Directory.Exists(path))
		{
			if (assetsHash == text2)
			{
				Debug.Log("Found existing extracted StreamingAssets folder with matching assets hash " + text2);
				return;
			}
			Debug.Log("Found existing extracted StreamingAssets folder but assets hash changed to '" + text2 + "' from '" + assetsHash + "'");
			Directory.Delete(path, recursive: true);
		}
		using (new DisposableStopwatch("Extracting StreamingAssets folder took <ms> ms"))
		{
			Debug.Log("Extracting StreamingAssets folder to " + text);
			Directory.CreateDirectory(text);
			if (text[text.Length - 1] != '/' || text[text.Length - 1] != '\\')
			{
				text += "/";
			}
			HashSet<string> hashSet = new HashSet<string>();
			ZipFile zipFile = null;
			try
			{
				using FileStream file = File.OpenRead(Application.dataPath);
				zipFile = new ZipFile(file);
				foreach (ZipEntry item in zipFile)
				{
					if (!item.IsFile)
					{
						continue;
					}
					string name = item.Name;
					if (!name.StartsWith("assets/") || name.EndsWith(".meta") || name.StartsWith("assets/bin/"))
					{
						continue;
					}
					string directoryName = System.IO.Path.GetDirectoryName(name);
					if (!hashSet.Contains(directoryName))
					{
						Directory.CreateDirectory(text + directoryName);
						hashSet.Add(directoryName);
					}
					byte[] buffer = new byte[4096];
					using Stream source = zipFile.GetInputStream(item);
					using FileStream destination = File.Create(text + name);
					StreamUtils.Copy(source, destination, buffer);
				}
			}
			finally
			{
				if (zipFile != null)
				{
					zipFile.IsStreamOwner = true;
					zipFile.Close();
				}
			}
			SetAssetsHash(hashFilePath, text2);
			Debug.Log("Extracting StreamingAssets folder done");
		}
	}

	private static string GetAssetsHash(string hashFilePath)
	{
		if (!File.Exists(hashFilePath))
		{
			return "";
		}
		return File.ReadAllText(hashFilePath);
	}

	private static void SetAssetsHash(string hashFilePath, string hash)
	{
		string directoryName = System.IO.Path.GetDirectoryName(hashFilePath);
		if (!directoryName.IsNullOrEmpty())
		{
			Directory.CreateDirectory(directoryName);
			File.WriteAllText(hashFilePath, hash);
		}
	}

	private static string ComputeAssetsHash(string assetsFilePath)
	{
		using (new DisposableStopwatch("ComputeAssetsHash for " + assetsFilePath + " took <ms> ms"))
		{
			return new FileInfo(assetsFilePath).LastWriteTimeUtc.ToString("yyyy-MM-dd'T'HH:mm:ss.fffK", CultureInfo.InvariantCulture);
		}
	}
}
