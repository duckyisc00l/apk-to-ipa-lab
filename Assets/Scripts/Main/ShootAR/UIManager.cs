using UnityEngine;
using UnityEngine.UI;

namespace ShootAR
{
	public class UIManager : MonoBehaviour
	{
		[SerializeField]
		private GameObject uiCanvas;

		[SerializeField]
		private GameObject pauseCanvas;

		[SerializeField]
		private Text bulletCount;

		[SerializeField]
		private Text messageOnScreen;

		[SerializeField]
		private Text score;

		[SerializeField]
		private Text roundIndex;

		[SerializeField]
		private Button pauseToMenuButton;

		[SerializeField]
		private GameState gameState;

		private AudioSource sfx;

		[SerializeField]
		private AudioClip pauseSfx;

		public Text BulletCount
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public Text MessageOnScreen
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public Text Score
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public Text RoundIndex
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public static UIManager Create(GameObject uiCanvas, GameObject pauseCanvas, Text bulletCount, Text messageOnScreen, Text score, Text roundIndex, AudioSource sfx, AudioClip pauseSfx, GameState gameState)
		{
			return null;
		}

		public void Start()
		{
		}

		public void TogglePauseMenu()
		{
		}
	}
}
