using System;
using System.ComponentModel;
using Serilog.Core;
using Serilog.Core.Enrichers;
using Serilog.Events;

namespace Serilog.Context
{
	public static class LogContext
	{
		private sealed class ContextStackBookmark : IDisposable
		{
			private readonly ImmutableStack<ILogEventEnricher> _bookmark;

			public ContextStackBookmark(ImmutableStack<ILogEventEnricher> bookmark)
			{
				_bookmark = bookmark;
			}

			public void Dispose()
			{
				Enrichers = _bookmark;
			}
		}

		[ThreadStatic]
		private static ImmutableStack<ILogEventEnricher> Data;

		private static ImmutableStack<ILogEventEnricher> Enrichers
		{
			get
			{
				return Data;
			}
			set
			{
				Data = value;
			}
		}

		public static IDisposable PushProperty(string name, object value, bool destructureObjects = false)
		{
			return Push(new PropertyEnricher(name, value, destructureObjects));
		}

		public static IDisposable Push(ILogEventEnricher enricher)
		{
			if (enricher == null)
			{
				throw new ArgumentNullException("enricher");
			}
			ImmutableStack<ILogEventEnricher> orCreateEnricherStack = GetOrCreateEnricherStack();
			ContextStackBookmark result = new ContextStackBookmark(orCreateEnricherStack);
			Enrichers = orCreateEnricherStack.Push(enricher);
			return result;
		}

		public static IDisposable Push(params ILogEventEnricher[] enrichers)
		{
			if (enrichers == null)
			{
				throw new ArgumentNullException("enrichers");
			}
			ImmutableStack<ILogEventEnricher> immutableStack = GetOrCreateEnricherStack();
			ContextStackBookmark result = new ContextStackBookmark(immutableStack);
			for (int i = 0; i < enrichers.Length; i++)
			{
				immutableStack = immutableStack.Push(enrichers[i]);
			}
			Enrichers = immutableStack;
			return result;
		}

		[Obsolete("Please use `LogContext.Push(properties)` instead.")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		public static IDisposable PushProperties(params ILogEventEnricher[] properties)
		{
			return Push(properties);
		}

		public static ILogEventEnricher Clone()
		{
			return new SafeAggregateEnricher(GetOrCreateEnricherStack());
		}

		public static IDisposable Suspend()
		{
			ContextStackBookmark result = new ContextStackBookmark(GetOrCreateEnricherStack());
			Enrichers = ImmutableStack<ILogEventEnricher>.Empty;
			return result;
		}

		public static void Reset()
		{
			if (Enrichers != null && Enrichers != ImmutableStack<ILogEventEnricher>.Empty)
			{
				Enrichers = ImmutableStack<ILogEventEnricher>.Empty;
			}
		}

		private static ImmutableStack<ILogEventEnricher> GetOrCreateEnricherStack()
		{
			ImmutableStack<ILogEventEnricher> immutableStack = Enrichers;
			if (immutableStack == null)
			{
				immutableStack = (Enrichers = ImmutableStack<ILogEventEnricher>.Empty);
			}
			return immutableStack;
		}

		internal static void Enrich(LogEvent logEvent, ILogEventPropertyFactory propertyFactory)
		{
			ImmutableStack<ILogEventEnricher> enrichers = Enrichers;
			if (enrichers == null || enrichers == ImmutableStack<ILogEventEnricher>.Empty)
			{
				return;
			}
			foreach (ILogEventEnricher item in enrichers)
			{
				item.Enrich(logEvent, propertyFactory);
			}
		}
	}
}
