using System;
using System.IO;
using Serilog.Events;
using Serilog.Parsing;
using Serilog.Rendering;

namespace Serilog.Formatting.Display
{
	public class MessageTemplateTextFormatter : ITextFormatter
	{
		private readonly IFormatProvider _formatProvider;

		private readonly MessageTemplate _outputTemplate;

		public MessageTemplateTextFormatter(string outputTemplate, IFormatProvider formatProvider = null)
		{
			if (outputTemplate == null)
			{
				throw new ArgumentNullException("outputTemplate");
			}
			_outputTemplate = new MessageTemplateParser().Parse(outputTemplate);
			_formatProvider = formatProvider;
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
			foreach (MessageTemplateToken token in _outputTemplate.Tokens)
			{
				if (token is TextToken tt)
				{
					MessageTemplateRenderer.RenderTextToken(tt, output);
					continue;
				}
				PropertyToken propertyToken = (PropertyToken)token;
				if (propertyToken.PropertyName == "Level")
				{
					string levelMoniker = LevelOutputFormat.GetLevelMoniker(logEvent.Level, propertyToken.Format);
					Padding.Apply(output, levelMoniker, propertyToken.Alignment);
					continue;
				}
				if (propertyToken.PropertyName == "NewLine")
				{
					Padding.Apply(output, Environment.NewLine, propertyToken.Alignment);
					continue;
				}
				if (propertyToken.PropertyName == "Exception")
				{
					string value = ((logEvent.Exception == null) ? "" : (logEvent.Exception?.ToString() + Environment.NewLine));
					Padding.Apply(output, value, propertyToken.Alignment);
					continue;
				}
				TextWriter textWriter = (propertyToken.Alignment.HasValue ? new StringWriter() : output);
				if (propertyToken.PropertyName == "Message")
				{
					MessageTemplateRenderer.Render(logEvent.MessageTemplate, logEvent.Properties, textWriter, propertyToken.Format, _formatProvider);
				}
				else if (propertyToken.PropertyName == "Timestamp")
				{
					ScalarValue.Render(logEvent.Timestamp, textWriter, propertyToken.Format, _formatProvider);
				}
				else if (propertyToken.PropertyName == "Properties")
				{
					PropertiesOutputFormat.Render(logEvent.MessageTemplate, logEvent.Properties, _outputTemplate, textWriter, propertyToken.Format, _formatProvider);
				}
				else
				{
					if (!logEvent.Properties.TryGetValue(propertyToken.PropertyName, out var value2))
					{
						continue;
					}
					if ((value2 as ScalarValue)?.Value is string value3)
					{
						string value4 = Casing.Format(value3, propertyToken.Format);
						textWriter.Write(value4);
					}
					else
					{
						value2.Render(textWriter, propertyToken.Format, _formatProvider);
					}
				}
				if (propertyToken.Alignment.HasValue)
				{
					Padding.Apply(output, ((StringWriter)textWriter).ToString(), propertyToken.Alignment);
				}
			}
		}
	}
}
