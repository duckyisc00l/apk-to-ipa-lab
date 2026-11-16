using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongEditorSideBarSettingsControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(UxmlName = "adjustFollowingNotesToggle")]
	private Toggle adjustFollowingNotesToggle;

	[Inject(UxmlName = "autoSaveToggle")]
	private Toggle autoSaveToggle;

	[Inject(UxmlName = "goToLastPlaybackPositionToggle")]
	private Toggle goToLastPlaybackPositionToggle;

	[Inject(UxmlName = "musicVolumeSlider")]
	private Slider musicVolumeSlider;

	[Inject(UxmlName = "musicPlaybackSpeedSlider")]
	private Slider musicPlaybackSpeedSlider;

	[Inject(UxmlName = "resetMusicPlaybackSpeedButton")]
	private Button resetMusicPlaybackSpeedButton;

	[Inject(UxmlName = "recordingSourceItemPicker")]
	private ItemPicker recordingSourceItemPicker;

	private LabeledItemPickerControl<ESongEditorRecordingSource> recordingSourceItemPickerControl;

	[Inject(UxmlName = "micDeviceItemPicker")]
	private ItemPicker micDeviceItemPicker;

	private LabeledItemPickerControl<MicProfile> micDeviceItemPickerControl;

	[Inject(UxmlName = "micOctaveOffsetTextField")]
	private TextField micOctaveOffsetTextField;

	[Inject(UxmlName = "micDelayTextField")]
	private TextField micDelayTextField;

	[Inject(UxmlName = "buttonRecordingPitchTextField")]
	private TextField buttonRecordingPitchTextField;

	[Inject(UxmlName = "buttonRecordingButtonTextField")]
	private TextField buttonRecordingButtonTextField;

	[Inject(UxmlName = "midiGainSlider")]
	private Slider midiGainSlider;

	[Inject(UxmlName = "midiVelocitySlider")]
	private Slider midiVelocitySlider;

	[Inject(UxmlName = "midiDelayTextField")]
	private TextField midiDelayTextField;

	[Inject(UxmlName = "midiNotePlayAlongToggle")]
	private Toggle midiNotePlayAlongToggle;

	[Inject(UxmlName = "showLyricsAreaToggle")]
	private Toggle showLyricsAreaToggle;

	[Inject(UxmlName = "showStatusBarToggle")]
	private Toggle showStatusBarToggle;

	[Inject(UxmlName = "showControlHintsToggle")]
	private Toggle showControlHintsToggle;

	[Inject(UxmlName = "showVideoAreaToggle")]
	private Toggle showVideoAreaToggle;

	[Inject(UxmlName = "showVirtualPianoToggle")]
	private Toggle showVirtualPianoToggle;

	[Inject(UxmlName = "showNotePitchLabelToggle")]
	private Toggle showNotePitchLabelToggle;

	[Inject(UxmlName = "gridSizeTextField")]
	private TextField gridSizeTextField;

	[Inject(UxmlName = "sentenceLineSizeTextField")]
	private TextField sentenceLineSizeTextField;

	[Inject(UxmlName = "videoArea")]
	private VisualElement videoArea;

	[Inject(UxmlName = "statusBar")]
	private VisualElement statusBar;

	[Inject(UxmlName = "virtualPiano")]
	private VisualElement virtualPiano;

	[Inject(UxmlName = "lyricsArea")]
	private VisualElement lyricsArea;

	[Inject(UxmlName = "micRecordingContainer")]
	private VisualElement micRecordingContainer;

	[Inject(UxmlName = "buttonRecordingContainer")]
	private VisualElement buttonRecordingContainer;

	[Inject(UxmlName = "importMidiFileButton")]
	private Button importMidiFileButton;

	[Inject]
	private Settings settings;

	[Inject]
	private GameObject gameObject;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	[Inject]
	private Injector injector;

	private readonly SongEditorMidiFileImporter midiFileImporter = new SongEditorMidiFileImporter();

	public void OnInjectionFinished()
	{
		injector.Inject(midiFileImporter);
		Bind(adjustFollowingNotesToggle, () => settings.SongEditorSettings.AdjustFollowingNotes, (bool newValue) =>
		{
			settings.SongEditorSettings.AdjustFollowingNotes = newValue;
		});
		Bind(autoSaveToggle, () => settings.SongEditorSettings.AutoSave, (bool newValue) =>
		{
			settings.SongEditorSettings.AutoSave = newValue;
		});
		Bind(goToLastPlaybackPositionToggle, () => settings.SongEditorSettings.GoToLastPlaybackPosition, (bool newValue) =>
		{
			settings.SongEditorSettings.GoToLastPlaybackPosition = newValue;
		});
		Bind(musicVolumeSlider, () => settings.AudioSettings.VolumePercent, (float newValue) =>
		{
			settings.AudioSettings.VolumePercent = (int)newValue;
		});
		songAudioPlayer.PlaybackSpeed = settings.SongEditorSettings.MusicPlaybackSpeed;
		Bind(musicPlaybackSpeedSlider, () => settings.SongEditorSettings.MusicPlaybackSpeed, (float newValue) =>
		{
			SetMusicPlaybackSpeed(newValue);
		}, observeValueGetter: false);
		resetMusicPlaybackSpeedButton.RegisterCallbackButtonTriggered(() =>
		{
			SetMusicPlaybackSpeed(1f);
			musicPlaybackSpeedSlider.value = 1f;
		});
		recordingSourceItemPickerControl = new LabeledItemPickerControl<ESongEditorRecordingSource>(recordingSourceItemPicker, EnumUtils.GetValuesAsList<ESongEditorRecordingSource>());
		recordingSourceItemPickerControl.Bind(() => settings.SongEditorSettings.RecordingSource, (ESongEditorRecordingSource newValue) =>
		{
			settings.SongEditorSettings.RecordingSource = newValue;
		});
		List<MicProfile> list = settings.MicProfiles.Where((MicProfile it) => it.IsEnabledAndConnected(serverSideConnectRequestManager)).ToList();
		micDeviceItemPickerControl = new LabeledItemPickerControl<MicProfile>(micDeviceItemPicker, list);
		micDeviceItemPickerControl.GetLabelTextFunction = (MicProfile micProfile) => (micProfile == null) ? "" : micProfile.Name;
		if (settings.SongEditorSettings.MicProfile == null || !settings.SongEditorSettings.MicProfile.IsEnabledAndConnected(serverSideConnectRequestManager))
		{
			settings.SongEditorSettings.MicProfile = list.FirstOrDefault();
		}
		micDeviceItemPickerControl.Bind(() => settings.SongEditorSettings.MicProfile, (MicProfile newValue) =>
		{
			settings.SongEditorSettings.MicProfile = newValue;
		});
		Bind(micOctaveOffsetTextField, () => settings.SongEditorSettings.MicOctaveOffset.ToString(), (string newValue) =>
		{
			PropertyUtils.TrySetIntFromString(newValue, (int newIntValue) =>
			{
				settings.SongEditorSettings.MicOctaveOffset = newIntValue;
			});
		});
		Bind(micDelayTextField, () => settings.SongEditorSettings.MicDelayInMillis.ToString(), (string newValue) =>
		{
			PropertyUtils.TrySetIntFromString(newValue, (int newIntValue) =>
			{
				settings.SongEditorSettings.MicDelayInMillis = newIntValue;
			});
		});
		Bind(buttonRecordingPitchTextField, () => MidiUtils.GetAbsoluteName(settings.SongEditorSettings.MidiNoteForButtonRecording), (string newValue) =>
		{
			if (MidiUtils.TryParseMidiNoteName(newValue, out var midiNote))
			{
				settings.SongEditorSettings.MidiNoteForButtonRecording = midiNote;
			}
		});
		Bind(buttonRecordingButtonTextField, () => settings.SongEditorSettings.ButtonDisplayNameForButtonRecording, (string newValue) =>
		{
			settings.SongEditorSettings.ButtonDisplayNameForButtonRecording = newValue;
		});
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.RecordingSource).Subscribe((ESongEditorRecordingSource _) =>
		{
			UpdateRecordingSettingsVisibility();
		}).AddTo(gameObject);
		Bind(midiNotePlayAlongToggle, () => settings.SongEditorSettings.MidiSoundPlayAlongEnabled, (bool newValue) =>
		{
			settings.SongEditorSettings.MidiSoundPlayAlongEnabled = newValue;
		});
		Bind(midiGainSlider, () => settings.SongEditorSettings.MidiGain, (float newValue) =>
		{
			settings.SongEditorSettings.MidiGain = newValue;
		});
		Bind(midiVelocitySlider, () => settings.SongEditorSettings.MidiVelocity, (float newValue) =>
		{
			settings.SongEditorSettings.MidiVelocity = (int)newValue;
		});
		Bind(midiDelayTextField, () => settings.SongEditorSettings.MidiPlaybackOffsetInMillis.ToString(), (string newValue) =>
		{
			PropertyUtils.TrySetIntFromString(newValue, (int newIntValue) =>
			{
				settings.SongEditorSettings.MidiPlaybackOffsetInMillis = newIntValue;
			});
		});
		importMidiFileButton.RegisterCallbackButtonTriggered(() =>
		{
			CreateImportMidiFileDialog();
		});
		Bind(showLyricsAreaToggle, () => settings.SongEditorSettings.ShowLyricsArea, (bool newValue) =>
		{
			settings.SongEditorSettings.ShowLyricsArea = newValue;
		});
		Bind(showStatusBarToggle, () => settings.SongEditorSettings.ShowStatusBar, (bool newValue) =>
		{
			settings.SongEditorSettings.ShowStatusBar = newValue;
		});
		Bind(showControlHintsToggle, () => settings.SongEditorSettings.ShowControlHints, (bool newValue) =>
		{
			settings.SongEditorSettings.ShowControlHints = newValue;
		});
		Bind(showVideoAreaToggle, () => settings.SongEditorSettings.ShowVideoArea, (bool newValue) =>
		{
			settings.SongEditorSettings.ShowVideoArea = newValue;
		});
		Bind(showVirtualPianoToggle, () => settings.SongEditorSettings.ShowVirtualPianoArea, (bool newValue) =>
		{
			settings.SongEditorSettings.ShowVirtualPianoArea = newValue;
		});
		Bind(showNotePitchLabelToggle, () => settings.SongEditorSettings.ShowNotePitchLabel, (bool newValue) =>
		{
			settings.SongEditorSettings.ShowNotePitchLabel = newValue;
		});
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.ShowLyricsArea).Subscribe((bool newValue) =>
		{
			lyricsArea.SetVisibleByDisplay(newValue);
		}).AddTo(gameObject);
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.ShowStatusBar).Subscribe((bool newValue) =>
		{
			statusBar.SetVisibleByDisplay(newValue);
		}).AddTo(gameObject);
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.ShowVideoArea).Subscribe((bool newValue) =>
		{
			videoArea.SetVisibleByDisplay(newValue);
		}).AddTo(gameObject);
		settings.ObserveEveryValueChanged((Settings it) => it.SongEditorSettings.ShowVirtualPianoArea).Subscribe((bool newValue) =>
		{
			virtualPiano.SetVisibleByDisplay(newValue);
		}).AddTo(gameObject);
		Bind(gridSizeTextField, () => settings.SongEditorSettings.GridSizeInPx.ToString(CultureInfo.InvariantCulture), (string newValue) =>
		{
			PropertyUtils.TrySetFloatFromString(newValue, (float newFloatValue) =>
			{
				settings.SongEditorSettings.GridSizeInPx = newFloatValue;
			});
		});
		Bind(sentenceLineSizeTextField, () => settings.SongEditorSettings.SentenceLineSizeInPx.ToString(CultureInfo.InvariantCulture), (string newValue) =>
		{
			PropertyUtils.TrySetFloatFromString(newValue, (float newFloatValue) =>
			{
				settings.SongEditorSettings.SentenceLineSizeInPx = newFloatValue;
			});
		});
	}

	private void CreateImportMidiFileDialog()
	{
		songEditorSceneControl.CreatePathInputDialog("Import MIDI File", "Enter the absolute path to the MIDI file.", settings.SongEditorSettings.LastMidiFilePath, (string path) =>
		{
			settings.SongEditorSettings.LastMidiFilePath = path;
			midiFileImporter.ImportMidiFile(path);
		});
	}

	private void UpdateRecordingSettingsVisibility()
	{
		bool isVisible = settings.SongEditorSettings.RecordingSource == ESongEditorRecordingSource.Microphone;
		micRecordingContainer.SetVisibleByDisplay(isVisible);
		bool isVisible2 = settings.SongEditorSettings.RecordingSource == ESongEditorRecordingSource.KeyboardButton;
		buttonRecordingContainer.SetVisibleByDisplay(isVisible2);
	}

	private void SetMusicPlaybackSpeed(float newValue)
	{
		float num = (float)Math.Round(newValue, 1);
		if ((double)Mathf.Abs(num - 1f) < 0.1)
		{
			num = 1f;
		}
		settings.SongEditorSettings.MusicPlaybackSpeed = num;
		songAudioPlayer.PlaybackSpeed = num;
	}

	private void Bind<T>(BaseField<T> baseField, Func<T> valueGetter, Action<T> valueSetter, bool observeValueGetter = true)
	{
		baseField.value = valueGetter();
		baseField.RegisterValueChangedCallback((ChangeEvent<T> evt) =>
		{
			valueSetter(evt.newValue);
		});
		if (observeValueGetter)
		{
			(from newValue in this.ObserveEveryValueChanged((SongEditorSideBarSettingsControl _) => valueGetter())
				where !object.Equals(baseField.value, newValue)
				select newValue).Subscribe((T newValue) =>
			{
				baseField.value = newValue;
			}).AddTo(gameObject);
		}
	}
}
