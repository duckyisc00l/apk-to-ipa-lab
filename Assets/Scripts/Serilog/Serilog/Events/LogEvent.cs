using System;
using System.Collections.Generic;
using System.IO;

namespace Serilog.Events
{
	public class LogEvent
	{
		private readonly Dictionary<string, LogEventPropertyValue> _properties;

		public DateTimeOffset Timestamp { get; }

		public LogEventLevel Level { get; }

		public MessageTemplate MessageTemplate { get; }

		public IReadOnlyDictionary<string, LogEventPropertyValue> Properties => _properties;

		public Exception Exception { get; }

		private LogEvent(DateTimeOffset timestamp, LogEventLevel level, Exception exception, MessageTemplate messageTemplate, Dictionary<string, LogEventPropertyValue> properties)
		{
			Timestamp = timestamp;
			Level = level;
			Exception = exception;
			MessageTemplate = messageTemplate ?? throw new ArgumentNullException("messageTemplate");
			_properties = properties ?? throw new ArgumentNullException("properties");
		}

		public LogEvent(DateTimeOffset timestamp, LogEventLevel level, Exception exception, MessageTemplate messageTemplate, IEnumerable<LogEventProperty> properties)
			: this(timestamp, level, exception, messageTemplate, new Dictionary<string, LogEventPropertyValue>())
		{
			if (properties == null)
			{
				throw new ArgumentNullException("properties");
			}
			foreach (LogEventProperty property in properties)
			{
				AddOrUpdateProperty(property);
			}
		}

		internal LogEvent(DateTimeOffset timestamp, LogEventLevel level, Exception exception, MessageTemplate messageTemplate, EventProperty[] properties)
			: this(timestamp, level, exception, messageTemplate, new Dictionary<string, LogEventPropertyValue>((properties ?? throw new ArgumentNullException("properties")).Length))
		{
			for (int i = 0; i < properties.Length; i++)
			{
				_properties[properties[i].Name] = properties[i].Value;
			}
		}

		public void RenderMessage(TextWriter output, IFormatProvider formatProvider = null)
		{
			MessageTemplate.Render(Properties, output, formatProvider);
		}

		public string RenderMessage(IFormatProvider formatProvider = null)
		{
			return MessageTemplate.Render(Properties, formatProvider);
		}

		public void AddOrUpdateProperty(LogEventProperty property)
		{
			if (property == null)
			{
				throw new ArgumentNullException("property");
			}
			_properties[property.Name] = property.Value;
		}

		internal void AddOrUpdateProperty(in EventProperty property)
		{
			if (property.Equals(EventProperty.None))
			{
				throw new ArgumentNullException("property");
			}
			_properties[property.Name] = property.Value;
		}

		public void AddPropertyIfAbsent(LogEventProperty property)
		{
			if (property == null)
			{
				throw new ArgumentNullException("property");
			}
			if (!_properties.ContainsKey(property.Name))
			{
				_properties.Add(property.Name, property.Value);
			}
		}

		internal void AddPropertyIfAbsent(in EventProperty property)
		{
			if (property.Equals(EventProperty.None))
			{
				throw new ArgumentNullException("property");
			}
			if (!_properties.ContainsKey(property.Name))
			{
				_properties.Add(property.Name, property.Value);
			}
		}

		public void RemovePropertyIfPresent(string propertyName)
		{
			_properties.Remove(propertyName);
		}

		internal LogEvent Copy()
		{
			Dictionary<string, LogEventPropertyValue> dictionary = new Dictionary<string, LogEventPropertyValue>(Properties.Count);
			foreach (string key in _properties.Keys)
			{
				dictionary.Add(key, _properties[key]);
			}
			return new LogEvent(Timestamp, Level, Exception, MessageTemplate, dictionary);
		}
	}
}
