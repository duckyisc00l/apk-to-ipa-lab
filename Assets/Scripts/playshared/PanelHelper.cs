using System;
using UnityEngine;
using UnityEngine.UIElements;

public class PanelHelper
{
	private readonly IPanel panel;

	private readonly PanelSettings panelSettings;

	private Vector2 scalingRatio;

	private int cacheFrame;

	private float screenHeight;

	private Vector2 panelScreenMin;

	public PanelHelper(UIDocument document)
	{
		panel = document.rootVisualElement.panel;
		panelSettings = document.panelSettings;
	}

	public Vector2 ScreenToPanel(Vector2 v)
	{
		return RuntimePanelUtils.ScreenToPanel(panel, v);
	}

	public Vector2 PanelToScreen(Vector2 v)
	{
		if (Time.frameCount != cacheFrame)
		{
			UpdateCache();
		}
		Vector2 result = (v - panelScreenMin) * scalingRatio;
		result.y = screenHeight - result.y;
		return result;
	}

	public Rect PanelToScreen(Rect r)
	{
		Vector2 vector = PanelToScreen(new Vector2(r.xMin, r.yMin));
		Vector2 vector2 = PanelToScreen(new Vector2(r.xMax, r.yMax));
		Vector2 position = new Vector2(Mathf.Min(vector.x, vector2.x), Mathf.Min(vector.y, vector2.y));
		Vector2 size = new Vector2(Mathf.Abs(vector.x - vector2.x), Mathf.Abs(vector.y - vector2.y));
		return new Rect(position, size);
	}

	public float GetScaleWeight()
	{
		return panelSettings.scaleMode switch
		{
			PanelScaleMode.ConstantPixelSize => 0.5f, 
			PanelScaleMode.ConstantPhysicalSize => 0.5f, 
			PanelScaleMode.ScaleWithScreenSize => panelSettings.match, 
			_ => throw new ArgumentOutOfRangeException(), 
		};
	}

	public Vector2 GetScalingRatio()
	{
		if (Time.frameCount != cacheFrame)
		{
			UpdateCache();
		}
		return scalingRatio;
	}

	private void UpdateCache()
	{
		cacheFrame = Time.frameCount;
		Vector2 vector = new Vector2(Screen.width, Screen.height);
		Vector2 vector2 = RuntimePanelUtils.ScreenToPanel(panel, new Vector2(0f, 0f));
		Vector2 vector3 = RuntimePanelUtils.ScreenToPanel(panel, vector) - vector2;
		screenHeight = vector.y;
		panelScreenMin = vector2;
		scalingRatio = vector / vector3;
	}
}
