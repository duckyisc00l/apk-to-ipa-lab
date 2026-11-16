using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class EditPlaylistControl : MonoBehaviour, INeedInjection, ITranslator
{
	[Inject(UxmlName = "editPlaylistButton")]
	private Button editPlaylistButton;

	[Inject(UxmlName = "createPlaylistButton")]
	private Button createPlaylistButton;

	[Inject(UxmlName = "editPlaylistOverlay")]
	private VisualElement editPlaylistOverlay;

	[Inject(UxmlName = "playlistChooserDropdownTitle")]
	private Label playlistChooserDropdownTitle;

	[Inject(UxmlName = "submitEditPlaylistButton")]
	private Button submitEditPlaylistButton;

	[Inject(UxmlName = "deletePlaylistButton")]
	private Button deletePlaylistButton;

	[Inject(UxmlName = "confirmDeletePlaylistButton")]
	private Button confirmDeletePlaylistButton;

	[Inject(UxmlName = "cancelDeletePlaylistButton")]
	private Button cancelDeletePlaylistButton;

	[Inject(UxmlName = "playlistNameTextField")]
	private TextField playlistNameTextField;

	[Inject(UxmlName = "editPlaylistDialogTitle")]
	private Label editPlaylistDialogTitle;

	[Inject]
	private SongSelectSceneControl songSelectSceneControl;

	[Inject]
	private PlaylistManager playlistManager;

	[Inject]
	private UiManager uiManager;

	private UltraStarPlaylist currentPlaylist;

	private string titleText;

	private void Start()
	{
		songSelectSceneControl.PlaylistChooserControl.Selection.Subscribe((UltraStarPlaylist newValue) =>
		{
			currentPlaylist = newValue;
		});
		editPlaylistButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowEditCurrentPlaylistDialog();
		});
		createPlaylistButton.RegisterCallbackButtonTriggered(() =>
		{
			CreateThenEditNewPlaylist();
		});
		submitEditPlaylistButton.RegisterCallbackButtonTriggered(() =>
		{
			SubmitEditPlaylistDialog();
		});
		playlistNameTextField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			OnPlaylistNameTextFieldChanged(evt.newValue);
		});
		deletePlaylistButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowConfirmAndCancelDeleteButtons();
			cancelDeletePlaylistButton.Focus();
		});
		cancelDeletePlaylistButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowDeleteAndSubmitButtons();
			submitEditPlaylistButton.Focus();
		});
		confirmDeletePlaylistButton.RegisterCallbackButtonTriggered(() =>
		{
			string text = playlistManager.TryRemovePlaylist(currentPlaylist);
			if (!text.IsNullOrEmpty())
			{
				Debug.LogError(text);
				UiManager.CreateNotification(text, "error");
			}
			HideEditPlaylistDialog();
		});
	}

	private void CreateThenEditNewPlaylist()
	{
		UltraStarPlaylist value = playlistManager.CreateNewPlaylist("New Playlist");
		songSelectSceneControl.PlaylistChooserControl.Selection.Value = value;
		ShowEditCurrentPlaylistDialog();
	}

	private void OnPlaylistNameTextFieldChanged(string newPlaylistName)
	{
		switch (playlistManager.GetPlaylistNameIssue(currentPlaylist, newPlaylistName))
		{
		case EPlaylistNameIssue.Invalid:
			editPlaylistDialogTitle.text = "Invalid playlist name";
			submitEditPlaylistButton.text = TranslationManager.GetTranslation(R.Messages.cancel);
			break;
		case EPlaylistNameIssue.Duplicate:
			editPlaylistDialogTitle.text = "Duplicate playlist name";
			submitEditPlaylistButton.text = TranslationManager.GetTranslation(R.Messages.cancel);
			break;
		default:
			editPlaylistDialogTitle.text = titleText;
			submitEditPlaylistButton.text = TranslationManager.GetTranslation(R.Messages.continue_);
			break;
		}
	}

	public void HideEditPlaylistDialog()
	{
		editPlaylistOverlay.HideByDisplay();
	}

	public void ShowEditCurrentPlaylistDialog()
	{
		if (currentPlaylist != null && !(currentPlaylist is UltraStarAllSongsPlaylist) && !playlistManager.IsFavoritesPlaylist(currentPlaylist))
		{
			titleText = "Edit Playlist";
			editPlaylistDialogTitle.text = titleText;
			playlistNameTextField.value = currentPlaylist.Name;
			songSelectSceneControl.HideMenuOverlay();
			editPlaylistOverlay.ShowByDisplay();
			ShowDeleteAndSubmitButtons();
		}
	}

	private void ShowDeleteAndSubmitButtons()
	{
		deletePlaylistButton.ShowByDisplay();
		submitEditPlaylistButton.ShowByDisplay();
		confirmDeletePlaylistButton.HideByDisplay();
		cancelDeletePlaylistButton.HideByDisplay();
		submitEditPlaylistButton.Focus();
	}

	private void ShowConfirmAndCancelDeleteButtons()
	{
		deletePlaylistButton.HideByDisplay();
		submitEditPlaylistButton.HideByDisplay();
		confirmDeletePlaylistButton.ShowByDisplay();
		cancelDeletePlaylistButton.ShowByDisplay();
		cancelDeletePlaylistButton.Focus();
	}

	private void SubmitEditPlaylistDialog()
	{
		string value = playlistNameTextField.value;
		if (playlistManager.GetPlaylistNameIssue(currentPlaylist, value) != EPlaylistNameIssue.None)
		{
			HideEditPlaylistDialog();
			return;
		}
		if (!playlistManager.TrySetPlaylistName(currentPlaylist, value, out var errorMessage))
		{
			Debug.LogError(errorMessage);
			UiManager.CreateNotification(errorMessage, "error");
		}
		editPlaylistOverlay.HideByDisplay();
	}

	public void UpdateTranslation()
	{
		playlistChooserDropdownTitle.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_playlistDropdownTitle);
		editPlaylistButton.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_editPlaylistButton);
		createPlaylistButton.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_createPlaylistButton);
	}
}
