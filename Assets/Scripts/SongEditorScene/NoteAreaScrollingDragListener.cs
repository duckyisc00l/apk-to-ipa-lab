using System;
using UniInject;
using UnityEngine;
using UnityEngine.InputSystem.EnhancedTouch;

public class NoteAreaScrollingDragListener : INeedInjection, IInjectionFinishedListener, IDragListener<NoteAreaDragEvent>
{
	private const float TouchGestureMoveInSameDirectionThreshold = 100f;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private NoteAreaDragControl noteAreaDragControl;

	private int viewportXBeginDrag;

	private int viewportYBeginDrag;

	private bool isCanceled;

	private float twoFingerGestureStartDistance;

	public void OnInjectionFinished()
	{
		noteAreaDragControl.AddListener(this);
	}

	public void OnBeginDrag(NoteAreaDragEvent dragEvent)
	{
		isCanceled = false;
		if (dragEvent.GeneralDragEvent.InputButton != 2 && Touch.activeTouches.Count == 0)
		{
			CancelDrag();
			return;
		}
		twoFingerGestureStartDistance = -1f;
		viewportXBeginDrag = noteAreaControl.ViewportX;
		viewportYBeginDrag = noteAreaControl.ViewportY;
	}

	public void OnDrag(NoteAreaDragEvent dragEvent)
	{
		if (dragEvent.GeneralDragEvent.InputButton != 2 && Touch.activeTouches.Count < 2)
		{
			return;
		}
		if (Touch.activeTouches.Count == 2)
		{
			if (twoFingerGestureStartDistance < 0f)
			{
				twoFingerGestureStartDistance = Vector2.Distance(Touch.activeTouches[0].screenPosition, Touch.activeTouches[1].screenPosition);
			}
			else if (Math.Abs(Vector2.Distance(Touch.activeTouches[0].screenPosition, Touch.activeTouches[1].screenPosition) - twoFingerGestureStartDistance) > 100f)
			{
				CancelDrag();
				return;
			}
		}
		int newViewportX = viewportXBeginDrag - dragEvent.MillisDistance;
		int newViewportY = viewportYBeginDrag + dragEvent.MidiNoteDistance;
		noteAreaControl.SetViewport(newViewportX, newViewportY, noteAreaControl.ViewportWidth, noteAreaControl.ViewportHeight);
	}

	public void OnEndDrag(NoteAreaDragEvent dragEvent)
	{
	}

	public void CancelDrag()
	{
		isCanceled = true;
	}

	public bool IsCanceled()
	{
		return isCanceled;
	}
}
