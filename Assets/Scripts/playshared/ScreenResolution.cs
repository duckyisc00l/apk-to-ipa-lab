using System;
using System.Collections.Generic;
using UnityEngine;

public struct ScreenResolution : IEqualityComparer<ScreenResolution>
{
	public int Width { get; set; }

	public int Height { get; set; }

	public int RefreshRate { get; set; }

	public ScreenResolution(int widht, int height, int refreshRate)
	{
		Width = widht;
		Height = height;
		RefreshRate = refreshRate;
	}

	public ScreenResolution(Resolution res)
		: this(res.width, res.height, res.refreshRate)
	{
	}

	public override string ToString()
	{
		return $"{Width} x {Height} @ {RefreshRate} Hz";
	}

	public bool Equals(ScreenResolution x, ScreenResolution y)
	{
		if (x.Width == y.Width && x.Height == y.Height)
		{
			return x.RefreshRate == y.RefreshRate;
		}
		return false;
	}

	public int GetHashCode(ScreenResolution obj)
	{
		return HashCode.Combine(obj.Width, obj.Height, obj.RefreshRate);
	}
}
