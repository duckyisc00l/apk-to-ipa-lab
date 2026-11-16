using UniInject;
using UnityEngine.UIElements;

public class NewSongDialogControl : AbstractDialogControl, IInjectionFinishedListener
{
	[Inject(UxmlName = "artistTextField")]
	private TextField artistTextField;

	[Inject(UxmlName = "titleTextField")]
	private TextField titleTextField;

	[Inject(UxmlName = "createCoverToggle")]
	private Toggle createCoverToggle;

	[Inject(UxmlName = "createBackgroundToggle")]
	private Toggle createBackgroundToggle;

	[Inject(UxmlName = "createVideoToggle")]
	private Toggle createVideoToggle;

	[Inject(UxmlName = "okButton")]
	private Button okButton;

	[Inject(UxmlName = "cancelButton")]
	private Button cancelButton;

	[Inject]
	private CreateSongFromTemplateControl createSongFromTemplateControl;

	[Inject]
	private UiManager uiManager;

	public void OnInjectionFinished()
	{
		cancelButton.RegisterCallbackButtonTriggered(() =>
		{
			CloseDialog();
		});
		okButton.RegisterCallbackButtonTriggered(() =>
		{
			TryCreateNewSong();
		});
		artistTextField.value = "";
		titleTextField.value = "";
		createCoverToggle.value = true;
		createBackgroundToggle.value = true;
		createVideoToggle.value = false;
		UpdateOkButtonEnabled();
		artistTextField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			UpdateOkButtonEnabled();
		});
		titleTextField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			UpdateOkButtonEnabled();
		});
		cancelButton.Focus();
	}

	private void UpdateOkButtonEnabled()
	{
		okButton.SetEnabled(IsInputValid());
	}

	private void TryCreateNewSong()
	{
		if (!IsInputValid())
		{
			UiManager.CreateNotification("Please specify the artist and title");
			return;
		}
		createSongFromTemplateControl.CreateNewSongFromTemplateAndContinueToSongEditor(artistTextField.value, titleTextField.value, createCoverToggle.value, createBackgroundToggle.value, createVideoToggle.value);
		CloseDialog();
	}

	private bool IsInputValid()
	{
		if (!artistTextField.value.IsNullOrEmpty())
		{
			return !titleTextField.value.IsNullOrEmpty();
		}
		return false;
	}
}
