using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using UnityEngine;
using UnityEngine.InputSystem;

namespace PrimeInputActions
{
	public class InputManager : MonoBehaviour
	{
		protected static InputManager instance;

		private static readonly Dictionary<string, ObservableCancelablePriorityInputAction> pathToInputAction = new Dictionary<string, ObservableCancelablePriorityInputAction>();

		private static InputActionAsset inputActionAsset;

		public InputActionAsset defaultInputActionAsset;

		public bool copyInputActionAssetToPersistentDataPath;

		public string relativeInputActionAssetInPersistentDataPath = "InputActions.inputactions";

		public bool generateConstantsOnResourceChange;

		public string generatedConstantsFolder = "Assets/GeneratedScripts";

		public bool useDontDestroyOnLoad;

		public bool logInfoInEditMode;

		public bool logInfoInPlayMode = true;

		public static InputManager Instance
		{
			get
			{
				if (instance == null)
				{
					instance = FindComponentWithTag<InputManager>("InputManager");
					if (instance != null)
					{
						instance.InitSingleInstance();
					}
				}
				return instance;
			}
		}

		private InputActionAsset InputActionAsset
		{
			get
			{
				if (inputActionAsset == null)
				{
					if (copyInputActionAssetToPersistentDataPath)
					{
						string inputActionAssetFilePath = GetInputActionAssetFilePath();
						if (!File.Exists(inputActionAssetFilePath))
						{
							SaveInputActionAssetToFile(defaultInputActionAsset, inputActionAssetFilePath);
						}
						inputActionAsset = LoadInputActionAssetFromFile(inputActionAssetFilePath);
					}
					else
					{
						inputActionAsset = defaultInputActionAsset;
					}
					inputActionAsset.Enable();
				}
				return inputActionAsset;
			}
		}

		public bool LogInfoNow
		{
			get
			{
				if (!Application.isPlaying || !logInfoInPlayMode)
				{
					if (!Application.isPlaying)
					{
						return logInfoInEditMode;
					}
					return false;
				}
				return true;
			}
		}

		[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
		private static void Init()
		{
			if (Application.isEditor && Application.isPlaying)
			{
				InputManager inputManager = Instance;
				if (inputManager != null && inputManager.copyInputActionAssetToPersistentDataPath)
				{
					inputManager.DeleteInputActionAssetFile();
				}
			}
			inputActionAsset = null;
			pathToInputAction.Clear();
		}

		protected virtual void Awake()
		{
			InitSingleInstance();
			_ = instance != this;
		}

		private void SaveInputActionAssetToFile(InputActionAsset theInputActionAsset, string absoluteFilePath)
		{
			if (LogInfoNow)
			{
				Debug.Log("Saving InputActionAsset to '" + absoluteFilePath + "'");
			}
			try
			{
				Directory.CreateDirectory(Path.Combine(absoluteFilePath, ".."));
				File.WriteAllText(absoluteFilePath, theInputActionAsset.ToJson(), Encoding.UTF8);
			}
			catch (Exception exception)
			{
				Debug.LogError("Error saving default InputActionAsset to '" + absoluteFilePath + "'");
				Debug.LogException(exception);
			}
		}

		private InputActionAsset LoadInputActionAssetFromFile(string absoluteFilePath)
		{
			if (LogInfoNow)
			{
				Debug.Log("Loading InputActionAsset from '" + absoluteFilePath + "'");
			}
			try
			{
				return InputActionAsset.FromJson(File.ReadAllText(absoluteFilePath, Encoding.UTF8));
			}
			catch (Exception exception)
			{
				Debug.LogError("Error loading InputActionAsset from '" + absoluteFilePath + "'. Using default InputActionAsset instead.");
				Debug.LogException(exception);
				return defaultInputActionAsset;
			}
		}

		private void DeleteInputActionAssetFile()
		{
			string inputActionAssetFilePath = GetInputActionAssetFilePath();
			try
			{
				if (File.Exists(inputActionAssetFilePath))
				{
					File.Delete(inputActionAssetFilePath);
				}
			}
			catch (Exception exception)
			{
				Debug.LogError("Error deleting InputActionAsset '" + inputActionAssetFilePath + "'");
				Debug.LogException(exception);
			}
		}

		private string GetInputActionAssetFilePath()
		{
			return Application.persistentDataPath + "/" + relativeInputActionAssetInPersistentDataPath;
		}

		public static ObservableCancelablePriorityInputAction GetInputAction(string path)
		{
			if (pathToInputAction.TryGetValue(path, out var value))
			{
				return value;
			}
			value = new ObservableCancelablePriorityInputAction(Instance.InputActionAsset.FindAction(path, throwIfNotFound: true), Instance.gameObject);
			pathToInputAction[path] = value;
			return value;
		}

		public static List<ObservableCancelablePriorityInputAction> GetInputActionsWithSubscribers()
		{
			return pathToInputAction.Values.Where((ObservableCancelablePriorityInputAction it) => it.HasAnySubscribers()).ToList();
		}

		protected virtual void OnDestroy()
		{
			if (instance == this)
			{
				pathToInputAction.Clear();
			}
		}

		private void InitSingleInstance()
		{
			if (!Application.isPlaying)
			{
				return;
			}
			if (instance != null && instance != this)
			{
				UnityEngine.Object.Destroy(base.gameObject);
				return;
			}
			instance = this;
			if (useDontDestroyOnLoad)
			{
				base.transform.SetParent(null);
				UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
			}
		}

		private static T FindComponentWithTag<T>(string tag)
		{
			GameObject gameObject = GameObject.FindGameObjectWithTag(tag);
			if ((bool)gameObject)
			{
				T component = gameObject.GetComponent<T>();
				if (component == null)
				{
					Debug.LogError($"Did not find Component '{typeof(T)}' in GameObject with tag '{tag}'.", gameObject);
				}
				return component;
			}
			return default;
		}
	}
}
