using System.Collections.Generic;
using System.Linq;

public static class NumberUtils
{
	public static int Limit(int value, int min, int max)
	{
		if (value < min)
		{
			return min;
		}
		if (value > max)
		{
			return max;
		}
		return value;
	}

	public static float Limit(float value, float min, float max)
	{
		if (value < min)
		{
			return min;
		}
		if (value > max)
		{
			return max;
		}
		return value;
	}

	public static double Limit(double value, double min, double max)
	{
		if (value < min)
		{
			return min;
		}
		if (value > max)
		{
			return max;
		}
		return value;
	}

	public static int Mod(int a, int n)
	{
		int num = a % n;
		if ((num < 0 && n > 0) || (num > 0 && n < 0))
		{
			num += n;
		}
		return num;
	}

	public static T Median<T>(IEnumerable<T> enumerable)
	{
		List<T> list = enumerable.ToList();
		if (list.IsNullOrEmpty())
		{
			return default;
		}
		list.Sort();
		return list[list.Count / 2];
	}
}
