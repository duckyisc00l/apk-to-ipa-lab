public interface IClientSideConnectRequestManager
{
	bool TryGetConnectedServerHandler(out IConnectedServerHandler connectedServerHandler);

	void RemoveConnectedServerHandler(IConnectedServerHandler connectedServerHandler);
}
