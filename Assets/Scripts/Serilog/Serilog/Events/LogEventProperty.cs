using System;

namespace Serilog.Events
{
	public class LogEventProperty
	{
		public string Name { get; }

		public LogEventPropertyValue Value { get; }

		public LogEventProperty(string name, LogEventPropertyValue value)
		{
			if (value == null)
			{
				throw new ArgumentNullException("value");
			}
			if (!IsValidName(name))
			{
				throw new ArgumentException("Property name is not valid.");
			}
			Name = name;
			Value = value;
		}

		internal LogEventProperty(EventProperty property)
		{
			if (property.Equals(EventProperty.None))
			{
				throw new ArgumentNullException("property");
			}
			Name = property.Name;
			Value = property.Value;
		}

		public static bool IsValidName(string name)
		{
			return !string.IsNullOrWhiteSpace(name);
		}
	}
}
