using UnityEngine;

namespace ShootAR.Enemies
{
	public abstract class Enemy : Spawnable
	{
		[SerializeField]
		private int pointsValue;

		[SerializeField]
		private int damage;

		[SerializeField]
		protected AudioClip attackSfx;

		[SerializeField]
		protected GameObject explosion;

		protected AudioSource sfx;

		[SerializeField]
		protected static ScoreManager score;

		private bool noDeathSfx;

		public int PointsValue
		{
			get
			{
				return 0;
			}
			protected set
			{
			}
		}

		public int Damage
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public static int ActiveCount { get; protected set; }

		protected void Awake()
		{
		}

		protected virtual void Start()
		{
		}

		protected virtual void OnApplicationQuit()
		{
		}

		protected virtual void OnDestroy()
		{
		}

		public void MoveTo(Vector3 point)
		{
		}

		public void OrbitAround(Orbit orbit)
		{
		}
	}
}
