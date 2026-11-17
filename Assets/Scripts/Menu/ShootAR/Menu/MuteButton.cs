using UnityEngine;
using UnityEngine.UI;

namespace ShootAR.Menu
{
	public class MuteButton : MonoBehaviour
	{
		[SerializeField]
		private Material soundOffIcon;

		[SerializeField]
		private Material soundOnIcon;

		private Image image;

		public void ToggleSound()
		{
			Configuration.SoundMuted = !Configuration.SoundMuted;
			Apply();
		}

		private void Start()
		{
			image = GetComponent<Image>();
			var button = GetComponent<Button>();
			if (button != null) button.onClick.AddListener(ToggleSound);
			Apply();
		}

		private void Apply()
		{
			AudioListener.volume = Configuration.SoundMuted ? 0f : 1f;
			if (image != null) image.material = Configuration.SoundMuted ? soundOffIcon : soundOnIcon;
		}
	}
}
