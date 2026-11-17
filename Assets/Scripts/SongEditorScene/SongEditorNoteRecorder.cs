using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;

public class SongEditorNoteRecorder : MonoBehaviour, INeedInjection
{
	[Inject]
	private SongEditorMicPitchTracker micPitchTracker;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongEditorLayerManager songEditorLayerManager;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongEditorHistoryManager historyManager;

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	private List<Note> upcomingSortedRecordedNotes = new List<Note>();

	private int lastPitchDetectedFrame;

	private int lastPitchDetectedBeat;

	private Note lastRecordedNote;

	private bool hasRecordedNotes;

	private bool isRecordingEnabled;

	public bool IsRecordingEnabled
	{
		get
		{
			return isRecordingEnabled;
		}
		set
		{
			isRecordingEnabled = value;
			StartOrStopRecording();
		}
	}

	private void Start()
	{
		micPitchTracker.MicProfile = CreateSongEditorSpecificMicProfile();
		settings.SongEditorSettings.ObserveEveryValueChanged((SongEditorSettings it) => it.MicProfile).Subscribe((MicProfile newValue) =>
		{
			micPitchTracker.MicProfile = CreateSongEditorSpecificMicProfile();
			StartOrStopRecording();
		}).AddTo(base.gameObject);
		settings.SongEditorSettings.ObserveEveryValueChanged((SongEditorSettings it) => it.MicDelayInMillis).Subscribe((int newValue) =>
		{
			micPitchTracker.MicProfile = CreateSongEditorSpecificMicProfile();
			StartOrStopRecording();
		}).AddTo(base.gameObject);
		settings.SongEditorSettings.ObserveEveryValueChanged((SongEditorSettings it) => it.RecordingSource).Subscribe((ESongEditorRecordingSource _) =>
		{
			StartOrStopRecording();
		}).AddTo(base.gameObject);
		songAudioPlayer.ObserveEveryValueChanged((SongAudioPlayer it) => it.IsPlaying).Subscribe((bool _) =>
		{
			StartOrStopRecording();
		}).AddTo(base.gameObject);
		songAudioPlayer.JumpBackInSongEventStream.Subscribe(OnJumpedBackInSong);
		songAudioPlayer.PlaybackStartedEventStream.Subscribe(OnPlaybackStarted);
		songAudioPlayer.PlaybackStoppedEventStream.Subscribe(OnPlaybackStopped);
		micPitchTracker.PitchEventStream.Subscribe((PitchEvent pitchEvent) =>
		{
			OnPitchDetected(pitchEvent);
		});
	}

	private MicProfile CreateSongEditorSpecificMicProfile()
	{
		if (settings.SongEditorSettings.MicProfile == null)
		{
			return null;
		}
		return new MicProfile(settings.SongEditorSettings.MicProfile)
		{
			DelayInMillis = settings.SongEditorSettings.MicDelayInMillis
		};
	}

	private void OnPlaybackStopped(double positionInSongInMillis)
	{
		if (hasRecordedNotes)
		{
			historyManager.AddUndoState();
		}
	}

	private void OnPlaybackStarted(double positionInSongInMillis)
	{
		hasRecordedNotes = false;
		lastPitchDetectedBeat = GetBeat(positionInSongInMillis);
		upcomingSortedRecordedNotes = GetUpcomingSortedRecordedNotes();
	}

	private void Update()
	{
		if (songAudioPlayer.IsPlaying)
		{
			UpdateRecordingViaButtonClick();
		}
	}

	private void OnJumpedBackInSong(Pair<double> previousAndNewPositionInMillis)
	{
		int num = (int)BpmUtils.MillisecondInSongToBeat(songMeta, previousAndNewPositionInMillis.Current);
		lastPitchDetectedBeat = num;
		upcomingSortedRecordedNotes = GetUpcomingSortedRecordedNotes();
	}

	private void UpdateRecordingViaButtonClick()
	{
		if (!IsRecordingEnabled || settings.SongEditorSettings.RecordingSource != ESongEditorRecordingSource.KeyboardButton)
		{
			return;
		}
		int beat = (int)songAudioPlayer.GetCurrentBeat(allowNegativeResult: true);
		if (Keyboard.current != null && Keyboard.current.anyKey.isPressed)
		{
			if ((from inputControl in Keyboard.current.allControls
				where inputControl.IsPressed()
				select inputControl.displayName.ToUpperInvariant()).ToList().Contains(settings.SongEditorSettings.ButtonDisplayNameForButtonRecording.ToUpperInvariant()))
			{
				RecordNote(settings.SongEditorSettings.MidiNoteForButtonRecording, beat, ESongEditorLayer.ButtonRecording);
			}
		}
		else
		{
			lastRecordedNote = null;
			lastPitchDetectedBeat = beat;
		}
	}

	private void OnPitchDetected(PitchEvent pitchEvent)
	{
		if (IsRecordingEnabled && lastPitchDetectedFrame != Time.frameCount)
		{
			if (pitchEvent == null)
			{
				lastRecordedNote = null;
			}
			else if (pitchEvent is BeatPitchEvent beatPitchEvent)
			{
				RecordNote(beatPitchEvent.MidiNote, beatPitchEvent.Beat, ESongEditorLayer.MicRecording);
			}
		}
	}

	private void RecordNote(int midiNote, int beat, ESongEditorLayer targetLayer)
	{
		if (beat > lastPitchDetectedBeat)
		{
			if (lastRecordedNote != null && lastRecordedNote.MidiNote == midiNote)
			{
				ContinueLastRecordedNote(beat, targetLayer);
			}
			else
			{
				CreateNewRecordedNote(midiNote, beat, targetLayer);
			}
			editorNoteDisplayer.UpdateNotes();
			lastPitchDetectedFrame = Time.frameCount;
			lastPitchDetectedBeat = beat;
			hasRecordedNotes = true;
		}
	}

	private void CreateNewRecordedNote(int midiNote, int currentBeat, ESongEditorLayer targetLayer)
	{
		lastRecordedNote = new Note(ENoteType.Normal, currentBeat, 1, midiNote - 60, "");
		songEditorLayerManager.AddNoteToEnumLayer(targetLayer, lastRecordedNote);
		OverwriteExistingNotes(currentBeat + 1, targetLayer);
	}

	private void ContinueLastRecordedNote(int currentBeat, ESongEditorLayer targetLayer)
	{
		if (currentBeat > lastRecordedNote.EndBeat)
		{
			lastRecordedNote.SetEndBeat(currentBeat);
			OverwriteExistingNotes(currentBeat, targetLayer);
		}
	}

	private void OverwriteExistingNotes(int currentBeat, ESongEditorLayer targetLayer)
	{
		List<Note> list = new List<Note>();
		int num = 0;
		foreach (Note upcomingSortedRecordedNote in upcomingSortedRecordedNotes)
		{
			if (upcomingSortedRecordedNote != lastRecordedNote)
			{
				if (upcomingSortedRecordedNote.StartBeat < currentBeat && currentBeat <= upcomingSortedRecordedNote.EndBeat)
				{
					list.Add(upcomingSortedRecordedNote);
				}
				else if (upcomingSortedRecordedNote.EndBeat < currentBeat)
				{
					num++;
				}
				else if (upcomingSortedRecordedNote.EndBeat > currentBeat)
				{
					break;
				}
			}
		}
		if (num > 0)
		{
			upcomingSortedRecordedNotes.RemoveRange(0, num);
		}
		foreach (Note item in list)
		{
			if (item.EndBeat > currentBeat)
			{
				item.SetStartBeat(currentBeat);
				continue;
			}
			songEditorLayerManager.RemoveNoteFromAllEnumLayers(item);
			editorNoteDisplayer.RemoveNoteControl(item);
		}
	}

	private List<Note> GetUpcomingSortedRecordedNotes()
	{
		int currentBeat = GetBeat(songAudioPlayer.PositionInSongInMillis - (double)settings.SongEditorSettings.MicDelayInMillis);
		ESongEditorLayer recordingTargetLayer = GetRecordingTargetLayer();
		List<Note> list = (from note in songEditorLayerManager.GetEnumLayerNotes(recordingTargetLayer)
			where note.StartBeat >= currentBeat
			select note).ToList();
		list.Sort(Note.comparerByStartBeat);
		return list;
	}

	private ESongEditorLayer GetRecordingTargetLayer()
	{
		ESongEditorRecordingSource recordingSource = settings.SongEditorSettings.RecordingSource;
		if (recordingSource != ESongEditorRecordingSource.Microphone)
		{
			_ = 2;
			return ESongEditorLayer.ButtonRecording;
		}
		return ESongEditorLayer.MicRecording;
	}

	private int GetBeat(double positionInSongInMillis)
	{
		return (int)BpmUtils.MillisecondInSongToBeat(songMeta, positionInSongInMillis);
	}

	private void StartOrStopRecording()
	{
		bool flag = isRecordingEnabled && songAudioPlayer.IsPlaying && settings.SongEditorSettings.RecordingSource == ESongEditorRecordingSource.Microphone && settings.SongEditorSettings.MicProfile != null && settings.SongEditorSettings.MicProfile.IsEnabledAndConnected(serverSideConnectRequestManager);
		if (!flag && micPitchTracker.MicSampleRecorder.IsRecording.Value)
		{
			micPitchTracker.MicSampleRecorder.StopRecording();
		}
		else if (flag && !micPitchTracker.MicSampleRecorder.IsRecording.Value)
		{
			micPitchTracker.MicSampleRecorder.StartRecording();
		}
	}
}
