using System.Globalization;
using UnityEngine;
using UnityEngine.UIElements;

public class DetectBpmControl
{
	private int clickCount;

	private float startTime;

	private float lastClickTime;

	public DetectBpmControl(Button button, Label label)
	{
		DetectBpmControl detectBpmControl = this;
		button.RegisterCallbackButtonTriggered(() =>
		{
			if (Time.time - detectBpmControl.lastClickTime > 2f)
			{
				detectBpmControl.ResetCount();
			}
			if (detectBpmControl.clickCount == 0)
			{
				detectBpmControl.startTime = Time.time;
				label.text = "First clicks";
			}
			else
			{
				float num = Time.time - detectBpmControl.startTime;
				if (num > 1f)
				{
					float num2 = (float)(60 * detectBpmControl.clickCount) / num;
					label.text = num2.ToString("0.00", CultureInfo.InvariantCulture) + " BPM";
				}
			}
			detectBpmControl.clickCount++;
			detectBpmControl.lastClickTime = Time.time;
		});
	}

	private void ResetCount()
	{
		clickCount = 0;
	}
}
