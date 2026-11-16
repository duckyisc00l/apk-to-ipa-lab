using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Serilog.Debugging;
using Serilog.Parsing;
using Serilog.Rendering;

namespace Serilog.Events
{
	public class MessageTemplate
	{
		private readonly MessageTemplateToken[] _tokens;

		public static MessageTemplate Empty { get; } = new MessageTemplate(Enumerable.Empty<MessageTemplateToken>());

		public string Text { get; }

		public IEnumerable<MessageTemplateToken> Tokens => _tokens;

		internal MessageTemplateToken[] TokenArray => _tokens;

		internal PropertyToken[] NamedProperties { get; }

		internal PropertyToken[] PositionalProperties { get; }

		public MessageTemplate(IEnumerable<MessageTemplateToken> tokens)
			: this(string.Concat(tokens), tokens)
		{
		}

		public MessageTemplate(string text, IEnumerable<MessageTemplateToken> tokens)
		{
			Text = text ?? throw new ArgumentNullException("text");
			_tokens = (tokens ?? throw new ArgumentNullException("tokens")).ToArray();
			PropertyToken[] elementsOfTypeToArray = GetElementsOfTypeToArray<PropertyToken>(_tokens);
			if (elementsOfTypeToArray.Length == 0)
			{
				return;
			}
			bool flag = true;
			bool flag2 = false;
			PropertyToken[] array = elementsOfTypeToArray;
			for (int i = 0; i < array.Length; i++)
			{
				if (array[i].IsPositional)
				{
					flag2 = true;
				}
				else
				{
					flag = false;
				}
			}
			if (flag)
			{
				PositionalProperties = elementsOfTypeToArray;
				return;
			}
			if (flag2)
			{
				SelfLog.WriteLine("Message template is malformed: {0}", text);
			}
			NamedProperties = elementsOfTypeToArray;
		}

		private static TResult[] GetElementsOfTypeToArray<TResult>(MessageTemplateToken[] tokens) where TResult : class
		{
			List<TResult> list = new List<TResult>(tokens.Length / 2);
			for (int i = 0; i < tokens.Length; i++)
			{
				if (tokens[i] is TResult item)
				{
					list.Add(item);
				}
			}
			return list.ToArray();
		}

		public override string ToString()
		{
			return Text;
		}

		public string Render(IReadOnlyDictionary<string, LogEventPropertyValue> properties, IFormatProvider formatProvider = null)
		{
			StringWriter stringWriter = new StringWriter(formatProvider);
			Render(properties, stringWriter, formatProvider);
			return stringWriter.ToString();
		}

		public void Render(IReadOnlyDictionary<string, LogEventPropertyValue> properties, TextWriter output, IFormatProvider formatProvider = null)
		{
			if (properties == null)
			{
				throw new ArgumentNullException("properties");
			}
			if (output == null)
			{
				throw new ArgumentNullException("output");
			}
			MessageTemplateRenderer.Render(this, properties, output, null, formatProvider);
		}
	}
}
