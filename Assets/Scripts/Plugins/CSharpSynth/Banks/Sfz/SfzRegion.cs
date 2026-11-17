namespace CSharpSynth.Banks.Sfz
{
	public class SfzRegion
	{
		public int SampleIndex;

		public int Release;

		public int Attack;

		public int Hold;

		public int Decay;

		public float Tune;

		public int Root;

		public byte HiNote;

		public byte LoNote;

		public byte HiVelocity;

		public byte LoVelocity;

		public byte HiChannel;

		public byte LoChannel;

		public int LoopStart;

		public int LoopEnd;

		public float Volume;

		public byte LoopMode;

		public float Pan;

		public int Offset;

		public float Effect1;

		public float Effect2;

		public SfzRegion()
		{
			SampleIndex = 0;
			Release = 0;
			Attack = 0;
			Hold = 0;
			Decay = int.MaxValue;
			Tune = 0f;
			Root = 60;
			HiNote = 127;
			LoNote = 0;
			HiVelocity = 127;
			LoVelocity = 0;
			HiChannel = 15;
			LoChannel = 0;
			LoopStart = 0;
			LoopEnd = 0;
			Volume = 0f;
			LoopMode = 0;
			Pan = 0f;
			Offset = 0;
			Effect1 = 0f;
			Effect2 = 0f;
		}

		public bool isWithinRegion(int channel, int note, int velocity)
		{
			if (channel >= LoChannel && channel <= HiChannel && note >= LoNote && note <= HiNote && velocity >= LoVelocity && velocity <= HiVelocity)
			{
				return true;
			}
			return false;
		}

		public override bool Equals(object obj)
		{
			if (obj.GetType() == typeof(SfzRegion))
			{
				SfzRegion sfzRegion = (SfzRegion)obj;
				if (sfzRegion.HiNote == HiNote && sfzRegion.LoNote == LoNote && sfzRegion.LoopEnd == LoopEnd && sfzRegion.LoopMode == LoopMode && sfzRegion.LoopStart == LoopStart && sfzRegion.Release == Release && sfzRegion.Root == Root && sfzRegion.SampleIndex == SampleIndex && sfzRegion.Tune == Tune && sfzRegion.Volume == Volume && sfzRegion.Decay == Decay && sfzRegion.HiChannel == HiChannel && sfzRegion.LoChannel == LoChannel && sfzRegion.HiVelocity == HiVelocity && sfzRegion.LoVelocity == LoVelocity && sfzRegion.Pan == Pan && sfzRegion.Offset == Offset && sfzRegion.Effect1 == Effect1 && sfzRegion.Effect2 == Effect2)
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
	}
}
