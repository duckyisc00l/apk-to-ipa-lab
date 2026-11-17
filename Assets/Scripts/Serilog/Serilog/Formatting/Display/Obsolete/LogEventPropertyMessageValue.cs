using System;
using System.Collections.Generic;
using System.IO;
using Serilog.Events;

namespace Serilog.Formatting.Display.Obsolete
{
	[Obsolete("Not used by the current output formatting implementation.")]
	internal class LogEventPropertyMessageValue : LogEventPropertyValue
	{
		private readonly MessageTemplate _template;

		private readonly IReadOnlyDictionary<string, LogEventPropertyValue> _properties;

		public LogEventPropertyMessageValue(MessageTemplate template, IReadOnlyDictionary<string, LogEventPropertyValue> properties)
		{
			_template = template;
			_properties = properties;
		}

		public override void Render(TextWriter output, string format = null, IFormatProvider formatProvider = null)
		{
			_template.Render(_properties, output, formatProvider);
		}
	}
}
