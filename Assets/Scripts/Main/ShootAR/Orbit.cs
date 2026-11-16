using System.Runtime.InteropServices;
using UnityEngine;

namespace ShootAR
{
	[StructLayout((LayoutKind)0, Size = 36)]
	public struct Orbit
	{
		public Vector3 direction;

		public Vector3 centerPoint;

		public Vector3 perpendicularAxis;

		public Orbit(Vector3 direction, Vector3 centerPoint, Vector3 perpendicularAxis)
		{
			this.direction = default(Vector3);
			this.centerPoint = default(Vector3);
			this.perpendicularAxis = default(Vector3);
		}

		public Orbit(Vector3 point, Vector3 centerPoint, bool clockwise = true)
		{
			direction = default(Vector3);
			this.centerPoint = default(Vector3);
			perpendicularAxis = default(Vector3);
		}
	}
}
