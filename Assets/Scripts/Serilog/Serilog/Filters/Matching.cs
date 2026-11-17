using System;
using Serilog.Events;

namespace Serilog.Filters
{
	public static class Matching
	{
		public static Func<LogEvent, bool> FromSource<TSource>()
		{
			return WithProperty("SourceContext", typeof(TSource).FullName);
		}

		public static Func<LogEvent, bool> FromSource(string source)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			string sourcePrefix = source + ".";
			return WithProperty("SourceContext", (string s) => s != null && (s == source || s.StartsWith(sourcePrefix)));
		}

		public static Func<LogEvent, bool> WithProperty(string propertyName)
		{
			if (propertyName == null)
			{
				throw new ArgumentNullException("propertyName");
			}
			return (LogEvent e) => e.Properties.ContainsKey(propertyName);
		}

		public static Func<LogEvent, bool> WithProperty(string propertyName, object scalarValue)
		{
			if (propertyName == null)
			{
				throw new ArgumentNullException("propertyName");
			}
			ScalarValue scalar = new ScalarValue(scalarValue);
			return (LogEvent e) => e.Properties.TryGetValue(propertyName, out var value) && scalar.Equals(value);
		}

		public static Func<LogEvent, bool> WithProperty<TScalar>(string propertyName, Func<TScalar, bool> predicate)
		{
			if (propertyName == null)
			{
				throw new ArgumentNullException("propertyName");
			}
			if (predicate == null)
			{
				throw new ArgumentNullException("predicate");
			}
			return (LogEvent e) =>
			{
				if (!e.Properties.TryGetValue(propertyName, out var value))
				{
					return false;
				}
				return value is ScalarValue { Value: var value2 } && value2 is TScalar arg && predicate(arg);
			};
		}
	}
}
