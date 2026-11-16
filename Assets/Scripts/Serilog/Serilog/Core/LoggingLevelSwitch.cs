using Serilog.Events;

namespace Serilog.Core
{
	public class LoggingLevelSwitch
	{
		private volatile LogEventLevel _minimumLevel;

		public LogEventLevel MinimumLevel
		{
			get
			{
				return _minimumLevel;
			}
			set
			{
				_minimumLevel = value;
			}
		}

		public LoggingLevelSwitch(LogEventLevel initialMinimumLevel = LogEventLevel.Information)
		{
			_minimumLevel = initialMinimumLevel;
		}
	}
}
