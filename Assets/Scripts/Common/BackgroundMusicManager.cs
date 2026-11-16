using System.Collections.Generic;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.SceneManagement;

public class BackgroundMusicManager : AbstractSingletonBehaviour, INeedInjection
{
	private static readonly int timeInSecondsBeforeRestartingBackgroundMusic = 20;

	private static readonly List<EScene> scenesWithoutBackgroundMusic = new List<EScene>
	{
		EScene.SingScene,
		EScene.SongSelectScene,
		EScene.SingingResultsScene,
		EScene.HighscoreScene,
		EScene.SongEditorScene,
		EScene.RecordingOptionsScene
	};

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	private AudioSource backgroundMusicAudioSource;

	[Inject]
	private Settings settings;

	[Inject]
	private SceneNavigator sceneNavigator;

	private float lastPauseTimeInSeconds;

	public static BackgroundMusicManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<BackgroundMusicManager>();

	private bool ShouldPlayBackgroundMusic
	{
		get
		{
			if (settings.AudioSettings.BackgroundMusicVolumePercent <= 0)
			{
				return false;
			}
			EScene sceneByBuildIndex = ESceneUtils.GetSceneByBuildIndex(SceneManager.GetActiveScene().buildIndex);
			return !scenesWithoutBackgroundMusic.Contains(sceneByBuildIndex);
		}
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		settings.ObserveEveryValueChanged((Settings it) => it.AudioSettings.BackgroundMusicVolumePercent).Subscribe((int _) =>
		{
			UpdateBackgroundMusic();
		}).AddTo(base.gameObject);
		sceneNavigator.SceneChangedEventStream.Subscribe((SceneChangedEvent _) =>
		{
			UpdateBackgroundMusic();
		});
	}

	private void UpdateBackgroundMusic()
	{
		backgroundMusicAudioSource.volume = (float)settings.AudioSettings.BackgroundMusicVolumePercent / 100f;
		if (ShouldPlayBackgroundMusic && !backgroundMusicAudioSource.isPlaying)
		{
			float num = Time.time - lastPauseTimeInSeconds;
			if (lastPauseTimeInSeconds > 0f && num > (float)timeInSecondsBeforeRestartingBackgroundMusic)
			{
				Debug.Log($"Did not play background music for {num} seconds. Restarting it from the beginning.");
				backgroundMusicAudioSource.Stop();
			}
			backgroundMusicAudioSource.Play();
		}
		else if (!ShouldPlayBackgroundMusic && backgroundMusicAudioSource.isPlaying)
		{
			backgroundMusicAudioSource.Pause();
			lastPauseTimeInSeconds = Time.time;
		}
	}
}
