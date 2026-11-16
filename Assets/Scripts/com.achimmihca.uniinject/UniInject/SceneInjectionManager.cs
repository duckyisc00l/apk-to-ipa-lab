using System;
using System.Collections.Generic;
using System.Diagnostics;
using UniInject.Extensions;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace UniInject
{
	public class SceneInjectionManager : MonoBehaviour
	{
		[Tooltip("Only inject scripts with marker interface INeedInjection")]
		public bool onlyInjectScriptsWithMarkerInterface;

		public bool logTime;

		protected readonly List<IBinder> binders = new List<IBinder>();

		protected readonly List<UnityEngine.Object> scriptsThatNeedInjection = new List<UnityEngine.Object>();

		protected readonly List<ISceneInjectionFinishedListener> sceneInjectionFinishedListeners = new List<ISceneInjectionFinishedListener>();

		public ESceneInjectionStatus SceneInjectionStatus { get; protected set; }

		public Injector SceneInjector { get; protected set; }

		protected virtual void Awake()
		{
			if (SceneInjectionStatus == ESceneInjectionStatus.Pending)
			{
				DoSceneInjection();
			}
		}

		public virtual void DoSceneInjection()
		{
			if (SceneInjectionStatus != ESceneInjectionStatus.Pending)
			{
				UnityEngine.Debug.LogWarning("Attempt to redo scene injection.");
				return;
			}
			SceneInjectionStatus = ESceneInjectionStatus.Started;
			Stopwatch stopwatch = CreateAndStartStopwatch();
			SceneInjector = UniInjectUtils.CreateInjector();
			SceneInjector.AddBindingForInstance(SceneInjector);
			AnalyzeScene();
			CreateBindings();
			InjectScriptsThatNeedInjection();
			StopAndLogTime(stopwatch, "SceneInjectionManager - Analyzing, binding and injecting scene took <ms> ms");
			SceneInjectionStatus = ESceneInjectionStatus.Finished;
			foreach (ISceneInjectionFinishedListener sceneInjectionFinishedListener in sceneInjectionFinishedListeners)
			{
				sceneInjectionFinishedListener.OnSceneInjectionFinished();
			}
		}

		protected virtual void AnalyzeScene()
		{
			Stopwatch stopwatch = CreateAndStartStopwatch();
			Scene activeScene = SceneManager.GetActiveScene();
			GameObject[] rootGameObjects = GetRootGameObjects(activeScene);
			foreach (GameObject gameObject in rootGameObjects)
			{
				AnalyzeScriptsRecursively(gameObject);
			}
			StopAndLogTime(stopwatch, "SceneInjectionManager - Analyzing scene " + activeScene.name + " took <ms> ms");
		}

		protected virtual GameObject[] GetRootGameObjects(Scene scene)
		{
			return scene.GetRootGameObjects();
		}

		protected virtual void CreateBindings()
		{
			Stopwatch stopwatch = CreateAndStartStopwatch();
			foreach (IBinder binder in binders)
			{
				foreach (IBinding binding in binder.GetBindings())
				{
					DoAddBinding(binder, binding);
				}
			}
			StopAndLogTime(stopwatch, "SceneInjectionManager - Creating bindings took <ms> ms");
		}

		protected virtual void DoAddBinding(IBinder binder, IBinding binding)
		{
			try
			{
				SceneInjector.AddBinding(binding, RebindingBehavior.Throw);
			}
			catch (RebindingException ex)
			{
				UnityEngine.Debug.LogWarning($"{ex.Message} while processing {binder}");
			}
		}

		protected virtual void InjectScriptsThatNeedInjection()
		{
			Stopwatch stopwatch = CreateAndStartStopwatch();
			foreach (UnityEngine.Object item in scriptsThatNeedInjection)
			{
				try
				{
					DoInject(item);
				}
				catch (InjectionException exception)
				{
					UnityEngine.Debug.LogException(exception, item);
				}
			}
			StopAndLogTime(stopwatch, "SceneInjectionManager - Injecting scripts took <ms> ms");
		}

		protected virtual void DoInject(UnityEngine.Object script)
		{
			SceneInjector.Inject(script);
		}

		protected virtual Stopwatch CreateAndStartStopwatch()
		{
			if (!logTime)
			{
				return null;
			}
			Stopwatch stopwatch = new Stopwatch();
			stopwatch.Start();
			return stopwatch;
		}

		protected virtual void StopAndLogTime(Stopwatch stopwatch, string message)
		{
			if (stopwatch != null)
			{
				stopwatch.Stop();
				UnityEngine.Debug.Log(message.Replace("<ms>", stopwatch.ElapsedMilliseconds.ToString()));
			}
		}

		protected virtual void AnalyzeScriptsRecursively(GameObject gameObject)
		{
			MonoBehaviour[] components = gameObject.GetComponents<MonoBehaviour>();
			foreach (MonoBehaviour monoBehaviour in components)
			{
				if (monoBehaviour == null)
				{
					continue;
				}
				Type type = monoBehaviour.GetType();
				if (string.IsNullOrEmpty(type.Namespace) || !type.Namespace.StartsWith("UnityEngine."))
				{
					if (monoBehaviour is IBinder)
					{
						binders.Add(monoBehaviour as IBinder);
					}
					if (monoBehaviour is ISceneInjectionFinishedListener)
					{
						sceneInjectionFinishedListeners.Add(monoBehaviour as ISceneInjectionFinishedListener);
					}
					if ((!onlyInjectScriptsWithMarkerInterface || monoBehaviour is INeedInjection) && !(monoBehaviour is IExcludeFromSceneInjection) && UniInjectUtils.GetInjectionDatas(monoBehaviour.GetType()).Count > 0)
					{
						scriptsThatNeedInjection.Add(monoBehaviour);
					}
				}
			}
			foreach (Transform item in gameObject.transform)
			{
				AnalyzeScriptsRecursively(item.gameObject);
			}
		}
	}
}
