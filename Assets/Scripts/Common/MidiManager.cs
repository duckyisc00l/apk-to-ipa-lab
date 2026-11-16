using CSharpSynth.Midi;
using CSharpSynth.Sequencer;
using CSharpSynth.Synthesis;
using CircularBuffer;
using UniInject;
using UniRx;
using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class MidiManager : AbstractSingletonBehaviour, INeedInjection
{
	public static readonly int midiStreamSampleRateHz = 44100;

	[Range(0f, 2f)]
	public int midiInstrument;

	public float midiGain = 1f;

	private readonly string bankFilePath = "GM Bank - Piano/GM Bank - Piano";

	private readonly int bufferSize = 1024;

	[Range(0f, 127f)]
	private int midiVelocity;

	private int outputSampleRateHz;

	[Inject]
	private Settings settings;

	private float[] newSampleBuffer;

	private CircularBuffer<float> availableSamplesSynthesizerSampleRate;

	private CircularBuffer<float> availableSamplesOutputSampleRate;

	private MidiSequencer midiSequencer;

	private StreamSynthesizer midiStreamSynthesizer;

	[ReadOnly]
	public int audioFilterReadSampleRateHz;

	private int audioFilterReadSampleCounter;

	private float audioFilterReadSecondsCounter;

	private bool isInitialized;

	public static MidiManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<MidiManager>();

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void AwakeSingleton()
	{
		outputSampleRateHz = UnityEngine.AudioSettings.outputSampleRate;
	}

	protected override void StartSingleton()
	{
		midiVelocity = settings.SongEditorSettings.MidiVelocity;
		settings.SongEditorSettings.ObserveEveryValueChanged((SongEditorSettings it) => it.MidiVelocity).Subscribe((int newMidiVelocity) =>
		{
			midiVelocity = newMidiVelocity;
		}).AddTo(base.gameObject);
		midiGain = settings.SongEditorSettings.MidiGain;
		settings.SongEditorSettings.ObserveEveryValueChanged((SongEditorSettings it) => it.MidiGain).Subscribe((float newMidiGain) =>
		{
			midiGain = newMidiGain;
		}).AddTo(base.gameObject);
	}

	private void Update()
	{
		audioFilterReadSecondsCounter += Time.deltaTime;
		if (audioFilterReadSecondsCounter > 1f)
		{
			audioFilterReadSampleRateHz = (int)((double)audioFilterReadSampleCounter / (double)audioFilterReadSecondsCounter);
			audioFilterReadSecondsCounter = 0f;
			audioFilterReadSampleCounter = 0;
		}
	}

	public void InitIfNotDoneYet()
	{
		if (!isInitialized)
		{
			midiStreamSynthesizer = new StreamSynthesizer(midiStreamSampleRateHz, 1, bufferSize, 16, 1);
			newSampleBuffer = new float[midiStreamSynthesizer.BufferSize];
			availableSamplesSynthesizerSampleRate = new CircularBuffer<float>(midiStreamSampleRateHz / 10);
			availableSamplesOutputSampleRate = new CircularBuffer<float>(outputSampleRateHz / 10);
			midiStreamSynthesizer.LoadBank(bankFilePath);
			midiSequencer = new MidiSequencer(midiStreamSynthesizer);
			isInitialized = true;
		}
	}

	public void PlayMidiNote(int midiNote)
	{
		InitIfNotDoneYet();
		midiStreamSynthesizer.NoteOn(0, midiNote, midiVelocity, midiInstrument);
	}

	public void PlayMidiNoteForDuration(int midiNote, float durationInSeconds)
	{
		InitIfNotDoneYet();
		midiStreamSynthesizer.NoteOn(0, midiNote, midiVelocity, midiInstrument);
		StartCoroutine(CoroutineUtils.ExecuteAfterDelayInSeconds(durationInSeconds, () =>
		{
			StopMidiNote(midiNote);
		}));
	}

	public void StopMidiNote(int midiNote)
	{
		InitIfNotDoneYet();
		midiStreamSynthesizer.NoteOff(0, midiNote);
	}

	public void StopAllMidiNotes(bool immediate = true)
	{
		InitIfNotDoneYet();
		midiStreamSynthesizer.NoteOffAll(immediate);
	}

	public MidiFile LoadMidiFile(string path)
	{
		InitIfNotDoneYet();
		return midiSequencer.LoadMidiFromFile(path, UnloadUnusedInstruments: false);
	}

	private void OnAudioFilterRead(float[] data, int channels)
	{
		if (!isInitialized)
		{
			return;
		}
		audioFilterReadSampleCounter += data.Length / channels;
		int num = data.Length / channels;
		if (availableSamplesOutputSampleRate.Count < num)
		{
			FillAvailableSampleBuffers();
		}
		for (int i = 0; i < data.Length; i += channels)
		{
			float num2 = availableSamplesOutputSampleRate.Front() * midiGain;
			availableSamplesOutputSampleRate.PopFront();
			for (int j = 0; j < channels; j++)
			{
				data[i + j] = num2;
			}
		}
	}

	private void FillAvailableSampleBuffers()
	{
		SynthesizeMidiSamples();
		ReSampleAndFill(availableSamplesSynthesizerSampleRate, availableSamplesOutputSampleRate, midiStreamSampleRateHz, outputSampleRateHz, availableSamplesOutputSampleRate.Capacity / 2);
	}

	private void SynthesizeMidiSamples()
	{
		while (availableSamplesSynthesizerSampleRate.Count < availableSamplesSynthesizerSampleRate.Capacity / 2)
		{
			midiStreamSynthesizer.GetNext(newSampleBuffer);
			for (int i = 0; i < newSampleBuffer.Length; i++)
			{
				availableSamplesSynthesizerSampleRate.PushBack(newSampleBuffer[i]);
			}
		}
	}

	private void ReSampleAndFill(CircularBuffer<float> source, CircularBuffer<float> destination, int sourceSampleRate, int destinationSampleRate, int sampleCountToResample)
	{
		destination.PushBack(source[0]);
		float num = (float)(sourceSampleRate - 1) / (float)(destinationSampleRate - 1);
		int num2 = 0;
		for (int i = 1; i < sampleCountToResample; i++)
		{
			float num3 = (float)i * num;
			int num4 = (int)num3;
			float num5 = num3 - (float)num4;
			float num6 = source[num4 + 1] - source[num4];
			float item = source[num4] + num6 * num5;
			destination.PushBack(item);
			num2 = num4;
		}
		for (int j = 0; j < num2; j++)
		{
			source.PopFront();
		}
	}
}
