using System;
using Serilog.Core;
using Serilog.Events;

namespace Serilog.Policies
{
	internal class DelegateDestructuringPolicy : IDestructuringPolicy
	{
		public bool TryDestructure(object value, ILogEventPropertyValueFactory propertyValueFactory, out LogEventPropertyValue result)
		{
			if (value is Delegate obj)
			{
				result = new ScalarValue(obj.ToString());
				return true;
			}
			result = null;
			return false;
		}
	}
}
