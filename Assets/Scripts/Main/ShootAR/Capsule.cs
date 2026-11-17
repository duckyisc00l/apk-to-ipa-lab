using ShootAR.Enemies;
using UnityEngine;

namespace ShootAR
{
	// A pickup that circles the player; shoot it to get what's inside.
	public class Capsule : Spawnable
	{
		public enum CapsuleType { Bullet = 0, Health = 1, Armor = 2, PowerUp = 3 }

		private Vector3 rotation;
		private AudioSource pickUpSfx;

		[SerializeField]
		private Player player;

		private bool typeSet;
		private const int AMMO_IN_CAPSULE = 10;

		public CapsuleType Type { get; private set; }

		public static Capsule Create(CapsuleType type, float speed, Player player = null, GameState gameState = null)
		{
			var o = GameObject.CreatePrimitive(PrimitiveType.Capsule);
			o.GetComponent<Collider>().isTrigger = true;
			var c = o.AddComponent<Capsule>();
			c.Type = type; c.typeSet = true; c.Speed = speed; c.player = player; c.gameState = gameState;
			return c;
		}

		protected void Start()
		{
			if (!typeSet) Type = (CapsuleType)Random.Range(0, 4);
			if (player == null) player = FindObjectOfType<Player>();
			FindState();
			pickUpSfx = GetComponent<AudioSource>();
			rotation = new Vector3(Random.Range(-1f, 1f), Random.Range(-1f, 1f), Random.Range(-1f, 1f)).normalized * 90f;
			var mesh = GetComponentInChildren<Renderer>();
			if (mesh != null)  // colour by contents
				mesh.material.color = new[] { Color.yellow, Color.green, Color.cyan, Color.magenta }[(int)Type];
		}

		private void Update()
		{
			transform.Rotate(rotation * Time.deltaTime);
			if (player != null)  // drift around the player
				transform.RotateAround(player.transform.position, Vector3.up, Speed * Time.deltaTime);
		}

		protected void OnDestroy() { }

		public void GivePowerUp()
		{
			if (player == null) player = FindObjectOfType<Player>();
			if (player == null) return;
			switch (Type)
			{
				case CapsuleType.Bullet: player.Ammo += AMMO_IN_CAPSULE; break;
				case CapsuleType.Health: player.Health++; break;
				case CapsuleType.Armor: player.HasArmor = true; break;
				case CapsuleType.PowerUp:  // clears every enemy on screen
					foreach (var e in FindObjectsOfType<Enemy>()) Destroy(e.gameObject);
					break;
			}
			var score = FindObjectOfType<ScoreManager>();
			if (score != null) score.AddScore(50);  // GameManager.CAPSULE_BONUS_POINTS
			if (pickUpSfx != null && pickUpSfx.clip != null) AudioSource.PlayClipAtPoint(pickUpSfx.clip, transform.position);
		}
	}
}
