using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UIElements;

public class SongEditorSelectionControl : MonoBehaviour, INeedInjection
{
	[Inject(Optional = true)]
	private EventSystem eventSystem;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongEditorLayerManager layerManager;

	[Inject]
	private UIDocument uiDocument;

	private readonly HashSet<Note> selectedNotes = new HashSet<Note>();

	private readonly Subject<NoteSelectionChangeEvent> noteSelectionChangeEventStream = new Subject<NoteSelectionChangeEvent>();

	public IObservable<NoteSelectionChangeEvent> NoteSelectionChangeEventStream => noteSelectionChangeEventStream;

	public List<Note> GetSelectedNotes()
	{
		return new List<Note>(selectedNotes);
	}

	public bool HasSelectedNotes()
	{
		if (selectedNotes != null)
		{
			return selectedNotes.Count > 0;
		}
		return false;
	}

	public bool IsSelected(Note note)
	{
		return selectedNotes.Contains(note);
	}

	public void ClearSelection()
	{
		ClearSelectionWithoutNotify();
		FireNoteSelectionChangedEvent();
	}

	private void ClearSelectionWithoutNotify()
	{
		foreach (EditorNoteControl editorNoteControl in editorNoteDisplayer.EditorNoteControls)
		{
			editorNoteControl.SetSelected(isSelected: false);
		}
		selectedNotes.Clear();
	}

	public void SelectAll()
	{
		List<Note> allVisibleNotes = songEditorSceneControl.GetAllVisibleNotes();
		SetSelection(allVisibleNotes);
	}

	public void AddToSelection(List<EditorNoteControl> uiNotes)
	{
		foreach (EditorNoteControl uiNote in uiNotes)
		{
			AddToSelectionWithoutNotify(uiNote);
		}
		FireNoteSelectionChangedEvent();
	}

	public void RemoveFromSelection(List<EditorNoteControl> uiNotes)
	{
		foreach (EditorNoteControl uiNote in uiNotes)
		{
			RemoveFromSelection(uiNote);
		}
	}

	public void SetSelection(List<EditorNoteControl> uiNotes)
	{
		ClearSelectionWithoutNotify();
		foreach (EditorNoteControl uiNote in uiNotes)
		{
			AddToSelectionWithoutNotify(uiNote);
		}
		FireNoteSelectionChangedEvent();
	}

	public void SetSelection(List<Note> notes)
	{
		SetSelectionWithoutNotify(notes);
		FireNoteSelectionChangedEvent();
	}

	private void SetSelectionWithoutNotify(List<Note> notes)
	{
		ClearSelectionWithoutNotify();
		foreach (Note note in notes)
		{
			if (note.IsEditable && layerManager.IsNoteVisible(note))
			{
				selectedNotes.Add(note);
				editorNoteDisplayer.GetNoteControl(note)?.SetSelected(isSelected: true);
			}
		}
		FireNoteSelectionChangedEvent();
	}

	public void AddToSelection(List<Note> notes)
	{
		notes.ForEach(AddToSelectionWithoutNotify);
		FireNoteSelectionChangedEvent();
	}

	public void AddToSelection(Note note)
	{
		AddToSelectionWithoutNotify(note);
		FireNoteSelectionChangedEvent();
	}

	private void AddToSelectionWithoutNotify(Note note)
	{
		selectedNotes.Add(note);
		editorNoteDisplayer.GetNoteControl(note)?.SetSelected(isSelected: true);
	}

	public void AddToSelection(EditorNoteControl noteControl)
	{
		AddToSelectionWithoutNotify(noteControl);
		FireNoteSelectionChangedEvent();
	}

	private void AddToSelectionWithoutNotify(EditorNoteControl noteControl)
	{
		noteControl.SetSelected(isSelected: true);
		selectedNotes.Add(noteControl.Note);
	}

	public void RemoveFromSelection(List<Note> notes)
	{
		notes.ForEach(RemoveFromSelectionWithoutNotify);
		FireNoteSelectionChangedEvent();
	}

	public void RemoveFromSelection(Note note)
	{
		RemoveFromSelectionWithoutNotify(note);
		FireNoteSelectionChangedEvent();
	}

	private void RemoveFromSelectionWithoutNotify(Note note)
	{
		selectedNotes.Remove(note);
		editorNoteDisplayer.GetNoteControl(note)?.SetSelected(isSelected: false);
	}

	public void RemoveFromSelection(EditorNoteControl noteControl)
	{
		RemoveFromSelectionWithoutNotify(noteControl);
		FireNoteSelectionChangedEvent();
	}

	private void RemoveFromSelectionWithoutNotify(EditorNoteControl noteControl)
	{
		noteControl.SetSelected(isSelected: false);
		selectedNotes.Remove(noteControl.Note);
	}

	private void FireNoteSelectionChangedEvent()
	{
		noteSelectionChangeEventStream.OnNext(new NoteSelectionChangeEvent(selectedNotes));
	}

	public void SelectNextNote(bool updatePositionInSong = true)
	{
		EditorNoteControl editorNoteControl = editorNoteDisplayer.EditorNoteControls.FirstOrDefault((EditorNoteControl it) => it.IsEditingLyrics());
		bool flag = false;
		if (editorNoteControl != null)
		{
			flag = true;
			editorNoteControl.SubmitAndCloseLyricsDialog();
			SetSelection(new List<EditorNoteControl> { editorNoteControl });
		}
		if (selectedNotes.Count == 0)
		{
			SelectFirstVisibleNote();
			return;
		}
		List<Note> allVisibleNotes = songEditorSceneControl.GetAllVisibleNotes();
		int num = selectedNotes.Select((Note it) => it.EndBeat).Max();
		int num2 = int.MaxValue;
		Note note = null;
		foreach (Note item in allVisibleNotes)
		{
			if (item.StartBeat >= num)
			{
				int num3 = item.StartBeat - num;
				if (num3 < num2)
				{
					num2 = num3;
					note = item;
				}
			}
		}
		uiDocument.rootVisualElement.focusController.focusedElement?.Blur();
		if (note == null)
		{
			return;
		}
		SetSelection(new List<Note> { note });
		if (updatePositionInSong)
		{
			double positionInSongInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, note.StartBeat);
			songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
		}
		if (flag)
		{
			songEditorSceneControl.StartEditingSelectedNoteText();
			StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(1, () =>
			{
				songEditorSceneControl.StartEditingSelectedNoteText();
			}));
		}
	}

	public void SelectPreviousNote(bool updatePositionInSong = true)
	{
		bool flag = false;
		EditorNoteControl editorNoteControl = editorNoteDisplayer.EditorNoteControls.FirstOrDefault((EditorNoteControl it) => it.IsEditingLyrics());
		if (editorNoteControl != null)
		{
			flag = true;
			editorNoteControl.SubmitAndCloseLyricsDialog();
			SetSelection(new List<EditorNoteControl> { editorNoteControl });
		}
		if (selectedNotes.Count == 0)
		{
			SelectLastVisibleNote();
			return;
		}
		List<Note> allVisibleNotes = songEditorSceneControl.GetAllVisibleNotes();
		int num = selectedNotes.Select((Note it) => it.StartBeat).Min();
		int num2 = int.MaxValue;
		Note note = null;
		foreach (Note item in allVisibleNotes)
		{
			if (num >= item.EndBeat)
			{
				int num3 = num - item.EndBeat;
				if (num3 < num2)
				{
					num2 = num3;
					note = item;
				}
			}
		}
		if (note == null)
		{
			return;
		}
		SetSelection(new List<Note> { note });
		if (updatePositionInSong)
		{
			double positionInSongInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, note.StartBeat);
			songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
		}
		if (flag)
		{
			songEditorSceneControl.StartEditingSelectedNoteText();
			StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(1, () =>
			{
				songEditorSceneControl.StartEditingSelectedNoteText();
			}));
		}
	}

	private void SelectFirstVisibleNote()
	{
		List<EditorNoteControl> sortedVisibleUiNotes = GetSortedVisibleUiNotes();
		if (!sortedVisibleUiNotes.IsNullOrEmpty())
		{
			SetSelection(new List<EditorNoteControl> { sortedVisibleUiNotes.First() });
		}
	}

	private void SelectLastVisibleNote()
	{
		List<EditorNoteControl> sortedVisibleUiNotes = GetSortedVisibleUiNotes();
		if (!sortedVisibleUiNotes.IsNullOrEmpty())
		{
			SetSelection(new List<EditorNoteControl> { sortedVisibleUiNotes.Last() });
		}
	}

	private List<EditorNoteControl> GetSortedVisibleUiNotes()
	{
		if (editorNoteDisplayer.EditorNoteControls.IsNullOrEmpty())
		{
			return new List<EditorNoteControl>();
		}
		List<EditorNoteControl> list = new List<EditorNoteControl>(editorNoteDisplayer.EditorNoteControls);
		list.Sort(EditorNoteControl.comparerByStartBeat);
		return list;
	}
}
