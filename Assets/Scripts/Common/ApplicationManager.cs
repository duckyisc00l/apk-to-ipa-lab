using System;
using System.Collections.Generic;
using System.IO;
using UniInject;
using UnityEngine;

public class ApplicationManager : AbstractSingletonBehaviour, INeedInjection
{
	public List<string> simulatedCommandLineArguments = new List<string>();

	[Range(-1f, 60f)]
	public int targetFrameRate = 30;

	[Inject]
	private Settings settings;

	public static ApplicationManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<ApplicationManager>();

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		targetFrameRate = settings.GraphicSettings.targetFps;
		QualitySettings.vSyncCount = 0;
		Application.targetFrameRate = targetFrameRate;
	}

	private void Update()
	{
		if (Application.targetFrameRate != targetFrameRate)
		{
			Application.targetFrameRate = targetFrameRate;
		}
	}

	protected override void OnEnableSingleton()
	{
		Application.logMessageReceivedThreaded += Log.HandleUnityLog;
	}

	protected override void OnDisableSingleton()
	{
		Application.logMessageReceivedThreaded -= Log.HandleUnityLog;
	}

	public bool HasCommandLineArgument(string argumentName)
	{
		string[] commandLineArguments = GetCommandLineArguments();
		for (int i = 0; i < commandLineArguments.Length; i++)
		{
			if (string.Equals(commandLineArguments[i], argumentName, StringComparison.InvariantCultureIgnoreCase))
			{
				return true;
			}
		}
		return false;
	}

	public string GetCommandLineArgument(string argumentName)
	{
		string[] commandLineArguments = GetCommandLineArguments();
		for (int i = 0; i < commandLineArguments.Length - 1; i++)
		{
			if (string.Equals(commandLineArguments[i], argumentName, StringComparison.InvariantCultureIgnoreCase))
			{
				return commandLineArguments[i + 1];
			}
		}
		return "";
	}

	public string[] GetCommandLineArguments()
	{
		if (Application.isEditor)
		{
			return simulatedCommandLineArguments.ToArray();
		}
		if (PlatformUtils.IsStandalone)
		{
			return Environment.GetCommandLineArgs();
		}
		return Array.Empty<string>();
	}

	public static string PersistentTempPath()
	{
		string text = Path.Combine(Application.persistentDataPath, "Temp");
		if (!Directory.Exists(text))
		{
			Directory.CreateDirectory(text);
		}
		return text;
	}

	public static string PersistentSongsPath()
	{
		string text = Path.Combine(Application.persistentDataPath, "Songs");
		if (!Directory.Exists(text))
		{
			Directory.CreateDirectory(text);
		}
		return text;
	}
}
