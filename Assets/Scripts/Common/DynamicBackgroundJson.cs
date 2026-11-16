using System;
using UnityEngine;

[Serializable]
public class DynamicBackgroundJson
{
	public string gradientRampFile;

	public string gradientType = "Radial";

	public float gradientScrollingSpeed;

	public float gradientScale = 1f;

	public float gradientSmoothness = 1f;

	public float gradientAngle;

	public bool gradientAnimation;

	public float gradientAnimSpeed = 1f;

	public float gradientAnimAmplitude = 0.1f;

	public string patternFile;

	public Color32 patternColor = Colors.white;

	public Vector2 patternScale = Vector2.one;

	public Vector2 patternScrolling = Vector2.zero;

	public float uiShadowOpacity;

	public Vector2 uiShadowOffset;

	public string particleFile;

	public float particleOpacity;
}
