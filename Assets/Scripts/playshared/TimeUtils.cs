using System;
using System.Collections.Generic;
using System.Globalization;
using UnityEngine;

public static class TimeUtils
{
	public static long GetUnixTimeMilliseconds()
	{
		return DateTimeOffset.Now.ToUnixTimeMilliseconds();
	}

	public static bool TryParseDuration(string text, out long durationInMilliseconds, string defaultTimeUnit = "")
	{
		HashSet<string> hashSet = new HashSet<string> { "ms", "s" };
		if (!defaultTimeUnit.IsNullOrEmpty() && !hashSet.Contains(defaultTimeUnit))
		{
			throw new ArgumentException("Unhandled default time unit " + defaultTimeUnit);
		}
		try
		{
			text = text.Trim().Replace(" ", "").Replace(",", ".");
			string timeUnit = GetTimeUnit(text);
			text = text.Trim();
			if (IsMatchingTimeUnit(timeUnit, "ms"))
			{
				string s = text.Replace("ms", "");
				durationInMilliseconds = (long)double.Parse(s, CultureInfo.InvariantCulture);
				return true;
			}
			if (IsMatchingTimeUnit(timeUnit, "s"))
			{
				double num = double.Parse(text.Replace("s", ""), CultureInfo.InvariantCulture);
				durationInMilliseconds = (long)Math.Round(num * 1000.0);
				return true;
			}
			throw new ArgumentException("Unhandled time unit '" + timeUnit + "'");
		}
		catch (Exception innerException)
		{
			Debug.LogError(new ArgumentException("Could not parse duration of " + text, innerException));
		}
		durationInMilliseconds = 0L;
		return false;
		bool IsMatchingTimeUnit(string actualTimeUnit, string expectedTimeUnit)
		{
			if (!(actualTimeUnit == expectedTimeUnit))
			{
				if (actualTimeUnit.IsNullOrEmpty() && !defaultTimeUnit.IsNullOrEmpty())
				{
					return defaultTimeUnit == expectedTimeUnit;
				}
				return false;
			}
			return true;
		}
	}

	private static string GetTimeUnit(string text)
	{
		if (text.EndsWith("ms"))
		{
			return "ms";
		}
		if (text.EndsWith("s"))
		{
			return "s";
		}
		return "";
	}
}
