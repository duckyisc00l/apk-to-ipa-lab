using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class NoteAreaControl : INeedInjection, IInjectionFinishedListener
{
	private const float ViewportAutomaticScrollingBoarderPercent = 0.0333f;

	private const float ViewportAutomaticScrollingJumpPercent = 0.333f;

	private const int DefaultViewportWidthInMillis = 8000;

	private const float DoubleClickToTogglePlayPauseDistanceThresholdInPx = 5f;

	public const int ViewportMinHeight = 12;

	public const int ViewportMaxHeight = 88;

	public const int ViewportMinWidth = 1000;

	public const int MinViewportY = 0;

	public const int MaxViewportY = 127;

	public const int MaxMidiNoteInViewport = 215;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongEditorLayerManager songEditorLayerManager;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private Injector injector;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject(UxmlName = "noteAreaPositionInSongIndicator")]
	private VisualElement noteAreaPositionInSongIndicator;

	private NoteAreaContextMenuControl contextMenuControl;

	private NoteAreaScrollingDragListener scrollingDragListener;

	private NoteAreaSelectionDragListener selectionDragListener;

	private ManipulateNotesDragListener manipulateNotesDragListener;

	private SongEditorMicPitchIndicatorControl micPitchIndicatorControl;

	private PanelHelper panelHelper;

	private readonly Subject<ViewportEvent> viewportEventStream = new Subject<ViewportEvent>();

	private float lastClickTime;

	private Vector2 lastClickPosition;

	public int ViewportMaxWidth => (int)songAudioPlayer.DurationOfSongInMillis;

	public int ViewportY { get; private set; }

	public int ViewportHeight { get; private set; }

	public int ViewportX { get; private set; }

	public int ViewportWidth { get; private set; }

	public int ViewportWidthInBeats => MaxBeatInViewport - MinBeatInViewport;

	public int MinBeatInViewport { get; private set; }

	public int MaxBeatInViewport { get; private set; }

	public int MinMillisecondsInViewport { get; private set; }

	public int MaxMillisecondsInViewport { get; private set; }

	public int MinMidiNoteInCurrentViewport { get; private set; }

	public int MaxMidiNoteInCurrentViewport { get; private set; }

	public double MillisecondsPerBeat { get; private set; }

	public float HeightForSingleNote { get; private set; }

	[Inject(UxmlName = "noteArea")]
	public VisualElement VisualElement { get; private set; }

	public NoteAreaDragControl DragControl { get; private set; }

	public IObservable<ViewportEvent> ViewportEventStream => viewportEventStream;

	public void OnInjectionFinished()
	{
		panelHelper = new PanelHelper(uiDocument);
		MillisecondsPerBeat = BpmUtils.MillisecondsPerBeat(songMeta);
		if (songAudioPlayer.PositionInSongInMillis == 0.0)
		{
			songAudioPlayer.PositionInSongInMillis = songMeta.Gap - 2000f;
		}
		VisualElement.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			InitializeViewport();
		});
		songAudioPlayer.PositionInSongEventStream.Subscribe(SetPositionInSongInMillis);
		songMetaChangeEventStream.Subscribe(OnSongMetaChanged);
		injector.WithRootVisualElement(VisualElement).CreateAndInject<NoteAreaHorizontalRulerControl>();
		injector.WithRootVisualElement(VisualElement).CreateAndInject<NoteAreaVerticalRulerControl>();
		UpdatePositionInSongIndicator(songAudioPlayer.PositionInSongInMillis);
		ViewportEventStream.Subscribe((ViewportEvent _) =>
		{
			UpdatePositionInSongIndicator(songAudioPlayer.PositionInSongInMillis);
		});
		VisualElement.RegisterCallback((PointerUpEvent evt) =>
		{
			OnPointerClick(evt);
		}, TrickleDown.TrickleDown);
		DragControl = injector.WithRootVisualElement(VisualElement).CreateAndInject<NoteAreaDragControl>();
		scrollingDragListener = injector.WithRootVisualElement(VisualElement).WithBindingForInstance(DragControl).CreateAndInject<NoteAreaScrollingDragListener>();
		selectionDragListener = injector.WithRootVisualElement(VisualElement).WithBindingForInstance(DragControl).CreateAndInject<NoteAreaSelectionDragListener>();
		manipulateNotesDragListener = injector.WithRootVisualElement(VisualElement).WithBindingForInstance(DragControl).CreateAndInject<ManipulateNotesDragListener>();
		contextMenuControl = injector.WithRootVisualElement(VisualElement).WithBindingForInstance(DragControl).CreateAndInject<NoteAreaContextMenuControl>();
		micPitchIndicatorControl = injector.CreateAndInject<SongEditorMicPitchIndicatorControl>();
	}

	public void Update()
	{
		selectionDragListener.UpdateAutoScroll();
	}

	private void OnSongMetaChanged(SongMetaChangeEvent changeEvent)
	{
		if (changeEvent is SongPropertyChangedEvent songPropertyChangedEvent)
		{
			if (songPropertyChangedEvent.SongProperty == ESongProperty.Bpm)
			{
				goto IL_001d;
			}
		}
		else if (changeEvent is LoadedMementoEvent)
		{
			goto IL_001d;
		}
		bool flag = false;
		goto IL_0023;
		IL_001d:
		flag = true;
		goto IL_0023;
		IL_0023:
		if (flag)
		{
			SetViewportHorizontal(ViewportX, ViewportWidth);
		}
	}

	public void FitViewportVerticalToNotes()
	{
		List<Note> allEnumLayerNotes = songEditorLayerManager.GetAllEnumLayerNotes();
		List<Note> collection = songMeta.GetVoices().SelectMany((Voice voice) => voice.Sentences).SelectMany((Sentence sentence) => sentence.Notes)
			.ToList();
		List<Note> list = new List<Note>();
		list.AddRange(allEnumLayerNotes);
		list.AddRange(collection);
		int num = list.Select((Note note) => note.MidiNote).Min();
		int num2 = list.Select((Note note) => note.MidiNote).Max();
		if (num > 0 && num2 > 0)
		{
			int newViewportY = num - 1;
			int newViewportHeight = num2 - num + 2;
			SetViewportVertical(newViewportY, newViewportHeight);
		}
	}

	public void FitViewportHorizontal(int minBeat, int maxBeat)
	{
		maxBeat = NumberUtils.Limit(maxBeat, 0, maxBeat);
		minBeat = NumberUtils.Limit(minBeat, 0, maxBeat);
		double num = BpmUtils.BeatToMillisecondsInSong(songMeta, minBeat);
		double num2 = BpmUtils.BeatToMillisecondsInSong(songMeta, maxBeat);
		int newViewportX = (int)Math.Floor(num);
		int newViewportWidth = (int)Math.Ceiling(num2 - num);
		SetViewportHorizontal(newViewportX, newViewportWidth);
	}

	private void SetPositionInSongInMillis(double positionInSongInMillis)
	{
		float num = (float)ViewportX + (float)ViewportWidth * 0.0333f;
		float num2 = (float)ViewportX + (float)ViewportWidth * 0.9667f;
		if (positionInSongInMillis < (double)ViewportX || positionInSongInMillis > (double)(ViewportX + ViewportWidth))
		{
			double num3 = positionInSongInMillis - (double)ViewportWidth * 0.5;
			SetViewportX((int)num3);
		}
		else if (positionInSongInMillis < (double)num)
		{
			double num4 = positionInSongInMillis - (double)((float)ViewportWidth * 0.333f);
			SetViewportX((int)num4);
		}
		else if (positionInSongInMillis > (double)num2)
		{
			double num5 = positionInSongInMillis - (double)((float)ViewportWidth * 0.667f);
			SetViewportX((int)num5);
		}
		UpdatePositionInSongIndicator(positionInSongInMillis);
	}

	public bool IsNoteVisible(Note note)
	{
		if (note.MidiNote < MinMidiNoteInCurrentViewport || note.MidiNote > MaxMidiNoteInCurrentViewport)
		{
			return false;
		}
		double num = BpmUtils.BeatToMillisecondsInSong(songMeta, note.StartBeat);
		double num2 = BpmUtils.BeatToMillisecondsInSong(songMeta, note.EndBeat);
		if (num >= (double)MinMillisecondsInViewport)
		{
			return num2 <= (double)MaxMillisecondsInViewport;
		}
		return false;
	}

	public double GetVerticalPositionForMidiNote(int midiNote)
	{
		if (ViewportHeight == 0)
		{
			return 0.0;
		}
		return 1.0 - (double)(midiNote - ViewportY) / (double)ViewportHeight;
	}

	public double GetHorizontalPositionForMillis(double positionInSongInMillis)
	{
		if (ViewportWidth == 0)
		{
			return 0.0;
		}
		return (positionInSongInMillis - (double)ViewportX) / (double)ViewportWidth;
	}

	public double GetHorizontalPositionForBeat(int beat)
	{
		double positionInSongInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, beat);
		return GetHorizontalPositionForMillis(positionInSongInMillis);
	}

	public bool IsInViewport(Note note)
	{
		if (note.StartBeat <= MaxBeatInViewport && note.EndBeat >= MinBeatInViewport && note.MidiNote <= MaxMidiNoteInCurrentViewport)
		{
			return note.MidiNote >= MinMidiNoteInCurrentViewport;
		}
		return false;
	}

	public bool IsInViewport(Sentence sentence)
	{
		if (MinBeatInViewport <= sentence.ExtendedMaxBeat)
		{
			return sentence.MinBeat <= MaxBeatInViewport;
		}
		return false;
	}

	public bool IsBeatInViewport(int beat)
	{
		if (MinBeatInViewport <= beat)
		{
			return beat <= MaxBeatInViewport;
		}
		return false;
	}

	public void ScrollHorizontal(int direction)
	{
		int viewportX = ViewportX + direction * (int)((double)ViewportWidth * 0.2);
		SetViewportX(viewportX);
	}

	public int GetHorizontalMousePositionInMillis()
	{
		Vector2 pointerPositionInPanelCoordinates = InputUtils.GetPointerPositionInPanelCoordinates(panelHelper, invertY: true);
		float width = VisualElement.contentRect.width;
		double num = (pointerPositionInPanelCoordinates.x - VisualElement.worldBound.x) / width;
		return ViewportX + (int)(num * (double)ViewportWidth);
	}

	public double GetHorizontalMousePositionInBeats()
	{
		int horizontalMousePositionInMillis = GetHorizontalMousePositionInMillis();
		return BpmUtils.MillisecondInSongToBeat(songMeta, horizontalMousePositionInMillis);
	}

	public int GetVerticalMousePositionInMidiNote()
	{
		return ScreenPixelPositionToMidiNote(InputUtils.GetPointerPositionInPanelCoordinates(panelHelper, invertY: true).y);
	}

	public void ZoomHorizontal(int direction)
	{
		double num = 0.25;
		Vector2 pointerPositionInPanelCoordinates = InputUtils.GetPointerPositionInPanelCoordinates(panelHelper, invertY: true);
		float width = VisualElement.worldBound.width;
		double num2 = (pointerPositionInPanelCoordinates.x - VisualElement.worldBound.x) / width;
		double num3 = ((direction > 0) ? (1.0 - num) : (1.0 + num));
		int value = (int)((double)ViewportWidth * num3);
		value = NumberUtils.Limit(value, 1000, ViewportMaxWidth);
		if (value != ViewportWidth)
		{
			int num4 = (int)((double)(ViewportWidth - value) * num2);
			int newViewportX = ViewportX + num4;
			if (ViewportWidth != value)
			{
				SetViewportHorizontal(newViewportX, value);
			}
		}
	}

	public void ScrollVertical(int direction)
	{
		int viewportY = ViewportY + direction;
		SetViewportY(viewportY);
	}

	public void ZoomVertical(int direction)
	{
		if ((direction >= 0 || ViewportHeight < 88) && (direction <= 0 || ViewportHeight > 12))
		{
			double num = 0.25;
			Vector2 pointerPositionInPanelCoordinates = InputUtils.GetPointerPositionInPanelCoordinates(panelHelper, invertY: true);
			float height = VisualElement.contentRect.height;
			double num2 = (pointerPositionInPanelCoordinates.y - VisualElement.worldBound.y) / height;
			double num3 = ((direction > 0) ? (1.0 - num) : (1.0 + num));
			int num4 = (int)((double)ViewportHeight * num3);
			int num5 = (int)((double)(ViewportHeight - num4) * num2);
			int newViewportY = ViewportY + num5;
			if (ViewportHeight != num4)
			{
				SetViewportVertical(newViewportY, num4);
			}
		}
	}

	public void SetViewportX(int newViewportX)
	{
		SetViewportXWithoutChangeEvent(newViewportX);
		FireViewportChangedEvent();
	}

	public void SetViewportY(int newViewportY)
	{
		SetViewportYWithoutChangeEvent(newViewportY);
		FireViewportChangedEvent();
	}

	public void SetViewportHeight(int newViewportHeight)
	{
		SetViewportHeightWithoutChangeEvent(newViewportHeight);
		FireViewportChangedEvent();
	}

	public void SetViewportWidth(int newViewportWidth)
	{
		SetViewportWidthWithoutChangeEvent(newViewportWidth);
		FireViewportChangedEvent();
	}

	public void SetViewportHorizontal(int newViewportX, int newViewportWidth)
	{
		SetViewportXWithoutChangeEvent(newViewportX);
		SetViewportWidthWithoutChangeEvent(newViewportWidth);
		FireViewportChangedEvent();
	}

	public void SetViewportVertical(int newViewportY, int newViewportHeight)
	{
		SetViewportYWithoutChangeEvent(newViewportY);
		SetViewportHeightWithoutChangeEvent(newViewportHeight);
		FireViewportChangedEvent();
	}

	public void SetViewport(int newViewportX, int newViewportY, int newViewportWidth, int newViewportHeight)
	{
		SetViewportXWithoutChangeEvent(newViewportX);
		SetViewportWidthWithoutChangeEvent(newViewportWidth);
		SetViewportYWithoutChangeEvent(newViewportY);
		SetViewportHeightWithoutChangeEvent(newViewportHeight);
		FireViewportChangedEvent();
	}

	private void SetViewportXWithoutChangeEvent(int newViewportX)
	{
		if (newViewportX < 0)
		{
			newViewportX = 0;
		}
		if (newViewportX >= ViewportMaxWidth)
		{
			newViewportX = ViewportMaxWidth;
		}
		ViewportX = newViewportX;
		MinMillisecondsInViewport = ViewportX;
		MaxMillisecondsInViewport = ViewportX + ViewportWidth;
		MinBeatInViewport = (int)Math.Floor(BpmUtils.MillisecondInSongToBeat(songMeta, MinMillisecondsInViewport));
		MaxBeatInViewport = (int)Math.Ceiling(BpmUtils.MillisecondInSongToBeat(songMeta, MaxMillisecondsInViewport));
	}

	private void SetViewportYWithoutChangeEvent(int newViewportY)
	{
		if (newViewportY < 0)
		{
			newViewportY = 0;
		}
		if (newViewportY > 127)
		{
			newViewportY = 127;
		}
		ViewportY = newViewportY;
		MinMidiNoteInCurrentViewport = ViewportY;
		MaxMidiNoteInCurrentViewport = ViewportY + ViewportHeight;
	}

	private void SetViewportHeightWithoutChangeEvent(int newViewportHeight)
	{
		if (newViewportHeight < 12)
		{
			newViewportHeight = 12;
		}
		if (newViewportHeight > 88)
		{
			newViewportHeight = 88;
		}
		ViewportHeight = newViewportHeight;
		MaxMidiNoteInCurrentViewport = ViewportY + ViewportHeight;
		HeightForSingleNote = 1f / (float)ViewportHeight;
	}

	private void SetViewportWidthWithoutChangeEvent(int newViewportWidth)
	{
		if (newViewportWidth < 1000)
		{
			newViewportWidth = 1000;
		}
		if (newViewportWidth >= ViewportMaxWidth)
		{
			newViewportWidth = ViewportMaxWidth;
		}
		ViewportWidth = newViewportWidth;
		MaxMillisecondsInViewport = ViewportX + ViewportWidth;
		MaxBeatInViewport = (int)Math.Ceiling(BpmUtils.MillisecondInSongToBeat(songMeta, MaxMillisecondsInViewport));
	}

	private void FireViewportChangedEvent()
	{
		ViewportEvent value = new ViewportEvent(ViewportX, ViewportY, ViewportWidth, ViewportHeight);
		viewportEventStream.OnNext(value);
	}

	private void OnPointerClick(IPointerEvent evt)
	{
		if (evt.button == 0 && !(Vector2.Distance(evt.position, evt.position) > 5f) && !editorNoteDisplayer.AnyNoteControlContainsPosition(evt.position) && !editorNoteDisplayer.AnySentenceControlContainsPosition(evt.position))
		{
			bool num = Time.time - lastClickTime < 0.3f;
			bool flag = Vector2.Distance(lastClickPosition, evt.position) < 5f;
			lastClickTime = Time.time;
			lastClickPosition = evt.position;
			if (num & flag)
			{
				songEditorSceneControl.ToggleAudioPlayPause();
				return;
			}
			Vector2 vector = evt.localPosition;
			float width = VisualElement.worldBound.width;
			double num2 = vector.x / width;
			double positionInSongInMillis = (double)ViewportX + (double)ViewportWidth * num2;
			songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
		}
	}

	private void InitializeViewport()
	{
		List<Note> allNotes = SongMetaUtils.GetAllNotes(songMeta);
		int num;
		int num2;
		if (allNotes.IsNullOrEmpty())
		{
			num = 69;
			num2 = num + 18;
		}
		else
		{
			num = allNotes.Select((Note note) => note.MidiNote).Min();
			num2 = allNotes.Select((Note note) => note.MidiNote).Max();
		}
		int newViewportWidth = 8000;
		int newViewportX;
		if (songAudioPlayer.PositionInSongInMillis <= 0.0)
		{
			int startOfFirstNoteInMillis = GetStartOfFirstNoteInMillis();
			songAudioPlayer.PositionInSongInMillis = startOfFirstNoteInMillis;
			newViewportX = Math.Max(0, startOfFirstNoteInMillis - 1000);
		}
		else
		{
			newViewportX = Math.Max(0, (int)songAudioPlayer.PositionInSongInMillis - 1000);
		}
		int newViewportHeight = Math.Max(12, num2 - num + 2);
		int newViewportY = num - 1;
		SetViewport(newViewportX, newViewportY, newViewportWidth, newViewportHeight);
	}

	private int GetStartOfFirstNoteInMillis()
	{
		List<Note> allNotes = SongMetaUtils.GetAllNotes(songMeta);
		if (allNotes.IsNullOrEmpty())
		{
			return 0;
		}
		Note note = allNotes.FindMinElement((Note note2) => note2.StartBeat);
		if (note != null)
		{
			return (int)BpmUtils.BeatToMillisecondsInSong(songMeta, note.StartBeat);
		}
		return 0;
	}

	public float MillisecondsToPixelDistance(int millis)
	{
		return (float)millis * VisualElement.worldBound.width / (float)ViewportWidth;
	}

	public float MidiNotesToPixelDistance(int midiNotes)
	{
		return (float)midiNotes * VisualElement.worldBound.height / (float)ViewportHeight;
	}

	public int ScreenPixelPositionToMillis(float x)
	{
		Rect worldBound = VisualElement.worldBound;
		return (int)Math.Round((float)ViewportX + (float)ViewportWidth * ((x - worldBound.x) / worldBound.width));
	}

	public int ScreenPixelPositionToBeat(float x)
	{
		Rect worldBound = VisualElement.worldBound;
		return (int)Math.Round((float)MinBeatInViewport + (float)ViewportWidthInBeats * ((x - worldBound.x) / worldBound.width));
	}

	public int ScreenPixelPositionToMidiNote(float y)
	{
		Rect worldBound = VisualElement.worldBound;
		return (int)Math.Round((float)MinMidiNoteInCurrentViewport + (float)ViewportHeight * (1f - (y - worldBound.y) / worldBound.height));
	}

	private void UpdatePositionInSongIndicator(double positionInSongInMillis)
	{
		float num = (float)GetHorizontalPositionForMillis(positionInSongInMillis);
		noteAreaPositionInSongIndicator.style.left = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
	}

	public bool IsPointerOver()
	{
		return InputUtils.IsPointerOverVisualElement(VisualElement, panelHelper);
	}
}
