using System;

namespace Serilog.Events
{
	internal readonly struct EventProperty
	{
		public static EventProperty None;

		public string Name { get; }

		public LogEventPropertyValue Value { get; }

		public EventProperty(string name, LogEventPropertyValue value)
		{
			EnsureValid(name, value);
			Name = name;
			Value = value;
		}

		public void Deconstruct(out string name, out LogEventPropertyValue value)
		{
			name = Name;
			value = Value;
		}

		private static void EnsureValid(string name, LogEventPropertyValue value)
		{
			if (value == null)
			{
				throw new ArgumentNullException("value");
			}
			if (!LogEventProperty.IsValidName(name))
			{
				throw new ArgumentException("Property name is not valid.");
			}
		}

		public override bool Equals(object obj)
		{
			if (obj is EventProperty other)
			{
				return Equals(other);
			}
			return false;
		}

		public bool Equals(EventProperty other)
		{
			if (string.Equals(Name, other.Name))
			{
				return object.Equals(Value, other.Value);
			}
			return false;
		}

		public override int GetHashCode()
		{
			return (((Name != null) ? Name.GetHashCode() : 0) * 397) ^ ((Value != null) ? Value.GetHashCode() : 0);
		}
	}
}
