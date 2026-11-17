using System.IO;

public static class ThemeMetaUtils
{
	public static string GetDisplayName(ThemeMeta themeMeta)
	{
		if (themeMeta == null)
		{
			return "";
		}
		return StringUtils.ToTitleCase(themeMeta.FileNameWithoutExtension);
	}

	public static string GetAbsoluteFilePath(ThemeMeta themeMeta, string path)
	{
		if (PathUtils.IsAbsolutePath(path))
		{
			return path;
		}
		return Path.GetDirectoryName(themeMeta.AbsoluteFilePath) + "/" + path;
	}

	public static bool HasStaticBackground(ThemeMeta themeMeta, Settings settings)
	{
		if (!settings.DeveloperSettings.disableDynamicThemes && themeMeta.ThemeJson.staticBackground != null)
		{
			return !themeMeta.ThemeJson.staticBackground.imagePath.IsNullOrEmpty();
		}
		return false;
	}

	public static bool HasDynamicBackground(ThemeMeta themeMeta, Settings settings)
	{
		if (!settings.DeveloperSettings.disableDynamicThemes)
		{
			return !HasStaticBackground(themeMeta, settings);
		}
		return false;
	}
}
