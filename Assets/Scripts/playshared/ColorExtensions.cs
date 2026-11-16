using UnityEngine;

public static class ColorExtensions
{
	public static Color WithRed(this Color color, float red)
	{
		return new Color(red, color.g, color.b, color.a);
	}

	public static Color WithGreen(this Color color, float green)
	{
		return new Color(color.r, green, color.b, color.a);
	}

	public static Color WithBlue(this Color color, float blue)
	{
		return new Color(color.r, color.g, blue, color.a);
	}

	public static Color WithAlpha(this Color color, float alpha)
	{
		return new Color(color.r, color.g, color.b, alpha);
	}

	public static Color RgbToHsv(this Color color)
	{
		Color.RGBToHSV(color, out var H, out var S, out var V);
		return new Color(H, S, V, color.a);
	}

	public static Color HsvToRgb(this Color color)
	{
		return Color.HSVToRGB(color.r, color.g, color.b).WithAlpha(color.a);
	}

	public static Color Multiply(this Color color, float factor, bool includeAlpha = false)
	{
		float r = NumberUtils.Limit(color.r * factor, 0f, 1f);
		float g = NumberUtils.Limit(color.g * factor, 0f, 1f);
		float b = NumberUtils.Limit(color.b * factor, 0f, 1f);
		float a = (includeAlpha ? NumberUtils.Limit(color.a * factor, 0f, 1f) : color.a);
		return new Color(r, g, b, a);
	}

	public static Color32 WithRed(this Color32 color, byte red)
	{
		return new Color32(red, color.g, color.b, color.a);
	}

	public static Color32 WithGreen(this Color32 color, byte green)
	{
		return new Color32(color.r, green, color.b, color.a);
	}

	public static Color32 WithBlue(this Color32 color, byte blue)
	{
		return new Color32(color.r, color.g, blue, color.a);
	}

	public static Color32 WithAlpha(this Color32 color, byte alpha)
	{
		return new Color32(color.r, color.g, color.b, alpha);
	}

	public static Color32 HsvToRgb(this Color32 color)
	{
		return Color.HSVToRGB((float)(int)color.r / 255f, (float)(int)color.g / 255f, (float)(int)color.b / 255f).WithAlpha((float)(int)color.a / 255f);
	}

	public static bool ColorEquals(this Color32 color, Color32 other)
	{
		if (color.r == other.r && color.g == other.g && color.b == other.b)
		{
			return color.a == other.a;
		}
		return false;
	}
}
