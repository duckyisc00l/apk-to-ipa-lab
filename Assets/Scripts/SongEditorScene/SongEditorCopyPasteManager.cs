using System;
using System.Collections.Generic;
using System.Linq;
using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

public class SongEditorCopyPasteManager : MonoBehaviour, INeedInjection
{
	private class OriginalNoteCopyData
	{
		public SongEditorEnumLayer OriginalEnumLayer { get; set; }

		public Sentence OriginalSentence { get; set; }

		public Voice OriginalVoice { get; set; }
	}

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject]
	private SongEditorLayerManager layerManager;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject(Optional = true)]
	private EventSystem eventSystem;

	[Inject]
	private MoveNotesToOtherVoiceAction moveNotesToOtherVoiceAction;

	[Inject]
	private DeleteNotesAction deleteNotesAction;

	[Inject]
	private SongEditorSceneInputControl songEditorSceneInputControl;

	private readonly Dictionary<Note, OriginalNoteCopyData> copiedNoteToOriginalDataMap = new Dictionary<Note, OriginalNoteCopyData>();

	public List<Note> CopiedNotes => layerManager.GetEnumLayerNotes(ESongEditorLayer.CopyPaste);

	private void Start()
	{
		songAudioPlayer.PositionInSongEventStream.Subscribe((double newMillis) =>
		{
			MoveCopiedNotesToMillisInSong(newMillis);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_copy).PerformedAsObservable()
			where !songEditorSceneInputControl.AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			CopySelectedNotes();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_cut).PerformedAsObservable()
			where !songEditorSceneInputControl.AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			CutSelectedNotes();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_paste).PerformedAsObservable()
			where !songEditorSceneInputControl.AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			PasteCopiedNotes();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(SongEditorSceneInputControl.cancelCopyPriority)
			where !songEditorSceneInputControl.AnyInputFieldHasFocus()
			where HasCopiedNotes()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			ClearCopiedNotes();
			InputManager.GetInputAction(R.InputActions.usplay_back).CancelNotifyForThisFrame();
		});
	}

	private void MoveCopiedNotesToMillisInSong(double newMillis)
	{
		if (CopiedNotes.IsNullOrEmpty() || songAudioPlayer.IsPlaying)
		{
			return;
		}
		int num = (int)Math.Round(BpmUtils.MillisecondInSongToBeat(songMeta, newMillis));
		int num2 = CopiedNotes.Select((Note it) => it.StartBeat).Min();
		int num3 = num - num2;
		if (num3 == 0)
		{
			return;
		}
		foreach (Note copiedNote in CopiedNotes)
		{
			copiedNote.IsEditable = true;
			copiedNote.MoveHorizontal(num3);
			copiedNote.IsEditable = false;
		}
		editorNoteDisplayer.UpdateNotes();
	}

	private void ClearCopiedNotes()
	{
		CopiedNotes.ForEach((Note copiedNote) =>
		{
			editorNoteDisplayer.RemoveNoteControl(copiedNote);
		});
		layerManager.ClearEnumLayer(ESongEditorLayer.CopyPaste);
		copiedNoteToOriginalDataMap.Clear();
	}

	public bool HasCopiedNotes()
	{
		return !layerManager.GetEnumLayerNotes(ESongEditorLayer.CopyPaste).IsNullOrEmpty();
	}

	public void PasteCopiedNotes()
	{
		if (!HasCopiedNotes())
		{
			return;
		}
		List<Note> pastedNotes = new List<Note>();
		layerManager.GetEnumLayers().ForEach((SongEditorEnumLayer layer) =>
		{
			CopiedNotes.Where((Note copiedNote) => copiedNoteToOriginalDataMap[copiedNote].OriginalEnumLayer == layer).ToList().ForEach((Note copiedNote) =>
			{
				copiedNote.IsEditable = true;
				layerManager.RemoveNoteFromAllEnumLayers(copiedNote);
				layerManager.AddNoteToEnumLayer(layer.LayerEnum, copiedNote);
				pastedNotes.Add(copiedNote);
			});
		});
		songMeta.GetVoices().ForEach((Voice voice) =>
		{
			List<Note> list = CopiedNotes.Where((Note copiedNote) => copiedNoteToOriginalDataMap[copiedNote].OriginalEnumLayer == null && copiedNoteToOriginalDataMap[copiedNote].OriginalVoice == voice).ToList();
			list.ForEach((Note copiedNote) =>
			{
				copiedNote.IsEditable = true;
				layerManager.RemoveNoteFromAllEnumLayers(copiedNote);
			});
			moveNotesToOtherVoiceAction.MoveNotesToVoice(songMeta, list, voice.Name);
			pastedNotes.AddRange(list);
		});
		pastedNotes.ForEach((Note note) =>
		{
			if (layerManager.TryGetEnumLayer(note, out var enumLayer))
			{
				note.IsEditable = layerManager.IsEnumLayerEditable(enumLayer.LayerEnum);
			}
			else
			{
				string voiceName = note.Sentence?.Voice?.Name;
				note.IsEditable = layerManager.IsVoiceLayerEditable(voiceName);
			}
		});
		ClearCopiedNotes();
		selectionControl.SetSelection(pastedNotes);
		songMetaChangeEventStream.OnNext(new NotesPastedEvent());
	}

	public void CutSelectedNotes()
	{
		List<Note> selectedNotes = selectionControl.GetSelectedNotes();
		if (!selectedNotes.IsNullOrEmpty())
		{
			CopySelectedNotes();
			deleteNotesAction.Execute(selectedNotes);
			songMetaChangeEventStream.OnNext(new NotesCutEvent());
		}
	}

	public void CopySelectedNotes()
	{
		ClearCopiedNotes();
		selectionControl.GetSelectedNotes().ForEach((Note note) =>
		{
			layerManager.TryGetEnumLayer(note, out var enumLayer);
			Note note2 = note.Clone();
			copiedNoteToOriginalDataMap[note2] = new OriginalNoteCopyData
			{
				OriginalEnumLayer = enumLayer,
				OriginalSentence = note.Sentence,
				OriginalVoice = note.Sentence?.Voice
			};
			note2.SetSentence(null);
			note2.IsEditable = false;
			CopiedNotes.Add(note2);
			layerManager.AddNoteToEnumLayer(ESongEditorLayer.CopyPaste, note2);
		});
		selectionControl.ClearSelection();
		editorNoteDisplayer.UpdateNotes();
	}
}
