using UnityEngine;

namespace ShootAR.Enemies
{
	// Circles the player and shoots every few seconds.
	public class Drone : Pyoopyoo
	{
		protected const float ShootDelay = 5f;
		protected float nextShot;

		protected override void Start()
		{
			base.Start();
			var center = Camera.main != null ? Camera.main.transform.position : Vector3.zero;
			OrbitAround(new Orbit(transform.position, center, Random.value > 0.5f));
			nextShot = Time.time + Random.Range(1f, ShootDelay);
		}

		protected void FixedUpdate()
		{
			if (gameState != null && (gameState.Paused || gameState.GameOver)) return;
			if (Time.time >= nextShot)
			{
				Shoot();
				nextShot = Time.time + ShootDelay;
			}
		}
	}
}
