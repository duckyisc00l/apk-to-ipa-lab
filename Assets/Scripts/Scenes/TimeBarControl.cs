using System;
using System.Collections.Generic;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class TimeBarControl : INeedInjection
{
	[Inject(UxmlName = "innerTimeBarSentenceEntryContainer")]
	private VisualElement innerTimeBarSentenceEntryContainer;

	[Inject(UxmlName = "timeBarPositionIndicator")]
	private VisualElement timeBarPositionIndicator;

	[Inject(UxmlName = "timeLabel")]
	private Label timeLabel;

	[Inject(UxmlName = "timeValueLabel")]
	private Label timeValueLabel;

	public void UpdateTimeValueLabel(double positionInSongInMillis, double durationOfSongInMillis)
	{
		double num = (durationOfSongInMillis - positionInSongInMillis) / 1000.0;
		int num2 = (int)Math.Floor(num / 60.0);
		string text = ((num2 < 10) ? "0" : "");
		int num3 = (int)Math.Floor(num % 60.0);
		string text2 = ((num3 < 10) ? "0" : "");
		timeValueLabel.text = $"{text}{num2}:{text2}{num3}";
	}

	public void UpdatePositionIndicator(double positionInSongInMillis, double durationOfSongInMillis)
	{
		float value = (float)(100.0 * positionInSongInMillis / durationOfSongInMillis);
		timeBarPositionIndicator.style.left = new StyleLength(new Length(value, LengthUnit.Percent));
	}

	public void UpdateTimeBarRectangles(SongMeta songMeta, List<PlayerControl> playerControls, double durationOfSongInMillis)
	{
		innerTimeBarSentenceEntryContainer.Clear();
		int num = 0;
		foreach (PlayerControl playerControl in playerControls)
		{
			CreateRectangles(songMeta, playerControl, durationOfSongInMillis, num, playerControls.Count);
			num++;
		}
	}

	private void CreateRectangles(SongMeta songMeta, PlayerControl playerControl, double durationOfSongInMillis, int playerIndex, int playerCount)
	{
		foreach (Sentence sentence in playerControl.Voice.Sentences)
		{
			double startPosInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, sentence.MinBeat);
			double endPosInMillis = BpmUtils.BeatToMillisecondsInSong(songMeta, sentence.MaxBeat);
			if (playerCount <= 3)
			{
				float num = ((playerCount > 0) ? (100 / playerCount) : 100);
				float topPercent = (float)playerIndex * num;
				MicProfile micProfile = playerControl.MicProfile;
				CreateRectangle(micProfile, startPosInMillis, endPosInMillis, durationOfSongInMillis, topPercent, num);
			}
			else
			{
				CreateRectangle(null, startPosInMillis, endPosInMillis, durationOfSongInMillis, 0f, 100f);
			}
		}
	}

	private void CreateRectangle(MicProfile micProfile, double startPosInMillis, double endPosInMillis, double durationOfSongInMillis, float topPercent, float heightPercent)
	{
		float num = (float)(100.0 * startPosInMillis / durationOfSongInMillis);
		float num2 = (float)(100.0 * endPosInMillis / durationOfSongInMillis);
		VisualElement visualElement = new VisualElement();
		visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
		visualElement.style.left = new StyleLength(new Length(num, LengthUnit.Percent));
		visualElement.style.width = new StyleLength(new Length(num2 - num, LengthUnit.Percent));
		visualElement.style.top = new StyleLength(new Length(topPercent, LengthUnit.Percent));
		visualElement.style.height = new StyleLength(new Length(heightPercent, LengthUnit.Percent));
		if (micProfile != null)
		{
			visualElement.style.backgroundColor = new StyleColor(micProfile.Color);
		}
		else
		{
			visualElement.style.backgroundColor = new StyleColor(Color.grey);
		}
		innerTimeBarSentenceEntryContainer.Add(visualElement);
	}
}
