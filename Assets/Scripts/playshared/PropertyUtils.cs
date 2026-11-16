using System;
using System.Globalization;

public static class PropertyUtils
{
	public static Func<string> CreateStringGetterFromUintGetter(Func<uint> valueGetter, bool zeroToEmpty)
	{
		return () =>
		{
			uint num = valueGetter();
			return (zeroToEmpty && num == 0) ? "" : num.ToString();
		};
	}

	public static Action<string> CreateStringSetterFromUintSetter(Action<uint> valueSetter)
	{
		return (string newValue) =>
		{
			if (!newValue.IsNullOrEmpty() && uint.TryParse(newValue, out var result))
			{
				valueSetter(result);
			}
			else
			{
				valueSetter(0u);
			}
		};
	}

	public static Func<string> CreateStringGetterFromFloatGetter(Func<float> valueGetter, bool zeroToEmpty, string toStringFormat)
	{
		return () =>
		{
			float num = valueGetter();
			return (zeroToEmpty && num == 0f) ? "" : num.ToString(null, CultureInfo.InvariantCulture);
		};
	}

	public static Action<string> CreateStringSetterFromFloatSetter(Action<float> valueSetter)
	{
		return (string newValue) =>
		{
			if (!newValue.IsNullOrEmpty() && float.TryParse(newValue, NumberStyles.Any, CultureInfo.InvariantCulture, out var result))
			{
				valueSetter(result);
			}
			else
			{
				valueSetter(0f);
			}
		};
	}

	public static Func<int> CreateIntGetterFromStringGetter(Func<string> valueGetter, int defaultValue = 0)
	{
		return () =>
		{
			string text = valueGetter();
			if (text.IsNullOrEmpty())
			{
				return defaultValue;
			}
			int result;
			return (!int.TryParse(text, out result)) ? defaultValue : result;
		};
	}

	public static Func<float> CreateFloatGetterFromStringGetter(Func<string> valueGetter, float defaultValue = 0f)
	{
		return () =>
		{
			string text = valueGetter();
			if (text.IsNullOrEmpty())
			{
				return defaultValue;
			}
			float result;
			return (!float.TryParse(text, NumberStyles.Any, CultureInfo.InvariantCulture, out result)) ? defaultValue : result;
		};
	}

	public static bool TrySetIntFromString(string stringValue, Action<int> valueSetter)
	{
		if (int.TryParse(stringValue, out var result))
		{
			valueSetter(result);
			return true;
		}
		return false;
	}

	public static bool TrySetFloatFromString(string stringValue, Action<float> valueSetter)
	{
		if (float.TryParse(stringValue, NumberStyles.Any, CultureInfo.InvariantCulture, out var result))
		{
			valueSetter(result);
			return true;
		}
		return false;
	}

	public static float GetFloatFromString(string stringValue, float defaultValue)
	{
		if (float.TryParse(stringValue, NumberStyles.Any, CultureInfo.InvariantCulture, out var result))
		{
			return result;
		}
		return defaultValue;
	}
}
