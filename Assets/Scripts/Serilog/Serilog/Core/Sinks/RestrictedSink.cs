using System;
using Serilog.Events;

namespace Serilog.Core.Sinks
{
	internal class RestrictedSink : ILogEventSink, IDisposable
	{
		private readonly ILogEventSink _sink;

		private readonly LoggingLevelSwitch _levelSwitch;

		public RestrictedSink(ILogEventSink sink, LoggingLevelSwitch levelSwitch)
		{
			_sink = sink ?? throw new ArgumentNullException("sink");
			_levelSwitch = levelSwitch ?? throw new ArgumentNullException("levelSwitch");
		}

		public void Emit(LogEvent logEvent)
		{
			if (logEvent == null)
			{
				throw new ArgumentNullException("logEvent");
			}
			if (logEvent.Level >= _levelSwitch.MinimumLevel)
			{
				_sink.Emit(logEvent);
			}
		}

		public void Dispose()
		{
			(_sink as IDisposable)?.Dispose();
		}
	}
}
