using System;
using System.Collections.Generic;
using System.Linq;
using Serilog.Events;
using Serilog.Formatting.Display.Obsolete;

namespace Serilog.Formatting.Display
{
	public static class OutputProperties
	{
		private static readonly LiteralStringValue LiteralNewLine = new LiteralStringValue(Environment.NewLine);

		public const string MessagePropertyName = "Message";

		public const string TimestampPropertyName = "Timestamp";

		public const string LevelPropertyName = "Level";

		public const string NewLinePropertyName = "NewLine";

		public const string ExceptionPropertyName = "Exception";

		public const string PropertiesPropertyName = "Properties";

		[Obsolete("These implementation details of output formatting will not be exposed in a future version.")]
		public static IReadOnlyDictionary<string, LogEventPropertyValue> GetOutputProperties(LogEvent logEvent)
		{
			return GetOutputProperties(logEvent, MessageTemplate.Empty);
		}

		internal static IReadOnlyDictionary<string, LogEventPropertyValue> GetOutputProperties(LogEvent logEvent, MessageTemplate outputTemplate)
		{
			Dictionary<string, LogEventPropertyValue> dictionary = logEvent.Properties.ToDictionary((KeyValuePair<string, LogEventPropertyValue> kvp) => kvp.Key, (KeyValuePair<string, LogEventPropertyValue> kvp) => kvp.Value);
			dictionary["Message"] = new LogEventPropertyMessageValue(logEvent.MessageTemplate, logEvent.Properties);
			dictionary["Timestamp"] = new ScalarValue(logEvent.Timestamp);
			dictionary["Level"] = new LogEventLevelValue(logEvent.Level);
			dictionary["NewLine"] = LiteralNewLine;
			dictionary["Properties"] = new LogEventPropertiesValue(logEvent.MessageTemplate, logEvent.Properties, outputTemplate);
			string value = ((logEvent.Exception == null) ? "" : (logEvent.Exception?.ToString() + Environment.NewLine));
			dictionary["Exception"] = new LiteralStringValue(value);
			return dictionary;
		}
	}
}
