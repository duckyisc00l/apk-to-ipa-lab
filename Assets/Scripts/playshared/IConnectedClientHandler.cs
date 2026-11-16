using System;

public interface IConnectedClientHandler : IDisposable
{
	string ClientId { get; }

	string ClientName { get; }

	IObservable<JsonSerializable> ReceivedMessageStream { get; }

	void SendMessageToClient(JsonSerializable jsonSerializable);

	void ReadMessagesFromClient();
}
