using UnityEngine;
using UnityEngine.UI;

namespace ShootAR
{
	// The player is the camera: shots leave from it, enemies attack it.
	public class Player : MonoBehaviour
	{
		public const sbyte MAXIMUM_HEALTH = 6;
		private const float SHOT_COOLDOWN = 0.5f;
		private const float DAMAGE_COOLDOWN = 1f;

		[SerializeField] private GameObject[] healthIndicator;
		[SerializeField] private int health;
		[SerializeField] private int ammo;
		private float nextFire;
		private float nextDamage;
		[SerializeField] private GameState gameState;
		[SerializeField] private Bullet bullet;
		private AudioSource audioSource;
		[SerializeField] private AudioClip shotSfx;
		private Text bulletCount;

		public int Health
		{
			get { return health; }
			set
			{
				health = Mathf.Clamp(value, 0, MAXIMUM_HEALTH);
				UpdateHealthUI();
				if (health == 0 && gameState != null) gameState.GameOver = true;
			}
		}

		public int Ammo
		{
			get { return ammo; }
			set
			{
				ammo = Mathf.Max(0, value);
				if (bulletCount != null) bulletCount.text = ammo.ToString();
			}
		}

		public bool HasArmor { get; set; }
		public bool CanShoot { get; set; } = true;

		private void UpdateHealthUI()
		{
			if (healthIndicator == null) return;
			for (int i = 0; i < healthIndicator.Length; i++)
				if (healthIndicator[i] != null) healthIndicator[i].SetActive(i < health);
		}

		public static Player Create(int health = 6, Camera camera = null, Bullet bullet = null, int ammo = 0, GameState gameState = null)
		{
			var o = camera != null ? camera.gameObject : new GameObject("Player");
			var p = o.AddComponent<Player>();
			p.health = health; p.bullet = bullet; p.ammo = ammo; p.gameState = gameState;
			return p;
		}

		public Bullet Shoot()
		{
			if (!CanShoot || Ammo <= 0 || Time.time < nextFire || bullet == null) return null;
			if (gameState != null && (gameState.Paused || gameState.GameOver)) return null;
			nextFire = Time.time + SHOT_COOLDOWN;
			Ammo--;
			var cam = Camera.main != null ? Camera.main.transform : transform;
			var b = Instantiate(bullet, cam.position + cam.forward * 0.5f, cam.rotation);
			b.GameState = gameState;
			if (audioSource != null && shotSfx != null) audioSource.PlayOneShot(shotSfx);
			return b;
		}

		private void Start()
		{
			audioSource = GetComponent<AudioSource>();
			if (audioSource == null) audioSource = gameObject.AddComponent<AudioSource>();
			var ui = FindObjectOfType<UIManager>();
			if (ui != null) bulletCount = ui.BulletCount;
			if (gameState == null) gameState = FindObjectOfType<GameState>();
			Health = health; Ammo = ammo;
		}

		public void GetDamaged(int damage)
		{
			if (Time.time < nextDamage || damage <= 0) return;
			nextDamage = Time.time + DAMAGE_COOLDOWN;
			if (HasArmor) { HasArmor = false; return; }   // armour takes one hit
			Health -= damage;
			Handheld.Vibrate();
		}

		private void OnDestroy() { }
	}
}
