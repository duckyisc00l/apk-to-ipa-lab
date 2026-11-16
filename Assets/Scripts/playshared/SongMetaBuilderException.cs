using System;

[Serializable]
public class SongMetaBuilderException : Exception
{
	public SongMetaBuilderException(string message)
		: base(message)
	{
	}

	public SongMetaBuilderException(string message, Exception innerException)
		: base(message, innerException)
	{
	}
}
