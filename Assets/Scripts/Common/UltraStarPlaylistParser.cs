using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using UnityEngine;

public static class UltraStarPlaylistParser
{
	public static class UltraStarPlaylistLineParser
	{
		private enum Token
		{
			Artist = 0,
			Title = 1,
			Separator = 2
		}

		public static UltraStartPlaylistLineEntry ParseLine(string line)
		{
			if (line.Trim().StartsWith("#"))
			{
				Match match = headerLineRegex.Match(line);
				if (match.Success)
				{
					string value = match.Groups["headerName"].Value;
					string value2 = match.Groups["headerValue"].Value;
					return new UltraStartPlaylistHeaderEntry(line, value, value2);
				}
				return new UltraStartPlaylistLineEntry(line);
			}
			Token token = Token.Artist;
			bool flag = false;
			StringBuilder stringBuilder = new StringBuilder(line.Length);
			StringBuilder stringBuilder2 = new StringBuilder(line.Length);
			char c = '0';
			char c2;
			for (int i = 0; i < line.Length; c = c2, i++)
			{
				c2 = line[i];
				if (c2 == '"' && c != '\\')
				{
					flag = !flag;
					if (!flag)
					{
						switch (token)
						{
						case Token.Artist:
							token = Token.Separator;
							continue;
						default:
							continue;
						case Token.Title:
							break;
						}
						break;
					}
					GetStringBuilder(token, stringBuilder, stringBuilder2)?.Clear();
				}
				else if (!flag && separators.Contains(c2) && (token == Token.Artist || token == Token.Separator))
				{
					token = Token.Title;
				}
				else if (c2 != '\\' || (c2 == '\\' && c == '\\'))
				{
					GetStringBuilder(token, stringBuilder, stringBuilder2)?.Append(c2);
				}
			}
			string text = stringBuilder.ToString().Trim();
			string text2 = stringBuilder2.ToString().Trim();
			if (!text.IsNullOrEmpty() && !text2.IsNullOrEmpty())
			{
				return new UltraStartPlaylistSongEntry(line, text, text2);
			}
			throw new UltraStarPlaylistParserException("Missing artist or title");
		}

		private static StringBuilder GetStringBuilder(Token targetToken, StringBuilder artistBuilder, StringBuilder titleBuilder)
		{
			return targetToken switch
			{
				Token.Artist => artistBuilder, 
				Token.Title => titleBuilder, 
				_ => null, 
			};
		}
	}

	public class UltraStarPlaylistParserException : Exception
	{
		public UltraStarPlaylistParserException(string message)
			: base(message)
		{
		}

		public UltraStarPlaylistParserException(string message, Exception cause)
			: base(message, cause)
		{
		}
	}

	public static readonly char defaultSeparator = ':';

	public static readonly IReadOnlyList<char> separators = new List<char> { '-', ':' };

	private static readonly Regex headerLineRegex = new Regex("\\#(?<headerName>\\w+)\\s*\\:\\s*(?<headerValue>[\\w\\s]+)");

	public static UltraStarPlaylist ParseFile(string path)
	{
		UltraStarPlaylist ultraStarPlaylist = new UltraStarPlaylist(path);
		string[] array = File.ReadAllLines(path);
		for (int i = 0; i < array.Length; i++)
		{
			try
			{
				UltraStartPlaylistLineEntry lineEntry = UltraStarPlaylistLineParser.ParseLine(array[i]);
				ultraStarPlaylist.AddLineEntry(lineEntry);
			}
			catch (Exception cause)
			{
				Debug.LogException(new UltraStarPlaylistParserException($"Error in line {i + 1} in file '{path}'", cause));
			}
		}
		return ultraStarPlaylist;
	}
}
