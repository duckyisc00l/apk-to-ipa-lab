using System;
using UniRx;
using UniRx.Triggers;
using UnityEngine;
using UnityEngine.UIElements;

public class DynamicTexture
{
	public Color backgroundColor = new Color(0f, 0f, 0f, 0f);

	private Color[] blank;

	private Texture2D texture;

	private readonly GameObject gameObject;

	public int TextureWidth { get; private set; } = -1;

	public int TextureHeight { get; private set; } = -1;

	public bool IsInitialized => texture != null;

	public DynamicTexture(GameObject gameObject, VisualElement visualElement)
	{
		this.gameObject = gameObject;
		if (visualElement.resolvedStyle.width <= 0f || visualElement.resolvedStyle.height <= 0f)
		{
			throw new UnityException("VisualElement has no size. Consider calling Init from GeometryChangedEvent.");
		}
		Vector2 size = new PanelHelper(UnityEngine.Object.FindObjectOfType<UIDocument>()).PanelToScreen(visualElement.worldBound).size;
		Init((int)size.x, (int)size.y);
		visualElement.style.backgroundImage = new StyleBackground(texture);
	}

	public void Init(int textureWidth, int textureHeight)
	{
		Destroy();
		TextureWidth = textureWidth;
		TextureHeight = textureHeight;
		CreateTexture();
	}

	public void Destroy()
	{
		if (texture != null)
		{
			UnityEngine.Object.Destroy(texture);
			texture = null;
		}
	}

	private void CreateTexture()
	{
		if (!(texture != null))
		{
			if (TextureWidth <= 0 || TextureHeight <= 0)
			{
				throw new UnityException("Texture size missing. Call Init first and make sure the VisualElement has a size.");
			}
			texture = new Texture2D(TextureWidth, TextureHeight);
			gameObject.OnDestroyAsObservable().Subscribe((Unit _) =>
			{
				Destroy();
			});
			blank = new Color[TextureWidth * TextureHeight];
			for (int num = 0; num < blank.Length; num++)
			{
				blank[num] = backgroundColor;
			}
			ClearTexture();
			ApplyTexture();
		}
	}

	public void ApplyTexture()
	{
		CreateTexture();
		texture.Apply();
	}

	public void ClearTexture()
	{
		CreateTexture();
		texture.SetPixels(blank);
	}

	public void SetPixel(int x, int y, Color color)
	{
		CreateTexture();
		texture.SetPixel(x, y, color);
	}

	public void DrawRectByWidthAndHeight(int xStart, int yStart, int width, int height, Color color)
	{
		CreateTexture();
		int xEnd = xStart + width;
		int yEnd = yStart + height;
		DrawRectByCorners(xStart, yStart, xEnd, yEnd, color);
	}

	public void DrawRectByCorners(int xStart, int yStart, int xEnd, int yEnd, Color color)
	{
		CreateTexture();
		for (int i = xStart; i < xEnd; i++)
		{
			for (int j = yStart; j < yEnd; j++)
			{
				SetPixel(i, j, color);
			}
		}
	}

	public void DrawLine(int ax, int ay, int bx, int by, Color color)
	{
		CreateTexture();
		int num = Math.Abs(bx - ax);
		int num2 = ((ax < bx) ? 1 : (-1));
		int num3 = -Math.Abs(by - ay);
		int num4 = ((ay < by) ? 1 : (-1));
		int num5 = num + num3;
		while (true)
		{
			SetPixel(ax, ay, color);
			if (ax != bx || ay != by)
			{
				int num6 = 2 * num5;
				if (num6 > num3)
				{
					num5 += num3;
					ax += num2;
				}
				if (num6 < num)
				{
					num5 += num;
					ay += num4;
				}
				continue;
			}
			break;
		}
	}

	public void DrawLine(int ax, int ay, int bx, int by, float thickness, Color color)
	{
		CreateTexture();
		float num = thickness / 2f;
		int value = (int)Mathf.Floor((float)Math.Min(ax, bx) - num);
		value = NumberUtils.Limit(value, 0, TextureWidth - 1);
		int value2 = (int)Mathf.Ceil((float)Math.Max(ax, bx) + num);
		value2 = NumberUtils.Limit(value2, 0, TextureWidth - 1);
		int num2 = NumberUtils.Limit((int)Mathf.Floor((float)Math.Min(ay, by) - num), 0, TextureHeight - 1);
		int value3 = (int)Mathf.Ceil((float)Math.Max(ay, by) + num);
		value3 = NumberUtils.Limit(value3, 0, TextureHeight - 1);
		for (int i = num2; i <= value3; i++)
		{
			for (int j = value; j <= value2; j++)
			{
				float alpha = Mathf.Max(Mathf.Min(0.5f - CapsuleSdf(j, i, ax, ay, bx, by, num), 1f), 0f);
				Color pixel = texture.GetPixel(j, i);
				Color color2 = AlphaBlend(pixel, color, alpha);
				SetPixel(j, i, color2);
			}
		}
	}

	private float CapsuleSdf(float px, float py, float ax, float ay, float bx, float by, float r)
	{
		float num = px - ax;
		float num2 = py - ay;
		float num3 = bx - ax;
		float num4 = by - ay;
		float num5 = Mathf.Max(Mathf.Min((num * num3 + num2 * num4) / (num3 * num3 + num4 * num4), 1f), 0f);
		float num6 = num - num3 * num5;
		float num7 = num2 - num4 * num5;
		return Mathf.Sqrt(num6 * num6 + num7 * num7) - r;
	}

	private Color AlphaBlend(Color currentColor, Color targetColor, float alpha)
	{
		return new Color(currentColor.r * (1f - alpha) + targetColor.r * alpha, currentColor.g * (1f - alpha) + targetColor.g * alpha, currentColor.b * (1f - alpha) + targetColor.b * alpha, currentColor.a * (1f - alpha) + targetColor.a * alpha);
	}
}
