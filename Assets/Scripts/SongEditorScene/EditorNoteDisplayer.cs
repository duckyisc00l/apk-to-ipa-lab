using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class EditorNoteDisplayer : MonoBehaviour, INeedInjection
{
	public static readonly Color sentenceStartLineColor = Colors.CreateColor("#8F6A4E");

	public static readonly Color sentenceEndLineColor = Colors.CreateColor("#4F878F");

	private const int HideElementThresholdInMillis = 40000;

	[InjectedInInspector]
	public VisualTreeAsset editorNoteUi;

	[InjectedInInspector]
	public VisualTreeAsset editorSentenceUi;

	[Inject(UxmlName = "noteAreaNotes")]
	private VisualElement noteAreaNotes;

	[Inject(UxmlName = "noteAreaNotesBackground")]
	private VisualElement noteAreaNotesBackground;

	[Inject(UxmlName = "noteAreaNotesForeground")]
	private VisualElement noteAreaNotesForeground;

	[Inject(UxmlName = "sentenceLinesContainer")]
	private VisualElement sentenceLinesContainer;

	[Inject(UxmlName = "noteAreaSentences")]
	public VisualElement noteAreaSentences;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private Injector injector;

	[Inject]
	private SongEditorLayerManager songEditorLayerManager;

	[Inject]
	private Settings settings;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	private readonly Dictionary<Voice, List<Sentence>> voiceToSortedSentencesMap = new Dictionary<Voice, List<Sentence>>();

	private readonly Dictionary<Note, EditorNoteControl> noteToControlMap = new Dictionary<Note, EditorNoteControl>();

	private readonly Dictionary<Sentence, EditorSentenceControl> sentenceToControlMap = new Dictionary<Sentence, EditorSentenceControl>();

	private int lastFullUpdateFrame;

	private int lastViewportWidthInMillis;

	private readonly Dictionary<ESongEditorLayer, VisualElement> songEditorLayerToParentElement = new Dictionary<ESongEditorLayer, VisualElement>();

	private Texture2D dashedVerticalLineTexture2D;

	public IReadOnlyCollection<EditorNoteControl> EditorNoteControls => noteToControlMap.Values;

	public IReadOnlyCollection<EditorSentenceControl> EditorSentenceControls => sentenceToControlMap.Values;

	private Texture2D DashedVerticalLineTexture2D
	{
		get
		{
			if (dashedVerticalLineTexture2D == null)
			{
				int num = 4;
				int num2 = 64;
				dashedVerticalLineTexture2D = new Texture2D(num, num2);
				for (int i = 0; i < num; i++)
				{
					for (int j = 0; j < num2; j++)
					{
						Color color = ((j < num2 / 2) ? Color.clear : Color.white);
						dashedVerticalLineTexture2D.SetPixel(i, j, color);
					}
				}
				dashedVerticalLineTexture2D.Apply();
			}
			return dashedVerticalLineTexture2D;
		}
	}

	private void Start()
	{
		noteAreaNotesBackground.Clear();
		noteAreaNotes.Clear();
		noteAreaNotesForeground.Clear();
		noteToControlMap.Clear();
		noteAreaSentences.Clear();
		sentenceToControlMap.Clear();
		ReloadSentences();
		songEditorLayerToParentElement.Add(ESongEditorLayer.ButtonRecording, noteAreaNotesBackground);
		songEditorLayerToParentElement.Add(ESongEditorLayer.MicRecording, noteAreaNotesBackground);
		songEditorLayerToParentElement.Add(ESongEditorLayer.MidiFile, noteAreaNotesBackground);
		songEditorLayerToParentElement.Add(ESongEditorLayer.CopyPaste, noteAreaNotesForeground);
		UpdateNotesAndSentences();
		noteAreaControl.ViewportEventStream.Subscribe((ViewportEvent _) =>
		{
			UpdateNotesAndSentences();
			lastViewportWidthInMillis = noteAreaControl.ViewportWidth;
		}).AddTo(base.gameObject);
		songMetaChangeEventStream.Subscribe((SongMetaChangeEvent evt) =>
		{
			if (evt is LoadedMementoEvent)
			{
				noteAreaNotesBackground.Clear();
				noteAreaNotes.Clear();
				noteAreaNotesForeground.Clear();
				noteToControlMap.Clear();
				noteAreaSentences.Clear();
				sentenceToControlMap.Clear();
			}
			else if (evt is SentencesDeletedEvent sentencesDeletedEvent)
			{
				sentencesDeletedEvent.Sentences.ForEach((Sentence sentence) =>
				{
					RemoveSentence(sentence);
				});
			}
			else if (evt is MovedNotesToVoiceEvent movedNotesToVoiceEvent)
			{
				RemoveSentences(movedNotesToVoiceEvent.RemovedSentences);
			}
			ReloadSentences();
			UpdateNotesAndSentences();
		}).AddTo(base.gameObject);
		sentenceLinesContainer.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			UpdateSentences();
		});
		EnumUtils.GetValuesAsList<ESongEditorLayer>().ForEach((ESongEditorLayer layer) =>
		{
			songEditorLayerManager.ObserveEveryValueChanged((SongEditorLayerManager it) => it.IsEnumLayerVisible(layer)).Subscribe((bool _) =>
			{
				UpdateNotes();
			}).AddTo(base.gameObject);
		});
		settings.SongEditorSettings.ObserveEveryValueChanged((SongEditorSettings it) => it.SentenceLineSizeInPx).Subscribe((float newValue) =>
		{
			if (newValue <= 0f)
			{
				RemoveSentenceMarkerLines();
			}
			else
			{
				UpdateSentenceMarkerLines();
			}
		}).AddTo(base.gameObject);
		settings.SongEditorSettings.ObserveEveryValueChanged((SongEditorSettings it) => it.ShowNotePitchLabel).Subscribe((bool _) =>
		{
			UpdateNotesAndSentences();
		}).AddTo(base.gameObject);
		songEditorLayerManager.LayerChangedEventStream.Subscribe((LayerChangedEvent evt) =>
		{
			if (evt.IsVoiceLayerEvent)
			{
				OnVoiceLayerChanged();
			}
			else
			{
				UpdateNotesAndSentences();
			}
		}).AddTo(base.gameObject);
	}

	public void RemoveSentences(IReadOnlyCollection<Sentence> sentences)
	{
		sentences.ForEach((Sentence sentence) =>
		{
			RemoveSentence(sentence);
		});
	}

	public void RemoveSentence(Sentence sentence)
	{
		if (sentenceToControlMap.TryGetValue(sentence, out var value))
		{
			value.Dispose();
			sentenceToControlMap.Remove(sentence);
		}
	}

	private void OnVoiceLayerChanged()
	{
		noteToControlMap.Keys.Where((Note note) => !songEditorLayerManager.IsVoiceLayerVisible(note.Sentence?.Voice.Name)).ToList().ForEach((Note note) =>
		{
			RemoveNoteControl(note);
		});
		sentenceToControlMap.Keys.Where((Sentence sentence) => !songEditorLayerManager.IsVoiceLayerVisible(sentence.Voice.Name)).ToList().ForEach((Sentence sentence) =>
		{
			RemoveSentence(sentence);
		});
		UpdateNotesAndSentences();
	}

	public void ClearNoteControls()
	{
		noteAreaNotesBackground.Clear();
		noteAreaNotes.Clear();
		noteAreaNotesForeground.Clear();
		noteToControlMap.Values.ForEach((EditorNoteControl editorNoteControl) =>
		{
			editorNoteControl.Dispose();
		});
		noteToControlMap.Clear();
	}

	public void ReloadSentences()
	{
		voiceToSortedSentencesMap.Clear();
		foreach (Voice voice in songMeta.GetVoices())
		{
			List<Sentence> list = new List<Sentence>(voice.Sentences);
			list.Sort(Sentence.comparerByStartBeat);
			voiceToSortedSentencesMap.Add(voice, list);
		}
	}

	public void UpdateNotesAndSentences()
	{
		UpdateNotes();
		UpdateSentences();
	}

	public void UpdateSentences()
	{
		if (base.gameObject.activeInHierarchy)
		{
			UpdateSentenceControls();
			UpdateSentenceMarkerLines();
		}
	}

	private void UpdateSentenceControls()
	{
		(from voice in songMeta.GetVoices()
			where songEditorLayerManager.IsVoiceLayerVisible(voice.Name)
			select voice).ToList().ForEach((Voice voice) =>
		{
			CreateSentenceControlForVoice(voice);
		});
	}

	private void RemoveSentenceMarkerLines()
	{
		sentenceLinesContainer.Clear();
	}

	private void UpdateSentenceMarkerLines()
	{
		if (settings.SongEditorSettings.SentenceLineSizeInPx <= 0f)
		{
			return;
		}
		if (noteAreaControl.ViewportWidth > 40000)
		{
			if (lastViewportWidthInMillis <= 40000)
			{
				RemoveSentenceMarkerLines();
				lastViewportWidthInMillis = noteAreaControl.ViewportWidth;
			}
			return;
		}
		List<Voice> list = (from voice in songMeta.GetVoices()
			where songEditorLayerManager.IsVoiceLayerVisible(voice.Name)
			select voice).ToList();
		sentenceLinesContainer.Clear();
		list.ForEach((Voice voice) =>
		{
			DrawSentenceMarkerLineForVoice(voice);
		});
	}

	private List<Sentence> GetSortedSentencesForVoice(Voice voice)
	{
		if (voiceToSortedSentencesMap.TryGetValue(voice, out var value))
		{
			return value;
		}
		return new List<Sentence>();
	}

	private void CreateSentenceControlForVoice(Voice voice)
	{
		List<Sentence> sortedSentencesForVoice = GetSortedSentencesForVoice(voice);
		int sentenceIndex = 0;
		sortedSentencesForVoice.ForEach((Sentence sentence) =>
		{
			EditorSentenceControl value;
			if (noteAreaControl.IsInViewport(sentence))
			{
				float xStartPercent = (float)noteAreaControl.GetHorizontalPositionForBeat(sentence.MinBeat);
				float xEndPercent = (float)noteAreaControl.GetHorizontalPositionForBeat(sentence.ExtendedMaxBeat);
				UpdateOrCreateSentenceControl(sentence, xStartPercent, xEndPercent, sentenceIndex);
			}
			else if (sentenceToControlMap.TryGetValue(sentence, out value))
			{
				value.Dispose();
				sentenceToControlMap.Remove(sentence);
			}
			sentenceIndex++;
		});
	}

	public void UpdateNotes()
	{
		if (!(base.gameObject == null) && base.gameObject.activeInHierarchy)
		{
			HideNoteControlsOutsideOfViewport();
			DrawNotesInLayers(EnumUtils.GetValuesAsList<ESongEditorLayer>());
			DrawNotesInSongFile();
		}
	}

	public EditorNoteControl GetNoteControl(Note note)
	{
		if (noteToControlMap.TryGetValue(note, out var value))
		{
			return value;
		}
		return null;
	}

	public void RemoveNoteControl(EditorNoteControl noteControl)
	{
		noteControl.Dispose();
		noteToControlMap.Remove(noteControl.Note);
	}

	public void RemoveNoteControl(Note note)
	{
		if (noteToControlMap.TryGetValue(note, out var value))
		{
			RemoveNoteControl(value);
		}
	}

	private void HideNoteControlsOutsideOfViewport()
	{
		foreach (EditorNoteControl item in (IEnumerable<EditorNoteControl>)new List<EditorNoteControl>(noteToControlMap.Values))
		{
			Note note = item.Note;
			if (!noteAreaControl.IsInViewport(note))
			{
				HideNoteControl(item);
			}
		}
	}

	private void HideNoteControl(EditorNoteControl editorNoteControl)
	{
		editorNoteControl.VisualElement.HideByDisplay();
	}

	private void ShowNoteControl(EditorNoteControl editorNoteControl)
	{
		editorNoteControl.VisualElement.ShowByDisplay();
	}

	private void DrawNotesInLayers(List<ESongEditorLayer> layerEnums)
	{
		foreach (ESongEditorLayer layerEnum in layerEnums)
		{
			if (songEditorLayerManager.IsEnumLayerVisible(layerEnum))
			{
				DrawNotesInLayer(layerEnum);
			}
			else
			{
				ClearNotesInLayer(layerEnum);
			}
		}
	}

	public void ClearNotesInLayer(ESongEditorLayer layerKey)
	{
		(from note in songEditorLayerManager.GetEnumLayerNotes(layerKey)
			where note.Sentence == null
			select note).ToList().ForEach((Note note) =>
		{
			if (noteToControlMap.TryGetValue(note, out var value))
			{
				RemoveNoteControl(value);
			}
		});
	}

	public bool AnyNoteControlContainsPosition(Vector2 pos)
	{
		return EditorNoteControls.AnyMatch((EditorNoteControl editorNoteControl) => editorNoteControl.VisualElement.worldBound.Contains(pos));
	}

	public bool AnySentenceControlContainsPosition(Vector2 pos)
	{
		return EditorSentenceControls.AnyMatch((EditorSentenceControl editorSentenceControl) => editorSentenceControl.VisualElement.worldBound.Contains(pos));
	}

	private void DrawNotesInLayer(ESongEditorLayer layerEnum)
	{
		IEnumerable<Note> enumerable = from note in songEditorLayerManager.GetEnumLayerNotes(layerEnum)
			where note.Sentence == null
			where noteAreaControl.IsInViewport(note)
			select note;
		Color enumLayerColor = songEditorLayerManager.GetEnumLayerColor(layerEnum);
		SongEditorEnumLayer enumLayer = songEditorLayerManager.GetEnumLayer(layerEnum);
		foreach (Note item in enumerable)
		{
			UpdateOrCreateNoteControl(item, enumLayer)?.SetColor(enumLayerColor);
		}
	}

	private void DrawNotesInSongFile()
	{
		CollectionExtensions.ForEach((from voice in songMeta.GetVoices()
			where songEditorLayerManager.IsVoiceLayerVisible(voice.Name)
			select voice).ToList(), (Voice voice) =>
		{
			DrawNotesInVoice(voice);
		});
	}

	private void DrawNotesInVoice(Voice voice)
	{
		foreach (Note item in (from note in (from sentence in GetSortedSentencesForVoice(voice)
				where noteAreaControl.IsInViewport(sentence)
				select sentence).ToList().SelectMany((Sentence sentence) => sentence.Notes)
			where noteAreaControl.IsInViewport(note)
			select note).ToList())
		{
			UpdateOrCreateNoteControl(item, null);
		}
	}

	private void UpdateOrCreateSentenceControl(Sentence sentence, float xStartPercent, float xEndPercent, int sentenceIndex)
	{
		if (!sentenceToControlMap.TryGetValue(sentence, out var value))
		{
			VisualElement visualElement = editorSentenceUi.CloneTree().Children().First();
			value = injector.WithRootVisualElement(visualElement).WithBindingForInstance(sentence).CreateAndInject<EditorSentenceControl>();
			sentenceToControlMap[sentence] = value;
			noteAreaSentences.Add(visualElement);
		}
		string text = (sentenceIndex + 1).ToString();
		value.SetText(text);
		if (sentence.Voice != null)
		{
			Color voiceLayerColor = songEditorLayerManager.GetVoiceLayerColor(sentence.Voice.Name);
			value.SetColor(voiceLayerColor);
			if (sentenceIndex % 2 == 0)
			{
				Color color = songEditorLayerManager.GetVoiceLayerColor(sentence.Voice.Name).Multiply(0.66f);
				value.SetColor(color);
			}
		}
		PositionSentenceControl(value.VisualElement, xStartPercent, xEndPercent);
	}

	private void PositionSentenceControl(VisualElement visualElement, float xStartPercent, float xEndPercent)
	{
		float num = xEndPercent - xStartPercent;
		visualElement.style.left = new StyleLength(new Length(xStartPercent * 100f, LengthUnit.Percent));
		visualElement.style.bottom = 0f;
		visualElement.style.width = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
	}

	private void DrawSentenceMarkerLineForVoice(Voice voice)
	{
		GetSortedSentencesForVoice(voice).ForEach((Sentence sentence) =>
		{
			float xPercent = (float)noteAreaControl.GetHorizontalPositionForBeat(sentence.MinBeat);
			float xPercent2 = (float)noteAreaControl.GetHorizontalPositionForBeat(sentence.ExtendedMaxBeat);
			DrawSentenceMarkerLine(xPercent, sentenceStartLineColor, 0);
			DrawSentenceMarkerLine(xPercent2, sentenceEndLineColor, DashedVerticalLineTexture2D.height / 2);
		});
	}

	private void DrawSentenceMarkerLine(float xPercent, Color color, int yDashOffset)
	{
		float sentenceLineSizeInPx = settings.SongEditorSettings.SentenceLineSizeInPx;
		if (!(xPercent < 0f) && !(xPercent > 1f) && !(sentenceLineSizeInPx <= 0f))
		{
			VisualElement visualElement = new VisualElement();
			visualElement.AddToClassList("sentenceMarkerLine");
			visualElement.style.backgroundImage = new StyleBackground(DashedVerticalLineTexture2D);
			visualElement.style.backgroundPositionY = new StyleBackgroundPosition(new BackgroundPosition(BackgroundPositionKeyword.Top, yDashOffset));
			visualElement.style.unityBackgroundImageTintColor = new StyleColor(color);
			visualElement.style.left = new StyleLength(new Length(xPercent * 100f, LengthUnit.Percent));
			visualElement.style.width = new StyleLength(new Length(sentenceLineSizeInPx, LengthUnit.Pixel));
			sentenceLinesContainer.Add(visualElement);
		}
	}

	private EditorNoteControl UpdateOrCreateNoteControl(Note note, SongEditorEnumLayer layer)
	{
		if (!noteToControlMap.TryGetValue(note, out var value))
		{
			VisualElement visualElement = editorNoteUi.CloneTree().Children().First();
			value = injector.WithRootVisualElement(visualElement).WithBindingForInstance(note).CreateAndInject<EditorNoteControl>();
			noteToControlMap.Add(note, value);
			((layer != null) ? songEditorLayerToParentElement[layer.LayerEnum] : noteAreaNotes).Add(visualElement);
		}
		else
		{
			value.SyncWithNote();
		}
		float heightFactor = ((layer != null) ? 0.66f : 1f);
		PositionNoteControl(value.VisualElement, note.MidiNote, note.StartBeat, note.EndBeat, heightFactor);
		ShowNoteControl(value);
		if (noteAreaControl.ViewportWidth < 40000)
		{
			if (settings.SongEditorSettings.ShowNotePitchLabel)
			{
				value.ShowPitchLabel();
			}
			else
			{
				value.HidePitchLabel();
			}
			value.ShowLyricsLabel();
		}
		else
		{
			value.HidePitchLabel();
			value.HideLyricsLabel();
		}
		if (note.IsEditable)
		{
			value.VisualElement.pickingMode = PickingMode.Position;
		}
		else
		{
			value.VisualElement.pickingMode = PickingMode.Ignore;
		}
		return value;
	}

	private void PositionNoteControl(VisualElement visualElement, int midiNote, int startBeat, int endBeat, float heightFactor)
	{
		float num = noteAreaControl.HeightForSingleNote * heightFactor;
		float num2 = (float)noteAreaControl.GetVerticalPositionForMidiNote(midiNote) - num / 2f;
		float num3 = (float)noteAreaControl.GetHorizontalPositionForBeat(startBeat);
		float num4 = (float)noteAreaControl.GetHorizontalPositionForBeat(endBeat) - num3;
		visualElement.style.left = new StyleLength(new Length(num3 * 100f, LengthUnit.Percent));
		visualElement.style.top = new StyleLength(new Length(num2 * 100f, LengthUnit.Percent));
		visualElement.style.width = new StyleLength(new Length(num4 * 100f, LengthUnit.Percent));
		visualElement.style.height = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
	}

	private void OnDestroy()
	{
		Object.Destroy(dashedVerticalLineTexture2D);
	}
}
