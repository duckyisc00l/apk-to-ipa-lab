using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Serilog;
using Serilog.Core;
using Serilog.Events;
using Serilog.Formatting.Display;
using UnityEngine;

public static class Log
{
	private const int LogTextMaxLengthInChars = 100000;

	public static readonly string outputTemplate = "{Timestamp:yyyy-MM-dd HH:mm:ss.fff} [{Level:u3}] {Message:lj}{NewLine}{StackTrace}";

	public static readonly string logFileFolder = Application.persistentDataPath + "/Logs";

	public static readonly string logFilePath = logFileFolder + "/" + Application.productName + ".log";

	private static LogHistorySink logHistorySink;

	public static Serilog.ILogger Logger { get; private set; }

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		logHistorySink = new LogHistorySink();
		Logger = CreateLogger();
	}

	public static List<LogEvent> GetLogHistory()
	{
		return logHistorySink.LogHistory;
	}

	private static Serilog.ILogger CreateLogger()
	{
		if (!Directory.Exists(logFileFolder))
		{
			Directory.CreateDirectory(logFileFolder);
		}
		int num = 250000000;
		Serilog.Core.Logger logger = new LoggerConfiguration().MinimumLevel.Information().Enrich.FromLogContext().Enrich.With<UnityStackTraceEnricher>().WriteTo.Sink(new UnityLogEventSink()).WriteTo.Sink(logHistorySink).WriteTo.File(logFilePath, LogEventLevel.Verbose, outputTemplate, null, num, null, false, false, null, RollingInterval.Day, false, 5, Encoding.UTF8, null).CreateLogger();
		((Serilog.ILogger)logger).Information("===== Initialized Serilog Logger =====");
		return logger;
	}

	public static void HandleUnityLog(string logString, string stackTrace, LogType type)
	{
		if (!logString.EndsWith(UnityLogEventSink.unityLogEventSinkMarker))
		{
			Serilog.ILogger logger = Logger.ForContext(UnityLogEventSink.skipUnityLogEventSinkPropertyName, true);
			switch (type)
			{
			case LogType.Warning:
				logger.Warning(logString);
				break;
			case LogType.Error:
			case LogType.Assert:
			case LogType.Exception:
				logger.Error(logString + "\n" + stackTrace);
				break;
			default:
				logger.Information(logString);
				break;
			}
		}
	}

	public static string GetLogText(LogEventLevel logEventLevel)
	{
		MessageTemplateTextFormatter textFormatter = new MessageTemplateTextFormatter(outputTemplate);
		List<string> list = (from logEvent in GetLogHistory()
			where logEvent.Level >= logEventLevel
			select logEvent).Select((LogEvent logEvent) =>
		{
			StringWriter stringWriter = new StringWriter();
			textFormatter.Format(logEvent, stringWriter);
			return stringWriter.ToString().Replace("\\", "/");
		}).ToList();
		string text = (list.IsNullOrEmpty() ? "(no log messages)" : list.JoinWith(""));
		if (text.Length > 100000)
		{
			string text2 = "...\n";
			text = text2 + text.Substring(text.Length - (100000 - text2.Length));
		}
		return text;
	}
}
