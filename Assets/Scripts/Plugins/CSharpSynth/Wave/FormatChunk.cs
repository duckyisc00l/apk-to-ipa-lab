namespace CSharpSynth.Wave
{
	public class FormatChunk : IChunk
	{
		public char[] chkID = new char[4];

		public int chksize;

		public short wFormatTag;

		public short nChannels;

		public int nSamplesPerSec;

		public int nAvgBytesPerSec;

		public short nBlockAlign;

		public short wBitsPerSample;

		public short cbSize;

		public short wValidBitsPerSample;

		public int dwChannelMask;

		public char[] SubFormat = new char[16];

		public WaveHelper.WaveChunkType GetChunkType()
		{
			return WaveHelper.WaveChunkType.Format;
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
