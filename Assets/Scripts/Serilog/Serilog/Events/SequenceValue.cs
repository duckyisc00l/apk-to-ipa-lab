using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Serilog.Events
{
	public class SequenceValue : LogEventPropertyValue
	{
		private readonly LogEventPropertyValue[] _elements;

		public IReadOnlyList<LogEventPropertyValue> Elements => _elements;

		public SequenceValue(IEnumerable<LogEventPropertyValue> elements)
		{
			if (elements == null)
			{
				throw new ArgumentNullException("elements");
			}
			_elements = elements.ToArray();
		}

		public override void Render(TextWriter output, string format = null, IFormatProvider formatProvider = null)
		{
			if (output == null)
			{
				throw new ArgumentNullException("output");
			}
			output.Write('[');
			int num = _elements.Length - 1;
			for (int i = 0; i < num; i++)
			{
				_elements[i].Render(output, format, formatProvider);
				output.Write(", ");
			}
			if (_elements.Length != 0)
			{
				_elements[_elements.Length - 1].Render(output, format, formatProvider);
			}
			output.Write(']');
		}
	}
}
