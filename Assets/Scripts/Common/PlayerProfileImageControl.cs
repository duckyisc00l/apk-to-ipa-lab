using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class PlayerProfileImageControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(Optional = true)]
	private MicProfile micProfile;

	[Inject(Optional = true)]
	private PlayerProfile playerProfile;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private Settings settings;

	[Inject(Key = "rootVisualElement")]
	private VisualElement image;

	public void OnInjectionFinished()
	{
		if (playerProfile == null)
		{
			return;
		}
		if (playerProfile.ImagePath == "WEBCAM")
		{
			string absoluteWebCamImagePath = PlayerProfileUtils.GetAbsoluteWebCamImagePath(settings.PlayerProfiles.IndexOf(playerProfile));
			uiManager.LoadPlayerProfileImage(absoluteWebCamImagePath, (Sprite loadedSprite) =>
			{
				image.style.backgroundImage = new StyleBackground(loadedSprite);
			});
			return;
		}
		uiManager.LoadPlayerProfileImage(playerProfile.ImagePath, (Sprite loadedSprite) =>
		{
			image.style.backgroundImage = new StyleBackground(loadedSprite);
			if (micProfile != null)
			{
				image.style.unityBackgroundImageTintColor = new StyleColor(micProfile.Color);
			}
		});
	}
}
