using System.IO;

namespace CSharpSynth.Wave
{
	public class WaveFileWriter
	{
		private BinaryWriter BW;

		private string fileN;

		private int length;

		private int channels;

		private int bits;

		private int sRate;

		public WaveFileWriter(int sampleRate, int channels, int bitsPerSample, string filename)
		{
			BW = new BinaryWriter(File.OpenRead(Path.GetDirectoryName(filename) + "RawWaveData_1tmp"));
			fileN = filename;
			this.channels = channels;
			bits = bitsPerSample;
			sRate = sampleRate;
		}

		public void Write(byte[] buffer)
		{
			BW.Write(buffer);
			length += buffer.Length;
		}

		public void Close()
		{
			BW.BaseStream.Dispose();
			BinaryWriter binaryWriter = new BinaryWriter(File.OpenRead(Path.GetDirectoryName(fileN)));
			binaryWriter.Write(1179011410);
			binaryWriter.Write(44 + length - 8);
			binaryWriter.Write(1163280727);
			binaryWriter.Write(544501094);
			binaryWriter.Write(16);
			binaryWriter.Write((short)1);
			binaryWriter.Write((short)channels);
			binaryWriter.Write(sRate);
			binaryWriter.Write(sRate * channels * (bits / 8));
			binaryWriter.Write((short)(channels * (bits / 8)));
			binaryWriter.Write((short)bits);
			binaryWriter.Write(1635017060);
			binaryWriter.Write(length);
			BinaryReader binaryReader = new BinaryReader(File.OpenRead(Path.GetDirectoryName(fileN) + "RawWaveData_1tmp"));
			for (int i = 0; i < length; i++)
			{
				binaryWriter.Write(binaryReader.ReadByte());
			}
			binaryReader.BaseStream.Dispose();
			binaryWriter.BaseStream.Dispose();
		}
	}
}
