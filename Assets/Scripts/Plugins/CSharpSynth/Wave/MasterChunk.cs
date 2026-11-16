namespace CSharpSynth.Wave
{
	public class MasterChunk : IChunk
	{
		public char[] chkID = new char[4];

		public int chksize;

		public char[] WAVEID = new char[4];

		public int WAVEchunks;

		public WaveHelper.WaveChunkType GetChunkType()
		{
			return WaveHelper.WaveChunkType.Master;
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
