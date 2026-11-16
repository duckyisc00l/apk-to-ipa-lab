using System;
using System.Collections.Generic;
using Serilog.Events;

namespace Serilog.Core.Pipeline
{
	internal class MessageTemplateCache : IMessageTemplateParser
	{
		private readonly IMessageTemplateParser _innerParser;

		private readonly object _templatesLock = new object();

		private readonly Dictionary<string, MessageTemplate> _templates = new Dictionary<string, MessageTemplate>();

		private const int MaxCacheItems = 1000;

		private const int MaxCachedTemplateLength = 1024;

		public MessageTemplateCache(IMessageTemplateParser innerParser)
		{
			_innerParser = innerParser ?? throw new ArgumentNullException("innerParser");
		}

		public MessageTemplate Parse(string messageTemplate)
		{
			if (messageTemplate == null)
			{
				throw new ArgumentNullException("messageTemplate");
			}
			if (messageTemplate.Length > 1024)
			{
				return _innerParser.Parse(messageTemplate);
			}
			MessageTemplate value;
			lock (_templatesLock)
			{
				if (_templates.TryGetValue(messageTemplate, out value))
				{
					return value;
				}
			}
			value = _innerParser.Parse(messageTemplate);
			lock (_templatesLock)
			{
				if (_templates.Count == 1000)
				{
					_templates.Clear();
				}
				_templates[messageTemplate] = value;
				return value;
			}
		}
	}
}
