using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UIElements;

public class SongEntryPlaceholderControl : ISlotListSlot
{
	public class SongEntryPlaceholderComparerByCenterDistance : IComparer<SongEntryPlaceholderControl>
	{
		public int Compare(SongEntryPlaceholderControl a, SongEntryPlaceholderControl b)
		{
			if (a == null && b == null)
			{
				return 0;
			}
			if (a == null)
			{
				return -1;
			}
			if (b == null)
			{
				return 1;
			}
			float num = Mathf.Abs(400f - a.VisualElement.worldBound.center.x);
			float value = Mathf.Abs(400f - b.VisualElement.worldBound.center.x);
			return num.CompareTo(value);
		}
	}

	public class SongEntryPlaceholderComparerByPosition : IComparer<SongEntryPlaceholderControl>
	{
		public int Compare(SongEntryPlaceholderControl a, SongEntryPlaceholderControl b)
		{
			if (a == null && b == null)
			{
				return 0;
			}
			if (a == null)
			{
				return -1;
			}
			if (b == null)
			{
				return 1;
			}
			return a.GetPosition().x.CompareTo(b.GetPosition().x);
		}
	}

	public static readonly IComparer<SongEntryPlaceholderControl> comparerByCenterDistance = new SongEntryPlaceholderComparerByCenterDistance();

	public static readonly IComparer<SongEntryPlaceholderControl> comparerByPosition = new SongEntryPlaceholderComparerByPosition();

	private ISlotListSlot nextSlot;

	private ISlotListSlot previousSlot;

	public VisualElement VisualElement { get; private set; }

	public SongEntryPlaceholderControl(VisualElement visualElement)
	{
		VisualElement = visualElement;
	}

	public void SetNeighborSlots(ISlotListSlot previousSlot, ISlotListSlot nextSlot)
	{
		this.previousSlot = previousSlot;
		this.nextSlot = nextSlot;
	}

	public Vector2 GetSize()
	{
		Vector2 result = VisualElement.contentRect.size;
		if (float.IsNaN(result.x) || float.IsNaN(result.y))
		{
			result = new Vector2(VisualElement.style.width.value.value, VisualElement.style.height.value.value);
		}
		return result;
	}

	public Vector2 GetPosition()
	{
		Vector2 result = new Vector2(VisualElement.resolvedStyle.left, VisualElement.resolvedStyle.top);
		if (float.IsNaN(result.x) || float.IsNaN(result.y))
		{
			result = new Vector2(VisualElement.style.left.value.value, VisualElement.style.top.value.value);
		}
		return result;
	}

	public ISlotListSlot GetNextSlot()
	{
		return nextSlot;
	}

	public ISlotListSlot GetPreviousSlot()
	{
		return previousSlot;
	}

	public int GetCenterDistanceIndex(List<SongEntryPlaceholderControl> allPlaceholderControls, SongEntryPlaceholderControl centerPlaceholderControl)
	{
		if (this == centerPlaceholderControl)
		{
			return 0;
		}
		float currentX = GetPosition().x;
		float centerX = centerPlaceholderControl.GetPosition().x;
		if (currentX < centerX)
		{
			return -(allPlaceholderControls.Where((SongEntryPlaceholderControl it) => currentX < it.GetPosition().x && it.GetPosition().x < centerX).ToList().Count + 1);
		}
		return allPlaceholderControls.Where((SongEntryPlaceholderControl it) => centerX < it.GetPosition().x && it.GetPosition().x < currentX).ToList().Count + 1;
	}
}
