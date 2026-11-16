using UnityEngine;

namespace ShootAR
{
	public class GameState : MonoBehaviour
	{
		public delegate void GameOverHandler();

		public delegate void RoundWonHandler();

		public delegate void PauseHandler();

		private GameOverHandler OnGameOver__BackingField;

		private RoundWonHandler OnRoundWon__BackingField;

		private PauseHandler OnPause__BackingField;

		private bool gameOver;

		private bool roundWon;

		private bool paused;

		public int Level { get; set; }

		public bool GameOver
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public bool RoundWon
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public bool Paused
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public event GameOverHandler OnGameOver
		{
			add
			{
			}
			remove
			{
			}
		}

		public event RoundWonHandler OnRoundWon
		{
			add
			{
			}
			remove
			{
			}
		}

		public event PauseHandler OnPause
		{
			add
			{
			}
			remove
			{
			}
		}

		public static GameState Create(int level)
		{
			return null;
		}
	}
}
