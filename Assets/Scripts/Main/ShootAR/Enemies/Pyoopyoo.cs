using UnityEngine;

namespace ShootAR.Enemies
{
	// Enemies that shoot.
	public abstract class Pyoopyoo : Enemy
	{
		[SerializeField] protected EnemyBullet bullet;
		[SerializeField] protected Transform bulletSpawnPoint;
		protected EnemyBullet lastBullet;

		protected virtual void Shoot()
		{
			if (bullet == null) return;
			var from = bulletSpawnPoint != null ? bulletSpawnPoint.position : transform.position;
			var target = Camera.main != null ? Camera.main.transform.position : Vector3.zero;
			lastBullet = Instantiate(bullet, from, Quaternion.LookRotation(target - from));
			lastBullet.GameState = gameState;
			if (attackSfx != null) sfx.PlayOneShot(attackSfx);
		}
	}
}
