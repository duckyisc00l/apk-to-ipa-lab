using System.Net.Http;
using SimpleHttpServerForUnity;
using UniInject;
using UnityEngine;

public class SongSelectSceneRestControl : MonoBehaviour, INeedInjection
{
	[Inject]
	private SongRouletteControl songRouletteControl;

	private void Start()
	{
		HttpServer.Instance.On(HttpMethod.Post, "api/rest/selectNextSong").WithDescription("Select the next song").UntilDestroy(base.gameObject)
			.Do((EndpointRequestData _) =>
			{
				songRouletteControl.SelectNextSong();
			});
	}
}
