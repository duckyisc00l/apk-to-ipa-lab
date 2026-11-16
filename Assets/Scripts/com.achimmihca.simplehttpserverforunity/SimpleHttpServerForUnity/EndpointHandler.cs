using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;

namespace SimpleHttpServerForUnity
{
	public class EndpointHandler
	{
		private readonly EndpointData endpointData;

		private readonly Action<EndpointRequestData> requestCallback;

		private readonly CurlyBracePlaceholderMatcher patternMatcher;

		public static Comparison<EndpointHandler> CompareDescendingByPlaceholderCount { get; private set; } = (EndpointHandler a, EndpointHandler b) => b.PlaceholderCount.CompareTo(a.PlaceholderCount);

		public HttpMethod HttpMethod => endpointData.HttpMethod;

		public string PathPattern => endpointData.PathPattern;

		public string Description => endpointData.Description;

		public int PlaceholderCount => patternMatcher.PlaceholderCount;

		public ResponseThread ResponseThread { get; private set; }

		public EndpointHandler(HttpMethod httpMethod, string pathPattern, string description, ResponseThread responseThread, Action<EndpointRequestData> requestCallback)
		{
			patternMatcher = new CurlyBracePlaceholderMatcher(pathPattern);
			endpointData = new EndpointData(httpMethod, pathPattern, description);
			ResponseThread = responseThread;
			this.requestCallback = requestCallback;
		}

		public bool CanHandle(HttpListenerContext context, out Dictionary<string, string> placeholderValues)
		{
			HttpListenerRequest request = context.Request;
			placeholderValues = null;
			if (string.Equals(request.HttpMethod, HttpMethod.Method, StringComparison.OrdinalIgnoreCase))
			{
				return patternMatcher.TryMatch(request.Url.AbsolutePath, out placeholderValues);
			}
			return false;
		}

		public void DoHandle(HttpListenerContext context, Dictionary<string, string> placeholderValues)
		{
			EndpointRequestData obj = new EndpointRequestData(context, placeholderValues);
			requestCallback(obj);
		}
	}
}
