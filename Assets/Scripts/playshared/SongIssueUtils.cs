using UnityEngine;

public static class SongIssueUtils
{
	public static Color GetColorForIssue(SongIssue issue)
	{
		if (issue.Severity == ESongIssueSeverity.Warning)
		{
			return Colors.yellow;
		}
		return Colors.red;
	}
}
