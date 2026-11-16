using System;
using System.Collections.Generic;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class OverviewAreaIssueVisualizer : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject(UxmlName = "overviewAreaIssues")]
	private VisualElement overviewAreaIssues;

	private IReadOnlyCollection<SongIssue> issues = new List<SongIssue>();

	private DynamicTexture dynamicTexture;

	public void OnInjectionFinished()
	{
		songMetaChangeEventStream.Subscribe((SongMetaChangeEvent _) =>
		{
			issues = SongMetaAnalyzer.AnalyzeIssues(songMeta, 10);
			UpdateIssueOverviewImage();
		});
		overviewAreaIssues.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			dynamicTexture = new DynamicTexture(songEditorSceneControl.gameObject, overviewAreaIssues);
			UpdateIssueOverviewImage();
		});
	}

	private void UpdateIssueOverviewImage()
	{
		if (dynamicTexture == null)
		{
			return;
		}
		dynamicTexture.ClearTexture();
		foreach (SongIssue issue in issues)
		{
			DrawIssue(issue);
		}
		dynamicTexture.ApplyTexture();
	}

	private void DrawIssue(SongIssue issue)
	{
		if (dynamicTexture != null)
		{
			Color colorForIssue = SongIssueUtils.GetColorForIssue(issue);
			int num = (int)Math.Ceiling(songAudioPlayer.AudioClip.length * 1000f);
			int num2 = (int)BpmUtils.BeatToMillisecondsInSong(songMeta, issue.StartBeat);
			int num3 = (int)BpmUtils.BeatToMillisecondsInSong(songMeta, issue.EndBeat);
			if ((double)(num3 - num2) / (double)num < 0.005)
			{
				num3 = (int)((double)num2 + (double)num * 0.005);
			}
			int a = dynamicTexture.TextureWidth * num2 / num;
			int b = dynamicTexture.TextureWidth * num3 / num;
			if (b < a)
			{
				ObjectUtils.Swap(ref a, ref b);
			}
			dynamicTexture.DrawRectByCorners(a, 0, b, (int)((float)dynamicTexture.TextureHeight * 0.5f), colorForIssue);
		}
	}
}
