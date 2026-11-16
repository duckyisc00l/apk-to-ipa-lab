using System.Collections.Generic;
using System.IO;
using System.Linq;

public class UltraStarPlaylist
{
	private readonly List<UltraStartPlaylistLineEntry> lineEntries = new List<UltraStartPlaylistLineEntry>();

	private readonly HashSet<string> songHashes = new HashSet<string>();

	private readonly Dictionary<string, string> headerFields = new Dictionary<string, string>();

	public string FilePath { get; private set; }

	public string FileName => Path.GetFileNameWithoutExtension(FilePath);

	public string Name
	{
		get
		{
			string headerValue = GetHeaderValue("name");
			if (!headerValue.IsNullOrEmpty())
			{
				return headerValue;
			}
			return FileName;
		}
	}

	public UltraStarPlaylist(string filePath)
	{
		FilePath = filePath;
	}

	public string GetHeaderValue(string headerName)
	{
		if (headerFields.TryGetValue(headerName.ToUpperInvariant(), out var value))
		{
			return value;
		}
		return "";
	}

	public void SetFileName(string newValue)
	{
		string directoryName = Path.GetDirectoryName(FilePath);
		FilePath = directoryName + "/" + newValue + PlaylistManager.ultraStarPlaylistFileExtension;
		headerFields.Remove("NAME");
	}

	public string[] GetLines()
	{
		return lineEntries.Select((UltraStartPlaylistLineEntry it) => it.Line).ToArray();
	}

	public void AddLineEntry(UltraStartPlaylistLineEntry lineEntry)
	{
		lineEntries.Add(lineEntry);
		if (lineEntry is UltraStartPlaylistSongEntry ultraStartPlaylistSongEntry)
		{
			songHashes.Add(GetHash(ultraStartPlaylistSongEntry.Artist, ultraStartPlaylistSongEntry.Title));
		}
		else if (lineEntry is UltraStartPlaylistHeaderEntry ultraStartPlaylistHeaderEntry)
		{
			headerFields[ultraStartPlaylistHeaderEntry.HeaderName] = ultraStartPlaylistHeaderEntry.HeaderValue;
		}
	}

	public void RemoveSongEntry(string artist, string title)
	{
		UltraStartPlaylistLineEntry ultraStartPlaylistLineEntry = lineEntries.Find((UltraStartPlaylistLineEntry it) => it is UltraStartPlaylistSongEntry ultraStartPlaylistSongEntry && ultraStartPlaylistSongEntry.Artist == artist.Trim() && ultraStartPlaylistSongEntry.Title == title.Trim());
		if (ultraStartPlaylistLineEntry != null)
		{
			lineEntries.Remove(ultraStartPlaylistLineEntry);
			songHashes.Remove(GetHash(artist, title));
		}
	}

	public List<UltraStartPlaylistSongEntry> GetSongEntries()
	{
		return lineEntries.OfType<UltraStartPlaylistSongEntry>().ToList();
	}

	public virtual bool HasSongEntry(string artist, string title)
	{
		return songHashes.Contains(GetHash(artist, title));
	}

	private string GetHash(string artist, string title)
	{
		return artist.Trim() + "-" + title.Trim();
	}

	public void RemoveHeaderField(string headerName)
	{
		headerFields.Remove(headerName.ToUpperInvariant());
		UltraStartPlaylistLineEntry item = lineEntries.FirstOrDefault((UltraStartPlaylistLineEntry it) => it is UltraStartPlaylistHeaderEntry ultraStartPlaylistHeaderEntry && ultraStartPlaylistHeaderEntry.HeaderName == headerName.ToUpperInvariant());
		lineEntries.Remove(item);
	}
}
