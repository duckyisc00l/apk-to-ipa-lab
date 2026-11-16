using UniInject;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class MouseEventScrollControl : MonoBehaviour, INeedInjection
{
	[Inject]
	private UIDocument uiDocument;

	private bool dragging;

	private Vector2 dragStartScrollOffset;

	private Vector2 dragStartPosition;

	public void Start()
	{
		uiDocument.rootVisualElement.Query<ScrollView>().ToList().ForEach((ScrollView scrollView) =>
		{
			VisualElement visualElement = scrollView.Q<VisualElement>("unity-content-viewport");
			visualElement.RegisterCallback((MouseDownEvent evt) =>
			{
				OnMouseDown(evt, scrollView);
			}, TrickleDown.TrickleDown);
			visualElement.RegisterCallback((MouseMoveEvent evt) =>
			{
				OnMouseMove(evt, scrollView);
			}, TrickleDown.TrickleDown);
			visualElement.RegisterCallback((MouseUpEvent evt) =>
			{
				OnMouseUp();
			}, TrickleDown.TrickleDown);
		});
	}

	private void Update()
	{
		if (dragging && Mouse.current != null && !Mouse.current.leftButton.isPressed)
		{
			OnMouseUp();
		}
	}

	private void OnMouseDown(MouseDownEvent evt, ScrollView scrollView)
	{
		if (Touchscreen.current == null)
		{
			dragging = true;
			dragStartPosition = evt.localMousePosition;
			dragStartScrollOffset = scrollView.scrollOffset;
		}
	}

	private void OnMouseMove(MouseMoveEvent evt, ScrollView scrollView)
	{
		if (dragging && !(uiDocument.rootVisualElement.focusController.focusedElement is TextField))
		{
			Vector2 vector = dragStartPosition - evt.localMousePosition;
			scrollView.scrollOffset = new Vector2(dragStartScrollOffset.x + vector.x, dragStartScrollOffset.y + vector.y);
		}
	}

	private void OnMouseUp()
	{
		dragging = false;
	}
}
