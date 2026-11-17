using UnityEngine;

namespace ShootAR
{
	public abstract class Spawnable : MonoBehaviour
	{
		public const int GLOBAL_SPAWN_LIMIT = 50;

		[SerializeField]
		private float speed;

		protected GameState gameState;

		public float Speed
		{
			get { return speed; }
			protected set { speed = value; }
		}

		public GameState GameState
		{
			set { gameState = value; }
		}

		// Spawnables created in the scene without a spawner still find the round state.
		protected GameState FindState()
		{
			if (gameState == null) gameState = FindObjectOfType<GameState>();
			return gameState;
		}
	}
}
