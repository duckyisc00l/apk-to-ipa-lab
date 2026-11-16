using System.Collections.Generic;
using System.Linq;
using UniInject;

public class NoteAreaContextMenuControl : ContextMenuControl
{
	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject]
	private AddNoteAction addNoteAction;

	[Inject]
	private SetMusicGapAction setMusicGapAction;

	[Inject]
	private SongEditorCopyPasteManager songEditorCopyPasteManager;

	[Inject]
	private NoteAreaDragControl noteAreaDragControl;

	public override void OnInjectionFinished()
	{
		base.OnInjectionFinished();
		base.FillContextMenuAction = FillContextMenu;
	}

	private void FillContextMenu(ContextMenuPopupControl contextMenu)
	{
		int beat = (int)noteAreaControl.GetHorizontalMousePositionInBeats();
		int midiNote = noteAreaControl.GetVerticalMousePositionInMidiNote();
		contextMenu.AddItem("Fit vertical", () =>
		{
			noteAreaControl.FitViewportVerticalToNotes();
		});
		Sentence sentence = SongMetaUtils.GetSentencesAtBeat(songMeta, beat).FirstOrDefault();
		if (sentence != null)
		{
			int minBeat = sentence.MinBeat - 1;
			int maxBeat = sentence.ExtendedMaxBeat + 1;
			contextMenu.AddItem("Fit horizontal to sentence ", () =>
			{
				noteAreaControl.FitViewportHorizontal(minBeat, maxBeat);
			});
		}
		List<Note> selectedNotes = selectionControl.GetSelectedNotes();
		if (selectedNotes.Count > 0)
		{
			int minBeat2 = selectedNotes.Select((Note it) => it.StartBeat).Min() - 1;
			int maxBeat2 = selectedNotes.Select((Note it) => it.EndBeat).Max() + 1;
			contextMenu.AddItem("Fit horizontal to selection", () =>
			{
				noteAreaControl.FitViewportHorizontal(minBeat2, maxBeat2);
			});
		}
		if (selectedNotes.Count > 0 || songEditorCopyPasteManager.CopiedNotes.Count > 0)
		{
			contextMenu.AddSeparator();
			if (selectedNotes.Count > 0)
			{
				contextMenu.AddItem("Copy notes", () =>
				{
					songEditorCopyPasteManager.CopySelectedNotes();
				});
			}
			if (songEditorCopyPasteManager.CopiedNotes.Count > 0)
			{
				contextMenu.AddItem("Paste notes", () =>
				{
					songEditorCopyPasteManager.PasteCopiedNotes();
				});
			}
		}
		contextMenu.AddSeparator();
		contextMenu.AddItem("Add note", () =>
		{
			addNoteAction.ExecuteAndNotify(songMeta, beat, midiNote);
		});
		if (selectedNotes.Count == 0)
		{
			contextMenu.AddSeparator();
			contextMenu.AddItem("Set Gap to playback position", () =>
			{
				setMusicGapAction.ExecuteAndNotify();
			});
		}
	}
}
