using UnityEngine;

public static class ClipboardUtils
{
	public static void CopyToClipboard(string text)
	{
		if (!string.IsNullOrEmpty(text))
		{
			GUIUtility.systemCopyBuffer = text;
		}
	}
}
