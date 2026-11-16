using UnityEngine;
using UnityEngine.UIElements;

public static class VisualElementUtils
{
	public const int TextFieldCharacterLimit = 12000;

	public static void MoveVisualElementFullyInsideScreen(VisualElement visualElement, PanelHelper panelHelper)
	{
		Vector2 screenSizeInPanelCoordinates = ApplicationUtils.GetScreenSizeInPanelCoordinates(panelHelper);
		float num = visualElement.worldBound.xMax - screenSizeInPanelCoordinates.x;
		float xMin = visualElement.worldBound.xMin;
		float num2 = visualElement.worldBound.yMax - screenSizeInPanelCoordinates.y;
		float yMin = visualElement.worldBound.yMin;
		Vector2 vector = Vector2.zero;
		if (xMin < 0f)
		{
			vector = new Vector2(xMin, vector.y);
		}
		if (num > 0f)
		{
			vector = new Vector2(num, vector.y);
		}
		if (yMin < 0f)
		{
			vector = new Vector2(vector.x, yMin);
		}
		if (num2 > 0f)
		{
			vector = new Vector2(vector.x, num2);
		}
		if (vector == Vector2.zero)
		{
			return;
		}
		if (vector.x != 0f)
		{
			if (visualElement.style.left != new StyleLength(StyleKeyword.Null) && visualElement.style.left != new StyleLength(StyleKeyword.Auto))
			{
				visualElement.style.left = visualElement.style.left.value.value - vector.x;
			}
			else if (visualElement.style.right != new StyleLength(StyleKeyword.Null) && visualElement.style.right != new StyleLength(StyleKeyword.Auto))
			{
				visualElement.style.right = visualElement.style.right.value.value + vector.x;
			}
		}
		if (vector.y != 0f)
		{
			if (visualElement.style.top != new StyleLength(StyleKeyword.Null) && visualElement.style.top != new StyleLength(StyleKeyword.Auto))
			{
				visualElement.style.top = visualElement.style.top.value.value - vector.y;
			}
			else if (visualElement.style.bottom != new StyleLength(StyleKeyword.Null) && visualElement.style.bottom != new StyleLength(StyleKeyword.Auto))
			{
				visualElement.style.top = visualElement.style.bottom.value.value + vector.y;
			}
		}
	}
}
