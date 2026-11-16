using System;

[Serializable]
public class VoicesBuilderException : Exception
{
	public VoicesBuilderException()
	{
	}

	public VoicesBuilderException(string message)
		: base(message)
	{
	}

	public VoicesBuilderException(string message, Exception innerException)
		: base(message, innerException)
	{
	}
}
