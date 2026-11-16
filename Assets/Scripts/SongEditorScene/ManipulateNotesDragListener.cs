using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;

public class ManipulateNotesDragListener : INeedInjection, IInjectionFinishedListener, IDragListener<NoteAreaDragEvent>
{
	private enum DragAction
	{
		Move = 0,
		StretchLeft = 1,
		StretchRight = 2
	}

	private enum DragDirection
	{
		Horizontal = 0,
		Vertical = 1
	}

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private SongEditorLayerManager layerManager;

	private List<Note> selectedNotes = new List<Note>();

	private List<Note> followingNotes = new List<Note>();

	private readonly Dictionary<Note, Note> noteToSnapshotOfNoteMap = new Dictionary<Note, Note>();

	private bool isCanceled;

	private DragAction dragAction;

	public void OnInjectionFinished()
	{
		noteAreaControl.DragControl.AddListener(this);
	}

	public void OnBeginDrag(NoteAreaDragEvent dragEvent)
	{
		if (dragEvent.GeneralDragEvent.InputButton != 0)
		{
			AbortDrag();
			return;
		}
		Note note = (from note2 in songEditorSceneControl.GetAllVisibleNotes()
			where note2.IsEditable
			select note2).FirstOrDefault((Note note2) => note2.StartBeat <= dragEvent.PositionInSongInBeatsDragStart && dragEvent.PositionInSongInBeatsDragStart <= note2.EndBeat && note2.MidiNote <= dragEvent.MidiNoteDragStart && dragEvent.MidiNoteDragStart <= note2.MidiNote);
		if (note == null)
		{
			return;
		}
		EditorNoteControl noteControl = editorNoteDisplayer.GetNoteControl(note);
		if (!noteControl.Note.IsEditable)
		{
			return;
		}
		isCanceled = false;
		if (!selectionControl.IsSelected(noteControl.Note))
		{
			selectionControl.SetSelection(new List<EditorNoteControl> { noteControl });
		}
		selectedNotes = selectionControl.GetSelectedNotes();
		if (selectedNotes.IsNullOrEmpty())
		{
			AbortDrag();
			return;
		}
		dragAction = GetDragAction(noteControl, dragEvent);
		if (settings.SongEditorSettings.AdjustFollowingNotes)
		{
			followingNotes = SongMetaUtils.GetFollowingNotes(songMeta, selectedNotes);
		}
		else
		{
			followingNotes.Clear();
		}
		CreateSnapshot(selectedNotes.Union(followingNotes));
	}

	public void OnDrag(NoteAreaDragEvent dragEvent)
	{
		if (selectedNotes.Count <= 0)
		{
			return;
		}
		switch (dragAction)
		{
		case DragAction.Move:
			if (GetDragDirection(dragEvent) == DragDirection.Horizontal)
			{
				MoveNotesHorizontal(dragEvent, selectedNotes, adjustFollowingNotesIfNeeded: true);
			}
			else
			{
				MoveNotesVertical(dragEvent, selectedNotes, adjustFollowingNotesIfNeeded: true);
			}
			break;
		case DragAction.StretchLeft:
			if (InputUtils.IsKeyboardShiftPressed() || selectedNotes.Count == 1)
			{
				ExtendNotesLeft(dragEvent, selectedNotes);
			}
			else
			{
				StretchNotesLeft(dragEvent, selectedNotes);
			}
			break;
		case DragAction.StretchRight:
			if (InputUtils.IsKeyboardShiftPressed() || selectedNotes.Count == 1)
			{
				ExtendNotesRight(dragEvent, selectedNotes, adjustFollowingNotesIfNeeded: true);
			}
			else
			{
				StretchNotesRight(dragEvent, selectedNotes, adjustFollowingNotesIfNeeded: true);
			}
			break;
		default:
			throw new UnityException("Unknown drag action: " + dragAction);
		}
		editorNoteDisplayer.UpdateNotesAndSentences();
	}

	public void OnEndDrag(NoteAreaDragEvent dragEvent)
	{
		if (noteToSnapshotOfNoteMap.Count > 0)
		{
			noteToSnapshotOfNoteMap.Clear();
			songMetaChangeEventStream.OnNext(new NotesChangedEvent());
		}
	}

	private void AbortDrag()
	{
		isCanceled = true;
	}

	public void CancelDrag()
	{
		isCanceled = true;
		foreach (KeyValuePair<Note, Note> item in noteToSnapshotOfNoteMap)
		{
			Note key = item.Key;
			Note value = item.Value;
			key.CopyValues(value);
		}
		noteToSnapshotOfNoteMap.Clear();
		editorNoteDisplayer.UpdateNotesAndSentences();
	}

	public bool IsCanceled()
	{
		return isCanceled;
	}

	private void CreateSnapshot(IEnumerable<Note> notes)
	{
		noteToSnapshotOfNoteMap.Clear();
		foreach (Note note in notes)
		{
			Note value = note.Clone();
			noteToSnapshotOfNoteMap.Add(note, value);
		}
	}

	private DragAction GetDragAction(EditorNoteControl dragStartNoteControl, NoteAreaDragEvent dragEvent)
	{
		if (dragStartNoteControl.IsPositionOverLeftHandle(dragEvent.GeneralDragEvent.ScreenCoordinateInPixels.StartPosition))
		{
			return DragAction.StretchLeft;
		}
		if (dragStartNoteControl.IsPositionOverRightHandle(dragEvent.GeneralDragEvent.ScreenCoordinateInPixels.StartPosition))
		{
			return DragAction.StretchRight;
		}
		return DragAction.Move;
	}

	private DragDirection GetDragDirection(NoteAreaDragEvent dragEvent)
	{
		if (Math.Abs(dragEvent.GeneralDragEvent.ScreenCoordinateInPixels.Distance.y) > Math.Abs(dragEvent.GeneralDragEvent.ScreenCoordinateInPixels.Distance.x))
		{
			return DragDirection.Vertical;
		}
		return DragDirection.Horizontal;
	}

	private void MoveNotesVertical(NoteAreaDragEvent dragEvent, List<Note> notes, bool adjustFollowingNotesIfNeeded)
	{
		foreach (Note note in notes)
		{
			if (noteToSnapshotOfNoteMap.TryGetValue(note, out var value))
			{
				int midiNote = value.MidiNote - dragEvent.MidiNoteDistance;
				note.SetMidiNote(midiNote);
				note.SetStartAndEndBeat(value.StartBeat, value.EndBeat);
			}
		}
		if (adjustFollowingNotesIfNeeded && settings.SongEditorSettings.AdjustFollowingNotes)
		{
			MoveNotesVertical(dragEvent, followingNotes, adjustFollowingNotesIfNeeded: false);
		}
	}

	private void MoveNotesHorizontal(NoteAreaDragEvent dragEvent, List<Note> notes, bool adjustFollowingNotesIfNeeded)
	{
		foreach (Note note in notes)
		{
			if (noteToSnapshotOfNoteMap.TryGetValue(note, out var value))
			{
				int newStartBeat = value.StartBeat + dragEvent.BeatDistance;
				int newEndBeat = value.EndBeat + dragEvent.BeatDistance;
				note.SetMidiNote(value.MidiNote);
				note.SetStartAndEndBeat(newStartBeat, newEndBeat);
			}
		}
		if (adjustFollowingNotesIfNeeded && settings.SongEditorSettings.AdjustFollowingNotes)
		{
			MoveNotesHorizontal(dragEvent, followingNotes, adjustFollowingNotesIfNeeded: false);
		}
	}

	private void ExtendNotesRight(NoteAreaDragEvent dragEvent, List<Note> notes, bool adjustFollowingNotesIfNeeded)
	{
		foreach (Note note in notes)
		{
			if (noteToSnapshotOfNoteMap.TryGetValue(note, out var value))
			{
				int num = value.EndBeat + dragEvent.BeatDistance;
				if (num > value.StartBeat)
				{
					note.SetEndBeat(num);
				}
			}
		}
		if (adjustFollowingNotesIfNeeded && settings.SongEditorSettings.AdjustFollowingNotes)
		{
			MoveNotesHorizontal(dragEvent, followingNotes, adjustFollowingNotesIfNeeded: false);
		}
	}

	private void ExtendNotesLeft(NoteAreaDragEvent dragEvent, List<Note> notes)
	{
		foreach (Note note in notes)
		{
			if (noteToSnapshotOfNoteMap.TryGetValue(note, out var value))
			{
				int num = value.StartBeat + dragEvent.BeatDistance;
				if (num < value.EndBeat)
				{
					note.SetStartBeat(num);
				}
			}
		}
	}

	private void StretchNotesLeft(NoteAreaDragEvent dragEvent, List<Note> notes)
	{
		List<Note> list = (from note in notes
			select (!noteToSnapshotOfNoteMap.TryGetValue(note, out var value2)) ? null : value2 into note
			where note != null
			select note).ToList();
		if (list.IsNullOrEmpty())
		{
			return;
		}
		int num = list.Select((Note note) => note.StartBeat).Min();
		int num2 = list.Select((Note note) => note.EndBeat).Max();
		int num3 = num2;
		int num4 = dragEvent.PositionInSongInBeatsDragStart + dragEvent.BeatDistance;
		float num5 = (float)(dragEvent.PositionInSongInBeatsDragStart - num4) / (float)(num2 - num);
		foreach (Note note in notes)
		{
			if (noteToSnapshotOfNoteMap.TryGetValue(note, out var value))
			{
				float num6 = (float)num3 + (float)(value.StartBeat - num3) * (1f + num5);
				float num7 = (float)num3 + (float)(value.EndBeat - num3) * (1f + num5);
				note.SetStartAndEndBeat((int)num6, (int)num7);
			}
		}
	}

	private void StretchNotesRight(NoteAreaDragEvent dragEvent, List<Note> notes, bool adjustFollowingNotesIfNeeded)
	{
		List<Note> list = (from note in notes
			select (!noteToSnapshotOfNoteMap.TryGetValue(note, out var value2)) ? null : value2 into note
			where note != null
			select note).ToList();
		if (list.IsNullOrEmpty())
		{
			return;
		}
		int num = list.Select((Note note) => note.StartBeat).Min();
		int num2 = list.Select((Note note) => note.EndBeat).Max();
		int num3 = num;
		float num4 = (float)(dragEvent.PositionInSongInBeatsDragStart + dragEvent.BeatDistance - dragEvent.PositionInSongInBeatsDragStart) / (float)(num2 - num);
		foreach (Note note in notes)
		{
			if (noteToSnapshotOfNoteMap.TryGetValue(note, out var value))
			{
				float num5 = (float)num3 + (float)(value.StartBeat - num3) * (1f + num4);
				float num6 = (float)num3 + (float)(value.EndBeat - num3) * (1f + num4);
				note.SetStartAndEndBeat((int)num5, (int)num6);
			}
		}
		if (adjustFollowingNotesIfNeeded && settings.SongEditorSettings.AdjustFollowingNotes)
		{
			MoveNotesHorizontal(dragEvent, followingNotes, adjustFollowingNotesIfNeeded: false);
		}
	}
}
