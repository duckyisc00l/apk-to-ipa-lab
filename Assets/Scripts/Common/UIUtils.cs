using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public static class UIUtils
{
	public class BackgroundColorConfig
	{
		public Color backgroundColor;

		public Color hoverBackgroundColor;

		public Color focusBackgroundColor;

		public BackgroundColorConfig(Color backgroundColor, Color hoverBackgroundColor, Color focusBackgroundColor)
		{
			this.backgroundColor = backgroundColor;
			this.hoverBackgroundColor = hoverBackgroundColor;
			this.focusBackgroundColor = focusBackgroundColor;
		}
	}

	private static readonly Dictionary<VisualElement, BackgroundColorConfig> elementsBgColorsDict = new Dictionary<VisualElement, BackgroundColorConfig>();

	public static void ForEachElementWithClass(VisualElement root, Action<VisualElement> callback, params string[] classNames)
	{
		foreach (string className in classNames)
		{
			root.Query(null, className).ForEach(callback);
		}
	}

	public static void SetBackgroundStyleWithHoverAndFocus(VisualElement root, Color backgroundColor, Color hoverBackgroundColor, Color focusBackgroundColor, Color fontColor)
	{
		SetBackgroundStyleWithHoverAndFocus(root, root, backgroundColor, hoverBackgroundColor, focusBackgroundColor, fontColor);
	}

	public static void SetBackgroundStyleWithHoverAndFocus(VisualElement root, VisualElement hoverRoot, Color backgroundColor, Color hoverBackgroundColor, Color focusBackgroundColor, Color fontColor)
	{
		if (root == null)
		{
			return;
		}
		root.style.color = fontColor;
		root.style.backgroundColor = backgroundColor;
		if (!elementsBgColorsDict.ContainsKey(hoverRoot))
		{
			elementsBgColorsDict.Add(hoverRoot, new BackgroundColorConfig(backgroundColor, hoverBackgroundColor, focusBackgroundColor));
			bool pointerOver = false;
			bool hasFocus = hoverRoot.focusController.focusedElement == hoverRoot;
			hoverRoot.RegisterCallback((PointerEnterEvent evt) =>
			{
				pointerOver = true;
				ApplyHoverStyle();
			});
			hoverRoot.RegisterCallback((PointerLeaveEvent evt) =>
			{
				pointerOver = false;
				if (!pointerOver && !hasFocus)
				{
					RemoveHoverAndFocusStyle();
				}
			});
			if (hasFocus)
			{
				ApplyFocusStyle();
			}
			hoverRoot.RegisterCallback((FocusEvent evt) =>
			{
				hasFocus = true;
				ApplyFocusStyle();
			});
			hoverRoot.RegisterCallback((BlurEvent evt) =>
			{
				hasFocus = false;
				if (!pointerOver && !hasFocus)
				{
					RemoveHoverAndFocusStyle();
				}
			});
		}
		else
		{
			elementsBgColorsDict[hoverRoot] = new BackgroundColorConfig(backgroundColor, hoverBackgroundColor, focusBackgroundColor);
		}
		void ApplyFocusStyle()
		{
			Color focusBackgroundColor2 = elementsBgColorsDict[hoverRoot].focusBackgroundColor;
			focusBackgroundColor2.a = root.resolvedStyle.backgroundColor.a;
			root.style.backgroundColor = focusBackgroundColor2;
		}
		void ApplyHoverStyle()
		{
			Color hoverBackgroundColor2 = elementsBgColorsDict[hoverRoot].hoverBackgroundColor;
			hoverBackgroundColor2.a = root.resolvedStyle.backgroundColor.a;
			root.style.backgroundColor = hoverBackgroundColor2;
		}
		void RemoveHoverAndFocusStyle()
		{
			Color backgroundColor2 = elementsBgColorsDict[hoverRoot].backgroundColor;
			backgroundColor2.a = root.resolvedStyle.backgroundColor.a;
			root.style.backgroundColor = backgroundColor2;
		}
	}

	public static void ApplyFontColorForElements(VisualElement root, string[] names, string[] classes, Color fontColor)
	{
		if (names == null)
		{
			root.Query(null, classes).ForEach((VisualElement element) => element.style.color = fontColor);
			return;
		}
		foreach (string name in names)
		{
			root.Query(name, classes).ForEach((VisualElement element) => element.style.color = fontColor);
		}
	}

	public static Color ColorHSVOffset(Color inputColor, float hueOffset, float saturationOffset, float valueOffset)
	{
		Color.RGBToHSV(inputColor, out var H, out var S, out var V);
		H += hueOffset;
		S += saturationOffset;
		V += valueOffset;
		return Color.HSVToRGB(H, S, V);
	}
}
