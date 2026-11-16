using System.Xml.Linq;

public static class XAttributeUtil
{
	public static string String(this XAttribute xatt, string defaultValue = "")
	{
		if (xatt == null)
		{
			return defaultValue;
		}
		return (string)xatt;
	}

	public static bool Bool(this XAttribute xatt, bool defaultValue = false)
	{
		if (xatt == null)
		{
			return defaultValue;
		}
		return (bool)xatt;
	}

	public static int Int(this XAttribute xatt, int defaultValue = 0)
	{
		if (xatt == null)
		{
			return defaultValue;
		}
		return (int)xatt;
	}

	public static float Float(this XAttribute xatt, float defaultValue = 0f)
	{
		if (xatt == null)
		{
			return defaultValue;
		}
		return (float)xatt;
	}
}
