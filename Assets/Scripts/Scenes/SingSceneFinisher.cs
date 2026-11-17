using System;
using UniInject;
using UnityEngine;

public class SingSceneFinisher : MonoBehaviour, INeedInjection
{
	private bool hasBeenNearEndOfSong;

	private bool isSongFinished;

	private float durationAfterSongFinishedInSeconds;

	[Inject]
	private SingSceneControl singSceneControl;

	[Inject]
	private SongMeta songMeta;

	private double positionInSongInMillisOld;

	private void Update()
	{
		double durationOfSongInMillis = singSceneControl.DurationOfSongInMillis;
		if (durationOfSongInMillis <= 0.0)
		{
			return;
		}
		if (isSongFinished)
		{
			durationAfterSongFinishedInSeconds += Time.deltaTime;
			if (durationAfterSongFinishedInSeconds >= 1f)
			{
				singSceneControl.FinishScene(isAfterEndOfSong: true);
			}
			return;
		}
		double positionInSongInMillis = singSceneControl.PositionInSongInMillis;
		if (Math.Abs(durationOfSongInMillis - positionInSongInMillis) <= 1.0)
		{
			isSongFinished = true;
		}
		if (hasBeenNearEndOfSong)
		{
			if (positionInSongInMillis < 1000.0 && positionInSongInMillis < positionInSongInMillisOld)
			{
				isSongFinished = true;
			}
			positionInSongInMillisOld = positionInSongInMillis;
		}
		else if (durationOfSongInMillis - positionInSongInMillis < 1000.0)
		{
			hasBeenNearEndOfSong = true;
		}
		if (songMeta.End > 0f && positionInSongInMillis > (double)songMeta.End)
		{
			isSongFinished = true;
		}
	}
}
