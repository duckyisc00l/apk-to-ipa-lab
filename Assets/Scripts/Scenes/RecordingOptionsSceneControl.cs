using System;
using System.Collections.Generic;
using System.Linq;
using PrimeInputActions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class RecordingOptionsSceneControl : MonoBehaviour, INeedInjection, ITranslator, IBinder
{
	private static readonly List<int> amplificationItems = new List<int> { 0, 3, 6, 9, 12, 15, 18 };

	private static readonly List<int> noiseSuppressionItems = new List<int> { 0, 5, 10, 15, 20, 25, 30 };

	[Inject(SearchMethod = SearchMethods.FindObjectOfType)]
	private RecordingOptionsMicVisualizer micVisualizer;

	[Inject(SearchMethod = SearchMethods.FindObjectOfType)]
	private CalibrateMicDelayControl calibrateMicDelayControl;

	[Inject(SearchMethod = SearchMethods.FindObjectOfType)]
	private MicPitchTracker micPitchTracker;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private Settings settings;

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private TranslationManager translationManager;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private Injector injector;

	[Inject(UxmlName = "sceneTitle")]
	private Label sceneTitle;

	[Inject(UxmlName = "backButton")]
	private Button backButton;

	[Inject(UxmlName = "deviceContainer")]
	private VisualElement deviceContainer;

	[Inject(UxmlName = "amplificationContainer")]
	private VisualElement amplificationContainer;

	[Inject(UxmlName = "noiseSuppressionContainer")]
	private VisualElement noiseSuppressionContainer;

	[Inject(UxmlName = "delayContainer")]
	private VisualElement delayContainer;

	[Inject(UxmlName = "colorContainer")]
	private VisualElement colorContainer;

	[Inject(UxmlName = "enabledToggle")]
	private Toggle enabledToggle;

	[Inject(UxmlName = "enabledLabel")]
	private Label enabledLabel;

	[Inject(UxmlName = "notConnectedContainer")]
	private VisualElement notConnectedContainer;

	[Inject(UxmlName = "notConnectedLabel")]
	private Label notConnectedLabel;

	[Inject(UxmlName = "sampleRateContainer")]
	private VisualElement sampleRateContainer;

	[Inject(UxmlName = "deleteButton")]
	private Button deleteButton;

	[Inject(UxmlName = "audioWaveForm")]
	private VisualElement audioWaveForm;

	[Inject(UxmlName = "noteLabel")]
	private Label noteLabel;

	[Inject(UxmlName = "calibrateDelayButton")]
	private Button calibrateDelayButton;

	[Inject(UxmlName = "helpButton")]
	private Button helpButton;

	private SampleRatePickerControl sampleRatePickerControl;

	private LabeledItemPickerControl<MicProfile> devicePickerControl;

	private LabeledItemPickerControl<int> amplificationPickerControl;

	private LabeledItemPickerControl<int> noiseSuppressionPickerControl;

	private NumberPickerControl delayPickerControl;

	private ColorPickerControl colorPickerControl;

	private MessageDialogControl helpDialogControl;

	private IDisposable connectedClientReceivedMessageStreamDisposable;

	private readonly Subject<BeatPitchEvent> connectedClientBeatPitchEventStream = new Subject<BeatPitchEvent>();

	private MicProfile SelectedMicProfile => devicePickerControl.SelectedItem;

	public IObservable<BeatPitchEvent> ConnectedClientBeatPitchEventStream => connectedClientBeatPitchEventStream;

	private void Start()
	{
		devicePickerControl = new LabeledItemPickerControl<MicProfile>(deviceContainer.Q<ItemPicker>(), CreateMicProfiles());
		devicePickerControl.GetLabelTextFunction = (MicProfile item) => (item == null) ? "" : item.Name;
		if (!TryReSelectLastMicProfile())
		{
			devicePickerControl.Selection.Value = devicePickerControl.Items[0];
		}
		devicePickerControl.Selection.Subscribe((MicProfile micProfile) =>
		{
			settings.LastMicProfileNameInRecordingOptionsScene = micProfile?.Name;
		});
		amplificationPickerControl = new LabeledItemPickerControl<int>(amplificationContainer.Q<ItemPicker>(), amplificationItems);
		amplificationPickerControl.GetLabelTextFunction = (int item) => item + " %";
		noiseSuppressionPickerControl = new LabeledItemPickerControl<int>(noiseSuppressionContainer.Q<ItemPicker>(), noiseSuppressionItems);
		noiseSuppressionPickerControl.GetLabelTextFunction = (int item) => item + " %";
		delayPickerControl = new NumberPickerControl(delayContainer.Q<ItemPicker>());
		delayPickerControl.GetLabelTextFunction = (double item) => item + " ms";
		colorPickerControl = new ColorPickerControl(colorContainer.Q<ItemPicker>(), GetColorItems());
		sampleRatePickerControl = new SampleRatePickerControl(sampleRateContainer.Q<ItemPicker>());
		sampleRatePickerControl.GetLabelTextFunction = (int _) => GetSampleRateLabel();
		enabledToggle.RegisterValueChangedCallback((ChangeEvent<bool> evt) =>
		{
			SetSelectedRecordingDeviceEnabled(evt.newValue);
		});
		deleteButton.RegisterCallbackButtonTriggered(() =>
		{
			DeleteSelectedRecordingDevice();
		});
		helpButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowHelp();
		});
		devicePickerControl.Selection.Subscribe((MicProfile newValue) =>
		{
			OnRecordingDeviceSelected(newValue);
		});
		amplificationPickerControl.Selection.Subscribe((int newValue) =>
		{
			SelectedMicProfile.Amplification = newValue;
			SendSelectedMicProfileToConnectedClient();
		});
		noiseSuppressionPickerControl.Selection.Subscribe((int newValue) =>
		{
			SelectedMicProfile.NoiseSuppression = newValue;
			SendSelectedMicProfileToConnectedClient();
		});
		delayPickerControl.Selection.Subscribe((double newValue) =>
		{
			SelectedMicProfile.DelayInMillis = (int)newValue;
			SendSelectedMicProfileToConnectedClient();
		});
		colorPickerControl.Selection.Subscribe((Color32 newValue) =>
		{
			SelectedMicProfile.Color = newValue;
			SendSelectedMicProfileToConnectedClient();
		});
		sampleRatePickerControl.Selection.Subscribe((int newValue) =>
		{
			SelectedMicProfile.SampleRate = newValue;
			SendSelectedMicProfileToConnectedClient();
		});
		micPitchTracker.MicSampleRecorder.FinalSampleRate.Subscribe((int _) =>
		{
			UpdateSampleRateLabel();
		}).AddTo(base.gameObject);
		micPitchTracker.MicSampleRecorder.IsRecording.Subscribe((bool _) =>
		{
			UpdateSampleRateLabel();
		}).AddTo(base.gameObject);
		serverSideConnectRequestManager.ClientConnectedEventStream.Where((ClientConnectionEvent clientConnectedEvent) => devicePickerControl.SelectedItem?.ConnectedClientId == clientConnectedEvent.ConnectedClientHandler.ClientId).Subscribe((ClientConnectionEvent newValue) =>
		{
			OnRecordingDeviceSelected(devicePickerControl.SelectedItem);
		}).AddTo(base.gameObject);
		serverSideConnectRequestManager.ClientConnectedEventStream.Subscribe(UpdateMicProfileNames).AddTo(base.gameObject);
		backButton.RegisterCallbackButtonTriggered(() =>
		{
			sceneNavigator.LoadScene(EScene.OptionsScene);
		});
		backButton.Focus();
		InputManager.GetInputAction(R.InputActions.usplay_back).PerformedAsObservable(5).Subscribe((InputAction.CallbackContext _) =>
		{
			OnBack();
		});
		calibrateDelayButton.RegisterCallbackButtonTriggered(() =>
		{
			calibrateMicDelayControl.StartCalibration();
		});
		calibrateMicDelayControl.CalibrationResultEventStream.Subscribe((CalibrateMicDelayControl.CalibrationResult calibrationResult) =>
		{
			if (calibrationResult.IsSuccess)
			{
				double item = (double)(int)((double)calibrationResult.DelaysInMilliseconds[calibrationResult.DelaysInMilliseconds.Count / 2] / delayPickerControl.StepValue) * delayPickerControl.StepValue;
				delayPickerControl.SelectItem(item);
			}
			else
			{
				UiManager.CreateNotification(TranslationManager.GetTranslation(R.Messages.options_delay_calibrate_timeout), "error");
			}
		});
	}

	private void OnBack()
	{
		if (helpDialogControl != null)
		{
			CloseHelp();
		}
		else
		{
			sceneNavigator.LoadScene(EScene.OptionsScene);
		}
	}

	private void Update()
	{
		GetConnectedClientHandler()?.ReadMessagesFromClient();
	}

	private void UpdateSampleRateLabel()
	{
		sampleRatePickerControl.UpdateLabelText();
	}

	private string GetSampleRateLabel()
	{
		int selectedItem = sampleRatePickerControl.SelectedItem;
		if (selectedItem <= 0)
		{
			string text = (SelectedMicProfile.IsInputFromConnectedClient ? "" : $"\n({micPitchTracker.MicSampleRecorder.FinalSampleRate.Value} Hz)");
			return TranslationManager.GetTranslation(R.Messages.options_sampleRate_auto) + text;
		}
		return $"{selectedItem} Hz";
	}

	private bool TryReSelectLastMicProfile()
	{
		if (settings.LastMicProfileNameInRecordingOptionsScene.IsNullOrEmpty())
		{
			return false;
		}
		MicProfile micProfile = devicePickerControl.Items.FirstOrDefault((MicProfile micProfile2) => micProfile2.Name == settings.LastMicProfileNameInRecordingOptionsScene);
		if (micProfile == null)
		{
			return false;
		}
		devicePickerControl.SelectItem(micProfile);
		return true;
	}

	private void SetSelectedRecordingDeviceEnabled(bool isEnabled)
	{
		if (SelectedMicProfile != null)
		{
			SelectedMicProfile.IsEnabled = isEnabled;
			if (isEnabled)
			{
				settings.MicProfiles.AddIfNotContains(SelectedMicProfile);
			}
		}
	}

	private IConnectedClientHandler GetConnectedClientHandler()
	{
		if (SelectedMicProfile == null || SelectedMicProfile.ConnectedClientId.IsNullOrEmpty() || !serverSideConnectRequestManager.TryGetConnectedClientHandler(SelectedMicProfile.ConnectedClientId, out var connectedClientHandler))
		{
			return null;
		}
		return connectedClientHandler;
	}

	private void SendSelectedMicProfileToConnectedClient()
	{
		GetConnectedClientHandler()?.SendMessageToClient(new MicProfileMessageDto(SelectedMicProfile));
	}

	private void OnRecordingDeviceSelected(MicProfile micProfile)
	{
		if (micProfile != null)
		{
			amplificationPickerControl.TrySelectItem(micProfile.Amplification);
			noiseSuppressionPickerControl.TrySelectItem(micProfile.NoiseSuppression);
			delayPickerControl.SelectItem(micProfile.DelayInMillis);
			colorPickerControl.TrySelectItem(micProfile.Color);
			sampleRatePickerControl.TrySelectItem(micProfile.SampleRate);
			enabledToggle.value = micProfile.IsEnabled;
			if (micProfile.IsConnected(serverSideConnectRequestManager))
			{
				notConnectedContainer.style.display = new StyleEnum<DisplayStyle>(DisplayStyle.None);
				deleteButton.style.display = new StyleEnum<DisplayStyle>(DisplayStyle.None);
			}
			else
			{
				notConnectedContainer.style.display = new StyleEnum<DisplayStyle>(DisplayStyle.Flex);
				deleteButton.style.display = new StyleEnum<DisplayStyle>(DisplayStyle.Flex);
			}
			micVisualizer.SetMicProfile(micProfile);
			calibrateMicDelayControl.MicProfile = micProfile;
			noteLabel.text = TranslationManager.GetTranslation(R.Messages.options_note, "value", "?");
			UpdateSampleRateLabel();
			InitPitchDetectionFromConnectionClient();
		}
	}

	private void DeleteSelectedRecordingDevice()
	{
		if (SelectedMicProfile != null && !SelectedMicProfile.IsConnected(serverSideConnectRequestManager))
		{
			settings.MicProfiles.Remove(SelectedMicProfile);
			devicePickerControl.Items = CreateMicProfiles();
			if (devicePickerControl.Items.Count > 0)
			{
				devicePickerControl.Selection.Value = devicePickerControl.Items[0];
			}
		}
	}

	public void UpdateTranslation()
	{
		backButton.text = TranslationManager.GetTranslation(R.Messages.back);
		deleteButton.text = TranslationManager.GetTranslation(R.Messages.delete);
		sceneTitle.text = TranslationManager.GetTranslation(R.Messages.options_recording_title);
		enabledLabel.text = TranslationManager.GetTranslation(R.Messages.options_useForSinging);
		colorContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_color);
		delayContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_delay);
		amplificationContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_amplification);
		noiseSuppressionContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_noiseSuppression);
		sampleRateContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.options_sampleRate);
		noteLabel.text = TranslationManager.GetTranslation(R.Messages.options_note, "value", "?");
		calibrateDelayButton.text = TranslationManager.GetTranslation(R.Messages.options_delay_calibrate);
		notConnectedLabel.text = TranslationManager.GetTranslation(R.Messages.options_deviceNotConnected);
	}

	private List<MicProfile> CreateMicProfiles()
	{
		List<string> list = Microphone.devices.ToList();
		List<MicProfile> list2 = new List<MicProfile>(settings.MicProfiles);
		List<IConnectedClientHandler> allConnectedClientHandlers = serverSideConnectRequestManager.GetAllConnectedClientHandlers();
		foreach (string connectedMicName in list)
		{
			if (!list2.AnyMatch((MicProfile it) => it.Name == connectedMicName && !it.IsInputFromConnectedClient))
			{
				MicProfile item = new MicProfile(connectedMicName);
				list2.Add(item);
			}
		}
		foreach (IConnectedClientHandler connectedClientHandler in allConnectedClientHandlers)
		{
			if (!list2.AnyMatch((MicProfile it) => it.ConnectedClientId == connectedClientHandler.ClientId && it.IsInputFromConnectedClient))
			{
				MicProfile item2 = new MicProfile(connectedClientHandler.ClientName, connectedClientHandler.ClientId);
				list2.Add(item2);
			}
		}
		list2.Sort(MicProfile.compareByName);
		return list2;
	}

	public void UpdateMicProfileNames(ClientConnectionEvent clientConnectionEvent)
	{
		if (clientConnectionEvent.IsConnected)
		{
			devicePickerControl.Items.ForEach((MicProfile micProfile) =>
			{
				UpdateMicProfileName(clientConnectionEvent, micProfile);
			});
		}
		devicePickerControl.UpdateLabelText();
	}

	private void UpdateMicProfileName(ClientConnectionEvent clientConnectionEvent, MicProfile micProfile)
	{
		if (micProfile.IsInputFromConnectedClient && micProfile.ConnectedClientId == clientConnectionEvent.ConnectedClientHandler.ClientId)
		{
			micProfile.Name = clientConnectionEvent.ConnectedClientHandler.ClientName;
			if (devicePickerControl.SelectedItem == micProfile)
			{
				devicePickerControl.UpdateLabelText();
			}
		}
	}

	private void ShowHelp()
	{
		if (helpDialogControl == null)
		{
			Dictionary<string, string> titleToContentMap = new Dictionary<string, string>
			{
				{
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_micDelay_title),
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_micDelay)
				},
				{
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_micDelayCalibration_title),
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_micDelayCalibration)
				},
				{
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_amplification_title),
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_amplification)
				},
				{
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_noiseSuppression_title),
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_noiseSuppression)
				},
				{
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_sampleRate_title),
					TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_sampleRate)
				}
			};
			helpDialogControl = uiManager.CreateHelpDialogControl(TranslationManager.GetTranslation(R.Messages.options_recording_helpDialog_title), titleToContentMap, CloseHelp);
			helpDialogControl.AddButton(TranslationManager.GetTranslation(R.Messages.viewMore), () =>
			{
				Application.OpenURL(TranslationManager.GetTranslation(R.Messages.uri_howToConfigureMicsAndSpeaker));
			});
		}
	}

	private void CloseHelp()
	{
		if (helpDialogControl != null)
		{
			helpDialogControl.CloseDialog();
			helpDialogControl = null;
			helpButton.Focus();
		}
	}

	private List<Color32> GetColorItems()
	{
		return new List<Color32>
		{
			Colors.CreateColor("#0AFF99"),
			Colors.CreateColor("#FFD300"),
			Colors.CreateColor("#FF8700"),
			Colors.CreateColor("#FF0000"),
			Colors.CreateColor("#FDFCDC"),
			Colors.CreateColor("#B392AC"),
			Colors.CreateColor("#BE0AFF"),
			Colors.CreateColor("#580AFF"),
			Colors.CreateColor("#147DF5"),
			Colors.CreateColor("#0AEFFF")
		};
	}

	private void InitPitchDetectionFromConnectionClient()
	{
		if (connectedClientReceivedMessageStreamDisposable != null)
		{
			connectedClientReceivedMessageStreamDisposable.Dispose();
			connectedClientReceivedMessageStreamDisposable = null;
		}
		if (SelectedMicProfile == null || !SelectedMicProfile.IsInputFromConnectedClient || !serverSideConnectRequestManager.TryGetConnectedClientHandler(SelectedMicProfile.ConnectedClientId, out var connectedClientHandler))
		{
			return;
		}
		connectedClientReceivedMessageStreamDisposable = connectedClientHandler.ReceivedMessageStream.ObserveOnMainThread().Subscribe((JsonSerializable dto) =>
		{
			if (dto is BeatPitchEventDto beatPitchEventDto)
			{
				connectedClientBeatPitchEventStream.OnNext(new BeatPitchEvent(beatPitchEventDto.MidiNote, beatPitchEventDto.Beat));
			}
		}).AddTo(base.gameObject);
	}

	public List<UniInject.IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindExistingInstance(this);
		bindingBuilder.BindExistingInstance(base.gameObject);
		bindingBuilder.BindExistingInstance(micVisualizer);
		bindingBuilder.BindExistingInstance(calibrateMicDelayControl);
		return bindingBuilder.GetBindings();
	}
}
