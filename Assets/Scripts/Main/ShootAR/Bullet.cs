using ShootAR.Enemies;
using UnityEngine;

namespace ShootAR
{
	// The player's shot: flies straight; destroys an enemy or opens a capsule it touches.
	public class Bullet : Spawnable
	{
		public static int Count { get; private set; }
		public static int ActiveCount { get; private set; }

		public static Bullet Create(float speed)
		{
			var o = GameObject.CreatePrimitive(PrimitiveType.Sphere);
			o.transform.localScale = Vector3.one * 0.2f;
			o.GetComponent<Collider>().isTrigger = true;
			var rb = o.AddComponent<Rigidbody>(); rb.useGravity = false;
			var b = o.AddComponent<Bullet>(); b.Speed = speed;
			return b;
		}

		protected void Start()
		{
			Count++; ActiveCount++;
			var rb = GetComponent<Rigidbody>();
			if (rb != null) { rb.useGravity = false; rb.velocity = transform.forward * Speed; }
			Destroy(gameObject, 10f);
		}

		protected void OnTriggerEnter(Collider col)
		{
			var enemy = col.GetComponentInParent<Enemy>();
			if (enemy != null) { Destroy(enemy.gameObject); Destroy(gameObject); return; }
			var capsule = col.GetComponentInParent<Capsule>();
			if (capsule != null) { capsule.GivePowerUp(); Destroy(capsule.gameObject); Destroy(gameObject); }
		}

		protected void OnDestroy() { ActiveCount--; }
	}
}
