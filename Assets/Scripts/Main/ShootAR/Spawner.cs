using System.Collections;
using System.Diagnostics;
using UnityEngine;

namespace ShootAR
{
	public class Spawner : MonoBehaviour
	{
		[SerializeField]
		private Spawnable objectToSpawn;

		[SerializeField]
		private float maxDistanceToSpawn;

		[SerializeField]
		private float minDistanceToSpawn;

		[SerializeField]
		private GameState gameState;

		[SerializeField]
		private AudioClip spawnSfx;

		[SerializeField]
		private GameObject portal;

		private AudioSource sfx;

		public Spawnable ObjectToSpawn
		{
			get
			{
				return null;
			}
			private set
			{
			}
		}

		public float SpawnRate { get; set; }

		public float InitialDelay { get; private set; }

		public float MaxDistanceToSpawn
		{
			get
			{
				return 0f;
			}
			private set
			{
			}
		}

		public float MinDistanceToSpawn
		{
			get
			{
				return 0f;
			}
			private set
			{
			}
		}

		public int SpawnLimit { get; private set; }

		public int SpawnCount { get; private set; }

		public bool IsSpawning { get; private set; }

		private void Awake()
		{
		}

		public static Spawner Create(Spawnable objectToSpawn, int spawnLimit, float initialDelay, float spawnRate, float maxDistanceToSpawn, float minDistanceToSpawn, GameState gameState = null)
		{
			return null;
		}

		private void Start()
		{
		}

		private void OnEnable()
		{
		}

		private void OnDisable()
		{
		}

		private void OnDestroy()
		{
		}

		[DebuggerHidden]
		public IEnumerator Spawn()
		{
			return null;
		}

		public void StartSpawning()
		{
		}

		public void StartSpawning(int limit)
		{
		}

		public void StartSpawning(int limit, float rate)
		{
		}

		public void StartSpawning(int limit, float rate, float delay)
		{
		}

		public void StopSpawning()
		{
		}
	}
}
