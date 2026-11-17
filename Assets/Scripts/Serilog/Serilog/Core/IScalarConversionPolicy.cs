using Serilog.Events;

namespace Serilog.Core
{
	internal interface IScalarConversionPolicy
	{
		bool TryConvertToScalar(object value, out ScalarValue result);
	}
}
