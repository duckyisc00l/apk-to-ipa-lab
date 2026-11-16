using System;
using System.Collections.Generic;
using System.Linq;
using Serilog.Capturing;
using Serilog.Configuration;
using Serilog.Core;
using Serilog.Core.Enrichers;
using Serilog.Core.Sinks;
using Serilog.Events;

namespace Serilog
{
	public class LoggerConfiguration
	{
		private readonly List<ILogEventSink> _logEventSinks = new List<ILogEventSink>();

		private readonly List<ILogEventSink> _auditSinks = new List<ILogEventSink>();

		private readonly List<ILogEventEnricher> _enrichers = new List<ILogEventEnricher>();

		private readonly List<ILogEventFilter> _filters = new List<ILogEventFilter>();

		private readonly List<Type> _additionalScalarTypes = new List<Type>();

		private readonly List<IDestructuringPolicy> _additionalDestructuringPolicies = new List<IDestructuringPolicy>();

		private readonly Dictionary<string, LoggingLevelSwitch> _overrides = new Dictionary<string, LoggingLevelSwitch>();

		private LogEventLevel _minimumLevel = LogEventLevel.Information;

		private LoggingLevelSwitch _levelSwitch;

		private int _maximumDestructuringDepth = 10;

		private int _maximumStringLength = int.MaxValue;

		private int _maximumCollectionCount = int.MaxValue;

		private bool _loggerCreated;

		public LoggerSinkConfiguration WriteTo { get; internal set; }

		public LoggerAuditSinkConfiguration AuditTo => new LoggerAuditSinkConfiguration(this, (ILogEventSink s) =>
		{
			_auditSinks.Add(s);
		}, ApplyInheritedConfiguration);

		public LoggerMinimumLevelConfiguration MinimumLevel => new LoggerMinimumLevelConfiguration(this, (LogEventLevel l) =>
		{
			_minimumLevel = l;
			_levelSwitch = null;
		}, (LoggingLevelSwitch sw) =>
		{
			_levelSwitch = sw;
		}, (string s, LoggingLevelSwitch lls) =>
		{
			_overrides[s] = lls;
		});

		public LoggerEnrichmentConfiguration Enrich { get; internal set; }

		public LoggerFilterConfiguration Filter => new LoggerFilterConfiguration(this, (ILogEventFilter f) =>
		{
			_filters.Add(f);
		});

		public LoggerDestructuringConfiguration Destructure => new LoggerDestructuringConfiguration(this, _additionalScalarTypes.Add, _additionalDestructuringPolicies.Add, (int depth) =>
		{
			_maximumDestructuringDepth = depth;
		}, (int length) =>
		{
			_maximumStringLength = length;
		}, (int count) =>
		{
			_maximumCollectionCount = count;
		});

		public LoggerSettingsConfiguration ReadFrom => new LoggerSettingsConfiguration(this);

		public LoggerConfiguration()
		{
			WriteTo = new LoggerSinkConfiguration(this, (ILogEventSink s) =>
			{
				_logEventSinks.Add(s);
			}, ApplyInheritedConfiguration);
			Enrich = new LoggerEnrichmentConfiguration(this, (ILogEventEnricher e) =>
			{
				_enrichers.Add(e);
			});
		}

		private void ApplyInheritedConfiguration(LoggerConfiguration child)
		{
			if (_levelSwitch != null)
			{
				child.MinimumLevel.ControlledBy(_levelSwitch);
			}
			else
			{
				child.MinimumLevel.Is(_minimumLevel);
			}
		}

		public Logger CreateLogger()
		{
			if (_loggerCreated)
			{
				throw new InvalidOperationException("CreateLogger() was previously called and can only be called once.");
			}
			_loggerCreated = true;
			ILogEventSink logEventSink = new SafeAggregateSink(_logEventSinks);
			bool flag = _auditSinks.Any();
			if (flag)
			{
				logEventSink = new AggregateSink(new ILogEventSink[1] { logEventSink }.Concat(_auditSinks));
			}
			if (_filters.Any())
			{
				logEventSink = new FilteringSink(logEventSink, _filters, flag);
			}
			MessageTemplateProcessor messageTemplateProcessor = new MessageTemplateProcessor(new PropertyValueConverter(_maximumDestructuringDepth, _maximumStringLength, _maximumCollectionCount, _additionalScalarTypes, _additionalDestructuringPolicies, flag));
			ILogEventEnricher enricher = _enrichers.Count switch
			{
				0 => new EmptyEnricher(), 
				1 => _enrichers[0], 
				_ => new SafeAggregateEnricher(_enrichers), 
			};
			LevelOverrideMap overrideMap = null;
			if (_overrides.Count != 0)
			{
				overrideMap = new LevelOverrideMap(_overrides, _minimumLevel, _levelSwitch);
			}
			IDisposable[] disposableSinks = _logEventSinks.Concat(_auditSinks).OfType<IDisposable>().ToArray();
			if (_levelSwitch != null)
			{
				return new Logger(messageTemplateProcessor, _levelSwitch, logEventSink, enricher, Dispose, overrideMap);
			}
			return new Logger(messageTemplateProcessor, _minimumLevel, logEventSink, enricher, Dispose, overrideMap);
			void Dispose()
			{
				IDisposable[] array = disposableSinks;
				for (int i = 0; i < array.Length; i++)
				{
					array[i].Dispose();
				}
			}
		}
	}
}
