using System.Collections.Generic;
using UnityEngine.UIElements;

public class MaterialIcon : FontIcon
{
	public new class UxmlFactory : UxmlFactory<MaterialIcon, UxmlTraits>
	{
	}

	public new class UxmlTraits : FontIcon.UxmlTraits
	{
	}

	private static readonly Dictionary<string, string> materialDesignIconNameToCodepointCache = new Dictionary<string, string>();

	protected override bool TryGetCodepointByIconName(string iconName, out string codepoint)
	{
		return FontIcon.TryGetCodepointByIconNameFromTextAsset(iconName, "MaterialIcons-Regular", materialDesignIconNameToCodepointCache, out codepoint);
	}

	protected override string GetIconFontUssClass()
	{
		return "materialIcon";
	}
}
