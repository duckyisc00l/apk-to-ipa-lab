using System;

namespace CSharpSynth.Wave.DSP
{
	public class SincLowPass
	{
		private float[] filter;

		private float[,] buffer;

		private int channels;

		private int buffersize;

		public SincLowPass(int channels, int size, double cornerfrequency)
		{
			this.channels = channels;
			buffersize = size;
			if (size % 2 != 0)
			{
				size++;
			}
			double[] array = new double[size];
			filter = new float[size];
			buffer = new float[channels, size];
			for (int i = 0; i < size; i++)
			{
				array[i] = ApplyBlackmanWindow(Sinc(cornerfrequency, size, i), size, i);
			}
			Normalize(array);
			for (int j = 0; j < array.Length; j++)
			{
				filter[j] = (float)array[j];
			}
		}

		public void ResetFilter()
		{
			Array.Clear(buffer, 0, channels * buffersize);
		}

		public void ApplyFilter(float[,] inputBuffer)
		{
			int length = inputBuffer.GetLength(1);
			for (int i = 0; i < channels; i++)
			{
				for (int j = 0; j < length; j++)
				{
					for (int k = 0; k < buffer.Length - 1; k++)
					{
						buffer[i, k] = buffer[i, k + 1];
					}
					buffer[i, buffersize - 1] = inputBuffer[i, j];
					inputBuffer[i, j] = 0f;
					for (int l = 0; l < filter.Length; l++)
					{
						inputBuffer[i, j] += buffer[i, buffersize - (l + 1)] * filter[l];
					}
				}
			}
		}

		public float ApplyFilter(int channel, float sample)
		{
			for (int i = 0; i < buffer.Length - 1; i++)
			{
				buffer[channel, i] = buffer[channel, i + 1];
			}
			buffer[channel, buffersize - 1] = sample;
			sample = 0f;
			for (int j = 0; j < filter.Length; j++)
			{
				sample += buffer[channel, buffersize - (j + 1)] * filter[j];
			}
			return sample;
		}

		public static float[,] OfflineProcess(int size, double cornerfrequency, float[,] data)
		{
			if (size % 2 != 0)
			{
				size++;
			}
			double[] array = new double[size];
			double[] array2 = new double[size];
			for (int i = 0; i < size; i++)
			{
				array[i] = ApplyBlackmanWindow(Sinc(cornerfrequency, size, i), size, i);
			}
			Normalize(array);
			float[,] array3 = new float[data.GetLength(0), data.GetLength(1)];
			for (int j = 0; j < data.GetLength(0); j++)
			{
				Array.Clear(array2, 0, array2.Length);
				for (int k = 0; k < data.GetLength(1); k++)
				{
					double num = data[j, k];
					for (int l = 0; l < array2.Length - 1; l++)
					{
						array2[l] = array2[l + 1];
					}
					array2[^1] = num;
					num = 0.0;
					for (int m = 0; m < array.Length; m++)
					{
						num += array2[^(m + 1)] * array[m];
					}
					array3[j, k] = (float)num;
				}
			}
			return array3;
		}

		public static double Sinc(double x)
		{
			if (x == 0.0)
			{
				return 1.0;
			}
			return Math.Sin(x) / x;
		}

		public static double Sinc(double FC, double M, int I)
		{
			if ((double)I - M / 2.0 == 0.0)
			{
				return Math.PI * 2.0 * FC;
			}
			return Math.Sin(Math.PI * 2.0 * FC * ((double)I - M / 2.0)) / ((double)I - M / 2.0);
		}

		public static double ApplyBlackmanWindow(double sample, double M, int I)
		{
			return sample * (0.42 - 0.5 * Math.Cos(Math.PI * 2.0 * (double)I / M) + 0.08 * Math.Cos(Math.PI * 4.0 * (double)I / M));
		}

		public static void Normalize(double[] data)
		{
			double num = 0.0;
			for (int i = 0; i < data.Length; i++)
			{
				num += data[i];
			}
			for (int j = 0; j < data.Length; j++)
			{
				data[j] /= num;
			}
		}
	}
}
