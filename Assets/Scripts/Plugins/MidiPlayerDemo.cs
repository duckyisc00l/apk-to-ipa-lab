using CSharpSynth.Sequencer;
using CSharpSynth.Synthesis;
using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class MidiPlayerDemo : MonoBehaviour
{
	public string midiFilePath = "Midis/Groove.mid";

	public bool ShouldPlayFile = true;

	public string bankFilePath = "GM Bank/gm";

	public int bufferSize = 1024;

	public int midiNote = 60;

	public int midiNoteVolume = 100;

	[Range(0f, 127f)]
	public int midiInstrument;

	private float[] sampleBuffer;

	private float gain = 1f;

	private MidiSequencer midiSequencer;

	private StreamSynthesizer midiStreamSynthesizer;

	private float sliderValue = 1f;

	private float maxSliderValue = 127f;

	private void Awake()
	{
		midiStreamSynthesizer = new StreamSynthesizer(44100, 2, bufferSize, 40, 1);
		sampleBuffer = new float[midiStreamSynthesizer.BufferSize];
		midiStreamSynthesizer.LoadBank(bankFilePath);
		midiSequencer = new MidiSequencer(midiStreamSynthesizer);
	}

	private void LoadSong(string midiPath)
	{
		midiSequencer.LoadMidiFromTextAsset(midiPath, UnloadUnusedInstruments: false);
		midiSequencer.Play();
	}

	private void Start()
	{
	}

	private void Update()
	{
		if (!midiSequencer.isPlaying)
		{
			if (ShouldPlayFile)
			{
				LoadSong(midiFilePath);
			}
		}
		else if (!ShouldPlayFile)
		{
			midiSequencer.Stop(immediate: true);
		}
		if (Input.GetButtonDown("Fire1"))
		{
			midiStreamSynthesizer.NoteOn(0, midiNote, midiNoteVolume, midiInstrument);
		}
		if (Input.GetButtonUp("Fire1"))
		{
			midiStreamSynthesizer.NoteOff(0, midiNote);
		}
	}

	private void OnAudioFilterRead(float[] data, int channels)
	{
		midiStreamSynthesizer.GetNext(sampleBuffer);
		for (int i = 0; i < data.Length; i++)
		{
			data[i] = sampleBuffer[i] * gain;
		}
	}

	public void MidiNoteOnHandler(int channel, int note, int velocity)
	{
		Debug.Log("NoteOn: " + note + " Velocity: " + velocity);
	}

	public void MidiNoteOffHandler(int channel, int note)
	{
		Debug.Log("NoteOff: " + note);
	}
}
