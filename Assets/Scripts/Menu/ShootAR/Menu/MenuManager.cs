using UnityEngine;

namespace ShootAR.Menu
{
	public class MenuManager : MonoBehaviour
	{
		private AudioSource sfx;

		[SerializeField]
		private GameObject mainMenu;

		[SerializeField]
		private GameObject subMenu;

		[SerializeField]
		private GameObject creditsMenu;

		[SerializeField]
		private GameObject startMenu;

		[SerializeField]
		private GameObject roundMenu;

		[SerializeField]
		private AudioClip select;

		[SerializeField]
		private AudioClip back;

		[SerializeField]
		private MuteButton muteButton;

		private void Awake()
		{
		}

		private void Start()
		{
		}

		public void ToStartMenu()
		{
		}

		public void StartGame()
		{
		}

		public void ToRoundSelect()
		{
		}

		public void ToCredits()
		{
		}

		public void ToMainMenu()
		{
		}

		public void QuitApp()
		{
		}
	}
}
