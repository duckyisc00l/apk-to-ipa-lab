using System;
using Serilog.Core;
using Serilog.Core.Filters;
using Serilog.Events;

namespace Serilog.Configuration
{
	public class LoggerFilterConfiguration
	{
		private readonly LoggerConfiguration _loggerConfiguration;

		private readonly Action<ILogEventFilter> _addFilter;

		internal LoggerFilterConfiguration(LoggerConfiguration loggerConfiguration, Action<ILogEventFilter> addFilter)
		{
			_loggerConfiguration = loggerConfiguration ?? throw new ArgumentNullException("loggerConfiguration");
			_addFilter = addFilter ?? throw new ArgumentNullException("addFilter");
		}

		public LoggerConfiguration With(params ILogEventFilter[] filters)
		{
			if (filters == null)
			{
				throw new ArgumentNullException("filters");
			}
			foreach (ILogEventFilter logEventFilter in filters)
			{
				if (logEventFilter == null)
				{
					throw new ArgumentException("Null filter is not allowed.");
				}
				_addFilter(logEventFilter);
			}
			return _loggerConfiguration;
		}

		public LoggerConfiguration With<TFilter>() where TFilter : ILogEventFilter, new()
		{
			return With(new TFilter());
		}

		public LoggerConfiguration ByExcluding(Func<LogEvent, bool> exclusionPredicate)
		{
			return With(new DelegateFilter((LogEvent logEvent) => !exclusionPredicate(logEvent)));
		}

		public LoggerConfiguration ByIncludingOnly(Func<LogEvent, bool> inclusionPredicate)
		{
			return With(new DelegateFilter(inclusionPredicate));
		}
	}
}
