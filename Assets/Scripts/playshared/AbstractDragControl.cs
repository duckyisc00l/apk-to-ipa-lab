using System;
using System.Collections.Generic;
using System.Linq;
using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public abstract class AbstractDragControl<EVENT> : INeedInjection, IInjectionFinishedListener, IDisposable
{
	private readonly List<IDragListener<EVENT>> dragListeners = new List<IDragListener<EVENT>>();

	private EVENT dragStartEvent;

	private int pointerId;

	private DragControlPointerEvent dragControlPointerDownEvent;

	[Inject(Key = "rootVisualElement")]
	protected VisualElement targetVisualElement;

	[Inject]
	protected UIDocument uiDocument;

	[Inject]
	protected GameObject gameObject;

	protected PanelHelper panelHelper;

	private readonly List<IDisposable> disposables = new List<IDisposable>();

	public bool IsDragging => DragState.Value == EDragState.Dragging;

	public bool IsCanceled => DragState.Value == EDragState.Canceled;

	public ReactiveProperty<EDragState> DragState { get; private set; } = new ReactiveProperty<EDragState>(EDragState.WaitingForPointerDown);

	public IReadOnlyCollection<int> ButtonFilter { get; set; } = new List<int> { 0, 1, 2 };

	public virtual void OnInjectionFinished()
	{
		panelHelper = new PanelHelper(uiDocument);
		targetVisualElement.RegisterCallback<PointerDownEvent>(OnPointerDown, TrickleDown.TrickleDown);
		uiDocument.rootVisualElement.RegisterCallback<PointerMoveEvent>(OnPointerMove, TrickleDown.TrickleDown);
		uiDocument.rootVisualElement.RegisterCallback<PointerUpEvent>(OnPointerUp, TrickleDown.TrickleDown);
		disposables.Add((from _ in InputManager.GetInputAction("usplay/back").PerformedAsObservable(10)
			where IsDragging
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			CancelDrag();
			InputManager.GetInputAction("usplay/back").CancelNotifyForThisFrame();
		}).AddTo(gameObject));
	}

	protected abstract EVENT CreateDragEventStart(DragControlPointerEvent eventData);

	protected abstract EVENT CreateDragEvent(DragControlPointerEvent eventData, EVENT dragStartEvent);

	public void AddListener(IDragListener<EVENT> listener)
	{
		dragListeners.Add(listener);
	}

	public void RemoveListener(IDragListener<EVENT> listener)
	{
		dragListeners.Remove(listener);
	}

	protected virtual void OnPointerDown(IPointerEvent evt)
	{
		if (ButtonFilter.IsNullOrEmpty() || ButtonFilter.Contains(evt.button))
		{
			dragControlPointerDownEvent = new DragControlPointerEvent(evt);
			DragState.Value = EDragState.WaitingForDistanceThreshold;
		}
	}

	protected virtual void OnPointerMove(IPointerEvent evt)
	{
		if (DragState.Value == EDragState.WaitingForDistanceThreshold)
		{
			if (Vector2.Distance(evt.position, dragControlPointerDownEvent.Position) > 5f)
			{
				OnBeginDrag(dragControlPointerDownEvent);
			}
		}
		else if (DragState.Value == EDragState.Dragging)
		{
			OnDrag(new DragControlPointerEvent(evt));
		}
	}

	protected virtual void OnPointerUp(IPointerEvent evt)
	{
		if (ButtonFilter.IsNullOrEmpty() || ButtonFilter.Contains(evt.button))
		{
			if (DragState.Value == EDragState.Dragging)
			{
				OnEndDrag(new DragControlPointerEvent(evt));
			}
			DragState.Value = EDragState.WaitingForPointerDown;
		}
	}

	protected virtual void OnBeginDrag(DragControlPointerEvent eventData)
	{
		if (!IsDragging)
		{
			DragState.Value = EDragState.Dragging;
			pointerId = eventData.PointerId;
			dragStartEvent = CreateDragEventStart(eventData);
			NotifyListeners((IDragListener<EVENT> listener) =>
			{
				listener.OnBeginDrag(dragStartEvent);
			}, includeCanceledListeners: true);
		}
	}

	protected virtual void OnDrag(DragControlPointerEvent eventData)
	{
		if (DragState.Value != EDragState.Canceled && IsDragging && eventData.PointerId == pointerId)
		{
			EVENT dragEvent = CreateDragEvent(eventData, dragStartEvent);
			NotifyListeners((IDragListener<EVENT> listener) =>
			{
				listener.OnDrag(dragEvent);
			}, includeCanceledListeners: false);
		}
	}

	protected virtual void OnEndDrag(DragControlPointerEvent eventData)
	{
		if (DragState.Value == EDragState.Dragging && eventData.PointerId == pointerId)
		{
			EVENT dragEvent = CreateDragEvent(eventData, dragStartEvent);
			NotifyListeners((IDragListener<EVENT> listener) =>
			{
				listener.OnEndDrag(dragEvent);
			}, includeCanceledListeners: false);
			DragState.Value = EDragState.WaitingForPointerDown;
		}
	}

	public virtual void CancelDrag()
	{
		if (DragState.Value != EDragState.Canceled)
		{
			DragState.Value = EDragState.Canceled;
			NotifyListeners((IDragListener<EVENT> listener) =>
			{
				listener.CancelDrag();
			}, includeCanceledListeners: false);
		}
	}

	protected void NotifyListeners(Action<IDragListener<EVENT>> action, bool includeCanceledListeners)
	{
		foreach (IDragListener<EVENT> item in dragListeners.ToList())
		{
			if (includeCanceledListeners || !item.IsCanceled())
			{
				action(item);
			}
		}
	}

	protected GeneralDragEvent CreateGeneralDragEvent(DragControlPointerEvent eventData, GeneralDragEvent localDragStartEvent)
	{
		Vector2 vector = new Vector2(eventData.Position.x, eventData.Position.y) - localDragStartEvent.ScreenCoordinateInPixels.StartPosition;
		Vector2 vector2 = eventData.DeltaPosition;
		float width = targetVisualElement.worldBound.width;
		float height = targetVisualElement.worldBound.height;
		Vector2 vector3 = (Vector2)eventData.Position - targetVisualElement.worldBound.position - localDragStartEvent.LocalCoordinateInPixels.StartPosition;
		return new GeneralDragEvent(new DragCoordinate(localDragStartEvent.ScreenCoordinateInPixels.StartPosition, vector, vector2), CreateDragCoordinateInPercent(localDragStartEvent.ScreenCoordinateInPixels.StartPosition, vector, vector2, ApplicationUtils.GetScreenSizeInPanelCoordinates(panelHelper)), new DragCoordinate(localDragStartEvent.LocalCoordinateInPixels.StartPosition, vector3, vector2), CreateDragCoordinateInPercent(localDragStartEvent.LocalCoordinateInPixels.StartPosition, vector3, vector2, new Vector2(width, height)), localDragStartEvent.InputButton);
	}

	protected GeneralDragEvent CreateGeneralDragEventStart(DragControlPointerEvent eventData)
	{
		Vector2 vector = new Vector2(eventData.Position.x, eventData.Position.y);
		float width = targetVisualElement.contentRect.width;
		float height = targetVisualElement.contentRect.height;
		Vector2 vector2 = (Vector2)eventData.Position - targetVisualElement.worldBound.position;
		return new GeneralDragEvent(new DragCoordinate(vector, Vector2.zero, Vector2.zero), CreateDragCoordinateInPercent(vector, Vector2.zero, Vector2.zero, ApplicationUtils.GetScreenSizeInPanelCoordinates(panelHelper)), new DragCoordinate(vector2, Vector2.zero, Vector2.zero), CreateDragCoordinateInPercent(vector2, Vector2.zero, Vector2.zero, new Vector2(width, height)), eventData.Button);
	}

	private DragCoordinate CreateDragCoordinateInPercent(Vector2 startPosInPixels, Vector2 distanceInPixels, Vector2 deltaInPixels, Vector2 fullSize)
	{
		Vector2 startPosition = startPosInPixels / fullSize;
		Vector2 distance = distanceInPixels / fullSize;
		Vector2 dragDelta = deltaInPixels / fullSize;
		return new DragCoordinate(startPosition, distance, dragDelta);
	}

	public void Dispose()
	{
		if (targetVisualElement != null)
		{
			targetVisualElement.UnregisterCallback<PointerDownEvent>(OnPointerDown, TrickleDown.TrickleDown);
		}
		if (uiDocument != null && uiDocument.rootVisualElement != null)
		{
			uiDocument.rootVisualElement.UnregisterCallback<PointerMoveEvent>(OnPointerMove, TrickleDown.TrickleDown);
			uiDocument.rootVisualElement.UnregisterCallback<PointerUpEvent>(OnPointerUp, TrickleDown.TrickleDown);
		}
		disposables.ForEach((IDisposable it) =>
		{
			it.Dispose();
		});
	}
}
