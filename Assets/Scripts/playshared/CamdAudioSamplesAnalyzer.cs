using System;
using CircularBuffer;

public class CamdAudioSamplesAnalyzer : AbstractAudioSamplesAnalyzer
{
	private class CamdPitchCandidate
	{
		public int halftone = -1;

		public float error = -1f;

		public float normalizedError = -1f;

		public float normalizedErrorWithBias = -1f;

		public CamdPitchCandidate()
		{
		}

		public CamdPitchCandidate(CamdPitchCandidate other)
		{
			CopyValues(other);
		}

		public void Reset()
		{
			halftone = -1;
			error = -1f;
			normalizedError = -1f;
			normalizedErrorWithBias = -1f;
		}

		public void CopyValues(CamdPitchCandidate other)
		{
			halftone = other.halftone;
			error = other.error;
			normalizedError = other.normalizedError;
			normalizedErrorWithBias = other.normalizedErrorWithBias;
		}

		public override string ToString()
		{
			return $"(halftone:{halftone};error:{error};normalizedError:{normalizedError})";
		}
	}

	private const int NumHalftones = 61;

	private const int MinNote = 30;

	private const int MinSampleLength = 256;

	private readonly int maxSampleLength;

	private readonly int[] halftoneDelays;

	private readonly float[] correlation = new float[61];

	private readonly CamdPitchCandidate[] currentCandidates = new CamdPitchCandidate[3];

	private readonly CircularBuffer<CamdPitchCandidate> candidateHistory = new CircularBuffer<CamdPitchCandidate>(2);

	private CamdPitchCandidate bestCandidate;

	private CamdPitchCandidate bestCurrentCandidate;

	public float HalftoneContinuationBias { get; set; }

	public CamdAudioSamplesAnalyzer(int sampleRateHz, int maxSampleLength)
	{
		this.maxSampleLength = maxSampleLength;
		float[] halftoneFrequencies = MidiUtils.PrecalculateHalftoneFrequencies(30, 61);
		halftoneDelays = MidiUtils.PrecalculateHalftoneDelays(sampleRateHz, halftoneFrequencies);
		for (int i = 0; i < currentCandidates.Length; i++)
		{
			currentCandidates[i] = new CamdPitchCandidate();
		}
	}

	public override PitchEvent ProcessAudioSamples(float[] sampleBuffer, int startIndexInclusive, int endIndexExclusive, int amplificationMultiplier, int noiseSuppression)
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
		AbstractAudioSamplesAnalyzer.ApplyAmplification(sampleBuffer, startIndexInclusive, startIndexInclusive + num2, amplificationMultiplier);
		if (!AbstractAudioSamplesAnalyzer.IsAboveNoiseSuppressionThreshold(sampleBuffer, startIndexInclusive, startIndexInclusive + num2, noiseSuppression))
		{
			OnNoPitchDetected();
			return null;
		}
		CircularAverageMagnitudeDifference(sampleBuffer, startIndexInclusive, num2, correlation);
		FindCurrentCandidates(correlation, currentCandidates);
		CalculateNormalizedError(currentCandidates, candidateHistory);
		FindBestCandidate(currentCandidates, candidateHistory);
		int num3 = bestCandidate.halftone + 30;
		if (num3 < 36 || num3 > 84)
		{
			return new PitchEvent(num3);
		}
		int num4 = bestCurrentCandidate.halftone + 30;
		if (36 < num4 && num4 < 84)
		{
			candidateHistory.PushFront(new CamdPitchCandidate(bestCurrentCandidate));
		}
		return new PitchEvent(num3);
	}

	private void FindBestCandidate(CamdPitchCandidate[] currentCandidates, CircularBuffer<CamdPitchCandidate> bestCandidateHistory)
	{
		bestCurrentCandidate = null;
		currentCandidates.ForEach((CamdPitchCandidate currentCandidate) =>
		{
			currentCandidate.normalizedErrorWithBias = currentCandidate.normalizedError;
			if (HalftoneContinuationBias >= 0f && HalftoneContinuationBias <= 1f)
			{
				for (int i = 0; i < bestCandidateHistory.Count; i++)
				{
					if (bestCandidateHistory[i].halftone == currentCandidate.halftone)
					{
						float num2 = HalftoneContinuationBias - HalftoneContinuationBias * (float)(i / bestCandidateHistory.Count);
						currentCandidate.normalizedErrorWithBias = currentCandidate.normalizedError * (1f - num2);
						break;
					}
				}
			}
			if (currentCandidate.halftone >= 0 && (bestCurrentCandidate == null || bestCurrentCandidate.halftone < 0 || currentCandidate.normalizedErrorWithBias < bestCurrentCandidate.normalizedErrorWithBias))
			{
				bestCurrentCandidate = currentCandidate;
			}
		});
		CamdPitchCandidate camdPitchCandidate = null;
		for (int num = 0; num < bestCandidateHistory.Count; num++)
		{
			CamdPitchCandidate camdPitchCandidate2 = bestCandidateHistory[num];
			if (camdPitchCandidate2.halftone >= 0 && (camdPitchCandidate == null || camdPitchCandidate.halftone < 0 || camdPitchCandidate2.normalizedError < camdPitchCandidate.normalizedError))
			{
				camdPitchCandidate = camdPitchCandidate2;
			}
		}
		bestCandidate = ((camdPitchCandidate == null || bestCurrentCandidate.normalizedErrorWithBias < camdPitchCandidate.normalizedError) ? bestCurrentCandidate : camdPitchCandidate);
	}

	private void CalculateNormalizedError(CamdPitchCandidate[] currentCandidates, CircularBuffer<CamdPitchCandidate> bestCandidateHistory)
	{
		float errorSum = 0f;
		currentCandidates.ForEach((CamdPitchCandidate candidate) =>
		{
			errorSum += candidate.error;
		});
		bestCandidateHistory.ForEach((CamdPitchCandidate candidate) =>
		{
			errorSum += candidate.error;
		});
		currentCandidates.ForEach((CamdPitchCandidate candidate) =>
		{
			candidate.normalizedError = candidate.error / errorSum;
		});
		bestCandidateHistory.ForEach((CamdPitchCandidate candidate) =>
		{
			candidate.normalizedError = candidate.error / errorSum;
		});
	}

	private void FindCurrentCandidates(float[] correlation, CamdPitchCandidate[] candidates)
	{
		for (int i = 0; i < candidates.Length; i++)
		{
			candidates[i].halftone = 0;
			candidates[i].error = correlation[0];
		}
		for (int j = 1; j < 61; j++)
		{
			for (int k = 0; k < candidates.Length; k++)
			{
				if (candidates[k].error > correlation[j])
				{
					candidates[k].halftone = j;
					candidates[k].error = correlation[j];
					break;
				}
			}
		}
	}

	private void CircularAverageMagnitudeDifference(float[] sampleBuffer, int sampleStartIndex, int sampleCountToUse, float[] correlation)
	{
		for (int i = 0; i < 61; i++)
		{
			correlation[i] = 0f;
			for (int j = 0; j < sampleCountToUse; j++)
			{
				float num = sampleBuffer[sampleStartIndex + ((j + halftoneDelays[i]) & (sampleCountToUse - 1))] - sampleBuffer[sampleStartIndex + j];
				correlation[i] += ((num < 0f) ? (0f - num) : num);
			}
		}
	}

	private void OnNoPitchDetected()
	{
		candidateHistory.Clear();
	}
}
