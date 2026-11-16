using Serilog.Events;

namespace Serilog.Core
{
	public interface IDestructuringPolicy
	{
		bool TryDestructure(object value, ILogEventPropertyValueFactory propertyValueFactory, out LogEventPropertyValue result);
	}
}
