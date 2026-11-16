using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace IngameDebugConsole
{
	public class DebugLogPopup : MonoBehaviour, IPointerClickHandler, IEventSystemHandler, IBeginDragHandler, IDragHandler, IEndDragHandler
	{
		private RectTransform popupTransform;

		private Vector2 halfSize;

		private Image backgroundImage;

		private CanvasGroup canvasGroup;

		[SerializeField]
		private DebugLogManager debugManager;

		[SerializeField]
		private Text newInfoCountText;

		[SerializeField]
		private Text newWarningCountText;

		[SerializeField]
		private Text newErrorCountText;

		[SerializeField]
		private Color alertColorInfo;

		[SerializeField]
		private Color alertColorWarning;

		[SerializeField]
		private Color alertColorError;

		private int newInfoCount;

		private int newWarningCount;

		private int newErrorCount;

		private Color normalColor;

		private bool isPopupBeingDragged;

		private Vector2 normalizedPosition;

		private IEnumerator moveToPosCoroutine;

		private void Awake()
		{
			popupTransform = (RectTransform)base.transform;
			backgroundImage = GetComponent<Image>();
			canvasGroup = GetComponent<CanvasGroup>();
			normalColor = backgroundImage.color;
			halfSize = popupTransform.sizeDelta * 0.5f;
			Vector2 anchoredPosition = popupTransform.anchoredPosition;
			if (anchoredPosition.x != 0f || anchoredPosition.y != 0f)
			{
				normalizedPosition = anchoredPosition.normalized;
			}
			else
			{
				normalizedPosition = new Vector2(0.5f, 0f);
			}
		}

		public void NewLogsArrived(int newInfo, int newWarning, int newError)
		{
			if (newInfo > 0)
			{
				newInfoCount += newInfo;
				newInfoCountText.text = newInfoCount.ToString();
			}
			if (newWarning > 0)
			{
				newWarningCount += newWarning;
				newWarningCountText.text = newWarningCount.ToString();
			}
			if (newError > 0)
			{
				newErrorCount += newError;
				newErrorCountText.text = newErrorCount.ToString();
			}
			if (newErrorCount > 0)
			{
				backgroundImage.color = alertColorError;
			}
			else if (newWarningCount > 0)
			{
				backgroundImage.color = alertColorWarning;
			}
			else
			{
				backgroundImage.color = alertColorInfo;
			}
		}

		private void Reset()
		{
			newInfoCount = 0;
			newWarningCount = 0;
			newErrorCount = 0;
			newInfoCountText.text = "0";
			newWarningCountText.text = "0";
			newErrorCountText.text = "0";
			backgroundImage.color = normalColor;
		}

		private IEnumerator MoveToPosAnimation(Vector2 targetPos)
		{
			float modifier = 0f;
			Vector2 initialPos = popupTransform.anchoredPosition;
			while (modifier < 1f)
			{
				modifier += 4f * Time.unscaledDeltaTime;
				popupTransform.anchoredPosition = Vector2.Lerp(initialPos, targetPos, modifier);
				yield return null;
			}
		}

		public void OnPointerClick(PointerEventData data)
		{
			if (!isPopupBeingDragged)
			{
				debugManager.ShowLogWindow();
			}
		}

		public void Show()
		{
			canvasGroup.blocksRaycasts = true;
			canvasGroup.alpha = 1f;
			Reset();
			UpdatePosition(immediately: true);
		}

		public void Hide()
		{
			canvasGroup.blocksRaycasts = false;
			canvasGroup.alpha = 0f;
			isPopupBeingDragged = false;
		}

		public void OnBeginDrag(PointerEventData data)
		{
			isPopupBeingDragged = true;
			if (moveToPosCoroutine != null)
			{
				StopCoroutine(moveToPosCoroutine);
				moveToPosCoroutine = null;
			}
		}

		public void OnDrag(PointerEventData data)
		{
			if (RectTransformUtility.ScreenPointToLocalPointInRectangle(debugManager.canvasTR, data.position, data.pressEventCamera, out var localPoint))
			{
				popupTransform.anchoredPosition = localPoint;
			}
		}

		public void OnEndDrag(PointerEventData data)
		{
			isPopupBeingDragged = false;
			UpdatePosition(immediately: false);
		}

		public void UpdatePosition(bool immediately)
		{
			Vector2 size = debugManager.canvasTR.rect.size;
			float num = size.x;
			float num2 = size.y;
			float x = 0f;
			float y = 0f;
			if (debugManager.popupAvoidsScreenCutout)
			{
				Rect safeArea = Screen.safeArea;
				int width = Screen.width;
				int height = Screen.height;
				num *= safeArea.width / (float)width;
				num2 *= safeArea.height / (float)height;
				x = size.x * (safeArea.x / (float)width);
				y = size.y * (safeArea.y / (float)height);
			}
			Vector2 vector = size * 0.5f + (immediately ? new Vector2(normalizedPosition.x * num, normalizedPosition.y * num2) : (popupTransform.anchoredPosition - new Vector2(x, y)));
			float x2 = vector.x;
			float num3 = num - x2;
			float y2 = vector.y;
			float num4 = num2 - y2;
			float num5 = Mathf.Min(x2, num3);
			float num6 = Mathf.Min(y2, num4);
			if (num5 < num6)
			{
				vector = ((!(x2 < num3)) ? new Vector2(num - halfSize.x, vector.y) : new Vector2(halfSize.x, vector.y));
				vector.y = Mathf.Clamp(vector.y, halfSize.y, num2 - halfSize.y);
			}
			else
			{
				vector = ((!(y2 < num4)) ? new Vector2(vector.x, num2 - halfSize.y) : new Vector2(vector.x, halfSize.y));
				vector.x = Mathf.Clamp(vector.x, halfSize.x, num - halfSize.x);
			}
			vector -= size * 0.5f;
			normalizedPosition.Set(vector.x / num, vector.y / num2);
			vector += new Vector2(x, y);
			if (moveToPosCoroutine != null)
			{
				StopCoroutine(moveToPosCoroutine);
				moveToPosCoroutine = null;
			}
			if (immediately)
			{
				popupTransform.anchoredPosition = vector;
				return;
			}
			moveToPosCoroutine = MoveToPosAnimation(vector);
			StartCoroutine(moveToPosCoroutine);
		}
	}
}
