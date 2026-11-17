using System.Diagnostics;
using ProTrans;
using UniInject;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ApplyTranslationsOnSceneInjectionFinished : MonoBehaviour, INeedInjection, ISceneInjectionFinishedListener
{
	[Inject]
	private ISettings settings;

	[Inject]
	private TranslationManager translationManager;

	public void OnSceneInjectionFinished()
	{
		if (translationManager.currentLanguage != settings.Language)
		{
			translationManager.currentLanguage = settings.Language;
			translationManager.ReloadTranslationsAndUpdateScene();
		}
		if (Application.isPlaying)
		{
			UpdateTranslatorsInScene();
		}
	}

	public void UpdateTranslatorsInScene()
	{
		Stopwatch stopwatch = new Stopwatch();
		stopwatch.Start();
		int count = 0;
		GameObject[] rootGameObjects = SceneManager.GetActiveScene().GetRootGameObjects();
		for (int i = 0; i < rootGameObjects.Length; i++)
		{
			rootGameObjects[i].GetComponentsInChildren<ITranslator>()?.ForEach((ITranslator it) =>
			{
				it.UpdateTranslation();
				count++;
			});
		}
		if ((translationManager.logInfoInEditMode && !Application.isPlaying) || (translationManager.logInfoInPlayMode && Application.isPlaying))
		{
			UnityEngine.Debug.Log($"Updated {count} ITranslator instances in scene took {stopwatch.ElapsedMilliseconds} ms");
		}
	}
}
