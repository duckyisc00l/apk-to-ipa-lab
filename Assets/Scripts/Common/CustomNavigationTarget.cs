using System;
using UnityEngine;
using UnityEngine.UIElements;

public class CustomNavigationTarget
{
	public VisualElement StartVisualElement { get; private set; }

	public VisualElement TargetVisualElement { get; private set; }

	public Vector2 NavigationDirection { get; private set; }

	public CustomNavigationTarget(VisualElement startVisualElement, Vector2 navigationDirection, VisualElement targetVisualElement)
	{
		StartVisualElement = startVisualElement;
		NavigationDirection = navigationDirection;
		TargetVisualElement = targetVisualElement;
	}

	public bool Matches(VisualElement startVisualElement, Vector2 navigationDirection)
	{
		if (startVisualElement == StartVisualElement)
		{
			return NavigationDirectionMatches(navigationDirection);
		}
		return false;
	}

	private bool NavigationDirectionMatches(Vector2 navigationDirection)
	{
		if (Math.Sign(NavigationDirection.x) == Math.Sign(navigationDirection.x))
		{
			return Math.Sign(NavigationDirection.y) == Math.Sign(navigationDirection.y);
		}
		return false;
	}
}
