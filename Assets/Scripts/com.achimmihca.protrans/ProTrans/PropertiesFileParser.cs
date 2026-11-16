using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace ProTrans
{
	public static class PropertiesFileParser
	{
		private static readonly KeyValuePair<string, string> emptyKeyValuePair = new KeyValuePair<string, string>("", "");

		public static Dictionary<string, string> ParseFile(string path)
		{
			return ParseText(File.ReadAllText(path, Encoding.UTF8));
		}

		public static Dictionary<string, string> ParseText(string text)
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			using StringReader stringReader = new StringReader(text);
			for (string text2 = stringReader.ReadLine(); text2 != null; text2 = stringReader.ReadLine())
			{
				KeyValuePair<string, string> keyValuePair = ParseLine(text2, stringReader);
				if (!keyValuePair.Equals(emptyKeyValuePair))
				{
					dictionary.Add(keyValuePair.Key, keyValuePair.Value);
				}
			}
			return dictionary;
		}

		private static KeyValuePair<string, string> ParseLine(string line, StringReader stringReader)
		{
			string text = line.TrimStart();
			if (text.StartsWith("#") || text.StartsWith("!"))
			{
				return emptyKeyValuePair;
			}
			int num = line.IndexOf("=", StringComparison.InvariantCulture);
			if (num < 0)
			{
				return emptyKeyValuePair;
			}
			string text2 = line.Substring(0, num);
			string text3 = line.Substring(num + 1, line.Length - num - 1);
			string key = text2.Trim();
			string line2 = text3.TrimStart();
			StringBuilder stringBuilder = new StringBuilder();
			ParseEscapedCharacters(line2, stringBuilder, stringReader);
			return new KeyValuePair<string, string>(key, stringBuilder.ToString());
		}

		private static void ParseEscapedCharacters(string line, StringBuilder sb, StringReader stringReader)
		{
			bool flag = false;
			foreach (char c in line)
			{
				if (flag)
				{
					flag = false;
					switch (c)
					{
					case 't':
						sb.Append('\t');
						break;
					case 'n':
						sb.Append('\n');
						break;
					case 'r':
						sb.Append('\r');
						break;
					default:
						sb.Append(c);
						break;
					}
				}
				else if (c == '\\')
				{
					flag = true;
				}
				else
				{
					sb.Append(c);
				}
			}
			if (flag)
			{
				string text = stringReader.ReadLine();
				if (text != null)
				{
					ParseEscapedCharacters(text.TrimStart(), sb, stringReader);
				}
			}
		}
	}
}
