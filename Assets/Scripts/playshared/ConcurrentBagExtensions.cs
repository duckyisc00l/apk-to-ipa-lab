using System.Collections.Concurrent;
using System.Collections.Generic;

public static class ConcurrentBagExtensions
{
	public static void AddRange<T>(this ConcurrentBag<T> concurrentBag, IEnumerable<T> items)
	{
		items.ForEach((T item) =>
		{
			concurrentBag.Add(item);
		});
	}
}
