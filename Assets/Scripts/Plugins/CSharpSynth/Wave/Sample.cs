using System;
using System.IO;

namespace CSharpSynth.Wave
{
	public class Sample
	{
		private float[,] data;

		private int sampleRate;

		private int originalRate;

		private string name;

		public int NumberofChannels => data.GetLength(0);

		public string Name => name;

		public bool isDualChannel => data.GetLength(0) == 2;

		public int SampleRate
		{
			get
			{
				return sampleRate;
			}
			set
			{
				sampleRate = value;
			}
		}

		public int OriginalSampleRate => originalRate;

		public int SamplesPerChannel => data.GetLength(1);

		public Sample(string filename)
		{
			name = Path.GetFileNameWithoutExtension(filename);
			WaveFileReader waveFileReader = new WaveFileReader(filename);
			IChunk[] array = waveFileReader.ReadAllChunks();
			waveFileReader.Close();
			DataChunk dataChunk = null;
			FormatChunk formatChunk = null;
			for (int i = 0; i < array.Length; i++)
			{
				if (array[i].GetChunkType() == WaveHelper.WaveChunkType.Format)
				{
					formatChunk = (FormatChunk)array[i];
				}
				else if (array[i].GetChunkType() == WaveHelper.WaveChunkType.Data)
				{
					dataChunk = (DataChunk)array[i];
				}
			}
			if (formatChunk == null || dataChunk == null)
			{
				throw new ArgumentException("Wave file is in unrecognized format!");
			}
			if (formatChunk.wBitsPerSample != 16)
			{
				WaveHelper.ChangeBitsPerSample(formatChunk, dataChunk, 16);
			}
			_ = formatChunk.nChannels;
			sampleRate = formatChunk.nSamplesPerSec;
			originalRate = sampleRate;
			data = WaveHelper.GetSampleData(formatChunk, dataChunk);
		}

		public Sample(int sampleRate)
		{
			data = new float[2, 1];
			data[0, 0] = 0f;
			data[1, 0] = 0f;
			this.sampleRate = sampleRate;
			originalRate = sampleRate;
			name = "";
		}

		public override bool Equals(object obj)
		{
			if (obj.GetType() == typeof(Sample))
			{
				Sample sample = (Sample)obj;
				if (name.Equals(sample.name) && SamplesPerChannel == sample.SamplesPerChannel && NumberofChannels == sample.NumberofChannels && sampleRate == sample.sampleRate)
				{
					return true;
				}
			}
			return false;
		}

		public override int GetHashCode()
		{
			return base.GetHashCode();
		}

		public float getSample(int channel, int sample)
		{
			return data[channel, sample];
		}

		public void setSample(int channel, int sample, float value)
		{
			data[channel, sample] = value;
		}

		public float[,] getAllSampleData()
		{
			return data;
		}

		public void setAllSampleData(float[,] value)
		{
			data = value;
		}

		public int getMemoryUseage()
		{
			return 4 * data.GetLength(0) * data.GetLength(1);
		}
	}
}
