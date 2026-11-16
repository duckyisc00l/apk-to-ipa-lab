using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class SongEditorSideBarPropertiesControl : INeedInjection, IInjectionFinishedListener
{
	private class SongPropertyInputControl
	{
		public TextField TextField { get; set; }

		public Label Label { get; set; }

		public string LabelText { get; set; }

		public Func<string> ValueGetter { get; set; }

		public Action<string> ValueSetter { get; set; }
	}

	[Inject(Key = "songPropertySideBarEntryUi")]
	private VisualTreeAsset songPropertySideBarEntryUi;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongMeta songMeta;

	[Inject(UxmlName = "songPropertiesSideBarContainer")]
	private VisualElement songPropertiesSideBarContainer;

	[Inject(UxmlName = "detectBpmButton")]
	private Button detectBpmButton;

	[Inject(UxmlName = "detectBpmLabel")]
	private Label detectBpmLabel;

	[Inject(UxmlName = "bpmTextField")]
	private TextField bpmTextField;

	[Inject(UxmlName = "setBpmKeepNoteDurationButton")]
	private Button setBpmKeepNoteDurationButton;

	[Inject(UxmlName = "setBpmChangeNoteDurationButton")]
	private Button setBpmChangeNoteDurationButton;

	[Inject]
	private ApplyBpmAndAdjustNoteLengthAction applyBpmAndAdjustNoteLengthAction;

	[Inject]
	private ApplyBpmDontAdjustNoteLengthAction applyBpmDontAdjustNoteLengthAction;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	private DetectBpmControl detectBpmControl;

	private readonly List<SongPropertyInputControl> songPropertyInputControls = new List<SongPropertyInputControl>();

	public void OnInjectionFinished()
	{
		CreateSongPropertiesInputControls();
		songMetaChangeEventStream.Where((SongMetaChangeEvent evt) => evt is SongPropertyChangedEvent).Subscribe((SongMetaChangeEvent _) =>
		{
			UpdateSongPropertyInputControls();
		});
		detectBpmControl = new DetectBpmControl(detectBpmButton, detectBpmLabel);
		bpmTextField.AddToClassList("disabled");
		bpmTextField.value = songMeta.Bpm.ToString("0.00", CultureInfo.InvariantCulture);
		setBpmChangeNoteDurationButton.RegisterCallbackButtonTriggered(() =>
		{
			songEditorSceneControl.CreateNumberInputDialog("Set BPM and change note duration", "Enter new BPM value", (float newBpm) =>
			{
				applyBpmDontAdjustNoteLengthAction.ExecuteAndNotify(newBpm);
			});
		});
		setBpmKeepNoteDurationButton.RegisterCallbackButtonTriggered(() =>
		{
			songEditorSceneControl.CreateNumberInputDialog("Set BPM but keep note duration", "Enter new BPM value", (float newBpm) =>
			{
				applyBpmAndAdjustNoteLengthAction.ExecuteAndNotify(newBpm);
			});
		});
	}

	private void CreateSongPropertiesInputControls()
	{
		CreateSongPropertiesInputControl(ESongProperty.Artist, TranslationManager.GetTranslation(R.Messages.songProperty_artist), () => songMeta.Artist, null);
		CreateSongPropertiesInputControl(ESongProperty.Title, TranslationManager.GetTranslation(R.Messages.songProperty_title), () => songMeta.Title, null);
		CreateSongPropertiesInputControl(ESongProperty.Mp3, "Audio", () => songMeta.Mp3, null);
		CreateSongPropertiesInputControl(ESongProperty.Video, "Video", () => songMeta.Video, (string newValue) =>
		{
			songMeta.Video = newValue;
		});
		CreateSongPropertiesInputControl(ESongProperty.Background, "Background", () => songMeta.Background, (string newValue) =>
		{
			songMeta.Background = newValue;
		});
		CreateSongPropertiesInputControl(ESongProperty.Cover, "Cover", () => songMeta.Cover, (string newValue) =>
		{
			songMeta.Cover = newValue;
		});
		CreateSongPropertiesInputControl(ESongProperty.Gap, "Gap (ms)", PropertyUtils.CreateStringGetterFromFloatGetter(() => songMeta.Gap, zeroToEmpty: true, "0.00"), PropertyUtils.CreateStringSetterFromFloatSetter((float newValue) =>
		{
			songMeta.Gap = newValue;
		}));
		CreateSongPropertiesInputControl(ESongProperty.VideoGap, "Video Gap (s)", PropertyUtils.CreateStringGetterFromFloatGetter(() => songMeta.VideoGap, zeroToEmpty: true, "0.00"), PropertyUtils.CreateStringSetterFromFloatSetter((float newValue) =>
		{
			songMeta.VideoGap = newValue;
		}));
		CreateSongPropertiesInputControl(ESongProperty.PreviewStart, "Preview Start (beat)", PropertyUtils.CreateStringGetterFromFloatGetter(() => songMeta.PreviewStart, zeroToEmpty: true, "0.00"), PropertyUtils.CreateStringSetterFromFloatSetter((float newValue) =>
		{
			songMeta.PreviewStart = newValue;
		}));
		CreateSongPropertiesInputControl(ESongProperty.PreviewEnd, "Preview End (beat)", PropertyUtils.CreateStringGetterFromFloatGetter(() => songMeta.PreviewEnd, zeroToEmpty: true, "0.00"), PropertyUtils.CreateStringSetterFromFloatSetter((float newValue) =>
		{
			songMeta.PreviewEnd = newValue;
		}));
		CreateSongPropertiesInputControl(ESongProperty.Language, TranslationManager.GetTranslation(R.Messages.songProperty_language), () => songMeta.Language, (string newValue) =>
		{
			songMeta.Language = newValue;
		});
		CreateSongPropertiesInputControl(ESongProperty.Edition, TranslationManager.GetTranslation(R.Messages.songProperty_edition), () => songMeta.Edition, (string newValue) =>
		{
			songMeta.Edition = newValue;
		});
		CreateSongPropertiesInputControl(ESongProperty.Genre, TranslationManager.GetTranslation(R.Messages.songProperty_genre), () => songMeta.Genre, (string newValue) =>
		{
			songMeta.Genre = newValue;
		});
		CreateSongPropertiesInputControl(ESongProperty.Year, TranslationManager.GetTranslation(R.Messages.songProperty_year), PropertyUtils.CreateStringGetterFromUintGetter(() => songMeta.Year, zeroToEmpty: true), PropertyUtils.CreateStringSetterFromUintSetter((uint newValue) =>
		{
			songMeta.Year = newValue;
		}));
		songMeta.UnknownHeaderEntries.ForEach((KeyValuePair<string, string> entry) =>
		{
			CreateSongPropertiesInputControl(ESongProperty.Other, entry.Key, () => songMeta.UnknownHeaderEntries[entry.Key], (string newValue) =>
			{
				songMeta.SetUnknownHeaderEntry(entry.Key, newValue);
			});
		});
	}

	private void CreateSongPropertiesInputControl(ESongProperty songProperty, string labelText, Func<string> valueGetter, Action<string> valueSetter)
	{
		VisualElement visualElement = songPropertySideBarEntryUi.CloneTree().Children().First();
		songPropertiesSideBarContainer.Add(visualElement);
		Label label = visualElement.Q<Label>("propertyNameLabel");
		label.text = labelText;
		TextField textField = visualElement.Q<TextField>("propertyTextField");
		textField.isDelayed = true;
		textField.value = valueGetter();
		if (valueSetter == null)
		{
			textField.AddToClassList("disabled");
			textField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
			{
				if (evt.newValue.Trim() != valueGetter())
				{
					textField.value = valueGetter();
				}
			});
		}
		else
		{
			textField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
			{
				string text = evt.newValue.Trim();
				if (text != valueGetter())
				{
					valueSetter(text);
					songMetaChangeEventStream.OnNext(new SongPropertyChangedEvent(songProperty));
				}
			});
		}
		songPropertyInputControls.Add(new SongPropertyInputControl
		{
			TextField = textField,
			Label = label,
			LabelText = labelText,
			ValueGetter = valueGetter,
			ValueSetter = valueSetter
		});
	}

	private void UpdateSongPropertyInputControls()
	{
		songPropertyInputControls.ForEach((SongPropertyInputControl it) =>
		{
			string text = it.ValueGetter();
			if (text != it.TextField.value)
			{
				it.TextField.value = text;
			}
		});
		bpmTextField.value = songMeta.Bpm.ToString("0.00", CultureInfo.InvariantCulture);
	}
}
