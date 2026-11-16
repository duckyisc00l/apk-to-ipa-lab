using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;

public class WebCamManager : AbstractSingletonBehaviour, INeedInjection
{
	[Inject]
	private Settings settings;

	[Inject]
	private SceneNavigator sceneNavigator;

	private WebCamTexture webCamTexture;

	private WebCamDevice webCamTextureDevice;

	public static WebCamManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<WebCamManager>();

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		sceneNavigator.BeforeSceneChangeEventStream.Subscribe((BeforeSceneChangeEvent _) =>
		{
			StopWebCam();
		});
	}

	public List<WebCamDevice> GetWebCamDevices()
	{
		return WebCamTexture.devices.ToList();
	}

	public WebCamTexture StartSelectedWebCam()
	{
		WebCamDevice selectedWebCamDevice = GetSelectedWebCamDevice();
		if (selectedWebCamDevice.name == webCamTextureDevice.name && webCamTexture != null && webCamTexture.isPlaying)
		{
			return webCamTexture;
		}
		StopWebCam();
		Debug.Log("Starting webcam '" + selectedWebCamDevice.name + "'");
		webCamTexture = new WebCamTexture(selectedWebCamDevice.name);
		webCamTexture.Play();
		webCamTextureDevice = selectedWebCamDevice;
		return webCamTexture;
	}

	public WebCamDevice GetSelectedWebCamDevice()
	{
		return GetWebCamDevices().FirstOrDefault((WebCamDevice device) => device.name == settings.WebcamSettings.CurrentDeviceName);
	}

	private void StopWebCam()
	{
		if (webCamTexture != null && webCamTexture.isPlaying)
		{
			Debug.Log("Stopping webcam '" + webCamTexture.name + "'");
			webCamTexture.Stop();
		}
	}

	public void SaveSnapshot(string filePath)
	{
		if (webCamTexture == null)
		{
			return;
		}
		try
		{
			Texture2D texture2D = new Texture2D(webCamTexture.width, webCamTexture.height);
			texture2D.SetPixels(webCamTexture.GetPixels());
			byte[] bytes = texture2D.EncodeToPNG();
			string directoryName = Path.GetDirectoryName(filePath);
			if (!directoryName.IsNullOrEmpty() && !Directory.Exists(directoryName))
			{
				Directory.CreateDirectory(directoryName);
			}
			File.WriteAllBytes(filePath, bytes);
			UnityEngine.Object.Destroy(texture2D);
		}
		catch (Exception innerException)
		{
			throw new UltraStarPlayException("Failed to save texture to '" + filePath + "'", innerException);
		}
	}
}
