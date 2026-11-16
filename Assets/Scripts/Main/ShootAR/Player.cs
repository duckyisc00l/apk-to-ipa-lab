using UnityEngine;
using UnityEngine.UI;

namespace ShootAR
{
	public class Player : MonoBehaviour
	{
		public const sbyte MAXIMUM_HEALTH = 6;

		private const float SHOT_COOLDOWN = 0.5f;

		private const float DAMAGE_COOLDOWN = 1f;

		[SerializeField]
		private GameObject[] healthIndicator;

		[SerializeField]
		private int health;

		[SerializeField]
		private int ammo;

		private float nextFire;

		private float nextDamage;

		[SerializeField]
		private GameState gameState;

		[SerializeField]
		private Bullet bullet;

		private AudioSource audioSource;

		[SerializeField]
		private AudioClip shotSfx;

		[SerializeField]
		private Text bulletCount;

		public int Health
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public int Ammo
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public bool HasArmor { get; set; }

		public bool CanShoot { get; set; }

		private void UpdateHealthUI()
		{
		}

		public static Player Create(int health = 6, Camera camera = null, Bullet bullet = null, int ammo = 0, GameState gameState = null)
		{
			return null;
		}

		public Bullet Shoot()
		{
			return null;
		}

		private void Start()
		{
		}

		public void GetDamaged(int damage)
		{
		}

		private void OnDestroy()
		{
		}
	}
}
