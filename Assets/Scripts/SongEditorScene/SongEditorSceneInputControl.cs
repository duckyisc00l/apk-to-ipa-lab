using System;
using System.Collections.Generic;
using System.Linq;
using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.EnhancedTouch;
using UnityEngine.UIElements;

public class SongEditorSceneInputControl : MonoBehaviour, INeedInjection
{
	private const float PinchGestureMagnitudeThresholdInPixels = 100f;

	public static readonly int cancelCopyPriority = 20;

	[Inject(SearchMethod = SearchMethods.FindObjectOfType)]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private NoteAreaControl noteAreaControl;

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	[Inject]
	private SongEditorHistoryManager historyManager;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private DeleteNotesAction deleteNotesAction;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject(Optional = true)]
	private EventSystem eventSystem;

	[Inject]
	private ToggleNoteTypeAction toggleNoteTypeAction;

	[Inject]
	private MoveNotesAction moveNotesAction;

	[Inject]
	private ExtendNotesAction extendNotesAction;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private SongEditorSideBarControl songEditorSideBarControl;

	private bool inputFieldHasFocusOld;

	private Vector2[] zoomStartTouchPositions;

	private Vector2 zoomStartTouchDistancePerDimension;

	private float startNavigateWithArrowKey;

	private void Start()
	{
		if (eventSystem != null)
		{
			eventSystem.sendNavigationEvents = false;
		}
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_jumpToStartOfSong).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songAudioPlayer.PositionInSongInMillis = 0.0;
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_jumpToEndOfSong).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songAudioPlayer.PositionInSongInMillis = songAudioPlayer.DurationOfSongInMillis - 1.0;
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_togglePause).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songEditorSceneControl.ToggleAudioPlayPause();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_playSelectedNotes).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			PlayAudioInRangeOfNotes(selectionControl.GetSelectedNotes());
		});
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable().Subscribe(OnBack);
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_selectAll).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			selectionControl.SelectAll();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_selectNextNote).PerformedAsObservable()
			where !InputUtils.AnyKeyboardModifierPressed()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			selectionControl.SelectNextNote();
		});
		InputManager.GetInputAction(R.InputActions.songEditor_selectPreviousNote).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			selectionControl.SelectPreviousNote();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_delete).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			deleteNotesAction.ExecuteAndNotify(selectionControl.GetSelectedNotes());
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_undo).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			historyManager.Undo();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_redo).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			historyManager.Redo();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_save).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songEditorSceneControl.SaveSong();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_editLyrics).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songEditorSceneControl.StartEditingSelectedNoteText();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.ui_navigate).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe(OnNavigate);
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_toggleNoteTypeGolden).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			where !InputUtils.AnyKeyboardModifierPressed()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			toggleNoteTypeAction.ExecuteAndNotify(selectionControl.GetSelectedNotes(), ENoteType.Golden);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_toggleNoteTypeFreestyle).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			where !InputUtils.AnyKeyboardModifierPressed()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			toggleNoteTypeAction.ExecuteAndNotify(selectionControl.GetSelectedNotes(), ENoteType.Freestyle);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_toggleNoteTypeNormal).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			where !InputUtils.AnyKeyboardModifierPressed()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			toggleNoteTypeAction.ExecuteAndNotify(selectionControl.GetSelectedNotes(), ENoteType.Normal);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_toggleNoteTypeRap).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			where !InputUtils.AnyKeyboardModifierPressed()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			toggleNoteTypeAction.ExecuteAndNotify(selectionControl.GetSelectedNotes(), ENoteType.Rap);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_toggleNoteTypeRapGolden).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			where !InputUtils.AnyKeyboardModifierPressed()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			toggleNoteTypeAction.ExecuteAndNotify(selectionControl.GetSelectedNotes(), ENoteType.RapGolden);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.ui_scrollWheel).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe(OnScrollWheel);
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_zoomInHorizontal).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			where !InputUtils.IsKeyboardShiftPressed()
			select _).Subscribe((InputAction.CallbackContext context) =>
		{
			noteAreaControl.ZoomHorizontal(1);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_zoomOutHorizontal).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			where !InputUtils.IsKeyboardShiftPressed()
			select _).Subscribe((InputAction.CallbackContext context) =>
		{
			noteAreaControl.ZoomHorizontal(-1);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_zoomInVertical).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			where InputManager.GetInputAction(R.InputActions.songEditor_zoomOutVertical).ReadValue<float>() == 0f
			select _).Subscribe((InputAction.CallbackContext context) =>
		{
			noteAreaControl.ZoomVertical(1);
		});
		(from _ in InputManager.GetInputAction(R.InputActions.songEditor_zoomOutVertical).PerformedAsObservable()
			where !AnyInputFieldHasFocus()
			select _).Subscribe((InputAction.CallbackContext context) =>
		{
			noteAreaControl.ZoomVertical(-1);
		});
	}

	private void OnBack(InputAction.CallbackContext context)
	{
		if (songEditorSceneControl.IsAnyDialogOpen)
		{
			songEditorSceneControl.CloseAllOpenDialogs();
		}
		else if (songEditorSideBarControl.IsAnySideBarContainerVisible)
		{
			songEditorSideBarControl.HideSideBarContainers();
		}
		else if (songAudioPlayer.IsPlaying)
		{
			songAudioPlayer.PauseAudio();
		}
		else if (selectionControl.HasSelectedNotes())
		{
			selectionControl.ClearSelection();
		}
		else if (AnyInputFieldHasFocus())
		{
			if (eventSystem != null)
			{
				eventSystem.SetSelectedGameObject(null);
			}
		}
		else if (!inputFieldHasFocusOld)
		{
			songEditorSceneControl.ReturnToLastScene();
		}
	}

	private void OnScrollWheel(InputAction.CallbackContext context)
	{
		if (AnyInputFieldHasFocus())
		{
			return;
		}
		EKeyboardModifier currentKeyboardModifier = InputUtils.GetCurrentKeyboardModifier();
		int num = Math.Sign(context.ReadValue<Vector2>().y);
		if (num != 0 && noteAreaControl.IsPointerOver())
		{
			if (currentKeyboardModifier == EKeyboardModifier.None)
			{
				noteAreaControl.ScrollHorizontal(-num);
			}
			if (currentKeyboardModifier == EKeyboardModifier.Ctrl)
			{
				noteAreaControl.ZoomHorizontal(num);
			}
			if (currentKeyboardModifier == EKeyboardModifier.Shift)
			{
				noteAreaControl.ScrollVertical(num);
			}
			if (currentKeyboardModifier == EKeyboardModifier.CtrlShift)
			{
				noteAreaControl.ZoomVertical(num);
			}
		}
	}

	private void OnNavigate(InputAction.CallbackContext context)
	{
		if (songAudioPlayer.IsPlaying)
		{
			return;
		}
		Vector2 vector = context.ReadValue<Vector2>();
		EKeyboardModifier currentKeyboardModifier = InputUtils.GetCurrentKeyboardModifier();
		List<Note> selectedNotes = selectionControl.GetSelectedNotes();
		if (selectedNotes.IsNullOrEmpty())
		{
			return;
		}
		List<Note> followingNotesOrEmptyListIfDeactivated = GetFollowingNotesOrEmptyListIfDeactivated(selectedNotes);
		if (currentKeyboardModifier == EKeyboardModifier.Shift)
		{
			if (vector.x != 0f)
			{
				moveNotesAction.MoveNotesHorizontalAndNotify((int)vector.x, selectedNotes, followingNotesOrEmptyListIfDeactivated);
			}
			if (vector.y != 0f)
			{
				moveNotesAction.MoveNotesVerticalAndNotify((int)vector.y, selectedNotes, followingNotesOrEmptyListIfDeactivated);
			}
		}
		if (currentKeyboardModifier == EKeyboardModifier.CtrlShift)
		{
			moveNotesAction.MoveNotesVerticalAndNotify((int)vector.y * 12, selectedNotes, followingNotesOrEmptyListIfDeactivated);
		}
		if (currentKeyboardModifier == EKeyboardModifier.Alt)
		{
			extendNotesAction.ExtendNotesRightAndNotify((int)vector.x, selectedNotes, followingNotesOrEmptyListIfDeactivated);
		}
		if (currentKeyboardModifier == EKeyboardModifier.Ctrl)
		{
			extendNotesAction.ExtendNotesLeftAndNotify((int)vector.x, selectedNotes);
		}
	}

	private void Update()
	{
		bool flag = AnyInputFieldHasFocus();
		if (flag)
		{
			inputFieldHasFocusOld = true;
			return;
		}
		UpdateScrollAndChangePlaybackPosition();
		UpdateInputForYassShortcuts();
		UpdateTouchInputForZoom();
		inputFieldHasFocusOld = flag;
	}

	private void UpdateScrollAndChangePlaybackPosition()
	{
		if (Keyboard.current != null && (Keyboard.current.leftArrowKey.isPressed || Keyboard.current.rightArrowKey.isPressed) && selectionControl.GetSelectedNotes().IsNullOrEmpty())
		{
			float num;
			if (!(startNavigateWithArrowKey <= 0f))
			{
				num = ((!(Time.time - startNavigateWithArrowKey > 0.5f)) ? 0f : (10f * Time.deltaTime));
			}
			else
			{
				startNavigateWithArrowKey = Time.time;
				num = 1f;
			}
			int num2 = 0;
			if (Keyboard.current.leftArrowKey.isPressed)
			{
				num2 = -1;
			}
			else if (Keyboard.current.rightArrowKey.isPressed)
			{
				num2 = 1;
			}
			if (!InputUtils.IsAnyKeyboardModifierPressed())
			{
				if (num > 0f)
				{
					noteAreaControl.ScrollHorizontal(num2);
				}
			}
			else if (InputUtils.IsKeyboardControlPressed())
			{
				int num3 = (int)(BpmUtils.MillisecondsPerBeat(songMeta) * (double)num);
				if (Keyboard.current.leftArrowKey.isPressed)
				{
					songAudioPlayer.PositionInSongInMillis -= num3;
				}
				else if (Keyboard.current.rightArrowKey.isPressed)
				{
					songAudioPlayer.PositionInSongInMillis += num3;
				}
				songAudioPlayer.PositionInSongInMillis += num3 * num2;
			}
		}
		else
		{
			startNavigateWithArrowKey = 0f;
		}
	}

	private void UpdateTouchInputForZoom()
	{
		if (Touchscreen.current == null || AnyInputFieldHasFocus())
		{
			return;
		}
		bool flag = zoomStartTouchPositions != null;
		if (UnityEngine.InputSystem.EnhancedTouch.Touch.activeFingers.Count < 2)
		{
			if (flag)
			{
				zoomStartTouchPositions = null;
			}
		}
		else if (UnityEngine.InputSystem.EnhancedTouch.Touch.activeFingers.Count == 2)
		{
			Finger finger = UnityEngine.InputSystem.EnhancedTouch.Touch.activeFingers[0];
			Finger finger2 = UnityEngine.InputSystem.EnhancedTouch.Touch.activeFingers[1];
			if (flag)
			{
				UpdateTouchInputForZoomContinuedGesture(finger, finger2);
				return;
			}
			zoomStartTouchPositions = new Vector2[2] { finger.screenPosition, finger2.screenPosition };
			zoomStartTouchDistancePerDimension = DistancePerDimension(finger.screenPosition, finger2.screenPosition);
		}
	}

	private void UpdateTouchInputForZoomContinuedGesture(Finger firstFinger, Finger secondFinger)
	{
		Vector2 vector = DistancePerDimension(firstFinger.screenPosition, secondFinger.screenPosition) - zoomStartTouchDistancePerDimension;
		if (Math.Abs(vector.x) > 100f || Math.Abs(vector.y) > 100f)
		{
			if (Math.Abs(vector.x) > 100f)
			{
				noteAreaControl.ZoomHorizontal(Math.Sign(vector.x));
			}
			if (Math.Abs(vector.y) > 100f)
			{
				noteAreaControl.ZoomVertical(Math.Sign(vector.y));
			}
			zoomStartTouchPositions = new Vector2[2] { firstFinger.screenPosition, secondFinger.screenPosition };
			zoomStartTouchDistancePerDimension = DistancePerDimension(firstFinger.screenPosition, secondFinger.screenPosition);
		}
	}

	private Vector2 DistancePerDimension(Vector2 a, Vector2 b)
	{
		return new Vector2(Math.Abs(a.x - b.x), Math.Abs(a.y - b.y));
	}

	private void UpdateInputForYassShortcuts()
	{
		if (InputUtils.GetCurrentKeyboardModifier() != EKeyboardModifier.None || Keyboard.current == null || AnyInputFieldHasFocus())
		{
			return;
		}
		List<Note> selectedNotes = selectionControl.GetSelectedNotes();
		List<Note> followingNotesOrEmptyListIfDeactivated = GetFollowingNotesOrEmptyListIfDeactivated(selectedNotes);
		if (Keyboard.current.numpad4Key.wasReleasedThisFrame)
		{
			selectionControl.SelectPreviousNote();
		}
		if (Keyboard.current.numpad6Key.wasReleasedThisFrame)
		{
			selectionControl.SelectNextNote();
		}
		if (Keyboard.current.numpad1Key.wasReleasedThisFrame)
		{
			moveNotesAction.MoveNotesHorizontalAndNotify(-1, selectedNotes, followingNotesOrEmptyListIfDeactivated);
		}
		if (Keyboard.current.numpad3Key.wasReleasedThisFrame)
		{
			moveNotesAction.MoveNotesHorizontalAndNotify(1, selectedNotes, followingNotesOrEmptyListIfDeactivated);
		}
		if (Keyboard.current.numpad7Key.wasReleasedThisFrame || Keyboard.current.numpad8Key.wasReleasedThisFrame)
		{
			extendNotesAction.ExtendNotesRightAndNotify(-1, selectedNotes, followingNotesOrEmptyListIfDeactivated);
		}
		if (Keyboard.current.numpad9Key.wasReleasedThisFrame)
		{
			extendNotesAction.ExtendNotesRightAndNotify(1, selectedNotes, followingNotesOrEmptyListIfDeactivated);
		}
		if (Keyboard.current.numpadDivideKey.wasReleasedThisFrame)
		{
			extendNotesAction.ExtendNotesLeftAndNotify(-1, selectedNotes);
		}
		if (Keyboard.current.numpadMultiplyKey.wasReleasedThisFrame)
		{
			extendNotesAction.ExtendNotesLeftAndNotify(1, selectedNotes);
		}
		if (Keyboard.current.numpadMinusKey.wasReleasedThisFrame)
		{
			moveNotesAction.MoveNotesVerticalAndNotify(1, selectedNotes, followingNotesOrEmptyListIfDeactivated);
		}
		if (Keyboard.current.numpadPlusKey.wasReleasedThisFrame)
		{
			moveNotesAction.MoveNotesVerticalAndNotify(-1, selectedNotes, followingNotesOrEmptyListIfDeactivated);
		}
		if (Keyboard.current.numpad5Key.wasReleasedThisFrame)
		{
			if (selectedNotes.IsNullOrEmpty())
			{
				songEditorSceneControl.ToggleAudioPlayPause();
			}
			else
			{
				PlayAudioInRangeOfNotes(selectedNotes);
			}
		}
		if (Keyboard.current.hKey.wasReleasedThisFrame)
		{
			noteAreaControl.ScrollHorizontal(-1);
		}
		if (Keyboard.current.jKey.wasReleasedThisFrame)
		{
			noteAreaControl.ScrollHorizontal(1);
		}
	}

	private void PlayAudioInRangeOfNotes(List<Note> notes)
	{
		if (!songAudioPlayer.IsPlaying && !notes.IsNullOrEmpty())
		{
			int num = notes.Select((Note it) => it.StartBeat).Min();
			int num2 = notes.Select((Note it) => it.EndBeat).Max();
			double stopPlaybackAfterPositionInSongInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, num2);
			double positionInSongInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, num);
			songEditorSceneControl.StopPlaybackAfterPositionInSongInMillis = stopPlaybackAfterPositionInSongInMillis;
			songAudioPlayer.PositionInSongInMillis = positionInSongInMillis;
			songAudioPlayer.PlayAudio();
		}
	}

	private List<Note> GetFollowingNotesOrEmptyListIfDeactivated(List<Note> selectedNotes)
	{
		if (settings.SongEditorSettings.AdjustFollowingNotes)
		{
			return SongMetaUtils.GetFollowingNotes(songMeta, selectedNotes);
		}
		return new List<Note>();
	}

	public bool AnyInputFieldHasFocus()
	{
		return uiDocument.rootVisualElement.focusController.focusedElement is TextField;
	}
}
