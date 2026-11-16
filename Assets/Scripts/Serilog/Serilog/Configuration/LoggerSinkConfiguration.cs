using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using Serilog.Core;
using Serilog.Core.Enrichers;
using Serilog.Core.Sinks;
using Serilog.Debugging;
using Serilog.Events;

namespace Serilog.Configuration
{
	public class LoggerSinkConfiguration
	{
		private readonly LoggerConfiguration _loggerConfiguration;

		private readonly Action<ILogEventSink> _addSink;

		private readonly Action<LoggerConfiguration> _applyInheritedConfiguration;

		internal LoggerSinkConfiguration(LoggerConfiguration loggerConfiguration, Action<ILogEventSink> addSink, Action<LoggerConfiguration> applyInheritedConfiguration)
		{
			_loggerConfiguration = loggerConfiguration ?? throw new ArgumentNullException("loggerConfiguration");
			_addSink = addSink ?? throw new ArgumentNullException("addSink");
			_applyInheritedConfiguration = applyInheritedConfiguration ?? throw new ArgumentNullException("applyInheritedConfiguration");
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		public LoggerConfiguration Sink(ILogEventSink logEventSink, LogEventLevel restrictedToMinimumLevel)
		{
			return Sink(logEventSink, restrictedToMinimumLevel, null);
		}

		public LoggerConfiguration Sink(ILogEventSink logEventSink, LogEventLevel restrictedToMinimumLevel = LogEventLevel.Verbose, LoggingLevelSwitch levelSwitch = null)
		{
			ILogEventSink logEventSink2 = logEventSink;
			if (levelSwitch != null)
			{
				if (restrictedToMinimumLevel != LogEventLevel.Verbose)
				{
					SelfLog.WriteLine("Sink {0} was configured with both a level switch and minimum level '{1}'; the minimum level will be ignored and the switch level used", logEventSink2, restrictedToMinimumLevel);
				}
				logEventSink2 = new RestrictedSink(logEventSink2, levelSwitch);
			}
			else if (restrictedToMinimumLevel > LogEventLevel.Verbose)
			{
				logEventSink2 = new RestrictedSink(logEventSink2, new LoggingLevelSwitch(restrictedToMinimumLevel));
			}
			_addSink(logEventSink2);
			return _loggerConfiguration;
		}

		public LoggerConfiguration Sink<TSink>(LogEventLevel restrictedToMinimumLevel = LogEventLevel.Verbose, LoggingLevelSwitch levelSwitch = null) where TSink : ILogEventSink, new()
		{
			return Sink(new TSink(), restrictedToMinimumLevel, levelSwitch);
		}

		public LoggerConfiguration Logger(Action<LoggerConfiguration> configureLogger, LogEventLevel restrictedToMinimumLevel = LogEventLevel.Verbose, LoggingLevelSwitch levelSwitch = null)
		{
			if (configureLogger == null)
			{
				throw new ArgumentNullException("configureLogger");
			}
			LoggerConfiguration loggerConfiguration = new LoggerConfiguration();
			_applyInheritedConfiguration(loggerConfiguration);
			configureLogger(loggerConfiguration);
			Logger logger = loggerConfiguration.CreateLogger();
			if (logger.HasOverrideMap)
			{
				SelfLog.WriteLine("Minimum level overrides are not supported on sub-loggers and may be removed completely in a future version.");
			}
			SecondaryLoggerSink logEventSink = new SecondaryLoggerSink(logger, attemptDispose: true);
			return Sink(logEventSink, restrictedToMinimumLevel, levelSwitch);
		}

		public LoggerConfiguration Logger(ILogger logger, LogEventLevel restrictedToMinimumLevel = LogEventLevel.Verbose)
		{
			if (logger == null)
			{
				throw new ArgumentNullException("logger");
			}
			if (logger is Logger { HasOverrideMap: not false })
			{
				SelfLog.WriteLine("Minimum level overrides are not supported on sub-loggers and may be removed completely in a future version.");
			}
			SecondaryLoggerSink logEventSink = new SecondaryLoggerSink(logger);
			return Sink(logEventSink, restrictedToMinimumLevel);
		}

		public LoggerConfiguration Conditional(Func<LogEvent, bool> condition, Action<LoggerSinkConfiguration> configureSink)
		{
			if (condition == null)
			{
				throw new ArgumentNullException("condition");
			}
			if (configureSink == null)
			{
				throw new ArgumentNullException("configureSink");
			}
			return Wrap(this, (ILogEventSink s) => new ConditionalSink(s, condition), configureSink, LogEventLevel.Verbose, null);
		}

		[Obsolete("Please use `LoggerConfiguration.Wrap(loggerSinkConfiguration, wrapSink, configureWrappedSink, restrictedToMinimumLevel, levelSwitch)` instead.")]
		public static LoggerConfiguration Wrap(LoggerSinkConfiguration loggerSinkConfiguration, Func<ILogEventSink, ILogEventSink> wrapSink, Action<LoggerSinkConfiguration> configureWrappedSink)
		{
			return Wrap(loggerSinkConfiguration, wrapSink, configureWrappedSink, LogEventLevel.Verbose, null);
		}

		public static LoggerConfiguration Wrap(LoggerSinkConfiguration loggerSinkConfiguration, Func<ILogEventSink, ILogEventSink> wrapSink, Action<LoggerSinkConfiguration> configureWrappedSink, LogEventLevel restrictedToMinimumLevel, LoggingLevelSwitch levelSwitch)
		{
			if (loggerSinkConfiguration == null)
			{
				throw new ArgumentNullException("loggerSinkConfiguration");
			}
			if (wrapSink == null)
			{
				throw new ArgumentNullException("wrapSink");
			}
			if (configureWrappedSink == null)
			{
				throw new ArgumentNullException("configureWrappedSink");
			}
			List<ILogEventSink> list = new List<ILogEventSink>();
			LoggerConfiguration loggerConfiguration = new LoggerConfiguration();
			LoggerSinkConfiguration obj = (loggerConfiguration.WriteTo = new LoggerSinkConfiguration(loggerConfiguration, list.Add, loggerSinkConfiguration._applyInheritedConfiguration));
			configureWrappedSink(obj);
			if (list.Count == 0)
			{
				return loggerSinkConfiguration._loggerConfiguration;
			}
			ILogEventSink logEventSink2;
			if (list.Count != 1)
			{
				ILogEventSink logEventSink = new SafeAggregateSink(list);
				logEventSink2 = logEventSink;
			}
			else
			{
				logEventSink2 = list.Single();
			}
			ILogEventSink arg = logEventSink2;
			ILogEventSink logEventSink3 = wrapSink(arg);
			if (!(logEventSink3 is IDisposable))
			{
				SelfLog.WriteLine("Wrapping sink {0} does not implement IDisposable; to ensure wrapped sinks are properly flushed, wrappers should dispose their wrapped contents", logEventSink3);
			}
			return loggerSinkConfiguration.Sink(logEventSink3, restrictedToMinimumLevel, levelSwitch);
		}
	}
}
