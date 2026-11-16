using System;
using System.IO;
using Serilog.Events;
using Serilog.Rendering;

namespace Serilog.Formatting.Display.Obsolete
{
	[Obsolete("Not used by the current output formatting implementation.")]
	internal class LiteralStringValue : LogEventPropertyValue
	{
		private readonly string _value;

		public LiteralStringValue(string value)
		{
			_value = value ?? throw new ArgumentNullException("value");
		}

		public override void Render(TextWriter output, string format = null, IFormatProvider formatProvider = null)
		{
			output.Write(Casing.Format(_value, format));
		}

		public override bool Equals(object obj)
		{
			if (obj is LiteralStringValue literalStringValue)
			{
				return object.Equals(_value, literalStringValue._value);
			}
			return false;
		}

		public override int GetHashCode()
		{
			return _value.GetHashCode();
		}
	}
}
