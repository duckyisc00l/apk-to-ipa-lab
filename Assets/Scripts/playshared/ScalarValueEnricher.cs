using Serilog.Core;
using Serilog.Events;

public class ScalarValueEnricher : ILogEventEnricher
{
	protected readonly LogEventProperty property;

	public ScalarValueEnricher(string name, object value)
	{
		property = new LogEventProperty(name, new ScalarValue(value));
	}

	public void Enrich(LogEvent evt, ILogEventPropertyFactory _)
	{
		evt.AddPropertyIfAbsent(property);
	}
}
