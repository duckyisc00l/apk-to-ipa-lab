using System.Collections.Generic;
using Microsoft.Maui.Controls;
using NLog;
using NLog.Config;
using NLog.Targets;

namespace MiScaleExporter.Services;

public class LogService : ILogService
{
	private static string TARGET_NAME = "logmemory";

	private static string ERRORS_TARGET_NAME = "logmemory_errors";

	private static bool _isCreated = false;

	private static LoggingConfiguration _configuration;

	public void LogDebug(string message)
	{
	}

	public void LogError(string message)
	{
		Application.Current.MainPage.DisplayAlert("Error", message, "OK");
	}

	public void LogFatal(string message)
	{
		Application.Current.MainPage.DisplayAlert("Fatal", message, "OK");
	}

	public void LogInfo(string message)
	{
		Application.Current.MainPage.DisplayAlert("Info", message, "OK");
	}

	public void LogWarning(string message)
	{
		Application.Current.MainPage.DisplayAlert("Warning", message, "OK");
	}

	public static LoggingConfiguration CreateLogger()
	{
		if (!_isCreated)
		{
			_isCreated = true;
			LoggingConfiguration loggingConfiguration = new LoggingConfiguration();
			MemoryTarget target = new MemoryTarget(TARGET_NAME)
			{
				Layout = "${message}"
			};
			loggingConfiguration.AddTarget(target);
			LoggingRule loggingRule = new LoggingRule("*", LogLevel.Trace, target);
			loggingConfiguration.LoggingRules.Add(loggingRule);
			MemoryTarget target2 = new MemoryTarget(ERRORS_TARGET_NAME)
			{
				Layout = "${message}"
			};
			loggingConfiguration.AddTarget(target2);
			LoggingRule loggingRule2 = new LoggingRule("*", LogLevel.Error, target2);
			loggingConfiguration.LoggingRules.Add(loggingRule2);
			LogManager.Configuration = loggingConfiguration;
			_configuration = loggingConfiguration;
		}
		return _configuration;
	}

	public static IList<string> GetLogs()
	{
		if (!_isCreated)
		{
			return new List<string>();
		}
		return LogManager.Configuration.FindTargetByName<MemoryTarget>(TARGET_NAME).Logs;
	}

	public static IList<string> GetErrorLogs()
	{
		if (!_isCreated)
		{
			return new List<string>();
		}
		return LogManager.Configuration.FindTargetByName<MemoryTarget>(ERRORS_TARGET_NAME).Logs;
	}
}
