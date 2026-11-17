using System.Collections.Generic;
using Serilog.Core;
using Serilog.Events;

public class LogHistorySink : ILogEventSink
{
	private const int MaxLogHistorySize = 10000;

	public List<LogEvent> LogHistory { get; private set; } = new List<LogEvent>();

	public void Emit(LogEvent logEvent)
	{
		if (LogHistory.Count > 10000)
		{
			LogHistory.RemoveAt(0);
		}
		LogHistory.Add(logEvent);
	}
}
