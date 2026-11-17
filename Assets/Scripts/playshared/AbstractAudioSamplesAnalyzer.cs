using System;

public abstract class AbstractAudioSamplesAnalyzer : IAudioSamplesAnalyzer
{
	public bool ModifySamplesInPlace { get; set; } = true;

	public abstract PitchEvent ProcessAudioSamples(float[] sampleBuffer, int startIndexInclusive, int endIndexExclusive, int amplificationFactor, int noiseSuppressionFactor);

	public static void ApplyAmplification(float[] sampleBuffer, int fromIndexInclusive, int toIndexExclusive, int amplificationFactor)
	{
		if (amplificationFactor != 1)
		{
			for (int i = fromIndexInclusive; i < sampleBuffer.Length && i < toIndexExclusive; i++)
			{
				sampleBuffer[i] *= amplificationFactor;
			}
		}
	}

	public static bool IsAboveNoiseSuppressionThreshold(float[] sampleBuffer, int startIndexInclusive, int endIndexExclusive, int noiseSuppressionPercent)
	{
		if (noiseSuppressionPercent == 0)
		{
			return true;
		}
		float num = (float)noiseSuppressionPercent / 100f;
		for (int i = startIndexInclusive; i < endIndexExclusive; i++)
		{
			if (Math.Abs(sampleBuffer[i]) >= num)
			{
				return true;
			}
		}
		return false;
	}

	protected static int PreviousPowerOfTwo(int x)
	{
		x |= x >> 1;
		x |= x >> 2;
		x |= x >> 4;
		x |= x >> 8;
		x |= x >> 16;
		return x - (x >> 1);
	}
}
