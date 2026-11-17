using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using Serilog.Data;
using Serilog.Events;

namespace Serilog.Formatting.Json
{
	public class JsonValueFormatter : LogEventPropertyValueVisitor<TextWriter, bool>
	{
		private readonly string _typeTagName;

		private const string DefaultTypeTagName = "_typeTag";

		public JsonValueFormatter(string typeTagName = "_typeTag")
		{
			_typeTagName = typeTagName;
		}

		public void Format(LogEventPropertyValue value, TextWriter output)
		{
			Visit(output, value);
		}

		protected override bool VisitScalarValue(TextWriter state, ScalarValue scalar)
		{
			if (scalar == null)
			{
				throw new ArgumentNullException("scalar");
			}
			FormatLiteralValue(scalar.Value, state);
			return false;
		}

		protected override bool VisitSequenceValue(TextWriter state, SequenceValue sequence)
		{
			if (sequence == null)
			{
				throw new ArgumentNullException("sequence");
			}
			state.Write('[');
			string value = "";
			for (int i = 0; i < sequence.Elements.Count; i++)
			{
				state.Write(value);
				value = ",";
				Visit(state, sequence.Elements[i]);
			}
			state.Write(']');
			return false;
		}

		protected override bool VisitStructureValue(TextWriter state, StructureValue structure)
		{
			state.Write('{');
			string value = "";
			for (int i = 0; i < structure.Properties.Count; i++)
			{
				state.Write(value);
				value = ",";
				LogEventProperty logEventProperty = structure.Properties[i];
				WriteQuotedJsonString(logEventProperty.Name, state);
				state.Write(':');
				Visit(state, logEventProperty.Value);
			}
			if (_typeTagName != null && structure.TypeTag != null)
			{
				state.Write(value);
				WriteQuotedJsonString(_typeTagName, state);
				state.Write(':');
				WriteQuotedJsonString(structure.TypeTag, state);
			}
			state.Write('}');
			return false;
		}

		protected override bool VisitDictionaryValue(TextWriter state, DictionaryValue dictionary)
		{
			state.Write('{');
			string value = "";
			foreach (KeyValuePair<ScalarValue, LogEventPropertyValue> element in dictionary.Elements)
			{
				state.Write(value);
				value = ",";
				WriteQuotedJsonString((element.Key.Value ?? "null").ToString(), state);
				state.Write(':');
				Visit(state, element.Value);
			}
			state.Write('}');
			return false;
		}

		protected virtual void FormatLiteralValue(object value, TextWriter output)
		{
			if (value == null)
			{
				FormatNullValue(output);
				return;
			}
			if (value is string str)
			{
				FormatStringValue(str, output);
				return;
			}
			if (value is ValueType)
			{
				if (value is int || value is uint || value is long || value is ulong || value is decimal || value is byte || value is sbyte || value is short || value is ushort)
				{
					FormatExactNumericValue((IFormattable)value, output);
					return;
				}
				if (value is double value2)
				{
					FormatDoubleValue(value2, output);
					return;
				}
				if (value is float value3)
				{
					FormatFloatValue(value3, output);
					return;
				}
				if (value is bool value4)
				{
					FormatBooleanValue(value4, output);
					return;
				}
				if (value is char)
				{
					FormatStringValue(value.ToString(), output);
					return;
				}
				if (value is DateTime || value is DateTimeOffset)
				{
					FormatDateTimeValue((IFormattable)value, output);
					return;
				}
				if (value is TimeSpan value5)
				{
					FormatTimeSpanValue(value5, output);
					return;
				}
			}
			FormatLiteralObjectValue(value, output);
		}

		private static void FormatBooleanValue(bool value, TextWriter output)
		{
			output.Write(value ? "true" : "false");
		}

		private static void FormatFloatValue(float value, TextWriter output)
		{
			if (float.IsNaN(value) || float.IsInfinity(value))
			{
				FormatStringValue(value.ToString(CultureInfo.InvariantCulture), output);
			}
			else
			{
				output.Write(value.ToString("R", CultureInfo.InvariantCulture));
			}
		}

		private static void FormatDoubleValue(double value, TextWriter output)
		{
			if (double.IsNaN(value) || double.IsInfinity(value))
			{
				FormatStringValue(value.ToString(CultureInfo.InvariantCulture), output);
			}
			else
			{
				output.Write(value.ToString("R", CultureInfo.InvariantCulture));
			}
		}

		private static void FormatExactNumericValue(IFormattable value, TextWriter output)
		{
			output.Write(value.ToString(null, CultureInfo.InvariantCulture));
		}

		private static void FormatDateTimeValue(IFormattable value, TextWriter output)
		{
			output.Write('"');
			output.Write(value.ToString("O", CultureInfo.InvariantCulture));
			output.Write('"');
		}

		private static void FormatTimeSpanValue(TimeSpan value, TextWriter output)
		{
			output.Write('"');
			output.Write(value.ToString());
			output.Write('"');
		}

		private static void FormatLiteralObjectValue(object value, TextWriter output)
		{
			if (value == null)
			{
				throw new ArgumentNullException("value");
			}
			FormatStringValue(value.ToString(), output);
		}

		private static void FormatStringValue(string str, TextWriter output)
		{
			WriteQuotedJsonString(str, output);
		}

		private static void FormatNullValue(TextWriter output)
		{
			output.Write("null");
		}

		public static void WriteQuotedJsonString(string str, TextWriter output)
		{
			output.Write('"');
			int num = 0;
			bool flag = false;
			for (int i = 0; i < str.Length; i++)
			{
				char c = str[i];
				if (c < ' ' || c == '\\' || c == '"')
				{
					flag = true;
					output.Write(str.Substring(num, i - num));
					num = i + 1;
					switch (c)
					{
					case '"':
						output.Write("\\\"");
						continue;
					case '\\':
						output.Write("\\\\");
						continue;
					case '\n':
						output.Write("\\n");
						continue;
					case '\r':
						output.Write("\\r");
						continue;
					case '\f':
						output.Write("\\f");
						continue;
					case '\t':
						output.Write("\\t");
						continue;
					}
					output.Write("\\u");
					int num2 = c;
					output.Write(num2.ToString("X4"));
				}
			}
			if (flag)
			{
				if (num != str.Length)
				{
					output.Write(str.Substring(num));
				}
			}
			else
			{
				output.Write(str);
			}
			output.Write('"');
		}
	}
}
