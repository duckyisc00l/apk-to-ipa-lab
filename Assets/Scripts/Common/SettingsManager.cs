using System;
using System.IO;
using System.Linq;
using UnityEngine;

public class SettingsManager : AbstractSingletonBehaviour
{
	private static string settingsPath;

	private static Settings settings;

	private static bool initializedResolution;

	public static SettingsManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<SettingsManager>();

	public Settings Settings
	{
		get
		{
			if (settings == null)
			{
				Reload();
			}
			return settings;
		}
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		settingsPath = null;
		settings = null;
		initializedResolution = false;
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		if (!initializedResolution)
		{
			initializedResolution = true;
			Settings.GraphicSettings.resolution = ApplicationUtils.GetScreenResolution();
		}
	}

	protected override void OnDisableSingleton()
	{
		Save();
	}

	public void Save()
	{
		string contents = JsonConverter.ToJson(Settings, prettyPrint: true);
		File.WriteAllText(GetSettingsPath(), contents);
	}

	private void Reload()
	{
		using (new DisposableStopwatch("Loading the settings took <millis> ms"))
		{
			string text = GetSettingsPath();
			if (!File.Exists(text))
			{
				Debug.LogWarning("Settings file not found. Creating default settings at " + text + ".");
				settings = CreateDefaultSettings();
				Save();
			}
			else
			{
				settings = JsonConverter.FromJson<Settings>(File.ReadAllText(text));
				OverwriteSettingsWithCommandLineArguments();
			}
		}
	}

	private Settings CreateDefaultSettings()
	{
		Settings settings = new Settings();
		if (!Application.isEditor)
		{
			try
			{
				string text = AndroidUtils.GetAppSpecificStorageAbsolutePath(sdCard: false) + "/Songs";
				if (!Directory.Exists(text))
				{
					Directory.CreateDirectory(text);
				}
				settings.GameSettings.songDirs.Add(text);
			}
			catch (Exception message)
			{
				Debug.LogError("Failed to create initial song folder.");
				Debug.LogError(message);
			}
		}
		try
		{
			MicProfile micProfile = CreateDefaultMicProfile();
			if (micProfile != null)
			{
				SettingsManager.settings.MicProfiles.Add(micProfile);
			}
		}
		catch (Exception message2)
		{
			Debug.LogError("Failed to create initial recording device profile.");
			Debug.LogError(message2);
		}
		return settings;
	}

	private MicProfile CreateDefaultMicProfile()
	{
		if (Microphone.devices.Length == 0)
		{
			return null;
		}
		return new MicProfile(Microphone.devices.FirstOrDefault())
		{
			IsEnabled = true
		};
	}

	private void OverwriteSettingsWithCommandLineArguments()
	{
		string commandLineArgument = ApplicationManager.Instance.GetCommandLineArgument("--settingsOverwriteJson");
		if (!commandLineArgument.IsNullOrEmpty())
		{
			commandLineArgument = commandLineArgument.Strip("\"", "\"");
			commandLineArgument = commandLineArgument.Strip("'", "'");
			try
			{
				JsonConverter.FillFromJson(commandLineArgument, settings);
			}
			catch (Exception exception)
			{
				Debug.LogError("OverwriteSettingsWithCommandLineArguments failed");
				Debug.LogException(exception);
			}
		}
	}

	public string GetSettingsPath()
	{
		if (settingsPath.IsNullOrEmpty())
		{
			string commandLineArgument = ApplicationManager.Instance.GetCommandLineArgument("--settingsPath");
			commandLineArgument = commandLineArgument.Strip("\"", "\"");
			commandLineArgument = commandLineArgument.Strip("'", "'");
			if (!commandLineArgument.IsNullOrEmpty())
			{
				settingsPath = commandLineArgument;
			}
			else
			{
				settingsPath = Path.Combine(Application.persistentDataPath, "Settings.json");
			}
		}
		return settingsPath;
	}
}
