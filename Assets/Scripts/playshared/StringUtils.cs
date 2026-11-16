using System.Text.RegularExpressions;

public static class StringUtils
{
	public static string ToTitleCase(string input)
	{
		if (input.Contains("_") || input.Contains("-"))
		{
			return SnakeCaseToTitleCase(input);
		}
		return CamelCaseToTitleCase(input);
	}

	public static string SnakeCaseToTitleCase(string input)
	{
		input = input.Replace("_", " ").Replace("-", " ");
		char[] array = input.ToCharArray();
		bool flag = true;
		for (int i = 0; i < array.Length; i++)
		{
			if (flag)
			{
				array[i] = char.ToUpperInvariant(input[i]);
			}
			flag = char.IsWhiteSpace(array[i]);
		}
		return new string(array);
	}

	public static string CamelCaseToTitleCase(string input)
	{
		return Regex.Replace(input.ToUpperInvariantFirstChar(), "([A-Z])", " $1").Trim();
	}
}
