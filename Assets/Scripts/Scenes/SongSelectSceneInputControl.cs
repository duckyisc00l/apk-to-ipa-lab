using System;
using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class SongSelectSceneInputControl : MonoBehaviour, INeedInjection
{
	[Inject]
	private SongSelectSceneControl songSelectSceneControl;

	[Inject]
	private SongRouletteControl songRouletteControl;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private FocusableNavigator navigator;

	[Inject]
	public CharacterQuickJumpListControl characterQuickJumpListControl;

	[Inject(UxmlName = "inputLegend", Optional = true)]
	private VisualElement inputLegendContainer;

	private readonly ReactiveProperty<string> fuzzySearchText = new ReactiveProperty<string>("");

	private float fuzzySearchLastInputTimeInSeconds;

	private static readonly float fuzzySearchResetTimeInSeconds = 0.75f;

	public IObservable<string> FuzzySearchText => fuzzySearchText;

	private void Start()
	{
		(from _ in InputManager.GetInputAction(R.InputActions.usplay_toggleFavorite).PerformedAsObservable()
			where InputManager.GetInputAction(R.InputActions.usplay_toggleFavoritePlaylistActive).InputAction.ReadValue<float>() == 0f
			where InputManager.GetInputAction(R.InputActions.usplay_toggleFavorite).InputAction.ReadValue<float>() >= 1f
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songSelectSceneControl.ToggleSelectedSongIsFavorite();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.usplay_toggleFavoritePlaylistActive).PerformedAsObservable()
			where InputManager.GetInputAction(R.InputActions.usplay_toggleFavoritePlaylistActive).InputAction.ReadValue<float>() >= 1f
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songSelectSceneControl.ToggleFavoritePlaylist();
		});
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			OnBack();
		});
		InputManager.GetInputAction(R.InputActions.usplay_search).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			songSelectSceneControl.SongSearchControl.FocusSearchTextField();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.usplay_randomSong).PerformedAsObservable()
			where !songSelectSceneControl.IsPlayerSelectOverlayVisible
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songSelectSceneControl.OnRandomSong();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.usplay_openSongEditor).PerformedAsObservable()
			where !songSelectSceneControl.IsMenuOverlayVisible && !songSelectSceneControl.IsPlayerSelectOverlayVisible
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songSelectSceneControl.StartSongEditorScene();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.usplay_togglePlayers).PerformedAsObservable()
			where songSelectSceneControl.IsPlayerSelectOverlayVisible
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songSelectSceneControl.ToggleSelectedPlayers();
		});
		InputManager.GetInputAction(R.InputActions.ui_submit).PerformedAsObservable().Subscribe(OnSubmit);
		InputManager.GetInputAction(R.InputActions.usplay_start).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			songSelectSceneControl.CheckAudioAndStartSingScene();
		});
		InputManager.GetInputAction(R.InputActions.ui_navigate).PerformedAsObservable().Subscribe((InputAction.CallbackContext context) =>
		{
			navigator.OnNavigate(context.ReadValue<Vector2>());
		});
		InputManager.GetInputAction(R.InputActions.ui_scrollWheel).PerformedAsObservable().Subscribe(OnScrollWheel);
		InputManager.GetInputAction(R.InputActions.usplay_nextSong).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			songRouletteControl.SelectNextSong();
		});
		InputManager.GetInputAction(R.InputActions.usplay_previousSong).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			songRouletteControl.SelectPreviousSong();
		});
		InputManager.GetInputAction(R.InputActions.usplay_nextCharacterQuickJumpCharacter).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			characterQuickJumpListControl.SelectNextCharacter();
		});
		InputManager.GetInputAction(R.InputActions.usplay_previousCharacterQuickJumpCharacter).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
		{
			characterQuickJumpListControl.SelectPreviousCharacter();
		});
		(from _ in InputManager.GetInputAction(R.InputActions.usplay_toggleSongMenu).PerformedAsObservable()
			where !songSelectSceneControl.IsPlayerSelectOverlayVisible
			where !songSelectSceneControl.IsMenuOverlayVisible
			where !songSelectSceneControl.SongSearchControl.IsSearchTextFieldFocused()
			select _).Subscribe((InputAction.CallbackContext _) =>
		{
			songRouletteControl.ToggleSongMenuOverlay();
		});
	}

	private void OnSubmit(InputAction.CallbackContext callbackContext)
	{
		if (songSelectSceneControl.SongSearchControl.IsSearchTextFieldFocused())
		{
			songSelectSceneControl.SubmitSearch();
		}
		else
		{
			navigator.OnSubmit();
		}
	}

	private void OnScrollWheel(InputAction.CallbackContext context)
	{
		if (!songSelectSceneControl.IsPlayerSelectOverlayVisible)
		{
			if (context.ReadValue<Vector2>().y < 0f)
			{
				songRouletteControl.SelectNextSong();
			}
			if (context.ReadValue<Vector2>().y > 0f)
			{
				songRouletteControl.SelectPreviousSong();
			}
		}
	}

	private void OnBack()
	{
		if (songSelectSceneControl.PlaylistChooserControl.IsPlaylistChooserDropdownOverlayVisible)
		{
			songSelectSceneControl.PlaylistChooserControl.HidePlaylistChooserDropdownOverlay();
		}
		else if (songSelectSceneControl.IsSearchExpressionInfoOverlayVisible)
		{
			songSelectSceneControl.HideSearchExpressionInfoOverlay();
		}
		else if (songSelectSceneControl.SongSearchControl.IsSearchPropertyDropdownVisible)
		{
			songSelectSceneControl.SongSearchControl.HideSearchPropertyDropdownOverlay();
		}
		else if (songSelectSceneControl.IsPlayerSelectOverlayVisible)
		{
			songSelectSceneControl.HidePlayerSelectOverlay();
		}
		else if (songRouletteControl.IsSongMenuOverlayVisible)
		{
			songRouletteControl.HideSongMenuOverlay();
		}
		else if (songSelectSceneControl.SongSearchControl.IsSearchTextFieldFocused())
		{
			songSelectSceneControl.SubmitSearch();
		}
		else if (songSelectSceneControl.IsMenuOverlayVisible)
		{
			songSelectSceneControl.HideMenuOverlay();
		}
		else if (songSelectSceneControl.IsSongDetailOverlayVisible)
		{
			songSelectSceneControl.HideSongDetailOverlay();
		}
		else if (songSelectSceneControl.IsPlaylistActive())
		{
			songSelectSceneControl.ResetPlaylistSelection();
		}
		else
		{
			sceneNavigator.LoadScene(EScene.MainScene);
		}
	}

	private void OnEnable()
	{
		Keyboard device = InputSystem.GetDevice<Keyboard>();
		if (device != null)
		{
			device.onTextInput += OnKeyboardTextInput;
		}
	}

	private void OnDisable()
	{
		Keyboard device = InputSystem.GetDevice<Keyboard>();
		if (device != null)
		{
			device.onTextInput -= OnKeyboardTextInput;
		}
	}

	private void OnKeyboardTextInput(char newChar)
	{
		if (newChar != '\u001b' && IsFuzzySearchActive())
		{
			CheckResetFuzzySearchText();
			fuzzySearchLastInputTimeInSeconds = Time.time;
			if (newChar == '\b' && fuzzySearchText.Value.Length > 0)
			{
				fuzzySearchText.Value = fuzzySearchText.Value.Substring(0, fuzzySearchText.Value.Length - 1);
			}
			else
			{
				fuzzySearchText.Value += newChar;
			}
			songSelectSceneControl.DoFuzzySearch(fuzzySearchText.Value);
			StartCoroutine(CoroutineUtils.ExecuteAfterDelayInSeconds(fuzzySearchResetTimeInSeconds, () =>
			{
				CheckResetFuzzySearchText();
			}));
		}
	}

	private void CheckResetFuzzySearchText()
	{
		if (fuzzySearchLastInputTimeInSeconds + fuzzySearchResetTimeInSeconds < Time.time)
		{
			fuzzySearchText.Value = "";
		}
	}

	private bool IsFuzzySearchActive()
	{
		if (!InputUtils.AnyKeyboardModifierPressed())
		{
			return !songSelectSceneControl.SongSearchControl.IsSearchTextFieldFocused();
		}
		return false;
	}
}
