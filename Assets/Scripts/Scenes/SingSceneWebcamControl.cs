using ProTrans;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class SingSceneWebcamControl : MonoBehaviour, INeedInjection
{
	[Inject]
	private Settings settings;

	[Inject(UxmlName = "webcamRenderContainer")]
	private Image webcamRenderContainer;

	private WebCamTexture webcamTexture;

	public void InitWebcam()
	{
		webcamTexture = new WebCamTexture(settings.WebcamSettings.CurrentDeviceName);
		webcamRenderContainer.image = webcamTexture;
		if (WebcamsAvailable())
		{
			if (settings.WebcamSettings.UseAsBackgroundInSingScene)
			{
				webcamTexture.Play();
			}
			webcamRenderContainer.SetVisibleByDisplay(settings.WebcamSettings.UseAsBackgroundInSingScene);
		}
	}

	public void Play()
	{
		webcamTexture.Play();
	}

	public void Stop()
	{
		webcamTexture.Stop();
	}

	public string CurrentDeviceName()
	{
		return webcamTexture.deviceName;
	}

	public bool WebcamsAvailable()
	{
		return WebCamTexture.devices.Length != 0;
	}

	public void AddToContextMenu(ContextMenuPopupControl contextMenuPopup)
	{
		if (!WebcamsAvailable())
		{
			return;
		}
		contextMenuPopup.AddItem(TranslationManager.GetTranslation(R.Messages.action_webcamOnOff), () =>
		{
			bool flag = !webcamRenderContainer.IsVisibleByDisplay();
			if (flag)
			{
				Log.Logger.Information("Webcam activated: {webcamname}", webcamTexture.deviceName);
				Play();
			}
			else
			{
				Log.Logger.Information("Webcam deactivated: {webcamname}", webcamTexture.deviceName);
				Stop();
			}
			webcamRenderContainer.SetVisibleByDisplay(flag);
			settings.WebcamSettings.UseAsBackgroundInSingScene = flag;
		});
	}
}
