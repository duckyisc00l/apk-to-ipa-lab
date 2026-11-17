using System;

public static class ObjectExtensions
{
	public static void IfNotNull<T>(this T obj, Action<T> action) where T : class
	{
		if (obj != null)
		{
			action(obj);
		}
	}

	public static T OrIfNull<T>(this T obj, T fallbackObject)
	{
		if (obj == null)
		{
			return fallbackObject;
		}
		return obj;
	}
}
