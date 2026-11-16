using System;
using Serilog.Debugging;
using Serilog.Events;
using Serilog.Parsing;

namespace Serilog.Capturing
{
	internal class PropertyBinder
	{
		private readonly PropertyValueConverter _valueConverter;

		private static readonly EventProperty[] NoProperties = new EventProperty[0];

		public PropertyBinder(PropertyValueConverter valueConverter)
		{
			_valueConverter = valueConverter;
		}

		public EventProperty[] ConstructProperties(MessageTemplate messageTemplate, object[] messageTemplateParameters)
		{
			if (messageTemplateParameters == null || messageTemplateParameters.Length == 0)
			{
				if (messageTemplate.NamedProperties != null || messageTemplate.PositionalProperties != null)
				{
					SelfLog.WriteLine("Required properties not provided for: {0}", messageTemplate);
				}
				return NoProperties;
			}
			if (messageTemplate.PositionalProperties != null)
			{
				return ConstructPositionalProperties(messageTemplate, messageTemplateParameters);
			}
			return ConstructNamedProperties(messageTemplate, messageTemplateParameters);
		}

		private EventProperty[] ConstructPositionalProperties(MessageTemplate template, object[] messageTemplateParameters)
		{
			PropertyToken[] positionalProperties = template.PositionalProperties;
			if (positionalProperties.Length != messageTemplateParameters.Length)
			{
				SelfLog.WriteLine("Positional property count does not match parameter count: {0}", template);
			}
			EventProperty[] array = new EventProperty[messageTemplateParameters.Length];
			PropertyToken[] array2 = positionalProperties;
			foreach (PropertyToken propertyToken in array2)
			{
				if (propertyToken.TryGetPositionalValue(out var position))
				{
					if (position < 0 || position >= messageTemplateParameters.Length)
					{
						SelfLog.WriteLine("Unassigned positional value {0} in: {1}", position, template);
					}
					else
					{
						array[position] = ConstructProperty(propertyToken, messageTemplateParameters[position]);
					}
				}
			}
			int num = 0;
			for (int j = 0; j < array.Length; j++)
			{
				if (!array[j].Equals(EventProperty.None))
				{
					array[num] = array[j];
					num++;
				}
			}
			if (num != array.Length)
			{
				Array.Resize(ref array, num);
			}
			return array;
		}

		private EventProperty[] ConstructNamedProperties(MessageTemplate template, object[] messageTemplateParameters)
		{
			PropertyToken[] namedProperties = template.NamedProperties;
			if (namedProperties == null)
			{
				return NoProperties;
			}
			int num = namedProperties.Length;
			if (namedProperties.Length != messageTemplateParameters.Length)
			{
				num = Math.Min(namedProperties.Length, messageTemplateParameters.Length);
				SelfLog.WriteLine("Named property count does not match parameter count: {0}", template);
			}
			EventProperty[] array = new EventProperty[messageTemplateParameters.Length];
			for (int i = 0; i < num; i++)
			{
				PropertyToken propertyToken = template.NamedProperties[i];
				object value = messageTemplateParameters[i];
				array[i] = ConstructProperty(propertyToken, value);
			}
			for (int j = num; j < messageTemplateParameters.Length; j++)
			{
				LogEventPropertyValue value2 = _valueConverter.CreatePropertyValue(messageTemplateParameters[j]);
				array[j] = new EventProperty("__" + j, value2);
			}
			return array;
		}

		private EventProperty ConstructProperty(PropertyToken propertyToken, object value)
		{
			return new EventProperty(propertyToken.PropertyName, _valueConverter.CreatePropertyValue(value, propertyToken.Destructuring));
		}
	}
}
