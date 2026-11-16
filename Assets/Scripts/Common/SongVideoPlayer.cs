using System;
using System.Collections.Generic;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.Video;

public class SongVideoPlayer : MonoBehaviour, INeedInjection, IInjectionFinishedListener
{
	private static readonly HashSet<string> ignoredVideoFiles = new HashSet<string>();

	[InjectedInInspector]
	public VideoPlayer videoPlayer;

	[Inject(UxmlName = "songVideoImage", Optional = true)]
	private VisualElement videoImageVisualElement;

	[Inject(UxmlName = "songImage", Optional = true)]
	private VisualElement backgroundImageVisualElement;

	public bool forceSyncOnForwardJumpInTheSong;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	private SongMeta songMeta;

	private float nextSyncTimeInSeconds;

	private IDisposable jumpBackInSongEventStreamDisposable;

	private IDisposable jumpForwardInSongEventStreamDisposable;

	public string videoPlayerErrorMessage;

	public VisualElement VideoImageVisualElement
	{
		get
		{
			return videoImageVisualElement;
		}
		set
		{
			videoImageVisualElement = value;
			if (HasLoadedVideo && videoImageVisualElement != null)
			{
				videoImageVisualElement.ShowByDisplay();
			}
		}
	}

	public SongMeta SongMeta
	{
		get
		{
			return songMeta;
		}
		set
		{
			songMeta = value;
			InitVideo(songMeta);
		}
	}

	public bool HasLoadedVideo { get; private set; }

	public bool HasLoadedBackgroundImage { get; private set; }

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		ignoredVideoFiles.Clear();
	}

	public void OnInjectionFinished()
	{
		HasLoadedBackgroundImage = false;
		InitEventSubscriber();
		InitVideo(SongMeta);
	}

	private void InitEventSubscriber()
	{
		if (jumpBackInSongEventStreamDisposable != null)
		{
			jumpBackInSongEventStreamDisposable.Dispose();
		}
		jumpBackInSongEventStreamDisposable = songAudioPlayer.JumpBackInSongEventStream.Subscribe((Pair<double> _) =>
		{
			SyncVideoWithMusic(forceImmediateSync: true);
		});
		if (jumpForwardInSongEventStreamDisposable != null)
		{
			jumpForwardInSongEventStreamDisposable.Dispose();
		}
		if (forceSyncOnForwardJumpInTheSong)
		{
			jumpForwardInSongEventStreamDisposable = songAudioPlayer.JumpForwardInSongEventStream.Subscribe((Pair<double> _) =>
			{
				SyncVideoWithMusic(forceImmediateSync: true);
			});
		}
	}

	private void Update()
	{
		if (!videoPlayerErrorMessage.IsNullOrEmpty())
		{
			Debug.LogError(videoPlayerErrorMessage);
			UiManager.CreateNotification(videoPlayerErrorMessage, "error");
			videoPlayerErrorMessage = "";
			UnloadVideo();
			if (songMeta != null)
			{
				ignoredVideoFiles.Add(songMeta.Video);
			}
		}
		if (HasLoadedVideo)
		{
			if (songAudioPlayer != null)
			{
				SyncVideoWithMusic(forceImmediateSync: false);
			}
			else
			{
				Debug.Log("no audio player");
			}
		}
	}

	public void StartVideoOrShowBackgroundImage()
	{
		if (HasLoadedVideo)
		{
			StartVideoPlayback();
		}
		else
		{
			ShowBackgroundImage();
		}
	}

	private void LoadVideo(string uri)
	{
		videoPlayer.url = GetVideoPlayerUri(uri);
		HasLoadedVideo = !videoPlayer.url.IsNullOrEmpty();
		if (HasLoadedVideo)
		{
			if (videoImageVisualElement != null)
			{
				videoImageVisualElement.ShowByDisplay();
			}
			videoPlayer.Pause();
		}
	}

	private void UnloadVideo()
	{
		if (HasLoadedVideo)
		{
			HasLoadedVideo = false;
			videoPlayer.Stop();
			videoPlayer.clip = null;
			videoPlayer.source = VideoSource.VideoClip;
			ClearOutRenderTexture(videoPlayer.targetTexture);
		}
	}

	private void SyncVideoWithMusic(bool forceImmediateSync)
	{
		SyncVideoPlayPause(songAudioPlayer.PositionInSongInMillis);
		if (videoPlayer.isPlaying | forceImmediateSync)
		{
			SyncVideoWithMusic(songAudioPlayer.PositionInSongInMillis, forceImmediateSync);
		}
	}

	private void StartVideoPlayback()
	{
		if (!HasLoadedVideo)
		{
			Debug.LogWarning("No video has been loaded. Showing background image instead.");
			ShowBackgroundImage();
		}
		else if (SongMeta.VideoGap > 0f)
		{
			videoPlayer.time = SongMeta.VideoGap;
		}
	}

	private void SyncVideoPlayPause(double positionInSongInMillis)
	{
		if (HasLoadedVideo && videoPlayer.gameObject.activeInHierarchy)
		{
			bool flag = songAudioPlayer == null || songAudioPlayer.IsPlaying;
			if ((!flag && videoPlayer.isPlaying) || (videoPlayer.length > 0.0 && videoPlayer.length * 1000.0 <= songAudioPlayer.PositionInSongInMillis))
			{
				videoPlayer.Pause();
			}
			else if (flag && !videoPlayer.isPlaying && !IsWaitingForVideoGap(positionInSongInMillis))
			{
				videoPlayer.Play();
			}
		}
	}

	public void SyncVideoWithMusic(double positionInSongInMillis, bool forceImmediateSync)
	{
		if (HasLoadedVideo && !IsWaitingForVideoGap(positionInSongInMillis) && (forceImmediateSync || !(nextSyncTimeInSeconds > Time.time)))
		{
			nextSyncTimeInSeconds = Time.time + 0.5f;
			double num = (double)SongMeta.VideoGap + positionInSongInMillis / 1000.0;
			double num2 = num - videoPlayer.time;
			if (forceImmediateSync || Math.Abs(num2) > 2.0)
			{
				videoPlayer.time = num;
				videoPlayer.playbackSpeed = 1f;
			}
			else
			{
				float playbackSpeed = 1f + (float)(num2 / 2.0);
				videoPlayer.playbackSpeed = playbackSpeed;
			}
		}
	}

	private bool IsWaitingForVideoGap(double positionInSongInMillis)
	{
		if (SongMeta.VideoGap < 0f)
		{
			return positionInSongInMillis < (double)((0f - SongMeta.VideoGap) * 1000f);
		}
		return false;
	}

	public void ShowBackgroundImage()
	{
		if (videoImageVisualElement != null)
		{
			videoImageVisualElement.HideByDisplay();
		}
		if (SongMeta.Background.IsNullOrEmpty())
		{
			ShowCoverImageAsBackground();
			return;
		}
		string backgroundUri = SongMetaUtils.GetBackgroundUri(SongMeta);
		if (!SongMetaUtils.BackgroundResourceExists(songMeta))
		{
			Debug.LogWarning("Showing cover image because background image resource does not exist: " + backgroundUri);
			ShowCoverImageAsBackground();
		}
		else
		{
			LoadBackgroundImage(backgroundUri);
		}
	}

	private void ShowCoverImageAsBackground()
	{
		string coverUri = SongMetaUtils.GetCoverUri(SongMeta);
		if (!coverUri.IsNullOrEmpty())
		{
			if (!SongMetaUtils.CoverResourceExists(SongMeta))
			{
				Debug.LogWarning("Cover image resource does not exist: " + coverUri);
			}
			else
			{
				LoadBackgroundImage(coverUri);
			}
		}
	}

	private void LoadBackgroundImage(string backgroundUri)
	{
		if (backgroundUri.IsNullOrEmpty())
		{
			return;
		}
		ImageManager.LoadSpriteFromUri(backgroundUri, (Sprite loadedSprite) =>
		{
			if (backgroundImageVisualElement != null)
			{
				backgroundImageVisualElement.ShowByDisplay();
				backgroundImageVisualElement.style.backgroundImage = new StyleBackground(loadedSprite);
			}
			HasLoadedBackgroundImage = true;
		});
	}

	public void ReloadVideo()
	{
		InitVideo(songMeta);
	}

	private void InitVideo(SongMeta initSongMeta)
	{
		UnloadVideo();
		if (initSongMeta != null && !initSongMeta.Video.IsNullOrEmpty() && !ignoredVideoFiles.Contains(initSongMeta.Video))
		{
			string videoUri = SongMetaUtils.GetVideoUri(initSongMeta);
			if (!SongMetaUtils.VideoResourceExists(initSongMeta))
			{
				Debug.LogWarning("Video file resource does not exist: " + videoUri);
			}
			else
			{
				LoadVideo(videoUri);
			}
		}
	}

	private void OnEnable()
	{
		videoPlayer.errorReceived += OnVideoPlayerErrorReceived;
	}

	private void OnDisable()
	{
		videoPlayer.errorReceived -= OnVideoPlayerErrorReceived;
		if (HasLoadedVideo)
		{
			ClearOutRenderTexture(videoPlayer.targetTexture);
		}
	}

	private void OnVideoPlayerErrorReceived(VideoPlayer source, string message)
	{
		videoPlayerErrorMessage = message;
	}

	private void ClearOutRenderTexture(RenderTexture renderTexture)
	{
		RenderTexture active = RenderTexture.active;
		RenderTexture.active = renderTexture;
		GL.Clear(clearDepth: true, clearColor: true, Color.clear);
		RenderTexture.active = active;
	}

	private static string GetVideoPlayerUri(string uri)
	{
		if (uri.StartsWith("file://") && (uri.EndsWith(".vp8") || uri.EndsWith(".webm")))
		{
			return uri.Substring("file://".Length);
		}
		return uri;
	}
}
