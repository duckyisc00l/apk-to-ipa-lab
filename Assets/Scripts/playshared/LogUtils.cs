using System.Collections.Generic;
using UnityEngine;

public class LogUtils
{
	private class LogData
	{
		public List<string> DataPointQueue { get; private set; } = new List<string>();

		public float LastLogTimeInSeconds { get; set; }
	}

	private static readonly Dictionary<string, LogData> messagePrefixToLogDataMap = new Dictionary<string, LogData>();

	public static void LogFrequently(string messagePrefix, object dataPoint, float periodInSeconds = 1f)
	{
		if (!messagePrefixToLogDataMap.TryGetValue(messagePrefix, out var value))
		{
			value = new LogData();
			value.LastLogTimeInSeconds = Time.time;
			messagePrefixToLogDataMap[messagePrefix] = value;
		}
		value.DataPointQueue.Add(dataPoint.ToString());
		if (value.LastLogTimeInSeconds + periodInSeconds < Time.time)
		{
			string text = string.Join(", ", value.DataPointQueue);
			Debug.Log(messagePrefix + " [" + text + "]");
			value.DataPointQueue.Clear();
			value.LastLogTimeInSeconds = Time.time;
		}
	}
}
