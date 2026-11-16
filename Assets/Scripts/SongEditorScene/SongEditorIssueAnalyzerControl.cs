using System;
using System.Collections.Generic;
using UniInject;
using UniRx;

public class SongEditorIssueAnalyzerControl : INeedInjection, IInjectionFinishedListener
{
	public const int MaxSongIssueCountPerMessage = 10;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private NoteAreaControl noteAreaControl;

	private readonly Subject<IReadOnlyCollection<SongIssue>> issuesEventStream = new Subject<IReadOnlyCollection<SongIssue>>();

	private int lastIssueCount;

	public IObservable<IReadOnlyCollection<SongIssue>> IssuesEventStream => issuesEventStream;

	public void OnInjectionFinished()
	{
		UpdateIssues();
		songMetaChangeEventStream.Throttle(new TimeSpan(0, 0, 0, 0, 500)).Subscribe((SongMetaChangeEvent _) =>
		{
			UpdateIssues();
		});
	}

	private void UpdateIssues()
	{
		IReadOnlyCollection<SongIssue> readOnlyCollection = SongMetaAnalyzer.AnalyzeIssues(songMeta, 10);
		if (readOnlyCollection.Count != lastIssueCount)
		{
			issuesEventStream.OnNext(readOnlyCollection);
		}
		lastIssueCount = readOnlyCollection.Count;
	}
}
