using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace ProTrans
{
	[ExecuteInEditMode]
	public class TranslationManager : MonoBehaviour
	{
		private static TranslationManager instance;

		protected static Dictionary<string, string> currentLanguageMessages = new Dictionary<string, string>();

		protected static Dictionary<string, string> fallbackMessages = new Dictionary<string, string>();

		protected static List<SystemLanguage> translatedLanguages = new List<SystemLanguage>();

		protected static HashSet<string> loggedMissingTranslations = new HashSet<string>();

		public string propertiesFolderRelativeToResourcesFolder = "Translations";

		public string propertiesFileName = "messages";

		public bool logInfoInEditMode;

		public bool logInfoInPlayMode = true;

		public string generatedConstantsFolder = "Assets/GeneratedScripts";

		public bool generateConstantsOnResourceChange;

		public bool useFallbackIfNotInCurrentLanguage = true;

		public SystemLanguage currentLanguage = SystemLanguage.English;

		public SystemLanguage defaultPropertiesFileLanguage = SystemLanguage.English;

		public static TranslationManager Instance
		{
			get
			{
				if (instance == null)
				{
					instance = FindComponentWithTag<TranslationManager>("TranslationManager");
					if (instance != null)
					{
						instance.InitSingleInstance();
					}
				}
				return instance;
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
			instance = null;
			currentLanguageMessages?.Clear();
			fallbackMessages?.Clear();
			translatedLanguages?.Clear();
			loggedMissingTranslations?.Clear();
		}

		protected virtual void Awake()
		{
			InitSingleInstance();
			if (!(instance != this) && fallbackMessages.IsNullOrEmpty())
			{
				ReloadTranslationsAndUpdateScene();
			}
		}

		public virtual List<string> GetKeys()
		{
			TextAsset textAsset = Resources.Load<TextAsset>(GetPropertiesFilePathInResources(propertiesFileName));
			if (textAsset == null)
			{
				return new List<string>();
			}
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			LoadPropertiesFromText(textAsset.text, dictionary);
			return dictionary.Keys.ToList();
		}

		public virtual List<SystemLanguage> GetTranslatedLanguages()
		{
			if (translatedLanguages.IsNullOrEmpty())
			{
				foreach (SystemLanguage enumValuesAs in GetEnumValuesAsList<SystemLanguage>())
				{
					string countryCodeSuffixForPropertiesFile = GetCountryCodeSuffixForPropertiesFile(enumValuesAs);
					if (Resources.Load<TextAsset>(GetPropertiesFilePathInResources(propertiesFileName + countryCodeSuffixForPropertiesFile)) != null)
					{
						translatedLanguages.Add(enumValuesAs);
					}
				}
			}
			return translatedLanguages;
		}

		public static string GetTranslation(string key, params object[] placeholderStrings)
		{
			if (placeholderStrings == null || placeholderStrings.Length == 0)
			{
				TryGetTranslation(key, out var translation);
				return translation;
			}
			if (placeholderStrings.Length % 2 != 0)
			{
				Debug.LogWarning("Uneven number of placeholders for '" + key + "'. Format in array should be [key1, value1, key2, value2, ...]");
			}
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			for (int i = 0; i < placeholderStrings.Length && i + 1 < placeholderStrings.Length; i += 2)
			{
				string key2 = placeholderStrings[i].ToString();
				string value = placeholderStrings[i + 1].ToString();
				dictionary[key2] = value;
			}
			return GetTranslation(key, dictionary);
		}

		public static string GetTranslation(string key, Dictionary<string, string> placeholders)
		{
			if (!TryGetActiveInstance(out var translationManager))
			{
				return key;
			}
			if (!TryGetTranslation(key, out var translation) || placeholders == null)
			{
				return translation;
			}
			foreach (KeyValuePair<string, string> placeholder in placeholders)
			{
				string text = "{" + placeholder.Key + "}";
				if (translation.Contains(text))
				{
					translation = translation.Replace(text, placeholder.Value);
					continue;
				}
				SystemLanguage systemLanguage = ((translationManager.currentLanguage != translationManager.defaultPropertiesFileLanguage) ? translationManager.currentLanguage : translationManager.defaultPropertiesFileLanguage);
				translationManager.LogMissingPlaceholder(systemLanguage, key, placeholder.Key);
			}
			return translation;
		}

		private static bool TryGetTranslation(string key, out string translation)
		{
			if (!TryGetActiveInstance(out var translationManager))
			{
				translation = key;
				return false;
			}
			if (translationManager.currentLanguage != translationManager.defaultPropertiesFileLanguage)
			{
				if (currentLanguageMessages.IsNullOrEmpty() && !translationManager.TryReloadCurrentLanguageTranslations())
				{
					translation = key;
					return false;
				}
				if (currentLanguageMessages.TryGetValue(key, out var value))
				{
					translation = value;
					return true;
				}
				translationManager.LogMissingTranslation(translationManager.currentLanguage, key);
			}
			if (fallbackMessages.IsNullOrEmpty())
			{
				translationManager.ReloadTranslationsAndUpdateScene();
				if (!translationManager.gameObject.activeSelf)
				{
					translation = key;
					return false;
				}
			}
			if (fallbackMessages.TryGetValue(key, out var value2))
			{
				if (translationManager.useFallbackIfNotInCurrentLanguage)
				{
					translation = value2;
					return true;
				}
				translation = key;
				return false;
			}
			translationManager.LogMissingTranslation(translationManager.defaultPropertiesFileLanguage, key);
			translation = key;
			return false;
		}

		public void ReloadTranslationsAndUpdateScene()
		{
			ReloadTranslations();
			UpdateTranslatorsInScene();
		}

		private void ReloadTranslations()
		{
			if (TryReloadFallbackLanguageTranslations() && currentLanguage != defaultPropertiesFileLanguage)
			{
				TryReloadCurrentLanguageTranslations();
			}
		}

		protected virtual bool TryReloadFallbackLanguageTranslations()
		{
			fallbackMessages = new Dictionary<string, string>();
			translatedLanguages = new List<SystemLanguage>();
			string propertiesFilePathInResources = GetPropertiesFilePathInResources(propertiesFileName);
			TextAsset textAsset = Resources.Load<TextAsset>(propertiesFilePathInResources);
			if (textAsset != null)
			{
				LoadPropertiesFromText(textAsset.text, fallbackMessages);
				if (fallbackMessages.Count == 0)
				{
					Debug.LogError("No fallback translations found. Deactivating TranslationManager", base.gameObject);
					base.gameObject.SetActive(value: false);
					return false;
				}
				if (!base.gameObject.activeSelf)
				{
					Debug.Log("Found fallback translations. Activating TranslationManager", base.gameObject);
					base.gameObject.SetActive(value: true);
				}
				if (LogInfoNow)
				{
					Debug.Log("Loaded " + fallbackMessages.Count + " translations from " + propertiesFilePathInResources);
				}
				return true;
			}
			Debug.LogError("Properties file for fallback language not found in any Resources folder: " + propertiesFilePathInResources + ". Deactivating TranslationManager.", base.gameObject);
			base.gameObject.SetActive(value: false);
			return false;
		}

		protected virtual bool TryReloadCurrentLanguageTranslations()
		{
			currentLanguageMessages = new Dictionary<string, string>();
			translatedLanguages = new List<SystemLanguage>();
			string propertiesFileNameWithCountryCode = propertiesFileName + GetCountryCodeSuffixForPropertiesFile(currentLanguage);
			string propertiesFilePathInResources = GetPropertiesFilePathInResources(propertiesFileNameWithCountryCode);
			TextAsset textAsset = Resources.Load<TextAsset>(propertiesFilePathInResources);
			if (textAsset != null)
			{
				LoadPropertiesFromText(textAsset.text, currentLanguageMessages);
				if (LogInfoNow)
				{
					Debug.Log("Loaded " + currentLanguageMessages.Count + " translations from " + propertiesFilePathInResources);
				}
				return true;
			}
			Debug.LogWarning($"Properties file for language {currentLanguage} not found in any Resources folder: {propertiesFilePathInResources}", base.gameObject);
			return false;
		}

		public void ClearFallbackLanguageTranslations()
		{
			fallbackMessages.Clear();
			translatedLanguages.Clear();
		}

		public void ClearCurrentLanguageTranslations()
		{
			currentLanguageMessages.Clear();
			translatedLanguages.Clear();
		}

		public virtual void UpdateTranslatorsInScene()
		{
			LinkedList<ITranslator> linkedList = new LinkedList<ITranslator>();
			Scene activeScene = SceneManager.GetActiveScene();
			if (activeScene.isLoaded)
			{
				GameObject[] rootGameObjects = activeScene.GetRootGameObjects();
				foreach (GameObject localGameObject in rootGameObjects)
				{
					UpdateTranslatorsRecursively(localGameObject, linkedList);
				}
				if (LogInfoNow)
				{
					Debug.Log($"Updated ITranslator instances in scene: {linkedList.Count}");
				}
			}
		}

		private void UpdateTranslatorsRecursively(GameObject localGameObject, LinkedList<ITranslator> translators)
		{
			MonoBehaviour[] components = localGameObject.GetComponents<MonoBehaviour>();
			foreach (MonoBehaviour monoBehaviour in components)
			{
				if (!(monoBehaviour == null) && monoBehaviour is ITranslator translator)
				{
					translators.AddLast(translator);
					translator.UpdateTranslation();
				}
			}
			foreach (Transform item in localGameObject.transform)
			{
				UpdateTranslatorsRecursively(item.gameObject, translators);
			}
		}

		private static void LoadPropertiesFromText(string text, Dictionary<string, string> targetDictionary)
		{
			targetDictionary.Clear();
			foreach (KeyValuePair<string, string> item in PropertiesFileParser.ParseText(text))
			{
				targetDictionary.Add(item.Key, item.Value);
			}
		}

		private string GetCountryCodeSuffixForPropertiesFile(SystemLanguage language)
		{
			if (language != defaultPropertiesFileLanguage)
			{
				string text = LanguageHelper.Get2LetterIsoCodeFromSystemLanguage(language);
				if (text == null)
				{
					return propertiesFileName;
				}
				return "_" + text.ToLower();
			}
			return "";
		}

		protected virtual string GetPropertiesFilePathInResources(string propertiesFileNameWithCountryCode)
		{
			if (propertiesFolderRelativeToResourcesFolder.IsNullOrEmpty())
			{
				return propertiesFileNameWithCountryCode;
			}
			return propertiesFolderRelativeToResourcesFolder + "/" + propertiesFileNameWithCountryCode;
		}

		private static T FindComponentWithTag<T>(string tag)
		{
			GameObject gameObject = GameObject.FindGameObjectWithTag(tag);
			if (!gameObject)
			{
				return default;
			}
			T component = gameObject.GetComponent<T>();
			if (component == null)
			{
				Debug.LogError($"Did not find Component '{typeof(T)}' in GameObject with tag '{tag}'.", gameObject);
			}
			return component;
		}

		private static List<TEnum> GetEnumValuesAsList<TEnum>() where TEnum : Enum
		{
			return ((TEnum[])Enum.GetValues(typeof(TEnum))).ToList();
		}

		private void InitSingleInstance()
		{
			if (Application.isPlaying)
			{
				if (instance != null && instance != this)
				{
					UnityEngine.Object.Destroy(base.gameObject);
					return;
				}
				instance = this;
				base.transform.SetParent(null);
				UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
			}
		}

		private static bool TryGetActiveInstance(out TranslationManager translationManager)
		{
			translationManager = Instance;
			if (translationManager != null)
			{
				return translationManager.gameObject.activeSelf;
			}
			return false;
		}

		private void LogMissingTranslation(SystemLanguage systemLanguage, string key)
		{
			string item = systemLanguage.ToString() + ":" + key;
			if (!Application.isPlaying || !loggedMissingTranslations.Contains(item))
			{
				loggedMissingTranslations.Add(item);
				Debug.LogWarning($"Missing translation in language '{systemLanguage}' for key '{key}'");
			}
		}

		private void LogMissingPlaceholder(SystemLanguage systemLanguage, string key, string placeholderKey)
		{
			string item = systemLanguage.ToString() + ":" + key + ":" + placeholderKey;
			if (!Application.isPlaying || !loggedMissingTranslations.Contains(item))
			{
				loggedMissingTranslations.Add(item);
				Debug.LogWarning($"Translation for '{key}' in language '{systemLanguage}' is missing placeholder '{placeholderKey}'.");
			}
		}

		protected virtual void OnApplicationQuit()
		{
			ClearCurrentLanguageTranslations();
			ClearFallbackLanguageTranslations();
		}
	}
}
