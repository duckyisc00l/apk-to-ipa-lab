using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongEntryControl : INeedInjection, IDragListener<GeneralDragEvent>, ISlotListItem, IInjectionFinishedListener, ITranslator, IDisposable
{
	[Inject]
	private SongRouletteControl songRouletteControl;

	[Inject]
	private SongSelectSceneControl songSelectSceneControl;

	[Inject]
	private PlaylistManager playlistManager;

	[Inject(UxmlName = "songImageOuter")]
	private VisualElement songImageOuter;

	[Inject(UxmlName = "songImageInner")]
	private VisualElement songImageInner;

	[Inject(UxmlName = "songArtist")]
	private Label songArtist;

	[Inject(UxmlName = "songTitle")]
	private Label songTitle;

	[Inject(UxmlName = "songEntryFavoriteIcon")]
	private VisualElement favoriteIcon;

	[Inject(UxmlName = "songEntryDuetIcon")]
	private VisualElement duetIcon;

	[Inject(UxmlName = "songEntryUiRoot")]
	private VisualElement songEntryUiRoot;

	[Inject(UxmlName = "songMenuOverlay")]
	private VisualElement songOverlayMenu;

	[Inject(UxmlName = "modifyPlaylistButtonContainer")]
	private VisualElement modifyPlaylistButtonContainer;

	[Inject(UxmlName = "singThisSongButton")]
	private Button singThisSongButton;

	[Inject(UxmlName = "openSongEditorButton")]
	private Button openSongEditorButton;

	[Inject(UxmlName = "reloadSongButton")]
	private Button reloadSongButton;

	[Inject(UxmlName = "openSongFolderButton")]
	private Button openSongFolderButton;

	[Inject(UxmlName = "closeSongOverlayButton")]
	private Button closeSongOverlayButton;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private Injector injector;

	public readonly Subject<bool> clickEventStream = new Subject<bool>();

	private bool ignoreNextClickEvent;

	private SongMeta songMeta;

	private SongEntryPlaceholderControl targetPlaceholderControl;

	private Vector2 animStartPosition;

	private Vector2 animStartSize;

	private GeneralDragControl dragControl;

	private IEnumerator showSongMenuOverlayCoroutine;

	private bool isPointerDown;

	[Inject(UxmlName = "songPreviewVideoImage")]
	public VisualElement SongPreviewVideoImage { get; private set; }

	[Inject(UxmlName = "songPreviewBackgroundImage")]
	public VisualElement SongPreviewBackgroundImage { get; private set; }

	public string Name { get; set; }

	public bool IsSongMenuOverlayVisible => songOverlayMenu.IsVisibleByDisplay();

	public IObservable<bool> ClickEventStream => clickEventStream;

	public SongMeta SongMeta
	{
		get
		{
			return songMeta;
		}
		set
		{
			songMeta = value;
			songArtist.text = songMeta.Artist;
			songTitle.text = songMeta.Title;
			UpdateFontSize();
			UpdateIcons();
			UpdateCover(songMeta);
		}
	}

	public SongEntryPlaceholderControl TargetPlaceholderControl
	{
		get
		{
			return targetPlaceholderControl;
		}
		set
		{
			if (targetPlaceholderControl != value)
			{
				targetPlaceholderControl = value;
				if (targetPlaceholderControl != null)
				{
					StartAnimationTowardsTargetPlaceholder();
				}
			}
		}
	}

	public VisualElement VisualElement { get; private set; }

	private void UpdateFontSize()
	{
		songArtist.RemoveFromClassList("smallFont");
		songArtist.RemoveFromClassList("smallerFont");
		songArtist.RemoveFromClassList("tinyFont");
		if (songArtist.text.Length >= 20)
		{
			songArtist.AddToClassList("tinyFont");
		}
		else if (songArtist.text.Length >= 12)
		{
			songArtist.AddToClassList("smallerFont");
		}
		else
		{
			songArtist.AddToClassList("smallFont");
		}
		songTitle.RemoveFromClassList("smallFont");
		songTitle.RemoveFromClassList("smallerFont");
		songTitle.RemoveFromClassList("tinyFont");
		if (songTitle.text.Length >= 60)
		{
			songTitle.AddToClassList("tinyFont");
		}
		else if (songTitle.text.Length >= 40)
		{
			songTitle.AddToClassList("smallerFont");
		}
		else
		{
			songTitle.AddToClassList("smallFont");
		}
	}

	public SongEntryControl(VisualElement visualElement, SongEntryPlaceholderControl targetPlaceholderControl, Vector2 initialPosition, Vector2 initialSize)
	{
		VisualElement = visualElement;
		this.targetPlaceholderControl = targetPlaceholderControl;
		SetPosition(initialPosition);
		SetSize(initialSize);
		animStartPosition = initialPosition;
		animStartSize = initialSize;
	}

	public void Update()
	{
		if (TargetPlaceholderControl == null)
		{
			songRouletteControl.RemoveSongRouletteItem(this);
			Dispose();
		}
		else if (!songRouletteControl.IsDrag && !songRouletteControl.IsFlickGesture)
		{
			if (float.IsNaN(VisualElement.resolvedStyle.height) || float.IsNaN(VisualElement.resolvedStyle.width))
			{
				SetSize(TargetPlaceholderControl.GetSize());
			}
			UpdateMoveToTargetPosition(TargetPlaceholderControl.GetPosition(), TargetPlaceholderControl.GetSize());
		}
	}

	private void UpdateMoveToTargetPosition(Vector2 targetPosition, Vector2 targetSize)
	{
		float t = songRouletteControl.AnimTimeInSeconds / songRouletteControl.MaxAnimTimeInSeconds;
		Vector2 position = Vector2.Lerp(animStartPosition, targetPosition, t);
		SetPosition(position);
		SetSize(Vector2.Lerp(animStartSize, targetSize, t));
	}

	private void UpdateCover(SongMeta coverSongMeta)
	{
		string text = SongMetaUtils.GetCoverUri(coverSongMeta);
		if (text.IsNullOrEmpty())
		{
			text = SongMetaUtils.GetBackgroundUri(coverSongMeta);
			if (text.IsNullOrEmpty())
			{
				return;
			}
		}
		ImageManager.LoadSpriteFromUri(text, (Sprite loadedSprite) =>
		{
			songImageOuter.style.backgroundImage = new StyleBackground(loadedSprite);
			songImageInner.style.backgroundImage = new StyleBackground(loadedSprite);
		});
	}

	public void OnBeginDrag(GeneralDragEvent dragEvent)
	{
		if (IsSongMenuOverlayVisible)
		{
			CancelDrag();
		}
		else
		{
			songRouletteControl.OnBeginDrag(this);
		}
	}

	public void OnDrag(GeneralDragEvent dragEvent)
	{
		songRouletteControl.OnDrag(this, dragEvent.ScreenCoordinateInPixels.DragDelta);
	}

	public void OnEndDrag(GeneralDragEvent dragEvent)
	{
		songRouletteControl.OnEndDrag(dragEvent?.ScreenCoordinateInPixels.DragDelta ?? Vector2.zero);
	}

	public void CancelDrag()
	{
		dragControl.CancelDrag();
	}

	public bool IsCanceled()
	{
		return dragControl.IsCanceled;
	}

	public ISlotListSlot GetCurrentSlot()
	{
		return TargetPlaceholderControl;
	}

	public Vector2 GetPosition()
	{
		return new Vector2(VisualElement.resolvedStyle.left, VisualElement.resolvedStyle.top);
	}

	public void SetSize(Vector2 newSize)
	{
		VisualElement.style.width = newSize.x;
		VisualElement.style.height = newSize.y;
	}

	public Vector2 GetSize()
	{
		return VisualElement.contentRect.size;
	}

	public void SetPosition(Vector2 newPosition)
	{
		VisualElement.style.left = newPosition.x;
		VisualElement.style.top = newPosition.y;
	}

	public void StartAnimationTowardsTargetPlaceholder()
	{
		animStartPosition = GetPosition();
		animStartSize = GetSize();
	}

	public void StartAnimationToFullScale()
	{
		VisualElement.style.scale = new StyleScale(new Scale(Vector3.zero));
		LeanTween.value(songRouletteControl.gameObject, Vector3.zero, Vector3.one, songRouletteControl.MaxAnimTimeInSeconds).setOnUpdate((Vector3 value) =>
		{
			VisualElement.style.scale = new StyleScale(new Scale(value));
		});
	}

	public void OnInjectionFinished()
	{
		SongPreviewVideoImage.HideByDisplay();
		SongPreviewBackgroundImage.HideByDisplay();
		HideSongMenuOverlay();
		singThisSongButton.RegisterCallbackButtonTriggered(() =>
		{
			HideSongMenuOverlay();
			songSelectSceneControl.CheckAudioAndStartSingScene();
		});
		closeSongOverlayButton.RegisterCallbackButtonTriggered(() =>
		{
			HideSongMenuOverlay();
			InputManager.GetInputAction(R.InputActions.ui_submit).CancelNotifyForThisFrame();
		});
		openSongEditorButton.RegisterCallbackButtonTriggered(() =>
		{
			songSelectSceneControl.StartSongEditorScene();
		});
		if (PlatformUtils.IsStandalone)
		{
			openSongFolderButton.RegisterCallbackButtonTriggered(() =>
			{
				SongMetaUtils.OpenDirectory(SongMeta);
			});
			reloadSongButton.RegisterCallbackButtonTriggered(() =>
			{
				SongMeta.Reload();
				HideSongMenuOverlay();
			});
		}
		else
		{
			openSongFolderButton.HideByDisplay();
			reloadSongButton.HideByDisplay();
		}
		playlistManager.PlaylistChangeEventStream.Subscribe((PlaylistManager.PlaylistChangeEvent evt) =>
		{
			UpdateIcons();
		});
		dragControl = injector.WithRootVisualElement(songEntryUiRoot).CreateAndInject<GeneralDragControl>();
		dragControl.AddListener(this);
		dragControl.ButtonFilter = new List<int> { 0 };
		dragControl.DragState.Subscribe((EDragState dragState) =>
		{
			if (dragState == EDragState.Dragging)
			{
				ignoreNextClickEvent = true;
			}
		});
		songEntryUiRoot.RegisterCallback((PointerDownEvent evt) =>
		{
			OnPointerDownOnThisVisualElement(evt);
		}, TrickleDown.TrickleDown);
		uiDocument.rootVisualElement.RegisterCallback((PointerUpEvent _) =>
		{
			OnPointerUpOnAnyVisualElement();
		}, TrickleDown.TrickleDown);
		dragControl.DragState.Subscribe((EDragState dragState) =>
		{
			if (dragState == EDragState.Dragging)
			{
				StopShowSongMenuOverlayCoroutine();
			}
		});
		UpdateTranslation();
	}

	private void OnPointerDownOnThisVisualElement(IPointerEvent pointerEvent)
	{
		if (pointerEvent.button == 1)
		{
			songRouletteControl.SelectSong(songMeta);
			songRouletteControl.ShowSongMenuOverlay();
		}
		else if (IsSongMenuOverlayVisible)
		{
			CancelDrag();
		}
		else
		{
			isPointerDown = true;
			StartShowSongMenuOverlayCoroutine();
		}
	}

	private void OnPointerUpOnAnyVisualElement()
	{
		if (isPointerDown && !dragControl.IsDragging && !ignoreNextClickEvent)
		{
			clickEventStream.OnNext(value: true);
		}
		isPointerDown = false;
		StopShowSongMenuOverlayCoroutine();
		ignoreNextClickEvent = false;
	}

	private void StartShowSongMenuOverlayCoroutine()
	{
		StopShowSongMenuOverlayCoroutine();
		showSongMenuOverlayCoroutine = CoroutineUtils.ExecuteAfterDelayInSeconds(1f, () =>
		{
			if (songRouletteControl.SelectedSongEntryControl != this && isPointerDown)
			{
				songRouletteControl.SelectSong(songMeta);
			}
			ignoreNextClickEvent = true;
			ShowSongMenuOverlay();
		});
		songRouletteControl.StartCoroutine(showSongMenuOverlayCoroutine);
	}

	private void StopShowSongMenuOverlayCoroutine()
	{
		if (showSongMenuOverlayCoroutine != null)
		{
			songRouletteControl.StopCoroutine(showSongMenuOverlayCoroutine);
			showSongMenuOverlayCoroutine = null;
		}
	}

	public void ShowSongMenuOverlay()
	{
		InitModifyPlaylistButtons();
		songOverlayMenu.ShowByDisplay();
		singThisSongButton.Focus();
	}

	private void InitModifyPlaylistButtons()
	{
		modifyPlaylistButtonContainer.Clear();
		playlistManager.Playlists.Where((UltraStarPlaylist playlist) => !(playlist is UltraStarAllSongsPlaylist)).ForEach((UltraStarPlaylist playlist) =>
		{
			string name = playlist.Name;
			Button button = new Button();
			button.style.width = new StyleLength(new Length(100f, LengthUnit.Percent));
			button.AddToClassList("smallFont");
			modifyPlaylistButtonContainer.Add(button);
			if (playlistManager.HasSongEntry(playlist, songMeta))
			{
				button.text = "Remove from\n'" + name + "'";
				button.RegisterCallbackButtonTriggered(() =>
				{
					playlistManager.RemoveSongFromPlaylist(playlist, songMeta);
				});
			}
			else
			{
				button.text = "Add to\n'" + name + "'";
				button.RegisterCallbackButtonTriggered(() =>
				{
					playlistManager.AddSongToPlaylist(playlist, songMeta);
				});
			}
		});
	}

	public void HideSongMenuOverlay()
	{
		songOverlayMenu.HideByDisplay();
	}

	private void UpdateIcons()
	{
		favoriteIcon.SetVisibleByDisplay(playlistManager.FavoritesPlaylist.HasSongEntry(songMeta.Artist, songMeta.Title));
		duetIcon.SetVisibleByDisplay(songMeta.VoiceNames.Count > 1);
	}

	public void UpdateTranslation()
	{
		singThisSongButton.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_songMenu_startButton);
		openSongFolderButton.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_songMenu_openSongFolder);
		openSongEditorButton.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_songMenu_openSongEditor);
		closeSongOverlayButton.text = TranslationManager.GetTranslation(R.Messages.back);
	}

	public void Dispose()
	{
		TargetPlaceholderControl = null;
		VisualElement.RemoveFromHierarchy();
		if (songRouletteControl.DragSongRouletteItem == this)
		{
			OnEndDrag(null);
		}
		dragControl?.Dispose();
	}
}
