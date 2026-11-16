using System;
using System.Collections.Generic;
using System.IO;
using Serilog.Events;

namespace Serilog.Formatting.Display.Obsolete
{
	[Obsolete("Not used by the current output formatting implementation.")]
	internal class LogEventPropertiesValue : LogEventPropertyValue
	{
		private readonly MessageTemplate _template;

		private readonly IReadOnlyDictionary<string, LogEventPropertyValue> _properties;

		private readonly MessageTemplate _outputTemplate;

		public LogEventPropertiesValue(MessageTemplate template, IReadOnlyDictionary<string, LogEventPropertyValue> properties, MessageTemplate outputTemplate)
		{
			_template = template;
			_properties = properties;
			_outputTemplate = outputTemplate;
		}

		public override void Render(TextWriter output, string format = null, IFormatProvider formatProvider = null)
		{
			PropertiesOutputFormat.Render(_template, _properties, _outputTemplate, output, format, formatProvider);
		}
	}
}
