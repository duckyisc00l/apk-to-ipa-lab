using System;
using Serilog.Core;
using Serilog.Events;

namespace Serilog.Policies
{
	internal class ProjectedDestructuringPolicy : IDestructuringPolicy
	{
		private readonly Func<Type, bool> _canApply;

		private readonly Func<object, object> _projection;

		public ProjectedDestructuringPolicy(Func<Type, bool> canApply, Func<object, object> projection)
		{
			_canApply = canApply ?? throw new ArgumentNullException("canApply");
			_projection = projection ?? throw new ArgumentNullException("projection");
		}

		public bool TryDestructure(object value, ILogEventPropertyValueFactory propertyValueFactory, out LogEventPropertyValue result)
		{
			if (value == null)
			{
				throw new ArgumentNullException("value");
			}
			if (!_canApply(value.GetType()))
			{
				result = null;
				return false;
			}
			object value2 = _projection(value);
			result = propertyValueFactory.CreatePropertyValue(value2, destructureObjects: true);
			return true;
		}
	}
}
