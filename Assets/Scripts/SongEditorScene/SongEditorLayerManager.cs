using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;

public class SongEditorLayerManager : MonoBehaviour, INeedInjection, ISceneInjectionFinishedListener
{
	private readonly Dictionary<ESongEditorLayer, SongEditorEnumLayer> layerEnumToLayerMap = CreateLayerEnumToLayerMap();

	private readonly Dictionary<string, SongEditorVoiceLayer> voiceNameToLayerMap = CreateVoiceNameToLayerMap();

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMeta songMeta;

	private readonly Subject<LayerChangedEvent> layerChangedEventStream = new Subject<LayerChangedEvent>();

	public IObservable<LayerChangedEvent> LayerChangedEventStream => layerChangedEventStream;

	public void OnSceneInjectionFinished()
	{
		songMetaChangeEventStream.Subscribe(OnSongMetaChanged);
	}

	private void OnSongMetaChanged(SongMetaChangeEvent changeEvent)
	{
		if (changeEvent is MovedNotesToVoiceEvent movedNotesToVoiceEvent)
		{
			movedNotesToVoiceEvent.Notes.Where((Note note) => note.Sentence != null).ForEach((Note note) =>
			{
				RemoveNoteFromAllEnumLayers(note);
			});
		}
	}

	public void AddNoteToEnumLayer(ESongEditorLayer layerEnum, Note note)
	{
		layerEnumToLayerMap[layerEnum].AddNote(note);
	}

	public void ClearEnumLayer(ESongEditorLayer layerEnum)
	{
		layerEnumToLayerMap[layerEnum].ClearNotes();
	}

	public List<Note> GetEnumLayerNotes(ESongEditorLayer layerEnum)
	{
		return layerEnumToLayerMap[layerEnum].GetNotes();
	}

	public List<Note> GetVoiceLayerNotes(string voiceName)
	{
		voiceName = Voice.NormalizeVoiceName(voiceName);
		return SongMetaUtils.GetAllNotes(songMeta.GetVoice(voiceName));
	}

	public Color GetEnumLayerColor(ESongEditorLayer layerEnum)
	{
		return layerEnumToLayerMap[layerEnum].Color;
	}

	public Color GetVoiceLayerColor(string voiceName)
	{
		voiceName = Voice.NormalizeVoiceName(voiceName);
		if (voiceNameToLayerMap.TryGetValue(voiceName, out var value))
		{
			return value.Color;
		}
		return Colors.beige;
	}

	public bool IsEnumLayerVisible(ESongEditorLayer layerEnum)
	{
		return layerEnumToLayerMap[layerEnum].IsVisible;
	}

	public void SetEnumLayerVisible(ESongEditorLayer layerEnum, bool newValue)
	{
		if (newValue != layerEnumToLayerMap[layerEnum].IsVisible)
		{
			layerEnumToLayerMap[layerEnum].IsVisible = newValue;
			layerChangedEventStream.OnNext(new LayerChangedEvent(layerEnum));
		}
	}

	public bool IsVoiceLayerVisible(string voiceName)
	{
		voiceName = Voice.NormalizeVoiceName(voiceName);
		if (voiceNameToLayerMap.TryGetValue(voiceName, out var value))
		{
			return value.IsVisible;
		}
		return true;
	}

	public void SetVoiceLayerVisible(string voiceName, bool newValue)
	{
		voiceName = Voice.NormalizeVoiceName(voiceName);
		if (newValue != voiceNameToLayerMap[voiceName].IsVisible)
		{
			voiceNameToLayerMap[voiceName].IsVisible = newValue;
			layerChangedEventStream.OnNext(new LayerChangedEvent(voiceName));
		}
	}

	public bool IsVoiceLayerEditable(string voiceName)
	{
		voiceName = Voice.NormalizeVoiceName(voiceName);
		if (voiceNameToLayerMap.TryGetValue(voiceName, out var value))
		{
			return value.IsEditable;
		}
		return true;
	}

	public void SetVoiceLayerEditable(string voiceName, bool newValue)
	{
		voiceName = Voice.NormalizeVoiceName(voiceName);
		if (newValue != voiceNameToLayerMap[voiceName].IsEditable)
		{
			voiceNameToLayerMap[voiceName].IsEditable = newValue;
			GetVoiceLayerNotes(voiceName).ForEach((Note note) =>
			{
				note.IsEditable = newValue;
			});
			layerChangedEventStream.OnNext(new LayerChangedEvent(voiceName));
		}
	}

	public bool IsEnumLayerEditable(ESongEditorLayer layerEnum)
	{
		return layerEnumToLayerMap[layerEnum].IsEditable;
	}

	public void SetEnumLayerEditable(ESongEditorLayer layerEnum, bool newValue)
	{
		if (newValue != layerEnumToLayerMap[layerEnum].IsEditable)
		{
			layerEnumToLayerMap[layerEnum].IsEditable = newValue;
			GetEnumLayerNotes(layerEnum).ForEach((Note note) =>
			{
				note.IsEditable = newValue;
			});
			layerChangedEventStream.OnNext(new LayerChangedEvent(layerEnum));
		}
	}

	public SongEditorEnumLayer GetEnumLayer(ESongEditorLayer layerEnum)
	{
		return layerEnumToLayerMap[layerEnum];
	}

	public List<SongEditorEnumLayer> GetEnumLayers()
	{
		return new List<SongEditorEnumLayer>(layerEnumToLayerMap.Values);
	}

	public List<SongEditorVoiceLayer> GetVoiceLayers()
	{
		return new List<SongEditorVoiceLayer>(voiceNameToLayerMap.Values);
	}

	private static Dictionary<string, SongEditorVoiceLayer> CreateVoiceNameToLayerMap()
	{
		Dictionary<string, SongEditorVoiceLayer> dictionary = new Dictionary<string, SongEditorVoiceLayer>();
		foreach (string item in new List<string>
		{
			Voice.firstVoiceName,
			Voice.secondVoiceName
		})
		{
			dictionary.Add(item, new SongEditorVoiceLayer(item));
		}
		dictionary[Voice.firstVoiceName].Color = Colors.CreateColor("#2ecc71");
		dictionary[Voice.secondVoiceName].Color = Colors.CreateColor("#9b59b6");
		return dictionary;
	}

	private static Dictionary<ESongEditorLayer, SongEditorEnumLayer> CreateLayerEnumToLayerMap()
	{
		Dictionary<ESongEditorLayer, SongEditorEnumLayer> dictionary = new Dictionary<ESongEditorLayer, SongEditorEnumLayer>();
		foreach (ESongEditorLayer valuesAs in EnumUtils.GetValuesAsList<ESongEditorLayer>())
		{
			dictionary.Add(valuesAs, new SongEditorEnumLayer(valuesAs));
		}
		dictionary[ESongEditorLayer.MicRecording].Color = Colors.CreateColor("#1D67C2", 200);
		dictionary[ESongEditorLayer.ButtonRecording].Color = Colors.CreateColor("#138BBA", 200);
		dictionary[ESongEditorLayer.CopyPaste].Color = Colors.CreateColor("#F08080", 200);
		dictionary[ESongEditorLayer.MidiFile].Color = Colors.CreateColor("#0F9799", 200);
		dictionary[ESongEditorLayer.CopyPaste].IsEditable = false;
		return dictionary;
	}

	public List<Note> GetAllEnumLayerNotes()
	{
		List<Note> list = new List<Note>();
		foreach (ESongEditorLayer key in layerEnumToLayerMap.Keys)
		{
			List<Note> enumLayerNotes = GetEnumLayerNotes(key);
			list.AddRange(enumLayerNotes);
		}
		return list;
	}

	public List<Note> GetAllVisibleEnumLayerNotes()
	{
		List<Note> list = new List<Note>();
		foreach (ESongEditorLayer key in layerEnumToLayerMap.Keys)
		{
			if (IsEnumLayerVisible(key))
			{
				List<Note> enumLayerNotes = GetEnumLayerNotes(key);
				list.AddRange(enumLayerNotes);
			}
		}
		return list;
	}

	public void RemoveNoteFromAllEnumLayers(Note note)
	{
		foreach (SongEditorEnumLayer value in layerEnumToLayerMap.Values)
		{
			value.RemoveNote(note);
		}
	}

	public bool IsNoteVisible(Note note)
	{
		if (note.Sentence?.Voice != null)
		{
			return IsVoiceLayerVisible(note.Sentence.Voice.Name);
		}
		if (TryGetEnumLayer(note, out var enumLayer))
		{
			return IsEnumLayerVisible(enumLayer.LayerEnum);
		}
		return true;
	}

	public bool TryGetEnumLayer(Note note, out SongEditorEnumLayer enumLayer)
	{
		foreach (SongEditorEnumLayer enumLayer2 in GetEnumLayers())
		{
			if (enumLayer2.ContainsNote(note))
			{
				enumLayer = enumLayer2;
				return true;
			}
		}
		enumLayer = null;
		return false;
	}

	public Color GetLayerColor(AbstractSongEditorLayer layer)
	{
		if (layer is SongEditorEnumLayer songEditorEnumLayer)
		{
			return GetEnumLayerColor(songEditorEnumLayer.LayerEnum);
		}
		if (layer is SongEditorVoiceLayer songEditorVoiceLayer)
		{
			return GetVoiceLayerColor(songEditorVoiceLayer.VoiceName);
		}
		return Colors.beige;
	}

	public List<Note> GetLayerNotes(AbstractSongEditorLayer layer)
	{
		if (layer is SongEditorEnumLayer songEditorEnumLayer)
		{
			return GetEnumLayerNotes(songEditorEnumLayer.LayerEnum);
		}
		if (layer is SongEditorVoiceLayer songEditorVoiceLayer)
		{
			return GetVoiceLayerNotes(songEditorVoiceLayer.VoiceName);
		}
		return new List<Note>();
	}

	public bool IsLayerVisible(AbstractSongEditorLayer layer)
	{
		if (layer is SongEditorEnumLayer songEditorEnumLayer)
		{
			return IsEnumLayerVisible(songEditorEnumLayer.LayerEnum);
		}
		if (layer is SongEditorVoiceLayer songEditorVoiceLayer)
		{
			return IsVoiceLayerVisible(songEditorVoiceLayer.VoiceName);
		}
		return true;
	}

	public void SetLayerVisible(AbstractSongEditorLayer layer, bool newValue)
	{
		if (layer is SongEditorEnumLayer songEditorEnumLayer)
		{
			SetEnumLayerVisible(songEditorEnumLayer.LayerEnum, newValue);
		}
		else if (layer is SongEditorVoiceLayer songEditorVoiceLayer)
		{
			SetVoiceLayerVisible(songEditorVoiceLayer.VoiceName, newValue);
		}
	}

	public bool IsLayerEditable(AbstractSongEditorLayer layer)
	{
		if (layer is SongEditorEnumLayer songEditorEnumLayer)
		{
			return IsEnumLayerEditable(songEditorEnumLayer.LayerEnum);
		}
		if (layer is SongEditorVoiceLayer songEditorVoiceLayer)
		{
			return IsVoiceLayerEditable(songEditorVoiceLayer.VoiceName);
		}
		return true;
	}

	public void SetLayerEditable(AbstractSongEditorLayer layer, bool newValue)
	{
		if (layer is SongEditorEnumLayer songEditorEnumLayer)
		{
			SetEnumLayerEditable(songEditorEnumLayer.LayerEnum, newValue);
		}
		else if (layer is SongEditorVoiceLayer songEditorVoiceLayer)
		{
			SetVoiceLayerEditable(songEditorVoiceLayer.VoiceName, newValue);
		}
	}
}
