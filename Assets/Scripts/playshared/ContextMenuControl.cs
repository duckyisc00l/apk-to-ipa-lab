using System;
using System.Collections.Generic;
using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.EnhancedTouch;
using UnityEngine.UIElements;

public class ContextMenuControl : INeedInjection, IInjectionFinishedListener, IDisposable
{
	private static readonly Vector2 popupOffset = new Vector2(2f, 2f);

	[Inject(Key = "rootVisualElement")]
	protected VisualElement targetVisualElement;

	[Inject]
	protected UIDocument uiDocument;

	[Inject]
	protected GameObject gameObject;

	[Inject]
	protected Injector injector;

	protected PanelHelper panelHelper;

	private bool isDrag;

	private bool isPointerDown;

	private Vector2 pointerDownPosition;

	private readonly List<IDisposable> disposables = new List<IDisposable>();

	public Action<ContextMenuPopupControl> FillContextMenuAction { get; set; }

	public virtual void OnInjectionFinished()
	{
		panelHelper = new PanelHelper(uiDocument);
		uiDocument.rootVisualElement.RegisterCallback((PointerDownEvent evt) =>
		{
			OnPointerDown(evt);
		}, TrickleDown.TrickleDown);
		uiDocument.rootVisualElement.RegisterCallback((PointerMoveEvent evt) =>
		{
			OnPointerMove(evt);
		}, TrickleDown.TrickleDown);
		uiDocument.rootVisualElement.RegisterCallback((PointerUpEvent evt) =>
		{
			OnPointerUp();
		}, TrickleDown.TrickleDown);
		disposables.Add(InputManager.GetInputAction("usplay/openContextMenu").PerformedAsObservable().Subscribe(CheckOpenContextMenuFromInputAction)
			.AddTo(gameObject));
	}

	private void OnPointerDown(IPointerEvent evt)
	{
		isDrag = false;
		isPointerDown = true;
		pointerDownPosition = evt.position;
	}

	private void OnPointerMove(IPointerEvent evt)
	{
		if (isPointerDown && Vector2.Distance(evt.position, pointerDownPosition) > 5f)
		{
			isDrag = true;
		}
	}

	private void OnPointerUp()
	{
		isPointerDown = false;
		isDrag = false;
	}

	protected virtual void CheckOpenContextMenuFromInputAction(InputAction.CallbackContext context)
	{
		if (Pointer.current != null && context.ReadValueAsButton() && UnityEngine.InputSystem.EnhancedTouch.Touch.activeTouches.Count < 2 && !isDrag)
		{
			Vector2 pointerPositionInPanelCoordinates = InputUtils.GetPointerPositionInPanelCoordinates(panelHelper, invertY: true);
			if (targetVisualElement.worldBound.Contains(pointerPositionInPanelCoordinates))
			{
				OpenContextMenu(pointerPositionInPanelCoordinates + popupOffset);
			}
		}
	}

	public void OpenContextMenu(Vector2 position)
	{
		if (FillContextMenuAction != null)
		{
			ContextMenuPopupControl contextMenuPopupControl = new ContextMenuPopupControl(gameObject, position);
			injector.Inject(contextMenuPopupControl);
			FillContextMenuAction(contextMenuPopupControl);
		}
	}

	public void Dispose()
	{
		disposables.ForEach((IDisposable disposable) =>
		{
			disposable.Dispose();
		});
	}
}
