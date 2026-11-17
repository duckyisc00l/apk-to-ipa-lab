using UnityEngine;

namespace ShootAR.Enemies
{
	// A drone's shot: flies straight; can be shot down for a few points.
	public class EnemyBullet : Boopboop
	{
		protected override void Start()
		{
			base.Start();
			var rb = GetComponent<Rigidbody>();
			var target = Camera.main != null ? Camera.main.transform.position : transform.position + transform.forward;
			transform.LookAt(target);
			if (rb != null) { rb.useGravity = false; rb.velocity = transform.forward * Speed; }
			else MoveTo(target + (target - transform.position));
			Destroy(gameObject, 15f);
		}

		public override void Attack(Player target)
		{
			if (Damage <= 0) Damage = 1;   // its prefab leaves damage at 0
			base.Attack(target);
		}
	}
}
