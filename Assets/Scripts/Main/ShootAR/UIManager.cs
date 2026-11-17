using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

namespace ShootAR
{
	public class UIManager : MonoBehaviour
	{
		[SerializeField] private GameObject uiCanvas;
		[SerializeField] private GameObject pauseCanvas;
		[SerializeField] private Text bulletCount;
		[SerializeField] private Text messageOnScreen;
		[SerializeField] private Text score;
		[SerializeField] private Text roundIndex;
		[SerializeField] private Button pauseToMenuButton;
		[SerializeField] private GameState gameState;
		private AudioSource sfx;
		[SerializeField] private AudioClip pauseSfx;

		public Text BulletCount { get { return bulletCount; } set { bulletCount = value; } }
		public Text MessageOnScreen { get { return messageOnScreen; } set { messageOnScreen = value; } }
		public Text Score { get { return score; } set { score = value; } }
		public Text RoundIndex { get { return roundIndex; } set { roundIndex = value; } }

		public static UIManager Create(GameObject uiCanvas, GameObject pauseCanvas, Text bulletCount, Text messageOnScreen, Text score, Text roundIndex, AudioSource sfx, AudioClip pauseSfx, GameState gameState)
		{
			var u = new GameObject("UIManager").AddComponent<UIManager>();
			u.uiCanvas = uiCanvas; u.pauseCanvas = pauseCanvas; u.bulletCount = bulletCount; u.messageOnScreen = messageOnScreen;
			u.score = score; u.roundIndex = roundIndex; u.sfx = sfx; u.pauseSfx = pauseSfx; u.gameState = gameState;
			return u;
		}

		public void Start()
		{
			if (sfx == null) sfx = GetComponent<AudioSource>();
			if (sfx == null) sfx = gameObject.AddComponent<AudioSource>();
			if (pauseCanvas != null) pauseCanvas.SetActive(false);
			if (messageOnScreen != null) messageOnScreen.text = "";
			if (pauseToMenuButton != null)
				pauseToMenuButton.onClick.AddListener(() => { Time.timeScale = 1f; SceneManager.LoadScene(0); });
		}

		public void TogglePauseMenu()
		{
			bool pause = pauseCanvas != null ? !pauseCanvas.activeSelf : !(gameState != null && gameState.Paused);
			if (pauseCanvas != null) pauseCanvas.SetActive(pause);
			if (uiCanvas != null) uiCanvas.SetActive(!pause);
			Time.timeScale = pause ? 0f : 1f;
			if (pauseSfx != null) sfx.PlayOneShot(pauseSfx);
			if (gameState != null) gameState.Paused = pause;
		}
	}
}
