using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class FolderScanner
{
	private readonly string fileExtensionPattern;

	private readonly bool includeHiddenFolders;

	public FolderScanner(string fileExtensionPattern, bool includeHiddenFolders = false)
	{
		this.fileExtensionPattern = fileExtensionPattern;
		this.includeHiddenFolders = includeHiddenFolders;
		if (this.fileExtensionPattern == null || this.fileExtensionPattern.Trim().Length < 3)
		{
			throw new UnityException("Can not scan for songs. Invalid file extension specified!");
		}
	}

	public List<string> GetFiles(string folder)
	{
		return GetFiles(folder, recursive: true);
	}

	public List<string> GetFiles(string folder, bool recursive)
	{
		if (folder.IsNullOrEmpty() || !Directory.Exists(folder) || (!includeHiddenFolders && IsHiddenFolder(folder)))
		{
			return new List<string>();
		}
		List<string> list = new List<string>();
		DirectoryInfo directoryInfo = new DirectoryInfo(folder);
		if (folder == null || !Directory.Exists(folder))
		{
			Debug.LogError("Song folder '" + folder + "' does not exist or can not be read!");
			return list;
		}
		try
		{
			FileInfo[] files = directoryInfo.GetFiles(fileExtensionPattern);
			foreach (FileInfo fileInfo in files)
			{
				string text = fileInfo.Name.ToLowerInvariant();
				if (!text.StartsWith(".") && !text.Equals("license.txt"))
				{
					list.Add(fileInfo.FullName);
				}
			}
			if (recursive)
			{
				DirectoryInfo[] directories = directoryInfo.GetDirectories();
				foreach (DirectoryInfo directoryInfo2 in directories)
				{
					list.AddRange(GetFiles(directoryInfo2.FullName, recursive: true));
				}
			}
		}
		catch (Exception innerException)
		{
			throw new UnityException("Scanning of a folder failed.", innerException);
		}
		return list;
	}

	private static bool IsHiddenFolder(string folder)
	{
		return Path.GetFileName(folder).StartsWith(".");
	}
}
