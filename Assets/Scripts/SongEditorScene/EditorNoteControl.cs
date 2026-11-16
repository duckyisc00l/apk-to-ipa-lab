using System;
using System.Collections.Generic;
using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.EnhancedTouch;
using UnityEngine.UIElements;

public class EditorNoteControl : INeedInjection, IInjectionFinishedListener
{
	private class EditorUiNoteComparerByStartBeat : IComparer<EditorNoteControl>
	{
		public int Compare(EditorNoteControl x, EditorNoteControl y)
		{
			return Note.comparerByStartBeat.Compare(x.Note, y.Note);
		}
	}

	public static readonly IComparer<EditorNoteControl> comparerByStartBeat = new EditorUiNoteComparerByStartBeat();

	private static readonly double handleWidthInPercent = 0.25;

	[Inject(UxmlName = "goldenNoteIndicator")]
	private VisualElement goldenNoteIndicator;

	[Inject(UxmlName = "noteImage")]
	private VisualElement backgroundImage;

	[Inject(UxmlName = "selectionIndicator")]
	private VisualElement selectionIndicator;

	[Inject(UxmlName = "rightHandle")]
	private VisualElement rightHandle;

	[Inject(UxmlName = "leftHandle")]
	private VisualElement leftHandle;

	[Inject(UxmlName = "lyricsLabel")]
	private Label lyricsLabel;

	[Inject(UxmlName = "pitchLabel")]
	private Label pitchLabel;

	[Inject(UxmlName = "editLyricsPopup")]
	private VisualElement editLyricsPopup;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private MidiManager midiManager;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private Injector injector;

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private SongEditorLayerManager songEditorLayerManager;

	[Inject]
	private CursorManager cursorManager;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private SongEditorStatusBarControl statusBarControl;

	private Vector2 pointerDownPosition;

	private EditorNoteLyricsInputControl lyricsInputControl;

	private bool isPlayingMidiSound;

	private float lastClickTime;

	private readonly List<IDisposable> disposables = new List<IDisposable>();

	private EditorNoteContextMenuControl contextMenuControl;

	[Inject(Key = "rootVisualElement")]
	public VisualElement VisualElement { get; private set; }

	[Inject]
	public Note Note { get; private set; }

	public bool IsPointerOver { get; private set; }

	public bool IsPointerOverRightHandle { get; private set; }

	public bool IsPointerOverLeftHandle { get; private set; }

	public bool IsPointerOverCenter { get; private set; }

	public void OnInjectionFinished()
	{
		UpdateHandles();
		InitNoteEditing();
		SyncWithNote();
	}

	private void InitNoteEditing()
	{
		disposables.Add(InputManager.GetInputAction(R.InputActions.songEditor_anyKeyboardKey).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			UpdateHandles();
		}));
		VisualElement.RegisterCallback((PointerDownEvent evt) =>
		{
			OnPointerDown(evt);
		}, TrickleDown.TrickleDown);
		VisualElement.RegisterCallback((PointerUpEvent evt) =>
		{
			OnPointerUp(evt);
		}, TrickleDown.TrickleDown);
		VisualElement.RegisterCallback((PointerEnterEvent evt) =>
		{
			OnPointerEnter();
		}, TrickleDown.TrickleDown);
		VisualElement.RegisterCallback((PointerLeaveEvent evt) =>
		{
			OnPointerExit();
		}, TrickleDown.TrickleDown);
		VisualElement.RegisterCallback((PointerMoveEvent evt) =>
		{
			OnPointerMove(evt);
		}, TrickleDown.TrickleDown);
		contextMenuControl = injector.WithRootVisualElement(VisualElement).WithBindingForInstance(this).CreateAndInject<EditorNoteContextMenuControl>();
		disposables.Add(contextMenuControl);
	}

	public void SyncWithNote()
	{
		bool selected = selectionControl.IsSelected(Note);
		goldenNoteIndicator.SetVisibleByDisplay(Note.IsGolden);
		SetLyrics(Note.Text);
		SetSelected(selected);
		pitchLabel.text = MidiUtils.GetAbsoluteName(Note.MidiNote);
		if (Note.Sentence != null && Note.Sentence.Voice != null)
		{
			Color voiceLayerColor = songEditorLayerManager.GetVoiceLayerColor(Note.Sentence.Voice.Name);
			SetColor(voiceLayerColor);
		}
	}

	private void OnPointerMove(IPointerEvent evt)
	{
		if (Note.IsEditable)
		{
			Vector2 vector = evt.localPosition;
			float width = VisualElement.worldBound.width;
			double num = vector.x / width;
			if (num < handleWidthInPercent)
			{
				OnPointerOverLeftHandle();
			}
			else if (num > 1.0 - handleWidthInPercent)
			{
				OnPointerOverRightHandle();
			}
			else
			{
				OnPointerOverCenter();
			}
			UpdateHandles();
		}
	}

	private void OnPointerOverCenter()
	{
		IsPointerOverCenter = true;
		IsPointerOverLeftHandle = false;
		IsPointerOverRightHandle = false;
		SetCursorForGestureOrMusicNoteCursor(ECursor.Grab);
		statusBarControl.OnPointerOverNoteControl(this);
	}

	private void OnPointerOverRightHandle()
	{
		IsPointerOverCenter = false;
		IsPointerOverLeftHandle = false;
		IsPointerOverRightHandle = true;
		SetCursorForGestureOrMusicNoteCursor(ECursor.ArrowsLeftRight);
		statusBarControl.OnPointerOverNoteControl(this);
	}

	private void OnPointerOverLeftHandle()
	{
		IsPointerOverCenter = false;
		IsPointerOverLeftHandle = true;
		IsPointerOverRightHandle = false;
		SetCursorForGestureOrMusicNoteCursor(ECursor.ArrowsLeftRight);
		statusBarControl.OnPointerOverNoteControl(this);
	}

	private void SetCursorForGestureOrMusicNoteCursor(ECursor cursor)
	{
		if (InputUtils.IsKeyboardControlPressed())
		{
			cursorManager.SetCursorMusicNote();
		}
		else
		{
			cursorManager.SetCursor(cursor);
		}
	}

	private void UpdateHandles()
	{
		if (!Note.IsEditable)
		{
			leftHandle.HideByDisplay();
			rightHandle.HideByDisplay();
			return;
		}
		bool flag = selectionControl != null && selectionControl.IsSelected(Note);
		bool isVisible = IsPointerOverLeftHandle || (flag && (InputUtils.IsKeyboardControlPressed() || InputUtils.IsKeyboardShiftPressed()));
		leftHandle.SetVisibleByDisplay(isVisible);
		bool isVisible2 = IsPointerOverRightHandle || (flag && (InputUtils.IsKeyboardAltPressed() || InputUtils.IsKeyboardShiftPressed()));
		rightHandle.SetVisibleByDisplay(isVisible2);
	}

	public bool IsPositionOverLeftHandle(Vector2 screenPosition)
	{
		Vector2 vector = screenPosition - VisualElement.worldBound.position;
		float width = VisualElement.worldBound.width;
		return (double)(vector.x / width) < handleWidthInPercent;
	}

	public bool IsPositionOverRightHandle(Vector2 screenPosition)
	{
		Vector2 vector = screenPosition - VisualElement.worldBound.position;
		float width = VisualElement.worldBound.width;
		return (double)(vector.x / width) > 1.0 - handleWidthInPercent;
	}

	public void OnPointerClick(IPointerEvent ped)
	{
		if (Vector2.Distance(pointerDownPosition, ped.position) > 5f || (ped.button != 0 && UnityEngine.InputSystem.EnhancedTouch.Touch.activeTouches.Count == 0))
		{
			return;
		}
		bool num = Time.time - lastClickTime < 0.3f;
		lastClickTime = Time.time;
		if (num)
		{
			StartEditingLyrics();
			songAudioPlayer.PauseAudio();
		}
		else if (InputUtils.IsKeyboardShiftPressed())
		{
			if (selectionControl.IsSelected(Note))
			{
				selectionControl.RemoveFromSelection(this);
			}
			else
			{
				selectionControl.AddToSelection(this);
			}
		}
		else if (!InputUtils.IsKeyboardControlPressed())
		{
			double positionInSongInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, Note.StartBeat);
			songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
		}
	}

	public void SetLyrics(string newText)
	{
		string text = ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters(newText);
		switch (Note.Type)
		{
		case ENoteType.Freestyle:
			lyricsLabel.text = "<i><b><color=#c00000>" + text + "</color></b></i>";
			break;
		case ENoteType.Golden:
			lyricsLabel.text = "<b>" + text + "</b>";
			break;
		case ENoteType.Rap:
		case ENoteType.RapGolden:
			lyricsLabel.text = "<i><b><color=#ffa500ff>" + text + "</color></b></i>";
			break;
		default:
			lyricsLabel.text = text;
			break;
		}
	}

	public void SetColor(Color color)
	{
		backgroundImage.style.backgroundColor = color;
	}

	public void SetSelected(bool isSelected)
	{
		selectionIndicator.SetVisibleByDisplay(isSelected);
	}

	public void StartEditingLyrics()
	{
		float num = 5f;
		float num2 = Mathf.Max(VisualElement.worldBound.width + num * 2f, 150f);
		float num3 = VisualElement.worldBound.height + num * 2f;
		editLyricsPopup.style.position = new StyleEnum<Position>(Position.Absolute);
		editLyricsPopup.style.left = VisualElement.worldBound.x - num2 / 2f;
		editLyricsPopup.style.top = VisualElement.worldBound.y - num;
		editLyricsPopup.style.width = num2;
		editLyricsPopup.style.height = num3;
		lyricsInputControl = injector.WithBindingForInstance(this).CreateAndInject<EditorNoteLyricsInputControl>();
	}

	private void OnPointerEnter()
	{
		if (Note.IsEditable)
		{
			IsPointerOver = true;
			statusBarControl.OnPointerOverNoteControl(this);
		}
	}

	private void OnPointerExit()
	{
		if (Note.IsEditable)
		{
			IsPointerOver = false;
			IsPointerOverCenter = false;
			IsPointerOverLeftHandle = false;
			IsPointerOverRightHandle = false;
			UpdateHandles();
			cursorManager.SetDefaultCursor();
			statusBarControl.OnPointerExitNoteControl(this);
		}
	}

	private void OnPointerDown(IPointerEvent eventData)
	{
		if (Note.IsEditable)
		{
			pointerDownPosition = eventData.position;
			if (!isPlayingMidiSound && InputUtils.IsKeyboardControlPressed())
			{
				isPlayingMidiSound = true;
				midiManager.PlayMidiNote(Note.MidiNote);
			}
		}
	}

	private void OnPointerUp(IPointerEvent eventData)
	{
		if (Note.IsEditable)
		{
			if (isPlayingMidiSound)
			{
				midiManager.StopMidiNote(Note.MidiNote);
				isPlayingMidiSound = false;
			}
			OnPointerClick(eventData);
		}
	}

	public void Dispose()
	{
		disposables.ForEach((IDisposable it) =>
		{
			it.Dispose();
		});
		disposables.Clear();
		VisualElement.RemoveFromHierarchy();
	}

	public bool IsEditingLyrics()
	{
		if (lyricsInputControl != null)
		{
			return lyricsInputControl.IsActive();
		}
		return false;
	}

	public void SubmitAndCloseLyricsDialog()
	{
		lyricsInputControl.SubmitAndCloseLyricsDialog();
	}

	public void ShowLyricsLabel()
	{
		lyricsLabel.ShowByDisplay();
	}

	public void HideLyricsLabel()
	{
		lyricsLabel.HideByDisplay();
	}

	public void ShowPitchLabel()
	{
		pitchLabel.ShowByDisplay();
	}

	public void HidePitchLabel()
	{
		pitchLabel.HideByDisplay();
	}
}
