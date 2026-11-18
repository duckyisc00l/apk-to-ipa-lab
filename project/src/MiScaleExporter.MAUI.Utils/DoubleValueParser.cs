using System.Globalization;

namespace MiScaleExporter.MAUI.Utils;

public static class DoubleValueParser
{
	public static bool IsValid(string value)
	{
		if (string.IsNullOrEmpty(value))
		{
			return true;
		}
		return ParseValueFromUsersCulture(value).HasValue;
	}

	public static string CheckValue(string value)
	{
		if (IsValid(value))
		{
			return value;
		}
		if (value.Length > 1)
		{
			return CheckValue(value.Remove(value.Length - 1));
		}
		return string.Empty;
	}

	public static double? ParseValueFromUsersCulture(string value)
	{
		if (string.IsNullOrEmpty(value))
		{
			return null;
		}
		double? result = ParseDouble(value);
		if (!result.HasValue)
		{
			result = ParseDouble(value.Replace(',', '.'));
		}
		if (!result.HasValue)
		{
			result = ParseDouble(value.Replace('.', ','));
		}
		if (!result.HasValue)
		{
			result = ParseDouble(value.Remove(value.Length - 1));
		}
		return result;
	}

	private static double? ParseDouble(string value)
	{
		if (double.TryParse(value, NumberStyles.AllowDecimalPoint, CultureInfo.InvariantCulture, out var result))
		{
			return result;
		}
		return null;
	}
}
