using System.Linq;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class WebcamOptionsControl : MonoBehaviour, INeedInjection, ITranslator
{
	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "deviceContainer")]
	private VisualElement deviceContainer;

	[Inject(UxmlName = "webcamRenderContainer")]
	private Image webcamRenderContainer;

	[Inject(UxmlName = "useWebcamContainer")]
	private VisualElement useWebcamContainer;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject]
	private Settings settings;

	[Inject]
	private WebCamManager webCamManager;

	private LabeledItemPickerControl<WebCamDevice> devicePickerControl;

	private void Start()
	{
		InitWebcamPicker();
		backButton.RegisterCallbackButtonTriggered(NavigateBack);
		backButton.Focus();
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			NavigateBack();
		});
	}

	public void UpdateTranslation()
	{
		useWebcamContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_webcam_useAsBackGroundInSingingScene);
		useWebcamContainer.Q<Toggle>().value = settings.WebcamSettings.UseAsBackgroundInSingScene;
		useWebcamContainer.Q<Toggle>().RegisterValueChangedCallback((ChangeEvent<bool> changeEvent) =>
		{
			settings.WebcamSettings.UseAsBackgroundInSingScene = changeEvent.newValue;
		});
		deviceContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_webcam_device);
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_webcam_title);
	}

	private void InitWebcamPicker()
	{
		devicePickerControl = new LabeledItemPickerControl<WebCamDevice>(deviceContainer.Q<ItemPicker>(), webCamManager.GetWebCamDevices());
		devicePickerControl.GetLabelTextFunction = (WebCamDevice device) => device.name;
		if (!TryReSelectLastWebcam() && devicePickerControl.Items.Count > 0)
		{
			devicePickerControl.Selection.Value = devicePickerControl.Items[0];
		}
		if (devicePickerControl.Items.Count > 0)
		{
			devicePickerControl.Selection.Subscribe((WebCamDevice device) =>
			{
				settings.WebcamSettings.CurrentDeviceName = device.name;
				WebCamTexture image = webCamManager.StartSelectedWebCam();
				webcamRenderContainer.image = image;
			});
			return;
		}
		Debug.Log("No webcam found");
		devicePickerControl.GetLabelTextFunction = (WebCamDevice nullDevice) => TranslationManager.GetTranslation(R.Messages.options_webcam_noWebcamsAvailable);
		devicePickerControl.Items.Add(default);
		useWebcamContainer.SetEnabled(value: false);
	}

	private void NavigateBack()
	{
		sceneNavigator.LoadScene(EScene.OptionsScene);
	}

	private bool TryReSelectLastWebcam()
	{
		if (settings.WebcamSettings.CurrentDeviceName.IsNullOrEmpty())
		{
			return false;
		}
		WebCamDevice item = devicePickerControl.Items.FirstOrDefault((WebCamDevice device) => device.name == settings.WebcamSettings.CurrentDeviceName);
		devicePickerControl.SelectItem(item);
		return true;
	}
}
