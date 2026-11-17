using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.NetworkInformation;
using SimpleHttpServerForUnity;
using UnityEngine;

public class UltraStarPlayHttpServer : HttpServer
{
	protected override void Awake()
	{
		if (Application.isPlaying)
		{
			InitSingleInstance();
			_ = HttpServer.Instance != this;
		}
	}

	private void Start()
	{
		if (Application.isPlaying && !(HttpServer.Instance != this))
		{
			Settings settings = SettingsManager.Instance.Settings;
			host = ((!settings.OwnHost.IsNullOrEmpty()) ? settings.OwnHost : IpAddressUtils.GetIpAddress(AddressFamily.IPv4, NetworkInterfaceType.Wireless80211));
			base.NoEndpointFoundCallback = SendNoEndpointFound;
			StartHttpListener();
			On(HttpMethod.Get, "api/rest/endpoints").WithDescription("Get currently registered endpoints").UntilDestroy(base.gameObject).Do(SendRegisteredEndpoints);
			On(HttpMethod.Get, "api/rest/songs").WithDescription("Get loaded songs").UntilDestroy(base.gameObject).Do(SendLoadedSongs);
			On(HttpMethod.Get, "/api/rest/hello/{name}").WithDescription("Say hello (path-parameter example)").UntilDestroy(base.gameObject).Do(SendHello);
		}
	}

	private void SendHello(EndpointRequestData requestData)
	{
		requestData.Context.Response.SendResponse(new MessageDto
		{
			Message = "Hello " + requestData.PathParameters["name"]
		}.ToJson());
	}

	private void SendRegisteredEndpoints(EndpointRequestData requestData)
	{
		requestData.Context.Response.SendResponse(new EndpointListDto
		{
			Endpoints = (from endpoint in GetRegisteredEndpoints()
				select new EndpointDto
				{
					HttpMethod = endpoint.HttpMethod.Method,
					UrlPattern = endpoint.PathPattern,
					Description = endpoint.Description
				}).ToList()
		}.ToJson());
	}

	private void SendLoadedSongs(EndpointRequestData requestData)
	{
		SongMetaManager songMetaManager = SongMetaManager.Instance;
		requestData.Context.Response.SendResponse(new LoadedSongsDto
		{
			IsSongScanFinished = SongMetaManager.IsSongScanFinished,
			SongCount = songMetaManager.GetSongMetas().Count,
			SongList = (from songMeta in songMetaManager.GetSongMetas()
				select new SongDto
				{
					Artist = songMeta.Artist,
					Title = songMeta.Title,
					Hash = songMeta.SongHash
				}).ToList()
		}.ToJson());
	}

	private static void SendNoEndpointFound(EndpointRequestData requestData)
	{
		requestData.Context.Response.SendResponse(new ErrorMessageDto
		{
			ErrorMessage = "No endpoint found for '" + requestData.Context.Request.HttpMethod + "' on '" + requestData.Context.Request.RawUrl + "'. Try 'GET' on 'api/rest/endpoints' to get the available endpoints."
		}.ToJson(), HttpStatusCode.NotFound);
	}
}
