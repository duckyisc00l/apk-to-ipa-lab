using CSharpSynth.Synthesis;
using CSharpSynth.Wave;

namespace CSharpSynth.Banks
{
	public abstract class Instrument
	{
		private Sample[] instrumentSamples;

		private string instrumentName;

		private int sampleRate;

		public string Name
		{
			get
			{
				return instrumentName;
			}
			set
			{
				instrumentName = value;
			}
		}

		public Sample[] SampleList
		{
			get
			{
				return instrumentSamples;
			}
			set
			{
				instrumentSamples = value;
			}
		}

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

		public virtual float getSampleAtTime(int note, int channel, int synthSampleRate, ref double time)
		{
			return 0f;
		}

		public virtual int getAttack(int note)
		{
			return SynthHelper.getSampleFromTime(sampleRate, 0.001f);
		}

		public virtual int getRelease(int note)
		{
			return SynthHelper.getSampleFromTime(sampleRate, 0.001f);
		}

		public virtual int getHold(int note)
		{
			return SynthHelper.getSampleFromTime(sampleRate, 0.01f);
		}

		public virtual int getDecay(int note)
		{
			return SynthHelper.getSampleFromTime(sampleRate, 9999f);
		}

		public abstract void enforceSampleRate(int sampleRate);

		public abstract bool allSamplesSupportDualChannel();
	}
}
