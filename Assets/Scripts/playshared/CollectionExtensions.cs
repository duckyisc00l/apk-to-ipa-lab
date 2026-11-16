using System;
using System.Collections;
using System.Collections.Generic;
using CircularBuffer;

public static class CollectionExtensions
{
	public static void ForEach<T>(this T[] arr, Action<T> action)
	{
		for (int i = 0; i < arr.Length; i++)
		{
			action(arr[i]);
		}
	}

	public static void ForEach<T>(this CircularBuffer<T> circularBuffer, Action<T> action)
	{
		for (int i = 0; i < circularBuffer.Count; i++)
		{
			action(circularBuffer[i]);
		}
	}

	public static void ForEach<T>(this IEnumerable<T> enumerable, Action<T> action)
	{
		foreach (T item in enumerable)
		{
			action(item);
		}
	}

	public static string JoinWith<T>(this IEnumerable<T> enumerable, string separator, string prefix = "", string suffix = "")
	{
		return prefix + string.Join(separator, enumerable) + suffix;
	}

	public static string ToCsv<T>(this IEnumerable<T> enumerable, string separator = ",", string prefix = "[", string suffix = "]")
	{
		return enumerable.JoinWith(separator, prefix, suffix);
	}

	public static void AddIfNotContains<T>(this ICollection<T> collection, T item)
	{
		if (!collection.Contains(item))
		{
			collection.Add(item);
		}
	}

	public static bool IsNullOrEmpty<T>(this IReadOnlyCollection<T> collection)
	{
		if (collection != null)
		{
			return collection.Count == 0;
		}
		return true;
	}

	public static bool AllMatch<T>(this IEnumerable<T> enumerable, Func<T, bool> predicate)
	{
		foreach (T item in enumerable)
		{
			if (!predicate(item))
			{
				return false;
			}
		}
		return true;
	}

	public static bool AnyMatch<T>(this IEnumerable<T> enumerable, Func<T, bool> predicate)
	{
		foreach (T item in enumerable)
		{
			if (predicate(item))
			{
				return true;
			}
		}
		return false;
	}

	public static T GetElementBefore<T>(this IList<T> list, T element, bool wrapAround)
	{
		if (list.Count == 0)
		{
			return default;
		}
		int num = list.IndexOf(element);
		if (num > 0)
		{
			return list[num - 1];
		}
		if (wrapAround)
		{
			return list[list.Count - 1];
		}
		return default;
	}

	public static T GetElementAfter<T>(this IList<T> list, T element, bool wrapAround)
	{
		if (list.Count == 0)
		{
			return default;
		}
		int num = list.IndexOf(element);
		if (num < list.Count - 1)
		{
			return list[num + 1];
		}
		if (wrapAround)
		{
			return list[0];
		}
		return default;
	}

	public static List<T> GetElementsBefore<T>(this IEnumerable<T> enumerable, T element, bool inclusive)
	{
		List<T> list = new List<T>();
		int num = enumerable.IndexOf(element);
		if (num < 0)
		{
			return list;
		}
		int num2 = 0;
		foreach (T item in enumerable)
		{
			if (num2 == num)
			{
				if (inclusive)
				{
					list.Add(item);
				}
				return list;
			}
			list.Add(item);
			num2++;
		}
		return list;
	}

	public static int IndexOf<T>(this IEnumerable<T> enumerable, T element)
	{
		if (enumerable is IList)
		{
			return (enumerable as IList).IndexOf(element);
		}
		int num = 0;
		foreach (T item in enumerable)
		{
			if (object.Equals(item, element))
			{
				return num;
			}
			num++;
		}
		return -1;
	}

	public static T FindMinElement<T>(this IEnumerable<T> enumerable, Func<T, float> valueFunction) where T : class
	{
		T val = null;
		float num = 0f;
		foreach (T item in enumerable)
		{
			float num2 = valueFunction(item);
			if (val == null || num2 < num)
			{
				num = num2;
				val = item;
			}
		}
		return val;
	}

	public static T FindMaxElement<T>(this IEnumerable<T> enumerable, Func<T, float> valueFunction) where T : class
	{
		T val = null;
		float num = 0f;
		foreach (T item in enumerable)
		{
			float num2 = valueFunction(item);
			if (val == null || num2 > num)
			{
				num = num2;
				val = item;
			}
		}
		return val;
	}

	public static Dictionary<TValue, TKey> ToInvertedDictionary<TKey, TValue>(this IDictionary<TKey, TValue> source)
	{
		Dictionary<TValue, TKey> dictionary = new Dictionary<TValue, TKey>();
		foreach (KeyValuePair<TKey, TValue> item in source)
		{
			dictionary[item.Value] = item.Key;
		}
		return dictionary;
	}

	public static void AddRange<T>(this HashSet<T> hashSet, IEnumerable<T> enumerable)
	{
		enumerable.ForEach((T item) =>
		{
			hashSet.Add(item);
		});
	}
}
