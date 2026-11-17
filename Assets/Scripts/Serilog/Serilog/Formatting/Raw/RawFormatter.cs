using System;
using System.Collections.Generic;
using System.IO;
using Serilog.Events;

namespace Serilog.Formatting.Raw
{
	[Obsolete("A JSON-based formatter such as `Serilog.Formatting.Compact.CompactJsonFormatter` is recommended for this task.")]
	public class RawFormatter : ITextFormatter
	{
		public void Format(LogEvent logEvent, TextWriter output)
		{
			output.Write("[" + logEvent.Timestamp.ToString() + "] " + logEvent.Level.ToString() + ": \"");
			output.Write(logEvent.MessageTemplate);
			output.WriteLine("\"");
			if (logEvent.Exception != null)
			{
				output.WriteLine(logEvent.Exception);
			}
			foreach (KeyValuePair<string, LogEventPropertyValue> property in logEvent.Properties)
			{
				output.Write(property.Key + " = ");
				property.Value.Render(output);
				output.WriteLine();
			}
			output.WriteLine();
		}
	}
}
