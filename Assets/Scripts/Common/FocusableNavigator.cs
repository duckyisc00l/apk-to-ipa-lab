using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UIElements;

public class FocusableNavigator : MonoBehaviour, INeedInjection
{
	[Inject]
	protected UIDocument uiDocument;

	[Inject(Optional = true)]
	protected EventSystem eventSystem;

	public bool focusLastElementIfNothingFocused;

	public bool logFocusedVisualElements;

	protected VisualElement lastFocusedVisualElement;

	protected readonly Subject<NoNavigationTargetFoundEvent> noNavigationTargetFoundEventStream = new Subject<NoNavigationTargetFoundEvent>();

	protected readonly Subject<NoSubmitTargetFoundEvent> noSubmitTargetFoundEventStream = new Subject<NoSubmitTargetFoundEvent>();

	private readonly List<CustomNavigationTarget> customNavigationTargets = new List<CustomNavigationTarget>();

	public VisualElement FocusedVisualElement => uiDocument.rootVisualElement.focusController.focusedElement as VisualElement;

	public IObservable<NoNavigationTargetFoundEvent> NoNavigationTargetFoundEventStream => noNavigationTargetFoundEventStream;

	public IObservable<NoSubmitTargetFoundEvent> NoSubmitTargetFoundEventStream => noSubmitTargetFoundEventStream;

	public virtual void Start()
	{
		if (!base.gameObject.activeInHierarchy)
		{
			return;
		}
		if (eventSystem != null)
		{
			eventSystem.sendNavigationEvents = false;
		}
		if (!focusLastElementIfNothingFocused)
		{
			return;
		}
		NoNavigationTargetFoundEventStream.Subscribe((NoNavigationTargetFoundEvent evt) =>
		{
			if (evt.FocusedVisualElement == null)
			{
				FocusLastFocusedVisualElement();
			}
		});
	}

	protected virtual void Update()
	{
		if (base.gameObject.activeInHierarchy && !(uiDocument == null))
		{
			VisualElement focusedVisualElement = FocusedVisualElement;
			if (focusedVisualElement != null)
			{
				lastFocusedVisualElement = focusedVisualElement;
			}
		}
	}

	public void FocusLastFocusedVisualElement()
	{
		if (lastFocusedVisualElement != null && IsFocusableNow(lastFocusedVisualElement) && logFocusedVisualElements)
		{
			Debug.Log("Moving focus to last focused VisualElement: " + lastFocusedVisualElement);
			lastFocusedVisualElement.Focus();
		}
	}

	public virtual void OnSubmit()
	{
		VisualElement focusedVisualElement = FocusedVisualElement;
		if (focusedVisualElement != null)
		{
			focusedVisualElement.SendEvent(new NavigationSubmitEvent());
		}
		else
		{
			noSubmitTargetFoundEventStream.OnNext(new NoSubmitTargetFoundEvent());
		}
	}

	public virtual void OnNavigate(Vector2 navigationDirection)
	{
		VisualElement focusedVisualElement = FocusedVisualElement;
		if (focusedVisualElement == null)
		{
			noNavigationTargetFoundEventStream.OnNext(new NoNavigationTargetFoundEvent
			{
				NavigationDirection = navigationDirection,
				FocusableNavigatorRootVisualElement = null,
				FocusedVisualElement = null
			});
		}
		else if ((!(focusedVisualElement is TextField focusedTextField) || IsNavigatingAwayFromTextField(navigationDirection, focusedTextField)) && !TryNavigateToCustomNavigationTarget(focusedVisualElement, navigationDirection))
		{
			NavigateToBestMatchingNavigationTarget(focusedVisualElement, navigationDirection);
		}
	}

	private void NavigateToBestMatchingNavigationTarget(VisualElement focusedVisualElement, Vector2 navigationDirection)
	{
		VisualElement focusableNavigatorRootVisualElement = GetFocusableNavigatorRootVisualElement(focusedVisualElement);
		if (focusableNavigatorRootVisualElement == null)
		{
			noNavigationTargetFoundEventStream.OnNext(new NoNavigationTargetFoundEvent
			{
				NavigationDirection = navigationDirection,
				FocusableNavigatorRootVisualElement = null,
				FocusedVisualElement = focusedVisualElement
			});
			return;
		}
		Rect worldBound = focusedVisualElement.worldBound;
		List<VisualElement> focusableVisualElementsInDescendants = GetFocusableVisualElementsInDescendants(focusableNavigatorRootVisualElement);
		focusableVisualElementsInDescendants = focusableVisualElementsInDescendants.Where((VisualElement it) => it != focusedVisualElement).ToList();
		VisualElement visualElement = GetVisualElementsInDirection(worldBound, navigationDirection, focusableVisualElementsInDescendants).FindMinElement((VisualElement visualElementA) => GetVisualElementDistance(visualElementA, focusedVisualElement));
		if (visualElement != null)
		{
			if (logFocusedVisualElements)
			{
				Debug.Log($"Moving focus to VisualElement with distance {GetVisualElementDistance(visualElement, focusedVisualElement)}: {visualElement}");
			}
			visualElement.Focus();
			visualElement.ScrollToSelf();
		}
		else
		{
			noNavigationTargetFoundEventStream.OnNext(new NoNavigationTargetFoundEvent
			{
				NavigationDirection = navigationDirection,
				FocusableNavigatorRootVisualElement = focusableNavigatorRootVisualElement,
				FocusedVisualElement = focusedVisualElement
			});
		}
	}

	private bool TryNavigateToCustomNavigationTarget(VisualElement focusedVisualElement, Vector2 navigationDirection)
	{
		CustomNavigationTarget customNavigationTarget = customNavigationTargets.FirstOrDefault((CustomNavigationTarget customNavigationTarget2) => customNavigationTarget2.Matches(focusedVisualElement, navigationDirection));
		if (customNavigationTarget != null)
		{
			if (logFocusedVisualElements)
			{
				Debug.Log($"Moving focus to VisualElement from custom navigation target (start: {customNavigationTarget.StartVisualElement.name}, direction: {navigationDirection}, target: {customNavigationTarget.TargetVisualElement.name}");
			}
			customNavigationTarget.TargetVisualElement.Focus();
			customNavigationTarget.TargetVisualElement.ScrollToSelf();
			return true;
		}
		return false;
	}

	public void AddCustomNavigationTarget(VisualElement startVisualElement, Vector2 navigationDirection, VisualElement targetVisualElement, bool alsoAddOppositeDirection = false)
	{
		CustomNavigationTarget item = new CustomNavigationTarget(startVisualElement, navigationDirection, targetVisualElement);
		customNavigationTargets.Add(item);
		if (alsoAddOppositeDirection)
		{
			AddCustomNavigationTarget(targetVisualElement, -navigationDirection, startVisualElement);
		}
	}

	private static float GetVisualElementDistance(VisualElement visualElementA, VisualElement visualElementB)
	{
		return RectangleDistance(visualElementA.worldBound, visualElementB.worldBound);
		static float RectangleDistance(Rect rectA, Rect rectB)
		{
			Rect rect = new Rect(Mathf.Min(rectA.xMin, rectB.xMin), Mathf.Min(rectA.yMin, rectB.yMin), Mathf.Max(rectA.xMax, rectB.xMax) - Mathf.Min(rectA.xMin, rectB.xMin), Mathf.Max(rectA.yMax, rectB.yMax) - Mathf.Min(rectA.yMin, rectB.yMin));
			float num = Mathf.Max(0f, rect.width - rectA.width - rectB.width);
			float num2 = Mathf.Max(0f, rect.height - rectA.height - rectB.height);
			return Mathf.Sqrt(num * num + num2 * num2);
		}
	}

	private bool IsNavigatingAwayFromTextField(Vector2 navigationDirection, TextField focusedTextField)
	{
		if (focusedTextField.isReadOnly)
		{
			return true;
		}
		bool num = focusedTextField.cursorIndex == 0 && (navigationDirection.x < 0f || navigationDirection.y > 0f);
		bool flag = focusedTextField.cursorIndex == focusedTextField.value.Length && (navigationDirection.x > 0f || navigationDirection.y < 0f);
		if (num | flag)
		{
			return focusedTextField.selectIndex == focusedTextField.cursorIndex;
		}
		return false;
	}

	protected virtual List<VisualElement> GetFocusableVisualElementsInDescendants(VisualElement rootVisualElement)
	{
		return (from descendant in rootVisualElement.Query<VisualElement>()
			where descendant.tabIndex > 0 || descendant is Button || descendant is Toggle || descendant is DropdownField || descendant is TextField || descendant is MinMaxSlider || descendant is RadioButton
			where IsFocusableNow(descendant)
			select descendant).ToList();
	}

	protected VisualElement GetFocusableNavigatorRootVisualElement()
	{
		return GetFocusableNavigatorRootVisualElement(FocusedVisualElement);
	}

	protected virtual VisualElement GetFocusableNavigatorRootVisualElement(VisualElement visualElement)
	{
		if (visualElement == null)
		{
			return null;
		}
		if (visualElement.ClassListContains("focusableNavigatorRoot"))
		{
			return visualElement;
		}
		return GetFocusableNavigatorRootVisualElement(visualElement.parent);
	}

	protected List<VisualElement> GetVisualElementsInDirection(Rect startRect, Vector2 direction, List<VisualElement> visualElements)
	{
		Vector2 startRectCenter = startRect.center;
		return (from visualElement in visualElements.Where((VisualElement visualElement) =>
			{
				Vector2 vector = visualElement.worldBound.center - startRectCenter;
				float num = Vector2.Angle(direction, new Vector2(vector.x, 0f - vector.y));
				return num < 90f || num > 270f;
			})
			where IsInDirection(visualElement.worldBound)
			select visualElement).ToList();
		bool IsInDirection(Rect rect)
		{
			if (direction.x < 0f)
			{
				return rect.xMax <= startRect.xMin;
			}
			if (direction.x > 0f)
			{
				return rect.xMin >= startRect.xMax;
			}
			if (direction.y <= 0f)
			{
				return rect.yMin >= startRect.yMax;
			}
			if (direction.y > 0f)
			{
				return rect.yMax <= startRect.yMin;
			}
			return false;
		}
	}

	protected bool IsFocusableNow(VisualElement visualElement)
	{
		if (visualElement != null && visualElement.IsVisibleByDisplay() && visualElement.GetAncestors().AllMatch((VisualElement ancestor) => ancestor.IsVisibleByDisplay()) && !float.IsNaN(visualElement.worldBound.center.x) && !float.IsNaN(visualElement.worldBound.center.y) && (visualElement == null || visualElement.focusable) && visualElement.enabledInHierarchy && visualElement.canGrabFocus)
		{
			return !visualElement.ClassListContains("focusableNavigatorIgnore");
		}
		return false;
	}
}
