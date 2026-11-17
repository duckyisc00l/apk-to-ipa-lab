using System;
using System.Collections.Generic;
using UniRx;
using UnityEngine;

public class SlotListControl
{
	private float offsetPositionPercent;

	private ESlotListDirection offsetDirection;

	private readonly Subject<SlotChangeEvent> slotChangeEventStream = new Subject<SlotChangeEvent>();

	public List<ISlotListItem> ListItems { get; private set; } = new List<ISlotListItem>();

	public IObservable<SlotChangeEvent> SlotChangeEventStream => slotChangeEventStream;

	public void OnDrag(ISlotListItem listItem, Vector2 dragDelta)
	{
		offsetDirection = CalculateOffsetDirection(listItem, dragDelta);
		ISlotListSlot targetSlot = GetTargetSlot(listItem, offsetDirection);
		offsetPositionPercent = ((targetSlot != null) ? CalculateOffsetPositionPercent(listItem.GetPosition(), dragDelta, listItem.GetCurrentSlot().GetPosition(), targetSlot.GetPosition()) : 0f);
		foreach (ISlotListItem listItem2 in ListItems)
		{
			ApplyOffsetPositionPercent(listItem2);
		}
		if (offsetPositionPercent >= 0.6f)
		{
			slotChangeEventStream.OnNext(new SlotChangeEvent(offsetDirection, offsetPositionPercent));
		}
	}

	public void ApplyOffsetPositionPercent(ISlotListItem listItem)
	{
		ISlotListSlot currentSlot = listItem.GetCurrentSlot();
		ISlotListSlot targetSlot = GetTargetSlot(listItem, offsetDirection);
		if (targetSlot != null)
		{
			Vector2 position = currentSlot.GetPosition() + (targetSlot.GetPosition() - currentSlot.GetPosition()) * offsetPositionPercent;
			listItem.SetPosition(position);
		}
		else
		{
			listItem.SetPosition(currentSlot.GetPosition());
		}
	}

	private float CalculateOffsetPositionPercent(Vector2 currentPosition, Vector2 dragDelta, Vector2 originalPosition, Vector2 targetPosition)
	{
		Vector2 vector = targetPosition - originalPosition;
		Vector2 vector2 = Vector3.Project(dragDelta, vector);
		float num = Vector2.Distance(currentPosition + vector2, originalPosition);
		float num2 = Vector2.Distance(originalPosition, targetPosition);
		return num / num2;
	}

	private ESlotListDirection CalculateOffsetDirection(ISlotListItem listItem, Vector2 dragDelta)
	{
		if (listItem == null)
		{
			return ESlotListDirection.None;
		}
		Vector2 b = listItem.GetPosition() + dragDelta;
		ISlotListSlot currentSlot = listItem.GetCurrentSlot();
		if (currentSlot == null)
		{
			return ESlotListDirection.None;
		}
		ISlotListSlot nextSlot = currentSlot.GetNextSlot();
		if (nextSlot != null)
		{
			float num = Vector2.Distance(nextSlot.GetPosition(), currentSlot.GetPosition());
			if (Vector2.Distance(nextSlot.GetPosition(), b) < num)
			{
				return ESlotListDirection.TowardsNextSlot;
			}
		}
		ISlotListSlot previousSlot = currentSlot.GetPreviousSlot();
		if (previousSlot != null)
		{
			float num2 = Vector2.Distance(previousSlot.GetPosition(), currentSlot.GetPosition());
			if (Vector2.Distance(previousSlot.GetPosition(), b) < num2)
			{
				return ESlotListDirection.TowardsPreviousSlot;
			}
		}
		return ESlotListDirection.None;
	}

	public void InterpolateSize(ISlotListItem listItem)
	{
		ISlotListSlot currentSlot = listItem.GetCurrentSlot();
		if (currentSlot != null)
		{
			ESlotListDirection direction = CalculateOffsetDirection(listItem, Vector2.zero);
			ISlotListSlot targetSlot = GetTargetSlot(listItem, direction);
			if (targetSlot == null)
			{
				listItem.SetSize(currentSlot.GetSize());
				return;
			}
			float offsetPercent = CalculateOffsetPositionPercent(listItem.GetPosition(), Vector2.zero, currentSlot.GetPosition(), targetSlot.GetPosition());
			InterpolateSize(listItem, targetSlot, offsetPercent);
		}
	}

	private ISlotListSlot GetTargetSlot(ISlotListItem listItem, ESlotListDirection direction)
	{
		return direction switch
		{
			ESlotListDirection.None => null, 
			ESlotListDirection.TowardsNextSlot => listItem.GetCurrentSlot().GetNextSlot(), 
			ESlotListDirection.TowardsPreviousSlot => listItem.GetCurrentSlot().GetPreviousSlot(), 
			_ => null, 
		};
	}

	private void InterpolateSize(ISlotListItem listItem, ISlotListSlot targetSlot, float offsetPercent)
	{
		Vector2 size = listItem.GetCurrentSlot().GetSize();
		if (targetSlot == null || offsetPercent.NearlyEquals(0f, 0.001f))
		{
			listItem.SetSize(size);
			return;
		}
		Vector2 size2 = targetSlot.GetSize();
		Vector2 size3 = Vector2.Lerp(size, size2, offsetPercent);
		listItem.SetSize(size3);
	}
}
