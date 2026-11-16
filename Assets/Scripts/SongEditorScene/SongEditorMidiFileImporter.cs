using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using CSharpSynth.Midi;
using UniInject;
using UnityEngine;

public class SongEditorMidiFileImporter : INeedInjection
{
	[Inject]
	private SongMeta songMeta;

	[Inject]
	private MidiManager midiManager;

	[Inject]
	private SongEditorLayerManager layerManager;

	[Inject]
	private Settings settings;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	public void ImportMidiFile(string midiFilePath)
	{
		if (!File.Exists(midiFilePath))
		{
			Debug.Log("File does not exist: " + midiFilePath);
			UiManager.CreateNotification("File does not exist");
			return;
		}
		try
		{
			List<Note> notes = LoadNotesFromMidiFile(midiFilePath);
			notes = ShiftNotesToPlaybackPosition(notes);
			editorNoteDisplayer.ClearNotesInLayer(ESongEditorLayer.MidiFile);
			layerManager.ClearEnumLayer(ESongEditorLayer.MidiFile);
			notes.ForEach((Note loadedNote) =>
			{
				layerManager.AddNoteToEnumLayer(ESongEditorLayer.MidiFile, loadedNote);
			});
			editorNoteDisplayer.UpdateNotes();
			UiManager.CreateNotification("Loaded MIDI file successfully");
		}
		catch (Exception ex)
		{
			Debug.LogError(ex);
			UiManager.CreateNotification("Loading MIDI file failed: " + ex.Message, "error");
		}
	}

	private List<Note> ShiftNotesToPlaybackPosition(List<Note> notes)
	{
		Note note = notes.FindMinElement((Note note2) => note2.StartBeat);
		int num = (int)Math.Round(songAudioPlayer.GetCurrentBeat(allowNegativeResult: true));
		int difference = num - note.StartBeat;
		if (difference == 0)
		{
			return notes;
		}
		return notes.Select((Note note2) => new Note(note2.Type, note2.StartBeat + difference, note2.Length, note2.TxtPitch, note2.Text)).ToList();
	}

	private List<Note> LoadNotesFromMidiFile(string midiFilePath)
	{
		List<Note> loadedNotes = new List<Note>();
		MidiFile obj = midiManager.LoadMidiFile(midiFilePath) ?? throw new UnityException("Loading midi file failed.");
		Dictionary<int, Note> midiPitchToNoteUnderConstruction = new Dictionary<int, Note>();
		obj.Tracks.ForEach((MidiTrack track) =>
		{
			midiPitchToNoteUnderConstruction.Clear();
			track.MidiEvents.ForEach((MidiEvent midiEvent) =>
			{
				if (midiEvent.midiChannelEvent == MidiHelper.MidiChannelEvent.Note_On)
				{
					HandleStartOfNote(midiEvent, midiPitchToNoteUnderConstruction);
				}
				if (midiEvent.midiChannelEvent == MidiHelper.MidiChannelEvent.Note_Off)
				{
					HandleEndOfNote(midiEvent, midiPitchToNoteUnderConstruction, loadedNotes);
				}
			});
		});
		Debug.Log("Loaded notes from midi file: " + loadedNotes.Count);
		return loadedNotes;
	}

	private void HandleEndOfNote(MidiEvent midiEvent, Dictionary<int, Note> midiPitchToNoteUnderConstruction, List<Note> loadedNotes)
	{
		int parameter = midiEvent.parameter1;
		int deltaTimeInMillis = GetDeltaTimeInMillis(midiEvent);
		int num = (int)Math.Round(BpmUtils.MillisecondInSongToBeat(songMeta, deltaTimeInMillis));
		if (midiPitchToNoteUnderConstruction.TryGetValue(parameter, out var value))
		{
			if (num > value.StartBeat)
			{
				value.SetEndBeat(num);
				loadedNotes.Add(value);
			}
			else
			{
				Debug.LogWarning($"End beat {num} is not after start beat {value.StartBeat}. Skipping this note.");
			}
			midiPitchToNoteUnderConstruction.Remove(parameter);
		}
		else
		{
			Debug.LogWarning($"No Note for pitch {MidiUtils.GetAbsoluteName(parameter)} is being constructed. Ignoring this Note_Off event at {deltaTimeInMillis} ms.");
		}
	}

	private void HandleStartOfNote(MidiEvent midiEvent, Dictionary<int, Note> midiPitchToNoteUnderConstruction)
	{
		int parameter = midiEvent.parameter1;
		int deltaTimeInMillis = GetDeltaTimeInMillis(midiEvent);
		Note note = new Note();
		int num = (int)Math.Round(BpmUtils.MillisecondInSongToBeat(songMeta, deltaTimeInMillis));
		note.SetStartAndEndBeat(num, num);
		note.SetMidiNote(parameter);
		if (midiPitchToNoteUnderConstruction.ContainsKey(parameter))
		{
			Debug.LogWarning($"A Note with pitch {parameter} started but did not end before the next. The note will be ignored.");
		}
		midiPitchToNoteUnderConstruction[parameter] = note;
	}

	private static int GetDeltaTimeInMillis(MidiEvent midiEvent)
	{
		return (int)Math.Round((double)midiEvent.deltaTime / ((double)MidiManager.midiStreamSampleRateHz / 1000.0));
	}
}
