using System;
using Serilog.Events;

namespace Serilog.Core.Enrichers
{
	public class PropertyEnricher : ILogEventEnricher
	{
		private readonly string _name;

		private readonly object _value;

		private readonly bool _destructureObjects;

		public PropertyEnricher(string name, object value, bool destructureObjects = false)
		{
			if (string.IsNullOrWhiteSpace(name))
			{
				throw new ArgumentException("Property name must not be null or empty.", "name");
			}
			_name = name;
			_value = value;
			_destructureObjects = destructureObjects;
		}

		public void Enrich(LogEvent logEvent, ILogEventPropertyFactory propertyFactory)
		{
			if (logEvent == null)
			{
				throw new ArgumentNullException("logEvent");
			}
			if (propertyFactory == null)
			{
				throw new ArgumentNullException("propertyFactory");
			}
			LogEventProperty property = propertyFactory.CreateProperty(_name, _value, _destructureObjects);
			logEvent.AddPropertyIfAbsent(property);
		}
	}
}
