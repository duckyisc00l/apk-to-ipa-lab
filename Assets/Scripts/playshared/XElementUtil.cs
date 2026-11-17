using System.Xml.Linq;

public static class XElementUtil
{
	public static XElement GetOrCreateElement(this XElement xelem, string name, object content = null)
	{
		if (xelem.Element(name) == null)
		{
			xelem.Add(new XElement(name, content));
		}
		return xelem.Element(name);
	}

	public static string String(this XElement xelem, string defaultValue = "")
	{
		if (xelem == null || xelem.FirstNode == null)
		{
			return defaultValue;
		}
		return xelem.FirstNode.ToString();
	}

	public static bool Bool(this XElement xelem, bool defaultValue = false)
	{
		if (xelem == null)
		{
			return defaultValue;
		}
		return bool.Parse(xelem.String());
	}

	public static int Int(this XElement xelem, int defaultValue = 0)
	{
		if (xelem == null)
		{
			return defaultValue;
		}
		return int.Parse(xelem.String());
	}

	public static float Float(this XElement xelem, float defaultValue = 0f)
	{
		if (xelem == null)
		{
			return defaultValue;
		}
		return float.Parse(xelem.String());
	}
}
