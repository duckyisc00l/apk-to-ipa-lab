using System;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class GameSettings
{
	public SystemLanguage language = SystemLanguage.English;

	public List<string> songDirs = new List<string>();

	public EScoreMode ScoreMode { get; set; }

	public string CommonScoreNameSeparator { get; set; } = " & ";
}
