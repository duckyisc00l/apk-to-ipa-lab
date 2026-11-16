using UniInject;
using UnityEngine;

public abstract class AbstractDummySinger : MonoBehaviour, INeedInjection
{
	public int playerIndexToSimulate;

	protected PlayerControl playerControl;

	[Inject]
	protected SingSceneControl singSceneControl;

	[Inject]
	protected SongMeta songMeta;

	private void Awake()
	{
		if (!Application.isEditor)
		{
			base.gameObject.SetActive(value: false);
		}
	}

	protected abstract BeatPitchEvent GetDummyPitchEvent(int beat);

	protected virtual void Update()
	{
		if (!(playerControl == null) || TryFindPlayerControl())
		{
			int num = (int)singSceneControl.CurrentBeat;
			int beatToAnalyze = playerControl.PlayerMicPitchTracker.BeatToAnalyze;
			if (num > 0 && beatToAnalyze <= num && playerControl.PlayerMicPitchTracker.RecordingSentence != null)
			{
				BeatPitchEvent dummyPitchEvent = GetDummyPitchEvent(beatToAnalyze);
				FirePitchEvent(dummyPitchEvent, beatToAnalyze);
			}
		}
	}

	protected void FirePitchEvent(BeatPitchEvent pitchEvent, int fallbackBeat)
	{
		int beat = pitchEvent?.Beat ?? fallbackBeat;
		Sentence sentenceAtBeat = SongMetaUtils.GetSentenceAtBeat(playerControl.Voice, beat);
		Note noteAtBeat = SongMetaUtils.GetNoteAtBeat(sentenceAtBeat, beat);
		playerControl.PlayerMicPitchTracker.FirePitchEvent(pitchEvent, beat, noteAtBeat, sentenceAtBeat);
	}

	protected bool TryFindPlayerControl()
	{
		if (singSceneControl.PlayerControls.IsNullOrEmpty() || playerIndexToSimulate >= singSceneControl.PlayerControls.Count)
		{
			return false;
		}
		playerControl = singSceneControl.PlayerControls[playerIndexToSimulate];
		return true;
	}

	public void SetPlayerControl(PlayerControl playerControl)
	{
		this.playerControl = playerControl;
		playerControl.MicSampleRecorder.enabled = false;
	}

	protected Sentence GetSentenceAtBeat(int beat)
	{
		return SongMetaUtils.GetSentenceAtBeat(playerControl.Voice, beat);
	}

	protected Note GetNoteAtBeat(int beat)
	{
		return SongMetaUtils.GetNoteAtBeat(GetSentenceAtBeat(beat), beat);
	}
}
