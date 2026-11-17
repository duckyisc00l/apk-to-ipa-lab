using System.IO;
using Serilog.Core;
using Serilog.Events;
using Serilog.Formatting;
using Serilog.Formatting.Display;
using UnityEngine;

public sealed class UnityLogEventSink : ILogEventSink
{
	private static readonly string defaultOutputTemplate = "[{Level:u3}] {Message:lj}{NewLine}{StackTrace}";

	public static readonly string unityLogEventSinkMarker = "\n(UnityLogEventSink)";

	public static readonly string skipUnityLogEventSinkPropertyName = "skipUnityLogEventSink";

	private readonly ITextFormatter formatter;

	public UnityLogEventSink()
		: this(new MessageTemplateTextFormatter(defaultOutputTemplate))
	{
	}

	public UnityLogEventSink(ITextFormatter formatter)
	{
		this.formatter = formatter;
	}

	public void Emit(LogEvent logEvent)
	{
		if (logEvent.Properties.ContainsKey(skipUnityLogEventSinkPropertyName))
		{
			return;
		}
		using StringWriter stringWriter = new StringWriter();
		formatter.Format(logEvent, stringWriter);
		string format = stringWriter.ToString().Trim().Replace("{", "{{")
			.Replace("}", "}}") + unityLogEventSinkMarker;
		LogType unityLogType = GetUnityLogType(logEvent);
		Object unityEngineContextObject = GetUnityEngineContextObject(logEvent);
		Debug.LogFormat(unityLogType, LogOption.NoStacktrace, unityEngineContextObject, format);
	}

	private Object GetUnityEngineContextObject(LogEvent logEvent)
	{
		if (logEvent.Properties.TryGetValue(UnityObjectEnricher.unityObjectPropertyName, out var value) && value is ScalarValue scalarValue)
		{
			return scalarValue.Value as Object;
		}
		return null;
	}

	private static LogType GetUnityLogType(LogEvent logEvent)
	{
		switch (logEvent.Level)
		{
		case LogEventLevel.Verbose:
		case LogEventLevel.Debug:
		case LogEventLevel.Information:
			return LogType.Log;
		case LogEventLevel.Warning:
			return LogType.Warning;
		case LogEventLevel.Error:
		case LogEventLevel.Fatal:
			if (logEvent.Exception == null)
			{
				return LogType.Error;
			}
			return LogType.Exception;
		default:
			Debug.LogError("Unkown LogLevel" + logEvent.Level);
			return LogType.Log;
		}
	}
}
