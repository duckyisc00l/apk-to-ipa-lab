using UnityEngine;

namespace ShootAR
{
	public class Bullet : Spawnable
	{
		public static int Count { get; private set; }

		public static int ActiveCount { get; private set; }

		public static Bullet Create(float speed)
		{
			return null;
		}

		protected void Start()
		{
		}

		protected void OnTriggerEnter(Collider col)
		{
		}

		protected void OnDestroy()
		{
		}
	}
}
