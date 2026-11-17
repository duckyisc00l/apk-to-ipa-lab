using System.IO;

public class ThemeMeta
{
	private ThemeJson themeJson;

	public string AbsoluteFilePath { get; private set; }

	public string FileNameWithoutExtension => Path.GetFileNameWithoutExtension(AbsoluteFilePath);

	public ThemeJson ThemeJson
	{
		get
		{
			if (themeJson == null)
			{
				string json = File.ReadAllText(AbsoluteFilePath);
				themeJson = JsonConverter.FromJson<ThemeJson>(json);
			}
			return themeJson;
		}
	}

	public ThemeMeta(string absoluteFilePath)
	{
		AbsoluteFilePath = absoluteFilePath;
	}

	public override string ToString()
	{
		return base.ToString() + "(" + FileNameWithoutExtension + ")";
	}
}
