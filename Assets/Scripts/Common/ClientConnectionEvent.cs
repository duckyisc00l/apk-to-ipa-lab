public class ClientConnectionEvent
{
	public bool IsConnected { get; private set; }

	public IConnectedClientHandler ConnectedClientHandler { get; private set; }

	public ClientConnectionEvent(IConnectedClientHandler connectedClientHandler, bool isConnected)
	{
		ConnectedClientHandler = connectedClientHandler;
		IsConnected = isConnected;
	}
}
