using UnityEngine;

namespace ShootAR.Enemies
{
	// Flies straight at the player.
	public class Crasher : Boopboop
	{
		protected override void Start()
		{
			base.Start();
			MoveTo(Camera.main != null ? Camera.main.transform.position : Vector3.zero);
		}
	}
}
