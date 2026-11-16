using System.Collections.Generic;
using System.Linq;
using UniRx;
using UnityEngine;

public class ScreenResolutionPickerControl : LabeledItemPickerControl<ScreenResolution>
{
	public ScreenResolutionPickerControl(ItemPicker itemPicker, Settings settings)
		: base(itemPicker, GetItems())
	{
		base.GetLabelTextFunction = (ScreenResolution item) => $"{item.Width} x {item.Height} ({item.RefreshRate} Hz)";
		if (Application.isEditor)
		{
			base.Selection.Value = base.Items[0];
		}
		else
		{
			ScreenResolution screenResolution = ApplicationUtils.GetScreenResolution();
			if (!TrySelectItem(screenResolution, selectFirstItemAsFallback: false))
			{
				base.Selection.Value = GetBestMatchingScreenResolution(screenResolution);
			}
		}
		base.Selection.Subscribe((ScreenResolution newValue) =>
		{
			settings.GraphicSettings.resolution = newValue;
		});
	}

	private ScreenResolution GetBestMatchingScreenResolution(ScreenResolution targetResolution)
	{
		float bestMatchDistance = float.MaxValue;
		ScreenResolution bestMatch = new ScreenResolution(0, 0, 0);
		base.Items.ForEach((ScreenResolution screenResolution) =>
		{
			if (bestMatch.Width == 0 || bestMatch.Height == 0 || bestMatch.RefreshRate == 0)
			{
				bestMatch = screenResolution;
			}
			float num = ResolutionDistance(screenResolution, targetResolution);
			if (num < bestMatchDistance)
			{
				bestMatchDistance = num;
				bestMatch = screenResolution;
			}
		});
		return bestMatch;
		static float ResolutionDistance(ScreenResolution a, ScreenResolution b)
		{
			return Vector2.Distance(new Vector2(a.Width, a.Height), new Vector2(b.Width, b.Height));
		}
	}

	private static List<ScreenResolution> GetItems()
	{
		if (Application.isEditor)
		{
			return GetDummyResolutions();
		}
		return GetResolutions();
	}

	private static List<ScreenResolution> GetDummyResolutions()
	{
		return new List<ScreenResolution>
		{
			CreateResolution(800, 600, 60),
			CreateResolution(1024, 768, 60),
			CreateResolution(1920, 1080, 60)
		};
	}

	private static ScreenResolution CreateResolution(int width, int height, int refreshRate)
	{
		return new ScreenResolution(width, height, refreshRate);
	}

	private static List<ScreenResolution> GetResolutions()
	{
		return Screen.resolutions.Select((Resolution it) => new ScreenResolution(it)).Distinct().ToList();
	}
}
