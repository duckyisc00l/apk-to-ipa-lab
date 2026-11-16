using System;
using System.Collections.Generic;
using System.Linq;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongRouletteControl : MonoBehaviour, INeedInjection, ITranslator
{
	private const float FlickGestureStartThresholdInPixels = 20f;

	private const float FlickGestureStopThresholdInPixels = 100f;

	private const float FlickAccelerationPerSecond = 0.0005f;

	public VisualTreeAsset songEntryUi;

	[InjectedInInspector]
	public bool showRouletteItemPlaceholders;

	[Inject]
	private Injector injector;

	[Inject]
	private SongSelectSongPreviewControl songPreviewControl;

	[Inject]
	private PlaylistManager playlistManager;

	[Inject]
	private ThemeManager themeManager;

	[Inject(UxmlName = "songEntryContainer")]
	private VisualElement songEntryContainer;

	[Inject(UxmlName = "songEntryPlaceholder")]
	private List<VisualElement> songEntryPlaceholders;

	private List<SongEntryPlaceholderControl> songEntryPlaceholderControls = new List<SongEntryPlaceholderControl>();

	private List<SongEntryPlaceholderControl> activeEntryPlaceholders = new List<SongEntryPlaceholderControl>();

	private SongEntryPlaceholderControl centerItem;

	private List<SongMeta> songs = new List<SongMeta>();

	private readonly Subject<SongSelection> selectionClickedEventStream = new Subject<SongSelection>();

	private readonly List<SongEntryControl> songEntryControls = new List<SongEntryControl>();

	private bool isInitialized;

	private bool flickGestureWasNoTouchscreenPressed;

	private Vector2 dragVelocity;

	private float dragDuration;

	private Vector2 dragStartPosition;

	public SlotListControl SlotListControl { get; private set; } = new SlotListControl();

	public IReadOnlyList<SongMeta> Songs => songs;

	public IReactiveProperty<SongSelection> Selection { get; private set; } = new ReactiveProperty<SongSelection>();

	public IObservable<SongSelection> SelectionClickedEventStream => selectionClickedEventStream;

	public int SongEntryPlaceholderCount => songEntryPlaceholderControls.Count;

	private int SelectedSongIndex
	{
		get
		{
			if (Selection.Value.SongMeta != null)
			{
				return Selection.Value.SongIndex;
			}
			return -1;
		}
	}

	private SongMeta SelectedSongMeta => Selection.Value.SongMeta;

	public IReadOnlyList<SongEntryControl> SongEntryControls => songEntryControls;

	public SongEntryControl SelectedSongEntryControl => songEntryControls.FirstOrDefault((SongEntryControl it) => it.SongMeta == Selection.Value.SongMeta);

	public bool IsDrag { get; private set; }

	public bool IsFlickGesture { get; private set; }

	public SongEntryControl DragSongRouletteItem { get; private set; }

	public Vector2 DragDistance { get; private set; }

	public float MaxAnimTimeInSeconds { get; private set; } = 0.2f;

	public float AnimTimeInSeconds { get; set; }

	public bool IsSongMenuOverlayVisible => SongEntryControls.AnyMatch((SongEntryControl it) => it.IsSongMenuOverlayVisible);

	private void Start()
	{
		songEntryPlaceholderControls = songEntryPlaceholders.Select((VisualElement it) => new SongEntryPlaceholderControl(it)).ToList();
		songEntryPlaceholderControls[0].VisualElement.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			DoInit();
		});
	}

	private void DoInit()
	{
		songEntryPlaceholderControls.Sort(SongEntryPlaceholderControl.comparerByCenterDistance);
		for (int i = 0; i < songEntryPlaceholderControls.Count; i++)
		{
			SongEntryPlaceholderControl current = songEntryPlaceholderControls[i];
			List<SongEntryPlaceholderControl> allEntries = songEntryPlaceholderControls.Where((SongEntryPlaceholderControl it) => it.GetPosition().x < current.GetPosition().x).ToList();
			List<SongEntryPlaceholderControl> allEntries2 = songEntryPlaceholderControls.Where((SongEntryPlaceholderControl it) => it.GetPosition().x > current.GetPosition().x).ToList();
			ISlotListSlot previousSlot = FindNearestSlot(current.GetPosition().x, allEntries);
			ISlotListSlot nextSlot = FindNearestSlot(current.GetPosition().x, allEntries2);
			songEntryPlaceholderControls[i].SetNeighborSlots(previousSlot, nextSlot);
		}
		centerItem = FindNearestSlot(400f, songEntryPlaceholderControls);
		activeEntryPlaceholders = new List<SongEntryPlaceholderControl>(songEntryPlaceholderControls);
		SlotListControl.SlotChangeEventStream.Subscribe(OnSongRouletteItemChangedSlot);
		if (!showRouletteItemPlaceholders)
		{
			foreach (SongEntryPlaceholderControl songEntryPlaceholderControl in songEntryPlaceholderControls)
			{
				songEntryPlaceholderControl.VisualElement.style.visibility = new StyleEnum<Visibility>(Visibility.Hidden);
			}
		}
		FindActiveRouletteItems();
	}

	private void OnSongRouletteItemChangedSlot(SlotChangeEvent slotChangeEvent)
	{
		List<SongEntryPlaceholderControl> list = new List<SongEntryPlaceholderControl>(activeEntryPlaceholders);
		list.Sort(SongEntryPlaceholderControl.comparerByPosition);
		int num = SelectedSongIndex;
		if (slotChangeEvent.Direction == ESlotListDirection.TowardsNextSlot)
		{
			num = NumberUtils.Mod(SelectedSongIndex - 1, songs.Count);
			foreach (SongEntryControl songEntryControl in songEntryControls)
			{
				songEntryControl.TargetPlaceholderControl = ((songEntryControl.GetCurrentSlot().GetNextSlot() is SongEntryPlaceholderControl songEntryPlaceholderControl && activeEntryPlaceholders.Contains(songEntryPlaceholderControl)) ? songEntryPlaceholderControl : null);
			}
			int index = NumberUtils.Mod(num - activeEntryPlaceholders.Count / 2, songs.Count);
			CreateSongRouletteItem(songs[index], list.First());
		}
		else if (slotChangeEvent.Direction == ESlotListDirection.TowardsPreviousSlot)
		{
			num = NumberUtils.Mod(SelectedSongIndex + 1, songs.Count);
			foreach (SongEntryControl songEntryControl2 in songEntryControls)
			{
				songEntryControl2.TargetPlaceholderControl = ((songEntryControl2.GetCurrentSlot().GetPreviousSlot() is SongEntryPlaceholderControl songEntryPlaceholderControl2 && activeEntryPlaceholders.Contains(songEntryPlaceholderControl2)) ? songEntryPlaceholderControl2 : null);
			}
			int index2 = NumberUtils.Mod(num + activeEntryPlaceholders.Count / 2, songs.Count);
			CreateSongRouletteItem(songs[index2], list.Last());
		}
		Selection.Value = new SongSelection(songs[num], num, songs.Count);
	}

	private void Update()
	{
		new List<SongEntryControl>(songEntryControls).ForEach((SongEntryControl it) =>
		{
			it.Update();
		});
		if (songs.Count == 0)
		{
			return;
		}
		if (!IsDrag && !IsFlickGesture && centerItem != null)
		{
			SpawnAndRemoveSongRouletteItems();
		}
		AnimTimeInSeconds += Time.deltaTime;
		AnimTimeInSeconds = NumberUtils.Limit(AnimTimeInSeconds, 0f, MaxAnimTimeInSeconds);
		UpdateFlickGesture();
		if (isInitialized)
		{
			return;
		}
		isInitialized = true;
		foreach (SongEntryControl songEntryControl in songEntryControls)
		{
			songEntryControl.VisualElement.style.scale = new StyleScale(new Scale(Vector3.one));
		}
	}

	private void SpawnAndRemoveSongRouletteItems()
	{
		bool flag = false;
		List<SongEntryControl> list = new List<SongEntryControl>();
		foreach (SongEntryPlaceholderControl activeEntryPlaceholder in activeEntryPlaceholders)
		{
			int index = SelectedSongIndex + activeEntryPlaceholder.GetCenterDistanceIndex(activeEntryPlaceholders, centerItem);
			SongMeta songMeta = GetSongAtIndex(index);
			SongEntryControl songEntryControl = songEntryControls.FirstOrDefault((SongEntryControl it) => it.SongMeta == songMeta);
			if (songEntryControl == null)
			{
				songEntryControl = CreateSongRouletteItem(songMeta, activeEntryPlaceholder);
				flag = true;
			}
			songEntryControl.TargetPlaceholderControl = activeEntryPlaceholder;
			list.Add(songEntryControl);
		}
		foreach (SongEntryControl item in new List<SongEntryControl>(songEntryControls))
		{
			if (!list.Contains(item))
			{
				RemoveSongRouletteItem(item);
				flag = true;
			}
		}
		if (flag)
		{
			themeManager.ApplyThemeSpecificStylesToVisualElementsInScene();
		}
	}

	public void RemoveSongRouletteItem(SongEntryControl songRouletteItem)
	{
		songRouletteItem.Dispose();
		songEntryControls.Remove(songRouletteItem);
		SlotListControl.ListItems.Remove(songRouletteItem);
	}

	private SongEntryControl CreateSongRouletteItem(SongMeta songMeta, SongEntryPlaceholderControl placeholderControl)
	{
		SongEntryPlaceholderControl songEntryPlaceholderControl = placeholderControl;
		List<SongEntryPlaceholderControl> list = new List<SongEntryPlaceholderControl>(songEntryPlaceholderControls);
		list.Sort(SongEntryPlaceholderControl.comparerByPosition);
		if (placeholderControl.GetPosition().x > centerItem.GetPosition().x)
		{
			songEntryPlaceholderControl = list.Last();
		}
		else if (placeholderControl.GetPosition().x < centerItem.GetPosition().x)
		{
			songEntryPlaceholderControl = list.First();
		}
		Vector2 position = songEntryPlaceholderControl.GetPosition();
		Vector2 size = songEntryPlaceholderControl.GetSize();
		SongEntryControl songEntryControl = new SongEntryControl(songEntryUi.CloneTree().Children().FirstOrDefault(), placeholderControl, position, size);
		injector.WithRootVisualElement(songEntryControl.VisualElement).Inject(songEntryControl);
		songEntryControl.Name = songMeta.Artist + "-" + songMeta.Title;
		songEntryControl.SongMeta = songMeta;
		songEntryControl.ClickEventStream.Subscribe((bool _) =>
		{
			OnSongButtonClicked(songMeta);
		});
		songEntryControls.Add(songEntryControl);
		SlotListControl.ListItems.Add(songEntryControl);
		songEntryContainer.Add(songEntryControl.VisualElement);
		return songEntryControl;
	}

	private void FindActiveRouletteItems()
	{
		if (songs.Count >= songEntryPlaceholderControls.Count)
		{
			activeEntryPlaceholders = new List<SongEntryPlaceholderControl>(songEntryPlaceholderControls);
			return;
		}
		activeEntryPlaceholders.Clear();
		for (int i = 0; i < songs.Count; i++)
		{
			List<SongEntryPlaceholderControl> allEntries = songEntryPlaceholderControls.Where((SongEntryPlaceholderControl it) => !activeEntryPlaceholders.Contains(it)).ToList();
			SongEntryPlaceholderControl item = FindNearestSlot(400f, allEntries);
			activeEntryPlaceholders.Add(item);
		}
		activeEntryPlaceholders.Sort(SongEntryPlaceholderControl.comparerByCenterDistance);
	}

	public void SetSongs(IReadOnlyCollection<SongMeta> songMetas)
	{
		int num = NumberUtils.Limit(SelectedSongIndex, 0, songMetas.Count - 1);
		SongMeta songMeta = Selection.Value.SongMeta;
		songs = new List<SongMeta>(songMetas);
		if (songs.Count > 0)
		{
			if (songMeta != null)
			{
				int songIndex = GetSongIndex(songMeta);
				if (songIndex >= 0)
				{
					num = songIndex;
				}
			}
			Selection.Value = new SongSelection(songs[num], num, songs.Count);
		}
		else
		{
			Selection.Value = new SongSelection(null, -1, 0);
			RemoveAllSongRouletteItems();
		}
		FindActiveRouletteItems();
	}

	private int GetSongIndex(SongMeta songMeta)
	{
		return songs.IndexOf(songMeta);
	}

	private void RemoveAllSongRouletteItems()
	{
		foreach (SongEntryControl item in new List<SongEntryControl>(songEntryControls))
		{
			RemoveSongRouletteItem(item);
		}
		songEntryControls.Clear();
	}

	public void SelectSong(SongMeta songMeta)
	{
		if (songMeta != null)
		{
			Selection.Value = new SongSelection(songMeta, songs.IndexOf(songMeta), songs.Count);
			ResetAnimationTimeTowardsTargetRouletteItem();
		}
	}

	public void SelectSongByIndex(int index, bool wrapAround = true)
	{
		if (wrapAround || (index >= 0 && songs.Count > index))
		{
			SongMeta songAtIndex = GetSongAtIndex(index);
			SelectSong(songAtIndex);
		}
	}

	private void ResetAnimationTimeTowardsTargetRouletteItem()
	{
		songEntryControls.ForEach((SongEntryControl it) =>
		{
			it.StartAnimationTowardsTargetPlaceholder();
		});
		AnimTimeInSeconds = MaxAnimTimeInSeconds - AnimTimeInSeconds;
	}

	public SongMeta Find(Predicate<SongMeta> predicate)
	{
		return songs.Find(predicate);
	}

	public void SelectNextSong()
	{
		int index = ((SelectedSongIndex >= 0) ? (SelectedSongIndex + 1) : 0);
		SelectSongByIndex(index);
	}

	public void SelectPreviousSong()
	{
		int index = ((SelectedSongIndex >= 0) ? (SelectedSongIndex - 1) : 0);
		SelectSongByIndex(index);
	}

	public void SelectRandomSong()
	{
		int index = new System.Random().Next(0, songs.Count - 1);
		SelectSongByIndex(index);
	}

	public SongMeta GetSongAtIndex(int index)
	{
		if (songs.Count == 0)
		{
			return null;
		}
		int num = ((index < 0) ? (index + songs.Count) : index) % songs.Count;
		if (num < 0)
		{
			num = 0;
		}
		return songs[num];
	}

	private void OnSongButtonClicked(SongMeta songMeta)
	{
		if (!IsDrag && !IsFlickGesture)
		{
			if (Selection.Value.SongMeta != null && Selection.Value.SongMeta == songMeta)
			{
				selectionClickedEventStream.OnNext(Selection.Value);
			}
			else
			{
				SelectSong(songMeta);
			}
		}
	}

	public void OnDrag(SongEntryControl songRouletteItem, Vector2 dragDeltaInPixels)
	{
		dragDuration += Time.deltaTime;
		SlotListControl.OnDrag(songRouletteItem, dragDeltaInPixels);
		songEntryControls.ForEach((SongEntryControl it) =>
		{
			SlotListControl.InterpolateSize(it);
		});
		if (DragSongRouletteItem != null)
		{
			DragDistance = DragSongRouletteItem.GetPosition() - dragStartPosition;
		}
	}

	public void OnEndDrag(Vector2 dragDeltaInPixels)
	{
		CheckStartFlickGesture(dragDeltaInPixels);
		IsDrag = false;
		DragSongRouletteItem = null;
		DragDistance = Vector2.zero;
		songEntryControls.ForEach((SongEntryControl it) =>
		{
			it.StartAnimationTowardsTargetPlaceholder();
		});
		ResetAnimationTimeTowardsTargetRouletteItem();
		songPreviewControl.StartSongPreview(Selection.Value);
	}

	public void OnBeginDrag(SongEntryControl songRouletteItem)
	{
		IsDrag = true;
		DragSongRouletteItem = songRouletteItem;
		songEntryControls.ForEach((SongEntryControl it) =>
		{
			it.StartAnimationTowardsTargetPlaceholder();
		});
		songPreviewControl.StopSongPreview();
		dragStartPosition = songRouletteItem.GetPosition();
		dragDuration = 0f;
	}

	private void CheckStartFlickGesture(Vector2 dragDeltaInPixels)
	{
		if (dragDeltaInPixels.magnitude > 20f)
		{
			IsFlickGesture = true;
			flickGestureWasNoTouchscreenPressed = false;
			dragDuration += Time.deltaTime;
			Vector2 vector = DragSongRouletteItem.GetPosition() + dragDeltaInPixels - dragStartPosition;
			dragVelocity = vector / dragDuration;
		}
	}

	private void UpdateFlickGesture()
	{
		if (!IsFlickGesture)
		{
			return;
		}
		dragVelocity *= 1f - 0.9995f * Time.deltaTime;
		if (dragVelocity.magnitude < 100f || songEntryControls.IsNullOrEmpty() || InputUtils.AnyMouseButtonPressed() || (flickGestureWasNoTouchscreenPressed && InputUtils.AnyTouchscreenPressed()))
		{
			IsFlickGesture = false;
			dragVelocity = Vector2.zero;
			OnEndDrag(Vector2.zero);
			return;
		}
		flickGestureWasNoTouchscreenPressed = flickGestureWasNoTouchscreenPressed || !InputUtils.AnyTouchscreenPressed();
		SongEntryControl songRouletteItem = songEntryControls.FirstOrDefault((SongEntryControl it) => it.SongMeta == SelectedSongMeta);
		OnDrag(songRouletteItem, dragVelocity * Time.deltaTime);
	}

	private T FindNearestSlot<T>(float targetPositionX, List<T> allEntries) where T : SongEntryPlaceholderControl
	{
		return allEntries.FindMinElement((T entry) => Mathf.Abs(entry.VisualElement.worldBound.center.x - targetPositionX));
	}

	public void ShowSongMenuOverlay()
	{
		SelectedSongEntryControl.ShowSongMenuOverlay();
	}

	public void HideSongMenuOverlay()
	{
		SongEntryControls.ForEach((SongEntryControl it) =>
		{
			it.HideSongMenuOverlay();
		});
	}

	public void ToggleSongMenuOverlay()
	{
		if (IsSongMenuOverlayVisible)
		{
			HideSongMenuOverlay();
		}
		else
		{
			ShowSongMenuOverlay();
		}
	}

	public void UpdateTranslation()
	{
		songEntryControls.ForEach((SongEntryControl songEntryControl) =>
		{
			songEntryControl.UpdateTranslation();
		});
	}
}
