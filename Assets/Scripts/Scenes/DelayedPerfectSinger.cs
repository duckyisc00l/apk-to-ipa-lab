using System.Collections.Generic;
using UnityEngine;

public class DelayedPerfectSinger : PerfectSinger
{
	private readonly List<BeatPitchEvent> delayedPitchEvents = new List<BeatPitchEvent>();

	private int lastAnalyzedBeat = -1;

	protected override void Update()
	{
		if (playerControl == null && !TryFindPlayerControl())
		{
			return;
		}
		int num = (int)singSceneControl.CurrentBeat;
		if (num <= 0 || num <= lastAnalyzedBeat || playerControl.PlayerMicPitchTracker.RecordingSentence == null)
		{
			return;
		}
		int beatToAnalyze = lastAnalyzedBeat + 1;
		for (int i = beatToAnalyze; i <= num; i++)
		{
			BeatPitchEvent dummyPitchEvent = GetDummyPitchEvent(i);
			delayedPitchEvents.Add(dummyPitchEvent);
			lastAnalyzedBeat = i;
		}
		if (delayedPitchEvents.Count >= Random.Range(1, 100))
		{
			List<BeatPitchEvent> list = new List<BeatPitchEvent>(delayedPitchEvents);
			Debug.Log($"Fire {list.Count} PitchEvents");
			list.ForEach((BeatPitchEvent pitchEvent) =>
			{
				FirePitchEvent(pitchEvent, beatToAnalyze);
			});
			delayedPitchEvents.Clear();
		}
	}

	protected override BeatPitchEvent GetDummyPitchEvent(int beat)
	{
		return new BeatPitchEvent((GetNoteAtBeat(beat)?.MidiNote ?? 60) + offset, beat);
	}
}
