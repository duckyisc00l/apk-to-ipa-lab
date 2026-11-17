using System.Collections.Generic;

namespace PrimeInputActions
{
	public static class ExtensionMethods
	{
		public static bool IsNullOrEmpty(this string txt)
		{
			return string.IsNullOrEmpty(txt);
		}

		public static bool IsNullOrEmpty<T>(this IReadOnlyCollection<T> collection)
		{
			if (collection != null)
			{
				return collection.Count == 0;
			}
			return true;
		}
	}
}
