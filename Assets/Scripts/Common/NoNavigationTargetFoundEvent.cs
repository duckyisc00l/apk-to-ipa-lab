using UnityEngine;
using UnityEngine.UIElements;

public class NoNavigationTargetFoundEvent
{
	public VisualElement FocusableNavigatorRootVisualElement { get; set; }

	public VisualElement FocusedVisualElement { get; set; }

	public Vector2 NavigationDirection { get; set; }

	public override string ToString()
	{
		return string.Format("{{ {0}: {1},", "NavigationDirection", NavigationDirection) + string.Format(" {0}: {1},", "FocusedVisualElement", FocusedVisualElement) + string.Format(" {0}: {1} }}", "FocusableNavigatorRootVisualElement", FocusableNavigatorRootVisualElement);
	}
}
