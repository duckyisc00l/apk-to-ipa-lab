using System;
using System.Collections.Generic;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class DoubleClickControl
{
	private const float DoubleClickMaxDistanceInPx = 5f;

	private readonly Subject<bool> doublePointerDownEventStream = new Subject<bool>();

	private readonly Dictionary<int, float> buttonToLastPointerDownTime = new Dictionary<int, float>();

	private readonly Dictionary<int, Vector3> buttonToLastPointerDownPosition = new Dictionary<int, Vector3>();

	private readonly VisualElement visualElement;

	public IObservable<bool> DoublePointerDownEventStream => doublePointerDownEventStream;

	public List<int> ButtonFilter { get; set; } = new List<int> { 0 };

	public DoubleClickControl(VisualElement visualElement)
	{
		this.visualElement = visualElement;
		visualElement.RegisterCallback((PointerDownEvent evt) =>
		{
			OnPointerDown(evt);
		}, TrickleDown.TrickleDown);
	}

	private void OnPointerDown(PointerDownEvent evt)
	{
		if (!ButtonFilter.Contains(evt.button))
		{
			return;
		}
		if (buttonToLastPointerDownTime.TryGetValue(evt.button, out var value) && buttonToLastPointerDownPosition.TryGetValue(evt.button, out var value2))
		{
			bool num = Time.time - value < 0.3f;
			bool flag = Vector3.Distance(evt.position, value2) < 5f;
			if (num & flag)
			{
				doublePointerDownEventStream.OnNext(value: true);
			}
		}
		buttonToLastPointerDownTime[evt.button] = Time.time;
		buttonToLastPointerDownPosition[evt.button] = evt.position;
	}
}
