using System;

namespace CSharpSynth.Effects
{
	public class dBMeter : BasicAudioEffect
	{
		private float L_PeakdB = 1f;

		private float L_CurrentdB;

		private float R_PeakdB = 1f;

		private float R_CurrentdB;

		private bool useFastTest;

		public float LeftPeak
		{
			get
			{
				return L_PeakdB;
			}
			set
			{
				L_PeakdB = value;
			}
		}

		public float RightPeak
		{
			get
			{
				return R_PeakdB;
			}
			set
			{
				R_PeakdB = value;
			}
		}

		public float Left_dBLevel => L_CurrentdB;

		public float Right_dBLevel => R_CurrentdB;

		public bool UseFastVersion
		{
			get
			{
				return useFastTest;
			}
			set
			{
				if (value)
				{
					L_PeakdB = 50f;
					R_PeakdB = 50f;
				}
				else
				{
					L_PeakdB = 1f;
					R_PeakdB = 1f;
				}
				useFastTest = value;
			}
		}

		public override void doEffect(float[,] inputBuffer)
		{
			if (useFastTest)
			{
				fastTest(inputBuffer);
			}
			else
			{
				slowTest(inputBuffer);
			}
		}

		private void fastTest(float[,] inputBuffer)
		{
			int length = inputBuffer.GetLength(0);
			for (int i = 0; i < length; i++)
			{
				float num = inputBuffer[i, 0] * inputBuffer[i, 0];
				if (i == 0)
				{
					L_CurrentdB = Math.Abs((float)(20.0 * Math.Log10(Math.Sqrt(num))));
				}
				else
				{
					R_CurrentdB = Math.Abs((float)(20.0 * Math.Log10(Math.Sqrt(num))));
				}
			}
		}

		private void slowTest(float[,] inputBuffer)
		{
			int length = inputBuffer.GetLength(0);
			int length2 = inputBuffer.GetLength(1);
			for (int i = 0; i < length; i++)
			{
				float num = 0f;
				for (int j = 0; j < length2; j++)
				{
					num += inputBuffer[i, j] * inputBuffer[i, j];
				}
				if (i == 0)
				{
					L_CurrentdB = Math.Abs((float)(20.0 * Math.Log10(Math.Sqrt(num / (float)length2 * 2f))));
					if (L_CurrentdB > L_PeakdB && !float.IsInfinity(L_CurrentdB))
					{
						L_PeakdB = L_CurrentdB;
					}
				}
				else
				{
					R_CurrentdB = Math.Abs((float)(20.0 * Math.Log10(Math.Sqrt(num / (float)length2 * 2f))));
					if (R_CurrentdB > R_PeakdB && !float.IsInfinity(R_CurrentdB))
					{
						R_PeakdB = R_CurrentdB;
					}
				}
			}
			if (length == 1)
			{
				R_CurrentdB = L_CurrentdB;
				R_PeakdB = L_PeakdB;
			}
		}
	}
}
