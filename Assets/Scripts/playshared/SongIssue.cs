using System;
using UnityEngine;

[Serializable]
public class SongIssue
{
	public static readonly Comparison<SongIssue> compareBySongMetaPath = (SongIssue a, SongIssue b) => string.Compare(SongMetaUtils.GetAbsoluteSongMetaPath(a.SongMeta), SongMetaUtils.GetAbsoluteSongMetaPath(b.SongMeta), StringComparison.InvariantCulture);

	public static readonly Comparison<SongIssue> compareBySongMetaArtistAndTitle = (SongIssue a, SongIssue b) => string.Compare(SongMetaUtils.GetArtistDashTitle(a.SongMeta), SongMetaUtils.GetArtistDashTitle(b.SongMeta), StringComparison.InvariantCulture);

	public SongMeta SongMeta { get; set; }

	public ESongIssueSeverity Severity { get; private set; }

	public string Message { get; private set; }

	public int StartBeat { get; private set; }

	public int EndBeat { get; private set; }

	public SongIssue()
	{
	}

	public SongIssue(ESongIssueSeverity severity, SongMeta songMeta, string message, int startBeat, int endBeat)
	{
		Severity = severity;
		SongMeta = songMeta;
		Message = message;
		StartBeat = startBeat;
		EndBeat = endBeat;
	}

	public static SongIssue CreateWarning(SongMeta songMeta, string message, int startBeat = -1, int endBeat = -1)
	{
		return new SongIssue(ESongIssueSeverity.Warning, songMeta, message, startBeat, endBeat);
	}

	public static SongIssue CreateError(SongMeta songMeta, string message, int startBeat = -1, int endBeat = -1)
	{
		return new SongIssue(ESongIssueSeverity.Error, songMeta, message, startBeat, endBeat);
	}

	public void Log()
	{
		string text = ((StartBeat >= 0 && EndBeat >= 0) ? $" (from beat {StartBeat}, until beat {EndBeat})" : "");
		string message = Message + text;
		if (Severity == ESongIssueSeverity.Warning)
		{
			Debug.LogWarning(message);
		}
		else
		{
			Debug.LogError(message);
		}
	}
}
