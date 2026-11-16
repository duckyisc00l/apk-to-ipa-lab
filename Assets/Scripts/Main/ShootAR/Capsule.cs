using UnityEngine;

namespace ShootAR
{
	public class Capsule : Spawnable
	{
		public enum CapsuleType
		{
			Bullet = 0,
			Health = 1,
			Armor = 2,
			PowerUp = 3
		}

		private Vector3 rotation;

		private AudioSource pickUpSfx;

		[SerializeField]
		private Player player;

		public CapsuleType Type { get; private set; }

		public static Capsule Create(CapsuleType type, float speed, Player player = null, GameState gameState = null)
		{
			return null;
		}

		protected void Start()
		{
		}

		private void Update()
		{
		}

		protected void OnDestroy()
		{
		}

		public void GivePowerUp()
		{
		}
	}
}
