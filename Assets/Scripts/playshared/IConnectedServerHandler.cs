using System;

public interface IConnectedServerHandler
{
	IObservable<JsonSerializable> ReceivedMessageStream { get; }

	void SendMessageToServer(JsonSerializable jsonSerializable);

	void ReadMessagesFromServer();
}
