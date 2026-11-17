using UnityEngine;
using UnityEngine.SceneManagement;

namespace ShootAR.Menu
{
	public class MenuManager : MonoBehaviour
	{
		private AudioSource sfx;

		[SerializeField] private GameObject mainMenu;
		[SerializeField] private GameObject subMenu;
		[SerializeField] private GameObject creditsMenu;
		[SerializeField] private GameObject startMenu;
		[SerializeField] private GameObject roundMenu;
		[SerializeField] private AudioClip select;
		[SerializeField] private AudioClip back;
		[SerializeField] private MuteButton muteButton;

		private void Awake()
		{
			sfx = GetComponent<AudioSource>();
			if (sfx == null) sfx = gameObject.AddComponent<AudioSource>();
		}

		private void Start()
		{
			Time.timeScale = 1f;
			AudioListener.volume = Configuration.SoundMuted ? 0f : 1f;
			ToMainMenu();
		}

		private void Show(GameObject panel, AudioClip clip)
		{
			foreach (var p in new[] { mainMenu, subMenu, creditsMenu, startMenu, roundMenu })
				if (p != null) p.SetActive(p == panel);
			if (clip != null) sfx.PlayOneShot(clip);
		}

		public void ToStartMenu() { Show(startMenu, select); }

		public void StartGame()
		{
			var rounds = roundMenu != null ? roundMenu.GetComponentInChildren<RoundSelectMenu>(true) : null;
			Configuration.StartingLevel = rounds != null && rounds.RoundToPlay > 0 ? rounds.RoundToPlay : 1;
			if (select != null) sfx.PlayOneShot(select);
			SceneManager.LoadScene(1);
		}

		public void ToRoundSelect() { Show(roundMenu, select); }
		public void ToCredits() { Show(creditsMenu, select); }

		public void ToMainMenu()
		{
			Show(mainMenu, null);
			if (subMenu != null) subMenu.SetActive(true);   // the buttons under the title
		}

		public void QuitApp() { Application.Quit(); }   // iOS ignores this; kept for 1:1
	}
}
