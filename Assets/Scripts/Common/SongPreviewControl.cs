using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;

public class SongPreviewControl : MonoBehaviour, INeedInjection
{
	protected float fadeInStartTimeInSeconds;

	protected float videoFadeInStartTimeInSeconds;

	protected bool isFadeInStarted;

	[Inject]
	protected SongAudioPlayer songAudioPlayer;

	[Inject(Optional = true)]
	protected SongVideoPlayer songVideoPlayer;

	[Inject]
	protected Settings settings;

	protected SongMeta currentPreviewSongMeta;

	protected readonly Subject<SongMeta> startSongPreviewEventStream = new Subject<SongMeta>();

	protected readonly Subject<SongMeta> stopSongPreviewEventStream = new Subject<SongMeta>();

	public float PreviewDelayInSeconds { get; set; } = 1f;

	public float AudioFadeInDurationInSeconds { get; set; } = 5f;

	public float VideoFadeInDurationInSeconds { get; set; } = 2f;

	public IObservable<SongMeta> StartSongPreviewEventStream => startSongPreviewEventStream;

	public IObservable<SongMeta> StopSongPreviewEventStream => stopSongPreviewEventStream;

	public ReactiveProperty<float> VideoFadeIn { get; private set; } = new ReactiveProperty<float>();

	public ReactiveProperty<float> BackgroundImageFadeIn { get; private set; } = new ReactiveProperty<float>();

	protected virtual void Start()
	{
		if (GetFinalPreviewVolume() <= 0f)
		{
			if (songVideoPlayer != null)
			{
				songVideoPlayer.gameObject.SetActive(value: false);
			}
			songAudioPlayer.gameObject.SetActive(value: false);
			base.gameObject.SetActive(value: false);
		}
	}

	protected virtual void Update()
	{
		if (isFadeInStarted)
		{
			float num = UpdateAudioFadeIn();
			float num2 = UpdateVideoFadeIn();
			if ((num < 0f || num >= 1f) && (num2 < 0f || num2 >= 1f))
			{
				isFadeInStarted = false;
			}
		}
	}

	protected virtual float UpdateVideoFadeIn()
	{
		if (songVideoPlayer == null)
		{
			return -1f;
		}
		if (songVideoPlayer.HasLoadedVideo && songVideoPlayer.videoPlayer.time <= 0.0)
		{
			videoFadeInStartTimeInSeconds = Time.time;
		}
		float value = (Time.time - videoFadeInStartTimeInSeconds) / VideoFadeInDurationInSeconds;
		value = NumberUtils.Limit(value, 0f, 1f);
		if (songVideoPlayer.HasLoadedVideo)
		{
			VideoFadeIn.Value = value;
		}
		else if (songVideoPlayer.HasLoadedBackgroundImage)
		{
			BackgroundImageFadeIn.Value = value;
		}
		return value;
	}

	protected virtual float UpdateAudioFadeIn()
	{
		float value = (Time.time - fadeInStartTimeInSeconds) / AudioFadeInDurationInSeconds;
		value = NumberUtils.Limit(value, 0f, 1f);
		float finalPreviewVolume = GetFinalPreviewVolume();
		songAudioPlayer.audioPlayer.volume = value * finalPreviewVolume;
		return value;
	}

	public virtual void StartSongPreview(SongMeta songMeta)
	{
		if (!base.gameObject.activeInHierarchy)
		{
			return;
		}
		StopSongPreview();
		if (songMeta == currentPreviewSongMeta)
		{
			return;
		}
		currentPreviewSongMeta = songMeta;
		if (songMeta != null)
		{
			StartCoroutine(CoroutineUtils.ExecuteAfterDelayInSeconds(PreviewDelayInSeconds, () =>
			{
				DoStartSongPreview(songMeta);
			}));
		}
	}

	protected virtual int GetPreviewStartInMillis(SongMeta songMeta)
	{
		if (songMeta.PreviewStart > 0f)
		{
			return (int)(songMeta.PreviewStart * 1000f);
		}
		Voice voice = songMeta.GetVoices().FirstOrDefault();
		if (voice == null)
		{
			return 0;
		}
		List<Note> list = voice.Sentences.SelectMany((Sentence sentence) => sentence.Notes).ToList();
		if (list.Count == 0)
		{
			return 0;
		}
		int index = (int)((float)(list.Count - 1) * 0.33f);
		Note note = list[index];
		return (int)BpmUtils.BeatToMillisecondsInSong(songMeta, note.StartBeat);
	}

	public virtual void StopSongPreview()
	{
		StopAllCoroutines();
		songAudioPlayer.PauseAudio();
		isFadeInStarted = false;
		stopSongPreviewEventStream.OnNext(currentPreviewSongMeta);
	}

	protected virtual void DoStartSongPreview(SongMeta songMeta)
	{
		if (songMeta != null && currentPreviewSongMeta == songMeta)
		{
			fadeInStartTimeInSeconds = Time.time;
			videoFadeInStartTimeInSeconds = Time.time;
			isFadeInStarted = true;
			int previewStartInMillis = GetPreviewStartInMillis(songMeta);
			StartAudioPreview(songMeta, previewStartInMillis);
			StartVideoPreview(songMeta);
			startSongPreviewEventStream.OnNext(songMeta);
		}
	}

	protected virtual void StartVideoPreview(SongMeta songMeta)
	{
		if (!songMeta.Video.IsNullOrEmpty() && !(songVideoPlayer == null))
		{
			VideoFadeIn.Value = 0f;
			BackgroundImageFadeIn.Value = 0f;
			songVideoPlayer.SongMeta = songMeta;
			songVideoPlayer.StartVideoOrShowBackgroundImage();
		}
	}

	protected virtual void StartAudioPreview(SongMeta songMeta, int previewStartInMillis)
	{
		try
		{
			songAudioPlayer.Init(songMeta);
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
			UiManager.CreateNotification("Audio could not be loaded (artist: " + songMeta.Artist + ", title: " + songMeta.Title + ")");
			return;
		}
		songAudioPlayer.PositionInSongInMillis = previewStartInMillis;
		songAudioPlayer.audioPlayer.volume = 0f;
		if (songAudioPlayer.HasAudioClip)
		{
			songAudioPlayer.PlayAudio();
			return;
		}
		string text = "Audio could not be loaded (artist: " + songMeta.Artist + ", title: " + songMeta.Title + ")";
		Debug.LogError(text);
		UiManager.CreateNotification(text, "error");
	}

	protected virtual float GetFinalPreviewVolume()
	{
		return (float)settings.AudioSettings.PreviewVolumePercent / 100f;
	}
}
