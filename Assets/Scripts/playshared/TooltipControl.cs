using System.Collections;
using System.Linq;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class TooltipControl : INeedInjection, IInjectionFinishedListener
{
	private static readonly float defaultShowDelayInSeconds = 1f;

	private static readonly float defaultCloseDelayInSeconds = 0.2f;

	private static readonly Vector2 tooltipOffsetInPx = new Vector2(10f, 10f);

	private static readonly float showTooltipOnPointerDownTimeInSeconds = 4f;

	[Inject(Key = "rootVisualElement")]
	private VisualElement target;

	[Inject]
	private UIDocument uiDocument;

	private Label label;

	private PanelHelper panelHelper;

	private IEnumerator showTooltipCoroutine;

	private IEnumerator closeTooltipCoroutine;

	private bool showTooltipByPointerDown;

	public float ShowDelayInSeconds { get; set; } = defaultShowDelayInSeconds;

	public float CloseDelayInSeconds { get; set; } = defaultCloseDelayInSeconds;

	public string TooltipText { get; set; }

	public void OnInjectionFinished()
	{
		panelHelper = new PanelHelper(uiDocument);
		target.RegisterCallback((PointerEnterEvent evt) =>
		{
			OnPointerEnter();
		});
		target.RegisterCallback((PointerLeaveEvent evt) =>
		{
			OnPointerExit();
		});
		target.RegisterCallback((PointerDownEvent evt) =>
		{
			OnPointerDown();
		});
	}

	private void OnPointerDown()
	{
		showTooltipByPointerDown = true;
		ShowTooltip();
		uiDocument.StartCoroutine(CoroutineUtils.ExecuteAfterDelayInSeconds(showTooltipOnPointerDownTimeInSeconds, () =>
		{
			showTooltipByPointerDown = false;
			CloseTooltip();
		}));
	}

	private void OnPointerEnter()
	{
		if (showTooltipByPointerDown)
		{
			return;
		}
		if (closeTooltipCoroutine != null)
		{
			uiDocument.StopCoroutine(closeTooltipCoroutine);
		}
		showTooltipCoroutine = CoroutineUtils.ExecuteAfterDelayInSeconds(ShowDelayInSeconds, () =>
		{
			if (!showTooltipByPointerDown)
			{
				ShowTooltip();
			}
		});
		uiDocument.StartCoroutine(showTooltipCoroutine);
	}

	private void OnPointerExit()
	{
		if (!showTooltipByPointerDown)
		{
			if (showTooltipCoroutine != null)
			{
				uiDocument.StopCoroutine(showTooltipCoroutine);
			}
			closeTooltipCoroutine = CoroutineUtils.ExecuteAfterDelayInSeconds(CloseDelayInSeconds, () =>
			{
				CloseTooltip();
			});
			uiDocument.StartCoroutine(closeTooltipCoroutine);
		}
	}

	public void CloseTooltip()
	{
		if (label != null)
		{
			label.RemoveFromHierarchy();
		}
	}

	public void ShowTooltip()
	{
		CloseTooltip();
		if (!TooltipText.IsNullOrEmpty())
		{
			Vector2 vector = InputUtils.GetPointerPositionInPanelCoordinates(panelHelper, invertY: true) + tooltipOffsetInPx;
			label = new Label();
			label.AddToClassList("tooltip");
			label.pickingMode = PickingMode.Ignore;
			label.text = TooltipText;
			label.style.position = new StyleEnum<Position>(Position.Absolute);
			label.style.left = vector.x;
			label.style.top = vector.y;
			uiDocument.rootVisualElement.Children().First().Add(label);
			label.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
			{
				VisualElementUtils.MoveVisualElementFullyInsideScreen(label, panelHelper);
			});
		}
	}
}
