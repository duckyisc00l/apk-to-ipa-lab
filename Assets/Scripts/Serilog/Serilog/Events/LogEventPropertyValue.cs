using System;
using System.IO;

namespace Serilog.Events
{
	public abstract class LogEventPropertyValue : IFormattable
	{
		public abstract void Render(TextWriter output, string format = null, IFormatProvider formatProvider = null);

		public override string ToString()
		{
			return ToString(null, null);
		}

		public string ToString(string format, IFormatProvider formatProvider)
		{
			StringWriter stringWriter = new StringWriter();
			Render(stringWriter, format, formatProvider);
			return stringWriter.ToString();
		}
	}
}
