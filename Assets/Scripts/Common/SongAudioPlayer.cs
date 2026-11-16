using System;
using UniInject;
using UniRx;
using UnityEngine;

public class SongAudioPlayer : MonoBehaviour, INeedInjection
{
	private const int MinForwardJumpOffsetInMillis = 500;

	[InjectedInInspector]
	public AudioSource audioPlayer;

	private int positionInSongInMillisFrame;

	private readonly Subject<double> playbackStoppedEventStream = new Subject<double>();

	private readonly Subject<double> playbackStartedEventStream = new Subject<double>();

	private readonly Subject<double> positionInSongEventStream = new Subject<double>();

	private readonly Subject<AudioClip> audioClipLoadedEventStream = new Subject<AudioClip>();

	private double positionInSongInMillis;

	[Inject]
	private AudioManager audioManager;

	public IObservable<double> PlaybackStoppedEventStream => playbackStoppedEventStream;

	public IObservable<double> PlaybackStartedEventStream => playbackStartedEventStream;

	public IObservable<double> PositionInSongEventStream => positionInSongEventStream;

	public IObservable<AudioClip> AudioClipLoadedEventStream => audioClipLoadedEventStream;

	public IObservable<Pair<double>> JumpBackInSongEventStream => from pair in positionInSongEventStream.Pairwise()
		where pair.Previous > pair.Current
		select pair;

	public IObservable<Pair<double>> JumpForwardInSongEventStream => from pair in positionInSongEventStream.Pairwise()
		where pair.Previous + 500.0 < pair.Current || (!IsPlaying && pair.Previous < pair.Current)
		select pair;

	public double PositionInSongInMillis
	{
		get
		{
			if (audioPlayer == null || audioPlayer.clip == null)
			{
				return 0.0;
			}
			if (positionInSongInMillisFrame != Time.frameCount)
			{
				positionInSongInMillisFrame = Time.frameCount;
				positionInSongInMillis = PositionInSongInMillisExact;
			}
			return positionInSongInMillis;
		}
		set
		{
			if (!(DurationOfSongInMillis <= 0.0))
			{
				double num = value;
				if (num < 0.0)
				{
					num = 0.0;
				}
				else if (num > DurationOfSongInMillis - 1.0)
				{
					num = DurationOfSongInMillis - 1.0;
				}
				positionInSongInMillis = num;
				int timeSamples = (int)((double)audioPlayer.clip.frequency * positionInSongInMillis / 1000.0);
				audioPlayer.timeSamples = timeSamples;
				positionInSongEventStream.OnNext(positionInSongInMillis);
			}
		}
	}

	public double PositionInSongInMillisExact => 1000.0 * (double)audioPlayer.timeSamples / (double)audioPlayer.clip.frequency;

	public double DurationOfSongInMillis { get; private set; }

	public double PositionInSongInPercent
	{
		get
		{
			if (DurationOfSongInMillis <= 0.0)
			{
				return 0.0;
			}
			return PositionInSongInMillis / DurationOfSongInMillis;
		}
	}

	public bool IsPlaying => audioPlayer.isPlaying;

	public AudioClip AudioClip => audioPlayer.clip;

	public bool HasAudioClip => audioPlayer.clip != null;

	private SongMeta SongMeta { get; set; }

	public float PlaybackSpeed
	{
		get
		{
			return audioPlayer.pitch;
		}
		set
		{
			float num = value;
			if (num < 0.5f)
			{
				num = 0.5f;
			}
			else if (num > 1.5f)
			{
				num = 1.5f;
			}
			audioPlayer.pitch = num;
			audioPlayer.outputAudioMixerGroup.audioMixer.SetFloat("PitchShifter.Pitch", 1f + (1f - num));
		}
	}

	private void Update()
	{
		if (IsPlaying)
		{
			positionInSongEventStream.OnNext(PositionInSongInMillis);
		}
	}

	public void Init(SongMeta songMeta)
	{
		if (!base.gameObject.activeInHierarchy)
		{
			return;
		}
		string audioUri = SongMetaUtils.GetAudioUri(songMeta);
		if (!SongMetaUtils.AudioResourceExists(songMeta))
		{
			Debug.Log("Audio file resource does not exist " + songMeta.Mp3);
			return;
		}
		SongMeta = songMeta;
		AudioClip audioClip = audioManager.LoadAudioClipFromUri(audioUri);
		if (audioClip != null)
		{
			audioPlayer.clip = audioClip;
			DurationOfSongInMillis = 1000.0 * (double)audioClip.samples / (double)audioClip.frequency;
			audioClipLoadedEventStream.OnNext(audioClip);
		}
		else
		{
			audioPlayer.clip = null;
			DurationOfSongInMillis = 0.0;
		}
	}

	public void ReloadAudio()
	{
		Init(SongMeta);
	}

	public void PauseAudio()
	{
		if (audioPlayer.isPlaying)
		{
			audioPlayer.Pause();
			playbackStoppedEventStream.OnNext(PositionInSongInMillis);
		}
	}

	public void PlayAudio()
	{
		if (HasAudioClip && !audioPlayer.isPlaying)
		{
			audioPlayer.Play();
			playbackStartedEventStream.OnNext(PositionInSongInMillis);
		}
	}

	public double GetCurrentBeat(bool allowNegativeResult)
	{
		if (audioPlayer.clip == null)
		{
			return 0.0;
		}
		double millisInSong = PositionInSongInMillis;
		double num = BpmUtils.MillisecondInSongToBeat(SongMeta, millisInSong);
		if (num < 0.0 && !allowNegativeResult)
		{
			num = 0.0;
		}
		return num;
	}
}
