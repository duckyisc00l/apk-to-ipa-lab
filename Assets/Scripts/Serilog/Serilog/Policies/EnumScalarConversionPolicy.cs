using System.Reflection;
using Serilog.Core;
using Serilog.Events;

namespace Serilog.Policies
{
	internal class EnumScalarConversionPolicy : IScalarConversionPolicy
	{
		public bool TryConvertToScalar(object value, out ScalarValue result)
		{
			if (value.GetType().GetTypeInfo().IsEnum)
			{
				result = new ScalarValue(value);
				return true;
			}
			result = null;
			return false;
		}
	}
}
