using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.IO;
using System.Linq;
using Serilog.Events;
using Serilog.Parsing;
using Serilog.Rendering;

namespace Serilog.Formatting.Json
{
	public class JsonFormatter : ITextFormatter
	{
		private const string ExtensionPointObsoletionMessage = "Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.";

		private readonly bool _omitEnclosingObject;

		private readonly string _closingDelimiter;

		private readonly bool _renderMessage;

		private readonly IFormatProvider _formatProvider;

		private readonly IDictionary<Type, Action<object, bool, TextWriter>> _literalWriters;

		public JsonFormatter(string closingDelimiter = null, bool renderMessage = false, IFormatProvider formatProvider = null)
			: this(omitEnclosingObject: false, closingDelimiter, renderMessage, formatProvider)
		{
		}

		[Obsolete("The omitEnclosingObject parameter is obsolete and will be removed in a future Serilog version.")]
		public JsonFormatter(bool omitEnclosingObject, string closingDelimiter = null, bool renderMessage = false, IFormatProvider formatProvider = null)
		{
			_omitEnclosingObject = omitEnclosingObject;
			_closingDelimiter = closingDelimiter ?? Environment.NewLine;
			_renderMessage = renderMessage;
			_formatProvider = formatProvider;
			_literalWriters = new Dictionary<Type, Action<object, bool, TextWriter>>
			{
				{
					typeof(bool),
					(object v, bool q, TextWriter w) =>
					{
						WriteBoolean((bool)v, w);
					}
				},
				{
					typeof(char),
					(object v, bool q, TextWriter w) =>
					{
						WriteString(((char)v).ToString(), w);
					}
				},
				{
					typeof(byte),
					WriteToString
				},
				{
					typeof(sbyte),
					WriteToString
				},
				{
					typeof(short),
					WriteToString
				},
				{
					typeof(ushort),
					WriteToString
				},
				{
					typeof(int),
					WriteToString
				},
				{
					typeof(uint),
					WriteToString
				},
				{
					typeof(long),
					WriteToString
				},
				{
					typeof(ulong),
					WriteToString
				},
				{
					typeof(float),
					(object v, bool q, TextWriter w) =>
					{
						WriteSingle((float)v, w);
					}
				},
				{
					typeof(double),
					(object v, bool q, TextWriter w) =>
					{
						WriteDouble((double)v, w);
					}
				},
				{
					typeof(decimal),
					WriteToString
				},
				{
					typeof(string),
					(object v, bool q, TextWriter w) =>
					{
						WriteString((string)v, w);
					}
				},
				{
					typeof(DateTime),
					(object v, bool q, TextWriter w) =>
					{
						WriteDateTime((DateTime)v, w);
					}
				},
				{
					typeof(DateTimeOffset),
					(object v, bool q, TextWriter w) =>
					{
						WriteOffset((DateTimeOffset)v, w);
					}
				},
				{
					typeof(ScalarValue),
					(object v, bool q, TextWriter w) =>
					{
						WriteLiteral(((ScalarValue)v).Value, w, q);
					}
				},
				{
					typeof(SequenceValue),
					(object v, bool q, TextWriter w) =>
					{
						WriteSequence(((SequenceValue)v).Elements, w);
					}
				},
				{
					typeof(DictionaryValue),
					(object v, bool q, TextWriter w) =>
					{
						WriteDictionary(((DictionaryValue)v).Elements, w);
					}
				},
				{
					typeof(StructureValue),
					(object v, bool q, TextWriter w) =>
					{
						WriteStructure(((StructureValue)v).TypeTag, ((StructureValue)v).Properties, w);
					}
				}
			};
		}

		public void Format(LogEvent logEvent, TextWriter output)
		{
			if (logEvent == null)
			{
				throw new ArgumentNullException("logEvent");
			}
			if (output == null)
			{
				throw new ArgumentNullException("output");
			}
			if (!_omitEnclosingObject)
			{
				output.Write("{");
			}
			string delim = "";
			WriteTimestamp(logEvent.Timestamp, ref delim, output);
			WriteLevel(logEvent.Level, ref delim, output);
			WriteMessageTemplate(logEvent.MessageTemplate.Text, ref delim, output);
			if (_renderMessage)
			{
				string message = logEvent.RenderMessage(_formatProvider);
				WriteRenderedMessage(message, ref delim, output);
			}
			if (logEvent.Exception != null)
			{
				WriteException(logEvent.Exception, ref delim, output);
			}
			if (logEvent.Properties.Count != 0)
			{
				WriteProperties(logEvent.Properties, output);
			}
			IGrouping<string, PropertyToken>[] array = (from pt in logEvent.MessageTemplate.Tokens.OfType<PropertyToken>()
				where pt.Format != null
				group pt by pt.PropertyName).ToArray();
			if (array.Length != 0)
			{
				WriteRenderings(array, logEvent.Properties, output);
			}
			if (!_omitEnclosingObject)
			{
				output.Write("}");
				output.Write(_closingDelimiter);
			}
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected void AddLiteralWriter(Type type, Action<object, TextWriter> writer)
		{
			if (type == null)
			{
				throw new ArgumentNullException("type");
			}
			if (writer == null)
			{
				throw new ArgumentNullException("writer");
			}
			_literalWriters[type] = (object v, bool _, TextWriter w) =>
			{
				writer(v, w);
			};
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteRenderings(IGrouping<string, PropertyToken>[] tokensWithFormat, IReadOnlyDictionary<string, LogEventPropertyValue> properties, TextWriter output)
		{
			output.Write(",\"{0}\":{{", "Renderings");
			WriteRenderingsValues(tokensWithFormat, properties, output);
			output.Write("}");
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteRenderingsValues(IGrouping<string, PropertyToken>[] tokensWithFormat, IReadOnlyDictionary<string, LogEventPropertyValue> properties, TextWriter output)
		{
			string value = "";
			foreach (IGrouping<string, PropertyToken> grouping in tokensWithFormat)
			{
				output.Write(value);
				value = ",";
				output.Write("\"");
				output.Write(grouping.Key);
				output.Write("\":[");
				string value2 = "";
				foreach (PropertyToken item in grouping)
				{
					output.Write(value2);
					value2 = ",";
					output.Write("{");
					string precedingDelimiter = "";
					WriteJsonProperty("Format", item.Format, ref precedingDelimiter, output);
					StringWriter stringWriter = new StringWriter();
					MessageTemplateRenderer.RenderPropertyToken(item, properties, stringWriter, _formatProvider, isLiteral: true, isJson: false);
					WriteJsonProperty("Rendering", stringWriter.ToString(), ref precedingDelimiter, output);
					output.Write("}");
				}
				output.Write("]");
			}
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteProperties(IReadOnlyDictionary<string, LogEventPropertyValue> properties, TextWriter output)
		{
			output.Write(",\"{0}\":{{", "Properties");
			WritePropertiesValues(properties, output);
			output.Write("}");
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WritePropertiesValues(IReadOnlyDictionary<string, LogEventPropertyValue> properties, TextWriter output)
		{
			string precedingDelimiter = "";
			foreach (KeyValuePair<string, LogEventPropertyValue> property in properties)
			{
				WriteJsonProperty(property.Key, property.Value, ref precedingDelimiter, output);
			}
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteException(Exception exception, ref string delim, TextWriter output)
		{
			WriteJsonProperty("Exception", exception, ref delim, output);
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteRenderedMessage(string message, ref string delim, TextWriter output)
		{
			WriteJsonProperty("RenderedMessage", message, ref delim, output);
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteMessageTemplate(string template, ref string delim, TextWriter output)
		{
			WriteJsonProperty("MessageTemplate", template, ref delim, output);
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteLevel(LogEventLevel level, ref string delim, TextWriter output)
		{
			WriteJsonProperty("Level", level, ref delim, output);
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteTimestamp(DateTimeOffset timestamp, ref string delim, TextWriter output)
		{
			WriteJsonProperty("Timestamp", timestamp, ref delim, output);
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteStructure(string typeTag, IEnumerable<LogEventProperty> properties, TextWriter output)
		{
			output.Write("{");
			string precedingDelimiter = "";
			if (typeTag != null)
			{
				WriteJsonProperty("_typeTag", typeTag, ref precedingDelimiter, output);
			}
			foreach (LogEventProperty property in properties)
			{
				WriteJsonProperty(property.Name, property.Value, ref precedingDelimiter, output);
			}
			output.Write("}");
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteSequence(IEnumerable elements, TextWriter output)
		{
			output.Write("[");
			string value = "";
			foreach (object element in elements)
			{
				output.Write(value);
				value = ",";
				WriteLiteral(element, output);
			}
			output.Write("]");
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteDictionary(IReadOnlyDictionary<ScalarValue, LogEventPropertyValue> elements, TextWriter output)
		{
			output.Write("{");
			string value = "";
			foreach (KeyValuePair<ScalarValue, LogEventPropertyValue> element in elements)
			{
				output.Write(value);
				value = ",";
				WriteLiteral(element.Key, output, forceQuotation: true);
				output.Write(":");
				WriteLiteral(element.Value, output);
			}
			output.Write("}");
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteJsonProperty(string name, object value, ref string precedingDelimiter, TextWriter output)
		{
			output.Write(precedingDelimiter);
			output.Write("\"");
			output.Write(name);
			output.Write("\":");
			WriteLiteral(value, output);
			precedingDelimiter = ",";
		}

		[Obsolete("Extension of JsonFormatter by subclassing is obsolete and will be removed in a future Serilog version. Write a custom formatter based on JsonValueFormatter instead. See https://github.com/serilog/serilog/pull/819.")]
		protected virtual void WriteLiteralValue(object value, TextWriter output)
		{
			WriteString(value.ToString(), output);
		}

		private void WriteLiteral(object value, TextWriter output, bool forceQuotation = false)
		{
			Action<object, bool, TextWriter> value2;
			if (value == null)
			{
				output.Write("null");
			}
			else if (_literalWriters.TryGetValue(value.GetType(), out value2))
			{
				value2(value, forceQuotation, output);
			}
			else
			{
				WriteLiteralValue(value, output);
			}
		}

		private static void WriteToString(object number, bool quote, TextWriter output)
		{
			if (quote)
			{
				output.Write('"');
			}
			if (number is IFormattable formattable)
			{
				output.Write(formattable.ToString(null, CultureInfo.InvariantCulture));
			}
			else
			{
				output.Write(number.ToString());
			}
			if (quote)
			{
				output.Write('"');
			}
		}

		private static void WriteBoolean(bool value, TextWriter output)
		{
			output.Write(value ? "true" : "false");
		}

		private static void WriteSingle(float value, TextWriter output)
		{
			output.Write(value.ToString("R", CultureInfo.InvariantCulture));
		}

		private static void WriteDouble(double value, TextWriter output)
		{
			output.Write(value.ToString("R", CultureInfo.InvariantCulture));
		}

		private static void WriteOffset(DateTimeOffset value, TextWriter output)
		{
			output.Write("\"");
			output.Write(value.ToString("o"));
			output.Write("\"");
		}

		private static void WriteDateTime(DateTime value, TextWriter output)
		{
			output.Write("\"");
			output.Write(value.ToString("o"));
			output.Write("\"");
		}

		private static void WriteString(string value, TextWriter output)
		{
			JsonValueFormatter.WriteQuotedJsonString(value, output);
		}

		[Obsolete("Use JsonValueFormatter.WriteQuotedJsonString() instead.")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		public static string Escape(string s)
		{
			if (s == null)
			{
				return null;
			}
			StringWriter stringWriter = new StringWriter();
			JsonValueFormatter.WriteQuotedJsonString(s, stringWriter);
			string text = stringWriter.ToString();
			return text.Substring(1, text.Length - 2);
		}
	}
}
