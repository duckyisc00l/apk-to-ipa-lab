using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Serilog.Events
{
	public class DictionaryValue : LogEventPropertyValue
	{
		public IReadOnlyDictionary<ScalarValue, LogEventPropertyValue> Elements { get; }

		public DictionaryValue(IEnumerable<KeyValuePair<ScalarValue, LogEventPropertyValue>> elements)
		{
			if (elements == null)
			{
				throw new ArgumentNullException("elements");
			}
			Elements = elements.ToDictionary((KeyValuePair<ScalarValue, LogEventPropertyValue> kvp) => kvp.Key, (KeyValuePair<ScalarValue, LogEventPropertyValue> kvp) => kvp.Value);
		}

		public override void Render(TextWriter output, string format = null, IFormatProvider formatProvider = null)
		{
			if (output == null)
			{
				throw new ArgumentNullException("output");
			}
			output.Write('[');
			string value = "(";
			foreach (KeyValuePair<ScalarValue, LogEventPropertyValue> element in Elements)
			{
				output.Write(value);
				value = ", (";
				element.Key.Render(output, null, formatProvider);
				output.Write(": ");
				element.Value.Render(output, null, formatProvider);
				output.Write(")");
			}
			output.Write(']');
		}
	}
}
