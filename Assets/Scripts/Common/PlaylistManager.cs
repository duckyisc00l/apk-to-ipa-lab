using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;

public class PlaylistManager : AbstractSingletonBehaviour, INeedInjection
{
	public class PlaylistChangeEvent
	{
		public UltraStarPlaylist Playlist { get; set; }

		public SongMeta SongMeta { get; set; }

		public PlaylistChangeEvent(UltraStarPlaylist playlist, SongMeta songMeta)
		{
			Playlist = playlist;
			SongMeta = songMeta;
		}
	}

	public static readonly string favoritesPlaylistName = "Favorites";

	private static List<UltraStarPlaylist> playlists = new List<UltraStarPlaylist>();

	private UltraStarPlaylist favoritesPlaylist;

	private readonly Subject<PlaylistChangeEvent> playlistChangeEventStream = new Subject<PlaylistChangeEvent>();

	public static readonly string ultraStarPlaylistFileExtension = ".upl";

	[Inject]
	private Settings settings;

	public static PlaylistManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<PlaylistManager>();

	public IReadOnlyList<UltraStarPlaylist> Playlists
	{
		get
		{
			if (playlists.IsNullOrEmpty())
			{
				CreateFavoritePlaylistIfNotExist();
				ScanPlaylistFolder();
			}
			return playlists;
		}
	}

	public UltraStarPlaylist FavoritesPlaylist
	{
		get
		{
			if (favoritesPlaylist == null || playlists.IsNullOrEmpty())
			{
				CreateFavoritePlaylistIfNotExist();
				ScanPlaylistFolder();
			}
			return favoritesPlaylist;
		}
	}

	public IObservable<PlaylistChangeEvent> PlaylistChangeEventStream => playlistChangeEventStream;

	private string FavoritesPlaylistFilePath => PlaylistFolder + "/" + favoritesPlaylistName + ultraStarPlaylistFileExtension;

	private string PlaylistFolder => Application.persistentDataPath + "/Playlists";

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		playlists.Clear();
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void AwakeSingleton()
	{
		CreateFavoritePlaylistIfNotExist();
	}

	private void CreateFavoritePlaylistIfNotExist()
	{
		if (!Directory.Exists(PlaylistFolder))
		{
			Directory.CreateDirectory(PlaylistFolder);
		}
		if (!File.Exists(FavoritesPlaylistFilePath))
		{
			File.WriteAllText(FavoritesPlaylistFilePath, "# UltraStar playlist");
		}
	}

	public bool IsFavoritesPlaylist(UltraStarPlaylist playlist)
	{
		return playlist.Name == favoritesPlaylistName;
	}

	public void SavePlaylist(UltraStarPlaylist playlist)
	{
		if (!playlist.FilePath.IsNullOrEmpty())
		{
			string[] lines = playlist.GetLines();
			File.WriteAllLines(playlist.FilePath, lines);
		}
	}

	private void ScanPlaylistFolder()
	{
		playlists = new List<UltraStarPlaylist>();
		foreach (string file in new FolderScanner("*" + ultraStarPlaylistFileExtension).GetFiles(PlaylistFolder))
		{
			UltraStarPlaylist playlist = UltraStarPlaylistParser.ParseFile(file);
			AddPlaylist(playlist, file);
		}
	}

	private void AddPlaylist(UltraStarPlaylist playlist, string filePath)
	{
		if (!File.Exists(filePath))
		{
			using (File.Create(filePath))
			{
			}
		}
		playlists.Add(playlist);
		if (Path.GetFullPath(FavoritesPlaylistFilePath) == Path.GetFullPath(filePath))
		{
			favoritesPlaylist = playlist;
		}
	}

	public void RemoveSongFromPlaylist(UltraStarPlaylist playlist, SongMeta songMeta)
	{
		playlist.RemoveSongEntry(songMeta.Artist, songMeta.Title);
		playlistChangeEventStream.OnNext(new PlaylistChangeEvent(playlist, songMeta));
		SavePlaylist(playlist);
	}

	public void AddSongToPlaylist(UltraStarPlaylist playlist, SongMeta songMeta)
	{
		if (!HasSongEntry(playlist, songMeta))
		{
			playlist.AddLineEntry(new UltraStartPlaylistSongEntry(songMeta.Artist, songMeta.Title));
			playlistChangeEventStream.OnNext(new PlaylistChangeEvent(playlist, songMeta));
			SavePlaylist(playlist);
		}
	}

	public EPlaylistNameIssue GetPlaylistNameIssue(UltraStarPlaylist playlist, string newName)
	{
		if (newName.IsNullOrEmpty())
		{
			return EPlaylistNameIssue.Invalid;
		}
		foreach (char item in Path.GetInvalidPathChars().Concat(new List<char> { '\\', '/' }).ToList())
		{
			if (newName.Contains(item))
			{
				return EPlaylistNameIssue.Invalid;
			}
		}
		if ((from it in playlists
			where it != playlist
			select it.Name).AnyMatch((string playlistName) => playlistName == newName))
		{
			return EPlaylistNameIssue.Duplicate;
		}
		return EPlaylistNameIssue.None;
	}

	public bool TrySetPlaylistName(UltraStarPlaylist playlist, string newName, out string errorMessage)
	{
		if (playlist == null || playlist.Name == newName)
		{
			errorMessage = "";
			return true;
		}
		if (playlist is UltraStarAllSongsPlaylist || playlist.Name == favoritesPlaylistName || playlist.FilePath.IsNullOrEmpty())
		{
			errorMessage = "Cannot rename this playlist";
			return false;
		}
		if (GetPlaylistNameIssue(playlist, newName) != EPlaylistNameIssue.None)
		{
			errorMessage = "Invalid or duplicate playlist name";
			return false;
		}
		string text = playlist.Name;
		string filePath = playlist.FilePath;
		string text2 = Path.GetDirectoryName(playlist.FilePath) + "/" + newName + ultraStarPlaylistFileExtension;
		try
		{
			Debug.Log("Moving playlist from '" + filePath + "' to '" + text2 + "'");
			File.Move(filePath, text2);
			playlist.SetFileName(newName);
			playlist.RemoveHeaderField("name");
		}
		catch (Exception ex)
		{
			Log.Logger.Error(ex, "Failed to rename playlist to '" + newName + "'");
			errorMessage = "Failed to rename playlist to '" + newName + "': " + ex.Message;
			return false;
		}
		if (settings.SongSelectSettings.playlistName == text)
		{
			settings.SongSelectSettings.playlistName = newName;
		}
		playlistChangeEventStream.OnNext(new PlaylistChangeEvent(playlist, null));
		errorMessage = "";
		return true;
	}

	public string TryRemovePlaylist(UltraStarPlaylist playlist)
	{
		if (playlist == null || playlist is UltraStarAllSongsPlaylist || playlist.Name == favoritesPlaylistName || playlist.FilePath.IsNullOrEmpty())
		{
			return "Cannot remove this playlist";
		}
		string text = playlist.Name;
		try
		{
			Debug.Log("Deleting playlist '" + text + "'");
			File.Delete(playlist.FilePath);
		}
		catch (Exception ex)
		{
			Log.Logger.Error(ex, "Failed to delete playlist '" + text + "'");
			return "Failed to delete playlist '" + text + "': " + ex.Message;
		}
		if (settings.SongSelectSettings.playlistName == text)
		{
			settings.SongSelectSettings.playlistName = "";
		}
		playlists.Remove(playlist);
		playlistChangeEventStream.OnNext(new PlaylistChangeEvent(playlist, null));
		return "";
	}

	public UltraStarPlaylist CreateNewPlaylist(string initialName)
	{
		string newUniquePlaylistName = GetNewUniquePlaylistName(initialName);
		string filePath = PlaylistFolder + "/" + newUniquePlaylistName + ultraStarPlaylistFileExtension;
		UltraStarPlaylist ultraStarPlaylist = new UltraStarPlaylist(filePath);
		AddPlaylist(ultraStarPlaylist, filePath);
		playlistChangeEventStream.OnNext(new PlaylistChangeEvent(ultraStarPlaylist, null));
		return ultraStarPlaylist;
	}

	private string GetNewUniquePlaylistName(string initialName)
	{
		int num = 1;
		string text = initialName;
		while (!IsPlaylistNameUnique(text))
		{
			num++;
			text = $"{initialName} {num}";
		}
		return text;
		bool IsPlaylistNameUnique(string playlistName)
		{
			if (Playlists.AllMatch((UltraStarPlaylist playlist) => playlist.Name != playlistName))
			{
				return Playlists.AllMatch((UltraStarPlaylist playlist) => playlist.FileName != playlistName);
			}
			return false;
		}
	}

	public bool HasSongEntry(UltraStarPlaylist playlist, SongMeta songMeta)
	{
		return playlist.HasSongEntry(songMeta.Artist, songMeta.Title);
	}
}
