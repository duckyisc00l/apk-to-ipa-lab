using UnityEngine;

namespace ShootAR.Enemies
{
	public abstract class Pyoopyoo : Enemy
	{
		[SerializeField]
		protected EnemyBullet bullet;

		[SerializeField]
		protected Transform bulletSpawnPoint;

		protected EnemyBullet lastBullet;

		protected virtual void Shoot()
		{
		}
	}
}
