public class UltraStartPlaylistSongEntry : UltraStartPlaylistLineEntry
{
	public string Artist { get; private set; }

	public string Title { get; private set; }

	public UltraStartPlaylistSongEntry(string line, string artist, string title)
		: base(line)
	{
		Artist = artist;
		Title = title;
	}

	public UltraStartPlaylistSongEntry(string artist, string title)
		: this(QuoteIfNeeded(artist) + $" {UltraStarPlaylistParser.defaultSeparator} " + QuoteIfNeeded(title), artist, title)
	{
		Artist = artist;
		Title = title;
	}

	private static string QuoteIfNeeded(string text)
	{
		if (!UltraStarPlaylistParser.separators.AnyMatch((char separator) => text.Contains(separator)))
		{
			return text;
		}
		return "\"" + text + "\"";
	}
}
