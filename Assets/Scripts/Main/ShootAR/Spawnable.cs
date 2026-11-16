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
			get
			{
				return 0f;
			}
			protected set
			{
			}
		}

		public GameState GameState
		{
			set
			{
			}
		}
	}
}
