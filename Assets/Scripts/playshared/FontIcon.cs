using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public abstract class FontIcon : Label
{
	public new class UxmlTraits : VisualElement.UxmlTraits
	{
		private readonly UxmlStringAttributeDescription icon = new UxmlStringAttributeDescription
		{
			name = "icon",
			defaultValue = ""
		};

		public override void Init(VisualElement ve, IUxmlAttributes bag, CreationContext cc)
		{
			base.Init(ve, bag, cc);
			(ve as FontIcon).Icon = icon.GetValueFromBag(bag, cc);
		}
	}

	private static string missingIconText = "?";

	private string icon;

	public string Icon
	{
		get
		{
			return icon;
		}
		set
		{
			icon = value;
			UpdateIcon();
		}
	}

	protected FontIcon()
	{
		Icon = "";
	}

	private void UpdateIcon()
	{
		string codepoint;
		if (string.IsNullOrEmpty(icon))
		{
			text = "";
		}
		else if (TryGetCodepointByIconName(icon, out codepoint))
		{
			AddToClassList("fontIcon");
			AddToClassList(GetIconFontUssClass());
			text = "\\u" + codepoint;
		}
		else
		{
			text = missingIconText;
		}
	}

	protected abstract bool TryGetCodepointByIconName(string iconName, out string codepoint);

	protected abstract string GetIconFontUssClass();

	protected static bool TryGetCodepointByIconNameFromTextAsset(string iconName, string textAssetPath, Dictionary<string, string> iconNameToCodepointCache, out string codepoint)
	{
		if (iconNameToCodepointCache.Count == 0)
		{
			TextAsset textAsset = Resources.Load<TextAsset>(textAssetPath);
			if (textAsset == null)
			{
				Debug.LogError("Codepoints TextAsset not found using path '" + textAssetPath + "'");
				codepoint = "";
				return false;
			}
			textAsset.text.Split("\n").ForEach((string codepointLine) =>
			{
				string[] array = codepointLine.Trim().Split(" ");
				if (array.Length == 2)
				{
					string key = array[0];
					string value2 = array[1];
					iconNameToCodepointCache[key] = value2;
				}
			});
		}
		if (iconNameToCodepointCache.TryGetValue(iconName, out var value))
		{
			codepoint = value;
			return true;
		}
		codepoint = "";
		return false;
	}
}
