using System;
using Serilog.Core;
using Serilog.Policies;

namespace Serilog.Configuration
{
	public class LoggerDestructuringConfiguration
	{
		private readonly LoggerConfiguration _loggerConfiguration;

		private readonly Action<Type> _addScalar;

		private readonly Action<IDestructuringPolicy> _addPolicy;

		private readonly Action<int> _setMaximumDepth;

		private readonly Action<int> _setMaximumStringLength;

		private readonly Action<int> _setMaximumCollectionCount;

		internal LoggerDestructuringConfiguration(LoggerConfiguration loggerConfiguration, Action<Type> addScalar, Action<IDestructuringPolicy> addPolicy, Action<int> setMaximumDepth, Action<int> setMaximumStringLength, Action<int> setMaximumCollectionCount)
		{
			_loggerConfiguration = loggerConfiguration ?? throw new ArgumentNullException("loggerConfiguration");
			_addScalar = addScalar ?? throw new ArgumentNullException("addScalar");
			_addPolicy = addPolicy ?? throw new ArgumentNullException("addPolicy");
			_setMaximumDepth = setMaximumDepth ?? throw new ArgumentNullException("setMaximumDepth");
			_setMaximumStringLength = setMaximumStringLength ?? throw new ArgumentNullException("setMaximumStringLength");
			_setMaximumCollectionCount = setMaximumCollectionCount ?? throw new ArgumentNullException("setMaximumCollectionCount");
		}

		public LoggerConfiguration AsScalar(Type scalarType)
		{
			if (scalarType == null)
			{
				throw new ArgumentNullException("scalarType");
			}
			_addScalar(scalarType);
			return _loggerConfiguration;
		}

		public LoggerConfiguration AsScalar<TScalar>()
		{
			return AsScalar(typeof(TScalar));
		}

		public LoggerConfiguration With(params IDestructuringPolicy[] destructuringPolicies)
		{
			if (destructuringPolicies == null)
			{
				throw new ArgumentNullException("destructuringPolicies");
			}
			foreach (IDestructuringPolicy destructuringPolicy in destructuringPolicies)
			{
				if (destructuringPolicy == null)
				{
					throw new ArgumentException("Null policy is not allowed.");
				}
				_addPolicy(destructuringPolicy);
			}
			return _loggerConfiguration;
		}

		public LoggerConfiguration With<TDestructuringPolicy>() where TDestructuringPolicy : IDestructuringPolicy, new()
		{
			return With(new TDestructuringPolicy());
		}

		public LoggerConfiguration ByTransforming<TValue>(Func<TValue, object> transformation)
		{
			if (transformation == null)
			{
				throw new ArgumentNullException("transformation");
			}
			ProjectedDestructuringPolicy projectedDestructuringPolicy = new ProjectedDestructuringPolicy((Type t) => t == typeof(TValue), (object o) => transformation((TValue)o));
			return With(projectedDestructuringPolicy);
		}

		public LoggerConfiguration ByTransformingWhere<TValue>(Func<Type, bool> predicate, Func<TValue, object> transformation)
		{
			if (transformation == null)
			{
				throw new ArgumentNullException("transformation");
			}
			ProjectedDestructuringPolicy projectedDestructuringPolicy = new ProjectedDestructuringPolicy(predicate, (object o) => transformation((TValue)o));
			return With(projectedDestructuringPolicy);
		}

		public LoggerConfiguration ToMaximumDepth(int maximumDestructuringDepth)
		{
			if (maximumDestructuringDepth < 0)
			{
				throw new ArgumentOutOfRangeException("maximumDestructuringDepth");
			}
			_setMaximumDepth(maximumDestructuringDepth);
			return _loggerConfiguration;
		}

		public LoggerConfiguration ToMaximumStringLength(int maximumStringLength)
		{
			if (maximumStringLength < 2)
			{
				throw new ArgumentOutOfRangeException("maximumStringLength", maximumStringLength, "Maximum string length must be at least two.");
			}
			_setMaximumStringLength(maximumStringLength);
			return _loggerConfiguration;
		}

		public LoggerConfiguration ToMaximumCollectionCount(int maximumCollectionCount)
		{
			if (maximumCollectionCount < 1)
			{
				throw new ArgumentOutOfRangeException("maximumCollectionCount", maximumCollectionCount, "Maximum collection length must be at least one.");
			}
			_setMaximumCollectionCount(maximumCollectionCount);
			return _loggerConfiguration;
		}
	}
}
