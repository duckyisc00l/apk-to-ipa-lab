using System;
using Serilog.Events;

namespace Serilog
{
	public static class LoggerExtensions
	{
		public static ILogger ForContext<TValue>(this ILogger logger, LogEventLevel level, string propertyName, TValue value, bool destructureObjects = false)
		{
			if (logger == null)
			{
				throw new ArgumentNullException("logger");
			}
			if (!logger.IsEnabled(level))
			{
				return logger;
			}
			return logger.ForContext(propertyName, value, destructureObjects);
		}
	}
}
