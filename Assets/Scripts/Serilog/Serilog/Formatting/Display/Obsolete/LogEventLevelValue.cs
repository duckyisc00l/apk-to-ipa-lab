using System;
using System.IO;
using Serilog.Events;

namespace Serilog.Formatting.Display.Obsolete
{
	[Obsolete("Not used by the current output formatting implementation.")]
	internal class LogEventLevelValue : LogEventPropertyValue
	{
		private readonly LogEventLevel _value;

		public LogEventLevelValue(LogEventLevel value)
		{
			_value = value;
		}

		public override void Render(TextWriter output, string format = null, IFormatProvider formatProvider = null)
		{
			output.Write(LevelOutputFormat.GetLevelMoniker(_value, format));
		}
	}
}
