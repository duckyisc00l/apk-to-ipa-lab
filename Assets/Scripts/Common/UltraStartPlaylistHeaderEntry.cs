public class UltraStartPlaylistHeaderEntry : UltraStartPlaylistLineEntry
{
	public string HeaderName { get; private set; }

	public string HeaderValue { get; private set; }

	public UltraStartPlaylistHeaderEntry(string line, string headerName, string headerValue)
		: base(line)
	{
		HeaderName = headerName.ToUpperInvariant().Trim();
		HeaderValue = headerValue.Trim();
	}
}
