using UnityEngine;

namespace ShootAR
{
	// Round state. Setting GameOver / RoundWon to true fires the event once; Paused fires on every change.
	public class GameState : MonoBehaviour
	{
		public delegate void GameOverHandler();
		public delegate void RoundWonHandler();
		public delegate void PauseHandler();

		private bool gameOver;
		private bool roundWon;
		private bool paused;

		public int Level { get; set; }

		public bool GameOver
		{
			get { return gameOver; }
			set { bool was = gameOver; gameOver = value; if (value && !was && OnGameOver != null) OnGameOver(); }
		}

		public bool RoundWon
		{
			get { return roundWon; }
			set { bool was = roundWon; roundWon = value; if (value && !was && OnRoundWon != null) OnRoundWon(); }
		}

		public bool Paused
		{
			get { return paused; }
			set { if (paused == value) return; paused = value; if (OnPause != null) OnPause(); }
		}

		public event GameOverHandler OnGameOver;
		public event RoundWonHandler OnRoundWon;
		public event PauseHandler OnPause;

		public static GameState Create(int level)
		{
			var s = new GameObject("GameState").AddComponent<GameState>();
			s.Level = level;
			return s;
		}
	}
}
