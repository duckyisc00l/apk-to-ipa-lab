public class DywaPitchTracker
{
	private float prevPitch;

	private int pitchConfidence;

	public int MaxFlwtLevels { get; set; } = 6;

	public float MaxFrequency { get; set; } = 3000f;

	public int DifferenceLevelsN { get; set; } = 3;

	public float MaximaThresholdRatio { get; set; } = 0.75f;

	public int SampleRateHz { get; set; } = 44100;

	public DywaPitchTracker()
	{
		ClearPitchHistory();
	}

	public float ComputePitch(float[] samples, int startsample, int samplecount)
	{
		float num = ComputeWaveletPitch(samples, startsample, samplecount);
		if (SampleRateHz != 44100)
		{
			num *= (float)SampleRateHz / 44100f;
		}
		return DynamicPostProcessing(num);
	}

	public void ClearPitchHistory()
	{
		prevPitch = -1f;
		pitchConfidence = -1;
	}

	public int NeededSampleCount(int minFreq)
	{
		int value = 132300 / minFreq;
		return CeilPowerOf2(value);
	}

	private float FloatAbs(float a)
	{
		if (!(a < 0f))
		{
			return a;
		}
		return 0f - a;
	}

	private int IsPowerOf2(int value)
	{
		switch (value)
		{
		case 0:
			return 1;
		case 2:
			return 1;
		default:
			if ((value & 1) != 0)
			{
				return 0;
			}
			return IsPowerOf2(value >> 1);
		}
	}

	private int Bitcount(int value)
	{
		return value switch
		{
			0 => 0, 
			1 => 1, 
			2 => 2, 
			_ => Bitcount(value >> 1) + 1, 
		};
	}

	private int CeilPowerOf2(int value)
	{
		if (IsPowerOf2(value) != 0)
		{
			return value;
		}
		if (value == 1)
		{
			return 2;
		}
		int num = Bitcount(value);
		int num2 = 1;
		for (int i = 0; i < num; i++)
		{
			num2 <<= 1;
		}
		return num2;
	}

	private int FloorPowerOf2(int value)
	{
		if (IsPowerOf2(value) != 0)
		{
			return value;
		}
		return CeilPowerOf2(value) / 2;
	}

	private int IntMax(int a, int b)
	{
		if (a <= b)
		{
			return b;
		}
		return a;
	}

	private int IntMin(int a, int b)
	{
		if (a >= b)
		{
			return b;
		}
		return a;
	}

	private int IntAbs(int x)
	{
		if (x >= 0)
		{
			return x;
		}
		return -x;
	}

	private int PowerOf2(int n)
	{
		int num = 1;
		for (int i = 0; i < n; i++)
		{
			num <<= 1;
		}
		return num;
	}

	private float ComputeWaveletPitch(float[] samples, int startsample, int samplecount)
	{
		float result = 0f;
		samplecount = FloorPowerOf2(samplecount);
		float[] array = new float[samplecount];
		for (int i = 0; i < samplecount; i++)
		{
			array[i] = samples[i + startsample];
		}
		int num = samplecount;
		int[] array2 = new int[samplecount];
		int[] array3 = new int[samplecount];
		int[] array4 = new int[samplecount];
		float num2 = 0f;
		float num3 = float.MinValue;
		float num4 = float.MaxValue;
		for (int j = 0; j < samplecount; j++)
		{
			float num5 = array[j];
			num2 += num5;
			if (num5 > num3)
			{
				num3 = num5;
			}
			if (num5 < num4)
			{
				num4 = num5;
			}
		}
		num2 /= (float)samplecount;
		num3 -= num2;
		num4 -= num2;
		float num6 = ((num3 > 0f - num4) ? num3 : (0f - num4)) * MaximaThresholdRatio;
		int num7 = 0;
		float num8 = -1f;
		while (true)
		{
			int num9 = (int)(44100f / ((float)PowerOf2(num7) * MaxFrequency));
			if (num < 2)
			{
				break;
			}
			float num10 = -1000f;
			int num12;
			int num11 = (num12 = 0);
			int num13 = -1000000;
			int num14 = -1000000;
			int num15 = 0;
			int num16 = 0;
			for (int k = 1; k < num; k++)
			{
				float num5 = array[k] - num2;
				float num17 = array[k - 1] - num2;
				if (num17 <= 0f && num5 > 0f)
				{
					num15 = 1;
					num16 = 0;
				}
				if (num17 >= 0f && num5 < 0f)
				{
					num16 = 1;
					num15 = 0;
				}
				float num18 = num5 - num17;
				if (num10 > -1000f)
				{
					if (num16 != 0 && num10 < 0f && num18 >= 0f && FloatAbs(num17) >= num6 && k - 1 > num13 + num9)
					{
						array3[num11++] = k - 1;
						num13 = k - 1;
						num16 = 0;
					}
					if (num15 != 0 && num10 > 0f && num18 <= 0f && FloatAbs(num17) >= num6 && k - 1 > num14 + num9)
					{
						array4[num12++] = k - 1;
						num14 = k - 1;
						num15 = 0;
					}
				}
				num10 = num18;
			}
			if (num11 == 0 && num12 == 0)
			{
				break;
			}
			for (int l = 0; l < array2.Length; l++)
			{
				array2[l] = 0;
			}
			for (int m = 0; m < num11; m++)
			{
				for (int n = 1; n < DifferenceLevelsN; n++)
				{
					if (m + n < num11)
					{
						int num19 = IntAbs(array3[m] - array3[m + n]);
						array2[num19]++;
					}
				}
			}
			for (int num20 = 0; num20 < num12; num20++)
			{
				for (int num21 = 1; num21 < DifferenceLevelsN; num21++)
				{
					if (num20 + num21 < num12)
					{
						int num19 = IntAbs(array4[num20] - array4[num20 + num21]);
						array2[num19]++;
					}
				}
			}
			int num22 = -1;
			int num23 = -1;
			for (int num24 = 0; num24 < num; num24++)
			{
				int num25 = 0;
				for (int num26 = -num9; num26 <= num9; num26++)
				{
					if (num24 + num26 >= 0 && num24 + num26 < num)
					{
						num25 += array2[num24 + num26];
					}
				}
				if (num25 == num23)
				{
					if (num24 == 2 * num22)
					{
						num22 = num24;
					}
				}
				else if (num25 > num23)
				{
					num23 = num25;
					num22 = num24;
				}
			}
			float num27 = 0f;
			float num28 = 0f;
			for (int num29 = -num9; num29 <= num9; num29++)
			{
				if (num22 + num29 >= 0 && num22 + num29 < samplecount)
				{
					int num30 = array2[num22 + num29];
					if (num30 > 0)
					{
						num28 += (float)num30;
						num27 += (float)((num22 + num29) * num30);
					}
				}
			}
			num27 /= num28;
			if (num8 > -1f && FloatAbs(num27 * 2f - num8) <= (float)(2 * num9))
			{
				result = 44100f / ((float)PowerOf2(num7 - 1) * num8);
				break;
			}
			num8 = num27;
			num7++;
			if (num7 >= MaxFlwtLevels || num < 2)
			{
				break;
			}
			for (int num31 = 0; num31 < num / 2; num31++)
			{
				array[num31] = (array[2 * num31] + array[2 * num31 + 1]) / 2f;
			}
			num /= 2;
		}
		return result;
	}

	private float DynamicPostProcessing(float pitch)
	{
		if (pitch == 0f)
		{
			pitch = -1f;
		}
		float num = -1f;
		float num2 = 0.2f;
		int num3 = 5;
		if (pitch != -1f)
		{
			if (prevPitch == -1f)
			{
				num = pitch;
				prevPitch = pitch;
				pitchConfidence = 1;
			}
			else if (FloatAbs(prevPitch - pitch) / pitch < num2)
			{
				prevPitch = pitch;
				num = pitch;
				pitchConfidence = IntMin(num3, pitchConfidence + 1);
			}
			else if (pitchConfidence >= num3 - 2 && FloatAbs(prevPitch - 2f * pitch) / (2f * pitch) < num2)
			{
				num = (prevPitch = 2f * pitch);
			}
			else if (pitchConfidence >= num3 - 2 && FloatAbs(prevPitch - 0.5f * pitch) / (0.5f * pitch) < num2)
			{
				num = (prevPitch = 0.5f * pitch);
			}
			else if (pitchConfidence >= 1)
			{
				num = prevPitch;
				pitchConfidence = IntMax(0, pitchConfidence - 1);
			}
			else
			{
				num = pitch;
				prevPitch = pitch;
				pitchConfidence = 1;
			}
		}
		else if (prevPitch != -1f)
		{
			if (pitchConfidence >= 1)
			{
				num = prevPitch;
				pitchConfidence = IntMax(0, pitchConfidence - 1);
			}
			else
			{
				prevPitch = -1f;
				num = -1f;
				pitchConfidence = 0;
			}
		}
		pitch = ((pitchConfidence < 1) ? (-1f) : num);
		if (pitch == -1f)
		{
			pitch = 0f;
		}
		return pitch;
	}
}
