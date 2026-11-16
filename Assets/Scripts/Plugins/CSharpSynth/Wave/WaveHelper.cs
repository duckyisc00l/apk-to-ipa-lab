using System;
using CSharpSynth.Wave.DSP;

namespace CSharpSynth.Wave
{
	public class WaveHelper
	{
		public enum WaveChunkType
		{
			Master = 1,
			Format = 2,
			Fact = 3,
			Data = 4
		}

		public enum Format_Code
		{
			WAVE_FORMAT_PCM = 1,
			WAVE_FORMAT_IEEE_FLOAT = 3,
			WAVE_FORMAT_ALAW = 6,
			WAVE_FORMAT_MULAW = 7,
			WAVE_FORMAT_EXTENSIBLE = 65534
		}

		public enum ChannelType
		{
			Mono = -1,
			Left = 0,
			Right = 1,
			Center = 2,
			Surround = 3,
			FrontLeft = 4,
			BackLeft = 5,
			FrontRight = 6,
			BackRight = 7,
			Unknown = 8
		}

		public static float[,] ReSample(int NewRate, int OldRate, float[,] data)
		{
			if (NewRate == OldRate)
			{
				return data;
			}
			int num = NewRate;
			int num2 = OldRate;
			while (num2 != 0)
			{
				int num3 = num % num2;
				num = num2;
				num2 = num3;
			}
			NewRate /= num;
			OldRate /= num;
			if (NewRate < OldRate)
			{
				if (OldRate % NewRate == 0)
				{
					data = BiQuadLowPass.OfflineProcess(NewRate * num, (double)(NewRate * num) / 2.0, 1.0, data);
					data = DownSample(OldRate / NewRate, data);
				}
				else
				{
					data = UpSample(NewRate, data);
					double num4 = (double)(OldRate * num) / 2.0;
					double num5 = (double)(NewRate * num) / 2.0;
					data = ((!(num4 <= num5)) ? BiQuadLowPass.OfflineProcess(NewRate * num, num5, 1.0, data) : BiQuadLowPass.OfflineProcess(NewRate * num, num4, 1.0, data));
					data = DownSample(OldRate, data);
				}
			}
			else if (NewRate > OldRate)
			{
				if (NewRate % OldRate == 0)
				{
					data = UpSample(NewRate / OldRate, data);
					data = BiQuadLowPass.OfflineProcess(NewRate * num, (double)(OldRate * num) / 2.0, 1.0, data);
				}
				else
				{
					data = UpSample(NewRate, data);
					double num6 = (double)(OldRate * num) / 2.0;
					double num7 = (double)(NewRate * num) / 2.0;
					data = ((!(num6 <= num7)) ? BiQuadLowPass.OfflineProcess(NewRate * num, num7, 1.0, data) : BiQuadLowPass.OfflineProcess(NewRate * num, num6, 1.0, data));
					data = DownSample(OldRate, data);
				}
			}
			return data;
		}

		public static float[,] DownSample(int factor, float[,] data)
		{
			if (factor == 1)
			{
				return data;
			}
			int num = (int)((float)data.GetLength(1) * (1f / (float)factor));
			float[,] array = new float[data.GetLength(0), num];
			for (int i = 0; i < data.GetLength(0); i++)
			{
				for (int j = 0; j < num; j++)
				{
					array[i, j] = data[i, j * factor];
				}
			}
			return array;
		}

		public static float[,] UpSample(int factor, float[,] data)
		{
			if (factor == 1)
			{
				return data;
			}
			int num = data.GetLength(1) * factor;
			float[,] array = new float[data.GetLength(0), num];
			for (int i = 0; i < data.GetLength(0); i++)
			{
				for (int j = 0; j < num; j++)
				{
					array[i, j] = data[i, j / factor];
					for (int k = 0; k < factor - 1; k++)
					{
						j++;
						array[i, j] = 0f;
					}
				}
			}
			return array;
		}

		public static void ChangeBitsPerSample(FormatChunk fmtchk, DataChunk datachk, int bitsPerSample)
		{
			if (fmtchk.wBitsPerSample != bitsPerSample)
			{
				_ = bitsPerSample / fmtchk.wBitsPerSample;
				float[,] sampleData = GetSampleData(fmtchk, datachk);
				datachk.sampled_data = GetRawData(sampleData, bitsPerSample);
				datachk.chksize = datachk.sampled_data.Length;
				fmtchk.wBitsPerSample = (short)bitsPerSample;
				fmtchk.nBlockAlign = (short)(fmtchk.nChannels * (bitsPerSample / 8));
				fmtchk.nAvgBytesPerSec = fmtchk.nBlockAlign * fmtchk.nSamplesPerSec;
			}
		}

		public static float[,] GetSampleData(FormatChunk fmtchk, DataChunk datachk)
		{
			int num = fmtchk.wBitsPerSample / 8;
			int nChannels = fmtchk.nChannels;
			int num2 = datachk.sampled_data.Length / num / nChannels;
			float[,] array = new float[nChannels, num2];
			for (int i = 0; i < num2; i++)
			{
				for (int j = 0; j < nChannels; j++)
				{
					switch (num)
					{
					case 1:
						array[j, i] = (float)(datachk.sampled_data[i * nChannels + j] - 128) / 128f;
						break;
					case 2:
						array[j, i] = (float)BitConverter.ToInt16(datachk.sampled_data, i * 2 * nChannels + j * 2) / 32767f;
						break;
					case 3:
						array[j, i] = (float)ToInt24(datachk.sampled_data, i * 3 * nChannels + j * 3) / 8388607f;
						break;
					case 4:
						array[j, i] = (float)BitConverter.ToInt32(datachk.sampled_data, i * 4 * nChannels + j * 4) / 2.1474836E+09f;
						break;
					}
				}
			}
			return array;
		}

		public static byte[] GetRawData(float[,] sampledata, int bitsPerSample)
		{
			int length = sampledata.GetLength(1);
			int length2 = sampledata.GetLength(0);
			int num = sampledata.GetLength(0) * length * (bitsPerSample / 8);
			int num2 = 0;
			int num3 = bitsPerSample / 8;
			byte[] array = new byte[num];
			for (int i = 0; i < length; i++)
			{
				for (int j = 0; j < length2; j++)
				{
					switch (num3)
					{
					case 1:
						array[num2] = (byte)(sampledata[j, i] * 128f + 128f);
						break;
					case 2:
					{
						byte[] bytes = BitConverter.GetBytes((short)(sampledata[j, i] * 32767f));
						array[num2] = bytes[0];
						array[num2 + 1] = bytes[1];
						break;
					}
					case 3:
					{
						byte[] bytes = Int24toBytes((int)(sampledata[j, i] * 8388607f));
						array[num2] = bytes[0];
						array[num2 + 1] = bytes[1];
						array[num2 + 2] = bytes[2];
						break;
					}
					case 4:
					{
						byte[] bytes = BitConverter.GetBytes((int)(sampledata[j, i] * 2.1474836E+09f));
						array[num2] = bytes[0];
						array[num2 + 1] = bytes[1];
						array[num2 + 2] = bytes[2];
						array[num2 + 3] = bytes[3];
						break;
					}
					}
					num2 += num3;
				}
			}
			return array;
		}

		public static int ToInt24(byte[] buffer, int index)
		{
			if (buffer[index + 2] > 127)
			{
				return BitConverter.ToInt32(new byte[4]
				{
					buffer[index],
					buffer[index + 1],
					buffer[index + 2],
					255
				}, 0);
			}
			return BitConverter.ToInt32(new byte[4]
			{
				buffer[index],
				buffer[index + 1],
				buffer[index + 2],
				0
			}, 0);
		}

		public static byte[] Int24toBytes(int value)
		{
			byte[] bytes = BitConverter.GetBytes(value);
			return new byte[3]
			{
				bytes[0],
				bytes[1],
				bytes[2]
			};
		}
	}
}
