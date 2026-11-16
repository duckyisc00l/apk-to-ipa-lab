using UniRx;
using UnityEngine;

public class FullscreenModePickerControl : LabeledItemPickerControl<FullScreenMode>
{
	public FullscreenModePickerControl(ItemPicker itemPicker, Settings settings, GameObject gameObject)
		: base(itemPicker, EnumUtils.GetValuesAsList<FullScreenMode>())
	{
		FullscreenModePickerControl fullscreenModePickerControl = this;
		if (Application.isEditor)
		{
			base.Selection.Value = FullScreenMode.Windowed;
		}
		else
		{
			base.Selection.Value = Screen.fullScreenMode;
			settings.GraphicSettings.ObserveEveryValueChanged((GraphicSettings it) => it.fullScreenMode).Subscribe((FullScreenMode newFullScreenMode) =>
			{
				if (newFullScreenMode != fullscreenModePickerControl.Selection.Value)
				{
					fullscreenModePickerControl.Selection.Value = newFullScreenMode;
				}
			}).AddTo(gameObject);
		}
		base.Selection.Subscribe((FullScreenMode newValue) =>
		{
			settings.GraphicSettings.fullScreenMode = newValue;
		});
	}
}
