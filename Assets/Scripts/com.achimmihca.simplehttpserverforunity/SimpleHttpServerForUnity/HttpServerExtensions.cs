using System.Collections.Generic;
using System.Collections.Specialized;

namespace SimpleHttpServerForUnity
{
	public static class HttpServerExtensions
	{
		public static void RemoveEndpoint(this HttpServer httpServer, EndpointHandler endpointHandler)
		{
			httpServer.RemoveEndpoint(endpointHandler.HttpMethod, endpointHandler.PathPattern);
		}

		public static Dictionary<string, string> ToDictionary(this NameValueCollection nameValueCollection)
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			string[] allKeys = nameValueCollection.AllKeys;
			foreach (string text in allKeys)
			{
				dictionary[text] = nameValueCollection.Get(text);
			}
			return dictionary;
		}
	}
}
