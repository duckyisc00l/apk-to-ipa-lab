using System.Linq;
using UnityEngine;

public static class MicProfileExtensions
{
	public static bool IsConnected(this MicProfile micProfile, IServerSideConnectRequestManager serverSideConnectRequestManager)
	{
		if (!micProfile.IsInputFromConnectedClient || !serverSideConnectRequestManager.TryGetConnectedClientHandler(micProfile.ConnectedClientId, out var _))
		{
			if (!micProfile.IsInputFromConnectedClient)
			{
				return Microphone.devices.Contains(micProfile.Name);
			}
			return false;
		}
		return true;
	}

	public static bool IsEnabledAndConnected(this MicProfile micProfile, IServerSideConnectRequestManager serverSideConnectRequestManager)
	{
		if (micProfile.IsEnabled)
		{
			return micProfile.IsConnected(serverSideConnectRequestManager);
		}
		return false;
	}
}
