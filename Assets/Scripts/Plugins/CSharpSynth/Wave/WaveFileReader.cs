using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace CSharpSynth.Wave
{
	public class WaveFileReader
	{
		private BinaryReader BR;

		public WaveFileReader(string filename)
		{
			Stream input = new MemoryStream((Resources.Load(filename) as TextAsset).bytes);
			BR = new BinaryReader(input);
		}

		public IChunk[] ReadAllChunks()
		{
			List<IChunk> list = new List<IChunk>();
			while (BR.BaseStream.Position < BR.BaseStream.Length)
			{
				IChunk chunk = ReadNextChunk();
				if (chunk != null)
				{
					list.Add(chunk);
				}
			}
			return list.ToArray();
		}

		public IChunk ReadNextChunk()
		{
			if (BR.BaseStream.Position + 4 >= BR.BaseStream.Length)
			{
				BR.BaseStream.Position += 4L;
				return null;
			}
			switch (Encoding.UTF8.GetString(BR.ReadBytes(4), 0, 4).ToLower())
			{
			case "riff":
			{
				MasterChunk masterChunk = new MasterChunk();
				masterChunk.chkID = new char[4] { 'R', 'I', 'F', 'F' };
				masterChunk.chksize = BitConverter.ToInt32(BR.ReadBytes(4), 0);
				masterChunk.WAVEID = BR.ReadChars(4);
				return masterChunk;
			}
			case "fact":
			{
				FactChunk factChunk = new FactChunk();
				factChunk.chkID = new char[4] { 'f', 'a', 'c', 't' };
				factChunk.chksize = BitConverter.ToInt32(BR.ReadBytes(4), 0);
				factChunk.dwSampleLength = BitConverter.ToInt32(BR.ReadBytes(4), 0);
				return factChunk;
			}
			case "data":
			{
				DataChunk dataChunk = new DataChunk();
				dataChunk.chkID = new char[4] { 'd', 'a', 't', 'a' };
				dataChunk.chksize = BitConverter.ToInt32(BR.ReadBytes(4), 0);
				if (dataChunk.chksize % 2 == 0)
				{
					dataChunk.pad = 0;
				}
				else
				{
					dataChunk.pad = 1;
				}
				dataChunk.sampled_data = BR.ReadBytes(dataChunk.chksize);
				return dataChunk;
			}
			case "fmt ":
			{
				FormatChunk formatChunk = new FormatChunk();
				formatChunk.chkID = new char[4] { 'f', 'm', 't', ' ' };
				formatChunk.chksize = BitConverter.ToInt32(BR.ReadBytes(4), 0);
				formatChunk.wFormatTag = BitConverter.ToInt16(BR.ReadBytes(2), 0);
				formatChunk.nChannels = BitConverter.ToInt16(BR.ReadBytes(2), 0);
				formatChunk.nSamplesPerSec = BitConverter.ToInt32(BR.ReadBytes(4), 0);
				formatChunk.nAvgBytesPerSec = BitConverter.ToInt32(BR.ReadBytes(4), 0);
				formatChunk.nBlockAlign = BitConverter.ToInt16(BR.ReadBytes(2), 0);
				formatChunk.wBitsPerSample = BitConverter.ToInt16(BR.ReadBytes(2), 0);
				if (formatChunk.wFormatTag != 1)
				{
					formatChunk.cbSize = BitConverter.ToInt16(BR.ReadBytes(2), 0);
				}
				if (formatChunk.wFormatTag == 65534)
				{
					formatChunk.wValidBitsPerSample = BitConverter.ToInt16(BR.ReadBytes(2), 0);
					formatChunk.dwChannelMask = BitConverter.ToInt32(BR.ReadBytes(4), 0);
					formatChunk.SubFormat = BR.ReadChars(16);
				}
				return formatChunk;
			}
			default:
				return null;
			}
		}

		public WaveFile ReadWaveFile()
		{
			return new WaveFile(ReadAllChunks());
		}

		public void Close()
		{
			BR.BaseStream.Dispose();
		}
	}
}
