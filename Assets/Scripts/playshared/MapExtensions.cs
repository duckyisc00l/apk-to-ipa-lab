using System.Collections.Generic;

public static class MapExtensions
{
	public static void AddInsideList<K, V>(this Dictionary<K, List<V>> map, K key, V newValue)
	{
		if (map.TryGetValue(key, out var value))
		{
			value.Add(newValue);
			return;
		}
		List<V> list = new List<V>();
		list.Add(newValue);
		map.Add(key, list);
	}

	public static V GetOrInitialize<K, V>(this Dictionary<K, V> dict, K key) where V : new()
	{
		if (!dict.ContainsKey(key))
		{
			dict[key] = new V();
		}
		return dict[key];
	}
}
