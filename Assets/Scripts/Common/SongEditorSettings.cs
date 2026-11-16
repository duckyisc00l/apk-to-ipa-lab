using System;

[Serializable]
public class SongEditorSettings
{
	public bool AutoSave { get; set; } = true;

	public float MusicVolume { get; set; } = 1f;

	public float MusicPlaybackSpeed { get; set; } = 1f;

	public bool GoToLastPlaybackPosition { get; set; } = true;

	public ESongEditorRecordingSource RecordingSource { get; set; }

	public MicProfile MicProfile { get; set; }

	public int MicOctaveOffset { get; set; }

	public int MicDelayInMillis { get; set; } = 450;

	public int MidiNoteForButtonRecording { get; set; } = 69;

	public string ButtonDisplayNameForButtonRecording { get; set; } = "N";

	public bool AdjustFollowingNotes { get; set; }

	public int MidiVelocity { get; set; } = 100;

	public float MidiGain { get; set; } = 1f;

	public bool MidiSoundPlayAlongEnabled { get; set; } = true;

	public int MidiPlaybackOffsetInMillis { get; set; }

	public string LastMidiFilePath { get; set; } = "";

	public bool ShowLyricsArea { get; set; } = true;

	public bool ShowVideoArea { get; set; } = true;

	public bool ShowStatusBar { get; set; } = true;

	public bool ShowVirtualPianoArea { get; set; } = true;

	public bool SmallLeftSideBar { get; set; }

	public bool ShowControlHints { get; set; } = true;

	public bool ShowNotePitchLabel { get; set; } = true;

	public float GridSizeInPx { get; set; } = 1f;

	public float SentenceLineSizeInPx { get; set; } = 2f;
}
