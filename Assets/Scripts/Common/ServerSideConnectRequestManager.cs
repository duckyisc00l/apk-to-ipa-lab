using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using SimpleHttpServerForUnity;
using UniInject;
using UniRx;
using UnityEngine;

public class ServerSideConnectRequestManager : AbstractSingletonBehaviour, INeedInjection, IServerSideConnectRequestManager
{
	private static Dictionary<string, IConnectedClientHandler> idToConnectedClientMap = new Dictionary<string, IConnectedClientHandler>();

	private readonly Subject<ClientConnectionEvent> clientConnectedEventStream = new Subject<ClientConnectionEvent>();

	private UdpClient serverUdpClient;

	private bool hasBeenDestroyed;

	[Inject]
	private HttpServer httpServer;

	[Inject]
	private Settings settings;

	public static ServerSideConnectRequestManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<ServerSideConnectRequestManager>();

	public static int ConnectedClientCount => idToConnectedClientMap.Count;

	public IObservable<ClientConnectionEvent> ClientConnectedEventStream => clientConnectedEventStream.ObserveOnMainThread();

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void InitOnLoad()
	{
		idToConnectedClientMap = new Dictionary<string, IConnectedClientHandler>();
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		if (!Application.isPlaying || Instance != this)
		{
			return;
		}
		GameObjectUtils.SetTopLevelGameObjectAndDontDestroyOnLoad(base.gameObject);
		serverUdpClient = ((!settings.OwnHost.IsNullOrEmpty()) ? new UdpClient(new IPEndPoint(IPAddress.Parse(settings.OwnHost), settings.UdpPortOnServer)) : new UdpClient(settings.UdpPortOnServer));
		ThreadPool.QueueUserWorkItem((ThreadPool.PoolHandle poolHandle) =>
		{
			while (!hasBeenDestroyed)
			{
				ServerAcceptMessageFromClient();
			}
		});
	}

	private void ServerAcceptMessageFromClient()
	{
		try
		{
			Debug.Log("Server listening for connect request on " + serverUdpClient.Client.LocalEndPoint);
			IPEndPoint remoteEP = new IPEndPoint(IPAddress.Any, 0);
			byte[] bytes = serverUdpClient.Receive(ref remoteEP);
			string message = Encoding.UTF8.GetString(bytes);
			HandleConnectRequest(remoteEP, message);
		}
		catch (Exception ex)
		{
			if (!(ex is SocketException { SocketErrorCode: SocketError.Interrupted }) || !hasBeenDestroyed)
			{
				Debug.LogException(ex);
			}
		}
	}

	private void HandleConnectRequest(IPEndPoint clientIpEndPoint, string message)
	{
		Debug.Log($"Received connect request from client {clientIpEndPoint} ({clientIpEndPoint.Address}): '{message}'");
		try
		{
			ConnectRequestDto connectRequestDto = JsonConverter.FromJson<ConnectRequestDto>(message);
			if (connectRequestDto.ProtocolVersion != 4)
			{
				throw new ConnectRequestException("Malformed ConnectRequest: protocolVersion does not match" + $" (server (main game): {4}, client (companion app): {connectRequestDto.ProtocolVersion}).");
			}
			if (connectRequestDto.ClientName.IsNullOrEmpty())
			{
				throw new ConnectRequestException("Malformed ConnectRequest: missing ClientName.");
			}
			if (connectRequestDto.ClientId.IsNullOrEmpty())
			{
				throw new ConnectRequestException("Malformed ConnectRequest: missing ClientId.");
			}
			HandleClientMessage(clientIpEndPoint, connectRequestDto);
		}
		catch (Exception ex)
		{
			Debug.LogException(ex);
			serverUdpClient.Send(new ConnectResponseDto
			{
				ErrorMessage = ex.Message
			}.ToJson(), clientIpEndPoint);
		}
	}

	private void HandleClientMessageWithNoMicrophone(IPEndPoint clientIpEndPoint, ConnectRequestDto connectRequestDto)
	{
		ConnectResponseDto jsonSerializable = new ConnectResponseDto
		{
			ClientName = connectRequestDto.ClientName,
			ClientId = connectRequestDto.ClientId,
			HttpServerPort = httpServer.port
		};
		serverUdpClient.Send(jsonSerializable.ToJson(), clientIpEndPoint);
	}

	private void HandleClientMessage(IPEndPoint clientIpEndPoint, ConnectRequestDto connectRequestDto)
	{
		ConnectedClientHandler newConnectedClientHandler = RegisterClient(clientIpEndPoint, connectRequestDto.ClientName, connectRequestDto.ClientId);
		clientConnectedEventStream.OnNext(new ClientConnectionEvent(newConnectedClientHandler, isConnected: true));
		ConnectResponseDto jsonSerializable = new ConnectResponseDto
		{
			ClientName = connectRequestDto.ClientName,
			ClientId = connectRequestDto.ClientId,
			HttpServerPort = httpServer.port,
			MessagingPort = newConnectedClientHandler.ClientTcpListener.GetPort()
		};
		Debug.Log("Sending ConnectResponse to " + clientIpEndPoint.Address?.ToString() + ":" + clientIpEndPoint.Port);
		serverUdpClient.Send(jsonSerializable.ToJson(), clientIpEndPoint);
		MicProfile micProfile = settings.MicProfiles.FirstOrDefault((MicProfile micProfile2) => micProfile2.ConnectedClientId == newConnectedClientHandler.ClientId);
		if (micProfile == null)
		{
			micProfile = new MicProfile();
		}
		Debug.Log("Sending MicProfile to " + clientIpEndPoint.Address?.ToString() + ":" + clientIpEndPoint.Port);
		newConnectedClientHandler.SendMessageToClient(new MicProfileMessageDto(micProfile));
	}

	private void OnDestroy()
	{
		hasBeenDestroyed = true;
		serverUdpClient?.Close();
		if (Instance == this)
		{
			RemoveAllConnectedClientHandlers();
		}
	}

	private void RemoveAllConnectedClientHandlers()
	{
		idToConnectedClientMap.Values.ForEach((IConnectedClientHandler connectedClientHandler) =>
		{
			clientConnectedEventStream.OnNext(new ClientConnectionEvent(connectedClientHandler, isConnected: false));
			connectedClientHandler.Dispose();
		});
		idToConnectedClientMap.Clear();
	}

	public void RemoveConnectedClientHandler(IConnectedClientHandler connectedClientHandler)
	{
		if (idToConnectedClientMap.ContainsKey(connectedClientHandler.ClientId))
		{
			idToConnectedClientMap.Remove(connectedClientHandler.ClientId);
		}
		clientConnectedEventStream.OnNext(new ClientConnectionEvent(connectedClientHandler, isConnected: false));
		connectedClientHandler.Dispose();
	}

	private ConnectedClientHandler RegisterClient(IPEndPoint clientIpEndPoint, string clientName, string clientId)
	{
		if (idToConnectedClientMap.TryGetValue(clientId, out var value))
		{
			value.Dispose();
		}
		ConnectedClientHandler connectedClientHandler = new ConnectedClientHandler(this, clientIpEndPoint, clientName, clientId);
		idToConnectedClientMap[clientId] = connectedClientHandler;
		Debug.Log("New number of connected clients: " + idToConnectedClientMap.Count);
		return connectedClientHandler;
	}

	public List<IConnectedClientHandler> GetAllConnectedClientHandlers()
	{
		return idToConnectedClientMap.Values.ToList();
	}

	public bool TryGetConnectedClientHandler(string clientId, out IConnectedClientHandler connectedClientHandler)
	{
		if (clientId == null)
		{
			connectedClientHandler = null;
			return false;
		}
		return idToConnectedClientMap.TryGetValue(clientId, out connectedClientHandler);
	}

	public List<ConnectedClientHandlerAndMicProfile> GetConnectedClientHandlers(IEnumerable<MicProfile> micProfiles)
	{
		List<ConnectedClientHandlerAndMicProfile> result = new List<ConnectedClientHandlerAndMicProfile>();
		micProfiles.Where((MicProfile micProfile) => micProfile?.IsInputFromConnectedClient ?? false).ForEach((MicProfile micProfile) =>
		{
			if (TryGetConnectedClientHandler(micProfile.ConnectedClientId, out var connectedClientHandler))
			{
				result.Add(new ConnectedClientHandlerAndMicProfile(connectedClientHandler, micProfile));
			}
		});
		return result;
	}
}
