using UnityEngine;

namespace ShootAR
{
	// A circle around centerPoint: direction = where the orbit starts from the centre,
	// perpendicularAxis = the axis it turns around.
	public struct Orbit
	{
		public Vector3 direction;
		public Vector3 centerPoint;
		public Vector3 perpendicularAxis;

		public Orbit(Vector3 direction, Vector3 centerPoint, Vector3 perpendicularAxis)
		{
			this.direction = direction;
			this.centerPoint = centerPoint;
			this.perpendicularAxis = perpendicularAxis;
		}

		public Orbit(Vector3 point, Vector3 centerPoint, bool clockwise = true)
		{
			direction = (point - centerPoint).normalized;
			this.centerPoint = centerPoint;
			var side = Vector3.Cross(direction, Vector3.up);
			if (side.sqrMagnitude < 0.0001f) side = Vector3.Cross(direction, Vector3.forward);
			perpendicularAxis = Vector3.Cross(side, direction).normalized * (clockwise ? 1f : -1f);
		}
	}
}
