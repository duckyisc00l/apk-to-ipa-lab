using System.IO;

namespace CSharpSynth.Wave
{
	public class DataChunk : IChunk
	{
		public char[] chkID = new char[4];

		public int chksize;

		public byte[] sampled_data;

		public byte pad;

		public Stream GetDataStream()
		{
			return new MemoryStream(sampled_data);
		}

		public WaveHelper.WaveChunkType GetChunkType()
		{
			return WaveHelper.WaveChunkType.Data;
		}

		public string GetChunkId()
		{
			return new string(chkID);
		}

		public int GetChunkSize()
		{
			return chksize;
		}
	}
}
