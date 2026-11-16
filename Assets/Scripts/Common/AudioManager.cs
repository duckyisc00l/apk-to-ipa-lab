using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;

public class AudioManager : AbstractSingletonBehaviour
{
	private class LoadingAudioClip
	{
		private readonly Stopwatch stopwatch;

		public string Path { get; private set; }

		public DownloadHandlerAudioClip DownloadHandler { get; private set; }

		public List<Action<AudioClip>> Callbacks { get; private set; } = new List<Action<AudioClip>>();

		public long ElapsedMilliseconds => stopwatch.ElapsedMilliseconds;

		public LoadingAudioClip(string path, DownloadHandlerAudioClip downloadHandler, Action<AudioClip> callback)
		{
			Path = path;
			DownloadHandler = downloadHandler;
			Callbacks.Add(callback);
			stopwatch = new Stopwatch();
			stopwatch.Start();
		}

		public void DisposeAndNotifyCallbacks(AudioClip audioClip)
		{
			DownloadHandler.Dispose();
			foreach (Action<AudioClip> callback in Callbacks)
			{
				callback(audioClip);
			}
		}
	}

	private class CachedAudioClip
	{
		public string Path { get; private set; }

		public AudioClip StreamedAudioClip { get; private set; }

		public AudioClip FullAudioClip { get; private set; }

		public int CreatedInFrame { get; private set; }

		public CachedAudioClip(string path, AudioClip audioClip, int currentFrame, bool isStreamedAudio)
		{
			Path = path;
			CreatedInFrame = currentFrame;
			if (isStreamedAudio)
			{
				StreamedAudioClip = audioClip;
			}
			else
			{
				FullAudioClip = audioClip;
			}
		}
	}

	private static readonly int criticalCacheSize = 10;

	private static readonly Dictionary<string, CachedAudioClip> audioClipCache = new Dictionary<string, CachedAudioClip>();

	public static AudioManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<AudioManager>();

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		ClearCache();
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	public AudioClip LoadAudioClipFromFile(string path, bool streamAudio = true)
	{
		if (!File.Exists(path))
		{
			UnityEngine.Debug.LogError("Audio file does not exist: " + path);
			return null;
		}
		return LoadAudioClipFromUri(path, streamAudio);
	}

	public AudioClip LoadAudioClipFromUri(string uri, bool streamAudio = true)
	{
		if (audioClipCache.TryGetValue(uri, out var value) && (value.StreamedAudioClip != null || (bool)value.FullAudioClip))
		{
			if (streamAudio && value.StreamedAudioClip != null)
			{
				return value.StreamedAudioClip;
			}
			if (!streamAudio && value.FullAudioClip != null)
			{
				return value.FullAudioClip;
			}
		}
		return LoadAndCacheAudioClip(uri, streamAudio);
	}

	public static void ClearCache()
	{
		foreach (CachedAudioClip item in new List<CachedAudioClip>(audioClipCache.Values))
		{
			RemoveCachedAudioClip(item);
		}
		audioClipCache.Clear();
	}

	private AudioClip LoadAndCacheAudioClip(string uri, bool streamAudio)
	{
		AudioClip audioClipUncached = AudioUtils.GetAudioClipUncached(uri, streamAudio);
		if (audioClipUncached == null)
		{
			UnityEngine.Debug.LogError("Could not load AudioClip: " + uri);
			return null;
		}
		AddAudioClipToCache(uri, audioClipUncached, streamAudio);
		return audioClipUncached;
	}

	private static void AddAudioClipToCache(string path, AudioClip audioClip, bool streamAudio)
	{
		if (audioClipCache.Count >= criticalCacheSize)
		{
			RemoveOldestAudioClipsFromCache();
		}
		CachedAudioClip value = new CachedAudioClip(path, audioClip, Time.frameCount, streamAudio);
		audioClipCache[path] = value;
	}

	private static void RemoveOldestAudioClipsFromCache()
	{
		CachedAudioClip cachedAudioClip = null;
		foreach (CachedAudioClip value in audioClipCache.Values)
		{
			if (cachedAudioClip == null || cachedAudioClip.CreatedInFrame > value.CreatedInFrame)
			{
				cachedAudioClip = value;
			}
		}
		if (cachedAudioClip != null)
		{
			RemoveCachedAudioClip(cachedAudioClip);
		}
	}

	private static void RemoveCachedAudioClip(CachedAudioClip cachedAudioClip)
	{
		audioClipCache.Remove(cachedAudioClip.Path);
		if (cachedAudioClip.StreamedAudioClip != null)
		{
			cachedAudioClip.StreamedAudioClip.UnloadAudioData();
		}
		if (cachedAudioClip.FullAudioClip != null)
		{
			cachedAudioClip.FullAudioClip.UnloadAudioData();
		}
	}
}
