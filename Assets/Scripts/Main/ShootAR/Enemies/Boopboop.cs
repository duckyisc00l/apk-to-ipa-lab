using UnityEngine;

namespace ShootAR.Enemies
{
	// Enemies that hurt the player by touching them.
	public abstract class Boopboop : Enemy
	{
		protected virtual void OnTriggerEnter(Collider other)
		{
			var player = other.GetComponentInParent<Player>();
			if (player != null) Attack(player);
		}

		public virtual void Attack(Player target)
		{
			target.GetDamaged(Damage);
			if (attackSfx != null) AudioSource.PlayClipAtPoint(attackSfx, transform.position);
			Remove();   // used up: no points
		}
	}
}
