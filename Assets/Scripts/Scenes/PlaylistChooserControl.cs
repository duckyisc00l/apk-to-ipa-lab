using System.Collections.Generic;
using System.Linq;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class PlaylistChooserControl : INeedInjection, IInjectionFinishedListener, ITranslator
{
	[Inject(UxmlName = "playlistChooserButton")]
	private Button playlistChooserButton;

	[Inject(UxmlName = "closePlaylistChooserDropdownButton")]
	private Button closePlaylistChooserDropdownButton;

	[Inject(UxmlName = "playlistChooserDropdownOverlay")]
	private VisualElement playlistChooserDropdownOverlay;

	[Inject(UxmlName = "playlistChooserDropdownScrollView")]
	private ScrollView playlistChooserDropdownScrollView;

	[Inject]
	private PlaylistManager playlistManager;

	[Inject]
	private Settings settings;

	private List<UltraStarPlaylist> items = new List<UltraStarPlaylist>();

	public ReactiveProperty<UltraStarPlaylist> Selection { get; private set; } = new ReactiveProperty<UltraStarPlaylist>();

	public bool IsPlaylistChooserDropdownOverlayVisible => playlistChooserDropdownOverlay.IsVisibleByDisplay();

	public void OnInjectionFinished()
	{
		InitItems();
		Selection.Subscribe((UltraStarPlaylist newPlaylist) =>
		{
			settings.SongSelectSettings.playlistName = newPlaylist.Name;
		});
		Selection.Subscribe((UltraStarPlaylist playlist) =>
		{
			playlistChooserButton.text = GetDisplayString(playlist);
		});
		HidePlaylistChooserDropdownOverlay();
		playlistChooserButton.RegisterCallbackButtonTriggered(() =>
		{
			if (IsPlaylistChooserDropdownOverlayVisible)
			{
				HidePlaylistChooserDropdownOverlay();
			}
			else
			{
				ShowPlaylistChooserDropdownOverlay();
			}
		});
		closePlaylistChooserDropdownButton.RegisterCallbackButtonTriggered(() =>
		{
			HidePlaylistChooserDropdownOverlay();
		});
		playlistManager.PlaylistChangeEventStream.Subscribe((PlaylistManager.PlaylistChangeEvent _) =>
		{
			InitItems();
		});
	}

	private void InitItems()
	{
		items = new List<UltraStarPlaylist>();
		items.Add(new UltraStarAllSongsPlaylist());
		items.Add(playlistManager.FavoritesPlaylist);
		items.AddRange(playlistManager.Playlists.Where((UltraStarPlaylist playlist) => playlist != playlistManager.FavoritesPlaylist));
		UltraStarPlaylist valueAndForceNotify = items.FirstOrDefault((UltraStarPlaylist playlist) => GetDisplayString(playlist) == settings.SongSelectSettings.playlistName).OrIfNull(items[0]);
		Selection.SetValueAndForceNotify(valueAndForceNotify);
	}

	private string GetDisplayString(UltraStarPlaylist playlist)
	{
		if (playlist == null || playlist is UltraStarAllSongsPlaylist)
		{
			return TranslationManager.GetTranslation(R.Messages.playlistName_allSongs);
		}
		if (playlist == playlistManager.FavoritesPlaylist)
		{
			return TranslationManager.GetTranslation(R.Messages.playlistName_favorites);
		}
		return playlist.Name;
	}

	public void ToggleFavoritePlaylist()
	{
		if (items.IndexOf(Selection.Value) == 0)
		{
			Selection.Value = playlistManager.FavoritesPlaylist;
		}
		else
		{
			Selection.Value = items[0];
		}
	}

	public void FocusPlaylistChooser()
	{
		playlistChooserButton.Focus();
	}

	public void Reset()
	{
		Selection.Value = items[0];
	}

	public void HidePlaylistChooserDropdownOverlay()
	{
		playlistChooserDropdownOverlay.HideByDisplay();
	}

	public void ShowPlaylistChooserDropdownOverlay()
	{
		playlistChooserDropdownOverlay.ShowByDisplay();
		playlistChooserDropdownScrollView.Clear();
		items.ForEach((UltraStarPlaylist item) =>
		{
			playlistChooserDropdownScrollView.Add(CreatePlaylistButton(item));
		});
		playlistChooserDropdownScrollView.Children().FirstOrDefault().IfNotNull((VisualElement child) =>
		{
			child.Focus();
		});
	}

	private Button CreatePlaylistButton(UltraStarPlaylist item)
	{
		Button button = new Button();
		button.text = GetDisplayString(item);
		button.style.width = new StyleLength(new Length(100f, LengthUnit.Percent));
		button.RegisterCallbackButtonTriggered(() =>
		{
			Selection.Value = item;
			HidePlaylistChooserDropdownOverlay();
		});
		return button;
	}

	public void UpdateTranslation()
	{
		playlistChooserButton.text = GetDisplayString(Selection.Value);
	}
}
