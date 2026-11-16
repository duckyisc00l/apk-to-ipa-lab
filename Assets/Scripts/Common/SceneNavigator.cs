using System;
using System.Collections.Generic;
using System.Diagnostics;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneNavigator : AbstractSingletonBehaviour, INeedInjection
{
	private static readonly Dictionary<Type, SceneData> staticSceneDatas = new Dictionary<Type, SceneData>();

	private readonly Subject<BeforeSceneChangeEvent> beforeSceneChangeEventStream = new Subject<BeforeSceneChangeEvent>();

	private readonly Subject<SceneChangedEvent> sceneChangedEventStream = new Subject<SceneChangedEvent>();

	[Inject]
	private UltraStarPlaySceneChangeAnimationControl sceneChangeAnimationControl;

	[Inject]
	private Settings settings;

	public bool logSceneChangeDuration;

	public static SceneNavigator Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<SceneNavigator>();

	public IObservable<BeforeSceneChangeEvent> BeforeSceneChangeEventStream => beforeSceneChangeEventStream;

	public IObservable<SceneChangedEvent> SceneChangedEventStream => sceneChangedEventStream;

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		staticSceneDatas.Clear();
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		Stopwatch stopwatch = new Stopwatch();
		BeforeSceneChangeEventStream.Subscribe((BeforeSceneChangeEvent _) =>
		{
			stopwatch.Reset();
			stopwatch.Start();
		});
		SceneChangedEventStream.Subscribe((SceneChangedEvent _) =>
		{
			stopwatch.Stop();
			if (logSceneChangeDuration)
			{
				UnityEngine.Debug.Log($"Changing scenes took {stopwatch.ElapsedMilliseconds} ms");
			}
		});
	}

	protected override void OnEnableSingleton()
	{
		SceneManager.sceneLoaded += OnSceneLoaded;
	}

	protected override void OnDisableSingleton()
	{
		SceneManager.sceneLoaded -= OnSceneLoaded;
	}

	private void OnSceneLoaded(Scene scene, LoadSceneMode loadSceneMode)
	{
		sceneChangedEventStream.OnNext(new SceneChangedEvent());
	}

	public void LoadScene(EScene scene)
	{
		EScene currentScene = ESceneUtils.GetCurrentScene();
		beforeSceneChangeEventStream.OnNext(new BeforeSceneChangeEvent(scene));
		if (settings.GraphicSettings.AnimateSceneChange)
		{
			sceneChangeAnimationControl.AnimateChangeToScene(DoChangeScene, () =>
			{
				sceneChangeAnimationControl.StartSceneChangeAnimation(currentScene, scene);
			});
		}
		else
		{
			DoChangeScene();
		}
		void DoChangeScene()
		{
			SceneManager.LoadSceneAsync((int)scene, new LoadSceneParameters(LoadSceneMode.Single, LocalPhysicsMode.None));
		}
	}

	private void AddSceneData(SceneData sceneData)
	{
		staticSceneDatas[sceneData.GetType()] = sceneData;
	}

	public void LoadScene(EScene scene, SceneData sceneData)
	{
		if (sceneData == null)
		{
			throw new Exception("SceneData cannot be null. Use LoadScene(EScene) if no SceneData is required.");
		}
		AddSceneData(sceneData);
		LoadScene(scene);
	}

	public static T GetSceneDataOrThrow<T>() where T : SceneData
	{
		if (GetSceneData<T>(null) == null)
		{
			throw new SceneDataException("No SceneData found for type " + typeof(T));
		}
		return GetSceneData<T>(null);
	}

	public static T GetSceneData<T>(T defaultValue) where T : SceneData
	{
		if (staticSceneDatas.TryGetValue(typeof(T), out var value))
		{
			if (value is T)
			{
				return value as T;
			}
			UnityEngine.Debug.LogError("Statically stored scene data has wrong type");
			return defaultValue;
		}
		if (Application.isEditor)
		{
			value = GetDefaultSceneDataFromProvider<T>();
			if (value != null)
			{
				return value as T;
			}
		}
		return defaultValue;
	}

	private static T GetDefaultSceneDataFromProvider<T>() where T : SceneData
	{
		IDefaultSceneDataProvider defaultSceneDataProvider = GameObjectUtils.FindObjectOfType<IDefaultSceneDataProvider>(includeInactive: false);
		if (defaultSceneDataProvider != null)
		{
			return defaultSceneDataProvider.GetDefaultSceneData() as T;
		}
		return null;
	}
}
