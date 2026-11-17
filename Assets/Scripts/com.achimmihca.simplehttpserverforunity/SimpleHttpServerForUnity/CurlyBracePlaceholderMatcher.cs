using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace SimpleHttpServerForUnity
{
	public class CurlyBracePlaceholderMatcher
	{
		private readonly Regex regex;

		private readonly List<string> placeholderNames;

		public string Pattern { get; private set; }

		public int PlaceholderCount => placeholderNames.Count;

		public CurlyBracePlaceholderMatcher(string pattern)
		{
			Pattern = pattern;
			MatchCollection matchCollection = Regex.Matches(pattern, "\\{[^/]+\\}");
			string text = Regex.Escape(pattern.Replace("{", "CURLY_OPEN").Replace("}", "CURLY_CLOSE").Replace("*", "ASTERISK"));
			placeholderNames = new List<string>(matchCollection.Count);
			foreach (Match item in matchCollection)
			{
				string text2 = item.Value.Substring(1, item.Length - 2);
				placeholderNames.Add(text2);
				text = text.Replace("CURLY_OPEN" + text2 + "CURLY_CLOSE", "(?<" + text2 + ">[^/]+)").Replace("ASTERISK", "(?<asterisk>.*)");
			}
			regex = new Regex(text);
		}

		public bool TryMatch(string text, out Dictionary<string, string> placeholderValues)
		{
			Match match = regex.Match(text);
			if (!match.Success)
			{
				placeholderValues = null;
				return false;
			}
			placeholderValues = new Dictionary<string, string>();
			for (int i = 1; i < match.Groups.Count; i++)
			{
				Group obj = match.Groups[i];
				string key = ((obj.Name != "asterisk") ? obj.Name : "*");
				placeholderValues[key] = obj.Value;
			}
			return true;
		}
	}
}
