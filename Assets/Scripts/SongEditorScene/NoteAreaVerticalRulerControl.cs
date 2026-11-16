using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class NoteAreaVerticalRulerControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private SongMeta songMeta;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private Settings settings;

	[Inject(UxmlName = "horizontalGridLabelContainer")]
	private VisualElement horizontalGridLabelContainer;

	[Inject(UxmlName = "horizontalGridLineContainer")]
	private VisualElement horizontalGridLineContainer;

	[Inject(UxmlName = "horizontalGrid")]
	private VisualElement horizontalGrid;

	[Inject]
	private GameObject gameObject;

	private ViewportEvent lastViewportEvent;

	private readonly Label[] labels = new Label[216];

	public void OnInjectionFinished()
	{
		horizontalGrid.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			UpdateMidiNoteLabels();
			if (settings.SongEditorSettings.GridSizeInPx > 0f)
			{
				UpdateMidiNoteLines();
			}
		});
		noteAreaControl.ViewportEventStream.Subscribe(OnViewportChanged);
		settings.ObserveEveryValueChanged((Settings _) => settings.SongEditorSettings.GridSizeInPx).Subscribe((float _) =>
		{
			UpdateMidiNoteLines();
		}).AddTo(gameObject);
	}

	private void OnViewportChanged(ViewportEvent viewportEvent)
	{
		if (viewportEvent != null)
		{
			if (lastViewportEvent == null || lastViewportEvent.Y != viewportEvent.Y || lastViewportEvent.Height != viewportEvent.Height)
			{
				UpdateMidiNoteLabels();
				UpdateMidiNoteLines();
			}
			lastViewportEvent = viewportEvent;
		}
	}

	private void UpdateMidiNoteLines()
	{
		horizontalGridLineContainer.Clear();
		int minMidiNoteInCurrentViewport = noteAreaControl.MinMidiNoteInCurrentViewport;
		int maxMidiNoteInCurrentViewport = noteAreaControl.MaxMidiNoteInCurrentViewport;
		for (int i = minMidiNoteInCurrentViewport; i <= maxMidiNoteInCurrentViewport; i++)
		{
			if (i % 2 == 0)
			{
				Color color = ((MidiUtils.GetRelativePitch(i) == 0) ? NoteAreaHorizontalRulerControl.highlightLineColor : NoteAreaHorizontalRulerControl.normalLineColor);
				DrawHorizontalGridLine(i, color);
			}
		}
	}

	private void UpdateMidiNoteLabels()
	{
		int minMidiNoteInCurrentViewport = noteAreaControl.MinMidiNoteInCurrentViewport;
		int maxMidiNoteInCurrentViewport = noteAreaControl.MaxMidiNoteInCurrentViewport;
		for (int i = 0; i < minMidiNoteInCurrentViewport; i++)
		{
			if (labels[i] != null)
			{
				labels[i].HideByDisplay();
			}
		}
		for (int j = minMidiNoteInCurrentViewport; j <= maxMidiNoteInCurrentViewport; j++)
		{
			if (labels[j] == null)
			{
				labels[j] = CreateLabelForMidiNote(j);
				continue;
			}
			UpdateMidiNoteLabelPosition(labels[j], j);
			labels[j].ShowByDisplay();
		}
		for (int k = maxMidiNoteInCurrentViewport + 1; k <= 215; k++)
		{
			if (labels[k] != null)
			{
				labels[k].HideByDisplay();
			}
		}
	}

	private Label CreateLabelForMidiNote(int midiNote)
	{
		Label label = new Label();
		label.AddToClassList("noteAreaGridLabel");
		label.AddToClassList("horizontalGridLabel");
		label.AddToClassList("tinyFont");
		label.enableRichText = false;
		label.style.position = new StyleEnum<Position>(Position.Absolute);
		label.style.unityTextAlign = new StyleEnum<TextAnchor>(TextAnchor.MiddleCenter);
		label.style.left = 0f;
		string absoluteName = MidiUtils.GetAbsoluteName(midiNote);
		label.text = absoluteName;
		UpdateMidiNoteLabelPosition(label, midiNote);
		horizontalGridLabelContainer.Add(label);
		return label;
	}

	private void UpdateMidiNoteLabelPosition(Label label, int midiNote)
	{
		float heightForSingleNote = noteAreaControl.HeightForSingleNote;
		float num = (float)noteAreaControl.GetVerticalPositionForMidiNote(midiNote) - heightForSingleNote / 2f;
		label.style.top = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
		label.style.height = new StyleLength(new Length(heightForSingleNote * 100f, LengthUnit.Percent));
	}

	private void DrawHorizontalGridLine(int midiNote, Color color)
	{
		float gridSizeInPx = settings.SongEditorSettings.GridSizeInPx;
		if (!(gridSizeInPx <= 0f))
		{
			float num = (float)noteAreaControl.GetVerticalPositionForMidiNote(midiNote);
			VisualElement visualElement = new VisualElement();
			visualElement.AddToClassList("gridLine");
			visualElement.AddToClassList("horizontalGridLine");
			visualElement.style.backgroundColor = color;
			visualElement.style.top = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
			visualElement.style.height = new StyleLength(new Length(gridSizeInPx, LengthUnit.Pixel));
			horizontalGridLineContainer.Add(visualElement);
		}
	}
}
