using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace IngameDebugConsole
{
	public class DebugsOnScrollListener : MonoBehaviour, IScrollHandler, IEventSystemHandler, IBeginDragHandler, IEndDragHandler
	{
		public ScrollRect debugsScrollRect;

		public DebugLogManager debugLogManager;

		public void OnScroll(PointerEventData data)
		{
			if (IsScrollbarAtBottom())
			{
				debugLogManager.SetSnapToBottom(snapToBottom: true);
			}
			else
			{
				debugLogManager.SetSnapToBottom(snapToBottom: false);
			}
		}

		public void OnBeginDrag(PointerEventData data)
		{
			debugLogManager.SetSnapToBottom(snapToBottom: false);
		}

		public void OnEndDrag(PointerEventData data)
		{
			if (IsScrollbarAtBottom())
			{
				debugLogManager.SetSnapToBottom(snapToBottom: true);
			}
			else
			{
				debugLogManager.SetSnapToBottom(snapToBottom: false);
			}
		}

		public void OnScrollbarDragStart(BaseEventData data)
		{
			debugLogManager.SetSnapToBottom(snapToBottom: false);
		}

		public void OnScrollbarDragEnd(BaseEventData data)
		{
			if (IsScrollbarAtBottom())
			{
				debugLogManager.SetSnapToBottom(snapToBottom: true);
			}
			else
			{
				debugLogManager.SetSnapToBottom(snapToBottom: false);
			}
		}

		private bool IsScrollbarAtBottom()
		{
			if (debugsScrollRect.verticalNormalizedPosition <= 1E-06f)
			{
				return true;
			}
			return false;
		}
	}
}
