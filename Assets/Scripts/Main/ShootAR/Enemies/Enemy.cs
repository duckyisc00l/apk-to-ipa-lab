using System.Collections;
using UnityEngine;

namespace ShootAR.Enemies
{
	public abstract class Enemy : Spawnable
	{
		[SerializeField] private int pointsValue;
		[SerializeField] private int damage;
		[SerializeField] protected AudioClip attackSfx;
		[SerializeField] protected GameObject explosion;
		protected AudioSource sfx;
		[SerializeField] protected static ScoreManager score;
		private bool noDeathSfx;
		private Coroutine moving;

		public int PointsValue { get { return pointsValue; } protected set { pointsValue = value; } }
		public int Damage { get { return damage; } set { damage = value; } }
		public static int ActiveCount { get; protected set; }

		// Set while the whole scene is being torn down (leaving the game scene): no points then.
		public static bool ClearingScene;

		protected void Awake()
		{
			sfx = GetComponent<AudioSource>();
			if (sfx == null) sfx = gameObject.AddComponent<AudioSource>();
			if (score == null) score = FindObjectOfType<ScoreManager>();
		}

		protected virtual void Start()
		{
			ActiveCount++;
			FindState();
			var target = Camera.main != null ? Camera.main.transform.position : Vector3.zero;
			transform.LookAt(target);
		}

		protected virtual void OnApplicationQuit() { noDeathSfx = true; }

		// Remove without giving points or an explosion (it hit the player, left the play area, round ended).
		public void Remove()
		{
			noDeathSfx = true;
			Destroy(gameObject);
		}

		protected virtual void OnDestroy()
		{
			ActiveCount--;
			if (noDeathSfx || ClearingScene || !gameObject.scene.isLoaded) return;
			if (score != null) score.AddScore(PointsValue);
			if (explosion != null) Destroy(Instantiate(explosion, transform.position, transform.rotation), 2f);
		}

		public void MoveTo(Vector3 point)
		{
			if (moving != null) StopCoroutine(moving);
			moving = StartCoroutine(Move(point));
		}

		private IEnumerator Move(Vector3 point)
		{
			while ((transform.position - point).sqrMagnitude > 0.01f)
			{
				if (gameState == null || !gameState.Paused)
				{
					transform.position = Vector3.MoveTowards(transform.position, point, Speed * Time.deltaTime);
					transform.LookAt(point);
				}
				yield return null;
			}
		}

		public void OrbitAround(Orbit orbit)
		{
			if (moving != null) StopCoroutine(moving);
			moving = StartCoroutine(Circle(orbit));
		}

		private IEnumerator Circle(Orbit orbit)
		{
			float radius = Mathf.Max(1f, (transform.position - orbit.centerPoint).magnitude);
			while (true)
			{
				if (gameState == null || !gameState.Paused)
				{
					float degrees = Speed / radius * Mathf.Rad2Deg * Time.deltaTime;   // Speed is along the circle
					transform.RotateAround(orbit.centerPoint, orbit.perpendicularAxis, degrees);
					transform.LookAt(orbit.centerPoint);
				}
				yield return null;
			}
		}
	}
}
