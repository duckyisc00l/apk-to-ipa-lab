namespace CSharpSynth.Wave
{
	public class FactChunk : IChunk
	{
		public char[] chkID = new char[4];

		public int chksize;

		public int dwSampleLength;

		public WaveHelper.WaveChunkType GetChunkType()
		{
			return WaveHelper.WaveChunkType.Fact;
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
