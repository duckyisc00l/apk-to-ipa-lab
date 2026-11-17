using System;
using System.Collections.Generic;

public static class EnumUtils
{
	public static List<T> GetValuesAsList<T>()
	{
		Array values = Enum.GetValues(typeof(T));
		List<T> list = new List<T>();
		foreach (object item in values)
		{
			if (item is T)
			{
				list.Add((T)item);
			}
		}
		return list;
	}
}
