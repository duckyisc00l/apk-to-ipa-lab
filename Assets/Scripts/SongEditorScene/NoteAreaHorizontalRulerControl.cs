using System;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class NoteAreaHorizontalRulerControl : INeedInjection, IInjectionFinishedListener
{
	public static readonly Color normalLineColor = Color.gray;

	public static readonly Color highlightLineColor = Color.white;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject(UxmlName = "verticalGridLabelContainer")]
	private VisualElement verticalGridLabelContainer;

	[Inject(UxmlName = "verticalGridLineContainer")]
	private VisualElement verticalGridLineContainer;

	[Inject(UxmlName = "verticalGrid")]
	private VisualElement verticalGrid;

	[Inject]
	private Settings settings;

	[Inject]
	private GameObject gameObject;

	private ViewportEvent lastViewportEvent;

	private float lastSongMetaBpm;

	private readonly VisualElementPool<Label> labelPool = new VisualElementPool<Label>();

	public void OnInjectionFinished()
	{
		verticalGrid.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			UpdateLines();
			UpdateLabels();
		});
		noteAreaControl.ViewportEventStream.Subscribe(OnViewportChanged);
		settings.ObserveEveryValueChanged((Settings _) => settings.SongEditorSettings.GridSizeInPx).Subscribe((float _) =>
		{
			UpdateLines();
		}).AddTo(gameObject);
	}

	private void OnViewportChanged(ViewportEvent viewportEvent)
	{
		if (viewportEvent == null)
		{
			return;
		}
		if (lastViewportEvent == null || lastViewportEvent.X != viewportEvent.X || lastViewportEvent.Width != viewportEvent.Width || songMeta.Bpm != lastSongMetaBpm)
		{
			lastSongMetaBpm = songMeta.Bpm;
			if (settings.SongEditorSettings.GridSizeInPx > 0f)
			{
				UpdateLines();
			}
			UpdateLabels();
		}
		lastViewportEvent = viewportEvent;
	}

	private void UpdateLines()
	{
		verticalGridLineContainer.Clear();
		int minBeatInViewport = noteAreaControl.MinBeatInViewport;
		int maxBeatInViewport = noteAreaControl.MaxBeatInViewport;
		int num = maxBeatInViewport - minBeatInViewport;
		int num2 = num / 12;
		if (num <= 256)
		{
			num2 = Math.Max(1, (int)Math.Log10(num) * 8);
		}
		int num3 = 0;
		if (num <= 128)
		{
			num3 = num2 / 2;
		}
		if (num <= 48)
		{
			num2 = 4;
			num3 = 1;
		}
		for (int i = minBeatInViewport; i < maxBeatInViewport; i++)
		{
			double beatPosInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, i);
			bool flag = num2 > 0 && i % num2 == 0;
			if (flag)
			{
				DrawVerticalGridLine(beatPosInMillis, highlightLineColor);
			}
			if (num3 > 0 && i % num3 == 0 && !flag)
			{
				DrawVerticalGridLine(beatPosInMillis, normalLineColor);
			}
		}
	}

	private void UpdateLabels()
	{
		labelPool.FreeAllObjects();
		int minBeatInViewport = noteAreaControl.MinBeatInViewport;
		int maxBeatInViewport = noteAreaControl.MaxBeatInViewport;
		int num = maxBeatInViewport - minBeatInViewport;
		int num2 = num / 12;
		if (num <= 256)
		{
			num2 = Math.Max(1, (int)Math.Log10(num) * 8);
		}
		if (num <= 48)
		{
			num2 = 4;
		}
		double labelWidthInMillis = BpmUtils.MillisecondsPerBeat(songMeta) * (double)num2;
		for (int i = minBeatInViewport; i < maxBeatInViewport; i++)
		{
			double beatPosInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, i);
			if (num2 > 0 && i % num2 == 0)
			{
				if (!labelPool.TryGetFreeObject(out var obj))
				{
					obj = CreateLabel();
					labelPool.AddUsedObject(obj);
				}
				UpdateLabelPosition(obj, beatPosInMillis, labelWidthInMillis);
				obj.style.top = 0f;
				obj.text = i.ToString();
			}
		}
	}

	private Label CreateLabel()
	{
		Label label = new Label();
		label.AddToClassList("noteAreaGridLabel");
		label.AddToClassList("verticalGridLabel");
		label.AddToClassList("tinyFont");
		label.style.position = new StyleEnum<Position>(Position.Absolute);
		label.style.unityTextAlign = new StyleEnum<TextAnchor>(TextAnchor.MiddleCenter);
		verticalGridLabelContainer.Add(label);
		return label;
	}

	private void UpdateLabelPosition(Label label, double beatPosInMillis, double labelWidthInMillis)
	{
		float num = (float)(labelWidthInMillis / (double)noteAreaControl.ViewportWidth);
		float num2 = (float)((beatPosInMillis - (double)noteAreaControl.ViewportX) / (double)noteAreaControl.ViewportWidth) - num / 2f;
		label.style.left = new StyleLength(new Length(num2 * 100f, LengthUnit.Percent));
		label.style.width = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
	}

	private void DrawVerticalGridLine(double beatPosInMillis, Color color)
	{
		float gridSizeInPx = settings.SongEditorSettings.GridSizeInPx;
		if (!(gridSizeInPx <= 0f))
		{
			float num = (float)((beatPosInMillis - (double)noteAreaControl.ViewportX) / (double)noteAreaControl.ViewportWidth);
			VisualElement visualElement = new VisualElement();
			visualElement.AddToClassList("gridLine");
			visualElement.AddToClassList("verticalGridLine");
			visualElement.style.backgroundColor = color;
			visualElement.style.left = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
			visualElement.style.width = new StyleLength(new Length(gridSizeInPx, LengthUnit.Pixel));
			verticalGridLineContainer.Add(visualElement);
		}
	}
}
