using System;
using UnityEngine;

public class DywaAudioSamplesAnalyzer : AbstractAudioSamplesAnalyzer
{
	private const int MinSampleLength = 256;

	private readonly int maxSampleLength;

	private readonly DywaPitchTracker dywaPitchTracker;

	private readonly float[] halftoneFrequencies;

	public DywaAudioSamplesAnalyzer(int sampleRateHz, int maxSampleLength)
	{
		this.maxSampleLength = maxSampleLength;
		halftoneFrequencies = MidiUtils.PrecalculateHalftoneFrequencies(36, 49);
		dywaPitchTracker = new DywaPitchTracker();
		dywaPitchTracker.SampleRateHz = sampleRateHz;
	}

	public override PitchEvent ProcessAudioSamples(float[] sampleBuffer, int startIndexInclusive, int endIndexExclusive, int amplificationFactor, int noiseSuppressionFactor)
	{
		int num = endIndexExclusive - startIndexInclusive;
		if (num < 256)
		{
			return null;
		}
		int num2 = AbstractAudioSamplesAnalyzer.PreviousPowerOfTwo(num);
		if (num2 > maxSampleLength)
		{
			num2 = AbstractAudioSamplesAnalyzer.PreviousPowerOfTwo(maxSampleLength);
		}
		if (!base.ModifySamplesInPlace)
		{
			float[] array = new float[sampleBuffer.Length];
			Array.Copy(sampleBuffer, array, sampleBuffer.Length);
			sampleBuffer = array;
		}
		AbstractAudioSamplesAnalyzer.ApplyAmplification(sampleBuffer, startIndexInclusive, startIndexInclusive + num2, amplificationFactor);
		if (!AbstractAudioSamplesAnalyzer.IsAboveNoiseSuppressionThreshold(sampleBuffer, startIndexInclusive, startIndexInclusive + num2, noiseSuppressionFactor))
		{
			dywaPitchTracker.ClearPitchHistory();
			return null;
		}
		float num3 = dywaPitchTracker.ComputePitch(sampleBuffer, startIndexInclusive, num2);
		if (num3 <= 0f)
		{
			dywaPitchTracker.ClearPitchHistory();
			return null;
		}
		return new PitchEvent(GetMidiNoteForFrequency(num3));
	}

	private int GetMidiNoteForFrequency(float frequency)
	{
		int num = -1;
		float num2 = float.MaxValue;
		for (int i = 0; i < halftoneFrequencies.Length; i++)
		{
			float num3 = Mathf.Abs(halftoneFrequencies[i] - frequency);
			if (num3 < num2)
			{
				num2 = num3;
				num = i;
			}
		}
		return 36 + num;
	}
}
