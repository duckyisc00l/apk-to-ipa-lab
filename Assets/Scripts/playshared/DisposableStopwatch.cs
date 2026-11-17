using System;
using System.Diagnostics;
using UnityEngine;

public class DisposableStopwatch : IDisposable
{
	private Stopwatch stopwatch;

	private readonly Action<Stopwatch> action;

	public double ElapsedMilliseconds => stopwatch.ElapsedMilliseconds;

	public TimeSpan Elapsed => stopwatch.Elapsed;

	public long ElapsedTicks => stopwatch.ElapsedTicks;

	public DisposableStopwatch(Action<Stopwatch> action, bool startStopwatch = true)
	{
		this.action = action;
		CreateStopwatch(startStopwatch);
	}

	public DisposableStopwatch(string textWithPlaceholders, bool startStopwatch = true, float logPeriodInSeconds = 0f)
	{
		DisposableStopwatch disposableStopwatch = this;
		action = (Stopwatch sw) =>
		{
			disposableStopwatch.LogTextWithPlaceholders(sw, textWithPlaceholders, logPeriodInSeconds);
		};
		CreateStopwatch(startStopwatch);
	}

	public void Dispose()
	{
		stopwatch.Stop();
		action(stopwatch);
	}

	private void CreateStopwatch(bool startStopwatch)
	{
		stopwatch = new Stopwatch();
		if (startStopwatch)
		{
			stopwatch.Start();
		}
	}

	private void LogTextWithPlaceholders(Stopwatch sw, string textWithPlaceholders, float logPeriodInSeconds)
	{
		string text = sw.ElapsedMilliseconds.ToString();
		string message = textWithPlaceholders.Replace("<millis>", text).Replace("<ms>", text);
		if (logPeriodInSeconds <= 0f)
		{
			UnityEngine.Debug.Log(message);
		}
		else
		{
			LogUtils.LogFrequently(textWithPlaceholders, text, logPeriodInSeconds);
		}
	}
}
