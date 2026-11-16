using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine.UIElements;

public class SongSelectPlayerEntryControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(Key = "rootVisualElement")]
	private VisualElement visualElement;

	[Inject(UxmlName = "micIcon")]
	private VisualElement micIcon;

	[Inject(UxmlName = "nameLabel")]
	private Label nameLabel;

	private LabeledItemPickerControl<Voice> voiceChooserControl;

	private MicProfile micProfile;

	[Inject(UxmlName = "enabledToggle")]
	public Toggle EnabledToggle { get; private set; }

	public PlayerProfile PlayerProfile { get; private set; }

	public MicProfile MicProfile
	{
		get
		{
			return micProfile;
		}
		set
		{
			micProfile = value;
			if (micProfile == null)
			{
				micIcon.HideByVisibility();
				return;
			}
			micIcon.ShowByVisibility();
			micIcon.style.unityBackgroundImageTintColor = new StyleColor(micProfile.Color);
		}
	}

	public Voice Voice
	{
		get
		{
			if (!voiceChooserControl.ItemPicker.IsVisibleByDisplay())
			{
				return null;
			}
			return voiceChooserControl.Selection.Value;
		}
	}

	public bool IsSelected => EnabledToggle.value;

	public void OnInjectionFinished()
	{
		voiceChooserControl = new LabeledItemPickerControl<Voice>(visualElement.Q<ItemPicker>("voiceChooser"), new List<Voice>());
		voiceChooserControl.GetLabelTextFunction = (Voice voice) => (voice == null) ? "" : voice.Name;
	}

	public void SetSelected(bool newIsSelected)
	{
		EnabledToggle.value = newIsSelected;
	}

	public void Init(PlayerProfile playerProfile)
	{
		PlayerProfile = playerProfile;
		nameLabel.text = playerProfile.Name;
		MicProfile = null;
	}

	public void HideVoiceSelection()
	{
		voiceChooserControl.SelectItem(null);
		voiceChooserControl.ItemPicker.HideByDisplay();
	}

	public void ShowVoiceSelection(SongMeta selectedSong, int selectedVoiceIndex)
	{
		voiceChooserControl.Items = selectedSong.GetVoices().ToList();
		voiceChooserControl.ItemPicker.ShowByDisplay();
		voiceChooserControl.SelectItem(voiceChooserControl.Items[selectedVoiceIndex]);
		voiceChooserControl.GetLabelTextFunction = (Voice voice) => (voice == null) ? "" : selectedSong.VoiceNames[voice.Name];
	}
}
