using System;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Networking;

public static class AudioUtils
{
	public static AudioClip GetAudioClipUncached(string uri, bool streamAudio)
	{
		return LoadAudio(uri, streamAudio);
	}

	private static AudioClip LoadAudio(string uri, bool streamAudio)
	{
		using UnityWebRequest unityWebRequest = UnityWebRequestMultimedia.GetAudioClip(new Uri(uri), AudioType.UNKNOWN);
		DownloadHandlerAudioClip downloadHandlerAudioClip = unityWebRequest.downloadHandler as DownloadHandlerAudioClip;
		downloadHandlerAudioClip.streamAudio = streamAudio;
		unityWebRequest.SendWebRequest();
		UnityWebRequest.Result result = unityWebRequest.result;
		if (result == UnityWebRequest.Result.ConnectionError || result == UnityWebRequest.Result.ProtocolError)
		{
			Debug.LogError("Error Loading Audio: " + uri);
			Debug.LogError(unityWebRequest.error);
			return null;
		}
		while (!unityWebRequest.isDone)
		{
			Task.Delay(30);
		}
		return downloadHandlerAudioClip.audioClip;
	}
}
