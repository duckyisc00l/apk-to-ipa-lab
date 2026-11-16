using System;

namespace CSharpSynth.Wave.DSP
{
	public class BiQuadLowPass
	{
		private float[,] temps;

		private float a0;

		private float a1;

		private float a2;

		private float b0;

		private float b1;

		private float b2;

		private int channels;

		public BiQuadLowPass(float sampleRate, int channels, float cornerfrequency)
		{
			this.channels = channels;
			temps = new float[channels, 2];
			ResetFilter(sampleRate, cornerfrequency, 1f);
		}

		public void ResetFilter(float sampleRate, float cornerFrequency, float Q)
		{
			double num = Math.PI * 2.0 * (double)cornerFrequency / (double)sampleRate;
			double num2 = Math.Cos(num);
			double num3 = Math.Sin(num) / (2.0 * (double)Q);
			b0 = (float)((1.0 - num2) / 2.0);
			b1 = (float)(1.0 - num2);
			b2 = (float)((1.0 - num2) / 2.0);
			a0 = (float)(1.0 + num3);
			a1 = (float)(-2.0 * num2);
			a2 = (float)(1.0 - num3);
			Array.Clear(temps, 0, channels * temps.GetLength(1));
		}

		public void ApplyFilter(float[,] inputBuffer)
		{
			int length = inputBuffer.GetLength(1);
			for (int i = 0; i < channels; i++)
			{
				for (int j = 0; j < length; j++)
				{
					inputBuffer[i, j] = b0 / a0 * inputBuffer[i, j] + b1 / a0 * temps[i, 0] + b2 / a0 * temps[i, 1] - a1 / a0 * temps[i, 0] - a2 / a0 * temps[i, 1];
					temps[i, 1] = temps[i, 0];
					temps[i, 0] = inputBuffer[i, j];
				}
			}
		}

		public static float[,] OfflineProcess(double sampleRate, double cornerFrequency, double Q, float[,] data)
		{
			double num = Math.PI * 2.0 * cornerFrequency / sampleRate;
			double num2 = Math.Cos(num);
			double num3 = Math.Sin(num) / (2.0 * Q);
			double num4 = (1.0 - num2) / 2.0;
			double num5 = 1.0 - num2;
			double num6 = (1.0 - num2) / 2.0;
			double num7 = 1.0 + num3;
			double num8 = -2.0 * num2;
			double num9 = 1.0 - num3;
			int length = data.GetLength(1);
			float[,] array = new float[data.GetLength(0), length];
			for (int i = 0; i < data.GetLength(0); i++)
			{
				for (int j = 0; j < length; j++)
				{
					switch (j)
					{
					case 0:
						array[i, j] = (float)(num4 / num7 * (double)data[i, j] + num5 / num7 * 0.0 + num6 / num7 * 0.0 - num8 / num7 * 0.0 - num9 / num7 * 0.0);
						break;
					case 1:
						array[i, j] = (float)(num4 / num7 * (double)data[i, j] + num5 / num7 * (double)data[i, j - 1] + num6 / num7 * 0.0 - num8 / num7 * (double)array[i, j - 1] - num9 / num7 * 0.0);
						break;
					default:
						array[i, j] = (float)(num4 / num7 * (double)data[i, j] + num5 / num7 * (double)data[i, j - 1] + num6 / num7 * (double)data[i, j - 2] - num8 / num7 * (double)array[i, j - 1] - num9 / num7 * (double)array[i, j - 2]);
						break;
					}
				}
			}
			return array;
		}
	}
}
