using UnityEngine;

namespace ShootAR.Enemies
{
	public abstract class Boopboop : Enemy
	{
		protected virtual void OnTriggerEnter(Collider other)
		{
		}

		public virtual void Attack(Player target)
		{
		}
	}
}
