using System;
using System.IO;
using System.Text;
using UnityEngine;

public static class WavFileWriter
{
	private const int HeaderSize = 44;

	private const int RescaleFactor = 32767;

	private const int BitsPerSample = 16;

	private const int BytesPerSample = 2;

	private const int EmptyByte = 0;

	public static void WriteFile(string outputPath, AudioClip clip)
	{
		float[] array = new float[clip.samples];
		clip.GetData(array, 0);
		WriteFile(outputPath, clip.frequency, clip.channels, array);
	}

	public static void WriteFile(string outputPath, int frequency, int channels, float[] samples)
	{
		if (!outputPath.ToLowerInvariant().EndsWith(".wav", StringComparison.InvariantCulture))
		{
			outputPath += ".wav";
		}
		string directoryName = Path.GetDirectoryName(outputPath);
		if (!Directory.Exists(directoryName))
		{
			Directory.CreateDirectory(directoryName);
		}
		using FileStream fileStream = CreateEmptyWavFile(outputPath);
		ConvertAndWrite(fileStream, samples);
		WriteHeader(fileStream, frequency, channels, samples.Length);
	}

	private static FileStream CreateEmptyWavFile(string filepath)
	{
		FileStream fileStream = new FileStream(filepath, FileMode.Create);
		for (int i = 0; i < 44; i++)
		{
			fileStream.WriteByte(0);
		}
		return fileStream;
	}

	private static void ConvertAndWrite(FileStream fileStream, float[] samples)
	{
		short[] array = new short[samples.Length];
		byte[] array2 = new byte[samples.Length * 2];
		for (int i = 0; i < samples.Length; i++)
		{
			array[i] = (short)(samples[i] * 32767f);
			BitConverter.GetBytes(array[i]).CopyTo(array2, i * 2);
		}
		fileStream.Write(array2, 0, array2.Length);
	}

	private static void WriteHeader(FileStream fileStream, int frequency, int channels, int sampleCount)
	{
		fileStream.Seek(0L, SeekOrigin.Begin);
		byte[] bytes = Encoding.UTF8.GetBytes("RIFF");
		fileStream.Write(bytes, 0, 4);
		byte[] bytes2 = BitConverter.GetBytes(fileStream.Length - 8);
		fileStream.Write(bytes2, 0, 4);
		byte[] bytes3 = Encoding.UTF8.GetBytes("WAVE");
		fileStream.Write(bytes3, 0, 4);
		byte[] bytes4 = Encoding.UTF8.GetBytes("fmt ");
		fileStream.Write(bytes4, 0, 4);
		byte[] bytes5 = BitConverter.GetBytes(16);
		fileStream.Write(bytes5, 0, 4);
		byte[] bytes6 = BitConverter.GetBytes((ushort)1);
		fileStream.Write(bytes6, 0, 2);
		byte[] bytes7 = BitConverter.GetBytes(channels);
		fileStream.Write(bytes7, 0, 2);
		byte[] bytes8 = BitConverter.GetBytes(frequency);
		fileStream.Write(bytes8, 0, 4);
		byte[] bytes9 = BitConverter.GetBytes(frequency * channels * 2);
		fileStream.Write(bytes9, 0, 4);
		ushort value = (ushort)(channels * 2);
		fileStream.Write(BitConverter.GetBytes(value), 0, 2);
		byte[] bytes10 = BitConverter.GetBytes(16);
		fileStream.Write(bytes10, 0, 2);
		byte[] bytes11 = Encoding.UTF8.GetBytes("data");
		fileStream.Write(bytes11, 0, 4);
		byte[] bytes12 = BitConverter.GetBytes(sampleCount * channels * 2);
		fileStream.Write(bytes12, 0, 4);
	}
}
