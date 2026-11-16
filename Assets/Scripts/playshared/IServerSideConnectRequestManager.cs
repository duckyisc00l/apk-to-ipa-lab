public interface IServerSideConnectRequestManager
{
	bool TryGetConnectedClientHandler(string clientId, out IConnectedClientHandler connectedClientHandler);

	void RemoveConnectedClientHandler(IConnectedClientHandler connectedClientHandler);
}
