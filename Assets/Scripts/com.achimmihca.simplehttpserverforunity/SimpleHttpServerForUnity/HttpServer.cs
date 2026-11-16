using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using UnityEngine;

namespace SimpleHttpServerForUnity
{
	public class HttpServer : MonoBehaviour
	{
		private static HttpServer instance;

		public string scheme = "http";

		public string host = "localhost";

		public int port = 6789;

		private HttpListener httpListener;

		private bool hasBeenDestroyed;

		private readonly Dictionary<string, EndpointHandler> idToEndpointHandlerMap = new Dictionary<string, EndpointHandler>();

		private readonly List<EndpointHandler> sortedEndpointHandlers = new List<EndpointHandler>();

		private readonly ConcurrentQueue<PendingRequest> requestQueue = new ConcurrentQueue<PendingRequest>();

		private Thread acceptRequestThread;

		public static HttpServer Instance
		{
			get
			{
				if (instance == null)
				{
					HttpServer httpServer = UnityEngine.Object.FindObjectOfType<HttpServer>();
					if (httpServer != null)
					{
						httpServer.InitSingleInstance();
					}
				}
				return instance;
			}
		}

		public static bool IsSupported => HttpListener.IsSupported;

		public Action<EndpointRequestData> NoEndpointFoundCallback { get; set; } = DefaultNoEndpointFoundCallback;

		[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
		private static void InitOnLoad()
		{
			instance = null;
		}

		protected virtual void Awake()
		{
			InitSingleInstance();
			if (!(instance != this) && !IsSupported)
			{
				Debug.LogWarning("HttpListener not supported on this platform");
			}
		}

		protected virtual void OnDestroy()
		{
			hasBeenDestroyed = true;
			if (httpListener != null && httpListener.IsListening)
			{
				StopHttpListener();
			}
		}

		protected virtual void Update()
		{
			PendingRequest result;
			while (requestQueue.TryDequeue(out result))
			{
				DoHandleRequest(result);
			}
		}

		public void StartHttpListener()
		{
			if (!IsSupported)
			{
				Debug.LogError("HttpListener not supported on this platform.");
				return;
			}
			if (httpListener != null && httpListener.IsListening)
			{
				Debug.LogWarning("HttpServer already listening");
				return;
			}
			if (httpListener == null)
			{
				httpListener = new HttpListener();
				httpListener.Prefixes.Add($"{scheme}://{host}:{port}/");
			}
			Debug.Log($"Starting HttpListener on {host}:{port}");
			httpListener.Start();
			acceptRequestThread = new Thread(() =>
			{
				while (!hasBeenDestroyed && httpListener != null && httpListener.IsListening)
				{
					AcceptRequest(httpListener);
				}
			});
			acceptRequestThread.Start();
		}

		public void StopHttpListener()
		{
			if (httpListener == null || !httpListener.IsListening)
			{
				Debug.LogWarning("HttpServer already not listening");
				return;
			}
			Debug.Log($"Stopping HttpListener on {host}:{port}");
			httpListener?.Close();
			httpListener = null;
		}

		public EndpointHandlerBuilder On(HttpMethod httpMethod, string pathPattern)
		{
			return new EndpointHandlerBuilder(this, httpMethod, pathPattern);
		}

		public void RegisterEndpoint(EndpointHandler endpointHandler)
		{
			if (IsSupported)
			{
				string endpointId = GetEndpointId(endpointHandler.HttpMethod, endpointHandler.PathPattern);
				if (idToEndpointHandlerMap.ContainsKey(endpointId))
				{
					this.RemoveEndpoint(endpointHandler);
				}
				idToEndpointHandlerMap.Add(endpointId, endpointHandler);
				sortedEndpointHandlers.Add(endpointHandler);
				sortedEndpointHandlers.Sort(EndpointHandler.CompareDescendingByPlaceholderCount);
			}
		}

		public void RemoveEndpoint(HttpMethod httpMethod, string pathPattern)
		{
			string endpointId = GetEndpointId(httpMethod, pathPattern);
			if (idToEndpointHandlerMap.TryGetValue(endpointId, out var value))
			{
				idToEndpointHandlerMap.Remove(endpointId);
				sortedEndpointHandlers.Remove(value);
			}
		}

		public List<EndpointData> GetRegisteredEndpoints()
		{
			return sortedEndpointHandlers.Select((EndpointHandler it) => new EndpointData(it.HttpMethod, it.PathPattern, it.Description)).ToList();
		}

		private void AcceptRequest(HttpListener listener)
		{
			try
			{
				HttpListenerContext context = listener.GetContext();
				if (TryFindMatchingEndpointHandler(context, out var pendingRequest))
				{
					if (pendingRequest.EndpointHandler.ResponseThread == ResponseThread.Immediately)
					{
						DoHandleRequest(pendingRequest);
					}
					if (pendingRequest.EndpointHandler.ResponseThread == ResponseThread.NewThread)
					{
						new Thread(() =>
						{
							DoHandleRequest(pendingRequest);
						}).Start();
					}
					else
					{
						requestQueue.Enqueue(pendingRequest);
					}
				}
				else
				{
					requestQueue.Enqueue(new PendingRequest(context, null, null));
				}
			}
			catch (Exception ex)
			{
				if (!(ex is HttpListenerException { ErrorCode: 500 }) || !hasBeenDestroyed)
				{
					Debug.LogException(ex);
				}
			}
		}

		private void DoHandleRequest(PendingRequest pendingRequest)
		{
			try
			{
				if (pendingRequest.EndpointHandler != null)
				{
					pendingRequest.EndpointHandler.DoHandle(pendingRequest.HttpListenerContext, pendingRequest.PlaceholderValues);
				}
				else if (NoEndpointFoundCallback != null)
				{
					NoEndpointFoundCallback(new EndpointRequestData(pendingRequest.HttpListenerContext, null));
				}
			}
			catch (Exception exception)
			{
				Debug.LogException(exception);
			}
			finally
			{
				try
				{
					if (pendingRequest.HttpListenerContext != null)
					{
						pendingRequest.HttpListenerContext.Response.Close();
					}
				}
				catch (Exception exception2)
				{
					Debug.LogError("Exception while trying to close the HttpListenerContext.Response.OutputStream");
					Debug.LogException(exception2);
				}
			}
		}

		private bool TryFindMatchingEndpointHandler(HttpListenerContext context, out PendingRequest pendingRequest)
		{
			foreach (EndpointHandler sortedEndpointHandler in sortedEndpointHandlers)
			{
				if (sortedEndpointHandler.CanHandle(context, out var placeholderValues))
				{
					pendingRequest = new PendingRequest(context, sortedEndpointHandler, placeholderValues);
					return true;
				}
			}
			pendingRequest = null;
			return false;
		}

		protected void InitSingleInstance()
		{
			if (Application.isPlaying)
			{
				if (instance != null && instance != this)
				{
					UnityEngine.Object.Destroy(base.gameObject);
					return;
				}
				instance = this;
				base.transform.SetParent(null);
				UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
			}
		}

		private static string GetEndpointId(HttpMethod method, string pattern)
		{
			return method.Method + "|" + pattern;
		}

		private static void DefaultNoEndpointFoundCallback(EndpointRequestData requestData)
		{
			Debug.Log($"No matching endpoint found for '{requestData.Context.Request.HttpMethod}' on {requestData.Context.Request.Url}");
			requestData.Context.Response.SendResponse("", HttpStatusCode.NotFound);
		}
	}
}
