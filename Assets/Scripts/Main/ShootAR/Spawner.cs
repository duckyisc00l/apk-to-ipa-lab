using System.Collections;
using UnityEngine;

namespace ShootAR
{
	// Brings in one kind of thing (an enemy type or capsules) through a portal, at a random spot
	// between min and max distance from the player, every SpawnRate seconds until SpawnLimit is reached.
	public class Spawner : MonoBehaviour
	{
		[SerializeField] private Spawnable objectToSpawn;
		[SerializeField] private float maxDistanceToSpawn;
		[SerializeField] private float minDistanceToSpawn;
		[SerializeField] private GameState gameState;
		[SerializeField] private AudioClip spawnSfx;
		[SerializeField] private GameObject portal;
		private AudioSource sfx;
		private Coroutine running;

		public Spawnable ObjectToSpawn { get { return objectToSpawn; } private set { objectToSpawn = value; } }
		public float SpawnRate { get; set; } = 3f;
		public float InitialDelay { get; private set; } = 2f;
		public float MaxDistanceToSpawn { get { return maxDistanceToSpawn; } private set { maxDistanceToSpawn = value; } }
		public float MinDistanceToSpawn { get { return minDistanceToSpawn; } private set { minDistanceToSpawn = value; } }
		public int SpawnLimit { get; private set; }
		public int SpawnCount { get; private set; }
		public bool IsSpawning { get; private set; }

		private void Awake()
		{
			sfx = GetComponent<AudioSource>();
			if (sfx == null) sfx = gameObject.AddComponent<AudioSource>();
			if (gameState == null) gameState = FindObjectOfType<GameState>();
		}

		public static Spawner Create(Spawnable objectToSpawn, int spawnLimit, float initialDelay, float spawnRate, float maxDistanceToSpawn, float minDistanceToSpawn, GameState gameState = null)
		{
			var s = new GameObject("Spawner").AddComponent<Spawner>();
			s.objectToSpawn = objectToSpawn; s.SpawnLimit = spawnLimit; s.InitialDelay = initialDelay; s.SpawnRate = spawnRate;
			s.maxDistanceToSpawn = maxDistanceToSpawn; s.minDistanceToSpawn = minDistanceToSpawn; s.gameState = gameState;
			return s;
		}

		private void Start() { }
		private void OnEnable() { }
		private void OnDisable() { StopSpawning(); }
		private void OnDestroy() { StopSpawning(); }

		public IEnumerator Spawn()
		{
			IsSpawning = true;
			yield return new WaitForSeconds(InitialDelay);
			while (SpawnCount < SpawnLimit && (gameState == null || !gameState.GameOver))
			{
				if (gameState != null && gameState.Paused) { yield return null; continue; }
				var center = Camera.main != null ? Camera.main.transform.position : Vector3.zero;
				var dir = Random.onUnitSphere; dir.y = Mathf.Abs(dir.y) * 0.5f;   // around and a bit above the player
				var pos = center + dir.normalized * Random.Range(MinDistanceToSpawn, MaxDistanceToSpawn);
				var rot = Quaternion.LookRotation(center - pos);
				if (portal != null) Destroy(Instantiate(portal, pos, rot), 1.5f);
				if (spawnSfx != null) sfx.PlayOneShot(spawnSfx);
				var o = Instantiate(ObjectToSpawn, pos, rot);
				o.GameState = gameState;
				SpawnCount++;
				yield return new WaitForSeconds(SpawnRate);
			}
			IsSpawning = false;
			running = null;
		}

		public void StartSpawning() { StartSpawning(SpawnLimit, SpawnRate, InitialDelay); }
		public void StartSpawning(int limit) { StartSpawning(limit, SpawnRate, InitialDelay); }
		public void StartSpawning(int limit, float rate) { StartSpawning(limit, rate, InitialDelay); }

		public void StartSpawning(int limit, float rate, float delay)
		{
			StopSpawning();
			SpawnLimit = Mathf.Min(limit, Spawnable.GLOBAL_SPAWN_LIMIT);
			SpawnRate = rate; InitialDelay = delay; SpawnCount = 0;
			running = StartCoroutine(Spawn());
		}

		public void StopSpawning()
		{
			if (running != null) StopCoroutine(running);
			running = null;
			IsSpawning = false;
		}
	}
}
