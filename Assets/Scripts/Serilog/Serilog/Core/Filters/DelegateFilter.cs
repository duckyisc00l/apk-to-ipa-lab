using System;
using Serilog.Events;

namespace Serilog.Core.Filters
{
	internal class DelegateFilter : ILogEventFilter
	{
		private readonly Func<LogEvent, bool> _isEnabled;

		public DelegateFilter(Func<LogEvent, bool> isEnabled)
		{
			_isEnabled = isEnabled ?? throw new ArgumentNullException("isEnabled");
		}

		public bool IsEnabled(LogEvent logEvent)
		{
			if (logEvent == null)
			{
				throw new ArgumentNullException("logEvent");
			}
			return _isEnabled(logEvent);
		}
	}
}
