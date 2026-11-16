using System.Collections.Generic;
using UnityEngine.UIElements;

public class BootstrapIcon : FontIcon
{
	public new class UxmlFactory : UxmlFactory<BootstrapIcon, UxmlTraits>
	{
	}

	public new class UxmlTraits : FontIcon.UxmlTraits
	{
	}

	private static readonly Dictionary<string, string> bootstrapIconNameToCodepointCache = new Dictionary<string, string>();

	protected override bool TryGetCodepointByIconName(string iconName, out string codepoint)
	{
		if (FontIcon.TryGetCodepointByIconNameFromTextAsset(iconName, "BootstrapIcons", bootstrapIconNameToCodepointCache, out var codepoint2))
		{
			string text = int.Parse(codepoint2).ToString("X");
			codepoint = text;
			return true;
		}
		codepoint = "";
		return false;
	}

	protected override string GetIconFontUssClass()
	{
		return "bootstrapIcon";
	}
}
