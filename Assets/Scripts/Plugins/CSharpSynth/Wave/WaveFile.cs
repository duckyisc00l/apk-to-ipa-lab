namespace CSharpSynth.Wave
{
	public class WaveFile
	{
		private IChunk[] WaveChunks;

		private byte[] _data;

		public byte[] SampleData => _data;

		public int NumberOfChunks => WaveChunks.Length;

		public WaveFile(IChunk[] WaveChunks)
		{
			this.WaveChunks = WaveChunks;
			_data = ((DataChunk)GetChunk(WaveHelper.WaveChunkType.Data)).sampled_data;
		}

		public IChunk GetChunk(WaveHelper.WaveChunkType ChunkType)
		{
			for (int i = 0; i < WaveChunks.Length; i++)
			{
				if (WaveChunks[i].GetChunkType() == ChunkType)
				{
					return WaveChunks[i];
				}
			}
			return null;
		}

		public IChunk GetChunk(int startIndex, WaveHelper.WaveChunkType ChunkType)
		{
			if (startIndex >= WaveChunks.Length)
			{
				return null;
			}
			for (int i = startIndex; i < WaveChunks.Length; i++)
			{
				if (WaveChunks[i].GetChunkType() == ChunkType)
				{
					return WaveChunks[i];
				}
			}
			return null;
		}
	}
}
