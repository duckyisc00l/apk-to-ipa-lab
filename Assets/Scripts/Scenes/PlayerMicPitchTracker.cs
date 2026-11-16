using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;

[RequireComponent(typeof(MicSampleRecorder))]
public class PlayerMicPitchTracker : MonoBehaviour, INeedInjection
{
	private const int SendPositionInSongIntervalInMillis = 2000;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private PlayerControl playerControl;

	[Inject]
	private PlayerProfile playerProfile;

	[Inject(Optional = true)]
	private MicProfile micProfile;

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	private MicSampleRecorder micSampleRecorder;

	[Inject]
	private Settings settings;

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	private int roundingDistance;

	private int recordingSentenceIndex;

	private List<Note> currentAndUpcomingNotesInRecordingSentence;

	private IAudioSamplesAnalyzer audioSamplesAnalyzer;

	private bool hasJoker;

	[ReadOnly]
	public int usedJokerCount;

	private readonly Subject<BeatAnalyzedEvent> beatAnalyzedEventStream = new Subject<BeatAnalyzedEvent>();

	private readonly Subject<NoteAnalyzedEvent> noteAnalyzedEventStream = new Subject<NoteAnalyzedEvent>();

	private readonly Subject<SentenceAnalyzedEvent> sentenceAnalyzedEventStream = new Subject<SentenceAnalyzedEvent>();

	private int lastAnalyzedBeatFromConnectedClient;

	private long lastUnixTimeMillisecondsWhenSentPositionInSongToClient = TimeUtils.GetUnixTimeMilliseconds();

	public int BeatToAnalyze { get; private set; }

	public Sentence RecordingSentence { get; private set; }

	public IObservable<BeatAnalyzedEvent> BeatAnalyzedEventStream => beatAnalyzedEventStream;

	public IObservable<NoteAnalyzedEvent> NoteAnalyzedEventStream => noteAnalyzedEventStream;

	public IObservable<SentenceAnalyzedEvent> SentenceAnalyzedEventStream => sentenceAnalyzedEventStream;

	private void Start()
	{
		SetRecordingSentence(recordingSentenceIndex);
		if (micProfile == null)
		{
			Debug.LogWarning("No mic for player " + playerProfile.Name + ". Not recording player notes.");
			base.gameObject.SetActive(value: false);
			return;
		}
		roundingDistance = playerProfile.Difficulty.GetRoundingDistance();
		micSampleRecorder.MicProfile = micProfile;
		if (micProfile.IsInputFromConnectedClient)
		{
			InitPitchDetectionFromConnectedClient();
			serverSideConnectRequestManager.ClientConnectedEventStream.Subscribe((ClientConnectionEvent evt) =>
			{
				if (evt.IsConnected)
				{
					InitPitchDetectionFromConnectedClient();
				}
			}).AddTo(base.gameObject);
		}
		else
		{
			InitPitchDetectionFromLocalMicrophone();
		}
		beatAnalyzedEventStream.Subscribe((BeatAnalyzedEvent evt) =>
		{
			OnBeatAnalyzed(evt);
		});
	}

	private void InitPitchDetectionFromLocalMicrophone()
	{
		micSampleRecorder.StartRecording();
		audioSamplesAnalyzer = AbstractMicPitchTracker.CreateAudioSamplesAnalyzer(settings.AudioSettings.pitchDetectionAlgorithm, micSampleRecorder.FinalSampleRate.Value);
	}

	private void InitPitchDetectionFromConnectedClient()
	{
		if (GetConnectedClientHandler() == null)
		{
			Debug.LogWarning("Did not find connected client handler for player " + playerProfile.Name + ". Not recording player notes.");
			base.gameObject.SetActive(value: false);
			return;
		}
		GetConnectedClientHandler().ReceivedMessageStream.ObserveOnMainThread().Subscribe((JsonSerializable dto) =>
		{
			if (dto is BeatPitchEventDto beatPitchEventDto)
			{
				HandlePitchEventFromConnectedClient(new BeatPitchEvent(beatPitchEventDto.MidiNote, beatPitchEventDto.Beat));
			}
		}).AddTo(base.gameObject);
		SendPositionInSongToClientRapidly();
	}

	private IConnectedClientHandler GetConnectedClientHandler()
	{
		if (micProfile == null || !micProfile.IsInputFromConnectedClient)
		{
			return null;
		}
		serverSideConnectRequestManager.TryGetConnectedClientHandler(micProfile.ConnectedClientId, out var connectedClientHandler);
		return connectedClientHandler;
	}

	private void Update()
	{
		if (micProfile != null)
		{
			if (micProfile.IsInputFromConnectedClient)
			{
				UpdatePitchDetectionFromConnectedClient();
			}
			else
			{
				UpdatePitchDetectionFromLocalMicrophone();
			}
		}
	}

	private void UpdatePitchDetectionFromLocalMicrophone()
	{
		if (RecordingSentence != null && !(BpmUtils.BeatToMillisecondsInSong(songMeta, BeatToAnalyze + 1) >= songAudioPlayer.PositionInSongInMillis - (double)micProfile.DelayInMillis))
		{
			PitchEvent pitchEventOfBeat = GetPitchEventOfBeat(BeatToAnalyze);
			Note note = (currentAndUpcomingNotesInRecordingSentence.IsNullOrEmpty() ? null : currentAndUpcomingNotesInRecordingSentence[0]);
			Note noteAtBeat = ((note.StartBeat <= BeatToAnalyze && BeatToAnalyze < note.EndBeat) ? note : null);
			FirePitchEvent(pitchEventOfBeat, BeatToAnalyze, noteAtBeat, RecordingSentence);
		}
	}

	private void UpdatePitchDetectionFromConnectedClient()
	{
		GetConnectedClientHandler()?.ReadMessagesFromClient();
		if (lastUnixTimeMillisecondsWhenSentPositionInSongToClient + 2000 < TimeUtils.GetUnixTimeMilliseconds())
		{
			SendPositionInSongToClient();
		}
	}

	private int ApplyJokerRule(PitchEvent pitchEvent, int roundedMidiNote, Note noteAtBeat)
	{
		if (noteAtBeat == null)
		{
			return roundedMidiNote;
		}
		if (pitchEvent != null && roundedMidiNote == noteAtBeat.MidiNote)
		{
			hasJoker = true;
		}
		if (pitchEvent == null)
		{
			hasJoker = false;
		}
		if (roundedMidiNote != noteAtBeat.MidiNote && hasJoker)
		{
			hasJoker = false;
			usedJokerCount++;
			return noteAtBeat.MidiNote;
		}
		return roundedMidiNote;
	}

	private void HandlePitchEventFromConnectedClient(BeatPitchEvent pitchEvent)
	{
		if (pitchEvent.Beat < 0 || pitchEvent.Beat < lastAnalyzedBeatFromConnectedClient)
		{
			Debug.LogWarning($"Received invalid beat from connected client: beat {pitchEvent.Beat}");
			if (lastUnixTimeMillisecondsWhenSentPositionInSongToClient + 200 < TimeUtils.GetUnixTimeMilliseconds())
			{
				SendPositionInSongToClient();
			}
			return;
		}
		int num = (int)BpmUtils.MillisecondInSongToBeat(songMeta, songAudioPlayer.PositionInSongInMillis);
		if (pitchEvent.Beat > num)
		{
			Debug.LogWarning($"Received future beat from connected client (received: {pitchEvent.Beat}, current: {num}).");
			return;
		}
		lastAnalyzedBeatFromConnectedClient = pitchEvent.Beat;
		FirePitchEventFromConnectedClient(pitchEvent);
	}

	public void SendPositionInSongToClientRapidly()
	{
		PlayerNoteRecorder component = GetComponent<PlayerNoteRecorder>();
		if (component != null && !component.isActiveAndEnabled)
		{
			return;
		}
		List<float> list = new List<float>();
		list.Add(0f);
		list.Add(0.1f);
		list.Add(0.2f);
		list.Add(0.3f);
		list.Add(0.4f);
		list.Add(0.5f);
		list.ForEach((float delayInSeconds) =>
		{
			StartCoroutine(CoroutineUtils.ExecuteAfterDelayInSeconds(delayInSeconds, () =>
			{
				SendPositionInSongToClient();
			}));
		});
	}

	private void SendPositionInSongToClient()
	{
		lastUnixTimeMillisecondsWhenSentPositionInSongToClient = TimeUtils.GetUnixTimeMilliseconds();
		if (micProfile != null && micProfile.IsInputFromConnectedClient)
		{
			IConnectedClientHandler connectedClientHandler = GetConnectedClientHandler();
			if (connectedClientHandler != null)
			{
				PositionInSongDto jsonSerializable = new PositionInSongDto
				{
					SongBpm = songMeta.Bpm,
					SongGap = songMeta.Gap,
					PositionInSongInMillis = songAudioPlayer.PositionInSongInMillisExact
				};
				Debug.Log("Send position in song to client " + micProfile.ConnectedClientId + ": " + jsonSerializable.ToJson());
				connectedClientHandler.SendMessageToClient(jsonSerializable);
			}
		}
	}

	private void FirePitchEventFromConnectedClient(BeatPitchEvent pitchEvent)
	{
		if (pitchEvent.Beat >= 0)
		{
			Sentence sentenceAtBeat = SongMetaUtils.GetSentenceAtBeat(playerControl.Voice, pitchEvent.Beat);
			Note noteAtBeat = SongMetaUtils.GetNoteAtBeat(sentenceAtBeat, pitchEvent.Beat, inclusiveStartBeat: true, inclusiveEndBeat: false);
			int midiNote = pitchEvent.MidiNote;
			if (midiNote < 0)
			{
				FirePitchEvent(null, pitchEvent.Beat, noteAtBeat, sentenceAtBeat);
			}
			else
			{
				FirePitchEvent(new PitchEvent(midiNote), pitchEvent.Beat, noteAtBeat, sentenceAtBeat);
			}
		}
	}

	public void FirePitchEvent(PitchEvent pitchEvent, int beat, Note noteAtBeat, Sentence sentenceAtBeat)
	{
		int recordedMidiNote = pitchEvent?.MidiNote ?? (-1);
		int roundedMidiNote = ((pitchEvent != null) ? GetRoundedMidiNoteForRecordedMidiNote(noteAtBeat, pitchEvent.MidiNote) : (-1));
		int roundedRecordedMidiNote = ApplyJokerRule(pitchEvent, roundedMidiNote, noteAtBeat);
		beatAnalyzedEventStream.OnNext(new BeatAnalyzedEvent(pitchEvent, beat, noteAtBeat, sentenceAtBeat, recordedMidiNote, roundedRecordedMidiNote));
	}

	private void OnBeatAnalyzed(BeatAnalyzedEvent beatAnalyzedEvent)
	{
		if (beatAnalyzedEvent == null || RecordingSentence == null)
		{
			return;
		}
		if (BeatToAnalyze <= beatAnalyzedEvent.Beat)
		{
			BeatToAnalyze = beatAnalyzedEvent.Beat + 1;
		}
		if (BeatToAnalyze > RecordingSentence.MaxBeat)
		{
			GoToNextRecordingSentence();
			return;
		}
		Note note = null;
		if (!currentAndUpcomingNotesInRecordingSentence.IsNullOrEmpty() && currentAndUpcomingNotesInRecordingSentence[0].EndBeat <= BeatToAnalyze)
		{
			note = currentAndUpcomingNotesInRecordingSentence[0];
			currentAndUpcomingNotesInRecordingSentence.RemoveAt(0);
		}
		if (note != null)
		{
			noteAnalyzedEventStream.OnNext(new NoteAnalyzedEvent(note));
		}
		if (!currentAndUpcomingNotesInRecordingSentence.IsNullOrEmpty())
		{
			Note note2 = currentAndUpcomingNotesInRecordingSentence[0];
			if (note2.StartBeat > BeatToAnalyze && !settings.GraphicSettings.analyzeBeatsWithoutTargetNote)
			{
				BeatToAnalyze = note2.StartBeat;
			}
		}
		else if (settings.GraphicSettings.analyzeBeatsWithoutTargetNote && BeatToAnalyze < RecordingSentence.MaxBeat)
		{
			BeatToAnalyze++;
		}
		else
		{
			GoToNextRecordingSentence();
		}
	}

	private void GoToNextRecordingSentence()
	{
		Sentence sentence = playerControl.GetSentence(recordingSentenceIndex + 1);
		sentenceAnalyzedEventStream.OnNext(new SentenceAnalyzedEvent(RecordingSentence, sentence == null));
		recordingSentenceIndex++;
		SetRecordingSentence(recordingSentenceIndex);
	}

	private int GetMicSampleBufferIndexForBeat(int beat)
	{
		double num = BpmUtils.BeatToMillisecondsInSong(songMeta, beat);
		int num2 = Convert.ToInt32((songAudioPlayer.PositionInSongInMillis - num - (double)micProfile.DelayInMillis) / 1000.0 * (double)micSampleRecorder.FinalSampleRate.Value);
		return NumberUtils.Limit(micSampleRecorder.MicSamples.Length - num2, 0, micSampleRecorder.MicSamples.Length - 1);
	}

	private void SetRecordingSentence(int sentenceIndex)
	{
		RecordingSentence = playerControl.GetSentence(sentenceIndex);
		if (RecordingSentence == null)
		{
			currentAndUpcomingNotesInRecordingSentence = new List<Note>();
			BeatToAnalyze = 0;
		}
		else
		{
			currentAndUpcomingNotesInRecordingSentence = SongMetaUtils.GetSortedNotes(RecordingSentence);
			BeatToAnalyze = RecordingSentence.MinBeat;
		}
	}

	private void OnDisable()
	{
		if (micProfile != null)
		{
			micSampleRecorder.StopRecording();
		}
	}

	private int GetRoundedMidiNoteForRecordedMidiNote(Note targetNote, int recordedMidiNote)
	{
		if (targetNote == null)
		{
			return recordedMidiNote;
		}
		if (targetNote.Type == ENoteType.Rap || targetNote.Type == ENoteType.RapGolden)
		{
			return targetNote.MidiNote;
		}
		if (recordedMidiNote < 36 || recordedMidiNote > 84)
		{
			return targetNote.MidiNote;
		}
		return GetRoundedMidiNote(recordedMidiNote, targetNote.MidiNote, roundingDistance);
	}

	private int GetRoundedMidiNote(int recordedMidiNote, int targetMidiNote, int roundingDistance)
	{
		if (MidiUtils.GetRelativePitchDistance(recordedMidiNote, targetMidiNote) <= roundingDistance)
		{
			return targetMidiNote;
		}
		return recordedMidiNote;
	}

	public void SkipToBeat(double currentBeat)
	{
		RecordingSentence = playerControl.SortedSentences.FirstOrDefault((Sentence sentence) => currentBeat <= (double)sentence.MaxBeat);
		if (RecordingSentence != null)
		{
			recordingSentenceIndex = playerControl.SortedSentences.IndexOf(RecordingSentence);
			currentAndUpcomingNotesInRecordingSentence = (from note in RecordingSentence.Notes
				where currentBeat <= (double)note.EndBeat
				orderby note.StartBeat
				select note).ToList();
			if (currentAndUpcomingNotesInRecordingSentence.Count > 0)
			{
				if ((double)currentAndUpcomingNotesInRecordingSentence[0].StartBeat < currentBeat)
				{
					BeatToAnalyze = (int)currentBeat;
				}
				else
				{
					BeatToAnalyze = currentAndUpcomingNotesInRecordingSentence[0].StartBeat;
				}
			}
			else
			{
				BeatToAnalyze = RecordingSentence.MaxBeat;
			}
		}
		if (micProfile != null && micProfile.IsInputFromConnectedClient)
		{
			SendPositionInSongToClientRapidly();
		}
	}

	public PitchEvent GetPitchEventOfSamples(int startSampleBufferIndex, int endSampleBufferIndex)
	{
		if (startSampleBufferIndex > endSampleBufferIndex)
		{
			ObjectUtils.Swap(ref startSampleBufferIndex, ref endSampleBufferIndex);
		}
		startSampleBufferIndex = NumberUtils.Limit(startSampleBufferIndex, 0, micSampleRecorder.MicSamples.Length - 1);
		endSampleBufferIndex = NumberUtils.Limit(endSampleBufferIndex, 0, micSampleRecorder.MicSamples.Length - 1);
		return audioSamplesAnalyzer.ProcessAudioSamples(micSampleRecorder.MicSamples, startSampleBufferIndex, endSampleBufferIndex, micProfile.AmplificationMultiplier, micProfile.NoiseSuppression);
	}

	public PitchEvent GetPitchEventOfBeat(int beat)
	{
		int micSampleBufferIndexForBeat = GetMicSampleBufferIndexForBeat(beat);
		int micSampleBufferIndexForBeat2 = GetMicSampleBufferIndexForBeat(beat + 1);
		return GetPitchEventOfSamples(micSampleBufferIndexForBeat, micSampleBufferIndexForBeat2);
	}

	public void SendMicProfileToConnectedClient()
	{
		GetConnectedClientHandler()?.SendMessageToClient(new MicProfileMessageDto(micProfile));
	}

	public void SendStopRecordingMessageToConnectedClient()
	{
		GetConnectedClientHandler()?.SendMessageToClient(new StopRecordingMessageDto());
	}

	public void SendStartRecordingMessageToConnectedClient()
	{
		GetConnectedClientHandler()?.SendMessageToClient(new StartRecordingMessageDto());
		SendPositionInSongToClientRapidly();
	}
}
