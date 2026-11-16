using System;
using UnityEngine.UIElements;

public class VisualElementPool<T> : ObjectPool<T> where T : VisualElement
{
	public VisualElementPool()
		: base((Action<T>)VisualElementExtensions.HideByDisplay, (Action<T>)VisualElementExtensions.ShowByDisplay)
	{
	}
}
