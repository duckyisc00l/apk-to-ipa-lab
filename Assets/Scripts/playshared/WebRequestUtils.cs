using System;
using System.Collections;
using UnityEngine;
using UnityEngine.Networking;

public static class WebRequestUtils
{
	public static IEnumerator LoadTexture2DFromUri(string uri, Action<Texture2D> onSuccess, Action<UnityWebRequest> onFailure = null)
	{
		using UnityWebRequest webRequest = UnityWebRequestTexture.GetTexture(new Uri(uri));
		DownloadHandlerTexture downloadHandler = webRequest.downloadHandler as DownloadHandlerTexture;
		webRequest.SendWebRequest();
		while (!webRequest.isDone)
		{
			yield return null;
		}
		UnityWebRequest.Result result = webRequest.result;
		if (result == UnityWebRequest.Result.ConnectionError || result == UnityWebRequest.Result.ProtocolError)
		{
			if (onFailure != null)
			{
				onFailure(webRequest);
				yield break;
			}
			Debug.LogError("Error loading Texture2D from: " + uri);
			Debug.LogError(webRequest.error);
		}
		else
		{
			onSuccess(downloadHandler.texture);
		}
	}

	public static bool IsHttpOrHttpsUri(string uri)
	{
		if (!uri.IsNullOrEmpty())
		{
			if (!uri.StartsWith("http://"))
			{
				return uri.StartsWith("https://");
			}
			return true;
		}
		return false;
	}

	public static bool IsNetworkPath(string absolutePath)
	{
		if (!absolutePath.IsNullOrEmpty())
		{
			if (!absolutePath.StartsWith("\\\\"))
			{
				return absolutePath.StartsWith("//");
			}
			return true;
		}
		return false;
	}

	public static string AbsoluteFilePathToUri(string absolutePath)
	{
		if (absolutePath.StartsWith("\\\\"))
		{
			return "file:///" + absolutePath;
		}
		if (absolutePath.StartsWith("//"))
		{
			return "file://" + absolutePath;
		}
		return absolutePath;
	}
}
