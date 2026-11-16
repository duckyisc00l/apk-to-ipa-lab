using System;
using System.Collections.Generic;
using System.Linq;
using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class ContextMenuPopupControl : INeedInjection, IInjectionFinishedListener
{
	private bool wasNoButtonOrTouchPressed;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private ContextMenuPopupManager contextMenuPopupManager;

	[Inject]
	private Injector injector;

	private PanelHelper panelHelper;

	private VisualElement visualElement;

	private readonly GameObject gameObject;

	private readonly Vector2 position;

	private IDisposable closeContextMenuDisposable;

	private Vector2 lastSize;

	private Vector2 lastPosition;

	public static List<ContextMenuPopupControl> OpenContextMenuPopups { get; private set; } = new List<ContextMenuPopupControl>();

	public static bool IsAnyContextMenuPopupOpen => OpenContextMenuPopups.Count > 0;

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		OpenContextMenuPopups = new List<ContextMenuPopupControl>();
	}

	public ContextMenuPopupControl(GameObject gameObject, Vector2 position)
	{
		this.gameObject = gameObject;
		this.position = position;
	}

	public void OnInjectionFinished()
	{
		panelHelper = new PanelHelper(uiDocument);
		visualElement = contextMenuPopupManager.contextMenuUi.CloneTree().Children().First();
		visualElement.style.left = position.x;
		visualElement.style.top = position.y;
		uiDocument.rootVisualElement.Children().First().Add(visualElement);
		visualElement.Clear();
		closeContextMenuDisposable = InputManager.GetInputAction("usplay/closeContextMenu").PerformedAsObservable().Subscribe((InputAction.CallbackContext context) =>
		{
			OnCloseContextMenu(context);
		});
		closeContextMenuDisposable.AddTo(gameObject);
		CloseAllOpenContextMenus();
		OpenContextMenuPopups.Add(this);
		visualElement.RegisterCallback((GeometryChangedEvent evt) =>
		{
			Vector2 vector = new Vector2(visualElement.resolvedStyle.width, visualElement.resolvedStyle.height);
			Vector2 vector2 = new Vector2(visualElement.resolvedStyle.left, visualElement.resolvedStyle.top);
			if (vector != lastSize || vector2 != lastPosition)
			{
				VisualElementUtils.MoveVisualElementFullyInsideScreen(visualElement, panelHelper);
			}
			lastSize = vector;
			lastPosition = vector2;
		});
	}

	private void OnCloseContextMenu(InputAction.CallbackContext context)
	{
		if (wasNoButtonOrTouchPressed && context.ReadValueAsButton())
		{
			Vector2 pointerPositionInPanelCoordinates = InputUtils.GetPointerPositionInPanelCoordinates(panelHelper, invertY: true);
			if (!visualElement.worldBound.Contains(pointerPositionInPanelCoordinates))
			{
				CloseContextMenu();
			}
		}
	}

	public void Update()
	{
		wasNoButtonOrTouchPressed = wasNoButtonOrTouchPressed || !InputUtils.AnyKeyboardOrMouseOrTouchPressed();
	}

	public void AddSeparator()
	{
		VisualElement child = contextMenuPopupManager.contextMenuSeparatorUi.CloneTree().Children().First();
		visualElement.Add(child);
	}

	public void AddItem(string text, Action action)
	{
		VisualElement child = contextMenuPopupManager.contextMenuItemUi.CloneTree().Children().First();
		ContextMenuItemControl contextMenuItemControl = new ContextMenuItemControl(text, action);
		contextMenuItemControl.ItemTriggeredEventStream.Subscribe((bool evt) =>
		{
			CloseContextMenu();
		});
		injector.WithRootVisualElement(child).Inject(contextMenuItemControl);
		visualElement.Add(child);
	}

	public void CloseContextMenu()
	{
		closeContextMenuDisposable.Dispose();
		visualElement.RemoveFromHierarchy();
		OpenContextMenuPopups.Remove(this);
	}

	private static void CloseAllOpenContextMenus()
	{
		OpenContextMenuPopups.ToList().ForEach((ContextMenuPopupControl contextMenu) =>
		{
			contextMenu.CloseContextMenu();
		});
	}
}
