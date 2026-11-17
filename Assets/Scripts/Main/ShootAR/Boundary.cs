using UnityEngine;

namespace ShootAR
{
	// A big trigger around the player: anything that flies out of it (missed shots, stray enemy shots) is removed.
	public class Boundary : MonoBehaviour
	{
		private void OnTriggerExit(Collider other)
		{
			var enemy = other.GetComponentInParent<ShootAR.Enemies.Enemy>();
			if (enemy != null) { enemy.Remove(); return; }   // flew away: no points
			if (other.GetComponent<Spawnable>() != null)
				Destroy(other.gameObject);
		}
	}
}
