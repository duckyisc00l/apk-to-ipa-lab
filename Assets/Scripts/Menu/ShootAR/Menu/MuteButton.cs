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
		}

		private void Start()
		{
		}
	}
}
