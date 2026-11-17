using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;

public static class PlayerProfileUtils
{
	public const string PlayerProfileImagesFolderName = "PlayerProfileImages";

	public const string PlayerProfileWebCamImagesFolderName = "WebcamImages";

	public static string GetAbsoluteWebCamImageFolder()
	{
		return GetAbsolutePlayerProfileImagesFolder() + "/WebcamImages";
	}

	public static string GetAbsoluteWebCamImagePath(int playerProfileIndex)
	{
		return $"{GetAbsoluteWebCamImageFolder()}/Player-{playerProfileIndex}.png";
	}

	public static string GetAbsolutePlayerProfileImagesFolder()
	{
		return Application.persistentDataPath + "/PlayerProfileImages";
	}

	public static Dictionary<string, string> FindPlayerProfileImages()
	{
		List<string> obj = new List<string>
		{
			ApplicationUtils.GetStreamingAssetsPath("PlayerProfileImages"),
			GetAbsolutePlayerProfileImagesFolder()
		};
		Dictionary<string, string> result = new Dictionary<string, string>();
		obj.ForEach((string folder) =>
		{
			if (Directory.Exists(folder))
			{
				string[] files = Directory.GetFiles(folder, "*.png", SearchOption.AllDirectories);
				string[] files2 = Directory.GetFiles(folder, "*.jpg", SearchOption.AllDirectories);
				files.Union(files2).ToList().ForEach((string absolutePath) =>
				{
					string key = absolutePath.Substring(folder.Length + 1);
					result.Add(key, absolutePath);
				});
			}
		});
		Debug.Log($"Found {result.Count} player profile images: {JsonConverter.ToJson(result)}");
		return result;
	}
}
