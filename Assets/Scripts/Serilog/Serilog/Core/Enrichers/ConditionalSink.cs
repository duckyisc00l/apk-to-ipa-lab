using System;
using Serilog.Events;

namespace Serilog.Core.Enrichers
{
	internal class ConditionalSink : ILogEventSink, IDisposable
	{
		private readonly ILogEventSink _wrapped;

		private readonly Func<LogEvent, bool> _condition;

		public ConditionalSink(ILogEventSink wrapped, Func<LogEvent, bool> condition)
		{
			_wrapped = wrapped ?? throw new ArgumentNullException("wrapped");
			_condition = condition ?? throw new ArgumentNullException("condition");
		}

		public void Emit(LogEvent logEvent)
		{
			if (_condition(logEvent))
			{
				_wrapped.Emit(logEvent);
			}
		}

		public void Dispose()
		{
			(_wrapped as IDisposable)?.Dispose();
		}
	}
}
