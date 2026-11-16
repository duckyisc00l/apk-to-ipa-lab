using UnityEngine;

namespace ShootAR.Enemies
{
	public class Drone : Pyoopyoo
	{
		[SerializeField]
		protected const float ShootDelay = 5f;

		protected float nextShot;

		protected void FixedUpdate()
		{
		}
	}
}
