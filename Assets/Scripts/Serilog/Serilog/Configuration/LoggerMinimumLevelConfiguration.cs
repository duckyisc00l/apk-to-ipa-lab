using System;
using Serilog.Core;
using Serilog.Events;

namespace Serilog.Configuration
{
	public class LoggerMinimumLevelConfiguration
	{
		private readonly LoggerConfiguration _loggerConfiguration;

		private readonly Action<LogEventLevel> _setMinimum;

		private readonly Action<LoggingLevelSwitch> _setLevelSwitch;

		private readonly Action<string, LoggingLevelSwitch> _addOverride;

		internal LoggerMinimumLevelConfiguration(LoggerConfiguration loggerConfiguration, Action<LogEventLevel> setMinimum, Action<LoggingLevelSwitch> setLevelSwitch, Action<string, LoggingLevelSwitch> addOverride)
		{
			_loggerConfiguration = loggerConfiguration ?? throw new ArgumentNullException("loggerConfiguration");
			_setMinimum = setMinimum ?? throw new ArgumentNullException("setMinimum");
			_setLevelSwitch = setLevelSwitch;
			_addOverride = addOverride ?? throw new ArgumentNullException("addOverride");
		}

		public LoggerConfiguration Is(LogEventLevel minimumLevel)
		{
			_setMinimum(minimumLevel);
			return _loggerConfiguration;
		}

		public LoggerConfiguration ControlledBy(LoggingLevelSwitch levelSwitch)
		{
			if (levelSwitch == null)
			{
				throw new ArgumentNullException("levelSwitch");
			}
			_setLevelSwitch(levelSwitch);
			return _loggerConfiguration;
		}

		public LoggerConfiguration Verbose()
		{
			return Is(LogEventLevel.Verbose);
		}

		public LoggerConfiguration Debug()
		{
			return Is(LogEventLevel.Debug);
		}

		public LoggerConfiguration Information()
		{
			return Is(LogEventLevel.Information);
		}

		public LoggerConfiguration Warning()
		{
			return Is(LogEventLevel.Warning);
		}

		public LoggerConfiguration Error()
		{
			return Is(LogEventLevel.Error);
		}

		public LoggerConfiguration Fatal()
		{
			return Is(LogEventLevel.Fatal);
		}

		public LoggerConfiguration Override(string source, LoggingLevelSwitch levelSwitch)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			if (levelSwitch == null)
			{
				throw new ArgumentNullException("levelSwitch");
			}
			string text = source.Trim();
			if (text.Length == 0)
			{
				throw new ArgumentException("A source name must be provided.", "source");
			}
			_addOverride(text, levelSwitch);
			return _loggerConfiguration;
		}

		public LoggerConfiguration Override(string source, LogEventLevel minimumLevel)
		{
			return Override(source, new LoggingLevelSwitch(minimumLevel));
		}
	}
}
