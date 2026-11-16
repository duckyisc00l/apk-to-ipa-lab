using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;
using UnityEngine.InputSystem.EnhancedTouch;
using UnityEngine.UIElements;

public class NoteAreaSelectionDragListener : INeedInjection, IInjectionFinishedListener, IDragListener<NoteAreaDragEvent>
{
	private static readonly float scrollBorderPercent = 0.05f;

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private NoteAreaDragControl noteAreaDragControl;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongMeta songMeta;

	[Inject(UxmlName = "noteAreaSentences")]
	private VisualElement noteAreaSentences;

	[Inject(UxmlName = "noteAreaSelectionFrame")]
	private VisualElement noteAreaSelectionFrame;

	private bool isCanceled;

	private Vector2 scrollAmount;

	private float lastScrollVerticalTime;

	private NoteAreaDragEvent startDragEvent;

	private NoteAreaDragEvent lastDragEvent;

	public void OnInjectionFinished()
	{
		noteAreaDragControl.AddListener(this);
	}

	public void OnBeginDrag(NoteAreaDragEvent dragEvent)
	{
		isCanceled = false;
		lastDragEvent = dragEvent;
		startDragEvent = dragEvent;
		if (dragEvent.GeneralDragEvent.InputButton != 0)
		{
			CancelDrag();
			return;
		}
		Vector2 startPosition = dragEvent.GeneralDragEvent.ScreenCoordinateInPixels.StartPosition;
		if (editorNoteDisplayer.AnyNoteControlContainsPosition(startPosition))
		{
			CancelDrag();
			return;
		}
		if (editorNoteDisplayer.AnySentenceControlContainsPosition(startPosition))
		{
			CancelDrag();
			return;
		}
		noteAreaSelectionFrame.ShowByDisplay();
		noteAreaSelectionFrame.style.width = 0f;
		noteAreaSelectionFrame.style.height = 0f;
	}

	public void OnDrag(NoteAreaDragEvent dragEvent)
	{
		lastDragEvent = dragEvent;
		UpdateSelectionFrame(dragEvent);
		UpdateSelection(dragEvent);
		UpdateScrollAmount(dragEvent);
		if (Touch.activeTouches.Count > 1)
		{
			CancelDrag();
		}
	}

	public void OnEndDrag(NoteAreaDragEvent dragEvent)
	{
		lastDragEvent = dragEvent;
		scrollAmount = Vector2.zero;
		noteAreaSelectionFrame.HideByDisplay();
	}

	public void CancelDrag()
	{
		scrollAmount = Vector2.zero;
		noteAreaSelectionFrame.HideByDisplay();
		isCanceled = true;
	}

	public bool IsCanceled()
	{
		return isCanceled;
	}

	private void UpdateSelection(NoteAreaDragEvent currentDragEvent)
	{
		int startBeat = GetDragStartBeat();
		int endBeat = GetDragEndBeat(currentDragEvent);
		int startMidiNote = GetDragStartMidiNote();
		int endMidiNote = GetDragEndMidiNote(currentDragEvent);
		List<Note> list = (from note in songEditorSceneControl.GetAllVisibleNotes()
			where IsInSelectionFrame(note, startMidiNote, endMidiNote, startBeat, endBeat)
			select note).ToList();
		if (InputUtils.IsKeyboardShiftPressed())
		{
			if (InputUtils.IsKeyboardControlPressed())
			{
				selectionControl.RemoveFromSelection(list);
			}
			else
			{
				selectionControl.AddToSelection(list);
			}
		}
		else
		{
			selectionControl.SetSelection(list);
		}
	}

	private int GetDragStartBeat()
	{
		return startDragEvent.PositionInSongInBeatsDragStart;
	}

	private int GetDragEndBeat(NoteAreaDragEvent currentDragEvent)
	{
		return noteAreaControl.ScreenPixelPositionToBeat(currentDragEvent.GeneralDragEvent.ScreenCoordinateInPixels.CurrentPosition.x);
	}

	private int GetDragStartMidiNote()
	{
		return startDragEvent.MidiNoteDragStart;
	}

	private int GetDragEndMidiNote(NoteAreaDragEvent currentDragEvent)
	{
		return noteAreaControl.ScreenPixelPositionToMidiNote(currentDragEvent.GeneralDragEvent.ScreenCoordinateInPixels.CurrentPosition.y);
	}

	private bool IsInSelectionFrame(Note note, int startMidiNote, int endMidiNote, int startBeat, int endBeat)
	{
		if (note == null)
		{
			return false;
		}
		if (startMidiNote > endMidiNote)
		{
			ObjectUtils.Swap(ref startMidiNote, ref endMidiNote);
		}
		if (startBeat > endBeat)
		{
			ObjectUtils.Swap(ref startBeat, ref endBeat);
		}
		if (startBeat <= note.StartBeat && note.EndBeat <= endBeat && startMidiNote <= note.MidiNote && note.MidiNote <= endMidiNote)
		{
			return Mathf.Abs(startMidiNote - endMidiNote) > 0;
		}
		return false;
	}

	private void UpdateSelectionFrame(NoteAreaDragEvent currentDragEvent)
	{
		int dragStartBeat = GetDragStartBeat();
		int dragEndBeat = GetDragEndBeat(currentDragEvent);
		int dragStartMidiNote = GetDragStartMidiNote();
		int dragEndMidiNote = GetDragEndMidiNote(currentDragEvent);
		int num = Mathf.Min(dragStartBeat, dragEndBeat);
		int num2 = Mathf.Max(dragStartBeat, dragEndBeat);
		int num3 = Mathf.Min(dragStartMidiNote, dragEndMidiNote);
		int num4 = Mathf.Max(dragStartMidiNote, dragEndMidiNote);
		float num5 = (float)noteAreaControl.GetHorizontalPositionForBeat(num);
		float num6 = (float)noteAreaControl.GetVerticalPositionForMidiNote(num3);
		float num7 = (float)(num2 - num) / (float)noteAreaControl.ViewportWidthInBeats;
		float num8 = (float)(num4 - num3) / (float)noteAreaControl.ViewportHeight;
		noteAreaSelectionFrame.style.left = new StyleLength(new Length(num5 * 100f, LengthUnit.Percent));
		noteAreaSelectionFrame.style.top = new StyleLength(new Length((num6 - num8) * 100f, LengthUnit.Percent));
		noteAreaSelectionFrame.style.width = new StyleLength(new Length(num7 * 100f, LengthUnit.Percent));
		noteAreaSelectionFrame.style.height = new StyleLength(new Length(num8 * 100f, LengthUnit.Percent));
	}

	private void UpdateScrollAmount(NoteAreaDragEvent dragEvent)
	{
		int num = 200;
		num += (int)(Math.Abs(dragEvent.GeneralDragEvent.LocalCoordinateInPercent.Distance.x) - scrollBorderPercent) * 1000;
		int num2 = 1;
		if (dragEvent.GeneralDragEvent.LocalCoordinateInPercent.CurrentPosition.x > 1f - scrollBorderPercent)
		{
			scrollAmount = new Vector2(num, scrollAmount.y);
		}
		else if (dragEvent.GeneralDragEvent.LocalCoordinateInPercent.CurrentPosition.x < scrollBorderPercent)
		{
			scrollAmount = new Vector2(-num, scrollAmount.y);
		}
		else
		{
			scrollAmount = new Vector2(0f, scrollAmount.y);
		}
		if (dragEvent.GeneralDragEvent.LocalCoordinateInPercent.CurrentPosition.y > 1f - scrollBorderPercent)
		{
			scrollAmount = new Vector2(scrollAmount.x, num2);
		}
		else if (dragEvent.GeneralDragEvent.LocalCoordinateInPercent.CurrentPosition.y < scrollBorderPercent)
		{
			scrollAmount = new Vector2(scrollAmount.x, -num2);
		}
		else
		{
			scrollAmount = new Vector2(scrollAmount.x, 0f);
		}
	}

	public void UpdateAutoScroll()
	{
		if (scrollAmount.x != 0f)
		{
			noteAreaControl.SetViewportX(noteAreaControl.ViewportX + (int)scrollAmount.x);
		}
		if (scrollAmount.y != 0f && lastScrollVerticalTime + 0.1f < Time.time)
		{
			lastScrollVerticalTime = Time.time;
			noteAreaControl.SetViewportY(noteAreaControl.ViewportY - (int)scrollAmount.y);
		}
		if (scrollAmount.x != 0f || scrollAmount.y != 0f)
		{
			UpdateSelectionFrame(lastDragEvent);
			UpdateSelection(lastDragEvent);
		}
	}
}
