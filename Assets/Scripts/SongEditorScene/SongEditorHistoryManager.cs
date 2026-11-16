using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;

public class SongEditorHistoryManager : MonoBehaviour, INeedInjection, ISceneInjectionFinishedListener
{
	private static readonly int maxHistoryLength = 30;

	private static readonly Dictionary<SongMeta, SongEditorMemento> songMetaToSongEditorMementoMap = new Dictionary<SongMeta, SongEditorMemento>();

	private int indexInHistory = -1;

	private readonly List<SongEditorMemento> history = new List<SongEditorMemento>();

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongEditorLayerManager layerManager;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		songMetaToSongEditorMementoMap.Clear();
	}

	public void OnSceneInjectionFinished()
	{
		songMetaChangeEventStream.Where((SongMetaChangeEvent evt) => IsUndoable(evt)).Throttle(new TimeSpan(0, 0, 0, 0, 500)).Subscribe((SongMetaChangeEvent _) =>
		{
			AddUndoState();
		})
			.AddTo(base.gameObject);
	}

	private void Start()
	{
		if (songMetaToSongEditorMementoMap.TryGetValue(songMeta, out var value))
		{
			LoadUndoState(value);
		}
		AddUndoState();
	}

	public void Undo()
	{
		if (indexInHistory > 0)
		{
			indexInHistory--;
			SongEditorMemento undoState = history[indexInHistory];
			LoadUndoState(undoState);
		}
	}

	public void Redo()
	{
		if (indexInHistory < history.Count - 1)
		{
			indexInHistory++;
			SongEditorMemento undoState = history[indexInHistory];
			LoadUndoState(undoState);
		}
	}

	public void AddUndoState()
	{
		int num = history.Count - (indexInHistory + 1);
		for (int i = 0; i < num; i++)
		{
			RemoveNewestState();
		}
		SongEditorMemento songEditorMemento = CreateUndoState();
		songMetaToSongEditorMementoMap[songMeta] = songEditorMemento;
		history.Add(songEditorMemento);
		for (int num2 = history.Count - 1; num2 > maxHistoryLength; num2--)
		{
			RemoveOldestState();
		}
		indexInHistory = history.Count - 1;
	}

	private void RemoveNewestState()
	{
		if (history.Count > 0)
		{
			history.RemoveAt(history.Count - 1);
		}
	}

	private void RemoveOldestState()
	{
		if (history.Count > 0)
		{
			history.RemoveAt(0);
		}
	}

	private SongEditorMemento CreateUndoState()
	{
		SongEditorMemento songEditorMemento = new SongEditorMemento();
		SaveVoices(songEditorMemento);
		SaveLayers(songEditorMemento);
		SaveSongMetaTags(songEditorMemento);
		return songEditorMemento;
	}

	private void SaveLayers(SongEditorMemento memento)
	{
		foreach (SongEditorEnumLayer enumLayer in layerManager.GetEnumLayers())
		{
			SongEditorEnumLayer item = enumLayer.CloneDeep();
			memento.Layers.Add(item);
		}
	}

	private void SaveVoices(SongEditorMemento memento)
	{
		foreach (Voice voice in songMeta.GetVoices())
		{
			Voice item = voice.CloneDeep();
			memento.Voices.Add(item);
		}
	}

	private void SaveSongMetaTags(SongEditorMemento memento)
	{
		memento.Bpm = songMeta.Bpm;
		memento.MusicGap = songMeta.Gap;
	}

	private void LoadUndoState(SongEditorMemento undoState)
	{
		LoadLayers(undoState);
		LoadVoices(undoState);
		LoadSongMetaTags(undoState);
		editorNoteDisplayer.ClearNoteControls();
		songMetaChangeEventStream.OnNext(new LoadedMementoEvent());
		songMetaToSongEditorMementoMap[songMeta] = undoState;
	}

	private void LoadSongMetaTags(SongEditorMemento memento)
	{
		songMeta.Bpm = memento.Bpm;
		songMeta.Gap = memento.MusicGap;
	}

	private void LoadVoices(SongEditorMemento undoState)
	{
		IReadOnlyCollection<Voice> voices = songMeta.GetVoices();
		foreach (Voice voiceMemento in undoState.Voices)
		{
			Voice voice = voices.FirstOrDefault((Voice voice2) => voice2.VoiceNameEquals(voiceMemento.Name));
			if (voice == null)
			{
				Voice newVoice = voiceMemento.CloneDeep();
				songMeta.AddVoice(newVoice);
				continue;
			}
			List<Sentence> list = new List<Sentence>();
			foreach (Sentence sentence in voiceMemento.Sentences)
			{
				Sentence item = sentence.CloneDeep();
				list.Add(item);
			}
			voice.SetSentences(list);
		}
		foreach (Voice voiceInSongMeta in new List<Voice>(voices))
		{
			if (undoState.Voices.FirstOrDefault((Voice voice2) => voice2.VoiceNameEquals(voiceInSongMeta.Name)) == null)
			{
				songMeta.RemoveVoice(voiceInSongMeta);
			}
		}
	}

	private void LoadLayers(SongEditorMemento undoState)
	{
		foreach (SongEditorEnumLayer layer in undoState.Layers)
		{
			layerManager.ClearEnumLayer(layer.LayerEnum);
			foreach (Note note in layer.GetNotes())
			{
				layerManager.AddNoteToEnumLayer(layer.LayerEnum, note);
			}
		}
	}

	private bool IsUndoable(SongMetaChangeEvent evt)
	{
		if (evt.Undoable)
		{
			return !(evt is LoadedMementoEvent);
		}
		return false;
	}
}
