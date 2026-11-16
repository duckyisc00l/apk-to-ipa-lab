using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using UniRx;
using UnityEngine;

public class ConnectedClientHandler : IConnectedClientHandler, IDisposable
{
	private readonly Subject<JsonSerializable> receivedMessageStream = new Subject<JsonSerializable>();

	private readonly IServerSideConnectRequestManager serverSideConnectRequestManager;

	private readonly object streamReaderLock = new object();

	private readonly Thread receiveDataThread;

	private readonly Thread clientStillAliveCheckThread;

	private TcpClient tcpClient;

	private NetworkStream tcpClientStream;

	private StreamReader tcpClientStreamReader;

	private StreamWriter tcpClientStreamWriter;

	private bool isDisposed;

	public IObservable<JsonSerializable> ReceivedMessageStream => receivedMessageStream;

	public IPEndPoint ClientIpEndPoint { get; private set; }

	public string ClientName { get; private set; }

	public string ClientId { get; private set; }

	public TcpListener ClientTcpListener { get; private set; }

	public ConnectedClientHandler(IServerSideConnectRequestManager serverSideConnectRequestManager, IPEndPoint clientIpEndPoint, string clientName, string clientId)
	{
		this.serverSideConnectRequestManager = serverSideConnectRequestManager;
		ClientIpEndPoint = clientIpEndPoint;
		ClientName = clientName;
		ClientId = clientId;
		if (ClientId.IsNullOrEmpty())
		{
			throw new ArgumentException("Attempt to create ConnectedClientHandler without ClientId");
		}
		ClientTcpListener = new TcpListener(IPAddress.Any, 0);
		ClientTcpListener.Start();
		Debug.Log($"Started TcpListener on port {ClientTcpListener.GetPort()} to receive messages from Companion App");
		receiveDataThread = new Thread(() =>
		{
			while (!isDisposed)
			{
				if (tcpClient == null)
				{
					try
					{
						tcpClient = ClientTcpListener.AcceptTcpClient();
						tcpClient.NoDelay = true;
						tcpClientStream = tcpClient.GetStream();
						tcpClientStreamReader = new StreamReader(tcpClientStream);
						tcpClientStreamWriter = new StreamWriter(tcpClientStream);
						tcpClientStreamWriter.AutoFlush = true;
					}
					catch (Exception exception)
					{
						Debug.LogError("Error when accepting TcpClient for Companion App. Closing TcpListener.");
						Debug.LogException(exception);
						this.serverSideConnectRequestManager.RemoveConnectedClientHandler(this);
						break;
					}
				}
				else
				{
					try
					{
						ReadMessagesFromClient();
					}
					catch (Exception exception2)
					{
						Debug.LogError("Error when reading TcpClient message. Closing TcpListener.");
						Debug.LogException(exception2);
						this.serverSideConnectRequestManager.RemoveConnectedClientHandler(this);
						break;
					}
				}
				Thread.Sleep(250);
			}
		});
		receiveDataThread.Start();
		clientStillAliveCheckThread = new Thread(() =>
		{
			while (!isDisposed)
			{
				if (tcpClient != null && tcpClientStream != null)
				{
					CheckClientStillAlive();
				}
				Thread.Sleep(1500);
			}
		});
		clientStillAliveCheckThread.Start();
	}

	private void CheckClientStillAlive()
	{
		try
		{
			if (!tcpClientStream.DataAvailable)
			{
				tcpClientStreamWriter.WriteLine(new StillAliveCheckDto().ToJson());
				tcpClientStreamWriter.Flush();
			}
		}
		catch (Exception exception)
		{
			Debug.LogException(exception);
			Debug.LogError("Failed sending data to client. Removing ConnectedClientHandler.");
			serverSideConnectRequestManager.RemoveConnectedClientHandler(this);
		}
	}

	public void ReadMessagesFromClient()
	{
		lock (streamReaderLock)
		{
			while (tcpClientStream != null && tcpClientStream.DataAvailable)
			{
				ReadMessageFromClient();
			}
		}
	}

	private void ReadMessageFromClient()
	{
		string text = tcpClientStreamReader.ReadLine();
		if (!text.IsNullOrEmpty())
		{
			text = text.Trim();
			if (!text.StartsWith("{") || !text.EndsWith("}"))
			{
				Debug.LogWarning("Received invalid JSON from client.");
			}
			else
			{
				HandleJsonMessageFromClient(text);
			}
		}
	}

	public void SendMessageToClient(JsonSerializable jsonSerializable)
	{
		if (tcpClient != null && tcpClientStream != null && tcpClientStreamWriter != null && tcpClientStream.CanWrite)
		{
			tcpClientStreamWriter.WriteLine(jsonSerializable.ToJson());
			tcpClientStreamWriter.Flush();
		}
		else
		{
			Debug.LogWarning("Cannot send message to client.");
		}
	}

	private void HandleJsonMessageFromClient(string json)
	{
		CompanionAppMessageDto companionAppMessageDto = JsonConverter.FromJson<CompanionAppMessageDto>(json);
		switch (companionAppMessageDto.MessageType)
		{
		case CompanionAppMessageType.StillAliveCheck:
			break;
		case CompanionAppMessageType.BeatPitchEvents:
			JsonConverter.FromJson<BeatPitchEventsDto>(json).BeatPitchEvents.ForEach((BeatPitchEventDto beatPitchEventDto) =>
			{
				receivedMessageStream.OnNext(beatPitchEventDto);
			});
			break;
		default:
			Debug.Log($"Unknown MessageType {companionAppMessageDto.MessageType} in JSON from server: {json}");
			break;
		}
	}

	public void Dispose()
	{
		isDisposed = true;
		tcpClientStream?.Close();
		tcpClient?.Close();
		ClientTcpListener?.Stop();
	}
}
