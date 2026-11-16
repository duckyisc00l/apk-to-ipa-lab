using System;
using System.Collections.Generic;
using Serilog.Settings.KeyValuePairs;

namespace Serilog.Configuration
{
	public class LoggerSettingsConfiguration
	{
		private readonly LoggerConfiguration _loggerConfiguration;

		internal LoggerSettingsConfiguration(LoggerConfiguration loggerConfiguration)
		{
			_loggerConfiguration = loggerConfiguration ?? throw new ArgumentNullException("loggerConfiguration");
		}

		public LoggerConfiguration Settings(ILoggerSettings settings)
		{
			if (settings == null)
			{
				throw new ArgumentNullException("settings");
			}
			settings.Configure(_loggerConfiguration);
			return _loggerConfiguration;
		}

		public LoggerConfiguration KeyValuePairs(IEnumerable<KeyValuePair<string, string>> settings)
		{
			if (settings == null)
			{
				throw new ArgumentNullException("settings");
			}
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			foreach (KeyValuePair<string, string> setting in settings)
			{
				dictionary[setting.Key] = setting.Value;
			}
			return KeyValuePairs(dictionary);
		}

		private LoggerConfiguration KeyValuePairs(IReadOnlyDictionary<string, string> settings)
		{
			return Settings(new KeyValuePairSettings(settings));
		}
	}
}
