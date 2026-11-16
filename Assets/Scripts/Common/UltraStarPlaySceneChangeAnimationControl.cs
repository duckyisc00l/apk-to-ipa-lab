using System;
using UniInject;
using UnityEngine;

public class UltraStarPlaySceneChangeAnimationControl : AbstractSingletonBehaviour, INeedInjection, ISceneInjectionFinishedListener
{
	private RenderTexture uiCopyRenderTexture;

	private Action animateAction;

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	private AudioSource audioSource;

	[Inject]
	private Settings settings;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private ThemeManager themeManager;

	public static UltraStarPlaySceneChangeAnimationControl Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<UltraStarPlaySceneChangeAnimationControl>();

	public RenderTexture UiCopyRenderTexture
	{
		get
		{
			if (uiCopyRenderTexture == null)
			{
				uiCopyRenderTexture = new RenderTexture(Screen.width, Screen.height, 24);
			}
			return uiCopyRenderTexture;
		}
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	public void OnSceneInjectionFinished()
	{
		if (!(this != Instance))
		{
			UpdateSceneTexturesAndTransition();
		}
	}

	private void UpdateSceneTexturesAndTransition()
	{
		themeManager.UpdateSceneTextures(UiCopyRenderTexture);
		if (settings.GraphicSettings.AnimateSceneChange)
		{
			animateAction?.Invoke();
		}
	}

	public void AnimateChangeToScene(Action doLoadSceneAction, Action doAnimateAction)
	{
		if (themeManager.UiRenderTexture == null)
		{
			Debug.LogWarning("uiRenderTexture of ThemeManager is null. Not animating scene transition.");
		}
		else if (UiCopyRenderTexture == null)
		{
			Debug.LogWarning("UiCopyRenderTexture is null. Not animating scene transition.");
		}
		else
		{
			Graphics.CopyTexture(themeManager.UiRenderTexture, UiCopyRenderTexture);
		}
		animateAction = doAnimateAction;
		doLoadSceneAction();
	}

	public void StartSceneChangeAnimation(EScene currentScene, EScene nextScene)
	{
		if (nextScene != EScene.SingScene && currentScene != EScene.SingingResultsScene)
		{
			PlaySceneChangeAnimationSound();
		}
		float sceneChangeAnimationTimeInSeconds = themeManager.GetSceneChangeAnimationTimeInSeconds();
		if (!(sceneChangeAnimationTimeInSeconds <= 0f))
		{
			LeanTween.value(base.gameObject, 0f, 1f, sceneChangeAnimationTimeInSeconds).setOnStart(() =>
			{
				themeManager.BackgroundShaderControl.SetTransitionAnimationEnabled(enable: true);
			}).setOnUpdate((float animTimePercent) =>
			{
				themeManager.BackgroundShaderControl.SetTransitionAnimationTime(animTimePercent);
			})
				.setEaseInSine()
				.setOnComplete(() =>
				{
					themeManager.BackgroundShaderControl.SetTransitionAnimationEnabled(enable: false);
				});
		}
	}

	private void PlaySceneChangeAnimationSound()
	{
		audioSource.volume = (float)settings.AudioSettings.SceneChangeSoundVolumePercent / 100f;
		if (!audioSource.isPlaying)
		{
			audioSource.Play();
		}
	}

	private void OnDestroy()
	{
		UnityEngine.Object.Destroy(uiCopyRenderTexture);
	}
}
