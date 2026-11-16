using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;

public class ManipulateSentenceDragListener : INeedInjection, IInjectionFinishedListener, IDragListener<NoteAreaDragEvent>
{
	private enum DragAction
	{
		Move = 0,
		StretchRight = 1
	}

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private EditorSentenceControl sentenceControl;

	[Inject]
	private NoteAreaControl noteAreaControl;

	private List<Note> selectedNotes = new List<Note>();

	private List<Note> followingNotes = new List<Note>();

	private readonly Dictionary<Note, Note> noteToSnapshotOfNoteMap = new Dictionary<Note, Note>();

	private int linebreakBeatSnapshot;

	private bool isCanceled;

	private DragAction dragAction;

	public void OnInjectionFinished()
	{
		noteAreaControl.DragControl.AddListener(this);
	}

	public void OnBeginDrag(NoteAreaDragEvent dragEvent)
	{
		if (dragEvent.GeneralDragEvent.InputButton != 0 || !sentenceControl.IsPointerOver)
		{
			AbortDrag();
			return;
		}
		isCanceled = false;
		dragAction = GetDragAction(sentenceControl, dragEvent);
		selectedNotes = sentenceControl.Sentence.Notes.ToList();
		if (selectedNotes.IsNullOrEmpty())
		{
			AbortDrag();
			return;
		}
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
		switch (dragAction)
		{
		case DragAction.Move:
			MoveNotesHorizontal(dragEvent, selectedNotes, adjustFollowingNotesIfNeeded: true);
			break;
		case DragAction.StretchRight:
			ChangeLinebreakBeat(dragEvent);
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
		linebreakBeatSnapshot = sentenceControl.Sentence.LinebreakBeat;
	}

	private DragAction GetDragAction(EditorSentenceControl dragStartSentenceControl, NoteAreaDragEvent dragEvent)
	{
		if (dragStartSentenceControl.IsPositionOverRightHandle(dragEvent.GeneralDragEvent.ScreenCoordinateInPixels.StartPosition))
		{
			return DragAction.StretchRight;
		}
		return DragAction.Move;
	}

	private void MoveNotesHorizontal(NoteAreaDragEvent dragEvent, List<Note> notes, bool adjustFollowingNotesIfNeeded)
	{
		if (notes.IsNullOrEmpty() || dragEvent.BeatDistance == 0)
		{
			return;
		}
		foreach (Note note2 in notes)
		{
			Note note = noteToSnapshotOfNoteMap[note2];
			int newStartBeat = note.StartBeat + dragEvent.BeatDistance;
			int newEndBeat = note.EndBeat + dragEvent.BeatDistance;
			note2.SetStartAndEndBeat(newStartBeat, newEndBeat);
		}
		if (adjustFollowingNotesIfNeeded && settings.SongEditorSettings.AdjustFollowingNotes)
		{
			MoveNotesHorizontal(dragEvent, followingNotes, adjustFollowingNotesIfNeeded: false);
		}
		songMetaChangeEventStream.OnNext(new NotesChangedEvent());
	}

	private void ChangeLinebreakBeat(NoteAreaDragEvent dragEvent)
	{
		if (dragEvent.BeatDistance != 0)
		{
			sentenceControl.Sentence.SetLinebreakBeat(linebreakBeatSnapshot + dragEvent.BeatDistance);
			songMetaChangeEventStream.OnNext(new SentencesChangedEvent());
		}
	}

	public void Dispose()
	{
		noteAreaControl.DragControl.RemoveListener(this);
	}
}
