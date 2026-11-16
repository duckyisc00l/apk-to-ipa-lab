using System;
using System.Collections.Generic;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class LineDisplayer : INeedInjection, IInjectionFinishedListener
{
	[Inject(UxmlName = "noteLines")]
	private VisualElement visualElement;

	[Inject]
	private SingSceneControl singSceneControl;

	private DynamicTexture dynamicTexture;

	private readonly List<Action> pendingActionList = new List<Action>();

	public Color LineColor { get; set; }

	public void OnInjectionFinished()
	{
		if (visualElement.resolvedStyle.width > 0f && visualElement.resolvedStyle.height > 0f)
		{
			CreateDynamicTexture();
			return;
		}
		visualElement.RegisterCallback((GeometryChangedEvent evt) =>
		{
			if (dynamicTexture == null && visualElement.resolvedStyle.width > 0f && visualElement.resolvedStyle.height > 0f)
			{
				CreateDynamicTexture();
			}
		});
	}

	private void CreateDynamicTexture()
	{
		dynamicTexture = new DynamicTexture(singSceneControl.gameObject, visualElement);
		pendingActionList.ForEach((Action action) =>
		{
			action();
		});
		pendingActionList.Clear();
	}

	public void DrawLines(IEnumerable<float> noteRowToYPercent)
	{
		if (dynamicTexture == null)
		{
			pendingActionList.Add(() =>
			{
				DrawLines(noteRowToYPercent);
			});
			return;
		}
		dynamicTexture.ClearTexture();
		noteRowToYPercent.ForEach((float y) =>
		{
			DrawLine(y);
		});
		dynamicTexture.ApplyTexture();
	}

	private void DrawLine(float yPercent)
	{
		int y = (int)((float)dynamicTexture.TextureHeight * yPercent);
		for (int i = 0; i < dynamicTexture.TextureWidth; i++)
		{
			dynamicTexture.SetPixel(i, y, LineColor);
		}
	}
}
