using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public static class VisualElementExtensions
{
	public static void RegisterCallbackButtonTriggered(this Button button, Action callback)
	{
		button.RegisterCallback((ClickEvent _) =>
		{
			callback();
		});
		button.RegisterCallback((NavigationSubmitEvent _) =>
		{
			callback();
		});
	}

	public static void UnregisterCallbackButtonTriggered(this Button button, Action callback)
	{
		button.UnregisterCallback((ClickEvent _) =>
		{
			callback();
		});
		button.UnregisterCallback((NavigationSubmitEvent _) =>
		{
			callback();
		});
	}

	public static void AddToClassListIfNew(this VisualElement visualElement, params string[] newClasses)
	{
		HashSet<string> currentClasses = new HashSet<string>();
		visualElement.GetClasses().ForEach((string currentClass) =>
		{
			currentClasses.Add(currentClass);
		});
		newClasses.ForEach((string newClass) =>
		{
			if (!currentClasses.Contains(newClass))
			{
				visualElement.AddToClassList(newClass);
			}
		});
	}

	public static void SetInClassList(this VisualElement visualElement, string newClass, bool shouldBePresent)
	{
		if (shouldBePresent)
		{
			visualElement.AddToClassList(newClass);
		}
		else
		{
			visualElement.RemoveFromClassList(newClass);
		}
	}

	public static bool IsVisibleByDisplay(this VisualElement visualElement)
	{
		return visualElement.style.display != DisplayStyle.None;
	}

	public static void SetVisibleByDisplay(this VisualElement visualElement, bool isVisible)
	{
		if (isVisible)
		{
			visualElement.ShowByDisplay();
		}
		else
		{
			visualElement.HideByDisplay();
		}
	}

	public static void ToggleVisibleByDisplay(this VisualElement visualElement)
	{
		visualElement.SetVisibleByDisplay(!visualElement.IsVisibleByDisplay());
	}

	public static void ShowByDisplay(this VisualElement visualElement)
	{
		visualElement.style.display = new StyleEnum<DisplayStyle>(DisplayStyle.Flex);
	}

	public static void HideByDisplay(this VisualElement visualElement)
	{
		visualElement.style.display = new StyleEnum<DisplayStyle>(DisplayStyle.None);
	}

	public static bool IsVisibleByVisibility(this VisualElement visualElement)
	{
		return visualElement.style.visibility != Visibility.Hidden;
	}

	public static void SetVisibleByVisibility(this VisualElement visualElement, bool isVisible)
	{
		if (isVisible)
		{
			visualElement.ShowByVisibility();
		}
		else
		{
			visualElement.HideByVisibility();
		}
	}

	public static void ToggleVisibleByVisibility(this VisualElement visualElement)
	{
		visualElement.SetVisibleByVisibility(!visualElement.IsVisibleByVisibility());
	}

	public static void ShowByVisibility(this VisualElement visualElement)
	{
		visualElement.style.visibility = new StyleEnum<Visibility>(Visibility.Visible);
	}

	public static void HideByVisibility(this VisualElement visualElement)
	{
		visualElement.style.visibility = new StyleEnum<Visibility>(Visibility.Hidden);
	}

	public static void RegisterCallbackOneShot<TEventType>(this VisualElement visualElement, EventCallback<TEventType> callback, TrickleDown useTrickleDown = TrickleDown.NoTrickleDown) where TEventType : EventBase<TEventType>, new()
	{
		bool wasExecuted = false;
		visualElement.RegisterCallback<TEventType>(RunCallbackIfNotDoneYet, useTrickleDown);
		void RunCallbackIfNotDoneYet(TEventType evt)
		{
			if (!wasExecuted)
			{
				wasExecuted = true;
				callback(evt);
				visualElement.UnregisterCallback<TEventType>(RunCallbackIfNotDoneYet, useTrickleDown);
			}
		}
	}

	public static void SetBackgroundImageAlpha(this VisualElement visualElement, float newAlpha)
	{
		Color unityBackgroundImageTintColor = visualElement.resolvedStyle.unityBackgroundImageTintColor;
		visualElement.style.unityBackgroundImageTintColor = new Color(unityBackgroundImageTintColor.r, unityBackgroundImageTintColor.g, unityBackgroundImageTintColor.b, newAlpha);
	}

	public static void MultiplyBackgroundImageColor(this VisualElement visualElement, float factor, bool includeAlpha = false)
	{
		Color unityBackgroundImageTintColor = visualElement.resolvedStyle.unityBackgroundImageTintColor;
		float r = NumberUtils.Limit(unityBackgroundImageTintColor.r * factor, 0f, 1f);
		float g = NumberUtils.Limit(unityBackgroundImageTintColor.g * factor, 0f, 1f);
		float b = NumberUtils.Limit(unityBackgroundImageTintColor.b * factor, 0f, 1f);
		float a = (includeAlpha ? NumberUtils.Limit(unityBackgroundImageTintColor.a * factor, 0f, 1f) : unityBackgroundImageTintColor.a);
		visualElement.style.unityBackgroundImageTintColor = new Color(r, g, b, a);
	}

	public static void ScrollToSelf(this VisualElement visualElement)
	{
		if (visualElement == null)
		{
			return;
		}
		List<VisualElement> list = new List<VisualElement>();
		list.Add(visualElement);
		list.AddRange(visualElement.GetAncestors());
		list.ForEach((VisualElement ancestor) =>
		{
			if (ancestor.parent is ScrollView scrollView)
			{
				scrollView.ScrollTo(ancestor);
			}
		});
	}

	public static List<VisualElement> GetAncestors(this VisualElement visualElement)
	{
		if (visualElement == null)
		{
			return new List<VisualElement>();
		}
		List<VisualElement> list = new List<VisualElement>();
		for (VisualElement parent = visualElement.parent; parent != null; parent = parent.parent)
		{
			list.Add(parent);
		}
		return list;
	}
}
