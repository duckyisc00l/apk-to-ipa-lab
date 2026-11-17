using System;
using System.IO;
using UnityEngine;

public static class PathUtils
{
	public static string CombinePaths(string firstPart, string secondPart)
	{
		if (EndsWithSeparator(firstPart) || StartsWithSeparator(secondPart))
		{
			return firstPart + secondPart;
		}
		return firstPart + "/" + secondPart;
		static bool EndsWithSeparator(string path)
		{
			if (!path.EndsWith("/"))
			{
				return path.EndsWith("\\");
			}
			return true;
		}
		static bool StartsWithSeparator(string path)
		{
			if (!path.StartsWith("/"))
			{
				return path.StartsWith("\\");
			}
			return true;
		}
	}

	public static bool IsAbsolutePath(string path)
	{
		if (path == null)
		{
			return false;
		}
		if (path.StartsWith("/"))
		{
			return true;
		}
		if (path.Length < 2)
		{
			return false;
		}
		if (path.Length == 2 && IsValidDriveChar(path[0]) && path[1] == Path.VolumeSeparatorChar)
		{
			return true;
		}
		if (path.Length >= 3 && IsValidDriveChar(path[0]) && path[1] == Path.VolumeSeparatorChar && IsDirectorySeparator(path[2]))
		{
			return true;
		}
		if (path.Length >= 3 && IsDirectorySeparator(path[0]) && IsDirectorySeparator(path[1]))
		{
			return true;
		}
		return false;
	}

	private static bool IsDirectorySeparator(char c)
	{
		if (c != Path.DirectorySeparatorChar)
		{
			return c == Path.AltDirectorySeparatorChar;
		}
		return true;
	}

	private static bool IsValidDriveChar(char c)
	{
		if (c < 'A' || c > 'Z')
		{
			if (c >= 'a')
			{
				return c <= 'z';
			}
			return false;
		}
		return true;
	}

	public static string NormalizePath(string path)
	{
		if (IsAbsolutePath(path))
		{
			return Path.GetFullPath(path).Replace("\\", "/");
		}
		string text = "c:/dummy-base-path/";
		if (Uri.TryCreate(new Uri(text), path, out var result))
		{
			if (result.AbsolutePath.StartsWith("/" + text))
			{
				return result.AbsolutePath.Substring(text.Length + 1);
			}
			if (result.AbsolutePath.StartsWith(text))
			{
				return result.AbsolutePath.Substring(text.Length);
			}
			return result.AbsolutePath;
		}
		Debug.LogError("Could not normalize path '" + path + "' using URI class");
		return path;
	}

	public static bool AreEqual(string pathA, string pathB)
	{
		return Path.GetFullPath(pathA) == Path.GetFullPath(pathB);
	}
}
