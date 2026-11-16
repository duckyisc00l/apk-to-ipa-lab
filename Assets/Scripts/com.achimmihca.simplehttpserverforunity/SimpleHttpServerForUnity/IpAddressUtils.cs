using System.Net.NetworkInformation;
using System.Net.Sockets;

namespace SimpleHttpServerForUnity
{
	public class IpAddressUtils
	{
		public static string GetIpAddress(AddressFamily addressFamily, params NetworkInterfaceType[] networkInterfaceTypes)
		{
			if (addressFamily == AddressFamily.IPv6 && !Socket.OSSupportsIPv6)
			{
				return null;
			}
			string result = "localhost";
			NetworkInterface[] allNetworkInterfaces = NetworkInterface.GetAllNetworkInterfaces();
			for (int i = 0; i < allNetworkInterfaces.Length; i++)
			{
				foreach (UnicastIPAddressInformation unicastAddress in allNetworkInterfaces[i].GetIPProperties().UnicastAddresses)
				{
					if (addressFamily == AddressFamily.IPv4 && unicastAddress.Address.ToString() != "127.0.0.1")
					{
						if (unicastAddress.Address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
						{
							result = unicastAddress.Address.ToString();
						}
					}
					else if (addressFamily == AddressFamily.IPv6 && unicastAddress.Address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetworkV6 && unicastAddress.Address.ToString() != "127.0.0.1")
					{
						result = unicastAddress.Address.ToString();
					}
				}
			}
			return result;
		}
	}
}
